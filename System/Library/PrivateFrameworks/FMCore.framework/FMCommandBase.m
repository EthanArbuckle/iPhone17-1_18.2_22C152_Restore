@interface FMCommandBase
- (BOOL)commandTaskComplete;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isTransactionCompleteWithError:(id)a3;
- (BOOL)wasRedirected;
- (BOOL)wasSuccessful;
- (FMCommandBase)init;
- (FMServerInteractionController)serverInteractionController;
- (NSData)responseData;
- (NSError)error;
- (NSHTTPURLResponse)response;
- (NSNumber)port;
- (NSString)host;
- (NSString)originalHostname;
- (NSString)password;
- (NSString)redirectedHostname;
- (NSString)scheme;
- (NSString)username;
- (NSURLConnection)connection;
- (NSURLRequest)request;
- (NSURLSessionDataTask)task;
- (double)timeout;
- (id)authHeaders;
- (id)body;
- (id)headers;
- (id)method;
- (id)path;
- (id)valueForResponseHTTPHeader:(id)a3;
- (unint64_t)redirectCount;
- (void)_dataTaskCompletionHandlerWithData:(id)a3 response:(id)a4 error:(id)a5;
- (void)cancel;
- (void)generateFakeResponse:(id)a3 data:(id)a4 error:(id)a5;
- (void)sendRequest;
- (void)setCommandTaskComplete:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setError:(id)a3;
- (void)setHost:(id)a3;
- (void)setOriginalHostname:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPort:(id)a3;
- (void)setRedirectCount:(unint64_t)a3;
- (void)setRedirectedHostname:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResponseData:(id)a3;
- (void)setScheme:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)setTask:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUsername:(id)a3;
@end

@implementation FMCommandBase

- (void)setUsername:(id)a3
{
}

- (void)setPassword:(id)a3
{
}

- (BOOL)wasSuccessful
{
  v2 = [(FMCommandBase *)self response];
  uint64_t v3 = [v2 statusCode];

  return (unint64_t)(v3 - 200) < 0x64;
}

- (id)headers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(FMCommandBase *)self authHeaders];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

- (id)valueForResponseHTTPHeader:(id)a3
{
  id v4 = a3;
  v5 = [(FMCommandBase *)self response];
  v6 = [v5 allHeaderFields];
  v7 = [v6 valueForKey:v4];

  return v7;
}

- (FMCommandBase)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)FMCommandBase;
  v2 = [(FMCommandBase *)&v8 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(FMCommandBase *)v2 setTimeout:120.0];
    [(FMCommandBase *)v3 setCommandTaskComplete:0];
    id v4 = LogCategory_Networking();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v10 = v5;
      __int16 v11 = 2048;
      v12 = v3;
      id v6 = v5;
      _os_log_impl(&dword_1D0EC4000, v4, OS_LOG_TYPE_INFO, "%@ created [%p]", buf, 0x16u);
    }
  }
  return v3;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_redirectedHostname, 0);
  objc_storeStrong((id *)&self->_originalHostname, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_destroyWeak((id *)&self->_serverInteractionController);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)_dataTaskCompletionHandlerWithData:(id)a3 response:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  __int16 v11 = [(FMCommandBase *)self task];
  uint64_t v12 = [v11 state];

  if (v12 != 3)
  {
    uint64_t v13 = LogCategory_Networking();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[FMCommandBase _dataTaskCompletionHandlerWithData:response:error:](self, v13);
    }
  }
  [(FMCommandBase *)self setCommandTaskComplete:1];
  v14 = (void *)[v10 copy];

  [(FMCommandBase *)self setResponseData:v14];
  [(FMCommandBase *)self setError:v8];

  [(FMCommandBase *)self setResponse:v9];
  v15 = [(FMCommandBase *)self error];
  BOOL v16 = [(FMCommandBase *)self isTransactionCompleteWithError:v15];

  if (v16)
  {
    [(FMCommandBase *)self willChangeValueForKey:@"isFinished"];
    [(FMCommandBase *)self didChangeValueForKey:@"isFinished"];
  }
}

- (id)authHeaders
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(FMCommandBase *)self username];
  if ([v3 length])
  {
    id v4 = [(FMCommandBase *)self password];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      id v6 = NSString;
      v7 = [(FMCommandBase *)self username];
      id v8 = [(FMCommandBase *)self password];
      id v9 = [v6 stringWithFormat:@"%@:%@", v7, v8];
      id v10 = [v9 dataUsingEncoding:1];

      __int16 v11 = [v10 base64EncodedStringWithOptions:0];
      v15 = @"Authorization";
      uint64_t v12 = [NSString stringWithFormat:@"Basic %@", v11];
      v16[0] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

      goto LABEL_6;
    }
  }
  else
  {
  }
  __int16 v11 = 0;
  uint64_t v13 = 0;
LABEL_6:

  return v13;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (NSData)responseData
{
  return self->_responseData;
}

- (BOOL)isTransactionCompleteWithError:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(FMCommandBase *)self response];

  if (!v5) {
    goto LABEL_11;
  }
  id v6 = [(FMCommandBase *)self response];
  v7 = [v6 allHeaderFields];

  id v8 = [(FMCommandBase *)self response];
  uint64_t v9 = [v8 statusCode];

  id v10 = LogCategory_Networking();
  __int16 v11 = v10;
  if (v9 < 400)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [(FMCommandBase *)self response];
      *(_DWORD *)buf = 134218240;
      v35 = self;
      __int16 v36 = 2048;
      uint64_t v37 = [v12 statusCode];
      uint64_t v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(FMCommandBase *)self response];
    *(_DWORD *)buf = 134218240;
    v35 = self;
    __int16 v36 = 2048;
    uint64_t v37 = [v12 statusCode];
    uint64_t v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
    _os_log_impl(&dword_1D0EC4000, v13, v14, "[%p] response_http_status : %ld", buf, 0x16u);
  }
  v15 = LogCategory_NetworkingVerbose();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v35 = self;
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v7;
    _os_log_impl(&dword_1D0EC4000, v15, OS_LOG_TYPE_INFO, "[%p] response_headers: %@", buf, 0x16u);
  }

