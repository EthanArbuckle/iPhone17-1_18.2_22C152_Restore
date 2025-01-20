@interface BLSHBacklightDisplayStateMachine
- (BLSHBacklightDisplayStateMachine)initWithDelegate:(id)a3 platformProvider:(id)a4 osInterfaceProvider:(id)a5;
- (BLSHBacklightDisplayStateMachineDelegate)delegate;
- (BOOL)isHighLuminanceAlwaysOn;
- (BOOL)isTransitioningDisplayMode;
- (BOOL)releaseLiveRenderingSystemActivityAssertion;
- (NSString)description;
- (id)abortContextForTimer:(id)a3;
- (id)identifier;
- (id)osInterfaceProvider;
- (int64_t)displayMode;
- (int64_t)lastSteadyStateDisplayMode;
- (os_unfair_lock_s)switchToFlipbookState:(os_unfair_lock_s *)result;
- (os_unfair_lock_s)transitionToCADisplayState:(os_unfair_lock_s *)result;
- (uint64_t)displayModeForOSInterfaceProvider:(uint64_t)a1;
- (void)_acquireLiveRenderingSystemActivityAssertion;
- (void)acquireDisplayPowerAssertionForReason:(uint64_t)a1;
- (void)acquireLiveRenderingSystemActivityAssertionIfNecessary:(uint64_t)a1;
- (void)dealloc;
- (void)onMain_performNextStepInModeTransition;
- (void)osInterfaceProvider:(id)a3 didCompleteSwitchToCBFlipbookState:(int64_t)a4 withError:(id)a5;
- (void)osInterfaceProvider:(id)a3 didCompleteTransitionToCADisplayState:(int64_t)a4 currentState:(int64_t)a5 transitionStatus:(int64_t)a6;
- (void)osInterfaceProvider:(id)a3 didCompleteTransitionToCBDisplayMode:(int64_t)a4 withError:(id)a5;
- (void)prewarmForDisplayMode:(int64_t)a3;
- (void)releaseDisplayPowerAssertion;
- (void)releaseLiveRenderingSystemActivityAssertion;
- (void)replaceCurrentWatchdog;
- (void)resumeDisplayMode:(int64_t)a3;
- (void)setDisplayMode:(int64_t)a3 withRampDuration:(double)a4;
- (void)setHighLuminanceAlwaysOn:(BOOL)a3;
- (void)transitionToDisplayMode:(int)a3 withDuration:(double)a4 shouldWaitForCompletion:;
@end

@implementation BLSHBacklightDisplayStateMachine

- (BLSHBacklightDisplayStateMachine)initWithDelegate:(id)a3 platformProvider:(id)a4 osInterfaceProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)BLSHBacklightDisplayStateMachine;
  v11 = [(BLSHBacklightDisplayStateMachine *)&v29 init];
  uint64_t v12 = (uint64_t)v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    unint64_t v13 = -[BLSHBacklightDisplayStateMachine displayModeForOSInterfaceProvider:]((uint64_t)v11, v10);
    *(void *)(v12 + 104) = v13;
    *(void *)(v12 + 112) = v13;
    *(_DWORD *)(v12 + 56) = 0;
    *(void *)(v12 + 64) = v13;
    *(void *)(v12 + 72) = 0;
    *(void *)(v12 + 80) = 0;
    *(void *)(v12 + 88) = 0;
    *(void *)(v12 + 96) = 2;
    [v10 setDisplayStateDelegate:v12];
    uint64_t v14 = [v10 cbDisplayMode];
    *(void *)(v12 + 128) = 0;
    *(void *)(v12 + 136) = v14;
    *(_OWORD *)(v12 + 144) = 0u;
    *(_OWORD *)(v12 + 160) = 0u;
    *(void *)(v12 + 176) = 0;
    *(_OWORD *)(v12 + 184) = xmmword_21FD8B4B0;
    *(void *)(v12 + 120) = v14;
    uint64_t v15 = [v10 cbFlipbookState];
    uint64_t v16 = mach_continuous_time();
    *(_DWORD *)(v12 + 200) = 0;
    *(void *)(v12 + 208) = v15;
    *(void *)(v12 + 216) = 2;
    *(void *)(v12 + 224) = v16;
    *(void *)(v12 + 232) = v15;
    objc_storeStrong((id *)(v12 + 32), a5);
    objc_storeWeak((id *)(v12 + 320), v8);
    objc_initWeak(&location, (id)v12);
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __90__BLSHBacklightDisplayStateMachine_initWithDelegate_platformProvider_osInterfaceProvider___block_invoke;
    v26 = &unk_264532938;
    objc_copyWeak(&v27, &location);
    *(void *)(v12 + 312) = os_state_add_handler();
    if ((IsOffForBLSBacklightDisplayMode(v13) & 1) == 0)
    {
      uint64_t v17 = objc_msgSend(*(id *)(v12 + 32), "acquireDisplayPowerAssertionForReason:", 0, v23, 3221225472, __90__BLSHBacklightDisplayStateMachine_initWithDelegate_platformProvider_osInterfaceProvider___block_invoke, &unk_264532938);
      v18 = *(void **)(v12 + 280);
      *(void *)(v12 + 280) = v17;
    }
    -[BLSHBacklightDisplayStateMachine acquireLiveRenderingSystemActivityAssertionIfNecessary:](v12, v13);
    if (v13 - 2 > 4) {
      uint64_t v19 = 100;
    }
    else {
      uint64_t v19 = qword_21FD8B4D0[v13 - 2];
    }
    uint64_t v20 = objc_msgSend(v10, "createDisplayPowerResourceHintWithState:", v19, v23, v24, v25, v26);
    v21 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v20;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return (BLSHBacklightDisplayStateMachine *)v12;
}

- (uint64_t)displayModeForOSInterfaceProvider:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 caDisplayState];
    uint64_t v6 = [v4 cbDisplayMode];
    if (v5 == 3)
    {
      a1 = 1;
    }
    else
    {
      a1 = v6;
      if (v6)
      {
        if (v5 == 2)
        {
          a1 = 2;
        }
        else if (v5 == 1)
        {
          char v7 = [v4 isShowingBlankingWindow];
          uint64_t v8 = 3;
          if (a1 != 1) {
            uint64_t v8 = 4;
          }
          if (a1 == 4) {
            uint64_t v8 = 6;
          }
          if (v7) {
            a1 = 5;
          }
          else {
            a1 = v8;
          }
        }
        else
        {
          a1 = 0;
        }
      }
    }
  }

  return a1;
}

uint64_t __90__BLSHBacklightDisplayStateMachine_initWithDelegate_platformProvider_osInterfaceProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];
  uint64_t v3 = BLSStateDataWithTitleDescriptionAndHints();

  return v3;
}

