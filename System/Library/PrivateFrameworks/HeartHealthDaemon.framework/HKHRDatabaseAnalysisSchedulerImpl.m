@interface HKHRDatabaseAnalysisSchedulerImpl
- (BOOL)_enterStateIfPossible:(unint64_t)a3;
- (HKHRDatabaseAnalysisSchedulerDelegate)delegate;
- (HKHRDatabaseAnalysisSchedulerImpl)initWithProfile:(id)a3 identifier:(id)a4 loggingCategory:(id)a5 maximumDelay:(double)a6 retryDelay:(double)a7 breadcrumbManager:(id)a8;
- (HKHRDatabaseAnalysisSchedulerImpl)initWithProfile:(id)a3 identifier:(id)a4 loggingCategory:(id)a5 maximumDelay:(double)a6 retryDelay:(double)a7 breadcrumbManager:(id)a8 gatedActivityFactory:(id)a9 assertionProvider:(id)a10 persistentStateDefaults:(id)a11;
- (double)_retryDelayGivenRetryCount:(int64_t)a3;
- (id)_gatedActivity;
- (id)retryCountKey;
- (void)_maybeRetryLater;
- (void)_requestGatedActivityRunWithDelay:(double)a3;
- (void)_resetRetryCounter;
- (void)_runActivity:(id)a3 withCompletion:(id)a4;
- (void)_runMaintenanceOperationForActivity:(id)a3 assertion:(id)a4 withCompletion:(id)a5;
- (void)daemonReady:(id)a3;
- (void)forceAnalysis;
- (void)scheduleAnalysis;
- (void)setDelegate:(id)a3;
@end

@implementation HKHRDatabaseAnalysisSchedulerImpl

- (HKHRDatabaseAnalysisSchedulerImpl)initWithProfile:(id)a3 identifier:(id)a4 loggingCategory:(id)a5 maximumDelay:(double)a6 retryDelay:(double)a7 breadcrumbManager:(id)a8
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [[HKHRDatabaseAnalysisSchedulerGatedActivityFactoryImpl alloc] initWithIdentifier:v16 loggingCategory:v15];
  v19 = [[HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl alloc] initWithProfile:v17 identifier:v16];
  v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v21 = [(HKHRDatabaseAnalysisSchedulerImpl *)self initWithProfile:v17 identifier:v16 loggingCategory:v15 maximumDelay:v14 retryDelay:v18 breadcrumbManager:v19 gatedActivityFactory:a6 assertionProvider:a7 persistentStateDefaults:v20];

  return v21;
}

- (HKHRDatabaseAnalysisSchedulerImpl)initWithProfile:(id)a3 identifier:(id)a4 loggingCategory:(id)a5 maximumDelay:(double)a6 retryDelay:(double)a7 breadcrumbManager:(id)a8 gatedActivityFactory:(id)a9 assertionProvider:(id)a10 persistentStateDefaults:(id)a11
{
  id obj = a3;
  id v19 = a4;
  id v20 = a5;
  id v32 = a8;
  id v31 = a9;
  id v21 = a10;
  id v22 = a11;
  v34.receiver = self;
  v34.super_class = (Class)HKHRDatabaseAnalysisSchedulerImpl;
  v23 = [(HKHRDatabaseAnalysisSchedulerImpl *)&v34 init];
  v24 = v23;
  if (v23)
  {
    id v30 = v20;
    objc_storeWeak((id *)&v23->_profile, obj);
    uint64_t v25 = [v19 copy];
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    objc_storeStrong((id *)&v24->_loggingCategory, a5);
    v24->_maximumDelay = a6;
    v24->_retryDelay = a7;
    objc_storeStrong((id *)&v24->_breadcrumbManager, a8);
    objc_storeStrong((id *)&v24->_gatedActivityFactory, a9);
    objc_storeStrong((id *)&v24->_assertionProvider, a10);
    v24->_lock._os_unfair_lock_opaque = 0;
    v24->_state = 0;
    objc_storeStrong((id *)&v24->_persistentStateDefaults, a11);
    id WeakRetained = objc_loadWeakRetained((id *)&v24->_profile);
    v28 = [WeakRetained daemon];
    [v28 registerDaemonReadyObserver:v24 queue:0];

    id v20 = v30;
  }

  return v24;
}

