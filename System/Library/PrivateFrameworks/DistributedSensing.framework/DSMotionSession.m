@interface DSMotionSession
- (DSMotionSession)initWithXPCObject:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)dispatchQueue;
- (id)_getXPCConnection;
- (id)deviceChangedHandler;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unsigned)vehicleConfidence;
- (unsigned)vehicleState;
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
- (void)_printCohort;
- (void)_updateVehicleState:(unsigned __int8)a3 confidence:(unsigned __int8)a4;
- (void)_xpcEventHandler:(id)a3;
- (void)_xpcHandleCompletionBlockReply:(id)a3 error:(id *)a4;
- (void)activateWithCompletion:(id)a3;
- (void)encodeSelf:(id)a3;
- (void)invalidate;
- (void)printCohort;
- (void)setDeviceChangedHandler:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setVehicleConfidence:(unsigned __int8)a3;
- (void)setVehicleState:(unsigned __int8)a3;
- (void)updateVehicleState:(unsigned __int8)a3 confidence:(unsigned __int8)a4;
@end

@implementation DSMotionSession

- (DSMotionSession)initWithXPCObject:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DSMotionSession;
  v7 = [(DSMotionSession *)&v20 init];
  if (!v7)
  {
    v18 = DSLogObjectForCategory_DSMotionSession();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v19 = "Allocation failed";
    goto LABEL_26;
  }
  if (MEMORY[0x223CBE6A0](v6) != MEMORY[0x263EF8708])
  {
    v18 = DSLogObjectForCategory_DSMotionSession();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v19 = "init with invalid dictionary";
    goto LABEL_26;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "kDSVehicleState");
  if (uint64 >= 0x100)
  {
    v18 = DSLogObjectForCategory_DSMotionSession();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v19 = "Error decoding vehicle state";
    goto LABEL_26;
  }
  unsigned __int8 v9 = uint64;
  if (onceTokenDSMotionSession != -1) {
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  }
  v10 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    if (v9 > 2u) {
      v11 = "?";
    }
    else {
      v11 = off_2646D53E8[(char)v9];
    }
    *(_DWORD *)buf = 136315138;
    v22 = v11;
    _os_log_impl(&dword_223BD6000, v10, OS_LOG_TYPE_DEFAULT, "Vehicle state : %s", buf, 0xCu);
  }
  v7->_vehicleState = v9;
  uint64_t v12 = xpc_dictionary_get_uint64(v6, "kDSVehicleConfidence");
  if (v12 >= 0x100)
  {
    v18 = DSLogObjectForCategory_DSMotionSession();
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
  if (onceTokenDSMotionSession != -1) {
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  }
  v14 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = (const char *)v13;
    _os_log_impl(&dword_223BD6000, v14, OS_LOG_TYPE_DEFAULT, "Vehicle confidence: %llu", buf, 0xCu);
  }
  v7->_vehicleConfidence = v13;
  v15 = v7;
  id v16 = 0;
LABEL_17:

  return v15;
}

- (void)encodeSelf:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = v4;
  if (self->_vehicleState)
  {
    xpc_dictionary_set_uint64(v4, "kDSVehicleState", self->_vehicleState);
    id v4 = xdict;
  }
  if (self->_vehicleConfidence)
  {
    xpc_dictionary_set_uint64(xdict, "kDSVehicleConfidence", self->_vehicleConfidence);
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
        block[2] = __42__DSMotionSession_activateWithCompletion___block_invoke;
        block[3] = &unk_2646D4E18;
        block[4] = v5;
        dispatch_async(dispatchQueue, block);
        goto LABEL_21;
      }
      if (onceTokenDSMotionSession != -1) {
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      }
      id v6 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "Activate already called";
