@interface HDSSetupClient
- (HDSSetupClient)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)dispatchQueue;
- (SetupEngineDelegate)delegate;
- (void)_activateWithCompletion:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)startAdvertisingWithCompletion:(id)a3;
@end

@implementation HDSSetupClient

- (HDSSetupClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDSSetupClient;
  v2 = [(HDSSetupClient *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__HDSSetupClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_26503F830;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __41__HDSSetupClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (gLogCategory_HDSSetupClient <= 30
    && (gLogCategory_HDSSetupClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.hpsetup.xpc" options:4096];
  [v5 _setQueue:MEMORY[0x263EF83A0]];
  id v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F26DD60];
  [v5 setRemoteObjectInterface:v6];

  v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F26DDC0];
  [v5 setExportedInterface:v7];

  id v8 = [(HDSSetupClient *)self delegate];
  [v5 setExportedObject:v8];

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__HDSSetupClient__activateWithCompletion___block_invoke;
  v11[3] = &unk_26503FD88;
  objc_copyWeak(&v12, &location);
  [v5 setInterruptionHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __42__HDSSetupClient__activateWithCompletion___block_invoke_2;
  v9[3] = &unk_26503FD88;
  objc_copyWeak(&v10, &location);
  [v5 setInvalidationHandler:v9];
  [v5 resume];
  objc_storeStrong((id *)&self->_connection, v5);
  if (v4) {
    v4[2](v4, 0);
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

uint64_t __42__HDSSetupClient__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)WeakRetained;
  if (gLogCategory_HDSSetupClient <= 90)
  {
    v5 = (void *)WeakRetained;
    if (gLogCategory_HDSSetupClient != -1 || (uint64_t WeakRetained = _LogCategory_Initialize(), v2 = v5, WeakRetained))
    {
      id v4 = [v2 connection];
      LogPrintF();

      v2 = v5;
    }
  }
  return MEMORY[0x270F9A758](WeakRetained, v2);
}

uint64_t __42__HDSSetupClient__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)WeakRetained;
  if (gLogCategory_HDSSetupClient <= 90)
  {
    v5 = (void *)WeakRetained;
    if (gLogCategory_HDSSetupClient != -1 || (uint64_t WeakRetained = _LogCategory_Initialize(), v2 = v5, WeakRetained))
    {
      id v4 = [v2 connection];
      LogPrintF();

      v2 = v5;
    }
  }
  return MEMORY[0x270F9A758](WeakRetained, v2);
}

- (void)invalidate
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)startAdvertisingWithCompletion:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (gLogCategory_HDSSetupClient <= 30)
  {
    if (gLogCategory_HDSSetupClient != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
    {
      LogPrintF();
      id v4 = v7;
    }
  }
  if (v4)
  {
    id v6 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    [v6 startAdvertisingWithCompletion:v7];
  }
  else if (gLogCategory_HDSSetupClient <= 90 {
         && (gLogCategory_HDSSetupClient != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  MEMORY[0x270F9A790]();
}

- (SetupEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SetupEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end