@interface HKHeartbeatSeriesFeatureStatusManager
+ (id)taskIdentifier;
- (HKHeartbeatSeriesFeatureStatusManager)initWithHealthStore:(id)a3;
- (HKHeartbeatSeriesFeatureStatusManager)initWithHealthStore:(id)a3 heartNotificationsUserDefaults:(id)a4;
- (id)_synchronouslyStartObservingWithError:(id *)a3;
- (void)_handleAutomaticProxyReconnection;
- (void)_notifyObserversForFailureToUpdateWithError:(id)a3;
- (void)_notifyObserversForPredominantFeatureUpdate:(int64_t)a3;
- (void)_startObservingHeartNotificationsUserDefaults;
- (void)_startObservingWithActivationHandler:(id)a3;
- (void)_updateAndNotifyAllObservers;
- (void)client_heartbeatSeriesFeatureStatusManagerDidFailToUpdateWithError:(id)a3;
- (void)client_heartbeatSeriesFeatureStatusManagerDidUpdatePredominantFeature:(int64_t)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)registerObserver:(id)a3 queue:(id)a4 activationHandler:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKHeartbeatSeriesFeatureStatusManager

- (HKHeartbeatSeriesFeatureStatusManager)initWithHealthStore:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithSuiteName:*MEMORY[0x1E4F2BE88]];
  v8 = [(HKHeartbeatSeriesFeatureStatusManager *)self initWithHealthStore:v5 heartNotificationsUserDefaults:v7];

  return v8;
}

- (HKHeartbeatSeriesFeatureStatusManager)initWithHealthStore:(id)a3 heartNotificationsUserDefaults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HKHeartbeatSeriesFeatureStatusManager;
  v9 = [(HKHeartbeatSeriesFeatureStatusManager *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    id v11 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 initWithName:v13 loggingCategory:*MEMORY[0x1E4F29F48]];
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v14;

    id v16 = objc_alloc(MEMORY[0x1E4F2B608]);
    v17 = [(id)objc_opt_class() taskIdentifier];
    v18 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v19 = [v16 initWithHealthStore:v7 taskIdentifier:v17 exportedObject:v10 taskUUID:v18];
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v19;

    [(HKTaskServerProxyProvider *)v10->_proxyProvider setShouldRetryOnInterruption:0];
    id v21 = objc_alloc_init(MEMORY[0x1E4F2B600]);
    [(HKTaskServerProxyProvider *)v10->_proxyProvider setTaskConfiguration:v21];

    objc_storeStrong((id *)&v10->_heartNotificationsUserDefaults, a4);
    [(HKHeartbeatSeriesFeatureStatusManager *)v10 _startObservingHeartNotificationsUserDefaults];
  }

  return v10;
}

- (void)dealloc
{
  [(NSUserDefaults *)self->_heartNotificationsUserDefaults removeObserver:self forKeyPath:*MEMORY[0x1E4F2BE60] context:HeartNotificationsUserDefaultsContext];
  v3.receiver = self;
  v3.super_class = (Class)HKHeartbeatSeriesFeatureStatusManager;
  [(HKHeartbeatSeriesFeatureStatusManager *)&v3 dealloc];
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)registerObserver:(id)a3 queue:(id)a4 activationHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  _HKInitializeLogging();
  id v11 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 138543874;
    id v23 = (id)objc_opt_class();
    __int16 v24 = 2048;
    v25 = self;
    __int16 v26 = 2112;
    id v27 = v8;
    id v13 = v23;
    _os_log_impl(&dword_1E0A83000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Registering observer %@", buf, 0x20u);
  }
  observers = self->_observers;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke;
  v21[3] = &unk_1E6D49A78;
  v21[4] = self;
  [(HKObserverSet *)observers registerObserver:v8 queue:v10 runIfFirstObserver:v21];

  v15 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:v9];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_3;
  v18[3] = &unk_1E6D49F18;
  v18[4] = self;
  id v19 = v8;
  id v20 = v15;
  id v16 = v15;
  id v17 = v8;
  [(HKHeartbeatSeriesFeatureStatusManager *)self _startObservingWithActivationHandler:v18];
}