- (void)scheduleAnalysis
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    int v5 = 138543618;
    v6 = self;
    __int16 v7 = 2114;
    v8 = identifier;
    _os_log_impl(&dword_1D3AC6000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Told to schedule analysis", (uint8_t *)&v5, 0x16u);
  }
  [(HKHRDatabaseAnalysisSchedulerImpl *)self _requestGatedActivityRunWithDelay:self->_maximumDelay];
}

- (void)forceAnalysis
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543618;
    v8 = self;
    __int16 v9 = 2114;
    v10 = identifier;
    _os_log_impl(&dword_1D3AC6000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Told to force analysis", buf, 0x16u);
  }
  int v5 = [(HKHRDatabaseAnalysisSchedulerImpl *)self _gatedActivity];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__HKHRDatabaseAnalysisSchedulerImpl_forceAnalysis__block_invoke;
  v6[3] = &unk_1E69B41F8;
  v6[4] = self;
  [v5 runUngatedWithCompletion:v6];
}

void __50__HKHRDatabaseAnalysisSchedulerImpl_forceAnalysis__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v7 + 16);
    int v9 = 138544130;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    uint64_t v12 = v8;
    __int16 v13 = 2050;
    uint64_t v14 = a2;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Activity completed with result %{public}ld and error %{public}@", (uint8_t *)&v9, 0x2Au);
  }
}

- (id)_gatedActivity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_gatedActivity;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)daemonReady:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138543618;
    __int16 v13 = self;
    __int16 v14 = 2114;
    __int16 v15 = identifier;
    _os_log_impl(&dword_1D3AC6000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Daemon ready", buf, 0x16u);
  }
  if ([(HKHRDatabaseAnalysisSchedulerImpl *)self _enterStateIfPossible:1])
  {
    os_unfair_lock_lock(&self->_lock);
    objc_initWeak((id *)buf, self);
    gatedActivityFactory = self->_gatedActivityFactory;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__HKHRDatabaseAnalysisSchedulerImpl_daemonReady___block_invoke;
    v10[3] = &unk_1E69B4220;
    objc_copyWeak(&v11, (id *)buf);
    uint64_t v8 = [(HKHRDatabaseAnalysisSchedulerGatedActivityFactory *)gatedActivityFactory makeGatedActivityWithHandler:v10];
    lock_gatedActivity = self->_lock_gatedActivity;
    self->_lock_gatedActivity = v8;

    os_unfair_lock_unlock(&self->_lock);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)self->_loggingCategory, OS_LOG_TYPE_FAULT)) {
      -[HKHRDatabaseAnalysisSchedulerImpl daemonReady:]();
    }
  }
}

void __49__HKHRDatabaseAnalysisSchedulerImpl_daemonReady___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _runActivity:v7 withCompletion:v6];
}

- (void)_requestGatedActivityRunWithDelay:(double)a3
{
  id v5 = [(HKHRDatabaseAnalysisSchedulerImpl *)self _gatedActivity];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__HKHRDatabaseAnalysisSchedulerImpl__requestGatedActivityRunWithDelay___block_invoke;
  v6[3] = &unk_1E69B4248;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  [v5 requestRunWithMaximumDelay:v6 completion:a3];
}

void __71__HKHRDatabaseAnalysisSchedulerImpl__requestGatedActivityRunWithDelay___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(v7 + 16);
    int v10 = 138544386;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    __int16 v14 = 2050;
    uint64_t v15 = v8;
    __int16 v16 = 2050;
    uint64_t v17 = a2;
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Activity (with %{public}f delay) completed with result %{public}ld and error %{public}@", (uint8_t *)&v10, 0x34u);
  }
}

- (id)retryCountKey
{
  return [(NSString *)self->_identifier stringByAppendingString:@"RetryCount"];
}

