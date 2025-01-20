@interface MSService
- (BOOL)isCanceled;
- (MSService)init;
- (id)_connection;
- (id)_createMessageForService:(id)a3 arguments:(id)a4 index:(int64_t *)a5;
- (id)_createServiceOnQueue:(id)a3;
- (id)_handleMessageSendFailure:(id)a3 message:(id)a4 messageIndex:(int64_t)a5 context:(id *)a6;
- (void)_callServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5;
- (void)_callServicesMethod:(id)a3 arguments:(id)a4 replyHandler:(id)a5;
- (void)_registerConnection:(id)a3 onQueue:(id)a4;
- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)setupResponseConnectionOnQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MSService

uint64_t __17__MSService_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

uint64_t __56__MSService__callServicesMethod_arguments_replyHandler___block_invoke_50(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_callServicesMethod:(id)a3 arguments:(id)a4 replyHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__MSService__callServicesMethod_arguments_replyHandler___block_invoke;
  block[3] = &unk_264243578;
  block[4] = self;
  id v17 = v9;
  id v19 = v11;
  SEL v20 = a2;
  id v18 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(connectionQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_responseListener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);

  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (void)start
{
  __assert_rtn("-[MSService start]", "MSService.m", 94, "_connection == NULL && \"attempt to start connection multiple times.\"");
}

void __56__MSService__callServicesMethod_arguments_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  unint64_t v51 = 0xAAAAAAAAAAAAAAAALL;
  v2 = (id *)(a1 + 32);
  v3 = (void *)[*(id *)(a1 + 32) _createMessageForService:*(void *)(a1 + 40) arguments:*(void *)(a1 + 48) index:&v51];
  if ([*v2 isCanceled])
  {
    v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      unint64_t v6 = v51;
      v7 = *(void **)(v5 + 32);
      id v8 = v3;
      id v9 = (char *)MEMORY[0x2166BBF50]();
      if (v9) {
        id v9 = (char *)[[NSString alloc] initWithBytesNoCopy:v9 length:strlen(v9) encoding:4 freeWhenDone:1];
      }

      *(_DWORD *)buf = 138413058;
      uint64_t v53 = v5;
      __int16 v54 = 2048;
      unint64_t v55 = v6;
      __int16 v56 = 2048;
      v57 = v7;
      __int16 v58 = 2112;
      v59 = v9;
      _os_log_impl(&dword_215471000, v4, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : <connection: %p> canceling enqueued message %@", buf, 0x2Au);
    }
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"MailServices" code:1501 userInfo:0];
  }
  else
  {
    id v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      unint64_t v13 = v51;
      id v14 = *(void **)(v12 + 32);
      id v15 = v3;
      v16 = (char *)MEMORY[0x2166BBF50]();
      if (v16) {
        v16 = (char *)[[NSString alloc] initWithBytesNoCopy:v16 length:strlen(v16) encoding:4 freeWhenDone:1];
      }

      *(_DWORD *)buf = 138413058;
      uint64_t v53 = v12;
      __int16 v54 = 2048;
      unint64_t v55 = v13;
      __int16 v56 = 2048;
      v57 = v14;
      __int16 v58 = 2112;
      v59 = v16;
      _os_log_impl(&dword_215471000, v11, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : <connection: %p> sending message %@", buf, 0x2Au);
    }
    uint64_t v10 = 0;
  }
  unint64_t v17 = 0;
  id v18 = 0;
  while (!(v10 | v17))
  {
    id v19 = (void *)MEMORY[0x2166BBAE0]();
    SEL v20 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(void *)(a1 + 32) + 32), v3);
    uint64_t v21 = MEMORY[0x2166BBFE0]();
    uint64_t v22 = v21;
    if (v21 == MEMORY[0x263EF8720])
    {
      if ([*(id *)(a1 + 32) isCanceled])
      {
        v24 = MFLogGeneral();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v53 = v25;
          __int16 v54 = 2048;
          unint64_t v55 = v51;
          _os_log_impl(&dword_215471000, v24, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : message was canceled", buf, 0x16u);
        }

        uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"MailServices" code:1501 userInfo:0];
        unint64_t v17 = 0;
        v23 = v20;
      }
      else
      {
        v28 = *(void **)(a1 + 32);
        id v50 = v18;
        uint64_t v10 = [v28 _handleMessageSendFailure:v20 message:v3 messageIndex:v51 context:&v50];
        id v29 = v50;

        if (v10)
        {
          v30 = MFLogGeneral();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            uint64_t v37 = *(void *)(a1 + 32);
            unint64_t v38 = v51;
            v45 = *(void **)(v37 + 32);
            v39 = objc_msgSend((id)v10, "ef_publicDescription");
            *(_DWORD *)buf = 138413314;
            uint64_t v53 = v37;
            __int16 v54 = 2048;
            unint64_t v55 = v38;
            __int16 v56 = 2048;
            v57 = v45;
            __int16 v58 = 2048;
            v59 = (char *)v3;
            __int16 v60 = 2114;
            v61 = v39;
            _os_log_error_impl(&dword_215471000, v30, OS_LOG_TYPE_ERROR, "#MailServices %@ (%lld) : <connection: %p> failed to send message <dictionary: %p> %{public}@", buf, 0x34u);
          }
        }
        unint64_t v17 = 0;
        v23 = v20;
        id v18 = v29;
      }
    }
    else
    {
      if (v21 != MEMORY[0x263EF8708])
      {
        v23 = [MEMORY[0x263F08690] currentHandler];
        [v23 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"MSService.m", 318, @"Unknown type (%p) returned in reply to message <dictionary: %p>", v22, v3 object file lineNumber description];
LABEL_17:
        uint64_t v10 = 0;
        unint64_t v17 = (unint64_t)v20;
        goto LABEL_31;
      }
      string = xpc_dictionary_get_string(v20, (const char *)[@"errorDomain" UTF8String]);
      if (string)
      {
        v23 = [NSString stringWithUTF8String:string];
        uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:v23, xpc_dictionary_get_int64(v20, (const char *)objc_msgSend(@"errorCode", "UTF8String")), 0 code userInfo];
        v27 = MFLogGeneral();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v44 = v18;
          uint64_t v34 = *(void *)(a1 + 32);
          unint64_t v35 = v51;
          objc_msgSend((id)v10, "ef_publicDescription");
          v36 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          uint64_t v53 = v34;
          __int16 v54 = 2048;
          unint64_t v55 = v35;
          __int16 v56 = 2048;
          v57 = v3;
          __int16 v58 = 2114;
          v59 = v36;
          _os_log_error_impl(&dword_215471000, v27, OS_LOG_TYPE_ERROR, "#MailServices %@ (%lld) : received error response for message <dictionary: %p>: %{public}@", buf, 0x2Au);

          id v18 = v44;
        }

        unint64_t v17 = 0;
      }
      else
      {
        v23 = MFLogGeneral();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        uint64_t v31 = *(void *)(a1 + 32);
        unint64_t v32 = v51;
        unint64_t v17 = v20;
        v33 = (char *)MEMORY[0x2166BBF50]();
        if (v33) {
          v33 = (char *)[[NSString alloc] initWithBytesNoCopy:v33 length:strlen(v33) encoding:4 freeWhenDone:1];
        }

        *(_DWORD *)buf = 138413058;
        uint64_t v53 = v31;
        __int16 v54 = 2048;
        unint64_t v55 = v32;
        __int16 v56 = 2048;
        v57 = v3;
        __int16 v58 = 2112;
        v59 = v33;
        _os_log_impl(&dword_215471000, v23, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : received reply for message <dictionary: %p>: %@", buf, 0x2Au);

        uint64_t v10 = 0;
      }
    }
