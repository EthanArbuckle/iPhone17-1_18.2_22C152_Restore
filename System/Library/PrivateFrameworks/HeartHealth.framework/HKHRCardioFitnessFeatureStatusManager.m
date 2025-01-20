@interface HKHRCardioFitnessFeatureStatusManager
+ (id)taskIdentifier;
- (BOOL)_synchronouslyStartObservingWithError:(id *)a3;
- (HKHRCardioFitnessFeatureStatusManager)initWithHealthStore:(id)a3;
- (HKHRCardioFitnessFeatureStatusManager)initWithProxyProvider:(id)a3;
- (id)notificationStatusWithError:(id *)a3;
- (id)onboardingStatusWithError:(id *)a3;
- (void)_handleAutomaticProxyReconnection;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)client_didUpdateNotificationStatus:(id)a3;
- (void)client_didUpdateOnboardingStatus:(id)a3;
- (void)connectionInvalidated;
- (void)removeObserver:(id)a3;
- (void)resetOnboarding;
- (void)setNotificationsEnabled:(BOOL)a3;
@end

@implementation HKHRCardioFitnessFeatureStatusManager

- (HKHRCardioFitnessFeatureStatusManager)initWithHealthStore:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F2B608];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = +[HKHRCardioFitnessFeatureStatusManager taskIdentifier];
  v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = (void *)[v6 initWithHealthStore:v5 taskIdentifier:v7 exportedObject:self taskUUID:v8];

  [v9 setShouldRetryOnInterruption:0];
  id v10 = objc_alloc_init(MEMORY[0x1E4F2B600]);
  [v9 setTaskConfiguration:v10];

  v11 = [(HKHRCardioFitnessFeatureStatusManager *)self initWithProxyProvider:v9];
  return v11;
}

- (HKHRCardioFitnessFeatureStatusManager)initWithProxyProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHRCardioFitnessFeatureStatusManager;
  id v6 = [(HKHRCardioFitnessFeatureStatusManager *)&v11 init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v8 = [v7 initWithName:@"HKHRCardioFitnessFeatureStatusManager" loggingCategory:*MEMORY[0x1E4F29F48]];
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v8;

    objc_storeStrong((id *)&v6->_proxyProvider, a3);
  }

  return v6;
}

- (id)onboardingStatusWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke;
  v10[3] = &unk_1E6D49938;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke_3;
  v9[3] = &unk_1E6D49960;
  v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke_2;
  v3[3] = &unk_1E6D49910;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_onboardingStatusWithCompletion:", v3);
}

void __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __67__HKHRCardioFitnessFeatureStatusManager_onboardingStatusWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)resetOnboarding
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v0, v1, "[%{public}@] Error while resetting onboarding: %{public}@");
}

uint64_t __56__HKHRCardioFitnessFeatureStatusManager_resetOnboarding__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__HKHRCardioFitnessFeatureStatusManager_resetOnboarding__block_invoke_2;
  v3[3] = &unk_1E6D49988;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_resetOnboardingWithCompletion:", v3);
}

void __56__HKHRCardioFitnessFeatureStatusManager_resetOnboarding__block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __56__HKHRCardioFitnessFeatureStatusManager_resetOnboarding__block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)notificationStatusWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke;
  v10[3] = &unk_1E6D49938;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke_3;
  v9[3] = &unk_1E6D49960;
  v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke_2;
  v3[3] = &unk_1E6D499B0;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_notificationStatusWithCompletion:", v3);
}

void __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __69__HKHRCardioFitnessFeatureStatusManager_notificationStatusWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  proxyProvider = self->_proxyProvider;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke;
  v5[3] = &unk_1E6D499D8;
  BOOL v6 = a3;
  v5[4] = v13;
  v5[5] = &v7;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke_3;
  v4[3] = &unk_1E6D49960;
  v4[4] = &v7;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v5 errorHandler:v4];
  if (v8[5])
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      -[HKHRCardioFitnessFeatureStatusManager setNotificationsEnabled:]();
    }
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
}