void __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = MEMORY[0x1E4F143A8];
  uint64_t v3 = 3221225472;
  v4 = __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_2;
  id v5 = &unk_1E6D49A00;
  objc_copyWeak(&v6, &location);
  [*(id *)(*(void *)(a1 + 32) + 24) setAutomaticProxyReconnectionHandler:&v2];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setShouldRetryOnInterruption:", 1, v2, v3, v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAutomaticProxyReconnection];
}

void __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  id v9 = *(void **)(v7 + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_4;
  v12[3] = &unk_1E6D49EF0;
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  [v9 notifyObserver:v8 handler:v12];
  (*(void (**)(void))(a1[6] + 16))();
}

void __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v7 = v3;
  if (v4)
  {
    objc_msgSend(v3, "heartbeatSeriesFeatureStatusManager:didUpdatePredominantFeature:", v5, objc_msgSend(v4, "integerValue"));
  }
  else if (a1[6])
  {
    objc_msgSend(v3, "heartbeatSeriesFeatureStatusManager:didFailToUpdateWithError:", v5);
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 2000, @"Unknown error starting observation");
    [v7 heartbeatSeriesFeatureStatusManager:v5 didFailToUpdateWithError:v6];
  }
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)buf = 138543874;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    id v7 = v11;
    _os_log_impl(&dword_1E0A83000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Unregistering observer %@", buf, 0x20u);
  }
  observers = self->_observers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke;
  v9[3] = &unk_1E6D49A78;
  v9[4] = self;
  [(HKObserverSet *)observers unregisterObserver:v4 runIfLastObserver:v9];
}

uint64_t __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setAutomaticProxyReconnectionHandler:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke_3;
  v5[3] = &unk_1E6D49A50;
  v5[4] = v2;
  return [v3 fetchProxyWithHandler:&__block_literal_global_5 errorHandler:v5];
}

uint64_t __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke_3_cold_1(a1, v4);
  }
}

- (void)_startObservingWithActivationHandler:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke;
  v9[3] = &unk_1E6D49F60;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke_2;
  v7[3] = &unk_1E6D49CC0;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(void *)(a1 + 32));
}

void __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke_2_cold_1(a1, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_synchronouslyStartObservingWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__2;
  id v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke;
  v10[3] = &unk_1E6D49F88;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3;
  v9[3] = &unk_1E6D49AC0;
  void v9[4] = self;
  void v9[5] = &v11;
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

uint64_t __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_2;
  v3[3] = &unk_1E6D49BF8;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", v3);
}

void __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(a1, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)_handleAutomaticProxyReconnection
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_2_1(&dword_1E0A83000, v3, v4, "[%{public}@:%p] Failed to resume observation on server reconnection: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)_startObservingHeartNotificationsUserDefaults
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((void *)HeartNotificationsUserDefaultsContext == a6)
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      *(_DWORD *)buf = 138543618;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2048;
      __int16 v14 = self;
      id v9 = v12;
      _os_log_impl(&dword_1E0A83000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Received KVO notification of notification settings change", buf, 0x16u);
    }
    [(HKHeartbeatSeriesFeatureStatusManager *)self _updateAndNotifyAllObservers];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HKHeartbeatSeriesFeatureStatusManager;
    -[HKHeartbeatSeriesFeatureStatusManager observeValueForKeyPath:ofObject:change:context:](&v10, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_updateAndNotifyAllObservers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(HKObserverSet *)self->_observers count])
  {
    proxyProvider = self->_proxyProvider;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__HKHeartbeatSeriesFeatureStatusManager__updateAndNotifyAllObservers__block_invoke_2;
    v7[3] = &unk_1E6D49A50;
    v7[4] = self;
    [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:&__block_literal_global_316 errorHandler:v7];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v4 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      *(_DWORD *)buf = 138543362;
      id v9 = (id)objc_opt_class();
      id v6 = v9;
      _os_log_impl(&dword_1E0A83000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping a manual update and notify because we have no observers", buf, 0xCu);
    }
  }
}

