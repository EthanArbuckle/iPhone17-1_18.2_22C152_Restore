@interface BLSHBacklightTransitionStateMachine
- (BLSHBacklightDisplayStateMachine)displayStateMachine;
- (BLSHBacklightHostObserving)performerDelegate;
- (BLSHBacklightInactiveEnvironmentSession)session;
- (BLSHBacklightMutableTargetState)withLock_ensureTargetStateCreated;
- (BLSHBacklightPlatformProvider)platformProvider;
- (BLSHBacklightTransitionStateMachine)initWithPlatformProvider:(id)a3 osInterfaceProvider:(id)a4 inactiveBudgetPolicy:(id)a5;
- (BLSHPendingEnvironmentUpdateOperation)onMainWithLock_environmentUpdateOperationForEvents:(BLSHPendingEnvironmentUpdateOperation *)a1;
- (BOOL)deviceSupportsAlwaysOn;
- (BOOL)globalCacheFlipbookOnDisplayWake;
- (BOOL)hasEnsureFlipbookCurrent;
- (BOOL)hostEnvironment:(id)a3 didAmendSceneSettings:(id)a4;
- (BOOL)isAlwaysOnEnabled;
- (BOOL)isAlwaysOnSuppressed;
- (BOOL)isFlipbookDisabled;
- (BOOL)isGlobalHighLuminanceAlwaysOn;
- (BOOL)isGlobalUnrestrictedFramerate;
- (BOOL)isTransitioning;
- (BOOL)safeToUnblank;
- (BOOL)willUnblankTransitioningToDisplayMode:(uint64_t)a1;
- (BOOL)withLock_isTransitioning;
- (NSString)backlightStateDescription;
- (NSString)debugDescription;
- (NSString)description;
- (char)onMainWithLock_performEventOperationIfNeededWhenBeforeDisplayBlankingChange:(id *)a1;
- (id)_lock_ensureFlipbookCurrent;
- (id)abortContextForTimer:(id)a3;
- (id)allFlipbookFrames;
- (id)frameOnGlassNow;
- (id)frameOnGlassWhenFlipbookLastCancelled;
- (id)frameWithUUID:(id)a3;
- (id)identifier;
- (id)lock_displayOperationForTarget:(uint64_t)a3 isNullOperationAllowed:;
- (id)onMainWithLock_environmentPerformUpdateIfNeededAfterDisplayUpdate;
- (id)onMainWithLock_environmentPerformUpdateIfNeededBeforeDisplayUpdate;
- (id)onMainWithLock_onScreenSpecifierForDisplayMode:(uint64_t)a1;
- (id)onMainWithLock_updateDisplayOrEngineOperationIfNeeded;
- (id)onMainWithLock_updatePresentationOperationIfNeeded;
- (id)onMainWithLock_updateSpecifierOperationIfNeeded;
- (id)osInterfaceProvider;
- (id)setupRampOperationIfNeeded;
- (id)withLock_backlightStateDescription;
- (id)withLock_debugDescription;
- (int64_t)backlightDisplayMode;
- (int64_t)backlightState;
- (int64_t)flipbookState;
- (uint64_t)_lock_updateCacheFlipbookWithSession:(uint64_t)a1;
- (uint64_t)createSession;
- (uint64_t)flipbookStateForEngine;
- (uint64_t)hasUnrestrictedFramerateWithSession:(uint64_t)a1;
- (uint64_t)lock_displayModeForBacklightState:(uint64_t)result;
- (uint64_t)lock_isHighLuminanceAlwaysOnWithSession:(uint64_t)a1;
- (uint64_t)setDisplayMode:(uint64_t)result withRampDuration:;
- (unint64_t)backlightStateChangeTimestamp;
- (void)_lock_enqueueNewEvent:(id *)a1;
- (void)_lock_ensureFlipbookCurrent;
- (void)_lock_setPendingUpdateDisplayMode:(uint64_t)a1;
- (void)acquireTouchLockAssertion;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)destroySession;
- (void)displayState:(id)a3 didUpdateToMode:(int64_t)a4;
- (void)environmentStateMachine:(id)a3 didBeginUpdateToState:(int64_t)a4;
- (void)environmentStateMachine:(id)a3 didCompleteUpdateToState:(int64_t)a4;
- (void)environmentStateMachine:(id)a3 didUpdateToPresentation:(id)a4;
- (void)environmentStateMachine:(id)a3 didUpdateToSpecifier:(id)a4;
- (void)environmentStateMachineDidBeginUpdateToState:(uint64_t)a1;
- (void)environmentStateMachineDidCompleteUpdateToState:(uint64_t)a1;
- (void)hostEnvironment:(id)a3 hostDidSetAlwaysOnEnabledForEnvironment:(BOOL)a4;
- (void)hostEnvironment:(id)a3 hostDidSetCacheFlipbookOnDisplayWake:(BOOL)a4;
- (void)hostEnvironment:(id)a3 hostDidSetLiveUpdating:(BOOL)a4;
- (void)hostEnvironment:(id)a3 hostDidSetUnrestrictedFramerateUpdates:(BOOL)a4;
- (void)ifStillValidPerformAlwaysOnBrightnessRamp:(double)a3 withDuration:;
- (void)inactiveEnvironmentSession:(id)a3 updateToPresentation:(id)a4;
- (void)invalidateTouchLockAssertion;
- (void)lock_displayOperationForCurrentTarget;
- (void)logForPerformEvent:(void *)a3 currentState:(void *)a4 targetState:(int)a5 matchesPrewarm:(void *)a6 pendingPrewarmedEvent:;
- (void)onMainWithLock_stopPresentationEngineIfNeededForDisplayMode:(uint64_t)a1;
- (void)onMainWithLock_updateDisplayOrEngineOperationIfNeeded;
- (void)onMainWithLock_updatePresentationOperationIfNeeded;
- (void)onMainWithLock_updateSpecifierOperationIfNeeded;
- (void)onMain_ensureSessionCreated;
- (void)onMain_performEvent:(uint64_t)a1;
- (void)onMain_performNextStepInTransition;
- (void)onMain_setDisplayMode:(double)a3 withRampDuration:;
- (void)onMain_updateHostEnvironmentAndPerformNextStep:(uint64_t)a1;
- (void)performEvent:(id)a3;
- (void)presentationEngine:(id)a3 didInvalidateContentForEnvironment:(id)a4 reason:(id)a5;
- (void)presentationEngine:(id)a3 didUpdateToCurrentWithSpecifier:(id)a4;
- (void)prewarmEvent:(id)a3;
- (void)registerHandlersForService:(id)a3;
- (void)releaseTransitionAPAwakeAssertion;
- (void)setAlwaysOnSuppressed:(BOOL)a3;
- (void)setFlipbookDisabled:(BOOL)a3;
- (void)setGlobalCacheFlipbookOnDisplayWake:(BOOL)a3;
- (void)setGlobalHighLuminanceAlwaysOn:(BOOL)a3;
- (void)setGlobalUnrestrictedFramerate:(BOOL)a3;
- (void)setPerformerDelegate:(id)a3;
- (void)setSafeToUnblank:(BOOL)a3;
- (void)updateTargetAndPerformNextStepForUnrestrictedFramerateChangeWithEnvironment:(uint64_t)a1;
- (void)withLock_acquireTransitionAPAwakeAssertion;
- (void)withLock_ensureTargetStateCreated;
@end

@implementation BLSHBacklightTransitionStateMachine

- (int64_t)backlightState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_backlightState = self->_lock_backlightState;
  os_unfair_lock_unlock(p_lock);
  return lock_backlightState;
}

- (BLSHBacklightTransitionStateMachine)initWithPlatformProvider:(id)a3 osInterfaceProvider:(id)a4 inactiveBudgetPolicy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v42.receiver = self;
  v42.super_class = (Class)BLSHBacklightTransitionStateMachine;
  v12 = [(BLSHBacklightTransitionStateMachine *)&v42 init];
  v13 = v12;
  if (!v12)
  {
LABEL_14:

    return v13;
  }
  v12->_lock._os_unfair_lock_opaque = 0;
  v12->_lock_safeToUnblank = 1;
  objc_storeStrong((id *)&v12->_platformProvider, a3);
  objc_storeStrong((id *)&v13->_inactiveBudgetPolicy, a5);
  objc_storeStrong((id *)&v13->_osInterfaceProvider, a4);
  v14 = [[BLSHBacklightDisplayStateMachine alloc] initWithDelegate:v13 platformProvider:v9 osInterfaceProvider:v10];
  displayStateMachine = v13->_displayStateMachine;
  v13->_displayStateMachine = v14;

  uint64_t v16 = [MEMORY[0x263EFF980] array];
  lock_queuedEventsToPerform = v13->_lock_queuedEventsToPerform;
  v13->_lock_queuedEventsToPerform = (NSMutableArray *)v16;

  uint64_t v18 = [MEMORY[0x263EFF980] array];
  lock_activeEvents = v13->_lock_activeEvents;
  v13->_lock_activeEvents = (NSMutableArray *)v18;

  uint64_t v20 = [MEMORY[0x263EFF980] array];
  lock_abortedEvents = v13->_lock_abortedEvents;
  v13->_lock_abortedEvents = (NSMutableArray *)v20;

  v13->_flipbookSupported = [v10 deviceSupportsAlwaysOnFlipbook];
  if ([v10 deviceSupportsAlwaysOn])
  {
    v22 = [[BLSHAlwaysOnPresentationEngine alloc] initWithDelegate:v13 platformProvider:v9 osInterfaceProvider:v10 inactiveBudgetPolicy:v11];
    alwaysOnPresentationEngine = v13->_alwaysOnPresentationEngine;
    v13->_alwaysOnPresentationEngine = v22;
  }
  v13->_lastSteadyStateFlipbookState = -[BLSHBacklightTransitionStateMachine flipbookStateForEngine]((uint64_t)v13);
  if (![(BLSHAlwaysOnPresentationEngine *)v13->_alwaysOnPresentationEngine engineState])
  {
    uint64_t v24 = [(BLSHBacklightDisplayStateMachine *)v13->_displayStateMachine displayMode];
    uint64_t v25 = 0;
    switch(v24)
    {
      case 0:
      case 5:
        goto LABEL_10;
      case 1:
        id v26 = [(BLSHAlwaysOnPresentationEngine *)v13->_alwaysOnPresentationEngine suppressForReason:@"flipbookSuppressedOnInit"];
        uint64_t v25 = 0;
        goto LABEL_10;
      case 2:
      case 3:
        uint64_t v25 = 1;
        goto LABEL_10;
      case 4:
        uint64_t v25 = 2;
        goto LABEL_10;
      case 6:
        uint64_t v25 = 3;
LABEL_10:
        v13->_int64_t lock_backlightState = v25;
        break;
      default:
        break;
    }
    v13->_backlightStateChangeTimestamp = mach_continuous_time();
    v27 = [[BLSHBacklightAggregateState alloc] initWithDisplayModeSource:v13->_displayStateMachine];
    currentState = v13->_currentState;
    v13->_currentState = v27;

    uint64_t v29 = [(BLSHBacklightAggregateState *)v13->_currentState displayMode];
    v13->_lock_lastNotifiedTargetDisplayMode = v29;
    v13->_lock_lastNotifiedCompletedDisplayMode = v29;
    objc_initWeak(&location, v13);
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    v38 = __105__BLSHBacklightTransitionStateMachine_initWithPlatformProvider_osInterfaceProvider_inactiveBudgetPolicy___block_invoke;
    v39 = &unk_264532938;
    objc_copyWeak(&v40, &location);
    v13->_stateHandler = os_state_add_handler();
    +[BLSHBacklightFBSceneHostEnvironment setAmendSceneSettingsDelegate:v13];
    if ((BLSBacklightStateIsActive() & 1) == 0)
    {
      -[BLSHBacklightTransitionStateMachine acquireTouchLockAssertion]((uint64_t)v13);
      -[BLSHBacklightTransitionStateMachine createSession]((uint64_t)v13);
      v30 = -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated]((uint64_t)v13);
      objc_msgSend(v30, "setDisplayMode:", -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:]((uint64_t)v13, v13->_lock_backlightState));
      [(BLSHBacklightEnvironmentStateMachine *)v13->_environmentStateMachine updateAllEnvironmentsInPresentation];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __105__BLSHBacklightTransitionStateMachine_initWithPlatformProvider_osInterfaceProvider_inactiveBudgetPolicy___block_invoke_2;
      block[3] = &unk_264532258;
      v35 = v13;
      v31 = (void *)MEMORY[0x263EF83A0];
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  v33 = [NSString stringWithFormat:@"presentationEngine:%@ is not stopped on intitialization", v13->_alwaysOnPresentationEngine];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[BLSHBacklightTransitionStateMachine initWithPlatformProvider:osInterfaceProvider:inactiveBudgetPolicy:]();
  }
  [v33 UTF8String];
  result = (BLSHBacklightTransitionStateMachine *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (uint64_t)flipbookStateForEngine
{
  if (result)
  {
    uint64_t v1 = result;
    result = [*(id *)(result + 40) engineState];
    if (result)
    {
      unint64_t v2 = result;
      if ([*(id *)(v1 + 40) isSuppressed])
      {
        if (BLSBacklightStateIsActive()) {
          return 2;
        }
        else {
          return 3;
        }
      }
      else if (v2 > 4)
      {
        return 0;
      }
      else
      {
        return qword_21FD8B440[v2 - 1];
      }
    }
  }
  return result;
}

uint64_t __105__BLSHBacklightTransitionStateMachine_initWithPlatformProvider_osInterfaceProvider_inactiveBudgetPolicy___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = [WeakRetained debugDescription];
  uint64_t v3 = BLSStateDataWithTitleDescriptionAndHints();

  return v3;
}

- (void)acquireTouchLockAssertion
{
  v12[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    uint64_t v3 = *(void **)(a1 + 56);
    if (v3)
    {
      char v4 = [v3 isActive];
      os_unfair_lock_unlock(v2);
      if (v4) {
        return;
      }
    }
    else
    {
      os_unfair_lock_unlock(v2);
    }
    v5 = (void *)MEMORY[0x263F29960];
    v6 = [MEMORY[0x263F29AD0] touchLock];
    v12[0] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    v8 = [v5 acquireWithExplanation:@"inactiveBacklight" observer:0 attributes:v7];

    os_unfair_lock_lock(v2);
    id v9 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v8;
    id v10 = v8;
    id v11 = v9;

    os_unfair_lock_unlock(v2);
    [v11 invalidate];
  }
}

- (uint64_t)createSession
{
  if (result) {
    return BSDispatchMain();
  }
  return result;
}

- (BLSHBacklightMutableTargetState)withLock_ensureTargetStateCreated
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t v2 = (BLSHBacklightMutableTargetState *)*(id *)(a1 + 160);
    if (!v2)
    {
      v8 = [[BLSHBacklightMutableTargetState alloc] initWithState:*(void *)(a1 + 152)];
      id v9 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v8;

      uint64_t v3 = v8;
      v7 = bls_backlight_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        [(BLSHBacklightTransitionStateMachine *)a1 withLock_ensureTargetStateCreated];
      }
      goto LABEL_10;
    }
    uint64_t v3 = v2;
    char v4 = [(BLSHBacklightMutableTargetState *)v2 presentation];

    if (!v4)
    {
      v5 = [*(id *)(a1 + 152) presentation];

      if (v5)
      {
        v6 = bls_backlight_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = *(void *)(a1 + 152);
          int v12 = 134218498;
          uint64_t v13 = a1;
          __int16 v14 = 2114;
          v15 = v3;
          __int16 v16 = 2114;
          uint64_t v17 = v11;
          _os_log_error_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_ERROR, "TSM:%p nil target presentation, will adopt from current state — target:%{public}@ current:%{public}@", (uint8_t *)&v12, 0x20u);
        }

        v7 = [*(id *)(a1 + 152) presentation];
        [(BLSHBacklightMutableTargetState *)v3 setPresentation:v7];
