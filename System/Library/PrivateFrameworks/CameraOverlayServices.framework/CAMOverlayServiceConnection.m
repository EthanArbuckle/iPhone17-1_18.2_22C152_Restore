@interface CAMOverlayServiceConnection
- (BOOL)_lastKnownFocusLocked;
- (BOOL)_lastKnownOverlayInterfaceReduced;
- (BOOL)_lastKnownOverlayVisibility;
- (BSServiceConnection)_serverConnection;
- (CAMOverlayServerInterface)_serverProxy;
- (CAMOverlayServiceConnection)initWithClient:(id)a3 queue:(id)a4;
- (CAMOverlayServiceConnectionClient)client;
- (OS_dispatch_queue)_connectionQueue;
- (OS_dispatch_queue)clientQueue;
- (unint64_t)status;
- (void)_handleActivatedConnection:(id)a3;
- (void)_handleInterruptedConnection:(id)a3;
- (void)_handleInvalidatedConnection:(id)a3;
- (void)_setLastKnownFocusLocked:(BOOL)a3;
- (void)_setLastKnownOverlayInterfaceReduced:(BOOL)a3;
- (void)_setLastKnownOverlayVisibility:(BOOL)a3;
- (void)_setServerConnection:(id)a3;
- (void)_setServerProxy:(id)a3;
- (void)_setStatus:(unint64_t)a3;
- (void)_updateStatusWithReason:(unint64_t)a3;
- (void)applyControlUpdate:(id)a3 completion:(id)a4;
- (void)configureWithControls:(id)a3 initialUpdates:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)didChangeInterfaceReduced:(id)a3;
- (void)invalidate;
- (void)invalidateWithReason:(unint64_t)a3;
- (void)serverDidChangeActiveControlIdentifier:(id)a3;
- (void)serverDidChangeFocusLocked:(id)a3;
- (void)serverDidChangeOverlayVisible:(id)a3 activeControlIdentifier:(id)a4;
- (void)serverDidUpdateControl:(id)a3;
@end

@implementation CAMOverlayServiceConnection

- (CAMOverlayServiceConnection)initWithClient:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CAMOverlayServiceConnection;
  v8 = [(CAMOverlayServiceConnection *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_client, v6);
    objc_storeStrong((id *)&v9->_clientQueue, a4);
    v9->_status = 0;
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.camera.overlay-connection", v10);
    connectionQueue = v9->__connectionQueue;
    v9->__connectionQueue = (OS_dispatch_queue *)v11;

    v13 = +[CAMOverlayServiceSpecification machName];
    v14 = +[CAMOverlayServiceSpecification identifier];
    v15 = [MEMORY[0x263F2B9C0] endpointForMachName:v13 service:v14 instance:0];
    if (v15)
    {
      v16 = [MEMORY[0x263F2B9B8] connectionWithEndpoint:v15 clientContextBuilder:&__block_literal_global_1];
      [(CAMOverlayServiceConnection *)v9 _setServerConnection:v16];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_2;
      v20[3] = &unk_265261E48;
      id v21 = v13;
      v22 = v9;
      [v16 configureConnection:v20];
      v17 = os_log_create("com.apple.camera.overlay", "Client");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_2496FE000, v17, OS_LOG_TYPE_DEFAULT, "Activating new overlay service connection", v19, 2u);
      }

      [v16 activate];
    }
    else
    {
      v16 = os_log_create("com.apple.camera.overlay", "Client");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CAMOverlayServiceConnection initWithClient:queue:]((uint64_t)v13, (uint64_t)v14, v16);
      }
    }
  }
  return v9;
}

void __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F086E0];
  id v3 = a2;
  id v6 = [v2 mainBundle];
  v4 = [v6 bundleIdentifier];
  v5 = +[CAMOverlayServiceSpecification identifierKey];
  [v3 encodeObject:v4 forKey:v5];
}

void __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setName:*(void *)(a1 + 32)];
  v4 = +[CAMOverlayServiceSpecification interface];
  [v3 setInterface:v4];

  v5 = +[CAMOverlayServiceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 56)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  objc_initWeak(&location, *(id *)(a1 + 40));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_3;
  v10[3] = &unk_265261E20;
  objc_copyWeak(&v11, &location);
  [v3 setActivationHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_4;
  v8[3] = &unk_265261E20;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_5;
  v6[3] = &unk_265261E20;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleActivatedConnection:v3];
}

