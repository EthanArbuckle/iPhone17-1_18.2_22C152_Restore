@interface VSJSXMLHTTPRequest
- (BOOL)requestSent;
- (NSMutableURLRequest)request;
- (NSString)responseText;
- (NSString)responseType;
- (NSString)statusText;
- (NSURLResponse)urlResponse;
- (NSURLSession)session;
- (NSURLSessionTask)sessionTask;
- (VSJSXMLHTTPRequest)init;
- (VSJSXMLHTTPRequest)initWithContext:(id)a3;
- (id)getAllResponseHeaders;
- (id)getResponseHeader:(id)a3;
- (id)response;
- (unint64_t)readyState;
- (unint64_t)status;
- (unint64_t)timeout;
- (void)_cancelCurrentRequestAndNotify:(BOOL)a3;
- (void)_notifyWithFunctionName:(id)a3 eventName:(id)a4 info:(id)a5;
- (void)abort;
- (void)open:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7;
- (void)send:(id)a3;
- (void)setReadyState:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setRequestHeader:(id)a3 :(id)a4;
- (void)setRequestSent:(BOOL)a3;
- (void)setResponse:(id)a3;
- (void)setResponseText:(id)a3;
- (void)setResponseType:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionTask:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setStatusText:(id)a3;
- (void)setTimeout:(unint64_t)a3;
- (void)setUrlResponse:(id)a3;
@end

@implementation VSJSXMLHTTPRequest

- (VSJSXMLHTTPRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSJSXMLHTTPRequest;
  v2 = [(VSJSObject *)&v5 init];
  v3 = v2;
  if (v2) {
    commonInit(v2);
  }
  return v3;
}

- (VSJSXMLHTTPRequest)initWithContext:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VSJSXMLHTTPRequest;
  v3 = [(VSJSEventTargetObject *)&v6 initWithContext:a3];
  v4 = v3;
  if (v3) {
    commonInit(v3);
  }
  return v4;
}

- (void)open:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
  if (v12)
  {
    if (v11 && ([v11 BOOLValue] & 1) == 0)
    {
      v13 = [(VSJSObject *)self context];
      objc_msgSend(v13, "setExceptionWithMessage:", @"XMLHTTPRequest.open does not support synchronous invocation", v14);
    }
    else
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v12];
      [v13 setHTTPMethod:v15];
      [(VSJSXMLHTTPRequest *)self _cancelCurrentRequestAndNotify:0];
      [(VSJSXMLHTTPRequest *)self setRequest:v13];
      [(VSJSXMLHTTPRequest *)self setReadyState:1];
    }
  }
  else
  {
    v13 = [(VSJSObject *)self context];
    [v13 setExceptionWithMessage:@"XMLHTTPRequest.open invoked with invalid URL %@", v10];
  }
}

- (void)send:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[VSJSXMLHTTPRequest send:]";
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if ([(VSJSXMLHTTPRequest *)self readyState] == 1)
  {
    if (!v4 || ([v4 isNull] & 1) != 0 || (objc_msgSend(v4, "isUndefined") & 1) != 0)
    {
      objc_super v6 = 0;
    }
    else
    {
      if (([v4 isString] & 1) == 0)
      {
        objc_super v6 = [(VSJSObject *)self context];
        [v6 setExceptionWithMessage:@"XMLHTTPRequest.send only supports string data"];
        goto LABEL_14;
      }
      objc_super v6 = [v4 toString];
      if (v6)
      {
        v13 = [(VSJSXMLHTTPRequest *)self request];
        uint64_t v14 = [v6 dataUsingEncoding:4];
        [v13 setHTTPBody:v14];
      }
    }
    v7 = [(VSJSXMLHTTPRequest *)self request];
    BOOL v8 = v7 == 0;

    if (v8) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [self request] parameter must not be nil."];
    }
    v9 = [(VSJSXMLHTTPRequest *)self request];
    objc_initWeak(&location, self);
    id v10 = [(VSJSXMLHTTPRequest *)self session];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __27__VSJSXMLHTTPRequest_send___block_invoke;
    v15[3] = &unk_1E6BD4348;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    id v11 = [v10 dataTaskWithRequest:v9 completionHandler:v15];

    [(VSJSXMLHTTPRequest *)self setSessionTask:v11];
    [v11 resume];
    [(VSJSXMLHTTPRequest *)self setRequestSent:1];
    [(VSJSXMLHTTPRequest *)self setReadyState:3];
    v12 = VSDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[VSJSXMLHTTPRequest send:]";
      _os_log_impl(&dword_1DA674000, v12, OS_LOG_TYPE_DEFAULT, "Will exit %s", buf, 0xCu);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_super v6 = [(VSJSObject *)self context];
    [v6 setExceptionWithMessage:@"XMLHTTPRequest.setRequestHeader invoked in non-open state"];
  }
