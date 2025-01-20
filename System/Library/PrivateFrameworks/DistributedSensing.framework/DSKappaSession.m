@interface DSKappaSession
- (DSKappaSession)init;
- (DSKappaSession)initWithXPCObject:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcConnection;
- (id)_getXPCConnection;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unsigned)coordinationStatus;
- (unsigned)tiebreaker;
- (void)_activate;
- (void)_activateXPC;
- (void)_activateXPCHandleReply:(id)a3;
- (void)_deviceChangedMessage:(id)a3;
- (void)_deviceFoundMessage:(id)a3;
- (void)_deviceLostMessage:(id)a3;
- (void)_handleXPCMessage:(id)a3;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidateXPC;
- (void)_invalidated;
- (void)_updateKappaCoordinationStatus:(unsigned __int8)a3;
- (void)_xpcEventHandler:(id)a3;
- (void)_xpcHandleCompletionBlockReply:(id)a3 error:(id *)a4;
- (void)activateWithCompletion:(id)a3;
- (void)encodeSelf:(id)a3;
- (void)invalidate;
- (void)setCoordinationStatus:(unsigned __int8)a3;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTiebreaker:(unsigned __int8)a3;
- (void)setXpcConnection:(id)a3;
- (void)updateKappaCoordinationStatus:(unsigned __int8)a3;
@end

@implementation DSKappaSession

- (DSKappaSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)DSKappaSession;
  result = [(DSKappaSession *)&v3 init];
  if (result) {
    result->_coordinationStatus = 0;
  }
  return result;
}

- (DSKappaSession)initWithXPCObject:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DSKappaSession;
  v7 = [(DSKappaSession *)&v20 init];
  if (!v7)
  {
    v18 = DSLogObjectForCategory_DSKappaSession();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v19 = "Allocation failed";
    goto LABEL_26;
  }
  if (MEMORY[0x223CBE6A0](v6) != MEMORY[0x263EF8708])
  {
    v18 = DSLogObjectForCategory_DSKappaSession();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v19 = "init with invalid dictionary";
    goto LABEL_26;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "kDSCoordStatus");
  if (uint64 >= 0x100)
  {
    v18 = DSLogObjectForCategory_DSKappaSession();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v19 = "Error decoding coordination status";
    goto LABEL_26;
  }
  unsigned __int8 v9 = uint64;
  if (onceTokenDSKappaSession != -1) {
    dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
  }
  v10 = logObjDSKappaSession;
  if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
  {
    if (v9 > 5u) {
      v11 = "?";
    }
    else {
      v11 = off_2646D4EB0[(char)v9];
    }
    *(_DWORD *)buf = 136315138;
    v22 = v11;
    _os_log_impl(&dword_223BD6000, v10, OS_LOG_TYPE_DEFAULT, "Coordination status %s", buf, 0xCu);
  }
  v7->_coordinationStatus = v9;
  uint64_t v12 = xpc_dictionary_get_uint64(v6, "kDSTiebreaker");
  if (v12 >= 0x100)
  {
    v18 = DSLogObjectForCategory_DSKappaSession();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v19 = "Error decoding coordination status";
LABEL_26:
    _os_log_impl(&dword_223BD6000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
LABEL_27:

    id v16 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:1 userInfo:0];
    if (a4)
    {
      id v16 = v16;
      v15 = 0;
      *a4 = v16;
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v13 = v12;
  if (onceTokenDSKappaSession != -1) {
    dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
  }
  v14 = logObjDSKappaSession;
  if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = (const char *)v13;
    _os_log_impl(&dword_223BD6000, v14, OS_LOG_TYPE_DEFAULT, "Tie breaker: %llu", buf, 0xCu);
  }
  v7->_tiebreaker = v13;
  v15 = v7;
  id v16 = 0;
LABEL_17:

  return v15;
}

- (void)encodeSelf:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = v4;
  if (self->_coordinationStatus)
  {
    xpc_dictionary_set_uint64(v4, "kDSCoordStatus", self->_coordinationStatus);
    id v4 = xdict;
  }
  if (self->_tiebreaker)
  {
    xpc_dictionary_set_uint64(xdict, "kDSTiebreaker", self->_tiebreaker);
    id v4 = xdict;
  }
}