- (void)acquireLiveRenderingSystemActivityAssertionIfNecessary:(uint64_t)a1
{
  if (a1 && !IsBlankedForBLSBacklightDisplayMode(a2))
  {
    char v4 = WouldUserExpectDisplayToBeActiveForBLSBacklightDisplayMode(a2);
    uint64_t v5 = *(void **)(a1 + 16);
    if (v4)
    {
      [v5 stopWatchdog];
    }
    else
    {
      if (!v5)
      {
        uint64_t v6 = [[BLSHTTRWatchdog alloc] initWithOSProvider:*(void *)(a1 + 32) configurationProvider:&__block_literal_global_25 detailProvider:&__block_literal_global_122];
        char v7 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v6;

        uint64_t v5 = *(void **)(a1 + 16);
      }
      [v5 startWatchdog];
    }
    -[BLSHBacklightDisplayStateMachine _acquireLiveRenderingSystemActivityAssertion](a1);
  }
}

- (void)dealloc
{
  if (self->_stateHandler) {
    os_state_remove_handler();
  }
  [(BLSHTTRWatchdog *)self->_liveRenderingTTRWatchdog stopWatchdog];
  [(BLSHSystemActivityAsserting *)self->_lock_liveRenderingSystemActivityAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BLSHBacklightDisplayStateMachine;
  [(BLSHBacklightDisplayStateMachine *)&v3 dealloc];
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  uint64_t v4 = [(BLSHBacklightOSInterfaceProviding *)self->_osInterface isShowingBlankingWindow];
  uint64_t v5 = [MEMORY[0x263F29C40] builderWithObject:self];
  unint64_t displayMode = self->_lock_displayRampOperation.displayMode;
  char v7 = NSStringFromBLSBacklightDisplayMode(displayMode);
  [v5 appendString:v7 withName:@"displayMode"];

  id v8 = (id)[v5 appendBool:self->_lock_displayRampOperation.phase != 2 withName:@"transitioning"];
  id v9 = (id)[v5 appendBool:self->_lock_caDisplayStateChangeOperation.phase == 1 withName:@"updatingCA" ifEqualTo:1];
  unint64_t lock_prewarmingDisplayMode = self->_lock_prewarmingDisplayMode;
  if (self->_lock_isPrewarmingDisplayMode)
  {
    v11 = NSStringFromBLSBacklightDisplayMode(lock_prewarmingDisplayMode);
    uint64_t v12 = @"prewarmingDisplayMode";
  }
  else
  {
    if (displayMode != lock_prewarmingDisplayMode) {
      goto LABEL_6;
    }
    v11 = NSStringFromBLSBacklightDisplayMode(displayMode);
    uint64_t v12 = @"prewarmedDisplayMode";
  }
  [v5 appendString:v11 withName:v12];

LABEL_6:
  if (self->_lock_displayRampOperation.phase == 2)
  {
    if (self->_lock_cbDisplayModeTransitionOperation.phase == 2) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  unint64_t v13 = NSStringFromBLSBacklightDisplayMode(self->_lock_lastSteadyStateDisplayMode);
  [v5 appendString:v13 withName:@"lastSteadyStateMode"];

  if (self->_lock_cbDisplayModeTransitionOperation.phase != 2)
  {
LABEL_14:
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%u->%u", self->_lock_completedCBDisplayMode, self->_lock_cbDisplayModeTransitionOperation.cbDisplayMode);
    if (self->_lock_cbDisplayModeTransitionOperation.shouldWait) {
      uint64_t v17 = @"waitingForCBDisplayMode";
    }
    else {
      uint64_t v17 = @"pendingCBDisplayMode";
    }
    [v5 appendString:v16 withName:v17];

    goto LABEL_18;
  }
  if (self->_lock_cbDisplayModeTransitionOperation.shouldWait) {
    uint64_t v14 = @"completedWaitForCBDisplayMode";
  }
  else {
    uint64_t v14 = @"completedCBDisplayMode";
  }
  id v15 = (id)[v5 appendInteger:self->_lock_cbDisplayModeTransitionOperation.cbDisplayMode withName:v14];
LABEL_18:
  if (self->_lock_cbFlipbookStateChangeOperation.phase != 2)
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%u->%u", self->_lock_completedCBFlipbookState, self->_lock_cbFlipbookStateChangeOperation.cbFlipbookState);
    [v5 appendString:v18 withName:@"pendingCBFlipbookState"];
  }
  id v19 = (id)[v5 appendObject:self->_lock_liveRenderingSystemActivityAssertion withName:@"liveAssertion" skipIfNil:1];
  os_unfair_lock_unlock(p_lock);
  [(BLSHBacklightOSInterfaceProviding *)self->_osInterface caDisplayState];
  uint64_t v20 = NSStringFromCADisplayState();
  id v21 = (id)[v5 appendObject:v20 withName:@"caDisplayState"];

  v22 = NSStringFromCBDisplayMode_bls([(BLSHBacklightOSInterfaceProviding *)self->_osInterface cbDisplayMode]);
  id v23 = (id)[v5 appendObject:v22 withName:@"cbDisplayMode"];

  id v24 = (id)[v5 appendBool:v4 withName:@"showingBlankingWindow" ifEqualTo:1];
  id v25 = (id)objc_msgSend(v5, "appendInteger:withName:", -[BLSHBacklightOSInterfaceProviding cbFlipbookState](self->_osInterface, "cbFlipbookState"), @"cbFlipbookState");
  v26 = [v5 build];

  return (NSString *)v26;
}

- (int64_t)displayMode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t displayMode = self->_lock_displayRampOperation.displayMode;
  os_unfair_lock_unlock(p_lock);
  return displayMode;
}

- (int64_t)lastSteadyStateDisplayMode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_lastSteadyStateDisplayMode = self->_lock_lastSteadyStateDisplayMode;
  os_unfair_lock_unlock(p_lock);
  return lock_lastSteadyStateDisplayMode;
}

- (BOOL)isTransitioningDisplayMode
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_displayRampOperation.phase == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isHighLuminanceAlwaysOn
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_highLuminanceAlwaysOn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHighLuminanceAlwaysOn:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_highLuminanceAlwaysOn == v3)
  {
    self->_lock_highLuminanceAlwaysOn = v3;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    BOOL v6 = IsAlwaysOnBrightnessForBLSBacklightDisplayMode(self->_lock_displayRampOperation.displayMode);
    self->_lock_highLuminanceAlwaysOn = v3;
    os_unfair_lock_unlock(p_lock);
    if (v6) {
      BSDispatchMain();
    }
  }
}

void __61__BLSHBacklightDisplayStateMachine_setHighLuminanceAlwaysOn___block_invoke(uint64_t a1)
{
}

