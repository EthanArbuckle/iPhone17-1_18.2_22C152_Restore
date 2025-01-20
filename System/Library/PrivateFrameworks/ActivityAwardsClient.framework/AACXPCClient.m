@interface AACXPCClient
- (AACXPCClient)init;
- (void)_discardEndpointConnection:(id)a3;
- (void)_handleError:(id)a3;
- (void)_remoteProxy:(id)a3 errorHandler:(id)a4;
- (void)_remoteSynchronousProxy:(id)a3 errorHandler:(id)a4;
- (void)_resetEndpointConnection;
- (void)_serverQueue_initializeDaemonConnection;
- (void)dealloc;
- (void)invalidate;
- (void)sendRequest:(unint64_t)a3 completion:(id)a4;
- (void)sendRequest:(unint64_t)a3 payload:(id)a4 completion:(id)a5;
- (void)sendRequest:(unint64_t)a3 payloadData:(id)a4 completion:(id)a5;
- (void)sendSynchronousRequest:(unint64_t)a3 payload:(id)a4 resultHandler:(id)a5;
- (void)sendSynchronousRequest:(unint64_t)a3 resultHandler:(id)a4;
@end

@implementation AACXPCClient

uint64_t __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)sendRequest:(unint64_t)a3 payloadData:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke;
  v14[3] = &unk_26451CEA0;
  unint64_t v18 = a3;
  id v15 = v8;
  v16 = self;
  id v17 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_4;
  v12[3] = &unk_26451CE78;
  id v13 = v17;
  id v10 = v17;
  id v11 = v8;
  [(AACXPCClient *)self _remoteProxy:v14 errorHandler:v12];
}

- (void)_remoteProxy:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke;
  block[3] = &unk_26451CF90;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(serverQueue, block);
}

void __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_3;
  block[3] = &unk_26451CE00;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke(id *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)a1[4] + 2);
  id v2 = *((id *)a1[4] + 4);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = *((id *)a1[4] + 5);
  objc_initWeak(&location, a1[4]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_339;
  v14[3] = &unk_26451CEF0;
  objc_copyWeak(&v17, &location);
  v16 = &v19;
  id v15 = a1[5];
  v3 = (void *)MEMORY[0x223C50CB0](v14);
  os_unfair_lock_unlock((os_unfair_lock_t)a1[4] + 2);
  v4 = (void *)v20[5];
  if (v4)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_3;
    v12[3] = &unk_26451CE78;
    id v13 = v3;
    id v5 = [v4 remoteObjectProxyWithErrorHandler:v12];
    (*((void (**)(void))a1[6] + 2))();

    id v6 = v13;
  }
  else
  {
    id v6 = [v2 remoteObjectProxyWithErrorHandler:v3];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_340;
    v7[3] = &unk_26451CF68;
    v7[4] = a1[4];
    id v10 = &v19;
    objc_copyWeak(&v11, &location);
    id v8 = v3;
    id v9 = a1[6];
    [v6 createEndpointNamed:@"AAC_XPC_Endpoint_Awards_Client" completion:v7];

    objc_destroyWeak(&v11);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v19, 8);
}

void __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke(void *a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_2;
  v6[3] = &unk_26451CE28;
  uint64_t v3 = a1[4];
  v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  v6[4] = a1[5];
  id v7 = v4;
  [a2 transportRequest:v5 data:v3 completion:v6];
}

- (AACXPCClient)init
{
  v12.receiver = self;
  v12.super_class = (Class)AACXPCClient;
  id v2 = [(AACXPCClient *)&v12 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = HKCreateSerialDispatchQueue();
    serverQueue = v3->_serverQueue;
    v3->_serverQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = HKCreateSerialDispatchQueue();
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v6;

    id v8 = v3->_serverQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __20__AACXPCClient_init__block_invoke;
    block[3] = &unk_26451CDB8;
    id v11 = v3;
    dispatch_async(v8, block);
  }
  return v3;
}

