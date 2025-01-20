@interface BLSHAlwaysOnPresentationEngine
- (BLSHAlwaysOnPresentationEngine)initWithDelegate:(id)a3 platformProvider:(id)a4 osInterfaceProvider:(id)a5 inactiveBudgetPolicy:(id)a6;
- (BLSHBacklightInactiveEnvironmentSession)inactiveSession;
- (BLSHRenderedFlipbookFrame)onGlassFlipbookFrame;
- (BOOL)alwaysFillFlipbook;
- (BOOL)cacheFlipbook;
- (BOOL)isFlipbookPowerSavingEnabled;
- (BOOL)isGlobal1HzFlipbook;
- (BOOL)isOnStandby;
- (BOOL)isSuppressed;
- (BOOL)isUsingPseudoFlipbook;
- (NSString)debugDescription;
- (NSString)description;
- (id)allFlipbookFrames;
- (id)flipbook;
- (id)frameOnGlassNow;
- (id)frameOnGlassWhenFlipbookLastCancelled;
- (id)frameWithUUID:(id)a3;
- (id)lock_cancelFlipbookFramesAndCollectForReason:(uint64_t)a1;
- (id)lock_cancelFlipbookFramesForReason:(void *)a3 source:(int)a4 didClearDateSpecifiers:(int)a5 wasReset:;
- (id)lock_stopForReason:(int)a3 shouldEmptyModel:;
- (id)loggingStreamForRenderSession;
- (id)stopForReason:(id)a3;
- (id)suppressForReason:(id)a3;
- (id)suspendForReason:(id)a3;
- (int64_t)engineState;
- (uint64_t)_lock_acquireAlwaysOnLiveFlipbookPowerAssertion;
- (uint64_t)_lock_acquireAlwaysOnLivePowerAssertion;
- (uint64_t)_lock_update1HzFromPresentation:(uint64_t)a1;
- (uint64_t)lock_invalidateFlipbookUpdates;
- (uint64_t)lock_setFlipbookPredictiveRenderType;
- (uint64_t)main_shouldWaitForRequestDates;
- (void)createFlipbook;
- (void)dealloc;
- (void)decrementDisablePowerSavingUsageCountForReason:(unint64_t)a3;
- (void)didEndInactiveEnvironmentSession:(id)a3;
- (void)hostEnvironment:(id)a3 hostDidSet1HzFlipbook:(BOOL)a4;
- (void)hostEnvironment:(id)a3 hostDidSetUnrestrictedFramerateUpdates:(BOOL)a4;
- (void)hostEnvironment:(id)a3 invalidateContentForReason:(id)a4;
- (void)inactiveEnvironmentSession:(id)a3 didUpdateToPresentation:(id)a4;
- (void)incrementDisablePowerSavingUsageCountForReason:(unint64_t)a3;
- (void)invalidateFlipbookForReason:(void *)a3 source:(void *)a4 environment:;
- (void)invalidateOnGlassFlipbookFrame;
- (void)lock_completeSleepActionIfPendingForReason:(void *)a3 subReason:;
- (void)lock_endFlipbookRenderSessionAndAllowSleepIfPendingForReason:(uint64_t)a1;
- (void)lock_endFlipbookRenderSessionForReason:(int)a3 wasPreventingSleep:;
- (void)lock_scheduleUpdateTimerForNextUpdatesStart:(uint64_t)a1;
- (void)main_getMissingDatesFromEnvironments;
- (void)main_performLiveUpdateIfNeeded;
- (void)main_performNextStep;
- (void)main_performUpdateIfNeeded;
- (void)main_prepareAndRenderNextFlipbookFrame;
- (void)noteFlipbookIsCurrentWithSpecifier:(uint64_t)a1;
- (void)performLiveUpdateToSpecifier:(uint64_t)a1;
- (void)purgeFlipbook;
- (void)registerHandlersForService:(id)a3;
- (void)renderFramesSession:(id)a3 didRenderFrame:(id)a4 timedOutEnvironments:(id)a5;
- (void)renderFramesSession:(id)a3 failedToRenderSpecifier:(id)a4 error:(id)a5 timedOutEnvironments:(id)a6;
- (void)requestDatesOperation:(id)a3 didTimeoutPendingEnvironments:(id)a4;
- (void)requestDatesOperation:(id)a3 environment:(id)a4 didProvideSpecifiers:(id)a5 forPresentationInterval:(id)a6 isComplete:(BOOL)a7;
- (void)setAlwaysFillFlipbook:(BOOL)a3;
- (void)setCacheFlipbook:(BOOL)a3;
- (void)setGlobal1HzFlipbook:(BOOL)a3;
- (void)setInactiveSession:(id)a3;
- (void)setOnStandby:(BOOL)a3;
- (void)setUsePseudoFlipbook:(BOOL)a3;
- (void)startFlipbookAndEnsureCurrent;
- (void)startLiveUpdates;
- (void)systemSleepAction:(id)a3 performWithCompletion:(id)a4;
- (void)systemSleepAction:(id)a3 systemWillWakeForReason:(id)a4;
- (void)timerFiredForNextUpdatesStart:(uint64_t)a1;
@end

@implementation BLSHAlwaysOnPresentationEngine

- (BLSHAlwaysOnPresentationEngine)initWithDelegate:(id)a3 platformProvider:(id)a4 osInterfaceProvider:(id)a5 inactiveBudgetPolicy:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v32.receiver = self;
  v32.super_class = (Class)BLSHAlwaysOnPresentationEngine;
  v15 = [(BLSHAlwaysOnPresentationEngine *)&v32 init];
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_delegate, a3);
    objc_storeStrong((id *)&v16->_osInterfaceProvider, a5);
    objc_storeStrong((id *)&v16->_realInactiveBudgetPolicy, a6);
    objc_storeStrong((id *)&v16->_inactiveBudgetPolicy, a6);
    v17 = objc_alloc_init(BLSHNullInactiveBudgetPolicy);
    nullInactiveBudgetPolicy = v16->_nullInactiveBudgetPolicy;
    v16->_nullInactiveBudgetPolicy = (BLSHInactiveBudgetPolicing_Private *)v17;

    v16->_lock_fillFlipbookState = 0;
    uint64_t v19 = +[BLSHOnSystemSleepAction actionWithIdentifier:@"AlwaysOnPresentationEngine-Action" delegate:v16 osInterfaceProvider:v13];
    sleepAction = v16->_sleepAction;
    v16->_sleepAction = (BLSHOnSystemSleepAction *)v19;

    [(BLSHOnSystemSleepAction *)v16->_sleepAction install];
    v16->_lock_onStandby = 1;
    v21 = objc_alloc_init(BLSHFlipbookPowerSavingProvider);
    flipbookPowerSavingProvider = v16->_flipbookPowerSavingProvider;
    v16->_flipbookPowerSavingProvider = v21;

    if (os_variant_has_internal_diagnostics())
    {
      v23 = -[BLSHFlipbookHistory initWithFrameLimit:memoryLimit:]([BLSHFlipbookHistory alloc], "initWithFrameLimit:memoryLimit:", [v13 flipbookDiagnosticHistoryFrameLimit], objc_msgSend(v13, "flipbookDiagnosticHistoryMemoryLimit"));
      renderedFlipbookHistory = v16->_renderedFlipbookHistory;
      v16->_renderedFlipbookHistory = v23;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v12 flipbookSpecification],
          (v25 = (BLSHFlipbookSpecification *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v25 = [[BLSHFlipbookSpecification alloc] initWithSoftMemoryLimit:104857600 frameCapacity:100 framesPerSecond:30.0 minimumGapDuration:3.0 coaelscingEpsilon:0.0028 minimumPrepareInterval:90.0 maximumRenderInterval:300.0];
    }
    objc_storeStrong((id *)&v16->_flipbookSpecification, v25);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v26 = [v12 flipbookTelemetryDelegate];
      flipbookTelemetryDelegate = v16->_flipbookTelemetryDelegate;
      v16->_flipbookTelemetryDelegate = (BLSHFlipbookTelemetry *)v26;
    }
    v28 = bls_flipbook_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[BLSHAlwaysOnPresentationEngine initWithDelegate:platformProvider:osInterfaceProvider:inactiveBudgetPolicy:]();
    }

    v16->_lock_engineState = 0;
    objc_initWeak(&location, v16);
    objc_copyWeak(&v30, &location);
    v16->_stateHandler = os_state_add_handler();
    -[BLSHAlwaysOnPresentationEngine createFlipbook]((uint64_t)v16);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v16;
}

uint64_t __109__BLSHAlwaysOnPresentationEngine_initWithDelegate_platformProvider_osInterfaceProvider_inactiveBudgetPolicy___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained debugDescription];
  uint64_t v3 = BLSStateDataWithTitleDescriptionAndHints();

  return v3;
}

- (void)createFlipbook
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v7 = *(id *)(a1 + 88);
    if (*(unsigned char *)(a1 + 269))
    {
      uint64_t v3 = objc_alloc_init(BLSHPseudoFlipbook);
    }
    else
    {
      uint64_t v3 = [*(id *)(a1 + 24) createFlipbook];
    }
    v4 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v3;

    uint64_t v5 = *(unsigned __int8 *)(a1 + 271);
    id v6 = *(id *)(a1 + 88);
    [v6 set1HzFlipbook:v5];
    [*(id *)(a1 + 88) setCachesFramesOnExit:*(unsigned __int8 *)(a1 + 272)];
    os_unfair_lock_unlock(v2);
    [v7 invalidate];
    [*(id *)(a1 + 112) setFlipbook:v6];
  }
}

- (void)dealloc
{
  [(BLSHOnSystemSleepAction *)self->_sleepAction uninstall];
  [(BLSHFlipbook *)self->_lock_flipbook invalidate];
  [(BSTimerScheduleQuerying *)self->_lock_timer invalidate];
  if (self->_stateHandler) {
    os_state_remove_handler();
  }
  v3.receiver = self;
  v3.super_class = (Class)BLSHAlwaysOnPresentationEngine;
  [(BLSHAlwaysOnPresentationEngine *)&v3 dealloc];
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v5 = (id)[v4 appendBool:self->_lock_onStandby withName:@"onStandby"];
  id v6 = (id)[v4 appendBool:self->_lock_suppressed withName:@"suppressed"];
  switch(self->_lock_engineState)
  {
    case 0:
      id v7 = (id)[v4 appendObject:@"stopped" withName:@"state"];
      goto LABEL_3;
    case 1:
      id v9 = (id)[v4 appendObject:@"live" withName:@"state"];
      v8 = [(BLSHPresentationDateSpecifier *)self->_lock_lastLiveSpecifier presentationDate];
      break;
    case 2:
      v10 = @"liveFlipbook";
      goto LABEL_8;
    case 3:
      v10 = @"predictiveFlipbook";
      goto LABEL_8;
    case 4:
      v10 = @"predictiveFlipbookToFill";
LABEL_8:
      id v11 = (id)[v4 appendObject:v10 withName:@"state"];
      id v12 = [(BLSHFlipbook *)self->_lock_flipbook frameOnGlass];
      id v13 = objc_msgSend(v12, "bls_specifier");
      v8 = [v13 presentationDate];

      break;
    default:
LABEL_3:
      v8 = 0;
      break;
  }
  id v14 = [(NSDateInterval *)self->_lock_lastRequestInterval bls_shortLoggingString];
  id v15 = (id)[v4 appendObject:v14 withName:@"lastRequestInterval"];

  if (v8)
  {
    v16 = objc_msgSend(v8, "bls_shortLoggingString");
    id v17 = (id)[v4 appendObject:v16 withName:@"lastSpeciferDate"];
  }
  v18 = NSStringFromBLSHOnSystemSleepActionState([(BLSHOnSystemSleepAction *)self->_sleepAction state]);
  id v19 = (id)[v4 appendObject:v18 withName:@"sleepActionState"];

  unint64_t v20 = self->_lock_fillFlipbookState - 1;
  if (v20 > 3) {
    v21 = @"Awake";
  }
  else {
    v21 = off_264532C38[v20];
  }
  id v22 = (id)[v4 appendObject:v21 withName:@"fillState"];
  v23 = [v4 build];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v23;
}

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_opt_new();
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__3;
  v40 = __Block_byref_object_dispose__3;
  id v41 = 0;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke;
  v32[3] = &unk_264532960;
  id v5 = v4;
  id v33 = v5;
  v34 = self;
  v35 = &v36;
  [v5 appendProem:self block:v32];
  if (self->_lock_requestDatesOperation)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_2;
    v29[3] = &unk_2645322D0;
    id v30 = v5;
    v31 = self;
    [v30 appendBodySectionWithName:@"requestDatesOperation" block:v29];
    id v6 = v30;
  }
  else
  {
    id v6 = [(NSDateInterval *)self->_lock_lastRequestInterval bls_loggingString];
    id v7 = (id)[v5 appendObject:v6 withName:@"lastRequestInterval"];
  }

  if (v37[5])
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_3;
    v26[3] = &unk_264532988;
    id v27 = v5;
    v28 = &v36;
    [v27 appendBodySectionWithName:@"frameOnGlass" block:v26];
  }
  if (self->_lock_renderingSpecifier)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_4;
    v23[3] = &unk_2645322D0;
    id v24 = v5;
    v25 = self;
    [v24 appendBodySectionWithName:@"renderingSpecifier" block:v23];
  }
  if (self->_lock_cachedFlipbookUpdates)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_5;
    v20[3] = &unk_2645322D0;
    id v21 = v5;
    id v22 = self;
    [v21 appendBodySectionWithName:@"cachedFlipbookUpdates" block:v20];
  }
  if (self->_lock_timer)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_6;
    v17[3] = &unk_2645322D0;
    id v18 = v5;
    id v19 = self;
    [v18 appendBodySectionWithName:@"timer" block:v17];
  }
  if (self->_lock_livePowerAssertion)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_7;
    v14[3] = &unk_2645322D0;
    id v15 = v5;
    v16 = self;
    [v15 appendBodySectionWithName:@"livePowerAssertion" block:v14];
  }
  if ((unint64_t)(self->_lock_engineState - 2) <= 2)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_8;
    v12[3] = &unk_2645322D0;
    v12[4] = self;
    id v13 = v5;
    [v13 appendBodySectionWithName:@"activeFrames" openDelimiter:@" {" closeDelimiter:@"} " block:v12];
  }
  if (self->_renderedFlipbookHistory)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_9;
    v10[3] = &unk_2645322D0;
    v10[4] = self;
    id v11 = v5;
    [v11 appendBodySectionWithName:@"history" openDelimiter:@" {" closeDelimiter:@"} " block:v10];
  }
  os_unfair_lock_unlock(p_lock);
  v8 = [v5 description];

  _Block_object_dispose(&v36, 8);

  return (NSString *)v8;
}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 265) withName:@"onStandby"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 266) withName:@"suppressed"];
  switch(*(void *)(*(void *)(a1 + 40) + 240))
  {
    case 0:
      id v4 = (id)[*(id *)(a1 + 32) appendObject:@"stopped" withName:@"backlightState"];
      break;
    case 1:
      id v5 = (id)[*(id *)(a1 + 32) appendObject:@"live" withName:@"backlightState"];
      uint64_t v6 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 152), "bls_loggingString");
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      break;
    case 2:
      id v9 = *(void **)(a1 + 32);
      v10 = @"liveFlipbook";
      goto LABEL_7;
    case 3:
      id v9 = *(void **)(a1 + 32);
      v10 = @"predictiveFlipbook";
      goto LABEL_7;
    case 4:
      id v9 = *(void **)(a1 + 32);
      v10 = @"predictiveFlipbookToFill";
