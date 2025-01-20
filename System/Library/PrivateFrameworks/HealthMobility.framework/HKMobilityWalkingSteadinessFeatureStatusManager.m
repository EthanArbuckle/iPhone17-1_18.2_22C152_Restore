@interface HKMobilityWalkingSteadinessFeatureStatusManager
- (BOOL)isFitnessTrackingEnabled;
- (HKMobilityWalkingSteadinessFeatureStatusManager)initWithHealthStore:(id)a3;
- (id)notificationStatusWithError:(id *)a3;
- (id)onboardingStatusWithError:(id *)a3;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)client_didUpdateFitnessTrackingEnabled:(BOOL)a3;
- (void)client_didUpdateNotificationStatus:(id)a3;
- (void)client_didUpdateOnboardingStatus:(id)a3;
- (void)connectionInvalidated;
- (void)isFitnessTrackingEnabled;
- (void)removeObserver:(id)a3;
- (void)resetOnboarding;
- (void)setNotificationsEnabled:(BOOL)a3;
@end

@implementation HKMobilityWalkingSteadinessFeatureStatusManager

- (HKMobilityWalkingSteadinessFeatureStatusManager)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMobilityWalkingSteadinessFeatureStatusManager;
  v5 = [(HKMobilityWalkingSteadinessFeatureStatusManager *)&v16 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v7 = [v6 initWithName:@"HKMobilityWalkingSteadinessFeatureStatusManager" loggingCategory:*MEMORY[0x1E4F29F78]];
    observers = v5->_observers;
    v5->_observers = (HKObserverSet *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F2B608]);
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v9 initWithHealthStore:v4 taskIdentifier:@"HKMobilityWalkingSteadinessFeatureStatusManagerServer" exportedObject:v5 taskUUID:v10];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    [(HKTaskServerProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
    id v13 = objc_alloc_init(MEMORY[0x1E4F2B600]);
    [(HKTaskServerProxyProvider *)v5->_proxyProvider setTaskConfiguration:v13];

    v14 = v5;
  }

  return v5;
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
  v10[2] = __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke;
  v10[3] = &unk_1E6D4D0D8;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke_3;
  v9[3] = &unk_1E6D4D100;
  v9[4] = &v11;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
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

uint64_t __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke_2;
  v3[3] = &unk_1E6D4D0B0;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_onboardingStatusWithCompletion:", v3);
}

void __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __77__HKMobilityWalkingSteadinessFeatureStatusManager_onboardingStatusWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)resetOnboarding
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E0B16000, v0, v1, "[%{public}@] Error while resetting onboarding: %{public}@");
}

uint64_t __66__HKMobilityWalkingSteadinessFeatureStatusManager_resetOnboarding__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__HKMobilityWalkingSteadinessFeatureStatusManager_resetOnboarding__block_invoke_2;
  v3[3] = &unk_1E6D4D128;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_resetOnboardingWithCompletion:", v3);
}

void __66__HKMobilityWalkingSteadinessFeatureStatusManager_resetOnboarding__block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __66__HKMobilityWalkingSteadinessFeatureStatusManager_resetOnboarding__block_invoke_3(uint64_t a1, void *a2)
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
  v10[2] = __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke;
  v10[3] = &unk_1E6D4D0D8;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke_3;
  v9[3] = &unk_1E6D4D100;
  v9[4] = &v11;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
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

uint64_t __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke_2;
  v3[3] = &unk_1E6D4D150;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_notificationStatusWithCompletion:", v3);
}

void __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __79__HKMobilityWalkingSteadinessFeatureStatusManager_notificationStatusWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  proxyProvider = self->_proxyProvider;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke;
  v5[3] = &unk_1E6D4D178;
  BOOL v6 = a3;
  v5[4] = v13;
  v5[5] = &v7;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke_3;
  v4[3] = &unk_1E6D4D100;
  v4[4] = &v7;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v5 errorHandler:v4];
  if (v8[5])
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_ERROR)) {
      -[HKMobilityWalkingSteadinessFeatureStatusManager setNotificationsEnabled:]();
    }
  }
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
}

uint64_t __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke_2;
  v4[3] = &unk_1E6D4D128;
  long long v5 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_setNotificationsEnabled:withCompletion:", v2, v4);
}

