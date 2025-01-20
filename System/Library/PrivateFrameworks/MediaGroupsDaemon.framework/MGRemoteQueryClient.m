@interface MGRemoteQueryClient
+ (MGRemoteQueryClient)clientWithHandler:(id)a3 target:(id)a4 dispatchQueue:(id)a5 delegate:(id)a6 usingSession:(id)a7;
- (BOOL)_responseValidate:(id)a3;
- (BOOL)invalidated;
- (BOOL)processedResult;
- (MGRemoteQueryClientDelegate)delegate;
- (MGRemoteQueryClientHandlerProtocol)handler;
- (MGRemoteQueryClientTarget)target;
- (NSError)error;
- (NSHTTPURLResponse)response;
- (NSMutableData)payload;
- (NSURLSessionDataTask)task;
- (OS_dispatch_queue)dispatchQueue;
- (id)_initWithHandler:(id)a3 target:(id)a4 dispatchQueue:(id)a5 delegate:(id)a6 session:(id)a7;
- (id)_prepareRequest:(id)a3;
- (id)_prepareURL;
- (id)description;
- (id)query;
- (unint64_t)expectedPayloadSize;
- (unint64_t)protocolVersion;
- (void)_handleError:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_prepareConnection:(id)a3;
- (void)_responseAppend:(id)a3;
- (void)_responseComplete;
- (void)_responseStart:(id)a3;
- (void)completeWithError:(id)a3;
- (void)consumeData:(id)a3;
- (void)consumeResponse:(id)a3;
- (void)dealloc;
- (void)setError:(id)a3;
- (void)setExpectedPayloadSize:(unint64_t)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setPayload:(id)a3;
- (void)setProcessedResult:(BOOL)a3;
- (void)setProtocolVersion:(unint64_t)a3;
- (void)setResponse:(id)a3;
@end

@implementation MGRemoteQueryClient

+ (MGRemoteQueryClient)clientWithHandler:(id)a3 target:(id)a4 dispatchQueue:(id)a5 delegate:(id)a6 usingSession:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) _initWithHandler:v16 target:v15 dispatchQueue:v14 delegate:v13 session:v12];

  return (MGRemoteQueryClient *)v17;
}

- (id)_initWithHandler:(id)a3 target:(id)a4 dispatchQueue:(id)a5 delegate:(id)a6 session:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)MGRemoteQueryClient;
  v18 = [(MGRemoteQueryClient *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dispatchQueue, a5);
    objc_storeStrong((id *)&v19->_handler, a3);
    objc_storeStrong((id *)&v19->_target, a4);
    objc_storeWeak((id *)&v19->_delegate, v16);
    v19->_invalidated = 0;
    error = v19->_error;
    v19->_error = 0;

    uint64_t v21 = [(MGRemoteQueryClientTarget *)v19->_target protocolVersion];
    response = v19->_response;
    v19->_protocolVersion = v21;
    v19->_response = 0;

    v19->_expectedPayloadSize = 0;
    uint64_t v23 = [MEMORY[0x263EFF990] data];
    payload = v19->_payload;
    v19->_payload = (NSMutableData *)v23;

    v19->_processedResult = 0;
    v25 = [(MGRemoteQueryClient *)v19 dispatchQueue];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __78__MGRemoteQueryClient__initWithHandler_target_dispatchQueue_delegate_session___block_invoke;
    v27[3] = &unk_26485E468;
    v28 = v19;
    id v29 = v17;
    dispatch_async(v25, v27);
  }
  return v19;
}

uint64_t __78__MGRemoteQueryClient__initWithHandler_target_dispatchQueue_delegate_session___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareConnection:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(MGRemoteQueryClient *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryClient;
  [(MGRemoteQueryClient *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MGRemoteQueryClient *)self task];
  v7 = [(MGRemoteQueryClient *)self target];
  v8 = [(MGRemoteQueryClient *)self handler];
  v9 = [(MGRemoteQueryClient *)self payload];
  v10 = [v3 stringWithFormat:@"<%@: %p, _task = %@, _target = %@, _handler = %@, payload %lu/%lu>", v5, self, v6, v7, v8, objc_msgSend(v9, "length"), -[MGRemoteQueryClient expectedPayloadSize](self, "expectedPayloadSize")];

  return v10;
}