LABEL_7:
      id v11 = (id)[v9 appendObject:v10 withName:@"backlightState"];
      id v12 = [*(id *)(*(void *)(a1 + 40) + 88) frameOnGlass];
      uint64_t v13 = objc_msgSend(v12, "bls_loggingString");
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      break;
    default:
      break;
  }
  id v16 = (id)[*(id *)(a1 + 32) appendPointer:*(void *)(*(void *)(a1 + 40) + 184) withName:@"renderFlipbookSession"];
  id v17 = *(void **)(a1 + 32);
  id v18 = NSStringFromBLSHOnSystemSleepActionState([*(id *)(*(void *)(a1 + 40) + 64) state]);
  id v19 = (id)[v17 appendObject:v18 withName:@"sleepActionState"];

  unint64_t v20 = *(void *)(*(void *)(a1 + 40) + 248) - 1;
  if (v20 > 3) {
    id v21 = @"Awake";
  }
  else {
    id v21 = off_264532C38[v20];
  }
  id v22 = (id)[*(id *)(a1 + 32) appendObject:v21 withName:@"fillState"];
  v23 = *(void **)(a1 + 32);
  id v25 = [*(id *)(*(void *)(a1 + 40) + 112) description];
  id v24 = (id)[v23 appendObject:v25 withName:0];
}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 144) debugDescription];
  id v2 = (id)[v1 appendObject:v3 withName:&stru_26D1758B0];
}

id __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_3(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) withName:&stru_26D1758B0];
}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 176) debugDescription];
  id v2 = (id)[v1 appendObject:v3 withName:&stru_26D1758B0];
}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 168) debugDescription];
  id v2 = (id)[v1 appendObject:v3 withName:&stru_26D1758B0];
}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 208) debugDescription];
  id v2 = (id)[v1 appendObject:v3 withName:&stru_26D1758B0];
}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_7(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 200) debugDescription];
  id v2 = (id)[v1 appendObject:v3 withName:&stru_26D1758B0];
}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_8(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "activeFrames", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 40);
        v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "bls_loggingString");
        id v9 = (id)[v7 appendObject:v8 withName:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __50__BLSHAlwaysOnPresentationEngine_debugDescription__block_invoke_9(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "allFrames", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 40);
        v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "bls_loggingString");
        id v9 = (id)[v7 appendObject:v8 withName:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)registerHandlersForService:(id)a3
{
  id v12 = a3;
  uint64_t v4 = +[BLSHAlwaysFillFlipbookAttributeHandler registerHandlerForService:provider:](BLSHAlwaysFillFlipbookAttributeHandler, "registerHandlerForService:provider:");
  if (!v4)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHAlwaysOnPresentationEngine registerHandlersForService:]();
    }
LABEL_19:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD12758);
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = +[BLSHPseudoFlipbookAttributeHandler registerHandlerForService:v12 provider:self];

  if (!v6)
  {
    long long v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHAlwaysOnPresentationEngine registerHandlersForService:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD127BCLL);
  }
  uint64_t v7 = +[BLSHDisableFlipbookPowerSavingAttributeHandler registerHandlerForService:v12 provider:self->_flipbookPowerSavingProvider];

  if (!v7)
  {
    long long v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHAlwaysOnPresentationEngine registerHandlersForService:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD12820);
  }
  v8 = +[BLSHGlobal1HzFlipbookAttributeHandler registerHandlerForService:v12 provider:self];

  if (!v8)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHAlwaysOnPresentationEngine registerHandlersForService:].cold.4();
    }
    goto LABEL_19;
  }
}

- (id)flipbook
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_flipbook;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (int64_t)engineState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_engineState = self->_lock_engineState;
  os_unfair_lock_unlock(p_lock);
  return lock_engineState;
}

- (BLSHRenderedFlipbookFrame)onGlassFlipbookFrame
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(self->_lock_engineState - 2) > 2
    || ([(BLSHFlipbook *)self->_lock_flipbook frameOnGlass],
        (uint64_t v4 = (BLSHRenderedFlipbookFrame *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v4 = self->_lock_frameOnGlassWhenFlipbookCancelled;
  }
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)invalidateOnGlassFlipbookFrame
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_frameOnGlassWhenFlipbookCancelled = self->_lock_frameOnGlassWhenFlipbookCancelled;
  self->_lock_frameOnGlassWhenFlipbookCancelled = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BLSHBacklightInactiveEnvironmentSession)inactiveSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_inactiveSession;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setInactiveSession:(id)a3
{
  uint64_t v4 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_engineState)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_engineState == BLSHAlwaysOnPresentationEngineStateStopped"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHAlwaysOnPresentationEngine setInactiveSession:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    lock_inactiveSession = self->_lock_inactiveSession;
    self->_lock_inactiveSession = v4;
    v8 = v4;

    uint64_t v6 = [(BLSHBacklightInactiveEnvironmentSession *)v8 presentation];
    -[BLSHAlwaysOnPresentationEngine _lock_update1HzFromPresentation:]((uint64_t)self, v6);

    os_unfair_lock_unlock(&self->_lock);
    [(BLSHBacklightInactiveEnvironmentSession *)v8 addObserver:self];
  }
}

- (uint64_t)_lock_update1HzFromPresentation:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    int v5 = *(unsigned __int8 *)(a1 + 271);
    if (*(unsigned char *)(a1 + 270))
    {
      id v6 = 0;
      uint64_t v7 = 1;
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v8 = objc_msgSend(v3, "presentationEntries", 0);
      id v6 = (id)[v8 countByEnumeratingWithState:&v21 objects:v38 count:16];
      if (v6)
      {
        uint64_t v9 = *(void *)v22;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v22 != v9) {
              objc_enumerationMutation(v8);
            }
            long long v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v12 = [v11 environment];
            int v13 = BLSIs1HzFlipbookForEnvironment(v12);

            if (v13)
            {
              id v6 = v11;
              uint64_t v7 = 1;
              goto LABEL_14;
            }
          }
          id v6 = (id)[v8 countByEnumeratingWithState:&v21 objects:v38 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      uint64_t v7 = 0;
LABEL_14:
    }
    uint64_t v14 = bls_flipbook_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v16 = *(void *)(a1 + 240) - 1;
      if (v16 > 3) {
        id v17 = @"Stopped";
      }
      else {
        id v17 = off_264532C70[v16];
      }
      id v18 = [v6 environment];
      id v19 = [v18 identifier];
      unint64_t v20 = objc_msgSend(v4, "bls_shortLoggingString");
      *(_DWORD *)buf = 134219266;
      uint64_t v27 = a1;
      __int16 v28 = 2114;
      v29 = v17;
      __int16 v30 = 1024;
      int v31 = v7;
      __int16 v32 = 1024;
      int v33 = v5;
      __int16 v34 = 2114;
      v35 = v19;
      __int16 v36 = 2114;
      v37 = v20;
      _os_log_debug_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_DEBUG, "%p:%{public}@ update1HzFromPresentation new1HzFlipbook:%{BOOL}u old1HzFlipbook:%{BOOL}u environment:%{public}@ presentation::%{public}@", buf, 0x36u);
    }
    if (v5 != v7)
    {
      *(unsigned char *)(a1 + 271) = v7;
      [*(id *)(a1 + 88) set1HzFlipbook:v7];
    }
    BOOL v25 = v5 != v7;

    a1 = v25;
  }

  return a1;
}

- (BOOL)isOnStandby
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_onStandby;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setOnStandby:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_onStandby != v3)
  {
    self->_lock_onStandby = v3;
    if (!v3) {
      -[BLSHAlwaysOnPresentationEngine lock_completeSleepActionIfPendingForReason:subReason:]((uint64_t)self, @"no longer on standby", 0);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)lock_completeSleepActionIfPendingForReason:(void *)a3 subReason:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = (void *)MEMORY[0x223C5E2B0](*(void *)(a1 + 72));
    v8 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0;

    if (v7)
    {
      uint64_t v9 = bls_flipbook_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        unint64_t v10 = *(void *)(a1 + 240) - 1;
        if (v10 > 3) {
          long long v11 = @"Stopped";
        }
        else {
          long long v11 = off_264532C70[v10];
        }
        uint64_t v12 = NSStringFromBLSHOnSystemSleepActionState([*(id *)(a1 + 64) state]);
        int v13 = (void *)v12;
        unint64_t v14 = *(void *)(a1 + 248) - 1;
        if (v14 > 3) {
          uint64_t v15 = @"Awake";
        }
        else {
          uint64_t v15 = off_264532C38[v14];
        }
        int v16 = *(unsigned __int8 *)(a1 + 265);
        int v17 = *(unsigned __int8 *)(a1 + 266);
        int v18 = 134219778;
        uint64_t v19 = a1;
        __int16 v20 = 2114;
        long long v21 = v11;
        __int16 v22 = 2114;
        id v23 = v5;
        __int16 v24 = 2114;
        id v25 = v6;
        __int16 v26 = 2114;
        uint64_t v27 = v12;
        __int16 v28 = 2114;
        v29 = v15;
        __int16 v30 = 1024;
        int v31 = v16;
        __int16 v32 = 1024;
        int v33 = v17;
        _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_INFO, "%p:%{public}@ will complete sleep action for reason:%{public}@ subReason:%{public}@ sleepActionState=%{public}@ fillState:%{public}@ onStandby:%{BOOL}u suppressed:%{BOOL}u", (uint8_t *)&v18, 0x4Au);
      }
      dispatch_async(MEMORY[0x263EF83A0], v7);
    }
  }
}

- (BOOL)isSuppressed
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_suppressed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)suppressForReason:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_suppressed = self->_lock_suppressed;
  if (!self->_lock_suppressed)
  {
    self->_BOOL lock_suppressed = 1;
    -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionAndAllowSleepIfPendingForReason:]((uint64_t)self, v4);
    [(BSTimerScheduleQuerying *)self->_lock_timer invalidate];
    lock_timer = self->_lock_timer;
    self->_lock_timer = 0;

    [(BLSHPreventSystemSleepAsserting *)self->_lock_livePowerAssertion invalidate];
    lock_livePowerAssertion = self->_lock_livePowerAssertion;
    self->_lock_livePowerAssertion = 0;
  }
  v8 = [(BLSHFlipbook *)self->_lock_flipbook frameOnGlass];
  uint64_t v9 = objc_msgSend(v8, "bls_specifier");

  os_unfair_lock_unlock(&self->_lock);
  if (!lock_suppressed) {
    -[BLSHAlwaysOnPresentationEngine noteFlipbookIsCurrentWithSpecifier:]((uint64_t)self, v9);
  }

  return v9;
}

- (void)lock_endFlipbookRenderSessionAndAllowSleepIfPendingForReason:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionForReason:wasPreventingSleep:](a1, v3, [*(id *)(a1 + 64) state] == 1);
    uint64_t v4 = *(void *)(a1 + 248);
    if (v4 == 2)
    {
      uint64_t v10 = 3;
    }
    else
    {
      if (v4 != 1)
      {
LABEL_18:
        -[BLSHAlwaysOnPresentationEngine lock_completeSleepActionIfPendingForReason:subReason:](a1, @"endFlipbookRenderSession", v3);
LABEL_19:
        [*(id *)(a1 + 192) invalidate];
        int v16 = *(void **)(a1 + 192);
        *(void *)(a1 + 192) = 0;

        goto LABEL_20;
      }
      int v5 = *(unsigned __int8 *)(a1 + 266);
      id v6 = bls_flipbook_log();
      uint64_t v7 = v6;
      if (!v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v17 = *(void *)(a1 + 240) - 1;
          if (v17 > 3) {
            int v18 = @"Stopped";
          }
          else {
            int v18 = off_264532C70[v17];
          }
          uint64_t v19 = NSStringFromBLSHOnSystemSleepActionState([*(id *)(a1 + 64) state]);
          __int16 v20 = (void *)v19;
          unint64_t v21 = *(void *)(a1 + 248) - 1;
          if (v21 > 3) {
            __int16 v22 = @"Awake";
          }
          else {
            __int16 v22 = off_264532C38[v21];
          }
          int v23 = *(unsigned __int8 *)(a1 + 265);
          int v24 = 134219010;
          uint64_t v25 = a1;
          __int16 v26 = 2114;
          uint64_t v27 = v18;
          __int16 v28 = 2114;
          uint64_t v29 = v19;
          __int16 v30 = 2114;
          int v31 = v22;
          __int16 v32 = 1024;
          int v33 = v23;
          _os_log_debug_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (waiting for flipbook) sleepActionState:%{public}@ fillState:%{public}@ onStandby:%{BOOL}u", (uint8_t *)&v24, 0x30u);
        }
        goto LABEL_19;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        unint64_t v8 = *(void *)(a1 + 240) - 1;
        if (v8 > 3) {
          uint64_t v9 = @"Stopped";
        }
        else {
          uint64_t v9 = off_264532C70[v8];
        }
        uint64_t v11 = NSStringFromBLSHOnSystemSleepActionState([*(id *)(a1 + 64) state]);
        uint64_t v12 = (void *)v11;
        unint64_t v13 = *(void *)(a1 + 248) - 1;
        if (v13 > 3) {
          unint64_t v14 = @"Awake";
        }
        else {
          unint64_t v14 = off_264532C38[v13];
        }
        int v15 = *(unsigned __int8 *)(a1 + 265);
        int v24 = 134219010;
        uint64_t v25 = a1;
        __int16 v26 = 2114;
        uint64_t v27 = v9;
        __int16 v28 = 2114;
        uint64_t v29 = v11;
        __int16 v30 = 2114;
        int v31 = v14;
        __int16 v32 = 1024;
        int v33 = v15;
        _os_log_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_INFO, "%p:%{public}@ (suppressed — skipped filling flipbook) sleepActionState:%{public}@ fillState:%{public}@ onStandby:%{BOOL}u", (uint8_t *)&v24, 0x30u);
      }
      uint64_t v10 = 4;
    }
    *(void *)(a1 + 248) = v10;
    goto LABEL_18;
  }
LABEL_20:
}

- (void)noteFlipbookIsCurrentWithSpecifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    int v4 = *(unsigned __int8 *)(a1 + 264);
    *(unsigned char *)(a1 + 264) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v4)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __69__BLSHAlwaysOnPresentationEngine_noteFlipbookIsCurrentWithSpecifier___block_invoke;
      v5[3] = &unk_2645322D0;
      v5[4] = a1;
      id v6 = v3;
      dispatch_async(MEMORY[0x263EF83A0], v5);
    }
  }
}

