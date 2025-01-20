@interface BTServicesClient
- (BTServicesClient)init;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_interrupted;
- (void)_invalidated;
- (void)diagnosticControl:(id)a3 completion:(id)a4;
- (void)diagnosticShow:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
@end

@implementation BTServicesClient

- (BTServicesClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)BTServicesClient;
  v2 = [(BTServicesClient *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (id)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    v3 = self->_testListenerEndpoint;
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    if (v3) {
      v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:v3];
    }
    else {
      v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.BluetoothServices" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC93EF8];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __37__BTServicesClient__ensureXPCStarted__block_invoke;
    v11[3] = &unk_26523F8D0;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __37__BTServicesClient__ensureXPCStarted__block_invoke_2;
    v10[3] = &unk_26523F8D0;
    v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v10];
    v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC94048];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
  return 0;
}

uint64_t __37__BTServicesClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __37__BTServicesClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_BTServicesClient <= 50
    && (gLogCategory_BTServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = (void (**)(void))MEMORY[0x24C581450](self->_interruptionHandler);
  if (v3)
  {
    id v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__BTServicesClient_invalidate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__BTServicesClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 8) = 1;
    if (!*(unsigned char *)(*(void *)(result + 32) + 9)
      && gLogCategory_BTServicesClient <= 30
      && (gLogCategory_BTServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(id **)(v2 + 32);
    if (v3[2])
    {
      [v3[2] invalidate];
      v3 = *(id **)(v2 + 32);
    }
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_BTServicesClient <= 50
      && (gLogCategory_BTServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      uint64_t v3 = MEMORY[0x24C581450](self->_invalidationHandler, a2);
      id v4 = (void *)v3;
      if (v3) {
        (*(void (**)(uint64_t))(v3 + 16))(v3);
      }

      id interruptionHandler = self->_interruptionHandler;
      self->_id interruptionHandler = 0;

      id invalidationHandler = self->_invalidationHandler;
      self->_id invalidationHandler = 0;

      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_BTServicesClient <= 10
        && (gLogCategory_BTServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__BTServicesClient_diagnosticControl_completion___block_invoke;
  block[3] = &unk_26523FE90;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __49__BTServicesClient_diagnosticControl_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __49__BTServicesClient_diagnosticControl_completion___block_invoke_2;
    v5[3] = &unk_26523F8A8;
    id v6 = *(id *)(a1 + 48);
    id v4 = [v3 remoteObjectProxyWithErrorHandler:v5];
    [v4 diagnosticControl:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

uint64_t __49__BTServicesClient_diagnosticControl_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__BTServicesClient_diagnosticShow_completion___block_invoke;
  block[3] = &unk_26523FE90;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __46__BTServicesClient_diagnosticShow_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _ensureXPCStarted];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __46__BTServicesClient_diagnosticShow_completion___block_invoke_2;
    v5[3] = &unk_26523F8A8;
    id v6 = *(id *)(a1 + 48);
    id v4 = [v3 remoteObjectProxyWithErrorHandler:v5];
    [v4 diagnosticShow:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

uint64_t __46__BTServicesClient_diagnosticShow_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
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

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end