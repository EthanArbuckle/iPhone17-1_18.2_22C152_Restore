@interface BLSHWatchdogProvider
+ (BOOL)checkForWatchdogDidFire:(BOOL)a3;
+ (BOOL)ignoreWatchdogAborts;
+ (void)markWatchdogDidFire:(id)a3 abortReason:(id)a4;
+ (void)resetWatchdogDidFire;
+ (void)setIgnoreWatchdogAborts:(BOOL)a3;
+ (void)showWatchdogDidFireAlert:(id)a3;
- (BLSHWatchdogProvider)initWithDelegate:(id)a3;
- (BOOL)isTesting;
- (BOOL)isWaitingwaitingPastFireForCompletionAndTailspin;
- (BOOL)isWatchdogEnabled;
- (id)scheduleWatchdogWithDelegate:(id)a3 explanation:(id)a4 timeout:(double)a5;
- (id)waitingPastFireForCompletionAndTailspinAbortParams;
- (void)_abortForWatchdogFire:(id)a3;
- (void)_checkForReadyToAbortAfterWaitingPastFire;
- (void)_clearIsWaitingForWatchdogCompletion;
- (void)_fireWatchdogWithTimer:(id)a3 delegate:(id)a4 timeout:(double)a5 elapsedTime:(double)a6 abortContext:(id)a7 explanation:(id)a8 remainingRetries:(unint64_t)a9;
- (void)_giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:(id)a3;
- (void)_startWritingTailspin;
- (void)clearWatchdogWithExplanation:(id)a3 reason:(unint64_t)a4 timeout:(double)a5 elapsedTime:(double)a6;
- (void)dealloc;
- (void)didDetectSignificantUserInteraction;
- (void)fireWatchdogWithTimer:(id)a3 delegate:(id)a4 timeout:(double)a5 elapsedTime:(double)a6;
- (void)registerHandlersForService:(id)a3;
- (void)setWaitingwaitingPastFireForCompletionAndTailspin:(id)a3 waitForWatchdogCompletion:(BOOL)a4;
- (void)setWatchdogEnabled:(BOOL)a3;
@end

@implementation BLSHWatchdogProvider

- (BLSHWatchdogProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BLSHWatchdogProvider;
  v5 = [(BLSHWatchdogProvider *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_watchdogEnabled = 1;
    objc_storeWeak((id *)&v5->_providerDelegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BSAbsoluteMachTimer *)self->_lock_fireRetryTimer invalidate];
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)BLSHWatchdogProvider;
  [(BLSHWatchdogProvider *)&v4 dealloc];
}

+ (void)setIgnoreWatchdogAborts:(BOOL)a3
{
  os_unfair_lock_lock(&__classLock);
  __ignoreWatchdogAborts = a3;

  os_unfair_lock_unlock(&__classLock);
}

+ (BOOL)ignoreWatchdogAborts
{
  os_unfair_lock_lock(&__classLock);
  char v2 = __ignoreWatchdogAborts;
  os_unfair_lock_unlock(&__classLock);
  return v2;
}

- (void)registerHandlersForService:(id)a3
{
  id v3 = +[BLSHDisableBacklightWatchdogsAttributeHandler registerHandlerForService:a3 provider:self];
}

- (id)scheduleWatchdogWithDelegate:(id)a3 explanation:(id)a4 timeout:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = bls_diagnostics_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BLSHWatchdogProvider scheduleWatchdogWithDelegate:explanation:timeout:]((uint64_t)v8, v10, a5);
  }

  v11 = [[BSLHWatchdogTimer alloc] initWithExplanation:v8 delegate:v9 provider:self];
  [(BSLHWatchdogTimer *)v11 scheduleWithTimeout:a5];

  return v11;
}

- (void)fireWatchdogWithTimer:(id)a3 delegate:(id)a4 timeout:(double)a5 elapsedTime:(double)a6
{
  *(void *)&v29[11] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = [v11 abortContextForTimer:v10];
  if ([v10 hasSleepBeenImminentSinceScheduled]) {
    [v12 setSleepImminentAbortReason];
  }
  kdebug_trace();
  v13 = NSString;
  v14 = [v12 abortReasonString];
  v15 = [v10 explanation];
  v16 = [v13 stringWithFormat:@"BLS %@ watchdog: %@", v14, v15];

  BOOL v17 = [(BLSHWatchdogProvider *)self isWatchdogEnabled];
  int v18 = BSIsBeingDebugged();
  int v19 = v18;
  if (v17 && (!v18 || [(BLSHWatchdogProvider *)self isTesting]))
  {
    v20 = bls_diagnostics_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      double v23 = a5;
      __int16 v24 = 2114;
      v25 = v16;
      __int16 v26 = 2048;
      double v27 = a6;
      __int16 v28 = 2114;
      *(void *)v29 = v12;
      _os_log_error_impl(&dword_21FCFC000, v20, OS_LOG_TYPE_ERROR, "%.2lfs watchdog first fired:\"%{public}@\" elapsedTime:%.2lfs abortContext:%{public}@", buf, 0x2Au);
    }

    [(BLSHWatchdogProvider *)self _fireWatchdogWithTimer:v10 delegate:v11 timeout:v12 elapsedTime:v16 abortContext:3 explanation:a5 remainingRetries:a6];
  }
  else
  {
    v21 = bls_diagnostics_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219010;
      double v23 = a5;
      __int16 v24 = 2114;
      v25 = v16;
      __int16 v26 = 2048;
      double v27 = a6;
      __int16 v28 = 1024;
      *(_DWORD *)v29 = v17;
      v29[2] = 1024;
      *(_DWORD *)&v29[3] = v19;
      _os_log_impl(&dword_21FCFC000, v21, OS_LOG_TYPE_DEFAULT, "%.2lfs watchdog fired:\"%{public}@\" after elapsed time:%.2lfs watchdogEnabled:%{BOOL}u isBeingDebugged:%{BOOL}u", buf, 0x2Cu);
    }
  }
}

