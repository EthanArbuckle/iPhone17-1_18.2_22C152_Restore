@interface BLSHSystemWaker
+ (id)sharedSystemActivityFactory;
+ (id)wakerWithIdentifier:(id)a3 osInterfaceProvider:(id)a4;
- (BLSHSystemWaker)initWithIdentifier:(id)a3 osInterfaceProvider:(id)a4;
- (NSString)description;
- (void)callCompletionForReason:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)startWatchdogTimer;
- (void)wakeWithCompletion:(id)a3;
- (void)watchdogTimerFired:(id)a3;
@end

@implementation BLSHSystemWaker

+ (id)sharedSystemActivityFactory
{
  if (sharedSystemActivityFactory_onceToken != -1) {
    dispatch_once(&sharedSystemActivityFactory_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)sharedSystemActivityFactory___aggregatedAssertionFactory;

  return v2;
}

uint64_t __46__BLSHSystemWaker_sharedSystemActivityFactory__block_invoke()
{
  v0 = objc_alloc_init(BLSHAggregatedSystemActivityAssertionFactory);
  uint64_t v1 = sharedSystemActivityFactory___aggregatedAssertionFactory;
  sharedSystemActivityFactory___aggregatedAssertionFactory = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)wakerWithIdentifier:(id)a3 osInterfaceProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v7 osInterfaceProvider:v6];

  return v8;
}

- (BLSHSystemWaker)initWithIdentifier:(id)a3 osInterfaceProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BLSHSystemWaker;
  v8 = [(BLSHSystemWaker *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [NSString stringWithFormat:@"waking system for: %@", v6];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_osInterfaceProvider, a4);
    id v12 = +[BLSHSystemWaker sharedSystemActivityFactory];
    objc_initWeak(&location, v9);
    objc_copyWeak(&v14, &location);
    v9->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v9;
}

uint64_t __58__BLSHSystemWaker_initWithIdentifier_osInterfaceProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];
  uint64_t v3 = BLSStateDataWithTitleDescriptionAndHints();

  return v3;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_1_5();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  id v12 = @"BLSHSystemWaker.m";
  __int16 v13 = 1024;
  int v14 = 66;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = objc_opt_new();
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __30__BLSHSystemWaker_description__block_invoke;
  __int16 v11 = &unk_2645322D0;
  id v12 = v4;
  __int16 v13 = self;
  id v5 = v4;
  [v5 appendProem:self block:&v8];
  id v6 = objc_msgSend(v5, "description", v8, v9, v10, v11);
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v6;
}

id __30__BLSHSystemWaker_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"id"];
  mach_continuous_time();
  uint64_t v3 = *(void **)(a1 + 32);
  BSTimeDifferenceFromMachTimeToMachTime();
  id v4 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", @"elapsed", 0);
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v5 + 81))
  {
    id v6 = *(void **)(a1 + 32);
    BSTimeDifferenceFromMachTimeToMachTime();
    id v7 = (id)objc_msgSend(v6, "appendTimeInterval:withName:decomposeUnits:", @"sinceCompletionCalled", 0);
    uint64_t v5 = *(void *)(a1 + 40);
  }
  id result = (id)[*(id *)(v5 + 24) isActive];
  if (result) {
    return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"systemActivity"];
  }
  return result;
}

