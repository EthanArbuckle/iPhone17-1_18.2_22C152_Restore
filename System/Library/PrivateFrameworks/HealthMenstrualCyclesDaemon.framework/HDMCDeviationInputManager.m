@interface HDMCDeviationInputManager
- (BOOL)clearStateIfNecessaryFromSettings:(id)a3 usageRequirementsSatisfied:(BOOL)a4 error:(id *)a5;
- (HDMCDeviationInputManager)initWithProfile:(id)a3;
@end

@implementation HDMCDeviationInputManager

- (BOOL)clearStateIfNecessaryFromSettings:(id)a3 usageRequirementsSatisfied:(BOOL)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ([a3 deviationDetectionEnabledForAnyType] && a4) {
    return 1;
  }
  keyValueDomain = self->_keyValueDomain;
  id v39 = 0;
  v10 = [(HDKeyValueDomain *)keyValueDomain hdmc_unconfirmedDeviationDismissalDayIndexWithError:&v39];
  id v11 = v39;

  if (v10)
  {

    v12 = self->_keyValueDomain;
    id v38 = 0;
    BOOL v13 = [(HDKeyValueDomain *)v12 hdmc_setUnconfirmedDeviationDismissalDayIndex:0 error:&v38];
    id v14 = v38;
    if (v13)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      uint64_t v16 = [WeakRetained cloudSyncManager];
      id v17 = objc_alloc(MEMORY[0x263F0A1C8]);
      v18 = (void *)[objc_alloc(MEMORY[0x263F0A160]) initWithPush:1 pull:0 lite:1];
      v19 = (void *)[v17 initWithChangesSyncRequest:v18];
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __96__HDMCDeviationInputManager_clearStateIfNecessaryFromSettings_usageRequirementsSatisfied_error___block_invoke;
      v37[3] = &unk_264750820;
      v37[4] = self;
      [(id)v16 syncWithRequest:v19 reason:v21 completion:v37];

      analyticsKeyValueDomain = self->_analyticsKeyValueDomain;
      id v36 = v14;
      LOBYTE(v16) = [(HDKeyValueDomain *)analyticsKeyValueDomain setValueForAllKeys:0 error:&v36];
      id v23 = v36;

      _HKInitializeLogging();
      v24 = (void *)*MEMORY[0x263F09930];
      v25 = *MEMORY[0x263F09930];
      if (v16)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v24;
          v27 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v41 = v27;
          id v28 = v27;
          _os_log_impl(&dword_225722000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cleared key value domain of deviation detection analytics state", buf, 0xCu);
        }
        return 1;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[HDMCDeviationInputManager clearStateIfNecessaryFromSettings:usageRequirementsSatisfied:error:](v24);
      }
      id v30 = v23;
    }
    else
    {
      _HKInitializeLogging();
      v29 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HDMCDeviationInputManager clearStateIfNecessaryFromSettings:usageRequirementsSatisfied:error:](v29);
      }
      id v30 = v14;
    }
    v31 = v30;
    if (v30)
    {
      if (a5) {
        *a5 = v30;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  else
  {
    if (!v11)
    {
      _HKInitializeLogging();
      v32 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        v34 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v41 = v34;
        id v35 = v34;
        _os_log_impl(&dword_225722000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to clear in key-value domain", buf, 0xCu);
      }
      return 1;
    }
    if (a5) {
      *a5 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }
  return 0;
}

- (HDMCDeviationInputManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDMCDeviationInputManager;
  v5 = [(HDMCDeviationInputManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = objc_msgSend(MEMORY[0x263F43218], "hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:", v4);
    keyValueDomain = v6->_keyValueDomain;
    v6->_keyValueDomain = (HDKeyValueDomain *)v7;

    uint64_t v9 = objc_msgSend(MEMORY[0x263F43218], "hdmc_deviationDetectionAnalyticsProtectedDomainWithProfile:", v4);
    analyticsKeyValueDomain = v6->_analyticsKeyValueDomain;
    v6->_analyticsKeyValueDomain = (HDKeyValueDomain *)v9;
  }
  return v6;
}

void __96__HDMCDeviationInputManager_clearStateIfNecessaryFromSettings_usageRequirementsSatisfied_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x263F09930];
  uint64_t v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_225722000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __96__HDMCDeviationInputManager_clearStateIfNecessaryFromSettings_usageRequirementsSatisfied_error___block_invoke_cold_1(a1, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)clearStateIfNecessaryFromSettings:(void *)a1 usageRequirementsSatisfied:error:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Error clearing key value domain of deviation detection analytics state: %{public}@", v6, v7, v8, v9, v10);
}

- (void)clearStateIfNecessaryFromSettings:(void *)a1 usageRequirementsSatisfied:error:.cold.2(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Error clearing key value domain of dismissal day index state: %{public}@", v6, v7, v8, v9, v10);
}

void __96__HDMCDeviationInputManager_clearStateIfNecessaryFromSettings_usageRequirementsSatisfied_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Cloud sync request failed: %{public}@", v7, v8, v9, v10, v11);
}

@end