- (void)activateWithCompletion:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (_os_feature_enabled_impl())
  {
    if (v5->_dispatchQueue)
    {
      if (!v5->_shouldActivate)
      {
        v5->_shouldActivate = 1;
        uint64_t v12 = MEMORY[0x223CBE3A0](v4);
        id activateCompletionHandler = v5->_activateCompletionHandler;
        v5->_id activateCompletionHandler = (id)v12;

        dispatchQueue = v5->_dispatchQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __41__DSKappaSession_activateWithCompletion___block_invoke;
        block[3] = &unk_2646D4E18;
        block[4] = v5;
        dispatch_async(dispatchQueue, block);
        goto LABEL_21;
      }
      if (onceTokenDSKappaSession != -1) {
        dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
      }
      id v6 = logObjDSKappaSession;
      if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "Activate already called";
LABEL_19:
        _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      }
    }
    else
    {
      if (onceTokenDSKappaSession != -1) {
        dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
      }
      id v6 = logObjDSKappaSession;
      if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "Dispatch queue not set";
        goto LABEL_19;
      }
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"Unsupported feature";
    unsigned __int8 v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v10 = [v8 errorWithDomain:@"DSErrorDomain" code:5 userInfo:v9];

    if (onceTokenDSKappaSession != -1) {
      dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
    }
    v11 = logObjDSKappaSession;
    if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v11, OS_LOG_TYPE_DEFAULT, "feature flag not enabled", buf, 2u);
    }
    if (v4) {
      v4[2](v4, v10);
    }
  }
LABEL_21:
  objc_sync_exit(v5);
}

uint64_t __41__DSKappaSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSKappaSession != -1) {
    dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
  }
  objc_super v3 = logObjDSKappaSession;
  if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Activate", buf, 2u);
  }
  if (self->_shouldInvalidate)
  {
    if (onceTokenDSKappaSession != -1) {
      dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
    }
    id v4 = logObjDSKappaSession;
    if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "Activate called after invalidate", v8, 2u);
    }
    v5 = (void (**)(void, void))MEMORY[0x223CBE3A0](self->_activateCompletionHandler);
    id activateCompletionHandler = self->_activateCompletionHandler;
    self->_id activateCompletionHandler = 0;

    if (v5)
    {
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:6 userInfo:0];
      ((void (**)(void, void *))v5)[2](v5, v7);
    }
  }
  else
  {
    [(DSKappaSession *)self _activateXPC];
  }
}

- (void)_activateXPC
{
  if (onceTokenDSKappaSession != -1) {
    dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
  }
  objc_super v3 = logObjDSKappaSession;
  if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Activate XPC", buf, 2u);
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  [(DSKappaSession *)self encodeSelf:v4];
  xpc_dictionary_set_string(v4, "kDSXPCMsg", "kDSKappaActivate");
  v5 = [(DSKappaSession *)self _getXPCConnection];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __30__DSKappaSession__activateXPC__block_invoke;
  handler[3] = &unk_2646D4E40;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v5, v4, dispatchQueue, handler);
}

uint64_t __30__DSKappaSession__activateXPC__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCHandleReply:a2];
}

- (void)_activateXPCHandleReply:(id)a3
{
  id v7 = 0;
  [(DSKappaSession *)self _xpcHandleCompletionBlockReply:a3 error:&v7];
  id v4 = v7;
  v5 = (void (**)(void, void))MEMORY[0x223CBE3A0](self->_activateCompletionHandler);
  id activateCompletionHandler = self->_activateCompletionHandler;
  self->_id activateCompletionHandler = 0;

  if (v5) {
    ((void (**)(void, id))v5)[2](v5, v4);
  }
}

