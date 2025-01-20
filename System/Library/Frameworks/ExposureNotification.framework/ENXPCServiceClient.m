@interface ENXPCServiceClient
- (ENXPCServiceClient)init;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)testListenerEndpoint;
- (id)_ensureXPCStartedAndReturnError:(id *)a3;
- (id)getXPCConnectionAndReturnError:(id *)a3;
- (void)_invalidateForced:(BOOL)a3;
- (void)_xpcReceivedEvent:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setTestListenerEndpoint:(id)a3;
@end

@implementation ENXPCServiceClient

- (ENXPCServiceClient)init
{
  v4.receiver = self;
  v4.super_class = (Class)ENXPCServiceClient;
  v2 = [(ENXPCServiceClient *)&v4 init];
  if (v2)
  {
    if (DefaultDispatchQueue_onceToken != -1) {
      dispatch_once(&DefaultDispatchQueue_onceToken, &__block_literal_global_1);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)DefaultDispatchQueue_defaultQueue);
  }
  return v2;
}

- (void)dealloc
{
  [(ENXPCServiceClient *)self _invalidateForced:1];
  v3.receiver = self;
  v3.super_class = (Class)ENXPCServiceClient;
  [(ENXPCServiceClient *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)_invalidateForced:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection) {
    xpc_connection_cancel(xpcConnection);
  }
  BOOL invalidated = self->_invalidated;
  self->_BOOL invalidated = 1;
  v8 = self->_xpcConnection;
  self->_xpcConnection = 0;

  os_unfair_lock_unlock(p_lock);
  if (!invalidated
    && !a3
    && gLogCategory__ENXPCServiceClient <= 90
    && (gLogCategory__ENXPCServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (id)getXPCConnectionAndReturnError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(ENXPCServiceClient *)self _ensureXPCStartedAndReturnError:a3];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)_ensureXPCStartedAndReturnError:(id *)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_invalidated)
  {
    if (a3)
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      ENErrorF(10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = 0;
  }
  else
  {
    v5 = self->_xpcConnection;
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      v7 = self->_testListenerEndpoint;
      v8 = v7;
      if (v7)
      {
        v9 = xpc_connection_create_from_endpoint(v7);
        xpc_connection_set_target_queue(v9, (dispatch_queue_t)self->_dispatchQueue);
      }
      else
      {
        v9 = xpc_connection_create("com.apple.ExposureNotificationService", (dispatch_queue_t)self->_dispatchQueue);
      }
      objc_storeStrong((id *)&self->_xpcConnection, v9);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __54__ENXPCServiceClient__ensureXPCStartedAndReturnError___block_invoke;
      handler[3] = &unk_264244D28;
      handler[4] = self;
      v10 = v9;
      v15 = v10;
      xpc_connection_set_event_handler(v10, handler);
      xpc_connection_activate(v10);
      v6 = v10;
    }
  }

  return v6;
}

void *__54__ENXPCServiceClient__ensureXPCStartedAndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[2] == *(void *)(a1 + 40)) {
    return (void *)[result _xpcReceivedEvent:a2];
  }
  return result;
}

- (void)_xpcReceivedEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 != (id)MEMORY[0x263EF86A0])
  {
    id v12 = v4;
    if (v4 == (id)MEMORY[0x263EF86A8])
    {
      id v4 = (id)[(ENXPCServiceClient *)self _invalidateForced:0];
    }
    else
    {
      v6 = CUXPCDecodeNSErrorIfNeeded();
      v7 = v6;
      if (v6)
      {
        id v8 = v6;
      }
      else
      {
        ENErrorF(1);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;

      if (gLogCategory__ENXPCServiceClient <= 90
        && (gLogCategory__ENXPCServiceClient != -1 || _LogCategory_Initialize()))
      {
        v10 = CUPrintNSError();
        v11 = CUPrintXPC();
        LogPrintF_safe();
      }
    }
    goto LABEL_17;
  }
  if (gLogCategory__ENXPCServiceClient <= 90)
  {
    id v12 = v4;
    if (gLogCategory__ENXPCServiceClient != -1 || (id v4 = (id)_LogCategory_Initialize(), v5 = v12, v4))
    {
      id v4 = (id)LogPrintF_safe();
LABEL_17:
      id v5 = v12;
    }
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (OS_xpc_object)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end