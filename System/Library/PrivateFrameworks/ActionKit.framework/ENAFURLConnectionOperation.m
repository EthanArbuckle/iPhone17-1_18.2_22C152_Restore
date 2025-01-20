@interface ENAFURLConnectionOperation
+ (id)networkRequestThread;
+ (void)networkRequestThreadEntryPoint:(id)a3;
- (BOOL)connection:(id)a3 canAuthenticateAgainstProtectionSpace:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isPaused;
- (BOOL)isReady;
- (ENAFURLConnectionOperation)initWithCoder:(id)a3;
- (ENAFURLConnectionOperation)initWithRequest:(id)a3;
- (NSData)responseData;
- (NSError)error;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (NSRecursiveLock)lock;
- (NSSet)runLoopModes;
- (NSString)description;
- (NSString)responseString;
- (NSURLConnection)connection;
- (NSURLRequest)request;
- (NSURLResponse)response;
- (id)authenticationAgainstProtectionSpace;
- (id)authenticationChallenge;
- (id)cacheResponse;
- (id)connection:(id)a3 willCacheResponse:(id)a4;
- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)downloadProgress;
- (id)redirectResponse;
- (id)uploadProgress;
- (int64_t)totalBytesRead;
- (signed)state;
- (void)cancel;
- (void)cancelConnection;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveAuthenticationChallenge:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)connectionDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)finish;
- (void)operationDidStart;
- (void)pause;
- (void)resume;
- (void)setAuthenticationAgainstProtectionSpace:(id)a3;
- (void)setAuthenticationChallenge:(id)a3;
- (void)setCacheResponse:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDownloadProgress:(id)a3;
- (void)setError:(id)a3;
- (void)setInputStream:(id)a3;
- (void)setLock:(id)a3;
- (void)setOutputStream:(id)a3;
- (void)setRedirectResponse:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResponseData:(id)a3;
- (void)setResponseString:(id)a3;
- (void)setRunLoopModes:(id)a3;
- (void)setState:(signed __int16)a3;
- (void)setTotalBytesRead:(int64_t)a3;
- (void)setUploadProgress:(id)a3;
- (void)start;
@end

