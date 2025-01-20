@interface MGRemoteQueryServerTransaction
- (BOOL)_requestValidate;
- (MGRemoteQueryServerHandlerProtocol)handler;
- (MGRemoteQueryServerTransaction)initWithConnection:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5;
- (MGRemoteQueryServerTransactionDelegate)delegate;
- (NSError)error;
- (NSURLRequest)request;
- (OS_dispatch_queue)dispatchQueue;
- (OS_nw_connection)connection;
- (OS_nw_content_context)responseContext;
- (OS_os_transaction)transaction;
- (id)_handlerForRequest:(id)a3;
- (id)description;
- (unint64_t)state;
- (void)_delegateNotifyActivityOccurred;
- (void)_delegateNotifyInvalidated;
- (void)_delegateNotifyTimeoutInterval:(unint64_t)a3;
- (void)_handleError:(id)a3;
- (void)_handleNWError:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_prepareConnection;
- (void)_requestParse:(id)a3;
- (void)_requestProcess:(id)a3;
- (void)_requestRead;
- (void)_responseAppend:(id)a3;
- (void)_responseEnd;
- (void)_responseHandlePayloadFromHandler:(id)a3 error:(id)a4;
- (void)_responseObtainPayloadFromHandler;
- (void)_responseStart;
- (void)_updateState:(unint64_t)a3;
- (void)dealloc;
- (void)setError:(id)a3;
- (void)setHandler:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponseContext:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MGRemoteQueryServerTransaction

- (MGRemoteQueryServerTransaction)initWithConnection:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MGRemoteQueryServerTransaction;
  v12 = [(MGRemoteQueryServerTransaction *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v13->_dispatchQueue, a5);
    objc_storeStrong((id *)&v13->_connection, a3);
    error = v13->_error;
    v13->_state = 0;
    v13->_error = 0;

    handler = v13->_handler;
    v13->_handler = 0;

    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.MediaGroups.RemoteQuery.Server-Transaction-%llu", nw_connection_get_id());
    id v16 = objc_claimAutoreleasedReturnValue();
    [v16 UTF8String];
    uint64_t v17 = os_transaction_create();
    transaction = v13->_transaction;
    v13->_transaction = (OS_os_transaction *)v17;

    v19 = [(MGRemoteQueryServerTransaction *)v13 dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__MGRemoteQueryServerTransaction_initWithConnection_delegate_dispatchQueue___block_invoke;
    block[3] = &unk_26485E378;
    v22 = v13;
    dispatch_async(v19, block);
  }
  return v13;
}

uint64_t __76__MGRemoteQueryServerTransaction_initWithConnection_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState:1];
}

- (void)dealloc
{
  [(MGRemoteQueryServerTransaction *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryServerTransaction;
  [(MGRemoteQueryServerTransaction *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(MGRemoteQueryServerTransaction *)self state];
  v7 = [(MGRemoteQueryServerTransaction *)self connection];
  v8 = [(MGRemoteQueryServerTransaction *)self handler];
  id v9 = [v3 stringWithFormat:@"<%@: %p, _state = %lu, _connection = %@, _handler = %@>", v5, self, v6, v7, v8];

  return v9;
}

- (void)_updateState:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [(MGRemoteQueryServerTransaction *)self state];
  v7 = MGLogForCategory(5);
  v8 = v7;
  if (v6 >= a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218496;
      v13 = self;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2048;
      unint64_t v17 = [(MGRemoteQueryServerTransaction *)self state];
      id v9 = "%p transaction invalid state change to %lu from %lu";
      id v10 = v8;
      uint32_t v11 = 32;
LABEL_16:
      _os_log_error_impl(&dword_229257000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, v11);
    }
LABEL_7:
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134218496;
      v13 = self;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2048;
      unint64_t v17 = [(MGRemoteQueryServerTransaction *)self state];
      _os_log_debug_impl(&dword_229257000, v8, OS_LOG_TYPE_DEBUG, "%p transaction advancing to state %lu from %lu", (uint8_t *)&v12, 0x20u);
    }

    [(MGRemoteQueryServerTransaction *)self setState:a3];
    switch(a3)
    {
      case 1uLL:
        [(MGRemoteQueryServerTransaction *)self _prepareConnection];
        break;
      case 2uLL:
        [(MGRemoteQueryServerTransaction *)self _requestRead];
        break;
      case 3uLL:
        [(MGRemoteQueryServerTransaction *)self _responseStart];
        break;
      case 4uLL:
        [(MGRemoteQueryServerTransaction *)self _invalidate];
        break;
      case 5uLL:
        [(MGRemoteQueryServerTransaction *)self _invalidated];
        break;
      default:
        v8 = MGLogForCategory(5);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        int v12 = 134218240;
        v13 = self;
        __int16 v14 = 2048;
        unint64_t v15 = a3;
        id v9 = "%p transaction unexpected state change %lu";
        id v10 = v8;
        uint32_t v11 = 22;
        goto LABEL_16;
    }
  }
}