- (void)_xpcHandleCompletionBlockReply:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "kDSXPCMsg");
  if (!strcmp(string, "kDSXPCSuccess"))
  {
    if (onceTokenDSKappaSession != -1) {
      dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
    }
    v8 = logObjDSKappaSession;
    if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "Activated", (uint8_t *)&v15, 2u);
    }
    id v7 = 0;
    goto LABEL_23;
  }
  if (strcmp(string, "kDSXPCError"))
  {
    id v7 = 0;
    if (!a4) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  unsigned __int8 v9 = xpc_dictionary_get_value(v5, "kDSXPCErrorData");
  if (MEMORY[0x223CBE6A0]() == MEMORY[0x263EF86F8])
  {
    bytes_ptr = (void *)xpc_data_get_bytes_ptr(v9);
    if (bytes_ptr)
    {
      bytes_ptr = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:bytes_ptr length:xpc_data_get_length(v9)];
      if (bytes_ptr)
      {
        uint64_t v13 = (void *)MEMORY[0x263F08928];
        v14 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
        id v7 = [v13 unarchivedObjectOfClasses:v14 fromData:bytes_ptr error:0];

        if (v7) {
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
    bytes_ptr = 0;
  }
  if (onceTokenDSKappaSession != -1) {
    dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
  }
  v11 = logObjDSKappaSession;
  if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_223BD6000, v11, OS_LOG_TYPE_ERROR, "Error while unarchiving completion block error", (uint8_t *)&v15, 2u);
  }
  id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:1 userInfo:0];
LABEL_17:
  if (onceTokenDSKappaSession != -1) {
    dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
  }
  uint64_t v12 = logObjDSKappaSession;
  if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "Failed to activate with error %@", (uint8_t *)&v15, 0xCu);
  }

  if (a4)
  {
LABEL_22:
    id v7 = v7;
    *a4 = v7;
  }
LABEL_23:
}

- (void)updateKappaCoordinationStatus:(unsigned __int8)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_shouldActivate)
  {
    dispatchQueue = v4->_dispatchQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__DSKappaSession_updateKappaCoordinationStatus___block_invoke;
    v7[3] = &unk_2646D4E90;
    unsigned __int8 v8 = a3;
    v7[4] = v4;
    dispatch_async(dispatchQueue, v7);
  }
  else
  {
    if (onceTokenDSKappaSession != -1) {
      dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
    }
    id v6 = logObjDSKappaSession;
    if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, "Instance not activated", buf, 2u);
    }
  }
  objc_sync_exit(v4);
}

void __48__DSKappaSession_updateKappaCoordinationStatus___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(unsigned __int8 **)(a1 + 32);
  if (v1 == v2[26])
  {
    if (onceTokenDSKappaSession != -1) {
      dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
    }
    objc_super v3 = logObjDSKappaSession;
    if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Already updated", v4, 2u);
    }
  }
  else
  {
    objc_msgSend(v2, "_updateKappaCoordinationStatus:");
  }
}

- (void)_updateKappaCoordinationStatus:(unsigned __int8)a3
{
  if (self->_shouldInvalidate)
  {
    if (onceTokenDSKappaSession != -1) {
      dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
    }
    objc_super v3 = logObjDSKappaSession;
    if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Update called after invalidate", buf, 2u);
    }
  }
  else
  {
    self->_coordinationStatus = a3;
    xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
    [(DSKappaSession *)self encodeSelf:xdict];
    xpc_dictionary_set_string(xdict, "kDSXPCMsg", "kDSKappaUpdate");
    id v5 = [(DSKappaSession *)self _getXPCConnection];
    xpc_connection_send_message(v5, xdict);
  }
}

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  dispatchQueue = v2->_dispatchQueue;
  if (dispatchQueue)
  {
    if (!v2->_shouldInvalidate)
    {
      v2->_shouldInvalidate = 1;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __28__DSKappaSession_invalidate__block_invoke;
      block[3] = &unk_2646D4E18;
      block[4] = v2;
      dispatch_async(dispatchQueue, block);
      goto LABEL_13;
    }
    if (onceTokenDSKappaSession != -1) {
      dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
    }
    id v4 = logObjDSKappaSession;
    if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v5 = "Invalidate already called";
LABEL_11:
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }
  else
  {
    if (onceTokenDSKappaSession != -1) {
      dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
    }
    id v4 = logObjDSKappaSession;
    if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v5 = "Dispatch queue not set";
      goto LABEL_11;
    }
  }
LABEL_13:
  objc_sync_exit(v2);
}

