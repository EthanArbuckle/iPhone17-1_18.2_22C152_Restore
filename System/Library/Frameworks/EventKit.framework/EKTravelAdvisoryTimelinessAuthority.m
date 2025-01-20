@interface EKTravelAdvisoryTimelinessAuthority
+ (id)stringForPeriod:(unint64_t)a3;
- (BOOL)active;
- (BOOL)internalActive;
- (CalDateProvider)dateProvider;
- (EKTravelAdvisoryTimelinessAuthority)init;
- (EKTravelAdvisoryTimelinessAuthority)initWithDateProvider:(id)a3;
- (NSDate)startOfLeaveNowPeriod;
- (NSDate)startOfLeaveNowPeriodInternal;
- (NSDate)startOfRunningLatePeriod;
- (NSDate)startOfRunningLatePeriodInternal;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)timer;
- (id)internalPeriodChangedCallback;
- (id)periodChangedCallback;
- (unint64_t)internalPeriod;
- (unint64_t)period;
- (void)_refresh;
- (void)_refreshOnDate:(id)a3;
- (void)_refreshPeriod;
- (void)_refreshTimer;
- (void)_uninstallTimer;
- (void)activate;
- (void)deactivate;
- (void)dealloc;
- (void)setCallbackQueue:(id)a3;
- (void)setInternalActive:(BOOL)a3;
- (void)setInternalPeriod:(unint64_t)a3;
- (void)setInternalPeriodChangedCallback:(id)a3;
- (void)setPeriodChangedCallback:(id)a3;
- (void)setStartOfLeaveNowPeriodInternal:(id)a3;
- (void)setStartOfRunningLatePeriodInternal:(id)a3;
- (void)setTimer:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)updateWithHypothesis:(id)a3;
@end

@implementation EKTravelAdvisoryTimelinessAuthority

- (EKTravelAdvisoryTimelinessAuthority)init
{
  v3 = [MEMORY[0x1E4F57770] sharedInstance];
  v4 = [(EKTravelAdvisoryTimelinessAuthority *)self initWithDateProvider:v3];

  return v4;
}

- (EKTravelAdvisoryTimelinessAuthority)initWithDateProvider:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKTravelAdvisoryTimelinessAuthority;
  v6 = [(EKTravelAdvisoryTimelinessAuthority *)&v14 init];
  if (v6)
  {
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v7 = objc_claimAutoreleasedReturnValue();
    v8 = (const char *)[v7 UTF8String];

    dispatch_queue_t v9 = dispatch_queue_create(v8, 0);
    [(EKTravelAdvisoryTimelinessAuthority *)v6 setWorkQueue:v9];

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v10 = objc_claimAutoreleasedReturnValue();
    v11 = (const char *)[v10 UTF8String];

    dispatch_queue_t v12 = dispatch_queue_create(v11, 0);
    [(EKTravelAdvisoryTimelinessAuthority *)v6 setCallbackQueue:v12];

    objc_storeStrong((id *)&v6->_dateProvider, a3);
  }

  return v6;
}

- (void)dealloc
{
  [(EKTravelAdvisoryTimelinessAuthority *)self _uninstallTimer];
  v3.receiver = self;
  v3.super_class = (Class)EKTravelAdvisoryTimelinessAuthority;
  [(EKTravelAdvisoryTimelinessAuthority *)&v3 dealloc];
}

