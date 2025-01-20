@interface BLSHSystemWakeWaiter
+ (id)waiterWithIdentifier:(id)a3 osInterfaceProvider:(id)a4;
- (BLSHSystemWakeWaiter)initWithIdentifier:(id)a3 osInterfaceProvider:(id)a4;
- (void)_lock_invalidate;
- (void)dealloc;
- (void)invalidate;
- (void)runWhenAwakeWithCompletion:(id)a3;
- (void)systemSleepMonitorDidWakeFromSleep:(id)a3;
@end

@implementation BLSHSystemWakeWaiter

+ (id)waiterWithIdentifier:(id)a3 osInterfaceProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v7 osInterfaceProvider:v6];

  return v8;
}

- (BLSHSystemWakeWaiter)initWithIdentifier:(id)a3 osInterfaceProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHSystemWakeWaiter;
  v9 = [(BLSHSystemWakeWaiter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_osInterfaceProvider, a4);
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  v9 = @"BLSHSystemWakeWaiter.m";
  __int16 v10 = 1024;
  int v11 = 47;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)runWhenAwakeWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = (void (**)(void))a3;
  id v6 = self->_osInterfaceProvider;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_waiting)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%@:%@ already waiting", self, self->_identifier];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(BLSHSystemWakeWaiter *)a2 runWhenAwakeWithCompletion:(uint64_t)v14];
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD28F08);
  }
  __int16 v7 = [(BLSHOSInterfaceProviding *)v6 systemSleepMonitor];
  if ([v7 isAwakeOrAbortingSleep] && (objc_msgSend(v7, "hasSleepBeenRequested") & 1) == 0)
  {
    __int16 v12 = bls_backlight_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138412546;
      v16 = self;
      __int16 v17 = 2112;
      v18 = identifier;
      _os_log_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_DEBUG, "%@:%@ asked to run block while system is awake, running now.", buf, 0x16u);
    }

    os_unfair_lock_unlock(&self->_lock);
    v5[2](v5);
  }
  else
  {
    id v8 = bls_backlight_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_identifier;
      *(_DWORD *)buf = 138412546;
      v16 = self;
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ asked to run block while system is asleep, waiting.", buf, 0x16u);
    }

    self->_lock_waitStartTimestamp = mach_continuous_time();
    [v7 addObserver:self];
    self->_lock_waiting = 1;
    __int16 v10 = (void *)MEMORY[0x223C5E2B0](v5);
    id lock_completion = self->_lock_completion;
    self->_id lock_completion = v10;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated || !self->_lock_completion)
  {
    v5 = bls_backlight_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      if (self->_lock_invalidated) {
        __int16 v7 = @"YES";
      }
      else {
        __int16 v7 = @"NO";
      }
      id v8 = (void *)MEMORY[0x223C5E2B0](self->_lock_completion);
      int v13 = 138413058;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      v16 = identifier;
      __int16 v17 = 2112;
      v18 = v7;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_DEBUG, "%@:%@ system did wake but waiter was invalidated (%@) or completion is nil (%@)", (uint8_t *)&v13, 0x2Au);
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_didWakeTimestamp = mach_continuous_time();
    v9 = bls_backlight_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = self->_identifier;
      BSTimeDifferenceFromMachTimeToMachTime();
      int v13 = 138412802;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      v16 = v10;
      __int16 v17 = 2048;
      v18 = v11;
      _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ system awake, running pending block, waited:%.4lfs.", (uint8_t *)&v13, 0x20u);
    }

    __int16 v12 = (void (**)(void))MEMORY[0x223C5E2B0](self->_lock_completion);
    os_unfair_lock_unlock(p_lock);
    if (v12)
    {
      v12[2](v12);
    }
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BLSHSystemWakeWaiter *)self _lock_invalidate];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_invalidate
{
  id v4 = [(BLSHOSInterfaceProviding *)self->_osInterfaceProvider systemSleepMonitor];
  [v4 removeObserver:self];
  self->_lock_invalidated = 1;
  id lock_completion = self->_lock_completion;
  self->_id lock_completion = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_completion, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)runWhenAwakeWithCompletion:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  v9 = @"BLSHSystemWakeWaiter.m";
  __int16 v10 = 1024;
  int v11 = 55;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end