LABEL_10:
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)lock_displayModeForBacklightState:(uint64_t)result
{
  if (result)
  {
    if (a2 == 3)
    {
      return 6;
    }
    else if (a2 == 1)
    {
      if (*(unsigned char *)(result + 231))
      {
        unint64_t v2 = [NSString stringWithFormat:@"unexpectedly wants suppression when backlightState:BLSBacklightStateInactiveOn"];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:]();
        }
        [v2 UTF8String];
        result = _bs_set_crash_log_message();
        __break(0);
      }
      else if (!*(unsigned char *)(result + 224) {
             || *(unsigned char *)(result + 242)
      }
             || *(unsigned char *)(result + 240)
             || -[BLSHBacklightTransitionStateMachine hasUnrestrictedFramerateWithSession:](result, *(void **)(result + 144)))
      {
        return 3;
      }
      else
      {
        return 2;
      }
    }
    else if (a2)
    {
      return 4;
    }
    else
    {
      return *(unsigned __int8 *)(result + 231);
    }
  }
  return result;
}

void __105__BLSHBacklightTransitionStateMachine_initWithPlatformProvider_osInterfaceProvider_inactiveBudgetPolicy___block_invoke_2(uint64_t a1)
{
}

- (void)onMain_performNextStepInTransition
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "TSM:%p got operation: %{public}@");
}

- (void)dealloc
{
  +[BLSHBacklightFBSceneHostEnvironment setAmendSceneSettingsDelegate:0];
  -[BLSHBacklightTransitionStateMachine invalidateTouchLockAssertion]((uint64_t)self);
  if (self->_stateHandler) {
    os_state_remove_handler();
  }
  v3.receiver = self;
  v3.super_class = (Class)BLSHBacklightTransitionStateMachine;
  [(BLSHBacklightTransitionStateMachine *)&v3 dealloc];
}

- (void)invalidateTouchLockAssertion
{
  if (a1)
  {
    unint64_t v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_super v3 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;
    id v4 = v3;

    os_unfair_lock_unlock(v2);
    [v4 invalidate];
  }
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  v5 = -[BLSHBacklightTransitionStateMachine withLock_backlightStateDescription]((uint64_t)self);
  id v6 = (id)[v4 appendObject:v5 withName:@"backlightState"];

  v7 = NSStringFromBLSFlipbookState();
  id v8 = (id)[v4 appendObject:v7 withName:@"flipbookState"];

  id v9 = (id)[v4 appendBool:self->_lock_safeToUnblank withName:@"safeToUnblank" ifEqualTo:0];
  id v10 = (id)[v4 appendObject:self->_currentState withName:@"currentState"];
  id v11 = (id)[v4 appendObject:self->_lock_targetState withName:@"targetState"];
  id v12 = (id)[v4 appendBool:self->_flipbookSupported withName:@"fb" ifEqualTo:0];
  id v13 = (id)[v4 appendPointer:self->_lock_pendingEnvironmentUpdate withName:@"pendingEventToPerform"];
  id v14 = (id)[v4 appendPointer:self->_lock_pendingUpdateDisplayMode withName:@"pendingUpdateDisplayMode"];
  id v15 = (id)[v4 appendPointer:self->_lock_pendingUpdatePresentation withName:@"pendingUpdatePresentation"];
  id v16 = (id)[v4 appendPointer:self->_lock_pendingUpdateToSpecifier withName:@"pendingUpdateToSpecifier"];
  id v17 = (id)[v4 appendPointer:self->_lock_ensureFlipbookCurrentOperation withName:@"ensureFlipbookCurrentOperation"];
  uint64_t v18 = NSStringFromBLSBacklightChangeEvents();
  [v4 appendString:v18 withName:@"queuedEvents"];

  v19 = [v4 build];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v19;
}

- (id)withLock_backlightStateDescription
{
  if (a1)
  {
    unint64_t v2 = NSString;
    if (-[BLSHBacklightTransitionStateMachine withLock_isTransitioning](a1)) {
      objc_super v3 = "transitioning to ";
    }
    else {
      objc_super v3 = "";
    }
    id v4 = NSStringFromBLSBacklightState();
    v5 = [MEMORY[0x263F29C30] sharedInstance];
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    id v6 = objc_msgSend(v5, "formatDuration:");
    id v7 = objc_alloc(MEMORY[0x263EFF910]);
    id v8 = objc_msgSend(v7, "bls_initWithMachContinuousTime:", *(void *)(a1 + 80));
    id v9 = objc_msgSend(v8, "bls_shortLoggingString");
    id v10 = [v2 stringWithFormat:@"%s%@ for %@ since %@", v3, v4, v6, v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[BLSHBacklightTransitionStateMachine withLock_debugDescription]((id *)&self->super.isa);
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (id)withLock_debugDescription
{
  os_log_t v1 = a1;
  if (a1)
  {
    unint64_t v2 = [MEMORY[0x263F29C40] builderWithObject:a1];
    objc_super v3 = -[BLSHBacklightTransitionStateMachine withLock_backlightStateDescription]((uint64_t)v1);
    id v4 = (id)[v2 appendObject:v3 withName:@"backlightState"];

    v5 = NSStringFromBLSFlipbookState();
    id v6 = (id)[v2 appendObject:v5 withName:@"flipbookState"];

    -[BLSHBacklightTransitionStateMachine flipbookStateForEngine]((uint64_t)v1);
    id v7 = NSStringFromBLSFlipbookState();
    id v8 = (id)[v2 appendObject:v7 withName:@"flipbookState (immediate-engine)"];

    id v9 = (id)[v2 appendBool:*((unsigned __int8 *)v1 + 243) withName:@"safeToUnblank" ifEqualTo:0];
    id v10 = [v1[19] debugDescription];
    id v11 = (id)[v2 appendObject:v10 withName:@"currentState"];

    id v12 = [v1[20] debugDescription];
    id v13 = (id)[v2 appendObject:v12 withName:@"targetState"];

    id v14 = [v1[13] debugDescription];
    id v15 = (id)[v2 appendObject:v14 withName:@"pendingEventToPerform"];

    id v16 = [v1[16] debugDescription];
    id v17 = (id)[v2 appendObject:v16 withName:@"pendingUpdateDisplayMode"];

    uint64_t v18 = [v1[14] debugDescription];
    id v19 = (id)[v2 appendObject:v18 withName:@"pendingUpdatePresentation"];

    uint64_t v20 = [v1[15] debugDescription];
    id v21 = (id)[v2 appendObject:v20 withName:@"pendingUpdateToSpecifier"];

    v22 = [v1[17] debugDescription];
    id v23 = (id)[v2 appendObject:v22 withName:@"ensureFlipbookCurrentOperation"];

    uint64_t v24 = [v1[22] debugDescription];
    id v25 = (id)[v2 appendObject:v24 withName:@"queuedEvents"];

    id v26 = [v1[21] debugDescription];
    id v27 = (id)[v2 appendObject:v26 withName:@"pendingPrewarmedEvent"];

    os_log_t v1 = [v2 build];
  }

  return v1;
}

- (void)registerHandlersForService:(id)a3
{
  id v12 = a3;
  uint64_t v4 = +[BLSHDisableFlipbookAttributeHandler registerHandlerForService:provider:](BLSHDisableFlipbookAttributeHandler, "registerHandlerForService:provider:");
  if (!v4)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightTransitionStateMachine registerHandlersForService:]();
    }
LABEL_19:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD54F08);
  }
  v5 = (void *)v4;
  id v6 = +[BLSHGlobalUnrestrictedFramerateAttributeHandler registerHandlerForService:v12 provider:self];

  if (!v6)
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightTransitionStateMachine registerHandlersForService:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD54F6CLL);
  }
  id v7 = +[BLSHGlobalHighLuminanceAlwaysOnAttributeHandler registerHandlerForService:v12 provider:self];

  if (!v7)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightTransitionStateMachine registerHandlersForService:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD54FD0);
  }
  id v8 = +[BLSHGlobalCacheFlipbookOnDisplayWakeAttributeHandler registerHandlerForService:v12 provider:self];

  if (!v8)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightTransitionStateMachine registerHandlersForService:].cold.4();
    }
    goto LABEL_19;
  }
  [(BLSHAlwaysOnPresentationEngine *)self->_alwaysOnPresentationEngine registerHandlersForService:v12];
}

- (int64_t)flipbookState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lastSteadyStateFlipbookState = self->_lastSteadyStateFlipbookState;
  os_unfair_lock_unlock(p_lock);
  return lastSteadyStateFlipbookState;
}

- (BLSHBacklightInactiveEnvironmentSession)session
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_session;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (int64_t)backlightDisplayMode
{
  return self->_lock_lastNotifiedCompletedDisplayMode;
}

- (unint64_t)backlightStateChangeTimestamp
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t backlightStateChangeTimestamp = self->_backlightStateChangeTimestamp;
  os_unfair_lock_unlock(p_lock);
  return backlightStateChangeTimestamp;
}

- (NSString)backlightStateDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = -[BLSHBacklightTransitionStateMachine withLock_backlightStateDescription]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (BOOL)withLock_isTransitioning
{
  if (result) {
    return *(void *)(result + 104)
  }
        || *(void *)(result + 112)
        || *(void *)(result + 120)
        || *(void *)(result + 128)
        || *(void *)(result + 136)
        || [*(id *)(result + 176) count] != 0;
  return result;
}

- (BOOL)isAlwaysOnSuppressed
{
  unint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysOnSuppressed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysOnSuppressed:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_alwaysOnSuppressed = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isTransitioning
{
  unint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[BLSHBacklightTransitionStateMachine withLock_isTransitioning]((BOOL)v2);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAlwaysOnEnabled
{
  uint64_t v4 = [NSString stringWithFormat:@"Shouldn't be called"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BLSHBacklightTransitionStateMachine.m";
    __int16 v17 = 1024;
    int v18 = 356;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  BOOL result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)deviceSupportsAlwaysOn
{
  uint64_t v4 = [NSString stringWithFormat:@"Shouldn't be called"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BLSHBacklightTransitionStateMachine.m";
    __int16 v17 = 1024;
    int v18 = 362;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  BOOL result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)safeToUnblank
{
  unint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_safeToUnblank;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSafeToUnblank:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_safeToUnblank = self->_lock_safeToUnblank;
  self->_int lock_safeToUnblank = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_safeToUnblank != v3 && v3 != 0) {
    BSDispatchMain();
  }
}

void __56__BLSHBacklightTransitionStateMachine_setSafeToUnblank___block_invoke(uint64_t a1)
{
}

- (BLSHBacklightHostObserving)performerDelegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_performerDelegate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPerformerDelegate:(id)a3
{
  uint64_t v4 = (BLSHBacklightHostObserving *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_performerDelegate = self->_lock_performerDelegate;
  self->_lock_performerDelegate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

void __52__BLSHBacklightTransitionStateMachine_createSession__block_invoke(uint64_t a1)
{
}

- (void)onMain_ensureSessionCreated
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  unint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (uint64_t)_lock_updateCacheFlipbookWithSession:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    int v5 = *(unsigned __int8 *)(a1 + 229);
    if (*(unsigned char *)(a1 + 228))
    {
      uint64_t v6 = 1;
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v7 = objc_msgSend(v3, "presentation", 0);
      uint64_t v8 = [v7 presentationEntries];

      uint64_t v6 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v6)
      {
        uint64_t v9 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v22 != v9) {
              objc_enumerationMutation(v8);
            }
            __int16 v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v12 = [v11 environment];
            int v13 = BLSCacheFlipbookOnDisplayWakeForEnvironment(v12);

            if (v13)
            {
              id v14 = bls_backlight_log();
              __int16 v15 = v14;
              if (v5) {
                os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
              }
              else {
                os_log_type_t v16 = OS_LOG_TYPE_INFO;
              }
              if (os_log_type_enabled(v14, v16))
              {
                __int16 v17 = [v11 environment];
                int v18 = [v17 identifier];
                *(_DWORD *)buf = 134218242;
                uint64_t v26 = a1;
                __int16 v27 = 2114;
                v28 = v18;
                _os_log_impl(&dword_21FCFC000, v15, v16, "TSM:%p cacheFlipbook:YES for %{public}@", buf, 0x16u);
              }
              uint64_t v6 = 1;
              goto LABEL_19;
            }
          }
          uint64_t v6 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_19:
    }
    if (v5 == v6)
    {
      a1 = 0;
    }
    else
    {
      __int16 v19 = bls_backlight_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v26 = a1;
        __int16 v27 = 1024;
        LODWORD(v28) = v6;
        _os_log_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_INFO, "TSM:%p new cacheFlipbook:%{BOOL}u", buf, 0x12u);
      }

      *(unsigned char *)(a1 + 229) = v6;
      [*(id *)(a1 + 40) setCacheFlipbook:v6];
      a1 = 1;
    }
  }

  return a1;
}

- (uint64_t)lock_isHighLuminanceAlwaysOnWithSession:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 241))
    {
      a1 = 1;
    }
    else
    {
      int v5 = [v3 presentation];
      a1 = [v5 isHighLuminanceAlwaysOn];
    }
  }

  return a1;
}

- (void)destroySession
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v3 = *(id *)(a1 + 144);
    uint64_t v4 = bls_backlight_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = [*(id *)(a1 + 32) presentation];
      int v11 = 134218498;
      uint64_t v12 = a1;
      __int16 v13 = 2048;
      id v14 = v3;
      __int16 v15 = 2114;
      os_log_type_t v16 = v5;
      _os_log_impl(&dword_21FCFC000, v4, OS_LOG_TYPE_INFO, "TSM:%p destroy session:%p with current presentation:%{public}@", (uint8_t *)&v11, 0x20u);
    }
    [v3 setUpdater:0];
    uint64_t v6 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = 0;

    [*(id *)(a1 + 152) setPresentationSource:0];
    uint64_t v7 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
    id v8 = v7;

    uint64_t v9 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = 0;

    os_unfair_lock_unlock(v2);
    [v3 sessionDidEnd];
    [v8 invalidate];
    id v10 = (id)[*(id *)(a1 + 40) stopForReason:@"destroySession"];
    [*(id *)(a1 + 40) purgeFlipbook];
  }
}

- (uint64_t)hasUnrestrictedFramerateWithSession:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (v3)
    {
      int v5 = [v3 presentation];
      a1 = [v5 hasUnrestrictedFramerateUpdates];
    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

- (void)withLock_acquireTransitionAPAwakeAssertion
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "TSM:%p already have transition system activity assertion %{public}@");
}

uint64_t __81__BLSHBacklightTransitionStateMachine_withLock_acquireTransitionAPAwakeAssertion__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAcquireWaitsToAbortSleepRequested:0];
}

void __81__BLSHBacklightTransitionStateMachine_withLock_acquireTransitionAPAwakeAssertion__block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
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
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    uint64_t v13 = v12;
    id v14 = objc_msgSend(v7, "bls_loggingString");
    int v15 = 134218754;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    uint64_t v18 = v13;
    __int16 v19 = 2114;
    id v20 = v8;
    __int16 v21 = 2114;
    long long v22 = v14;
    _os_log_impl(&dword_21FCFC000, v9, v10, "TSM:%p transition system activity assertion callback elapsed:%.4lfs details:%{public}@ error:%{public}@", (uint8_t *)&v15, 0x2Au);
  }
}

- (void)releaseTransitionAPAwakeAssertion
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "TSM:%p dropping transition system activity assertion %{public}@");
}

