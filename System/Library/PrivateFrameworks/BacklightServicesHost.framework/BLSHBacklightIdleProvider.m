@interface BLSHBacklightIdleProvider
+ (id)createSharedProviderWithLocalAssertionService:(id)a3;
+ (id)sharedProvider;
+ (void)sharedProvider;
- (BLSHBacklightIdleProvider)initWithLocalAssertionService:(id)a3 idleProvider:(id)a4 backlightHost:(id)a5;
- (BLSHBacklightIdleProviderDelegate)delegate;
- (BOOL)hasUserActivityOccured;
- (BOOL)isActive;
- (BOOL)isIdle;
- (double)idleTimeout;
- (double)nonInteractiveIdleTimeout;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6;
- (void)backlightHost:(id)a3 willTransitionToState:(int64_t)a4 forEvent:(id)a5;
- (void)dealloc;
- (void)idleProviderDidIdle:(id)a3;
- (void)idleProviderDidUnidle:(id)a3;
- (void)invalidate;
- (void)onMain_handleDidIdle;
- (void)onMain_handleSuppressedChanged;
- (void)onMain_handleSuspendedChanged;
- (void)onMain_idleBacklightInactiveWithExplanation:(uint64_t)a1;
- (void)reset;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIdleTimeout:(double)a3;
- (void)setNonInteractiveIdleTimeout:(double)a3;
- (void)setSuppressed:(uint64_t)a1;
- (void)setSuspended:(BOOL)a3;
- (void)signalUserActivityOccurred;
- (void)start;
- (void)updateForBacklightState:(uint64_t)a1;
@end

@implementation BLSHBacklightIdleProvider

+ (id)createSharedProviderWithLocalAssertionService:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_0);
  if (_sharedProvider_0)
  {
    v10 = [NSString stringWithFormat:@"[BLSHBacklightIdleProvider createSharedProviderWithLocalAssertionService:] should not be called twice"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHBacklightIdleProvider createSharedProviderWithLocalAssertionService:]();
    }
    [v10 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    id v5 = objc_alloc((Class)a1);
    v6 = objc_alloc_init(BLSHUserIdleProvider);
    v7 = +[BLSHBacklightHost sharedBacklightHost];
    v8 = (void *)[v5 initWithLocalAssertionService:v4 idleProvider:v6 backlightHost:v7];

    objc_storeStrong((id *)&_sharedProvider_0, v8);
    os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_0);

    return v8;
  }
  return result;
}

+ (id)sharedProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_0);
  id v2 = (id)_sharedProvider_0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_0);
  if (v2)
  {
    return v2;
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"[BLSHBacklightIdleProvider sharedProvider] should not be called before createSharedProviderWithLocalAssertionService:"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHBacklightIdleProvider sharedProvider]();
    }
    [v4 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BLSHBacklightIdleProvider)initWithLocalAssertionService:(id)a3 idleProvider:(id)a4 backlightHost:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSHBacklightIdleProvider;
  v11 = [(BLSHBacklightIdleProvider *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v11->_lock_idleProvider, a4);
    [v9 setDelegate:v12];
    v12->_lock_active = 1;
    objc_storeStrong((id *)&v12->_backlightHost, a5);
    [v10 addObserver:v12];
    -[BLSHBacklightIdleProvider updateForBacklightState:]((uint64_t)v12, [v10 backlightState]);
    if (v8) {
      id v13 = +[BLSHPreventBacklightIdleAttributeHandler registerHandlerForService:v8 provider:v12];
    }
  }

  return v12;
}

- (void)updateForBacklightState:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    int v5 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned char *)(a1 + 56))
    {
      if (a2 == 2)
      {
        char v6 = 0;
        *(unsigned char *)(a1 + 63) = 0;
      }
      else
      {
        char v6 = 1;
      }
      *(unsigned char *)(a1 + 60) = v6;
    }
    if (*(unsigned char *)(a1 + 63) || (double v7 = *(double *)(a1 + 40), fabs(v7) < 2.22044605e-16)) {
      double v7 = *(double *)(a1 + 32);
    }
    int v8 = *(unsigned __int8 *)(a1 + 58);
    id v11 = *(id *)(a1 + 8);
    os_unfair_lock_unlock(v4);
    if (v5)
    {
      BOOL v9 = a2 == 2;
      [v11 setShouldNotifyOfUnidle:v9];
      [v11 setIdleTimeout:1 shouldReset:v7];
      if (v8) {
        BOOL v10 = 0;
      }
      else {
        BOOL v10 = v9;
      }
      [(id)a1 setActive:v10];
    }
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)start
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)signalUserActivityOccurred
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_userActivityOccured = 1;
  double lock_idleTimeout = self->_lock_idleTimeout;
  uint64_t v5 = self->_lock_idleProvider;
  os_unfair_lock_unlock(p_lock);
  [(BLSHUserIdleProviding *)v5 setIdleTimeout:1 shouldReset:lock_idleTimeout];
}

