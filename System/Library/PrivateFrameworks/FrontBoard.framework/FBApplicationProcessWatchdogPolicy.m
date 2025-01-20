@interface FBApplicationProcessWatchdogPolicy
+ (double)_defaultFirstPartyAdditionalScale;
+ (double)_defaultLaunchScale;
+ (double)_defaultResumeScale;
+ (double)_scaleForGestaltKey:(__CFString *)a3;
+ (id)defaultPolicy;
- (FBApplicationProcessWatchdogPolicy)init;
- (double)_queue_watchdogScalingFactorForAppInfo:(id)a3 isResume:(BOOL)a4;
- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4;
- (void)_queue_reloadDefaultSettings;
- (void)dealloc;
@end

@implementation FBApplicationProcessWatchdogPolicy

- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 event];
  if (([v6 isApplicationProcess] & 1) == 0 && v8 == 1)
  {
    v9 = [v6 executionContext];
    int v10 = [v9 forSceneActivation];

    if (!v10)
    {
      v16 = 0;
      goto LABEL_36;
    }
    id v11 = [v6 applicationInfo];
    uint64_t v50 = 0;
    v51 = (double *)&v50;
    uint64_t v52 = 0x2020000000;
    unint64_t v53 = 0xBFF0000000000000;
    goto LABEL_8;
  }
  id v11 = [v6 applicationInfo];
  uint64_t v50 = 0;
  v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  unint64_t v53 = 0xBFF0000000000000;
  if ((unint64_t)(v8 - 2) < 2)
  {
    v13 = [v7 sceneSettings];
    int v17 = [v13 isForeground];
    v18 = [v7 sceneUpdateContext];
    v19 = [v18 settingsDiff];
    int v20 = [v19 containsProperty:sel_isForeground];

    if ((v17 | v20) == 1)
    {
      v21 = v51;
      uint64_t v22 = 0x4024000000000000;
    }
    else
    {
      v26 = [v7 sceneTransitionContext];
      int v27 = [v26 allowCPUThrottling];

      v21 = v51;
      if (v27) { {
        uint64_t v22 = 0x404E000000000000;
      }
      }
      else {
        uint64_t v22 = 0x403E000000000000;
      }
    }
    *((void *)v21 + 3) = v22;
    double v12 = -1.0;
    if (v17)
    {
      queue = self->_queue;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __76__FBApplicationProcessWatchdogPolicy_watchdogPolicyForProcess_eventContext___block_invoke_2;
      v44[3] = &unk_1E5C4A448;
      v46 = &v50;
      v44[4] = self;
      id v11 = v11;
      id v45 = v11;
      dispatch_sync(queue, v44);
    }
    goto LABEL_26;
  }
  if (v8 == 4)
  {
    v13 = [v7 sceneTransitionContext];
    v23 = [v13 _uiApplicationSceneTransitionContextShim];
    v24 = v23;
    if (v23 && ([v23 waitForBackgroundTaskCompletion] & 1) != 0) { {
      double v25 = 60.0;
    }
    }
    else {
      double v25 = 5.0;
    }
    v51[3] = v25;

    double v12 = -1.0;
LABEL_26:

    goto LABEL_27;
  }
  double v12 = -1.0;
  if (v8 == 1)
  {
LABEL_8:
    v13 = [v6 executionContext];
    uint64_t v14 = [v13 launchIntent];
    double v12 = -1.0;
    if ((unint64_t)(v14 - 3) >= 3)
    {
      if (v14 == 2)
      {
        v51[3] = 30.0;
        double v12 = 10.0;
      }
    }
    else
    {
      v51[3] = 20.0;
      if ((unint64_t)(v14 - 3) <= 1)
      {
        v15 = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __76__FBApplicationProcessWatchdogPolicy_watchdogPolicyForProcess_eventContext___block_invoke;
        block[3] = &unk_1E5C4A448;
        v49 = &v50;
        block[4] = self;
        id v11 = v11;
        id v48 = v11;
        dispatch_sync(v15, block);
      }
    }
    goto LABEL_26;
  }
