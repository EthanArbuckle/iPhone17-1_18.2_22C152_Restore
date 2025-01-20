@interface DBApplicationSceneHostViewController
- (BSInvalidatable)layoutElementAssertion;
- (DBApplicationSceneHostViewControllerDelegate)delegate;
- (id)_displayLayoutElementIdentifier;
- (id)sceneIdentifier;
- (id)sceneSpecification;
- (void)_requestDestroy;
- (void)activateSceneWithSettings:(id)a3 completion:(id)a4;
- (void)backgroundSceneWithCompletion:(id)a3;
- (void)deactivateSceneWithReasonMask:(unint64_t)a3;
- (void)dealloc;
- (void)foregroundSceneWithSettings:(id)a3 completion:(id)a4;
- (void)sceneContentStateDidUpdate:(int64_t)a3;
- (void)sceneDidInvalidate;
- (void)setDelegate:(id)a3;
- (void)setLayoutElementAssertion:(id)a3;
@end

@implementation DBApplicationSceneHostViewController

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(DBApplicationSceneHostViewController *)self layoutElementAssertion];

  if (v3)
  {
    v4 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      v7 = [(DBSceneHostViewController *)self application];
      *(_DWORD *)buf = 138543618;
      v11 = v6;
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deactivating layout element for application: %@", buf, 0x16u);
    }
    v8 = [(DBApplicationSceneHostViewController *)self layoutElementAssertion];
    [v8 invalidate];
  }
  v9.receiver = self;
  v9.super_class = (Class)DBApplicationSceneHostViewController;
  [(DBApplicationSceneHostViewController *)&v9 dealloc];
}

- (void)foregroundSceneWithSettings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 isSuspended];
  uint64_t v9 = [v6 waitForCommit];
  [v6 failInterval];
  double v11 = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__DBApplicationSceneHostViewController_foregroundSceneWithSettings_completion___block_invoke;
  aBlock[3] = &unk_2649B59C8;
  char v20 = v8;
  aBlock[4] = self;
  id v19 = v6;
  id v12 = v6;
  v13 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__DBApplicationSceneHostViewController_foregroundSceneWithSettings_completion___block_invoke_125;
  v15[3] = &unk_2649B59F0;
  char v17 = v8;
  v15[4] = self;
  id v16 = v7;
  id v14 = v7;
  [(DBSceneHostViewController *)self performSceneUpdateWithBlock:v13 waitsForSceneCommit:v9 timeout:v15 completion:v11];
}

uint64_t __79__DBApplicationSceneHostViewController_foregroundSceneWithSettings_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(a1 + 48))
  {
LABEL_6:
    uint64_t v8 = 1;
    goto LABEL_8;
  }
  if ([v5 isForeground])
  {
    id v7 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__DBApplicationSceneHostViewController_foregroundSceneWithSettings_completion___block_invoke_cold_1(a1, v7);
    }

    goto LABEL_6;
  }
  uint64_t v8 = 0;
LABEL_8:
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v10 = v9;
  objc_msgSend(v6, "setForTesting:", objc_msgSend(*(id *)(a1 + 40), "forTesting"));
  [v6 setUserLaunchEventTime:v10];
  double v11 = [*(id *)(a1 + 40) actions];

  if (v11)
  {
    double v11 = [*(id *)(a1 + 40) actions];
    id v12 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      int v27 = 138543618;
      v28 = v14;
      __int16 v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Attaching actions to scene update: %@", (uint8_t *)&v27, 0x16u);
    }
  }
  v15 = [*(id *)(a1 + 40) url];
  if (v15)
  {
    id v16 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      char v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      int v27 = 138543618;
      v28 = v18;
      __int16 v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_22D6F0000, v16, OS_LOG_TYPE_INFO, "[%{public}@] Attaching URL to scene update: %@", (uint8_t *)&v27, 0x16u);
    }
    id v19 = (void *)[objc_alloc(MEMORY[0x263F829E0]) initWithURL:v15];
    if (v11)
    {
      uint64_t v20 = [v11 setByAddingObject:v19];

      double v11 = (void *)v20;
    }
    else
    {
      double v11 = [MEMORY[0x263EFFA08] setWithObject:v19];
    }
  }
  if ([v11 count]) {
    [v6 setActions:v11];
  }
  v21 = [*(id *)(a1 + 32) proxyApplication];

  if (v21)
  {
    objc_opt_class();
    id v22 = v5;
    if (v22 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }

    v24 = [*(id *)(a1 + 32) application];
    v25 = [v24 bundleIdentifier];
    [v23 setProxiedApplicationBundleIdentifier:v25];
  }
  return v8;
}