- (void)_prepareConnection
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_super v3 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__5;
  unint64_t v15 = __Block_byref_object_dispose__5;
  id v16 = [(MGRemoteQueryServerTransaction *)self connection];
  v4 = v12[5];
  v5 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  nw_connection_set_queue(v4, v5);

  unint64_t v6 = v12[5];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __52__MGRemoteQueryServerTransaction__prepareConnection__block_invoke;
  handler[3] = &unk_26485E3A0;
  objc_copyWeak(&v10, &location);
  handler[4] = &v11;
  nw_connection_set_state_changed_handler(v6, handler);
  v7 = MGLogForCategory(5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = v12[5];
    *(_DWORD *)buf = 134218242;
    v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_debug_impl(&dword_229257000, v7, OS_LOG_TYPE_DEBUG, "%p transaction accepting connection %@", buf, 0x16u);
  }

  nw_connection_start((nw_connection_t)v12[5]);
  objc_destroyWeak(&v10);
  _Block_object_dispose(&v11, 8);

  objc_destroyWeak(&location);
}

void __52__MGRemoteQueryServerTransaction__prepareConnection__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v6 = WeakRetained;
  switch(a2)
  {
    case 5:
      [WeakRetained _updateState:5];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0;

      break;
    case 4:
      if (v10)
      {
        objc_msgSend(WeakRetained, "_handleNWError:");
      }
      else
      {
        id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:57 userInfo:0];
        [v6 _handleError:v9];
      }
      break;
    case 3:
      [WeakRetained _updateState:2];
      break;
  }
}

- (void)_handleError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if ([(MGRemoteQueryServerTransaction *)self state] <= 3)
  {
    unint64_t v6 = MGLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134218242;
      uint64_t v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p transaction failed, error %@", (uint8_t *)&v7, 0x16u);
    }

    [(MGRemoteQueryServerTransaction *)self setError:v4];
    [(MGRemoteQueryServerTransaction *)self _updateState:4];
  }
}

- (void)_handleNWError:(id)a3
{
  id v4 = a3;
  v5 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  CFErrorRef v6 = nw_error_copy_cf_error(v4);
  [(MGRemoteQueryServerTransaction *)self _handleError:v6];
}

- (void)_invalidate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(MGRemoteQueryServerTransaction *)self state] <= 4)
  {
    objc_super v3 = MGLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(MGRemoteQueryServerTransaction *)self error];
      *(_DWORD *)buf = 134218242;
      uint64_t v13 = self;
      __int16 v14 = 2112;
      unint64_t v15 = v4;
      _os_log_impl(&dword_229257000, v3, OS_LOG_TYPE_DEFAULT, "%p transaction invalidating, error %@", buf, 0x16u);
    }
    [(MGRemoteQueryServerTransaction *)self setHandler:0];
    v5 = [(MGRemoteQueryServerTransaction *)self connection];
    connection = self->_connection;
    self->_connection = 0;

    int v7 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
    uint64_t v8 = [(MGRemoteQueryServerTransaction *)self error];

    if (v5)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __45__MGRemoteQueryServerTransaction__invalidate__block_invoke;
      v9[3] = &unk_26485EA50;
      BOOL v11 = v8 != 0;
      id v10 = v5;
      dispatch_async(v7, v9);
    }
  }
}