LABEL_27:
  watchdogPolicyExceptions = self->_watchdogPolicyExceptions;
  v30 = [v6 bundleIdentifier];
  v31 = [(NSDictionary *)watchdogPolicyExceptions objectForKey:v30];

  if (v31)
  {
    [v31 doubleValue];
    v51[3] = v32 + v51[3];
  }
  if (v51[3] <= 0.0)
  {
    v16 = 0;
  }
  else
  {
    v33 = (void *)MEMORY[0x1E4F62A00];
    FBSProcessResourceAllowanceMakeWithRealTimeInterval();
    uint64_t v34 = [v33 provisionWithAllowance:v43];
    v35 = (void *)v34;
    if (v12 <= 0.0)
    {
      v40 = (void *)MEMORY[0x1E4F62A10];
      uint64_t v54 = v34;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
      v16 = [v40 policyWithProvisions:v37];
    }
    else
    {
      v36 = (void *)MEMORY[0x1E4F62A00];
      FBSProcessResourceAllowanceMakeWithScheduledTimeInterval();
      v37 = [v36 provisionWithAllowance:&v42];
      v38 = (void *)MEMORY[0x1E4F62A10];
      v55[0] = v35;
      v55[1] = v37;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
      v16 = [v38 policyWithProvisions:v39];
    }
  }

  _Block_object_dispose(&v50, 8);
LABEL_36:

  return v16;
}

double __76__FBApplicationProcessWatchdogPolicy_watchdogPolicyForProcess_eventContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = v3 * *(double *)(v2 + 24);
  *(double *)(v2 + 24) = result;
  return result;
}

- (double)_queue_watchdogScalingFactorForAppInfo:(id)a3 isResume:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 type];
    if ([v7 type] == 2 && !self->_enableThirdPartyPre9)
    {
      double v10 = 1.0;
      if (![v7 builtOnOrAfterSDKVersion:@"10.0"] || !v8) { {
        goto LABEL_13;
      }
      }
    }
    else if (!v8)
    {
      double v10 = 1.0;
      goto LABEL_13;
    }
    uint64_t v9 = 8;
    if (v4) { {
      uint64_t v9 = 16;
    }
    }
    double v10 = *(double *)((char *)&self->super.isa + v9);
    if ([v7 type] == 1) { {
      double v10 = v10 * self->_additionalFirstPartyScale;
    }
    }
  }
  else
  {
    uint64_t v11 = 8;
    if (v4) { {
      uint64_t v11 = 16;
    }
    }
    double v10 = *(double *)((char *)&self->super.isa + v11);
  }
LABEL_13:

  return v10;
}

- (FBApplicationProcessWatchdogPolicy)init
{
  v20.receiver = self;
  v20.super_class = (Class)FBApplicationProcessWatchdogPolicy;
  uint64_t v2 = [(FBApplicationProcessWatchdogPolicy *)&v20 init];
  double v3 = (FBApplicationProcessWatchdogPolicy *)v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v2 + 8) = _Q0;
    *((void *)v2 + 3) = 0x3FF0000000000000;
    v2[32] = 0;
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

    uint64_t v11 = v3->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__FBApplicationProcessWatchdogPolicy_init__block_invoke;
    block[3] = &unk_1E5C49AE0;
    double v12 = v3;
    v19 = v12;
    dispatch_async(v11, block);
    objc_initWeak(&location, v12);
    v13 = v3->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __42__FBApplicationProcessWatchdogPolicy_init__block_invoke_2;
    handler[3] = &unk_1E5C4AD40;
    objc_copyWeak(&v16, &location);
    notify_register_dispatch("com.apple.da.tasking_changed", v12 + 9, v13, handler);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v3;
}

uint64_t __42__FBApplicationProcessWatchdogPolicy_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reloadDefaultSettings");
}

void __42__FBApplicationProcessWatchdogPolicy_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_reloadDefaultSettings");
}

- (void)dealloc
{
  int daNotificationToken = self->_daNotificationToken;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FBApplicationProcessWatchdogPolicy_dealloc__block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v7 = daNotificationToken;
  dispatch_sync(queue, block);
  v5.receiver = self;
  v5.super_class = (Class)FBApplicationProcessWatchdogPolicy;
  [(FBApplicationProcessWatchdogPolicy *)&v5 dealloc];
}

