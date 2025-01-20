@interface BLSHXPCBacklightProxyHost
- (BLSHXPCBacklightProxyHost)initWithLocalBacklightProxy:(id)a3 peer:(id)a4;
- (BOOL)deviceSupportsAlwaysOn;
- (BOOL)isAlwaysOnEnabled;
- (BOOL)isTransitioning;
- (BOOL)observesActivation;
- (BOOL)observesDeactivation;
- (BOOL)observesPerformingAllEvents;
- (NSString)description;
- (id)beginObservation;
- (id)getBacklightState;
- (id)getFlipbookState;
- (id)performChangeRequest:(id)a3;
- (os_unfair_lock_s)isValid;
- (void)backlight:(id)a3 activatingWithEvent:(id)a4;
- (void)backlight:(id)a3 deactivatingWithEvent:(id)a4;
- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6;
- (void)backlight:(id)a3 performingEvent:(id)a4;
- (void)beginObservation;
- (void)clientProcessStateUpdate:(uint64_t)a1;
- (void)dealloc;
- (void)endObservation;
- (void)invalidate;
- (void)nowObservingWithMask:(id)a3 completion:(id)a4;
- (void)observePerformingEvent:(uint64_t)a1;
@end

@implementation BLSHXPCBacklightProxyHost

- (BOOL)isAlwaysOnEnabled
{
  return [(BLSBacklightProxy *)self->_localBacklightProxy isAlwaysOnEnabled];
}

- (BLSHXPCBacklightProxyHost)initWithLocalBacklightProxy:(id)a3 peer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLSHXPCBacklightProxyHost;
  v9 = [(BLSHXPCBacklightProxyHost *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_entitlements = 0;
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = [v8 remoteProcess];
    if ([v11 hasEntitlement:@"com.apple.backlight.backlightaccess"]) {
      v10->_entitlements |= 4u;
    }
    if ([v11 hasEntitlement:@"com.apple.backlight.performrequest"]) {
      v10->_entitlements |= 2u;
    }
    if ([v11 hasEntitlement:@"com.apple.backlight.anysource"]) {
      v10->_entitlements |= 1u;
    }
    if ([v11 hasEntitlement:@"com.apple.backlight.allowsActivationObservation"]) {
      v10->_entitlements |= 8u;
    }
    if ([v11 hasEntitlement:@"com.apple.backlight.allowsPerformingEventObservation"])v10->_entitlements |= 0x10u; {
    objc_storeStrong((id *)&v10->_localBacklightProxy, a3);
    }
    v10->_lock_valid = 1;
    v12 = [v8 remoteProcess];
    v10->_clientPid = [v12 pid];
  }
  return v10;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_4_4(&dword_21FCFC000, v0, v1, "%p must invalidate before deallocating service for pid:%d", v2, v3, v4, v5, 0);
}

- (os_unfair_lock_s)isValid
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = a1 + 12;
    os_unfair_lock_lock(a1 + 12);
    uint64_t v1 = (os_unfair_lock_s *)(BYTE2(v1[13]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendInt:self->_clientPid withName:@"clientPID"];
  uint64_t v5 = [v3 build];

  return (NSString *)v5;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_valid = 0;
  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  processMonitor = self->_processMonitor;
  self->_processMonitor = 0;

  lock_observingClient = self->_lock_observingClient;
  self->_lock_observingClient = 0;

  [(BLSBacklightProxy *)self->_localBacklightProxy removeObserver:self];

  os_unfair_lock_unlock(p_lock);
}

- (id)getBacklightState
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [(BLSBacklightProxy *)self->_localBacklightProxy backlightState];

  return (id)[v2 numberWithInteger:v3];
}

- (id)getFlipbookState
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [(BLSBacklightProxy *)self->_localBacklightProxy flipbookState];

  return (id)[v2 numberWithInteger:v3];
}

- (BOOL)isTransitioning
{
  return [(BLSBacklightProxy *)self->_localBacklightProxy isTransitioning];
}

- (BOOL)deviceSupportsAlwaysOn
{
  return [(BLSBacklightProxy *)self->_localBacklightProxy deviceSupportsAlwaysOn];
}

