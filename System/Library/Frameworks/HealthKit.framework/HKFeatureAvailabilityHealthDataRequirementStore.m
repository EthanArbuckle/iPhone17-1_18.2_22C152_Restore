@interface HKFeatureAvailabilityHealthDataRequirementStore
+ (id)taskIdentifier;
- (BOOL)_synchronouslyStartObservingWithError:(id *)a3;
- (HKFeatureAvailabilityHealthDataRequirementStore)initWithHealthStore:(id)a3;
- (id)_allObservedRequirements;
- (id)evaluationOfRequirements:(id)a3 error:(id *)a4;
- (void)_handleAutomaticProxyReconnection;
- (void)_notifyObservers:(id)a3;
- (void)_reevaluateAllObservedRequirementsAndNotifyObservers;
- (void)_startObservingRequirements:(id)a3 activationHandler:(id)a4;
- (void)client_featureAvailabilityRequirement:(id)a3 didUpdateSatisfaction:(BOOL)a4;
- (void)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5;
- (void)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5 activationHandler:(id)a6;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKFeatureAvailabilityHealthDataRequirementStore

- (HKFeatureAvailabilityHealthDataRequirementStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKFeatureAvailabilityHealthDataRequirementStore;
  v5 = [(HKFeatureAvailabilityHealthDataRequirementStore *)&v19 init];
  if (v5)
  {
    v6 = [HKObserverSet alloc];
    v7 = HKLogInfrastructure();
    uint64_t v8 = [(HKObserverSet *)v6 initWithName:@"HKFeatureAvailabilityHealthDataRequirementStore" loggingCategory:v7];
    observers = v5->_observers;
    v5->_observers = (HKObserverSet *)v8;

    v10 = [HKTaskServerProxyProvider alloc];
    v11 = [(id)objc_opt_class() taskIdentifier];
    v12 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v13 = [(HKTaskServerProxyProvider *)v10 initWithHealthStore:v4 taskIdentifier:v11 exportedObject:v5 taskUUID:v12];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v13;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
    v15 = objc_alloc_init(HKTaskConfiguration);
    [(HKTaskServerProxyProvider *)v5->_proxyProvider setTaskConfiguration:v15];

    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v16 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    lock_requirementsByObserver = v5->_lock_requirementsByObserver;
    v5->_lock_requirementsByObserver = (NSMapTable *)v16;
  }
  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)evaluationOfRequirements:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__25;
    v27 = __Block_byref_object_dispose__25;
    id v28 = 0;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__25;
    v21 = __Block_byref_object_dispose__25;
    id v22 = 0;
    proxyProvider = self->_proxyProvider;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke;
    v13[3] = &unk_1E58C4078;
    id v14 = v6;
    v15 = &v23;
    uint64_t v16 = &v17;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke_3;
    v12[3] = &unk_1E58BDBD8;
    v12[4] = &v17;
    [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v13 errorHandler:v12];
    id v8 = (id)v18[5];
    v9 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = v8;
      }
      else {
        _HKLogDroppedError(v8);
      }
    }

    id v10 = (id)v24[5];
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

uint64_t __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke_2;
  v4[3] = &unk_1E58C4050;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_getEvaluationOfRequirements:completion:", v2, v4);
}

void __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 count]) {
    [(HKFeatureAvailabilityHealthDataRequirementStore *)self registerObserver:v10 forRequirements:v8 queue:v9 activationHandler:0];
  }
}

- (void)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5 activationHandler:(id)a6
{
  proxyProvider = self->_proxyProvider;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(HKProxyProvider *)proxyProvider clientQueueActionHandlerWithCompletion:a6];
  os_unfair_lock_lock(&self->_lock);
  [(NSMapTable *)self->_lock_requirementsByObserver setObject:v12 forKey:v13];
  os_unfair_lock_unlock(&self->_lock);
  observers = self->_observers;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __108__HKFeatureAvailabilityHealthDataRequirementStore_registerObserver_forRequirements_queue_activationHandler___block_invoke;
  v16[3] = &unk_1E58BBA00;
  v16[4] = self;
  [(HKObserverSet *)observers registerObserver:v13 queue:v11 runIfFirstObserver:v16];

  [(HKFeatureAvailabilityHealthDataRequirementStore *)self _startObservingRequirements:v12 activationHandler:v14];
}

void __108__HKFeatureAvailabilityHealthDataRequirementStore_registerObserver_forRequirements_queue_activationHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning observation", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __108__HKFeatureAvailabilityHealthDataRequirementStore_registerObserver_forRequirements_queue_activationHandler___block_invoke_14;
  v4[3] = &unk_1E58BE428;
  objc_copyWeak(&v5, (id *)buf);
  [*(id *)(*(void *)(a1 + 32) + 16) setAutomaticProxyReconnectionHandler:v4];
  [*(id *)(*(void *)(a1 + 32) + 16) setShouldRetryOnInterruption:1];
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __108__HKFeatureAvailabilityHealthDataRequirementStore_registerObserver_forRequirements_queue_activationHandler___block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAutomaticProxyReconnection];
}

