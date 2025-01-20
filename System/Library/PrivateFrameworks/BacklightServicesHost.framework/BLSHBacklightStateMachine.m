@interface BLSHBacklightStateMachine
- (BLSBacklightChangeEvent)activeTransitionEvent;
- (BLSHBacklightHostTelemetryDelegate)telemetryDelegate;
- (BLSHBacklightStateMachine)initWithPlatformProvider:(id)a3 eventPerformer:(id)a4 osInterfaceProvider:(id)a5;
- (BLSHBacklightStateMachineEventPerforming)eventPerformer;
- (BOOL)deviceSupportsAlwaysOn;
- (BOOL)isAlwaysOnDisabledByAssertion;
- (BOOL)isAlwaysOnEnabled;
- (BOOL)isTransitioning;
- (NSString)backlightStateDescription;
- (id)performChangeRequest:(id)a3;
- (int64_t)backlightDisplayMode;
- (int64_t)backlightState;
- (int64_t)flipbookState;
- (os_unfair_lock_s)activeOnAPAwakeAssertionIsActive;
- (os_unfair_lock_s)enableAlwaysOnAfterInitialization;
- (uint64_t)onMain_notifyInitialStateForObserver:(uint64_t)a1;
- (uint64_t)withLock_desiredBacklightStateForRequestedActivityState:(uint64_t)result;
- (unint64_t)backlightStateChangeTimestamp;
- (void)addObserver:(id)a3;
- (void)backlight:(id)a3 didCompleteUpdateToFlipbookState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6;
- (void)backlight:(id)a3 didUpdateToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 activeEvents:(id)a6 abortedEvents:(id)a7;
- (void)backlight:(id)a3 didUpdateVisualContentsToBeginTransitionToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6;
- (void)backlight:(id)a3 willUpdateToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 forEvents:(id)a6 abortedEvents:(id)a7;
- (void)dealloc;
- (void)endSuppressionServiceWithExplanation:(void *)a3 logBlock:;
- (void)notifyObserversWithBlock:(uint64_t)a1;
- (void)onMain_handleSuppressionEvent:(uint64_t)a1;
- (void)onMain_performChangeRequest:(uint64_t)a1;
- (void)onMain_updateAlwaysOnConfiguration;
- (void)performUnexpectedSleepRequest:(id)a3;
- (void)platformProvider:(id)a3 didChangeAlwaysOnSetting:(BOOL)a4;
- (void)platformProviderDidDetectSignificantUserInteraction:(id)a3;
- (void)registerHandlersForService:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAlwaysOnDisabledByAssertion:(BOOL)a3;
- (void)setTelemetryDelegate:(id)a3;
- (void)startSuppressionServiceWithLogBlock:(uint64_t)a1;
- (void)systemSleepAction:(id)a3 performWithCompletion:(id)a4;
- (void)systemSleepAction:(id)a3 systemWillWakeForReason:(id)a4;
- (void)updateSuppressionServiceForActivityState:(unsigned char *)a1;
@end

@implementation BLSHBacklightStateMachine

- (int64_t)backlightState
{
  return [(BLSHBacklightStateMachineEventPerforming *)self->_eventPerformer backlightState];
}

- (BOOL)isAlwaysOnEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnEnabledResolved;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BLSHBacklightStateMachine)initWithPlatformProvider:(id)a3 eventPerformer:(id)a4 osInterfaceProvider:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)BLSHBacklightStateMachine;
  v11 = [(BLSHBacklightStateMachine *)&v36 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v11->_osInterfaceProvider, a5);
  v12->_lock._os_unfair_lock_opaque = 0;
  v12->_lock_nextEventID = 1;
  uint64_t v13 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:2];
  lock_observers = v12->_lock_observers;
  v12->_lock_observers = (NSHashTable *)v13;

  if (objc_opt_respondsToSelector())
  {
    int v15 = [v8 suppressionSupported];
    v12->_suppressionSupported = v15;
    if (!v15)
    {
LABEL_6:
      if (os_variant_has_internal_diagnostics())
      {
        v16 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
        v12->_suppressionSupported = [v16 BOOLForKey:@"SuppressionServiceEnabled"];
      }
    }
  }
  else if (!v12->_suppressionSupported)
  {
    goto LABEL_6;
  }
  [v9 backlightState];
  if (BLSBacklightStateIsActive())
  {
    uint64_t v17 = objc_msgSend(v10, "mach_continuous_time");
    uint64_t v18 = [(BLSHOSInterfaceProviding *)v12->_osInterfaceProvider createSystemActivityAssertionWithIdentifier:@"BacklightServices.backlightActiveOn.startup" configurator:&__block_literal_global_10];
    lock_activeOnAPAwakeAssertion = v12->_lock_activeOnAPAwakeAssertion;
    v12->_lock_activeOnAPAwakeAssertion = (BLSHSystemActivityAsserting *)v18;

    v20 = v12->_lock_activeOnAPAwakeAssertion;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __89__BLSHBacklightStateMachine_initWithPlatformProvider_eventPerformer_osInterfaceProvider___block_invoke_2;
    v32[3] = &unk_2645333C0;
    id v33 = v10;
    v34 = v12;
    uint64_t v35 = v17;
    [(BLSHSystemActivityAsserting *)v20 acquireWithTimeout:v32 handler:0.0];
  }
  v12->_deviceSupportsAlwaysOn = [v10 deviceSupportsAlwaysOn];
  objc_storeStrong((id *)&v12->_eventPerformer, a4);
  v12->_lock_activityState = BLSBacklightActivityStateForBLSBacklightState();
  [v9 setPerformerDelegate:v12];
  if (objc_opt_respondsToSelector()) {
    char v21 = [v8 isAlwaysOnEnabled];
  }
  else {
    char v21 = 0;
  }
  v12->_BOOL lock_alwaysOnEnabledByPlatform = v21;
  v12->_lock_alwaysOnEnabledResolved = 0;
  [v8 addObserver:v12];
  uint64_t v22 = +[BLSHOnSystemSleepAction actionWithIdentifier:@"BacklightStateMachine-Action" delegate:v12 osInterfaceProvider:v10];
  sleepAction = v12->_sleepAction;
  v12->_sleepAction = (BLSHOnSystemSleepAction *)v22;

  [(BLSHOnSystemSleepAction *)v12->_sleepAction install];
  v24 = bls_backlight_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    BOOL lock_alwaysOnEnabledByPlatform = v12->_lock_alwaysOnEnabledByPlatform;
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = lock_alwaysOnEnabledByPlatform;
    _os_log_impl(&dword_21FCFC000, v24, OS_LOG_TYPE_INFO, "BSM:%p startup alwaysOnEnabledByPlatform:%{BOOL}u", buf, 0x12u);
  }

  -[BLSHBacklightStateMachine updateSuppressionServiceForActivityState:](v12, v12->_lock_activityState);
  objc_initWeak(&location, v12);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v38 = __Block_byref_object_copy__5;
  v39 = __Block_byref_object_dispose__5;
  id v40 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __89__BLSHBacklightStateMachine_initWithPlatformProvider_eventPerformer_osInterfaceProvider___block_invoke_57;
  v29[3] = &unk_2645333E8;
  objc_copyWeak(&v30, &location);
  v29[4] = buf;
  uint64_t v26 = [v10 scheduledTimerWithIdentifier:@"backlightAssertionInitialization" interval:v29 leewayInterval:5.0 handler:1.0];
  v27 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v26;

  objc_destroyWeak(&v30);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
