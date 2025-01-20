@interface BLSHBacklightOSInterfaceProvider
+ (BLSHBacklightOSInterfaceProvider)sharedProvider;
+ (uint64_t)sysctlKernSpecialMode;
+ (void)setSharedProvider:(id)a3;
+ (void)sysctlKernSpecialMode;
- (BLSDisplayStateDelegate)displayStateDelegate;
- (BLSHBacklightOSInterfaceProvider)initWithPlatformProvider:(id)a3;
- (BLSHSuppressionEvent)lastSuppressionEvent;
- (BOOL)deviceSupportsAlwaysOn;
- (BOOL)deviceSupportsAlwaysOnFlipbook;
- (BOOL)isFlipbookTransparent;
- (BOOL)isKernelAlwaysOnMode;
- (BOOL)isShowingBlankingWindow;
- (BOOL)isSuppressionServiceActive;
- (BOOL)isTailspinAvailable;
- (BOOL)supportsFlipbookState;
- (OS_dispatch_queue)delegateQueue;
- (double)timeoutForWatchdogType:(void *)a1;
- (id)abortContextForTimer:(id)a3;
- (id)acquireDisplayPowerAssertionForReason:(int64_t)a3;
- (id)addSceneObserver:(id)a3 forSceneIdentityToken:(id)a4;
- (id)createDisplayPowerResourceHintWithState:(unint64_t)a3;
- (id)createFlipbook;
- (id)createPowerAssertionWithIdentifier:(id)a3;
- (id)createSystemActivityAssertionWithIdentifier:(id)a3 configurator:(id)a4;
- (id)identifier;
- (id)observeSignificantTimeChangeWithIdentifier:(id)a3 handler:(id)a4;
- (id)removeSceneObserver:(id)a3 forSceneIdentityToken:(id)a4;
- (id)sceneWithIdentityToken:(id)a3;
- (id)scheduleWatchdogWithDelegate:(id)a3 explanation:(id)a4 timeout:(double)a5;
- (id)systemSleepMonitor;
- (int64_t)caDisplayPowerState;
- (int64_t)caDisplayState;
- (int64_t)cbDisplayMode;
- (int64_t)cbFlipbookState;
- (unint64_t)flipbookDiagnosticHistoryFrameLimit;
- (unint64_t)flipbookDiagnosticHistoryMemoryLimit;
- (void)_didCompleteTransitionToDisplayMode:(void *)a3 withError:;
- (void)abortForWatchdog:(unint64_t)a3 payload:(void *)a4 payloadSize:(unsigned int)a5 explanation:(id)a6;
- (void)clearCAWatchdog;
- (void)deregisterSceneWorkspace:(id)a3;
- (void)didCompleteSwitchToFlipbookState:(int64_t)a3 withError:(id)a4;
- (void)didCompleteTransitionToDisplayMode:(int64_t)a3 withError:(id)a4;
- (void)didDetectSignificantUserInteraction;
- (void)dispatchToMainQueueAfterSecondsDelay:(double)a3 identifier:(id)a4 block:(id)a5;
- (void)endSuppressionService;
- (void)notifyDisplayBlankedIfChangedForCADisplayState:(uint64_t)a1;
- (void)panicForWatchdog:(id)a3 withDelay:(double)a4 completion:(id)a5;
- (void)registerHandlersForService:(id)a3;
- (void)registerSceneWorkspace:(id)a3;
- (void)scheduleOSIPWatchdogWithExplanation:(unint64_t)a3 type:;
- (void)setCATransitionsDelayForTesting:(double)a3;
- (void)setCBTransitionsDelayForTesting:(double)a3;
- (void)setDisplayStateDelegate:(id)a3;
- (void)setFlipbookTransparent:(BOOL)a3;
- (void)setKernelAlwaysOnMode:(BOOL)a3;
- (void)setLastSuppressionEvent:(uint64_t)a1;
- (void)setShowingBlankingWindow:(BOOL)a3 fadeDuration:(double)a4;
- (void)setSuppressionServiceActive:(uint64_t)a1;
- (void)startSuppressionServiceWithHandler:(id)a3;
- (void)switchToFlipbookState:(int64_t)a3;
- (void)transitionToCADisplayState:(int64_t)a3;
- (void)transitionToDisplayMode:(int64_t)a3 withDuration:(double)a4;
- (void)writeTailspinForWatchdog:(id)a3 completion:(id)a4;
@end

@implementation BLSHBacklightOSInterfaceProvider

+ (BLSHBacklightOSInterfaceProvider)sharedProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock);
  id v2 = (id)_sharedProvider;
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock);

  return (BLSHBacklightOSInterfaceProvider *)v2;
}

+ (void)setSharedProvider:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock);
  v4 = (void *)_sharedProvider;
  _sharedProvider = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock);
}