- (BOOL)active
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  objc_super v3 = [(EKTravelAdvisoryTimelinessAuthority *)self workQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__EKTravelAdvisoryTimelinessAuthority_active__block_invoke;
  v5[3] = &unk_1E5B96F20;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __45__EKTravelAdvisoryTimelinessAuthority_active__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) internalActive];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)activate
{
  objc_super v3 = [(EKTravelAdvisoryTimelinessAuthority *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EKTravelAdvisoryTimelinessAuthority_activate__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_async(v3, block);
}

void __47__EKTravelAdvisoryTimelinessAuthority_activate__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) internalActive])
  {
    v2 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __47__EKTravelAdvisoryTimelinessAuthority_activate__block_invoke_cold_1((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  else
  {
    [*v1 setInternalActive:1];
    id v9 = *v1;
    [v9 _refresh];
  }
}

- (void)deactivate
{
  uint64_t v3 = [(EKTravelAdvisoryTimelinessAuthority *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__EKTravelAdvisoryTimelinessAuthority_deactivate__block_invoke;
  block[3] = &unk_1E5B96E08;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __49__EKTravelAdvisoryTimelinessAuthority_deactivate__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) internalActive])
  {
    [*v1 setInternalActive:0];
    id v2 = *v1;
    [v2 _refresh];
  }
  else
  {
    uint64_t v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __49__EKTravelAdvisoryTimelinessAuthority_deactivate__block_invoke_cold_1((uint64_t)v1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (NSDate)startOfLeaveNowPeriod
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  uint64_t v3 = [(EKTravelAdvisoryTimelinessAuthority *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__EKTravelAdvisoryTimelinessAuthority_startOfLeaveNowPeriod__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

uint64_t __60__EKTravelAdvisoryTimelinessAuthority_startOfLeaveNowPeriod__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) startOfLeaveNowPeriodInternal];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSDate)startOfRunningLatePeriod
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  uint64_t v3 = [(EKTravelAdvisoryTimelinessAuthority *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__EKTravelAdvisoryTimelinessAuthority_startOfRunningLatePeriod__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

uint64_t __63__EKTravelAdvisoryTimelinessAuthority_startOfRunningLatePeriod__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) startOfRunningLatePeriodInternal];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)updateWithHypothesis:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(EKTravelAdvisoryTimelinessAuthority *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke;
  v7[3] = &unk_1E5B98488;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  objc_copyWeak(&v10, &location);
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke_cold_2(a1, v3);
    }
    uint64_t v2 = *(void **)(a1 + 32);
  }
  id v4 = [v2 suggestedDepartureDate];
  uint64_t v5 = [v4 dateByAddingTimeInterval:-120.0];
  id v6 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setStartOfLeaveNowPeriodInternal:v5];

  id v8 = [*(id *)(a1 + 32) aggressiveDepartureDate];
  id v9 = objc_loadWeakRetained(v6);
  [v9 setStartOfRunningLatePeriodInternal:v8];

  id v10 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
    __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke_cold_1(v10, v6);
  }
  id v11 = objc_loadWeakRetained(v6);
  [v11 _refresh];
}

- (void)setPeriodChangedCallback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKTravelAdvisoryTimelinessAuthority *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__EKTravelAdvisoryTimelinessAuthority_setPeriodChangedCallback___block_invoke;
  v7[3] = &unk_1E5B96BA8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__EKTravelAdvisoryTimelinessAuthority_setPeriodChangedCallback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInternalPeriodChangedCallback:*(void *)(a1 + 40)];
}

- (id)periodChangedCallback
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__14;
  id v11 = __Block_byref_object_dispose__15;
  id v12 = 0;
  uint64_t v3 = [(EKTravelAdvisoryTimelinessAuthority *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__EKTravelAdvisoryTimelinessAuthority_periodChangedCallback__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (void *)MEMORY[0x1A6266730](v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __60__EKTravelAdvisoryTimelinessAuthority_periodChangedCallback__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalPeriodChangedCallback];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (unint64_t)period
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(EKTravelAdvisoryTimelinessAuthority *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__EKTravelAdvisoryTimelinessAuthority_period__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __45__EKTravelAdvisoryTimelinessAuthority_period__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) internalPeriod];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)stringForPeriod:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5B984D0[a3];
  }
}

- (void)_refresh
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Refreshing [%@]", v2, v3, v4, v5, v6);
}

- (void)_refreshPeriod
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  uint8_t v6 = +[EKTravelAdvisoryTimelinessAuthority stringForPeriod:](EKTravelAdvisoryTimelinessAuthority, "stringForPeriod:", [a2 internalPeriod]);
  uint64_t v7 = +[EKTravelAdvisoryTimelinessAuthority stringForPeriod:a3];
  int v8 = 138412802;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2112;
  v13 = a2;
  _os_log_debug_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_DEBUG, "Period refreshed from [%@] to [%@] in [%@]", (uint8_t *)&v8, 0x20u);
}

uint64_t __53__EKTravelAdvisoryTimelinessAuthority__refreshPeriod__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_refreshTimer
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, v0, v1, "Calculated next refresh date of [%@] in [%@]");
}