void __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __75__HKMobilityWalkingSteadinessFeatureStatusManager_setNotificationsEnabled___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)isFitnessTrackingEnabled
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  proxyProvider = self->_proxyProvider;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke;
  v6[3] = &unk_1E6D4D0D8;
  v6[4] = &v13;
  v6[5] = &v7;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke_3;
  v5[3] = &unk_1E6D4D100;
  v5[4] = &v7;
  [(HKTaskServerProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v6 errorHandler:v5];
  if (v8[5])
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_FAULT)) {
      -[HKMobilityWalkingSteadinessFeatureStatusManager isFitnessTrackingEnabled]();
    }
  }
  char v3 = [(id)v14[5] BOOLValue];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v3;
}

uint64_t __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke_2;
  v3[3] = &unk_1E6D4D128;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_fitnessTrackingEnabledWithCompletion:", v3);
}

void __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = [NSNumber numberWithBool:a2];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

void __75__HKMobilityWalkingSteadinessFeatureStatusManager_isFitnessTrackingEnabled__block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke;
  v5[3] = &unk_1E6D4D1F0;
  v5[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

void __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) clientQueueActionHandlerWithCompletion:0];
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(void **)(v3 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_2;
  v7[3] = &unk_1E6D4D1A0;
  id v8 = v2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_3;
  v6[3] = &unk_1E6D4D1C8;
  v6[4] = v3;
  id v5 = v2;
  [v4 fetchProxyWithHandler:v7 errorHandler:v6];
}

uint64_t __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(void *)(a1 + 32));
}

void __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_ERROR)) {
    __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_3_cold_1();
  }
}

- (void)removeObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke;
  v4[3] = &unk_1E6D4D1F0;
  void v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke_3;
  v4[3] = &unk_1E6D4D1C8;
  void v4[4] = v1;
  return [v2 fetchProxyWithHandler:&__block_literal_global_0 errorHandler:v4];
}

uint64_t __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_ERROR)) {
    __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke_3_cold_1();
  }
}

- (void)client_didUpdateOnboardingStatus:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29F78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = self;
    _os_log_impl(&dword_1E0B16000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers that onboarding status changed", buf, 0xCu);
  }
  observers = self->_observers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateOnboardingStatus___block_invoke;
  v8[3] = &unk_1E6D4D238;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HKObserverSet *)observers notifyObservers:v8];
}

void __84__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateOnboardingStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureStatusManager:*(void *)(a1 + 32) didUpdateOnboardingStatus:*(void *)(a1 + 40)];
  }
}

- (void)client_didUpdateNotificationStatus:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29F78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = self;
    _os_log_impl(&dword_1E0B16000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observers that notification status changed", buf, 0xCu);
  }
  observers = self->_observers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateNotificationStatus___block_invoke;
  v8[3] = &unk_1E6D4D238;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(HKObserverSet *)observers notifyObservers:v8];
}

void __86__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateNotificationStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureStatusManager:*(void *)(a1 + 32) didUpdateNotificationStatus:*(void *)(a1 + 40)];
  }
}

- (void)client_didUpdateFitnessTrackingEnabled:(BOOL)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __90__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateFitnessTrackingEnabled___block_invoke;
  v4[3] = &unk_1E6D4D260;
  void v4[4] = self;
  BOOL v5 = a3;
  [(HKObserverSet *)observers notifyObservers:v4];
}

void __90__HKMobilityWalkingSteadinessFeatureStatusManager_client_didUpdateFitnessTrackingEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureStatusManager:*(void *)(a1 + 32) didUpdateFitnessTrackingEnabled:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)connectionInvalidated
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B16000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Connection invalidated", (uint8_t *)&v2, 0xCu);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setNotificationsEnabled:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E0B16000, v0, v1, "[%{public}@] Error while setting notification enabled: %{public}@");
}

- (void)isFitnessTrackingEnabled
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1E0B16000, v0, OS_LOG_TYPE_FAULT, "[%{public}@] Error while reading fitness tracking enabled setting: %{public}@", v1, 0x16u);
}

void __69__HKMobilityWalkingSteadinessFeatureStatusManager_addObserver_queue___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E0B16000, v0, v1, "[%{public}@] Failed to communicate with task server for observation start: %{public}@");
}

void __66__HKMobilityWalkingSteadinessFeatureStatusManager_removeObserver___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E0B16000, v0, v1, "[%{public}@] Failed to communicate with task server for observation stop: %{public}@");
}

@end