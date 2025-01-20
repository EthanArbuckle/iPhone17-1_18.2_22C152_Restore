@interface AFUIApplicationSiriTaskDeliverer
- (AFSiriTaskmaster)taskmaster;
- (AFUIApplicationSiriTaskDeliverer)initWithAppBundleIdentifier:(id)a3;
- (NSString)description;
- (void)_handleSuccessfulAppLaunchToBackground:(BOOL)a3 forRequest:(id)a4 completion:(id)a5;
- (void)_invalidateAssertionTimer;
- (void)_invalidateBackboardServices;
- (void)_processAssertionWasAcquired:(BOOL)a3;
- (void)_processAssertionWasInvalidatedForRequest:(id)a3;
- (void)_startAppStateMonitoringForRequest:(id)a3;
- (void)dealloc;
- (void)deliverSiriTask:(id)a3 completionHandler:(id)a4;
- (void)processAssertionWasInvalidatedForRequest:(id)a3;
- (void)setTaskmaster:(id)a3;
- (void)siriTaskDidFinish;
@end

@implementation AFUIApplicationSiriTaskDeliverer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_taskmaster);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bKSAssertionSetupGroup, 0);
  objc_storeStrong((id *)&self->_assertionTimer, 0);
  objc_storeStrong((id *)&self->_bKSAssertionForBgLaunch, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

- (void)setTaskmaster:(id)a3
{
}

- (AFSiriTaskmaster)taskmaster
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_taskmaster);
  return (AFSiriTaskmaster *)WeakRetained;
}

- (void)_invalidateAssertionTimer
{
  [(AFWatchdogTimer *)self->_assertionTimer cancel];
  assertionTimer = self->_assertionTimer;
  self->_assertionTimer = 0;
}

- (void)_invalidateBackboardServices
{
  [(BKSApplicationStateMonitor *)self->_appStateMonitor invalidate];
  appStateMonitor = self->_appStateMonitor;
  self->_appStateMonitor = 0;

  [(BKSProcessAssertion *)self->_bKSAssertionForBgLaunch invalidate];
  bKSAssertionForBgLaunch = self->_bKSAssertionForBgLaunch;
  self->_bKSAssertionForBgLaunch = 0;
}

- (void)_handleSuccessfulAppLaunchToBackground:(BOOL)a3 forRequest:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (void (**)(void))a5;
  if (v6)
  {
    objc_initWeak(&location, self);
    id v10 = objc_alloc((Class)getBKSProcessAssertionClass());
    appBundleIdentifier = self->_appBundleIdentifier;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke;
    v26[3] = &unk_1E592A6F8;
    v26[4] = self;
    v27 = v9;
    uint64_t v12 = [v10 initWithBundleIdentifier:appBundleIdentifier flags:33 reason:4 name:@"SiriTaskDelivererBackground" withHandler:v26];
    bKSAssertionForBgLaunch = self->_bKSAssertionForBgLaunch;
    p_bKSAssertionForBgLaunch = &self->_bKSAssertionForBgLaunch;
    *p_bKSAssertionForBgLaunch = (BKSProcessAssertion *)v12;

    v15 = *p_bKSAssertionForBgLaunch;
    if (*p_bKSAssertionForBgLaunch)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke_3;
      v23[3] = &unk_1E5929FC0;
      objc_copyWeak(&v25, &location);
      id v24 = v8;
      [(BKSProcessAssertion *)v15 setInvalidationHandler:v23];

      objc_destroyWeak(&v25);
    }
    else
    {
      v22 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[AFUIApplicationSiriTaskDeliverer _handleSuccessfulAppLaunchToBackground:forRequest:completion:]";
        __int16 v31 = 2112;
        id v32 = v8;
        _os_log_error_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_ERROR, "%s Unable to take process assertion for background launch because BKSProcessAssertion is nil %@", buf, 0x16u);
      }
    }

    objc_destroyWeak(&location);
  }
  else
  {
    v16 = [v8 _refId];
    v17 = (void *)[v16 copy];

    p_taskmaster = &self->_taskmaster;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_taskmaster);
    v20 = [WeakRetained delegate];
    id v21 = objc_loadWeakRetained((id *)p_taskmaster);
    [v20 taskmaster:v21 didLaunchApplicationForRequestWithId:v17];

    v9[2](v9);
  }
}

void __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke_2;
  block[3] = &unk_1E592B670;
  block[4] = v2;
  char v6 = a2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

void __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained processAssertionWasInvalidatedForRequest:*(void *)(a1 + 32)];
}