LABEL_16:

  return v12;
}

uint64_t __89__BLSHBacklightStateMachine_initWithPlatformProvider_eventPerformer_osInterfaceProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAcquireWaitsToAbortSleepRequested:1];
}

void __89__BLSHBacklightStateMachine_initWithPlatformProvider_eventPerformer_osInterfaceProvider___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "mach_continuous_time");
  if (a2)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v10 + 88));
      *(void *)(v10 + 48) = v9;
      os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 88));
    }
    v11 = bls_backlight_log();
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
    v11 = bls_backlight_log();
  }
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    BSTimeDifferenceFromMachTimeToMachTime();
    int v15 = 134218754;
    uint64_t v16 = v13;
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2048;
    uint64_t v20 = v14;
    __int16 v21 = 2114;
    id v22 = v7;
    _os_log_impl(&dword_21FCFC000, v11, v12, "BSM:%p startup activeOn system activity assertion callback details:%{public}@ elapsed:%.4lfs error:%{public}@", (uint8_t *)&v15, 0x2Au);
  }
}

- (void)updateSuppressionServiceForActivityState:(unsigned char *)a1
{
  if (a1 && a1[117])
  {
    [a1 isAlwaysOnEnabled];
    uint64_t v4 = BLSBacklightStateForBacklightActivityStateAlwaysOnAvailable();
    if (v4)
    {
      if (v4 == 1)
      {
        v6[0] = MEMORY[0x263EF8330];
        v6[1] = 3221225472;
        v6[2] = __70__BLSHBacklightStateMachine_updateSuppressionServiceForActivityState___block_invoke;
        v6[3] = &unk_264533500;
        v6[4] = a1;
        v6[5] = a2;
        v6[6] = 1;
        -[BLSHBacklightStateMachine startSuppressionServiceWithLogBlock:]((uint64_t)a1, v6);
      }
    }
    else
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __70__BLSHBacklightStateMachine_updateSuppressionServiceForActivityState___block_invoke_111;
      v5[3] = &unk_264533500;
      v5[4] = a1;
      v5[5] = a2;
      v5[6] = 0;
      -[BLSHBacklightStateMachine endSuppressionServiceWithExplanation:logBlock:]((uint64_t)a1, @"disabledAlwaysOn", v5);
    }
  }
}

void __89__BLSHBacklightStateMachine_initWithPlatformProvider_eventPerformer_osInterfaceProvider___block_invoke_57(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  -[BLSHBacklightStateMachine enableAlwaysOnAfterInitialization](WeakRetained);

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (os_unfair_lock_s)enableAlwaysOnAfterInitialization
{
  if (result)
  {
    v1 = result;
    v2 = result + 22;
    os_unfair_lock_lock(result + 22);
    HIBYTE(v1[28]._os_unfair_lock_opaque) = 1;
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)BSDispatchMain();
  }
  return result;
}

- (void)dealloc
{
  [(BLSHBacklightStateMachineEventPerforming *)self->_eventPerformer removeObserver:self];
  [(BLSHSystemActivityAsserting *)self->_lock_activeOnAPAwakeAssertion invalidate];
  [(BLSHSystemActivityAsserting *)self->_lock_performEventAPAwakeAssertion invalidate];
  [(BSTimerScheduleQuerying *)self->_lock_activeOnAPAwakeTimeoutTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BLSHBacklightStateMachine;
  [(BLSHBacklightStateMachine *)&v3 dealloc];
}

void __62__BLSHBacklightStateMachine_enableAlwaysOnAfterInitialization__block_invoke(uint64_t a1)
{
}

- (void)onMain_updateAlwaysOnConfiguration
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  v2 = (os_unfair_lock_s *)(a1 + 88);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  int v3 = *(unsigned char *)(a1 + 118) && *(unsigned char *)(a1 + 113) && !*(unsigned char *)(a1 + 114) && *(unsigned char *)(a1 + 115) != 0;
  uint64_t v4 = *(void *)(a1 + 104);
  int v5 = *(unsigned __int8 *)(a1 + 112);
  if (v5 != v3)
  {
    *(unsigned char *)(a1 + 112) = v3;
    v6 = [*(id *)(a1 + 32) changeRequest];
    if (v4) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v8 = [*(id *)(a1 + 136) backlightState];
    if (*(unsigned char *)(a1 + 112)) {
      [*(id *)(a1 + 136) isAlwaysOnSuppressed];
    }
    BOOL v7 = v8 != BLSBacklightStateForBacklightActivityStateAlwaysOnAvailable();
    goto LABEL_14;
  }
  v6 = 0;
  if (!v4) {
    goto LABEL_10;
  }
LABEL_8:
  BOOL v7 = 0;
LABEL_14:
  os_unfair_lock_unlock(v2);
  if (v5 != v3)
  {
    -[BLSHBacklightStateMachine updateSuppressionServiceForActivityState:]((unsigned char *)a1, v4);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__BLSHBacklightStateMachine_onMain_updateAlwaysOnConfiguration__block_invoke;
    v14[3] = &unk_2645335F0;
    v14[4] = a1;
    char v15 = v3;
    -[BLSHBacklightStateMachine notifyObserversWithBlock:](a1, v14);
    if (v7)
    {
      uint64_t v9 = @"alwaysOnDisabled";
      if (v3) {
        uint64_t v9 = @"alwaysOnEnabled";
      }
      uint64_t v10 = v9;
      id v11 = v6;
      if (!v11) {
        id v11 = (id)[objc_alloc(MEMORY[0x263F29980]) initWithRequestedActivityState:v4 explanation:v10 timestamp:mach_continuous_time() sourceEvent:12 sourceEventMetadata:0];
      }
      os_log_type_t v12 = bls_backlight_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v17 = a1;
        __int16 v18 = 2114;
        __int16 v19 = v10;
        __int16 v20 = 2114;
        id v21 = v11;
        _os_log_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_INFO, "BSM:%p sendNewChangeRequest explanation:%{public}@ request:%{public}@", buf, 0x20u);
      }

      id v13 = (id)[(id)a1 performChangeRequest:v11];
    }
  }
}

- (void)registerHandlersForService:(id)a3
{
  id v8 = a3;
  uint64_t v4 = +[BLSHDisableAlwaysOnAttributeHandler registerHandlerForService:provider:](BLSHDisableAlwaysOnAttributeHandler, "registerHandlerForService:provider:");
  if (!v4)
  {
    BOOL v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightStateMachine registerHandlersForService:](a2);
    }
LABEL_11:
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD35C10);
  }
  int v5 = (void *)v4;
  v6 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:v8];

  if (!v6)
  {
    BOOL v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightStateMachine registerHandlersForService:](a2);
    }
    goto LABEL_11;
  }
}

- (int64_t)flipbookState
{
  return [(BLSHBacklightStateMachineEventPerforming *)self->_eventPerformer flipbookState];
}

- (BOOL)isTransitioning
{
  return [(BLSHBacklightStateMachineEventPerforming *)self->_eventPerformer isTransitioning];
}

- (int64_t)backlightDisplayMode
{
  return [(BLSHBacklightStateMachineEventPerforming *)self->_eventPerformer backlightDisplayMode];
}

- (unint64_t)backlightStateChangeTimestamp
{
  return [(BLSHBacklightStateMachineEventPerforming *)self->_eventPerformer backlightStateChangeTimestamp];
}

- (NSString)backlightStateDescription
{
  return (NSString *)[(BLSHBacklightStateMachineEventPerforming *)self->_eventPerformer backlightStateDescription];
}