- (void)_refreshOnDate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    int v6 = [v4 CalIsBeforeDate:v5];

    if (v6)
    {
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        -[EKTravelAdvisoryTimelinessAuthority _refreshOnDate:]();
      }
    }
    else
    {
      uint64_t v7 = [(EKTravelAdvisoryTimelinessAuthority *)self timer];
      if (!v7)
      {
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
          -[EKTimedEventStorePurger _resetIdleTimer]();
        }
        int v8 = [(EKTravelAdvisoryTimelinessAuthority *)self workQueue];
        uint64_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v8);

        [(EKTravelAdvisoryTimelinessAuthority *)self setTimer:v7];
        objc_initWeak(&location, self);
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        v15 = __54__EKTravelAdvisoryTimelinessAuthority__refreshOnDate___block_invoke;
        v16 = &unk_1E5B96DE0;
        objc_copyWeak(&v17, &location);
        dispatch_source_set_event_handler(v7, &v13);
        dispatch_activate(v7);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      objc_msgSend(v4, "timeIntervalSinceNow", v13, v14, v15, v16);
      double v10 = v9;
      dispatch_time_t v11 = dispatch_time(0, (unint64_t)(v9 * 1000000000.0));
      __int16 v12 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        -[EKTravelAdvisoryTimelinessAuthority _refreshOnDate:](v12, v10);
      }
      dispatch_source_set_timer(v7, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  else
  {
    [(EKTravelAdvisoryTimelinessAuthority *)self _uninstallTimer];
  }
}

void __54__EKTravelAdvisoryTimelinessAuthority__refreshOnDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      __54__EKTravelAdvisoryTimelinessAuthority__refreshOnDate___block_invoke_cold_1();
    }
    [WeakRetained _refresh];
  }
}

- (void)_uninstallTimer
{
  uint64_t v3 = [(EKTravelAdvisoryTimelinessAuthority *)self timer];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKTimedEventStorePurger _uninstallTimer]();
    }
    dispatch_source_cancel(v3);
    [(EKTravelAdvisoryTimelinessAuthority *)self setTimer:0];
  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSDate)startOfLeaveNowPeriodInternal
{
  return self->_startOfLeaveNowPeriodInternal;
}

- (void)setStartOfLeaveNowPeriodInternal:(id)a3
{
}

- (NSDate)startOfRunningLatePeriodInternal
{
  return self->_startOfRunningLatePeriodInternal;
}

- (void)setStartOfRunningLatePeriodInternal:(id)a3
{
}

- (BOOL)internalActive
{
  return self->_internalActive;
}

- (void)setInternalActive:(BOOL)a3
{
  self->_internalActive = a3;
}

- (unint64_t)internalPeriod
{
  return self->_internalPeriod;
}

- (void)setInternalPeriod:(unint64_t)a3
{
  self->_internalPeriod = a3;
}

- (id)internalPeriodChangedCallback
{
  return self->_internalPeriodChangedCallback;
}

- (void)setInternalPeriodChangedCallback:(id)a3
{
}

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong(&self->_internalPeriodChangedCallback, 0);
  objc_storeStrong((id *)&self->_startOfRunningLatePeriodInternal, 0);
  objc_storeStrong((id *)&self->_startOfLeaveNowPeriodInternal, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __47__EKTravelAdvisoryTimelinessAuthority_activate__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __49__EKTravelAdvisoryTimelinessAuthority_deactivate__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke_cold_1(void *a1, id *a2)
{
  id v3 = a1;
  id WeakRetained = objc_loadWeakRetained(a2);
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = objc_loadWeakRetained(a2);
  uint64_t v7 = [v6 startOfLeaveNowPeriodInternal];
  id v8 = objc_loadWeakRetained(a2);
  double v9 = [v8 startOfRunningLatePeriodInternal];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0(&dword_1A4E47000, v10, v11, "Updating [%@] based on new hypothesis. now: [%@] startOfLeaveNowPeriod: [%@] startOfRunningLatePeriod: [%@]", v12, v13, v14, v15, v16);
}

void __60__EKTravelAdvisoryTimelinessAuthority_updateWithHypothesis___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "nil 'hypothesis' received in [%@]", (uint8_t *)&v3, 0xCu);
}

- (void)_refreshOnDate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, v0, v1, "[%@] is before now.  Will not set up a timer to refresh [%@]");
}

- (void)_refreshOnDate:(void *)a1 .cold.2(void *a1, double a2)
{
  int v3 = NSNumber;
  id v4 = a1;
  uint64_t v5 = [v3 numberWithDouble:a2];
  id v6 = [NSNumber numberWithDouble:0.0];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [v7 dateByAddingTimeInterval:a2];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_0(&dword_1A4E47000, v9, v10, "Setting the timer's timeout to [%@] seconds and its leeway to [%@] seconds.  The timer will fire around [%@] in [%@]", v11, v12, v13, v14, v15);
}

void __54__EKTravelAdvisoryTimelinessAuthority__refreshOnDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Timer fired in [%@].", v2, v3, v4, v5, v6);
}

@end