- (void)consumeResponse:(id)a3
{
  id v4 = a3;
  v5 = [(MGRemoteQueryClient *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__MGRemoteQueryClient_consumeResponse___block_invoke;
  v7[3] = &unk_26485E468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __39__MGRemoteQueryClient_consumeResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _responseStart:*(void *)(a1 + 40)];
}

- (void)consumeData:(id)a3
{
  id v4 = a3;
  v5 = [(MGRemoteQueryClient *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__MGRemoteQueryClient_consumeData___block_invoke;
  v7[3] = &unk_26485E468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __35__MGRemoteQueryClient_consumeData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _responseAppend:*(void *)(a1 + 40)];
}

- (void)completeWithError:(id)a3
{
  id v4 = a3;
  v5 = [(MGRemoteQueryClient *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__MGRemoteQueryClient_completeWithError___block_invoke;
  v7[3] = &unk_26485E468;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __41__MGRemoteQueryClient_completeWithError___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    goto LABEL_5;
  }
  if (([*(id *)(a1 + 40) processedResult] & 1) == 0) {
    [*(id *)(a1 + 40) _responseComplete];
  }
  if (*(void *)(a1 + 32)) {
LABEL_5:
  }
    objc_msgSend(*(id *)(a1 + 40), "_handleError:");
  v2 = *(void **)(a1 + 40);
  return [v2 _invalidated];
}

- (void)_prepareConnection:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MGRemoteQueryClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MGRemoteQueryClient *)self task];

  if (v6)
  {
    v7 = MGLogForCategory(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [(MGRemoteQueryClient *)self task];
      int v15 = 134218242;
      id v16 = self;
      __int16 v17 = 2112;
      v18 = v8;
      _os_log_error_impl(&dword_229257000, v7, OS_LOG_TYPE_ERROR, "%p client already running %@", (uint8_t *)&v15, 0x16u);
LABEL_10:
    }
  }
  else
  {
    if (![(MGRemoteQueryClient *)self invalidated])
    {
      v7 = [(MGRemoteQueryClient *)self _prepareURL];
      id v8 = [(MGRemoteQueryClient *)self _prepareRequest:v7];
      v9 = [v4 dataTaskWithRequest:v8];
      objc_storeStrong((id *)&self->_task, v9);
      v10 = [(MGRemoteQueryClient *)self target];
      v11 = [v10 endpoint];
      objc_msgSend(v9, "set_hostOverride:", v11);

      [v9 resume];
      id v12 = MGLogForCategory(6);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [(MGRemoteQueryClient *)self handler];
        id v14 = [(MGRemoteQueryClient *)self target];
        int v15 = 134218754;
        id v16 = self;
        __int16 v17 = 2112;
        v18 = v9;
        __int16 v19 = 2112;
        v20 = v13;
        __int16 v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_229257000, v12, OS_LOG_TYPE_DEFAULT, "%p client using %@ for issuing handler %@ to %@", (uint8_t *)&v15, 0x2Au);
      }
      goto LABEL_10;
    }
    v7 = MGLogForCategory(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v15 = 134217984;
      id v16 = self;
      _os_log_error_impl(&dword_229257000, v7, OS_LOG_TYPE_ERROR, "%p client invalidated, not starting", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_handleError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MGRemoteQueryClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if (![(MGRemoteQueryClient *)self invalidated])
  {
    id v6 = [(MGRemoteQueryClient *)self error];

    if (!v6)
    {
      v7 = MGLogForCategory(6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 134218242;
        v9 = self;
        __int16 v10 = 2112;
        id v11 = v4;
        _os_log_error_impl(&dword_229257000, v7, OS_LOG_TYPE_ERROR, "%p client failed, error %@", (uint8_t *)&v8, 0x16u);
      }

      [(MGRemoteQueryClient *)self setError:v4];
      [(MGRemoteQueryClient *)self _invalidate];
    }
  }
}

- (void)_invalidate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (![(MGRemoteQueryClient *)self invalidated])
  {
    objc_super v3 = MGLogForCategory(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(MGRemoteQueryClient *)self error];
      int v6 = 134218242;
      v7 = self;
      __int16 v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_229257000, v3, OS_LOG_TYPE_DEFAULT, "%p client invalidating, error %@", (uint8_t *)&v6, 0x16u);
    }
    [(MGRemoteQueryClient *)self setInvalidated:1];
    v5 = [(MGRemoteQueryClient *)self task];
    [v5 cancel];
  }
}

