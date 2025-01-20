@interface BLSXPCBacklightProxy
+ (id)defaultEndpoint;
- (BLSXPCBacklightProxy)init;
- (BOOL)deviceSupportsAlwaysOn;
- (BOOL)isAlwaysOnEnabled;
- (BOOL)isTransitioning;
- (id)initWithEndpoint:(void *)a1;
- (id)lock_allDidChangeAlwaysOnEnabledObservers;
- (id)lock_allDidCompleteUpdateToStateObservers;
- (id)lock_allObserversPassingTest:(id *)a1;
- (id)performChangeRequest:(id)a3;
- (int64_t)backlightState;
- (int64_t)flipbookState;
- (void)_reactivate;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)didChangeAlwaysOnEnabled:(id)a3;
- (void)didCompleteUpdateToState:(id)a3 forEvents:(id)a4 abortedEvents:(id)a5;
- (void)invalidate;
- (void)lock_enumerateObserversWithBlock:(uint64_t)a1;
- (void)lock_updateHostObservationMask:(uint64_t)a1;
- (void)performingEvent:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation BLSXPCBacklightProxy

- (BOOL)isAlwaysOnEnabled
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_isAlwaysOnEnabledCached)
  {
    char lock_isAlwaysOnEnabled = self->_lock_isAlwaysOnEnabled;
  }
  else
  {
    v5 = [(BSServiceConnection *)self->_connection remoteTarget];
    char lock_isAlwaysOnEnabled = [v5 isAlwaysOnEnabled];
  }
  os_unfair_lock_unlock(p_lock);
  return lock_isAlwaysOnEnabled;
}

+ (id)defaultEndpoint
{
  self;
  v0 = (void *)MEMORY[0x1E4F50BB8];
  v1 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  v2 = +[BLSXPCBacklightProxySpecification identifier];
  v3 = [v0 endpointForMachName:v1 service:v2 instance:0];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F50BB8];
    v7 = +[BLSXPCBacklightProxySpecification identifier];
    id v5 = [v6 nullEndpointForService:v7 instance:0];
  }

  return v5;
}

- (BLSXPCBacklightProxy)init
{
  v3 = +[BLSXPCBacklightProxy defaultEndpoint]();
  v4 = (BLSXPCBacklightProxy *)-[BLSXPCBacklightProxy initWithEndpoint:](self, v3);

  return v4;
}

- (id)initWithEndpoint:(void *)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    NSClassFromString(&cfstr_Bsserviceconne.isa);
    if (!v5)
    {
      v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[BLSXPCBacklightProxy initWithEndpoint:](sel_initWithEndpoint_);
      }
      [v23 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1B55F8F00);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[BLSXPCBacklightProxy initWithEndpoint:](sel_initWithEndpoint_);
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1B55F8F64);
    }

    v30.receiver = a1;
    v30.super_class = (Class)BLSXPCBacklightProxy;
    v6 = objc_msgSendSuper2(&v30, sel_init);
    id v7 = v6;
    if (v6)
    {
      v6[8] = 0;
      uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      v9 = (void *)*((void *)v7 + 1);
      *((void *)v7 + 1) = v8;

      uint64_t v10 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v5];
      v11 = (void *)*((void *)v7 + 3);
      *((void *)v7 + 3) = v10;

      v12 = +[BLSXPCBacklightProxySpecification serviceQuality];
      v13 = [MEMORY[0x1E4F4F730] serial];
      v14 = objc_msgSend(v13, "serviceClass:relativePriority:", objc_msgSend(v12, "serviceClass"), objc_msgSend(v12, "relativePriority"));
      uint64_t v15 = BSDispatchQueueCreate();
      v16 = (void *)*((void *)v7 + 2);
      *((void *)v7 + 2) = v15;

      objc_initWeak(&location, v7);
      v17 = (void *)*((void *)v7 + 3);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __41__BLSXPCBacklightProxy_initWithEndpoint___block_invoke;
      v25[3] = &unk_1E61077C0;
      id v18 = v12;
      id v26 = v18;
      id v19 = v7;
      id v27 = v19;
      objc_copyWeak(&v28, &location);
      [v17 configureConnection:v25];
      [*((id *)v7 + 3) activate];
      v20 = bls_backlight_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = *((void *)v7 + 3);
        *(_DWORD *)buf = 134218498;
        id v32 = v19;
        __int16 v33 = 2114;
        uint64_t v34 = v22;
        __int16 v35 = 2114;
        id v36 = v5;
        _os_log_debug_impl(&dword_1B55DE000, v20, OS_LOG_TYPE_DEBUG, "%p did activate connection:%{public}@ for endpoint:%{public}@", buf, 0x20u);
      }

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void __41__BLSXPCBacklightProxy_initWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setServiceQuality:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 16)];
  v4 = +[BLSXPCBacklightProxySpecification interface];
  [v3 setInterface:v4];

  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__BLSXPCBacklightProxy_initWithEndpoint___block_invoke_2;
  v5[3] = &unk_1E61071E0;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  [v3 setInterruptionHandler:v5];
  [v3 setInvalidationHandler:&__block_literal_global_10];
  objc_destroyWeak(&v6);
}

