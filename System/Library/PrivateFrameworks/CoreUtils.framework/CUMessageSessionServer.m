@interface CUMessageSessionServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CUMessageSession)templateSession;
- (CUMessageSessionServer)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)deregisterRequestHandler;
- (id)invalidationHandler;
- (id)registerRequestHandler;
- (id)sendRequestHandler;
- (void)_connectionInvalidated:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)setDeregisterRequestHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRegisterRequestHandler:(id)a3;
- (void)setSendRequestHandler:(id)a3;
- (void)setTemplateSession:(id)a3;
@end

@implementation CUMessageSessionServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateSession, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong(&self->_sendRequestHandler, 0);
  objc_storeStrong(&self->_deregisterRequestHandler, 0);
  objc_storeStrong(&self->_registerRequestHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)setTemplateSession:(id)a3
{
}

- (CUMessageSession)templateSession
{
  return self->_templateSession;
}

- (void)setSendRequestHandler:(id)a3
{
}

- (id)sendRequestHandler
{
  return self->_sendRequestHandler;
}

- (void)setDeregisterRequestHandler:(id)a3
{
}

- (id)deregisterRequestHandler
{
  return self->_deregisterRequestHandler;
}

- (void)setRegisterRequestHandler:(id)a3
{
}

- (id)registerRequestHandler
{
  return self->_registerRequestHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_connectionInvalidated:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v5 connectionInvalidated];
  [(NSMutableSet *)self->_xpcConnections removeObject:v5];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = objc_alloc_init(CUMessageSessionXPCConnection);
  objc_storeStrong((id *)&v7->_server, self);
  objc_storeStrong((id *)&v7->_dispatchQueue, self->_dispatchQueue);
  objc_storeStrong((id *)&v7->_xpcCnx, a4);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v10 = self->_xpcConnections;
    self->_xpcConnections = v9;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v7];
  [v6 _setQueue:self->_dispatchQueue];
  v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD4DC80];
  [v6 setExportedInterface:v11];

  [v6 setExportedObject:v7];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__CUMessageSessionServer_listener_shouldAcceptNewConnection___block_invoke;
  v20[3] = &unk_1E55BF170;
  v20[4] = self;
  v12 = v7;
  v21 = v12;
  [v6 setInvalidationHandler:v20];
  v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD4D618];
  [v6 setRemoteObjectInterface:v13];

  [v6 resume];
  if (gLogCategory_CUMessageSession <= 20
    && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x14u)))
  {
    uint64_t v14 = [v6 processIdentifier];
    LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionServer listener:shouldAcceptNewConnection:]", 0x14u, (uint64_t)"XPC connection started from %#{pid}\n", v15, v16, v17, v18, v14);
  }

  return 1;
}

uint64_t __61__CUMessageSessionServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionInvalidated:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUMessageSession <= 30
    && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionServer invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v3, v4, v5, v6, v20);
  }
  [(NSXPCListener *)self->_xpcListener invalidate];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = self->_xpcConnections;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        *(unsigned char *)(v13 + 16) = 1;
        objc_msgSend(*(id *)(v13 + 40), "invalidate", (void)v20);
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  [(NSMutableSet *)self->_xpcConnections removeAllObjects];
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    id v16 = self->_invalidationHandler;
  }
  else
  {
    id v16 = 0;
  }
  self->_invalidationHandler = 0;

  id registerRequestHandler = self->_registerRequestHandler;
  self->_id registerRequestHandler = 0;

  deid registerRequestHandler = self->_deregisterRequestHandler;
  self->_deid registerRequestHandler = 0;

  id sendRequestHandler = self->_sendRequestHandler;
  self->_id sendRequestHandler = 0;
}

- (void)activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUMessageSession <= 30
    && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionServer activate]", 0x1Eu, (uint64_t)"Activate\n", v3, v4, v5, v6, v17);
  }
  if (!self->_xpcListener)
  {
    v7 = [MEMORY[0x1E4F29290] anonymousListener];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v7;

    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener resume];
    uint64_t v9 = objc_alloc_init(CUMessageSession);
    templateSession = self->_templateSession;
    self->_templateSession = v9;

    uint64_t v11 = [(NSXPCListener *)self->_xpcListener endpoint];
    [(CUMessageSession *)self->_templateSession setListenerEndpoint:v11];

    v12 = [(CUMessageSession *)self->_templateSession listenerEndpoint];

    if (!v12
      && gLogCategory_CUMessageSession <= 90
      && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionServer activate]", 0x5Au, (uint64_t)"### No XPC endpoint?\n", v13, v14, v15, v16, v19);
    }
  }
}

- (CUMessageSessionServer)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUMessageSessionServer;
  v2 = [(CUMessageSessionServer *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
  }
  return v2;
}

@end