- (BOOL)isFlipbookDisabled
{
  unint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_flipbookDisabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFlipbookDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v6 = self->_lock_flipbookDisabled != v3 && self->_lock_backlightState == 1;
  self->_lock_flipbookDisabled = v3;
  if (self->_lock_targetState)
  {
    unint64_t v7 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:]((uint64_t)self, self->_lock_backlightState);
    id v8 = bls_backlight_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = NSStringFromBLSBacklightDisplayMode(v7);
      lock_targetState = self->_lock_targetState;
      *(_DWORD *)buf = 134218754;
      uint64_t v12 = self;
      __int16 v13 = 1024;
      BOOL v14 = v3;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = lock_targetState;
      _os_log_debug_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_DEBUG, "TSM:%p setFlipbookDisabled:%{BOOL}u targetDisplayMode:%{public}@ previousTarget:%{public}@", buf, 0x26u);
    }
    [(BLSHBacklightMutableTargetState *)self->_lock_targetState setDisplayMode:v7];
  }
  os_unfair_lock_unlock(p_lock);
  if (v6) {
    BSDispatchMain();
  }
}

void __59__BLSHBacklightTransitionStateMachine_setFlipbookDisabled___block_invoke(uint64_t a1)
{
}

- (void)performEvent:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __52__BLSHBacklightTransitionStateMachine_performEvent___block_invoke(uint64_t a1)
{
}

- (void)onMain_performEvent:(uint64_t)a1
{
  id v13 = a2;
  if (!a1) {
    goto LABEL_15;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  uint64_t v3 = [v13 state];
  id v4 = *(id *)(a1 + 168);
  *(void *)(a1 + 168) = 0;

  if (*(unsigned char *)(a1 + 227)) {
    char v5 = 0;
  }
  else {
    char v5 = [v13 isTransitionForcedUnanimated];
  }
  *(unsigned char *)(a1 + 226) = v5;
  -[BLSHBacklightTransitionStateMachine _lock_enqueueNewEvent:]((id *)a1, v13);
  uint64_t v6 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v3;
  if (v6 == v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (BLSBacklightStateIsActive()) {
      goto LABEL_10;
    }
  }
  else
  {
    *(void *)(a1 + 80) = mach_continuous_time();
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  -[BLSHBacklightTransitionStateMachine onMain_ensureSessionCreated](a1);
LABEL_10:
  BOOL v7 = v4 == v13;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  id v8 = -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated](a1);
  objc_msgSend(v8, "setDisplayMode:", -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:](a1, *(void *)(a1 + 72)));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  -[BLSHBacklightTransitionStateMachine logForPerformEvent:currentState:targetState:matchesPrewarm:pendingPrewarmedEvent:](a1, v13, *(void **)(a1 + 152), v8, v7, *(void **)(a1 + 168));
  if (v6 != v3)
  {
    if (BLSBacklightStateIsActive()) {
      -[BLSHBacklightTransitionStateMachine invalidateTouchLockAssertion](a1);
    }
    else {
      -[BLSHBacklightTransitionStateMachine acquireTouchLockAssertion](a1);
    }
  }
  [*(id *)(a1 + 48) invalidate:1];
  uint64_t v9 = *(void **)(a1 + 24);
  os_log_type_t v10 = [NSString stringWithFormat:@"TSM:%p transition to backlight state for event:%@", a1, v13];
  uint64_t v11 = [v9 scheduleWatchdogWithDelegate:a1 explanation:v10 timeout:20.0];
  uint64_t v12 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v11;

  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](a1);
LABEL_15:
}

- (void)_lock_enqueueNewEvent:(id *)a1
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 state];
    uint64_t v6 = [a1[23] firstObject];
    BOOL v7 = v6;
    if (v6 && v5 != [v6 state])
    {
      [a1[24] addObjectsFromArray:a1[23]];
      v9[0] = v4;
      id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      [a1[23] setArray:v8];
      [a1[22] setArray:v8];
    }
    else
    {
      [a1[23] addObject:v4];
      [a1[22] addObject:v4];
    }
  }
}

- (void)logForPerformEvent:(void *)a3 currentState:(void *)a4 targetState:(int)a5 matchesPrewarm:(void *)a6 pendingPrewarmedEvent:
{
  v105[1] = *MEMORY[0x263EF8340];
  id v74 = a2;
  id v11 = a3;
  id v73 = a4;
  id v71 = a6;
  if (a1)
  {
    if (!a5
      || (bls_backlight_log(),
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO),
          v12,
          v13))
    {
      int v72 = a5;
      BOOL v14 = [v11 presentation];
      __int16 v15 = [v73 presentation];
      uint64_t v16 = [v15 presentationEntries];
      unint64_t v17 = [v16 count];

      uint64_t v66 = a1;
      if (v17 >= 2)
      {
        id v18 = v11;
        uint64_t v19 = [BLSHBacklightEnvironmentPresentation alloc];
        id v20 = [v15 presentationEntries];
        __int16 v21 = [v20 firstObject];
        v105[0] = v21;
        long long v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:1];
        uint64_t v23 = [v15 flipbookContext];
        [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:20.0];
        v25 = long long v24 = v14;
        uint64_t v26 = [(BLSHBacklightEnvironmentPresentation *)v19 initWithPresentationEntries:v22 flipbookContext:v23 expirationDate:v25];

        BOOL v14 = (void *)v26;
        id v11 = v18;
      }
      __int16 v27 = [v15 differenceFromPresentation:v14];
      v28 = [v27 insertions];
      v68 = v27;
      uint64_t v29 = [v27 removals];
      uint64_t v30 = [v28 count];
      v69 = v29;
      uint64_t v31 = [v29 count];
      v32 = [v74 changeRequest];
      v33 = bls_backlight_log();
      if (v72) {
        os_log_type_t v34 = OS_LOG_TYPE_INFO;
      }
      else {
        os_log_type_t v34 = OS_LOG_TYPE_ERROR;
      }
      log = v33;
      if (!os_log_type_enabled(v33, v34)) {
        goto LABEL_32;
      }
      os_log_type_t type = v34;
      v35 = @"(unmatched prewarm event) ";
      uint64_t v36 = &stru_26D1758B0;
      if (v72) {
        v35 = &stru_26D1758B0;
      }
      v55 = v35;
      uint64_t v37 = v74;
      uint64_t v54 = [v74 eventID];
      [v74 previousState];
      NSStringFromBLSBacklightState();
      id v65 = (id)objc_claimAutoreleasedReturnValue();
      [v74 state];
      NSStringFromBLSBacklightState();
      id v64 = (id)objc_claimAutoreleasedReturnValue();
      [v32 sourceEvent];
      NSStringFromBLSBacklightChangeSourceEvent();
      id v63 = (id)objc_claimAutoreleasedReturnValue();
      v57 = v32;
      id v38 = [v32 explanation];
      id v59 = v11;
      NSStringFromBLSBacklightDisplayMode([v11 displayMode]);
      id v62 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromBLSBacklightDisplayMode([v73 displayMode]);
      v60 = v28;
      id v61 = (id)objc_claimAutoreleasedReturnValue();
      v39 = (void *)0x263F08000;
      if (v14 == v15)
      {
        if (v30) {
          goto LABEL_14;
        }
      }
      else
      {
        id v40 = NSString;
        v51 = [v14 presentationEntries];
        uint64_t v41 = [v51 count];
        v53 = [v15 presentationEntries];
        uint64_t v50 = v41;
        v28 = v60;
        objc_msgSend(v40, "stringWithFormat:", @"presentation:%p(%lu)->%p(%lu)", v14, v50, v15, objc_msgSend(v53, "count"));
        uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
LABEL_14:
          objc_super v42 = NSString;
          v52 = objc_msgSend(v28, "bs_map:", &__block_literal_global_162);
          v43 = [v42 stringWithFormat:@"\nadded %@", v52];
LABEL_17:
          v58 = v14;
          if (v31)
          {
            v44 = v43;
            v45 = NSString;
            uint64_t v37 = objc_msgSend(v69, "bs_map:", &__block_literal_global_170);
            v46 = v45;
            v43 = v44;
            v47 = [v46 stringWithFormat:@"\nremoved %@", v37];
          }
          else
          {
            v47 = &stru_26D1758B0;
          }
          objc_msgSend(v15, "bls_shortLoggingString");
          id v67 = (id)objc_claimAutoreleasedReturnValue();
          if (v72)
          {
            v48 = &stru_26D1758B0;
          }
          else
          {
            v49 = NSString;
            v39 = objc_msgSend(v71, "bls_shortLoggingString");
            v48 = [v49 stringWithFormat:@"\n%@", v39];
          }
          *(_DWORD *)buf = 134221570;
          uint64_t v76 = v66;
          __int16 v77 = 2114;
          v78 = v55;
          __int16 v79 = 2048;
          uint64_t v80 = v54;
          __int16 v81 = 2048;
          id v82 = v74;
          __int16 v83 = 2114;
          id v84 = v65;
          __int16 v85 = 2114;
          id v86 = v64;
          __int16 v87 = 2114;
          id v88 = v63;
          __int16 v89 = 2114;
          id v90 = v38;
          __int16 v91 = 2114;
          id v92 = v62;
          __int16 v93 = 2114;
          id v94 = v61;
          __int16 v95 = 2114;
          v96 = v36;
          __int16 v97 = 2114;
          v98 = v43;
          __int16 v99 = 2114;
          v100 = v47;
          __int16 v101 = 2114;
          id v102 = v67;
          __int16 v103 = 2114;
          v104 = v48;
          _os_log_impl(&dword_21FCFC000, log, type, "TSM:%p %{public}@will performEvent(%llu:%p) %{public}@->%{public}@ %{public}@:%{public}@ %{public}@->%{public}@ %{public}@%{public}@%{public}@\n%{public}@%{public}@", buf, 0x98u);
          if ((v72 & 1) == 0)
          {
          }
          if (v31)
          {
          }
          id v11 = v59;
          v28 = v60;
          if (v30)
          {
          }
          BOOL v14 = v58;
          if (v58 != v15)
          {
          }
          v32 = v57;
LABEL_32:

          goto LABEL_33;
        }
      }
      v43 = &stru_26D1758B0;
      goto LABEL_17;
    }
  }
LABEL_33:
}

id __120__BLSHBacklightTransitionStateMachine_logForPerformEvent_currentState_targetState_matchesPrewarm_pendingPrewarmedEvent___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  uint64_t v5 = [v2 stringWithFormat:@"%p:%@", v3, v4];

  return v5;
}

id __120__BLSHBacklightTransitionStateMachine_logForPerformEvent_currentState_targetState_matchesPrewarm_pendingPrewarmedEvent___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  uint64_t v5 = [v2 stringWithFormat:@"%p:%@", v3, v4];

  return v5;
}

- (void)prewarmEvent:(id)a3
{
  id v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_pendingPrewarmedEvent, a3);
  uint64_t v5 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:]((uint64_t)self, [v9 state]);
  uint64_t v6 = -[BLSHBacklightTransitionStateMachine lock_displayOperationForTarget:isNullOperationAllowed:]((uint64_t)self, v5, 0);
  if ([v6 isCompleted]) {
    [v6 last];
  }
  else {
  BOOL v7 = [v6 first];
  }
  uint64_t v8 = [v7 targetDisplayMode];
  os_unfair_lock_unlock(&self->_lock);
  [(BLSHBacklightDisplayStateMachine *)self->_displayStateMachine prewarmForDisplayMode:v8];
}

- (id)lock_displayOperationForTarget:(uint64_t)a3 isNullOperationAllowed:
{
  if (a1)
  {
    id v4 = +[BLSHPendingUpdateDisplayMode operationForUpdateFromCurrentDisplayMode:toTargetDisplayMode:withPendingOperation:abandonedInProgressOperation:isNullOperationAllowed:](BLSHPendingUpdateDisplayMode, "operationForUpdateFromCurrentDisplayMode:toTargetDisplayMode:withPendingOperation:abandonedInProgressOperation:isNullOperationAllowed:", [*(id *)(a1 + 152) displayMode], a2, *(void *)(a1 + 128), 0, a3);
    uint64_t v5 = [v4 rampOperation];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 duration];
      if (v7 == 0.0)
      {
        [*(id *)(a1 + 248) backlightFadeOutDuration];
        objc_msgSend(v6, "setDuration:");
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [NSString stringWithFormat:@"should not add observers to %@", self];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    double v7 = NSStringFromSelector(a2);
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544642;
    id v11 = v7;
    __int16 v12 = 2114;
    BOOL v13 = v9;
    __int16 v14 = 2048;
    __int16 v15 = self;
    __int16 v16 = 2114;
    unint64_t v17 = @"BLSHBacklightTransitionStateMachine.m";
    __int16 v18 = 1024;
    int v19 = 762;
    __int16 v20 = 2114;
    __int16 v21 = v6;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)onMainWithLock_stopPresentationEngineIfNeededForDisplayMode:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  id v4 = *(void **)(a1 + 40);
  if (a2 == 1)
  {
    id v5 = (id)[v4 suppressForReason:@"flipbookSuppressed"];
    goto LABEL_17;
  }
  uint64_t v6 = [v4 engineState];
  if (v6)
  {
    if (a2 == 2)
    {
      if (v6 != 1) {
        goto LABEL_17;
      }
      double v7 = *(void **)(a1 + 40);
      uint64_t v8 = @"wantFlipbookEngine";
    }
    else
    {
      if (*(void *)(a1 + 72) != 1)
      {
        os_log_type_t v10 = *(void **)(a1 + 40);
        if (*(unsigned char *)(a1 + 229)) {
          [v10 suppressForReason:@"cacheFlipbook"];
        }
        else {
        uint64_t v9 = [v10 stopForReason:@"wantStopped"];
        }
        goto LABEL_16;
      }
      if ((unint64_t)(v6 - 2) > 2) {
        goto LABEL_17;
      }
      double v7 = *(void **)(a1 + 40);
      uint64_t v8 = @"wantLiveUpdatingEngine";
    }
    uint64_t v9 = [v7 suspendForReason:v8];
LABEL_16:
    id v11 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v9;
  }
LABEL_17:
  __int16 v12 = *(void **)(a1 + 136);
  if (v12 && ([v12 isCompleted] & 1) == 0)
  {
    BOOL v13 = bls_backlight_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 136);
      __int16 v15 = NSStringFromBLSBacklightDisplayMode(a2);
      int v17 = 134218498;
      uint64_t v18 = a1;
      __int16 v19 = 2114;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      long long v22 = v15;
      _os_log_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_INFO, "TSM:%p (stopPresentationEngine) abandoning ensureFlipbookCurrentOperation %{public}@ because it's obsolete; disp"
        "layMode=%{public}@",
        (uint8_t *)&v17,
        0x20u);
    }
  }
  __int16 v16 = *(void **)(a1 + 136);
  *(void *)(a1 + 136) = 0;
}

- (id)onMainWithLock_onScreenSpecifierForDisplayMode:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a2 == 2)
    {
      id v4 = [*(id *)(a1 + 40) onGlassFlipbookFrame];
      objc_msgSend(v4, "bls_specifier");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 144) presentation];
      double v7 = [v6 currentSpecifier];

      id v5 = v7;
      id v4 = v5;
    }
    uint64_t v8 = v5;
    uint64_t v9 = bls_backlight_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v11 = NSStringFromBLSBacklightDisplayMode(a2);
      __int16 v12 = objc_msgSend(v4, "bls_shortLoggingString");
      int v13 = 134218498;
      uint64_t v14 = a1;
      __int16 v15 = 2114;
      __int16 v16 = v11;
      __int16 v17 = 2114;
      uint64_t v18 = v12;
      _os_log_debug_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_DEBUG, "TSM:%p onScreenSpecifierForDisplayMode:%{public}@ will use current:%{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)setDisplayMode:(uint64_t)result withRampDuration:
{
  if (result) {
    return BSDispatchMain();
  }
  return result;
}