void __45__MGRemoteQueryServerTransaction__invalidate__block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(NSObject **)(a1 + 32);
  if (v1) {
    nw_connection_force_cancel(v2);
  }
  else {
    nw_connection_cancel(v2);
  }
}

- (void)_invalidated
{
  objc_super v3 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  [(MGRemoteQueryServerTransaction *)self _delegateNotifyInvalidated];
  [(MGRemoteQueryServerTransaction *)self setTransaction:0];
}

- (void)_requestRead
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v3 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  if ([(MGRemoteQueryServerTransaction *)self state] == 2)
  {
    objc_initWeak((id *)location, self);
    id v4 = [(MGRemoteQueryServerTransaction *)self connection];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __46__MGRemoteQueryServerTransaction__requestRead__block_invoke;
    v6[3] = &unk_26485EA78;
    objc_copyWeak(&v7, (id *)location);
    v6[4] = self;
    nw_connection_receive(v4, 1u, 0x100000u, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v5 = MGLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 134218240;
      *(void *)&location[4] = self;
      __int16 v9 = 2048;
      unint64_t v10 = [(MGRemoteQueryServerTransaction *)self state];
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p transaction not reading in state %lu", location, 0x16u);
    }
  }
}

void __46__MGRemoteQueryServerTransaction__requestRead__block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  __int16 v9 = a2;
  unint64_t v10 = a3;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v13 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained state] != 2)
    {
      unint64_t v15 = MGLogForCategory(5);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v24 = v13;
        __int16 v25 = 2048;
        uint64_t v26 = [v13 state];
        _os_log_error_impl(&dword_229257000, v15, OS_LOG_TYPE_ERROR, "%p transaction discarding read result in state %lu", buf, 0x16u);
      }
      goto LABEL_24;
    }
    [*(id *)(a1 + 32) _delegateNotifyActivityOccurred];
    if (v9 && dispatch_data_get_size(v9))
    {
      __int16 v14 = MGLogForCategory(5);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v24 = v13;
        _os_log_error_impl(&dword_229257000, v14, OS_LOG_TYPE_ERROR, "%p transaction received body payload", buf, 0xCu);
      }

      unint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:40 userInfo:0];
      [v13 _handleError:v15];
      goto LABEL_24;
    }
    if ((a4 & 1) == 0)
    {
      v19 = MGLogForCategory(5);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v24 = v13;
        _os_log_impl(&dword_229257000, v19, OS_LOG_TYPE_DEFAULT, "%p transaction read incomplete, repeating", buf, 0xCu);
      }

      unint64_t v15 = [v13 dispatchQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__MGRemoteQueryServerTransaction__requestRead__block_invoke_12;
      block[3] = &unk_26485E378;
      void block[4] = v13;
      dispatch_async(v15, block);
      goto LABEL_24;
    }
    if (v10)
    {
      uint64_t v16 = nw_protocol_copy_http_definition();
      unint64_t v15 = nw_content_context_copy_protocol_metadata(v10, v16);

      if (v15)
      {
        uint64_t v17 = nw_http_metadata_copy_request();
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          [v13 _requestProcess:v17];
          if (v11) {
            [v13 _handleNWError:v11];
          }
LABEL_23:

LABEL_24:
          goto LABEL_25;
        }
      }
    }
    else
    {
      unint64_t v15 = 0;
    }
    __int16 v20 = MGLogForCategory(5);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v13;
      _os_log_error_impl(&dword_229257000, v20, OS_LOG_TYPE_ERROR, "%p transaction received malformed data", buf, 0xCu);
    }

    uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:100 userInfo:0];
    [v13 _handleError:v21];

    uint64_t v18 = 0;
    goto LABEL_23;
  }