- (void)wakeWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = self->_osInterfaceProvider;
  id v7 = self->_identifier;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_waking)
  {
    v18 = [NSString stringWithFormat:@"%@:%@ already waking", self, self->_identifier];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(BLSHSystemWaker *)a2 wakeWithCompletion:(uint64_t)v18];
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    self->_lock_waking = 1;
    uint64_t v8 = (void *)MEMORY[0x223C5E2B0](v5);
    id lock_completion = self->_lock_completion;
    self->_id lock_completion = v8;

    uint64_t v10 = (void *)mach_continuous_time();
    self->_lock_waitStartTimestamp = (unint64_t)v10;
    objc_initWeak(&location, self);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__12;
    v30 = __Block_byref_object_dispose__12;
    __int16 v11 = +[BLSHSystemWaker sharedSystemActivityFactory];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __38__BLSHSystemWaker_wakeWithCompletion___block_invoke;
    v24[3] = &unk_264534490;
    id v12 = v6;
    v25 = v12;
    __int16 v13 = [v11 createAggregatedSystemActivityAssertionWithIdentifier:v7 configurator:v24];
    lock_systemActivity = self->_lock_systemActivity;
    self->_lock_systemActivity = v13;

    v31 = v13;
    os_unfair_lock_unlock(&self->_lock);
    __int16 v15 = (void *)v27[5];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __38__BLSHSystemWaker_wakeWithCompletion___block_invoke_2;
    v19[3] = &unk_2645344B8;
    objc_copyWeak(v23, &location);
    uint64_t v16 = v12;
    v20 = v16;
    uint64_t v17 = v7;
    v23[1] = v10;
    v21 = v17;
    v22 = &v26;
    [v15 acquireWithTimeout:v19 handler:0.0];

    objc_destroyWeak(v23);
    _Block_object_dispose(&v26, 8);

    objc_destroyWeak(&location);
  }
}

uint64_t __38__BLSHSystemWaker_wakeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOSInterfaceProvider:*(void *)(a1 + 32)];
}

void __38__BLSHSystemWaker_wakeWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v10 = [*(id *)(a1 + 32) systemSleepMonitor];
    __int16 v11 = bls_backlight_log();
    if (a2)
    {
      if ([v8 afterPendingSleepWasAlreadyInitiated]) {
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      }
      else {
        os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      }
    }
    else
    {
      os_log_type_t v12 = OS_LOG_TYPE_FAULT;
    }
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      uint64_t v17 = v16;
      v18 = [v10 aggregateState];
      v19 = objc_msgSend(v7, "bls_loggingString");
      int v20 = 134219010;
      id v21 = WeakRetained;
      __int16 v22 = 2114;
      uint64_t v23 = v15;
      __int16 v24 = 2048;
      uint64_t v25 = v17;
      __int16 v26 = 2114;
      v27 = v18;
      __int16 v28 = 2114;
      v29 = v19;
      _os_log_impl(&dword_21FCFC000, v11, v12, "%p system waker activity acquired:\"%{public}@\" elapsed:%.4lfs %{public}@ error:%{public}@", (uint8_t *)&v20, 0x34u);
    }
    [WeakRetained startWatchdogTimer];
    [WeakRetained callCompletionForReason:@"systemActivityActive"];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }
}

- (void)startWatchdogTimer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_initWeak(&location, self);
  [(BSTimerScheduleQuerying *)self->_lock_wakeWatchdogTimer invalidate];
  osInterfaceProvider = self->_osInterfaceProvider;
  id v5 = [NSString stringWithFormat:@"watchdog for: %@", self->_identifier];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__BLSHSystemWaker_startWatchdogTimer__block_invoke;
  v8[3] = &unk_264533320;
  objc_copyWeak(&v9, &location);
  id v6 = [(BLSHOSInterfaceProviding *)osInterfaceProvider scheduledTimerWithIdentifier:v5 interval:v8 leewayInterval:90.0 handler:30.0];
  lock_wakeWatchdogTimer = self->_lock_wakeWatchdogTimer;
  self->_lock_wakeWatchdogTimer = v6;

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__BLSHSystemWaker_startWatchdogTimer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained watchdogTimerFired:v3];
  [v3 invalidate];
}

