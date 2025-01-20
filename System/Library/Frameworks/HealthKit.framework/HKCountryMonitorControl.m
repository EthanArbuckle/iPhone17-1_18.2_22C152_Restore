@interface HKCountryMonitorControl
+ (id)taskIdentifier;
+ (void)checkCurrentCountry;
+ (void)checkCurrentCountryWithHealthStore:(id)a3;
- (HKCountryMonitorControl)initWithHealthStore:(id)a3;
- (void)dealloc;
- (void)fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:(id)a3;
@end

@implementation HKCountryMonitorControl

- (HKCountryMonitorControl)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKCountryMonitorControl;
  v5 = [(HKCountryMonitorControl *)&v12 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

- (void)dealloc
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_11(v0);
  OUTLINED_FUNCTION_1_3(&dword_19C023000, v2, v3, "[%{public}@:%p] Deallocating", v4, v5, v6, v7, v8);
}

+ (id)taskIdentifier
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (void)checkCurrentCountry
{
  uint64_t v3 = objc_alloc_init(HKHealthStore);
  [a1 checkCurrentCountryWithHealthStore:v3];
}

+ (void)checkCurrentCountryWithHealthStore:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithHealthStore:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HKCountryMonitorControl_checkCurrentCountryWithHealthStore___block_invoke;
  v7[3] = &unk_1E58C2DF8;
  id v8 = v5;
  id v6 = v5;
  [v6 fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:v7];
}

void __62__HKCountryMonitorControl_checkCurrentCountryWithHealthStore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = HKLogInfrastructure();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543874;
    v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v5;
    id v9 = v7;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Completed fetch of current ISO country code with error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogInfrastructure();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    uint64_t v7 = HKLogInfrastructure();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[HKCountryMonitorControl fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:]();
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke;
  aBlock[3] = &unk_1E58C2E48;
  aBlock[4] = self;
  id v17 = v4;
  id v8 = v4;
  id v9 = _Block_copy(aBlock);
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_3;
  v14[3] = &unk_1E58C2E70;
  id v15 = v9;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_4;
  v12[3] = &unk_1E58BBC48;
  v12[4] = self;
  id v13 = v15;
  id v11 = v15;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v14 errorHandler:v12];
}

void __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [*(id *)(*(void *)(a1 + 32) + 8) clientQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_2;
  v12[3] = &unk_1E58C2E20;
  id v15 = *(id *)(a1 + 40);
  uint64_t v16 = a3;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);
}

uint64_t __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[7], a1[5]);
  }
  return result;
}

uint64_t __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:", *(void *)(a1 + 32));
}

void __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_4_cold_1(a1, (uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

- (void)fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_11(v0);
  OUTLINED_FUNCTION_1_3(&dword_19C023000, v2, v3, "[%{public}@:%p] Fetching current country ISO country code and notifying observers", v4, v5, v6, v7, v8);
}

void __86__HKCountryMonitorControl_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke_4_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 32);
  int v9 = 138543874;
  id v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = a2;
  id v8 = v6;
  _os_log_error_impl(&dword_19C023000, a3, OS_LOG_TYPE_ERROR, "[%{public}@:%p] Failed to communicate with task server to fetch current ISO country code and notify observers: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end