- (os_unfair_lock_s)activeOnAPAwakeAssertionIsActive
{
  if (result)
  {
    v1 = result;
    v2 = result + 22;
    os_unfair_lock_lock(result + 22);
    uint64_t v3 = [*(id *)&v1[10]._os_unfair_lock_opaque isActive];
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (BOOL)deviceSupportsAlwaysOn
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_deviceSupportsAlwaysOn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (uint64_t)withLock_desiredBacklightStateForRequestedActivityState:(uint64_t)result
{
  if (result)
  {
    if (*(unsigned char *)(result + 112)) {
      [*(id *)(result + 136) isAlwaysOnSuppressed];
    }
    return BLSBacklightStateForBacklightActivityStateAlwaysOnAvailable();
  }
  return result;
}

- (id)performChangeRequest:(id)a3
{
  id v5 = a3;
  id v3 = v5;
  BSDispatchMain();

  return 0;
}

void __50__BLSHBacklightStateMachine_performChangeRequest___block_invoke(uint64_t a1)
{
}

- (void)onMain_performChangeRequest:(uint64_t)a1
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    int v4 = *(unsigned __int8 *)(a1 + 116);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    if (v4)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke;
      block[3] = &unk_2645322D0;
      block[4] = a1;
      id v67 = v3;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
      id v35 = *(id *)(a1 + 136);
      uint64_t v5 = [v35 backlightState];
      uint64_t v6 = [v3 requestedActivityState];
      uint64_t v7 = -[BLSHBacklightStateMachine withLock_desiredBacklightStateForRequestedActivityState:](a1);
      uint64_t v8 = *(void *)(a1 + 96);
      *(void *)(a1 + 96) = v8 + 1;
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F29978]) initWithEventID:v8 state:v7 previousState:v5 changeRequest:v3];
      objc_storeStrong((id *)(a1 + 32), v9);
      *(void *)(a1 + 104) = v6;
      *(unsigned char *)(a1 + 116) = 1;
      uint64_t v10 = (uint64_t)*(id *)(a1 + 64);
      uint64_t v11 = (uint64_t)*(id *)(a1 + 40);
      id v33 = *(id *)(a1 + 72);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
      os_log_type_t v12 = bls_backlight_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v69 = a1;
        __int16 v70 = 2114;
        v71 = v9;
        _os_log_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_DEFAULT, "BSM:%p will performRequest with event:%{public}@", buf, 0x16u);
      }

      [v3 sourceEvent];
      [v3 timestamp];
      kdebug_trace();
      [v35 prewarmEvent:v9];
      id v13 = [(id)a1 telemetryDelegate];
      if (objc_opt_respondsToSelector()) {
        [v13 backlightTelemetrySource:a1 willPerformEvent:v9];
      }
      else {
        [v13 backlightTelemetrySource:a1 willTransitionToState:v7 forEvent:v9];
      }
      -[BLSHBacklightStateMachine updateSuppressionServiceForActivityState:]((unsigned char *)a1, v6);
      id v34 = *(id *)(a1 + 8);
      v32 = v13;
      if (BLSBacklightStateIsActive())
      {
        if (v11)
        {
          uint64_t v47 = MEMORY[0x263EF8330];
          uint64_t v48 = 3221225472;
          v49 = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2_88;
          v50 = &unk_2645322D0;
          uint64_t v51 = a1;
          id v52 = v9;
          BSDispatchMain();
          uint64_t v14 = v52;
        }
        else
        {
          [v35 setSafeToUnblank:0];
          [v33 invalidate];
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v60[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_80;
          v60[3] = &unk_264533410;
          id v15 = v35;
          id v61 = v15;
          uint64_t v62 = a1;
          id v31 = v9;
          id v63 = v31;
          id v30 = v3;
          id v64 = v30;
          id v16 = v34;
          id v65 = v16;
          v29 = [v16 scheduledTimerWithIdentifier:@"systemActivity.backlightActiveOn.timeout" interval:v60 leewayInterval:0.6 handler:0.1];

          uint64_t v11 = [v16 createSystemActivityAssertionWithIdentifier:@"BacklightServices.backlightActiveOn" configurator:&__block_literal_global_86];
          kdebug_trace();
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2;
          v53[3] = &unk_264533460;
          id v54 = v16;
          uint64_t v55 = a1;
          id v56 = v31;
          id v57 = v30;
          id v33 = v29;
          id v58 = v33;
          id v59 = v15;
          [(id)v11 acquireWithTimeout:v53 handler:0.0];

          uint64_t v14 = v61;
        }
      }
      if (v5 != v7)
      {
        uint64_t v17 = [*(id *)(a1 + 16) state];
        if (!(v11 | v10))
        {
          if (v17 == 1)
          {
            uint64_t v10 = 0;
          }
          else
          {
            __int16 v18 = NSString;
            __int16 v19 = [v9 changeRequest];
            __int16 v20 = objc_msgSend(v18, "stringWithFormat:", @"BacklightServices.performEvent:%p:%d", v9, objc_msgSend(v19, "sourceEvent"));
            uint64_t v10 = [v34 createSystemActivityAssertionWithIdentifier:v20 configurator:&__block_literal_global_93];

            v43[0] = MEMORY[0x263EF8330];
            v43[1] = 3221225472;
            v43[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_4;
            v43[3] = &unk_264533488;
            v43[4] = a1;
            id v44 = v9;
            id v45 = v3;
            id v46 = v34;
            [(id)v10 acquireWithTimeout:v43 handler:22.0];
          }
        }
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_94;
        v40[3] = &unk_2645334B0;
        v40[4] = a1;
        uint64_t v42 = v7;
        id v41 = v9;
        -[BLSHBacklightStateMachine notifyObserversWithBlock:](a1, v40);
      }
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
      id v21 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v10;
      id v22 = (id)v10;

      uint64_t v23 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v11;
      id v24 = (id)v11;

      v25 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v33;
      id v26 = v33;

      *(unsigned char *)(a1 + 116) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
      LOBYTE(v25) = BLSBacklightStateIsActive();
      char IsActive = BLSBacklightStateIsActive();
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2_98;
      v36[3] = &unk_2645334D8;
      v36[4] = a1;
      id v37 = v9;
      char v38 = IsActive & ~(_BYTE)v25;
      char v39 = v25 & (IsActive ^ 1);
      id v28 = v9;
      -[BLSHBacklightStateMachine notifyObserversWithBlock:](a1, v36);
      [v35 performEvent:v28];
    }
  }
}