LABEL_31:
  }
  v40 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__MSService__callServicesMethod_arguments_replyHandler___block_invoke_50;
  block[3] = &unk_264243550;
  id v41 = *(id *)(a1 + 56);
  id v48 = (id)v10;
  id v49 = v41;
  id v47 = (id)v17;
  id v42 = (id)v10;
  id v43 = (id)v17;
  dispatch_async(v40, block);
}

- (BOOL)isCanceled
{
  return self->_canceled > 0;
}

- (MSService)init
{
  v16.receiver = self;
  v16.super_class = (Class)MSService;
  v2 = [(MSService *)&v16 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.mailservices.%@.%p", objc_opt_class(), v2];
    v4 = (const char *)[v3 UTF8String];
    dispatch_queue_t v5 = dispatch_queue_create(v4, MEMORY[0x263EF83A8]);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v5;

    id v7 = [v3 stringByAppendingString:@".connection"];
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = v2->_connectionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __17__MSService_init__block_invoke;
    block[3] = &unk_264243488;
    id v11 = v2;
    id v15 = v11;
    dispatch_sync(v10, block);
    uint64_t v12 = v11;
  }
  return v2;
}

- (id)_createMessageForService:(id)a3 arguments:(id)a4 index:(int64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t add_explicit = atomic_fetch_add_explicit(&_createMessageForService_arguments_index____messageCount, 1uLL, memory_order_relaxed);
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  uint64_t v12 = (const char *)[@"service" UTF8String];
  id v13 = v8;
  xpc_dictionary_set_string(v11, v12, (const char *)[v13 UTF8String]);
  int64_t v14 = add_explicit + 1;
  xpc_dictionary_set_int64(v11, (const char *)[@"_index" UTF8String], add_explicit + 1);
  if (v9)
  {
    id v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v11, (const char *)[@"arguments" UTF8String], v15);
  }
  if (self->_responseListener) {
    xpc_dictionary_set_connection(v11, (const char *)[@"_anonymousConnection" UTF8String], self->_responseListener);
  }
  if (a5) {
    *a5 = v14;
  }

  return v11;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    v4 = connection;
    xpc_connection_set_event_handler(v4, &__block_literal_global_0);
    xpc_connection_cancel(v4);

    dispatch_queue_t v5 = self->_connection;
    self->_connection = 0;
  }
  responseListener = self->_responseListener;
  if (responseListener)
  {
    id v7 = responseListener;
    xpc_connection_set_event_handler(v7, &__block_literal_global_0);
    xpc_connection_cancel(v7);

    id v8 = self->_responseListener;
    self->_responseListener = 0;
  }
  responseHandler = self->_responseHandler;
  if (responseHandler)
  {
    uint64_t v10 = responseHandler;
    xpc_connection_set_event_handler(v10, &__block_literal_global_0);
    xpc_connection_cancel(v10);

    xpc_object_t v11 = self->_responseHandler;
    self->_responseHandler = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)MSService;
  [(MSService *)&v12 dealloc];
}