@implementation ENAFURLConnectionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_redirectResponse, 0);
  objc_storeStrong(&self->_cacheResponse, 0);
  objc_storeStrong(&self->_authenticationChallenge, 0);
  objc_storeStrong(&self->_authenticationAgainstProtectionSpace, 0);
  objc_storeStrong(&self->_downloadProgress, 0);
  objc_storeStrong(&self->_uploadProgress, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_responseString, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_runLoopModes, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setLock:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setRedirectResponse:(id)a3
{
}

- (id)redirectResponse
{
  return self->_redirectResponse;
}

- (void)setCacheResponse:(id)a3
{
}

- (id)cacheResponse
{
  return self->_cacheResponse;
}

- (void)setAuthenticationChallenge:(id)a3
{
}

- (id)authenticationChallenge
{
  return self->_authenticationChallenge;
}

- (void)setAuthenticationAgainstProtectionSpace:(id)a3
{
}

- (id)authenticationAgainstProtectionSpace
{
  return self->_authenticationAgainstProtectionSpace;
}

- (void)setDownloadProgress:(id)a3
{
}

- (id)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setUploadProgress:(id)a3
{
}

- (id)uploadProgress
{
  return self->_uploadProgress;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)setTotalBytesRead:(int64_t)a3
{
  self->_totalBytesRead = a3;
}

- (int64_t)totalBytesRead
{
  return self->_totalBytesRead;
}

- (void)setResponseString:(id)a3
{
}

- (void)setResponseData:(id)a3
{
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setResponse:(id)a3
{
}

- (NSURLResponse)response
{
  return self->_response;
}

- (void)setRequest:(id)a3
{
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRunLoopModes:(id)a3
{
}

- (NSSet)runLoopModes
{
  return self->_runLoopModes;
}

- (void)setConnection:(id)a3
{
}

- (NSURLConnection)connection
{
  return self->_connection;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (signed)state
{
  return self->_state;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(ENAFURLConnectionOperation *)self request];
  v6 = (void *)[v4 initWithRequest:v5];

  v7 = [(ENAFURLConnectionOperation *)self uploadProgress];
  [v6 setUploadProgress:v7];

  v8 = [(ENAFURLConnectionOperation *)self downloadProgress];
  [v6 setDownloadProgress:v8];

  v9 = [(ENAFURLConnectionOperation *)self authenticationAgainstProtectionSpace];
  [v6 setAuthenticationAgainstProtectionSpace:v9];

  v10 = [(ENAFURLConnectionOperation *)self authenticationChallenge];
  [v6 setAuthenticationChallenge:v10];

  v11 = [(ENAFURLConnectionOperation *)self cacheResponse];
  [v6 setCacheResponse:v11];

  v12 = [(ENAFURLConnectionOperation *)self redirectResponse];
  [v6 setRedirectResponse:v12];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  [(ENAFURLConnectionOperation *)self pause];
  v4 = [(ENAFURLConnectionOperation *)self request];
  [v11 encodeObject:v4 forKey:@"request"];

  int v5 = [(ENAFURLConnectionOperation *)self state];
  uint64_t v6 = 1;
  if (v5 != -1 && v5 != 2) {
    uint64_t v6 = [(ENAFURLConnectionOperation *)self state];
  }
  [v11 encodeInteger:v6 forKey:@"state"];
  objc_msgSend(v11, "encodeBool:forKey:", -[ENAFURLConnectionOperation isCancelled](self, "isCancelled"), @"isCancelled");
  v7 = [(ENAFURLConnectionOperation *)self response];
  [v11 encodeObject:v7 forKey:@"response"];

  v8 = [(ENAFURLConnectionOperation *)self error];
  [v11 encodeObject:v8 forKey:@"error"];

  v9 = [(ENAFURLConnectionOperation *)self responseData];
  [v11 encodeObject:v9 forKey:@"responseData"];

  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ENAFURLConnectionOperation totalBytesRead](self, "totalBytesRead"));
  [v11 encodeObject:v10 forKey:@"totalBytesRead"];
}

- (ENAFURLConnectionOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectForKey:@"request"];
  uint64_t v6 = [(ENAFURLConnectionOperation *)self initWithRequest:v5];
  if (v6)
  {
    -[ENAFURLConnectionOperation setState:](v6, "setState:", (__int16)[v4 decodeIntegerForKey:@"state"]);
    -[ENAFURLConnectionOperation setCancelled:](v6, "setCancelled:", [v4 decodeBoolForKey:@"isCancelled"]);
    v7 = [v4 decodeObjectForKey:@"response"];
    [(ENAFURLConnectionOperation *)v6 setResponse:v7];

    v8 = [v4 decodeObjectForKey:@"error"];
    [(ENAFURLConnectionOperation *)v6 setError:v8];

    v9 = [v4 decodeObjectForKey:@"responseData"];
    [(ENAFURLConnectionOperation *)v6 setResponseData:v9];

    v10 = [v4 decodeObjectForKey:@"totalBytesRead"];
    -[ENAFURLConnectionOperation setTotalBytesRead:](v6, "setTotalBytesRead:", [v10 longLongValue]);

    id v11 = v6;
  }

  return v6;
}