LABEL_19:
        _os_log_impl(&dword_223BD6000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      }
    }
    else
    {
      if (onceTokenDSMotionSession != -1) {
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      }
      id v6 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
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

    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    v11 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
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

uint64_t __42__DSMotionSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (onceTokenDSMotionSession != -1) {
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  }
  v3 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Activate", buf, 2u);
  }
  if (self->_shouldInvalidate)
  {
    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    id v4 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
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
    [(DSMotionSession *)self _activateXPC];
  }
}

- (void)_activateXPC
{
  if (onceTokenDSMotionSession != -1) {
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  }
  v3 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Activate XPC", buf, 2u);
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  [(DSMotionSession *)self encodeSelf:v4];
  xpc_dictionary_set_string(v4, "kDSXPCMsg", "kDSMotionActivate");
  v5 = [(DSMotionSession *)self _getXPCConnection];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __31__DSMotionSession__activateXPC__block_invoke;
  handler[3] = &unk_2646D4E40;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v5, v4, dispatchQueue, handler);
}

uint64_t __31__DSMotionSession__activateXPC__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCHandleReply:a2];
}

- (void)printCohort
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_shouldActivate)
  {
    dispatchQueue = v2->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__DSMotionSession_printCohort__block_invoke;
    block[3] = &unk_2646D4E18;
    block[4] = v2;
    dispatch_async(dispatchQueue, block);
  }
  else
  {
    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    xpc_object_t v4 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "Instance not activated", buf, 2u);
    }
  }
  objc_sync_exit(v2);
}

uint64_t __30__DSMotionSession_printCohort__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _printCohort];
}

- (void)_printCohort
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  [(DSMotionSession *)self encodeSelf:xdict];
  xpc_dictionary_set_string(xdict, "kDSXPCMsg", "kDSCohortPrint");
  v3 = [(DSMotionSession *)self _getXPCConnection];
  xpc_connection_send_message(v3, xdict);
}

- (void)_activateXPCHandleReply:(id)a3
{
  id v7 = 0;
  [(DSMotionSession *)self _xpcHandleCompletionBlockReply:a3 error:&v7];
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
    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    v8 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
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
  if (onceTokenDSMotionSession != -1) {
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  }
  v11 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_223BD6000, v11, OS_LOG_TYPE_ERROR, "Error while unarchiving completion block error", (uint8_t *)&v15, 2u);
  }
  id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"DSErrorDomain" code:1 userInfo:0];
LABEL_17:
  if (onceTokenDSMotionSession != -1) {
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  }
  uint64_t v12 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
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

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_shouldInvalidate)
  {
    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    v3 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate already called", buf, 2u);
    }
  }
  else
  {
    v2->_shouldInvalidate = 1;
    dispatchQueue = v2->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__DSMotionSession_invalidate__block_invoke;
    block[3] = &unk_2646D4E18;
    block[4] = v2;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v2);
}

uint64_t __29__DSMotionSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (onceTokenDSMotionSession != -1) {
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  }
  v3 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate", v4, 2u);
  }
  [(DSMotionSession *)self _invalidateXPC];
  [(DSMotionSession *)self _invalidated];
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
    handler[2] = __36__DSMotionSession__getXPCConnection__block_invoke;
    handler[3] = &unk_2646D4E40;
    handler[4] = v2;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(mach_service);
  }
  objc_sync_exit(v2);

  return mach_service;
}

uint64_t __36__DSMotionSession__getXPCConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _xpcEventHandler:a2];
}

- (void)_invalidateXPC
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj->_xpcConnection;
  v3 = v2;
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
      if (onceTokenDSMotionSession != -1) {
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      }
      id v5 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
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

      if (onceTokenDSMotionSession != -1) {
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      }
      v8 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned __int8 v9 = 0;
        _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "DSMotionSession Invalidated", v9, 2u);
      }
      self->_invalidateFinished = 1;
    }
  }
}