uint64_t __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke(uint64_t a1)
{
  return -[BLSHBacklightStateMachine onMain_performChangeRequest:](*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_80(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  kdebug_trace();
  [v3 invalidate];

  int v4 = bls_backlight_log();
  if ([*(id *)(a1 + 32) safeToUnblank]) {
    os_log_type_t v5 = OS_LOG_TYPE_DEBUG;
  }
  else {
    os_log_type_t v5 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    [*(id *)(a1 + 56) timestamp];
    objc_msgSend(*(id *)(a1 + 64), "mach_continuous_time");
    BSTimeDifferenceFromMachTimeToMachTime();
    int v10 = 134218498;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    _os_log_impl(&dword_21FCFC000, v4, v5, "BSM:%p activeOn system activity assertion timed out (related to rdar://74802930) event:%{public}@ elapsed:%.4lfs", (uint8_t *)&v10, 0x20u);
  }

  return [*(id *)(a1 + 32) setSafeToUnblank:1];
}

uint64_t __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_84(uint64_t a1, void *a2)
{
  return [a2 setAcquireWaitsToAbortSleepRequested:0];
}

void __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "mach_continuous_time");
  if (v7) {
    [v7 code];
  }
  kdebug_trace();
  if (a2)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v10 + 88));
      *(void *)(v10 + 48) = v9;
      os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 88));
    }
    uint64_t v11 = bls_backlight_log();
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
    uint64_t v11 = bls_backlight_log();
  }
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    [*(id *)(a1 + 56) timestamp];
    BSTimeDifferenceFromMachTimeToMachTime();
    *(_DWORD *)buf = 134219010;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2114;
    uint64_t v25 = v14;
    __int16 v26 = 2048;
    uint64_t v27 = v15;
    __int16 v28 = 2114;
    id v29 = v7;
    _os_log_impl(&dword_21FCFC000, v11, v12, "BSM:%p activeOn system activity assertion callback details:%{public}@ event:%{public}@ elapsed:%.4lfs error:%{public}@", buf, 0x34u);
  }

  [*(id *)(a1 + 64) invalidate];
  [*(id *)(a1 + 72) setSafeToUnblank:1];
  __int16 v18 = v7;
  id v19 = *(id *)(a1 + 48);
  id v16 = v8;
  id v17 = v7;
  BSDispatchMain();
}

void __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_87(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) telemetryDelegate];
  [v2 backlightTelemetrySource:*(void *)(a1 + 32) didAcquireSystemActivityWithError:*(void *)(a1 + 40) isActive:*(unsigned __int8 *)(a1 + 64) details:*(void *)(a1 + 48) forEvent:*(void *)(a1 + 56)];
}

void __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2_88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) telemetryDelegate];
  [v2 backlightTelemetrySource:*(void *)(a1 + 32) hadExistingSystemActivityForEvent:*(void *)(a1 + 40)];
}

uint64_t __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setAcquireWaitsToAbortSleepRequested:0];
}

void __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_4(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = bls_backlight_log();
  if (a2)
  {
    if ([v8 afterPendingSleepWasAlreadyInitiated]) {
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    }
    else {
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
    }
  }
  else
  {
    os_log_type_t v10 = OS_LOG_TYPE_FAULT;
  }
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) timestamp];
    objc_msgSend(*(id *)(a1 + 56), "mach_continuous_time");
    BSTimeDifferenceFromMachTimeToMachTime();
    int v14 = 134219010;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_impl(&dword_21FCFC000, v9, v10, "BSM:%p performEvent system activity assertion callback details:%{public}@ event:%{public}@ elapsed:%.4lfs error:%{public}@", (uint8_t *)&v14, 0x34u);
  }
}

void __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_94(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 backlightHost:a1[4] willTransitionToState:a1[6] forEvent:a1[5]];
  }
}

- (void)notifyObserversWithBlock:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    int v4 = (os_unfair_lock_s *)(a1 + 88);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    os_log_type_t v5 = [*(id *)(a1 + 80) allObjects];
    os_unfair_lock_unlock(v4);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          v3[2](v3, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

uint64_t __57__BLSHBacklightStateMachine_onMain_performChangeRequest___block_invoke_2_98(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 observesPerformingAllEvents])
  {
    [v4 backlight:*(void *)(a1 + 32) performingEvent:*(void *)(a1 + 40)];
  }
  else if (*(unsigned char *)(a1 + 48) {
         && (objc_opt_respondsToSelector() & 1) != 0
  }
         && [v4 observesActivation])
  {
    [v4 backlight:*(void *)(a1 + 32) activatingWithEvent:*(void *)(a1 + 40)];
  }
  else if (*(unsigned char *)(a1 + 49) {
         && (objc_opt_respondsToSelector() & 1) != 0
  }
         && [v4 observesDeactivation])
  {
    [v4 backlight:*(void *)(a1 + 32) deactivatingWithEvent:*(void *)(a1 + 40)];
  }

  return MEMORY[0x270F9A830]();
}

void __70__BLSHBacklightStateMachine_updateSuppressionServiceForActivityState___block_invoke(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = bls_backlight_log();
  os_log_type_t v5 = v4;
  if (a2) {
    os_log_type_t v6 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled(v4, v6))
  {
    if (a2) {
      uint64_t v7 = "";
    }
    else {
      uint64_t v7 = "not ";
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = NSStringFromBLSBacklightActivityState();
    uint64_t v10 = NSStringFromBLSBacklightState();
    int v11 = 134218754;
    uint64_t v12 = v8;
    __int16 v13 = 2080;
    long long v14 = v7;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    __int16 v18 = v10;
    _os_log_impl(&dword_21FCFC000, v5, v6, "BSM:%p will %sstart suppression service; activityState:%{public}@ unsuppressedTargetBacklightState:%{public}@",
      (uint8_t *)&v11,
      0x2Au);
  }
}

- (void)startSuppressionServiceWithLogBlock:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    int v4 = [*(id *)(a1 + 8) isSuppressionServiceActive];
    char v5 = v4;
    v3[2](v3, v4 ^ 1u);
    if ((v5 & 1) == 0)
    {
      os_log_type_t v6 = *(void **)(a1 + 8);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __65__BLSHBacklightStateMachine_startSuppressionServiceWithLogBlock___block_invoke;
      v7[3] = &unk_264533528;
      v7[4] = a1;
      [v6 startSuppressionServiceWithHandler:v7];
    }
  }
}