- (BOOL)cacheFlipbook
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_cacheFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCacheFlipbook:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_cacheFlipbook = self->_lock_cacheFlipbook;
  self->_BOOL lock_cacheFlipbook = v3;
  if (lock_cacheFlipbook != v3) {
    [(BLSHFlipbook *)self->_lock_flipbook setCachesFramesOnExit:v3];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)startLiveUpdates
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_suppressed = self->_lock_suppressed;
  self->_BOOL lock_suppressed = 0;
  if ((unint64_t)(self->_lock_engineState - 2) <= 2)
  {
    int v5 = -[BLSHAlwaysOnPresentationEngine lock_stopForReason:shouldEmptyModel:]((uint64_t)self, @"startLiveUpdates", 0);
    if (v5 && (unint64_t)(self->_lock_engineState - 3) <= 1)
    {
      id v6 = bls_flipbook_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v24 = self->_lock_engineState - 1;
        if (v24 > 3) {
          uint64_t v25 = @"Stopped";
        }
        else {
          uint64_t v25 = off_264532C70[v24];
        }
        *(_DWORD *)buf = 134218498;
        uint64_t v27 = self;
        __int16 v28 = 2114;
        uint64_t v29 = v25;
        __int16 v30 = 2114;
        int v31 = v5;
        _os_log_debug_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_DEBUG, "%p:%{public}@ engine starting live from flipbook, will live update to:%{public}@", buf, 0x20u);
      }

      os_unfair_lock_unlock(p_lock);
      -[BLSHAlwaysOnPresentationEngine performLiveUpdateToSpecifier:]((uint64_t)self, v5);
      os_unfair_lock_lock(p_lock);
    }
  }
  if (!self->_lock_presentationDatesModel)
  {
    uint64_t v7 = [[BLSHDateSpecifierModel alloc] initWithInactiveBudgetPolicy:self->_inactiveBudgetPolicy];
    lock_presentationDatesModel = self->_lock_presentationDatesModel;
    self->_lock_presentationDatesModel = v7;
  }
  uint64_t v9 = [(BLSHOnSystemSleepAction *)self->_sleepAction state];
  int64_t lock_engineState = self->_lock_engineState;
  uint64_t v11 = bls_flipbook_log();
  uint64_t v12 = v11;
  if (lock_engineState == 1)
  {
    if (lock_suppressed)
    {
      LOBYTE(v13) = v9 != 2;
      if (os_log_type_enabled(v11, (os_log_type_t)(v9 != 2)))
      {
        unint64_t v14 = self->_lock_engineState - 1;
        if (v14 > 3) {
          int v15 = @"Stopped";
        }
        else {
          int v15 = off_264532C70[v14];
        }
        __int16 v22 = NSStringFromBLSHOnSystemSleepActionState(v9);
        *(_DWORD *)buf = 134218498;
        uint64_t v27 = self;
        __int16 v28 = 2114;
        uint64_t v29 = v15;
        __int16 v30 = 2114;
        int v31 = v22;
        int v23 = "%p:%{public}@ engine continuing live (no longer suppressed) sleep:%{public}@";
LABEL_27:
        _os_log_impl(&dword_21FCFC000, v12, (os_log_type_t)v13, v23, buf, 0x20u);
      }
    }
    else
    {
      int v13 = (2 * (v9 != 2));
      if (os_log_type_enabled(v11, (os_log_type_t)(2 * (v9 != 2))))
      {
        unint64_t v19 = self->_lock_engineState - 1;
        if (v19 > 3) {
          __int16 v20 = @"Stopped";
        }
        else {
          __int16 v20 = off_264532C70[v19];
        }
        __int16 v22 = NSStringFromBLSHOnSystemSleepActionState(v9);
        *(_DWORD *)buf = 134218498;
        uint64_t v27 = self;
        __int16 v28 = 2114;
        uint64_t v29 = v20;
        __int16 v30 = 2114;
        int v31 = v22;
        int v23 = "%p:%{public}@ engine continuing live sleep:%{public}@";
        goto LABEL_27;
      }
    }

    goto LABEL_29;
  }
  os_log_type_t v16 = v9 != 2;
  if (os_log_type_enabled(v11, (os_log_type_t)(v9 != 2)))
  {
    unint64_t v17 = self->_lock_engineState - 1;
    if (v17 > 3) {
      int v18 = @"Stopped";
    }
    else {
      int v18 = off_264532C70[v17];
    }
    unint64_t v21 = NSStringFromBLSHOnSystemSleepActionState(v9);
    *(_DWORD *)buf = 134218498;
    uint64_t v27 = self;
    __int16 v28 = 2114;
    uint64_t v29 = v18;
    __int16 v30 = 2114;
    int v31 = v21;
    _os_log_impl(&dword_21FCFC000, v12, v16, "%p:%{public}@->Live engine starting live sleep:%{public}@", buf, 0x20u);
  }
  self->_int64_t lock_engineState = 1;
LABEL_29:
  -[BLSHAlwaysOnPresentationEngine _lock_acquireAlwaysOnLivePowerAssertion]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  if (lock_engineState != 1) {
    BSDispatchMain();
  }
}

- (id)lock_stopForReason:(int)a3 shouldEmptyModel:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 240);
    if (v6)
    {
      if (v6 == 1)
      {
        id v7 = *(id *)(a1 + 152);
        unint64_t v8 = *(void **)(a1 + 152);
        *(void *)(a1 + 152) = 0;

        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = -[BLSHAlwaysOnPresentationEngine lock_cancelFlipbookFramesAndCollectForReason:](a1, @"stopFlipbook");
        objc_msgSend(v9, "bls_specifier");
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (a3) {
        -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionAndAllowSleepIfPendingForReason:](a1, v5);
      }
      else {
        -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionForReason:wasPreventingSleep:](a1, v5, 0);
      }
      [*(id *)(a1 + 208) invalidate];
      uint64_t v10 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = 0;

      [*(id *)(a1 + 200) invalidate];
      uint64_t v11 = *(void **)(a1 + 200);
      *(void *)(a1 + 200) = 0;
    }
    else
    {
      id v7 = 0;
      uint64_t v9 = 0;
    }
    *(void *)(a1 + 240) = 0;
    uint64_t v12 = bls_flipbook_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(v6 - 1) > 3) {
        int v13 = @"Stopped";
      }
      else {
        int v13 = off_264532C70[v6 - 1];
      }
      if (a3) {
        unint64_t v14 = "stopping";
      }
      else {
        unint64_t v14 = "suspending";
      }
      int v15 = *(void **)(a1 + 104);
      os_log_type_t v16 = "previousOnGlassFrame";
      if (!v15) {
        os_log_type_t v16 = "currentSpecifier";
      }
      if (v9) {
        unint64_t v17 = "onGlassFrame";
      }
      else {
        unint64_t v17 = v16;
      }
      if (!v15) {
        int v15 = v7;
      }
      int v18 = objc_msgSend(v15, "bls_loggingString");
      int v24 = 134219266;
      uint64_t v25 = a1;
      __int16 v26 = 2114;
      uint64_t v27 = v13;
      __int16 v28 = 2080;
      uint64_t v29 = v14;
      __int16 v30 = 2114;
      id v31 = v5;
      __int16 v32 = 2080;
      int v33 = v17;
      __int16 v34 = 2114;
      v35 = v18;
      _os_log_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_INFO, "%p:%{public}@->Stopped engine %s (%{public}@) %s:%{public}@", (uint8_t *)&v24, 0x3Eu);
    }
    if (a3)
    {
      [*(id *)(a1 + 144) invalidate];
      unint64_t v19 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = 0;

      __int16 v20 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = 0;

      unint64_t v21 = *(void **)(a1 + 32);
      __int16 v22 = [*(id *)(a1 + 24) now];
      [v21 purgeStaleDataForNowDate:v22];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)performLiveUpdateToSpecifier:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 8));
    if (v4)
    {
      int v18 = v2;
      id v5 = [v4 specifiers];
      uint64_t v6 = bls_flipbook_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        unint64_t v7 = *(void *)(a1 + 240) - 1;
        if (v7 > 3) {
          unint64_t v8 = @"Stopped";
        }
        else {
          unint64_t v8 = off_264532C70[v7];
        }
        uint64_t v9 = objc_msgSend(v4, "bls_loggingString");
        *(_DWORD *)buf = 134218498;
        uint64_t v25 = a1;
        __int16 v26 = 2114;
        uint64_t v27 = v8;
        __int16 v28 = 2114;
        uint64_t v29 = v9;
        _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_INFO, "%p:%{public}@ performing live updates for specifier:%{public}@", buf, 0x20u);
      }
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v5;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            int v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            os_log_type_t v16 = [v15 environment];
            unint64_t v17 = [v15 dateSpecifier];
            [v16 updateToDateSpecifier:v17 sceneContentsUpdated:&__block_literal_global_249];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }

      id v2 = v18;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_storeStrong((id *)(a1 + 152), v2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

- (uint64_t)_lock_acquireAlwaysOnLivePowerAssertion
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 200))
    {
      uint64_t v2 = [*(id *)(result + 24) createPowerAssertionWithIdentifier:@"always on (live)"];
      BOOL v3 = *(void **)(v1 + 200);
      *(void *)(v1 + 200) = v2;

      id v4 = *(void **)(v1 + 200);
      return [v4 acquireWithTimeout:0 handler:0.0];
    }
  }
  return result;
}

void __50__BLSHAlwaysOnPresentationEngine_startLiveUpdates__block_invoke(uint64_t a1)
{
}

- (void)main_performNextStep
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_21FCFC000, v0, v1, "%p:%{public}@ suppressed - do no more work", v2);
}

- (void)startFlipbookAndEnsureCurrent
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_shouldNotifyFlipbookCurrent = 1;
  BOOL lock_suppressed = self->_lock_suppressed;
  self->_BOOL lock_suppressed = 0;
  if (self->_lock_engineState == 1) {
    id v5 = -[BLSHAlwaysOnPresentationEngine lock_stopForReason:shouldEmptyModel:]((uint64_t)self, @"startFlipbook", 0);
  }
  if (!self->_lock_presentationDatesModel)
  {
    uint64_t v6 = [[BLSHDateSpecifierModel alloc] initWithInactiveBudgetPolicy:self->_inactiveBudgetPolicy];
    lock_presentationDatesModel = self->_lock_presentationDatesModel;
    self->_lock_presentationDatesModel = v6;
  }
  int64_t lock_engineState = self->_lock_engineState;
  uint64_t v9 = [(BLSHOnSystemSleepAction *)self->_sleepAction state];
  id v10 = [(BLSHBacklightInactiveEnvironmentSession *)self->_lock_inactiveSession presentation];
  int v11 = [v10 isLiveUpdating];

  if (!v11 || v9)
  {
    -[BLSHAlwaysOnPresentationEngine lock_setFlipbookPredictiveRenderType]((uint64_t)self);
    [(BLSHPreventSystemSleepAsserting *)self->_lock_livePowerAssertion invalidate];
    lock_livePowerAssertion = self->_lock_livePowerAssertion;
    self->_lock_livePowerAssertion = 0;
  }
  else
  {
    -[BLSHAlwaysOnPresentationEngine _lock_acquireAlwaysOnLiveFlipbookPowerAssertion]((uint64_t)self);
    if ((unint64_t)(self->_lock_engineState - 3) <= 1)
    {
      -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionAndAllowSleepIfPendingForReason:]((uint64_t)self, @"live updating");
      [(BSTimerScheduleQuerying *)self->_lock_timer invalidate];
      lock_timer = self->_lock_timer;
      self->_lock_timer = 0;
    }
    self->_int64_t lock_engineState = 2;
  }
  if (self->_lock_fillFlipbookState == 1) {
    self->_lock_fillFlipbookState = 2;
  }
  int64_t v14 = self->_lock_engineState;
  int v15 = bls_flipbook_log();
  os_log_type_t v16 = v15;
  if (v14 == lock_engineState)
  {
    if (lock_suppressed)
    {
      os_log_type_t v17 = v9 != 2;
      if (os_log_type_enabled(v15, (os_log_type_t)(v9 != 2)))
      {
        unint64_t v18 = self->_lock_engineState - 1;
        if (v18 > 3) {
          long long v19 = @"Stopped";
        }
        else {
          long long v19 = off_264532C70[v18];
        }
        uint64_t v34 = NSStringFromBLSHOnSystemSleepActionState(v9);
        uint64_t v27 = (void *)v34;
        unint64_t v35 = self->_lock_fillFlipbookState - 1;
        if (v35 > 3) {
          uint64_t v36 = @"Awake";
        }
        else {
          uint64_t v36 = off_264532C38[v35];
        }
        *(_DWORD *)buf = 134218754;
        id v41 = self;
        __int16 v42 = 2114;
        v43 = v19;
        __int16 v44 = 2114;
        uint64_t v45 = v34;
        __int16 v46 = 2114;
        uint64_t v47 = (uint64_t)v36;
        uint64_t v30 = "%p:%{public}@ engine continuing flipbook (no longer suppressed) sleep:%{public}@ fill:%{public}@";
LABEL_42:
        id v31 = v16;
        os_log_type_t v32 = v17;
        uint32_t v33 = 42;
LABEL_43:
        _os_log_impl(&dword_21FCFC000, v31, v32, v30, buf, v33);
      }
    }
    else
    {
      os_log_type_t v17 = 2 * (v9 != 2);
      if (os_log_type_enabled(v15, v17))
      {
        unint64_t v22 = self->_lock_engineState - 1;
        if (v22 > 3) {
          int v23 = @"Stopped";
        }
        else {
          int v23 = off_264532C70[v22];
        }
        uint64_t v37 = NSStringFromBLSHOnSystemSleepActionState(v9);
        uint64_t v27 = (void *)v37;
        unint64_t v38 = self->_lock_fillFlipbookState - 1;
        if (v38 > 3) {
          uint64_t v39 = @"Awake";
        }
        else {
          uint64_t v39 = off_264532C38[v38];
        }
        *(_DWORD *)buf = 134218754;
        id v41 = self;
        __int16 v42 = 2114;
        v43 = v23;
        __int16 v44 = 2114;
        uint64_t v45 = v37;
        __int16 v46 = 2114;
        uint64_t v47 = (uint64_t)v39;
        uint64_t v30 = "%p:%{public}@ engine continuing flipbook sleep:%{public}@ fill:%{public}@";
        goto LABEL_42;
      }
    }
  }
  else
  {
    BOOL v20 = v9 != 2;
    if (os_log_type_enabled(v15, (os_log_type_t)(v9 != 2)))
    {
      if ((unint64_t)(lock_engineState - 1) > 3) {
        long long v21 = @"Stopped";
      }
      else {
        long long v21 = off_264532C70[lock_engineState - 1];
      }
      unint64_t v24 = self->_lock_engineState - 1;
      if (v24 > 3) {
        uint64_t v25 = @"Stopped";
      }
      else {
        uint64_t v25 = off_264532C70[v24];
      }
      uint64_t v26 = NSStringFromBLSHOnSystemSleepActionState(v9);
      uint64_t v27 = (void *)v26;
      unint64_t v28 = self->_lock_fillFlipbookState - 1;
      if (v28 > 3) {
        uint64_t v29 = @"Awake";
      }
      else {
        uint64_t v29 = off_264532C38[v28];
      }
      *(_DWORD *)buf = 134219010;
      id v41 = self;
      __int16 v42 = 2114;
      v43 = v21;
      __int16 v44 = 2114;
      uint64_t v45 = (uint64_t)v25;
      __int16 v46 = 2114;
      uint64_t v47 = v26;
      __int16 v48 = 2114;
      v49 = v29;
      uint64_t v30 = "%p:%{public}@->%{public}@ engine starting flipbook sleep:%{public}@ fill:%{public}@";
      id v31 = v16;
      os_log_type_t v32 = v20;
      uint32_t v33 = 52;
      goto LABEL_43;
    }
  }

  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