- (void)_fireWatchdogWithTimer:(id)a3 delegate:(id)a4 timeout:(double)a5 elapsedTime:(double)a6 abortContext:(id)a7 explanation:(id)a8 remainingRetries:(unint64_t)a9
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  double v19 = COERCE_DOUBLE(a8);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BSAbsoluteMachTimer *)self->_lock_fireRetryTimer invalidate];
  lock_fireRetryTimer = self->_lock_fireRetryTimer;
  self->_lock_fireRetryTimer = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (a9) {
    BOOL v22 = a6 - a5 > 2.0;
  }
  else {
    BOOL v22 = 0;
  }
  double v23 = bls_diagnostics_log();
  __int16 v24 = v23;
  if (v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 134219266;
      v42 = @"tries";
      *(double *)&location[4] = a5;
      if (a9 == 2) {
        v42 = @"try";
      }
      __int16 v57 = 2048;
      double v58 = a6 - a5;
      __int16 v59 = 2048;
      double v60 = a5;
      __int16 v61 = 2048;
      *(void *)v62 = a9 - 1;
      *(_WORD *)&v62[8] = 2112;
      *(void *)&v62[10] = v42;
      __int16 v63 = 2114;
      double v64 = v19;
      _os_log_error_impl(&dword_21FCFC000, v24, OS_LOG_TYPE_ERROR, "%.2lfs watchdog is potential hang. extra time:%.2lfs trying again in %.2lfs %lu %@ left after that \"%{public}@\"", location, 0x3Eu);
    }

    objc_initWeak((id *)location, self);
    BSContinuousMachTimeNow();
    __int16 v26 = v25;
    os_unfair_lock_lock(&self->_lock);
    id v27 = objc_alloc(MEMORY[0x263F29BA8]);
    __int16 v28 = [NSString stringWithFormat:@"retry: %@", *(void *)&v19];
    uint64_t v29 = [v27 initWithIdentifier:v28];
    v31 = self->_lock_fireRetryTimer;
    p_lock_fireRetryTimer = &self->_lock_fireRetryTimer;
    *p_lock_fireRetryTimer = (BSAbsoluteMachTimer *)v29;

    v32 = *p_lock_fireRetryTimer;
    id v33 = MEMORY[0x263EF83A0];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke;
    v50[3] = &unk_264533748;
    objc_copyWeak(v55, (id *)location);
    id v51 = v16;
    id v52 = v17;
    v55[1] = *(id *)&a5;
    v55[2] = v26;
    id v53 = v18;
    id v54 = *(id *)&v19;
    v55[3] = (id)a9;
    [(BSAbsoluteMachTimer *)v32 scheduleWithFireInterval:MEMORY[0x263EF83A0] leewayInterval:v50 queue:a5 handler:1.0];

    os_unfair_lock_unlock(p_lock);
    objc_destroyWeak(v55);
    objc_destroyWeak((id *)location);
  }
  else
  {
    BOOL v34 = [(BLSHWatchdogProvider *)self isTesting];
    if (v34) {
      os_log_type_t v35 = OS_LOG_TYPE_ERROR;
    }
    else {
      os_log_type_t v35 = -112;
    }
    if (v34) {
      os_log_type_t v36 = OS_LOG_TYPE_ERROR;
    }
    else {
      os_log_type_t v36 = -112;
    }
    if (os_log_type_enabled(v24, v36))
    {
      *(_DWORD *)location = 134219010;
      *(double *)&location[4] = a5;
      __int16 v57 = 2114;
      double v58 = v19;
      __int16 v59 = 2048;
      double v60 = a6;
      __int16 v61 = 1024;
      *(_DWORD *)v62 = a6 - a5 > 2.0;
      *(_WORD *)&v62[4] = 2114;
      *(void *)&v62[6] = v18;
      _os_log_impl(&dword_21FCFC000, v24, v35, "%.2lfs watchdog fired:\"%{public}@\" elapsedTime:%.2lfs isPotentialHang:%{BOOL}u abortContext:%{public}@", location, 0x30u);
    }

    if (!+[BLSHWatchdogProvider ignoreWatchdogAborts]
      && os_variant_has_internal_diagnostics()
      && (objc_opt_respondsToSelector() & 1) != 0
      && [v18 wantsWaitPastFireForCompletionAndTailspin]
      && (id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate),
          int v38 = [WeakRetained isTailspinAvailable],
          WeakRetained,
          v38))
    {
      +[BLSHWatchdogProvider setIgnoreWatchdogAborts:1];
      char v39 = 1;
    }
    else
    {
      char v39 = 0;
    }
    if ([(BLSHWatchdogProvider *)self isTesting]) {
      int64_t v40 = 100000000;
    }
    else {
      int64_t v40 = 1000000000;
    }
    dispatch_time_t v41 = dispatch_time(0, v40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_128;
    block[3] = &unk_264533770;
    block[4] = self;
    id v44 = *(id *)&v19;
    id v45 = v16;
    char v48 = v39;
    id v46 = v17;
    id v47 = v18;
    BOOL v49 = a6 - a5 > 2.0;
    dispatch_after(v41, MEMORY[0x263EF83A0], block);
  }
}

