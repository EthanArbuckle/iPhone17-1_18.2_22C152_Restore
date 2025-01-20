@interface BLSHWatchdogTester
- (BLSHWatchdogTester)initWithWatchdogProviderDelegate:(id)a3 testables:(id)a4;
- (id)_watchdogProvider;
- (void)_triggerTestWatchdog:(id)a3;
@end

@implementation BLSHWatchdogTester

- (BLSHWatchdogTester)initWithWatchdogProviderDelegate:(id)a3 testables:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BLSHWatchdogTester;
  v9 = [(BLSHWatchdogTester *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_lock_nextTimerID = 1;
    objc_storeStrong((id *)&v9->_watchdogProviderDelegate, a3);
    uint64_t v11 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    testables = v10->_testables;
    v10->_testables = (NSMapTable *)v11;

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __65__BLSHWatchdogTester_initWithWatchdogProviderDelegate_testables___block_invoke;
    v14[3] = &unk_264534560;
    v15 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v14];
  }
  return v10;
}

void __65__BLSHWatchdogTester_initWithWatchdogProviderDelegate_testables___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:a3 forKey:v5];
  v6 = bls_diagnostics_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_INFO, "observing \"%{public}@\"", (uint8_t *)&v8, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_triggerTestWatchdog, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (id)_watchdogProvider
{
  watchdogProvider = self->_watchdogProvider;
  if (!watchdogProvider)
  {
    v4 = [[BLSHWatchdogProvider alloc] initWithDelegate:self->_watchdogProviderDelegate];
    v5 = self->_watchdogProvider;
    self->_watchdogProvider = v4;

    watchdogProvider = self->_watchdogProvider;
  }

  return watchdogProvider;
}

- (void)_triggerTestWatchdog:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSMapTable *)self->_testables objectForKey:v4];
  v6 = bls_diagnostics_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_INFO, "got test watchdog \"%{public}@\" with testable %{public}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v57 = __Block_byref_object_copy__13;
  v58 = __Block_byref_object_dispose__13;
  id v7 = [BLSHWatchdogTesterTimer alloc];
  int v8 = [NSString stringWithFormat:@"Test watchdog %@", v4];
  v59 = [(BLSHWatchdogTesterTimer *)v7 initWithExplanation:v8];

  if ([v4 hasSuffix:@".sleepImminent"]) {
    [*(id *)(*(void *)&buf[8] + 40) setSleepImminentSinceScheduled:1];
  }
  if ([v4 hasSuffix:@".delayCBTransitions-15"])
  {
    v9 = [v4 componentsSeparatedByString:@"-"];
    uint64_t v10 = [v9 lastObject];

    [v10 doubleValue];
    double v12 = v11;
    if (objc_opt_respondsToSelector()) {
      [v5 setCBTransitionsDelayForTesting:v12];
    }
LABEL_8:

    goto LABEL_28;
  }
  if ([v4 hasSuffix:@".delayCATransitions-7"])
  {
    v13 = [v4 componentsSeparatedByString:@"-"];
    uint64_t v10 = [v13 lastObject];

    [v10 doubleValue];
    double v15 = v14;
    if (objc_opt_respondsToSelector()) {
      [v5 setCATransitionsDelayForTesting:v15];
    }
    goto LABEL_8;
  }
  objc_super v16 = [(BLSHWatchdogTester *)self _watchdogProvider];
  [v16 fireWatchdogWithTimer:*(void *)(*(void *)&buf[8] + 40) delegate:v5 timeout:0.0 elapsedTime:3.0];

  if ([v4 hasSuffix:@".invalidateAfterFire"])
  {
    BSContinuousMachTimeNow();
    uint64_t v18 = v17;
    dispatch_time_t v19 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke;
    block[3] = &unk_264534588;
    block[6] = v18;
    block[4] = self;
    block[5] = buf;
    dispatch_after(v19, MEMORY[0x263EF83A0], block);
  }
  else if ([v4 hasSuffix:@".completeAfterDelay-20"])
  {
    v20 = [v4 componentsSeparatedByString:@"-"];
    v21 = [v20 lastObject];

    [v21 doubleValue];
    double v23 = v22;
    v24 = bls_diagnostics_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v52 = 134217984;
      double v53 = v23;
      _os_log_impl(&dword_21FCFC000, v24, OS_LOG_TYPE_INFO, "_triggerTestWatchdog: will clear watchdog as complete after %1.1fs", v52, 0xCu);
    }

    BSContinuousMachTimeNow();
    uint64_t v26 = v25;
    dispatch_time_t v27 = dispatch_time(0, (uint64_t)(v23 * 1000000000.0));
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_66;
    v50[3] = &unk_2645345B0;
    v50[6] = v26;
    *(double *)&v50[7] = v23;
    v50[4] = self;
    v50[5] = buf;
    dispatch_after(v27, MEMORY[0x263EF83A0], v50);
  }
  else if ([v4 hasSuffix:@".replaceAndCompleteAfterDelay-2-10"])
  {
    v28 = [v4 componentsSeparatedByString:@"-"];
    unint64_t v29 = [v28 count];
    if (v29 <= 2)
    {
      v42 = bls_diagnostics_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        [(BLSHWatchdogTester *)(uint64_t)v4 _triggerTestWatchdog:v42];
      }
    }
    else
    {
      v30 = [v28 objectAtIndex:v29 - 2];
      [v30 doubleValue];
      double v32 = v31;

      v33 = [v28 lastObject];
      [v33 doubleValue];
      double v35 = v34;

      v36 = bls_diagnostics_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v52 = 134218240;
        double v53 = v32;
        __int16 v54 = 2048;
        double v55 = v35;
        _os_log_impl(&dword_21FCFC000, v36, OS_LOG_TYPE_INFO, "_triggerTestWatchdog: will replace after %1.1fs and then clear watchdog as complete after %1.1fs", v52, 0x16u);
      }

      BSContinuousMachTimeNow();
      uint64_t v38 = v37;
      dispatch_time_t v39 = dispatch_time(0, (uint64_t)(v32 * 1000000000.0));
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_67;
      v44[3] = &unk_2645345D8;
      uint64_t v48 = v38;
      double v49 = v32;
      v47 = buf;
      v44[4] = self;
      id v45 = v4;
      id v46 = v5;
      v40 = MEMORY[0x263EF83A0];
      dispatch_after(v39, MEMORY[0x263EF83A0], v44);
      dispatch_time_t v41 = dispatch_time(0, (uint64_t)(v35 * 1000000000.0));
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_71;
      v43[3] = &unk_2645345B0;
      v43[6] = v38;
      *(double *)&v43[7] = v35;
      v43[4] = self;
      v43[5] = buf;
      dispatch_after(v41, v40, v43);
    }
  }