- (void)_maybeRetryLater
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HKHRDatabaseAnalysisSchedulerImpl *)self retryCountKey];
  char v4 = [(NSUserDefaults *)self->_persistentStateDefaults hk_keyExists:v3];
  persistentStateDefaults = self->_persistentStateDefaults;
  if (v4)
  {
    uint64_t v6 = [(NSUserDefaults *)persistentStateDefaults integerForKey:v3];
    uint64_t v7 = v6 + 1;
    [(NSUserDefaults *)self->_persistentStateDefaults setInteger:v6 + 1 forKey:v3];
    if (v6 >= 4)
    {
      [(NSUserDefaults *)self->_persistentStateDefaults removeObjectForKey:v3];
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        int v14 = 138543874;
        uint64_t v15 = self;
        __int16 v16 = 2114;
        uint64_t v17 = identifier;
        __int16 v18 = 2050;
        uint64_t v19 = 4;
        _os_log_impl(&dword_1D3AC6000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Reached maximum number of retries (%{public}ld), giving up", (uint8_t *)&v14, 0x20u);
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v7 = 1;
    [(NSUserDefaults *)persistentStateDefaults setInteger:1 forKey:v3];
  }
  [(HKHRDatabaseAnalysisSchedulerImpl *)self _retryDelayGivenRetryCount:v7];
  uint64_t v11 = v10;
  _HKInitializeLogging();
  __int16 v12 = self->_loggingCategory;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = self->_identifier;
    int v14 = 138544130;
    uint64_t v15 = self;
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    __int16 v18 = 2050;
    uint64_t v19 = v7;
    __int16 v20 = 2050;
    uint64_t v21 = v11;
    _os_log_impl(&dword_1D3AC6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Retry attempt %{public}ld, retrying in %{public}f seconds", (uint8_t *)&v14, 0x2Au);
  }
  [(HKHRDatabaseAnalysisSchedulerImpl *)self _retryDelayGivenRetryCount:v7];
  -[HKHRDatabaseAnalysisSchedulerImpl _requestGatedActivityRunWithDelay:](self, "_requestGatedActivityRunWithDelay:");
LABEL_9:
}

- (double)_retryDelayGivenRetryCount:(int64_t)a3
{
  return pow(self->_retryDelay / 60.0, (double)a3) * 60.0;
}

- (BOOL)_enterStateIfPossible:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  switch(state)
  {
    case 0uLL:
    case 3uLL:
      if (a3 != 1) {
        goto LABEL_9;
      }
      goto LABEL_3;
    case 1uLL:
      if (a3 != 2) {
        goto LABEL_9;
      }
      goto LABEL_3;
    case 2uLL:
      if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0) {
        goto LABEL_3;
      }
LABEL_9:
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
      {
        if (state - 1 > 2) {
          uint64_t v15 = @"WaitingForDaemonReady";
        }
        else {
          uint64_t v15 = off_1E69B4308[state - 1];
        }
        identifier = self->_identifier;
        if (a3 - 1 > 2) {
          uint64_t v17 = @"WaitingForDaemonReady";
        }
        else {
          uint64_t v17 = off_1E69B4308[a3 - 1];
        }
        int v19 = 138544130;
        __int16 v20 = self;
        __int16 v21 = 2114;
        uint64_t v22 = identifier;
        __int16 v23 = 2114;
        v24 = v15;
        __int16 v25 = 2114;
        v26 = v17;
        __int16 v18 = loggingCategory;
        _os_log_error_impl(&dword_1D3AC6000, v18, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@] Invalid attempt to change state from %{public}@ to %{public}@", (uint8_t *)&v19, 0x2Au);
      }
      BOOL v10 = 0;
      break;
    default:
LABEL_3:
      _HKInitializeLogging();
      uint64_t v7 = self->_loggingCategory;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (state - 1 > 2) {
          uint64_t v8 = @"WaitingForDaemonReady";
        }
        else {
          uint64_t v8 = off_1E69B4308[state - 1];
        }
        uint64_t v11 = self->_identifier;
        if (a3 - 1 > 2) {
          __int16 v12 = @"WaitingForDaemonReady";
        }
        else {
          __int16 v12 = off_1E69B4308[a3 - 1];
        }
        int v19 = 138544130;
        __int16 v20 = self;
        __int16 v21 = 2114;
        uint64_t v22 = v11;
        __int16 v23 = 2114;
        v24 = v8;
        __int16 v25 = 2114;
        v26 = v12;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1D3AC6000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] State will change from %{public}@ to %{public}@", (uint8_t *)&v19, 0x2Au);
      }
      self->_unint64_t state = a3;
      BOOL v10 = 1;
      break;
  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)_resetRetryCounter
{
  persistentStateDefaults = self->_persistentStateDefaults;
  id v3 = [(HKHRDatabaseAnalysisSchedulerImpl *)self retryCountKey];
  [(NSUserDefaults *)persistentStateDefaults removeObjectForKey:v3];
}