- (uint64_t)_lock_acquireAlwaysOnLiveFlipbookPowerAssertion
{
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 200))
    {
      uint64_t v2 = [*(id *)(result + 24) createPowerAssertionWithIdentifier:@"always on (live flipbook)"];
      BOOL v3 = *(void **)(v1 + 200);
      *(void *)(v1 + 200) = v2;

      id v4 = *(void **)(v1 + 200);
      return [v4 acquireWithTimeout:0 handler:0.0];
    }
  }
  return result;
}

- (uint64_t)lock_setFlipbookPredictiveRenderType
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    if ([*(id *)(result + 64) state])
    {
      uint64_t v2 = 4;
    }
    else if (*(unsigned char *)(v1 + 268))
    {
      uint64_t v2 = 4;
    }
    else
    {
      uint64_t v2 = 3;
    }
    uint64_t v3 = *(void *)(v1 + 240);
    *(void *)(v1 + 240) = v2;
    if (v2 == v3)
    {
      return 0;
    }
    else
    {
      id v4 = bls_flipbook_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v5 = @"Stopped";
        uint64_t v6 = @"Stopped";
        if ((unint64_t)(v3 - 1) <= 3) {
          uint64_t v6 = off_264532C70[v3 - 1];
        }
        if (v2 == 3) {
          id v5 = @"PredictiveFlipbook-JustInTime";
        }
        if (v2 == 4) {
          id v5 = @"PredictiveFlipbook-Fill";
        }
        unint64_t v7 = v5;
        uint64_t v8 = NSStringFromBLSHOnSystemSleepActionState([*(id *)(v1 + 64) state]);
        uint64_t v9 = (void *)v8;
        unint64_t v10 = *(void *)(v1 + 248) - 1;
        if (v10 > 3) {
          int v11 = @"Awake";
        }
        else {
          int v11 = off_264532C38[v10];
        }
        int v12 = *(unsigned __int8 *)(v1 + 265);
        int v13 = 134219266;
        uint64_t v14 = v1;
        __int16 v15 = 2114;
        os_log_type_t v16 = v6;
        __int16 v17 = 2114;
        unint64_t v18 = v7;
        __int16 v19 = 2114;
        uint64_t v20 = v8;
        __int16 v21 = 2114;
        unint64_t v22 = v11;
        __int16 v23 = 1024;
        int v24 = v12;
        _os_log_debug_impl(&dword_21FCFC000, v4, OS_LOG_TYPE_DEBUG, "%p:%{public}@->%{public}@ did change flipbook render type sleepActionState:%{public}@ fillState:%{public}@ onStandby:%{BOOL}u", (uint8_t *)&v13, 0x3Au);
      }
      -[BLSHAlwaysOnPresentationEngine lock_invalidateFlipbookUpdates](v1);
      return 1;
    }
  }
  return result;
}

void __63__BLSHAlwaysOnPresentationEngine_startFlipbookAndEnsureCurrent__block_invoke(uint64_t a1)
{
}

- (id)suspendForReason:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = -[BLSHAlwaysOnPresentationEngine lock_stopForReason:shouldEmptyModel:]((uint64_t)self, v5, 0);

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)stopForReason:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = -[BLSHAlwaysOnPresentationEngine lock_stopForReason:shouldEmptyModel:]((uint64_t)self, v5, 1);

  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)lock_cancelFlipbookFramesAndCollectForReason:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = (void *)MEMORY[0x263F086E0];
    id v4 = a2;
    id v5 = [v3 mainBundle];
    uint64_t v6 = [v5 bundleIdentifier];
    unint64_t v7 = -[BLSHAlwaysOnPresentationEngine lock_cancelFlipbookFramesForReason:source:didClearDateSpecifiers:wasReset:](a1, v4, v6, 1, 1);

    if (v7) {
      objc_storeStrong((id *)(a1 + 96), v7);
    }
    [*(id *)(a1 + 88) collect];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)lock_endFlipbookRenderSessionForReason:(int)a3 wasPreventingSleep:
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = *(void **)(a1 + 184);
    if (v6)
    {
      id v7 = v6;
      [v7 count];
      kdebug_trace();
      BSContinuousMachTimeNow();
      uint64_t v9 = v8;
      unint64_t v10 = bls_flipbook_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        unint64_t v11 = *(void *)(a1 + 240) - 1;
        if (v11 > 3) {
          int v12 = @"Stopped";
        }
        else {
          int v12 = off_264532C70[v11];
        }
        int v13 = NSStringFromBLSHOnSystemSleepActionState(objc_msgSend(*(id *)(a1 + 64), "state", v12));
        unint64_t v14 = *(void *)(a1 + 248) - 1;
        if (v14 > 3) {
          __int16 v15 = @"Awake";
        }
        else {
          __int16 v15 = off_264532C38[v14];
        }
        int v16 = *(unsigned __int8 *)(a1 + 265);
        int v17 = *(unsigned __int8 *)(a1 + 266);
        unint64_t v18 = -[BLSHAlwaysOnPresentationEngine loggingStreamForRenderSession](a1);
        *(_DWORD *)buf = 134220034;
        uint64_t v35 = a1;
        __int16 v36 = 2114;
        uint64_t v37 = v27;
        __int16 v38 = 2048;
        id v39 = v7;
        __int16 v40 = 2114;
        id v41 = v5;
        __int16 v42 = 2114;
        v43 = v13;
        __int16 v44 = 2114;
        uint64_t v45 = v15;
        __int16 v46 = 1024;
        int v47 = v16;
        __int16 v48 = 1024;
        int v49 = v17;
        __int16 v50 = 2114;
        v51 = v18;
        _os_log_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_INFO, "%p:%{public}@ ending render session:%p for reason:%{public}@ sleepActionState:%{public}@ fillState:%{public}@ stby:%{BOOL}u sup:%{BOOL}u %{public}@", buf, 0x54u);
      }
      id v19 = *(id *)(a1 + 56);
      double v20 = 0.0;
      if (a3)
      {
        BSContinuousMachTimeNow();
        double v20 = v21 - *(double *)(a1 + 256);
      }
      unint64_t v22 = (void *)MEMORY[0x263F29AC0];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __92__BLSHAlwaysOnPresentationEngine_lock_endFlipbookRenderSessionForReason_wasPreventingSleep___block_invoke;
      v28[3] = &unk_264532B30;
      id v29 = v7;
      uint64_t v32 = v9;
      double v33 = v20;
      id v30 = v5;
      id v31 = v19;
      id v23 = v19;
      id v24 = v7;
      [v22 dispatchWithQOSClass:17 block:v28];
      [v24 invalidate];
      uint64_t v25 = *(void **)(a1 + 184);
      *(void *)(a1 + 184) = 0;
    }
    uint64_t v26 = *(void **)(a1 + 176);
    *(void *)(a1 + 176) = 0;

    *(void *)(a1 + 232) = 0;
    -[BLSHAlwaysOnPresentationEngine lock_invalidateFlipbookUpdates](a1);
  }
}

- (id)lock_cancelFlipbookFramesForReason:(void *)a3 source:(int)a4 didClearDateSpecifiers:(int)a5 wasReset:
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v9 = [*(id *)(a1 + 88) activeFrames];
    unint64_t v10 = [*(id *)(a1 + 88) cancelAllFrames];
    if (v10) {
      objc_storeStrong((id *)(a1 + 104), v10);
    }
    v43 = [*(id *)(a1 + 88) activeFrames];
    if ([v43 count])
    {
      __int16 v40 = NSString;
      uint64_t v32 = [v43 count];
      double v33 = [v43 lastObject];
      uint64_t v34 = objc_msgSend(v33, "bls_loggingString");
      uint64_t v35 = [v40 stringWithFormat:@"[[CAFlipbook activeFrames] count] should be zero (not %d) after cancelAllFrames lastFrame:%@ (did backboardd die?)", v32, v34];

      BLSHRecordCriticalAssertFailure(v35);
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __108__BLSHAlwaysOnPresentationEngine_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset___block_invoke;
      v53[3] = &unk_2645324E8;
      uint64_t v55 = a1;
      v56 = sel_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset_;
      id v54 = v43;
      __int16 v36 = (void (**)(void))MEMORY[0x223C5E2B0](v53);
      if (BLSHIsUnitTestRunning())
      {
        v36[2](v36);
      }
      else
      {
        dispatch_time_t v37 = dispatch_time(0, 1000000000);
        dispatch_after(v37, MEMORY[0x263EF83A0], v36);
      }
    }
    unint64_t v11 = *(void *)(a1 + 240) - 3;
    int v12 = [v9 count];
    int v13 = bls_flipbook_log();
    unint64_t v14 = v13;
    if (v11 < 2) {
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
    }
    else {
      os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    }
    if (os_log_type_enabled(v13, v15))
    {
      __int16 v38 = v9;
      id v39 = v8;
      unint64_t v16 = *(void *)(a1 + 240) - 1;
      id v17 = v7;
      if (v16 > 3) {
        unint64_t v18 = @"Stopped";
      }
      else {
        unint64_t v18 = off_264532C70[v16];
      }
      if (v10) {
        id v19 = "onGlassFrame";
      }
      else {
        id v19 = "previousOnGlassFrame";
      }
      double v20 = v10;
      if (!v10) {
        double v20 = *(void **)(a1 + 104);
      }
      double v21 = objc_msgSend(v20, "bls_shortLoggingString");
      int v22 = [v43 count];
      *(_DWORD *)buf = 134220290;
      uint64_t v58 = a1;
      __int16 v59 = 2114;
      v60 = v18;
      __int16 v61 = 2114;
      id v8 = v39;
      id v62 = v39;
      __int16 v63 = 2114;
      id v64 = v17;
      __int16 v65 = 1024;
      int v66 = v12;
      __int16 v67 = 1024;
      int v68 = a4;
      __int16 v69 = 1024;
      int v70 = a5;
      __int16 v71 = 2080;
      v72 = v19;
      id v7 = v17;
      __int16 v73 = 2114;
      v74 = v21;
      __int16 v75 = 1024;
      int v76 = v22;
      _os_log_impl(&dword_21FCFC000, v14, v15, "%p:%{public}@ invalidate flipbook for source:%{public}@ reason:%{public}@ frameCount:%u didClearDateSpecifiers:%{BOOL}u wasReset:%{BOOL}u %s:%{public}@ zeroedFrameCount:%u", buf, 0x56u);

      uint64_t v9 = v38;
    }

    [*(id *)(a1 + 32) performInvalidation];
    if (v12)
    {
      BSContinuousMachTimeNow();
      double v24 = v23;
      id v25 = objc_alloc(MEMORY[0x263EFF910]);
      uint64_t v26 = objc_msgSend(v25, "bls_initWithBSContinuousMachTime:", v24);

      id v27 = *(id *)(a1 + 56);
      unint64_t v28 = (void *)MEMORY[0x263F29AC0];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __108__BLSHAlwaysOnPresentationEngine_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset___block_invoke_224;
      v44[3] = &unk_264532A68;
      id v45 = v9;
      double v50 = v24;
      id v46 = v7;
      char v51 = a4;
      char v52 = a5;
      id v47 = v8;
      id v48 = v26;
      id v49 = v27;
      id v29 = v27;
      id v30 = v26;
      [v28 dispatchWithQOSClass:17 block:v44];
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void)purgeFlipbook
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BLSHFlipbook *)self->_lock_flipbook collect];
  [(BLSHFlipbook *)self->_lock_flipbook purge];

  os_unfair_lock_unlock(p_lock);
}

- (void)requestDatesOperation:(id)a3 environment:(id)a4 didProvideSpecifiers:(id)a5 forPresentationInterval:(id)a6 isComplete:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v65 = *MEMORY[0x263EF8340];
  int v12 = (BLSHEngineRequestDatesOperation *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  os_unfair_lock_lock(&self->_lock);
  lock_requestDatesOperation = self->_lock_requestDatesOperation;
  if (lock_requestDatesOperation == v12)
  {
    [(BLSHDateSpecifierModel *)self->_lock_presentationDatesModel registerSpecifiers:v14 forDateInterval:v15 environment:v13];
    int64_t lock_engineState = self->_lock_engineState;
    if (lock_engineState != 1)
    {
      if (lock_engineState != 2) {
        goto LABEL_6;
      }
      if (!v7) {
        goto LABEL_11;
      }
    }
    [(BSTimerScheduleQuerying *)self->_lock_timer invalidate];
    lock_timer = self->_lock_timer;
    self->_lock_timer = 0;
  }
LABEL_6:
  if (v7)
  {
    id v19 = bls_flipbook_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v32 = self->_lock_engineState - 1;
      if (v32 > 3) {
        double v33 = @"Stopped";
      }
      else {
        double v33 = off_264532C70[v32];
      }
      id v41 = v33;
      id v45 = [v13 identifier];
      dispatch_time_t v37 = "(stale) ";
      if (lock_requestDatesOperation == v12) {
        dispatch_time_t v37 = "";
      }
      v43 = objc_msgSend(v15, "bls_shortLoggingString", v37);
      objc_msgSend(v14, "bls_boundedDescriptionWithTransformer:", &__block_literal_global_4);
      *(_DWORD *)buf = 134219522;
      char v52 = self;
      __int16 v53 = 2114;
      id v54 = v41;
      __int16 v55 = 2114;
      v56 = v45;
      __int16 v57 = 2080;
      uint64_t v58 = v39;
      __int16 v59 = 2114;
      v60 = v12;
      __int16 v61 = 2114;
      id v62 = v43;
      __int16 v38 = v63 = 2114;
      id v64 = v38;
      _os_log_debug_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (%{public}@) did complete %srequest dates operation:%{public}@, interval:%{public}@ specifiers:%{public}@", buf, 0x48u);
    }
    if (lock_requestDatesOperation == v12)
    {
      double v20 = self->_lock_requestDatesOperation;
      self->_lock_requestDatesOperation = 0;

      self->_lock_requestDatesOperationDidTimeout = 0;
      double v21 = [(BLSHEngineRequestDatesOperation *)v12 requestInterval];
      lock_lastRequestInterval = self->_lock_lastRequestInterval;
      self->_lock_lastRequestInterval = v21;

      -[BLSHAlwaysOnPresentationEngine lock_invalidateFlipbookUpdates]((uint64_t)self);
    }
    os_unfair_lock_unlock(&self->_lock);
    double v23 = self->_flipbookTelemetryDelegate;
    BSContinuousMachTimeNow();
    uint64_t v25 = v24;
    uint64_t v26 = (void *)MEMORY[0x263F29AC0];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_197;
    v47[3] = &unk_2645324E8;
    id v27 = v12;
    uint64_t v50 = v25;
    id v48 = v27;
    id v49 = v23;
    unint64_t v28 = v23;
    [v26 dispatchWithQOSClass:17 block:v47];
    [(BLSHEngineRequestDatesOperation *)v27 invalidate];

    goto LABEL_13;
  }
