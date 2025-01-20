@interface HDHeartbeatSeriesFeatureStatusManager
- (HDHeartbeatSeriesFeatureStatusManager)initWithClient:(id)a3;
- (HDHeartbeatSeriesFeatureStatusManager)initWithProfile:(id)a3 aFibBurdenFeatureStatusManager:(id)a4 irregularRhythmNotificationsFeatureStatusManager:(id)a5 heartNotificationsUserDefaults:(id)a6;
- (id)predominantFeatureWithError:(id *)a3;
- (void)_notifyDelegateOfCurrentState;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)getPredominantFeatureWithCompletion:(id)a3;
- (void)notifyDelegateOfCurrentState;
- (void)startObservingChangesWithDelegate:(id)a3;
- (void)stopObservingChanges;
@end

@implementation HDHeartbeatSeriesFeatureStatusManager

- (HDHeartbeatSeriesFeatureStatusManager)initWithClient:(id)a3
{
  id v5 = a3;
  v6 = [v5 profile];
  v7 = [v6 profileExtensionWithIdentifier:*MEMORY[0x1E4F67D70]];

  if (([v7 conformsToProtocol:&unk_1F2B4B0C0] & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"HDHeartbeatSeriesFeatureStatusManager.m" lineNumber:35 description:@"Profile extension that provides feature availability extensions must be used"];
  }
  if (([v7 conformsToProtocol:&unk_1F2B4AED0] & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"HDHeartbeatSeriesFeatureStatusManager.m" lineNumber:36 description:@"Profile extension that provides heart defaults must be installed"];
  }
  v8 = [v7 heartNotificationsUserDefaults];
  id v9 = v7;
  v10 = [v9 featureAvailabilityExtensionForFeatureIdentifier:*MEMORY[0x1E4F29D60]];
  if (!v10)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"HDHeartbeatSeriesFeatureStatusManager.m" lineNumber:43 description:@"IRN feature availability extension not installed"];
  }
  v11 = [v9 irregularRhythmNotificationsFeatureStatusManager];
  if (!v11)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"HDHeartbeatSeriesFeatureStatusManager.m" lineNumber:45 description:@"IRN feature status manager not installed"];
  }
  v12 = [v9 featureAvailabilityExtensionForFeatureIdentifier:*MEMORY[0x1E4F29D10]];
  if (!v12)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"HDHeartbeatSeriesFeatureStatusManager.m" lineNumber:48 description:@"AFib Burden feature availability extension not installed"];
  }
  id v13 = objc_alloc(MEMORY[0x1E4F2B068]);
  v14 = [v5 profile];
  v15 = (void *)[v13 initWithFeatureAvailabilityProviding:v12 healthDataSource:v14];

  v16 = [v5 profile];

  v17 = [(HDHeartbeatSeriesFeatureStatusManager *)self initWithProfile:v16 aFibBurdenFeatureStatusManager:v15 irregularRhythmNotificationsFeatureStatusManager:v11 heartNotificationsUserDefaults:v8];
  return v17;
}

- (HDHeartbeatSeriesFeatureStatusManager)initWithProfile:(id)a3 aFibBurdenFeatureStatusManager:(id)a4 irregularRhythmNotificationsFeatureStatusManager:(id)a5 heartNotificationsUserDefaults:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HDHeartbeatSeriesFeatureStatusManager;
  v14 = [(HDHeartbeatSeriesFeatureStatusManager *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    uint64_t v16 = HKCreateSerialDispatchQueue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v15->_heartNotificationsUserDefaults, a6);
    objc_storeStrong((id *)&v15->_aFibBurdenFeatureStatusManager, a4);
    objc_storeStrong((id *)&v15->_irregularRhythmNotificationsFeatureStatusManager, a5);
  }

  return v15;
}

- (void)startObservingChangesWithDelegate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (os_log_t *)MEMORY[0x1E4F29F48];
  v6 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = objc_opt_class();
    id v9 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    __int16 v23 = 2114;
    id v24 = WeakRetained;
    _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting observing changes with delegate %{public}@", buf, 0x16u);
  }
  objc_storeWeak((id *)&self->_delegate, v4);

  id v11 = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = [v11 database];
  char v13 = [v12 isDataProtectedByFirstUnlockAvailable];

  if ((v13 & 1) == 0)
  {
    _HKInitializeLogging();
    os_log_t v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      uint64_t v16 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v22 = v16;
      id v17 = v16;
      _os_log_impl(&dword_1D3AC6000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] First unlock has not occurred, registering to notify when it has", buf, 0xCu);
    }
    v18 = [v11 database];
    queue = self->_queue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__HDHeartbeatSeriesFeatureStatusManager_startObservingChangesWithDelegate___block_invoke;
    v20[3] = &unk_1E69B41B8;
    v20[4] = self;
    [v18 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v20];
  }
  [(HKFeatureStatusManager *)self->_aFibBurdenFeatureStatusManager registerObserver:self queue:self->_queue];
  [(HKFeatureStatusManager *)self->_irregularRhythmNotificationsFeatureStatusManager registerObserver:self queue:self->_queue];
}