- (void)onMain_performNextStepInModeTransition
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)acquireDisplayPowerAssertionForReason:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    uint64_t v5 = [*(id *)(a1 + 32) acquireDisplayPowerAssertionForReason:a2];
    uint64_t v6 = *(void **)(a1 + 280);
    *(void *)(a1 + 280) = v5;

    os_unfair_lock_unlock(v4);
  }
}

- (void)releaseDisplayPowerAssertion
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    [*(id *)(a1 + 280) invalidate];
    BOOL v3 = *(void **)(a1 + 280);
    *(void *)(a1 + 280) = 0;

    os_unfair_lock_unlock(v2);
  }
}

- (void)prewarmForDisplayMode:(int64_t)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 3) <= 3) {
    [(BLSDisplayPowerResourceHint *)self->_powerResourceHint updateState:101];
  }
  uint64_t v5 = [(BLSHBacklightOSInterfaceProviding *)self->_osInterface cbDisplayMode];
  os_unfair_lock_lock(&self->_lock);
  int lock_isPrewarmingDisplayMode = self->_lock_isPrewarmingDisplayMode;
  unint64_t lock_prewarmingDisplayMode = self->_lock_prewarmingDisplayMode;
  LODWORD(v7) = IsOffForBLSBacklightDisplayMode(a3);
  unint64_t displayMode = self->_lock_displayRampOperation.displayMode;
  if (displayMode == a3) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = v7 ^ 1;
  }
  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    unsigned int v10 = 0;
  }
  else {
    unsigned int v10 = v9;
  }
  int64_t phase = self->_lock_cbFlipbookStateChangeOperation.phase;
  lock_caDisplayPowerAssertion = self->_lock_caDisplayPowerAssertion;
  self->_unint64_t lock_prewarmingDisplayMode = a3;
  unsigned int v29 = v10;
  if (displayMode != a3) {
    int lock_isPrewarmingDisplayMode = 0;
  }
  self->_int lock_isPrewarmingDisplayMode = displayMode != a3;
  if (displayMode != a3) {
    self->_lock_prewarmingDisplayMode_startTimestamp = mach_continuous_time();
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v12 = bls_backlight_log();
  unint64_t v13 = v12;
  if (lock_isPrewarmingDisplayMode) {
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled(v12, v14))
  {
    NSStringFromBLSBacklightDisplayMode(displayMode);
    uint64_t v15 = v25 = v7 ^ 1;
    v26 = (void *)v15;
    uint64_t v16 = NSStringFromBLSBacklightDisplayMode(a3);
    int64_t v17 = phase;
    v18 = (void *)v16;
    char v27 = (char)v7;
    if (v17 == 1) {
      uint64_t v7 = " (interrupting ramp)";
    }
    else {
      uint64_t v7 = "";
    }
    uint64_t v19 = NSStringFromBLSBacklightDisplayMode(lock_prewarmingDisplayMode);
    unint64_t v20 = v5;
    id v21 = (void *)v19;
    NSStringFromCBDisplayMode_bls(v20);
    *(_DWORD *)buf = 134220546;
    v32 = self;
    __int16 v33 = 2114;
    uint64_t v34 = v15;
    __int16 v35 = 2114;
    v36 = v18;
    __int16 v37 = 2080;
    v38 = v7;
    __int16 v39 = 2114;
    v40 = v21;
    __int16 v41 = 1024;
    BOOL v42 = lock_caDisplayPowerAssertion != 0;
    __int16 v43 = 1024;
    unsigned int v44 = v25;
    __int16 v45 = 1024;
    LOBYTE(v7) = v27;
    BOOL v46 = displayMode != a3;
    __int16 v47 = 1024;
    unsigned int v48 = v29;
    __int16 v49 = 1024;
    int v50 = lock_isPrewarmingDisplayMode;
    v52 = __int16 v51 = 2114;
    int v22 = lock_isPrewarmingDisplayMode;
    id v23 = (void *)v52;
    _os_log_impl(&dword_21FCFC000, v13, v14, "DSM:%p prewarmForDisplayMode:%{public}@->%{public}@%s previousPrewarm:%{public}@ hasAssertion:%{BOOL}u isPrewarmOn:%{BOOL}u requiresModeChange:%{BOOL}u shouldSignalPowerOn:%{BOOL}u shouldCleanup:%{BOOL}u cbDisplayMode:%{public}@", buf, 0x5Cu);

    int lock_isPrewarmingDisplayMode = v22;
  }

  if (v7)
  {
    if (lock_caDisplayPowerAssertion) {
      char v24 = 1;
    }
    else {
      char v24 = lock_isPrewarmingDisplayMode;
    }
    int lock_isPrewarmingDisplayMode = (displayMode == a3) & v24;
  }
  else if (!lock_caDisplayPowerAssertion)
  {
    -[BLSHBacklightDisplayStateMachine acquireDisplayPowerAssertionForReason:]((uint64_t)self, 1);
  }
  -[BLSHBacklightDisplayStateMachine acquireLiveRenderingSystemActivityAssertionIfNecessary:]((uint64_t)self, a3);
  if (displayMode != a3) {
    -[BLSHBacklightDisplayStateMachine replaceCurrentWatchdog]((uint64_t)self);
  }
  if (lock_isPrewarmingDisplayMode) {
    BSDispatchMain();
  }
}

- (void)replaceCurrentWatchdog
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    BOOL v3 = *(void **)(a1 + 8);
    if (v3)
    {
      uint64_t v4 = [v3 explanation];
      uint64_t v5 = bls_diagnostics_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 134218242;
        double v9 = 20.0 + 2.0;
        __int16 v10 = 2114;
        v11 = v4;
        _os_log_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_INFO, "replacing existing watchdog with new watchdog for %.1fs: %{public}@", (uint8_t *)&v8, 0x16u);
      }

      [*(id *)(a1 + 8) invalidate:1];
      uint64_t v6 = [*(id *)(a1 + 32) scheduleWatchdogWithDelegate:a1 explanation:v4 timeout:20.0 + 2.0 + 2.0];
      uint64_t v7 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v6;
    }
    os_unfair_lock_unlock(v2);
  }
}

void __58__BLSHBacklightDisplayStateMachine_prewarmForDisplayMode___block_invoke(uint64_t a1)
{
}