- (void)callCompletionForReason:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_invalidated = self->_lock_invalidated;
  id v6 = (void (**)(void))MEMORY[0x223C5E2B0](self->_lock_completion);
  id lock_completion = self->_lock_completion;
  self->_id lock_completion = 0;

  id v8 = self->_lock_systemActivity;
  self->_lock_didWakeTimestamp = mach_continuous_time();
  self->_lock_didCallCompletion = 1;
  os_unfair_lock_unlock(&self->_lock);
  id v9 = [(BLSHOSInterfaceProviding *)self->_osInterfaceProvider systemSleepMonitor];
  uint64_t v10 = v9;
  if (!lock_invalidated && v6)
  {
    int v11 = [v9 isAwakeOrAbortingSleep];
    os_log_type_t v12 = bls_backlight_log();
    uint64_t v13 = v12;
    if (v11) {
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
    }
    else {
      os_log_type_t v14 = OS_LOG_TYPE_FAULT;
    }
    if (os_log_type_enabled(v12, v14))
    {
      identifier = self->_identifier;
      BSTimeDifferenceFromMachTimeToMachTime();
      uint64_t v17 = v16;
      v18 = [v10 aggregateState];
      int v19 = 134219266;
      int v20 = self;
      __int16 v21 = 2114;
      __int16 v22 = identifier;
      __int16 v23 = 2114;
      id v24 = v4;
      __int16 v25 = 2048;
      uint64_t v26 = v17;
      __int16 v27 = 2114;
      __int16 v28 = v18;
      __int16 v29 = 1024;
      int v30 = [(BLSHSystemActivityAsserting *)v8 isActive];
      _os_log_impl(&dword_21FCFC000, v13, v14, "%p waited for system awake :\"%{public}@\" details:%{public}@ elapsed:%.4lfs %{public}@ activityActive:%{BOOL}u", (uint8_t *)&v19, 0x3Au);
    }
    v6[2](v6);
  }
}

- (void)watchdogTimerFired:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = (BSTimerScheduleQuerying *)a3;
  id v5 = self->_identifier;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_invalidated = self->_lock_invalidated;
  id v7 = self->_lock_systemActivity;
  if (!lock_invalidated && self->_lock_wakeWatchdogTimer == v4)
  {
    self->_lock_wakeWatchdogTimer = 0;

    lock_systemActivity = self->_lock_systemActivity;
    self->_lock_systemActivity = 0;

    int v8 = 1;
  }
  else
  {
    int v8 = 0;
  }
  BOOL lock_didCallCompletion = self->_lock_didCallCompletion;
  unsigned int v10 = [(BLSHSystemActivityAsserting *)v7 isActive];
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    uint64_t v12 = v11;
    if (lock_didCallCompletion)
    {
      BSTimeDifferenceFromMachTimeToMachTime();
      uint64_t v14 = v13;
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v15 = [NSString stringWithFormat:@"%p system waker not invalidated after elapsed:%.4lfs sinceCompletionCalled:%.4lfs systemActivityIsActive:%u identifier:%@", self, v12, v14, v10, v5];
        BLSHRecordCriticalAssertFailure(v15);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __38__BLSHSystemWaker_watchdogTimerFired___block_invoke;
        v29[3] = &unk_2645344E0;
        v29[4] = self;
        uint64_t v31 = v12;
        uint64_t v32 = v14;
        char v34 = v10;
        int v30 = v5;
        SEL v33 = a2;
        uint64_t v16 = (void (**)(void))MEMORY[0x223C5E2B0](v29);
        if (BLSHIsUnitTestRunning())
        {
          v16[2](v16);
        }
        else
        {
          dispatch_time_t v21 = dispatch_time(0, 1000000000);
          dispatch_after(v21, MEMORY[0x263EF83A0], v16);
        }
      }
      else
      {
        int v19 = bls_backlight_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134219010;
          v36 = self;
          __int16 v37 = 2048;
          uint64_t v38 = v12;
          __int16 v39 = 2048;
          *(void *)v40 = v14;
          *(_WORD *)&v40[8] = 1024;
          *(_DWORD *)&v40[10] = v10;
          __int16 v41 = 2114;
          v42 = v5;
          _os_log_fault_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_FAULT, "%p system waker not invalidated after elapsed:%.4lfs sinceCompletionCalled:%.4lfs systemActivityIsActive:%{BOOL}u identifier:%{public}@", buf, 0x30u);
        }
      }
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v17 = [NSString stringWithFormat:@"%p system waker did not wake after elapsed:%.4lfs systemActivityIsActive:%u identifier:%@", self, v12, v10, v5];
        BLSHRecordCriticalAssertFailure(v17);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __38__BLSHSystemWaker_watchdogTimerFired___block_invoke_83;
        v24[3] = &unk_264534508;
        void v24[4] = self;
        uint64_t v26 = v12;
        char v28 = v10;
        __int16 v25 = v5;
        SEL v27 = a2;
        v18 = (void (**)(void))MEMORY[0x223C5E2B0](v24);
        if (BLSHIsUnitTestRunning())
        {
          v18[2](v18);
        }
        else
        {
          dispatch_time_t v22 = dispatch_time(0, 1000000000);
          dispatch_after(v22, MEMORY[0x263EF83A0], v18);
        }
      }
      else
      {
        uint64_t v17 = bls_backlight_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218754;
          v36 = self;
          __int16 v37 = 2048;
          uint64_t v38 = v12;
          __int16 v39 = 1024;
          *(_DWORD *)v40 = v10;
          *(_WORD *)&v40[4] = 2114;
          *(void *)&v40[6] = v5;
          _os_log_fault_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_FAULT, "%p system waker did not wake after elapsed:%.4lfs systemActivityIsActive:%{BOOL}u identifier:%{public}@", buf, 0x26u);
        }
      }

      [(BLSHSystemWaker *)self callCompletionForReason:@"watchdogFired"];
    }
    [(BLSHSystemActivityAsserting *)v7 invalidate];
  }
}