uint64_t __69__HKHeartbeatSeriesFeatureStatusManager__updateAndNotifyAllObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateAndNotifyAllObservers");
}

void __69__HKHeartbeatSeriesFeatureStatusManager__updateAndNotifyAllObservers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
    __69__HKHeartbeatSeriesFeatureStatusManager__updateAndNotifyAllObservers__block_invoke_2_cold_1(a1, v4);
  }
}

- (void)client_heartbeatSeriesFeatureStatusManagerDidUpdatePredominantFeature:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    id v9 = NSStringFromHKHeartbeatSeriesFeature(a3);
    uint64_t v10 = HKSensitiveLogItem();
    int v11 = 138543874;
    id v12 = v7;
    __int16 v13 = 2048;
    __int16 v14 = self;
    __int16 v15 = 2114;
    id v16 = v10;
    _os_log_impl(&dword_1E0A83000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Received server notification of predominant feature update: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  [(HKHeartbeatSeriesFeatureStatusManager *)self _notifyObserversForPredominantFeatureUpdate:a3];
}

- (void)client_heartbeatSeriesFeatureStatusManagerDidFailToUpdateWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)id v8 = 138543874;
    *(void *)&v8[4] = objc_opt_class();
    *(_WORD *)&v8[12] = 2048;
    *(void *)&v8[14] = self;
    *(_WORD *)&v8[22] = 2114;
    id v9 = v4;
    id v7 = *(id *)&v8[4];
    _os_log_impl(&dword_1E0A83000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Received server notification of update error: %{public}@", v8, 0x20u);
  }
  -[HKHeartbeatSeriesFeatureStatusManager _notifyObserversForFailureToUpdateWithError:](self, "_notifyObserversForFailureToUpdateWithError:", v4, *(_OWORD *)v8, *(void *)&v8[16], v9);
}

- (void)_notifyObserversForPredominantFeatureUpdate:(int64_t)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__HKHeartbeatSeriesFeatureStatusManager__notifyObserversForPredominantFeatureUpdate___block_invoke;
  v4[3] = &unk_1E6D49FB0;
  v4[4] = self;
  v4[5] = a3;
  [(HKObserverSet *)observers notifyObservers:v4];
}

uint64_t __85__HKHeartbeatSeriesFeatureStatusManager__notifyObserversForPredominantFeatureUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 heartbeatSeriesFeatureStatusManager:*(void *)(a1 + 32) didUpdatePredominantFeature:*(void *)(a1 + 40)];
}

- (void)_notifyObserversForFailureToUpdateWithError:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__HKHeartbeatSeriesFeatureStatusManager__notifyObserversForFailureToUpdateWithError___block_invoke;
  v7[3] = &unk_1E6D49FD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)observers notifyObservers:v7];
}

uint64_t __85__HKHeartbeatSeriesFeatureStatusManager__notifyObserversForFailureToUpdateWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 heartbeatSeriesFeatureStatusManager:*(void *)(a1 + 32) didFailToUpdateWithError:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartNotificationsUserDefaults, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_3(v3);
  OUTLINED_FUNCTION_1_1(&dword_1E0A83000, v5, v6, "[%{public}@:%p] Failed to communicate with task server for observation stop: %{public}@", v7, v8, v9, v10, v11);
}

void __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_3(v3);
  OUTLINED_FUNCTION_1_1(&dword_1E0A83000, v5, v6, "[%{public}@:%p] Failed to communicate with task server for observation start: %{public}@", v7, v8, v9, v10, v11);
}

void __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (id)objc_opt_class();
  OUTLINED_FUNCTION_2_1(&dword_1E0A83000, v4, v5, "[%{public}@:%p] Failed to communicate with task server for observation start: %{public}@", v6, v7, v8, v9, 2u);
}

void __69__HKHeartbeatSeriesFeatureStatusManager__updateAndNotifyAllObservers__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_3(v3);
  OUTLINED_FUNCTION_1_1(&dword_1E0A83000, v5, v6, "[%{public}@:%p] Failed to communicate with task server for update and notify: %{public}@", v7, v8, v9, v10, v11);
}

@end