- (void)setDisplayMode:(int64_t)a3 withRampDuration:(double)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 3) <= 3) {
    [(BLSDisplayPowerResourceHint *)self->_powerResourceHint updateState:101];
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v7 = (self->_lock_sequenceNumber + 1);
  self->_lock_uint64_t sequenceNumber = v7;
  int64_t phase = self->_lock_displayRampOperation.phase;
  uint64_t sequenceNumber = self->_lock_displayRampOperation.sequenceNumber;
  unint64_t displayMode = self->_lock_displayRampOperation.displayMode;
  double duration = self->_lock_displayRampOperation.duration;
  double startSeconds = self->_lock_displayRampOperation.startSeconds;
  unint64_t v13 = 0x263F08000;
  if (phase == 2)
  {
    os_log_type_t v14 = bls_backlight_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = NSStringFromBLSBacklightDisplayMode(a3);
      *(_DWORD *)buf = 134218754;
      __int16 v41 = self;
      __int16 v42 = 2114;
      __int16 v43 = v15;
      __int16 v44 = 2048;
      double v45 = a4;
      __int16 v46 = 1024;
      int v47 = v7;
      _os_log_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_INFO, "DSM:%p setDisplayMode:%{public}@ duration:%lf seqId:%d", buf, 0x26u);
    }
  }
  else
  {
    double v16 = 0.0;
    if (self->_lock_cbDisplayModeTransitionOperation.phase == 1)
    {
      int64_t v17 = [(BLSHBacklightOSInterfaceProviding *)self->_osInterface now];
      [v17 timeIntervalSinceReferenceDate];
      double v16 = v18 - self->_lock_cbDisplayModeTransitionOperation.startSeconds;
    }
    uint64_t v19 = bls_backlight_log();
    os_log_type_t v14 = v19;
    if (v16 <= 3.0) {
      os_log_type_t v20 = OS_LOG_TYPE_INFO;
    }
    else {
      os_log_type_t v20 = OS_LOG_TYPE_FAULT;
    }
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v39 = sequenceNumber;
      v38 = NSStringFromBLSBacklightDisplayMode(a3);
      unint64_t v36 = displayMode;
      __int16 v37 = NSStringFromBLSBacklightDisplayMode(displayMode);
      id v21 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:startSeconds];
      objc_msgSend(v21, "bls_shortLoggingString");
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      if (v16 <= 3.0)
      {
        id v23 = &stru_26D1758B0;
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @" cbOperationIsOverdue! %lfs sinceCBOperationStart", *(void *)&v16);
        id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 134220034;
      __int16 v41 = self;
      __int16 v42 = 2114;
      __int16 v43 = v38;
      __int16 v44 = 2048;
      double v45 = a4;
      __int16 v46 = 1024;
      int v47 = v7;
      __int16 v48 = 2114;
      __int16 v49 = v37;
      __int16 v50 = 2048;
      double v51 = duration;
      __int16 v52 = 1024;
      int v53 = v39;
      __int16 v54 = 2114;
      id v55 = v22;
      __int16 v56 = 2114;
      v57 = v23;
      _os_log_impl(&dword_21FCFC000, v14, v20, "DSM:%p setDisplayMode:%{public}@ duration:%lf seqId:%d interrupting previous setDisplayMode:%{public}@ duration:%lf seqId:%d with started at:%{public}@%{public}@", buf, 0x54u);
      if (v16 > 3.0) {

      }
      uint64_t sequenceNumber = v39;
      unint64_t displayMode = v36;
    }
    unint64_t v13 = 0x263F08000uLL;
  }

  int64_t v24 = self->_lock_displayRampOperation.displayMode;
  unsigned int v25 = [(BLSHBacklightOSInterfaceProviding *)self->_osInterface now];
  [v25 timeIntervalSinceReferenceDate];
  self->_lock_displayRampOperation.uint64_t sequenceNumber = v7;
  self->_lock_displayRampOperation.unint64_t displayMode = a3;
  self->_lock_displayRampOperation.previousDisplayMode = v24;
  self->_lock_displayRampOperation.double duration = a4;
  self->_lock_displayRampOperation.double startSeconds = v26;
  self->_lock_displayRampOperation.int64_t phase = 1;

  self->_int lock_isPrewarmingDisplayMode = 0;
  [(BLSHWatchdogInvalidatable *)self->_watchdogTimer invalidate:1];
  char v27 = *(void **)(v13 + 2880);
  uint64_t v28 = NSStringFromBLSBacklightDisplayMode(a3);
  unsigned int v29 = (void *)v28;
  if (phase == 2)
  {
    v30 = [v27 stringWithFormat:@"%p transition to displayMode:%@ duration:%lf seqId:%d", self, v28, *(void *)&a4, v7];
  }
  else
  {
    v31 = NSStringFromBLSBacklightDisplayMode(displayMode);
    v32 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:startSeconds];
    __int16 v33 = objc_msgSend(v32, "bls_shortLoggingString");
    v30 = [v27 stringWithFormat:@"DSM:%p transition to displayMode:%@ duration:%lf seqId:%d interrupting previous setDisplayMode:%@ duration:%lf seqId:%d with started at:%@", self, v29, *(void *)&a4, v7, v31, *(void *)&duration, sequenceNumber, v33];
  }
  uint64_t v34 = [(BLSHBacklightOSInterfaceProviding *)self->_osInterface scheduleWatchdogWithDelegate:self explanation:v30 timeout:18.0];
  watchdogTimer = self->_watchdogTimer;
  self->_watchdogTimer = v34;

  os_unfair_lock_unlock(&self->_lock);
  -[BLSHBacklightDisplayStateMachine acquireLiveRenderingSystemActivityAssertionIfNecessary:]((uint64_t)self, a3);
  BSDispatchMain();
}

void __68__BLSHBacklightDisplayStateMachine_setDisplayMode_withRampDuration___block_invoke(uint64_t a1)
{
}

- (void)resumeDisplayMode:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t displayMode = self->_lock_displayRampOperation.displayMode;
  BOOL lock_isPrewarmingDisplayMode = self->_lock_isPrewarmingDisplayMode;
  self->_BOOL lock_isPrewarmingDisplayMode = 0;
  if (displayMode == a3)
  {
    if (lock_isPrewarmingDisplayMode)
    {
      int v8 = bls_backlight_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        double v9 = NSStringFromBLSBacklightDisplayMode(a3);
        *(_DWORD *)buf = 134218242;
        os_log_type_t v14 = self;
        __int16 v15 = 2114;
        double v16 = v9;
        _os_log_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_INFO, "DSM:%p resumed transition to display mode:%{public}@", buf, 0x16u);
      }
      os_unfair_lock_unlock(p_lock);
LABEL_9:
      BSDispatchMain();
      return;
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    __int16 v10 = bls_backlight_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11 = NSStringFromBLSBacklightDisplayMode(a3);
      uint64_t v12 = NSStringFromBLSBacklightDisplayMode(displayMode);
      *(_DWORD *)buf = 134218498;
      os_log_type_t v14 = self;
      __int16 v15 = 2114;
      double v16 = v11;
      __int16 v17 = 2114;
      double v18 = v12;
      _os_log_fault_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_FAULT, "DSM:%p resumed display mode:%{public}@ did not match current target:%{public}@", buf, 0x20u);
    }
    os_unfair_lock_unlock(p_lock);
    if (lock_isPrewarmingDisplayMode) {
      goto LABEL_9;
    }
  }
}