void __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(double *)(a1 + 72);
  BSContinuousMachTimeNow();
  [WeakRetained _fireWatchdogWithTimer:v2 delegate:v3 timeout:*(void *)(a1 + 48) elapsedTime:*(void *)(a1 + 56) abortContext:*(void *)(a1 + 88) - 1 explanation:v4 remainingRetries:v5 - *(double *)(a1 + 80)];
}

void __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_128(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained didFinishDumpingStateForWatchdog:*(void *)(a1 + 40)];
  }
  int v3 = [*(id *)(a1 + 48) isInvalidated];
  if (v3 && !*(unsigned char *)(a1 + 72))
  {
    double v5 = bls_diagnostics_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_128_cold_1(a1, v5);
    }
  }
  else
  {
    double v4 = [*(id *)(a1 + 56) osInterfaceProvider];
    double v5 = [v4 systemSleepMonitor];

    v6 = [v5 aggregateState];
    uint64_t v7 = a1 + 40;
    id v8 = -[BLSHWatchdogAbortParameters initWithDelegate:abortContext:isPotentialHang:sleepMonitorAggregateState:sleepImminentSinceScheduled:explanation:]([BLSHWatchdogAbortParameters alloc], "initWithDelegate:abortContext:isPotentialHang:sleepMonitorAggregateState:sleepImminentSinceScheduled:explanation:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 73), v6, [*(id *)(a1 + 48) hasSleepBeenImminentSinceScheduled], *(void *)(a1 + 40));
    if (*(unsigned char *)(a1 + 72))
    {
      if (v3) {
        BOOL v9 = [*(id *)(a1 + 48) invalidationReason] != 2;
      }
      else {
        BOOL v9 = 1;
      }
      id v17 = bls_diagnostics_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_128_cold_3(v9, (uint64_t *)(a1 + 40), v17);
      }

      [*(id *)(a1 + 32) setWaitingwaitingPastFireForCompletionAndTailspin:v8 waitForWatchdogCompletion:v9];
    }
    else if (+[BLSHWatchdogProvider ignoreWatchdogAborts])
    {
      id v10 = bls_diagnostics_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_128_cold_2(v7, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      [*(id *)(a1 + 32) _abortForWatchdogFire:v8];
    }
  }
}