- (BLSHBacklightOSInterfaceProvider)initWithPlatformProvider:(id)a3
{
  v73[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v63.receiver = self;
  v63.super_class = (Class)BLSHBacklightOSInterfaceProvider;
  v6 = [(BLSHBacklightOSInterfaceProvider *)&v63 init];
  uint64_t v7 = (uint64_t)v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    v9 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    v11 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v10;

    objc_storeStrong((id *)(v7 + 8), a3);
    v12 = [[BLSHWatchdogProvider alloc] initWithDelegate:v7];
    v13 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v12;

    v14 = objc_alloc_init(BLSHCriticalAssertProvider);
    v15 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v14;

    char v16 = objc_opt_respondsToSelector();
    LODWORD(v17) = 1.0;
    if (v16) {
      objc_msgSend(v5, "backlightDimmedFactor", v17);
    }
    *(_DWORD *)(v7 + 136) = LODWORD(v17);
    if (MGGetBoolAnswer())
    {
      LOBYTE(v18) = MGGetBoolAnswer();
      LOBYTE(v19) = 1;
    }
    else
    {
      LOBYTE(v18) = MGGetBoolAnswer();
      LOBYTE(v19) = v18;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v20 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
      v21 = [v20 valueForKey:@"deviceSupportsAlwaysOnOverride"];
      if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        int v19 = [v21 BOOLValue];
        v22 = bls_backlight_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v65 = v7;
          __int16 v66 = 1024;
          LODWORD(v67) = v19;
          _os_log_impl(&dword_21FCFC000, v22, OS_LOG_TYPE_DEFAULT, "OSIP:%p deviceSupportsAlwaysOnOverride set to %{BOOL}u - use 'login -f mobile defaults delete com.apple.BacklightServices deviceSupportsAlwaysOnOverride' to remove", buf, 0x12u);
        }
      }
      v23 = [v20 valueForKey:@"deviceSupportsAlwaysOnFlipbookOverride"];

      if (v23 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        int v18 = [v23 BOOLValue];
        v24 = bls_backlight_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v65 = v7;
          __int16 v66 = 1024;
          LODWORD(v67) = v18;
          _os_log_impl(&dword_21FCFC000, v24, OS_LOG_TYPE_DEFAULT, "OSIP:%p deviceSupportsAlwaysOnFlipbookOverride set to %{BOOL}u - use 'login -f mobile defaults delete com.apple.BacklightServices deviceSupportsAlwaysOnFlipbookOverride' to remove", buf, 0x12u);
        }
      }
      v72[0] = @"flipbookDiagnosticsFrameLimit";
      v72[1] = @"flipbookDiagnosticsMemoryLimit";
      v73[0] = &unk_26D1915D0;
      v73[1] = &unk_26D1915E8;
      v25 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
      [v20 registerDefaults:v25];

      *(void *)(v7 + 192) = [v20 integerForKey:@"flipbookDiagnosticsFrameLimit"];
      *(void *)(v7 + 200) = [v20 integerForKey:@"flipbookDiagnosticsMemoryLimit"] << 20;
    }
    *(unsigned char *)(v7 + 130) = v19;
    *(unsigned char *)(v7 + 131) = v18;
    v26 = [MEMORY[0x263F15778] mainDisplay];
    uint64_t v27 = [v26 stateControl];
    v28 = *(void **)(v7 + 64);
    *(void *)(v7 + 64) = v27;

    *(void *)(v7 + 96) = [*(id *)(v7 + 64) displayState];
    if (!*(void *)(v7 + 64))
    {
      v61 = [NSString stringWithFormat:@"CADisplayStateControl nil - this process needs entitlement: 'com.apple.QuartzCore.display-state'"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHBacklightOSInterfaceProvider initWithPlatformProvider:]();
      }
      [v61 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD03888);
    }
    id v29 = objc_alloc_init(MEMORY[0x263F34250]);
    [v29 activate];
    char v30 = [v29 supported];
    char v31 = v30;
    if (v30)
    {
      v32 = (unsigned char *)(v7 + 133);
      *(unsigned char *)(v7 + 133) = v30;
      *(void *)(v7 + 120) = 3;
      objc_storeStrong((id *)(v7 + 56), v29);
      *(void *)(v7 + 112) = [*(id *)(v7 + 56) displayMode];
      [*(id *)(v7 + 56) setCompletionDelegate:v7];
    }
    else
    {
      [v29 cancel];
      v32 = (unsigned char *)(v7 + 133);
      *(unsigned char *)(v7 + 133) = v31;
      uint64_t v33 = [objc_alloc(MEMORY[0x263F29C20]) initWithIdentifier:@"backlightServices.setCBDisplayMode"];
      v34 = *(void **)(v7 + 80);
      *(void *)(v7 + 80) = v33;

      *(void *)(v7 + 120) = 3;
      BKSHIDServicesGetBacklightFactor();
      float v36 = fabsf(v35);
      uint64_t v37 = 4;
      if (fabsf(v35 + -1.0) <= 0.001) {
        uint64_t v37 = 3;
      }
      if (v36 <= 0.001) {
        uint64_t v37 = 0;
      }
      *(void *)(v7 + 112) = v37;
    }
    *(void *)(v7 + 104) = *(void *)(v7 + 96) != 1;
    -[BLSHBacklightOSInterfaceProvider notifyDisplayBlankedIfChangedForCADisplayState:](v7, *(void *)(v7 + 96));
    *(unsigned char *)(v7 + 132) = +[BLSHBacklightOSInterfaceProvider sysctlKernSpecialMode]();
    v38 = bls_backlight_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v39 = *(void *)(v7 + 112);
      if (v39 > 4) {
        v40 = @"Invalid";
      }
      else {
        v40 = off_2645325D8[v39];
      }
      int v41 = *(unsigned __int8 *)(v7 + 130);
      int v42 = *(unsigned __int8 *)(v7 + 131);
      int v43 = *v32;
      *(_DWORD *)buf = 134219010;
      uint64_t v65 = v7;
      __int16 v66 = 2114;
      v67 = v40;
      __int16 v68 = 1024;
      *(_DWORD *)v69 = v41;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = v42;
      __int16 v70 = 1024;
      int v71 = v43;
      _os_log_impl(&dword_21FCFC000, v38, OS_LOG_TYPE_DEFAULT, "OSIP:%p startup cbDisplayMode:%{public}@ dsao:%{BOOL}u dsaof:%{BOOL}u dscs:%{BOOL}u", buf, 0x28u);
    }

    v44 = [[BLSHSuppressionEvent alloc] initWithType:2 reason:0 timestamp:mach_continuous_time()];
    v45 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = v44;

    if ([MEMORY[0x263F017B0] isAvailable])
    {
      v46 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
      char v47 = [v46 BOOLForKey:@"disableSuppression"];

      if ((v47 & 1) == 0)
      {
        uint64_t v48 = [objc_alloc(MEMORY[0x263F017B0]) initWithClientType:1];
        v49 = *(void **)(v7 + 72);
        *(void *)(v7 + 72) = v48;
      }
    }
    if (*v32)
    {
      unint64_t v50 = *(void *)(v7 + 112);
      if (v50 > 4) {
        v51 = @"Invalid";
      }
      else {
        v51 = off_2645325D8[v50];
      }
      v52 = [NSString stringWithFormat:@"OSIP:%p initWithPlatformProvider: transitionToDisplayMode:%@ withDuration:0", v7, v51];
      -[BLSHBacklightOSInterfaceProvider scheduleOSIPWatchdogWithExplanation:type:]((os_unfair_lock_s *)v7, v52, 0);
      v53 = *(void **)(v7 + 56);
      uint64_t v54 = *(void *)(v7 + 112);
      id v62 = 0;
      [v53 transitionToDisplayMode:v54 withDuration:&v62 error:0.0];
      id v55 = v62;
      if (v55)
      {
        v56 = bls_backlight_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
        {
          unint64_t v58 = *(void *)(v7 + 112);
          if (v58 > 4) {
            v59 = @"Invalid";
          }
          else {
            v59 = off_2645325D8[v58];
          }
          v60 = objc_msgSend(v55, "bls_loggingString");
          *(_DWORD *)buf = 134218498;
          uint64_t v65 = v7;
          __int16 v66 = 2114;
          v67 = v59;
          __int16 v68 = 2114;
          *(void *)v69 = v60;
          _os_log_fault_impl(&dword_21FCFC000, v56, OS_LOG_TYPE_FAULT, "OSIP:%p could not transitionToDisplayMode:%{public}@ during init error:%{public}@", buf, 0x20u);
        }
      }
    }
    if (*v32) {
      BKSHIDServicesNotifyBacklightFactorWithFadeDurationAsync();
    }
    else {
      BKSHIDServicesSetBacklightFactorWithFadeDurationAsync();
    }
  }
  return (BLSHBacklightOSInterfaceProvider *)v7;
}

- (void)notifyDisplayBlankedIfChangedForCADisplayState:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    char v4 = (a2 != 1) ^ (*(void *)(a1 + 104) == 1);
    *(void *)(a1 + 104) = a2;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    if ((v4 & 1) == 0)
    {
      kdebug_trace();
      MEMORY[0x270F10460](0, a2 != 1);
    }
  }
}

+ (uint64_t)sysctlKernSpecialMode
{
  uint64_t v0 = self;
  int v7 = 0;
  size_t v6 = 4;
  int v1 = sysctlbyname("kern.aotmode", &v7, &v6, 0, 0);
  size_t v2 = v6;
  id v3 = bls_backlight_log();
  char v4 = v3;
  if (v1 || v2 != 4)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[BLSHBacklightOSInterfaceProvider sysctlKernSpecialMode];
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    +[BLSHBacklightOSInterfaceProvider sysctlKernSpecialMode]();
  }

  return v7 & 1;
}

