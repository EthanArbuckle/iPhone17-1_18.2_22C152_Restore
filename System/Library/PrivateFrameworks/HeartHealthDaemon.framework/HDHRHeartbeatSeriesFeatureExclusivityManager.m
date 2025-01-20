@interface HDHRHeartbeatSeriesFeatureExclusivityManager
- (BOOL)_isFeatureStatusAvailableForUsageOrBlockedOnlyByMutualExclusivityRequirement:(id)a3;
- (HDHRHeartbeatSeriesFeatureExclusivityManager)initWithIrregularRhythmNotificationsStatusManager:(id)a3 aFibHistoryStatusManager:(id)a4 profile:(id)a5;
- (id)__unitTesting_postNotificationHandler;
- (void)_fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff;
- (void)_queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled;
- (void)_scheduleInitialMaintenanceOperationWithProfile:(id)a3;
- (void)dealloc;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)set__unitTesting_postNotificationHandler:(id)a3;
@end

@implementation HDHRHeartbeatSeriesFeatureExclusivityManager

- (HDHRHeartbeatSeriesFeatureExclusivityManager)initWithIrregularRhythmNotificationsStatusManager:(id)a3 aFibHistoryStatusManager:(id)a4 profile:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v11 profileType] == 1)
  {
    v28.receiver = self;
    v28.super_class = (Class)HDHRHeartbeatSeriesFeatureExclusivityManager;
    v12 = [(HDHRHeartbeatSeriesFeatureExclusivityManager *)&v28 init];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_irregularRhythmNotificationsStatusManager, a3);
      objc_storeStrong((id *)&v13->_aFibHistoryStatusManager, a4);
      uint64_t v14 = HKCreateSerialDispatchQueue();
      queue = v13->_queue;
      v13->_queue = (OS_dispatch_queue *)v14;

      objc_initWeak(&location, v13);
      id v16 = objc_alloc(MEMORY[0x1E4F2B8C8]);
      v17 = v13->_queue;
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __131__HDHRHeartbeatSeriesFeatureExclusivityManager_initWithIrregularRhythmNotificationsStatusManager_aFibHistoryStatusManager_profile___block_invoke;
      v25 = &unk_1E69B4A60;
      objc_copyWeak(&v26, &location);
      uint64_t v18 = [v16 initWithMode:1 queue:v17 delay:&v22 block:0.25];
      disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation = v13->_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation;
      v13->_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation = (_HKDelayedOperation *)v18;

      -[HDHRHeartbeatSeriesFeatureExclusivityManager _scheduleInitialMaintenanceOperationWithProfile:](v13, "_scheduleInitialMaintenanceOperationWithProfile:", v11, v22, v23, v24, v25);
      [(HKFeatureStatusManager *)v13->_irregularRhythmNotificationsStatusManager registerObserver:v13 queue:v13->_queue];
      [(HKFeatureStatusManager *)v13->_aFibHistoryStatusManager registerObserver:v13 queue:v13->_queue];
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    self = v13;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __131__HDHRHeartbeatSeriesFeatureExclusivityManager_initWithIrregularRhythmNotificationsStatusManager_aFibHistoryStatusManager_profile___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled");
}

