@interface HDHRIrregularRhythmNotificationsSettingMigrator
- (HDFeatureAvailabilityExtension)v1FeatureAvailabilityManager;
- (HDFeatureAvailabilityExtension)v2FeatureAvailabilityManager;
- (HDHRIrregularRhythmNotificationsSettingMigrator)initWithV1FeatureAvailabilityManager:(id)a3 v2FeatureAvailabilityManager:(id)a4;
- (OS_dispatch_queue)queue;
- (void)_startObservingSettingChanges;
- (void)_syncSettingIfPossibleFromManager:(id)a3 toManager:(id)a4;
- (void)_syncSettingIfPossibleFromSource:(id)a3;
@end

@implementation HDHRIrregularRhythmNotificationsSettingMigrator

- (HDHRIrregularRhythmNotificationsSettingMigrator)initWithV1FeatureAvailabilityManager:(id)a3 v2FeatureAvailabilityManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDHRIrregularRhythmNotificationsSettingMigrator;
  v9 = [(HDHRIrregularRhythmNotificationsSettingMigrator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_v1FeatureAvailabilityManager, a3);
    objc_storeStrong((id *)&v10->_v2FeatureAvailabilityManager, a4);
    uint64_t v11 = HKCreateSerialDispatchQueue();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    [(HDHRIrregularRhythmNotificationsSettingMigrator *)v10 _startObservingSettingChanges];
  }

  return v10;
}

- (void)_startObservingSettingChanges
{
  [(HDFeatureAvailabilityExtension *)self->_v1FeatureAvailabilityManager registerObserver:self queue:self->_queue];
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  queue = self->_queue;

  [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager registerObserver:self queue:queue];
}

- (void)_syncSettingIfPossibleFromSource:(id)a3
{
  id v7 = a3;
  v4 = [v7 featureIdentifier];
  uint64_t v5 = 8;
  if (v4 == (void *)*MEMORY[0x1E4F29D68]) {
    uint64_t v5 = 16;
  }
  id v6 = *(id *)((char *)&self->super.isa + v5);

  [(HDHRIrregularRhythmNotificationsSettingMigrator *)self _syncSettingIfPossibleFromManager:v7 toManager:v6];
}

