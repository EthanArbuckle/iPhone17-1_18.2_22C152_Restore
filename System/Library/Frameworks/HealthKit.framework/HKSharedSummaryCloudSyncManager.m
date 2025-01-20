@interface HKSharedSummaryCloudSyncManager
+ (id)clientInterface;
+ (id)serverInterface;
+ (id)taskIdentifier;
- (HKSharedSummaryCloudSyncManager)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)fetchAccountInfoWithCompletion:(id)a3;
- (void)pullWithCompletion:(id)a3;
- (void)pushWithCompletion:(id)a3;
@end

@implementation HKSharedSummaryCloudSyncManager

- (HKSharedSummaryCloudSyncManager)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSharedSummaryCloudSyncManager;
  v5 = [(HKSharedSummaryCloudSyncManager *)&v13 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v8 exportedObject:v5 taskUUID:v9];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v10;
  }
  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)fetchAccountInfoWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke;
  v9[3] = &unk_1E58BF518;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAccountInfoWithCompletion:", *(void *)(a1 + 32));
}

void __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
    __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pushWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke;
  v9[3] = &unk_1E58BF518;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBC48;
  void v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pushWithCompletion:", *(void *)(a1 + 32));
}

void __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)pullWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke;
  v9[3] = &unk_1E58BF518;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBC48;
  void v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_pullWithCompletion:", *(void *)(a1 + 32));
}

void __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)exportedInterface
{
  v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECF9E08];
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED522B0];
}

- (void).cxx_destruct
{
}

void __66__HKSharedSummaryCloudSyncManager_fetchAccountInfoWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch account info with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __54__HKSharedSummaryCloudSyncManager_pushWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Failed to push with error: %{public}@");
}

void __54__HKSharedSummaryCloudSyncManager_pullWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Failed to pull with error: %{public}@");
}

@end