uint64_t __20__AACXPCClient_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serverQueue_initializeDaemonConnection");
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F697000, v0, v1, "Dealloc called on AACXPCClient", v2, v3, v4, v5, v6);
}

- (void)invalidate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F697000, v0, v1, "Invalidate called on AACXPCClient", v2, v3, v4, v5, v6);
}

- (void)_serverQueue_initializeDaemonConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serverQueue);
  uint64_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.activityawardsd" options:0];
  mainDaemonConnection = self->_mainDaemonConnection;
  self->_mainDaemonConnection = v3;

  uint64_t v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D118FB0];
  [(NSXPCConnection *)self->_mainDaemonConnection setRemoteObjectInterface:v5];

  [(NSXPCConnection *)self->_mainDaemonConnection setInvalidationHandler:&__block_literal_global];
  [(NSXPCConnection *)self->_mainDaemonConnection setInterruptionHandler:&__block_literal_global_333];
  uint8_t v6 = self->_mainDaemonConnection;
  [(NSXPCConnection *)v6 resume];
}

void __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke()
{
  v0 = ACHLogXPC();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke_cold_1();
  }
}

void __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke_331()
{
  v0 = ACHLogXPC();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke_331_cold_1();
  }
}

- (void)sendRequest:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__AACXPCClient_sendRequest_completion___block_invoke;
  v10[3] = &unk_26451CE50;
  unint64_t v12 = a3;
  v10[4] = self;
  id v11 = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__AACXPCClient_sendRequest_completion___block_invoke_4;
  v8[3] = &unk_26451CE78;
  id v9 = v11;
  id v7 = v11;
  [(AACXPCClient *)self _remoteProxy:v10 errorHandler:v8];
}

void __39__AACXPCClient_sendRequest_completion___block_invoke(void *a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__AACXPCClient_sendRequest_completion___block_invoke_2;
  v5[3] = &unk_26451CE28;
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = a1[6];
  v5[4] = a1[4];
  id v6 = v3;
  [a2 transportRequest:v4 data:0 completion:v5];
}

void __39__AACXPCClient_sendRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__AACXPCClient_sendRequest_completion___block_invoke_3;
  block[3] = &unk_26451CE00;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __39__AACXPCClient_sendRequest_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __39__AACXPCClient_sendRequest_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendRequest:(unint64_t)a3 payload:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__AACXPCClient_sendRequest_payload_completion___block_invoke;
  v14[3] = &unk_26451CEA0;
  unint64_t v18 = a3;
  id v15 = v8;
  v16 = self;
  id v17 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__AACXPCClient_sendRequest_payload_completion___block_invoke_4;
  v12[3] = &unk_26451CE78;
  id v13 = v17;
  id v10 = v17;
  id v11 = v8;
  [(AACXPCClient *)self _remoteProxy:v14 errorHandler:v12];
}

void __47__AACXPCClient_sendRequest_payload_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F08900];
  uint64_t v4 = a1[4];
  id v12 = 0;
  id v5 = a2;
  id v6 = [v3 dataWithJSONObject:v4 options:4 error:&v12];
  id v7 = v12;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__AACXPCClient_sendRequest_payload_completion___block_invoke_2;
  v10[3] = &unk_26451CE28;
  id v8 = (void *)a1[6];
  uint64_t v9 = a1[7];
  v10[4] = a1[5];
  id v11 = v8;
  [v5 transportRequest:v9 data:v6 completion:v10];
}

void __47__AACXPCClient_sendRequest_payload_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__AACXPCClient_sendRequest_payload_completion___block_invoke_3;
  block[3] = &unk_26451CE00;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __47__AACXPCClient_sendRequest_payload_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __47__AACXPCClient_sendRequest_payload_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendSynchronousRequest:(unint64_t)a3 resultHandler:(id)a4
{
}