uint64_t __28__DSKappaSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (onceTokenDSKappaSession != -1) {
    dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
  }
  objc_super v3 = logObjDSKappaSession;
  if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate", v4, 2u);
  }
  [(DSKappaSession *)self _invalidateXPC];
  [(DSKappaSession *)self _invalidated];
}

- (id)_getXPCConnection
{
  v2 = self;
  objc_sync_enter(v2);
  xpc_connection_t mach_service = v2->_xpcConnection;
  if (!mach_service)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.distributedsensingd", (dispatch_queue_t)v2->_dispatchQueue, 0);
    objc_storeStrong((id *)&v2->_xpcConnection, mach_service);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __35__DSKappaSession__getXPCConnection__block_invoke;
    handler[3] = &unk_2646D4E40;
    handler[4] = v2;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(mach_service);
  }
  objc_sync_exit(v2);

  return mach_service;
}

uint64_t __35__DSKappaSession__getXPCConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _xpcEventHandler:a2];
}

- (void)_invalidateXPC
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj->_xpcConnection;
  objc_super v3 = v2;
  if (v2) {
    xpc_connection_cancel(v2);
  }
  xpcConnection = obj->_xpcConnection;
  obj->_xpcConnection = 0;

  objc_sync_exit(obj);
}

- (void)_invalidated
{
  if (!self->_invalidateFinished)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id v4 = self;
    objc_sync_enter(v4);
    if (v4->_xpcConnection)
    {
      if (onceTokenDSKappaSession != -1) {
        dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
      }
      id v5 = logObjDSKappaSession;
      if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_ERROR, "XPC connection not cleaned", buf, 2u);
      }
      objc_sync_exit(v4);
    }
    else
    {
      objc_sync_exit(v4);

      v4->_shouldInvalidate = 1;
      id interruptionHandler = v4->_interruptionHandler;
      v4->_id interruptionHandler = 0;

      id v7 = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      self->_invalidateFinished = 1;
      if (onceTokenDSKappaSession != -1) {
        dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
      }
      unsigned __int8 v8 = logObjDSKappaSession;
      if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned __int8 v9 = 0;
        _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "DSKappaSession Invalidated", v9, 2u);
      }
    }
  }
}

- (void)_interrupted
{
  id interruptionHandler = (void (**)(id, SEL))self->_interruptionHandler;
  if (interruptionHandler)
  {
    interruptionHandler[2](interruptionHandler, a2);
    id v4 = self->_interruptionHandler;
  }
  else
  {
    id v4 = 0;
  }
  self->_id interruptionHandler = 0;

  if (onceTokenDSKappaSession != -1) {
    dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
  }
  id v5 = logObjDSKappaSession;
  if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_DEFAULT, "DSKappaSession Interrupted", v6, 2u);
  }
}