uint64_t __97__AFUIApplicationSiriTaskDeliverer__handleSuccessfulAppLaunchToBackground_forRequest_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _processAssertionWasAcquired:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)siriTaskDidFinish
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[AFUIApplicationSiriTaskDeliverer siriTaskDidFinish]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  bKSAssertionSetupGroup = self->_bKSAssertionSetupGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__AFUIApplicationSiriTaskDeliverer_siriTaskDidFinish__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_group_notify(bKSAssertionSetupGroup, queue, block);
}

uint64_t __53__AFUIApplicationSiriTaskDeliverer_siriTaskDidFinish__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateAssertionTimer];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidateBackboardServices];
}

- (void)deliverSiriTask:(id)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc((Class)getUISiriTaskActionClass()) initWithPayload:v6];
  if (v8)
  {
    id v32 = v6;
    uint64_t v9 = [v6 request];
    [(AFUIApplicationSiriTaskDeliverer *)self _startAppStateMonitoringForRequest:v9];
    uint64_t v10 = [v9 _makeAppFrontmost] ^ 1;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v12 = getFBSOpenApplicationOptionKeyActions();
    if (v12)
    {
      v37 = v8;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      [v11 setObject:v13 forKey:v12];
    }
    v14 = getFBSOpenApplicationOptionKeyActivateSuspended();
    if (v14)
    {
      v15 = [MEMORY[0x1E4F28ED0] numberWithBool:v10];
      [v11 setObject:v15 forKey:v14];
    }
    char v30 = v10;
    uint64_t v16 = getFBSOpenApplicationOptionKeyUnlockDevice();
    if (v16) {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKey:v16];
    }
    v17 = getFBSOpenApplicationOptionKeyPromptUnlockDevice();
    if (v17) {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKey:v17];
    }
    dispatch_group_enter((dispatch_group_t)self->_bKSAssertionSetupGroup);
    v18 = [getFBSOpenApplicationServiceClass() serviceWithDefaultShellEndpoint];
    __int16 v31 = (void *)v16;
    if (v18)
    {
      appBundleIdentifier = self->_appBundleIdentifier;
      [getFBSOpenApplicationOptionsClass() optionsWithDictionary:v11];
      id v19 = v11;
      v20 = v14;
      id v21 = v12;
      v22 = v8;
      id v24 = v23 = v7;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke;
      v33[3] = &unk_1E5929F98;
      v33[4] = self;
      id v35 = v23;
      char v36 = v30;
      id v34 = v9;
      [v18 openApplication:appBundleIdentifier withOptions:v24 completion:v33];

      id v7 = v23;
      id v8 = v22;
      uint64_t v12 = v21;
      v14 = v20;
      id v11 = v19;
    }
    else
    {
      v26 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[AFUIApplicationSiriTaskDeliverer deliverSiriTask:completionHandler:]";
        __int16 v40 = 2112;
        uint64_t v41 = (uint64_t)v32;
        _os_log_error_impl(&dword_19CF1D000, v26, OS_LOG_TYPE_ERROR, "%s Unable to launch apps because FBSOpenApplicationService is nil %@", buf, 0x16u);
      }
      v27 = +[AFError errorWithCode:13];
      (*((void (**)(id, void *))v7 + 2))(v7, v27);
    }
    id v6 = v32;
  }
  else
  {
    id v25 = (id)AFSiriLogContextConnection;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      if (UIKitLibrary_sOnce != -1) {
        dispatch_once(&UIKitLibrary_sOnce, &__block_literal_global_144_33283);
      }
      *(_DWORD *)buf = 136315650;
      v39 = "-[AFUIApplicationSiriTaskDeliverer deliverSiriTask:completionHandler:]";
      __int16 v40 = 2050;
      uint64_t v41 = UIKitLibrary_sLib;
      __int16 v42 = 2114;
      id UISiriTaskActionClass = getUISiriTaskActionClass();
      id v28 = UISiriTaskActionClass;
      _os_log_error_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_ERROR, "%s Couldn't create a SiriTask action %{public}p %{public}@", buf, 0x20u);

      id v8 = 0;
    }

    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kAFAssistantErrorDomain" code:705 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
}

void __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_2;
  v23[3] = &unk_1E592C598;
  void v23[4] = *(void *)(a1 + 32);
  id v25 = *(id *)(a1 + 48);
  id v5 = v4;
  id v24 = v5;
  id v6 = (void *)MEMORY[0x19F3A50D0](v23);
  id v7 = [v5 domain];
  id v8 = getFBSOpenApplicationServiceErrorDomain();
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [v5 userInfo];
    id v11 = [v10 objectForKey:*MEMORY[0x1E4F28A50]];

    if (v11)
    {
      id v12 = v11;

      id v5 = v12;
    }
  }
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(NSObject **)(v13 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_3;
  v17[3] = &unk_1E5929F70;
  id v18 = v5;
  uint64_t v19 = v13;
  char v22 = *(unsigned char *)(a1 + 56);
  id v20 = *(id *)(a1 + 40);
  id v21 = v6;
  id v15 = v6;
  id v16 = v5;
  dispatch_async(v14, v17);
}