- (void)sendSynchronousRequest:(unint64_t)a3 payload:(id)a4 resultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke;
  v14[3] = &unk_26451CE50;
  id v15 = v8;
  unint64_t v17 = a3;
  id v16 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_2;
  v12[3] = &unk_26451CE78;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(AACXPCClient *)self _remoteSynchronousProxy:v14 errorHandler:v12];
}

void __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v11 = 0;
    id v5 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:4 error:&v11];
    id v6 = v11;
    if (!v5)
    {
      id v7 = ACHLogXPC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_cold_1();
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_338;
  v9[3] = &unk_26451CD68;
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  [v3 transportRequest:v8 data:v5 completion:v9];
}

uint64_t __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_338(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_discardEndpointConnection:(id)a3
{
  id v5 = (NSXPCConnection *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_endpointConnection == v5)
  {
    [(NSXPCConnection *)v5 invalidate];
    endpointConnection = self->_endpointConnection;
    self->_endpointConnection = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_resetEndpointConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSXPCConnection *)self->_endpointConnection invalidate];
  endpointConnection = self->_endpointConnection;
  self->_endpointConnection = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)_handleError:(id)a3
{
  if (objc_msgSend(a3, "hk_isXPCConnectionError"))
  {
    [(AACXPCClient *)self _resetEndpointConnection];
  }
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_339(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(v3, "hk_isXPCConnectionError")) {
      [WeakRetained _discardEndpointConnection:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
    id v5 = WeakRetained[3];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2;
    v6[3] = &unk_26451CEC8;
    id v8 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ACHLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_340(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2_341;
  block[3] = &unk_26451CF40;
  uint64_t v17 = *(void *)(a1 + 56);
  id v12 = v5;
  uint64_t v13 = v7;
  id v9 = v5;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v14 = v6;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v18);
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2_341(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v2 = *(void *)(a1 + 32) == 0;
  id v3 = ACHLogXPC();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2_341_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F697000, v4, OS_LOG_TYPE_DEFAULT, "Creating endpoint connection", buf, 2u);
    }

    uint64_t v5 = [objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D118EF0];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setRemoteObjectInterface:v8];

    id v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D118EF0];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setExportedInterface:v9];

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setExportedObject:*(void *)(a1 + 40)];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_349;
    v17[3] = &unk_26451CF18;
    objc_copyWeak(&v18, (id *)(a1 + 80));
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setInvalidationHandler:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_350;
    v15[3] = &unk_26451CF18;
    objc_copyWeak(&v16, (id *)(a1 + 80));
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setInterruptionHandler:v15];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) resume];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    [*(id *)(*(void *)(a1 + 40) + 40) invalidate];
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 40), *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 8));
    id v10 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_351;
    v13[3] = &unk_26451CE78;
    id v14 = *(id *)(a1 + 56);
    id v11 = [v10 remoteObjectProxyWithErrorHandler:v13];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v12 = ACHLogXPC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = @"AAC_XPC_Endpoint_Awards_Client";
      _os_log_impl(&dword_21F697000, v12, OS_LOG_TYPE_DEFAULT, "XPC endpoint setup complete for %{public}@.", buf, 0xCu);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
  }
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_349(uint64_t a1)
{
  BOOL v2 = ACHLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_349_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetEndpointConnection];
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_350(uint64_t a1)
{
  BOOL v2 = ACHLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_350_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetEndpointConnection];
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_351(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ACHLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_remoteSynchronousProxy:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke;
  block[3] = &unk_26451D000;
  void block[4] = self;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(serverQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__0;
  void v15[4] = __Block_byref_object_dispose__0;
  id v16 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_2;
  v11[3] = &unk_26451CEF0;
  objc_copyWeak(&v14, (id *)(a1 + 56));
  id v13 = v15;
  id v12 = *(id *)(a1 + 40);
  id v3 = (void *)MEMORY[0x223C50CB0](v11);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4;
  v7[3] = &unk_26451CFD8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v15;
  v7[4] = v5;
  id v8 = *(id *)(a1 + 48);
  id v6 = v3;
  id v9 = v6;
  [v4 createEndpointNamed:@"AAC_XPC_Endpoint_Awards_Client" completion:v7];

  objc_destroyWeak(&v14);
  _Block_object_dispose(v15, 8);
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(v3, "hk_isXPCConnectionError")) {
      [WeakRetained _discardEndpointConnection:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
    uint64_t v5 = WeakRetained[3];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_3;
    v6[3] = &unk_26451CEC8;
    id v8 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = ACHLogXPC();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_21F697000, v8, OS_LOG_TYPE_DEFAULT, "Creating endpoint connection", v19, 2u);
    }

    uint64_t v9 = [objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v5];
    uint64_t v10 = *(void *)(a1[7] + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D118EF0];
    [*(id *)(*(void *)(a1[7] + 8) + 40) setRemoteObjectInterface:v12];

    id v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D118EF0];
    [*(id *)(*(void *)(a1[7] + 8) + 40) setExportedInterface:v13];

    [*(id *)(*(void *)(a1[7] + 8) + 40) setExportedObject:a1[4]];
    [*(id *)(*(void *)(a1[7] + 8) + 40) setInvalidationHandler:&__block_literal_global_355];
    [*(id *)(*(void *)(a1[7] + 8) + 40) setInterruptionHandler:&__block_literal_global_358];
    [*(id *)(*(void *)(a1[7] + 8) + 40) resume];
    id v14 = [*(id *)(*(void *)(a1[7] + 8) + 40) synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_361];
    id v15 = ACHLogXPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_3();
    }

    (*(void (**)(void))(a1[5] + 16))();
    id v16 = ACHLogXPC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_2();
    }

    [*(id *)(*(void *)(a1[7] + 8) + 40) invalidate];
    uint64_t v17 = *(void *)(a1[7] + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_1();
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_353()
{
  v0 = ACHLogXPC();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_353_cold_1();
  }
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_356()
{
  v0 = ACHLogXPC();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_356_cold_1();
  }
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_359(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = ACHLogXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_359_cold_1();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointConnection, 0);
  objc_storeStrong((id *)&self->_mainDaemonConnection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
}

void __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21F697000, v0, OS_LOG_TYPE_ERROR, "Mach XPC service connection invalidated", v1, 2u);
}