LABEL_11:
  id v29 = bls_flipbook_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v30 = self->_lock_engineState - 1;
    if (v30 > 3) {
      id v31 = @"Stopped";
    }
    else {
      id v31 = off_264532C70[v30];
    }
    __int16 v42 = v31;
    __int16 v44 = [v13 identifier];
    uint64_t v34 = "(stale) ";
    if (lock_requestDatesOperation == v12) {
      uint64_t v34 = "";
    }
    __int16 v40 = v34;
    uint64_t v35 = objc_msgSend(v15, "bls_shortLoggingString");
    objc_msgSend(v14, "bls_boundedDescriptionWithTransformer:", &__block_literal_global_195);
    *(_DWORD *)buf = 134219522;
    char v52 = self;
    __int16 v53 = 2114;
    id v54 = v42;
    __int16 v55 = 2114;
    v56 = v44;
    __int16 v57 = 2080;
    uint64_t v58 = v40;
    __int16 v59 = 2114;
    v60 = v12;
    __int16 v61 = 2114;
    id v62 = v35;
    __int16 v36 = v63 = 2114;
    id v64 = v36;
    _os_log_debug_impl(&dword_21FCFC000, v29, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (%{public}@) updated %srequest dates operation:%{public}@, interval:%{public}@ specifiers:%{public}@", buf, 0x48u);
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_13:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_198;
  block[3] = &unk_264532258;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

- (uint64_t)lock_invalidateFlipbookUpdates
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = (id)[*(id *)(result + 168) invalidate];
    uint64_t v3 = *(void **)(v1 + 168);
    *(void *)(v1 + 168) = 0;

    id v4 = *(void **)(v1 + 32);
    return [v4 resetFutureSpecifiers];
  }
  return result;
}

uint64_t __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_193(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

void __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_197(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) telemetryDataWithEndTime:*(double *)(a1 + 48)];
  uint64_t v3 = bls_flipbook_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_197_cold_1();
  }

  [*(id *)(a1 + 40) logTelemetryForRequestDates:v2];
}

void __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_198(uint64_t a1)
{
}

- (void)requestDatesOperation:(id)a3 didTimeoutPendingEnvironments:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v6 = (BLSHEngineRequestDatesOperation *)a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_requestDatesOperation = self->_lock_requestDatesOperation;
  if (lock_requestDatesOperation == v6)
  {
    uint64_t v9 = bls_flipbook_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v17 = self->_lock_engineState - 1;
      if (v17 > 3) {
        unint64_t v18 = @"Stopped";
      }
      else {
        unint64_t v18 = off_264532C70[v17];
      }
      *(_DWORD *)buf = 134218754;
      uint64_t v25 = self;
      __int16 v26 = 2114;
      id v27 = v18;
      __int16 v28 = 2114;
      id v29 = v6;
      __int16 v30 = 2114;
      id v31 = v7;
      _os_log_debug_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_DEBUG, "%p:%{public}@ did timeout render dates operation:%{public}@ pendingEnvironments:%{public}@", buf, 0x2Au);
    }

    unint64_t v10 = self->_lock_requestDatesOperation;
    self->_lock_requestDatesOperation = 0;

    self->_lock_requestDatesOperationDidTimeout = 1;
    -[BLSHAlwaysOnPresentationEngine lock_invalidateFlipbookUpdates]((uint64_t)self);
  }
  os_unfair_lock_unlock(&self->_lock);
  unint64_t v11 = self->_flipbookTelemetryDelegate;
  BSContinuousMachTimeNow();
  uint64_t v13 = v12;
  id v14 = (void *)MEMORY[0x263F29AC0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __86__BLSHAlwaysOnPresentationEngine_requestDatesOperation_didTimeoutPendingEnvironments___block_invoke;
  v20[3] = &unk_2645324E8;
  id v15 = v6;
  double v21 = v15;
  uint64_t v23 = v13;
  unint64_t v16 = v11;
  int v22 = v16;
  [v14 dispatchWithQOSClass:17 block:v20];
  [(BLSHEngineRequestDatesOperation *)v15 invalidate];
  if (lock_requestDatesOperation == v6)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __86__BLSHAlwaysOnPresentationEngine_requestDatesOperation_didTimeoutPendingEnvironments___block_invoke_199;
    v19[3] = &unk_264532258;
    v19[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v19);
  }
}

void __86__BLSHAlwaysOnPresentationEngine_requestDatesOperation_didTimeoutPendingEnvironments___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) telemetryDataWithEndTime:*(double *)(a1 + 48)];
  uint64_t v3 = bls_flipbook_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_197_cold_1();
  }

  [*(id *)(a1 + 40) logTelemetryForRequestDates:v2];
}

void __86__BLSHAlwaysOnPresentationEngine_requestDatesOperation_didTimeoutPendingEnvironments___block_invoke_199(uint64_t a1)
{
}

- (void)renderFramesSession:(id)a3 didRenderFrame:(id)a4 timedOutEnvironments:(id)a5
{
  id v6 = a4;
  objc_msgSend(v6, "bls_specifier");
  id v7 = (BLSHPresentationDateSpecifier *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  lock_renderingSpecifier = self->_lock_renderingSpecifier;
  if (lock_renderingSpecifier == v7)
  {
    self->_lock_renderingSpecifier = 0;

    self->_lock_renderingSpecifier_backoffTime = 0;
  }
  unint64_t v9 = self->_lock_engineState - 2;
  os_unfair_lock_unlock(&self->_lock);
  [(BLSHFlipbookHistory *)self->_renderedFlipbookHistory addRenderedFrameToHistory:v6];

  [(BLSHInactiveBudgetPolicing_Private *)self->_inactiveBudgetPolicy chargeRenderedSpecifier:v7];
  if (v9 <= 2) {
    -[BLSHAlwaysOnPresentationEngine noteFlipbookIsCurrentWithSpecifier:]((uint64_t)self, v7);
  }
  if (lock_renderingSpecifier == v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__BLSHAlwaysOnPresentationEngine_renderFramesSession_didRenderFrame_timedOutEnvironments___block_invoke;
    block[3] = &unk_264532258;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __90__BLSHAlwaysOnPresentationEngine_renderFramesSession_didRenderFrame_timedOutEnvironments___block_invoke(uint64_t a1)
{
}

void __69__BLSHAlwaysOnPresentationEngine_noteFlipbookIsCurrentWithSpecifier___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 264);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  if (!v3)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    objc_msgSend(v4, "presentationEngine:didUpdateToCurrentWithSpecifier:");
  }
}

- (void)renderFramesSession:(id)a3 failedToRenderSpecifier:(id)a4 error:(id)a5 timedOutEnvironments:(id)a6
{
  uint64_t v13 = (BLSHPresentationDateSpecifier *)a4;
  os_unfair_lock_lock(&self->_lock);
  lock_renderingSpecifier = self->_lock_renderingSpecifier;
  if (lock_renderingSpecifier == v13)
  {
    -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionAndAllowSleepIfPendingForReason:]((uint64_t)self, @"failed to render");
    uint64_t v8 = mach_continuous_time();
    self->_lock_renderingSpecifier_backoffTime = BLSMachTimeFromNSTimeInterval() + v8;
    unint64_t v9 = [(BLSHPresentationDateSpecifier *)v13 presentationDate];
    -[BLSHAlwaysOnPresentationEngine lock_scheduleUpdateTimerForNextUpdatesStart:]((uint64_t)self, v9);
  }
  unint64_t v10 = self->_lock_engineState - 5;
  os_unfair_lock_unlock(&self->_lock);
  unint64_t v11 = v13;
  if (lock_renderingSpecifier == v13 && v10 >= 0xFFFFFFFFFFFFFFFDLL)
  {
    -[BLSHAlwaysOnPresentationEngine noteFlipbookIsCurrentWithSpecifier:]((uint64_t)self, 0);
    unint64_t v11 = v13;
  }
}

- (void)lock_scheduleUpdateTimerForNextUpdatesStart:(uint64_t)a1
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x263EFF910] distantFuture];
    int v5 = [v4 isEqualToDate:v3];

    if (v5)
    {
      id v6 = bls_flipbook_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        unint64_t v7 = *(void *)(a1 + 240) - 1;
        if (v7 > 3) {
          uint64_t v8 = @"Stopped";
        }
        else {
          uint64_t v8 = off_264532C70[v7];
        }
        unint64_t v9 = objc_msgSend(v3, "bls_shortLoggingString");
        *(_DWORD *)buf = 134218498;
        uint64_t v90 = a1;
        __int16 v91 = 2114;
        v92 = v8;
        __int16 v93 = 2114;
        double v94 = *(double *)&v9;
        _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_INFO, "%p:%{public}@ will use 30 seconds from now, nextsUpdateStart:%{public}@", buf, 0x20u);
      }
      uint64_t v10 = [*(id *)(a1 + 24) dateWithTimeIntervalSinceNow:30.0];

      id v3 = (id)v10;
    }
    uint64_t v11 = *(void *)(a1 + 240);
    double v12 = 0.045;
    if ((unint64_t)(v11 - 3) < 2) {
      double v12 = 1.0;
    }
    if (v11 == 4) {
      double v13 = 3.0;
    }
    else {
      double v13 = v12;
    }
    id v14 = objc_msgSend(*(id *)(a1 + 24), "now", v12);
    [v3 timeIntervalSinceDate:v14];
    double v16 = v15;

    BOOL v17 = v16 > 0.0 && (unint64_t)(v11 - 3) < 2;
    if (v17 && v16 < v13 + -0.045) {
      double v18 = v16 * 0.5 + 0.016;
    }
    else {
      double v18 = v13;
    }
    id v19 = [v3 dateByAddingTimeInterval:-v18];
    double v20 = @"AlwaysOnPresentationEngine";
    if (v11 == 4) {
      double v20 = @"AlwaysOnPresentationEngine-waking";
    }
    v82 = v20;
    if (v19)
    {
      double v21 = [*(id *)(a1 + 24) now];
      [v19 timeIntervalSinceDate:v21];
      double v23 = v22;

      if ([*(id *)(a1 + 208) isScheduled])
      {
        uint64_t v24 = [*(id *)(a1 + 208) identifier];
        int v25 = [(__CFString *)v82 isEqualToString:v24];

        if (v25)
        {
          [*(id *)(a1 + 208) timeRemaining];
          double v27 = v26;
          double v28 = v26 + 0.015;
          if (v23 + 0.015 >= v27 && v23 <= v28)
          {
            __int16 v30 = bls_flipbook_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              unint64_t v31 = *(void *)(a1 + 240) - 1;
              if (v31 > 3) {
                uint64_t v32 = @"Stopped";
              }
              else {
                uint64_t v32 = off_264532C70[v31];
              }
              v79 = [v19 bls_loggingString];
              *(_DWORD *)buf = 134218754;
              uint64_t v90 = a1;
              __int16 v91 = 2114;
              v92 = v32;
              __int16 v93 = 2048;
              double v94 = v27;
              __int16 v95 = 2114;
              double v96 = *(double *)&v79;
              _os_log_impl(&dword_21FCFC000, v30, OS_LOG_TYPE_INFO, "%p:%{public}@ timer already scheduled in %lfs will not schedule a new timer for %{public}@", buf, 0x2Au);
            }
LABEL_79:

            goto LABEL_80;
          }
        }
      }
    }
    else
    {
      if ([*(id *)(a1 + 208) isScheduled])
      {
        [*(id *)(a1 + 208) timeRemaining];
        double v34 = v33;
        [*(id *)(a1 + 80) maximumRenderInterval];
        double v36 = v35 * 2.5;
        if (v34 >= v35 * 2.5)
        {
          id v19 = [*(id *)(a1 + 24) dateWithTimeIntervalSinceNow:v35 * 2.5];
          id v41 = bls_flipbook_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v44 = *(void *)(a1 + 240) - 1;
            if (v44 > 3) {
              id v45 = @"Stopped";
            }
            else {
              id v45 = off_264532C70[v44];
            }
            v80 = [v19 bls_shortLoggingString];
            *(_DWORD *)buf = 134219010;
            uint64_t v90 = a1;
            __int16 v91 = 2114;
            v92 = v45;
            __int16 v93 = 2048;
            double v94 = v34;
            __int16 v95 = 2048;
            double v96 = v36;
            __int16 v97 = 2114;
            id v98 = v80;
            _os_log_debug_impl(&dword_21FCFC000, v41, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (nil next update) timer already scheduled but %lfs is more than %lfs in the future, will reschedule for %{public}@", buf, 0x34u);
          }
        }
        else
        {
          if (v11 != 4
            || ([*(id *)(a1 + 208) identifier],
                dispatch_time_t v37 = objc_claimAutoreleasedReturnValue(),
                char v38 = [@"AlwaysOnPresentationEngine-waking" isEqualToString:v37],
                v37,
                (v38 & 1) != 0))
          {
            id v19 = bls_flipbook_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              unint64_t v39 = *(void *)(a1 + 240) - 1;
              if (v39 > 3) {
                __int16 v40 = @"Stopped";
              }
              else {
                __int16 v40 = off_264532C70[v39];
              }
              *(_DWORD *)buf = 134218498;
              uint64_t v90 = a1;
              __int16 v91 = 2114;
              v92 = v40;
              __int16 v93 = 2048;
              double v94 = v34;
              _os_log_debug_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (nil next update) timer already scheduled in %lfs will not reschedule", buf, 0x20u);
            }
            goto LABEL_79;
          }
          id v19 = [*(id *)(a1 + 24) dateWithTimeIntervalSinceNow:v34];
          id v41 = bls_flipbook_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            unint64_t v77 = *(void *)(a1 + 240) - 1;
            if (v77 > 3) {
              v78 = @"Stopped";
            }
            else {
              v78 = off_264532C70[v77];
            }
            *(_DWORD *)buf = 134218498;
            uint64_t v90 = a1;
            __int16 v91 = 2114;
            v92 = v78;
            __int16 v93 = 2048;
            double v94 = v34;
            _os_log_impl(&dword_21FCFC000, v41, OS_LOG_TYPE_INFO, "%p:%{public}@ (nil next update) timer already scheduled in %lfs will replace with waking timer", buf, 0x20u);
          }
        }
      }
      else
      {
        id v19 = [*(id *)(a1 + 24) dateWithTimeIntervalSinceNow:30.0];
        id v41 = bls_flipbook_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          unint64_t v42 = *(void *)(a1 + 240) - 1;
          if (v42 > 3) {
            v43 = @"Stopped";
          }
          else {
            v43 = off_264532C70[v42];
          }
          id v46 = [v19 bls_shortLoggingString];
          *(_DWORD *)buf = 134218498;
          uint64_t v90 = a1;
          __int16 v91 = 2114;
          v92 = v43;
          __int16 v93 = 2114;
          double v94 = *(double *)&v46;
          _os_log_impl(&dword_21FCFC000, v41, OS_LOG_TYPE_INFO, "%p:%{public}@ (nil next update) will use 30 seconds from now, nextsUpdateStart:%{public}@", buf, 0x20u);
        }
      }

      id v47 = [*(id *)(a1 + 24) now];
      [v19 timeIntervalSinceDate:v47];
      double v23 = v48;
    }
    objc_initWeak(&location, (id)a1);
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = __78__BLSHAlwaysOnPresentationEngine_lock_scheduleUpdateTimerForNextUpdatesStart___block_invoke;
    v84[3] = &unk_264532B58;
    objc_copyWeak(&v87, &location);
    id v19 = v19;
    v85 = v19;
    id v49 = v3;
    id v86 = v49;
    uint64_t v50 = (void *)MEMORY[0x223C5E2B0](v84);
    [*(id *)(a1 + 208) invalidate];
    if (v11 == 4)
    {
      if (v23 >= v18)
      {
        char v51 = bls_flipbook_log();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          unint64_t v58 = *(void *)(a1 + 240) - 1;
          if (v58 > 3) {
            __int16 v59 = @"Stopped";
          }
          else {
            __int16 v59 = off_264532C70[v58];
          }
          id v65 = [v19 bls_loggingString];
          int v66 = objc_msgSend(v49, "bls_shortLoggingString");
          *(_DWORD *)buf = 134218754;
          uint64_t v90 = a1;
          __int16 v91 = 2114;
          v92 = v59;
          __int16 v93 = 2114;
          double v94 = *(double *)&v65;
          __int16 v95 = 2114;
          double v96 = *(double *)&v66;
          _os_log_impl(&dword_21FCFC000, v51, OS_LOG_TYPE_INFO, "%p:%{public}@ scheduling waking timer for %{public}@ nextsUpdateStart:%{public}@", buf, 0x2Au);
        }
        double v18 = v23;
      }
      else
      {
        char v51 = v19;
        id v19 = [*(id *)(a1 + 24) dateWithTimeIntervalSinceNow:v18];

        char v52 = bls_flipbook_log();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          unint64_t v53 = *(void *)(a1 + 240) - 1;
          if (v53 > 3) {
            id v54 = @"Stopped";
          }
          else {
            id v54 = off_264532C70[v53];
          }
          v81 = v54;
          id v72 = [v51 bls_loggingString];
          id v73 = [v19 bls_shortLoggingString];
          v74 = objc_msgSend(v49, "bls_shortLoggingString");
          *(_DWORD *)buf = 134219266;
          uint64_t v90 = a1;
          __int16 v91 = 2114;
          v92 = v81;
          __int16 v93 = 2114;
          double v94 = *(double *)&v72;
          __int16 v95 = 2048;
          double v96 = v18;
          __int16 v97 = 2114;
          id v98 = v73;
          __int16 v99 = 2114;
          v100 = v74;
          _os_log_impl(&dword_21FCFC000, v52, OS_LOG_TYPE_INFO, "%p:%{public}@ scheduling waking timer %{public}@ is too soon, using %lf seconds from now:%{public}@ nextsUpdateStart:%{public}@", buf, 0x3Eu);
        }
      }

      uint64_t v75 = [*(id *)(a1 + 24) scheduledWakingTimerWithIdentifier:@"AlwaysOnPresentationEngine-waking" interval:v50 leewayInterval:v18 handler:0.5];
      int v76 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = v75;
    }
    else if (v23 >= 0.05)
    {
      v60 = bls_flipbook_log();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        unint64_t v61 = *(void *)(a1 + 240) - 1;
        if (v61 > 3) {
          id v62 = @"Stopped";
        }
        else {
          id v62 = off_264532C70[v61];
        }
        id v67 = [v19 bls_loggingString];
        int v68 = objc_msgSend(v49, "bls_shortLoggingString");
        *(_DWORD *)buf = 134218754;
        uint64_t v90 = a1;
        __int16 v91 = 2114;
        v92 = v62;
        __int16 v93 = 2114;
        double v94 = *(double *)&v67;
        __int16 v95 = 2114;
        double v96 = *(double *)&v68;
        _os_log_impl(&dword_21FCFC000, v60, OS_LOG_TYPE_INFO, "%p:%{public}@ scheduling timer for %{public}@ nextsUpdateStart:%{public}@", buf, 0x2Au);
      }
      double v69 = 0.75;
      if (v11 != 3) {
        double v69 = 0.015;
      }
      uint64_t v70 = [*(id *)(a1 + 24) scheduledTimerWithIdentifier:@"AlwaysOnPresentationEngine" interval:v50 leewayInterval:v23 handler:v69];
      __int16 v71 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = v70;
    }
    else
    {
      __int16 v55 = bls_flipbook_log();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        unint64_t v56 = *(void *)(a1 + 240) - 1;
        if (v56 > 3) {
          __int16 v57 = @"Stopped";
        }
        else {
          __int16 v57 = off_264532C70[v56];
        }
        id v63 = [v19 bls_loggingString];
        id v64 = objc_msgSend(v49, "bls_shortLoggingString");
        *(_DWORD *)buf = 134218754;
        uint64_t v90 = a1;
        __int16 v91 = 2114;
        v92 = v57;
        __int16 v93 = 2114;
        double v94 = *(double *)&v63;
        __int16 v95 = 2114;
        double v96 = *(double *)&v64;
        _os_log_impl(&dword_21FCFC000, v55, OS_LOG_TYPE_INFO, "%p:%{public}@ timer too soon (will just dispatch_async) for %{public}@ nextsUpdateStart:%{public}@", buf, 0x2Au);
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __78__BLSHAlwaysOnPresentationEngine_lock_scheduleUpdateTimerForNextUpdatesStart___block_invoke_282;
      block[3] = &unk_264532258;
      block[4] = a1;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }

    objc_destroyWeak(&v87);
    objc_destroyWeak(&location);
    goto LABEL_79;
  }