- (id)connection:(id)a3 willCacheResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ENAFURLConnectionOperation *)self cacheResponse];

  if (v8)
  {
    v9 = [(ENAFURLConnectionOperation *)self cacheResponse];
    ((void (**)(void, id, id))v9)[2](v9, v6, v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([(ENAFURLConnectionOperation *)self isCancelled])
  {
    id v10 = 0;
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  [(ENAFURLConnectionOperation *)self setError:a4];
  int v5 = [(ENAFURLConnectionOperation *)self outputStream];
  [v5 close];

  [(ENAFURLConnectionOperation *)self finish];
  [(ENAFURLConnectionOperation *)self setConnection:0];
}

- (void)connectionDidFinishLoading:(id)a3
{
  id v4 = [(ENAFURLConnectionOperation *)self outputStream];
  int v5 = [v4 propertyForKey:*MEMORY[0x263EFF590]];
  [(ENAFURLConnectionOperation *)self setResponseData:v5];

  id v6 = [(ENAFURLConnectionOperation *)self outputStream];
  [v6 close];

  [(ENAFURLConnectionOperation *)self finish];
  [(ENAFURLConnectionOperation *)self setConnection:0];
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v5 = a4;
  -[ENAFURLConnectionOperation setTotalBytesRead:](self, "setTotalBytesRead:", -[ENAFURLConnectionOperation totalBytesRead](self, "totalBytesRead") + [v5 length]);
  id v6 = [(ENAFURLConnectionOperation *)self outputStream];
  int v7 = [v6 hasSpaceAvailable];

  if (v7)
  {
    id v8 = v5;
    uint64_t v9 = [v8 bytes];
    id v10 = [(ENAFURLConnectionOperation *)self outputStream];
    objc_msgSend(v10, "write:maxLength:", v9, objc_msgSend(v8, "length"));
  }
  id v11 = [(ENAFURLConnectionOperation *)self downloadProgress];

  if (v11)
  {
    uint64_t v12 = [v5 length];
    int64_t v13 = [(ENAFURLConnectionOperation *)self totalBytesRead];
    v14 = [(ENAFURLConnectionOperation *)self response];
    uint64_t v15 = [v14 expectedContentLength];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__ENAFURLConnectionOperation_connection_didReceiveData___block_invoke;
    v16[3] = &unk_264E56578;
    v16[4] = self;
    v16[5] = v12;
    v16[6] = v13;
    v16[7] = v15;
    dispatch_async(MEMORY[0x263EF83A0], v16);
  }
}

void __56__ENAFURLConnectionOperation_connection_didReceiveData___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) downloadProgress];
  (*((void (**)(id, void, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  [(ENAFURLConnectionOperation *)self setResponse:a4];
  id v5 = [(ENAFURLConnectionOperation *)self outputStream];
  [v5 open];
}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v10 = [(ENAFURLConnectionOperation *)self uploadProgress];

  if (v10)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __101__ENAFURLConnectionOperation_connection_didSendBodyData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke;
    v11[3] = &unk_264E56578;
    v11[4] = self;
    v11[5] = a4;
    v11[6] = a5;
    v11[7] = a6;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

void __101__ENAFURLConnectionOperation_connection_didSendBodyData_totalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) uploadProgress];
  (*((void (**)(id, void, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ENAFURLConnectionOperation *)self redirectResponse];

  if (v11)
  {
    uint64_t v12 = [(ENAFURLConnectionOperation *)self redirectResponse];
    ((void (**)(void, id, id, id))v12)[2](v12, v8, v9, v10);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = v9;
  }

  return v13;
}

- (void)connection:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  int v7 = [(ENAFURLConnectionOperation *)self authenticationChallenge];

  if (v7)
  {
    id v8 = [(ENAFURLConnectionOperation *)self authenticationChallenge];
    ((void (**)(void, id, id))v8)[2](v8, v18, v6);
  }
  else if ([v6 previousFailureCount])
  {
    id v8 = [v6 sender];
    [v8 continueWithoutCredentialForAuthenticationChallenge:v6];
  }
  else
  {
    id v9 = [(ENAFURLConnectionOperation *)self request];
    id v10 = (__CFString *)CFURLCopyUserName((CFURLRef)[v9 URL]);

    id v11 = [(ENAFURLConnectionOperation *)self request];
    uint64_t v12 = (__CFString *)CFURLCopyPassword((CFURLRef)[v11 URL]);

    if (v10 && v12)
    {
      id v8 = [MEMORY[0x263EFC610] credentialWithUser:v10 password:v12 persistence:0];
    }
    else
    {
      id v13 = [MEMORY[0x263EFC618] sharedCredentialStorage];
      v14 = [v6 protectionSpace];
      if (v10)
      {
        uint64_t v15 = [v13 credentialsForProtectionSpace:v14];
        id v8 = [v15 objectForKey:v10];
      }
      else
      {
        id v8 = [v13 defaultCredentialForProtectionSpace:v14];
      }
    }
    v16 = [v6 sender];
    v17 = v16;
    if (v8) {
      [v16 useCredential:v8 forAuthenticationChallenge:v6];
    }
    else {
      [v16 continueWithoutCredentialForAuthenticationChallenge:v6];
    }
  }
}

- (BOOL)connection:(id)a3 canAuthenticateAgainstProtectionSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENAFURLConnectionOperation *)self authenticationAgainstProtectionSpace];

  if (v8)
  {
    id v9 = [(ENAFURLConnectionOperation *)self authenticationAgainstProtectionSpace];
    char v10 = ((uint64_t (**)(void, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    id v11 = [v7 authenticationMethod];
    if ([v11 isEqualToString:*MEMORY[0x263EFC5A0]])
    {
    }
    else
    {
      uint64_t v12 = [v7 authenticationMethod];
      int v13 = [v12 isEqualToString:*MEMORY[0x263EFC568]];

      if (!v13)
      {
        char v10 = 1;
        goto LABEL_8;
      }
    }
    char v10 = 0;
  }
LABEL_8:

  return v10;
}

- (void)cancelConnection
{
  v3 = [(ENAFURLConnectionOperation *)self connection];

  if (v3)
  {
    id v4 = [(ENAFURLConnectionOperation *)self connection];
    [v4 cancel];

    id v5 = [(ENAFURLConnectionOperation *)self request];
    id v6 = [v5 URL];

    if (v6)
    {
      id v7 = NSDictionary;
      id v8 = [(ENAFURLConnectionOperation *)self request];
      id v9 = [v8 URL];
      id v12 = [v7 dictionaryWithObject:v9 forKey:*MEMORY[0x263F08578]];
    }
    else
    {
      id v12 = 0;
    }
    char v10 = [(ENAFURLConnectionOperation *)self connection];
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-999 userInfo:v12];
    [(ENAFURLConnectionOperation *)self performSelector:sel_connection_didFailWithError_ withObject:v10 withObject:v11];
  }
}

- (void)cancel
{
  v3 = [(ENAFURLConnectionOperation *)self lock];
  [v3 lock];

  if (![(ENAFURLConnectionOperation *)self isFinished]
    && ![(ENAFURLConnectionOperation *)self isCancelled])
  {
    [(ENAFURLConnectionOperation *)self willChangeValueForKey:@"isCancelled"];
    self->_cancelled = 1;
    v8.receiver = self;
    v8.super_class = (Class)ENAFURLConnectionOperation;
    [(ENAFURLConnectionOperation *)&v8 cancel];
    [(ENAFURLConnectionOperation *)self didChangeValueForKey:@"isCancelled"];
    id v4 = [(id)objc_opt_class() networkRequestThread];
    id v5 = [(ENAFURLConnectionOperation *)self runLoopModes];
    id v6 = [v5 allObjects];
    [(ENAFURLConnectionOperation *)self performSelector:sel_cancelConnection onThread:v4 withObject:0 waitUntilDone:0 modes:v6];
  }
  id v7 = [(ENAFURLConnectionOperation *)self lock];
  [v7 unlock];
}

- (void)finish
{
}

- (void)operationDidStart
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(ENAFURLConnectionOperation *)self lock];
  [v3 lock];

  if ([(ENAFURLConnectionOperation *)self isCancelled])
  {
    [(ENAFURLConnectionOperation *)self finish];
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263EFC608]);
    id v5 = [(ENAFURLConnectionOperation *)self request];
    id v6 = (void *)[v4 initWithRequest:v5 delegate:self startImmediately:0];
    [(ENAFURLConnectionOperation *)self setConnection:v6];

    id v7 = [MEMORY[0x263EFF9F0] currentRunLoop];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v8 = [(ENAFURLConnectionOperation *)self runLoopModes];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
          v14 = [(ENAFURLConnectionOperation *)self connection];
          [v14 scheduleInRunLoop:v7 forMode:v13];

          uint64_t v15 = [(ENAFURLConnectionOperation *)self outputStream];
          [v15 scheduleInRunLoop:v7 forMode:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    v16 = [(ENAFURLConnectionOperation *)self connection];
    [v16 start];
  }
  v17 = [(ENAFURLConnectionOperation *)self lock];
  [v17 unlock];
}