uint64_t __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __70__AFUIApplicationSiriTaskDeliverer_deliverSiriTask_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    return [*(id *)(a1 + 40) _handleSuccessfulAppLaunchToBackground:*(unsigned __int8 *)(a1 + 64) forRequest:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

- (void)_processAssertionWasAcquired:(BOOL)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if (a3)
  {
    double v4 = AFPreferencesSiriTaskBackgroundAssertionTimeout();
    id v5 = self->_appBundleIdentifier;
    objc_initWeak(location, self);
    id v6 = self->_appStateMonitor;
    id v7 = [AFWatchdogTimer alloc];
    queue = self->_queue;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __65__AFUIApplicationSiriTaskDeliverer__processAssertionWasAcquired___block_invoke;
    id v18 = &unk_1E5929F48;
    int v9 = v5;
    uint64_t v19 = v9;
    v21[1] = *(id *)&v4;
    uint64_t v10 = v6;
    id v20 = v10;
    objc_copyWeak(v21, location);
    uint64_t v11 = [(AFWatchdogTimer *)v7 initWithTimeoutInterval:queue onQueue:&v15 timeoutHandler:v4];
    assertionTimer = self->_assertionTimer;
    p_assertionTimer = (id *)&self->_assertionTimer;
    id *p_assertionTimer = (id)v11;

    objc_msgSend(*p_assertionTimer, "start", v15, v16, v17, v18);
    objc_destroyWeak(v21);

    objc_destroyWeak(location);
  }
  else
  {
    v14 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasAcquired:]";
      _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s Could not acquire BKS assertion", (uint8_t *)location, 0xCu);
    }
    [(AFUIApplicationSiriTaskDeliverer *)self _invalidateBackboardServices];
  }
}

void __65__AFUIApplicationSiriTaskDeliverer__processAssertionWasAcquired___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasAcquired:]_block_invoke";
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    __int16 v14 = 2050;
    uint64_t v15 = v7;
    _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s BKS assertion for %{public}@ timed out after %{public}.2f seconds", buf, 0x20u);
  }
  v3 = *(void **)(a1 + 32);
  double v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__AFUIApplicationSiriTaskDeliverer__processAssertionWasAcquired___block_invoke_20;
  v8[3] = &unk_1E5929EF8;
  id v9 = v3;
  [v4 applicationInfoForApplication:v9 completion:v8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _invalidateBackboardServices];
}

void __65__AFUIApplicationSiriTaskDeliverer__processAssertionWasAcquired___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasAcquired:]_block_invoke";
    __int16 v8 = 2114;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s After timing out, recipient %{public}@ state was %{public}@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)processAssertionWasInvalidatedForRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__AFUIApplicationSiriTaskDeliverer_processAssertionWasInvalidatedForRequest___block_invoke;
  v7[3] = &unk_1E592C710;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __77__AFUIApplicationSiriTaskDeliverer_processAssertionWasInvalidatedForRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processAssertionWasInvalidatedForRequest:*(void *)(a1 + 40)];
}

- (void)_processAssertionWasInvalidatedForRequest:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasInvalidatedForRequest:]";
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s BKS assertion was unexpectedly dropped", buf, 0xCu);
  }
  appStateMonitor = self->_appStateMonitor;
  if (!appStateMonitor)
  {
    id v7 = objc_alloc((Class)getBKSApplicationStateMonitorClass());
    appBundleIdentifier = self->_appBundleIdentifier;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&appBundleIdentifier count:1];
    uint64_t v9 = (BKSApplicationStateMonitor *)[v7 initWithBundleIDs:v8 states:getBKSApplicationStateAll()];
    __int16 v10 = self->_appStateMonitor;
    self->_appStateMonitor = v9;

    appStateMonitor = self->_appStateMonitor;
    if (!appStateMonitor)
    {
      id v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v19 = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasInvalidatedForRequest:]";
        _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s Unable to restart app state monitoring because BKSApplicationStateMonitor is nil.", buf, 0xCu);
        appStateMonitor = self->_appStateMonitor;
      }
      else
      {
        appStateMonitor = 0;
      }
    }
  }
  uint64_t v12 = self->_appBundleIdentifier;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__AFUIApplicationSiriTaskDeliverer__processAssertionWasInvalidatedForRequest___block_invoke;
  v15[3] = &unk_1E5929F20;
  v15[4] = self;
  id v16 = v4;
  id v13 = v4;
  [(BKSApplicationStateMonitor *)appStateMonitor applicationInfoForApplication:v12 completion:v15];
  [(AFUIApplicationSiriTaskDeliverer *)self _invalidateAssertionTimer];
  bKSAssertionForBgLaunch = self->_bKSAssertionForBgLaunch;
  self->_bKSAssertionForBgLaunch = 0;
}