void __71__BLSHBacklightTransitionStateMachine_setDisplayMode_withRampDuration___block_invoke(uint64_t a1)
{
}

- (void)onMain_setDisplayMode:(double)a3 withRampDuration:
{
  if (a1)
  {
    uint64_t v6 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    uint64_t v7 = *(void *)(a1 + 208);
    *(void *)(a1 + 208) = a2;
    id v10 = (id)[*(id *)(a1 + 184) copy];
    uint64_t v8 = (void *)[*(id *)(a1 + 192) copy];
    os_unfair_lock_unlock(v6);
    if (v7 != a2)
    {
      uint64_t v9 = [(id)a1 performerDelegate];
      [v9 backlight:a1 willUpdateToDisplayMode:a2 fromDisplayMode:v7 forEvents:v10 abortedEvents:v8];
    }
    [*(id *)(a1 + 256) setDisplayMode:a2 withRampDuration:a3];
    if (a2 != 2) {
      [*(id *)(a1 + 40) invalidateOnGlassFlipbookFrame];
    }
    [*(id *)(a1 + 40) setOnStandby:IsOffForBLSBacklightDisplayMode(a2) ^ 1];
  }
}

- (id)onMainWithLock_environmentPerformUpdateIfNeededBeforeDisplayUpdate
{
  if (a1)
  {
    -[BLSHBacklightTransitionStateMachine onMainWithLock_performEventOperationIfNeededWhenBeforeDisplayBlankingChange:](a1, 1);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (char)onMainWithLock_performEventOperationIfNeededWhenBeforeDisplayBlankingChange:(id *)a1
{
  unint64_t v2 = (char *)a1;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!a1) {
    goto LABEL_15;
  }
  if ([a1[22] count])
  {
    id v4 = [*((id *)v2 + 22) firstObject];
    if ((([v4 state] == 0) ^ a2))
    {
      id v5 = (void *)[*((id *)v2 + 22) copy];
      [*((id *)v2 + 22) removeAllObjects];
      -[BLSHBacklightTransitionStateMachine onMainWithLock_environmentUpdateOperationForEvents:]((BLSHPendingEnvironmentUpdateOperation *)v2, v5);
      unint64_t v2 = (char *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }

    goto LABEL_12;
  }
  uint64_t v6 = (id *)(v2 + 104);
  if (!*((void *)v2 + 13)) {
    goto LABEL_12;
  }
  BOOL v7 = -[BLSHBacklightTransitionStateMachine willUnblankTransitioningToDisplayMode:]((uint64_t)v2, [*((id *)v2 + 20) displayMode]);
  uint64_t v8 = (void *)*((void *)v2 + 16);
  if (v8
    && [v8 isCompleted]
    && ([*((id *)v2 + 16) isDirectRamp] & 1) == 0
    && *((void *)v2 + 20))
  {
    uint64_t v9 = [*((id *)v2 + 16) last];
    uint64_t v10 = [v9 targetDisplayMode];
    BOOL v11 = v10 == [*((id *)v2 + 20) displayMode];
  }
  else
  {
    BOOL v11 = 0;
  }
  id v14 = *v6;
  if (a2 && (v7 || v11))
  {
    if (([v14 didUpdateInitialState] & 1) == 0) {
      goto LABEL_24;
    }
LABEL_12:
    __int16 v12 = bls_backlight_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int16 v16 = NSStringFromBLSBacklightChangeEvents();
      int v17 = 134218498;
      uint64_t v18 = v2;
      __int16 v19 = 1024;
      int v20 = a2;
      __int16 v21 = 2114;
      long long v22 = v16;
      _os_log_debug_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_DEBUG, "TSM:%p (findNextOperation) no environmentPerformUpdate operation needed isBeforeDisplayBlankingChange:%{BOOL}u (queuedEvents:%{public}@})", (uint8_t *)&v17, 0x1Cu);
    }
    unint64_t v2 = 0;
    goto LABEL_15;
  }
  if ([v14 isCompleted]) {
    goto LABEL_12;
  }
LABEL_24:
  __int16 v15 = bls_backlight_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[BLSHBacklightTransitionStateMachine onMainWithLock_performEventOperationIfNeededWhenBeforeDisplayBlankingChange:]();
  }

  unint64_t v2 = (char *)*v6;
LABEL_15:

  return v2;
}

- (id)onMainWithLock_environmentPerformUpdateIfNeededAfterDisplayUpdate
{
  if (a1)
  {
    -[BLSHBacklightTransitionStateMachine onMainWithLock_performEventOperationIfNeededWhenBeforeDisplayBlankingChange:](a1, 0);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BLSHPendingEnvironmentUpdateOperation)onMainWithLock_environmentUpdateOperationForEvents:(BLSHPendingEnvironmentUpdateOperation *)a1
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    isa = a1[5].super.isa;
    if (!isa) {
      isa = a1[4]._initialSpecifier;
    }
    uint64_t v5 = [isa displayMode];
    if (v5 == 1)
    {
      uint64_t v6 = [[BLSHPendingEnvironmentUpdateOperation alloc] initWithEvents:v3 withInitialSpecifier:0];
      BOOL v7 = *(void **)&a1[3]._started;
      *(void *)&a1[3]._started = v6;

      uint64_t v8 = v6;
      [(BLSHPendingEnvironmentUpdateOperation *)v8 setStarted:1];
      [(BLSHPendingEnvironmentUpdateOperation *)v8 setUpdatedInitialState:1];
      uint64_t v9 = bls_backlight_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        NSStringFromBLSBacklightChangeEvents();
        uint64_t v10 = (BLSHPendingEnvironmentUpdateOperation *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v58 = a1;
        __int16 v59 = 2114;
        v60 = v8;
        __int16 v61 = 2114;
        id v62 = v10;
        _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) started pendingEnvironmentUpdate %{public}@, will skip environment update for -> FlipbookSuppressed events:%{public}@", buf, 0x20u);
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __90__BLSHBacklightTransitionStateMachine_onMainWithLock_environmentUpdateOperationForEvents___block_invoke;
      block[3] = &unk_2645322D0;
      BOOL v11 = v8;
      v53 = v11;
      uint64_t v54 = a1;
      dispatch_async(MEMORY[0x263EF83A0], block);
      a1 = v11;
      __int16 v12 = v53;
    }
    else
    {
      if (BYTE3(a1[7].super.isa))
      {
        char v13 = 1;
      }
      else
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v14 = v3;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v49;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v49 != v17) {
                objc_enumerationMutation(v14);
              }
              if ([*(id *)(*((void *)&v48 + 1) + 8 * i) isEnvironmentTransitionAnimated])
              {
                char v13 = 1;
                goto LABEL_20;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v56 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
        char v13 = 0;
LABEL_20:
      }
      if (IsBlankedForBLSBacklightDisplayMode(v5))
      {
        __int16 v19 = bls_backlight_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v20 = [*(id *)&a1[1]._started description];
          NSStringFromBLSBacklightDisplayMode(v5);
          __int16 v21 = (BLSHPendingEnvironmentUpdateOperation *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v58 = a1;
          __int16 v59 = 2114;
          v60 = v20;
          __int16 v61 = 2114;
          id v62 = v21;
          _os_log_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) did not stop presentation engine:%{public}@ (displayMode:%{public}@)", buf, 0x20u);
        }
      }
      else
      {
        -[BLSHBacklightTransitionStateMachine onMainWithLock_stopPresentationEngineIfNeededForDisplayMode:]((uint64_t)a1, v5);
      }
      long long v22 = [v3 firstObject];
      uint64_t v23 = v22;
      if (a1[3].super.isa)
      {
        uint64_t v24 = [v22 previousState];
        id v25 = a1[3].super.isa;
        __int16 v12 = (BLSHPendingEnvironmentUpdateOperation *)v25;
        if (v24 != 1)
        {
          if (v25)
          {
            uint64_t v26 = bls_backlight_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              NSStringFromBLSBacklightChangeEvents();
              __int16 v27 = (BLSHPendingEnvironmentUpdateOperation *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              v58 = a1;
              __int16 v59 = 2114;
              v60 = v12;
              __int16 v61 = 2114;
              id v62 = v27;
              _os_log_impl(&dword_21FCFC000, v26, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) will discard specifier from presentation engine end:%{public}@ (not needed for events:%{public}@)", buf, 0x20u);
            }
          }

          __int16 v12 = 0;
        }
        Class v28 = a1[3].super.isa;
        a1[3].super.isa = 0;
      }
      else
      {
        __int16 v12 = 0;
      }
      [v23 state];
      int IsActive = BLSBacklightStateIsActive();
      uint64_t v30 = (BLSHPendingEnvironmentUpdateOperation *)*(id *)&a1[3]._started;
      uint64_t v31 = v30;
      if (v30) {
        BOOL v32 = v12 == 0;
      }
      else {
        BOOL v32 = 0;
      }
      if (v32) {
        __int16 v12 = 0;
      }
      if (v32 && IsActive)
      {
        __int16 v12 = [(BLSHPendingEnvironmentUpdateOperation *)v30 initialSpecifier];
      }
      if (!v12)
      {
        if ((IsActive & 1) != 0 || ([v23 previousState], (BLSBacklightStateIsActive() & 1) == 0))
        {
          -[BLSHBacklightTransitionStateMachine onMainWithLock_onScreenSpecifierForDisplayMode:]((uint64_t)a1, [(BLSHPresentationDateSpecifier *)a1[4]._initialSpecifier displayMode]);
          __int16 v12 = (BLSHPendingEnvironmentUpdateOperation *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          __int16 v12 = 0;
        }
      }
      v33 = [[BLSHPendingEnvironmentUpdateOperation alloc] initWithEvents:v3 withInitialSpecifier:v12];
      os_log_type_t v34 = *(void **)&a1[3]._started;
      *(void *)&a1[3]._started = v33;

      v35 = v33;
      BYTE3(a1[7].super.isa) = v13;
      if ((v13 & 1) == 0)
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v36 = v3;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v44 objects:v55 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v45;
LABEL_53:
          uint64_t v40 = 0;
          while (1)
          {
            if (*(void *)v45 != v39) {
              objc_enumerationMutation(v36);
            }
            if (!objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * v40), "isTransitionForcedUnanimated", (void)v44))break; {
            if (v38 == ++v40)
            }
            {
              uint64_t v38 = [v36 countByEnumeratingWithState:&v44 objects:v55 count:16];
              if (v38) {
                goto LABEL_53;
              }
              break;
            }
          }
        }
      }
      uint64_t v41 = bls_backlight_log();
      objc_super v42 = v41;
      if (v31)
      {
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v58 = a1;
          __int16 v59 = 2114;
          v60 = v31;
          __int16 v61 = 2114;
          id v62 = v35;
          _os_log_impl(&dword_21FCFC000, v42, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) replaced pending events:%{public}@ with new events:%{public}@", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        -[BLSHBacklightTransitionStateMachine onMainWithLock_environmentUpdateOperationForEvents:]();
      }

      a1 = v35;
    }
  }

  return a1;
}

- (BOOL)willUnblankTransitioningToDisplayMode:(uint64_t)a1
{
  if (!a1 || IsBlankedForBLSBacklightDisplayMode(a2)) {
    return 0;
  }
  uint64_t v4 = [*(id *)(a1 + 152) displayMode];

  return IsBlankedForBLSBacklightDisplayMode(v4);
}

- (id)onMainWithLock_updateSpecifierOperationIfNeeded
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v1 = a1;
    id v3 = a1 + 15;
    id v2 = a1[15];
    if (v2)
    {
      if (![v2 isCompleted])
      {
        uint64_t v16 = bls_backlight_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[BLSHBacklightTransitionStateMachine onMainWithLock_updateSpecifierOperationIfNeeded]();
        }
        goto LABEL_16;
      }
      id v4 = *v3;
      *id v3 = 0;
    }
    id v5 = v1[12];
    if (v5)
    {
      id v6 = v1[9];
      if (v6 == (id)1)
      {
        BOOL v7 = [v1[19] presentation];
        uint64_t v8 = [v1[20] presentation];
        uint64_t v9 = [BLSHPendingUpdateToSpecifier alloc];
        id v10 = v1[12];
        uint64_t v21 = MEMORY[0x263EF8330];
        uint64_t v22 = 3221225472;
        uint64_t v23 = __86__BLSHBacklightTransitionStateMachine_onMainWithLock_updateSpecifierOperationIfNeeded__block_invoke;
        uint64_t v24 = &unk_264533E58;
        BOOL v28 = v8 != v7;
        id v25 = v7;
        id v26 = v8;
        __int16 v27 = v1;
        BOOL v11 = v8;
        id v12 = v7;
        char v13 = [v10 filter:&v21];
        uint64_t v14 = -[BLSHPendingUpdateToSpecifier initWithSpecifier:](v9, "initWithSpecifier:", v13, v21, v22, v23, v24);
        id v15 = v1[15];
        v1[15] = (id)v14;
      }
      else
      {
        id v12 = v5;
        BOOL v11 = bls_backlight_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v30 = v1;
          __int16 v31 = 2114;
          id v32 = v12;
          __int16 v33 = 1024;
          int v34 = (int)v6;
          _os_log_impl(&dword_21FCFC000, v11, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) will discard specifier from presentation engine end:%{public}@ (no events, currentBacklightState:%u)", buf, 0x1Cu);
        }
      }

      id v17 = v1[12];
      v1[12] = 0;
    }
    id v18 = *v3;
    uint64_t v16 = bls_backlight_log();
    BOOL v19 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v18)
    {
      if (v19) {
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updateSpecifierOperationIfNeeded]();
      }
LABEL_16:

      a1 = (id *)*v3;
      goto LABEL_20;
    }
    if (v19) {
      -[BLSHBacklightTransitionStateMachine onMainWithLock_updateSpecifierOperationIfNeeded]();
    }

    a1 = 0;
  }
LABEL_20:

  return a1;
}

uint64_t __86__BLSHBacklightTransitionStateMachine_onMainWithLock_updateSpecifierOperationIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [a2 environment];
  if (([*(id *)(a1 + 32) containsEnvironment:v3] & 1) != 0
    || *(unsigned char *)(a1 + 56) && ([*(id *)(a1 + 40) containsEnvironment:v3] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = bls_backlight_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = [v3 identifier];
      objc_msgSend(*(id *)(a1 + 32), "bls_shortLoggingString");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      int v10 = *(unsigned __int8 *)(a1 + 56);
      if (*(unsigned char *)(a1 + 56))
      {
        objc_msgSend(*(id *)(a1 + 40), "bls_shortLoggingString");
        BOOL v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v11 = @"(same)";
      }
      int v12 = 134218754;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      id v15 = v8;
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2114;
      BOOL v19 = v11;
      _os_log_error_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_ERROR, "TSM:%p specifier environment:%{public}@ not in presentation:%{public}@ or target:%{public}@", (uint8_t *)&v12, 0x2Au);
      if (v10) {
    }
      }
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __90__BLSHBacklightTransitionStateMachine_onMainWithLock_environmentUpdateOperationForEvents___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setCompleted:1];
  id v2 = bls_backlight_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_21FCFC000, v2, OS_LOG_TYPE_INFO, "TSM:%p completed pendingEnvironmentUpdate %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(void *)(a1 + 40));
}