- (id)_createServiceOnQueue:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[MSService _createServiceOnQueue:]", "MSService.m", 84, "0 && \"subclass must implement\"");
}

- (id)_connection
{
  return self->_connection;
}

void __18__MSService_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (MEMORY[0x2166BBFE0]() != MEMORY[0x263EF8720]) {
    __assert_rtn("-[MSService start]_block_invoke", "MSService.m", 106, "type == XPC_TYPE_ERROR && \"unexpected message received on connection to server\"");
  }
  if (v3 == (id)MEMORY[0x263EF86A8])
  {
    v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      name = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
      int v9 = 136315138;
      uint64_t v10 = name;
      dispatch_queue_t v5 = "#MailServices Mach service '%s' not found.";
      unint64_t v6 = v4;
      uint32_t v7 = 12;
      goto LABEL_8;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (v3 == (id)MEMORY[0x263EF86A0])
  {
    v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      dispatch_queue_t v5 = "#MailServices Connection interrupted";
      unint64_t v6 = v4;
      uint32_t v7 = 2;
LABEL_8:
      _os_log_impl(&dword_215471000, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v9, v7);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (void)stop
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  if (self->_connection)
  {
    id v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      connection = self->_connection;
      int v7 = 138412546;
      id v8 = self;
      __int16 v9 = 2048;
      uint64_t v10 = connection;
      _os_log_impl(&dword_215471000, v3, OS_LOG_TYPE_INFO, "#MailServices %@ stopping <connection: %p>", (uint8_t *)&v7, 0x16u);
    }

    dispatch_queue_t v5 = self->_connection;
    xpc_connection_set_event_handler(v5, &__block_literal_global_0);
    xpc_connection_cancel(v5);

    unint64_t v6 = self->_connection;
    self->_connection = 0;
  }
}