- (id)performChangeRequest:(id)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (-[BLSHXPCBacklightProxyHost isValid]((os_unfair_lock_s *)self))
  {
    unsigned int entitlements = self->_entitlements;
    if ((entitlements & 4) != 0)
    {
      if ((entitlements & 2) != 0)
      {
        if ((entitlements & 1) != 0 || [v4 sourceEvent] == 10)
        {
          id v20 = (id)[(BLSBacklightProxy *)self->_localBacklightProxy performChangeRequest:v4];
          v18 = 0;
          goto LABEL_20;
        }
        v21 = bls_backlight_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[BLSHXPCBacklightProxyHost performChangeRequest:]();
        }

        id v7 = (void *)MEMORY[0x263F087E8];
        uint64_t v8 = *MEMORY[0x263F29920];
        uint64_t v24 = *MEMORY[0x263F08320];
        v9 = [NSString stringWithFormat:@"%@ no entitlement %@", v4, @"com.apple.backlight.anysource"];
        v25 = v9;
        v10 = NSDictionary;
        v11 = &v25;
        v12 = &v24;
      }
      else
      {
        v19 = bls_backlight_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[BLSHXPCBacklightProxyHost performChangeRequest:]();
        }

        id v7 = (void *)MEMORY[0x263F087E8];
        uint64_t v8 = *MEMORY[0x263F29920];
        uint64_t v26 = *MEMORY[0x263F08320];
        v9 = [NSString stringWithFormat:@"%@ no entitlement %@", v4, @"com.apple.backlight.performrequest"];
        v27 = v9;
        v10 = NSDictionary;
        v11 = &v27;
        v12 = &v26;
      }
    }
    else
    {
      v6 = bls_backlight_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[BLSHXPCBacklightProxyHost performChangeRequest:]();
      }

      id v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = *MEMORY[0x263F29920];
      uint64_t v28 = *MEMORY[0x263F08320];
      v9 = [NSString stringWithFormat:@"%@ no entitlement %@", v4, @"com.apple.backlight.backlightaccess"];
      v29 = v9;
      v10 = NSDictionary;
      v11 = &v29;
      v12 = &v28;
    }
    v22 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    v18 = [v7 errorWithDomain:v8 code:21 userInfo:v22];
  }
  else
  {
    v13 = bls_backlight_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BLSHXPCBacklightProxyHost performChangeRequest:].cold.4((uint64_t)self, v13);
    }

    objc_super v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F29920];
    uint64_t v30 = *MEMORY[0x263F08320];
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"proxy is invalid for pid:%d", self->_clientPid);
    v31[0] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v18 = [v14 errorWithDomain:v15 code:4 userInfo:v17];
  }
LABEL_20:

  return v18;
}