LABEL_80:
}

- (void)inactiveEnvironmentSession:(id)a3 didUpdateToPresentation:(id)a4
{
  id v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a4;
  uint64_t v8 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  unint64_t v9 = [v6 mainBundle];
  uint64_t v10 = [v9 bundleIdentifier];
  -[BLSHAlwaysOnPresentationEngine invalidateFlipbookForReason:source:environment:]((uint64_t)self, @"∆presentation", v10, 0);

  os_unfair_lock_lock(&self->_lock);
  lock_inactiveSession = self->_lock_inactiveSession;

  -[BLSHAlwaysOnPresentationEngine _lock_update1HzFromPresentation:]((uint64_t)self, v7);
  os_unfair_lock_unlock(&self->_lock);
  if (lock_inactiveSession == v8)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__BLSHAlwaysOnPresentationEngine_inactiveEnvironmentSession_didUpdateToPresentation___block_invoke;
    block[3] = &unk_264532258;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)invalidateFlipbookForReason:(void *)a3 source:(void *)a4 environment:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_19;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  if (v9)
  {
    [*(id *)(a1 + 128) clearSpecifiersForEnvironment:v9];
    [*(id *)(a1 + 144) invalidate];
    uint64_t v10 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = 0;

    uint64_t v11 = [*(id *)(a1 + 136) presentation];
    char v12 = [v11 containsEnvironment:v9];

    if ((v12 & 1) == 0)
    {
      double v13 = bls_flipbook_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        unint64_t v14 = *(void *)(a1 + 240) - 1;
        if (v14 > 3) {
          double v15 = @"Stopped";
        }
        else {
          double v15 = off_264532C70[v14];
        }
        *(_DWORD *)buf = 134219010;
        uint64_t v25 = a1;
        __int16 v26 = 2114;
        double v27 = v15;
        __int16 v28 = 2114;
        id v29 = v8;
        __int16 v30 = 2114;
        id v31 = v7;
        __int16 v32 = 2114;
        id v33 = v9;
        _os_log_impl(&dword_21FCFC000, v13, OS_LOG_TYPE_INFO, "%p:%{public}@ will ignore invalidate flipbook (not in presentation) for source:%{public}@ reason:%{public}@ environment:%{public}@", buf, 0x34u);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      goto LABEL_19;
    }
  }
  else
  {
    [*(id *)(a1 + 144) invalidate];
    double v16 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = 0;
  }
  unint64_t v17 = *(void *)(a1 + 240) - 2;
  if (v17 > 2)
  {
    id v19 = bls_flipbook_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v21 = *(void *)(a1 + 240) - 1;
      if (v21 > 3) {
        double v22 = @"Stopped";
      }
      else {
        double v22 = off_264532C70[v21];
      }
      *(_DWORD *)buf = 134219010;
      uint64_t v25 = a1;
      __int16 v26 = 2114;
      double v27 = v22;
      __int16 v28 = 2114;
      id v29 = v8;
      __int16 v30 = 2114;
      id v31 = v7;
      __int16 v32 = 2114;
      id v33 = v9;
      _os_log_debug_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_DEBUG, "%p:%{public}@ will ignore invalidate flipbook (rendering live) for source:%{public}@ reason:%{public}@ environment:%{public}@", buf, 0x34u);
    }
  }
  else
  {
    id v18 = -[BLSHAlwaysOnPresentationEngine lock_cancelFlipbookFramesForReason:source:didClearDateSpecifiers:wasReset:](a1, v7, v8, v9 != 0, 0);
    if ((unint64_t)(*(void *)(a1 + 240) - 3) > 1)
    {
      [*(id *)(a1 + 208) invalidate];
      double v20 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = 0;
    }
    else
    {
      -[BLSHAlwaysOnPresentationEngine lock_endFlipbookRenderSessionForReason:wasPreventingSleep:](a1, @"invalidation", 0);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  [*(id *)(a1 + 16) presentationEngine:a1 didInvalidateContentForEnvironment:v9 reason:v7];
  if (v17 <= 2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__BLSHAlwaysOnPresentationEngine_invalidateFlipbookForReason_source_environment___block_invoke;
    block[3] = &unk_264532258;
    block[4] = a1;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
LABEL_19:
}

void __85__BLSHAlwaysOnPresentationEngine_inactiveEnvironmentSession_didUpdateToPresentation___block_invoke(uint64_t a1)
{
}

- (void)didEndInactiveEnvironmentSession:(id)a3
{
  id v4 = (BLSHBacklightInactiveEnvironmentSession *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_inactiveSession == v4)
  {
    self->_lock_inactiveSession = 0;
  }
  -[BLSHAlwaysOnPresentationEngine _lock_update1HzFromPresentation:]((uint64_t)self, 0);
  os_unfair_lock_unlock(&self->_lock);
  [(BLSHBacklightInactiveEnvironmentSession *)v4 removeObserver:self];
}

- (BOOL)isGlobal1HzFlipbook
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_global1HzFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setGlobal1HzFlipbook:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_global1HzFlipbook = v3;
  uint64_t v6 = 40;
  if (v3) {
    uint64_t v6 = 48;
  }
  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, *(id *)((char *)&self->super.isa + v6));
  id v7 = [(BLSHBacklightInactiveEnvironmentSession *)self->_lock_inactiveSession presentation];
  int v8 = -[BLSHAlwaysOnPresentationEngine _lock_update1HzFromPresentation:]((uint64_t)self, v7);

  if (v8)
  {
    lock_inactiveSession = self->_lock_inactiveSession;
    os_unfair_lock_unlock(p_lock);
    if (lock_inactiveSession)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __55__BLSHAlwaysOnPresentationEngine_setGlobal1HzFlipbook___block_invoke;
      block[3] = &unk_264532258;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

void __55__BLSHAlwaysOnPresentationEngine_setGlobal1HzFlipbook___block_invoke(uint64_t a1)
{
}

- (void)hostEnvironment:(id)a3 invalidateContentForReason:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    double v20 = [NSString stringWithFormat:@"invalidateContentForReason passed nil environment: \"%@\"", v7];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHAlwaysOnPresentationEngine hostEnvironment:invalidateContentForReason:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD170A4);
  }
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_engineState = self->_lock_engineState;
  uint64_t v9 = ++hostEnvironment_invalidateContentForReason____lock_currentSystemActivityID;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_engineState)
  {
    uint64_t v10 = self->_osInterfaceProvider;
    uint64_t v11 = mach_continuous_time();
    inactiveBudgetPolicy = self->_inactiveBudgetPolicy;
    double v13 = [(BLSHOSInterfaceProviding *)v10 now];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke;
    v21[3] = &unk_264532A20;
    id v22 = v7;
    id v23 = v6;
    uint64_t v24 = v10;
    uint64_t v25 = self;
    uint64_t v26 = v9;
    uint64_t v27 = v11;
    unint64_t v14 = v10;
    [(BLSHInactiveBudgetPolicing_Private *)inactiveBudgetPolicy invalidateAtRequestDate:v13 forEnvironment:v23 invalidationBlock:v21];
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    lock_presentationDatesModel = self->_lock_presentationDatesModel;
    double v16 = bls_flipbook_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (lock_presentationDatesModel)
    {
      if (v17)
      {
        id v18 = [v6 identifier];
        *(_DWORD *)buf = 134218498;
        id v29 = self;
        __int16 v30 = 2114;
        id v31 = v7;
        __int16 v32 = 2114;
        id v33 = v18;
        _os_log_impl(&dword_21FCFC000, v16, OS_LOG_TYPE_INFO, "%p: invalidateContentForReason: engine is suspended so only clearing specifiers \"%{public}@\" from %{public}@", buf, 0x20u);
      }
      [(BLSHDateSpecifierModel *)self->_lock_presentationDatesModel clearSpecifiersForEnvironment:v6];
    }
    else
    {
      if (v17)
      {
        id v19 = [v6 identifier];
        *(_DWORD *)buf = 134218498;
        id v29 = self;
        __int16 v30 = 2114;
        id v31 = v7;
        __int16 v32 = 2114;
        id v33 = v19;
        _os_log_impl(&dword_21FCFC000, v16, OS_LOG_TYPE_INFO, "%p: invalidateContentForReason: engine is stopped so ignoring \"%{public}@\" from %{public}@", buf, 0x20u);
      }
    }
    os_unfair_lock_unlock(&self->_lock);
    [(BLSHAlwaysOnPresentationEngineDelegate *)self->_delegate presentationEngine:self didInvalidateContentForEnvironment:v6 reason:v7];
  }
}

void __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) identifier];
  int v5 = [v2 stringWithFormat:@"invalidateContentForReason:%@ forEnv:%@ id:%llu", v3, v4, *(void *)(a1 + 64)];

  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x3032000000;
  __int16 v32 = __Block_byref_object_copy__3;
  id v33 = __Block_byref_object_dispose__3;
  id v34 = +[BLSHSystemWakeWaiter waiterWithIdentifier:v5 osInterfaceProvider:*(void *)(a1 + 48)];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 1;
  objc_initWeak(&location, *(id *)(a1 + 56));
  dispatch_time_t v6 = dispatch_time(0, 60000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_2;
  block[3] = &unk_2645329D0;
  id v23 = v27;
  objc_copyWeak(v25, &location);
  id v7 = v5;
  int v8 = *(void **)(a1 + 72);
  id v20 = v7;
  v25[1] = v8;
  id v21 = *(id *)(a1 + 32);
  id v22 = *(id *)(a1 + 40);
  uint64_t v24 = &v29;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
  uint64_t v9 = (void *)v30[5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_213;
  v12[3] = &unk_2645329F8;
  objc_copyWeak(v18, &location);
  id v10 = v7;
  uint64_t v11 = *(void **)(a1 + 72);
  id v13 = v10;
  v18[1] = v11;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  double v16 = v27;
  BOOL v17 = &v29;
  [v9 runWhenAwakeWithCompletion:v12];

  objc_destroyWeak(v18);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);
}

void __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v3 = bls_flipbook_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_2_cold_1((uint64_t)WeakRetained, a1, v3);
    }

    id v4 = *(void **)(a1 + 40);
    int v5 = [*(id *)(a1 + 48) identifier];
    -[BLSHAlwaysOnPresentationEngine invalidateFlipbookForReason:source:environment:]((uint64_t)WeakRetained, v4, v5, *(void **)(a1 + 48));

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) invalidate];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_213(id *a1)
{
  objc_copyWeak(v5, a1 + 9);
  id v2 = a1[4];
  v5[1] = a1[10];
  id v3 = a1[5];
  id v4 = a1[6];
  BSDispatchMain();

  objc_destroyWeak(v5);
}