- (void)scheduleOSIPWatchdogWithExplanation:(unint64_t)a3 type:
{
  if (a1)
  {
    id v5 = a1 + 22;
    id v6 = a2;
    os_unfair_lock_lock(v5);
    -[os_unfair_lock_s scheduleWatchdogWithDelegate:explanation:timeout:](a1, "scheduleWatchdogWithDelegate:explanation:timeout:", a1, v6, -[BLSHBacklightOSInterfaceProvider timeoutForWatchdogType:](a1, a3));
    id obj = (id)objc_claimAutoreleasedReturnValue();

    if (a3 <= 2)
    {
      int v7 = off_2645325A8[a3];
      uint64_t v8 = off_2645325C0[a3];
      [*(id *)((char *)&a1->_os_unfair_lock_opaque + *v7) invalidate:1];
      objc_storeStrong((id *)((char *)a1 + *v7), obj);
      *(void *)((char *)&a1->_os_unfair_lock_opaque + *v8) = a3;
    }
    os_unfair_lock_unlock(a1 + 22);
  }
}

- (void)registerHandlersForService:(id)a3
{
  id v7 = a3;
  uint64_t v4 = +[BLSHTransparentFlipbookAttributeHandler registerHandlerForService:provider:](BLSHTransparentFlipbookAttributeHandler, "registerHandlerForService:provider:");
  if (v4)
  {
    id v5 = (void *)v4;
    [(BLSHWatchdogProvider *)self->_watchdogProvider registerHandlersForService:v7];
  }
  else
  {
    id v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightOSInterfaceProvider registerHandlersForService:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)registerSceneWorkspace:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_lock_sceneWorkspaces addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)deregisterSceneWorkspace:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_lock_sceneWorkspaces removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)sceneWithIdentityToken:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_lock_sceneWorkspaces;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "sceneWithIdentityToken:", v4, (void)v15);
        if (v11)
        {
          v12 = (void *)v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v12 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  if (!v12)
  {
    v13 = [MEMORY[0x263F3F4F0] sharedInstance];
    v12 = [v13 sceneFromIdentityToken:v4];
  }

  return v12;
}

- (BOOL)isKernelAlwaysOnMode
{
  size_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_kernelSpecialMode;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setKernelAlwaysOnMode:(BOOL)a3
{
  int v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_kernelSpecialMode = self->_lock_kernelSpecialMode;
  self->_int lock_kernelSpecialMode = v3;
  os_unfair_lock_unlock(p_lock);
  if (lock_kernelSpecialMode != v3)
  {
    if (v3) {
      int v7 = 5;
    }
    else {
      int v7 = 0;
    }
    int v11 = v7;
    int v8 = sysctlbyname("kern.aotmode", 0, 0, &v11, 4uLL);
    uint64_t v9 = bls_backlight_log();
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        v13 = self;
        __int16 v14 = 1024;
        int v15 = v11;
        __int16 v16 = 1024;
        int v17 = v8;
        _os_log_error_impl(&dword_21FCFC000, v10, OS_LOG_TYPE_ERROR, "OSIP:%p failed to set kernel aotMode:%x status:%d", buf, 0x18u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[BLSHBacklightOSInterfaceProvider setKernelAlwaysOnMode:]();
    }
  }
}

- (void)dispatchToMainQueueAfterSecondsDelay:(double)a3 identifier:(id)a4 block:(id)a5
{
  int64_t v5 = (uint64_t)(a3 * 1000000000.0);
  dispatch_block_t block = a5;
  dispatch_time_t v6 = dispatch_time(0, v5);
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

- (int64_t)cbDisplayMode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_cbDisplayMode = self->_lock_cbDisplayMode;
  os_unfair_lock_unlock(p_lock);
  return lock_cbDisplayMode;
}

- (void)transitionToDisplayMode:(int64_t)a3 withDuration:(double)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_displayStateClientSupported && (self->_lock_cbFlipbookState & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if ((unint64_t)a3 > 4) {
      id v29 = @"Invalid";
    }
    else {
      id v29 = off_2645325D8[a3];
    }
    unint64_t v30 = self->_lock_cbFlipbookState - 1;
    if (v30 > 2) {
      char v31 = @"WillTurnOn";
    }
    else {
      char v31 = off_264532600[v30];
    }
    v32 = [NSString stringWithFormat:@"cannot change cb display mode to %@, flipbook state:%@ is transitioning", v29, v31];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightOSInterfaceProvider transitionToDisplayMode:withDuration:]();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD04688);
  }
  int64_t lock_cbDisplayMode = self->_lock_cbDisplayMode;
  unint64_t v9 = lock_cbDisplayMode - 1;
  unint64_t v10 = a3 - 1;
  if (self->_deviceSupportsAlwaysOn) {
    int v11 = ((unint64_t)(a3 - 1) < 2) ^ ((unint64_t)(lock_cbDisplayMode - 1) < 2);
  }
  else {
    int v11 = 0;
  }
  if (v9 > 3) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = qword_21FD8B258[v9];
  }
  if (v10 > 3) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = qword_21FD8B258[v10];
  }
  self->_int64_t lock_cbDisplayMode = a3;
  os_unfair_lock_unlock(p_lock);
  if (lock_cbDisplayMode != a3)
  {
    if (self->_displayStateClientSupported)
    {
      __int16 v14 = bls_backlight_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)a3 > 4) {
          v25 = @"Invalid";
        }
        else {
          v25 = off_2645325D8[a3];
        }
        *(_DWORD *)buf = 134218498;
        v38 = self;
        __int16 v39 = 2114;
        *(void *)v40 = v25;
        *(_WORD *)&v40[8] = 2048;
        *(double *)&v40[10] = a4;
        _os_log_debug_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_DEBUG, "OSIP:%p transitionToDisplayMode:%{public}@ withDuration:%fs", buf, 0x20u);
      }

      if ((unint64_t)a3 > 4) {
        int v15 = @"Invalid";
      }
      else {
        int v15 = off_2645325D8[a3];
      }
      __int16 v16 = [NSString stringWithFormat:@"OSIP:%p transitionToDisplayMode:%@ withDuration:%fs", self, v15, *(void *)&a4];
      -[BLSHBacklightOSInterfaceProvider scheduleOSIPWatchdogWithExplanation:type:]((os_unfair_lock_s *)self, v16, 0);
      displayStateClient = self->_displayStateClient;
      id v36 = 0;
      [(CBDisplayStateClient *)displayStateClient transitionToDisplayMode:a3 withDuration:&v36 error:a4];
      id v18 = v36;
      if (v18)
      {
        int v19 = bls_backlight_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          if ((unint64_t)a3 > 4) {
            v28 = @"Invalid";
          }
          else {
            v28 = off_2645325D8[a3];
          }
          uint64_t v33 = v28;
          v34 = objc_msgSend(v18, "bls_loggingString");
          *(_DWORD *)buf = 134218498;
          v38 = self;
          __int16 v39 = 2114;
          *(void *)v40 = v33;
          *(_WORD *)&v40[8] = 2114;
          *(void *)&v40[10] = v34;
          _os_log_fault_impl(&dword_21FCFC000, v19, OS_LOG_TYPE_FAULT, "OSIP:%p could not transitionToDisplayMode:%{public}@ error:%{public}@", buf, 0x20u);
        }
      }
    }
    if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v20 = bls_backlight_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        v38 = self;
        __int16 v39 = 1024;
        *(_DWORD *)v40 = v10 < 2;
        *(_WORD *)&v40[4] = 2048;
        *(double *)&v40[6] = a4;
        _os_log_debug_impl(&dword_21FCFC000, v20, OS_LOG_TYPE_DEBUG, "OSIP:%p (platformProvider) useAlwaysOnBrightnessCurve:%{BOOL}u withDuration:%fs", buf, 0x1Cu);
      }

      [(BLSHBacklightPlatformProvider *)self->_platformProvider useAlwaysOnBrightnessCurve:v10 < 2 withRampDuration:a4];
    }
    if (v12 != v13)
    {
      if (v13 == 1)
      {
        float backlightDimmedFactor = 1.0;
      }
      else
      {
        float backlightDimmedFactor = 0.0;
        if (v13 == 2) {
          float backlightDimmedFactor = self->_backlightDimmedFactor;
        }
      }
      if (v11) {
        double v22 = 0.0;
      }
      else {
        double v22 = a4;
      }
      v23 = bls_backlight_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        BOOL displayStateClientSupported = self->_displayStateClientSupported;
        *(_DWORD *)buf = 134218754;
        v38 = self;
        if (displayStateClientSupported) {
          uint64_t v27 = "Notify";
        }
        else {
          uint64_t v27 = "Set";
        }
        __int16 v39 = 2080;
        *(void *)v40 = v27;
        *(_WORD *)&v40[8] = 2048;
        *(double *)&v40[10] = backlightDimmedFactor;
        __int16 v41 = 2048;
        double v42 = v22;
        _os_log_debug_impl(&dword_21FCFC000, v23, OS_LOG_TYPE_DEBUG, "OSIP:%p %sBacklightFactor:%f WithFadeDuration:%fs", buf, 0x2Au);
      }

      if (self->_displayStateClientSupported) {
        BKSHIDServicesNotifyBacklightFactorWithFadeDurationAsync();
      }
      else {
        BKSHIDServicesSetBacklightFactorWithFadeDurationAsync();
      }
    }
    if (!self->_displayStateClientSupported)
    {
      setCBDisplayModeTimer = self->_setCBDisplayModeTimer;
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __73__BLSHBacklightOSInterfaceProvider_transitionToDisplayMode_withDuration___block_invoke;
      v35[3] = &unk_2645323D0;
      v35[4] = self;
      v35[5] = a3;
      [(BSContinuousMachTimer *)setCBDisplayModeTimer scheduleWithFireInterval:MEMORY[0x263EF83A0] leewayInterval:v35 queue:a4 handler:0.016];
    }
  }
}