- (void)start
{
  v3 = [(ENAFURLConnectionOperation *)self lock];
  [v3 lock];

  if ([(ENAFURLConnectionOperation *)self isReady])
  {
    [(ENAFURLConnectionOperation *)self setState:2];
    id v4 = [(id)objc_opt_class() networkRequestThread];
    id v5 = [(ENAFURLConnectionOperation *)self runLoopModes];
    id v6 = [v5 allObjects];
    [(ENAFURLConnectionOperation *)self performSelector:sel_operationDidStart onThread:v4 withObject:0 waitUntilDone:0 modes:v6];
  }
  id v7 = [(ENAFURLConnectionOperation *)self lock];
  [v7 unlock];
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isFinished
{
  return [(ENAFURLConnectionOperation *)self state] == 3;
}

- (BOOL)isExecuting
{
  return [(ENAFURLConnectionOperation *)self state] == 2;
}

- (BOOL)isReady
{
  if ([(ENAFURLConnectionOperation *)self state] != 1) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ENAFURLConnectionOperation;
  return [(ENAFURLConnectionOperation *)&v4 isReady];
}

- (void)resume
{
  if ([(ENAFURLConnectionOperation *)self isPaused])
  {
    v3 = [(ENAFURLConnectionOperation *)self lock];
    [v3 lock];

    [(ENAFURLConnectionOperation *)self setState:1];
    [(ENAFURLConnectionOperation *)self start];
    id v4 = [(ENAFURLConnectionOperation *)self lock];
    [v4 unlock];
  }
}

- (BOOL)isPaused
{
  return [(ENAFURLConnectionOperation *)self state] == -1;
}

- (void)pause
{
  if (![(ENAFURLConnectionOperation *)self isPaused]
    && ![(ENAFURLConnectionOperation *)self isFinished]
    && ![(ENAFURLConnectionOperation *)self isCancelled])
  {
    v3 = [(ENAFURLConnectionOperation *)self lock];
    [v3 lock];

    if ([(ENAFURLConnectionOperation *)self isExecuting])
    {
      id v4 = [(ENAFURLConnectionOperation *)self connection];
      id v5 = [(id)objc_opt_class() networkRequestThread];
      id v6 = [(ENAFURLConnectionOperation *)self runLoopModes];
      id v7 = [v6 allObjects];
      [v4 performSelector:sel_cancel onThread:v5 withObject:0 waitUntilDone:0 modes:v7];

      objc_super v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 postNotificationName:@"com.evernote.sdk.networking.operation.finish" object:self];
    }
    [(ENAFURLConnectionOperation *)self setState:0xFFFFFFFFLL];
    id v9 = [(ENAFURLConnectionOperation *)self lock];
    [v9 unlock];
  }
}