void __54__BLSHBacklightDisplayStateMachine_resumeDisplayMode___block_invoke(uint64_t a1)
{
}

id __91__BLSHBacklightDisplayStateMachine_acquireLiveRenderingSystemActivityAssertionIfNecessary___block_invoke()
{
  v0 = objc_opt_new();
  [v0 setIdentifier:@"bls_dsm_live_rendering_assertion"];
  [v0 setTimeout:90.0];
  [v0 setLeeway:2.0];
  [v0 setEnabledByDefault:0];

  return v0;
}

id __91__BLSHBacklightDisplayStateMachine_acquireLiveRenderingSystemActivityAssertionIfNecessary___block_invoke_2()
{
  v0 = objc_opt_new();
  [v0 setRadarTitle:@"DSM Live Rendering Assertion Held Longer Than 90s"];
  [v0 setRadarDescription:@"BacklightServices DisplayStateMachine held it's live rendering assertion for longer than 90s while not in the live display mode. This will cause higher power drain than necessary."];
  [v0 setDisplayReason:@"Live rendering assertion held for > 90 seconds"];
  SEL v1 = [MEMORY[0x263EFF910] now];
  [v0 setTimeOfIssue:v1];

  [v0 setShowTTRAlert:1];

  return v0;
}

- (void)_acquireLiveRenderingSystemActivityAssertion
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_21FCFC000, v0, (uint64_t)v0, "DSM:%p already have live rendering system activity assertion %{public}@", v1);
}

uint64_t __80__BLSHBacklightDisplayStateMachine__acquireLiveRenderingSystemActivityAssertion__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAcquireWaitsToAbortSleepRequested:0];
}

void __80__BLSHBacklightDisplayStateMachine__acquireLiveRenderingSystemActivityAssertion__block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  double v9 = bls_backlight_log();
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
    os_log_type_t v14 = objc_msgSend(v7, "bls_loggingString");
    int v15 = 134218754;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    uint64_t v18 = v13;
    __int16 v19 = 2114;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = v14;
    _os_log_impl(&dword_21FCFC000, v9, v10, "DSM:%p live rendering system activity assertion callback elapsed:%.4lfs details:%{public}@ error:%{public}@", (uint8_t *)&v15, 0x2Au);
  }
}

- (BOOL)releaseLiveRenderingSystemActivityAssertion
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v3 = *(void *)(a1 + 288);
  BOOL v4 = v3 != 0;
  if (v3)
  {
    uint64_t v5 = (id *)(a1 + 288);
    uint64_t v6 = bls_backlight_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BLSHBacklightDisplayStateMachine releaseLiveRenderingSystemActivityAssertion]();
    }

    [*v5 invalidate];
    id v7 = *v5;
    *uint64_t v5 = 0;
  }
  os_unfair_lock_unlock(v2);
  [*(id *)(a1 + 16) stopWatchdog];
  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;

  return v4;
}

- (os_unfair_lock_s)switchToFlipbookState:(os_unfair_lock_s *)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    BOOL v4 = result + 6;
    os_unfair_lock_lock(result + 6);
    if (*(void *)(v3 + 216) != 2)
    {
      uint64_t v5 = bls_backlight_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        [(BLSHBacklightDisplayStateMachine *)v3 switchToFlipbookState:v5];
      }
    }
    int v6 = *(_DWORD *)(v3 + 48) + 1;
    *(_DWORD *)(v3 + 48) = v6;
    uint64_t v7 = mach_continuous_time();
    *(_DWORD *)(v3 + 200) = v6;
    *(void *)(v3 + 208) = a2;
    *(void *)(v3 + 216) = 1;
    *(void *)(v3 + 224) = v7;
    os_unfair_lock_unlock(v4);
    kdebug_trace();
    return (os_unfair_lock_s *)[*(id *)(v3 + 32) switchToFlipbookState:a2];
  }
  return result;
}

- (void)transitionToDisplayMode:(int)a3 withDuration:(double)a4 shouldWaitForCompletion:
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v8 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    double v9 = [*(id *)(a1 + 32) now];
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;

    unint64_t v12 = *(void *)(a1 + 136);
    if (*(void *)(a1 + 184) == 2)
    {
      uint64_t v13 = bls_backlight_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        os_log_type_t v14 = NSStringFromCBDisplayMode_bls(a2);
        *(_DWORD *)buf = 134219010;
        uint64_t v38 = a1;
        __int16 v39 = 2114;
        v40 = v14;
        __int16 v41 = 2048;
        double v42 = a4;
        __int16 v43 = 2048;
        double v44 = a4;
        __int16 v45 = 1024;
        LODWORD(v46) = a3;
        _os_log_debug_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_DEBUG, "DSM:%p ramp to displayMode:%{public}@ withDuration:%fs fullDuration:%fs shouldWaitForCompletion:%{BOOL}u", buf, 0x30u);
LABEL_35:
      }
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 144);
      BOOL v16 = v15 == a2 || !a2 && v15 == 2 || a2 == 2 && v15 == 0;
      double v18 = *(double *)(a1 + 160);
      if (v16 && v18 > 0.0)
      {
        double v19 = v11 - *(double *)(a1 + 176);
        double v20 = 1.0;
        BOOL v21 = v19 / v18 >= 1.0;
        BOOL v22 = v19 / v18 > 0.0 || v19 / v18 >= 1.0;
        if (v19 / v18 <= 0.0) {
          BOOL v21 = 1;
        }
        if (!v22) {
          double v20 = 0.0;
        }
        if (v21) {
          double v23 = v20;
        }
        else {
          double v23 = v19 / v18;
        }
        double v24 = v23 * a4;
        double v25 = v11 - (a4 - v23 * a4);
        uint64_t v13 = bls_backlight_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          double v26 = NSStringFromCBDisplayMode_bls(v12);
          double v34 = *(double *)(a1 + 152);
          char v27 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:*(double *)(a1 + 168)];
          uint64_t v28 = objc_msgSend(v27, "bls_shortLoggingString");
          unsigned int v29 = NSStringFromCBDisplayMode_bls(a2);
          *(_DWORD *)buf = 134220546;
          uint64_t v38 = a1;
          __int16 v39 = 2114;
          v40 = v26;
          __int16 v41 = 2048;
          double v42 = v34;
          __int16 v43 = 2048;
          double v44 = v18;
          __int16 v45 = 2114;
          __int16 v46 = v28;
          __int16 v47 = 2048;
          double v48 = v19;
          __int16 v49 = 2048;
          double v50 = v23;
          __int16 v51 = 2114;
          __int16 v52 = v29;
          __int16 v53 = 2048;
          double v54 = v23 * a4;
          __int16 v55 = 2048;
          double v56 = a4;
          __int16 v57 = 1024;
          int v58 = a3;
          _os_log_debug_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_DEBUG, "DSM:%p reversing pending ramp to displayMode:%{public}@ withDuration:%fs fullDuration:%fs started at %{public}@ (%fs elapsed — %f%%) with ramp to displayMode:%{public}@ withDuration:%fs fullDuration:%fs shouldWaitForCompletion:%{BOOL}u", buf, 0x6Cu);
        }
        goto LABEL_31;
      }
      uint64_t v13 = bls_backlight_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        os_log_type_t v14 = NSStringFromCBDisplayMode_bls(v12);
        double v35 = *(double *)(a1 + 152);
        v31 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:*(double *)(a1 + 168)];
        v32 = objc_msgSend(v31, "bls_shortLoggingString");
        __int16 v33 = NSStringFromCBDisplayMode_bls(a2);
        *(_DWORD *)buf = 134219778;
        uint64_t v38 = a1;
        __int16 v39 = 2114;
        v40 = v14;
        __int16 v41 = 2048;
        double v42 = v35;
        __int16 v43 = 2048;
        double v44 = v18;
        __int16 v45 = 2114;
        __int16 v46 = v32;
        __int16 v47 = 2114;
        double v48 = *(double *)&v33;
        __int16 v49 = 2048;
        double v50 = a4;
        __int16 v51 = 1024;
        LODWORD(v52) = a3;
        _os_log_debug_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_DEBUG, "DSM:%p replacing pending ramp to displayMode:%{public}@ withDuration:%fs fullDuration:%fs started at %{public}@ with ramp to displayMode:%{public}@ withDuration:%fs shouldWaitForCompletion:%{BOOL}u", buf, 0x4Eu);

        goto LABEL_35;
      }
    }
    double v25 = v11;
    double v24 = a4;