- (void)_interrupted
{
  if (onceTokenDSMotionSession != -1) {
    dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
  }
  v2 = logObjDSMotionSession;
  if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_223BD6000, v2, OS_LOG_TYPE_DEFAULT, "DSMotionSession Interrupted", v3, 2u);
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
      if (onceTokenDSMotionSession != -1) {
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      }
      v8 = (void *)logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
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
    [(DSMotionSession *)v10 _invalidated];
  }
  else if (v4 == (id)MEMORY[0x263EF86A0])
  {
    [(DSMotionSession *)self _interrupted];
  }
  else if (MEMORY[0x223CBE6A0](v4) == MEMORY[0x263EF8708])
  {
    [(DSMotionSession *)self _handleXPCMessage:v5];
  }
  else
  {
    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    id v6 = (void *)logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
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
      if (onceTokenDSMotionSession != -1) {
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      }
      v10 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_223BD6000, v10, OS_LOG_TYPE_DEFAULT, "Device Found XPC Message", v16, 2u);
      }
      [(DSMotionSession *)self _deviceFoundMessage:v4];
    }
    else if (!strcmp(v6, "kDSXPCDeviceChanged"))
    {
      if (onceTokenDSMotionSession != -1) {
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      }
      v11 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v15 = 0;
        _os_log_impl(&dword_223BD6000, v11, OS_LOG_TYPE_DEFAULT, "Device Changed XPC Message", v15, 2u);
      }
      [(DSMotionSession *)self _deviceChangedMessage:v4];
    }
    else if (!strcmp(v6, "kDSXPCDeviceLost"))
    {
      if (onceTokenDSMotionSession != -1) {
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      }
      int v12 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_223BD6000, v12, OS_LOG_TYPE_DEFAULT, "Device Lost XPC Message", v14, 2u);
      }
      [(DSMotionSession *)self _deviceLostMessage:v4];
    }
    else
    {
      if (onceTokenDSMotionSession != -1) {
        dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
      }
      id v7 = logObjDSMotionSession;
      if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = 0;
        v8 = "Unhandled message from distributedsensingd";
        unsigned __int8 v9 = (uint8_t *)&v13;
LABEL_13:
        _os_log_impl(&dword_223BD6000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
      }
    }
  }
  else
  {
    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    id v7 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v8 = "No Message type in XPC";
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
    unsigned __int8 v9 = DSLogObjectForCategory_DSMotionSession();
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
    unsigned __int8 v9 = DSLogObjectForCategory_DSMotionSession();
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
    unsigned __int8 v9 = DSLogObjectForCategory_DSMotionSession();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_223BD6000, v9, OS_LOG_TYPE_ERROR, "Error decoding winner context", v10, 2u);
    }
  }
}

- (void)updateVehicleState:(unsigned __int8)a3 confidence:(unsigned __int8)a4
{
  id v6 = self;
  objc_sync_enter(v6);
  if (v6->_shouldActivate)
  {
    *(void *)buf = 0;
    __int16 v13 = buf;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    dispatchQueue = v6->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__DSMotionSession_updateVehicleState_confidence___block_invoke;
    block[3] = &unk_2646D53C8;
    unsigned __int8 v10 = a3;
    block[4] = v6;
    void block[5] = buf;
    unsigned __int8 v11 = a4;
    dispatch_async(dispatchQueue, block);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    v8 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "Instance not activated", buf, 2u);
    }
  }
  objc_sync_exit(v6);
}