- (void)cancel
{
  int v2 = 0;
  uint64_t v19 = *MEMORY[0x263EF8340];
  atomic_compare_exchange_strong(&self->_canceled, (unsigned int *)&v2, 1u);
  if (!v2)
  {
    if (self->_connection)
    {
      v4 = MFLogGeneral();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        connection = self->_connection;
        *(_DWORD *)buf = 138412546;
        objc_super v16 = self;
        __int16 v17 = 2048;
        id v18 = connection;
        _os_log_impl(&dword_215471000, v4, OS_LOG_TYPE_INFO, "#MailServices %@ cancelling <connection: %p>", buf, 0x16u);
      }

      unint64_t v6 = self->_connection;
      xpc_connection_set_event_handler(v6, &__block_literal_global_0);
      xpc_connection_cancel(v6);
    }
    if (self->_responseListener)
    {
      int v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        responseListener = self->_responseListener;
        *(_DWORD *)buf = 138412546;
        objc_super v16 = self;
        __int16 v17 = 2048;
        id v18 = responseListener;
        _os_log_impl(&dword_215471000, v7, OS_LOG_TYPE_INFO, "#MailServices %@ stopping response listener <connection: %p>", buf, 0x16u);
      }

      __int16 v9 = self->_responseListener;
      xpc_connection_set_event_handler(v9, &__block_literal_global_0);
      xpc_connection_cancel(v9);
    }
    if (self->_responseHandler)
    {
      uint64_t v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        responseHandler = self->_responseHandler;
        *(_DWORD *)buf = 138412546;
        objc_super v16 = self;
        __int16 v17 = 2048;
        id v18 = responseHandler;
        _os_log_impl(&dword_215471000, v10, OS_LOG_TYPE_INFO, "#MailServices %@ stopping response handler <connection: %p>", buf, 0x16u);
      }

      objc_super v12 = self->_responseHandler;
      xpc_connection_set_event_handler(v12, &__block_literal_global_0);
      xpc_connection_cancel(v12);
    }
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __19__MSService_cancel__block_invoke;
    block[3] = &unk_264243488;
    void block[4] = self;
    dispatch_async(connectionQueue, block);
  }
}

uint64_t __19__MSService_cancel__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[5];
  if (v3)
  {
    v2[5] = 0;

    int v2 = *(void **)(a1 + 32);
  }
  v4 = (void *)v2[6];
  if (v4)
  {
    v2[6] = 0;

    int v2 = *(void **)(a1 + 32);
  }

  return [v2 stop];
}

- (void)setupResponseConnectionOnQueue:(id)a3
{
  dispatch_queue_t v5 = a3;
  xpc_connection_t v6 = xpc_connection_create(0, v5);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__MSService_setupResponseConnectionOnQueue___block_invoke;
  v9[3] = &unk_2642434D8;
  v9[4] = self;
  int v7 = v6;
  uint64_t v10 = v7;
  id v8 = v5;
  uint64_t v11 = v8;
  SEL v12 = a2;
  xpc_connection_set_event_handler(v7, v9);
  objc_storeStrong((id *)&self->_responseListener, v6);
  xpc_connection_resume(self->_responseListener);
}