- (void)_invalidated
{
  objc_super v3 = [(MGRemoteQueryClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(MGRemoteQueryClient *)self delegate];
  if (v5)
  {
    id v4 = [(MGRemoteQueryClient *)self error];
    [v5 clientInvalidated:self withError:v4];
  }
}

- (id)_prepareURL
{
  objc_super v3 = [(MGRemoteQueryClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v4 setScheme:@"https"];
  id v5 = [(MGRemoteQueryClient *)self target];
  int v6 = [v5 endpoint];

  v7 = [NSString stringWithUTF8String:nw_endpoint_get_bonjour_fullname()];
  __int16 v8 = [MEMORY[0x263F08708] URLHostAllowedCharacterSet];
  v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

  uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@"%" withString:@"37"];
  [v4 setHost:v10];
  id v11 = [(MGRemoteQueryClient *)self handler];
  [v11 prepareURL:v4];

  uint64_t v12 = [v4 URL];

  return v12;
}

- (id)_prepareRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(MGRemoteQueryClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = (void *)[objc_alloc(MEMORY[0x263EFC5E8]) initWithURL:v4];
  [v6 setHTTPMethod:@"GET"];
  objc_msgSend(v6, "rq_setProtocolVersion:", -[MGRemoteQueryClient protocolVersion](self, "protocolVersion"));
  objc_msgSend(v6, "rq_setTimeout:", 900);
  v7 = [(MGRemoteQueryClient *)self handler];
  if (objc_opt_respondsToSelector()) {
    [v7 prepareRequest:v6];
  }

  return v6;
}

- (void)_responseStart:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MGRemoteQueryClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if ([(MGRemoteQueryClient *)self invalidated])
  {
    int v6 = MGLogForCategory(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134218242;
      v9 = self;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_debug_impl(&dword_229257000, v6, OS_LOG_TYPE_DEBUG, "%p client invalidated, so disregarding new response %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if ([(MGRemoteQueryClient *)self _responseValidate:v4])
  {
    [(MGRemoteQueryClient *)self setProcessedResult:0];
    [(MGRemoteQueryClient *)self setResponse:v4];
    int v6 = [MEMORY[0x263EFF990] data];
    [(MGRemoteQueryClient *)self setPayload:v6];
  }
  else
  {
    v7 = MGLogForCategory(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 134218242;
      v9 = self;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_error_impl(&dword_229257000, v7, OS_LOG_TYPE_ERROR, "%p client received invalid response %@", (uint8_t *)&v8, 0x16u);
    }

    int v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:94 userInfo:0];
    [(MGRemoteQueryClient *)self _handleError:v6];
  }
}

- (BOOL)_responseValidate:(id)a3
{
  id v4 = a3;
  id v5 = [(MGRemoteQueryClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 statusCode];
  uint64_t v7 = objc_msgSend(v4, "rq_protocolVersion");
  int v9 = [(MGRemoteQueryClient *)self protocolVersion] == v7 && v6 == 200;
  __int16 v10 = [(MGRemoteQueryClient *)self handler];
  if (objc_opt_respondsToSelector()) {
    v9 &= [v10 validateResponse:v4];
  }
  id v11 = [NSString stringWithUTF8String:*MEMORY[0x263F14540]];
  uint64_t v12 = [v4 valueForHTTPHeaderField:v11];

  if (!v9) {
    goto LABEL_14;
  }
  if ([v12 hasPrefix:@"multipart/x-mixed-replace;"]) {
    goto LABEL_16;
  }
  unint64_t v13 = [v4 expectedContentLength];
  if ((v13 & 0x8000000000000000) == 0)
  {
    if (v13 > 0x7D000)
    {
      id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:40 userInfo:0];
      [(MGRemoteQueryClient *)self _handleError:v14];

      goto LABEL_14;
    }
    [(MGRemoteQueryClient *)self setExpectedPayloadSize:v13];
LABEL_16:
    BOOL v15 = 1;
    goto LABEL_17;
  }
LABEL_14:
  BOOL v15 = 0;
LABEL_17:

  return v15;
}

- (void)_responseAppend:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MGRemoteQueryClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if ([(MGRemoteQueryClient *)self invalidated])
  {
    uint64_t v6 = MGLogForCategory(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134218242;
      BOOL v15 = self;
      __int16 v16 = 2112;
      unint64_t v17 = (unint64_t)v4;
      _os_log_debug_impl(&dword_229257000, v6, OS_LOG_TYPE_DEBUG, "%p client invalidated, so disregarding data %@", (uint8_t *)&v14, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v7 = [(MGRemoteQueryClient *)self response];

  if (!v7)
  {
    uint64_t v6 = MGLogForCategory(6);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134218242;
      BOOL v15 = self;
      __int16 v16 = 2112;
      unint64_t v17 = (unint64_t)v4;
      _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p discarding responseless data %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_11;
  }
  int v8 = [(MGRemoteQueryClient *)self payload];
  [v8 appendData:v4];

  int v9 = [(MGRemoteQueryClient *)self payload];
  unint64_t v10 = [v9 length];

  unint64_t v11 = [(MGRemoteQueryClient *)self expectedPayloadSize];
  if (v11 < v10)
  {
    unint64_t v12 = v11;
    unint64_t v13 = MGLogForCategory(6);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134218496;
      BOOL v15 = self;
      __int16 v16 = 2048;
      unint64_t v17 = v10;
      __int16 v18 = 2048;
      unint64_t v19 = v12;
      _os_log_error_impl(&dword_229257000, v13, OS_LOG_TYPE_ERROR, "%p client payload %lu exceeds expectations %lu", (uint8_t *)&v14, 0x20u);
    }

    uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:27 userInfo:0];
    [(MGRemoteQueryClient *)self _handleError:v6];
    goto LABEL_11;
  }
  if (v11 == v10 && ![(MGRemoteQueryClient *)self processedResult]) {
    [(MGRemoteQueryClient *)self _responseComplete];
  }
LABEL_12:
}

- (void)_responseComplete
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_super v3 = [(MGRemoteQueryClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  if (![(MGRemoteQueryClient *)self processedResult])
  {
    [(MGRemoteQueryClient *)self setProcessedResult:1];
    id v4 = (void *)MEMORY[0x263F08900];
    id v5 = [(MGRemoteQueryClient *)self payload];
    id v14 = 0;
    uint64_t v6 = [v4 JSONObjectWithData:v5 options:0 error:&v14];
    id v7 = v14;

    if (v7)
    {
      int v8 = MGLogForCategory(6);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        __int16 v16 = self;
        __int16 v17 = 2112;
        id v18 = v7;
        _os_log_error_impl(&dword_229257000, v8, OS_LOG_TYPE_ERROR, "%p client encountered decoding error %@", buf, 0x16u);
      }

      [(MGRemoteQueryClient *)self _handleError:v7];
    }
    else
    {
      int v9 = [(MGRemoteQueryClient *)self response];
      if (v9 && v6)
      {
        unint64_t v10 = [(MGRemoteQueryClient *)self handler];
        unint64_t v11 = [v10 handleCompleteResponse:v9 jsonPayload:v6];
        unint64_t v12 = MGLogForCategory(6);
        unint64_t v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            __int16 v16 = self;
            __int16 v17 = 2048;
            id v18 = v10;
            __int16 v19 = 2112;
            uint64_t v20 = v11;
            _os_log_error_impl(&dword_229257000, v13, OS_LOG_TYPE_ERROR, "%p client response handling via %p encountered error %@", buf, 0x20u);
          }

          [(MGRemoteQueryClient *)self _handleError:v11];
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            __int16 v16 = self;
            __int16 v17 = 2048;
            id v18 = v10;
            _os_log_debug_impl(&dword_229257000, v13, OS_LOG_TYPE_DEBUG, "%p client response handling via %p succeeded", buf, 0x16u);
          }
        }
      }
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (MGRemoteQueryClientHandlerProtocol)handler
{
  return self->_handler;
}

- (MGRemoteQueryClientTarget)target
{
  return self->_target;
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (MGRemoteQueryClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MGRemoteQueryClientDelegate *)WeakRetained;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_protocolVersion = a3;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (unint64_t)expectedPayloadSize
{
  return self->_expectedPayloadSize;
}

- (void)setExpectedPayloadSize:(unint64_t)a3
{
  self->_expectedPayloadSize = a3;
}

- (NSMutableData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (BOOL)processedResult
{
  return self->_processedResult;
}

- (void)setProcessedResult:(BOOL)a3
{
  self->_processedResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (id)query
{
  v2 = [(MGRemoteQueryClient *)self handler];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = [v2 query];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

@end