LABEL_25:
}

uint64_t __46__MGRemoteQueryServerTransaction__requestRead__block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestRead];
}

- (void)_requestProcess:(id)a3
{
  [(MGRemoteQueryServerTransaction *)self _requestParse:a3];
  if ([(MGRemoteQueryServerTransaction *)self _requestValidate])
  {
    id v4 = [(MGRemoteQueryServerTransaction *)self request];
    uint64_t v5 = objc_msgSend(v4, "rq_timeout");

    [(MGRemoteQueryServerTransaction *)self _delegateNotifyTimeoutInterval:v5];
    CFErrorRef v6 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__MGRemoteQueryServerTransaction__requestProcess___block_invoke;
    block[3] = &unk_26485E378;
    void block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:94 userInfo:0];
    [(MGRemoteQueryServerTransaction *)self _handleError:v7];
  }
}

uint64_t __50__MGRemoteQueryServerTransaction__requestProcess___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState:3];
}

- (void)_requestParse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = nw_http_request_copy_url();
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = NSURL;
    __int16 v9 = [NSString stringWithUTF8String:v6];
    unint64_t v10 = [v8 URLWithString:v9];

    if (v10)
    {
      id v11 = [MEMORY[0x263EFC5E8] requestWithURL:v10];
    }
    else
    {
      id v11 = 0;
    }
    free(v7);
  }
  else
  {
    unint64_t v10 = 0;
    id v11 = 0;
  }
  id v15 = v11;
  nw_http_request_access_method();
  int v12 = (void *)nw_http_request_copy_header_fields();
  uint64_t v14 = MEMORY[0x263EF8330];
  id v13 = v15;
  nw_http_fields_enumerate();
  -[MGRemoteQueryServerTransaction setRequest:](self, "setRequest:", v13, v14, 3221225472, __48__MGRemoteQueryServerTransaction__requestParse___block_invoke_2, &unk_26485EAC8);
}

void __48__MGRemoteQueryServerTransaction__requestParse___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSString stringWithUTF8String:a2];
  [v2 setHTTPMethod:v3];
}

uint64_t __48__MGRemoteQueryServerTransaction__requestParse___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
  __int16 v9 = (void *)[[NSString alloc] initWithBytes:a4 length:a5 encoding:4];
  [*(id *)(a1 + 32) addValue:v9 forHTTPHeaderField:v8];

  return 1;
}

- (BOOL)_requestValidate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MGRemoteQueryServerTransaction *)self request];
  uint64_t v5 = [v4 HTTPMethod];
  uint64_t v6 = [NSString stringWithUTF8String:*MEMORY[0x263F14558]];
  id v7 = (void *)v6;
  BOOL v8 = v5 && v6 && ![v5 caseInsensitiveCompare:v6];
  BOOL v9 = objc_msgSend(v4, "rq_protocolVersion") == 1 && v8;
  unint64_t v10 = [(MGRemoteQueryServerTransaction *)self _handlerForRequest:v4];
  if (!v10) {
    goto LABEL_14;
  }
  [(MGRemoteQueryServerTransaction *)self setHandler:v10];
  id v11 = MGLogForCategory(5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218242;
    id v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_debug_impl(&dword_229257000, v11, OS_LOG_TYPE_DEBUG, "%p transaction using handler %@", (uint8_t *)&v14, 0x16u);
  }

  if (v9)
  {
    if (objc_opt_respondsToSelector()) {
      char v12 = [v10 validateRequest];
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
LABEL_14:
    char v12 = 0;
  }

  return v12;
}

