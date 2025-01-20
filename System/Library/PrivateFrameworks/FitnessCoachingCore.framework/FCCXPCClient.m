@interface FCCXPCClient
- (FCCXPCClient)init;
- (FCCXPCClient)initWithQueue:(id)a3;
- (void)_remoteProxy:(id)a3 errorHandler:(id)a4;
- (void)_setupXPCConnection;
- (void)_transportMessage:(unint64_t)a3 data:(id)a4 completion:(id)a5;
- (void)_transportRequest:(unint64_t)a3 data:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)transportMessage:(unint64_t)a3 data:(id)a4 completion:(id)a5;
- (void)transportRequest:(unint64_t)a3 data:(id)a4 completion:(id)a5;
@end

@implementation FCCXPCClient

- (FCCXPCClient)init
{
  v3 = HKCreateSerialDispatchQueueWithQOSClass();
  v4 = [(FCCXPCClient *)self initWithQueue:v3];

  return v4;
}

- (FCCXPCClient)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCXPCClient;
  v6 = [(FCCXPCClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
  }
  [(FCCXPCClient *)v7 _setupXPCConnection];

  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)FCCXPCClient;
  [(FCCXPCClient *)&v4 dealloc];
}

- (void)_setupXPCConnection
{
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.fitnesscoachingd" options:0];
  [(NSXPCConnection *)v3 _setQueue:self->_dispatchQueue];
  objc_super v4 = FCCDefaultTransportInterface();
  [(NSXPCConnection *)v3 setRemoteObjectInterface:v4];

  [(NSXPCConnection *)v3 setInterruptionHandler:&__block_literal_global_0];
  [(NSXPCConnection *)v3 setInvalidationHandler:&__block_literal_global_285];
  [(NSXPCConnection *)v3 resume];
  connection = self->_connection;
  self->_connection = v3;
}

void __35__FCCXPCClient__setupXPCConnection__block_invoke()
{
  _HKInitializeLogging();
  v0 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
    __35__FCCXPCClient__setupXPCConnection__block_invoke_cold_1(v0);
  }
}

void __35__FCCXPCClient__setupXPCConnection__block_invoke_283()
{
  _HKInitializeLogging();
  v0 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
    __35__FCCXPCClient__setupXPCConnection__block_invoke_283_cold_1(v0);
  }
}

- (void)_remoteProxy:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke;
  block[3] = &unk_1E6105D68;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke_2;
  v4[3] = &unk_1E6105D20;
  id v5 = *(id *)(a1 + 40);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  objc_super v4 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
    __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke_2_cold_1((uint64_t)v3, v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)transportMessage:(unint64_t)a3 data:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__FCCXPCClient_transportMessage_data_completion___block_invoke;
  v13[3] = &unk_1E6105CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __49__FCCXPCClient_transportMessage_data_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transportMessage:*(void *)(a1 + 56) data:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)transportRequest:(unint64_t)a3 data:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__FCCXPCClient_transportRequest_data_completion___block_invoke;
  v13[3] = &unk_1E6105CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __49__FCCXPCClient_transportRequest_data_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transportRequest:*(void *)(a1 + 56) data:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_transportMessage:(unint64_t)a3 data:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__FCCXPCClient__transportMessage_data_completion___block_invoke;
  v14[3] = &unk_1E6105D90;
  unint64_t v17 = a3;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__FCCXPCClient__transportMessage_data_completion___block_invoke_2;
  v12[3] = &unk_1E6105D20;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(FCCXPCClient *)self _remoteProxy:v14 errorHandler:v12];
}

uint64_t __50__FCCXPCClient__transportMessage_data_completion___block_invoke(void *a1, void *a2)
{
  return [a2 transportMessage:a1[6] data:a1[4] completion:a1[5]];
}

uint64_t __50__FCCXPCClient__transportMessage_data_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_transportRequest:(unint64_t)a3 data:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__FCCXPCClient__transportRequest_data_completion___block_invoke;
  v14[3] = &unk_1E6105D90;
  unint64_t v17 = a3;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__FCCXPCClient__transportRequest_data_completion___block_invoke_2;
  v12[3] = &unk_1E6105D20;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(FCCXPCClient *)self _remoteProxy:v14 errorHandler:v12];
}

uint64_t __50__FCCXPCClient__transportRequest_data_completion___block_invoke(void *a1, void *a2)
{
  return [a2 transportRequest:a1[6] data:a1[4] completion:a1[5]];
}

uint64_t __50__FCCXPCClient__transportRequest_data_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __35__FCCXPCClient__setupXPCConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B55C0000, log, OS_LOG_TYPE_ERROR, "Compatibility xpc connection interrupted", v1, 2u);
}

void __35__FCCXPCClient__setupXPCConnection__block_invoke_283_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B55C0000, log, OS_LOG_TYPE_ERROR, "Compatibility xpc connection invalidated", v1, 2u);
}

void __42__FCCXPCClient__remoteProxy_errorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55C0000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch server proxy with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end