LABEL_14:
}

void __27__VSJSXMLHTTPRequest_send___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = VSDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1DA674000, v10, OS_LOG_TYPE_DEFAULT, "Received XHR response: %@ error: %@", (uint8_t *)&v20, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setUrlResponse:v8];
    v13 = [*(id *)(a1 + 32) urlResponse];
    objc_msgSend(v12, "setStatus:", objc_msgSend(v13, "statusCode"));

    if (!v9)
    {
      if ([v7 length])
      {
        id v18 = [NSString alloc];
        if (!v7) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The taskResponseData parameter must not be nil."];
        }
        v19 = (void *)[v18 initWithData:v7 encoding:4];
        [v12 setResponseText:v19];
      }
      id v16 = @"onload";
      v17 = @"load";
      goto LABEL_15;
    }
    uint64_t v14 = [v9 domain];
    if ([v14 isEqual:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v15 = [v9 code];

      if (v15 == -1001)
      {
        id v16 = @"ontimeout";
        v17 = @"timeout";
LABEL_15:
        [v12 _notifyWithFunctionName:v16 eventName:v17 info:MEMORY[0x1E4F1CC08]];
        [v12 setRequest:0];
        [v12 setRequestSent:0];
        [v12 setSessionTask:0];
        [v12 setReadyState:4];
        goto LABEL_16;
      }
    }
    else
    {
    }
    id v16 = @"onerror";
    v17 = @"error";
    goto LABEL_15;
  }
LABEL_16:
}

- (void)abort
{
}

- (id)getAllResponseHeaders
{
  if ([(VSJSXMLHTTPRequest *)self readyState] == 4)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = [(VSJSXMLHTTPRequest *)self urlResponse];
    objc_super v5 = [v4 allHeaderFields];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__VSJSXMLHTTPRequest_getAllResponseHeaders__block_invoke;
    v10[3] = &unk_1E6BD4370;
    id v11 = v3;
    id v6 = v3;
    [v5 enumerateKeysAndObjectsUsingBlock:v10];

    id v7 = [v6 componentsJoinedByString:@"\r\n"];
  }
  else
  {
    id v8 = [(VSJSObject *)self context];
    [v8 setExceptionWithMessage:@"XMLHTTPRequest.getAllResponseHeaders invoked before request completed"];

    id v7 = 0;
  }

  return v7;
}

void __43__VSJSXMLHTTPRequest_getAllResponseHeaders__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  objc_super v5 = NSString;
  id v6 = a3;
  id v8 = [a2 lowercaseString];
  id v7 = [v5 stringWithFormat:@"%@: %@", v8, v6];

  [v4 addObject:v7];
}

- (id)getResponseHeader:(id)a3
{
  id v4 = a3;
  if ([(VSJSXMLHTTPRequest *)self readyState] == 4)
  {
    objc_super v5 = [(VSJSXMLHTTPRequest *)self urlResponse];
    id v6 = [v5 allHeaderFields];
    id v7 = [v6 objectForKey:v4];
  }
  else
  {
    objc_super v5 = [(VSJSObject *)self context];
    [v5 setExceptionWithMessage:@"XMLHTTPRequest.getResponseHeader invoked before request completed"];
    id v7 = 0;
  }

  return v7;
}

- (void)setRequestHeader:(id)a3 :(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([(VSJSXMLHTTPRequest *)self readyState] != 1)
  {
    id v7 = [(VSJSObject *)self context];
    id v8 = v7;
    id v9 = @"XMLHTTPRequest.setRequestHeader invoked in non-open state";
    goto LABEL_11;
  }
  if ([(VSJSXMLHTTPRequest *)self requestSent])
  {
    id v7 = [(VSJSObject *)self context];
    id v8 = v7;
    id v9 = @"XMLHTTPRequest.setRequestHeader invoked after send";
LABEL_11:
    [v7 setExceptionWithMessage:v9];
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = [(VSJSObject *)self context];
    id v8 = v7;
    id v9 = @"XMLHTTPRequest.setRequestHeader invoked with invalid header or value";
    goto LABEL_11;
  }
  id v8 = [(VSJSXMLHTTPRequest *)self request];
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The request parameter must not be nil."];
  }
  id v10 = [(VSJSXMLHTTPRequest *)self request];
  [v10 setValue:v6 forHTTPHeaderField:v11];