- (void)_responseStart
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  if ([(MGRemoteQueryServerTransaction *)self state] == 3)
  {
    id v4 = [(MGRemoteQueryServerTransaction *)self responseContext];

    if (!v4)
    {
      BOOL v9 = NSString;
      unint64_t v10 = [(MGRemoteQueryServerTransaction *)self request];
      id v11 = objc_msgSend(v9, "stringWithFormat:", @"%lu", objc_msgSend(v10, "rq_protocolVersion"));

      char v12 = (void *)MEMORY[0x22A6B3590]();
      objc_msgSend(@"no-store, no-transform", "UTF8String");
      nw_http_fields_append();
      [@"x-apple-mediagroups-version" UTF8String];
      uint64_t v5 = v11;
      [v5 UTF8String];
      nw_http_fields_append();
      id v13 = [(MGRemoteQueryServerTransaction *)self handler];
      [v13 prepareResponse:v12];

      well_known = (void *)nw_http_response_create_well_known();
      nw_http_response_set_header_fields();
      metadata_for_response = nw_http_create_metadata_for_response();
      __int16 v16 = nw_content_context_create("response");
      nw_content_context_set_metadata_for_protocol(v16, metadata_for_response);
      [(MGRemoteQueryServerTransaction *)self setResponseContext:v16];
      objc_initWeak((id *)buf, self);
      uint64_t v17 = [(MGRemoteQueryServerTransaction *)self connection];
      completion[0] = MEMORY[0x263EF8330];
      completion[1] = 3221225472;
      completion[2] = __48__MGRemoteQueryServerTransaction__responseStart__block_invoke;
      completion[3] = &unk_26485EAF0;
      objc_copyWeak(&v19, (id *)buf);
      completion[4] = self;
      nw_connection_send(v17, MEMORY[0x263EF8388], v16, 0, completion);

      [(MGRemoteQueryServerTransaction *)self _responseObtainPayloadFromHandler];
      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);

      goto LABEL_9;
    }
    uint64_t v5 = MGLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = self;
      uint64_t v6 = "%p transaction already started response";
      id v7 = v5;
      uint32_t v8 = 12;
LABEL_7:
      _os_log_error_impl(&dword_229257000, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
    }
  }
  else
  {
    uint64_t v5 = MGLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v21 = self;
      __int16 v22 = 2048;
      unint64_t v23 = [(MGRemoteQueryServerTransaction *)self state];
      uint64_t v6 = "%p transaction not starting response in state %lu";
      id v7 = v5;
      uint32_t v8 = 22;
      goto LABEL_7;
    }
  }
LABEL_9:
}

void __48__MGRemoteQueryServerTransaction__responseStart__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained state] == 3)
    {
      [*(id *)(a1 + 32) _delegateNotifyActivityOccurred];
      if (v3) {
        [v5 _handleNWError:v3];
      }
    }
    else
    {
      uint64_t v6 = MGLogForCategory(5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 134218240;
        uint32_t v8 = v5;
        __int16 v9 = 2048;
        uint64_t v10 = [v5 state];
        _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p transaction discarding send result in state %lu", (uint8_t *)&v7, 0x16u);
      }
    }
  }
}

- (void)_responseAppend:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if ([(MGRemoteQueryServerTransaction *)self state] != 3)
  {
    int v7 = MGLogForCategory(5);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)id location = 134218240;
    *(void *)&location[4] = self;
    __int16 v16 = 2048;
    unint64_t v17 = [(MGRemoteQueryServerTransaction *)self state];
    uint64_t v10 = "%p transaction not appending response in state %lu";
    uint64_t v11 = v7;
    uint32_t v12 = 22;
LABEL_9:
    _os_log_error_impl(&dword_229257000, v11, OS_LOG_TYPE_ERROR, v10, location, v12);
    goto LABEL_7;
  }
  uint64_t v6 = [(MGRemoteQueryServerTransaction *)self responseContext];

  if (!v6)
  {
    int v7 = MGLogForCategory(5);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)id location = 134217984;
    *(void *)&location[4] = self;
    uint64_t v10 = "%p transaction has not started response";
    uint64_t v11 = v7;
    uint32_t v12 = 12;
    goto LABEL_9;
  }
  int v7 = [v4 _createDispatchData];
  objc_initWeak((id *)location, self);
  uint32_t v8 = [(MGRemoteQueryServerTransaction *)self connection];
  __int16 v9 = [(MGRemoteQueryServerTransaction *)self responseContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__MGRemoteQueryServerTransaction__responseAppend___block_invoke;
  v13[3] = &unk_26485EAF0;
  objc_copyWeak(&v14, (id *)location);
  v13[4] = self;
  nw_connection_send(v8, v7, v9, 0, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)location);
