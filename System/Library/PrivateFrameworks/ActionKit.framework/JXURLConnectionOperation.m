@interface JXURLConnectionOperation
+ (id)networkThread;
+ (void)runLoopForever;
- (JXURLConnectionOperation)init;
- (JXURLConnectionOperation)initWithURL:(id)a3;
- (NSError)error;
- (NSMutableURLRequest)request;
- (NSOutputStream)outputStream;
- (NSURLConnection)connection;
- (NSURLResponse)response;
- (int64_t)bytesDownloaded;
- (int64_t)bytesUploaded;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)connectionDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)main;
- (void)setBytesDownloaded:(int64_t)a3;
- (void)setBytesUploaded:(int64_t)a3;
- (void)setConnection:(id)a3;
- (void)setError:(id)a3;
- (void)setOutputStream:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)startConnection;
- (void)stopConnection;
- (void)willFinish;
@end

@implementation JXURLConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setConnection:(id)a3
{
}

- (NSURLConnection)connection
{
  return (NSURLConnection *)objc_getProperty(self, a2, 312, 1);
}

- (void)setBytesUploaded:(int64_t)a3
{
  self->_bytesUploaded = a3;
}

- (int64_t)bytesUploaded
{
  return self->_bytesUploaded;
}

- (void)setBytesDownloaded:(int64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (int64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setOutputStream:(id)a3
{
}

- (NSOutputStream)outputStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 288, 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 280, 1);
}

- (void)setResponse:(id)a3
{
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 272, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSMutableURLRequest)request
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 264, 1);
}

- (void)connectionDidFinishLoading:(id)a3
{
  if (([(JXURLConnectionOperation *)self isCancelled] & 1) == 0)
  {
    [(JXOperation *)self finish];
  }
}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  if (([(JXURLConnectionOperation *)self isCancelled] & 1) == 0)
  {
    int64_t v8 = [(JXURLConnectionOperation *)self bytesUploaded] + a4;
    [(JXURLConnectionOperation *)self setBytesUploaded:v8];
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v10 = a4;
  if (([(JXURLConnectionOperation *)self isCancelled] & 1) == 0)
  {
    v5 = [(JXURLConnectionOperation *)self outputStream];
    int v6 = [v5 hasSpaceAvailable];

    if (v6)
    {
      v7 = [(JXURLConnectionOperation *)self outputStream];
      id v8 = v10;
      uint64_t v9 = objc_msgSend(v7, "write:maxLength:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

      if (v9 != -1) {
        [(JXURLConnectionOperation *)self setBytesDownloaded:[(JXURLConnectionOperation *)self bytesDownloaded] + v9];
      }
    }
  }
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v6 = a4;
  if (([(JXURLConnectionOperation *)self isCancelled] & 1) == 0)
  {
    [(JXURLConnectionOperation *)self setResponse:v6];
    v5 = [(JXURLConnectionOperation *)self outputStream];
    [v5 open];
  }
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  if (([(JXURLConnectionOperation *)self isCancelled] & 1) == 0)
  {
    [(JXURLConnectionOperation *)self setError:v5];
    [(JXOperation *)self finish];
  }
}

- (void)stopConnection
{
  v3 = [MEMORY[0x263F08B88] currentThread];
  v4 = [(id)objc_opt_class() networkThread];

  if (v3 == v4)
  {
    id v5 = [(JXURLConnectionOperation *)self connection];
    id v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
    uint64_t v7 = *MEMORY[0x263EFF588];
    [v5 unscheduleFromRunLoop:v6 forMode:*MEMORY[0x263EFF588]];

    id v8 = [(JXURLConnectionOperation *)self connection];
    [v8 cancel];

    uint64_t v9 = [(JXURLConnectionOperation *)self outputStream];
    id v10 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v9 removeFromRunLoop:v10 forMode:v7];

    id v11 = [(JXURLConnectionOperation *)self outputStream];
    [v11 close];
  }
  else
  {
    id v11 = [(id)objc_opt_class() networkThread];
    -[JXURLConnectionOperation performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_stopConnection);
  }
}