void __70__BLSHBacklightStateMachine_updateSuppressionServiceForActivityState___block_invoke_111(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v4 = bls_backlight_log();
  char v5 = v4;
  if (a2) {
    os_log_type_t v6 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled(v4, v6))
  {
    if (a2) {
      uint64_t v7 = "";
    }
    else {
      uint64_t v7 = "not ";
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = NSStringFromBLSBacklightActivityState();
    uint64_t v10 = NSStringFromBLSBacklightState();
    int v11 = 134218754;
    uint64_t v12 = v8;
    __int16 v13 = 2080;
    long long v14 = v7;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    __int16 v18 = v10;
    _os_log_impl(&dword_21FCFC000, v5, v6, "BSM:%p will %send suppression service; activityState:%{public}@ unsuppressedTargetBacklightState:%{public}@",
      (uint8_t *)&v11,
      0x2Au);
  }
}

- (void)endSuppressionServiceWithExplanation:(void *)a3 logBlock:
{
  id v17 = a2;
  id v5 = a3;
  if (!a1)
  {
LABEL_10:

    return;
  }
  uint64_t v6 = [*(id *)(a1 + 8) isSuppressionServiceActive];
  (*((void (**)(id, uint64_t))v5 + 2))(v5, v6);
  if (v6) {
    [*(id *)(a1 + 8) endSuppressionService];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  int v7 = [*(id *)(a1 + 136) isAlwaysOnSuppressed];
  [*(id *)(a1 + 136) setAlwaysOnSuppressed:0];
  if ((v6 & 1) != 0 || !v7)
  {
    if (v6 & v7)
    {
      uint64_t v8 = mach_continuous_time();
      id v9 = objc_alloc(MEMORY[0x263F29980]);
      uint64_t v10 = *(void *)(a1 + 104);
      id v11 = objc_alloc(MEMORY[0x263F29988]);
      uint64_t v12 = [[BLSHSuppressionEvent alloc] initWithType:2 reason:0x80000000 timestamp:v8];
      __int16 v13 = (void *)[v11 initWithSuppressionEvent:v12];
      long long v14 = (void *)[v9 initWithRequestedActivityState:v10 explanation:v17 timestamp:v8 sourceEvent:14 sourceEventMetadata:v13];

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
      if (v14)
      {
        id v15 = (id)[(id)a1 performChangeRequest:v14];
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    }
    goto LABEL_10;
  }
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"BSM:%p suppressed but suppression service not active", a1);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[BLSHBacklightStateMachine endSuppressionServiceWithExplanation:logBlock:](sel_endSuppressionServiceWithExplanation_logBlock_);
  }
  [v16 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __65__BLSHBacklightStateMachine_startSuppressionServiceWithLogBlock___block_invoke(uint64_t a1, void *a2)
{
}

- (void)onMain_handleSuppressionEvent:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    if ([*(id *)(a1 + 8) isSuppressionServiceActive])
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
      uint64_t v4 = [v3 wantsSuppression];
      [*(id *)(a1 + 136) setAlwaysOnSuppressed:v4];
      id v5 = NSString;
      if (v4) {
        uint64_t v6 = @"alwaysOn suppressed";
      }
      else {
        uint64_t v6 = @"alwaysOn unsuppressed";
      }
      [v3 reason];
      int v7 = NSStringFromBLSAlwaysOnSuppressionReason();
      uint64_t v8 = [v5 stringWithFormat:@"%@ — %@", v6, v7];

      id v9 = objc_alloc(MEMORY[0x263F29980]);
      uint64_t v10 = *(void *)(a1 + 104);
      uint64_t v11 = [v3 machContinuousTimestamp];
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F29988]) initWithSuppressionEvent:v3];
      __int16 v13 = (void *)[v9 initWithRequestedActivityState:v10 explanation:v8 timestamp:v11 sourceEvent:14 sourceEventMetadata:v12];

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
      long long v14 = bls_backlight_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218754;
        uint64_t v18 = a1;
        __int16 v19 = 2114;
        __int16 v20 = v8;
        __int16 v21 = 2114;
        id v22 = v13;
        __int16 v23 = 2114;
        id v24 = v3;
        _os_log_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_INFO, "BSM:%p suppressionEvent explanation:%{public}@ request:%{public}@ event:%{public}@", buf, 0x2Au);
      }

      id v15 = (id)[(id)a1 performChangeRequest:v13];
    }
    else
    {
      uint64_t v8 = bls_backlight_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        [v3 reason];
        uint64_t v16 = NSStringFromBLSAlwaysOnSuppressionReason();
        *(_DWORD *)buf = 134218498;
        uint64_t v18 = a1;
        __int16 v19 = 2114;
        __int16 v20 = v16;
        __int16 v21 = 2114;
        id v22 = v3;
        _os_log_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_DEFAULT, "BSM:%p will ignore suppressionEvent — arrived after service was deactivated — explanation:%{public}@ event:%{public}@", buf, 0x20u);
      }
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_lock_observers addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  id v5 = v4;
  BSDispatchMain();
}

uint64_t __41__BLSHBacklightStateMachine_addObserver___block_invoke(uint64_t a1)
{
  return -[BLSHBacklightStateMachine onMain_notifyInitialStateForObserver:](*(void *)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)onMain_notifyInitialStateForObserver:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v10 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    int v4 = [*(id *)(a1 + 80) containsObject:v10];
    int v5 = *(unsigned __int8 *)(a1 + 112);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    if (v4)
    {
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v10, "backlight:didCompleteUpdateToState:forEvents:abortedEvents:", a1, objc_msgSend((id)a1, "backlightState"), 0, 0);
      }
      else if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v10, "backlight:didCompleteUpdateToState:forEvent:", a1, objc_msgSend((id)a1, "backlightState"), 0);
      }
      if (objc_opt_respondsToSelector()) {
        [v10 backlight:a1 didChangeAlwaysOnEnabled:v5 != 0];
      }
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v10, "backlight:didCompleteUpdateToFlipbookState:forEvents:abortedEvents:", a1, objc_msgSend((id)a1, "flipbookState"), 0, 0);
      }
      else if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v10, "backlight:didCompleteUpdateToFlipbookState:forEvent:", a1, objc_msgSend((id)a1, "flipbookState"), 0);
      }
      uint64_t v6 = [*(id *)(a1 + 136) backlightDisplayMode];
      BOOL v7 = IsBlankedForBLSBacklightDisplayMode(v6);
      if ((objc_opt_respondsToSelector() & 1) != 0 && [v10 observesUpdateToDisplayMode])
      {
        [v10 backlight:a1 didUpdateToDisplayMode:v6 fromDisplayMode:v6 activeEvents:0 abortedEvents:0];
      }
      else
      {
        char v8 = objc_opt_respondsToSelector();
        if (v7)
        {
          if ((v8 & 1) != 0 && [v10 observesBlankingChanges]) {
            [v10 backlight:a1 didBlankToDisplayMode:v6 fromDisplayMode:v6 activeEvents:0 abortedEvents:0];
          }
        }
        else if ((v8 & 1) != 0 && [v10 observesBlankingChanges])
        {
          [v10 backlight:a1 willUnblankToDisplayMode:v6 fromDisplayMode:v6 forEvents:0 abortedEvents:0];
        }
      }
    }
  }

  return MEMORY[0x270F9A790]();
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v34 = a6;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_transitioningEvent && objc_msgSend(v9, "containsObject:"))
  {
    lock_transitioningEvent = self->_lock_transitioningEvent;
    self->_lock_transitioningEvent = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v11 = [v9 firstObject];
  uint64_t v12 = [v11 changeRequest];
  [v11 previousState];
  [v12 sourceEvent];
  id v33 = v12;
  [v12 timestamp];
  kdebug_trace();
  uint64_t v13 = [v9 count];
  long long v14 = bls_backlight_log();
  os_log_type_t v15 = 2 * (v13 == 0);
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = NSStringFromBLSBacklightState();
    [v12 timestamp];
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    uint64_t v18 = v17;
    __int16 v19 = NSStringFromBLSBacklightChangeEvents();
    *(_DWORD *)buf = 134218754;
    id v41 = self;
    __int16 v42 = 2114;
    v43 = v16;
    __int16 v44 = 2048;
    uint64_t v45 = v18;
    __int16 v46 = 2114;
    uint64_t v47 = v19;
    _os_log_impl(&dword_21FCFC000, v14, v15, "BSM:%p didCompleteUpdateToState:%{public}@ elapsed:%.4lfs forEvents:%{public}@", buf, 0x2Au);
  }
  if (v13)
  {
    __int16 v20 = [(BLSHBacklightStateMachine *)self telemetryDelegate];
    if (objc_opt_respondsToSelector()) {
      [v20 backlightTelemetrySource:self didCompleteUpdateToState:a4 forEvents:v9 abortedEvents:v34];
    }
    else {
      [v20 backlightTelemetrySource:self didCompleteUpdateToState:a4 forEvent:v11];
    }
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __88__BLSHBacklightStateMachine_backlight_didCompleteUpdateToState_forEvents_abortedEvents___block_invoke;
  v35[3] = &unk_264533550;
  v35[4] = self;
  int64_t v39 = a4;
  id v21 = v9;
  id v36 = v21;
  id v22 = v34;
  id v37 = v22;
  id v23 = v11;
  id v38 = v23;
  -[BLSHBacklightStateMachine notifyObserversWithBlock:]((uint64_t)self, v35);
  os_unfair_lock_lock(&self->_lock);
  [(BLSHSystemActivityAsserting *)self->_lock_performEventAPAwakeAssertion invalidate];
  lock_performEventAPAwakeAssertion = self->_lock_performEventAPAwakeAssertion;
  self->_lock_performEventAPAwakeAssertion = 0;

  char IsActive = BLSBacklightStateIsActive();
  if ((IsActive & 1) == 0)
  {
    [(BSTimerScheduleQuerying *)self->_lock_activeOnAPAwakeTimeoutTimer invalidate];
    lock_activeOnAPAwakeTimeoutTimer = self->_lock_activeOnAPAwakeTimeoutTimer;
    self->_lock_activeOnAPAwakeTimeoutTimer = 0;

    [(BLSHSystemActivityAsserting *)self->_lock_activeOnAPAwakeAssertion invalidate];
    lock_activeOnAPAwakeAssertion = self->_lock_activeOnAPAwakeAssertion;
    self->_lock_activeOnAPAwakeAssertion = 0;
  }
  __int16 v28 = (void (**)(void))MEMORY[0x223C5E2B0](self->_lock_sleepActionCompletion);
  id lock_sleepActionCompletion = self->_lock_sleepActionCompletion;
  self->_id lock_sleepActionCompletion = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v28) {
    char v30 = IsActive;
  }
  else {
    char v30 = 1;
  }
  if ((v30 & 1) == 0)
  {
    id v31 = bls_backlight_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = NSStringFromBLSBacklightChangeEvents();
      *(_DWORD *)buf = 134218242;
      id v41 = self;
      __int16 v42 = 2114;
      v43 = v32;
      _os_log_impl(&dword_21FCFC000, v31, OS_LOG_TYPE_DEFAULT, "BSM:%p unexpected system sleep - did deactivate backlight with events:%{public}@", buf, 0x16u);
    }
    v28[2](v28);
  }
}