LABEL_7:
}

void __50__MGRemoteQueryServerTransaction__responseAppend___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained state] == 3)
    {
      [*(id *)(a1 + 32) _delegateNotifyActivityOccurred];
      if (v3) {
        [v5 _handleNWError:v3];
      }
      else {
        [*(id *)(a1 + 32) _responseObtainPayloadFromHandler];
      }
    }
    else
    {
      uint64_t v6 = MGLogForCategory(5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 134218240;
        uint32_t v8 = v5;
        __int16 v9 = 2048;
        uint64_t v10 = [v5 state];
        _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p transaction discarding send append result in state %lu", (uint8_t *)&v7, 0x16u);
      }
    }
  }
}

- (void)_responseEnd
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  if ([(MGRemoteQueryServerTransaction *)self state] == 3)
  {
    id v4 = [(MGRemoteQueryServerTransaction *)self responseContext];

    if (v4)
    {
      uint64_t v5 = [(MGRemoteQueryServerTransaction *)self responseContext];
      nw_content_context_set_is_final(v5, 1);

      objc_initWeak((id *)location, self);
      uint64_t v6 = [(MGRemoteQueryServerTransaction *)self connection];
      int v7 = [(MGRemoteQueryServerTransaction *)self responseContext];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __46__MGRemoteQueryServerTransaction__responseEnd__block_invoke;
      v9[3] = &unk_26485EAF0;
      objc_copyWeak(&v10, (id *)location);
      void v9[4] = self;
      nw_connection_send(v6, MEMORY[0x263EF8388], v7, 1, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak((id *)location);
      return;
    }
    uint32_t v8 = MGLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 134217984;
      *(void *)&location[4] = self;
      _os_log_error_impl(&dword_229257000, v8, OS_LOG_TYPE_ERROR, "%p transaction not ending response when it has not started response", location, 0xCu);
    }
  }
  else
  {
    uint32_t v8 = MGLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 134218240;
      *(void *)&location[4] = self;
      __int16 v12 = 2048;
      unint64_t v13 = [(MGRemoteQueryServerTransaction *)self state];
      _os_log_error_impl(&dword_229257000, v8, OS_LOG_TYPE_ERROR, "%p transaction not ending response in state %lu", location, 0x16u);
    }
  }
}

void __46__MGRemoteQueryServerTransaction__responseEnd__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained state] == 3)
    {
      [*(id *)(a1 + 32) _delegateNotifyActivityOccurred];
      if (v3) {
        [v5 _handleNWError:v3];
      }
      else {
        [*(id *)(a1 + 32) _invalidate];
      }
    }
    else
    {
      uint64_t v6 = MGLogForCategory(5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 134218240;
        uint32_t v8 = v5;
        __int16 v9 = 2048;
        uint64_t v10 = [v5 state];
        _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p transaction discarding send end result in state %lu", (uint8_t *)&v7, 0x16u);
      }
    }
  }
}

- (void)_responseObtainPayloadFromHandler
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  if ([(MGRemoteQueryServerTransaction *)self state] == 3)
  {
    id v4 = [(MGRemoteQueryServerTransaction *)self responseContext];

    if (v4)
    {
      objc_initWeak(&location, self);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      __int16 v12 = __Block_byref_object_copy__25;
      unint64_t v13 = __Block_byref_object_dispose__26;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke;
      v8[3] = &unk_26485EB18;
      objc_copyWeak(&v9, &location);
      id v14 = (id)MEMORY[0x22A6B39E0](v8);
      uint64_t v5 = [(MGRemoteQueryServerTransaction *)self handler];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke_3;
      v7[3] = &unk_26485EB40;
      v7[4] = buf;
      [v5 provideResponseData:v7];

      _Block_object_dispose(buf, 8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
      return;
    }
    uint64_t v6 = MGLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = self;
      _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p transaction not requesting payload without having started response", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = MGLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [(MGRemoteQueryServerTransaction *)self state];
      _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p transaction not requesting payload in state %lu", buf, 0x16u);
    }
  }
}