uint64_t __73__BLSHBacklightOSInterfaceProvider_transitionToDisplayMode_withDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCompleteTransitionToDisplayMode:*(void *)(a1 + 40) withError:0];
}

- (BOOL)supportsFlipbookState
{
  return self->_displayStateClientSupported;
}

- (int64_t)cbFlipbookState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_cbFlipbookState = self->_lock_cbFlipbookState;
  os_unfair_lock_unlock(p_lock);
  return lock_cbFlipbookState;
}

- (void)switchToFlipbookState:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_int64_t lock_cbFlipbookState = a3;
  os_unfair_lock_unlock(p_lock);
  if (self->_displayStateClientSupported)
  {
    unint64_t v6 = a3 - 1;
    if ((unint64_t)(a3 - 1) > 2) {
      int v7 = @"WillTurnOn";
    }
    else {
      int v7 = off_264532600[v6];
    }
    int v8 = [NSString stringWithFormat:@"OSIP:%p switchToFlipbookState:%@", self, v7];
    -[BLSHBacklightOSInterfaceProvider scheduleOSIPWatchdogWithExplanation:type:]((os_unfair_lock_s *)self, v8, 1uLL);
    displayStateClient = self->_displayStateClient;
    id v14 = 0;
    [(CBDisplayStateClient *)displayStateClient switchToFlipbookState:a3 error:&v14];
    id v10 = v14;
    if (v10)
    {
      int v11 = bls_backlight_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        if (v6 > 2) {
          uint64_t v12 = @"WillTurnOn";
        }
        else {
          uint64_t v12 = off_264532600[v6];
        }
        uint64_t v13 = objc_msgSend(v10, "bls_loggingString");
        *(_DWORD *)buf = 134218498;
        __int16 v16 = self;
        __int16 v17 = 2114;
        id v18 = v12;
        __int16 v19 = 2114;
        uint64_t v20 = v13;
        _os_log_fault_impl(&dword_21FCFC000, v11, OS_LOG_TYPE_FAULT, "OSIP:%p could not switchToFlipbookState:%{public}@ error:%{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    int v8 = bls_backlight_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      [(BLSHBacklightOSInterfaceProvider *)(uint64_t)self switchToFlipbookState:v8];
    }
  }
}

- (id)acquireDisplayPowerAssertionForReason:(int64_t)a3
{
  if (a3 == 1) {
    kdebug_trace();
  }
  id v4 = (void *)[(CADisplayStateControl *)self->_displayStateControl createPowerAssertionWithReason:1 identifier:@"BacklightServices"];
  [v4 acquire];

  return v4;
}

- (int64_t)caDisplayState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_caDisplayState = self->_lock_caDisplayState;
  os_unfair_lock_unlock(p_lock);
  return lock_caDisplayState;
}

- (int64_t)caDisplayPowerState
{
  return [(CADisplayStateControl *)self->_displayStateControl powerState];
}

- (void)transitionToCADisplayState:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_int64_t lock_caDisplayState = a3;
  if (a3 == 2)
  {
    BOOL lock_flipbookTransparent = self->_lock_flipbookTransparent;
    os_unfair_lock_unlock(p_lock);
    if (lock_flipbookTransparent)
    {
      int v7 = bls_backlight_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        int v15 = self;
        _os_log_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_INFO, "OSIP:%p flipbook transparent, will transition to CADisplayStateOn not CADisplayStateFlipBook", buf, 0xCu);
      }

      a3 = 1;
    }
    else
    {
      a3 = 2;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  int v8 = NSString;
  unint64_t v9 = NSStringFromCADisplayState();
  id v10 = [v8 stringWithFormat:@"OSIP:%p transitionToCADisplayState:%@", self, v9];

  int v11 = bls_backlight_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[BLSHBacklightOSInterfaceProvider transitionToCADisplayState:]((uint64_t)v10, v11);
  }

  -[BLSHBacklightOSInterfaceProvider scheduleOSIPWatchdogWithExplanation:type:]((os_unfair_lock_s *)self, v10, 2uLL);
  displayStateControl = self->_displayStateControl;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke;
  v13[3] = &unk_264532448;
  v13[4] = self;
  v13[5] = a3;
  [(CADisplayStateControl *)displayStateControl transitionToDisplayState:a3 withCompletion:v13];
}