uint64_t __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke_2;
  v4[3] = &unk_1E6D49988;
  long long v5 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_setNotificationsEnabled:withCompletion:", v2, v4);
}

void __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __65__HKHRCardioFitnessFeatureStatusManager_setNotificationsEnabled___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke;
  v5[3] = &unk_1E6D49A78;
  v5[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

void __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_2;
  v8[3] = &unk_1E6D49A00;
  objc_copyWeak(&v9, &location);
  [*(id *)(*(void *)(a1 + 32) + 16) setAutomaticProxyReconnectionHandler:v8];
  [*(id *)(*(void *)(a1 + 32) + 16) setShouldRetryOnInterruption:1];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) clientQueueActionHandlerWithCompletion:0];
  v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_3;
  v6[3] = &unk_1E6D49A28;
  id v4 = v2;
  id v7 = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_4;
  v5[3] = &unk_1E6D49A50;
  v5[4] = *(void *)(a1 + 32);
  [v3 fetchProxyWithHandler:v6 errorHandler:v5];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAutomaticProxyReconnection];
}

uint64_t __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(void *)(a1 + 32));
}

void __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_4_cold_1(a1);
  }
}

- (void)removeObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke;
  v4[3] = &unk_1E6D49A78;
  void v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setAutomaticProxyReconnectionHandler:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke_3;
  v5[3] = &unk_1E6D49A50;
  v5[4] = v2;
  return [v3 fetchProxyWithHandler:&__block_literal_global_2 errorHandler:v5];
}

uint64_t __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke_3_cold_1(a1);
  }
}

- (BOOL)_synchronouslyStartObservingWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke;
  v10[3] = &unk_1E6D49938;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3;
  v9[3] = &unk_1E6D49AC0;
  v9[4] = self;
  void v9[5] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  BOOL v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  char v7 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_2;
  v3[3] = &unk_1E6D49988;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", v3);
}

void __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = *MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)_handleAutomaticProxyReconnection
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v1, v2, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", (void)v3, DWORD2(v3));
}

- (void)client_didUpdateNotificationStatus:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HKHRCardioFitnessFeatureStatusManager_client_didUpdateNotificationStatus___block_invoke;
  v7[3] = &unk_1E6D49AE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)observers notifyObservers:v7];
}

void __76__HKHRCardioFitnessFeatureStatusManager_client_didUpdateNotificationStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureStatusManager:*(void *)(a1 + 32) didUpdateNotificationStatus:*(void *)(a1 + 40)];
  }
}

- (void)client_didUpdateOnboardingStatus:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__HKHRCardioFitnessFeatureStatusManager_client_didUpdateOnboardingStatus___block_invoke;
  v7[3] = &unk_1E6D49AE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)observers notifyObservers:v7];
}

void __74__HKHRCardioFitnessFeatureStatusManager_client_didUpdateOnboardingStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureStatusManager:*(void *)(a1 + 32) didUpdateOnboardingStatus:*(void *)(a1 + 40)];
  }
}

- (void)connectionInvalidated
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0A83000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Connection invalidated", (uint8_t *)&v2, 0xCu);
}

+ (id)taskIdentifier
{
  int v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setNotificationsEnabled:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v0, v1, "[%{public}@] Error while setting notification enabled: %{public}@");
}

void __59__HKHRCardioFitnessFeatureStatusManager_addObserver_queue___block_invoke_4_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v1, v2, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (void)v3, DWORD2(v3));
}

void __56__HKHRCardioFitnessFeatureStatusManager_removeObserver___block_invoke_3_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1E0A83000, v1, v2, "[%{public}@] Failed to communicate with task server for observation stop: %{public}@", (void)v3, DWORD2(v3));
}

void __79__HKHRCardioFitnessFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1E0A83000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end