- (NSString)responseString
{
  v3 = [(ENAFURLConnectionOperation *)self lock];
  [v3 lock];

  if (!self->_responseString)
  {
    uint64_t v7 = [(ENAFURLConnectionOperation *)self response];
    if (v7)
    {
      objc_super v8 = (void *)v7;
      id v9 = [(ENAFURLConnectionOperation *)self responseData];

      if (v9)
      {
        uint64_t v10 = [(ENAFURLConnectionOperation *)self response];
        uint64_t v11 = [v10 textEncodingName];

        if (!v11
          || ([(ENAFURLConnectionOperation *)self response],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              [v12 textEncodingName],
              uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue(),
              CFStringEncoding v14 = CFStringConvertIANACharSetNameToEncoding(v13),
              v13,
              v12,
              v14 == -1))
        {
          unint64_t v15 = 4;
        }
        else
        {
          unint64_t v15 = CFStringConvertEncodingToNSStringEncoding(v14);
        }
        id v16 = [NSString alloc];
        v17 = [(ENAFURLConnectionOperation *)self responseData];
        long long v18 = (void *)[v16 initWithData:v17 encoding:v15];
        [(ENAFURLConnectionOperation *)self setResponseString:v18];
      }
    }
  }
  id v4 = [(ENAFURLConnectionOperation *)self lock];
  [v4 unlock];

  responseString = self->_responseString;
  return responseString;
}