void __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v6 = bls_backlight_log();
  int v7 = v6;
  if (*(void *)(a1 + 40) == a2) {
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v8 = 16 * (a3 == 0);
  }
  if (os_log_type_enabled(v6, v8))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = NSStringFromCADisplayStateTransitionStatus();
    int v11 = NSStringFromCADisplayState();
    uint64_t v12 = NSStringFromCADisplayState();
    *(_DWORD *)buf = 134218754;
    uint64_t v27 = v9;
    __int16 v28 = 2114;
    id v29 = v10;
    __int16 v30 = 2114;
    double v31 = *(double *)&v11;
    __int16 v32 = 2114;
    uint64_t v33 = v12;
    _os_log_impl(&dword_21FCFC000, v7, v8, "OSIP:%p completion(%{public}@->%{public}@) transitionToDisplayState:%{public}@", buf, 0x2Au);
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_151;
  v25[3] = &unk_2645323F8;
  uint64_t v13 = *(void *)(a1 + 40);
  v25[4] = *(void *)(a1 + 32);
  v25[5] = a3;
  v25[6] = a2;
  v25[7] = v13;
  uint64_t v14 = MEMORY[0x223C5E2B0](v25);
  int v15 = (void *)v14;
  double v16 = *(double *)(*(void *)(a1 + 32) + 184);
  if (v16 <= 0.1)
  {
    (*(void (**)(uint64_t))(v14 + 16))(v14);
  }
  else
  {
    __int16 v17 = bls_diagnostics_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      __int16 v19 = NSStringFromCADisplayState();
      *(_DWORD *)buf = 134218498;
      uint64_t v27 = v18;
      __int16 v28 = 2114;
      id v29 = v19;
      __int16 v30 = 2048;
      double v31 = v16;
      _os_log_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_DEFAULT, "OSIP:%p delayCompletionsForTesting:YES, delaying CATransitionToDisplayState:%{public}@ completion by %.2fs", buf, 0x20u);
    }
    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_153;
    block[3] = &unk_264532420;
    uint64_t v21 = *(void *)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    uint64_t v24 = v21;
    id v23 = v15;
    dispatch_after(v20, MEMORY[0x263EF83A0], block);
  }
}

void __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_151(uint64_t *a1)
{
  -[BLSHBacklightOSInterfaceProvider clearCAWatchdog](a1[4]);
  if (!a1[5]) {
    -[BLSHBacklightOSInterfaceProvider notifyDisplayBlankedIfChangedForCADisplayState:](a1[4], a1[6]);
  }
  id v2 = [(id)a1[4] displayStateDelegate];
  [v2 osInterfaceProvider:a1[4] didCompleteTransitionToCADisplayState:a1[7] currentState:a1[6] transitionStatus:a1[5]];
}

- (void)clearCAWatchdog
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    [*(id *)(a1 + 152) invalidate:2];
    id v2 = *(void **)(a1 + 152);
    *(void *)(a1 + 152) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

uint64_t __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_153(uint64_t a1)
{
  id v2 = bls_diagnostics_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_153_cold_1(a1, v2);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)createDisplayPowerResourceHintWithState:(unint64_t)a3
{
  int v3 = (void *)[objc_alloc(MEMORY[0x263F5F600]) initWithResourceType:2 andState:(int)a3];
  id v4 = +[BLSHAsyncDisplayPowerResourceHint hintWithHint:v3];

  return v4;
}

- (BOOL)isShowingBlankingWindow
{
  return [(BLSHBacklightPlatformProvider *)self->_platformProvider isShowingBlankingWindow];
}

- (void)setShowingBlankingWindow:(BOOL)a3 fadeDuration:(double)a4
{
}

- (id)scheduleWatchdogWithDelegate:(id)a3 explanation:(id)a4 timeout:(double)a5
{
  return [(BLSHWatchdogProvider *)self->_watchdogProvider scheduleWatchdogWithDelegate:a3 explanation:a4 timeout:a5];
}

- (id)createPowerAssertionWithIdentifier:(id)a3
{
  int v3 = (objc_class *)MEMORY[0x263F7C490];
  id v4 = a3;
  int64_t v5 = (void *)[[v3 alloc] initWithIdentifier:v4];

  return v5;
}

- (id)createSystemActivityAssertionWithIdentifier:(id)a3 configurator:(id)a4
{
  int64_t v5 = (objc_class *)MEMORY[0x263F7C498];
  id v6 = a4;
  id v7 = a3;
  os_log_type_t v8 = (void *)[[v5 alloc] initWithIdentifier:v7 configurator:v6];

  return v8;
}

- (id)createFlipbook
{
  return +[BLSHFlipbook createWithPlatformProvider:self->_platformProvider];
}

- (id)systemSleepMonitor
{
  return (id)[MEMORY[0x263F7C4A0] monitorUsingMainQueue];
}

- (id)observeSignificantTimeChangeWithIdentifier:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__0;
  v16[4] = __Block_byref_object_dispose__0;
  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v8 = *MEMORY[0x263F1D0A0];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__BLSHBacklightOSInterfaceProvider_observeSignificantTimeChangeWithIdentifier_handler___block_invoke;
  v14[3] = &unk_264532470;
  id v9 = v6;
  id v15 = v9;
  id v17 = [v7 addObserverForName:v8 object:0 queue:0 usingBlock:v14];

  id v10 = objc_alloc(MEMORY[0x263F29CD8]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __87__BLSHBacklightOSInterfaceProvider_observeSignificantTimeChangeWithIdentifier_handler___block_invoke_2;
  v13[3] = &unk_264532498;
  v13[4] = v16;
  int v11 = (void *)[v10 initWithIdentifier:v5 forReason:@"observeSignificantTimeChange" invalidationBlock:v13];
  _Block_object_dispose(v16, 8);

  return v11;
}

uint64_t __87__BLSHBacklightOSInterfaceProvider_observeSignificantTimeChangeWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__BLSHBacklightOSInterfaceProvider_observeSignificantTimeChangeWithIdentifier_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (BOOL)deviceSupportsAlwaysOn
{
  return self->_deviceSupportsAlwaysOn;
}

- (BOOL)deviceSupportsAlwaysOnFlipbook
{
  return self->_deviceSupportsAlwaysOnFlipbook;
}

- (BOOL)isSuppressionServiceActive
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_suppressionServiceActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSuppressionServiceActive:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    *(unsigned char *)(a1 + 128) = a2;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BLSHSuppressionEvent)lastSuppressionEvent
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_lastSuppressionEvent;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setLastSuppressionEvent:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    objc_storeStrong((id *)(a1 + 48), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)startSuppressionServiceWithHandler:(id)a3
{
  id v4 = a3;
  -[BLSHBacklightOSInterfaceProvider setSuppressionServiceActive:]((uint64_t)self, 1);
  [(CMSuppressionManager *)self->_suppressionManager startService];
  suppressionManager = self->_suppressionManager;
  id v6 = [MEMORY[0x263F08A48] mainQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__BLSHBacklightOSInterfaceProvider_startSuppressionServiceWithHandler___block_invoke;
  v8[3] = &unk_2645324C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(CMSuppressionManager *)suppressionManager startSuppressionUpdatesToQueue:v6 withHandler:v8];
}

void __71__BLSHBacklightOSInterfaceProvider_startSuppressionServiceWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    bls_backlight_log();
    uint64_t v8 = (BLSHSuppressionEvent *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_FAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [v7 localizedDescription];
      int v11 = [v7 localizedFailureReason];
      int v12 = 134218754;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v5;
      __int16 v16 = 2114;
      id v17 = v10;
      __int16 v18 = 2114;
      __int16 v19 = v11;
      _os_log_fault_impl(&dword_21FCFC000, &v8->super, OS_LOG_TYPE_FAULT, "OSIP:%p suppression event error - event:%{public}@ error:%{public}@ reason:%{public}@", (uint8_t *)&v12, 0x2Au);
    }
    goto LABEL_7;
  }
  if ((unint64_t)([v5 type] - 1) <= 1)
  {
    [v5 timestamp];
    BLSMachTimeFromNSTimeInterval();
    uint64_t v8 = [[BLSHSuppressionEvent alloc] initWithCoreMotionEvent:v5 timestamp:BLSMachContinuousTimeFromMachAbsoluteTime()];
    -[BLSHBacklightOSInterfaceProvider setLastSuppressionEvent:](*(void *)(a1 + 32), v8);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_7:
  }
}

