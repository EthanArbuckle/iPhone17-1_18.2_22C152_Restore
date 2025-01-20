@interface CUXPCAgent
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CUXPCAgent)init;
- (NSString)label;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)connectionEndedHandler;
- (id)connectionStartedHandler;
- (id)exportedObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)_connectionInvalidated:(id)a3;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setConnectionEndedHandler:(id)a3;
- (void)setConnectionStartedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setRemoteObjectInterface:(id)a3;
@end

@implementation CUXPCAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_connectionEndedHandler, 0);
  objc_storeStrong(&self->_connectionStartedHandler, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcCnxSet, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

- (void)setRemoteObjectInterface:(id)a3
{
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (void)setExportedObject:(id)a3
{
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedInterface:(id)a3
{
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (void)setListenerEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (NSString)label
{
  return self->_label;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setConnectionEndedHandler:(id)a3
{
}

- (id)connectionEndedHandler
{
  return self->_connectionEndedHandler;
}

- (void)setConnectionStartedHandler:(id)a3
{
}

- (id)connectionStartedHandler
{
  return self->_connectionStartedHandler;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  xpcCnx = self->_xpcCnx;
  if (!xpcCnx)
  {
    if ((unint64_t)[(NSMutableSet *)self->_xpcCnxSet count] >= 2)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
            goto LABEL_8;
          }
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent remoteObjectProxyWithErrorHandler:]", 0x3Cu, (uint64_t)"### Multiple connections...using arbitrary one\n", v7, v8, v9, v10, v15);
      }
    }
LABEL_8:
    uint64_t v12 = [(NSMutableSet *)self->_xpcCnxSet anyObject];
    v13 = (void *)v12;
    if (v12)
    {
      v6 = [*(id *)(v12 + 24) remoteObjectProxyWithErrorHandler:v4];
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_12;
  }
  v6 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v4];
LABEL_12:

  return v6;
}

- (id)remoteObjectProxy
{
  xpcCnx = self->_xpcCnx;
  if (!xpcCnx)
  {
    if ((unint64_t)[(NSMutableSet *)self->_xpcCnxSet count] >= 2)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 60)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
            goto LABEL_8;
          }
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent remoteObjectProxy]", 0x3Cu, (uint64_t)"### Multiple connections...using arbitrary one\n", v5, v6, v7, v8, v13);
      }
    }
LABEL_8:
    uint64_t v10 = [(NSMutableSet *)self->_xpcCnxSet anyObject];
    v11 = (void *)v10;
    if (v10)
    {
      id v4 = [*(id *)(v10 + 24) remoteObjectProxy];
    }
    else
    {
      id v4 = 0;
    }

    goto LABEL_12;
  }
  id v4 = [(NSXPCConnection *)xpcCnx remoteObjectProxy];
LABEL_12:
  return v4;
}

- (void)_connectionInvalidated:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [v5 connectionInvalidated];
  [(NSMutableSet *)self->_xpcCnxSet removeObject:v5];
  connectionEndedHandler = (void (**)(id, id))self->_connectionEndedHandler;
  if (connectionEndedHandler) {
    connectionEndedHandler[2](connectionEndedHandler, v5);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v7 = objc_alloc_init(CUXPCAgentConnection);
  objc_storeStrong((id *)&v7->_agent, self);
  objc_storeStrong((id *)&v7->_dispatchQueue, self->_dispatchQueue);
  objc_storeStrong((id *)&v7->_xpcCnx, a4);
  xpcCnxSet = self->_xpcCnxSet;
  if (!xpcCnxSet)
  {
    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v10 = self->_xpcCnxSet;
    self->_xpcCnxSet = v9;

    xpcCnxSet = self->_xpcCnxSet;
  }
  [(NSMutableSet *)xpcCnxSet addObject:v7];
  [v6 _setQueue:self->_dispatchQueue];
  [v6 setExportedInterface:self->_exportedInterface];
  [v6 setExportedObject:self->_exportedObject];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__CUXPCAgent_listener_shouldAcceptNewConnection___block_invoke;
  v20[3] = &unk_1E55BF170;
  v20[4] = self;
  v11 = v7;
  v21 = v11;
  [v6 setInvalidationHandler:v20];
  [v6 setRemoteObjectInterface:self->_remoteObjectInterface];
  [v6 resume];
  ucat = self->_ucat;
  if (ucat->var0 <= 20)
  {
    if (ucat->var0 != -1)
    {
LABEL_5:
      uint64_t v13 = [v6 processIdentifier];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent listener:shouldAcceptNewConnection:]", 0x14u, (uint64_t)"XPC connection started from %#{pid}\n", v14, v15, v16, v17, v13);
      goto LABEL_7;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x14u))
    {
      ucat = self->_ucat;
      goto LABEL_5;
    }
  }
