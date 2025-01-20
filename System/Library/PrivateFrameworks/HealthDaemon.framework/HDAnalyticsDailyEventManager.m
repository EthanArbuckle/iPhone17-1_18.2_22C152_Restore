@interface HDAnalyticsDailyEventManager
- (HDAnalyticsDailyEventManager)initWithProfile:(id)a3 eventSubmissionManager:(id)a4 logCategory:(id)a5 eventConstructor:(id)a6;
- (void)_submitAnalyticsEventWithCompletion:(id)a3;
- (void)_unitTest_setObservationReadyCompletion:(id)a3;
- (void)daemonReady:(id)a3;
- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4;
@end

@implementation HDAnalyticsDailyEventManager

- (HDAnalyticsDailyEventManager)initWithProfile:(id)a3 eventSubmissionManager:(id)a4 logCategory:(id)a5 eventConstructor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HDAnalyticsDailyEventManager;
  v14 = [(HDAnalyticsDailyEventManager *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_eventSubmissionManager, a4);
    objc_storeStrong((id *)&v15->_logCategory, a5);
    v16 = _Block_copy(v13);
    id eventConstructor = v15->_eventConstructor;
    v15->_id eventConstructor = v16;

    uint64_t v18 = HKCreateSerialDispatchQueue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v18;

    v15->_queue_isObserving = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v15->_profile);
    v21 = [WeakRetained daemon];
    [v21 registerDaemonReadyObserver:v15 queue:v15->_queue];
  }
  return v15;
}

- (void)daemonReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained daemon];
  v6 = [v5 analyticsSubmissionCoordinator];
  [v6 addObserver:self queue:self->_queue];

  observationReadyCompletion = (void (**)(void))self->_observationReadyCompletion;
  if (observationReadyCompletion)
  {
    observationReadyCompletion[2]();
    id v8 = self->_observationReadyCompletion;
    self->_observationReadyCompletion = 0;
  }
  self->_queue_isObserving = 1;
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  [(HDAnalyticsDailyEventManager *)self _submitAnalyticsEventWithCompletion:v6];
}

- (void)_submitAnalyticsEventWithCompletion:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, uint64_t, id))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  if (WeakRetained)
  {
    id v6 = (*((void (**)(void))self->_eventConstructor + 2))();
    _HKInitializeLogging();
    logCategory = self->_logCategory;
    BOOL v8 = os_log_type_enabled(logCategory, OS_LOG_TYPE_DEFAULT);
    if (!v6)
    {
      if (v8)
      {
        v20 = logCategory;
        *(_DWORD *)buf = 138543362;
        id v35 = (id)objc_opt_class();
        id v21 = v35;
        _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] No analytics event provided from trigger request.", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 11, @"No analytics event provided");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, 1, v15);
      goto LABEL_22;
    }
    if (v8)
    {
      v9 = logCategory;
      id v10 = objc_opt_class();
      id v11 = v10;
      id v12 = [v6 eventName];
      *(_DWORD *)buf = 138543618;
      id v35 = v10;
      __int16 v36 = 2114;
      v37 = v12;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Received daily analytics trigger, submitting.", buf, 0x16u);
    }
    eventSubmissionManager = self->_eventSubmissionManager;
    id v33 = 0;
    int v14 = [(HKAnalyticsEventSubmissionManager *)eventSubmissionManager submitEvent:v6 error:&v33];
    id v15 = v33;
    _HKInitializeLogging();
    v16 = self->_logCategory;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v29 = v16;
        v30 = objc_opt_class();
        id v31 = v30;
        v32 = [v6 eventName];
        *(_DWORD *)buf = 138543874;
        id v35 = v30;
        __int16 v36 = 2114;
        v37 = v32;
        __int16 v38 = 2114;
        id v39 = v15;
        _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Metric submission failed with error: %{public}@", buf, 0x20u);
      }
      v4[2](v4, 0, 2, v15);
      goto LABEL_22;
    }
    BOOL v22 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v22)
      {
        objc_super v23 = v16;
        v24 = objc_opt_class();
        id v25 = v24;
        v26 = [v6 eventName];
        *(_DWORD *)buf = 138543618;
        id v35 = v24;
        __int16 v36 = 2114;
        v37 = v26;
        v27 = "[%{public}@:%{public}@] Event submitted";
LABEL_20:
        _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, v27, buf, 0x16u);
      }
    }
    else if (v22)
    {
      objc_super v23 = v16;
      v28 = objc_opt_class();
      id v25 = v28;
      v26 = [v6 eventName];
      *(_DWORD *)buf = 138543618;
      id v35 = v28;
      __int16 v36 = 2114;
      v37 = v26;
      v27 = "[%{public}@:%{public}@] Event not submitted but no error";
      goto LABEL_20;
    }
    v4[2](v4, 0, 0, 0);
    id v15 = 0;
LABEL_22:

    goto LABEL_23;
  }
  _HKInitializeLogging();
  v17 = self->_logCategory;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = v17;
    *(_DWORD *)buf = 138543362;
    id v35 = (id)objc_opt_class();
    id v19 = v35;
    _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] No profile available to construct event for trigger request.", buf, 0xCu);
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"No profile available");
  v4[2](v4, 0, 1, v6);
LABEL_23:
}

- (void)_unitTest_setObservationReadyCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HDAnalyticsDailyEventManager__unitTest_setObservationReadyCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __72__HDAnalyticsDailyEventManager__unitTest_setObservationReadyCompletion___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(unsigned char *)(v3 + 32))
  {
    id v4 = (void (*)(void))v2[2];
    v4();
  }
  else
  {
    v5 = _Block_copy(v2);
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logCategory, 0);
  objc_storeStrong(&self->_observationReadyCompletion, 0);
  objc_storeStrong(&self->_eventConstructor, 0);
  objc_storeStrong((id *)&self->_eventSubmissionManager, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end