void __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_2_214(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = bls_flipbook_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    int v10 = 134218498;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    _os_log_impl(&dword_21FCFC000, v3, OS_LOG_TYPE_INFO, "%p \"%{public}@\" elapsed:%.4lfs", (uint8_t *)&v10, 0x20u);
  }

  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) identifier];
  -[BLSHAlwaysOnPresentationEngine invalidateFlipbookForReason:source:environment:]((uint64_t)WeakRetained, v6, v7, *(void **)(a1 + 48));

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) invalidate];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

void __81__BLSHAlwaysOnPresentationEngine_invalidateFlipbookForReason_source_environment___block_invoke(uint64_t a1)
{
}

void __108__BLSHAlwaysOnPresentationEngine_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset___block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"BLSHCriticalAssertDidFailNotification", 0, 0, 4u);
  id v3 = NSString;
  uint64_t v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = [*(id *)(a1 + 32) lastObject];
  uint64_t v6 = objc_msgSend(v5, "bls_loggingString");
  id v7 = [v3 stringWithFormat:@"[[CAFlipbook activeFrames] count] should be zero (not %d) after cancelAllFrames lastFrame:%@ (did backboardd die?)", v4, v6];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v9 = (objc_class *)objc_opt_class();
    int v10 = NSStringFromClass(v9);
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544642;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    id v19 = @"BLSHAlwaysOnPresentationEngine.m";
    __int16 v20 = 1024;
    int v21 = 1173;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v7 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __108__BLSHAlwaysOnPresentationEngine_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset___block_invoke_224(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF9C0] set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v7), "bls_specifier", (void)v21);
        uint64_t v9 = [v8 specifiers];
        int v10 = objc_msgSend(v9, "bs_mapNoNulls:", &__block_literal_global_228);
        [v2 addObjectsFromArray:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  uint64_t v11 = [BLSHFlipbookInvalidationTelemetryData alloc];
  double v12 = *(double *)(a1 + 72);
  uint64_t v13 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 81);
  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = +[BLSHFlipbookFramesHistogram histogramWithReferenceDate:*(void *)(a1 + 56) flipbookFrames:*(void *)(a1 + 32)];
  __int16 v18 = [v2 allObjects];
  id v19 = [(BLSHFlipbookInvalidationTelemetryData *)v11 initWithTimestamp:v16 reason:v15 source:v13 didClearDateSpecifiers:v14 wasReset:v17 invalidatedFramesHistogram:v18 environmentIdentifiers:v12];

  __int16 v20 = bls_flipbook_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_197_cold_1();
  }

  [*(id *)(a1 + 64) logTelemetryForInvalidation:v19];
}

id __108__BLSHAlwaysOnPresentationEngine_lock_cancelFlipbookFramesForReason_source_didClearDateSpecifiers_wasReset___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 environment];
  id v3 = [v2 identifier];

  return v3;
}

- (void)hostEnvironment:(id)a3 hostDidSetUnrestrictedFramerateUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_engineState = self->_lock_engineState;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_engineState == 1)
  {
    uint64_t v8 = bls_flipbook_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v9 = self->_lock_engineState - 1;
      if (v9 > 3) {
        int v10 = @"Stopped";
      }
      else {
        int v10 = off_264532C70[v9];
      }
      uint64_t v11 = [v6 identifier];
      *(_DWORD *)buf = 134218754;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      __int16 v18 = v11;
      __int16 v19 = 1024;
      BOOL v20 = v4;
      _os_log_debug_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_DEBUG, "%p:%{public}@ (live) hostEnvironment:%{public}@ hostDidSetUnrestrictedFramerateUpdates:%{BOOL}u", buf, 0x26u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__BLSHAlwaysOnPresentationEngine_hostEnvironment_hostDidSetUnrestrictedFramerateUpdates___block_invoke;
    block[3] = &unk_264532258;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __89__BLSHAlwaysOnPresentationEngine_hostEnvironment_hostDidSetUnrestrictedFramerateUpdates___block_invoke(uint64_t a1)
{
}

- (void)hostEnvironment:(id)a3 hostDidSet1HzFlipbook:(BOOL)a4
{
  BOOL v4 = a4;
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v8 = [(BLSHBacklightInactiveEnvironmentSession *)self->_lock_inactiveSession presentation];
  -[BLSHAlwaysOnPresentationEngine _lock_update1HzFromPresentation:]((uint64_t)self, v8);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(NSString, "stringWithFormat:", @"didSet1HzFlipbook:%u", v4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = [v7 identifier];
  -[BLSHAlwaysOnPresentationEngine invalidateFlipbookForReason:source:environment:]((uint64_t)self, v10, v9, v7);
}

- (void)systemSleepAction:(id)a3 performWithCompletion:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  os_unfair_lock_lock(&self->_lock);
  BSContinuousMachTimeNow();
  self->_lock_sleepRequestedTime = v8;
  BOOL lock_onStandby = self->_lock_onStandby;
  id v10 = bls_flipbook_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unint64_t v11 = self->_lock_engineState - 1;
    if (v11 > 3) {
      double v12 = @"Stopped";
    }
    else {
      double v12 = off_264532C70[v11];
    }
    uint64_t v13 = NSStringFromBLSHOnSystemSleepActionState([(BLSHOnSystemSleepAction *)self->_sleepAction state]);
    uint64_t v14 = (void *)v13;
    unint64_t v15 = self->_lock_fillFlipbookState - 1;
    if (v15 > 3) {
      uint64_t v16 = @"Awake";
    }
    else {
      uint64_t v16 = off_264532C38[v15];
    }
    BOOL lock_suppressed = self->_lock_suppressed;
    *(_DWORD *)buf = 134219266;
    long long v23 = self;
    __int16 v24 = 2114;
    uint64_t v25 = v12;
    __int16 v26 = 2114;
    uint64_t v27 = v13;
    __int16 v28 = 2114;
    uint64_t v29 = v16;
    __int16 v30 = 1024;
    BOOL v31 = lock_onStandby;
    __int16 v32 = 1024;
    BOOL v33 = lock_suppressed;
    _os_log_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_INFO, "%p:%{public}@ perform systemSleepAction sleepActionState=%{public}@ fillState:%{public}@ onStandby:%{BOOL}u suppressed:%{BOOL}u", buf, 0x36u);
  }
  if (lock_onStandby)
  {
    if (self->_lock_sleepActionCompletion)
    {
      uint64_t v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_sleepActionCompletion == nil"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHAlwaysOnPresentationEngine systemSleepAction:performWithCompletion:]();
      }
      [v21 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD17FC0);
    }
    unint64_t v18 = self->_lock_engineState - 3;
    __int16 v19 = (void *)MEMORY[0x223C5E2B0](v7);
    id lock_sleepActionCompletion = self->_lock_sleepActionCompletion;
    self->_id lock_sleepActionCompletion = v19;

    if (v18 >= 2)
    {
      self->_lock_fillFlipbookState = 1;
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      -[BLSHAlwaysOnPresentationEngine lock_setFlipbookPredictiveRenderType]((uint64_t)self);
      self->_lock_fillFlipbookState = 2;
      os_unfair_lock_unlock(&self->_lock);
      BSDispatchMain();
    }
  }
  else
  {
    self->_lock_fillFlipbookState = 4;
    os_unfair_lock_unlock(&self->_lock);
    v7[2](v7);
  }
}

void __74__BLSHAlwaysOnPresentationEngine_systemSleepAction_performWithCompletion___block_invoke(uint64_t a1)
{
}

- (void)systemSleepAction:(id)a3 systemWillWakeForReason:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_sleepActionCompletion) {
    -[BLSHAlwaysOnPresentationEngine lock_completeSleepActionIfPendingForReason:subReason:]((uint64_t)self, v5, 0);
  }
  int64_t lock_engineState = self->_lock_engineState;
  int64_t lock_fillFlipbookState = self->_lock_fillFlipbookState;
  self->_int64_t lock_fillFlipbookState = 0;
  if ((unint64_t)(lock_engineState - 3) > 1) {
    int v8 = 0;
  }
  else {
    int v8 = -[BLSHAlwaysOnPresentationEngine lock_setFlipbookPredictiveRenderType]((uint64_t)self);
  }
  BOOL lock_shouldNotifyFlipbookCurrent = self->_lock_shouldNotifyFlipbookCurrent;
  lock_serviceNextUpdatesStart = self->_lock_serviceNextUpdatesStart;
  unint64_t v11 = bls_flipbook_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    if ((unint64_t)(lock_engineState - 1) > 3) {
      uint64_t v13 = @"Stopped";
    }
    else {
      uint64_t v13 = off_264532C70[lock_engineState - 1];
    }
    uint64_t v21 = v13;
    unint64_t v14 = self->_lock_engineState - 1;
    if (v14 > 3) {
      unint64_t v15 = @"Stopped";
    }
    else {
      unint64_t v15 = off_264532C70[v14];
    }
    uint64_t v16 = NSStringFromBLSHOnSystemSleepActionState([(BLSHOnSystemSleepAction *)self->_sleepAction state]);
    __int16 v17 = (void *)v16;
    if ((unint64_t)(lock_fillFlipbookState - 1) > 3) {
      unint64_t v18 = @"Awake";
    }
    else {
      unint64_t v18 = off_264532C38[lock_fillFlipbookState - 1];
    }
    BOOL lock_onStandby = self->_lock_onStandby;
    BOOL lock_suppressed = self->_lock_suppressed;
    *(_DWORD *)buf = 134220546;
    __int16 v24 = self;
    __int16 v25 = 2114;
    uint64_t v26 = v22;
    __int16 v27 = 2114;
    __int16 v28 = v15;
    __int16 v29 = 2114;
    id v30 = v5;
    __int16 v31 = 2114;
    uint64_t v32 = v16;
    __int16 v33 = 2114;
    uint64_t v34 = v18;
    __int16 v35 = 1024;
    BOOL v36 = lock_onStandby;
    __int16 v37 = 1024;
    BOOL v38 = lock_suppressed;
    __int16 v39 = 1024;
    int v40 = v8;
    __int16 v41 = 1024;
    BOOL v42 = lock_shouldNotifyFlipbookCurrent;
    __int16 v43 = 1024;
    BOOL v44 = lock_serviceNextUpdatesStart != 0;
    _os_log_debug_impl(&dword_21FCFC000, v11, OS_LOG_TYPE_DEBUG, "%p:%{public}@->%{public}@ %{public}@ sleepActionState=%{public}@ fillState:%{public}@->Awake onStandby:%{BOOL}u suppressed:%{BOOL}u changed:%{BOOL}u shouldNotifyFlipbookCurrent:%{BOOL}u shouldServiceTimer:%{BOOL}u", buf, 0x5Cu);
  }
  os_unfair_lock_unlock(&self->_lock);
  if (lock_shouldNotifyFlipbookCurrent) {
    char v12 = 1;
  }
  else {
    char v12 = v8;
  }
  if ((v12 & 1) != 0 || lock_serviceNextUpdatesStart) {
    BSDispatchMain();
  }
}

void __76__BLSHAlwaysOnPresentationEngine_systemSleepAction_systemWillWakeForReason___block_invoke(uint64_t a1)
{
}

- (BOOL)alwaysFillFlipbook
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_alwaysFillFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAlwaysFillFlipbook:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_alwaysFillFlipbook = a3;
  if ((unint64_t)(self->_lock_engineState - 3) >= 2)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    int v6 = -[BLSHAlwaysOnPresentationEngine lock_setFlipbookPredictiveRenderType]((uint64_t)self);
    os_unfair_lock_unlock(p_lock);
    if (v6) {
      BSDispatchMain();
    }
  }
}

void __56__BLSHAlwaysOnPresentationEngine_setAlwaysFillFlipbook___block_invoke(uint64_t a1)
{
}

- (BOOL)isUsingPseudoFlipbook
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_usePseudoFlipbook;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUsePseudoFlipbook:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_usePseudoFlipbook = self->_lock_usePseudoFlipbook;
  self->_int lock_usePseudoFlipbook = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_usePseudoFlipbook != v3)
  {
    id v7 = bls_flipbook_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        unint64_t v9 = "will use pseudo-flipbook";
LABEL_7:
        _os_log_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_INFO, v9, buf, 2u);
      }
    }
    else if (v8)
    {
      *(_WORD *)buf = 0;
      unint64_t v9 = "will use CAFlipbook";
      goto LABEL_7;
    }

    BSDispatchMain();
  }
}

void __55__BLSHAlwaysOnPresentationEngine_setUsePseudoFlipbook___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 41)) {
      int v3 = @"usePseudoFlipbook";
    }
    else {
      int v3 = @"!usePseudoFlipbook";
    }
    id v4 = (id)[v2 stopForReason:v3];
  }
  -[BLSHAlwaysOnPresentationEngine createFlipbook](*(void *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = *(void **)(a1 + 32);
    [v5 startFlipbookAndEnsureCurrent];
  }
}

- (BOOL)isFlipbookPowerSavingEnabled
{
  return [(BLSHFlipbookPowerSavingProvider *)self->_flipbookPowerSavingProvider isFlipbookPowerSavingEnabled];
}

- (void)incrementDisablePowerSavingUsageCountForReason:(unint64_t)a3
{
}

- (void)decrementDisablePowerSavingUsageCountForReason:(unint64_t)a3
{
}

- (id)allFlipbookFrames
{
  return [(BLSHFlipbookHistory *)self->_renderedFlipbookHistory allFrames];
}

- (id)frameWithUUID:(id)a3
{
  return [(BLSHFlipbookHistory *)self->_renderedFlipbookHistory frameWithUUID:a3];
}

- (id)frameOnGlassNow
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(BLSHFlipbook *)self->_lock_flipbook captureFrameOnGlass];
  os_unfair_lock_unlock(p_lock);
  id v5 = +[BLSDiagnosticFlipbookFrame createWithFrame:v4];

  return v5;
}

- (id)frameOnGlassWhenFlipbookLastCancelled
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_frameOnGlassWhenFlipbookLastCancelledAndReset;
  os_unfair_lock_unlock(p_lock);
  id v5 = +[BLSDiagnosticFlipbookFrame createWithFrame:v4];

  return v5;
}

- (void)main_getMissingDatesFromEnvironments
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = [*(id *)(a1 + 136) presentation];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (!v2 || *(void *)(a1 + 144) || (unint64_t v3 = *(void *)(a1 + 240)) == 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      __int16 v17 = 0;
      unint64_t v14 = 0;
      uint64_t v13 = 0;
LABEL_28:

      return;
    }
    int v4 = *(unsigned __int8 *)(a1 + 271);
    double v5 = 10.0;
    if (v3 >= 3 && !*(unsigned char *)(a1 + 271))
    {
      [*(id *)(a1 + 80) minimumPrepareInterval];
      double v5 = v6;
    }
    [*(id *)(a1 + 80) maximumRenderInterval];
    double v8 = v7;
    if (v3 == 4) {
      double v5 = v7;
    }
    unint64_t v9 = [*(id *)(a1 + 24) now];
    id v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 duration:v5];
    if ([*(id *)(a1 + 128) missingAnySpecifiersInDateInterval:v10 forPresentation:v2])
    {
      double v11 = v8 + 10.0;
      if (!v4) {
        double v11 = v8 + v8;
      }
      if (v3 >= 3) {
        double v12 = v11;
      }
      else {
        double v12 = 30.0;
      }
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 duration:v12];
      if (v13)
      {
        unint64_t v14 = [*(id *)(a1 + 128) missingIntervalsForMinimumInterval:v10 requestInterval:v13 ofPresentation:v2];
        if ([v14 count])
        {
          unint64_t v15 = [[BLSHEngineRequestDatesOperation alloc] initWithRequestInterval:v13 delegate:a1 osTimerProvider:*(void *)(a1 + 24)];
          uint64_t v16 = *(void **)(a1 + 144);
          *(void *)(a1 + 144) = v15;

          __int16 v17 = v15;
        }
        else
        {
          unint64_t v18 = bls_flipbook_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            if (v3 > 4) {
              uint64_t v22 = @"Stopped";
            }
            else {
              uint64_t v22 = off_264532C70[v3 - 1];
            }
            __int16 v24 = v22;
            long long v23 = objc_msgSend(v13, "bls_shortLoggingString");
            *(_DWORD *)buf = 134218498;
            uint64_t v26 = a1;
            __int16 v27 = 2114;
            __int16 v28 = v24;
            __int16 v29 = 2114;
            id v30 = v23;
            _os_log_debug_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_DEBUG, "%p:%{public}@ not requesting dates for interval:%{public}@ (no missingIntervals)", buf, 0x20u);
          }
          __int16 v17 = 0;
        }
        [*(id *)(a1 + 32) purgeStaleDataForNowDate:v9];
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    unint64_t v14 = 0;
    __int16 v17 = 0;