LABEL_28:
  _Block_object_dispose(buf, 8);
}

void __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke(uint64_t a1)
{
  BSContinuousMachTimeNow();
  double v3 = v2 - *(double *)(a1 + 48);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate:2];
  id v5 = [*(id *)(a1 + 32) _watchdogProvider];
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) explanation];
  [v5 clearWatchdogWithExplanation:v4 reason:2 timeout:0.0 elapsedTime:v3];
}

void __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_66(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BSContinuousMachTimeNow();
  double v3 = v2;
  double v4 = *(double *)(a1 + 48);
  id v5 = bls_diagnostics_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 56);
    int v9 = 134217984;
    uint64_t v10 = v6;
    _os_log_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_INFO, "_triggerTestWatchdog: clearing watchdog as complete after %1.1fs", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate:2];
  id v7 = [*(id *)(a1 + 32) _watchdogProvider];
  int v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) explanation];
  [v7 clearWatchdogWithExplanation:v8 reason:2 timeout:0.0 elapsedTime:v3 - v4];
}

void __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_67(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BSContinuousMachTimeNow();
  double v3 = v2;
  double v4 = *(double *)(a1 + 64);
  id v5 = bls_diagnostics_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v6;
    _os_log_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_INFO, "_triggerTestWatchdog: clearing watchdog as replaced after %1.1fs", buf, 0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) invalidate:1];
  id v7 = [*(id *)(a1 + 32) _watchdogProvider];
  int v8 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) explanation];
  [v7 clearWatchdogWithExplanation:v8 reason:1 timeout:0.0 elapsedTime:v3 - v4];

  int v9 = [BLSHWatchdogTesterTimer alloc];
  uint64_t v10 = [NSString stringWithFormat:@"Test watchdog %@ (replacement)", *(void *)(a1 + 40)];
  uint64_t v11 = [(BLSHWatchdogTesterTimer *)v9 initWithExplanation:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  double v14 = [*(id *)(a1 + 32) _watchdogProvider];
  [v14 fireWatchdogWithTimer:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) delegate:*(void *)(a1 + 48) timeout:0.0 elapsedTime:0.0];
}

void __43__BLSHWatchdogTester__triggerTestWatchdog___block_invoke_71(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BSContinuousMachTimeNow();
  double v3 = v2;
  double v4 = *(double *)(a1 + 48);
  id v5 = bls_diagnostics_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 56);
    int v9 = 134217984;
    uint64_t v10 = v6;
    _os_log_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_INFO, "_triggerTestWatchdog: clearing watchdog as complete after %1.1fs", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate:2];
  id v7 = [*(id *)(a1 + 32) _watchdogProvider];
  int v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) explanation];
  [v7 clearWatchdogWithExplanation:v8 reason:2 timeout:0.0 elapsedTime:v3 - v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogProviderDelegate, 0);
  objc_storeStrong((id *)&self->_watchdogProvider, 0);

  objc_storeStrong((id *)&self->_testables, 0);
}

- (void)_triggerTestWatchdog:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "only found %lu components in notificationName. should have at least:\"%{public}@\"", (uint8_t *)&v3, 0x16u);
}

@end