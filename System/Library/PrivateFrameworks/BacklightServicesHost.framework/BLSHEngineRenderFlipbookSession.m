@interface BLSHEngineRenderFlipbookSession
- (BLSHBacklightEnvironmentPresentation)presentation;
- (BLSHEngineRenderFlipbookSession)initWithDelegate:(id)a3 flipbook:(id)a4 presentation:(id)a5 osInterfaceProvider:(id)a6;
- (NSArray)renderedFrames;
- (NSString)debugDescription;
- (NSString)description;
- (id)telemetryDataWithEndTime:(double)a3 reasonEnded:(id)a4 preventedSleepDuration:(double)a5;
- (uint64_t)lock_memoryUsage;
- (unint64_t)count;
- (unint64_t)memoryUsage;
- (void)_lock_scheduleTimeoutForSpecifier:(uint64_t)a1;
- (void)dealloc;
- (void)environment:(void *)a3 didUpdateToSpecifier:;
- (void)invalidate;
- (void)prepareAndRenderFrameSpecifier:(id)a3;
- (void)renderFrameSpecifier:(void *)a3 timedOutEnvironments:;
- (void)timeoutTimerFiredForSpecifier:(uint64_t)a1;
@end

@implementation BLSHEngineRenderFlipbookSession

- (BLSHEngineRenderFlipbookSession)initWithDelegate:(id)a3 flipbook:(id)a4 presentation:(id)a5 osInterfaceProvider:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)BLSHEngineRenderFlipbookSession;
  v14 = [(BLSHEngineRenderFlipbookSession *)&v34 init];
  v15 = v14;
  if (v14)
  {
    id v26 = v13;
    id v27 = v11;
    objc_storeStrong((id *)&v14->_flipbook, a4);
    objc_storeStrong((id *)&v15->_presentation, a5);
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v15->_lock_delegate, v10);
    objc_storeStrong((id *)&v15->_osInterfaceProvider, a6);
    uint64_t v16 = [MEMORY[0x263EFF980] array];
    lock_renderedFrames = v15->_lock_renderedFrames;
    v15->_lock_renderedFrames = (NSMutableArray *)v16;

    BSContinuousMachTimeNow();
    v15->_sessionStartTime = v18;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v19 = [v12 presentationEntries];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "environment", v26, v27);
          if (objc_opt_respondsToSelector()) {
            [v24 willBeginRenderSession:v15];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v21);
    }

    objc_initWeak(&location, v15);
    objc_copyWeak(&v28, &location);
    v15->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    id v13 = v26;
    id v11 = v27;
  }

  return v15;
}