LABEL_11:
  if (!a3)
  {
    BOOL v16 = [(FMCommandBase *)self response];
    uint64_t v17 = [v16 statusCode];

    if (v17 == 330)
    {
      v18 = [(FMCommandBase *)self request];
      v19 = [v18 URL];

      v20 = [v19 host];
      v21 = [(FMCommandBase *)self valueForResponseHTTPHeader:@"X-Apple-Mme-Host"];
      if ([v20 length] && objc_msgSend(v21, "length"))
      {
        if ([(FMCommandBase *)self redirectCount] <= 4)
        {
          [(FMCommandBase *)self setRedirectCount:[(FMCommandBase *)self redirectCount] + 1];
          if (!self->_originalHostname)
          {
            v26 = (NSString *)[v20 copy];
            originalHostname = self->_originalHostname;
            self->_originalHostname = v26;
          }
          v28 = (NSString *)[v21 copy];
          redirectedHostname = self->_redirectedHostname;
          self->_redirectedHostname = v28;

          [(FMCommandBase *)self setHost:v21];
          v32[0] = @"originalHostname";
          v32[1] = @"redirectedHostname";
          v33[0] = v20;
          v33[1] = v21;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
          v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v31 postNotificationName:FMCommandRedirectedNotification object:self userInfo:v30];

          [(FMCommandBase *)self sendRequest];
          BOOL v23 = 0;
          goto LABEL_23;
        }
        v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1007 userInfo:0];
        [(FMCommandBase *)self setError:v22];

        [(FMCommandBase *)self cancel];
      }
      else
      {
        v25 = LogCategory_ServerError();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[FMCommandBase isTransactionCompleteWithError:](v25);
        }
      }
      BOOL v23 = 1;
LABEL_23:

      return v23;
    }
  }
  return 1;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (void)sendRequest
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_ERROR, "FMCommandBase could not sendRequest. Session is nil.", v1, 2u);
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)commandTaskComplete
{
  return self->_commandTaskComplete;
}

uint64_t __28__FMCommandBase_sendRequest__block_invoke_32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _dataTaskCompletionHandlerWithData:a2 response:a3 error:a4];
}

- (BOOL)wasRedirected
{
  return self->_originalHostname && self->_redirectedHostname != 0;
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (void)setServerInteractionController:(id)a3
{
}

- (void)setScheme:(id)a3
{
}

- (void)setResponseData:(id)a3
{
}

- (void)setResponse:(id)a3
{
}

- (void)setRequest:(id)a3
{
}

- (void)setHost:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void)setCommandTaskComplete:(BOOL)a3
{
  self->_commandTaskComplete = a3;
}

- (FMServerInteractionController)serverInteractionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverInteractionController);
  return (FMServerInteractionController *)WeakRetained;
}

- (NSString)scheme
{
  return self->_scheme;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSNumber)port
{
  return self->_port;
}

- (NSString)host
{
  return self->_host;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (NSURLConnection)connection
{
  return self->_connection;
}

- (void)cancel
{
  uint64_t v3 = [(FMCommandBase *)self task];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)FMCommandBase;
  [(FMCommandBase *)&v4 cancel];
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isExecuting
{
  return ![(FMCommandBase *)self commandTaskComplete];
}

void __28__FMCommandBase_sendRequest__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__FMCommandBase_sendRequest__block_invoke_2;
  v3[3] = &unk_1E689E6E0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  [WeakRetained addOperationWithBlock:v3];
  objc_destroyWeak(&v4);
}

void __28__FMCommandBase_sendRequest__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = LogCategory_Networking();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [WeakRetained request];
      id v4 = [v3 URL];
      [WeakRetained timeout];
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2048;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D0EC4000, v2, OS_LOG_TYPE_DEFAULT, "Transaction %@ timed out after %.1f s", (uint8_t *)&v7, 0x16u);
    }
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1001 userInfo:0];
    [WeakRetained setError:v6];

    [WeakRetained cancel];
  }
}

- (void)generateFakeResponse:(id)a3 data:(id)a4 error:(id)a5
{
}

- (id)method
{
  return (id)FMCommandHTTPMethodPost;
}

- (id)path
{
  return @"/";
}

- (id)body
{
  return (id)[MEMORY[0x1E4F1C9B8] data];
}

- (NSString)originalHostname
{
  return self->_originalHostname;
}

- (NSString)redirectedHostname
{
  return self->_redirectedHostname;
}

- (void)setPort:(id)a3
{
}

- (unint64_t)redirectCount
{
  return self->_redirectCount;
}

- (void)setRedirectCount:(unint64_t)a3
{
  self->_redirectCount = a3;
}

- (void)setOriginalHostname:(id)a3
{
}

- (void)setRedirectedHostname:(id)a3
{
}

- (void)_dataTaskCompletionHandlerWithData:(void *)a1 response:(NSObject *)a2 error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 task];
  int v4 = 134217984;
  uint64_t v5 = [v3 state];
  _os_log_error_impl(&dword_1D0EC4000, a2, OS_LOG_TYPE_ERROR, "BUG in NSURLSessionDataTask: self.task.state is %ld in completion handler <rdar://problem/16847465", (uint8_t *)&v4, 0xCu);
}

- (void)isTransactionCompleteWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0EC4000, log, OS_LOG_TYPE_ERROR, "Missing X-Apple-MMe-Host header!", v1, 2u);
}

@end