void __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleInterruptedConnection:v3];
}

void __52__CAMOverlayServiceConnection_initWithClient_queue___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleInvalidatedConnection:v3];
}

- (void)dealloc
{
  [(BSServiceConnection *)self->__serverConnection invalidate];
  serverConnection = self->__serverConnection;
  self->__serverConnection = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMOverlayServiceConnection;
  [(CAMOverlayServiceConnection *)&v4 dealloc];
}

- (void)_updateStatusWithReason:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = [(CAMOverlayServiceConnection *)self _serverConnection];

  if (v5)
  {
    id v6 = [(CAMOverlayServiceConnection *)self _serverProxy];

    BOOL v7 = v6 != 0;
    uint64_t v8 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
    uint64_t v8 = 2;
  }
  if (v8 != [(CAMOverlayServiceConnection *)self status])
  {
    id v9 = os_log_create("com.apple.camera.overlay", "Client");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = off_265261EE0[v8];
      if (a3 > 2) {
        id v11 = 0;
      }
      else {
        id v11 = off_265261EF8[a3];
      }
      int v16 = 138543618;
      v17 = v10;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_2496FE000, v9, OS_LOG_TYPE_DEFAULT, "Overlay service connection became %{public}@ for reason %{public}@", (uint8_t *)&v16, 0x16u);
    }

    [(CAMOverlayServiceConnection *)self _setStatus:v8];
    if (!v7)
    {
      if ([(CAMOverlayServiceConnection *)self _lastKnownFocusLocked])
      {
        v12 = [(CAMOverlayServiceConnection *)self client];
        [v12 cameraOverlayConnection:self didChangeFocusLocked:0];
      }
      if ([(CAMOverlayServiceConnection *)self _lastKnownOverlayVisibility])
      {
        v13 = [(CAMOverlayServiceConnection *)self client];
        [v13 cameraOverlayConnection:self didChangeOverlayVisible:0 activeControlIdentifier:0];
      }
      if ([(CAMOverlayServiceConnection *)self _lastKnownOverlayInterfaceReduced])
      {
        v14 = [(CAMOverlayServiceConnection *)self client];
        [v14 cameraOverlayConnection:self didChangeInterfaceReduced:0];
      }
    }
    if (a3 != 1)
    {
      v15 = [(CAMOverlayServiceConnection *)self client];
      [v15 cameraOverlayConnection:self didChangeStatus:v8];
    }
  }
}

- (void)invalidate
{
}

- (void)invalidateWithReason:(unint64_t)a3
{
  v5 = [(CAMOverlayServiceConnection *)self _serverConnection];
  [v5 invalidate];

  [(CAMOverlayServiceConnection *)self _setServerConnection:0];
  [(CAMOverlayServiceConnection *)self _setServerProxy:0];
  [(CAMOverlayServiceConnection *)self _updateStatusWithReason:a3];
}

- (void)configureWithControls:(id)a3 initialUpdates:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  id v11 = CAMOverlayErrorForStatus([(CAMOverlayServiceConnection *)self status]);
  v12 = os_log_create("com.apple.camera.overlay", "Client");
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CAMOverlayServiceConnection configureWithControls:initialUpdates:completion:]((uint64_t)v11, v13);
    }

    v10[2](v10, v11);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      uint64_t v16 = [v8 count];
      _os_log_impl(&dword_2496FE000, v13, OS_LOG_TYPE_DEFAULT, "Sending overlay %lu control(s)", (uint8_t *)&v15, 0xCu);
    }

    v14 = [(CAMOverlayServiceConnection *)self _serverProxy];
    [v14 clientDidConfigureControls:v8 initialUpdates:v9 reply:v10];

    v10 = (void (**)(id, void *))v14;
  }
}

- (void)applyControlUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  id v8 = CAMOverlayErrorForStatus([(CAMOverlayServiceConnection *)self status]);
  id v9 = os_log_create("com.apple.camera.overlay", "Client");
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CAMOverlayServiceConnection applyControlUpdate:completion:](v6, (uint64_t)v8, v10);
    }

    v7[2](v7, v8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CAMOverlayServiceConnection applyControlUpdate:completion:](v6, v10);
    }

    id v11 = [(CAMOverlayServiceConnection *)self _serverProxy];
    [v11 clientDidUpdateControl:v6 reply:v7];

    BOOL v7 = (void (**)(id, void *))v11;
  }
}