- (void)_abortForWatchdogFire:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 abortContext];
  int v44 = [v4 isPotentialHang];
  id v46 = [v4 sleepMonitorAggregateState];
  int v6 = [v4 sleepImminentSinceScheduled];
  uint64_t v7 = [v4 explanation];
  uint64_t v8 = [v5 abortReasonString];
  if (![(BLSHWatchdogProvider *)self isTesting]) {
    [(id)objc_opt_class() markWatchdogDidFire:v7 abortReason:v8];
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v45 = [v5 payload];
  }
  else {
    uint64_t v45 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    int v9 = [v5 payloadSize];
  }
  else {
    int v9 = 0;
  }
  double v10 = 30.0;
  if (os_variant_has_internal_diagnostics()
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v5 wantsPanic])
  {
    double v10 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      [v5 panicDelay];
      if (v11 == 0.0) {
        double v10 = 0.0;
      }
      else {
        double v10 = 1.0;
      }
    }
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
    int v13 = [v12 BOOLForKey:@"ignoreWatchdogPanicRequests"];
    if (v13)
    {
      int v14 = v6;
      uint64_t v15 = bls_diagnostics_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FCFC000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring request to panic from abortContext due to default", buf, 2u);
      }

      int v6 = v14;
    }
    uint64_t v16 = (void *)v8;
    int v17 = v13 ^ 1;
  }
  else
  {
    uint64_t v16 = (void *)v8;
    int v17 = 0;
  }
  id v18 = bls_diagnostics_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v32 = @"abort";
    if (v17) {
      v32 = @"panic";
    }
    v42 = v32;
    id v33 = objc_msgSend(v46, "descriptionForTimestamp:", objc_msgSend(v4, "abortTimestamp"));
    char v43 = objc_opt_respondsToSelector();
    if (v43)
    {
      dispatch_time_t v41 = v33;
      int v34 = v6;
      os_log_type_t v35 = NSString;
      uint64_t v40 = [v5 hasEnsureFlipbookCurrent];
      os_log_type_t v36 = v35;
      int v6 = v34;
      id v33 = v41;
      objc_msgSend(v36, "stringWithFormat:", @" ensFlipCur:%u", v40);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = &stru_26D1758B0;
    }
    *(_DWORD *)buf = 138544130;
    v56 = v42;
    __int16 v57 = 2114;
    *(void *)double v58 = v33;
    *(_WORD *)&v58[8] = 1024;
    *(_DWORD *)__int16 v59 = v6;
    *(_WORD *)&v59[4] = 2114;
    char v39 = v37;
    *(void *)&v59[6] = v37;
    _os_log_error_impl(&dword_21FCFC000, v18, OS_LOG_TYPE_ERROR, "watchdog pre-%{public}@: %{public}@ slImmSinceSched:%{BOOL}u%{public}@", buf, 0x26u);
    if (v43) {
  }
    }
  double v19 = bls_backlight_log();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

  v21 = bls_diagnostics_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v38 = @"aborting";
    *(_DWORD *)buf = 138544130;
    if (v17) {
      int v38 = @"panicking";
    }
    v56 = v38;
    __int16 v57 = 1024;
    *(_DWORD *)double v58 = v20;
    *(_WORD *)&v58[4] = 1024;
    *(_DWORD *)&v58[6] = v44;
    *(_WORD *)__int16 v59 = 2114;
    *(void *)&v59[2] = v7;
    _os_log_error_impl(&dword_21FCFC000, v21, OS_LOG_TYPE_ERROR, "%{public}@ for watchdog. BLS backlight debug logging enabled:%{BOOL}u isPotentialHang:%{BOOL}u \"%{public}@\"", buf, 0x22u);
  }

  [(BSInvalidatable *)self->_lock_forceOverdueAbortTimer invalidate];
  lock_forceOverdueAbortTimer = self->_lock_forceOverdueAbortTimer;
  self->_lock_forceOverdueAbortTimer = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __46__BLSHWatchdogProvider__abortForWatchdogFire___block_invoke;
  v49[3] = &unk_264533798;
  id v24 = WeakRetained;
  id v50 = v24;
  id v25 = v5;
  id v51 = v25;
  uint64_t v53 = v45;
  int v54 = v9;
  id v26 = v7;
  id v52 = v26;
  uint64_t v27 = MEMORY[0x223C5E2B0](v49);
  __int16 v28 = (void *)v27;
  if (v17)
  {
    +[BLSHWatchdogProvider setIgnoreWatchdogAborts:1];
    uint64_t v29 = NSString;
    v30 = [v25 abortReasonString];
    v31 = [v29 stringWithFormat:@"panicking for BLS %@ watchdog. BLS backlight debug logging enabled:%u \"%@\" abortContext:%@", v30, v20, v26, v25];

    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __46__BLSHWatchdogProvider__abortForWatchdogFire___block_invoke_2;
    v47[3] = &unk_264533348;
    id v48 = v28;
    [v24 panicForWatchdog:v31 withDelay:v47 completion:v10];
  }
  else
  {
    (*(void (**)(uint64_t, void))(v27 + 16))(v27, 0);
  }
}

uint64_t __46__BLSHWatchdogProvider__abortForWatchdogFire___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "abortForWatchdog:payload:payloadSize:explanation:", objc_msgSend(*(id *)(a1 + 40), "abortReason"), *(void *)(a1 + 56), *(unsigned int *)(a1 + 64), *(void *)(a1 + 48));
  }

  return +[BLSHWatchdogProvider setIgnoreWatchdogAborts:0];
}