LABEL_7:
  connectionStartedHandler = (void (**)(id, id))self->_connectionStartedHandler;
  if (connectionStartedHandler) {
    connectionStartedHandler[2](connectionStartedHandler, v11);
  }

  return 1;
}

uint64_t __49__CUXPCAgent_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionInvalidated:*(void *)(a1 + 40)];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone) {
    return;
  }
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu)) {
          goto LABEL_7;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent _invalidated]", 0x3Cu, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v18);
    }
  }
LABEL_7:
  if (!self->_xpcCnx && !self->_xpcListener)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id connectionStartedHandler = self->_connectionStartedHandler;
    self->_id connectionStartedHandler = 0;

    id connectionEndedHandler = self->_connectionEndedHandler;
    self->_id connectionEndedHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v12 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    listenerEndpoint = self->_listenerEndpoint;
    self->_listenerEndpoint = 0;

    exportedInterface = self->_exportedInterface;
    self->_exportedInterface = 0;

    id exportedObject = self->_exportedObject;
    self->_id exportedObject = 0;

    remoteObjectInterface = self->_remoteObjectInterface;
    self->_remoteObjectInterface = 0;

    uint64_t v17 = self->_exportedInterface;
    self->_exportedInterface = 0;

    self->_invalidateDone = 1;
  }
}

- (void)_invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_invalidateCalled) {
    return;
  }
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_6;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v15);
  }
LABEL_6:
  [(NSXPCListener *)self->_xpcListener invalidate];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = (void *)[(NSMutableSet *)self->_xpcCnxSet copy];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [(CUXPCAgent *)self _connectionInvalidated:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  [(NSMutableSet *)self->_xpcCnxSet removeAllObjects];
  xpcCnxSet = self->_xpcCnxSet;
  self->_xpcCnxSet = 0;

  [(NSXPCConnection *)self->_xpcCnx invalidate];
  [(CUXPCAgent *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__CUXPCAgent_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __24__CUXPCAgent_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent _interrupted]", 0x1Eu, (uint64_t)"Interrupted\n", v3, v4, v5, v6, v10);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    uint64_t v9 = (void (*)(void))*((void *)interruptionHandler + 2);
    v9();
  }
}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate\n", v3, v4, v5, v6, v28[0]);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v16 = self->_listenerEndpoint;
  if (v16)
  {
    if (!self->_xpcCnx)
    {
      long long v17 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v16];
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = v17;

      [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
      [(NSXPCConnection *)self->_xpcCnx setExportedInterface:self->_exportedInterface];
      [(NSXPCConnection *)self->_xpcCnx setExportedObject:self->_exportedObject];
      [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:self->_remoteObjectInterface];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __43__CUXPCAgent_activateDirectAndReturnError___block_invoke;
      v29[3] = &unk_1E55BFC18;
      v29[4] = self;
      [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v29];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = (uint64_t)__43__CUXPCAgent_activateDirectAndReturnError___block_invoke_2;
      v28[3] = (uint64_t)&unk_1E55BFC18;
      v28[4] = (uint64_t)self;
      [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v28];
      [(NSXPCConnection *)self->_xpcCnx resume];
LABEL_10:
      BOOL v23 = 0;
      id v24 = 0;
      goto LABEL_11;
    }
  }
  else if (!self->_xpcListener)
  {
    v19 = [MEMORY[0x1E4F29290] anonymousListener];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v19;

    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener resume];
    v21 = [(NSXPCListener *)self->_xpcListener endpoint];
    listenerEndpoint = self->_listenerEndpoint;
    self->_listenerEndpoint = v21;

    goto LABEL_10;
  }
  v27 = NSErrorWithOSStatusF(4294960575, (uint64_t)"Activate already called", v10, v11, v12, v13, v14, v15, v28[0]);
  id v24 = v27;
  BOOL v23 = v27 != 0;
  if (a3 && v27)
  {
    id v24 = v27;
    *a3 = v24;
    BOOL v23 = 1;
  }
LABEL_11:
  BOOL v25 = !v23;

  return v25;
}

uint64_t __43__CUXPCAgent_activateDirectAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __43__CUXPCAgent_activateDirectAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 16);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUXPCAgent activateDirectAndReturnError:]_block_invoke_2", 0x1Eu, (uint64_t)"Invalidated\n", a5, a6, a7, a8, v15);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v9 + 16);
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v12 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = 0;

  uint64_t v13 = *(void **)(a1 + 32);
  return [v13 _invalidated];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__CUXPCAgent_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __37__CUXPCAgent_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = 0;
  [v2 activateDirectAndReturnError:&v5];
  id v3 = v5;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CDD48;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUXPCAgent;
  [(CUXPCAgent *)&v4 dealloc];
}

- (CUXPCAgent)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUXPCAgent;
  uint64_t v2 = [(CUXPCAgent *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUXPCAgent;
  }
  return v2;
}

@end