- (void)reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_nonInteractiveIdleTimeout = self->_lock_nonInteractiveIdleTimeout;
  self->_lock_userActivityOccured = 0;
  uint64_t v5 = self->_lock_idleProvider;
  os_unfair_lock_unlock(p_lock);
  [(BLSHUserIdleProviding *)v5 setShouldNotifyOfUnidle:1];
  [(BLSHUserIdleProviding *)v5 setIdleTimeout:1 shouldReset:lock_nonInteractiveIdleTimeout];
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  lock_idleProvider = self->_lock_idleProvider;
  self->_lock_idleProvider = 0;
  uint64_t v5 = lock_idleProvider;

  os_unfair_lock_unlock(p_lock);
  [(BLSHUserIdleProviding *)v5 invalidate];
}

- (double)idleTimeout
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_idleTimeout = self->_lock_idleTimeout;
  os_unfair_lock_unlock(p_lock);
  return lock_idleTimeout;
}

- (void)setIdleTimeout:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_double lock_idleTimeout = a3;
  BOOL lock_userActivityOccured = self->_lock_userActivityOccured;
  uint64_t v7 = self->_lock_idleProvider;
  os_unfair_lock_unlock(p_lock);
  if (lock_userActivityOccured) {
    [(BLSHUserIdleProviding *)v7 setIdleTimeout:0 shouldReset:a3];
  }
}

- (double)nonInteractiveIdleTimeout
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_nonInteractiveIdleTimeout = self->_lock_nonInteractiveIdleTimeout;
  os_unfair_lock_unlock(p_lock);
  return lock_nonInteractiveIdleTimeout;
}

- (void)setNonInteractiveIdleTimeout:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_double lock_nonInteractiveIdleTimeout = a3;
  BOOL lock_userActivityOccured = self->_lock_userActivityOccured;
  uint64_t v7 = self->_lock_idleProvider;
  os_unfair_lock_unlock(p_lock);
  if (!lock_userActivityOccured) {
    [(BLSHUserIdleProviding *)v7 setIdleTimeout:0 shouldReset:a3];
  }
}

- (BOOL)isActive
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_active;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setActive:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_active = self->_lock_active;
  self->_int lock_active = v3;
  BOOL lock_started = self->_lock_started;
  uint8_t v9 = self->_lock_idleProvider;
  os_unfair_lock_unlock(p_lock);
  if (lock_active != v3 && lock_started)
  {
    if (v3) {
      [(BLSHUserIdleProviding *)v9 resume];
    }
    else {
      [(BLSHUserIdleProviding *)v9 pause];
    }
  }
}

- (BOOL)isIdle
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_idle;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)hasUserActivityOccured
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_userActivityOccured;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSuspended:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_suspended = self->_lock_suspended;
  self->_int lock_suspended = v3;
  BOOL lock_started = self->_lock_started;
  os_unfair_lock_unlock(p_lock);
  uint64_t v8 = bls_backlight_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BLSHBacklightIdleProvider setSuspended:]();
  }

  if (lock_suspended != v3 && lock_started) {
    BSDispatchMain();
  }
}

void __42__BLSHBacklightIdleProvider_setSuspended___block_invoke(uint64_t a1)
{
}

- (void)onMain_handleSuspendedChanged
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    int v3 = *(unsigned __int8 *)(a1 + 58);
    id v4 = *(id *)(a1 + 8);
    os_unfair_lock_unlock(v2);
    [*(id *)(a1 + 16) backlightState];
    if (BLSBacklightStateIsActive())
    {
      [v4 reset];
      [(id)a1 setActive:v3 == 0];
    }
  }
}

- (void)setSuppressed:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    int v5 = *(unsigned __int8 *)(a1 + 59);
    *(unsigned char *)(a1 + 59) = a2;
    int v6 = *(unsigned __int8 *)(a1 + 56);
    os_unfair_lock_unlock(v4);
    uint64_t v7 = bls_backlight_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BLSHBacklightIdleProvider setSuppressed:]();
    }

    if (v5 != a2)
    {
      if (v6) {
        BSDispatchMain();
      }
    }
  }
}

void __43__BLSHBacklightIdleProvider_setSuppressed___block_invoke(uint64_t a1)
{
}

- (void)onMain_handleSuppressedChanged
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7_0(&dword_21FCFC000, v0, v1, "onMain_handleSuppressedChanged suppressed=%{BOOL}u idle=%{BOOL}u");
}