LABEL_31:

    int v30 = *(_DWORD *)(a1 + 48) + 1;
    *(_DWORD *)(a1 + 48) = v30;
    *(_DWORD *)(a1 + 128) = v30;
    *(void *)(a1 + 136) = a2;
    *(void *)(a1 + 144) = v12;
    *(double *)(a1 + 152) = v24;
    *(double *)(a1 + 160) = a4;
    *(double *)(a1 + 168) = v11;
    *(double *)(a1 + 176) = v25;
    *(void *)(a1 + 184) = 1;
    *(unsigned char *)(a1 + 192) = a3;
    os_unfair_lock_unlock(v8);
    [*(id *)(a1 + 32) transitionToDisplayMode:a2 withDuration:v24];
    if ((a3 & 1) == 0)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __97__BLSHBacklightDisplayStateMachine_transitionToDisplayMode_withDuration_shouldWaitForCompletion___block_invoke;
      block[3] = &unk_264532258;
      block[4] = a1;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

- (os_unfair_lock_s)transitionToCADisplayState:(os_unfair_lock_s *)result
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    BOOL v4 = result + 6;
    os_unfair_lock_lock(result + 6);
    if (*(void *)(v3 + 256) != 2)
    {
      uint64_t v5 = bls_backlight_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        [(BLSHBacklightDisplayStateMachine *)v3 transitionToCADisplayState:v5];
      }
    }
    int v6 = *(_DWORD *)(v3 + 48) + 1;
    *(_DWORD *)(v3 + 48) = v6;
    uint64_t v7 = mach_continuous_time();
    *(_DWORD *)(v3 + 240) = v6;
    *(void *)(v3 + 248) = a2;
    *(void *)(v3 + 256) = 1;
    *(void *)(v3 + 264) = v7;
    os_unfair_lock_unlock(v4);
    kdebug_trace();
    return (os_unfair_lock_s *)[*(id *)(v3 + 32) transitionToCADisplayState:a2];
  }
  return result;
}

uint64_t __97__BLSHBacklightDisplayStateMachine_transitionToDisplayMode_withDuration_shouldWaitForCompletion___block_invoke(uint64_t a1)
{
  return -[BLSHBacklightDisplayStateMachine onMain_performNextStepInModeTransition](*(void *)(a1 + 32));
}

- (void)osInterfaceProvider:(id)a3 didCompleteTransitionToCBDisplayMode:(int64_t)a4 withError:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    double v10 = bls_backlight_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      __int16 v17 = NSStringFromCBDisplayMode_bls(a4);
      double v18 = objc_msgSend(v9, "bls_loggingString");
      *(_DWORD *)buf = 134218498;
      double v20 = self;
      __int16 v21 = 2114;
      BOOL v22 = v17;
      __int16 v23 = 2114;
      double v24 = v18;
      _os_log_fault_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_FAULT, "DSM:%p core brightness failed to switch to display mode:%{public}@ error:%{public}@", buf, 0x20u);
    }
  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_completedCBDisplayMode = a4;
  if (self->_lock_cbDisplayModeTransitionOperation.cbDisplayMode != a4)
  {
    uint64_t v13 = bls_backlight_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v14 = NSStringFromCBDisplayMode_bls(a4);
      uint64_t v15 = NSStringFromCBDisplayMode_bls(self->_lock_cbDisplayModeTransitionOperation.cbDisplayMode);
      int64_t phase = self->_lock_cbDisplayModeTransitionOperation.phase;
      *(_DWORD *)buf = 134218754;
      double v20 = self;
      __int16 v21 = 2114;
      BOOL v22 = v14;
      __int16 v23 = 2114;
      double v24 = v15;
      __int16 v25 = 1024;
      int v26 = phase;
      _os_log_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_INFO, "DSM:%p core brightness completed switch to wrong display mode:%{public}@, waiting for display mode:%{public}@ phase:%u", buf, 0x26u);

LABEL_15:
    }
LABEL_18:

    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_19;
  }
  int64_t v11 = self->_lock_cbDisplayModeTransitionOperation.phase;
  if (v11 == 2)
  {
    uint64_t v13 = bls_backlight_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v14 = NSStringFromCBDisplayMode_bls(a4);
      *(_DWORD *)buf = 134218242;
      double v20 = self;
      __int16 v21 = 2114;
      BOOL v22 = v14;
      _os_log_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_INFO, "DSM:%p (likely initialization) core brightness completed switch to display mode:%{public}@", buf, 0x16u);
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  if (v11 != 1)
  {
    uint64_t v13 = bls_backlight_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightDisplayStateMachine osInterfaceProvider:didCompleteTransitionToCBDisplayMode:withError:]((uint64_t)self, a4, v13);
    }
    goto LABEL_18;
  }
  unint64_t v12 = bls_backlight_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BLSHBacklightDisplayStateMachine osInterfaceProvider:didCompleteTransitionToCBDisplayMode:withError:]((uint64_t)self, a4, v12);
  }

  self->_lock_cbDisplayModeTransitionOperation.int64_t phase = 2;
  os_unfair_lock_unlock(&self->_lock);
  BSDispatchMain();