- (void)_runActivity:(id)a3 withCompletion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)self->_breadcrumbManager dropBreadcrumb:1];
  if (![v6 shouldDefer])
  {
    assertionProvider = self->_assertionProvider;
    id v26 = 0;
    uint64_t v11 = [(HKHRDatabaseAnalysisSchedulerDatabaseAssertionProvider *)assertionProvider takeAssertionWithError:&v26];
    id v12 = v26;
    if (v11)
    {
      if ([(HKHRDatabaseAnalysisSchedulerImpl *)self _enterStateIfPossible:2])
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F65B40];
        int v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __65__HKHRDatabaseAnalysisSchedulerImpl__runActivity_withCompletion___block_invoke;
        v22[3] = &unk_1E69B4298;
        v22[4] = self;
        id v23 = v6;
        id v24 = v11;
        id v25 = v7;
        __int16 v16 = [v13 maintenanceOperationWithName:v15 asynchronousBlock:v22];

        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        __int16 v18 = [WeakRetained daemon];
        int v19 = [v18 maintenanceWorkCoordinator];
        [v19 enqueueMaintenanceOperation:v16];

LABEL_15:
        goto LABEL_16;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)self->_loggingCategory, OS_LOG_TYPE_FAULT)) {
        -[HKHRDatabaseAnalysisSchedulerImpl _runActivity:withCompletion:]();
      }
      [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)self->_breadcrumbManager dropAnalysisResultBreadcrumbWithContext:@"Unable to transition to waiting for maintenance operation"];
      [v11 invalidate];
    }
    else
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        *(_DWORD *)buf = 138543874;
        v28 = self;
        __int16 v29 = 2114;
        id v30 = identifier;
        __int16 v31 = 2114;
        id v32 = v12;
        _os_log_impl(&dword_1D3AC6000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Unable to get accessibilityAssertion before enqueueing maintenance operation, attempting retry later: %{public}@", buf, 0x20u);
      }
      [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)self->_breadcrumbManager dropAnalysisResultBreadcrumbWithContext:@"Unable to take assertion"];
    }
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
    [(HKHRDatabaseAnalysisSchedulerImpl *)self _maybeRetryLater];
    goto LABEL_15;
  }
  _HKInitializeLogging();
  uint64_t v8 = self->_loggingCategory;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = self->_identifier;
    *(_DWORD *)buf = 138543618;
    v28 = self;
    __int16 v29 = 2114;
    id v30 = v9;
    _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Activity run but immediately deferred, deferring", buf, 0x16u);
  }
  [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)self->_breadcrumbManager dropAnalysisResultBreadcrumbWithContext:@"XPC activity deferred before maintenance"];
  (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 2, 0);
LABEL_16:
}

void __65__HKHRDatabaseAnalysisSchedulerImpl__runActivity_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__HKHRDatabaseAnalysisSchedulerImpl__runActivity_withCompletion___block_invoke_2;
  v8[3] = &unk_1E69B4270;
  id v10 = v3;
  v8[4] = v5;
  id v6 = *(void **)(a1 + 48);
  id v9 = v6;
  id v11 = *(id *)(a1 + 56);
  id v7 = v3;
  [v5 _runMaintenanceOperationForActivity:v4 assertion:v6 withCompletion:v8];
}