uint64_t __75__HDHeartbeatSeriesFeatureStatusManager_startObservingChangesWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v4 = *(id *)&v6[4];
    _os_log_impl(&dword_1D3AC6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying for first unlock", v6, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfCurrentState", *(_OWORD *)v6);
}

- (void)stopObservingChanges
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping observing changes", v6, 0xCu);
  }
  -[HKFeatureStatusManager unregisterObserver:](self->_aFibBurdenFeatureStatusManager, "unregisterObserver:", self, *(_OWORD *)v6);
  [(HKFeatureStatusManager *)self->_irregularRhythmNotificationsFeatureStatusManager unregisterObserver:self];
}

- (void)notifyDelegateOfCurrentState
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received request to notify delegate of current state", v6, 0xCu);
  }
  [(HDHeartbeatSeriesFeatureStatusManager *)self _notifyDelegateOfCurrentState];
}

- (void)_notifyDelegateOfCurrentState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __70__HDHeartbeatSeriesFeatureStatusManager__notifyDelegateOfCurrentState__block_invoke;
  v2[3] = &unk_1E69B4A38;
  v2[4] = self;
  [(HDHeartbeatSeriesFeatureStatusManager *)self getPredominantFeatureWithCompletion:v2];
}

void __70__HDHeartbeatSeriesFeatureStatusManager__notifyDelegateOfCurrentState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v7 = *(void *)(a1 + 32);
  if (v9)
  {
    objc_msgSend(WeakRetained, "heartbeatSeriesFeatureStatusManager:didUpdatePredominantFeature:", v7, objc_msgSend(v9, "integerValue"));
  }
  else if (v5)
  {
    [WeakRetained heartbeatSeriesFeatureStatusManager:v7 didFailToUpdateWithError:v5];
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 2000, @"Unknown failure to update predominant feature");
    [WeakRetained heartbeatSeriesFeatureStatusManager:v7 didFailToUpdateWithError:v8];
  }
}

- (void)getPredominantFeatureWithCompletion:(id)a3
{
  id v7 = 0;
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = [(HDHeartbeatSeriesFeatureStatusManager *)self predominantFeatureWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)predominantFeatureWithError:(id *)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  aFibBurdenFeatureStatusManager = self->_aFibBurdenFeatureStatusManager;
  id v34 = 0;
  id v6 = [(HKFeatureStatusManager *)aFibBurdenFeatureStatusManager featureStatusWithError:&v34];
  id v7 = v34;
  if (v6)
  {
    uint64_t v8 = *MEMORY[0x1E4F29C20];
    id v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
    if ([v9 areAllRequirementsSatisfied])
    {
      _HKInitializeLogging();
      id v10 = HKHRAFibBurdenLogForCategory();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

      if (v11)
      {
        id v12 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:]((uint64_t)self, v12);
        }
LABEL_15:
        v15 = &unk_1F2B423E8;
        id v21 = v7;
LABEL_44:

        id v7 = v21;
        goto LABEL_45;
      }
LABEL_16:
      v15 = &unk_1F2B423E8;
      goto LABEL_45;
    }
    uint64_t v16 = [v9 unsatisfiedRequirementIdentifiers];
    v35[0] = *MEMORY[0x1E4F29CB0];
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    int v18 = [v16 isEqualToArray:v17];

    _HKInitializeLogging();
    objc_super v19 = HKHRAFibBurdenLogForCategory();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

    if (v18)
    {
      if (v20)
      {
        id v12 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:]((uint64_t)self, v12);
        }
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    if (v20)
    {
      v22 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.8();
      }
    }
    irregularRhythmNotificationsFeatureStatusManager = self->_irregularRhythmNotificationsFeatureStatusManager;
    id v33 = v7;
    id v12 = [(HKFeatureStatusManager *)irregularRhythmNotificationsFeatureStatusManager featureStatusWithError:&v33];
    id v21 = v33;

    if (v12)
    {
      id v24 = [v12 objectForKeyedSubscript:v8];
      if ([v24 areAllRequirementsSatisfied])
      {
        uint64_t v25 = [v12 onboardingRecord];
        v26 = [v25 onboardingCompletion];
        v27 = [v26 featureIdentifier];
        int v28 = [v27 isEqualToString:*MEMORY[0x1E4F29D70]];

        _HKInitializeLogging();
        v29 = (void *)*MEMORY[0x1E4F29F48];
        BOOL v30 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEBUG);
        if (v28)
        {
          if (v30) {
            -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.5(v29);
          }
          v15 = &unk_1F2B42400;
        }
        else
        {
          if (v30) {
            -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.6(v29);
          }
          v15 = &unk_1F2B42418;
        }
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEBUG)) {
          -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.7();
        }
        v15 = &unk_1F2B42430;
      }
      goto LABEL_43;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:].cold.4();
    }
    id v31 = v21;
    id v24 = v31;
    if (v31)
    {
      if (a3)
      {
        id v24 = v31;
        v15 = 0;
        *a3 = v24;
LABEL_43:

        goto LABEL_44;
      }
      _HKLogDroppedError();
    }
    v15 = 0;
    goto LABEL_43;
  }
  _HKInitializeLogging();
  char v13 = HKHRAFibBurdenLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[HDHeartbeatSeriesFeatureStatusManager predominantFeatureWithError:]((uint64_t)self, v13);
  }

  id v14 = v7;
  id v9 = v14;
  if (!v14)
  {
LABEL_28:
    v15 = 0;
    id v7 = v9;
    goto LABEL_45;
  }
  if (!a3)
  {
    _HKLogDroppedError();
    goto LABEL_28;
  }
  id v9 = v14;
  v15 = 0;
  *a3 = v9;
  id v7 = v9;