uint64_t __79__DBApplicationSceneHostViewController_foregroundSceneWithSettings_completion___block_invoke_125(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) application];
  v3 = +[DBApplicationController sharedInstance];
  v4 = [v3 inCallServiceApplication];

  if (!*(unsigned char *)(a1 + 48))
  {
    if (v2 == v4) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    id v6 = objc_alloc(MEMORY[0x263F3F718]);
    id v7 = [*(id *)(a1 + 32) _displayLayoutElementIdentifier];
    uint64_t v8 = (void *)[v6 initWithIdentifier:v7];

    double v9 = [*(id *)(a1 + 32) application];
    double v10 = [v9 bundleIdentifier];
    [v8 setBundleIdentifier:v10];

    [v8 setUIApplicationElement:1];
    [*(id *)(a1 + 32) sceneFrame];
    objc_msgSend(v8, "setReferenceFrame:");
    [v8 setLevel:v5];
    double v11 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 32) application];
      int v20 = 138412290;
      v21 = v12;
      _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Activating layout element for application: %@", (uint8_t *)&v20, 0xCu);
    }
    v13 = [*(id *)(a1 + 32) layoutElementAssertion];

    if (v13)
    {
      id v14 = [*(id *)(a1 + 32) layoutElementAssertion];
      [v14 invalidate];
    }
    v15 = [*(id *)(a1 + 32) environment];
    id v16 = [v15 environmentConfiguration];
    char v17 = [v16 displayLayoutPublisher];
    v18 = [v17 addElement:v8];
    [*(id *)(a1 + 32) setLayoutElementAssertion:v18];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)backgroundSceneWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__DBApplicationSceneHostViewController_backgroundSceneWithCompletion___block_invoke;
  v8[3] = &unk_2649B4598;
  v8[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__DBApplicationSceneHostViewController_backgroundSceneWithCompletion___block_invoke_2;
  v6[3] = &unk_2649B5A18;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(DBSceneHostViewController *)self performSceneUpdateWithBlock:v8 completion:v6];
}

uint64_t __70__DBApplicationSceneHostViewController_backgroundSceneWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) proxyApplication];

  if (v4)
  {
    objc_opt_class();
    id v5 = v3;
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    id v7 = [*(id *)(a1 + 32) application];
    uint64_t v8 = [v7 bundleIdentifier];
    [v6 setProxiedApplicationBundleIdentifier:v8];
  }
  return 0;
}

uint64_t __70__DBApplicationSceneHostViewController_backgroundSceneWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) layoutElementAssertion];

  if (v2)
  {
    id v3 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) application];
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Deactivating layout element for application: %@", (uint8_t *)&v7, 0xCu);
    }
    id v5 = [*(id *)(a1 + 32) layoutElementAssertion];
    [v5 invalidate];

    [*(id *)(a1 + 32) setLayoutElementAssertion:0];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)activateSceneWithSettings:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  uint64_t v8 = [v6 actions];

  if (v8)
  {
    uint64_t v8 = [v6 actions];
    uint64_t v9 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      double v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543618;
      v26 = v11;
      __int16 v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_INFO, "[%{public}@] Attaching actions to scene activation: %@", buf, 0x16u);
    }
  }
  id v12 = [v6 url];
  if (v12)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263F829E0]) initWithURL:v12];
    id v14 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      __int16 v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_22D6F0000, v14, OS_LOG_TYPE_INFO, "[%{public}@] Attaching URL to scene activation: %@", buf, 0x16u);
    }
    if (v8)
    {
      uint64_t v17 = [v8 setByAddingObject:v13];

      uint64_t v8 = (void *)v17;
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263EFFA08] setWithObject:v13];
    }
  }
  v18 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = (objc_class *)objc_opt_class();
    int v20 = NSStringFromClass(v19);
    v21 = [(DBSceneHostViewController *)self application];
    *(_DWORD *)buf = 138543618;
    v26 = v20;
    __int16 v27 = 2112;
    v28 = v21;
    _os_log_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_INFO, "[%{public}@] Activating scene for application: %@", buf, 0x16u);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __77__DBApplicationSceneHostViewController_activateSceneWithSettings_completion___block_invoke;
  v23[3] = &unk_2649B5A40;
  id v24 = v8;
  id v22 = v8;
  [(DBSceneHostViewController *)self updateSceneSettingsWithTransitionBlock:v23];
  v7[2](v7);
}