void __88__BLSHBacklightStateMachine_backlight_didCompleteUpdateToState_forEvents_abortedEvents___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 backlight:a1[4] didCompleteUpdateToState:a1[8] forEvents:a1[5] abortedEvents:a1[6]];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 backlight:a1[4] didCompleteUpdateToState:a1[8] forEvent:a1[7]];
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToFlipbookState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [v9 firstObject];
  uint64_t v12 = [(BLSHBacklightStateMachine *)self telemetryDelegate];
  if (objc_opt_respondsToSelector()) {
    [v12 backlightTelemetrySource:self didCompleteUpdateToFlipbookState:a4 forEvents:v9 abortedEvents:v10];
  }
  else {
    [v12 backlightTelemetrySource:self didCompleteUpdateToFlipbookState:a4 forEvent:v11];
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__BLSHBacklightStateMachine_backlight_didCompleteUpdateToFlipbookState_forEvents_abortedEvents___block_invoke;
  v16[3] = &unk_264533550;
  id v19 = v11;
  int64_t v20 = a4;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  -[BLSHBacklightStateMachine notifyObserversWithBlock:]((uint64_t)self, v16);
}

void __96__BLSHBacklightStateMachine_backlight_didCompleteUpdateToFlipbookState_forEvents_abortedEvents___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 backlight:a1[4] didCompleteUpdateToFlipbookState:a1[8] forEvents:a1[5] abortedEvents:a1[6]];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 backlight:a1[4] didCompleteUpdateToFlipbookState:a1[8] forEvent:a1[7]];
  }
}

- (void)backlight:(id)a3 didUpdateVisualContentsToBeginTransitionToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [v9 firstObject];
  uint64_t v12 = [(BLSHBacklightStateMachine *)self telemetryDelegate];
  if (objc_opt_respondsToSelector()) {
    [v12 backlightTelemetrySource:self didUpdateVisualContentsToBeginTransitionToState:a4 forEvents:v9 abortedEvents:v10];
  }
  else {
    [v12 backlightTelemetrySource:self didUpdateVisualContentsToBeginTransitionToState:a4 forEvent:v11];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __111__BLSHBacklightStateMachine_backlight_didUpdateVisualContentsToBeginTransitionToState_forEvents_abortedEvents___block_invoke;
  v15[3] = &unk_264533578;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  int64_t v18 = a4;
  id v13 = v10;
  id v14 = v9;
  -[BLSHBacklightStateMachine notifyObserversWithBlock:]((uint64_t)self, v15);
}

void __111__BLSHBacklightStateMachine_backlight_didUpdateVisualContentsToBeginTransitionToState_forEvents_abortedEvents___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 observesDidUpdateVisualContents]) {
    [v3 backlight:a1[4] didUpdateVisualContentsToBeginTransitionToState:a1[7] forEvents:a1[5] abortedEvents:a1[6]];
  }
}

- (void)backlight:(id)a3 willUpdateToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 forEvents:(id)a6 abortedEvents:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  BOOL v13 = WillUnblankForDisplayModeTransition(a5, a4);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __103__BLSHBacklightStateMachine_backlight_willUpdateToDisplayMode_fromDisplayMode_forEvents_abortedEvents___block_invoke;
  v16[3] = &unk_2645335A0;
  int64_t v19 = a4;
  int64_t v20 = a5;
  v16[4] = self;
  id v17 = v11;
  id v18 = v12;
  BOOL v21 = v13;
  id v14 = v12;
  id v15 = v11;
  -[BLSHBacklightStateMachine notifyObserversWithBlock:]((uint64_t)self, v16);
}

void __103__BLSHBacklightStateMachine_backlight_willUpdateToDisplayMode_fromDisplayMode_forEvents_abortedEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 observesUpdateToDisplayMode])
  {
    [v3 backlight:*(void *)(a1 + 32) willUpdateToDisplayMode:*(void *)(a1 + 56) fromDisplayMode:*(void *)(a1 + 64) forEvents:*(void *)(a1 + 40) abortedEvents:*(void *)(a1 + 48)];
  }
  else if (*(unsigned char *)(a1 + 72) {
         && (objc_opt_respondsToSelector() & 1) != 0
  }
         && [v3 observesBlankingChanges])
  {
    [v3 backlight:*(void *)(a1 + 32) willUnblankToDisplayMode:*(void *)(a1 + 56) fromDisplayMode:*(void *)(a1 + 64) forEvents:*(void *)(a1 + 40) abortedEvents:*(void *)(a1 + 48)];
  }
}

- (void)backlight:(id)a3 didUpdateToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 activeEvents:(id)a6 abortedEvents:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  BOOL v13 = WillUnblankForDisplayModeTransition(a5, a4);
  id v14 = [v11 firstObject];
  id v15 = [(BLSHBacklightStateMachine *)self telemetryDelegate];
  if (v13)
  {
    if (objc_opt_respondsToSelector())
    {
      [v15 backlightTelemetrySource:self didUnblankToDisplayMode:a4 fromDisplayMode:a5 activeEvents:v11 abortedEvents:v12];
    }
    else if (v14)
    {
      uint64_t v16 = BLSBacklightStateForBLSBacklightDisplayMode(a4);
      if (objc_opt_respondsToSelector()) {
        [v15 backlightTelemetrySource:self didUpdateDisplayForState:v16 forEvents:v11 abortedEvents:v12];
      }
      else {
        [v15 backlightTelemetrySource:self didUpdateDisplayForState:v16 forEvent:v14];
      }
    }
  }
  BOOL v17 = WillBlankForDisplayModeTransition(a5, a4);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __105__BLSHBacklightStateMachine_backlight_didUpdateToDisplayMode_fromDisplayMode_activeEvents_abortedEvents___block_invoke;
  v20[3] = &unk_2645335A0;
  int64_t v23 = a4;
  int64_t v24 = a5;
  v20[4] = self;
  id v21 = v11;
  id v22 = v12;
  BOOL v25 = v17;
  id v18 = v12;
  id v19 = v11;
  -[BLSHBacklightStateMachine notifyObserversWithBlock:]((uint64_t)self, v20);
}