LABEL_25:

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if (v17)
    {
      __int16 v19 = bls_flipbook_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        if (v3 > 4) {
          BOOL v20 = @"Stopped";
        }
        else {
          BOOL v20 = off_264532C70[v3 - 1];
        }
        uint64_t v21 = objc_msgSend(v13, "bls_shortLoggingString");
        *(_DWORD *)buf = 134218754;
        uint64_t v26 = a1;
        __int16 v27 = 2114;
        __int16 v28 = v20;
        __int16 v29 = 2114;
        id v30 = v21;
        __int16 v31 = 2114;
        uint64_t v32 = v14;
        _os_log_debug_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_DEBUG, "%p:%{public}@ requesting dates for interval:%{public}@ missingIntervals:%{public}@", buf, 0x2Au);
      }
      [(BLSHEngineRequestDatesOperation *)v17 beginOperationWithIntervals:v14 shouldReset:0];
    }
    goto LABEL_28;
  }
}

- (uint64_t)main_shouldWaitForRequestDates
{
  *(void *)((char *)&v45[2] + 4) = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  id v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  id v3 = *(id *)(a1 + 144);
  unint64_t v4 = *(void *)(a1 + 240);
  id v5 = *(id *)(a1 + 24);
  double v6 = [v5 now];
  uint64_t v7 = 0;
  if (v4 && v3)
  {
    if ([v3 isComplete]) {
      goto LABEL_11;
    }
    double v8 = [v3 requestInterval];
    unint64_t v9 = [v8 startDate];
    [v9 timeIntervalSinceDate:v6];
    double v11 = v10;

    if (v11 >= 0.3)
    {
LABEL_11:
      uint64_t v7 = 0;
    }
    else
    {
      double v12 = [v3 beginDate];
      [v6 timeIntervalSinceDate:v12];
      double v14 = v13;
      if (v4 > 4 || (double v15 = dbl_21FD8B340[v4 - 1] - v13, v15 <= 0.0))
      {
        uint64_t v21 = bls_flipbook_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          if (v4 > 4) {
            __int16 v28 = @"Stopped";
          }
          else {
            __int16 v28 = off_264532C70[v4 - 1];
          }
          uint64_t v29 = *(void *)(a1 + 208);
          *(_DWORD *)buf = 134219010;
          uint64_t v37 = a1;
          __int16 v38 = 2114;
          __int16 v39 = v28;
          __int16 v40 = 2048;
          double v41 = v14;
          __int16 v42 = 2114;
          id v43 = v3;
          __int16 v44 = 2114;
          v45[0] = v29;
          _os_log_debug_impl(&dword_21FCFC000, v21, OS_LOG_TYPE_DEBUG, "%p:%{public}@ will render frames, waiting (enough) %.3lfs for operation:%{public}@ timer:%{public}@", buf, 0x34u);
        }
        uint64_t v7 = 0;
      }
      else
      {
        if ([*(id *)(a1 + 208) isScheduled]
          && ([*(id *)(a1 + 208) timeRemaining], v16 <= v15))
        {
          int v20 = 0;
        }
        else
        {
          [*(id *)(a1 + 208) invalidate];
          __int16 v17 = *(void **)(a1 + 24);
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __64__BLSHAlwaysOnPresentationEngine_main_shouldWaitForRequestDates__block_invoke;
          v31[3] = &unk_264532AB8;
          v31[4] = a1;
          unint64_t v35 = v4;
          id v32 = v5;
          id v33 = v12;
          id v34 = v3;
          uint64_t v18 = [v17 scheduledWakingTimerWithIdentifier:@"AlwaysOnPresentationEngine" interval:v31 leewayInterval:v15 handler:0.2];
          __int16 v19 = *(void **)(a1 + 208);
          *(void *)(a1 + 208) = v18;

          int v20 = 1;
        }
        long long v23 = bls_flipbook_log();
        uint64_t v21 = v23;
        int v30 = v20;
        if (v14 > 0.2) {
          int v24 = 1;
        }
        else {
          int v24 = v20;
        }
        uint64_t v7 = 1;
        if (v24) {
          os_log_type_t v25 = OS_LOG_TYPE_INFO;
        }
        else {
          os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
        }
        if (os_log_type_enabled(v23, v25))
        {
          uint64_t v26 = off_264532C70[v4 - 1];
          uint64_t v27 = *(void *)(a1 + 208);
          *(_DWORD *)buf = 134219266;
          uint64_t v37 = a1;
          __int16 v38 = 2114;
          __int16 v39 = v26;
          __int16 v40 = 2048;
          double v41 = v14;
          __int16 v42 = 2114;
          id v43 = v3;
          __int16 v44 = 1024;
          LODWORD(v45[0]) = v30;
          WORD2(v45[0]) = 2114;
          *(void *)((char *)v45 + 6) = v27;
          _os_log_impl(&dword_21FCFC000, v21, v25, "%p:%{public}@ will not render frames, waiting %.3lfs for operation:%{public}@ didCreateNewTimer:%{BOOL}u timer:%{public}@", buf, 0x3Au);
        }
      }
    }
  }
  os_unfair_lock_unlock(v2);

  return v7;
}

- (void)main_performUpdateIfNeeded
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v4 = objc_msgSend(*a2, "bls_shortLoggingString");
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_21FCFC000, a3, v5, "%p servicing timer nextsUpdateStart:%{public}@", v6);
}

void __64__BLSHAlwaysOnPresentationEngine_main_shouldWaitForRequestDates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = bls_flipbook_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    unint64_t v6 = *(void *)(a1 + 64) - 1;
    if (v6 > 3) {
      uint64_t v7 = @"Stopped";
    }
    else {
      uint64_t v7 = off_264532C70[v6];
    }
    double v8 = [*(id *)(a1 + 40) now];
    [v8 timeIntervalSinceDate:*(void *)(a1 + 48)];
    uint64_t v9 = *(void *)(a1 + 56);
    int v11 = 134218754;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    double v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    _os_log_impl(&dword_21FCFC000, v4, OS_LOG_TYPE_DEFAULT, "%p:%{public}@ request dates timeout will now render frames, waited %.3lfs for operation:%{public}@", (uint8_t *)&v11, 0x2Au);
  }
  [v3 invalidate];

  -[BLSHAlwaysOnPresentationEngine timerFiredForNextUpdatesStart:](*(void *)(a1 + 32), 0);
}

- (void)timerFiredForNextUpdatesStart:(uint64_t)a1
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (a1)
  {
    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
      objc_storeStrong((id *)(a1 + 216), a2);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    }
    BSDispatchMain();
  }
}

- (void)main_performLiveUpdateIfNeeded
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(void *)(a1 + 240) == 1 && ![*(id *)(a1 + 208) isScheduled])
    {
      id v3 = [*(id *)(a1 + 136) presentation];
      id v4 = [*(id *)(a1 + 24) now];
      [*(id *)(a1 + 128) purgeSpecifiersBefore:v4];
      uint64_t v5 = *(void **)(a1 + 128);
      uint64_t v6 = *(void *)(a1 + 152);
      [*(id *)(a1 + 80) coaelscingEpsilon];
      double v8 = [v5 updatesAfterSpecifier:v6 coalesceFirstUpdateToNowDate:v4 plusRenderEarlyEpsilon:1 untilGapOverDuration:0 coaelscingEpsilon:v3 maximumUpdates:0 lastValidDate:0.028 forPresentation:1.79769313e308 environmentFilter:v7];
      id v11 = [v8 dequeueNextUpdate];
      uint64_t v9 = [v8 invalidate];
      -[BLSHAlwaysOnPresentationEngine lock_scheduleUpdateTimerForNextUpdatesStart:](a1, v9);
      id v10 = (id)[v8 invalidate];

      os_unfair_lock_unlock(v2);
      if (v11)
      {
        -[BLSHAlwaysOnPresentationEngine performLiveUpdateToSpecifier:](a1, v11);
      }
    }
    else
    {
      os_unfair_lock_unlock(v2);
    }
  }
}

- (void)main_prepareAndRenderNextFlipbookFrame
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_21FCFC000, v0, (uint64_t)v0, "%p:%{public}@ no more updates, will not render more frames", v1);
}

void __72__BLSHAlwaysOnPresentationEngine_main_prepareAndRenderNextFlipbookFrame__block_invoke(uint64_t a1, void *a2)
{
  [a2 invalidate];
  uint64_t v3 = *(void *)(a1 + 32);

  -[BLSHAlwaysOnPresentationEngine timerFiredForNextUpdatesStart:](v3, 0);
}

- (id)loggingStreamForRenderSession
{
  if (a1)
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = [MEMORY[0x263F29A70] sharedFormatter];
    id v4 = objc_msgSend(v3, "stringFromByteCount:", objc_msgSend(*(id *)(a1 + 184), "memoryUsage"));
    id v5 = (id)[v2 appendObject:v4 withName:0];

    uint64_t v6 = [*(id *)(a1 + 184) renderedFrames];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__BLSHAlwaysOnPresentationEngine_loggingStreamForRenderSession__block_invoke;
    v9[3] = &unk_264532B08;
    id v7 = v2;
    id v10 = v7;
    objc_msgSend(v7, "bls_appendBoundedCollection:withName:maximumItems:itemBlock:", v6, 0, 4, v9);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __63__BLSHAlwaysOnPresentationEngine_loggingStreamForRenderSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bls_shortLoggingString");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 appendString:v3 withName:0];
}

void __92__BLSHAlwaysOnPresentationEngine_lock_endFlipbookRenderSessionForReason_wasPreventingSleep___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) telemetryDataWithEndTime:*(void *)(a1 + 40) reasonEnded:*(double *)(a1 + 56) preventedSleepDuration:*(double *)(a1 + 64)];
  id v3 = bls_flipbook_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_197_cold_1();
  }

  [*(id *)(a1 + 48) logTelemetryForRenderSession:v2];
}

void __78__BLSHAlwaysOnPresentationEngine_lock_scheduleUpdateTimerForNextUpdatesStart___block_invoke(id *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = bls_flipbook_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = objc_msgSend(a1[4], "bls_loggingString");
    id v5 = objc_msgSend(a1[5], "bls_shortLoggingString");
    int v6 = 134218498;
    id v7 = WeakRetained;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_21FCFC000, v3, OS_LOG_TYPE_INFO, "%p timerFired for %{public}@ nextsUpdateStart:%{public}@", (uint8_t *)&v6, 0x20u);
  }
  -[BLSHAlwaysOnPresentationEngine timerFiredForNextUpdatesStart:]((uint64_t)WeakRetained, a1[5]);
}

uint64_t __78__BLSHAlwaysOnPresentationEngine_lock_scheduleUpdateTimerForNextUpdatesStart___block_invoke_282(uint64_t a1)
{
  return -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(void *)(a1 + 32));
}

uint64_t __64__BLSHAlwaysOnPresentationEngine_timerFiredForNextUpdatesStart___block_invoke(uint64_t a1)
{
  return -[BLSHAlwaysOnPresentationEngine main_performNextStep](*(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_serviceNextUpdatesStart, 0);
  objc_storeStrong((id *)&self->_lock_timer, 0);
  objc_storeStrong((id *)&self->_lock_livePowerAssertion, 0);
  objc_storeStrong((id *)&self->_lock_renderFlipbookSessionPowerAssertion, 0);
  objc_storeStrong((id *)&self->_lock_renderFlipbookSession, 0);
  objc_storeStrong((id *)&self->_lock_renderingSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_cachedFlipbookUpdates, 0);
  objc_storeStrong((id *)&self->_lock_lastRequestInterval, 0);
  objc_storeStrong((id *)&self->_lock_lastLiveSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_requestDatesOperation, 0);
  objc_storeStrong((id *)&self->_lock_inactiveSession, 0);
  objc_storeStrong((id *)&self->_lock_presentationDatesModel, 0);
  objc_storeStrong((id *)&self->_renderedFlipbookHistory, 0);
  objc_storeStrong((id *)&self->_flipbookPowerSavingProvider, 0);
  objc_storeStrong((id *)&self->_lock_frameOnGlassWhenFlipbookCancelled, 0);
  objc_storeStrong((id *)&self->_lock_frameOnGlassWhenFlipbookLastCancelledAndReset, 0);
  objc_storeStrong((id *)&self->_lock_flipbook, 0);
  objc_storeStrong((id *)&self->_flipbookSpecification, 0);
  objc_storeStrong(&self->_lock_sleepActionCompletion, 0);
  objc_storeStrong((id *)&self->_sleepAction, 0);
  objc_storeStrong((id *)&self->_flipbookTelemetryDelegate, 0);
  objc_storeStrong((id *)&self->_nullInactiveBudgetPolicy, 0);
  objc_storeStrong((id *)&self->_realInactiveBudgetPolicy, 0);
  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:platformProvider:osInterfaceProvider:inactiveBudgetPolicy:.cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  __int16 v5 = 2114;
  uint64_t v6 = v0;
  __int16 v7 = 2114;
  uint64_t v8 = v1;
  __int16 v9 = 2114;
  uint64_t v10 = v2;
  _os_log_debug_impl(&dword_21FCFC000, v3, OS_LOG_TYPE_DEBUG, "%p:%{public}@ did create engine with:%{public}@ telemetryDelegate:%{public}@", v4, 0x2Au);
}

- (void)registerHandlersForService:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  os_log_t v3 = NSStringFromClass(v2);
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
  os_log_t v3 = NSStringFromClass(v2);
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
  os_log_t v3 = NSStringFromClass(v2);
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
  os_log_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setInactiveSession:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  os_log_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __124__BLSHAlwaysOnPresentationEngine_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke_197_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0(&dword_21FCFC000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

- (void)hostEnvironment:invalidateContentForReason:.cold.1()
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

void __77__BLSHAlwaysOnPresentationEngine_hostEnvironment_invalidateContentForReason___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a2 + 32);
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  int v7 = 134218498;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  _os_log_fault_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_FAULT, "%p held systemActivity for too long. invalidating. \"%{public}@\" elapsed:%.4lfs", (uint8_t *)&v7, 0x20u);
}

- (void)systemSleepAction:performWithCompletion:.cold.1()
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