- (void)endSuppressionService
{
  -[BLSHBacklightOSInterfaceProvider setSuppressionServiceActive:]((uint64_t)self, 0);
  [(CMSuppressionManager *)self->_suppressionManager stopSuppressionUpdates];
  [(CMSuppressionManager *)self->_suppressionManager stopService];
  int v3 = [[BLSHSuppressionEvent alloc] initWithType:2 reason:0 timestamp:mach_continuous_time()];
  -[BLSHBacklightOSInterfaceProvider setLastSuppressionEvent:]((uint64_t)self, v3);
}

- (void)didDetectSignificantUserInteraction
{
  [(CMSuppressionManager *)self->_suppressionManager didDetectSignificantUserInteraction];
  [(BLSHWatchdogProvider *)self->_watchdogProvider didDetectSignificantUserInteraction];
  criticalAssertProvider = self->_criticalAssertProvider;

  [(BLSHCriticalAssertProvider *)criticalAssertProvider didDetectSignificantUserInteraction];
}

- (id)addSceneObserver:(id)a3 forSceneIdentityToken:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[sceneIdentityToken isKindOfClass:[FBSSceneIdentityToken class]]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightOSInterfaceProvider addSceneObserver:forSceneIdentityToken:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD05B30);
  }
  uint64_t v8 = [(BLSHBacklightOSInterfaceProvider *)self sceneWithIdentityToken:v7];
  if (v8)
  {
    uint64_t v9 = +[BLSHSceneEnvironmentObserverToken tokenWithObserver:v6 sceneIdentityToken:v7];
    id v10 = +[BLSHSceneEnvironmentObserver observerWithObserver:v6];
    os_unfair_lock_lock(&self->_lock);
    int v11 = bls_assertions_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [(NSMutableDictionary *)self->_lock_sceneObservers objectForKey:v9];
      *(_DWORD *)buf = 134218754;
      __int16 v19 = self;
      __int16 v20 = 2114;
      id v21 = v6;
      __int16 v22 = 2114;
      id v23 = v7;
      __int16 v24 = 2114;
      v25 = v17;
      _os_log_debug_impl(&dword_21FCFC000, v11, OS_LOG_TYPE_DEBUG, "OSIP:%p addSceneObserver:%{public}@ forSceneIdentityToken:%{public}@ existing:%{public}@", buf, 0x2Au);
    }
    int v12 = [(NSMutableDictionary *)self->_lock_sceneObservers objectForKey:v9];

    if (v12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"cannot add the same observer twice for the same scene; observer:%@ scene:%@",
        v6,
      __int16 v16 = v8);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHBacklightOSInterfaceProvider addSceneObserver:forSceneIdentityToken:]();
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD05B8CLL);
    }
    [(NSMutableDictionary *)self->_lock_sceneObservers setObject:v10 forKey:v9];
    os_unfair_lock_unlock(&self->_lock);
    [v8 addObserver:v10];
    uint64_t v13 = [v8 backlightSceneHostEnvironment];
  }
  else
  {
    uint64_t v9 = bls_assertions_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightOSInterfaceProvider addSceneObserver:forSceneIdentityToken:]();
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)removeSceneObserver:(id)a3 forSceneIdentityToken:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[sceneIdentityToken isKindOfClass:[FBSSceneIdentityToken class]]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHBacklightOSInterfaceProvider removeSceneObserver:forSceneIdentityToken:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD05DECLL);
  }
  uint64_t v8 = [(BLSHBacklightOSInterfaceProvider *)self sceneWithIdentityToken:v7];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v10 = +[BLSHSceneEnvironmentObserverToken tokenWithObserver:v6 sceneIdentityToken:v7];
  int v11 = [(NSMutableDictionary *)self->_lock_sceneObservers objectForKey:v10];
  int v12 = bls_assertions_log();
  os_log_type_t v13 = 2 * (v8 != 0);
  if (os_log_type_enabled(v12, v13))
  {
    *(_DWORD *)buf = 134219010;
    __int16 v18 = self;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    id v22 = v7;
    __int16 v23 = 1024;
    BOOL v24 = v8 != 0;
    __int16 v25 = 2114;
    uint64_t v26 = v11;
    _os_log_impl(&dword_21FCFC000, v12, v13, "OSIP:%p removeSceneObserver:%{public}@ forSceneIdentityToken:%{public}@ foundScene:%{BOOL}u existing:%{public}@", buf, 0x30u);
  }

  [(NSMutableDictionary *)self->_lock_sceneObservers removeObjectForKey:v10];
  if (v8)
  {
    if (v11) {
      [v8 removeObserver:v11];
    }
    __int16 v14 = [v8 backlightSceneHostEnvironment];
  }
  else
  {
    __int16 v14 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (double)timeoutForWatchdogType:(void *)a1
{
  if (!a1) {
    return 0.0;
  }
  int v3 = [a1 systemSleepMonitor];
  int v4 = [v3 isSleepImminent];

  if (a2 < 2)
  {
    id v6 = (uint64_t *)&BLSHBacklightCoreBrightnessCallbackSleepImminentWatchdogTimeout;
    id v7 = (uint64_t *)&BLSHBacklightCoreBrightnessCallbackWatchdogTimeout;
    BOOL v8 = v4 == 0;
    goto LABEL_8;
  }
  if (a2 != 2) {
    return result;
  }
  if (!v4)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    id v6 = (uint64_t *)&BLSHBacklightCoreAnimationCallbackWatchdogInternalInstallTimeout;
    id v7 = (uint64_t *)&BLSHBacklightCoreAnimationCallbackWatchdogTimeout;
    BOOL v8 = has_internal_diagnostics == 0;
LABEL_8:
    if (v8) {
      id v6 = v7;
    }
    return *(double *)v6;
  }
  id v6 = &BLSHBacklightCoreAnimationCallbackSleepImminentWatchdogTimeout;
  return *(double *)v6;
}

- (void)didCompleteTransitionToDisplayMode:(int64_t)a3 withError:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = bls_backlight_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a3 > 4) {
      BOOL v8 = @"Invalid";
    }
    else {
      BOOL v8 = off_2645325D8[a3];
    }
    *(_DWORD *)buf = 134218498;
    __int16 v16 = self;
    __int16 v17 = 2114;
    double v18 = *(double *)&v8;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_INFO, "OSIP:%p got didCompleteTransitionToDisplayMode:%{public}@ error:%@", buf, 0x20u);
  }

  if (self->_cbTransitionsDelayForTesting <= 0.1)
  {
    -[BLSHBacklightOSInterfaceProvider _didCompleteTransitionToDisplayMode:withError:]((uint64_t)self, a3, v6);
  }
  else
  {
    uint64_t v9 = bls_diagnostics_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double cbTransitionsDelayForTesting = self->_cbTransitionsDelayForTesting;
      *(_DWORD *)buf = 134218240;
      __int16 v16 = self;
      __int16 v17 = 2048;
      double v18 = cbTransitionsDelayForTesting;
      _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_DEFAULT, "OSIP:%p delayCompletionsForTesting:YES, delaying didCompleteCBTransitionToDisplayMode by %.2fs", buf, 0x16u);
    }

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(self->_cbTransitionsDelayForTesting * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__BLSHBacklightOSInterfaceProvider_didCompleteTransitionToDisplayMode_withError___block_invoke;
    block[3] = &unk_2645324E8;
    block[4] = self;
    int64_t v14 = a3;
    id v13 = v6;
    dispatch_after(v11, MEMORY[0x263EF83A0], block);
  }
}