void __41__BLSXPCBacklightProxy_initWithEndpoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[BLSXPCBacklightProxy _reactivate]((uint64_t)WeakRetained);
}

- (void)_reactivate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = _os_activity_create(&dword_1B55DE000, "BLSXPCBacklightProxy Reconnect", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    os_activity_scope_enter(v2, &v5);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    [*(id *)(a1 + 24) activate];
    *(unsigned char *)(a1 + 72) = 0;
    *(unsigned char *)(a1 + 74) = 0;
    if ([*(id *)(a1 + 8) count])
    {
      id v3 = bls_backlight_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v7 = a1;
        _os_log_impl(&dword_1B55DE000, v3, OS_LOG_TYPE_DEFAULT, "%p backlight proxy has observers - reconnect and begin observation.", buf, 0xCu);
      }

      -[BLSXPCBacklightProxy lock_updateHostObservationMask:](a1, 1);
    }
    else
    {
      v4 = bls_backlight_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v7 = a1;
        _os_log_impl(&dword_1B55DE000, v4, OS_LOG_TYPE_DEFAULT, "%p Reset BLSXPCBacklightProxy for reconnect because there are no observers.", buf, 0xCu);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    os_activity_scope_leave(&v5);
  }
}

- (void)invalidate
{
  [(BSServiceConnection *)self->_connection invalidate];
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)dealloc
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3(&dword_1B55DE000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (int64_t)backlightState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_isBacklightStateCached)
  {
    uint64_t lock_backlightState = self->_lock_backlightState;
  }
  else
  {
    uint64_t v5 = [(BSServiceConnection *)self->_connection remoteTarget];
    uint64_t v6 = [v5 getBacklightState];
    uint64_t lock_backlightState = [v6 integerValue];
  }
  os_unfair_lock_unlock(p_lock);
  return lock_backlightState;
}