- (void)setState:(signed __int16)a3
{
  int v3 = a3;
  id v5 = [(ENAFURLConnectionOperation *)self lock];
  [v5 lock];

  LODWORD(v5) = [(ENAFURLConnectionOperation *)self state];
  BOOL v6 = [(ENAFURLConnectionOperation *)self isCancelled];
  switch((int)v5)
  {
    case -1:
      if (v3 == 1) {
        goto LABEL_10;
      }
      break;
    case 1:
      if (v3 == -1 || v3 == 2 || v3 == 3 && v6) {
        goto LABEL_10;
      }
      break;
    case 2:
      if (((v3 + 1) & 0xFFFFFFFB) == 0) {
        goto LABEL_10;
      }
      break;
    case 3:
      break;
    default:
LABEL_10:
      unsigned int v7 = [(ENAFURLConnectionOperation *)self state] + 1;
      if (v7 > 4) {
        objc_super v8 = @"state";
      }
      else {
        objc_super v8 = off_264E56598[v7];
      }
      if ((v3 + 1) > 4) {
        id v9 = @"state";
      }
      else {
        id v9 = off_264E56598[v3 + 1];
      }
      [(ENAFURLConnectionOperation *)self willChangeValueForKey:v9];
      [(ENAFURLConnectionOperation *)self willChangeValueForKey:v8];
      self->_state = v3;
      [(ENAFURLConnectionOperation *)self didChangeValueForKey:v8];
      [(ENAFURLConnectionOperation *)self didChangeValueForKey:v9];
      if (v3 == 3)
      {
        uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
        uint64_t v11 = v10;
        uint64_t v12 = @"com.evernote.sdk.networking.operation.finish";
      }
      else
      {
        if (v3 != 2) {
          break;
        }
        uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
        uint64_t v11 = v10;
        uint64_t v12 = @"com.evernote.sdk.networking.operation.start";
      }
      [v10 postNotificationName:v12 object:self];

      break;
  }
  id v13 = [(ENAFURLConnectionOperation *)self lock];
  [v13 unlock];
}

- (void)setOutputStream:(id)a3
{
  id v5 = (NSOutputStream *)a3;
  p_outputStream = &self->_outputStream;
  if (self->_outputStream != v5)
  {
    unsigned int v7 = v5;
    [(ENAFURLConnectionOperation *)self willChangeValueForKey:@"outputStream"];
    if (*p_outputStream) {
      [(NSOutputStream *)*p_outputStream close];
    }
    objc_storeStrong((id *)&self->_outputStream, a3);
    [(ENAFURLConnectionOperation *)self didChangeValueForKey:@"outputStream"];
    id v5 = v7;
  }
}

- (void)setInputStream:(id)a3
{
  id v4 = a3;
  [(ENAFURLConnectionOperation *)self willChangeValueForKey:@"inputStream"];
  id v5 = [(ENAFURLConnectionOperation *)self request];
  id v6 = (id)[v5 mutableCopy];

  [v6 setHTTPBodyStream:v4];
  [(ENAFURLConnectionOperation *)self setRequest:v6];
  [(ENAFURLConnectionOperation *)self didChangeValueForKey:@"inputStream"];
}