LABEL_45:

  return v15;
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F29F48];
  id v9 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    BOOL v11 = objc_opt_class();
    id v12 = v11;
    char v13 = [v6 featureIdentifier];
    int v14 = 138543618;
    v15 = v11;
    __int16 v16 = 2114;
    id v17 = v13;
    _os_log_impl(&dword_1D3AC6000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received feature status update for %{public}@", (uint8_t *)&v14, 0x16u);
  }
  _HKInitializeLogging();
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG)) {
    -[HDHeartbeatSeriesFeatureStatusManager featureStatusProviding:didUpdateFeatureStatus:]();
  }
  [(HDHeartbeatSeriesFeatureStatusManager *)self _notifyDelegateOfCurrentState];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_aFibBurdenFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_heartNotificationsUserDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)predominantFeatureWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_6(v3);
  _os_log_error_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_ERROR, "[%@] Error reading feature status for AFib Burden", v5, 0xCu);
}

- (void)predominantFeatureWithError:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_6(v3);
  OUTLINED_FUNCTION_3_3(&dword_1D3AC6000, a2, v5, "[%@] Predominant feature is AFib Burden", v6);
}

- (void)predominantFeatureWithError:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_6(v3);
  OUTLINED_FUNCTION_3_3(&dword_1D3AC6000, a2, v5, "[%@] Predominant feature is AFib Burden though feature is not yet enabled due to IRN being enabled", v6);
}

- (void)predominantFeatureWithError:.cold.4()
{
  OUTLINED_FUNCTION_4();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = v0;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_0(v2);
  _os_log_error_impl(&dword_1D3AC6000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Error reading feature state for IRN: %{public}@", v4, 0x16u);
}

- (void)predominantFeatureWithError:(void *)a1 .cold.5(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_6(v2);
  OUTLINED_FUNCTION_3_3(&dword_1D3AC6000, v1, v4, "[%{public}@] Predominant feature is IRNv2", v5);
}

- (void)predominantFeatureWithError:(void *)a1 .cold.6(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_6(v2);
  OUTLINED_FUNCTION_3_3(&dword_1D3AC6000, v1, v4, "[%{public}@] Predominant feature is IRN", v5);
}

- (void)predominantFeatureWithError:.cold.7()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (id)objc_opt_class();
  id v10 = [v0 unsatisfiedRequirementIdentifiers];
  OUTLINED_FUNCTION_4_1(&dword_1D3AC6000, v4, v5, "[%{public}@] IRN is not available due to unmet requirements %{public}@", v6, v7, v8, v9, 2u);
}

- (void)predominantFeatureWithError:.cold.8()
{
  OUTLINED_FUNCTION_4();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_class();
  id v3 = v2;
  uint64_t v4 = [v1 unsatisfiedRequirementIdentifiers];
  int v5 = 138543618;
  uint64_t v6 = v2;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_1D3AC6000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] AFibBurden is not available due to unmet requirements %{public}@", (uint8_t *)&v5, 0x16u);
}

- (void)featureStatusProviding:didUpdateFeatureStatus:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v1 = v0;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_4_1(&dword_1D3AC6000, v4, v5, "[%{public}@] Feature status: %{public}@", v6, v7, v8, v9, v10);
}

@end