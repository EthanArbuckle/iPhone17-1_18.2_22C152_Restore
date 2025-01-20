@interface BSLHWatchdogTimer
- (BOOL)hasSleepBeenImminentSinceScheduled;
- (BOOL)isInvalidated;
- (BOOL)wasSleepImminentWhenScheduled;
- (BSLHWatchdogTimer)initWithExplanation:(id)a3 delegate:(id)a4 provider:(id)a5;
- (NSString)description;
- (NSString)explanation;
- (unint64_t)invalidationReason;
- (void)dealloc;
- (void)invalidate:(unint64_t)a3;
- (void)scheduleWithTimeout:(double)a3;
- (void)setSleepImminentSinceScheduled:(BOOL)a3;
- (void)systemSleepMonitorDidWakeFromSleep:(id)a3;
- (void)systemSleepMonitorSleepRequestAborted:(id)a3;
- (void)systemSleepMonitorWillWakeFromSleep:(id)a3;
- (void)timerFired;
@end

@implementation BSLHWatchdogTimer

- (BSLHWatchdogTimer)initWithExplanation:(id)a3 delegate:(id)a4 provider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BSLHWatchdogTimer;
  v11 = [(BSLHWatchdogTimer *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    explanation = v11->_explanation;
    v11->_explanation = (NSString *)v12;

    objc_storeWeak((id *)&v11->_delegate, v9);
    objc_storeStrong((id *)&v11->_provider, a5);
    uint64_t v14 = [objc_alloc(MEMORY[0x263F29BA8]) initWithIdentifier:v8];
    timer = v11->_timer;
    v11->_timer = (BSAbsoluteMachTimer *)v14;

    v11->_lock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_1_5();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  uint64_t v12 = @"BLSHWatchdogProvider.m";
  __int16 v13 = 1024;
  int v14 = 628;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_lock_invalidated withName:@"invalidated" ifEqualTo:1];
  [v3 appendString:self->_explanation withName:@"explanation"];
  if (self->_lock_invalidated)
  {
    if (self->_lock_invalidationReason == 1) {
      v5 = @"replaced";
    }
    else {
      v5 = @"completed";
    }
    [v3 appendString:v5 withName:@"invalidationReason"];
  }
  v6 = [v3 build];

  return (NSString *)v6;
}

- (void)scheduleWithTimeout:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_invalidated"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(BSLHWatchdogTimer *)a2 scheduleWithTimeout:(uint64_t)v17];
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    self->_lock_timeout = a3;
    BSContinuousMachTimeNow();
    self->_lock_watchdogStart = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = [WeakRetained osInterfaceProvider];
    uint64_t v10 = [v9 systemSleepMonitor];
    int v11 = [v10 isSleepImminent];

    if (v11)
    {
      self->_lock_sleepImminentSinceScheduled = 1;
      uint64_t v12 = [WeakRetained osInterfaceProvider];
      __int16 v13 = [v12 systemSleepMonitor];
      [v13 addObserver:self];
    }
    os_unfair_lock_unlock(p_lock);
    objc_initWeak(&location, self);
    timer = self->_timer;
    uint64_t v15 = MEMORY[0x263EF83A0];
    id v16 = MEMORY[0x263EF83A0];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __41__BSLHWatchdogTimer_scheduleWithTimeout___block_invoke;
    v18[3] = &unk_264532208;
    objc_copyWeak(&v19, &location);
    [(BSAbsoluteMachTimer *)timer scheduleWithFireInterval:v15 leewayInterval:v18 queue:a3 handler:1.0];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __41__BSLHWatchdogTimer_scheduleWithTimeout___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 invalidate];

  [WeakRetained timerFired];
}

- (void)timerFired
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_timeout = self->_lock_timeout;
  BSContinuousMachTimeNow();
  double v6 = v5;
  double lock_watchdogStart = self->_lock_watchdogStart;
  BOOL lock_invalidated = self->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  if (!lock_invalidated)
  {
    provider = self->_provider;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [(BLSHWatchdogProvider *)provider fireWatchdogWithTimer:self delegate:WeakRetained timeout:lock_timeout elapsedTime:v6 - lock_watchdogStart];
  }
}

- (void)invalidate:(unint64_t)a3
{
  [(BSAbsoluteMachTimer *)self->_timer invalidate];
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL lock_invalidated = 1;
  self->_lock_invalidationReason = a3;
  double lock_timeout = self->_lock_timeout;
  BSContinuousMachTimeNow();
  double v7 = v6 - self->_lock_watchdogStart;
  os_unfair_lock_unlock(&self->_lock);
  [(BSLHWatchdogTimer *)self setSleepImminentSinceScheduled:0];
  provider = self->_provider;
  explanation = self->_explanation;

  [(BLSHWatchdogProvider *)provider clearWatchdogWithExplanation:explanation reason:a3 timeout:lock_timeout elapsedTime:v7];
}

- (BOOL)isInvalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)invalidationReason
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_invalidationReason = self->_lock_invalidationReason;
  os_unfair_lock_unlock(p_lock);
  return lock_invalidationReason;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (BOOL)hasSleepBeenImminentSinceScheduled
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_sleepImminentSinceScheduled = self->_lock_sleepImminentSinceScheduled;
  os_unfair_lock_unlock(p_lock);
  if (!lock_sleepImminentSinceScheduled) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v6 = [WeakRetained osInterfaceProvider];
  double v7 = [v6 systemSleepMonitor];
  char v8 = [v7 isSleepImminent];

  return v8;
}

- (void)setSleepImminentSinceScheduled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_sleepImminentSinceScheduled = self->_lock_sleepImminentSinceScheduled;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  self->_BOOL lock_sleepImminentSinceScheduled = a3;
  os_unfair_lock_unlock(p_lock);
  if (lock_sleepImminentSinceScheduled && !a3)
  {
    double v7 = [WeakRetained osInterfaceProvider];
    char v8 = [v7 systemSleepMonitor];
    [v8 removeObserver:self];
  }
}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
}

- (BOOL)wasSleepImminentWhenScheduled
{
  return self->_sleepImminentWhenScheduled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_explanation, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)scheduleWithTimeout:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  double v5 = NSStringFromSelector(a1);
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_1_5();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  uint64_t v12 = @"BLSHWatchdogProvider.m";
  __int16 v13 = 1024;
  int v14 = 644;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

@end