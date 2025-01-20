@interface AARequester
- (AARequester)initWithRequest:(id)a3 handler:(id)a4;
- (BOOL)isCanceled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (OS_dispatch_queue)handlerQueue;
- (void)__unsafe_callHandler;
- (void)_callHandler;
- (void)_kickOffRequest:(id)a3;
- (void)cancel;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setIsExecuting:(BOOL)a3;
- (void)start;
@end

@implementation AARequester

- (AARequester)initWithRequest:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AARequester;
  v9 = [(AARequester *)&v18 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id handler = v9->_handler;
    v9->_id handler = (id)v10;

    v12 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    data = v9->_data;
    v9->_data = v12;

    objc_storeStrong((id *)&v9->_request, a3);
    v9->_responseClass = (Class)[(id)objc_opt_class() responseClass];
    v9->_canceled = 0;
    handlerQueue = v9->_handlerQueue;
    v9->_handlerQueue = 0;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:@"com.apple.icloud"];
    appleIDSession = v9->_appleIDSession;
    v9->_appleIDSession = (AKAppleIDSession *)v15;
  }
  return v9;
}

- (void)cancel
{
  urlConnection = self->_urlConnection;
  if (urlConnection) {
    [(NSURLConnection *)urlConnection cancel];
  }
  if (![(AARequester *)self isFinished])
  {
    handlerQueue = self->_handlerQueue;
    if (handlerQueue)
    {
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __21__AARequester_cancel__block_invoke;
      v14 = &unk_1E5A48358;
      uint64_t v15 = self;
      v5 = &v11;
    }
    else
    {
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      id v8 = __21__AARequester_cancel__block_invoke_2;
      v9 = &unk_1E5A48358;
      uint64_t v10 = self;
      handlerQueue = MEMORY[0x1E4F14428];
      v5 = &v6;
    }
    dispatch_async(handlerQueue, v5);
  }
  -[AARequester setCanceled:](self, "setCanceled:", 1, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t __21__AARequester_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callHandler];
}

uint64_t __21__AARequester_cancel__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callHandler];
}

- (void)start
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(AARequester *)self setIsExecuting:1];
  [(AARequester *)self setFinished:0];
  v3 = [(AARequest *)self->_request urlString];

  if (v3)
  {
    id v14 = [(AARequest *)self->_request urlRequest];
    -[AARequester _kickOffRequest:](self, "_kickOffRequest:");
  }
  else
  {
    v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138412290;
      objc_super v18 = v6;
      _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "AARequester starting an AARequest (%@) with nil URL. Calling handler with an error.", buf, 0xCu);
    }
    uint64_t v7 = (AAResponse *)[objc_alloc(self->_responseClass) initWithHTTPResponse:0 data:0];
    response = self->_response;
    self->_response = v7;

    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v11 = [v10 localizedStringForKey:@"ICLOUD_CONFIG_ERROR" value:0 table:@"Localizable"];
    v16 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v13 = [v9 errorWithDomain:@"com.apple.appleaccount" code:-2 userInfo:v12];
    [(AAResponse *)self->_response setError:v13];

    [(AARequester *)self setIsExecuting:0];
    [(AARequester *)self setFinished:1];
    [(AARequester *)self _callHandler];
  }
}

- (void)_kickOffRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = [(AKAppleIDSession *)self->_appleIDSession appleIDHeadersForRequest:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v6 objectForKeyedSubscript:v11];
        [v5 setValue:v12 forHTTPHeaderField:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
  v13 = [MEMORY[0x1E4F18D80] connectionWithRequest:v5 delegate:self];
  urlConnection = self->_urlConnection;
  self->_urlConnection = v13;

  uint64_t v15 = self->_urlConnection;
  id v16 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [(NSURLConnection *)v15 setDelegateQueue:v16];

  if (self->_urlConnection)
  {
    uint64_t v17 = *MEMORY[0x1E4F1C3A0];
    do
    {
      if ([(AARequester *)self isFinished]) {
        break;
      }
      if ([(AARequester *)self isCanceled]) {
        break;
      }
      objc_super v18 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
      char v20 = [v18 runMode:v17 beforeDate:v19];
    }
    while ((v20 & 1) != 0);
    v21 = _AALogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1A11D8000, v21, OS_LOG_TYPE_DEFAULT, "AARequester runloop finished", v23, 2u);
    }

    if (![(AARequester *)self isFinished] && ![(AARequester *)self isCanceled])
    {
      v22 = _AALogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "AARequester: Premature runloop exit, calling cancel", v23, 2u);
      }

      [(AARequester *)self cancel];
    }
  }
  else
  {
    [(AARequester *)self setIsExecuting:0];
    [(AARequester *)self setFinished:1];
    [(AARequester *)self _callHandler];
  }
}