void __65__HKHRDatabaseAnalysisSchedulerImpl__runActivity_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void (**)(uint64_t))(v4 + 16);
  id v6 = a3;
  v5(v4);
  _HKInitializeLogging();
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v8 + 16);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] maintenance operation finished", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 40) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_runMaintenanceOperationForActivity:(id)a3 assertion:(id)a4 withCompletion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  breadcrumbManager = self->_breadcrumbManager;
  id v11 = a3;
  [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)breadcrumbManager dropBreadcrumb:2];
  LODWORD(breadcrumbManager) = [v11 shouldDefer];

  if (!breadcrumbManager)
  {
    if ([v8 state] == 3)
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        *(_DWORD *)buf = 138543618;
        id v26 = self;
        __int16 v27 = 2114;
        v28 = identifier;
        _os_log_impl(&dword_1D3AC6000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Activity run but assertion invalidated, attempting retry later", buf, 0x16u);
      }
      [(HKHRDatabaseAnalysisSchedulerImpl *)self _enterStateIfPossible:1];
      __int16 v16 = self->_breadcrumbManager;
      uint64_t v17 = @"Assertion expired after maintenance";
    }
    else
    {
      if ([(HKHRDatabaseAnalysisSchedulerImpl *)self _enterStateIfPossible:3])
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4F65B60]);
        [v18 setCacheScope:1];
        [v18 addAccessibilityAssertion:v8];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        __int16 v20 = [WeakRetained database];
        id v24 = 0;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __98__HKHRDatabaseAnalysisSchedulerImpl__runMaintenanceOperationForActivity_assertion_withCompletion___block_invoke;
        v22[3] = &unk_1E69B42E8;
        v22[4] = self;
        id v23 = v9;
        [v20 performWithTransactionContext:v18 error:&v24 block:v22];
        id v21 = v24;

        goto LABEL_15;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)self->_loggingCategory, OS_LOG_TYPE_FAULT)) {
        -[HKHRDatabaseAnalysisSchedulerImpl _runMaintenanceOperationForActivity:assertion:withCompletion:]();
      }
      [(HKHRDatabaseAnalysisSchedulerImpl *)self _enterStateIfPossible:1];
      __int16 v16 = self->_breadcrumbManager;
      uint64_t v17 = @"Unable to transition to waiting for activity";
    }
    [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)v16 dropAnalysisResultBreadcrumbWithContext:v17];
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
    [(HKHRDatabaseAnalysisSchedulerImpl *)self _maybeRetryLater];
    goto LABEL_15;
  }
  _HKInitializeLogging();
  __int16 v12 = self->_loggingCategory;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = self->_identifier;
    *(_DWORD *)buf = 138543618;
    id v26 = self;
    __int16 v27 = 2114;
    v28 = v13;
    _os_log_impl(&dword_1D3AC6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Activity run but deferred after maintenance operation, deferring", buf, 0x16u);
  }
  [(HKHRDatabaseAnalysisSchedulerImpl *)self _enterStateIfPossible:1];
  [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)self->_breadcrumbManager dropAnalysisResultBreadcrumbWithContext:@"XPC activity deferred after maintenance"];
  (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 2, 0);
LABEL_15:
}

uint64_t __98__HKHRDatabaseAnalysisSchedulerImpl__runMaintenanceOperationForActivity_assertion_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __98__HKHRDatabaseAnalysisSchedulerImpl__runMaintenanceOperationForActivity_assertion_withCompletion___block_invoke_2;
  v5[3] = &unk_1E69B42C0;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  [WeakRetained analysisSchedulerDidFire:v3 completion:v5];

  return 1;
}

uint64_t __98__HKHRDatabaseAnalysisSchedulerImpl__runMaintenanceOperationForActivity_assertion_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _enterStateIfPossible:1];
  if (a2 == 2)
  {
LABEL_4:
    [*(id *)(a1 + 32) _resetRetryCounter];
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
  if (a2 != 1)
  {
    if (a2) {
      return result;
    }
    goto LABEL_4;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(*(void *)(a1 + 32) + 48) dropBreadcrumb:6];
  id v6 = *(void **)(a1 + 32);

  return [v6 _maybeRetryLater];
}

- (HKHRDatabaseAnalysisSchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (HKHRDatabaseAnalysisSchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_lock_gatedActivity, 0);
  objc_storeStrong((id *)&self->_persistentStateDefaults, 0);
  objc_storeStrong((id *)&self->_assertionProvider, 0);
  objc_storeStrong((id *)&self->_gatedActivityFactory, 0);
  objc_storeStrong((id *)&self->_breadcrumbManager, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)daemonReady:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3AC6000, v0, v1, "[%{public}@:%{public}@] Unable to transition to waiting for activity.", v2, v3, v4, v5, v6);
}

- (void)_runActivity:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3AC6000, v0, v1, "[%{public}@:%{public}@] Unable to transition to waiting for maintenance operation state, attempting retry later", v2, v3, v4, v5, v6);
}

- (void)_runMaintenanceOperationForActivity:assertion:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D3AC6000, v0, v1, "[%{public}@:%{public}@] Unable to transition to triggered state, attempting retry later", v2, v3, v4, v5, v6);
}

@end