uint64_t __46__BLSHWatchdogProvider__abortForWatchdogFire___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_checkForReadyToAbortAfterWaitingPastFire
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_waitingAbortParams;
  BOOL lock_waitingForWatchdogCompletion = self->_lock_waitingForWatchdogCompletion;
  BOOL lock_waitingForTailspin = self->_lock_waitingForTailspin;
  if (self->_lock_waitingForWatchdogCompletion || !self->_lock_waitingForTailspin)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = !self->_lock_startedTailspin;
    BOOL lock_waitingForTailspin = 1;
  }
  os_unfair_lock_unlock(p_lock);
  uint64_t v8 = bls_diagnostics_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = [(BLSHWatchdogAbortParameters *)v4 explanation];
    v10[0] = 67109890;
    v10[1] = v7;
    __int16 v11 = 1024;
    BOOL v12 = lock_waitingForTailspin;
    __int16 v13 = 1024;
    BOOL v14 = lock_waitingForWatchdogCompletion;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    _os_log_impl(&dword_21FCFC000, v8, OS_LOG_TYPE_INFO, "_checkForReadyToAbortAfterWaitingPastFire: shouldStartTailspin:%{BOOL}u waitingForTailspin:%{BOOL}u waitingForWatchdogCompletion:%{BOOL}u watchdog:\"%{public}@\"", (uint8_t *)v10, 0x1Eu);
  }
  if (v7)
  {
    [(BLSHWatchdogProvider *)self _startWritingTailspin];
  }
  else if (!lock_waitingForTailspin && !lock_waitingForWatchdogCompletion)
  {
    [(BLSHWatchdogProvider *)self _abortForWatchdogFire:v4];
  }
}

- (void)_giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BLSHWatchdogProvider *)self isWaitingwaitingPastFireForCompletionAndTailspin];
  int v6 = bls_diagnostics_log();
  BOOL v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BLSHWatchdogProvider _giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:]((uint64_t)v4, v7);
    }

    [(BLSHWatchdogProvider *)self _clearIsWaitingForWatchdogCompletion];
    [(BLSHWatchdogProvider *)self _checkForReadyToAbortAfterWaitingPastFire];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BLSHWatchdogProvider _giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:]();
    }
  }
}

- (void)clearWatchdogWithExplanation:(id)a3 reason:(unint64_t)a4 timeout:(double)a5 elapsedTime:(double)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a3;
  BOOL v11 = [(BLSHWatchdogProvider *)self isWatchdogEnabled];
  int v12 = BSIsBeingDebugged();
  BOOL v13 = [(BLSHWatchdogProvider *)self isWaitingwaitingPastFireForCompletionAndTailspin];
  if (!v13) {
    goto LABEL_6;
  }
  if (a4 == 2)
  {
    [(BLSHWatchdogProvider *)self _clearIsWaitingForWatchdogCompletion];
    BOOL v14 = bls_diagnostics_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[BLSHWatchdogProvider clearWatchdogWithExplanation:reason:timeout:elapsedTime:]((uint64_t)v10, v14, v15, v16, v17, v18, v19, v20);
    }

    [(BLSHWatchdogProvider *)self _checkForReadyToAbortAfterWaitingPastFire];
LABEL_6:
    if (a6 <= a5)
    {
      os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
    }
    else
    {
      kdebug_trace();
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    }
    BOOL v22 = bls_diagnostics_log();
    if (os_log_type_enabled(v22, v21))
    {
      double v23 = @"completed";
      if (a4 == 1) {
        double v23 = @"replaced";
      }
      id v24 = v23;
      int v30 = 134219522;
      double v31 = a5;
      __int16 v32 = 2114;
      id v33 = v10;
      __int16 v34 = 2048;
      double v35 = a6;
      __int16 v36 = 1024;
      BOOL v37 = v13;
      __int16 v38 = 2114;
      char v39 = v24;
      __int16 v40 = 1024;
      BOOL v41 = v11;
      __int16 v42 = 1024;
      int v43 = v12;
      id v25 = "%.2lfs watchdog invalidated:\"%{public}@\" elapsedTime:%.2lfs waitingPastFire:%{BOOL}u, clearReason:%{public"
            "}@ watchdogEnabled:%{BOOL}u isBeingDebugged:%{BOOL}u";
      id v26 = v22;
      os_log_type_t v27 = v21;
      uint32_t v28 = 60;
LABEL_17:
      _os_log_impl(&dword_21FCFC000, v26, v27, v25, (uint8_t *)&v30, v28);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  BOOL v22 = bls_diagnostics_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = @"completed";
    if (a4 == 1) {
      uint64_t v29 = @"replaced";
    }
    id v24 = v29;
    int v30 = 138543362;
    double v31 = *(double *)&v24;
    id v25 = "Ignoring %{public}@ because isWaitingwaitingPastFireForCompletionAndTailspin:YES";
    id v26 = v22;
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    uint32_t v28 = 12;
    goto LABEL_17;
  }
LABEL_18:
}

- (void)didDetectSignificantUserInteraction
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__BLSHWatchdogProvider_didDetectSignificantUserInteraction__block_invoke;
  block[3] = &unk_264532258;
  block[4] = self;
  if (didDetectSignificantUserInteraction_onceToken != -1) {
    dispatch_once(&didDetectSignificantUserInteraction_onceToken, block);
  }
}