void __105__BLSHBacklightStateMachine_backlight_didUpdateToDisplayMode_fromDisplayMode_activeEvents_abortedEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 observesUpdateToDisplayMode])
  {
    [v3 backlight:*(void *)(a1 + 32) didUpdateToDisplayMode:*(void *)(a1 + 56) fromDisplayMode:*(void *)(a1 + 64) activeEvents:*(void *)(a1 + 40) abortedEvents:*(void *)(a1 + 48)];
  }
  else if (*(unsigned char *)(a1 + 72) {
         && (objc_opt_respondsToSelector() & 1) != 0
  }
         && [v3 observesBlankingChanges])
  {
    [v3 backlight:*(void *)(a1 + 32) didBlankToDisplayMode:*(void *)(a1 + 56) fromDisplayMode:*(void *)(a1 + 64) activeEvents:*(void *)(a1 + 40) abortedEvents:*(void *)(a1 + 48)];
  }
}

- (void)platformProvider:(id)a3 didChangeAlwaysOnSetting:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL lock_alwaysOnEnabledByPlatform = v4;
  BOOL v7 = bls_backlight_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v4;
    _os_log_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_DEFAULT, "BSM:%p didChangeAlwaysOnSetting:%{BOOL}u", buf, 0x12u);
  }

  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

void __71__BLSHBacklightStateMachine_platformProvider_didChangeAlwaysOnSetting___block_invoke(uint64_t a1)
{
}

- (void)platformProviderDidDetectSignificantUserInteraction:(id)a3
{
  id v4 = a3;
  if (self->_suppressionSupported)
  {
    os_unfair_lock_lock(&self->_lock);
    int64_t lock_activityState = self->_lock_activityState;
    os_unfair_lock_unlock(&self->_lock);
    if (lock_activityState == 1)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __81__BLSHBacklightStateMachine_platformProviderDidDetectSignificantUserInteraction___block_invoke;
      v6[3] = &unk_2645335C8;
      v6[4] = self;
      v6[5] = 1;
      -[BLSHBacklightStateMachine endSuppressionServiceWithExplanation:logBlock:]((uint64_t)self, @"significantUserInteraction", v6);
    }
  }
  [(BLSHOSInterfaceProviding *)self->_osInterfaceProvider didDetectSignificantUserInteraction];
}

void __81__BLSHBacklightStateMachine_platformProviderDidDetectSignificantUserInteraction___block_invoke(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = bls_backlight_log();
  id v5 = v4;
  if (a2) {
    os_log_type_t v6 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled(v4, v6))
  {
    if (a2) {
      BOOL v7 = "";
    }
    else {
      BOOL v7 = "not ";
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = NSStringFromBLSBacklightActivityState();
    int v10 = 134218498;
    uint64_t v11 = v8;
    __int16 v12 = 2080;
    BOOL v13 = v7;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl(&dword_21FCFC000, v5, v6, "BSM:%p will %send suppression service after significant user interaction; activityState:%{public}@",
      (uint8_t *)&v10,
      0x20u);
  }
}

void __63__BLSHBacklightStateMachine_onMain_updateAlwaysOnConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 backlight:*(void *)(a1 + 32) didChangeAlwaysOnEnabled:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (BOOL)isAlwaysOnDisabledByAssertion
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnDisabledByAssertion;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysOnDisabledByAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_alwaysOnDisabledByAssertion = v3;
  self->_lock_alwaysOnEnabledAfterInitialization = 1;
  os_log_type_t v6 = bls_backlight_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v8 = self;
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_INFO, "BSM:%p setAlwaysOnDisabledByAssertion:%{BOOL}u", buf, 0x12u);
  }

  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

void __60__BLSHBacklightStateMachine_setAlwaysOnDisabledByAssertion___block_invoke(uint64_t a1)
{
}

- (void)systemSleepAction:(id)a3 performWithCompletion:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(void))a4;
  [(BLSHBacklightStateMachine *)self backlightState];
  int IsActive = BLSBacklightStateIsActive();
  if (IsActive && -[BLSHBacklightStateMachine activeOnAPAwakeAssertionIsActive]((os_unfair_lock_s *)self))
  {
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x263F29980]) initWithRequestedActivityState:0 explanation:@"unexpected system sleep" timestamp:mach_continuous_time() sourceEvent:12 sourceEventMetadata:0];
    os_unfair_lock_lock(&self->_lock);
    uint64_t v8 = (void *)MEMORY[0x223C5E2B0](v5);
    id lock_sleepActionCompletion = self->_lock_sleepActionCompletion;
    self->_id lock_sleepActionCompletion = v8;

    [(BLSHOSInterfaceProviding *)self->_osInterfaceProvider mach_continuous_time];
    BSTimeDifferenceFromMachTimeToMachTime();
    double v11 = v10;
    double v12 = 0.5 - v10;
    BOOL v13 = bls_backlight_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12 <= 0.0)
    {
      if (v14)
      {
        BLSLoggingStringForContinuousMachTime();
        double v21 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 134219010;
        id v29 = self;
        __int16 v30 = 2114;
        double v31 = v21;
        __int16 v32 = 2048;
        double v33 = v11;
        __int16 v34 = 2048;
        double v35 = 0.5 - v11;
        __int16 v36 = 2114;
        id v37 = v7;
        _os_log_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_DEFAULT, "BSM:%p unexpected system sleep - assertion acquired %{public}@ {elapsedTime:%lf timerInterval:%lf} — dispatching request:%{public}@", buf, 0x34u);
      }
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __69__BLSHBacklightStateMachine_systemSleepAction_performWithCompletion___block_invoke_171;
      v24[3] = &unk_2645322D0;
      uint64_t v16 = &v25;
      v24[4] = self;
      BOOL v25 = v7;
      id v22 = v7;
      dispatch_async(MEMORY[0x263EF83A0], v24);
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 134218498;
        id v29 = self;
        __int16 v30 = 2048;
        double v31 = 0.5 - v11;
        __int16 v32 = 2114;
        double v33 = *(double *)&v7;
        _os_log_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_DEFAULT, "BSM:%p unexpected system sleep - will wait %lfs before sending request:%{public}@", buf, 0x20u);
      }

      osInterfaceProvider = self->_osInterfaceProvider;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __69__BLSHBacklightStateMachine_systemSleepAction_performWithCompletion___block_invoke;
      v26[3] = &unk_264533618;
      uint64_t v16 = &v27;
      v26[4] = self;
      uint64_t v27 = v7;
      id v17 = v7;
      id v18 = [(BLSHOSInterfaceProviding *)osInterfaceProvider scheduledTimerWithIdentifier:@"unexpected system sleep debounce" interval:v26 leewayInterval:0.5 - v11 handler:0.1];
      lock_unexpectedSleepDebounceTimer = self->_lock_unexpectedSleepDebounceTimer;
      self->_lock_unexpectedSleepDebounceTimer = v18;
    }
    os_unfair_lock_unlock(&self->_lock);

    BOOL v20 = v7 == 0;
  }
  else
  {
    v5[2](v5);
    BOOL v20 = 1;
  }
  if ((IsActive & v20) == 1)
  {
    int64_t v23 = bls_backlight_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[BLSHBacklightStateMachine systemSleepAction:performWithCompletion:]((uint64_t)self, v23);
    }
  }
}