- (void)dealloc
{
  [(_HKDelayedOperation *)self->_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDHRHeartbeatSeriesFeatureExclusivityManager;
  [(HDHRHeartbeatSeriesFeatureExclusivityManager *)&v3 dealloc];
}

- (void)_scheduleInitialMaintenanceOperationWithProfile:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E4F65B40];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  queue = self->_queue;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __96__HDHRHeartbeatSeriesFeatureExclusivityManager__scheduleInitialMaintenanceOperationWithProfile___block_invoke;
  uint64_t v18 = &unk_1E69B4A60;
  objc_copyWeak(&v19, &location);
  id v9 = [v5 maintenanceOperationWithName:v7 queue:queue synchronousBlock:&v15];

  _HKInitializeLogging();
  id v10 = (id)*MEMORY[0x1E4F29F50];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v11;
    id v12 = v11;
    _os_log_impl(&dword_1D3AC6000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling initial maintenance operation", buf, 0xCu);
  }
  v13 = objc_msgSend(v4, "daemon", v15, v16, v17, v18);
  uint64_t v14 = [v13 maintenanceWorkCoordinator];
  [v14 enqueueMaintenanceOperation:v9];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __96__HDHRHeartbeatSeriesFeatureExclusivityManager__scheduleInitialMaintenanceOperationWithProfile___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
    {
      objc_super v3 = v2;
      LODWORD(v9) = 138543362;
      *(void *)((char *)&v9 + 4) = objc_opt_class();
      id v4 = *(id *)((char *)&v9 + 4);
      _os_log_impl(&dword_1D3AC6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Running initial maintenance operation", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v5 = objc_msgSend(WeakRetained[1], "featureStatusWithError:", 0, v9);
    id v6 = WeakRetained[5];
    WeakRetained[5] = (id)v5;

    uint64_t v7 = [WeakRetained[2] featureStatusWithError:0];
    id v8 = WeakRetained[6];
    WeakRetained[6] = (id)v7;

    objc_msgSend(WeakRetained, "_queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled");
  }
}

- (void)_queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_irregularRhythmNotificationsStatus)
  {
    if (self->_aFibHistoryStatus)
    {
      BOOL v3 = -[HDHRHeartbeatSeriesFeatureExclusivityManager _isFeatureStatusAvailableForUsageOrBlockedOnlyByMutualExclusivityRequirement:](self, "_isFeatureStatusAvailableForUsageOrBlockedOnlyByMutualExclusivityRequirement:");
      BOOL v4 = [(HDHRHeartbeatSeriesFeatureExclusivityManager *)self _isFeatureStatusAvailableForUsageOrBlockedOnlyByMutualExclusivityRequirement:self->_aFibHistoryStatus];
      if (v3 && v4)
      {
        uint64_t v5 = [(HKFeatureStatus *)self->_irregularRhythmNotificationsStatus onboardingRecord];
        id v6 = [v5 featureSettings];
        uint64_t v7 = *MEMORY[0x1E4F29DE0];
        id v8 = [v6 numberForKey:*MEMORY[0x1E4F29DE0]];

        if (v8 && ([v8 BOOLValue] & 1) != 0)
        {
          long long v9 = [(HKFeatureStatusManager *)self->_irregularRhythmNotificationsStatusManager featureAvailabilityProviding];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __112__HDHRHeartbeatSeriesFeatureExclusivityManager__queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled__block_invoke;
          v18[3] = &unk_1E69B45A8;
          v18[4] = self;
          [v9 setFeatureSettingNumber:MEMORY[0x1E4F1CC28] forKey:v7 completion:v18];
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v15 = (void *)*MEMORY[0x1E4F29F50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = v15;
            *(_DWORD *)buf = 138543362;
            id v20 = (id)objc_opt_class();
            id v17 = v20;
            _os_log_impl(&dword_1D3AC6000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Nothing to do: IRN is off", buf, 0xCu);
          }
        }
        goto LABEL_15;
      }
      _HKInitializeLogging();
      uint64_t v14 = (void *)*MEMORY[0x1E4F29F50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      id v8 = v14;
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class();
      id v11 = v20;
      id v12 = "[%{public}@] Nothing to do: at least one feature is unavailable for usage";
    }
    else
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E4F29F50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      id v8 = v13;
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class();
      id v11 = v20;
      id v12 = "[%{public}@] No feature status available for AFib History: cannot proceed";
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v10 = (void *)*MEMORY[0x1E4F29F50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    id v8 = v10;
    *(_DWORD *)buf = 138543362;
    id v20 = (id)objc_opt_class();
    id v11 = v20;
    id v12 = "[%{public}@] No feature status available for IRN: cannot proceed";
  }
  _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);

LABEL_15:
}

void __112__HDHRHeartbeatSeriesFeatureExclusivityManager__queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29F50];
  uint64_t v7 = *MEMORY[0x1E4F29F50];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      *(_DWORD *)uint64_t v10 = 138543362;
      *(void *)&v10[4] = objc_opt_class();
      id v9 = *(id *)&v10[4];
      _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully turned off IRN; firing notification",
        v10,
        0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "_fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff", *(_OWORD *)v10);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __112__HDHRHeartbeatSeriesFeatureExclusivityManager__queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled__block_invoke_cold_1(a1, v6);
  }
}