- (id)onMainWithLock_updatePresentationOperationIfNeeded
{
  uint64_t v1 = a1;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = [a1[20] presentation];
    uint64_t v3 = [v1[19] presentation];
    if (v2 && ([v2 isEqual:v3] & 1) == 0)
    {
      BOOL v11 = [[BLSHPendingUpdatePresentation alloc] initWithPresentation:v2];
      id v5 = v1 + 14;
      id v12 = v1[14];
      v1[14] = v11;

      uint64_t v7 = bls_backlight_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updateSpecifierOperationIfNeeded]();
      }
    }
    else
    {
      id v5 = v1 + 14;
      id v4 = v1[14];
      if (!v4)
      {
LABEL_9:
        uint64_t v10 = bls_backlight_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          int v14 = 134218498;
          id v15 = v1;
          __int16 v16 = 2114;
          id v17 = v2;
          __int16 v18 = 2114;
          BOOL v19 = v3;
          _os_log_debug_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_DEBUG, "TSM:%p (findNextOperation) no updatePresentation operation needed — target:%{public}@ current:%{public}@", (uint8_t *)&v14, 0x20u);
        }

        uint64_t v1 = 0;
        goto LABEL_17;
      }
      int v6 = [v4 isCompleted];
      uint64_t v7 = bls_backlight_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8) {
          -[BLSHBacklightTransitionStateMachine onMainWithLock_updatePresentationOperationIfNeeded]();
        }

        id v9 = *v5;
        id *v5 = 0;

        goto LABEL_9;
      }
      if (v8) {
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updatePresentationOperationIfNeeded]();
      }
    }

    uint64_t v1 = (id *)*v5;
LABEL_17:
  }

  return v1;
}

- (void)lock_displayOperationForCurrentTarget
{
  if (a1)
  {
    uint64_t v2 = (uint64_t)a1;
    uint64_t v3 = (void *)a1[20];
    if (!v3) {
      uint64_t v3 = *(void **)(v2 + 152);
    }
    a1 = -[BLSHBacklightTransitionStateMachine lock_displayOperationForTarget:isNullOperationAllowed:](v2, [v3 displayMode], 1);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)onMainWithLock_updateDisplayOrEngineOperationIfNeeded
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 128);
    if (v2)
    {
      int v3 = [v2 isFullyCompleted];
      id v4 = *(void **)(a1 + 128);
      if (v3)
      {
        *(void *)(a1 + 128) = 0;

        id v4 = *(void **)(a1 + 128);
      }
    }
    else
    {
      id v4 = 0;
    }
    id v5 = v4;
    -[BLSHBacklightTransitionStateMachine lock_displayOperationForCurrentTarget]((void *)a1);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = *(void **)(a1 + 160);
    if (!v7) {
      uint64_t v7 = *(void **)(a1 + 152);
    }
    unint64_t v8 = [v7 displayMode];
    int v9 = IsOffForBLSBacklightDisplayMode(v8);
    uint64_t v10 = *(void **)(a1 + 104);
    if (v10 && (([v10 isCompleted] | v9) & 1) == 0)
    {
      int v11 = [*(id *)(a1 + 104) didUpdateInitialState];
      id v12 = bls_backlight_log();
      uint64_t v13 = v12;
      if (!v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded].cold.6();
        }

        goto LABEL_41;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded].cold.5();
      }
    }
    if (*(void *)(a1 + 112)) {
      char v14 = v9;
    }
    else {
      char v14 = 1;
    }
    if (v14)
    {
      -[BLSHBacklightTransitionStateMachine _lock_setPendingUpdateDisplayMode:](a1, v6);
      if (v8 == 2)
      {
        if ([*(id *)(a1 + 152) displayMode] == 1)
        {
          uint64_t v15 = -[BLSHBacklightTransitionStateMachine _lock_ensureFlipbookCurrent](a1);
          if (v15)
          {
            id v16 = (id)v15;
            id v17 = bls_backlight_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              int v31 = 134218498;
              uint64_t v32 = a1;
              __int16 v33 = 2114;
              id v34 = v16;
              __int16 v35 = 2114;
              id v36 = v6;
              _os_log_debug_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_DEBUG, "TSM:%p (findNextOperation) will start ensure flipbook current operation %{public}@ and defer %{public}@", (uint8_t *)&v31, 0x20u);
            }
LABEL_51:

            goto LABEL_52;
          }
        }
        if (v6)
        {
          if (v5 != v6)
          {
LABEL_44:
            BOOL v28 = bls_backlight_log();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
              -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded]();
            }

            goto LABEL_47;
          }
          goto LABEL_47;
        }
        uint64_t v29 = -[BLSHBacklightTransitionStateMachine _lock_ensureFlipbookCurrent](a1);
        if (v29)
        {
          id v16 = (id)v29;
          id v17 = bls_backlight_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded]();
          }
          goto LABEL_51;
        }
      }
      else
      {
        BOOL v19 = *(void **)(a1 + 136);
        if (v19 && ([v19 isCompleted] & 1) == 0)
        {
          uint64_t v20 = bls_backlight_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v21 = *(void **)(a1 + 136);
            uint64_t v22 = NSStringFromBLSBacklightDisplayMode(v8);
            int v31 = 134218498;
            uint64_t v32 = a1;
            __int16 v33 = 2114;
            id v34 = v21;
            __int16 v35 = 2114;
            id v36 = v22;
            _os_log_impl(&dword_21FCFC000, v20, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) abandoning ensureFlipbookCurrentOperation %{public}@ because targetDisplayMode=%{public}@", (uint8_t *)&v31, 0x20u);
          }
        }
        uint64_t v23 = *(void **)(a1 + 136);
        *(void *)(a1 + 136) = 0;

        if (v6)
        {
          if (v5 != v6)
          {
            -[BLSHBacklightTransitionStateMachine onMainWithLock_stopPresentationEngineIfNeededForDisplayMode:](a1, v8);
            if (IsBlankedForBLSBacklightDisplayMode([*(id *)(a1 + 152) displayMode]))
            {
              uint64_t v24 = -[BLSHBacklightTransitionStateMachine onMainWithLock_updateSpecifierOperationIfNeeded]((id *)a1);
              if (v24)
              {
                id v16 = (id)v24;
                id v25 = bls_backlight_log();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  id v26 = NSStringFromBLSBacklightDisplayMode([*(id *)(a1 + 152) displayMode]);
                  __int16 v27 = NSStringFromBLSBacklightDisplayMode(v8);
                  int v31 = 134218754;
                  uint64_t v32 = a1;
                  __int16 v33 = 2114;
                  id v34 = v16;
                  __int16 v35 = 2114;
                  id v36 = v26;
                  __int16 v37 = 2114;
                  uint64_t v38 = v27;
                  _os_log_impl(&dword_21FCFC000, v25, OS_LOG_TYPE_INFO, "TSM:%p (findNextOperation) will update to specifier:%{public}@ prior to display mode:%{public}@->%{public}@", (uint8_t *)&v31, 0x2Au);
                }
                goto LABEL_52;
              }
            }
            goto LABEL_44;
          }
LABEL_47:
          id v16 = v6;
          goto LABEL_52;
        }
      }
      __int16 v18 = bls_backlight_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded]();
      }
    }
    else
    {
      __int16 v18 = bls_backlight_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BLSHBacklightTransitionStateMachine onMainWithLock_updateDisplayOrEngineOperationIfNeeded].cold.4();
      }
    }

LABEL_41:
    id v16 = 0;
LABEL_52:

    goto LABEL_53;
  }
  id v16 = 0;
LABEL_53:

  return v16;
}

- (void)_lock_setPendingUpdateDisplayMode:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    id v5 = *(id *)(a1 + 128);
    id v6 = v5;
    if (v5 == v4)
    {
LABEL_14:

      goto LABEL_15;
    }
    if (v5)
    {
      int v7 = [v5 isStartedButIncomplete];
      unint64_t v8 = bls_backlight_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = "";
        int v13 = 134218754;
        uint64_t v14 = a1;
        __int16 v15 = 2080;
        if (v7) {
          int v9 = " (in progress)";
        }
        id v16 = v9;
        __int16 v17 = 2114;
        __int16 v18 = v6;
        __int16 v19 = 2114;
        id v20 = v4;
        uint64_t v10 = "TSM:%p abandoning outdated %spending:%{public}@ new:%{public}@";
        int v11 = v8;
        uint32_t v12 = 42;
        goto LABEL_11;
      }
    }
    else
    {
      if (!v4)
      {
LABEL_13:
        objc_storeStrong((id *)(a1 + 128), a2);
        goto LABEL_14;
      }
      unint64_t v8 = bls_backlight_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v13 = 134218242;
        uint64_t v14 = a1;
        __int16 v15 = 2114;
        id v16 = (const char *)v4;
        uint64_t v10 = "TSM:%p set pending:%{public}@";
        int v11 = v8;
        uint32_t v12 = 22;
LABEL_11:
        _os_log_impl(&dword_21FCFC000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, v12);
      }
    }

    goto LABEL_13;
  }
LABEL_15:
}

- (id)_lock_ensureFlipbookCurrent
{
  if (!a1)
  {
LABEL_7:
    id v3 = 0;
    goto LABEL_9;
  }
  id v2 = *(id *)(a1 + 136);
  if (v2)
  {
    id v3 = v2;
    if (![v2 isCompleted]) {
      goto LABEL_9;
    }

    *(unsigned char *)(a1 + 230) = 0;
    id v4 = bls_backlight_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[BLSHBacklightTransitionStateMachine _lock_ensureFlipbookCurrent]();
    }

    goto LABEL_7;
  }
  id v5 = +[BLSHEnsureFlipbookCurrentOperation operation];
  id v6 = *(void **)(a1 + 136);
  *(void *)(a1 + 136) = v5;

  id v3 = v5;
LABEL_9:

  return v3;
}

- (id)setupRampOperationIfNeeded
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v3 = -[BLSHBacklightTransitionStateMachine lock_displayOperationForCurrentTarget]((void *)a1);
    id v4 = [v3 rampOperation];
    if (v4) {
      -[BLSHBacklightTransitionStateMachine _lock_setPendingUpdateDisplayMode:](a1, v3);
    }
    os_unfair_lock_unlock(v2);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __73__BLSHBacklightTransitionStateMachine_onMain_performNextStepInTransition__block_invoke(uint64_t a1, double a2)
{
}

- (void)ifStillValidPerformAlwaysOnBrightnessRamp:(double)a3 withDuration:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if (!v5)
    {
      id v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"rampOperation != nil"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHBacklightTransitionStateMachine ifStillValidPerformAlwaysOnBrightnessRamp:withDuration:]();
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD59004);
    }
    [v5 setReadyToStart:1];
    [v6 setDuration:a3];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v7 = *(id *)(a1 + 128);
    unint64_t v8 = *(void **)(a1 + 160);
    if (!v8) {
      unint64_t v8 = *(void **)(a1 + 152);
    }
    uint64_t v9 = [v8 displayMode];
    uint64_t v10 = [v7 rampOperation];
    if (v10 == v6)
    {
      uint32_t v12 = [v6 last];
      BOOL v11 = [v12 targetDisplayMode] == v9;
    }
    else
    {
      BOOL v11 = 0;
    }

    int v13 = [v7 first];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if ([v6 isStarted])
    {
      uint64_t v14 = bls_backlight_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v22 = a1;
        __int16 v23 = 2114;
        double v24 = *(double *)&v6;
        __int16 v15 = "TSM:%p nothing do here since rampOperation has already started:%{public}@";
        id v16 = v14;
        uint32_t v17 = 22;
LABEL_21:
        _os_log_impl(&dword_21FCFC000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
    else if (v11)
    {
      if (v13 == v6 || ([v13 isCompleted] & 1) != 0)
      {
        __int16 v18 = bls_backlight_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v22 = a1;
          __int16 v23 = 2048;
          double v24 = a3;
          __int16 v25 = 2114;
          id v26 = v6;
          _os_log_debug_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_DEBUG, "TSM:%p performing brightness ramp with duration:%.2lfs using operation:%{public}@", buf, 0x20u);
        }

        [v6 setStarted:1];
        __int16 v19 = bls_backlight_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v22 = a1;
          __int16 v23 = 2114;
          double v24 = *(double *)&v6;
          _os_log_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_INFO, "TSM:%p started rampOperation %{public}@", buf, 0x16u);
        }

        [v6 targetDisplayMode];
        -[BLSHBacklightTransitionStateMachine setDisplayMode:withRampDuration:](a1);
        goto LABEL_23;
      }
      uint64_t v14 = bls_backlight_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v22 = a1;
        __int16 v23 = 2048;
        double v24 = a3;
        __int16 v25 = 2114;
        id v26 = v7;
        _os_log_debug_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_DEBUG, "TSM:%p waiting to perform brightness ramp with duration:%.2lfs using operation:%{public}@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v14 = bls_backlight_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218754;
        uint64_t v22 = a1;
        __int16 v23 = 2048;
        double v24 = a3;
        __int16 v25 = 2114;
        id v26 = v6;
        __int16 v27 = 2114;
        id v28 = v7;
        __int16 v15 = "TSM:%p not performing brightness ramp with duration:%.2lfs using operation:%{public}@ because display oper"
              "ation has changed to operation:%{public}@";
        id v16 = v14;
        uint32_t v17 = 42;
        goto LABEL_21;
      }
    }

LABEL_23:
  }
}

- (void)environmentStateMachineDidBeginUpdateToState:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v5 = (void *)[*(id *)(a1 + 184) copy];
    id v6 = (void *)[*(id *)(a1 + 192) copy];
    id v7 = [*(id *)(a1 + 104) triggerEvent];
    unint64_t v8 = v7;
    if (*(void *)(a1 + 104)) {
      BOOL v9 = [v7 state] == a2;
    }
    else {
      BOOL v9 = 0;
    }
    uint64_t v10 = bls_backlight_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      BOOL v11 = NSStringFromBLSBacklightState();
      uint64_t v13 = *(void *)(a1 + 104);
      uint32_t v12 = NSStringFromBLSBacklightChangeEvents();
      *(_DWORD *)buf = 134219010;
      uint64_t v17 = a1;
      __int16 v18 = 2114;
      __int16 v19 = v11;
      __int16 v20 = 1024;
      BOOL v21 = v9;
      __int16 v22 = 2114;
      uint64_t v23 = v13;
      __int16 v24 = 2114;
      __int16 v25 = v12;
      _os_log_debug_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_DEBUG, "TSM:%p didBeginUpdateToState:%{public}@ matchesPendingEvent:%{BOOL}u pendingEvent:%{public}@ events:%{public}@", buf, 0x30u);
    }
    if (v9)
    {
      [*(id *)(a1 + 104) setUpdatedInitialState:1];
      os_unfair_lock_unlock(v4);
      id v14 = v5;
      id v15 = v6;
      BSDispatchMain();
    }
    else
    {
      os_unfair_lock_unlock(v4);
    }
  }
}

- (void)environmentStateMachineDidCompleteUpdateToState:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v5 = *(void **)(a1 + 104);
    if (v5)
    {
      id v6 = [v5 triggerEvent];
      BOOL v7 = [v6 state] == a2;
    }
    else
    {
      BOOL v7 = 0;
    }
    unint64_t v8 = bls_backlight_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      BOOL v11 = NSStringFromBLSBacklightState();
      uint64_t v12 = *(void *)(a1 + 104);
      *(_DWORD *)buf = 134218754;
      uint64_t v14 = a1;
      __int16 v15 = 2114;
      id v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = v7;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      _os_log_debug_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_DEBUG, "TSM:%p environmentStateMachine didCompleteUpdateToState:%{public}@ matchesPendingEvent:%{BOOL}u pendingEvent:%{public}@ ", buf, 0x26u);
    }
    if (v7)
    {
      [*(id *)(a1 + 104) setCompleted:1];
      BOOL v9 = bls_backlight_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void **)(a1 + 104);
        *(_DWORD *)buf = 134218242;
        uint64_t v14 = a1;
        __int16 v15 = 2114;
        id v16 = v10;
        _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_INFO, "TSM:%p completed pendingEnvironmentUpdate %{public}@", buf, 0x16u);
      }

      os_unfair_lock_unlock(v4);
      BSDispatchMain();
    }
    else
    {
      os_unfair_lock_unlock(v4);
    }
  }
}