void __44__MSService_setupResponseConnectionOnQueue___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = MEMORY[0x2166BBFE0]();
  uint64_t v4 = v3;
  if (v3 == MEMORY[0x263EF8720])
  {
    [*(id *)(a1 + 32) responseConnection:*(void *)(a1 + 40) handleError:v10];
  }
  else if (v3 == MEMORY[0x263EF86F0])
  {
    [*(id *)(a1 + 32) _registerConnection:v10 onQueue:*(void *)(a1 + 48)];
  }
  else
  {
    dispatch_queue_t v5 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = v10;
    __int16 v9 = (char *)MEMORY[0x2166BBF50]();
    if (v9) {
      __int16 v9 = (char *)[[NSString alloc] initWithBytesNoCopy:v9 length:strlen(v9) encoding:4 freeWhenDone:1];
    }

    [v5 handleFailureInMethod:v6, v7, @"MSService.m", 184, @"unexpected result type (%p) on listener connection, event = %@", v4, v9 object file lineNumber description];
    [*(id *)(a1 + 32) cancel];
  }
}

- (void)_registerConnection:(id)a3 onQueue:(id)a4
{
  id v8 = (_xpc_connection_s *)a3;
  __int16 v9 = a4;
  p_responseHandler = &self->_responseHandler;
  if (self->_responseHandler)
  {
    SEL v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MSService.m" lineNumber:194 description:@"attempted to register multiple connections on anonymous listener"];
  }
  xpc_connection_set_target_queue(v8, v9);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __41__MSService__registerConnection_onQueue___block_invoke;
  handler[3] = &unk_264243500;
  handler[4] = self;
  uint64_t v11 = v8;
  int64_t v14 = v11;
  SEL v15 = a2;
  xpc_connection_set_event_handler(v11, handler);
  objc_storeStrong((id *)p_responseHandler, a3);
  xpc_connection_resume(*p_responseHandler);
}

void __41__MSService__registerConnection_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = MEMORY[0x2166BBFE0]();
  uint64_t v4 = v3;
  if (v3 == MEMORY[0x263EF8720])
  {
    [*(id *)(a1 + 32) responseConnection:*(void *)(a1 + 40) handleError:v10];
  }
  else if (v3 == MEMORY[0x263EF8708])
  {
    [*(id *)(a1 + 32) responseConnection:*(void *)(a1 + 40) handleResponse:v10];
  }
  else
  {
    dispatch_queue_t v5 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = v10;
    __int16 v9 = (char *)MEMORY[0x2166BBF50]();
    if (v9) {
      __int16 v9 = (char *)[[NSString alloc] initWithBytesNoCopy:v9 length:strlen(v9) encoding:4 freeWhenDone:1];
    }

    [v5 handleFailureInMethod:v6, v7, @"MSService.m", 205, @"unexpected result type (%p) on listener connection, event = %@", v4, v9 object file lineNumber description];
    [*(id *)(a1 + 32) cancel];
  }
}

- (id)_handleMessageSendFailure:(id)a3 message:(id)a4 messageIndex:(int64_t)a5 context:(id *)a6
{
  uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MailServices", 2, 0, a6);

  return v6;
}

- (void)_callServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__MSService__callServicesMethod_arguments_callback___block_invoke;
  v10[3] = &unk_264243528;
  id v11 = v8;
  id v9 = v8;
  [(MSService *)self _callServicesMethod:a3 arguments:a4 replyHandler:v10];
}

void __52__MSService__callServicesMethod_arguments_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    uint64_t v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    uint64_t v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a5;
  id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"MailServices" code:3 userInfo:0];
  v7[2](v7, 0, v8);
  id v9 = MFLogGeneral();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_215471000, v9, OS_LOG_TYPE_INFO, "#MailServices MailServices method %@ could not be simulated", (uint8_t *)&v10, 0xCu);
  }
}

@end