uint64_t __94__BLSHEngineRenderFlipbookSession_initWithDelegate_flipbook_presentation_osInterfaceProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained debugDescription];
  uint64_t v3 = BLSStateDataWithTitleDescriptionAndHints();

  return v3;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[BLSHEngineRenderFlipbookSession count](self, "count"), @"renderedCount");
  uint64_t v5 = [v3 build];

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v5 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_lock_renderedFrames, "count"), @"renderedCount");
  id v6 = (id)[v4 appendBool:self->_lock_didFailToRender withName:@"didFailToRender" ifEqualTo:1];
  id v7 = (id)[v4 appendBool:self->_lock_timedOut withName:@"timedOut" ifEqualTo:1];
  id v8 = (id)[v4 appendBool:self->_lock_invalidated withName:@"invalidated" ifEqualTo:1];
  if (self->_lock_retryRenderCount >= 1) {
    id v9 = (id)objc_msgSend(v4, "appendInt:withName:");
  }
  BSContinuousMachTimeNow();
  id v11 = (id)[v4 appendDouble:@"totalPreparationSeconds" withName:3 decimalPrecision:v10 - self->_sessionStartTime];
  id v12 = (id)[v4 appendDouble:@"accumulatedLayoutSeconds" withName:3 decimalPrecision:self->_lock_accumulatedLayoutDuration];
  id v13 = (id)[v4 appendDouble:@"accumulatedRenderSeconds" withName:3 decimalPrecision:self->_lock_accumulatedRenderDuration];
  id v14 = (id)[v4 appendObject:self->_lock_preparingSpecifier withName:@"preparingSpecifier" skipIfNil:1];
  id v15 = (id)[v4 appendObject:self->_lock_timeoutTimer withName:@"timeoutTimer" skipIfNil:1];
  uint64_t v16 = [(NSMutableSet *)self->_lock_pendingEnvironments allObjects];
  [v4 appendArraySection:v16 withName:@"pendingEnvironments" multilinePrefix:@"      " skipIfEmpty:1];

  [v4 appendArraySection:self->_lock_renderedFrames withName:@"renderedFrames" multilinePrefix:@"      " skipIfEmpty:1];
  os_unfair_lock_unlock(p_lock);
  v17 = [v4 build];

  return (NSString *)v17;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMutableArray *)self->_lock_renderedFrames count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)memoryUsage
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = -[BLSHEngineRenderFlipbookSession lock_memoryUsage]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (uint64_t)lock_memoryUsage
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 40);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "memoryUsage", (void)v8);
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (NSArray)renderedFrames
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_lock_renderedFrames copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)invalidate
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  if (self->_lock_didDisableFlipbookPowerSavings)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
    [WeakRetained decrementDisablePowerSavingUsageCountForReason:3];

    self->_lock_didDisableFlipbookPowerSavings = 0;
  }
  [(BSTimerScheduleQuerying *)self->_lock_timeoutTimer invalidate];
  lock_timeoutTimer = self->_lock_timeoutTimer;
  self->_lock_timeoutTimer = 0;

  objc_storeWeak((id *)&self->_lock_delegate, 0);
  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(BLSHBacklightEnvironmentPresentation *)self->_presentation presentationEntries];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v12 + 1) + 8 * i) environment];
        if (objc_opt_respondsToSelector()) {
          [v11 willEndRenderSession:self];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)prepareAndRenderFrameSpecifier:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v29 = a3;
  if (!v29)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"specifier != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHEngineRenderFlipbookSession prepareAndRenderFrameSpecifier:](a2);
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD1B140);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    id v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_invalidated"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHEngineRenderFlipbookSession prepareAndRenderFrameSpecifier:].cold.4(a2);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD1B1A4);
  }
  if (self->_lock_preparingSpecifier)
  {
    id v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_preparingSpecifier == nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHEngineRenderFlipbookSession prepareAndRenderFrameSpecifier:](a2);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD1B208);
  }
  BSContinuousMachTimeNow();
  self->_lock_layoutStartTime = v6;
  if (!self->_lock_didDisableFlipbookPowerSavings)
  {
    self->_lock_didDisableFlipbookPowerSavings = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lock_delegate);
    [WeakRetained incrementDisablePowerSavingUsageCountForReason:3];
  }
  objc_storeStrong((id *)&self->_lock_preparingSpecifier, a3);
  uint64_t v8 = [MEMORY[0x263EFF9C0] set];
  lock_pendingEnvironments = self->_lock_pendingEnvironments;
  self->_lock_pendingEnvironments = v8;

  [v29 specifiers];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = self->_lock_pendingEnvironments;
        long long v15 = [*(id *)(*((void *)&v39 + 1) + 8 * i) environment];
        uint64_t v16 = [v15 identifier];
        [(NSMutableSet *)v14 addObject:v16];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v11);
  }

  if (![(NSMutableSet *)self->_lock_pendingEnvironments count])
  {
    id v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_lock_pendingEnvironments count] > 0"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHEngineRenderFlipbookSession prepareAndRenderFrameSpecifier:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD1B26CLL);
  }
  -[BLSHEngineRenderFlipbookSession _lock_scheduleTimeoutForSpecifier:]((uint64_t)self, v29);
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(&location, self);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v17 = v10;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        uint64_t v22 = [v21 environment];
        v23 = [v21 dateSpecifier];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __66__BLSHEngineRenderFlipbookSession_prepareAndRenderFrameSpecifier___block_invoke;
        v30[3] = &unk_264532B80;
        objc_copyWeak(&v33, &location);
        id v24 = v22;
        id v31 = v24;
        id v32 = v29;
        [v24 updateToDateSpecifier:v23 sceneContentsUpdated:v30];

        objc_destroyWeak(&v33);
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v18);
  }

  objc_destroyWeak(&location);
}

- (void)_lock_scheduleTimeoutForSpecifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, (id)a1);
    [*(id *)(a1 + 48) invalidate];
    uint64_t v4 = *(void **)(a1 + 64);
    uint64_t v5 = [MEMORY[0x263F29C40] builderWithObject:a1];
    double v6 = [v5 build];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__BLSHEngineRenderFlipbookSession__lock_scheduleTimeoutForSpecifier___block_invoke;
    v9[3] = &unk_264532BC8;
    objc_copyWeak(&v11, &location);
    id v10 = v3;
    uint64_t v7 = [v4 scheduledTimerWithIdentifier:v6 interval:v9 leewayInterval:1.0 handler:2.0];
    uint64_t v8 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __66__BLSHEngineRenderFlipbookSession_prepareAndRenderFrameSpecifier___block_invoke(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  -[BLSHEngineRenderFlipbookSession environment:didUpdateToSpecifier:]((uint64_t)WeakRetained, a1[4], a1[5]);
}