void __81__BLSHBacklightOSInterfaceProvider_didCompleteTransitionToDisplayMode_withError___block_invoke(uint64_t a1)
{
  id v2 = bls_diagnostics_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__BLSHBacklightOSInterfaceProvider_didCompleteTransitionToDisplayMode_withError___block_invoke_cold_1(a1, v2);
  }

  -[BLSHBacklightOSInterfaceProvider _didCompleteTransitionToDisplayMode:withError:](*(void *)(a1 + 32), *(void *)(a1 + 48), *(void **)(a1 + 40));
}

- (void)_didCompleteTransitionToDisplayMode:(void *)a3 withError:
{
  if (a1)
  {
    id v5 = (os_unfair_lock_s *)(a1 + 88);
    id v6 = a3;
    os_unfair_lock_lock(v5);
    if (!*(void *)(a1 + 160))
    {
      [*(id *)(a1 + 144) invalidate:2];
      id v7 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v8 = [(id)a1 displayStateDelegate];
    [v8 osInterfaceProvider:a1 didCompleteTransitionToCBDisplayMode:a2 withError:v6];
  }
}

- (void)didCompleteSwitchToFlipbookState:(int64_t)a3 withError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = bls_backlight_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 2) {
      id v8 = @"WillTurnOn";
    }
    else {
      id v8 = off_264532600[a3 - 1];
    }
    int v11 = 134218498;
    int v12 = self;
    __int16 v13 = 2114;
    int64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_21FCFC000, v7, OS_LOG_TYPE_INFO, "OSIP:%p got didCompleteSwitchToFlipbookState:%{public}@ error:%@", (uint8_t *)&v11, 0x20u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_CBWatchdogType == 1)
  {
    [(BLSHWatchdogInvalidatable *)self->_lock_CBWatchdogTimer invalidate:2];
    lock_CBWatchdogTimer = self->_lock_CBWatchdogTimer;
    self->_lock_CBWatchdogTimer = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  id v10 = [(BLSHBacklightOSInterfaceProvider *)self displayStateDelegate];
  [v10 osInterfaceProvider:self didCompleteSwitchToCBFlipbookState:a3 withError:v6];
}

- (OS_dispatch_queue)delegateQueue
{
  id v2 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
  id v3 = MEMORY[0x263EF83A0];
  return v2;
}

- (BOOL)isFlipbookTransparent
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_flipbookTransparent;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFlipbookTransparent:(BOOL)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int lock_flipbookTransparent = self->_lock_flipbookTransparent;
  self->_int lock_flipbookTransparent = v3;
  int64_t lock_caDisplayState = self->_lock_caDisplayState;
  os_unfair_lock_unlock(p_lock);
  if (lock_flipbookTransparent != v3 && lock_caDisplayState == 2)
  {
    uint64_t v9 = bls_backlight_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v10)
      {
        *(_DWORD *)buf = 134217984;
        id v16 = self;
        uint64_t v11 = 1;
        _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_INFO, "OSIP:%p flipbook set transparent, will transition to active", buf, 0xCu);
      }
      else
      {
        uint64_t v11 = 1;
      }
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 134217984;
        id v16 = self;
        _os_log_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_INFO, "OSIP:%p flipbook no longer transparent, will transition to real flipbook", buf, 0xCu);
      }
      uint64_t v11 = 2;
    }

    displayStateControl = self->_displayStateControl;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__BLSHBacklightOSInterfaceProvider_setFlipbookTransparent___block_invoke;
    v13[3] = &unk_264532510;
    v13[4] = self;
    char v14 = v3;
    [(CADisplayStateControl *)displayStateControl transitionToDisplayState:v11 withCompletion:v13];
  }
}

void __59__BLSHBacklightOSInterfaceProvider_setFlipbookTransparent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = bls_backlight_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(unsigned __int8 *)(a1 + 40);
    int v9 = 134218496;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a3;
    __int16 v13 = 1024;
    int v14 = v8;
    _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_INFO, "OSIP:%p completed(%d) setFlipbookTransparent:%{BOOL}u", (uint8_t *)&v9, 0x18u);
  }

  if (!a3) {
    -[BLSHBacklightOSInterfaceProvider notifyDisplayBlankedIfChangedForCADisplayState:](*(void *)(a1 + 32), a2);
  }
}

- (id)abortContextForTimer:(id)a3
{
  p_lock = &self->_lock;
  id v5 = (BLSHWatchdogInvalidatable *)a3;
  os_unfair_lock_lock(p_lock);
  lock_CAWatchdogTimer = self->_lock_CAWatchdogTimer;

  uint64_t v7 = &OBJC_IVAR___BLSHBacklightOSInterfaceProvider__lock_CBWatchdogType;
  if (lock_CAWatchdogTimer == v5) {
    uint64_t v7 = &OBJC_IVAR___BLSHBacklightOSInterfaceProvider__lock_CAWatchdogType;
  }
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.isa + *v7);
  int v9 = [BLSHOSInterfaceProviderAbortContext alloc];
  *(float *)&double v10 = self->_backlightDimmedFactor;
  BYTE4(v13) = self->_displayStateClientSupported;
  BYTE3(v13) = self->_lock_kernelSpecialMode;
  BYTE2(v13) = self->_deviceSupportsAlwaysOnFlipbook;
  LOWORD(v13) = *(_WORD *)&self->_lock_flipbookTransparent;
  __int16 v11 = -[BLSHOSInterfaceProviderAbortContext initWithWatchdogType:cbDisplayMode:cbFlipbookState:caDisplayState:completedCADisplayState:suppressionServiceActive:flipbookTransparent:deviceSupportsAlwaysOn:deviceSupportsAlwaysOnFlipbook:kernelSpecialMode:displayStateClientSupported:backlightDimmedFactor:](v9, "initWithWatchdogType:cbDisplayMode:cbFlipbookState:caDisplayState:completedCADisplayState:suppressionServiceActive:flipbookTransparent:deviceSupportsAlwaysOn:deviceSupportsAlwaysOnFlipbook:kernelSpecialMode:displayStateClientSupported:backlightDimmedFactor:", v8, self->_lock_cbDisplayMode, self->_lock_cbFlipbookState, self->_lock_caDisplayState, self->_lock_notifiedCADisplayState, self->_lock_suppressionServiceActive, v10, v13);
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)identifier
{
  id v2 = [MEMORY[0x263F29C40] builderWithObject:self];
  int v3 = [v2 build];

  return v3;
}

- (void)setCBTransitionsDelayForTesting:(double)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = bls_diagnostics_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    double v7 = a3;
    _os_log_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_DEFAULT, "OSIP: setCBTransitionsDelayForTesting:%.02fs", (uint8_t *)&v6, 0xCu);
  }

  self->_double cbTransitionsDelayForTesting = a3;
}

- (void)setCATransitionsDelayForTesting:(double)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = bls_diagnostics_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    double v7 = a3;
    _os_log_impl(&dword_21FCFC000, v5, OS_LOG_TYPE_DEFAULT, "OSIP: setCATransitionsDelayForTesting:%.02fs", (uint8_t *)&v6, 0xCu);
  }

  self->_caTransitionsDelayForTesting = a3;
}