- (void)_handleActivatedConnection:(id)a3
{
  id v4 = a3;
  v5 = [(CAMOverlayServiceConnection *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CAMOverlayServiceConnection__handleActivatedConnection___block_invoke;
  v7[3] = &unk_265261E70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__CAMOverlayServiceConnection__handleActivatedConnection___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) remoteTarget];
  [*(id *)(a1 + 32) _setServerProxy:v2];

  id v3 = *(void **)(a1 + 32);
  return [v3 _updateStatusWithReason:2];
}

- (void)_handleInterruptedConnection:(id)a3
{
  id v4 = [(CAMOverlayServiceConnection *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CAMOverlayServiceConnection__handleInterruptedConnection___block_invoke;
  block[3] = &unk_265261DD0;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __60__CAMOverlayServiceConnection__handleInterruptedConnection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setServerProxy:0];
  v2 = [*(id *)(a1 + 32) _serverConnection];
  [v2 activate];

  id v3 = *(void **)(a1 + 32);
  return [v3 _updateStatusWithReason:2];
}

- (void)_handleInvalidatedConnection:(id)a3
{
  id v4 = [(CAMOverlayServiceConnection *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CAMOverlayServiceConnection__handleInvalidatedConnection___block_invoke;
  block[3] = &unk_265261DD0;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __60__CAMOverlayServiceConnection__handleInvalidatedConnection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setServerProxy:0];
  [*(id *)(a1 + 32) _setServerConnection:0];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateStatusWithReason:2];
}

- (void)serverDidChangeOverlayVisible:(id)a3 activeControlIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = [a3 BOOLValue];
  id v8 = os_log_create("com.apple.camera.overlay", "Client");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (v7) {
      id v9 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_2496FE000, v8, OS_LOG_TYPE_DEFAULT, "Received overlay visibility %{public}@ for control ID %{public}@", buf, 0x16u);
  }

  v10 = [(CAMOverlayServiceConnection *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__CAMOverlayServiceConnection_serverDidChangeOverlayVisible_activeControlIdentifier___block_invoke;
  block[3] = &unk_265261E98;
  char v14 = v7;
  block[4] = self;
  id v13 = v6;
  id v11 = v6;
  dispatch_async(v10, block);
}

void __85__CAMOverlayServiceConnection_serverDidChangeOverlayVisible_activeControlIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setLastKnownOverlayVisibility:*(unsigned __int8 *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) client];
  [v2 cameraOverlayConnection:*(void *)(a1 + 32) didChangeOverlayVisible:*(unsigned __int8 *)(a1 + 48) activeControlIdentifier:*(void *)(a1 + 40)];
}

- (void)serverDidChangeActiveControlIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = os_log_create("com.apple.camera.overlay", "Client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_2496FE000, v5, OS_LOG_TYPE_DEFAULT, "Received active control ID %{public}@", buf, 0xCu);
  }

  id v6 = [(CAMOverlayServiceConnection *)self clientQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__CAMOverlayServiceConnection_serverDidChangeActiveControlIdentifier___block_invoke;
  v8[3] = &unk_265261E70;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __70__CAMOverlayServiceConnection_serverDidChangeActiveControlIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  [v2 cameraOverlayConnection:*(void *)(a1 + 32) didChangeActiveControlIdentifier:*(void *)(a1 + 40)];
}

- (void)didChangeInterfaceReduced:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [a3 BOOLValue];
  v5 = os_log_create("com.apple.camera.overlay", "Client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v4) {
      id v6 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_2496FE000, v5, OS_LOG_TYPE_DEFAULT, "Received overlay interfaceReduced %{public}@", buf, 0xCu);
  }

  id v7 = [(CAMOverlayServiceConnection *)self clientQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__CAMOverlayServiceConnection_didChangeInterfaceReduced___block_invoke;
  v8[3] = &unk_265261EC0;
  void v8[4] = self;
  char v9 = v4;
  dispatch_async(v7, v8);
}

void __57__CAMOverlayServiceConnection_didChangeInterfaceReduced___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setLastKnownOverlayInterfaceReduced:*(unsigned __int8 *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) client];
  [v2 cameraOverlayConnection:*(void *)(a1 + 32) didChangeInterfaceReduced:*(unsigned __int8 *)(a1 + 40)];
}