- (void)environment:(void *)a3 didUpdateToSpecifier:
{
  id v10 = a2;
  id v5 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(unsigned char *)(a1 + 118)
      || *(unsigned char *)(a1 + 117)
      || *(id *)(a1 + 24) != v5
      || (double v6 = *(void **)(a1 + 32),
          [v10 identifier],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v6 removeObject:v7],
          v7,
          [*(id *)(a1 + 32) count]))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    }
    else
    {
      uint64_t v8 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;

      [*(id *)(a1 + 48) invalidate];
      uint64_t v9 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;

      *(_DWORD *)(a1 + 112) = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
      -[BLSHEngineRenderFlipbookSession renderFrameSpecifier:timedOutEnvironments:](a1, v5, 0);
    }
  }
}

- (id)telemetryDataWithEndTime:(double)a3 reasonEnded:(id)a4 preventedSleepDuration:(double)a5
{
  p_lock = &self->_lock;
  id v9 = a4;
  os_unfair_lock_lock(p_lock);
  id v10 = objc_alloc(MEMORY[0x263EFF910]);
  id v11 = objc_msgSend(v10, "bls_initWithBSContinuousMachTime:", a3);

  uint64_t v12 = +[BLSHFlipbookFramesHistogram histogramWithReferenceDate:v11 flipbookFrames:self->_lock_renderedFrames];
  long long v13 = [(BLSHBacklightEnvironmentPresentation *)self->_presentation presentationEntries];
  long long v14 = objc_msgSend(v13, "bs_mapNoNulls:", &__block_literal_global_566);

  long long v15 = [[BLSHFlipbookRenderSessionTelemetryData alloc] initWithTimestamp:v14 environmentIdentifiers:v9 reasonEnded:v12 sessionFramesHistogram:self->_lock_didFailToRender totalPreparationDuration:[(NSMutableSet *)self->_lock_pendingEnvironments count] accumulatedLayoutDuration:a3 accumulatedRenderDuration:a3 - self->_sessionStartTime preventedSleepDuration:self->_lock_accumulatedLayoutDuration didFailToRender:self->_lock_accumulatedRenderDuration timedOutEnvironmentCount:a5];
  os_unfair_lock_unlock(p_lock);

  return v15;
}

id __95__BLSHEngineRenderFlipbookSession_telemetryDataWithEndTime_reasonEnded_preventedSleepDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 environment];
  id v3 = [v2 identifier];

  return v3;
}

void __69__BLSHEngineRenderFlipbookSession__lock_scheduleTimeoutForSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[BLSHEngineRenderFlipbookSession timeoutTimerFiredForSpecifier:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
}

- (void)timeoutTimerFiredForSpecifier:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(id *)(a1 + 24) != v3)
    {
      id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_preparingSpecifier == specifier"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHEngineRenderFlipbookSession timeoutTimerFiredForSpecifier:]();
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD1B950);
    }
    *(unsigned char *)(a1 + 117) = 1;
    int v4 = *(unsigned __int8 *)(a1 + 118);
    *(void *)(a1 + 24) = 0;

    id v5 = [*(id *)(a1 + 32) allObjects];
    [*(id *)(a1 + 48) invalidate];
    double v6 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    if (v4)
    {
      uint64_t v7 = bls_flipbook_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[BLSHEngineRenderFlipbookSession timeoutTimerFiredForSpecifier:]();
      }
    }
    else
    {
      int v8 = BSIsBeingDebugged();
      id v9 = bls_flipbook_log();
      uint64_t v7 = v9;
      if (!v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[BLSHEngineRenderFlipbookSession timeoutTimerFiredForSpecifier:]();
        }

        -[BLSHEngineRenderFlipbookSession renderFrameSpecifier:timedOutEnvironments:](a1, v3, v5);
        goto LABEL_7;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v12 = a1;
        __int16 v13 = 2114;
        long long v14 = v5;
        _os_log_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_INFO, "%p prepare frame operation did not complete after ~1 second (+leeway), (but it is being debugged), pending environments:%{public}@ ", buf, 0x16u);
      }
    }