void __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint32_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke_2;
    block[3] = &unk_26485E5F8;
    void block[4] = v8;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _responseHandlePayloadFromHandler:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __67__MGRemoteQueryServerTransaction__responseObtainPayloadFromHandler__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

- (void)_responseHandlePayloadFromHandler:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint32_t v8 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v8);

  if ([(MGRemoteQueryServerTransaction *)self state] != 3)
  {
    uint64_t v10 = MGLogForCategory(5);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    int v14 = 134218240;
    uint64_t v15 = self;
    __int16 v16 = 2048;
    unint64_t v17 = [(MGRemoteQueryServerTransaction *)self state];
    id v11 = "%p transaction not accepting payload in state %lu";
    id v12 = v10;
    uint32_t v13 = 22;
LABEL_14:
    _os_log_error_impl(&dword_229257000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v14, v13);
    goto LABEL_8;
  }
  id v9 = [(MGRemoteQueryServerTransaction *)self responseContext];

  if (!v9)
  {
    uint64_t v10 = MGLogForCategory(5);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    int v14 = 134217984;
    uint64_t v15 = self;
    id v11 = "%p transaction not accepting payload without having started response";
    id v12 = v10;
    uint32_t v13 = 12;
    goto LABEL_14;
  }
  if (v7)
  {
    [(MGRemoteQueryServerTransaction *)self _handleError:v7];
  }
  else if (v6)
  {
    [(MGRemoteQueryServerTransaction *)self _responseAppend:v6];
  }
  else
  {
    [(MGRemoteQueryServerTransaction *)self _responseEnd];
  }
LABEL_9:
}

- (void)_delegateNotifyTimeoutInterval:(unint64_t)a3
{
  id v5 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MGRemoteQueryServerTransaction *)self delegate];
  if (v6)
  {
    id v7 = v6;
    [v6 transaction:self receivedTimeoutInterval:a3];
    id v6 = v7;
  }
}

- (void)_delegateNotifyActivityOccurred
{
  uint64_t v3 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MGRemoteQueryServerTransaction *)self delegate];
  if (v4)
  {
    id v5 = v4;
    [v4 transactionActivityOccurred:self];
    id v4 = v5;
  }
}

- (void)_delegateNotifyInvalidated
{
  uint64_t v3 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MGRemoteQueryServerTransaction *)self delegate];
  if (v4)
  {
    id v5 = v4;
    [v4 transactionInvalidated:self];
    id v4 = v5;
  }
}

- (id)_handlerForRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MGRemoteQueryServerTransaction *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if (qword_26830F530 != -1) {
    dispatch_once(&qword_26830F530, &__block_literal_global_3);
  }
  id v6 = [v4 URL];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)_MergedGlobals_0;
  uint32_t v8 = (void *)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "urlPath", (void)v16);
        uint32_t v13 = [v6 path];
        int v14 = [v12 isEqual:v13];

        if (v14)
        {
          uint32_t v8 = [v11 handlerForRequest:v4];
          goto LABEL_13;
        }
      }
      uint32_t v8 = (void *)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v8;
}

void __53__MGRemoteQueryServerTransaction__handlerForRequest___block_invoke()
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  int v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = v2;
}

- (MGRemoteQueryServerTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MGRemoteQueryServerTransactionDelegate *)WeakRetained;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (OS_nw_content_context)responseContext
{
  return self->_responseContext;
}

- (void)setResponseContext:(id)a3
{
}

- (MGRemoteQueryServerHandlerProtocol)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_responseContext, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end