- (void)_xpcEventHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4 == (id)MEMORY[0x263EF86A8])
  {
    if (!self->_shouldInvalidate)
    {
      if (onceTokenDSKappaSession != -1) {
        dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
      }
      unsigned __int8 v8 = (void *)logObjDSKappaSession;
      if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v9 = v8;
        int v12 = 136315138;
        uint64_t v13 = xpc_connection_copy_invalidation_reason();
        _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_ERROR, "XPC Connection Invalidated for reason: %s", (uint8_t *)&v12, 0xCu);
      }
    }
    v10 = self;
    objc_sync_enter(v10);
    xpcConnection = v10->_xpcConnection;
    v10->_xpcConnection = 0;

    objc_sync_exit(v10);
    [(DSKappaSession *)v10 _invalidated];
  }
  else if (v4 == (id)MEMORY[0x263EF86A0])
  {
    [(DSKappaSession *)self _interrupted];
  }
  else if (MEMORY[0x223CBE6A0](v4) == MEMORY[0x263EF8708])
  {
    [(DSKappaSession *)self _handleXPCMessage:v5];
  }
  else
  {
    if (onceTokenDSKappaSession != -1) {
      dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
    }
    id v6 = (void *)logObjDSKappaSession;
    if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      int v12 = 136315138;
      uint64_t v13 = MEMORY[0x223CBE5A0](v5);
      _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_ERROR, "Invalid XPC Message :%s", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_handleXPCMessage:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "kDSXPCMsg");
  if (string)
  {
    id v6 = string;
    if (!strcmp(string, "kDSXPCDeviceFound"))
    {
      if (onceTokenDSKappaSession != -1) {
        dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
      }
      v10 = logObjDSKappaSession;
      if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_223BD6000, v10, OS_LOG_TYPE_DEFAULT, "Device Found XPC Message", v16, 2u);
      }
      [(DSKappaSession *)self _deviceFoundMessage:v4];
    }
    else if (!strcmp(v6, "kDSXPCDeviceChanged"))
    {
      if (onceTokenDSKappaSession != -1) {
        dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
      }
      v11 = logObjDSKappaSession;
      if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v15 = 0;
        _os_log_impl(&dword_223BD6000, v11, OS_LOG_TYPE_DEFAULT, "Device Changed XPC Message", v15, 2u);
      }
      [(DSKappaSession *)self _deviceChangedMessage:v4];
    }
    else if (!strcmp(v6, "kDSXPCDeviceLost"))
    {
      if (onceTokenDSKappaSession != -1) {
        dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
      }
      int v12 = logObjDSKappaSession;
      if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "Device Lost XPC Message", v14, 2u);
      }
      [(DSKappaSession *)self _deviceLostMessage:v4];
    }
    else
    {
      if (onceTokenDSKappaSession != -1) {
        dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
      }
      id v7 = logObjDSKappaSession;
      if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = 0;
        unsigned __int8 v8 = "Unhandled message from distributedsensingd";
        unsigned __int8 v9 = (uint8_t *)&v13;
LABEL_13:
        _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
      }
    }
  }
  else
  {
    if (onceTokenDSKappaSession != -1) {
      dispatch_once(&onceTokenDSKappaSession, &__block_literal_global_1);
    }
    id v7 = logObjDSKappaSession;
    if (os_log_type_enabled((os_log_t)logObjDSKappaSession, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v8 = "No Message type in XPC";
      unsigned __int8 v9 = buf;
      goto LABEL_13;
    }
  }
}

- (void)_deviceFoundMessage:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v11 = 0;
  id v6 = [[DSDeviceContext alloc] initWithXPCObject:v5 error:&v11];

  id v7 = v11;
  if (v6)
  {
    deviceFoundHandler = (void (**)(id, DSDeviceContext *))self->_deviceFoundHandler;
    if (deviceFoundHandler) {
      deviceFoundHandler[2](deviceFoundHandler, v6);
    }
  }
  else
  {
    unsigned __int8 v9 = DSLogObjectForCategory_DSKappaSession();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_ERROR, "Error decoding device context", v10, 2u);
    }
  }
}

- (void)_deviceChangedMessage:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v11 = 0;
  id v6 = [[DSDeviceContext alloc] initWithXPCObject:v5 error:&v11];

  id v7 = v11;
  if (v6)
  {
    deviceChangedHandler = (void (**)(id, DSDeviceContext *))self->_deviceChangedHandler;
    if (deviceChangedHandler) {
      deviceChangedHandler[2](deviceChangedHandler, v6);
    }
  }
  else
  {
    unsigned __int8 v9 = DSLogObjectForCategory_DSKappaSession();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_ERROR, "Error decoding device context", v10, 2u);
    }
  }
}

- (void)_deviceLostMessage:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v11 = 0;
  id v6 = [[DSDeviceContext alloc] initWithXPCObject:v5 error:&v11];

  id v7 = v11;
  if (v6)
  {
    deviceLostHandler = (void (**)(id, DSDeviceContext *))self->_deviceLostHandler;
    if (deviceLostHandler) {
      deviceLostHandler[2](deviceLostHandler, v6);
    }
  }
  else
  {
    unsigned __int8 v9 = DSLogObjectForCategory_DSKappaSession();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_ERROR, "Error decoding winner context", v10, 2u);
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (unsigned)coordinationStatus
{
  return self->_coordinationStatus;
}

- (void)setCoordinationStatus:(unsigned __int8)a3
{
  self->_coordinationStatus = a3;
}

- (unsigned)tiebreaker
{
  return self->_tiebreaker;
}

- (void)setTiebreaker:(unsigned __int8)a3
{
  self->_tiebreaker = a3;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_activateCompletionHandler, 0);
}

@end