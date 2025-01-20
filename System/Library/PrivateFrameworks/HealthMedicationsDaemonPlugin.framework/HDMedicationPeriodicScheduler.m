@interface HDMedicationPeriodicScheduler
- (HDMedicationPeriodicScheduler)init;
- (HDMedicationPeriodicScheduler)initWithDaemon:(id)a3;
- (HDPeriodicActivity)activity;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation HDMedicationPeriodicScheduler

- (HDMedicationPeriodicScheduler)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDMedicationPeriodicScheduler)initWithDaemon:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDMedicationPeriodicScheduler;
  v5 = [(HDMedicationPeriodicScheduler *)&v10 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_daemon, v4);
    v8 = [v4 primaryProfile];
    [v8 registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  double v4 = (double)(uint64_t)*MEMORY[0x1E4F141E8];
  id v5 = objc_alloc(MEMORY[0x1E4F65BB0]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  v6 = [WeakRetained primaryProfile];
  id v7 = HKLogMedication();
  v8 = (HDPeriodicActivity *)[v5 initWithProfile:v6 name:@"com.apple.healthd.medications.scheduler" interval:self delegate:v7 loggingCategory:v4];
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v8;
}

- (HDPeriodicActivity)activity
{
  return self->_periodicActivity;
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 name];
  char v9 = [v8 isEqualToString:@"com.apple.healthd.medications.scheduler"];

  _HKInitializeLogging();
  objc_super v10 = HKLogMedication();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v6 name];
      int v13 = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_1BD54A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: configuring periodic activity %{public}@", (uint8_t *)&v13, 0x16u);
    }
    xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E4F14138], 1);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E4F14340], 1);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E4F14318], 1);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationPeriodicScheduler periodicActivity:configureXPCActivityCriteria:]((uint64_t)self, v6, v11);
    }
  }
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 name];
  if ([v7 isEqualToString:@"com.apple.healthd.medications.scheduler"])
  {
    p_daemon = &self->_daemon;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_super v10 = [WeakRetained primaryProfile];

    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    int v13 = NSStringFromClass(v12);
    v14 = [MEMORY[0x1E4F29128] UUID];
    __int16 v15 = [v14 UUIDString];
    v16 = [v11 stringWithFormat:@"%@-%@", v13, v15];

    uint64_t v17 = [v10 database];
    id v39 = 0;
    v18 = [v17 takeAccessibilityAssertionWithOwnerIdentifier:v16 timeout:&v39 error:300.0];
    id v19 = v39;

    if (!v18)
    {
      _HKInitializeLogging();
      v20 = HKLogMedication();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

      if (v21)
      {
        v22 = HKLogMedication();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v41 = self;
          __int16 v42 = 2114;
          id v43 = v19;
          _os_log_impl(&dword_1BD54A000, v22, OS_LOG_TYPE_INFO, "[%{public}@]: unable to take accessibility assertion: %{public}@", buf, 0x16u);
        }
      }
    }
    v23 = (void *)MEMORY[0x1E4F65B40];
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke;
    v34[3] = &unk_1E6337FE0;
    v34[4] = self;
    id v35 = v7;
    id v36 = v18;
    id v37 = v10;
    id v38 = v6;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke_2;
    v32[3] = &unk_1E6338008;
    id v33 = v36;
    id v26 = v36;
    id v27 = v10;
    v28 = [v23 maintenanceOperationWithName:v25 asynchronousBlock:v34 canceledBlock:v32];

    id v29 = objc_loadWeakRetained((id *)p_daemon);
    v30 = [v29 maintenanceWorkCoordinator];
    [v30 enqueueMaintenanceOperation:v28];
  }
  else
  {
    _HKInitializeLogging();
    v31 = HKLogMedication();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationPeriodicScheduler performPeriodicActivity:completion:]((uint64_t)self, (uint64_t)v7, v31);
    }

    (*((void (**)(id, uint64_t, void, double))v6 + 2))(v6, 1, 0, 0.0);
  }
}

void __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  _HKInitializeLogging();
  double v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v5;
    __int16 v20 = 2114;
    uint64_t v21 = v6;
    _os_log_impl(&dword_1BD54A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: performing periodic activity %{public}@", buf, 0x16u);
  }

  id v7 = objc_alloc_init(MEMORY[0x1E4F65B60]);
  [v7 setCacheScope:1];
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v7, "addAccessibilityAssertion:");
  }
  v8 = [*(id *)(a1 + 56) database];
  id v17 = 0;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke_318;
  __int16 v15 = &unk_1E63372A0;
  id v16 = *(id *)(a1 + 56);
  int v9 = [v8 performWithTransactionContext:v7 error:&v17 block:&v12];
  id v10 = v17;

  objc_msgSend(*(id *)(a1 + 48), "invalidate", v12, v13, v14, v15);
  if (v9) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = 2;
  }
  (*(void (**)(void, uint64_t, id, double))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v11, v10, 0.0);
  v3[2](v3);
}

uint64_t __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke_318(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) healthMedicationsProfileExtension];
  double v4 = [v3 medicationScheduleManager];

  uint64_t v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v5 startOfDayForDate:v6];

  if ([v4 rescheduleMedicationsWithError:a2]) {
    uint64_t v8 = [v4 pruneAllScheduleItemsBeforeDate:v7 createDoseEvents:1 error:a2];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

void __68__HDMedicationPeriodicScheduler_performPeriodicActivity_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  [v2 invalidate];
  v3[2]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

- (void)periodicActivity:(NSObject *)a3 configureXPCActivityCriteria:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 name];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  int v9 = v5;
  _os_log_error_impl(&dword_1BD54A000, a3, OS_LOG_TYPE_ERROR, "[%{public}@]: periodic activity %{public}@ is not an expected activity, not configuring", (uint8_t *)&v6, 0x16u);
}

- (void)performPeriodicActivity:(os_log_t)log completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BD54A000, log, OS_LOG_TYPE_ERROR, "[%{public}@]: periodic activity %{public}@ is not an expected activity, not performing", (uint8_t *)&v3, 0x16u);
}

@end