void __77__DBApplicationSceneHostViewController_activateSceneWithSettings_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  [a2 setDeactivationReasons:0];
  if ([*(id *)(a1 + 32) count])
  {
    [v6 setActions:*(void *)(a1 + 32)];
    id v5 = [MEMORY[0x263F29CB8] processHandle];
    [v6 setOriginatingProcess:v5];
  }
}

- (void)deactivateSceneWithReasonMask:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    uint64_t v8 = [(DBSceneHostViewController *)self application];
    *(_DWORD *)buf = 138543874;
    double v11 = v7;
    __int16 v12 = 2112;
    v13 = v8;
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_INFO, "[%{public}@] Deactivating scene for application: %@, reasonMask: %ld", buf, 0x20u);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__DBApplicationSceneHostViewController_deactivateSceneWithReasonMask___block_invoke;
  v9[3] = &__block_descriptor_40_e50_v16__0__UIMutableCarPlayApplicationSceneSettings_8l;
  v9[4] = a3;
  [(DBSceneHostViewController *)self updateSceneSettingsWithBlock:v9];
}

uint64_t __70__DBApplicationSceneHostViewController_deactivateSceneWithReasonMask___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeactivationReasons:*(void *)(a1 + 32)];
}

- (id)sceneIdentifier
{
  id v3 = [(DBSceneHostViewController *)self environment];
  id v4 = [(DBSceneHostViewController *)self application];
  id v5 = [v3 sceneIdentifierForApplication:v4];

  return v5;
}

- (id)sceneSpecification
{
  v11[3] = *MEMORY[0x263EF8340];
  id v3 = [(DBSceneHostViewController *)self proxyApplication];

  if (v3)
  {
    id v4 = (objc_class *)MEMORY[0x263F31558];
  }
  else
  {
    v11[0] = @"com.apple.SafeAreaTester";
    v11[1] = @"com.apple.Maps";
    v11[2] = @"com.apple.NightModeTester";
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
    id v6 = [(DBSceneHostViewController *)self application];
    int v7 = [v6 bundleIdentifier];
    int v8 = [v5 containsObject:v7];

    if (v8) {
      id v4 = (objc_class *)MEMORY[0x263F31430];
    }
    else {
      id v4 = (objc_class *)MEMORY[0x263F82480];
    }
  }
  id v9 = objc_alloc_init(v4);
  return v9;
}

- (void)sceneDidInvalidate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = [(DBApplicationSceneHostViewController *)self sceneIdentifier];
    int v7 = 138543618;
    int v8 = v5;
    __int16 v9 = 2114;
    double v10 = v6;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_INFO, "[%{public}@] Did destroy scene: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(DBSceneHostViewController *)self invalidate];
  [(DBApplicationSceneHostViewController *)self _requestDestroy];
}

- (void)sceneContentStateDidUpdate:(int64_t)a3
{
  id v5 = [(DBApplicationSceneHostViewController *)self delegate];
  [v5 applicationSceneHostViewController:self didUpdateSceneContentState:a3];
}

- (id)_displayLayoutElementIdentifier
{
  id v3 = [(DBSceneHostViewController *)self application];
  id v4 = [v3 appPolicy];

  if (([v4 launchUsingMusicUIService] & 1) != 0
    || ([v4 canDisplayOnCarScreen] & 1) != 0
    || ([(DBSceneHostViewController *)self application],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 info],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 supportsBackgroundMode:*MEMORY[0x263F833D0]],
        v6,
        v5,
        !v7))
  {
    int v8 = [(DBApplicationSceneHostViewController *)self sceneIdentifier];
  }
  else
  {
    int v8 = @"com.apple.now-playing";
  }
  __int16 v9 = v8;

  return v9;
}

- (void)_requestDestroy
{
  id v6 = objc_alloc_init(DBMutableWorkspaceStateChangeRequest);
  id v3 = [(DBSceneHostViewController *)self application];
  [(DBMutableWorkspaceStateChangeRequest *)v6 destroyApplication:v3];

  id v4 = [(DBSceneHostViewController *)self environment];
  id v5 = [v4 workspace];
  [v5 requestStateChange:v6];
}

- (DBApplicationSceneHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBApplicationSceneHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BSInvalidatable)layoutElementAssertion
{
  return self->_layoutElementAssertion;
}

- (void)setLayoutElementAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutElementAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __79__DBApplicationSceneHostViewController_foregroundSceneWithSettings_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Suspended launch requested, but the app is foregrounded. Treating the request as foreground.", (uint8_t *)&v5, 0xCu);
}

@end