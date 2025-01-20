@interface HDHRCardioFitnessAnalyticsDailyEventActivity
- (BOOL)periodicActivityRequiresProtectedData:(id)a3;
- (HDHRCardioFitnessAnalyticsDailyEventActivity)initWithProfile:(id)a3;
- (HDHRCardioFitnessAnalyticsDailyEventDataSource)dataSource;
- (HDPeriodicActivity)periodicActivity;
- (HDProfile)profile;
- (HKHRCardioFitnessAnalyticsManager)analyticsManager;
- (OS_dispatch_queue)queue;
- (double)calculationPeriod;
- (double)retryPeriod;
- (void)_queue_submitAnalyticsWithActivityCompletion:(id)a3;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4;
- (void)setPeriodicActivity:(id)a3;
@end

@implementation HDHRCardioFitnessAnalyticsDailyEventActivity

- (HDHRCardioFitnessAnalyticsDailyEventActivity)initWithProfile:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDHRCardioFitnessAnalyticsDailyEventActivity;
  v5 = [(HDHRCardioFitnessAnalyticsDailyEventActivity *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    double v7 = (double)(uint64_t)*MEMORY[0x1E4F141F8];
    v6->_calculationPeriod = (double)(uint64_t)*MEMORY[0x1E4F141E8];
    v6->_retryPeriod = v7;
    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    v10 = [[HDHRCardioFitnessAnalyticsSignalSource alloc] initWithProfile:v4];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F67DD0]) initWithSignalSource:v10];
    analyticsManager = v6->_analyticsManager;
    v6->_analyticsManager = (HKHRCardioFitnessAnalyticsManager *)v11;

    v13 = [[HDHRCardioFitnessAnalyticsDailyEventDataSource alloc] initWithProfile:v4];
    dataSource = v6->_dataSource;
    v6->_dataSource = v13;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v16 = [WeakRetained daemon];
    [v16 registerDaemonReadyObserver:v6 queue:v6->_queue];
  }
  return v6;
}

- (void)dealloc
{
  [(HDAssertion *)self->_preparedDatabaseAccessibilityAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDHRCardioFitnessAnalyticsDailyEventActivity;
  [(HDHRCardioFitnessAnalyticsDailyEventActivity *)&v3 dealloc];
}

- (void)daemonReady:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F65BB0]);
  id v7 = [(HDHRCardioFitnessAnalyticsDailyEventActivity *)self profile];
  [(HDHRCardioFitnessAnalyticsDailyEventActivity *)self calculationPeriod];
  v5 = (HDPeriodicActivity *)objc_msgSend(v4, "initWithProfile:name:interval:delegate:loggingCategory:", v7, @"com.apple.healthd.cardiofitness.HDHRCardioFitnessAnalyticsDailyEventActivity", self, *MEMORY[0x1E4F29F48]);
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v5;
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  id v4 = (const char *)*MEMORY[0x1E4F14138];
  xpc_object_t xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v4, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E4F14318], 1);
}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 0;
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x1E4F29F48];
  id v7 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v7;
    *(_DWORD *)buf = 138543362;
    id v31 = (id)objc_opt_class();
    id v9 = v31;
    _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_INFO, "[%{public}@] Received periodic activity trigger.", buf, 0xCu);
  }
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke;
  block[3] = &unk_1E69B41B8;
  block[4] = self;
  dispatch_sync(queue, block);
  _HKInitializeLogging();
  uint64_t v11 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = self;
    _os_log_impl(&dword_1D3AC6000, v11, OS_LOG_TYPE_INFO, "[%{public}@] maintenance operation enqueued", buf, 0xCu);
  }
  v12 = (void *)MEMORY[0x1E4F65B40];
  v22 = self;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_296;
  v26 = &unk_1E69B4D40;
  v27 = self;
  id v28 = v5;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_300;
  v21 = &unk_1E69B4850;
  id v13 = v5;
  v14 = [v12 maintenanceOperationWithName:@"HDHRCardioFitnessAnalyticsDailyEventActivity" asynchronousBlock:&v23 canceledBlock:&v18];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v16 = objc_msgSend(WeakRetained, "daemon", v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
  v17 = [v16 maintenanceWorkCoordinator];
  [v17 enqueueMaintenanceOperation:v14];
}

void __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  objc_super v3 = [WeakRetained database];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v12 = 0;
  uint64_t v6 = [v3 takeAccessibilityAssertionWithOwnerIdentifier:v5 timeout:&v12 error:300.0];
  id v7 = v12;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v6;

  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl(&dword_1D3AC6000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] unable to get accessibilityAssertion before enqueing maintenance operation: %{public}@", buf, 0x16u);
    }
  }
}