- (void)environmentStateMachine:(id)a3 didBeginUpdateToState:(int64_t)a4
{
}

void __84__BLSHBacklightTransitionStateMachine_environmentStateMachineDidBeginUpdateToState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) performerDelegate];
  [v2 backlight:*(void *)(a1 + 32) didUpdateVisualContentsToBeginTransitionToState:*(void *)(a1 + 56) forEvents:*(void *)(a1 + 40) abortedEvents:*(void *)(a1 + 48)];

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = (os_unfair_lock_s *)(v3 + 8);
  id v5 = *(id *)(v3 + 144);
  os_unfair_lock_unlock(v4);
  [v5 updaterDidBeginUpdateToBacklightState:*(void *)(a1 + 56)];
  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(void *)(a1 + 32));
}

- (void)environmentStateMachine:(id)a3 didCompleteUpdateToState:(int64_t)a4
{
}

uint64_t __87__BLSHBacklightTransitionStateMachine_environmentStateMachineDidCompleteUpdateToState___block_invoke(uint64_t a1)
{
  return -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](*(void *)(a1 + 32));
}

- (void)environmentStateMachine:(id)a3 didUpdateToPresentation:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = (BLSHPendingUpdatePresentation *)a4;
  os_unfair_lock_lock(&self->_lock);
  lock_pendingUpdatePresentation = self->_lock_pendingUpdatePresentation;
  if (lock_pendingUpdatePresentation
    && ([(BLSHPendingUpdatePresentation *)lock_pendingUpdatePresentation presentation],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqual:v5],
        v7,
        v8))
  {
    int v9 = 1;
    [(BLSHPendingUpdatePresentation *)self->_lock_pendingUpdatePresentation setCompleted:1];
    uint64_t v10 = bls_backlight_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = self->_lock_pendingUpdatePresentation;
      *(_DWORD *)buf = 134218242;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      uint64_t v23 = v11;
      _os_log_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_INFO, "TSM:%p completed pendingUpdatePresentation %{public}@", buf, 0x16u);
    }

    self->_lock_flipbookIsStale = 1;
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v12 = -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated]((uint64_t)self);
  unint64_t v13 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:]((uint64_t)self, self->_lock_backlightState);
  uint64_t v14 = bls_backlight_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __int16 v17 = NSStringFromBLSBacklightDisplayMode(v13);
    BOOL v18 = self->_lock_pendingUpdatePresentation;
    *(_DWORD *)buf = 134219010;
    uint64_t v21 = self;
    __int16 v22 = 2114;
    uint64_t v23 = v5;
    __int16 v24 = 1024;
    int v25 = v9;
    __int16 v26 = 2114;
    __int16 v27 = v17;
    __int16 v28 = 2114;
    uint64_t v29 = v18;
    _os_log_debug_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_DEBUG, "TSM:%p didUpdateToPresentation:%{public}@ matchesPendingUpdate:%{BOOL}u targetDisplayMode:%{public}@ pending:%{public}@", buf, 0x30u);
  }
  [v12 setDisplayMode:v13];
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    __int16 v15 = self->_lock_session;
    __int16 v19 = v5;
    id v16 = v15;
    BSDispatchMain();
  }
}

void __87__BLSHBacklightTransitionStateMachine_environmentStateMachine_didUpdateToPresentation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updaterDidUpdateToPresentation:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);

  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](v2);
}

- (void)environmentStateMachine:(id)a3 didUpdateToSpecifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v5 = (unint64_t)a4;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(BLSHPendingUpdateToSpecifier *)self->_lock_pendingUpdateToSpecifier specifier];
  unint64_t v7 = (unint64_t)v6;
  if (self->_lock_pendingUpdateToSpecifier) {
    BOOL v8 = ([v6 isEqual:v5] & 1) != 0 || (v5 | v7) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  int v9 = bls_backlight_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    lock_pendingUpdateToSpecifier = self->_lock_pendingUpdateToSpecifier;
    *(_DWORD *)buf = 134218754;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    id v16 = (BLSHPendingUpdateToSpecifier *)v5;
    __int16 v17 = 1024;
    BOOL v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = lock_pendingUpdateToSpecifier;
    _os_log_debug_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_DEBUG, "TSM:%p didUpdateToSpecifier:%{public}@ matchesPendingUpdate:%{BOOL}u pending:%{public}@", buf, 0x26u);
  }

  if (v8)
  {
    [(BLSHPendingUpdateToSpecifier *)self->_lock_pendingUpdateToSpecifier setCompleted:1];
    uint64_t v10 = bls_backlight_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = self->_lock_pendingUpdateToSpecifier;
      *(_DWORD *)buf = 134218242;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      id v16 = v11;
      _os_log_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_INFO, "TSM:%p completed pendingUpdateToSpecifier %{public}@", buf, 0x16u);
    }

    os_unfair_lock_unlock(&self->_lock);
    BSDispatchMain();
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

void __84__BLSHBacklightTransitionStateMachine_environmentStateMachine_didUpdateToSpecifier___block_invoke(uint64_t a1)
{
}

- (void)inactiveEnvironmentSession:(id)a3 updateToPresentation:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_session == v6)
  {
    if (!self->_environmentStateMachine)
    {
      __int16 v26 = [NSString stringWithFormat:@"session:%@ exists but no environment state machine", v6];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHBacklightTransitionStateMachine inactiveEnvironmentSession:updateToPresentation:]();
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD59F10);
    }
    -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
    int v9 = -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated]((uint64_t)self);
    unint64_t v10 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:]((uint64_t)self, self->_lock_backlightState);
    -[BLSHBacklightTransitionStateMachine _lock_updateCacheFlipbookWithSession:]((uint64_t)self, self->_lock_session);
    BOOL v11 = bls_backlight_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

    if (!v12) {
      goto LABEL_21;
    }
    unint64_t v13 = [v9 presentation];
    uint64_t v14 = [v7 differenceFromPresentation:v13];

    if (![v14 hasChanges])
    {
      __int16 v15 = bls_backlight_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        NSStringFromBLSBacklightDisplayMode(v10);
        uint64_t v21 = (BLSHBacklightInactiveEnvironmentSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        __int16 v33 = self;
        __int16 v34 = 2114;
        __int16 v35 = v21;
        __int16 v36 = 2114;
        uint64_t v37 = (uint64_t)v9;
        _os_log_impl(&dword_21FCFC000, v15, OS_LOG_TYPE_INFO, "TSM:%p updateToPresentation (redundant) displayMode:%{public}@ previousTarget:%{public}@", buf, 0x20u);
      }
      goto LABEL_20;
    }
    __int16 v15 = [v14 insertions];
    id v16 = [v14 removals];
    uint64_t v17 = [v15 count];
    uint64_t v30 = v16;
    if ([v16 count])
    {
      BOOL v18 = bls_backlight_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (v17)
      {
        if (v19)
        {
          __int16 v28 = [v15 bs_map:&__block_literal_global_244];
          __int16 v27 = objc_msgSend(v30, "bs_map:", &__block_literal_global_246);
          NSStringFromBLSBacklightDisplayMode(v10);
          *(_DWORD *)buf = 134219010;
          __int16 v33 = self;
          __int16 v34 = 2114;
          __int16 v35 = v28;
          __int16 v36 = 2114;
          uint64_t v37 = (uint64_t)v27;
          v39 = __int16 v38 = 2114;
          uint64_t v20 = (void *)v39;
          __int16 v40 = 2114;
          uint64_t v41 = v9;
          _os_log_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_INFO, "TSM:%p updateToPresentation by adding:%{public}@ and removing:%{public}@ displayMode:%{public}@ previousTarget:%{public}@", buf, 0x34u);
        }
        goto LABEL_19;
      }
      if (v19)
      {
        objc_msgSend(v30, "bs_map:", &__block_literal_global_241);
        uint64_t v29 = (BLSHBacklightInactiveEnvironmentSession *)objc_claimAutoreleasedReturnValue();
        NSStringFromBLSBacklightDisplayMode(v10);
        *(_DWORD *)buf = 134218754;
        __int16 v33 = self;
        __int16 v34 = 2114;
        __int16 v35 = v29;
        v37 = __int16 v36 = 2114;
        uint64_t v23 = (void *)v37;
        __int16 v38 = 2114;
        uint64_t v39 = (uint64_t)v9;
        __int16 v24 = "TSM:%p updateToPresentation by removing:%{public}@ displayMode:%{public}@ previousTarget:%{public}@";
        goto LABEL_18;
      }
    }
    else
    {
      BOOL v18 = bls_backlight_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = [v15 bs_map:&__block_literal_global_238];
        NSStringFromBLSBacklightDisplayMode(v10);
        *(_DWORD *)buf = 134218754;
        __int16 v33 = self;
        __int16 v34 = 2114;
        __int16 v35 = v29;
        v37 = __int16 v36 = 2114;
        uint64_t v23 = (void *)v37;
        __int16 v38 = 2114;
        uint64_t v39 = (uint64_t)v9;
        __int16 v24 = "TSM:%p updateToPresentation by adding:%{public}@ displayMode:%{public}@ previousTarget:%{public}@";
LABEL_18:
        _os_log_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_INFO, v24, buf, 0x2Au);
      }
    }
LABEL_19:

LABEL_20:
LABEL_21:
    [v9 setDisplayMode:v10];
    [v9 setPresentation:v7];
    -[BLSHBacklightTransitionStateMachine lock_isHighLuminanceAlwaysOnWithSession:]((uint64_t)self, v6);

    os_unfair_lock_unlock(&self->_lock);
    int v31 = self->_displayStateMachine;
    int v25 = v31;
    BSDispatchMain();

    goto LABEL_22;
  }
  BOOL v8 = bls_backlight_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    lock_session = self->_lock_session;
    *(_DWORD *)buf = 134218754;
    __int16 v33 = self;
    __int16 v34 = 2114;
    __int16 v35 = v6;
    __int16 v36 = 2114;
    uint64_t v37 = (uint64_t)lock_session;
    __int16 v38 = 2114;
    uint64_t v39 = (uint64_t)v7;
    _os_log_error_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_ERROR, "TSM:%p updated presentation on invalid session:%{public}@ currentSession:%{public}@ new presentation:%{public}@", buf, 0x2Au);
  }

  os_unfair_lock_unlock(&self->_lock);
LABEL_22:
}

id __87__BLSHBacklightTransitionStateMachine_inactiveEnvironmentSession_updateToPresentation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  unint64_t v5 = [v2 stringWithFormat:@"%p:%@", v3, v4];

  return v5;
}

id __87__BLSHBacklightTransitionStateMachine_inactiveEnvironmentSession_updateToPresentation___block_invoke_239(uint64_t a1, void *a2)
{
  uint64_t v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  unint64_t v5 = [v2 stringWithFormat:@"%p:%@", v3, v4];

  return v5;
}

id __87__BLSHBacklightTransitionStateMachine_inactiveEnvironmentSession_updateToPresentation___block_invoke_242(uint64_t a1, void *a2)
{
  uint64_t v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  unint64_t v5 = [v2 stringWithFormat:@"%p:%@", v3, v4];

  return v5;
}

id __87__BLSHBacklightTransitionStateMachine_inactiveEnvironmentSession_updateToPresentation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSString;
  id v3 = a2;
  id v4 = [v3 identifier];
  unint64_t v5 = [v2 stringWithFormat:@"%p:%@", v3, v4];

  return v5;
}

void __87__BLSHBacklightTransitionStateMachine_inactiveEnvironmentSession_updateToPresentation___block_invoke_247(uint64_t a1)
{
  [*(id *)(a1 + 32) setHighLuminanceAlwaysOn:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 40);

  -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](v2);
}

- (BOOL)isGlobalUnrestrictedFramerate
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_globalUnrestrictedFramerate;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setGlobalUnrestrictedFramerate:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_globalUnrestrictedFramerate = self->_lock_globalUnrestrictedFramerate;
  self->_int lock_globalUnrestrictedFramerate = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_globalUnrestrictedFramerate != v3)
  {
    -[BLSHBacklightTransitionStateMachine updateTargetAndPerformNextStepForUnrestrictedFramerateChangeWithEnvironment:]((uint64_t)self, 0);
  }
}

- (void)updateTargetAndPerformNextStepForUnrestrictedFramerateChangeWithEnvironment:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!a1) {
    goto LABEL_18;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  uint64_t v4 = *(void *)(a1 + 72);
  if (*(unsigned char *)(a1 + 240)) {
    int v5 = 1;
  }
  else {
    int v5 = -[BLSHBacklightTransitionStateMachine hasUnrestrictedFramerateWithSession:](a1, *(void **)(a1 + 144));
  }
  if (v4 == 1 && v5 != 0) {
    -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion](a1);
  }
  id v7 = -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated](a1);
  uint64_t v8 = [v7 displayMode];
  unint64_t v9 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:](a1, *(void *)(a1 + 72));
  unint64_t v10 = bls_backlight_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (!v11) {
      goto LABEL_14;
    }
    uint64_t v15 = [v3 identifier];
    id v16 = NSStringFromBLSBacklightDisplayMode(v9);
    *(_DWORD *)buf = 134219010;
    uint64_t v21 = a1;
    __int16 v22 = 1024;
    int v23 = v5;
    __int16 v24 = 2114;
    BOOL v12 = (void *)v15;
    uint64_t v25 = v15;
    __int16 v26 = 2114;
    __int16 v27 = v16;
    __int16 v28 = 2114;
    uint64_t v29 = v7;
    _os_log_debug_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_DEBUG, "TSM:%p changed unrestrictedFramerate:%{BOOL}u forEnvironment:%{public}@ targetDisplayMode:%{public}@ previousTarget:%{public}@", buf, 0x30u);
  }
  else
  {
    if (!v11) {
      goto LABEL_14;
    }
    NSStringFromBLSBacklightDisplayMode(v9);
    *(_DWORD *)buf = 134218754;
    uint64_t v21 = a1;
    __int16 v22 = 1024;
    int v23 = v5;
    v25 = __int16 v24 = 2114;
    BOOL v12 = (void *)v25;
    __int16 v26 = 2114;
    __int16 v27 = v7;
    _os_log_debug_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_DEBUG, "TSM:%p changed global unrestrictedFramerate:%{BOOL}u targetDisplayMode:%{public}@ previousTarget:%{public}@", buf, 0x26u);
  }

LABEL_14:
  [v7 setDisplayMode:v9];
  id v13 = *(id *)(a1 + 256);
  id v14 = *(id *)(a1 + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  if (v8 != v9 || v4 == 1)
  {
    id v17 = v13;
    id v18 = v3;
    id v19 = v14;
    BSDispatchMain();
  }
LABEL_18:
}

- (BOOL)isGlobalHighLuminanceAlwaysOn
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_globalHighLuminanceAlwaysOn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setGlobalHighLuminanceAlwaysOn:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_globalHighLuminanceAlwaysOn = self->_lock_globalHighLuminanceAlwaysOn;
  self->_int lock_globalHighLuminanceAlwaysOn = v3;
  -[BLSHBacklightTransitionStateMachine lock_isHighLuminanceAlwaysOnWithSession:]((uint64_t)self, self->_lock_session);
  if (lock_globalHighLuminanceAlwaysOn != v3 && v3 != 0) {
    -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
  }
  os_unfair_lock_unlock(p_lock);
  if (lock_globalHighLuminanceAlwaysOn != v3)
  {
    unint64_t v9 = self->_displayStateMachine;
    uint64_t v8 = v9;
    BSDispatchMain();
  }
}

