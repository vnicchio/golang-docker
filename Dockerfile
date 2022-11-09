FROM golang:1.19.2-buster AS builder

WORKDIR /app

COPY ./hello.go ./

RUN go build  hello.go

ENTRYPOINT ["./hello"]

FROM scratch

WORKDIR /app

COPY --from=builder /app/hello .

ENTRYPOINT ["./hello"]