- (void)nowObservingWithMask:(id)a3 completion:(id)a4
{
  v42[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ((([v6 isObservingActivatingWithEvent] & 1) != 0
     || [v6 isObservingDeactivatingWithEvent])
    && (self->_entitlements & 8) == 0)
  {
    uint64_t v8 = bls_backlight_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BLSHXPCBacklightProxyHost nowObservingWithMask:completion:]();
    }

    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F29920];
    uint64_t v41 = *MEMORY[0x263F08320];
    v11 = [NSString stringWithFormat:@"Observing activating/deactivating requires entitlement %@", @"com.apple.backlight.allowsActivationObservation"];
    v42[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
    v13 = [v9 errorWithDomain:v10 code:21 userInfo:v12];

    [0 addObject:v13];
    uint64_t v14 = [v6 noActivatingMask];

    id v6 = (id)v14;
  }
  if ([v6 isObservingPerformingEvent] && (self->_entitlements & 0x10) == 0)
  {
    uint64_t v15 = bls_backlight_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[BLSHXPCBacklightProxyHost nowObservingWithMask:completion:]();
    }

    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F29920];
    uint64_t v39 = *MEMORY[0x263F08320];
    v18 = [NSString stringWithFormat:@"Observing performing all events requires entitlement %@", @"com.apple.backlight.allowsPerformingEventObservation"];
    v40 = v18;
    v19 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    id v20 = [v16 errorWithDomain:v17 code:21 userInfo:v19];

    [0 addObject:v20];
    uint64_t v21 = [v6 noPerformingEventMask];

    id v6 = (id)v21;
  }
  v22 = [0 firstObject];
  if ((unint64_t)[0 count] >= 2)
  {
    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F29920];
    v37[0] = *MEMORY[0x263F08320];
    v25 = NSString;
    uint64_t v26 = [v22 localizedFailureReason];
    v27 = v26;
    if (!v26)
    {
      v27 = [v22 localizedDescription];
    }
    uint64_t v28 = [v25 stringWithFormat:@"Missing multiple observation entitlements including '%@'", v27];
    v37[1] = *MEMORY[0x263F083F0];
    v38[0] = v28;
    v38[1] = 0;
    v29 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    uint64_t v30 = [v23 errorWithDomain:v24 code:21 userInfo:v29];

    if (!v26) {
    v22 = (void *)v30;
    }
  }
  os_unfair_lock_lock(&self->_lock);
  v31 = self->_lock_observingMask;
  objc_storeStrong((id *)&self->_lock_observingMask, v6);
  v32 = self->_lock_observingClient;
  os_unfair_lock_unlock(&self->_lock);
  int v33 = [v6 isObserving];
  if (v33 != [(BLSXPCBacklightProxyObserverMask *)v31 isObserving])
  {
    if (v33)
    {
      uint64_t v34 = -[BLSHXPCBacklightProxyHost beginObservation]((uint64_t)self);

      v32 = (BLSXPCBacklightProxyClientInterface *)v34;
    }
    else
    {
      -[BLSHXPCBacklightProxyHost endObservation]((uint64_t)self);
    }
  }
  if (([(BLSBacklightProxy *)self->_localBacklightProxy isTransitioning] & 1) == 0)
  {
    if ([v6 isObservingDidCompleteUpdateToState]
      && ([(BLSXPCBacklightProxyObserverMask *)v31 isObservingDidCompleteUpdateToState] & 1) == 0)
    {
      v35 = objc_msgSend(NSNumber, "numberWithInteger:", -[BLSBacklightProxy backlightState](self->_localBacklightProxy, "backlightState"));
      [(BLSXPCBacklightProxyClientInterface *)v32 didCompleteUpdateToState:v35 forEvents:0 abortedEvents:0];
    }
    if ([v6 isObservingDidChangeAlwaysOnEnabled]
      && ([(BLSXPCBacklightProxyObserverMask *)v31 isObservingDidChangeAlwaysOnEnabled] & 1) == 0)
    {
      v36 = objc_msgSend(NSNumber, "numberWithBool:", -[BLSBacklightProxy isAlwaysOnEnabled](self->_localBacklightProxy, "isAlwaysOnEnabled"));
      [(BLSXPCBacklightProxyClientInterface *)v32 didChangeAlwaysOnEnabled:v36];
    }
  }
  v7[2](v7, v22);
}