- (void)serverDidChangeFocusLocked:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [a3 BOOLValue];
  v5 = os_log_create("com.apple.camera.overlay", "Client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v4) {
      id v6 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    id v11 = v6;
    _os_log_impl(&dword_2496FE000, v5, OS_LOG_TYPE_DEFAULT, "Received overlay focusLocked %{public}@", buf, 0xCu);
  }

  id v7 = [(CAMOverlayServiceConnection *)self clientQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__CAMOverlayServiceConnection_serverDidChangeFocusLocked___block_invoke;
  v8[3] = &unk_265261EC0;
  void v8[4] = self;
  char v9 = v4;
  dispatch_async(v7, v8);
}

void __58__CAMOverlayServiceConnection_serverDidChangeFocusLocked___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setLastKnownFocusLocked:*(unsigned __int8 *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) client];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) client];
    [v4 cameraOverlayConnection:*(void *)(a1 + 32) didChangeFocusLocked:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)serverDidUpdateControl:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = os_log_create("com.apple.camera.overlay", "Client");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 debugDescription];
    id v7 = [v4 controlIdentifier];
    *(_DWORD *)buf = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    int v15 = v7;
    _os_log_impl(&dword_2496FE000, v5, OS_LOG_TYPE_DEFAULT, "Received overlay update %{public}@ for ID %{public}@", buf, 0x16u);
  }
  id v8 = [(CAMOverlayServiceConnection *)self clientQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__CAMOverlayServiceConnection_serverDidUpdateControl___block_invoke;
  v10[3] = &unk_265261E70;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

void __54__CAMOverlayServiceConnection_serverDidUpdateControl___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  [v2 cameraOverlayConnection:*(void *)(a1 + 32) didApplyControlUpdate:*(void *)(a1 + 40)];
}

- (CAMOverlayServiceConnectionClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (CAMOverlayServiceConnectionClient *)WeakRetained;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)_setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (BSServiceConnection)_serverConnection
{
  return self->__serverConnection;
}

- (void)_setServerConnection:(id)a3
{
}

- (CAMOverlayServerInterface)_serverProxy
{
  return self->__serverProxy;
}

- (void)_setServerProxy:(id)a3
{
}

- (OS_dispatch_queue)_connectionQueue
{
  return self->__connectionQueue;
}

- (BOOL)_lastKnownOverlayVisibility
{
  return self->__lastKnownOverlayVisibility;
}

- (void)_setLastKnownOverlayVisibility:(BOOL)a3
{
  self->__lastKnownOverlayVisibility = a3;
}

- (BOOL)_lastKnownOverlayInterfaceReduced
{
  return self->__lastKnownOverlayInterfaceReduced;
}

- (void)_setLastKnownOverlayInterfaceReduced:(BOOL)a3
{
  self->__lastKnownOverlayInterfaceReduced = a3;
}

- (BOOL)_lastKnownFocusLocked
{
  return self->__lastKnownFocusLocked;
}

- (void)_setLastKnownFocusLocked:(BOOL)a3
{
  self->__lastKnownFocusLocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__connectionQueue, 0);
  objc_storeStrong((id *)&self->__serverProxy, 0);
  objc_storeStrong((id *)&self->__serverConnection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_client);
}

- (void)initWithClient:(os_log_t)log queue:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2496FE000, log, OS_LOG_TYPE_ERROR, "Lookup failed for machName/service %{public}@/%{public}@.", (uint8_t *)&v3, 0x16u);
}

- (void)configureWithControls:(uint64_t)a1 initialUpdates:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2496FE000, a2, OS_LOG_TYPE_ERROR, "Not sending overlay controls: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)applyControlUpdate:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 debugDescription];
  __int16 v5 = [a1 controlIdentifier];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_2496FE000, a2, OS_LOG_TYPE_DEBUG, "Sending overlay value %{public}@ for ID %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)applyControlUpdate:(NSObject *)a3 completion:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v6 = [a1 debugDescription];
  uint64_t v7 = [a1 controlIdentifier];
  int v8 = 138543874;
  id v9 = v6;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_2496FE000, a3, OS_LOG_TYPE_ERROR, "Not sending overlay value %{public}@ for ID %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);
}

@end