- (BOOL)_isFeatureStatusAvailableForUsageOrBlockedOnlyByMutualExclusivityRequirement:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F29C20];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:v3];
  char v6 = [v5 areAllRequirementsSatisfied];

  uint64_t v7 = [v4 objectForKeyedSubscript:v3];

  id v8 = [v7 unsatisfiedRequirementIdentifiers];

  if ([v8 count] == 1)
  {
    id v9 = [v8 firstObject];
    char v10 = [v9 isEqualToString:*MEMORY[0x1E4F29CB0]];
  }
  else
  {
    char v10 = 0;
  }

  return v6 | v10;
}

- (void)_fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F65D98]);
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"IRREGULAR_RHYTHM_NOTIFICATIONS_DISABLED_DUE_TO_AFIB_HISTORY_TITLE" value:&stru_1F2B36C98 table:@"Localizable-AFibBurden"];
  [v3 setTitle:v5];

  char v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"IRREGULAR_RHYTHM_NOTIFICATIONS_DISABLED_DUE_TO_AFIB_HISTORY_BODY" value:&stru_1F2B36C98 table:@"Localizable-AFibBurden"];
  [v3 setMessage:v7];

  [v3 setAlertLevel:3];
  unitTesting_postNotificationHandler = (void (**)(id, id))self->___unitTesting_postNotificationHandler;
  if (unitTesting_postNotificationHandler)
  {
    unitTesting_postNotificationHandler[2](unitTesting_postNotificationHandler, v3);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __112__HDHRHeartbeatSeriesFeatureExclusivityManager__fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff__block_invoke;
    v9[3] = &unk_1E69B4FD8;
    v9[4] = self;
    [v3 presentWithResponseHandler:v9];
  }
}

void __112__HDHRHeartbeatSeriesFeatureExclusivityManager__fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    char v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __112__HDHRHeartbeatSeriesFeatureExclusivityManager__fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff__block_invoke_cold_1(a1, v6);
    }
  }
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  char v6 = (objc_class *)a4;
  queue = self->_queue;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  id v9 = [v8 featureIdentifier];

  LODWORD(v8) = [v9 isEqualToString:*MEMORY[0x1E4F29D10]];
  uint64_t v10 = 40;
  if (v8) {
    uint64_t v10 = 48;
  }
  uint64_t v11 = *(Class *)((char *)&self->super.isa + v10);
  *(Class *)((char *)&self->super.isa + v10) = v6;
  id v12 = v6;

  [(_HKDelayedOperation *)self->_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation execute];
}

- (id)__unitTesting_postNotificationHandler
{
  return self->___unitTesting_postNotificationHandler;
}

- (void)set__unitTesting_postNotificationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->___unitTesting_postNotificationHandler, 0);
  objc_storeStrong((id *)&self->_aFibHistoryStatus, 0);
  objc_storeStrong((id *)&self->_irregularRhythmNotificationsStatus, 0);
  objc_storeStrong((id *)&self->_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabledOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_aFibHistoryStatusManager, 0);

  objc_storeStrong((id *)&self->_irregularRhythmNotificationsStatusManager, 0);
}

void __112__HDHRHeartbeatSeriesFeatureExclusivityManager__queue_disableIrregularRhythmNotificationsIfAFibHistoryIsEnabled__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Failed to turned off IRN: %{public}@", v7, v8, v9, v10, v11);
}

void __112__HDHRHeartbeatSeriesFeatureExclusivityManager__fireSystemAlertBecauseIrregularRhythmNotificationsWereTurnedOff__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Failed to post notification: %{public}@", v7, v8, v9, v10, v11);
}

@end