void __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_296(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_INFO, "[%{public}@] maintenance operation running", buf, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_297;
  block[3] = &unk_1E69B4D18;
  block[4] = v6;
  id v10 = v3;
  id v11 = *(id *)(a1 + 40);
  id v8 = v3;
  dispatch_sync(v7, block);
}

void __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_297(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_2;
  v4[3] = &unk_1E69B4CF0;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_queue_submitAnalyticsWithActivityCompletion:", v4);
}

void __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_2(void *a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[5];
  id v7 = *(void (**)(uint64_t))(v6 + 16);
  id v8 = a4;
  v7(v6);
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = a1[4];
    int v13 = 138543362;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_INFO, "[%{public}@] maintenance operation finished", (uint8_t *)&v13, 0xCu);
  }
  [*(id *)(a1[4] + 8) invalidate];
  uint64_t v11 = a1[4];
  id v12 = *(void **)(v11 + 8);
  *(void *)(v11 + 8) = 0;

  (*(void (**)(double))(a1[6] + 16))(a2);
}

void __83__HDHRCardioFitnessAnalyticsDailyEventActivity_performPeriodicActivity_completion___block_invoke_300(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = a2;
  [v2 invalidate];
  v3[2]();
}

- (void)_queue_submitAnalyticsWithActivityCompletion:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void *, double))a3;
  _HKInitializeLogging();
  id v5 = (os_log_t *)MEMORY[0x1E4F29F48];
  uint64_t v6 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    *(_DWORD *)buf = 138543362;
    id v39 = (id)objc_opt_class();
    id v8 = v39;
    _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Attempting to send daily event.", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v10 = [WeakRetained deviceContextManager];
  id v37 = 0;
  uint64_t v11 = [v10 numberOfDeviceContextsPerDeviceType:&v37];
  id v12 = v37;

  if (v12)
  {
    _HKInitializeLogging();
    os_log_t v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v13;
      uint64_t v15 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v39 = v15;
      __int16 v40 = 2112;
      id v41 = v12;
      id v16 = v15;
      _os_log_impl(&dword_1D3AC6000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Device contexts found with error %@", buf, 0x16u);
    }
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F67DD8]) initWithStatus:1 error:v12];
  }
  else
  {
    uint64_t v17 = [(HKHRCardioFitnessAnalyticsManager *)self->_analyticsManager submitDailyEventWithSource:self->_dataSource deviceContextsDict:v11];
  }
  uint64_t v18 = v17;
  uint64_t v19 = [v17 status];
  switch(v19)
  {
    case 2:
      _HKInitializeLogging();
      os_log_t v24 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v39 = v26;
        id v27 = v26;
        _os_log_impl(&dword_1D3AC6000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Should not send daily event, will ignore.", buf, 0xCu);
      }
      [(HDHRCardioFitnessAnalyticsDailyEventActivity *)self retryPeriod];
      double v29 = v28;
      v30 = [v18 error];
      v4[2](v4, 1, v30, v29);
      goto LABEL_20;
    case 1:
      _HKInitializeLogging();
      os_log_t v31 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = v31;
        v33 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v39 = v33;
        id v34 = v33;
        _os_log_impl(&dword_1D3AC6000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unsuccessfully sent daily event will request retry.", buf, 0xCu);
      }
      [(HDHRCardioFitnessAnalyticsDailyEventActivity *)self retryPeriod];
      double v36 = v35;
      v30 = [v18 error];
      v4[2](v4, 2, v30, v36);
LABEL_20:

      break;
    case 0:
      _HKInitializeLogging();
      os_log_t v20 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        v22 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v39 = v22;
        id v23 = v22;
        _os_log_impl(&dword_1D3AC6000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully sent daily event.", buf, 0xCu);
      }
      [(HDHRCardioFitnessAnalyticsDailyEventActivity *)self retryPeriod];
      ((void (*)(void (**)(id, uint64_t, void *, double), void, void))v4[2])(v4, 0, 0);
      break;
  }
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (double)calculationPeriod
{
  return self->_calculationPeriod;
}

- (double)retryPeriod
{
  return self->_retryPeriod;
}

- (HDPeriodicActivity)periodicActivity
{
  return self->_periodicActivity;
}

- (void)setPeriodicActivity:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HKHRCardioFitnessAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (HDHRCardioFitnessAnalyticsDailyEventDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_preparedDatabaseAccessibilityAssertion, 0);
}

@end