LABEL_19:
}

void __103__BLSHBacklightDisplayStateMachine_osInterfaceProvider_didCompleteTransitionToCBDisplayMode_withError___block_invoke(uint64_t a1)
{
}

- (void)osInterfaceProvider:(id)a3 didCompleteSwitchToCBFlipbookState:(int64_t)a4 withError:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    double v10 = bls_backlight_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v15 = NSStringFromCBFlipbookState_bls(a4);
      BOOL v16 = objc_msgSend(v9, "bls_loggingString");
      *(_DWORD *)buf = 134218498;
      double v18 = self;
      __int16 v19 = 2114;
      double v20 = v15;
      __int16 v21 = 2114;
      BOOL v22 = v16;
      _os_log_fault_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_FAULT, "DSM:%p core brightness failed to switch to flipbook state:%{public}@ error:%{public}@", buf, 0x20u);
    }
  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_completedCBFlipbookState = a4;
  if (self->_lock_cbFlipbookStateChangeOperation.phase == 1
    && self->_lock_cbFlipbookStateChangeOperation.cbFlipbookState == a4)
  {
    int64_t v11 = bls_backlight_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BLSHBacklightDisplayStateMachine osInterfaceProvider:didCompleteSwitchToCBFlipbookState:withError:]((uint64_t)self, a4, v11);
    }

    self->_lock_cbFlipbookStateChangeOperation.int64_t phase = 2;
    os_unfair_lock_unlock(&self->_lock);
    kdebug_trace();
    BSDispatchMain();
  }
  else
  {
    unint64_t v12 = bls_backlight_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = NSStringFromCBFlipbookState_bls(a4);
      os_log_type_t v14 = NSStringFromCBFlipbookState_bls(self->_lock_cbFlipbookStateChangeOperation.cbFlipbookState);
      *(_DWORD *)buf = 134218498;
      double v18 = self;
      __int16 v19 = 2114;
      double v20 = v13;
      __int16 v21 = 2114;
      BOOL v22 = v14;
      _os_log_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_INFO, "DSM:%p core brightness completed switch to wrong flipbook state:%{public}@}, waiting for flipbook state:%{public}@", buf, 0x20u);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

void __101__BLSHBacklightDisplayStateMachine_osInterfaceProvider_didCompleteSwitchToCBFlipbookState_withError___block_invoke(uint64_t a1)
{
}

- (void)osInterfaceProvider:(id)a3 didCompleteTransitionToCADisplayState:(int64_t)a4 currentState:(int64_t)a5 transitionStatus:(int64_t)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a6 != 3 && a6)
  {
    double v18 = bls_backlight_log();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      goto LABEL_18;
    }
    __int16 v19 = NSStringFromCADisplayStateTransitionStatus();
    double v20 = NSStringFromCADisplayState();
    __int16 v21 = NSStringFromCADisplayState();
    BOOL v22 = NSStringFromCADisplayState();
    int64_t phase = self->_lock_caDisplayStateChangeOperation.phase;
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    *(_DWORD *)buf = 134219522;
    v32 = self;
    __int16 v33 = 2112;
    double v34 = v19;
    __int16 v35 = 2114;
    unint64_t v36 = v20;
    __int16 v37 = 2114;
    uint64_t v38 = v21;
    __int16 v39 = 2114;
    *(void *)v40 = v22;
    *(_WORD *)&v40[8] = 1024;
    *(_DWORD *)&v40[10] = phase;
    __int16 v41 = 2048;
    uint64_t v42 = v24;
    _os_log_fault_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_FAULT, "DSM:%p core animation state transition status:%@ to display state:%{public}@, current display state:%{public}@ – pending transition to display state:%{public}@ phase:%u elapsed:%lfs", buf, 0x44u);

LABEL_16:
    goto LABEL_18;
  }
  self->_lock_completedCADisplayState = a4;
  if (self->_lock_caDisplayStateChangeOperation.caDisplayState != a4)
  {
    double v18 = bls_backlight_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = NSStringFromCADisplayState();
      int v26 = NSStringFromCADisplayState();
      uint64_t v27 = NSStringFromCADisplayState();
      int64_t v28 = self->_lock_caDisplayStateChangeOperation.phase;
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      *(_DWORD *)buf = 134219266;
      v32 = self;
      __int16 v33 = 2114;
      double v34 = v25;
      __int16 v35 = 2114;
      unint64_t v36 = v26;
      __int16 v37 = 2114;
      uint64_t v38 = v27;
      __int16 v39 = 1024;
      *(_DWORD *)v40 = v28;
      *(_WORD *)&v40[4] = 2048;
      *(void *)&v40[6] = v29;
      _os_log_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_INFO, "DSM:%p core animation completed transition to wrong display state:%{public}@ (currentState:%{public}@), waiting for display state:%{public}@ phase:%u elapsed:%lfs", buf, 0x3Au);
    }
    goto LABEL_18;
  }
  int64_t v10 = self->_lock_caDisplayStateChangeOperation.phase;
  if (v10 == 2)
  {
    double v18 = bls_backlight_log();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    __int16 v19 = NSStringFromCADisplayStateTransitionStatus();
    double v20 = NSStringFromCADisplayState();
    __int16 v21 = NSStringFromCADisplayState();
    *(_DWORD *)buf = 134218754;
    v32 = self;
    __int16 v33 = 2114;
    double v34 = v19;
    __int16 v35 = 2114;
    unint64_t v36 = v20;
    __int16 v37 = 2114;
    uint64_t v38 = v21;
    _os_log_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_INFO, "DSM:%p (likely initialization) core animation completed(%{public}@) switch to display state:%{public}@ currentState:%{public}@", buf, 0x2Au);
    goto LABEL_16;
  }
  if (v10 == 1)
  {
    int64_t v11 = bls_backlight_log();
    unint64_t v12 = v11;
    if (a6)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
LABEL_21:

        self->_lock_caDisplayStateChangeOperation.int64_t phase = 2;
        os_unfair_lock_unlock(p_lock);
        BSDispatchMain();
        return;
      }
      uint64_t v13 = NSStringFromCADisplayState();
      os_log_type_t v14 = NSStringFromCADisplayState();
      uint64_t v15 = NSStringFromCADisplayState();
      int64_t v16 = self->_lock_caDisplayStateChangeOperation.phase;
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      *(_DWORD *)buf = 134219266;
      v32 = self;
      __int16 v33 = 2114;
      double v34 = v13;
      __int16 v35 = 2114;
      unint64_t v36 = v14;
      __int16 v37 = 2114;
      uint64_t v38 = v15;
      __int16 v39 = 1024;
      *(_DWORD *)v40 = v16;
      *(_WORD *)&v40[4] = 2048;
      *(void *)&v40[6] = v17;
      _os_log_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_INFO, "DSM:%p core animation reporting interrupted transition to display state:%{public}@, current display state:%{public}@ – pending transition to display state:%{public}@ phase:%u elapsed:%lfs", buf, 0x3Au);
    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      uint64_t v13 = NSStringFromCADisplayState();
      os_log_type_t v14 = NSStringFromCADisplayState();
      mach_continuous_time();
      BSTimeDifferenceFromMachTimeToMachTime();
      *(_DWORD *)buf = 134218754;
      v32 = self;
      __int16 v33 = 2114;
      double v34 = v13;
      __int16 v35 = 2114;
      unint64_t v36 = v14;
      __int16 v37 = 2048;
      uint64_t v38 = v30;
      _os_log_debug_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_DEBUG, "DSM:%p core animation completed transition to display state:%{public}@ (currentState:%{public}@) elapsed:%lfs", buf, 0x2Au);
    }

    goto LABEL_21;
  }
  double v18 = bls_backlight_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    __int16 v19 = NSStringFromCADisplayStateTransitionStatus();
    double v20 = NSStringFromCADisplayState();
    __int16 v21 = NSStringFromCADisplayState();
    *(_DWORD *)buf = 134218754;
    v32 = self;
    __int16 v33 = 2114;
    double v34 = v19;
    __int16 v35 = 2114;
    unint64_t v36 = v20;
    __int16 v37 = 2114;
    uint64_t v38 = v21;
    _os_log_error_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_ERROR, "DSM:%p core animation completed(%{public}@) transition to matching display state:%{public}@, (currentState:%{public}@), but operation is not started", buf, 0x2Au);
    goto LABEL_16;
  }