LABEL_7:
  }
}

- (void)renderFrameSpecifier:(void *)a3 timedOutEnvironments:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [v5 encodedPresentationTime];
    [v6 count];
    [v5 encodedPresentationTime];
    kdebug_trace();
    BSContinuousMachTimeNow();
    *(double *)(a1 + 96) = *(double *)(a1 + 96) + v8 - *(double *)(a1 + 88);
    id v9 = [v5 specifiers];
    [v9 count];
    kdebug_trace();

    BSContinuousMachTimeNow();
    uint64_t v11 = v10;
    uint64_t v12 = *(void **)(a1 + 8);
    uint64_t v13 = *(void *)(a1 + 120);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke;
    v14[3] = &unk_264532BF0;
    uint64_t v18 = v7;
    id v15 = v5;
    uint64_t v16 = a1;
    uint64_t v19 = v11;
    id v17 = v6;
    uint64_t v20 = sel_renderFrameSpecifier_timedOutEnvironments_;
    [v12 renderFrameForPresentation:v13 dateSpecifier:v15 completion:v14];
  }
}

void __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [v5 frameId];
  uint64_t v7 = (uint64_t *)(a1 + 40);
  kdebug_trace();
  BSContinuousMachTimeNow();
  *(double *)(*(void *)(a1 + 40) + 104) = v8 - *(double *)(a1 + 64) + *(double *)(*(void *)(a1 + 40) + 104);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
  int v9 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 118);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
  if (v5) {
    [*(id *)(*v7 + 40) addObject:v5];
  }
  int v11 = [*(id *)(*v7 + 40) count];
  uint64_t v12 = -[BLSHEngineRenderFlipbookSession lock_memoryUsage](*v7);
  if (v6)
  {
    uint64_t v13 = [v6 domain];
    int v14 = [v13 isEqual:@"com.apple.coreanimation.flipbook"];

    if (v14)
    {
      int v15 = [v6 code];
      if (v15 == 5)
      {
        ++*(_DWORD *)(*v7 + 112);
        os_unfair_lock_unlock((os_unfair_lock_t)(*v7 + 16));
        id v28 = bls_flipbook_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          uint64_t v61 = *(void *)(a1 + 40);
          id v29 = objc_msgSend(v6, "bls_loggingString");
          long long v30 = objc_msgSend(*(id *)(a1 + 32), "bls_loggingString");
          id v31 = [MEMORY[0x263F29A70] sharedFormatter];
          id v32 = [v31 stringFromByteCount:v12];
          *(_DWORD *)buf = 134219010;
          uint64_t v74 = v61;
          __int16 v75 = 2114;
          v76 = v29;
          __int16 v77 = 2114;
          *(void *)v78 = v30;
          *(_WORD *)&v78[8] = 1024;
          *(_DWORD *)&v78[10] = v11;
          __int16 v79 = 2114;
          v80 = v32;
          _os_log_impl(&dword_21FCFC000, v28, OS_LOG_TYPE_INFO, "%p (will retry) failed to render error:\"%{public}@\" specifier:%{public}@ (session:%u,%{public}@)", buf, 0x30u);
        }
        objc_initWeak((id *)buf, *(id *)(a1 + 40));
        dispatch_time_t v33 = dispatch_time(0, 10000000);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_576;
        block[3] = &unk_264532B80;
        long long v34 = &v68;
        objc_copyWeak(&v68, (id *)buf);
        id v66 = *(id *)(a1 + 32);
        id v67 = *(id *)(a1 + 48);
        dispatch_after(v33, MEMORY[0x263EF83A0], block);

        long long v35 = v66;
        goto LABEL_25;
      }
      if (v15 == 2)
      {
        if (objc_opt_respondsToSelector()) {
          int v16 = [*(id *)(*v7 + 64) isFlipbookTransparent];
        }
        else {
          int v16 = 0;
        }
        int v36 = v16 & ([WeakRetained isUsingPseudoFlipbook] ^ 1);
        long long v37 = (os_unfair_lock_s *)*v7;
        if (*(int *)(*v7 + 112) >= 1)
        {
          v38 = bls_flipbook_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            uint64_t v57 = *(void *)(a1 + 40);
            v63 = objc_msgSend(v6, "bls_loggingString");
            v60 = objc_msgSend(*(id *)(a1 + 32), "bls_loggingString");
            v58 = [MEMORY[0x263F29A70] sharedFormatter];
            v56 = [v58 stringFromByteCount:v12];
            *(_DWORD *)buf = 134219010;
            uint64_t v74 = v57;
            __int16 v75 = 2114;
            v76 = v63;
            __int16 v77 = 2114;
            *(void *)v78 = v60;
            *(_WORD *)&v78[8] = 1024;
            *(_DWORD *)&v78[10] = v11;
            __int16 v79 = 2114;
            v80 = v56;
            _os_log_error_impl(&dword_21FCFC000, v38, OS_LOG_TYPE_ERROR, "%p (likely rdar://81598375) failed (twice) to render error:%{public}@ specifier:%{public}@ (session:%u,%{public}@)", buf, 0x30u);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(*v7 + 16));
          if (v36) {
            goto LABEL_36;
          }
          goto LABEL_10;
        }
        char v39 = v36 ^ 1;
        if (v9) {
          char v39 = 0;
        }
        if ((v39 & 1) == 0)
        {
          os_unfair_lock_unlock(v37 + 4);
          if (v36)
          {
LABEL_36:
            long long v40 = bls_flipbook_log();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              uint64_t v46 = *(void *)(a1 + 40);
              v47 = objc_msgSend(v6, "bls_loggingString");
              v48 = objc_msgSend(*(id *)(a1 + 32), "bls_loggingString");
              v49 = [MEMORY[0x263F29A70] sharedFormatter];
              v50 = [v49 stringFromByteCount:v12];
              *(_DWORD *)buf = 134219010;
              uint64_t v74 = v46;
              __int16 v75 = 2114;
              v76 = v47;
              __int16 v77 = 2114;
              *(void *)v78 = v48;
              *(_WORD *)&v78[8] = 1024;
              *(_DWORD *)&v78[10] = v11;
              __int16 v79 = 2114;
              v80 = v50;
              _os_log_error_impl(&dword_21FCFC000, v40, OS_LOG_TYPE_ERROR, "%p (**INVALID CONFIGURATION**) failed to render error:\"%{public}@\" specifier:%{public}@ (session:%u,%{public}@)\nEITHER DELETE transparentFlipbook:\n    login -fq mobile defaults delete com.apple.BacklightServices transparentFlipbook\nOR ALSO SET usePseudoFlipbook:\n    login -fq mobile defaults write com.apple.BacklightServices usePseudoFlipbook -BOOL YES", buf, 0x30u);
            }
            goto LABEL_39;
          }
          goto LABEL_10;
        }
        v37[28]._os_unfair_lock_opaque = 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(*v7 + 16));
        v44 = bls_flipbook_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          uint64_t v64 = *(void *)(a1 + 40);
          v51 = objc_msgSend(v6, "bls_loggingString");
          v52 = objc_msgSend(*(id *)(a1 + 32), "bls_loggingString");
          v53 = [MEMORY[0x263F29A70] sharedFormatter];
          v54 = [v53 stringFromByteCount:v12];
          *(_DWORD *)buf = 134219010;
          uint64_t v74 = v64;
          __int16 v75 = 2114;
          v76 = v51;
          __int16 v77 = 2114;
          *(void *)v78 = v52;
          *(_WORD *)&v78[8] = 1024;
          *(_DWORD *)&v78[10] = v11;
          __int16 v79 = 2114;
          v80 = v54;
          _os_log_error_impl(&dword_21FCFC000, v44, OS_LOG_TYPE_ERROR, "%p (likely rdar://81598375) (will retry) failed to render error:\"%{public}@\" specifier:%{public}@ (session:%u,%{public}@)", buf, 0x30u);
        }
        objc_initWeak((id *)buf, *(id *)(a1 + 40));
        dispatch_time_t v45 = dispatch_time(0, 50000000);
        v69[0] = MEMORY[0x263EF8330];
        v69[1] = 3221225472;
        v69[2] = __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_575;
        v69[3] = &unk_264532B80;
        long long v34 = &v72;
        objc_copyWeak(&v72, (id *)buf);
        id v70 = *(id *)(a1 + 32);
        id v71 = *(id *)(a1 + 48);
        dispatch_after(v45, MEMORY[0x263EF83A0], v69);

        long long v35 = v70;