- (void)_syncSettingIfPossibleFromManager:(id)a3 toManager:(id)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v86 = 0;
  id v8 = [v6 featureOnboardingRecordWithError:&v86];
  v9 = v86;
  os_log_t v10 = v9;
  if (v8)
  {
    v85 = v9;
    uint64_t v11 = [v7 featureOnboardingRecordWithError:&v85];
    os_log_t v12 = v85;

    if (!v11)
    {
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
      {
        v19 = v25;
        v26 = objc_opt_class();
        v27 = v12;
        id v28 = v26;
        v29 = [v7 featureIdentifier];
        *(_DWORD *)buf = 138543874;
        v88 = v26;
        __int16 v89 = 2114;
        v90 = v29;
        __int16 v91 = 2114;
        v92 = v27;
        _os_log_error_impl(&dword_1D3AC6000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to retrieve onboarding record for %{public}@: %{public}@", buf, 0x20u);

        os_log_t v12 = v27;
LABEL_36:

        goto LABEL_37;
      }
      goto LABEL_37;
    }
    if ([v8 onboardingState] == 1)
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
      {
        loga = v13;
        objc_super v14 = v12;
        v15 = objc_opt_class();
        id v74 = v15;
        v16 = [v6 featureIdentifier];
        v17 = [v7 featureIdentifier];
        v18 = [v6 featureIdentifier];
        *(_DWORD *)buf = 138544130;
        v88 = v15;
        os_log_t v12 = v14;
        __int16 v89 = 2114;
        v90 = v16;
        __int16 v91 = 2114;
        v92 = v17;
        __int16 v93 = 2114;
        v94 = v18;
        v19 = loga;
        _os_log_impl(&dword_1D3AC6000, loga, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping setting sync from %{public}@ to %{public}@: %{public}@ is not onboarded", buf, 0x2Au);

LABEL_13:
        goto LABEL_36;
      }
      goto LABEL_37;
    }
    if ([v11 onboardingState] == 1)
    {
      _HKInitializeLogging();
      v30 = (void *)*MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
      {
        v19 = v30;
        v31 = objc_opt_class();
        id v74 = v31;
        [v6 featureIdentifier];
        v33 = v32 = v12;
        v34 = [v7 featureIdentifier];
        v35 = [v7 featureIdentifier];
        *(_DWORD *)buf = 138544130;
        v88 = v31;
        __int16 v89 = 2114;
        v90 = v33;
        __int16 v91 = 2114;
        v92 = v34;
        __int16 v93 = 2114;
        v94 = v35;
        _os_log_impl(&dword_1D3AC6000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping setting sync from %{public}@ to %{public}@: %{public}@ is not onboarded", buf, 0x2Au);

        os_log_t v12 = v32;
        goto LABEL_13;
      }
LABEL_37:

      os_log_t v10 = v12;
      goto LABEL_38;
    }
    v36 = [v8 featureSettings];
    uint64_t v37 = *MEMORY[0x1E4F29DE0];
    os_log_t v84 = v12;
    v19 = [v36 numberForKey:v37 error:&v84];
    v38 = v84;

    if (!v19 && v38)
    {
      _HKInitializeLogging();
      v39 = (void *)*MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
      {
        v66 = v39;
        v67 = objc_opt_class();
        id v68 = v67;
        v69 = [v6 featureIdentifier];
        *(_DWORD *)buf = 138543874;
        v88 = v67;
        __int16 v89 = 2114;
        v90 = v69;
        __int16 v91 = 2114;
        v92 = v38;
        _os_log_error_impl(&dword_1D3AC6000, v66, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving setting for %{public}@: %{public}@", buf, 0x20u);
      }
      os_log_t v12 = v38;
      goto LABEL_36;
    }
    v75 = v19;
    v40 = [v11 featureSettings];
    v83 = v38;
    uint64_t v41 = [v40 numberForKey:v37 error:&v83];
    v42 = v83;

    v43 = v41;
    os_log_t log = v42;
    if (v41 || !v42)
    {
      v19 = v75;
      if (v75 == v43 || v43 && [v75 isEqual:v43])
      {
        _HKInitializeLogging();
        v50 = (void *)*MEMORY[0x1E4F29F50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
        {
          v51 = v50;
          v52 = v43;
          v53 = objc_opt_class();
          id v54 = v53;
          v55 = [v6 featureIdentifier];
          v56 = [v7 featureIdentifier];
          *(_DWORD *)buf = 138543874;
          v88 = v53;
          v43 = v52;
          v19 = v75;
          __int16 v89 = 2114;
          v90 = v55;
          __int16 v91 = 2114;
          v92 = v56;
          _os_log_impl(&dword_1D3AC6000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping setting sync from %{public}@ to %{public}@: setting values already match", buf, 0x20u);
        }
        goto LABEL_35;
      }
      uint64_t v57 = [v7 featureIdentifier];
      v58 = (void *)v57;
      if (v75)
      {
        v45 = v43;
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_281;
        v76[3] = &unk_1E69B43B0;
        v76[4] = self;
        v59 = (id *)&v77;
        v60 = v75;
        v77 = v60;
        v61 = &v78;
        id v78 = v6;
        id v79 = v58;
        [v7 setFeatureSettingNumber:v60 forKey:v37 completion:v76];
      }
      else
      {
        v71 = (void *)v57;
        v45 = v43;
        _HKInitializeLogging();
        v62 = (void *)*MEMORY[0x1E4F29F50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
        {
          v63 = v62;
          v64 = objc_opt_class();
          id v70 = v64;
          v65 = [v6 featureIdentifier];
          *(_DWORD *)buf = 138543618;
          v88 = v64;
          __int16 v89 = 2114;
          v90 = v65;
          _os_log_impl(&dword_1D3AC6000, v63, OS_LOG_TYPE_DEFAULT, "[%{public}@] Detected removal of setting from %{public}@", buf, 0x16u);
        }
        v80[0] = MEMORY[0x1E4F143A8];
        v80[1] = 3221225472;
        v80[2] = __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke;
        v80[3] = &unk_1E69B4388;
        v80[4] = self;
        v59 = &v81;
        id v81 = v6;
        v61 = &v82;
        v58 = v71;
        id v82 = v71;
        [v7 removeFeatureSettingValueForKey:v37 completion:v80];
      }
    }
    else
    {
      _HKInitializeLogging();
      v44 = (void *)*MEMORY[0x1E4F29F50];
      v19 = v75;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
      {
LABEL_35:

        os_log_t v12 = log;
        goto LABEL_36;
      }
      v45 = 0;
      v46 = v44;
      v47 = objc_opt_class();
      id v48 = v47;
      v49 = [v7 featureIdentifier];
      *(_DWORD *)buf = 138543874;
      v88 = v47;
      __int16 v89 = 2114;
      v90 = v49;
      __int16 v91 = 2114;
      v92 = v42;
      _os_log_error_impl(&dword_1D3AC6000, v46, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving setting for %{public}@: %{public}@", buf, 0x20u);
    }
    v43 = v45;
    v19 = v75;
    goto LABEL_35;
  }
  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
  {
    v21 = v20;
    v22 = objc_opt_class();
    id v23 = v22;
    v24 = [v6 featureIdentifier];
    *(_DWORD *)buf = 138543874;
    v88 = v22;
    __int16 v89 = 2114;
    v90 = v24;
    __int16 v91 = 2114;
    v92 = v10;
    _os_log_error_impl(&dword_1D3AC6000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to retrieve onboarding record for %{public}@: %{public}@", buf, 0x20u);
  }
LABEL_38:
}

void __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29F50];
  id v7 = *MEMORY[0x1E4F29F50];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      v9 = objc_opt_class();
      os_log_t v10 = *(void **)(a1 + 40);
      id v11 = v9;
      os_log_t v12 = [v10 featureIdentifier];
      uint64_t v13 = *(void *)(a1 + 48);
      int v14 = 138543874;
      v15 = v9;
      __int16 v16 = 2114;
      v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully synced setting (removal) from %{public}@ to %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_cold_1(a1, v6);
  }
}

void __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_281(void *a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29F50];
  id v7 = *MEMORY[0x1E4F29F50];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      v9 = objc_opt_class();
      uint64_t v11 = a1[5];
      os_log_t v10 = (void *)a1[6];
      id v12 = v9;
      uint64_t v13 = [v10 featureIdentifier];
      uint64_t v14 = a1[7];
      int v15 = 138544130;
      __int16 v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully synced updated setting (%{public}@) from %{public}@ to %{public}@", (uint8_t *)&v15, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_281_cold_1((uint64_t)a1, v6);
  }
}

- (HDFeatureAvailabilityExtension)v1FeatureAvailabilityManager
{
  return self->_v1FeatureAvailabilityManager;
}

- (HDFeatureAvailabilityExtension)v2FeatureAvailabilityManager
{
  return self->_v2FeatureAvailabilityManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_v2FeatureAvailabilityManager, 0);

  objc_storeStrong((id *)&self->_v1FeatureAvailabilityManager, 0);
}

void __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_class();
  id v5 = *(void **)(a1 + 40);
  id v6 = v4;
  id v7 = [v5 featureIdentifier];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1D3AC6000, v8, v9, "[%{public}@] Error syncing setting (removal) from %{public}@ to %{public}@: %{public}@", v10, v11, v12, v13, v14);
}

void __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_281_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_class();
  id v5 = *(void **)(a1 + 48);
  id v6 = v4;
  id v7 = [v5 featureIdentifier];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1D3AC6000, v8, v9, "[%{public}@] Error syncing setting from %{public}@ to %{public}@: %{public}@", v10, v11, v12, v13, v14);
}

@end