uint64_t __59__BLSHWatchdogProvider_didDetectSignificantUserInteraction__block_invoke()
{
  v0 = objc_opt_class();

  return [v0 checkForWatchdogDidFire:0];
}

- (BOOL)isWaitingwaitingPastFireForCompletionAndTailspin
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_lock_waitingForWatchdogCompletion || self->_lock_waitingForTailspin;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_clearIsWaitingForWatchdogCompletion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL lock_waitingForWatchdogCompletion = 0;

  os_unfair_lock_unlock(p_lock);
}

- (id)waitingPastFireForCompletionAndTailspinAbortParams
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_lock_waitingAbortParams;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setWaitingwaitingPastFireForCompletionAndTailspin:(id)a3 waitForWatchdogCompletion:(BOOL)a4
{
  int v6 = (BLSHWatchdogAbortParameters *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_waitingAbortParams = self->_lock_waitingAbortParams;
  self->_lock_waitingAbortParams = v6;
  uint64_t v8 = v6;

  self->_BOOL lock_waitingForWatchdogCompletion = a4;
  self->_BOOL lock_waitingForTailspin = 1;
  int v9 = [(BLSHWatchdogAbortParameters *)v8 explanation];
  [(BSInvalidatable *)self->_lock_forceOverdueAbortTimer invalidate];
  id v10 = self;
  BOOL v11 = [(BLSHWatchdogAbortParameters *)v8 delegate];
  int v12 = [v11 osInterfaceProvider];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __100__BLSHWatchdogProvider_setWaitingwaitingPastFireForCompletionAndTailspin_waitForWatchdogCompletion___block_invoke;
  uint64_t v19 = &unk_264533618;
  uint64_t v20 = v10;
  id v21 = v9;
  id v13 = v9;
  BOOL v14 = [v12 scheduledTimerWithIdentifier:@"watchdogprovider.waitingpastfire" interval:&v16 leewayInterval:120.0 handler:5.0];
  lock_forceOverdueAbortTimer = self->_lock_forceOverdueAbortTimer;
  self->_lock_forceOverdueAbortTimer = v14;

  os_unfair_lock_unlock(&self->_lock);
  [(BLSHWatchdogProvider *)v10 _checkForReadyToAbortAfterWaitingPastFire];
}

uint64_t __100__BLSHWatchdogProvider_setWaitingwaitingPastFireForCompletionAndTailspin_waitForWatchdogCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:*(void *)(a1 + 40)];
}

- (void)_startWritingTailspin
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_startedTailspin = 1;
  lock_waitingAbortParams = self->_lock_waitingAbortParams;
  BOOL v5 = self;
  int v6 = [(BLSHWatchdogAbortParameters *)lock_waitingAbortParams explanation];
  os_unfair_lock_unlock(p_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_providerDelegate);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__BLSHWatchdogProvider__startWritingTailspin__block_invoke;
  v8[3] = &unk_2645337C0;
  v8[4] = v5;
  [WeakRetained writeTailspinForWatchdog:v6 completion:v8];
}

void __45__BLSHWatchdogProvider__startWritingTailspin__block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  int v6 = bls_diagnostics_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a3;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_DEFAULT, "tailspin completed: succeeded:%{BOOL}u \"%{public}@\"", (uint8_t *)v10, 0x12u);
  }

  BOOL v7 = *(os_unfair_lock_s **)(a1 + 32);
  if (v7)
  {
    uint64_t v8 = v7 + 10;
    int v9 = v7;
    os_unfair_lock_lock(v8);
    LOBYTE(v9[6]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v8);
    [(os_unfair_lock_s *)v9 _checkForReadyToAbortAfterWaitingPastFire];
  }
}

- (BOOL)isTesting
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__BLSHWatchdogProvider_isTesting__block_invoke;
  block[3] = &unk_264532258;
  block[4] = self;
  if (isTesting_onceToken != -1) {
    dispatch_once(&isTesting_onceToken, block);
  }
  return isTesting___isTesting;
}

void __33__BLSHWatchdogProvider_isTesting__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  if (objc_opt_respondsToSelector()) {
    char v1 = [WeakRetained isTesting];
  }
  else {
    char v1 = 0;
  }
  isTesting___isTesting = v1;
}