LABEL_25:

        objc_destroyWeak(v34);
        objc_destroyWeak((id *)buf);
        goto LABEL_39;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*v7 + 16));
LABEL_10:
    id v17 = bls_flipbook_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      uint64_t v59 = *(void *)(a1 + 40);
      long long v41 = objc_msgSend(v6, "bls_loggingString");
      long long v42 = objc_msgSend(*(id *)(a1 + 32), "bls_loggingString");
      v62 = [MEMORY[0x263F29A70] sharedFormatter];
      v43 = [v62 stringFromByteCount:v12];
      *(_DWORD *)buf = 134219010;
      uint64_t v74 = v59;
      __int16 v75 = 2114;
      v76 = v41;
      __int16 v77 = 2114;
      *(void *)v78 = v42;
      *(_WORD *)&v78[8] = 1024;
      *(_DWORD *)&v78[10] = v11;
      __int16 v79 = 2114;
      v80 = v43;
      _os_log_fault_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_FAULT, "%p failed to render error:\"%{public}@\" specifier:%{public}@ (session:%u,%{public}@)", buf, 0x30u);
    }
    if (!v9) {
      [WeakRetained renderFramesSession:*(void *)(a1 + 40) failedToRenderSpecifier:*(void *)(a1 + 32) error:v6 timedOutEnvironments:*(void *)(a1 + 48)];
    }
    goto LABEL_39;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*v7 + 16));
  if (v9)
  {
    uint64_t v18 = bls_flipbook_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *v7;
      uint64_t v20 = objc_msgSend(v5, "bls_loggingString");
      uint64_t v21 = [MEMORY[0x263F29A70] sharedFormatter];
      uint64_t v22 = [v21 stringFromByteCount:v12];
      *(_DWORD *)buf = 134218754;
      uint64_t v74 = v19;
      __int16 v75 = 2114;
      v76 = v20;
      __int16 v77 = 1024;
      *(_DWORD *)v78 = v11;
      *(_WORD *)&v78[4] = 2114;
      *(void *)&v78[6] = v22;
      _os_log_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_INFO, "%p (after invalidated) did render:%{public}@ (session:%u,%{public}@)", buf, 0x26u);
    }
  }
  else
  {
    if (!v5)
    {
      v55 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"renderedFrame != nil"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_cold_1();
      }
      [v55 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD1C510);
    }
    v23 = bls_flipbook_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *v7;
      v25 = objc_msgSend(v5, "bls_loggingString");
      id v26 = [MEMORY[0x263F29A70] sharedFormatter];
      id v27 = [v26 stringFromByteCount:v12];
      *(_DWORD *)buf = 134218754;
      uint64_t v74 = v24;
      __int16 v75 = 2114;
      v76 = v25;
      __int16 v77 = 1024;
      *(_DWORD *)v78 = v11;
      *(_WORD *)&v78[4] = 2114;
      *(void *)&v78[6] = v27;
      _os_log_impl(&dword_21FCFC000, v23, OS_LOG_TYPE_INFO, "%p did render:%{public}@ (session:%u,%{public}@)", buf, 0x26u);
    }
    [WeakRetained renderFramesSession:*(void *)(a1 + 40) didRenderFrame:v5 timedOutEnvironments:*(void *)(a1 + 48)];
  }