- (void)abortForWatchdog:(unint64_t)a3 payload:(void *)a4 payloadSize:(unsigned int)a5 explanation:(id)a6
{
  [a6 UTF8String];
  if (a4 && a5) {
    abort_with_payload();
  }
  uint64_t v8 = (BLSHBacklightOSInterfaceProvider *)abort_with_reason();
  [(BLSHBacklightOSInterfaceProvider *)v8 panicForWatchdog:v10 withDelay:v12 completion:v11];
}

- (void)panicForWatchdog:(id)a3 withDelay:(double)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  SEL v9 = bls_diagnostics_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[BLSHBacklightOSInterfaceProvider panicForWatchdog:withDelay:completion:](v9);
  }

  uint64_t v10 = OSLogFlushBuffers();
  id v11 = bls_diagnostics_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[BLSHBacklightOSInterfaceProvider panicForWatchdog:withDelay:completion:](v10, v11);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__BLSHBacklightOSInterfaceProvider_panicForWatchdog_withDelay_completion___block_invoke;
  v17[3] = &unk_264532420;
  double v20 = a4;
  id v18 = v7;
  id v19 = v8;
  id v12 = v8;
  id v13 = v7;
  uint64_t v14 = MEMORY[0x223C5E2B0](v17);
  uint64_t v15 = (void *)v14;
  if (a4 <= 0.0)
  {
    (*(void (**)(uint64_t))(v14 + 16))(v14);
  }
  else
  {
    dispatch_time_t v16 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_after(v16, MEMORY[0x263EF83A0], v15);
  }
}

uint64_t __74__BLSHBacklightOSInterfaceProvider_panicForWatchdog_withDelay_completion___block_invoke(uint64_t a1)
{
  id v2 = bls_diagnostics_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __74__BLSHBacklightOSInterfaceProvider_panicForWatchdog_withDelay_completion___block_invoke_cold_2(a1, v2);
  }

  int v3 = MEMORY[0x223C5E510](3072, [*(id *)(a1 + 32) UTF8String]);
  if (!v3)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  int v4 = v3;
  id v5 = bls_diagnostics_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    __74__BLSHBacklightOSInterfaceProvider_panicForWatchdog_withDelay_completion___block_invoke_cold_1(v4, v5);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)writeTailspinForWatchdog:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  dispatch_time_t v16 = __Block_byref_object_dispose__0;
  uint64_t v17 = [[BLSHTailspinLogWriter alloc] initWithReason:v5];
  id v7 = (void *)v13[5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__BLSHBacklightOSInterfaceProvider_writeTailspinForWatchdog_completion___block_invoke;
  v9[3] = &unk_264532538;
  id v8 = v6;
  id v10 = v8;
  id v11 = &v12;
  [v7 writeTailspinLogWithCompletion:v9];

  _Block_object_dispose(&v12, 8);
}

void __72__BLSHBacklightOSInterfaceProvider_writeTailspinForWatchdog_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  int v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (BOOL)isTailspinAvailable
{
  return +[BLSHTailspinLogWriter isTailspinAvailable];
}

- (unint64_t)flipbookDiagnosticHistoryFrameLimit
{
  return self->_flipbookDiagnosticHistoryFrameLimit;
}

- (unint64_t)flipbookDiagnosticHistoryMemoryLimit
{
  return self->_flipbookDiagnosticHistoryMemoryLimit;
}

- (BLSDisplayStateDelegate)displayStateDelegate
{
  return (BLSDisplayStateDelegate *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDisplayStateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayStateDelegate, 0);
  objc_storeStrong((id *)&self->_lock_CAWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_lock_CBWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_setCBDisplayModeTimer, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_displayStateControl, 0);
  objc_storeStrong((id *)&self->_displayStateClient, 0);
  objc_storeStrong((id *)&self->_lock_lastSuppressionEvent, 0);
  objc_storeStrong((id *)&self->_lock_sceneWorkspaces, 0);
  objc_storeStrong((id *)&self->_lock_sceneObservers, 0);
  objc_storeStrong((id *)&self->_criticalAssertProvider, 0);
  objc_storeStrong((id *)&self->_watchdogProvider, 0);

  objc_storeStrong((id *)&self->_platformProvider, 0);
}

- (void)initWithPlatformProvider:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)sysctlKernSpecialMode
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_21FCFC000, v0, v1, "OSIP:%p get kernel aotMode:%x", v2, v3);
}

- (void)registerHandlersForService:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setKernelAlwaysOnMode:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_21FCFC000, v0, v1, "OSIP:%p set kernel aotMode:%x", v2, v3);
}

- (void)transitionToDisplayMode:withDuration:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)switchToFlipbookState:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a2 - 1) > 2) {
    int v3 = @"WillTurnOn";
  }
  else {
    int v3 = off_264532600[a2 - 1];
  }
  int v4 = 134218242;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_fault_impl(&dword_21FCFC000, log, OS_LOG_TYPE_FAULT, "OSIP:%p unsupported call to switchToFlipbookState:%{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)transitionToCADisplayState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void __63__BLSHBacklightOSInterfaceProvider_transitionToCADisplayState___block_invoke_153_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = NSStringFromCADisplayState();
  int v5 = 134218242;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "OSIP:%p delayCompletionsForTesting:YES, completing delayed CATransitionToDisplayState:%{public}@", (uint8_t *)&v5, 0x16u);
}

- (void)addSceneObserver:forSceneIdentityToken:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_ERROR, "OSIP:%p could not find scene for token:%{public}@", v1, 0x16u);
}

- (void)addSceneObserver:forSceneIdentityToken:.cold.2()
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

- (void)addSceneObserver:forSceneIdentityToken:.cold.3()
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

- (void)removeSceneObserver:forSceneIdentityToken:.cold.1()
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

void __81__BLSHBacklightOSInterfaceProvider_didCompleteTransitionToDisplayMode_withError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "OSIP:%p delayCompletionsForTesting:YES, completing delayed didCompleteCBTransitionToDisplayMode", (uint8_t *)&v3, 0xCu);
}

- (void)panicForWatchdog:(uint64_t)a1 withDelay:(os_log_t)log completion:.cold.1(uint64_t a1, os_log_t log)
{
  int v3 = a1;
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"failed:%d", a1);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = @"succeeded";
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "panicForWatchdog: OSLogFlushBuffers() %{public}@", buf, 0xCu);
  if (v3) {
}
  }

- (void)panicForWatchdog:(os_log_t)log withDelay:completion:.cold.2(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "panicForWatchdog: flushing os log buffers", v1, 2u);
}

void __74__BLSHBacklightOSInterfaceProvider_panicForWatchdog_withDelay_completion___block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_FAULT, "attempt to panic failed:%d, falling through to abort", (uint8_t *)v2, 8u);
}

void __74__BLSHBacklightOSInterfaceProvider_panicForWatchdog_withDelay_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  double v3 = *(double *)(a1 + 48);
  if (v3 <= 0.0)
  {
    uint64_t v4 = @"immediately";
  }
  else
  {
    uint64_t v4 = [NSString stringWithFormat:@"after %lfs delay: %@", *(void *)&v3, *(void *)(a1 + 32)];
  }
  *(_DWORD *)buf = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_ERROR, "panicForWatchdog: triggering panic %{public}@", buf, 0xCu);
  if (v3 > 0.0) {
}
  }

@end