+ (void)markWatchdogDidFire:(id)a3 abortReason:(id)a4
{
  v23[5] = *MEMORY[0x263EF8340];
  v22[0] = @"BLSHWatchdogDidFireDate";
  id v5 = (void *)MEMORY[0x263EFF910];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 date];
  v23[0] = v8;
  v22[1] = @"BLSHWatchdogDidFireBuildVersion";
  int v9 = (void *)MGCopyAnswer();
  v23[1] = v9;
  v22[2] = @"BLSHWatchdogDidFireDeviceType";
  id v10 = (void *)MGCopyAnswer();
  v23[2] = v10;
  v23[3] = v7;
  v22[3] = @"BLSHWatchdogDidFireExplanation";
  v22[4] = @"BLSHWatchdogDidFireAbortReason";
  v23[4] = v6;
  __int16 v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];

  id v12 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v13 = (void *)[v12 initWithSuiteName:@"com.apple.BacklightServices"];
  [v13 setObject:v11 forKey:@"BLSHWatchdogDidFire"];

  if (!CFPreferencesAppSynchronize(@"com.apple.BacklightServices"))
  {
    BOOL v14 = bls_diagnostics_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[BLSHWatchdogProvider markWatchdogDidFire:abortReason:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

+ (BOOL)checkForWatchdogDidFire:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
  uint64_t v6 = [v5 dictionaryForKey:@"BLSHWatchdogDidFire"];
  id v7 = (void *)v6;
  if (v6) {
    BOOL v8 = !v3;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [v5 removeObjectForKey:@"BLSHWatchdogDidFire"];
    goto LABEL_7;
  }
  if (v6)
  {
LABEL_7:
    int v9 = [[BLSHWatchdogDidFireDetails alloc] initWithWatchdogDidFireDictionary:v7];
    id v10 = bls_diagnostics_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[BLSHWatchdogProvider checkForWatchdogDidFire:v10];
    }

    if (!os_variant_has_internal_diagnostics()) {
      goto LABEL_20;
    }
    if (+[BLSHInternalTapToRadarIgnorer shouldIgnoreDesignation:1])
    {
      +[BLSHWatchdogProvider resetWatchdogDidFire];
      __int16 v11 = bls_diagnostics_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[BLSHWatchdogProvider checkForWatchdogDidFire:]();
      }
    }
    else
    {
      id v12 = [(BLSHWatchdogDidFireDetails *)v9 date];
      [v12 timeIntervalSinceNow];
      double v14 = v13;

      if (v14 >= -86400.0)
      {
        uint64_t v15 = bls_diagnostics_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          +[BLSHWatchdogProvider checkForWatchdogDidFire:]();
        }

        [a1 showWatchdogDidFireAlert:v9];
        goto LABEL_20;
      }
      +[BLSHWatchdogProvider resetWatchdogDidFire];
      __int16 v11 = bls_diagnostics_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[BLSHWatchdogProvider checkForWatchdogDidFire:](v9, v11);
      }
    }

LABEL_20:
  }

  return v7 != 0;
}

+ (void)resetWatchdogDidFire
{
  id v2 = (id)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
  [v2 removeObjectForKey:@"BLSHWatchdogDidFire"];
}

+ (void)showWatchdogDidFireAlert:(id)a3
{
  BOOL v3 = NSString;
  id v4 = a3;
  id v5 = [v4 device];
  uint64_t v6 = [v4 buildVersion];
  id v7 = [v4 abortReasonString];
  if ([v4 debugLogsEnabled]) {
    BOOL v8 = @"with";
  }
  else {
    BOOL v8 = @"without";
  }
  int v9 = [v4 date];
  id v10 = objc_msgSend(v9, "bls_loggingString");
  uint64_t v11 = [v3 stringWithFormat:@"%@/%@: BacklightServices %@ watchdog fired %@ debug logs at %@", v5, v6, v7, v8, v10];
  __int16 v32 = (void *)v11;

  id v12 = NSString;
  double v13 = [v4 abortReasonString];
  if ([v4 debugLogsEnabled]) {
    double v14 = @"with";
  }
  else {
    double v14 = @"without";
  }
  uint64_t v15 = [v4 date];
  uint64_t v16 = objc_msgSend(v15, "bls_loggingString");
  uint64_t v17 = [v4 buildVersion];
  uint64_t v18 = [v4 explanation];
  uint64_t v19 = [v12 stringWithFormat:@"BacklightServices %@ watchdog fired %@ debug logs at %@ on %@\n\nExplanation: %@", v13, v14, v16, v17, v18];

  uint64_t v20 = [[BLSHTapToRadarDescriptor alloc] initWithDesignation:1 radarTitle:v11 radarDescription:v19];
  uint64_t v21 = [v4 date];
  [(BLSHTapToRadarDescriptor *)v20 setTimeOfIssue:v21];

  BOOL v22 = NSString;
  double v23 = [MEMORY[0x263F08AB0] processInfo];
  id v24 = [v23 processName];
  if ([v4 debugLogsEnabled]) {
    id v25 = @"with";
  }
  else {
    id v25 = @"without";
  }
  id v26 = [v4 date];
  os_log_type_t v27 = objc_msgSend(v26, "bls_loggingString");
  uint32_t v28 = [v4 buildVersion];

  uint64_t v29 = [v22 stringWithFormat:@"%@ abort: BacklightServices watchdog fired %@ debug logs at %@ on %@.\nPlease file a radar against BacklightServices | All with a sysdiagnose.\n\nTo disable this prompt from CLI:\n\nlogin -f mobile defaults write com.apple.BacklightServices IgnoredTapToRadarDesignations -array -int 0", v24, v25, v27, v28];
  [(BLSHTapToRadarDescriptor *)v20 setTtrPromptMessage:v29];

  [(BLSHTapToRadarDescriptor *)v20 setTtrDisplayReason:@"BacklightServices watchdog fired"];
  int v30 = +[BLSHInternalTapToRadarManager sharedTapToRadarManager];
  double v31 = bls_diagnostics_log();
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __49__BLSHWatchdogProvider_showWatchdogDidFireAlert___block_invoke;
  v34[3] = &__block_descriptor_40_e8_v12__0B8l;
  v34[4] = a1;
  [v30 requestTapToRadar:v20 log:v31 completion:v34];
}