LABEL_39:
}

void __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_575(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[BLSHEngineRenderFlipbookSession renderFrameSpecifier:timedOutEnvironments:](WeakRetained, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_576(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[BLSHEngineRenderFlipbookSession renderFrameSpecifier:timedOutEnvironments:](WeakRetained, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  return self->_presentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
  objc_destroyWeak((id *)&self->_lock_delegate);
  objc_storeStrong((id *)&self->_lock_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_lock_renderedFrames, 0);
  objc_storeStrong((id *)&self->_lock_pendingEnvironments, 0);
  objc_storeStrong((id *)&self->_lock_preparingSpecifier, 0);

  objc_storeStrong((id *)&self->_flipbook, 0);
}

- (void)prepareAndRenderFrameSpecifier:(const char *)a1 .cold.1(const char *a1)
{
  id v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)prepareAndRenderFrameSpecifier:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)prepareAndRenderFrameSpecifier:(const char *)a1 .cold.3(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)prepareAndRenderFrameSpecifier:(const char *)a1 .cold.4(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)timeoutTimerFiredForSpecifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_ERROR, "%p prepare frame operation did not complete after ~1 second (+leeway), pending environments:%{public}@", v1, 0x16u);
}

- (void)timeoutTimerFiredForSpecifier:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_21FCFC000, v0, (uint64_t)v0, "%p prepare frame operation did not complete after ~1 second (+leeway), (invalidated), pending environments:%{public}@", v1);
}

- (void)timeoutTimerFiredForSpecifier:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __77__BLSHEngineRenderFlipbookSession_renderFrameSpecifier_timedOutEnvironments___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 72));
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

@end