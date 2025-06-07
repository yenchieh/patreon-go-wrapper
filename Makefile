.PHONY: all build run test clean

all: build

build:
	GOOS=linux CGO_ENABLED=0 GOARCH=amd64 go build -o ./build/main *.go
	chmod +x ./build/main
run: build
	./build/main

test:
	go test ./...

clean:
	rm -rf build/

deps:
	go mod tidy
	go mod vendor