void __49__BLSHWatchdogProvider_showWatchdogDidFireAlert___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    BOOL v3 = bls_diagnostics_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __49__BLSHWatchdogProvider_showWatchdogDidFireAlert___block_invoke_cold_1();
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_blsWatchdogLockStatusDidChange, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    [v5 resetWatchdogDidFire];
  }
}

- (BOOL)isWatchdogEnabled
{
  return self->_watchdogEnabled;
}

- (void)setWatchdogEnabled:(BOOL)a3
{
  self->_watchdogEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_lock_forceOverdueAbortTimer, 0);
  objc_storeStrong((id *)&self->_lock_waitingAbortParams, 0);

  objc_storeStrong((id *)&self->_lock_fireRetryTimer, 0);
}

- (void)scheduleWatchdogWithDelegate:(uint64_t)a1 explanation:(NSObject *)a2 timeout:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  double v4 = a3;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "scheduling %.1fs watchdog \"%{public}@\"", (uint8_t *)&v3, 0x16u);
}

void __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_128_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_FAULT, "watchdog invalidated after firing while waiting for state dump. Carousel's main thread probably hung for a significant amount of time:\"%{public}@\"", (uint8_t *)&v3, 0xCu);
}

void __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_128_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __118__BLSHWatchdogProvider__fireWatchdogWithTimer_delegate_timeout_elapsedTime_abortContext_explanation_remainingRetries___block_invoke_128_cold_3(char a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = &stru_26D1758B0;
  uint64_t v4 = *a2;
  if (a1) {
    int v3 = @" and overdue operation finish";
  }
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "will wait for watchdog abort until tailspin%{public}@: \"%{public}@\"", (uint8_t *)&v5, 0x16u);
}

- (void)_giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218242;
  uint64_t v3 = 0x405E000000000000;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "after %1.0fs, giving up waiting for watchdog completion: \"%{public}@\"", (uint8_t *)&v2, 0x16u);
}

- (void)_giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  _os_log_fault_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_FAULT, "_giveUpWaitingForWatchdogCompletionAbortWhileWaitingPastFire: isWaitingwaitingPastFireForCompletionAndTailspin:NO, so ignoring", v1, 2u);
}

- (void)clearWatchdogWithExplanation:(uint64_t)a3 reason:(uint64_t)a4 timeout:(uint64_t)a5 elapsedTime:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)markWatchdogDidFire:(uint64_t)a3 abortReason:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)checkForWatchdogDidFire:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_21FCFC000, v0, v1, "not prompting to file radars for BLS watchdogs on this device due to user preferences so clearing BLSHWatchdogDidFire", v2, v3, v4, v5, v6);
}

+ (void)checkForWatchdogDidFire:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 date];
  uint64_t v4 = objc_msgSend(v3, "bls_loggingString");
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "not prompting to file radar for BLS watchdog from %{public}@ because it's too old", (uint8_t *)&v5, 0xCu);
}

+ (void)checkForWatchdogDidFire:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_21FCFC000, v0, v1, "prompting to file a radar for the BLS watchdog", v2, v3, v4, v5, v6);
}

+ (void)checkForWatchdogDidFire:(NSObject *)a3 .cold.4(void *a1, char a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint8_t v6 = [a1 date];
  uint64_t v7 = objc_msgSend(v6, "bls_loggingString");
  uint64_t v8 = [a1 buildVersion];
  int v9 = 138543874;
  id v10 = v7;
  __int16 v11 = 2114;
  id v12 = v8;
  __int16 v13 = 1024;
  int v14 = a2 & 1;
  _os_log_error_impl(&dword_21FCFC000, a3, OS_LOG_TYPE_ERROR, "watchdog did fire at %{public}@ on build %{public}@, reset:%{BOOL}u", (uint8_t *)&v9, 0x1Cu);
}

void __49__BLSHWatchdogProvider_showWatchdogDidFireAlert___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_21FCFC000, v0, v1, "-[BLSHInternalTapToRadarManager requestTapToRadar:::] said to try again later. will wait for next lock status change to check again for BLS watchdog", v2, v3, v4, v5, v6);
}

@end