- (int64_t)flipbookState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  uint64_t v5 = [v4 getFlipbookState];
  int64_t v6 = [v5 integerValue];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)isTransitioning
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(BSServiceConnection *)self->_connection remoteTarget];
  char v5 = [v4 isTransitioning];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)deviceSupportsAlwaysOn
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_deviceSupportsAlwaysOnCached)
  {
    char lock_deviceSupportsAlwaysOn = self->_lock_deviceSupportsAlwaysOn;
  }
  else
  {
    char v5 = [(BSServiceConnection *)self->_connection remoteTarget];
    char lock_deviceSupportsAlwaysOn = [v5 deviceSupportsAlwaysOn];

    if (!self->_lock_deviceSupportsAlwaysOnCached)
    {
      self->_char lock_deviceSupportsAlwaysOn = lock_deviceSupportsAlwaysOn;
      self->_lock_deviceSupportsAlwaysOnCached = 1;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return lock_deviceSupportsAlwaysOn;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = +[BLSXPCBacklightProxyObserverMask maskForObserver:v4];
  os_unfair_lock_lock(&self->_lock);
  [(NSMapTable *)self->_lock_observers setObject:v5 forKey:v4];

  -[BLSXPCBacklightProxy lock_updateHostObservationMask:]((uint64_t)self, 0);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)lock_updateHostObservationMask:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, *(NSMapTable **)(a1 + 8));
    value = 0;
    key = 0;
    if (NSNextMapEnumeratorPair(&enumerator, &key, &value))
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      do
      {
        if (key)
        {
          uint64_t v10 = value;
          uint64_t v4 = v4 + [value isObservingDidCompleteUpdateToState];
          uint64_t v5 = v5 + [v10 isObservingEventsArray];
          uint64_t v6 = v6 + [v10 isObservingDidChangeAlwaysOnEnabled];
          uint64_t v7 = v7 + [v10 isObservingActivatingWithEvent];
          uint64_t v9 = v9 + [v10 isObservingDeactivatingWithEvent];
          uint64_t v8 = v8 + [v10 isObservingPerformingEvent];
        }
      }
      while (NSNextMapEnumeratorPair(&enumerator, &key, &value));
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v8 = 0;
      uint64_t v7 = 0;
      uint64_t v6 = 0;
      uint64_t v5 = 0;
      uint64_t v4 = 0;
    }
    NSEndMapTableEnumeration(&enumerator);
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__BLSXPCBacklightProxy_lock_updateHostObservationMask___block_invoke;
    v17[3] = &unk_1E61077E8;
    v17[4] = &v18;
    v11 = (void (**)(void, void, void))MEMORY[0x1BA99C630](v17);
    v11[2](v11, a1 + 36, v4);
    v11[2](v11, a1 + 40, v5);
    v11[2](v11, a1 + 44, v6);
    v11[2](v11, a1 + 48, v7);
    v11[2](v11, a1 + 52, v9);
    v11[2](v11, a1 + 56, v8);
    if ((int)v4 <= 0 && (int)v5 <= 0) {
      *(unsigned char *)(a1 + 72) = 0;
    }
    if ((int)v6 <= 0) {
      *(unsigned char *)(a1 + 74) = 0;
    }
    if (*((unsigned char *)v19 + 24) || a2)
    {
      v12 = [*(id *)(a1 + 24) remoteTarget];
      v13 = +[BLSXPCBacklightProxyObserverMask maskForObservingDidCompleteUpdateToState:(int)v4 > 0 observingEventsArray:(int)v5 > 0 didChangeAlwaysOnEnabled:(int)v6 > 0 activatingWithEvent:(int)v7 > 0 deactivatingWithEvent:(int)v9 > 0 performingEvent:(int)v8 > 0];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __55__BLSXPCBacklightProxy_lock_updateHostObservationMask___block_invoke_2;
      v15[3] = &unk_1E61075C0;
      id v14 = v13;
      id v16 = v14;
      [v12 nowObservingWithMask:v14 completion:v15];
    }
    _Block_object_dispose(&v18, 8);
  }
}

uint64_t __55__BLSXPCBacklightProxy_lock_updateHostObservationMask___block_invoke(uint64_t result, int *a2, int a3)
{
  int v3 = *a2;
  *a2 = a3;
  if ((a3 == 0) == (v3 != 0)) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void __55__BLSXPCBacklightProxy_lock_updateHostObservationMask___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = bls_assertions_log();
    uint64_t v5 = [v3 domain];
    if ([v5 isEqual:@"com.apple.BacklightServices"]) {
      os_log_type_t v6 = OS_LOG_TYPE_FAULT;
    }
    else {
      os_log_type_t v6 = OS_LOG_TYPE_ERROR;
    }

    if (os_log_type_enabled(v4, v6))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = objc_msgSend(v3, "bls_loggingString");
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1B55DE000, v4, v6, "failed to observe with mask %{public}@ error:%{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMapTable *)self->_lock_observers removeObjectForKey:v5];

  -[BLSXPCBacklightProxy lock_updateHostObservationMask:]((uint64_t)self, 0);

  os_unfair_lock_unlock(p_lock);
}

- (id)performChangeRequest:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(BSServiceConnection *)connection remoteTarget];
  os_log_type_t v6 = [v5 performChangeRequest:v4];

  return v6;
}

- (void)didCompleteUpdateToState:(id)a3 forEvents:(id)a4 abortedEvents:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v21 = a5;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isBacklightStateCached = 1;
  id v19 = v8;
  int64_t v10 = [v8 integerValue];
  self->_uint64_t lock_backlightState = v10;
  __int16 v11 = -[BLSXPCBacklightProxy lock_allDidCompleteUpdateToStateObservers]((id *)&self->super.isa);
  os_unfair_lock_unlock(&self->_lock);
  v12 = v9;
  uint64_t v20 = [v9 firstObject];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v22 + 1) + 8 * v17);
        if (objc_opt_respondsToSelector())
        {
          [v18 backlight:self didCompleteUpdateToState:v10 forEvents:v12 abortedEvents:v21];
        }
        else if (objc_opt_respondsToSelector())
        {
          [v18 backlight:self didCompleteUpdateToState:v10 forEvent:v20];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }
}