- (void)unregisterObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMapTable *)self->_lock_requirementsByObserver removeObjectForKey:v5];
  os_unfair_lock_unlock(p_lock);
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke;
  v7[3] = &unk_1E58BBA00;
  v7[4] = self;
  [(HKObserverSet *)observers unregisterObserver:v5 runIfLastObserver:v7];
}

uint64_t __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v3;
    _os_log_impl(&dword_19C023000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ending observation", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) setAutomaticProxyReconnectionHandler:0];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_2;
  v7[3] = &unk_1E58BBCC0;
  v7[4] = v4;
  return [v5 fetchProxyWithHandler:&__block_literal_global_64 errorHandler:v7];
}

uint64_t __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_17(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_2_cold_1(a1);
  }
}

- (void)_startObservingRequirements:(id)a3 activationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke;
  v13[3] = &unk_1E58C40C0;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke_2;
  v11[3] = &unk_1E58BBC48;
  v11[4] = self;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesInRequirements:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke_2_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_synchronouslyStartObservingWithError:(id *)a3
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__25;
  v21 = __Block_byref_object_dispose__25;
  id v22 = 0;
  id v5 = [(HKFeatureAvailabilityHealthDataRequirementStore *)self _allObservedRequirements];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke;
  v13[3] = &unk_1E58C4078;
  id v7 = v5;
  id v14 = v7;
  id v15 = &v23;
  uint64_t v16 = &v17;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_3;
  v12[3] = &unk_1E58BDB60;
  v12[4] = self;
  void v12[5] = &v17;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v13 errorHandler:v12];
  id v8 = (id)v18[5];
  id v9 = v8;
  if (v8)
  {
    if (a3) {
      *a3 = v8;
    }
    else {
      _HKLogDroppedError(v8);
    }
  }

  char v10 = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

uint64_t __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_2;
  v4[3] = &unk_1E58BE050;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_startObservingChangesInRequirements:completion:", v2, v4);
}

void __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_3_cold_1(a1, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)_handleAutomaticProxyReconnection
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_19C023000, v1, v2, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", (void)v3, DWORD2(v3));
}

- (void)_reevaluateAllObservedRequirementsAndNotifyObservers
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_19C023000, v1, v2, "[%{public}@] Error reevaluating requirements on automatic proxy reconnection: %{public}@", (void)v3, DWORD2(v3));
}

void __103__HKFeatureAvailabilityHealthDataRequirementStore__reevaluateAllObservedRequirementsAndNotifyObservers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
        id v13 = v12;
        if (v12) {
          objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", v11, objc_msgSend(v12, "BOOLValue"));
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)_notifyObservers:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void *)[(NSMapTable *)self->_lock_requirementsByObserver copy];
  os_unfair_lock_unlock(&self->_lock);
  observers = self->_observers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HKFeatureAvailabilityHealthDataRequirementStore__notifyObservers___block_invoke;
  v9[3] = &unk_1E58C4110;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [(HKObserverSet *)observers notifyObservers:v9];
}

void __68__HKFeatureAvailabilityHealthDataRequirementStore__notifyObservers___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  long long v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_allObservedRequirements
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSMapTable *)self->_lock_requirementsByObserver objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 unionSet:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  id v10 = (void *)[v4 copy];

  return v10;
}

- (void)client_featureAvailabilityRequirement:(id)a3 didUpdateSatisfaction:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = HKLogInfrastructure();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v13 = self;
    _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received server notification of requirement satisfaction update", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __111__HKFeatureAvailabilityHealthDataRequirementStore_client_featureAvailabilityRequirement_didUpdateSatisfaction___block_invoke;
  v9[3] = &unk_1E58C4138;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  [(HKFeatureAvailabilityHealthDataRequirementStore *)self _notifyObservers:v9];
}

void __111__HKFeatureAvailabilityHealthDataRequirementStore_client_featureAvailabilityRequirement_didUpdateSatisfaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)]) {
    [v5 featureAvailabilityRequirement:*(void *)(a1 + 32) didUpdateSatisfaction:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_requirementsByObserver, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

void __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_19C023000, v1, v2, "[%{public}@] Failed to communicate with task server for observation stop: %{public}@", (void)v3, DWORD2(v3));
}

void __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_19C023000, v1, v2, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (void)v3, DWORD2(v3));
}

void __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end