LABEL_18:

  os_unfair_lock_unlock(p_lock);
}

void __124__BLSHBacklightDisplayStateMachine_osInterfaceProvider_didCompleteTransitionToCADisplayState_currentState_transitionStatus___block_invoke(uint64_t a1)
{
}

- (id)abortContextForTimer:(id)a3
{
  uint64_t v4 = [(BLSHBacklightOSInterfaceProviding *)self->_osInterface caDisplayState];
  uint64_t v5 = [(BLSHBacklightOSInterfaceProviding *)self->_osInterface cbDisplayMode];
  uint64_t v6 = [(BLSHBacklightOSInterfaceProviding *)self->_osInterface isShowingBlankingWindow];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = [WeakRetained hasEnsureFlipbookCurrent];

  id v9 = [(BLSHBacklightOSInterfaceProviding *)self->_osInterface systemSleepMonitor];
  int64_t v10 = [BLSHBacklightDisplayStateMachineAbortContext alloc];
  int64_t displayMode = self->_lock_displayRampOperation.displayMode;
  int64_t lock_prewarmingDisplayMode = self->_lock_prewarmingDisplayMode;
  int64_t lock_lastSteadyStateDisplayMode = self->_lock_lastSteadyStateDisplayMode;
  os_log_type_t v14 = [v9 aggregateState];
  LOBYTE(v17) = v8;
  uint64_t v15 = [(BLSHBacklightDisplayStateMachineAbortContext *)v10 initWithDisplayMode:displayMode prewarmingDisplayMode:lock_prewarmingDisplayMode lastSteadyStateDisplayMode:lock_lastSteadyStateDisplayMode caDisplayState:v4 cbDisplayMode:v5 showingBlankingWindow:v6 sleepMonitorAggregateState:v14 hasEnsureFlipbookCurrent:v17];

  return v15;
}

- (id)osInterfaceProvider
{
  return self->_osInterface;
}

- (id)identifier
{
  uint64_t v2 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v3 = [v2 build];

  return v3;
}

- (BLSHBacklightDisplayStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BLSHBacklightDisplayStateMachineDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_liveRenderingSystemActivityAssertion, 0);
  objc_storeStrong((id *)&self->_lock_caDisplayPowerAssertion, 0);
  objc_storeStrong((id *)&self->_powerResourceHint, 0);
  objc_storeStrong((id *)&self->_osInterface, 0);
  objc_storeStrong((id *)&self->_liveRenderingTTRWatchdog, 0);

  objc_storeStrong((id *)&self->_watchdogTimer, 0);
}

- (void)releaseLiveRenderingSystemActivityAssertion
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_21FCFC000, v0, (uint64_t)v0, "DSM:%p dropping live rendering system activity assertion %{public}@", v1);
}

- (void)switchToFlipbookState:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v6 = NSStringFromCBFlipbookState_bls(*(void *)(a1 + 208));
  uint64_t v7 = [*(id *)(a1 + 32) now];
  objc_msgSend(v7, "bls_machContinuousTime");
  BSTimeDifferenceFromMachTimeToMachTime();
  char v8 = NSStringFromCBFlipbookState_bls(a2);
  OUTLINED_FUNCTION_1_7();
  _os_log_fault_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_FAULT, "DSM:%p replacing pending switch to flipbookState:%{public}@ from %lfs ago with switch to flipbookState:%{public}@", v9, 0x2Au);
}

- (void)transitionToCADisplayState:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromCADisplayState();
  uint64_t v6 = [*(id *)(a1 + 32) now];
  objc_msgSend(v6, "bls_machContinuousTime");
  BSTimeDifferenceFromMachTimeToMachTime();
  uint64_t v7 = NSStringFromCADisplayState();
  OUTLINED_FUNCTION_1_7();
  _os_log_debug_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_DEBUG, "DSM:%p replacing pending switch to caDisplayState:%{public}@ from %lfs ago with switch to caDisplayState:%{public}@", v8, 0x2Au);
}

- (void)osInterfaceProvider:(uint64_t)a1 didCompleteTransitionToCBDisplayMode:(unint64_t)a2 withError:(NSObject *)a3 .cold.1(uint64_t a1, unint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromCBDisplayMode_bls(a2);
  OUTLINED_FUNCTION_13();
  _os_log_error_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_ERROR, "DSM:%p core brightness completed switch to matching display mode:%{public}@, but operation is not started", v5, 0x16u);
}

- (void)osInterfaceProvider:(uint64_t)a1 didCompleteTransitionToCBDisplayMode:(unint64_t)a2 withError:(NSObject *)a3 .cold.2(uint64_t a1, unint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromCBDisplayMode_bls(a2);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_21FCFC000, a3, v5, "DSM:%p core brightness completed switch to display mode:%{public}@", v6);
}

- (void)osInterfaceProvider:(uint64_t)a1 didCompleteSwitchToCBFlipbookState:(uint64_t)a2 withError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromCBFlipbookState_bls(a2);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_21FCFC000, a3, v5, "DSM:%p core brightness completed switch to flipbook state:%{public}@", v6);
}

@end