uint64_t __45__FBApplicationProcessWatchdogPolicy_dealloc__block_invoke(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(a1 + 32));
}

+ (id)defaultPolicy
{
  if (defaultPolicy_onceToken != -1) { {
    dispatch_once(&defaultPolicy_onceToken, &__block_literal_global_17);
  }
  }
  uint64_t v2 = (void *)defaultPolicy___DefaultPolicy;

  return v2;
}

void __51__FBApplicationProcessWatchdogPolicy_defaultPolicy__block_invoke()
{
  v0 = objc_alloc_init(FBApplicationProcessWatchdogPolicy);
  v1 = (void *)defaultPolicy___DefaultPolicy;
  defaultPolicy___DefaultPolicy = (uint64_t)v0;
}

+ (double)_scaleForGestaltKey:(__CFString *)a3
{
  double v3 = 1.0;
  if (BSSystemHasCapability())
  {
    BOOL v4 = (void *)MGCopyAnswer();
    if (v4)
    {
      [v4 doubleValue];
      double v3 = v5;
    }
    fbs_release();
  }
  return v3;
}

+ (double)_defaultLaunchScale
{
  if (MEMORY[0x1AD0B8630]("+[FBApplicationProcessWatchdogPolicy _defaultLaunchScale]", a2))
  {
    double v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 doubleForKey:@"FBLaunchWatchdogScaleOverride"];
    double v5 = v4;

    if (v5 > 0.0) { {
      return v5;
    }
    }
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 doubleForKey:@"FBLaunchWatchdogScale"];
  double v5 = v7;

  if (v5 > 0.0) { {
    return v5;
  }
  }

  [a1 _scaleForGestaltKey:@"emXA9B552rnSoI7xXE91DA"];
  return result;
}

+ (double)_defaultResumeScale
{
  if (MEMORY[0x1AD0B8630]("+[FBApplicationProcessWatchdogPolicy _defaultResumeScale]", a2))
  {
    double v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 doubleForKey:@"FBLaunchWatchdogResumeScaleOverride"];
    double v5 = v4;

    if (v5 > 0.0) { {
      return v5;
    }
    }
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 doubleForKey:@"FBLaunchWatchdogResumeScale"];
  double v5 = v7;

  if (v5 > 0.0) { {
    return v5;
  }
  }

  [a1 _scaleForGestaltKey:@"QbQzuIbef01P4JeoL9EmKg"];
  return result;
}

+ (double)_defaultFirstPartyAdditionalScale
{
  if (MEMORY[0x1AD0B8630]("+[FBApplicationProcessWatchdogPolicy _defaultFirstPartyAdditionalScale]", a2))
  {
    double v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 doubleForKey:@"FBLaunchWatchdogFirstPartyScaleOverride"];
    double v5 = v4;

    if (v5 > 0.0) { {
      return v5;
    }
    }
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 doubleForKey:@"FBLaunchWatchdogFirstPartyScale"];
  double v5 = v7;

  if (v5 > 0.0) { {
    return v5;
  }
  }

  [a1 _scaleForGestaltKey:@"NUYAz1eq3Flzt7ZQxXC/ng"];
  return result;
}

- (void)_queue_reloadDefaultSettings
{
  self->_deviceLaunchScale = v3;
  [(id)objc_opt_class() _defaultResumeScale];
  self->_deviceResumeScale = v4;
  [(id)objc_opt_class() _defaultFirstPartyAdditionalScale];
  self->_additionalFirstPartyScale = v5;
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  self->_enableThirdPartyPre9 = [v6 BOOLForKey:@"FBLaunchWatchdogEnableThirdPartyPre9"];

  id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  double v7 = [v10 dictionaryForKey:@"FBLaunchWatchdogExceptions"];
  uint64_t v8 = (NSDictionary *)[v7 copy];
  watchdogPolicyExceptions = self->_watchdogPolicyExceptions;
  self->_watchdogPolicyExceptions = v8;
}

double __76__FBApplicationProcessWatchdogPolicy_watchdogPolicyForProcess_eventContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = v3 * *(double *)(v2 + 24);
  *(double *)(v2 + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogPolicyExceptions, 0);
}

@end