uint64_t __70__BLSHBacklightTransitionStateMachine_setGlobalHighLuminanceAlwaysOn___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighLuminanceAlwaysOn:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)globalCacheFlipbookOnDisplayWake
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_globalCacheFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setGlobalCacheFlipbookOnDisplayWake:(BOOL)a3
{
  int v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_globalCacheFlipbook = self->_lock_globalCacheFlipbook;
  self->_int lock_globalCacheFlipbook = v3;
  if (lock_globalCacheFlipbook == v3) {
    goto LABEL_7;
  }
  id v7 = bls_backlight_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v10 = self;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_INFO, "TSM:%p new globalCacheFlipbook:%{BOOL}u", buf, 0x12u);
  }

  if (-[BLSHBacklightTransitionStateMachine _lock_updateCacheFlipbookWithSession:]((uint64_t)self, self->_lock_session)&& self->_lock_session)
  {
    -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
    os_unfair_lock_unlock(p_lock);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__BLSHBacklightTransitionStateMachine_setGlobalCacheFlipbookOnDisplayWake___block_invoke;
    block[3] = &unk_264532258;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
LABEL_7:
    os_unfair_lock_unlock(p_lock);
  }
}

void __75__BLSHBacklightTransitionStateMachine_setGlobalCacheFlipbookOnDisplayWake___block_invoke(uint64_t a1)
{
}

- (void)hostEnvironment:(id)a3 hostDidSetAlwaysOnEnabledForEnvironment:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
  id v7 = -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated]((uint64_t)self);
  unint64_t v8 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:]((uint64_t)self, self->_lock_backlightState);
  unint64_t v9 = bls_backlight_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unint64_t v10 = [v6 identifier];
    __int16 v11 = NSStringFromBLSBacklightDisplayMode(v8);
    *(_DWORD *)buf = 134219010;
    uint64_t v13 = self;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    __int16 v16 = 2114;
    id v17 = v10;
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 2114;
    uint64_t v21 = v7;
    _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_INFO, "TSM:%p hostDidSetAlwaysOnEnabled:%{BOOL}u forEnvironment:%{public}@ targetDisplayMode:%{public}@ previousTarget:%{public}@", buf, 0x30u);
  }
  [v7 setDisplayMode:v8];
  os_unfair_lock_unlock(&self->_lock);
  BSDispatchMain();
}

void __95__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetAlwaysOnEnabledForEnvironment___block_invoke(uint64_t a1)
{
}

- (void)hostEnvironment:(id)a3 hostDidSetLiveUpdating:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(BLSHBacklightAggregateState *)self->_currentState presentation];
  if ([v7 containsEnvironment:v6])
  {

LABEL_4:
    if (v4) {
      -[BLSHBacklightTransitionStateMachine withLock_acquireTransitionAPAwakeAssertion]((uint64_t)self);
    }
    unint64_t v10 = -[BLSHBacklightTransitionStateMachine withLock_ensureTargetStateCreated]((uint64_t)self);
    unint64_t v11 = -[BLSHBacklightTransitionStateMachine lock_displayModeForBacklightState:]((uint64_t)self, self->_lock_backlightState);
    int v12 = bls_backlight_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v6 identifier];
      __int16 v14 = NSStringFromBLSBacklightDisplayMode(v11);
      *(_DWORD *)buf = 134219010;
      __int16 v20 = self;
      __int16 v21 = 1024;
      BOOL v22 = v4;
      __int16 v23 = 2114;
      __int16 v24 = v13;
      __int16 v25 = 2114;
      __int16 v26 = v14;
      __int16 v27 = 2114;
      __int16 v28 = v10;
      _os_log_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_INFO, "TSM:%p hostDidSetLiveUpdating:%{BOOL}u forEnvironment:%{public}@ targetDisplayMode:%{public}@ previousTarget:%{public}@", buf, 0x30u);
    }
    [v10 setDisplayMode:v11];

    os_unfair_lock_unlock(&self->_lock);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __78__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetLiveUpdating___block_invoke;
    v17[3] = &unk_2645322D0;
    v17[4] = self;
    id v18 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v17);

    goto LABEL_12;
  }
  unint64_t v8 = [(BLSHBacklightMutableTargetState *)self->_lock_targetState presentation];
  int v9 = [v8 containsEnvironment:v6];

  if (v9) {
    goto LABEL_4;
  }
  BOOL v15 = bls_backlight_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    __int16 v16 = [v6 identifier];
    *(_DWORD *)buf = 134218498;
    __int16 v20 = self;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    __int16 v23 = 2114;
    __int16 v24 = v16;
    _os_log_debug_impl(&dword_21FCFC000, v15, OS_LOG_TYPE_DEBUG, "TSM:%p hostDidSetLiveUpdating:%{BOOL}u forEnvironment:%{public}@ but not in presentation", buf, 0x1Cu);
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_12:
}

void __78__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetLiveUpdating___block_invoke(uint64_t a1)
{
}

- (void)onMain_updateHostEnvironmentAndPerformNextStep:(uint64_t)a1
{
  if (a1)
  {
    int v3 = (os_unfair_lock_s *)(a1 + 8);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    id v5 = *(id *)(a1 + 32);
    os_unfair_lock_unlock(v3);
    [v5 updateEnvironment:v4];

    -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](a1);
  }
}

- (void)hostEnvironment:(id)a3 hostDidSetUnrestrictedFramerateUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(BLSHBacklightAggregateState *)self->_currentState presentation];
  if ([v7 containsEnvironment:v6])
  {

LABEL_4:
    os_unfair_lock_unlock(&self->_lock);
    -[BLSHBacklightTransitionStateMachine updateTargetAndPerformNextStepForUnrestrictedFramerateChangeWithEnvironment:]((uint64_t)self, v6);
    goto LABEL_8;
  }
  unint64_t v8 = [(BLSHBacklightMutableTargetState *)self->_lock_targetState presentation];
  char v9 = [v8 containsEnvironment:v6];

  if (v9) {
    goto LABEL_4;
  }
  unint64_t v10 = bls_backlight_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v11 = [v6 identifier];
    int v12 = 134218498;
    uint64_t v13 = self;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_debug_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_DEBUG, "TSM:%p changed unrestrictedFramerate:%{BOOL}u forEnvironment:%{public}@ but not in presentation", (uint8_t *)&v12, 0x1Cu);
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_8:
}

void __115__BLSHBacklightTransitionStateMachine_updateTargetAndPerformNextStepForUnrestrictedFramerateChangeWithEnvironment___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) prewarmForDisplayMode:*(void *)(a1 + 64)];
  }
  if (*(unsigned char *)(a1 + 73))
  {
    if (*(void *)(a1 + 40)) {
      objc_msgSend(*(id *)(a1 + 48), "updateEnvironment:");
    }
    uint64_t v2 = *(void *)(a1 + 56);
    -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](v2);
  }
}

- (void)hostEnvironment:(id)a3 hostDidSetCacheFlipbookOnDisplayWake:(BOOL)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[BLSHBacklightTransitionStateMachine _lock_updateCacheFlipbookWithSession:]((uint64_t)self, self->_lock_session))
  {
    lock_session = self->_lock_session;
    os_unfair_lock_unlock(p_lock);
    if (lock_session)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __92__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetCacheFlipbookOnDisplayWake___block_invoke;
      block[3] = &unk_264532258;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

void __92__BLSHBacklightTransitionStateMachine_hostEnvironment_hostDidSetCacheFlipbookOnDisplayWake___block_invoke(uint64_t a1)
{
}

- (BOOL)hostEnvironment:(id)a3 didAmendSceneSettings:(id)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  int v8 = [v7 isForeground];
  if (v8) {
    int64_t lock_backlightState = self->_lock_backlightState;
  }
  else {
    int64_t lock_backlightState = 2;
  }
  unint64_t v10 = [(BLSHBacklightAggregateState *)self->_currentState presentation];
  BOOL v11 = -[BLSHBacklightTransitionStateMachine withLock_isTransitioning]((BOOL)self);
  os_unfair_lock_unlock(&self->_lock);
  int v12 = [v10 containsEnvironment:v6];
  uint64_t v13 = [v6 presentationDate];
  id v62 = objc_msgSend(v7, "bls_presentationDate");
  if (v62) {
    int v14 = BSEqualObjects();
  }
  else {
    int v14 = 1;
  }
  int v15 = (v8 | v11) & v12;
  LODWORD(v16) = v14 & ~v15;
  if (v16 == 1)
  {
    id v17 = BLSVisualStateForBacklightStateAndSettings(lock_backlightState, v7, v6, self->_inactiveBudgetPolicy, self->_osInterfaceProvider);
    __int16 v16 = bls_backlight_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v48 = [v6 identifier];
      long long v45 = NSStringFromBLSBacklightState();
      uint64_t v18 = [v17 bls_shortLoggingString];
      uint64_t v37 = objc_msgSend(v10, "bls_shortLoggingString");
      v43 = [v6 visualState];
      __int16 v35 = objc_msgSend(v43, "bls_shortLoggingString");
      uint64_t v41 = [v6 presentationDate];
      __int16 v33 = objc_msgSend(v41, "bls_shortLoggingString");
      uint64_t v39 = objc_msgSend(v7, "bls_visualState");
      objc_msgSend(v39, "bls_shortLoggingString");
      id v19 = v51 = v13;
      objc_msgSend(v7, "bls_presentationDate");
      __int16 v20 = log = v17;
      objc_msgSend(v20, "bls_shortLoggingString");
      __int16 v21 = v54 = v10;
      *(_DWORD *)buf = 134220546;
      id v64 = self;
      __int16 v65 = 2114;
      uint64_t v66 = v48;
      __int16 v67 = 2114;
      v68 = v45;
      __int16 v69 = 2114;
      uint64_t v70 = (uint64_t)v18;
      __int16 v71 = 1024;
      int v72 = v8;
      __int16 v73 = 1024;
      int v74 = v12;
      __int16 v75 = 2114;
      uint64_t v76 = v37;
      __int16 v77 = 2114;
      v78 = v35;
      __int16 v79 = 2114;
      uint64_t v80 = v33;
      __int16 v81 = 2114;
      id v82 = v19;
      __int16 v83 = 2114;
      id v84 = v21;
      _os_log_impl(&dword_21FCFC000, v16, OS_LOG_TYPE_INFO, "TSM:%p will amend scene %{public}@ for backlightState:%{public}@ with visualState:%{public}@ – willBeForeground:%{BOOL}u containsEnv:%{BOOL}u presentation:%{public}@ oldVisualState:%{public}@ oldPresentationDate:%{public}@ settingsVisualState:%{public}@ settingsPresentationDate:%{public}@", buf, 0x68u);

      id v17 = log;
      unint64_t v10 = v54;

      uint64_t v13 = v51;
    }

    objc_msgSend(v7, "bls_setVisualState:", v17);
    objc_msgSend(v7, "bls_setPresentationDate:", 0);
    LOBYTE(v16) = 1;
  }
  else
  {
    int v49 = v12;
    BOOL v22 = bls_backlight_log();
    if (v15)
    {
      id v17 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        long long v46 = [v6 identifier];
        long long v50 = NSStringFromBLSBacklightState();
        objc_msgSend(v7, "bls_visualState");
        v52 = v13;
        os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [loga bls_shortLoggingString];
        __int16 v24 = objc_msgSend(v10, "bls_shortLoggingString");
        [v6 visualState];
        __int16 v25 = v55 = v10;
        objc_msgSend(v25, "bls_shortLoggingString");
        __int16 v16 = v60 = (char)v16;
        *(_DWORD *)buf = 134219778;
        id v64 = self;
        __int16 v65 = 2114;
        uint64_t v66 = v46;
        __int16 v67 = 2114;
        v68 = v50;
        __int16 v69 = 2114;
        uint64_t v70 = v23;
        __int16 v26 = (void *)v23;
        __int16 v71 = 1024;
        int v72 = v8;
        __int16 v73 = 1024;
        int v74 = 1;
        __int16 v75 = 2114;
        uint64_t v76 = v24;
        __int16 v77 = 2114;
        v78 = v16;
        _os_log_debug_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_DEBUG, "TSM:%p will not amend scene %{public}@ for backlightState:%{public}@ with settingsVisualState:%{public}@ willBeForeground:%{BOOL}u containsEnv:%{BOOL}u presentation:%{public}@ oldVisualState:%{public}@", buf, 0x4Au);

        unint64_t v10 = v55;
        uint64_t v13 = v52;

        LOBYTE(v16) = v60;
      }
    }
    else
    {
      id v17 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        long long v47 = [v6 identifier];
        long long v44 = NSStringFromBLSBacklightState();
        uint64_t v42 = BLSVisualStateForBacklightStateAndSettings(lock_backlightState, v7, v6, self->_inactiveBudgetPolicy, self->_osInterfaceProvider);
        __int16 v27 = objc_msgSend(v42, "bls_shortLoggingString");
        __int16 v36 = objc_msgSend(v10, "bls_shortLoggingString");
        __int16 v40 = [v6 visualState];
        __int16 v28 = objc_msgSend(v40, "bls_shortLoggingString");
        __int16 v38 = [v6 presentationDate];
        __int16 v34 = objc_msgSend(v38, "bls_shortLoggingString");
        objc_msgSend(v7, "bls_visualState");
        __int16 v16 = v61 = (char)v16;
        [v16 bls_shortLoggingString];
        uint64_t v29 = logb = v17;
        objc_msgSend(v7, "bls_presentationDate");
        uint64_t v30 = v56 = v10;
        objc_msgSend(v30, "bls_shortLoggingString");
        int v31 = v53 = v13;
        *(_DWORD *)buf = 134220546;
        id v64 = self;
        __int16 v65 = 2114;
        uint64_t v66 = v47;
        __int16 v67 = 2114;
        v68 = v44;
        __int16 v69 = 2114;
        uint64_t v70 = (uint64_t)v27;
        __int16 v71 = 1024;
        int v72 = v8;
        __int16 v73 = 1024;
        int v74 = v49;
        __int16 v75 = 2114;
        uint64_t v76 = v36;
        __int16 v77 = 2114;
        v78 = v28;
        __int16 v79 = 2114;
        uint64_t v80 = v34;
        __int16 v81 = 2114;
        id v82 = v29;
        __int16 v83 = 2114;
        id v84 = v31;
        _os_log_impl(&dword_21FCFC000, logb, OS_LOG_TYPE_INFO, "TSM:%p would have (but will not) amend scene %{public}@ for backlightState:%{public}@ with visualState:%{public}@ – willBeForeground:%{BOOL}u containsEnv:%{BOOL}u presentation:%{public}@ oldVisualState:%{public}@ oldPresentationDate:%{public}@ settingsVisualState:%{public}@ settingsPresentationDate:%{public}@", buf, 0x68u);

        unint64_t v10 = v56;
        LOBYTE(v16) = v61;

        uint64_t v13 = v53;
        id v17 = logb;
      }
    }
  }

  return (char)v16;
}

- (void)presentationEngine:(id)a3 didUpdateToCurrentWithSpecifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_lock_ensureFlipbookCurrentOperation;
  [(BLSHEnsureFlipbookCurrentOperation *)v6 setCompleted:1];
  id v7 = bls_backlight_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  char v9 = bls_backlight_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (!v10) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 134218498;
    int v15 = self;
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v5;
    BOOL v11 = "TSM:%p completed ensureFlipbookCurrentOperation %{public}@, flipbook did update to current with:%{public}@";
    int v12 = v9;
    uint32_t v13 = 32;
  }
  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 134218242;
    int v15 = self;
    __int16 v16 = 2114;
    id v17 = v6;
    BOOL v11 = "TSM:%p completed ensureFlipbookCurrentOperation %{public}@";
    int v12 = v9;
    uint32_t v13 = 22;
  }
  _os_log_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