- (id)lock_allDidCompleteUpdateToStateObservers
{
  if (a1)
  {
    -[BLSXPCBacklightProxy lock_allObserversPassingTest:](a1, &__block_literal_global_39);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)didChangeAlwaysOnEnabled:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isAlwaysOnEnabledCached = 1;
  uint64_t v5 = [v4 BOOLValue];
  self->_char lock_isAlwaysOnEnabled = v5;
  os_log_type_t v6 = -[BLSXPCBacklightProxy lock_allDidChangeAlwaysOnEnabledObservers]((id *)&self->super.isa);
  os_unfair_lock_unlock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "backlight:didChangeAlwaysOnEnabled:", self, v5, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)lock_allDidChangeAlwaysOnEnabledObservers
{
  if (a1)
  {
    -[BLSXPCBacklightProxy lock_allObserversPassingTest:](a1, &__block_literal_global_41);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)performingEvent:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char IsActive = BLSBacklightStateIsActive([v4 previousState]);
  BOOL v6 = BLSBacklightStateIsActive([v4 state]);
  char v7 = v6 & ~IsActive;
  char v8 = IsActive & !v6;
  os_unfair_lock_lock(&self->_lock);
  NSUInteger v9 = [(NSMapTable *)self->_lock_observers count];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  long long v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __40__BLSXPCBacklightProxy_performingEvent___block_invoke;
  v43[3] = &unk_1E6107810;
  id v13 = v12;
  id v44 = v13;
  char v47 = v7;
  id v14 = v10;
  id v45 = v14;
  char v48 = v8;
  id v15 = v11;
  id v46 = v15;
  -[BLSXPCBacklightProxy lock_enumerateObserversWithBlock:]((uint64_t)self, v43);
  os_unfair_lock_unlock(&self->_lock);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * v20++) backlight:self activatingWithEvent:v4];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v18);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = v15;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * v25++) backlight:self deactivatingWithEvent:v4];
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v50 count:16];
    }
    while (v23);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = v13;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v30++), "backlight:performingEvent:", self, v4, (void)v31);
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v49 count:16];
    }
    while (v28);
  }
}

void __40__BLSXPCBacklightProxy_performingEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v5 isObservingPerformingEvent])
  {
    BOOL v6 = (id *)(a1 + 32);
LABEL_9:
    [*v6 addObject:v7];
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 56) && [v5 isObservingActivatingWithEvent])
  {
    BOOL v6 = (id *)(a1 + 40);
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 57) && [v5 isObservingDeactivatingWithEvent])
  {
    BOOL v6 = (id *)(a1 + 48);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)lock_enumerateObserversWithBlock:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, *(NSMapTable **)(a1 + 8));
    value = 0;
    key = 0;
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
    {
      if (key) {
        v3[2](v3, key, value);
      }
    }
    NSEndMapTableEnumeration(&enumerator);
  }
}

uint64_t __65__BLSXPCBacklightProxy_lock_allDidCompleteUpdateToStateObservers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isObservingDidCompleteUpdateToState];
}

- (id)lock_allObserversPassingTest:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[1], "count"));
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    NSUInteger v9 = __53__BLSXPCBacklightProxy_lock_allObserversPassingTest___block_invoke;
    uint64_t v10 = &unk_1E6107858;
    id v11 = v4;
    id v12 = v3;
    id v5 = v4;
    -[BLSXPCBacklightProxy lock_enumerateObserversWithBlock:]((uint64_t)a1, &v7);
    a1 = (id *)objc_msgSend(v5, "copy", v7, v8, v9, v10);
  }

  return a1;
}

uint64_t __65__BLSXPCBacklightProxy_lock_allDidChangeAlwaysOnEnabledObservers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isObservingDidChangeAlwaysOnEnabled];
}

void __53__BLSXPCBacklightProxy_lock_allObserversPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_lock_observers, 0);
}

- (void)initWithEndpoint:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1B55DE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithEndpoint:(const char *)a1 .cold.2(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1B55DE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end