- (id)beginObservation
{
  if (a1
    && (uint64_t v2 = (os_unfair_lock_s *)(a1 + 48),
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48)),
        int v3 = *(unsigned __int8 *)(a1 + 54),
        os_unfair_lock_unlock(v2),
        v3))
  {
    os_unfair_lock_lock(v2);
    uint64_t v4 = *(void *)(a1 + 16);
    uint64_t v5 = [MEMORY[0x263F2B9B8] currentContext];
    id v6 = [v5 remoteTarget];
    if (v4)
    {
      os_unfair_lock_unlock(v2);
      id v7 = bls_backlight_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BLSHXPCBacklightProxyHost beginObservation]();
      }
    }
    else
    {
      objc_storeStrong((id *)(a1 + 16), v6);
      if (!*(void *)(a1 + 24))
      {
        objc_initWeak(&location, (id)a1);
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __45__BLSHXPCBacklightProxyHost_beginObservation__block_invoke;
        v22[3] = &unk_264533D90;
        objc_copyWeak(&v23, &location);
        uint64_t v8 = (void *)MEMORY[0x223C5E2B0](v22);
        v9 = (void *)MEMORY[0x263F64630];
        uint64_t v10 = [v5 remoteProcess];
        v11 = objc_msgSend(v9, "targetWithPid:", objc_msgSend(v10, "pid"));

        *(unsigned char *)(a1 + 52) = 1;
        v12 = (void *)MEMORY[0x263F645C0];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __45__BLSHXPCBacklightProxyHost_beginObservation__block_invoke_2;
        v18[3] = &unk_264533DB8;
        objc_copyWeak(&v21, &location);
        id v13 = v11;
        id v19 = v13;
        id v14 = v8;
        id v20 = v14;
        uint64_t v15 = [v12 monitorWithConfiguration:v18];
        v16 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v15;

        objc_destroyWeak(&v21);
        objc_destroyWeak(&v23);

        objc_destroyWeak(&location);
      }
      os_unfair_lock_unlock(v2);
      [*(id *)(a1 + 8) addObserver:a1];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)endObservation
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_4_4(&dword_21FCFC000, v0, v1, "%p was not observing from pid:%d", v2, v3, v4, v5, 0);
}

void __45__BLSHXPCBacklightProxyHost_beginObservation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = [v5 state];

  int v7 = [v6 taskState];
  BOOL v9 = v7 == 4 || v7 == 2;
  -[BLSHXPCBacklightProxyHost clientProcessStateUpdate:]((uint64_t)WeakRetained, v9);
}

- (void)clientProcessStateUpdate:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    int v5 = *(unsigned __int8 *)(a1 + 52);
    if (v5 != a2) {
      *(unsigned char *)(a1 + 52) = a2;
    }
    id v6 = *(id *)(a1 + 16);
    int v7 = *(unsigned __int8 *)(a1 + 53);
    if (a2) {
      *(unsigned char *)(a1 + 53) = 0;
    }
    os_unfair_lock_unlock(v4);
    if (v5 != a2 && v7 && a2)
    {
      uint64_t v8 = [*(id *)(a1 + 8) backlightState];
      BOOL v9 = bls_backlight_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        [(BLSHXPCBacklightProxyHost *)a1 clientProcessStateUpdate:v9];
      }

      uint64_t v10 = [NSNumber numberWithInteger:v8];
      [v6 didCompleteUpdateToState:v10 forEvents:0 abortedEvents:0];
    }
  }
}

void __45__BLSHXPCBacklightProxyHost_beginObservation__block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v5 = [MEMORY[0x263F645E8] descriptor];
    [v5 setValues:1];
    [v3 setStateDescriptor:v5];
    id v6 = [MEMORY[0x263F645D8] predicateMatchingTarget:*(void *)(a1 + 32)];
    v8[0] = v6;
    int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    [v3 setPredicates:v7];

    [v3 setUpdateHandler:*(void *)(a1 + 40)];
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  v28[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  if (-[BLSHXPCBacklightProxyHost isValid]((os_unfair_lock_s *)self))
  {
    os_unfair_lock_lock(&self->_lock);
    char v11 = [(BLSXPCBacklightProxyObserverMask *)self->_lock_observingMask isObservingEventsArray];
    BOOL lock_clientIsTaskScheduled = self->_lock_clientIsTaskScheduled;
    id v13 = self->_lock_observingClient;
    if (lock_clientIsTaskScheduled)
    {
      os_unfair_lock_unlock(&self->_lock);
      if ((v11 & 1) == 0)
      {
        if (v9)
        {
          id v14 = [v9 firstObject];
          v28[0] = v14;
          uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];

          id v9 = (id)v15;
        }

        id v10 = 0;
      }
      v16 = [NSNumber numberWithInteger:a4];
      [(BLSXPCBacklightProxyClientInterface *)v13 didCompleteUpdateToState:v16 forEvents:v9 abortedEvents:v10];
    }
    else
    {
      self->_lock_stateIsStale = 1;
      os_unfair_lock_unlock(&self->_lock);
      v16 = bls_backlight_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int clientPid = self->_clientPid;
        v18 = NSStringFromBLSBacklightState();
        id v19 = NSStringFromBLSBacklightChangeEvents();
        int v20 = 134218754;
        id v21 = self;
        __int16 v22 = 1024;
        int v23 = clientPid;
        __int16 v24 = 2114;
        v25 = v18;
        __int16 v26 = 2114;
        v27 = v19;
        _os_log_debug_impl(&dword_21FCFC000, v16, OS_LOG_TYPE_DEBUG, "%p client not running pid:%d will not notify backlight update to state:%{public}@ events:%{public}@", (uint8_t *)&v20, 0x26u);
      }
    }
  }
}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[BLSHXPCBacklightProxyHost isValid]((os_unfair_lock_s *)self))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    int v7 = self->_lock_observingClient;
    os_unfair_lock_unlock(p_lock);
    id v8 = [NSNumber numberWithBool:v4];
    [(BLSXPCBacklightProxyClientInterface *)v7 didChangeAlwaysOnEnabled:v8];
  }
}