- (void)onMain_idleBacklightInactiveWithExplanation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    int v4 = *(unsigned __int8 *)(a1 + 61);
    *(unsigned char *)(a1 + 61) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    if (v4)
    {
      int v5 = *(void **)(a1 + 16);
      int v6 = [objc_alloc(MEMORY[0x263F29980]) initWithRequestedActivityState:0 explanation:v3 timestamp:mach_continuous_time() sourceEvent:1 sourceEventMetadata:0];
      id v7 = (id)[v5 performChangeRequest:v6];
    }
    else
    {
      int v6 = bls_backlight_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        [(BLSHBacklightIdleProvider *)a1 onMain_idleBacklightInactiveWithExplanation:v6];
      }
    }
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a5;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_didStartTransitionToNewState = 0;
  if (a4 == 2 && self->_lock_idle) {
    BOOL lock_didStartTransitionToNewState = self->_lock_didStartTransitionToNewState;
  }
  int64_t lock_previousBacklightState = self->_lock_previousBacklightState;
  self->_int64_t lock_previousBacklightState = a4;
  self->_BOOL lock_didStartTransitionToNewState = 0;
  id v11 = bls_backlight_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_super v15 = NSStringFromBLSBacklightState();
    BOOL lock_idle = self->_lock_idle;
    BOOL lock_active = self->_lock_active;
    BOOL v18 = self->_lock_didStartTransitionToNewState;
    int v19 = 138413570;
    v20 = v15;
    __int16 v21 = 1024;
    BOOL v22 = lock_previousBacklightState != a4;
    __int16 v23 = 1024;
    BOOL v24 = lock_didStartTransitionToNewState;
    __int16 v25 = 1024;
    BOOL v26 = lock_idle;
    __int16 v27 = 1024;
    BOOL v28 = lock_active;
    __int16 v29 = 1024;
    BOOL v30 = v18;
    _os_log_debug_impl(&dword_21FCFC000, v11, OS_LOG_TYPE_DEBUG, "didCompleteUpdateToState %@; changed=%{BOOL}d; needToResumeIdleTimer=%{BOOL}d, idle=%{BOOL}d, active=%{BOOL}d, did"
      "StartTransitionToNewState=%{BOOL}d",
      (uint8_t *)&v19,
      0x2Au);
  }
  os_unfair_lock_unlock(&self->_lock);
  BOOL v12 = !lock_didStartTransitionToNewState;
  if (lock_previousBacklightState != a4) {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    -[BLSHBacklightIdleProvider updateForBacklightState:]((uint64_t)self, a4);
    if (a4 == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v14 = [v8 firstObject];
      [WeakRetained backlightTurnedOnForEvent:v14];
    }
  }
}

- (void)backlightHost:(id)a3 willTransitionToState:(int64_t)a4 forEvent:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a4 == 2) {
    self->_lock_pendingIdleInactiveRequest = 0;
  }
  if (self->_lock_previousBacklightState != a4) {
    self->_BOOL lock_didStartTransitionToNewState = 1;
  }
  id v8 = bls_backlight_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint8_t v9 = NSStringFromBLSBacklightState();
    BOOL v10 = NSStringFromBLSBacklightState();
    BOOL lock_didStartTransitionToNewState = self->_lock_didStartTransitionToNewState;
    int v12 = 138412802;
    id v13 = v9;
    __int16 v14 = 2112;
    objc_super v15 = v10;
    __int16 v16 = 1024;
    BOOL v17 = lock_didStartTransitionToNewState;
    _os_log_debug_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_DEBUG, "willTransitionToState %@; previousBacklightState %@; didStartTransitionToNewState=%{BOOL}d",
      (uint8_t *)&v12,
      0x1Cu);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)idleProviderDidIdle:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  *(_WORD *)&self->_BOOL lock_idle = 257;
  os_unfair_lock_unlock(p_lock);
  [v5 setShouldNotifyOfUnidle:1];

  BSDispatchMain();
}

void __49__BLSHBacklightIdleProvider_idleProviderDidIdle___block_invoke(uint64_t a1)
{
}

- (void)onMain_handleDidIdle
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "%p backlightIdle is suppressed, will not deactivate backlight (yet)", (uint8_t *)&v2, 0xCu);
}

- (void)idleProviderDidUnidle:(id)a3
{
  p_lock = &self->_lock;
  id v6 = a3;
  os_unfair_lock_lock(p_lock);
  self->_BOOL lock_userActivityOccured = 1;
  *(_WORD *)&self->_BOOL lock_idle = 0;
  double lock_idleTimeout = self->_lock_idleTimeout;
  os_unfair_lock_unlock(p_lock);
  [v6 setShouldNotifyOfUnidle:0];
  [v6 setIdleTimeout:0 shouldReset:lock_idleTimeout];
}

- (BLSHBacklightIdleProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BLSHBacklightIdleProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backlightHost, 0);

  objc_storeStrong((id *)&self->_lock_idleProvider, 0);
}

+ (void)createSharedProviderWithLocalAssertionService:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)sharedProvider
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setSuspended:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7_0(&dword_21FCFC000, v0, v1, "setSuspended started=%{BOOL}u changed=%{BOOL}u");
}

- (void)setSuppressed:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7_0(&dword_21FCFC000, v0, v1, "setSuppressed started=%{BOOL}u changed=%{BOOL}u");
}

- (void)onMain_idleBacklightInactiveWithExplanation:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_21FCFC000, log, OS_LOG_TYPE_DEBUG, "%p will not inactivate (not pending) for explanation:%{public}@", (uint8_t *)&v3, 0x16u);
}

@end