LABEL_12:
}

- (void)setReadyState:(unint64_t)a3
{
  if (self->_readyState != a3)
  {
    self->_readyState = a3;
    [(VSJSXMLHTTPRequest *)self _notifyWithFunctionName:@"onreadystatechange" eventName:@"readystatechange" info:MEMORY[0x1E4F1CC08]];
  }
}

- (void)_cancelCurrentRequestAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(VSJSXMLHTTPRequest *)self sessionTask];
  id v6 = v5;
  if (v5)
  {
    [v5 cancel];
    [(VSJSXMLHTTPRequest *)self setRequest:0];
    [(VSJSXMLHTTPRequest *)self setRequestSent:0];
    [(VSJSXMLHTTPRequest *)self setSessionTask:0];
    if (v3)
    {
      objc_initWeak(&location, self);
      id v7 = [(VSJSObject *)self context];
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      id v10 = __53__VSJSXMLHTTPRequest__cancelCurrentRequestAndNotify___block_invoke;
      id v11 = &unk_1E6BD4398;
      objc_copyWeak(&v12, &location);
      [v7 evaluateWithBlock:&v8];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    -[VSJSXMLHTTPRequest setReadyState:](self, "setReadyState:", 0, v8, v9, v10, v11);
  }
}

void __53__VSJSXMLHTTPRequest__cancelCurrentRequestAndNotify___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _notifyWithFunctionName:@"onerror" eventName:@"error" info:MEMORY[0x1E4F1CC08]];
    id WeakRetained = v2;
  }
}

- (void)_notifyWithFunctionName:(id)a3 eventName:(id)a4 info:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = VSDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v22 = "-[VSJSXMLHTTPRequest _notifyWithFunctionName:eventName:info:]";
    _os_log_impl(&dword_1DA674000, v11, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v12 = [(VSJSObject *)self context];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__VSJSXMLHTTPRequest__notifyWithFunctionName_eventName_info___block_invoke;
  v16[3] = &unk_1E6BD43C0;
  objc_copyWeak(&v20, (id *)buf);
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  id v15 = v8;
  id v19 = v15;
  [v12 evaluateWithBlock:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __61__VSJSXMLHTTPRequest__notifyWithFunctionName_eventName_info___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_super v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained dispatchEvent:*(void *)(a1 + 32) withInfo:*(void *)(a1 + 40)];
    id v6 = (void *)MEMORY[0x1E4F30938];
    id v7 = [v3 context];
    id v8 = [v6 valueWithObject:v5 inContext:v7];

    if (!v8) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The thisValue parameter must not be nil."];
    }
    id v9 = VSDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_1DA674000, v9, OS_LOG_TYPE_DEFAULT, "Will invoke method %@ for event with name %@", buf, 0x16u);
    }

    id v12 = [v8 objectForKeyedSubscript:*(void *)(a1 + 48)];
    id v13 = v12;
    if (v12 && ([v12 isNull] & 1) == 0 && (objc_msgSend(v13, "isUndefined") & 1) == 0)
    {
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 40);
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      id v16 = (id)[v8 invokeMethod:v14 withArguments:v15];
    }
  }
}

- (unint64_t)readyState
{
  return self->_readyState;
}

- (id)response
{
  return self->response;
}

- (void)setResponse:(id)a3
{
}

- (NSString)responseText
{
  return self->responseText;
}

- (void)setResponseText:(id)a3
{
}

- (unint64_t)status
{
  return self->status;
}

- (void)setStatus:(unint64_t)a3
{
  self->status = a3;
}

- (NSString)statusText
{
  return self->statusText;
}

- (void)setStatusText:(id)a3
{
}

- (unint64_t)timeout
{
  return self->timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->timeout = a3;
}

- (NSString)responseType
{
  return self->responseType;
}

- (void)setResponseType:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURLSessionTask)sessionTask
{
  return self->_sessionTask;
}

- (void)setSessionTask:(id)a3
{
}

- (NSMutableURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (void)setUrlResponse:(id)a3
{
}

- (BOOL)requestSent
{
  return self->_requestSent;
}

- (void)setRequestSent:(BOOL)a3
{
  self->_requestSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_sessionTask, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->responseType, 0);
  objc_storeStrong((id *)&self->statusText, 0);
  objc_storeStrong((id *)&self->responseText, 0);

  objc_storeStrong(&self->response, 0);
}

@end