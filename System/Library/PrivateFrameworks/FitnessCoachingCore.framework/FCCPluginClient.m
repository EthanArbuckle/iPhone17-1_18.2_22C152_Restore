@interface FCCPluginClient
+ (id)taskIdentifier;
- (FCCPluginClient)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (void)_pluginMessage:(unint64_t)a3 data:(id)a4 completionHandler:(id)a5;
- (void)_remoteProxy:(id)a3 errorHandler:(id)a4;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)pluginMessage:(unint64_t)a3 data:(id)a4 completionHandler:(id)a5;
@end

@implementation FCCPluginClient

- (FCCPluginClient)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCCPluginClient;
  v5 = [(FCCPluginClient *)&v14 init];
  if (v5)
  {
    uint64_t v6 = HKCreateSerialDispatchQueueWithQOSClass();
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F2B608]);
    v9 = [(id)objc_opt_class() taskIdentifier];
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v8 initWithHealthStore:v4 taskIdentifier:v9 exportedObject:v5 taskUUID:v10];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v11;
  }
  return v5;
}

+ (id)taskIdentifier
{
  return @"com.apple.fitnesscoaching.HealthServer";
}

- (void)pluginMessage:(unint64_t)a3 data:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__FCCPluginClient_pluginMessage_data_completionHandler___block_invoke;
  v13[3] = &unk_1E6105CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

uint64_t __56__FCCPluginClient_pluginMessage_data_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pluginMessage:*(void *)(a1 + 56) data:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_pluginMessage:(unint64_t)a3 data:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke;
  v14[3] = &unk_1E6105CF8;
  unint64_t v17 = a3;
  id v15 = v8;
  id v16 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke_2;
  v12[3] = &unk_1E6105D20;
  id v13 = v16;
  id v10 = v16;
  id v11 = v8;
  [(FCCPluginClient *)self _remoteProxy:v14 errorHandler:v12];
}

uint64_t __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke(void *a1, void *a2)
{
  return [a2 pluginMessage:a1[6] data:a1[4] completionHandler:a1[5]];
}

void __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR)) {
    __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke_2_cold_1((uint64_t)v3, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_remoteProxy:(id)a3 errorHandler:(id)a4
{
}

- (id)exportedInterface
{
  return 0;
}

- (void)connectionInvalidated
{
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1B55C0000, v2, OS_LOG_TYPE_DEFAULT, "[FCCPluginClient] XPC connection invalidated", v3, 2u);
  }
}

- (void)connectionInterrupted
{
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1B55C0000, v2, OS_LOG_TYPE_DEFAULT, "[FCCPluginClient] XPC connection interrupted", v3, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __57__FCCPluginClient__pluginMessage_data_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B55C0000, a2, OS_LOG_TYPE_ERROR, "[FCCPluginClient] Sending message failed: %@", (uint8_t *)&v2, 0xCu);
}

@end