- (void)startConnection
{
  v3 = [MEMORY[0x263F08B88] currentThread];
  v4 = [(id)objc_opt_class() networkThread];

  if (v3 == v4)
  {
    if ([(JXURLConnectionOperation *)self isCancelled]) {
      return;
    }
    id v5 = [(JXURLConnectionOperation *)self outputStream];
    id v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
    uint64_t v7 = *MEMORY[0x263EFF588];
    [v5 scheduleInRunLoop:v6 forMode:*MEMORY[0x263EFF588]];

    id v8 = objc_alloc(MEMORY[0x263EFC608]);
    uint64_t v9 = [(JXURLConnectionOperation *)self request];
    id v10 = (void *)[v8 initWithRequest:v9 delegate:self startImmediately:0];
    [(JXURLConnectionOperation *)self setConnection:v10];

    id v11 = [(JXURLConnectionOperation *)self connection];
    v12 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v11 scheduleInRunLoop:v12 forMode:v7];

    id v13 = [(JXURLConnectionOperation *)self connection];
    [v13 start];
  }
  else
  {
    id v13 = [(id)objc_opt_class() networkThread];
    -[JXURLConnectionOperation performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_startConnection);
  }
}

- (void)willFinish
{
  v3.receiver = self;
  v3.super_class = (Class)JXURLConnectionOperation;
  [(JXOperation *)&v3 willFinish];
  [(JXURLConnectionOperation *)self stopConnection];
}

- (void)main
{
  if (([(JXURLConnectionOperation *)self isCancelled] & 1) == 0)
  {
    [(JXURLConnectionOperation *)self startConnection];
  }
}

- (JXURLConnectionOperation)initWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(JXURLConnectionOperation *)self init];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263EFC5E8]) initWithURL:v4];
    [(JXURLConnectionOperation *)v5 setRequest:v6];
  }
  return v5;
}

- (JXURLConnectionOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)JXURLConnectionOperation;
  v2 = [(JXOperation *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(JXURLConnectionOperation *)v2 setConnection:0];
    [(JXURLConnectionOperation *)v3 setRequest:0];
    [(JXURLConnectionOperation *)v3 setResponse:0];
    [(JXURLConnectionOperation *)v3 setError:0];
    [(JXURLConnectionOperation *)v3 setBytesDownloaded:0];
    [(JXURLConnectionOperation *)v3 setBytesUploaded:0];
    id v4 = (void *)[objc_alloc(MEMORY[0x263EFF9E0]) initToMemory];
    [(JXURLConnectionOperation *)v3 setOutputStream:v4];
  }
  return v3;
}

- (void)dealloc
{
  [(JXURLConnectionOperation *)self stopConnection];
  v3.receiver = self;
  v3.super_class = (Class)JXURLConnectionOperation;
  [(JXOperation *)&v3 dealloc];
}

+ (void)runLoopForever
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  [v2 setName:@"JXHTTP"];

  uint64_t v3 = *MEMORY[0x263EFF478];
  while (1)
  {
    id v4 = (void *)MEMORY[0x23ECE6170]();
    id v5 = [MEMORY[0x263EFF9F0] currentRunLoop];
    objc_super v6 = [MEMORY[0x263EFF910] distantFuture];
    [v5 runMode:v3 beforeDate:v6];
  }
}

+ (id)networkThread
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__JXURLConnectionOperation_networkThread__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (networkThread_predicate != -1) {
    dispatch_once(&networkThread_predicate, block);
  }
  v2 = (void *)networkThread_thread;
  return v2;
}

uint64_t __41__JXURLConnectionOperation_networkThread__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(MEMORY[0x263F08B88]) initWithTarget:*(void *)(a1 + 32) selector:sel_runLoopForever object:0];
  v2 = (void *)networkThread_thread;
  networkThread_thread = v1;

  uint64_t v3 = (void *)networkThread_thread;
  return [v3 start];
}

@end