void __78__AFUIApplicationSiriTaskDeliverer__processAssertionWasInvalidatedForRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _LogAppStateInfo(v3);
  if (!v3
    || (getSBApplicationStateKey(),
        id v4 = objc_claimAutoreleasedReturnValue(),
        _SafelyGetObject(v3, (uint64_t)v4),
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5)
    || (unsigned int v6 = [v5 unsignedIntValue], v5, v6 <= 1))
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      int v13 = 136315394;
      __int16 v14 = "-[AFUIApplicationSiriTaskDeliverer _processAssertionWasInvalidatedForRequest:]_block_invoke";
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@ appears to have crashed", (uint8_t *)&v13, 0x16u);
    }
    id v8 = +[AFAnalytics sharedAnalytics];
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "_af_analyticsContextDescription");
    [v8 logEventWithType:505 context:v9];

    __int16 v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kAFAssistantErrorDomain" code:706 userInfo:MEMORY[0x1E4F1CC08]];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [WeakRetained handleFailureOfRequest:*(void *)(a1 + 40) error:v10 atTime:0];
  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; %@>",
                       objc_opt_class(),
                       self,
                       self->_appBundleIdentifier);
}

- (void)_startAppStateMonitoringForRequest:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_appBundleIdentifier;
  id v6 = objc_alloc((Class)getBKSApplicationStateMonitorClass());
  v16[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v8 = (BKSApplicationStateMonitor *)[v6 initWithBundleIDs:v7 states:getBKSApplicationStateAll()];
  appStateMonitor = self->_appStateMonitor;
  self->_appStateMonitor = v8;

  if (self->_appStateMonitor)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__AFUIApplicationSiriTaskDeliverer__startAppStateMonitoringForRequest___block_invoke;
    v12[3] = &unk_1E5929EF8;
    id v13 = v4;
    __int16 v10 = (void *)MEMORY[0x19F3A50D0](v12);
    [(BKSApplicationStateMonitor *)self->_appStateMonitor setHandler:v10];
    [(BKSApplicationStateMonitor *)self->_appStateMonitor applicationInfoForApplication:v5 completion:v10];
  }
  else
  {
    id v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v15 = "-[AFUIApplicationSiriTaskDeliverer _startAppStateMonitoringForRequest:]";
      _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s Unable to start app state monitoring because BKSApplicationStateMonitor is nil.", buf, 0xCu);
    }
  }
}

void __71__AFUIApplicationSiriTaskDeliverer__startAppStateMonitoringForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = *(id *)(a1 + 32);
  _LogAppStateInfo(v11);
  id v4 = objc_msgSend(v3, "_af_analyticsContextDescription");

  uint64_t v5 = getSBApplicationStateKey();
  id v6 = _SafelyGetObject(v11, (uint64_t)v5);

  id v7 = AFDescriptionOfBKSApplicationState([v6 unsignedIntValue]);
  [v4 setObject:v7 forKeyedSubscript:@"appState"];

  id v8 = getBKSApplicationStateAppIsFrontmostKey();
  uint64_t v9 = _SafelyGetObject(v11, (uint64_t)v8);

  if (v9) {
    [v4 setObject:v9 forKeyedSubscript:@"appIsFrontmost"];
  }
  __int16 v10 = +[AFAnalytics sharedAnalytics];
  [v10 logEventWithType:504 context:v4];
}

- (void)dealloc
{
  [(AFUIApplicationSiriTaskDeliverer *)self _invalidateAssertionTimer];
  [(AFUIApplicationSiriTaskDeliverer *)self _invalidateBackboardServices];
  v3.receiver = self;
  v3.super_class = (Class)AFUIApplicationSiriTaskDeliverer;
  [(AFUIApplicationSiriTaskDeliverer *)&v3 dealloc];
}

- (AFUIApplicationSiriTaskDeliverer)initWithAppBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"AFUIApplicationSiriTaskDeliverer.m", 90, @"Invalid parameter not satisfying: %@", @"appBundleIdentifier" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)AFUIApplicationSiriTaskDeliverer;
  id v6 = [(AFUIApplicationSiriTaskDeliverer *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    appBundleIdentifier = v6->_appBundleIdentifier;
    v6->_appBundleIdentifier = (NSString *)v7;

    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("AFUIApplicationSiriTaskDeliverer", v9);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    dispatch_group_t v12 = dispatch_group_create();
    bKSAssertionSetupGroup = v6->_bKSAssertionSetupGroup;
    v6->_bKSAssertionSetupGroup = (OS_dispatch_group *)v12;
  }
  return v6;
}

@end