- (NSInputStream)inputStream
{
  id v2 = [(ENAFURLConnectionOperation *)self request];
  int v3 = [v2 HTTPBodyStream];

  return (NSInputStream *)v3;
}

- (void)setCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(ENAFURLConnectionOperation *)self lock];
  [v5 lock];

  if (v4)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__ENAFURLConnectionOperation_setCompletionBlock___block_invoke;
    v8[3] = &unk_264E5A228;
    id v9 = v4;
    objc_copyWeak(&v10, &location);
    v7.receiver = self;
    v7.super_class = (Class)ENAFURLConnectionOperation;
    [(ENAFURLConnectionOperation *)&v7 setCompletionBlock:v8];
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ENAFURLConnectionOperation;
    [(ENAFURLConnectionOperation *)&v12 setCompletionBlock:0];
  }
  id v6 = [(ENAFURLConnectionOperation *)self lock];
  [v6 unlock];
}

void __49__ENAFURLConnectionOperation_setCompletionBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCompletionBlock:0];
}

- (NSString)description
{
  int v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unsigned int v6 = [(ENAFURLConnectionOperation *)self state] + 1;
  if (v6 > 4) {
    objc_super v7 = @"state";
  }
  else {
    objc_super v7 = off_264E56598[v6];
  }
  if ([(ENAFURLConnectionOperation *)self isCancelled]) {
    objc_super v8 = @"YES";
  }
  else {
    objc_super v8 = @"NO";
  }
  id v9 = [(ENAFURLConnectionOperation *)self request];
  id v10 = [(ENAFURLConnectionOperation *)self response];
  uint64_t v11 = [v3 stringWithFormat:@"<%@: %p, state: %@, cancelled: %@ request: %@, response: %@>", v5, self, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (void)dealloc
{
  outputStream = self->_outputStream;
  if (outputStream)
  {
    [(NSOutputStream *)outputStream close];
    id v4 = self->_outputStream;
    self->_outputStream = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ENAFURLConnectionOperation;
  [(ENAFURLConnectionOperation *)&v5 dealloc];
}

- (ENAFURLConnectionOperation)initWithRequest:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENAFURLConnectionOperation;
  objc_super v5 = [(ENAFURLConnectionOperation *)&v12 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08AE0]);
    [(ENAFURLConnectionOperation *)v5 setLock:v6];

    objc_super v7 = [(ENAFURLConnectionOperation *)v5 lock];
    [v7 setName:@"com.alamofire.networking.operation.lock"];

    objc_super v8 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263EFF588]];
    [(ENAFURLConnectionOperation *)v5 setRunLoopModes:v8];

    [(ENAFURLConnectionOperation *)v5 setRequest:v4];
    id v9 = [MEMORY[0x263EFF9E0] outputStreamToMemory];
    [(ENAFURLConnectionOperation *)v5 setOutputStream:v9];

    [(ENAFURLConnectionOperation *)v5 setState:1];
    id v10 = v5;
  }

  return v5;
}

+ (id)networkRequestThread
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ENAFURLConnectionOperation_networkRequestThread__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (networkRequestThread_oncePredicate != -1) {
    dispatch_once(&networkRequestThread_oncePredicate, block);
  }
  id v2 = (void *)networkRequestThread__networkRequestThread;
  return v2;
}

uint64_t __50__ENAFURLConnectionOperation_networkRequestThread__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(MEMORY[0x263F08B88]) initWithTarget:*(void *)(a1 + 32) selector:sel_networkRequestThreadEntryPoint_ object:0];
  id v2 = (void *)networkRequestThread__networkRequestThread;
  networkRequestThread__networkRequestThread = v1;

  int v3 = (void *)networkRequestThread__networkRequestThread;
  return [v3 start];
}

+ (void)networkRequestThreadEntryPoint:(id)a3
{
  id v3 = a3;
  while (1)
  {
    id v4 = (void *)MEMORY[0x23ECE6170](v3);
    objc_super v5 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v5 run];
  }
}

@end