- (void)_callHandler
{
  if (self->_shouldRetry)
  {
    id v5 = [(NSURLConnection *)self->_urlConnection originalRequest];
    [(AARequester *)self _kickOffRequest:v5];
  }
  else
  {
    handlerQueue = self->_handlerQueue;
    if (handlerQueue)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __27__AARequester__callHandler__block_invoke;
      v7[3] = &unk_1E5A48358;
      v7[4] = self;
      id v4 = v7;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __27__AARequester__callHandler__block_invoke_2;
      block[3] = &unk_1E5A48358;
      block[4] = self;
      handlerQueue = MEMORY[0x1E4F14428];
      id v4 = block;
    }
    dispatch_async(handlerQueue, v4);
  }
}

uint64_t __27__AARequester__callHandler__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__unsafe_callHandler");
}

uint64_t __27__AARequester__callHandler__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__unsafe_callHandler");
}

- (void)__unsafe_callHandler
{
  (*((void (**)(void))self->_handler + 2))();
  [(AARequester *)self setIsExecuting:0];

  [(AARequester *)self setFinished:1];
}

- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[AACertificatePinner sharedPinner];
  char v9 = objc_opt_respondsToSelector();

  uint64_t v10 = _AALogSystem();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AARequester connection:willSendRequestForAuthenticationChallenge:](a2, v7, v11);
    }

    uint64_t v12 = +[AACertificatePinner sharedPinner];
    [v12 connection:v6 willSendRequestForAuthenticationChallenge:v7];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AARequester connection:willSendRequestForAuthenticationChallenge:](a2, v11);
    }

    uint64_t v12 = [v7 sender];
    [v12 performDefaultHandlingForAuthenticationChallenge:v7];
  }
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = (NSHTTPURLResponse *)a4;
  id v7 = a3;
  uint64_t v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = [(NSHTTPURLResponse *)v6 allHeaderFields];
    int v13 = 138412290;
    id v14 = v9;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Received response. Headers: %@", (uint8_t *)&v13, 0xCu);
  }
  self->_shouldRetry = 0;
  appleIDSession = self->_appleIDSession;
  uint64_t v11 = [v7 originalRequest];

  [(AKAppleIDSession *)appleIDSession handleResponse:v6 forRequest:v11 shouldRetry:&self->_shouldRetry];
  httpResponse = self->_httpResponse;
  self->_httpResponse = v6;
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = [v5 length];
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Received %lu bytes.", (uint8_t *)&v7, 0xCu);
  }

  [(NSMutableData *)self->_data appendData:v5];
}

- (void)connectionDidFinishLoading:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v5 = [(NSMutableData *)self->_data length];
    int v8 = 134217984;
    NSUInteger v9 = v5;
    _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "Finished loading: %lu bytes.", (uint8_t *)&v8, 0xCu);
  }

  id v6 = (AAResponse *)[objc_alloc(self->_responseClass) initWithHTTPResponse:self->_httpResponse data:self->_data];
  response = self->_response;
  self->_response = v6;

  [(AARequester *)self _callHandler];
  [(AARequester *)self setIsExecuting:0];
  [(AARequester *)self setFinished:1];
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Connection failed.", (uint8_t *)&v12, 2u);
  }

  if (v5)
  {
    int v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [v5 localizedDescription];
      int v12 = 138412290;
      int v13 = v8;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v12, 0xCu);
    }
  }
  NSUInteger v9 = (AAResponse *)[objc_alloc(self->_responseClass) initWithHTTPResponse:self->_httpResponse data:self->_data];
  response = self->_response;
  self->_response = v9;

  uint64_t v11 = objc_msgSend(v5, "_aa_userReadableError");
  [(AAResponse *)self->_response setError:v11];

  [(AARequester *)self _callHandler];
  [(AARequester *)self setIsExecuting:0];
  [(AARequester *)self setFinished:1];
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_appleIDSession, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_urlConnection, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)connection:(NSObject *)a3 willSendRequestForAuthenticationChallenge:.cold.1(const char *a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = [a2 protectionSpace];
  int v7 = [v6 host];
  int v8 = 138478083;
  NSUInteger v9 = v5;
  __int16 v10 = 2113;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_1A11D8000, a3, OS_LOG_TYPE_DEBUG, "AACertificatePinner responds to %{private}@, routing challenge for host: %{private}@", (uint8_t *)&v8, 0x16u);
}

- (void)connection:(const char *)a1 willSendRequestForAuthenticationChallenge:(NSObject *)a2 .cold.2(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138477827;
  id v5 = v3;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "AACertificatePinner does not respond to %{private}@!", (uint8_t *)&v4, 0xCu);
}

@end