- (BOOL)observesActivation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_valid) {
    char v4 = [(BLSXPCBacklightProxyObserverMask *)self->_lock_observingMask isObservingActivatingWithEvent];
  }
  else {
    char v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)backlight:(id)a3 activatingWithEvent:(id)a4
{
}

- (void)observePerformingEvent:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    id v3 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    int v4 = *(unsigned __int8 *)(a1 + 54);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
      id v5 = *(id *)(a1 + 16);
      os_unfair_lock_unlock(v3);
      [v5 performingEvent:v6];
    }
  }
}

- (BOOL)observesDeactivation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_valid) {
    char v4 = [(BLSXPCBacklightProxyObserverMask *)self->_lock_observingMask isObservingDeactivatingWithEvent];
  }
  else {
    char v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)backlight:(id)a3 deactivatingWithEvent:(id)a4
{
}

- (BOOL)observesPerformingAllEvents
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_valid) {
    char v4 = [(BLSXPCBacklightProxyObserverMask *)self->_lock_observingMask isObservingPerformingEvent];
  }
  else {
    char v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)backlight:(id)a3 performingEvent:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observingMask, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_lock_observingClient, 0);

  objc_storeStrong((id *)&self->_localBacklightProxy, 0);
}

- (void)performChangeRequest:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_6(&dword_21FCFC000, v0, v1, "%{public}@: no entitlement %@ pid:%d");
}

- (void)performChangeRequest:.cold.2()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_6(&dword_21FCFC000, v0, v1, "%{public}@: no entitlement %@ pid:%d");
}

- (void)performChangeRequest:.cold.3()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_6(&dword_21FCFC000, v0, v1, "%{public}@: no entitlement %@ pid:%d");
}

- (void)performChangeRequest:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 40);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "proxy is invalid for pid:%d", (uint8_t *)v3, 8u);
}

- (void)nowObservingWithMask:completion:.cold.1()
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  int v1 = 138412546;
  int v2 = @"com.apple.backlight.allowsPerformingEventObservation";
  OUTLINED_FUNCTION_0_6();
  _os_log_error_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_ERROR, "Observing performing all events requires entitlement %@ pid:%d", (uint8_t *)&v1, 0x12u);
}

- (void)nowObservingWithMask:completion:.cold.2()
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  int v1 = 138412546;
  int v2 = @"com.apple.backlight.allowsActivationObservation";
  OUTLINED_FUNCTION_0_6();
  _os_log_error_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_ERROR, "Observing activating/deactivating requires entitlement %@ pid:%d", (uint8_t *)&v1, 0x12u);
}

- (void)beginObservation
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_4_4(&dword_21FCFC000, v0, v1, "%p already observing from pid:%d", v2, v3, v4, v5, 0);
}

- (void)clientProcessStateUpdate:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = *(_DWORD *)(a1 + 40);
  id v6 = NSStringFromBLSBacklightState();
  int v7 = 134218498;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v5;
  __int16 v11 = 2114;
  v12 = v6;
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "%p client now running pid:%d update to backlight state:%{public}@", (uint8_t *)&v7, 0x1Cu);
}

@end