LABEL_7:

  os_unfair_lock_unlock(&self->_lock);
  if (v6) {
    BSDispatchMain();
  }
}

void __90__BLSHBacklightTransitionStateMachine_presentationEngine_didUpdateToCurrentWithSpecifier___block_invoke(uint64_t a1)
{
}

- (void)presentationEngine:(id)a3 didInvalidateContentForEnvironment:(id)a4 reason:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  os_unfair_lock_lock(&self->_lock);
  BOOL v9 = !self->_lock_flipbookIsStale && self->_lock_session != 0;
  self->_lock_flipbookIsStale = 1;
  BOOL v10 = bls_backlight_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    BOOL v11 = [v7 identifier];
    *(_DWORD *)buf = 134218498;
    int v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = v11;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_debug_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_DEBUG, "TSM:%p flipbookIsStale=YES env:%{public}@ invalidateContentForReason:%{public}@", buf, 0x20u);
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __100__BLSHBacklightTransitionStateMachine_presentationEngine_didInvalidateContentForEnvironment_reason___block_invoke;
    block[3] = &unk_264532258;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __100__BLSHBacklightTransitionStateMachine_presentationEngine_didInvalidateContentForEnvironment_reason___block_invoke(uint64_t a1)
{
}

- (void)displayState:(id)a3 didUpdateToMode:(int64_t)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_didNotifyDisplayModeTransitionStartedButNotCompleted
    && self->_lock_lastNotifiedTargetDisplayMode == a4)
  {
    p_unint64_t lock_lastNotifiedCompletedDisplayMode = &self->_lock_lastNotifiedCompletedDisplayMode;
    unint64_t lock_lastNotifiedCompletedDisplayMode = self->_lock_lastNotifiedCompletedDisplayMode;
    self->_lock_didNotifyDisplayModeTransitionStartedButNotCompleted = 0;
    BOOL v10 = lock_lastNotifiedCompletedDisplayMode != a4;
LABEL_9:
    int64_t *p_lock_lastNotifiedCompletedDisplayMode = a4;
    int v9 = 1;
    goto LABEL_10;
  }
  p_unint64_t lock_lastNotifiedCompletedDisplayMode = &self->_lock_lastNotifiedCompletedDisplayMode;
  unint64_t lock_lastNotifiedCompletedDisplayMode = self->_lock_lastNotifiedCompletedDisplayMode;
  if (lock_lastNotifiedCompletedDisplayMode != a4)
  {
    BOOL v10 = 1;
    goto LABEL_9;
  }
  int v9 = 0;
  BOOL v10 = 0;
  unint64_t lock_lastNotifiedCompletedDisplayMode = a4;
LABEL_10:
  BOOL v11 = [(BLSHPendingUpdateDisplayMode *)self->_lock_pendingUpdateDisplayMode updateOperation];
  int v12 = v11;
  if (self->_lock_pendingUpdateDisplayMode && [v11 targetDisplayMode] == a4)
  {
    [v12 setCompleted:1];
    unint64_t v13 = [v12 currentDisplayMode];
    int v14 = bls_backlight_log();
    if (os_log_type_enabled(v14, (os_log_type_t)(v13 == lock_lastNotifiedCompletedDisplayMode)))
    {
      __int16 v15 = NSStringFromBLSBacklightDisplayMode(v13);
      *(_DWORD *)buf = 134218754;
      long long v44 = self;
      __int16 v45 = 2114;
      long long v46 = v12;
      __int16 v47 = 1024;
      *(_DWORD *)long long v48 = v13 == lock_lastNotifiedCompletedDisplayMode;
      *(_WORD *)&v48[4] = 2114;
      *(void *)&v48[6] = v15;
      _os_log_impl(&dword_21FCFC000, v14, (os_log_type_t)(v13 == lock_lastNotifiedCompletedDisplayMode), "TSM:%p completed updateOperation:%{public}@ modeMatches:%{BOOL}u lastNotifiedMode:%{public}@", buf, 0x26u);
    }
    LODWORD(v16) = 1;
  }
  else
  {
    LODWORD(v16) = 0;
    unint64_t v13 = lock_lastNotifiedCompletedDisplayMode;
  }
  __int16 v17 = [(BLSHPendingUpdateDisplayMode *)self->_lock_pendingUpdateDisplayMode rampOperation];
  id v18 = v17;
  uint64_t v41 = v12;
  int v40 = v16;
  if (v17 && [v17 targetDisplayMode] == a4)
  {
    [v18 setCompleted:1];
    unint64_t v13 = [v12 currentDisplayMode];
    uint64_t v16 = bls_backlight_log();
    if (os_log_type_enabled((os_log_t)v16, (os_log_type_t)(v13 == lock_lastNotifiedCompletedDisplayMode)))
    {
      NSStringFromBLSBacklightDisplayMode(v13);
      v19 = int v37 = v9;
      *(_DWORD *)buf = 134218754;
      long long v44 = self;
      __int16 v45 = 2114;
      long long v46 = v12;
      __int16 v47 = 1024;
      *(_DWORD *)long long v48 = v13 == lock_lastNotifiedCompletedDisplayMode;
      *(_WORD *)&v48[4] = 2114;
      *(void *)&v48[6] = v19;
      _os_log_impl(&dword_21FCFC000, (os_log_t)v16, (os_log_type_t)(v13 == lock_lastNotifiedCompletedDisplayMode), "TSM:%p completed rampOperation:%{public}@ modeMatches:%{BOOL}u lastNotifiedMode:%{public}@", buf, 0x26u);

      int v9 = v37;
    }

    int v20 = 1;
    LOBYTE(v16) = v40;
  }
  else
  {
    int v20 = 0;
  }
  if (v10) {
    unint64_t v21 = lock_lastNotifiedCompletedDisplayMode;
  }
  else {
    unint64_t v21 = v13;
  }
  if (v9) {
    unint64_t lock_lastNotifiedCompletedDisplayMode = v21;
  }
  lock_targetState = self->_lock_targetState;
  if (!lock_targetState) {
    goto LABEL_32;
  }
  char v23 = (v16 | v20) ^ 1;
  if (!self->_lock_pendingUpdateDisplayMode) {
    char v23 = 1;
  }
  if (v23)
  {
LABEL_32:
    int v24 = v9;
    BOOL v39 = 0;
  }
  else
  {
    int v24 = v9;
    uint64_t v25 = [(BLSHBacklightMutableTargetState *)lock_targetState displayMode];
    __int16 v26 = [(BLSHPendingUpdateDisplayMode *)self->_lock_pendingUpdateDisplayMode last];
    BOOL v39 = v25 == [v26 targetDisplayMode];
  }
  __int16 v27 = (void *)[(NSMutableArray *)self->_lock_activeEvents copy];
  __int16 v28 = (void *)[(NSMutableArray *)self->_lock_abortedEvents copy];
  uint64_t v29 = bls_backlight_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    __int16 v38 = NSStringFromBLSBacklightDisplayMode(a4);
    uint64_t v32 = NSStringFromBLSBacklightDisplayMode(lock_lastNotifiedCompletedDisplayMode);
    lock_pendingUpdateDisplayMode = self->_lock_pendingUpdateDisplayMode;
    __int16 v36 = (void *)v32;
    uint64_t v33 = NSStringFromBLSBacklightChangeEvents();
    *(_DWORD *)buf = 134220034;
    long long v44 = self;
    __int16 v45 = 2114;
    long long v46 = v38;
    __int16 v47 = 2114;
    *(void *)long long v48 = v36;
    *(_WORD *)&v48[8] = 1024;
    *(_DWORD *)&v48[10] = v40;
    __int16 v49 = 1024;
    int v50 = v20;
    __int16 v51 = 1024;
    BOOL v52 = v39;
    __int16 v53 = 1024;
    int v54 = v24;
    __int16 v55 = 2114;
    v56 = lock_pendingUpdateDisplayMode;
    __int16 v57 = 2114;
    __int16 v34 = (void *)v33;
    uint64_t v58 = v33;
    _os_log_debug_impl(&dword_21FCFC000, v29, OS_LOG_TYPE_DEBUG, "TSM:%p didUpdateToMode:%{public}@ fromMode:%{public}@ matchesUpdate:%{BOOL}u matchesRamp:%{BOOL}u matchesTargetDisplayMode:%{BOOL}u shouldNotify:%{BOOL}u update:%{public}@ events:%{public}@", buf, 0x4Cu);
  }
  os_unfair_lock_unlock(lock);
  id v30 = v28;
  id v31 = v27;
  BSDispatchMain();
}

void __68__BLSHBacklightTransitionStateMachine_displayState_didUpdateToMode___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v2 = [*(id *)(a1 + 32) performerDelegate];
    [v2 backlight:*(void *)(a1 + 32) didUpdateToDisplayMode:*(void *)(a1 + 56) fromDisplayMode:*(void *)(a1 + 64) activeEvents:*(void *)(a1 + 40) abortedEvents:*(void *)(a1 + 48)];
  }
  if (*(unsigned char *)(a1 + 73))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    -[BLSHBacklightTransitionStateMachine onMain_performNextStepInTransition](v3);
  }
}

- (BOOL)hasEnsureFlipbookCurrent
{
  uint64_t v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_ensureFlipbookCurrentOperation != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)abortContextForTimer:(id)a3
{
  BOOL v4 = [(BLSHOSInterfaceProviding *)self->_osInterfaceProvider systemSleepMonitor];
  uint64_t v19 = [BLSHBacklightTransitionStateMachineAbortContext alloc];
  pendingPrewarmedEvent = self->_pendingPrewarmedEvent;
  lock_targetState = self->_lock_targetState;
  currentState = self->_currentState;
  lock_activeEvents = self->_lock_activeEvents;
  lock_abortedEvents = self->_lock_abortedEvents;
  lock_pendingEnvironmentUpdate = self->_lock_pendingEnvironmentUpdate;
  lock_pendingUpdatePresentation = self->_lock_pendingUpdatePresentation;
  long long v16 = *(_OWORD *)&self->_lock_pendingUpdateToSpecifier;
  lock_ensureFlipbookCurrentOperation = self->_lock_ensureFlipbookCurrentOperation;
  lock_queuedEventsToPerform = self->_lock_queuedEventsToPerform;
  environmentStateMachine = self->_environmentStateMachine;
  unint64_t v13 = [v4 aggregateState];
  int v14 = -[BLSHBacklightTransitionStateMachineAbortContext initWithCurrentState:targetState:activeEvents:abortedEvents:pendingEnvironmentUpdate:pendingUpdatePresentation:pendingUpdateToSpecifier:pendingUpdateDisplayMode:ensureFlipbookCurrentOperation:queuedEventsToPerform:pendingPrewarmedEvent:environmentStateMachine:sleepMonitorAggregateState:](v19, "initWithCurrentState:targetState:activeEvents:abortedEvents:pendingEnvironmentUpdate:pendingUpdatePresentation:pendingUpdateToSpecifier:pendingUpdateDisplayMode:ensureFlipbookCurrentOperation:queuedEventsToPerform:pendingPrewarmedEvent:environmentStateMachine:sleepMonitorAggregateState:", currentState, lock_targetState, lock_activeEvents, lock_abortedEvents, lock_pendingEnvironmentUpdate, lock_pendingUpdatePresentation, v16, lock_ensureFlipbookCurrentOperation, lock_queuedEventsToPerform, pendingPrewarmedEvent, environmentStateMachine, v13);

  return v14;
}

- (id)identifier
{
  uint64_t v2 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)osInterfaceProvider
{
  return self->_osInterfaceProvider;
}

- (id)allFlipbookFrames
{
  return [(BLSHAlwaysOnPresentationEngine *)self->_alwaysOnPresentationEngine allFlipbookFrames];
}

- (id)frameWithUUID:(id)a3
{
  return [(BLSHAlwaysOnPresentationEngine *)self->_alwaysOnPresentationEngine frameWithUUID:a3];
}

- (id)frameOnGlassNow
{
  return [(BLSHAlwaysOnPresentationEngine *)self->_alwaysOnPresentationEngine frameOnGlassNow];
}

- (id)frameOnGlassWhenFlipbookLastCancelled
{
  return [(BLSHAlwaysOnPresentationEngine *)self->_alwaysOnPresentationEngine frameOnGlassWhenFlipbookLastCancelled];
}

- (BLSHBacklightPlatformProvider)platformProvider
{
  return self->_platformProvider;
}

- (BLSHBacklightDisplayStateMachine)displayStateMachine
{
  return self->_displayStateMachine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayStateMachine, 0);
  objc_storeStrong((id *)&self->_platformProvider, 0);
  objc_storeStrong((id *)&self->_lock_abortedEvents, 0);
  objc_storeStrong((id *)&self->_lock_activeEvents, 0);
  objc_storeStrong((id *)&self->_lock_queuedEventsToPerform, 0);
  objc_storeStrong((id *)&self->_pendingPrewarmedEvent, 0);
  objc_storeStrong((id *)&self->_lock_targetState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_lock_session, 0);
  objc_storeStrong((id *)&self->_lock_ensureFlipbookCurrentOperation, 0);
  objc_storeStrong((id *)&self->_lock_pendingUpdateDisplayMode, 0);
  objc_storeStrong((id *)&self->_lock_pendingUpdateToSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_pendingUpdatePresentation, 0);
  objc_storeStrong((id *)&self->_lock_pendingEnvironmentUpdate, 0);
  objc_storeStrong((id *)&self->_lock_stopEngineOnScreenSpecifier, 0);
  objc_storeStrong((id *)&self->_transitionAPAwakeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_performerDelegate, 0);
  objc_storeStrong((id *)&self->_touchLockAssertion, 0);
  objc_storeStrong((id *)&self->_onMain_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_alwaysOnPresentationEngine, 0);
  objc_storeStrong((id *)&self->_environmentStateMachine, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);

  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, 0);
}

- (void)initWithPlatformProvider:osInterfaceProvider:inactiveBudgetPolicy:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)withLock_ensureTargetStateCreated
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(a2, "bls_shortLoggingString");
  int v6 = 134218242;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "TSM:%p created target:%{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)lock_displayModeForBacklightState:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHandlersForService:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHandlersForService:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHandlersForService:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerHandlersForService:.cold.4()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)onMainWithLock_performEventOperationIfNeededWhenBeforeDisplayBlankingChange:.cold.1()
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "TSM:%p (findNextOperation) pending:%{public}@");
}

- (void)onMainWithLock_environmentUpdateOperationForEvents:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "TSM:%p (findNextOperation) will start:%{public}@");
}

- (void)onMainWithLock_updateSpecifierOperationIfNeeded
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "TSM:%p (findNextOperation) still pending:%{public}@");
}

- (void)onMainWithLock_updatePresentationOperationIfNeeded
{
  OUTLINED_FUNCTION_10_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21FCFC000, v0, v1, "TSM:%p (findNextOperation) returning existing updatePresentation operation: %{public}@");
}

- (void)onMainWithLock_updateDisplayOrEngineOperationIfNeeded
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_15(&dword_21FCFC000, v0, v1, "TSM:%p (findNextOperation) animating:%{BOOL}u forcedUnanimated:%{BOOL}u pending:%{public}@");
}

- (void)_lock_ensureFlipbookCurrent
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0(&dword_21FCFC000, v0, v1, "TSM:%p flipbookIsStale=NO ensureCurrent completed", v2, v3, v4, v5, v6);
}

- (void)ifStillValidPerformAlwaysOnBrightnessRamp:withDuration:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)inactiveEnvironmentSession:updateToPresentation:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end