void __38__BLSHSystemWaker_watchdogTimerFired___block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"BLSHCriticalAssertDidFailNotification", 0, 0, 4u);
  id v3 = [NSString stringWithFormat:@"%p system waker not invalidated after elapsed:%.4lfs sinceCompletionCalled:%.4lfs systemActivityIsActive:%u identifier:%@", *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 40)];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 64));
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544642;
    id v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = @"BLSHSystemWaker.m";
    __int16 v16 = 1024;
    int v17 = 199;
    __int16 v18 = 2114;
    int v19 = v3;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v3 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __38__BLSHSystemWaker_watchdogTimerFired___block_invoke_83(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"BLSHCriticalAssertDidFailNotification", 0, 0, 4u);
  id v3 = [NSString stringWithFormat:@"%p system waker did not wake after elapsed:%.4lfs systemActivityIsActive:%u identifier:%@", *(void *)(a1 + 32), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 40)];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544642;
    id v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = @"BLSHSystemWaker.m";
    __int16 v16 = 1024;
    int v17 = 205;
    __int16 v18 = 2114;
    int v19 = v3;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v3 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL lock_invalidated = 1;
  lock_systemActivity = self->_lock_systemActivity;
  self->_lock_systemActivity = 0;
  uint64_t v7 = lock_systemActivity;

  lock_wakeWatchdogTimer = self->_lock_wakeWatchdogTimer;
  self->_lock_wakeWatchdogTimer = 0;
  id v6 = lock_wakeWatchdogTimer;

  os_unfair_lock_unlock(p_lock);
  [(BLSHSystemActivityAsserting *)v7 invalidate];
  [(BSTimerScheduleQuerying *)v6 invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_completion, 0);
  objc_storeStrong((id *)&self->_lock_wakeWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_lock_systemActivity, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)wakeWithCompletion:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_1_5();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  __int16 v12 = @"BLSHSystemWaker.m";
  __int16 v13 = 1024;
  int v14 = 107;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

@end