void __49__DSMotionSession_updateVehicleState_confidence___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v2 + 40) != *(unsigned __int8 *)(a1 + 48))
  {
    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    v3 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v4 = *(char *)(*(void *)(a1 + 32) + 40);
      if (v4 > 2) {
        id v5 = "?";
      }
      else {
        id v5 = off_2646D53E8[v4];
      }
      unint64_t v6 = *(char *)(a1 + 48);
      if (v6 > 2) {
        id v7 = "?";
      }
      else {
        id v7 = off_2646D53E8[v6];
      }
      int v14 = 136315394;
      char v15 = v5;
      __int16 v16 = 2080;
      uint64_t v17 = v7;
      _os_log_impl(&dword_223BD6000, v3, OS_LOG_TYPE_DEFAULT, "Updating Vehicle State from %s to %s", (uint8_t *)&v14, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned __int8 *)(v2 + 41) != *(unsigned __int8 *)(a1 + 49))
  {
    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    v8 = logObjDSMotionSession;
    if (!os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_42;
    }
    unsigned int v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 41);
    if (v9 <= 6)
    {
      if (!*(unsigned char *)(*(void *)(a1 + 32) + 41))
      {
        unsigned __int8 v10 = "lowest";
        goto LABEL_29;
      }
      if (v9 == 4)
      {
        unsigned __int8 v10 = "low-medium";
        goto LABEL_29;
      }
    }
    else
    {
      switch(v9)
      {
        case 7u:
          unsigned __int8 v10 = "medium";
          goto LABEL_29;
        case 0xBu:
          unsigned __int8 v10 = "medium-high";
          goto LABEL_29;
        case 0xFu:
          unsigned __int8 v10 = "highest";
          goto LABEL_29;
      }
    }
    unsigned __int8 v10 = "?";
LABEL_29:
    unsigned int v11 = *(unsigned __int8 *)(a1 + 49);
    if (v11 <= 6)
    {
      if (!*(unsigned char *)(a1 + 49))
      {
        int v12 = "lowest";
        goto LABEL_41;
      }
      if (v11 == 4)
      {
        int v12 = "low-medium";
        goto LABEL_41;
      }
    }
    else
    {
      switch(v11)
      {
        case 7u:
          int v12 = "medium";
          goto LABEL_41;
        case 0xBu:
          int v12 = "medium-high";
          goto LABEL_41;
        case 0xFu:
          int v12 = "highest";
LABEL_41:
          int v14 = 136315394;
          char v15 = v10;
          __int16 v16 = 2080;
          uint64_t v17 = v12;
          _os_log_impl(&dword_223BD6000, v8, OS_LOG_TYPE_DEFAULT, "Updating Vehicle confidence from %s to %s", (uint8_t *)&v14, 0x16u);
LABEL_42:
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_43;
      }
    }
    int v12 = "?";
    goto LABEL_41;
  }
LABEL_43:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) _updateVehicleState:*(unsigned __int8 *)(a1 + 48) confidence:*(unsigned __int8 *)(a1 + 49)];
  }
  else
  {
    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    __int16 v13 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_223BD6000, v13, OS_LOG_TYPE_DEFAULT, "States already updated", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)_updateVehicleState:(unsigned __int8)a3 confidence:(unsigned __int8)a4
{
  if (self->_shouldInvalidate)
  {
    if (onceTokenDSMotionSession != -1) {
      dispatch_once(&onceTokenDSMotionSession, &__block_literal_global_9);
    }
    unint64_t v4 = logObjDSMotionSession;
    if (os_log_type_enabled((os_log_t)logObjDSMotionSession, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "Update called after invalidate", buf, 2u);
    }
  }
  else
  {
    self->_vehicleState = a3;
    self->_vehicleConfidence = a4;
    xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
    [(DSMotionSession *)self encodeSelf:xdict];
    xpc_dictionary_set_string(xdict, "kDSXPCMsg", "kDSMotionUpdate");
    unint64_t v6 = [(DSMotionSession *)self _getXPCConnection];
    xpc_connection_send_message(v6, xdict);
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

- (unsigned)vehicleState
{
  return self->_vehicleState;
}

- (void)setVehicleState:(unsigned __int8)a3
{
  self->_vehicleState = a3;
}

- (unsigned)vehicleConfidence
{
  return self->_vehicleConfidence;
}

- (void)setVehicleConfidence:(unsigned __int8)a3
{
  self->_vehicleConfidence = a3;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong(&self->_activateCompletionHandler, 0);
}

@end