@interface ENXPCServiceListener
+ (id)sharedServiceListener;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcEndpoint;
- (id)_init;
- (id)initAnonymousListener;
- (void)activate;
- (void)connectionInvalidated:(id)a3;
- (void)invalidate;
- (void)main;
- (void)xpcConnectionAccept:(id)a3;
- (void)xpcListenerEvent:(id)a3;
@end

@implementation ENXPCServiceListener

+ (id)sharedServiceListener
{
  if (sharedServiceListener_once != -1) {
    dispatch_once(&sharedServiceListener_once, &__block_literal_global_0);
  }
  v2 = (void *)sharedServiceListener_sharedListener;

  return v2;
}

uint64_t __45__ENXPCServiceListener_sharedServiceListener__block_invoke()
{
  id v0 = [[ENXPCServiceListener alloc] _init];
  uint64_t v1 = sharedServiceListener_sharedListener;
  sharedServiceListener_sharedListener = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)ENXPCServiceListener;
  v2 = [(ENXPCServiceListener *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (id)initAnonymousListener
{
  v2 = [(ENXPCServiceListener *)self _init];
  v3 = v2;
  if (v2)
  {
    xpc_connection_t v4 = xpc_connection_create(0, v2[3]);
    dispatch_queue_t v5 = v3[2];
    v3[2] = (dispatch_queue_t)v4;
  }
  return v3;
}

- (void)activate
{
  v3 = self->_xpcListener;
  if (v3)
  {
    xpc_connection_t v4 = v3;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __32__ENXPCServiceListener_activate__block_invoke;
    handler[3] = &unk_1E69ACB68;
    handler[4] = self;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_activate(v4);
  }
  else
  {
    uint64_t v5 = FatalErrorF();
    __32__ENXPCServiceListener_activate__block_invoke(v5, v6);
  }
}

uint64_t __32__ENXPCServiceListener_activate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) xpcListenerEvent:a2];
}

- (void)invalidate
{
  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    uint64_t v5 = xpcListener;
    xpc_connection_cancel(v5);
    xpc_connection_t v4 = self->_xpcListener;
    self->_xpcListener = 0;
  }
}

- (void)main
{
  if (gLogCategory_ENXPCServiceConnection <= 50
    && (gLogCategory_ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  xpc_main((xpc_connection_handler_t)SharedServiceConnectionHandler);
}

- (void)xpcConnectionAccept:(id)a3
{
  v9 = (_xpc_connection_s *)a3;
  xpc_connection_get_pid(v9);
  if (gLogCategory_ENXPCServiceConnection <= 20
    && (gLogCategory_ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
  {
    v8 = CUPrintPID();
    LogPrintF_safe();
  }
  xpc_connection_t v4 = +[ENXPCServiceConnection connectionWithXPCConnection:serviceListener:dispatchQueue:](ENXPCServiceConnection, "connectionWithXPCConnection:serviceListener:dispatchQueue:", v9, self, self->_dispatchQueue, v8);
  connections = self->_connections;
  if (!connections)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA88]);
    dispatch_queue_t v7 = self->_connections;
    self->_connections = v6;

    connections = self->_connections;
  }
  [(NSMutableSet *)connections addObject:v4];
  [v4 activate];
}

- (OS_xpc_object)xpcEndpoint
{
  xpcListener = self->_xpcListener;
  if (xpcListener) {
    xpcListener = xpc_endpoint_create(xpcListener);
  }

  return xpcListener;
}

- (void)xpcListenerEvent:(id)a3
{
  id v7 = a3;
  uint64_t v4 = MEMORY[0x1D943A770]();
  if (v4 == MEMORY[0x1E4F14578])
  {
    uint64_t v4 = [(ENXPCServiceListener *)self xpcConnectionAccept:v7];
    goto LABEL_7;
  }
  id v5 = v7;
  if (v7 == (id)MEMORY[0x1E4F14528])
  {
    if (gLogCategory_ENXPCServiceConnection <= 30)
    {
      if (gLogCategory_ENXPCServiceConnection != -1 || (uint64_t v4 = _LogCategory_Initialize(), v5 = v7, v4))
      {
        uint64_t v4 = LogPrintF_safe();
        goto LABEL_7;
      }
    }
  }
  else if (gLogCategory__ENXPCServiceConnection <= 90)
  {
    if (gLogCategory__ENXPCServiceConnection != -1 || (uint64_t v4 = _LogCategory_Initialize(), v5 = v7, v4))
    {
      uint64_t v6 = CUPrintXPC();
      LogPrintF_safe();

LABEL_7:
      id v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)connectionInvalidated:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_connections, 0);
}

@end