uint64_t __69__BLSHBacklightStateMachine_systemSleepAction_performWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  [a2 invalidate];
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 performUnexpectedSleepRequest:v4];
}

uint64_t __69__BLSHBacklightStateMachine_systemSleepAction_performWithCompletion___block_invoke_171(uint64_t a1)
{
  return [*(id *)(a1 + 32) performUnexpectedSleepRequest:*(void *)(a1 + 40)];
}

- (void)performUnexpectedSleepRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void (**)(void))MEMORY[0x223C5E2B0](self->_lock_sleepActionCompletion);
  id lock_sleepActionCompletion = self->_lock_sleepActionCompletion;
  BOOL v7 = [(BLSHOSInterfaceProviding *)self->_osInterfaceProvider systemSleepMonitor];
  uint64_t v8 = [v7 aggregateState];

  int v9 = [v8 isAwakeOrAbortingSleep];
  if (lock_sleepActionCompletion) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  if (v10 == 1)
  {
    id v11 = self->_lock_sleepActionCompletion;
    self->_id lock_sleepActionCompletion = 0;
  }
  [(BSInvalidatable *)self->_lock_unexpectedSleepDebounceTimer invalidate];
  lock_unexpectedSleepDebounceTimer = self->_lock_unexpectedSleepDebounceTimer;
  self->_lock_unexpectedSleepDebounceTimer = 0;

  os_unfair_lock_unlock(&self->_lock);
  [(BLSHBacklightStateMachine *)self backlightState];
  int IsActive = BLSBacklightStateIsActive();
  if (v10)
  {
    BOOL v14 = bls_backlight_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v25 = 134218754;
      __int16 v26 = self;
      __int16 v27 = 1024;
      *(_DWORD *)__int16 v28 = 1;
      *(_WORD *)&v28[4] = 2114;
      *(void *)&v28[6] = v8;
      *(_WORD *)&v28[14] = 2114;
      *(void *)&v28[16] = v4;
      _os_log_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_INFO, "BSM:%p (no longer requested) unexpected system sleep - hasSleepActionCompletion:%{BOOL}u %{public}@ - will not send request:%{public}@", (uint8_t *)&v25, 0x26u);
    }

    v5[2](v5);
    goto LABEL_22;
  }
  if (!lock_sleepActionCompletion)
  {
    id v19 = bls_backlight_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v25 = 134218498;
      __int16 v26 = self;
      __int16 v27 = 2114;
      *(void *)__int16 v28 = v4;
      *(_WORD *)&v28[8] = 2114;
      *(void *)&v28[10] = v8;
      BOOL v20 = "BSM:%p (no sleep action completion) unexpected system sleep - will not send request:%{public}@ %{public}@";
      goto LABEL_17;
    }
LABEL_21:

    goto LABEL_22;
  }
  int v15 = IsActive;
  unsigned int v16 = -[BLSHBacklightStateMachine activeOnAPAwakeAssertionIsActive]((os_unfair_lock_s *)self);
  if ((v15 & v16) != 1)
  {
    unsigned int v23 = v16;
    id v19 = bls_backlight_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v25 = 134219010;
      __int16 v26 = self;
      __int16 v27 = 1024;
      *(_DWORD *)__int16 v28 = v15;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v23;
      *(_WORD *)&v28[10] = 2114;
      *(void *)&v28[12] = v4;
      *(_WORD *)&v28[20] = 2114;
      *(void *)&v28[22] = v8;
      BOOL v20 = "BSM:%p (no longer active) unexpected system sleep - isActive:%{BOOL}u activeOnAPAssertion:%{BOOL}u – will no"
            "t send request:%{public}@ %{public}@";
      double v21 = v19;
      uint32_t v22 = 44;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  char v17 = [v8 isAwakeOrAbortingSleep];
  id v18 = bls_backlight_log();
  id v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v25 = 134218498;
      __int16 v26 = self;
      __int16 v27 = 2114;
      *(void *)__int16 v28 = v4;
      *(_WORD *)&v28[8] = 2114;
      *(void *)&v28[10] = v8;
      BOOL v20 = "BSM:%p (sleep not requested) unexpected system sleep – will not send request:%{public}@ %{public}@";
LABEL_17:
      double v21 = v19;
      uint32_t v22 = 32;
LABEL_20:
      _os_log_impl(&dword_21FCFC000, v21, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v25, v22);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v25 = 134218498;
    __int16 v26 = self;
    __int16 v27 = 2114;
    *(void *)__int16 v28 = v4;
    *(_WORD *)&v28[8] = 2114;
    *(void *)&v28[10] = v8;
    _os_log_error_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_ERROR, "BSM:%p unexpected system sleep - will deactivate backlight with request:%{public}@ %{public}@", (uint8_t *)&v25, 0x20u);
  }

  id v24 = [(BLSHBacklightStateMachine *)self performChangeRequest:v4];
LABEL_22:
}

- (void)systemSleepAction:(id)a3 systemWillWakeForReason:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  os_log_type_t v6 = (void (**)(void))MEMORY[0x223C5E2B0](self->_lock_sleepActionCompletion);
  id lock_sleepActionCompletion = self->_lock_sleepActionCompletion;
  self->_id lock_sleepActionCompletion = 0;

  [(BSInvalidatable *)self->_lock_unexpectedSleepDebounceTimer invalidate];
  lock_unexpectedSleepDebounceTimer = self->_lock_unexpectedSleepDebounceTimer;
  self->_lock_unexpectedSleepDebounceTimer = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    int v9 = bls_backlight_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [(BLSHOSInterfaceProviding *)self->_osInterfaceProvider systemSleepMonitor];
      id v11 = [v10 aggregateState];
      int v12 = 134218498;
      BOOL v13 = self;
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2114;
      char v17 = v11;
      _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_INFO, "BSM:%p (will not sleep - %@) unexpected system sleep - will not send request %{public}@", (uint8_t *)&v12, 0x20u);
    }
    v6[2](v6);
  }
}

- (BLSHBacklightHostTelemetryDelegate)telemetryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_telemetryDelegate);

  return (BLSHBacklightHostTelemetryDelegate *)WeakRetained;
}

- (void)setTelemetryDelegate:(id)a3
{
}

- (BLSBacklightChangeEvent)activeTransitionEvent
{
  return self->_activeTransitionEvent;
}

- (BLSHBacklightStateMachineEventPerforming)eventPerformer
{
  return self->_eventPerformer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPerformer, 0);
  objc_storeStrong((id *)&self->_activeTransitionEvent, 0);
  objc_destroyWeak((id *)&self->_telemetryDelegate);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_activeOnAPAwakeTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_lock_performEventAPAwakeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_unexpectedSleepDebounceTimer, 0);
  objc_storeStrong((id *)&self->_lock_activeOnAPAwakeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_transitioningEvent, 0);
  objc_storeStrong(&self->_lock_sleepActionCompletion, 0);
  objc_storeStrong((id *)&self->_sleepAction, 0);

  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
}

- (void)registerHandlersForService:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHandlersForService:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)endSuppressionServiceWithExplanation:(const char *)a1 logBlock:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)systemSleepAction:(uint64_t)a1 performWithCompletion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "BSM:%p system sleep while acquiring system activity, did not deactivate backlight", (uint8_t *)&v2, 0xCu);
}

@end