void __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke_331_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21F697000, v0, OS_LOG_TYPE_ERROR, "Mach XPC service connection interrupted", v1, 2u);
}

void __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21F697000, v0, v1, "Error serializing paylod: %@", v2, v3, v4, v5, v6);
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21F697000, v0, v1, "Failed to fetch endpoint proxy with error %{public}@", v2, v3, v4, v5, v6);
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2_341_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21F697000, v0, v1, "Unable to establish XPC endpoint connection for %{public}@", v2, v3, v4, v5, v6);
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_349_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21F697000, v0, v1, "XPC client-side connection invalidated for %{public}@", v2, v3, v4, v5, v6);
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_350_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21F697000, v0, v1, "XPC client-side connection interrupted for %{public}@", v2, v3, v4, v5, v6);
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21F697000, v0, v1, "Unable to establish Sync XPC endpoint connection for %{public}@", v2, v3, v4, v5, v6);
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F697000, v0, v1, "Invaliding sync XPC endpoint connection after handler returned", v2, v3, v4, v5, v6);
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_21F697000, v0, OS_LOG_TYPE_DEBUG, "Sync XPC endpoint setup complete for %{public}@, passing proxy to handler.", v1, 0xCu);
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_353_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21F697000, v0, v1, "Sync XPC client-side connection invalidated for %{public}@", v2, v3, v4, v5, v6);
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_356_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21F697000, v0, v1, "Sync XPC client-side connection interrupted for %{public}@", v2, v3, v4, v5, v6);
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_359_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21F697000, v0, v1, "Sync XPC failed to fetch endpoint proxy with error %{public}@", v2, v3, v4, v5, v6);
}

@end