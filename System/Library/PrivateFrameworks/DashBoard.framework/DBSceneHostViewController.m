@interface DBSceneHostViewController
- (BOOL)isInvalidated;
- (BOOL)isPersistent;
- (BOOL)isScenePresenterInvalidated;
- (BOOL)sceneIsForeground;
- (BOOL)usesHostContextSnapshotting;
- (CGRect)sceneFrame;
- (DBApplication)application;
- (DBApplication)proxyApplication;
- (DBEnvironment)environment;
- (DBSceneHostViewController)initWithApplication:(id)a3 environment:(id)a4;
- (DBSceneHostViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5;
- (FBApplicationUpdateScenesTransaction)transaction;
- (FBScene)scene;
- (NSMutableDictionary)secondaryScenePresentersByIdentifier;
- (NSString)sceneIdentifier;
- (NSString)scenePresentationIdentifier;
- (NSString)workspaceIdentifier;
- (NSTimer)transactionRetryTimer;
- (RBSProcessIdentity)processIdentity;
- (UIApplicationStarkSceneSpecification)sceneSpecification;
- (UIEdgeInsets)sceneSafeAreaInsets;
- (UIScenePresentation)sceneHostView;
- (UIScenePresenter)scenePresenter;
- (double)transactionRetryDelay;
- (id)presentationViewWithIdentifier:(id)a3;
- (int64_t)sceneContentState;
- (int64_t)sceneInterfaceStyle;
- (int64_t)sceneMapInterfaceStyle;
- (unint64_t)hostedAppCrashTally;
- (unint64_t)persistentSceneCrashLimit;
- (unint64_t)proxyAppCrashTally;
- (void)_installScenePresentationView;
- (void)_invalidateTransactionRetryTimer;
- (void)_performSceneUpdateForeground:(BOOL)a3 settings:(id)a4 transitionContext:(id)a5 waitsForSceneCommit:(BOOL)a6 timeout:(double)a7 completion:(id)a8;
- (void)_postTransactionUpdateSceneSettingsForScene:(id)a3;
- (void)_scheduleTransactionRetryForeground:(BOOL)a3 settings:(id)a4 transitionContext:(id)a5 waitsForSceneCommit:(BOOL)a6 timeout:(double)a7;
- (void)_updateSceneUI;
- (void)invalidate;
- (void)invalidatePresentationViewForIdentifier:(id)a3;
- (void)invalidateScene;
- (void)invalidateScenePresenter;
- (void)performSceneUpdateWithBlock:(id)a3 completion:(id)a4;
- (void)performSceneUpdateWithBlock:(id)a3 waitsForSceneCommit:(BOOL)a4 timeout:(double)a5 completion:(id)a6;
- (void)processMonitor:(id)a3 shouldHandleDeathOfBundleIdentifier:(id)a4 isCrash:(BOOL)a5;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneManager:(id)a3 didAddScene:(id)a4;
- (void)sendSceneActions:(id)a3;
- (void)setHostedAppCrashTally:(unint64_t)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setProxyAppCrashTally:(unint64_t)a3;
- (void)setScene:(id)a3;
- (void)setSceneHostView:(id)a3;
- (void)setScenePresentationIdentifier:(id)a3;
- (void)setScenePresenter:(id)a3;
- (void)setScenePresenterInvalidated:(BOOL)a3;
- (void)setSecondaryScenePresentersByIdentifier:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setTransactionRetryDelay:(double)a3;
- (void)setTransactionRetryTimer:(id)a3;
- (void)updateSceneSettingsWithBlock:(id)a3;
- (void)updateSceneSettingsWithTransitionBlock:(id)a3;
@end

@implementation DBSceneHostViewController

- (DBSceneHostViewController)initWithApplication:(id)a3 environment:(id)a4
{
  return [(DBSceneHostViewController *)self initWithApplication:a3 proxyApplication:0 environment:a4];
}

- (DBSceneHostViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)DBSceneHostViewController;
  v12 = [(DBSceneHostViewController *)&v24 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_application, a3);
    objc_storeStrong((id *)&v13->_proxyApplication, a4);
    objc_storeWeak((id *)&v13->_environment, v11);
    v13->_invalidated = 0;
    v13->_hostedAppCrashTally = 0;
    v13->_proxyAppCrashTally = 0;
    v14 = NSString;
    v15 = [MEMORY[0x263F29C40] descriptionForObject:v13];
    uint64_t v16 = [v14 stringWithFormat:@"%@-%u", v15, ++counter_0];
    scenePresentationIdentifier = v13->_scenePresentationIdentifier;
    v13->_scenePresentationIdentifier = (NSString *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    secondaryScenePresentersByIdentifier = v13->_secondaryScenePresentersByIdentifier;
    v13->_secondaryScenePresentersByIdentifier = v18;

    v20 = [MEMORY[0x263F3F4F0] sharedInstance];
    [v20 addObserver:v13];

    v21 = [v11 environmentConfiguration];
    v22 = [v21 processMonitor];
    [v22 addObserver:v13];

    v13->_scenePresenterInvalidated = 1;
  }

  return v13;
}

- (BOOL)sceneIsForeground
{
  v3 = [(DBSceneHostViewController *)self scene];
  if (v3)
  {
    v4 = [(DBSceneHostViewController *)self scene];
    v5 = [v4 settings];
    char v6 = [v5 isForeground];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (int64_t)sceneContentState
{
  v3 = [(DBSceneHostViewController *)self scene];
  if (v3)
  {
    v4 = [(DBSceneHostViewController *)self scene];
    int64_t v5 = [v4 contentState];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)performSceneUpdateWithBlock:(id)a3 completion:(id)a4
{
}

- (void)performSceneUpdateWithBlock:(id)a3 waitsForSceneCommit:(BOOL)a4 timeout:(double)a5 completion:(id)a6
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v9 = (uint64_t (**)(id, void *, id))a3;
  id v10 = (void (**)(id, void *))a6;
  if ([(DBSceneHostViewController *)self isInvalidated])
  {
    if (v10)
    {
      id v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = 6;
LABEL_11:
      v22 = [v11 errorWithDomain:@"DBSceneHostErrorDomain" code:v12 userInfo:0];
      v10[2](v10, v22);
    }
  }
  else
  {
    v13 = [(DBSceneHostViewController *)self environment];
    v14 = [v13 displayConfiguration];

    if (v14)
    {
      v15 = [(DBSceneHostViewController *)self sceneSpecification];
      id v16 = objc_alloc_init((Class)[v15 transitionContextClass]);
      v17 = [(DBSceneHostViewController *)self scene];

      double v87 = a5;
      if (v17)
      {
        id v18 = [(DBSceneHostViewController *)self scene];
        v19 = [v18 settings];
        v20 = (void *)[v19 mutableCopy];
      }
      else
      {
        id v18 = objc_alloc_init((Class)[v15 settingsClass]);
        v20 = (void *)[v18 mutableCopy];
      }

      v23 = [(DBSceneHostViewController *)self environment];
      objc_super v24 = [v23 displayConfiguration];
      [v20 setDisplayConfiguration:v24];

      [v20 setLevel:1.0];
      [v20 setInterfaceOrientation:1];
      [(DBSceneHostViewController *)self sceneFrame];
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      [(DBSceneHostViewController *)self sceneSafeAreaInsets];
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      v41 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        v44 = [(DBSceneHostViewController *)self application];
        v97.origin.x = v26;
        v97.origin.y = v28;
        v97.size.width = v30;
        v97.size.height = v32;
        NSStringFromCGRect(v97);
        v86 = v10;
        v45 = v9;
        id v46 = v16;
        v48 = v47 = v15;
        v98.top = v34;
        v98.left = v36;
        v98.bottom = v38;
        v98.right = v40;
        v49 = NSStringFromUIEdgeInsets(v98);
        *(_DWORD *)buf = 138544130;
        v89 = v43;
        __int16 v90 = 2112;
        v91 = v44;
        __int16 v92 = 2114;
        int64_t v93 = (int64_t)v48;
        __int16 v94 = 2114;
        v95 = v49;
        _os_log_impl(&dword_22D6F0000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scene update for app: %@ - frame: %{public}@, safe area insets: %{public}@", buf, 0x2Au);

        v15 = v47;
        id v16 = v46;
        id v9 = v45;
        id v10 = v86;
      }
      objc_msgSend(v20, "setFrame:", v26, v28, v30, v32);
      objc_msgSend(v20, "setSafeAreaInsetsPortrait:", v34, v36, v38, v40);
      int64_t v50 = [(DBSceneHostViewController *)self sceneInterfaceStyle];
      if (v50)
      {
        int64_t v51 = v50;
        v52 = DBLogForCategory(0x10uLL);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = (objc_class *)objc_opt_class();
          v54 = NSStringFromClass(v53);
          v55 = [(DBSceneHostViewController *)self application];
          *(_DWORD *)buf = 138543874;
          v89 = v54;
          __int16 v90 = 2112;
          v91 = v55;
          __int16 v92 = 2048;
          int64_t v93 = v51;
          _os_log_impl(&dword_22D6F0000, v52, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scene update for app: %@ to style %ld", buf, 0x20u);
        }
        [v20 setUserInterfaceStyle:v51];
      }
      v56 = [(DBSceneHostViewController *)self environment];
      char v57 = objc_opt_respondsToSelector();

      if (v57)
      {
        v58 = [(DBSceneHostViewController *)self environment];
        objc_msgSend(v20, "setDisableFiveRowKeyboards:", objc_msgSend(v58, "shouldDisableFiveRowKeyboards"));
      }
      int64_t v59 = [(DBSceneHostViewController *)self sceneMapInterfaceStyle];
      if (v59)
      {
        int64_t v60 = v59;
        if ([v20 conformsToProtocol:&unk_26E239858])
        {
          v61 = DBLogForCategory(0x10uLL);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            v62 = (objc_class *)objc_opt_class();
            v63 = NSStringFromClass(v62);
            v64 = [(DBSceneHostViewController *)self application];
            *(_DWORD *)buf = 138543874;
            v89 = v63;
            __int16 v90 = 2112;
            v91 = v64;
            __int16 v92 = 2048;
            int64_t v93 = v60;
            _os_log_impl(&dword_22D6F0000, v61, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scene update for app: %@ to map style %ld", buf, 0x20u);
          }
          [v20 setMapStyle:v60];
        }
      }
      if ([v20 conformsToProtocol:&unk_26E239A40])
      {
        v65 = [(DBSceneHostViewController *)self environment];
        v66 = [v65 environmentConfiguration];
        v67 = [v66 thermalMonitor];
        v68 = [v67 suggestedFrameRateLimit];

        v69 = DBLogForCategory(6uLL);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          v70 = (objc_class *)objc_opt_class();
          v71 = NSStringFromClass(v70);
          *(_DWORD *)buf = 138543618;
          v89 = v71;
          __int16 v90 = 2114;
          v91 = v68;
          _os_log_impl(&dword_22D6F0000, v69, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scene update setting frame rate limit: %{public}@", buf, 0x16u);
        }
        [v20 setFrameRateLimit:v68];
      }
      uint64_t v72 = v9[2](v9, v20, v16);
      [v20 setForeground:v72];
      v73 = [MEMORY[0x263F3F4F0] sharedInstance];
      v74 = [(DBSceneHostViewController *)self sceneIdentifier];
      v75 = [v73 sceneWithIdentifier:v74];
      scene = self->_scene;
      self->_scene = v75;

      [(FBScene *)self->_scene addObserver:self];
      v77 = (void *)[v20 copy];
      [(DBSceneHostViewController *)self _performSceneUpdateForeground:v72 settings:v77 transitionContext:v16 waitsForSceneCommit:0 timeout:v10 completion:v87];

      [(DBSceneHostViewController *)self setScenePresenterInvalidated:0];
      uint64_t v78 = [(DBSceneHostViewController *)self scene];
      if (v78)
      {
        v79 = (void *)v78;
        v80 = [(DBSceneHostViewController *)self scenePresenter];

        if (!v80)
        {
          v81 = DBLogForCategory(6uLL);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            v82 = (objc_class *)objc_opt_class();
            v83 = NSStringFromClass(v82);
            v84 = [(DBSceneHostViewController *)self scene];
            v85 = [v84 identifier];
            *(_DWORD *)buf = 138543618;
            v89 = v83;
            __int16 v90 = 2114;
            v91 = v85;
            _os_log_impl(&dword_22D6F0000, v81, OS_LOG_TYPE_DEFAULT, "[%{public}@] Recreating presenter for scene %{public}@", buf, 0x16u);
          }
          [(DBSceneHostViewController *)self _installScenePresentationView];
        }
      }
    }
    else
    {
      v21 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[DBSceneHostViewController performSceneUpdateWithBlock:waitsForSceneCommit:timeout:completion:]();
      }

      if (v10)
      {
        id v11 = (void *)MEMORY[0x263F087E8];
        uint64_t v12 = 2;
        goto LABEL_11;
      }
    }
  }
}

- (void)updateSceneSettingsWithBlock:(id)a3
{
  id v4 = a3;
  if (self->_scene)
  {
    int64_t v5 = [(DBSceneHostViewController *)self scene];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__DBSceneHostViewController_updateSceneSettingsWithBlock___block_invoke;
    v6[3] = &unk_2649B69E0;
    id v7 = v4;
    [v5 updateUISettingsWithBlock:v6];
  }
}

void __58__DBSceneHostViewController_updateSceneSettingsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      int64_t v5 = v7;
    }
    else {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)updateSceneSettingsWithTransitionBlock:(id)a3
{
  id v4 = a3;
  if (self->_scene)
  {
    int64_t v5 = [MEMORY[0x263F82468] transitionContext];
    id v6 = [(DBSceneHostViewController *)self scene];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __68__DBSceneHostViewController_updateSceneSettingsWithTransitionBlock___block_invoke;
    v8[3] = &unk_2649B6A08;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    [v6 updateUISettingsWithTransitionBlock:v8];
  }
}

id __68__DBSceneHostViewController_updateSceneSettingsWithTransitionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v8 = *(id *)(a1 + 32);

  return v8;
}

- (void)sendSceneActions:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(DBSceneHostViewController *)self scene];

  if (v4)
  {
    id v5 = [(DBSceneHostViewController *)self scene];
    [v5 sendActions:v6];
  }
}

- (void)invalidateScene
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(DBSceneHostViewController *)self scene];

  if (v3)
  {
    uint64_t v4 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = [(DBSceneHostViewController *)self scene];
      id v8 = [v7 identifier];
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating scene %{public}@", (uint8_t *)&v10, 0x16u);
    }
    id v9 = [(DBSceneHostViewController *)self scene];
    [v9 invalidate];
  }
}

- (void)invalidateScenePresenter
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(DBSceneHostViewController *)self scenePresenter];

  if (v3)
  {
    uint64_t v4 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      id v7 = [(DBSceneHostViewController *)self scene];
      id v8 = [v7 identifier];
      int v12 = 138543618;
      v13 = v6;
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating presenter for scene %{public}@", (uint8_t *)&v12, 0x16u);
    }
    id v9 = [(DBSceneHostViewController *)self scenePresenter];
    [v9 deactivate];

    int v10 = [(DBSceneHostViewController *)self scenePresenter];
    [v10 invalidate];

    [(DBSceneHostViewController *)self setScenePresenter:0];
    id v11 = [(DBSceneHostViewController *)self sceneHostView];
    [v11 removeFromSuperview];

    [(DBSceneHostViewController *)self setSceneHostView:0];
    [(DBSceneHostViewController *)self setScenePresenterInvalidated:1];
  }
}

- (id)presentationViewWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSceneHostViewController *)self secondaryScenePresentersByIdentifier];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = [(DBSceneHostViewController *)self scene];
    if (v6)
    {
      __int16 v14 = [(DBSceneHostViewController *)self scene];
      v15 = [v14 uiPresentationManager];
      char v16 = [v15 isInvalidated];

      if (v16)
      {
        id v6 = 0;
      }
      else
      {
        v17 = [(DBSceneHostViewController *)self scene];
        id v18 = [v17 uiPresentationManager];
        id v6 = [v18 createPresenterWithIdentifier:v4 priority:100];

        [v6 modifyPresentationContext:&__block_literal_global_41];
        v19 = [(DBSceneHostViewController *)self secondaryScenePresentersByIdentifier];
        objc_msgSend(v19, "bs_setSafeObject:forKey:", v6, v4);
      }
    }
  }
  [v6 activate];
  id v7 = [v6 presentationView];
  id v8 = [(DBSceneHostViewController *)self scene];
  uint64_t v9 = [v8 contentState];

  int v10 = v7;
  if (v9 != 2)
  {
    id v11 = objc_alloc(MEMORY[0x263F82E00]);
    [v7 frame];
    int v10 = objc_msgSend(v11, "initWithFrame:");

    int v12 = [MEMORY[0x263F825C8] tableBackgroundColor];
    [v10 setBackgroundColor:v12];

    [v10 addSubview:v7];
    [v7 setAlpha:0.0];
  }

  return v10;
}

void __60__DBSceneHostViewController_presentationViewWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:1];
  id v3 = [MEMORY[0x263F825C8] tableBackgroundColor];
  [v2 setBackgroundColorWhileHosting:v3];
}

- (void)invalidatePresentationViewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DBSceneHostViewController *)self secondaryScenePresentersByIdentifier];
  id v7 = [v5 objectForKey:v4];

  [v7 invalidate];
  id v6 = [(DBSceneHostViewController *)self secondaryScenePresentersByIdentifier];
  [v6 removeObjectForKey:v4];
}

- (RBSProcessIdentity)processIdentity
{
  id v3 = [(DBSceneHostViewController *)self proxyApplication];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(DBSceneHostViewController *)self application];
  }
  id v6 = v5;

  id v7 = (void *)MEMORY[0x263F64598];
  id v8 = [v6 info];
  uint64_t v9 = [v8 applicationIdentity];
  int v10 = [v7 identityForLSApplicationIdentity:v9];

  return (RBSProcessIdentity *)v10;
}

- (NSString)sceneIdentifier
{
  return 0;
}

- (NSString)workspaceIdentifier
{
  return (NSString *)@"com.apple.DashBoard.scene-workspace.app";
}

- (UIApplicationStarkSceneSpecification)sceneSpecification
{
  id v2 = objc_alloc_init(MEMORY[0x263F82480]);
  return (UIApplicationStarkSceneSpecification *)v2;
}

- (BOOL)isPersistent
{
  return 0;
}

- (unint64_t)persistentSceneCrashLimit
{
  return 5;
}

- (CGRect)sceneFrame
{
  id v3 = [(DBSceneHostViewController *)self environment];
  id v4 = [(DBSceneHostViewController *)self application];
  id v5 = [(DBSceneHostViewController *)self proxyApplication];
  [v3 sceneFrameForApplication:v4 proxyApplication:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (int64_t)sceneInterfaceStyle
{
  id v3 = [(DBSceneHostViewController *)self environment];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(DBSceneHostViewController *)self environment];
  double v6 = [(DBSceneHostViewController *)self application];
  double v7 = [(DBSceneHostViewController *)self proxyApplication];
  int64_t v8 = [v5 sceneInterfaceStyleForApplication:v6 proxyApplication:v7];

  return v8;
}

- (int64_t)sceneMapInterfaceStyle
{
  id v3 = [(DBSceneHostViewController *)self environment];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(DBSceneHostViewController *)self environment];
  double v6 = [(DBSceneHostViewController *)self application];
  double v7 = [(DBSceneHostViewController *)self proxyApplication];
  int64_t v8 = [v5 sceneMapInterfaceStyleForApplication:v6 proxyApplication:v7];

  return v8;
}

- (UIEdgeInsets)sceneSafeAreaInsets
{
  id v3 = [(DBSceneHostViewController *)self environment];
  char v4 = [(DBSceneHostViewController *)self application];
  id v5 = [(DBSceneHostViewController *)self proxyApplication];
  [v3 safeAreaInsetsForApplication:v4 proxyApplication:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)invalidate
{
  [(DBSceneHostViewController *)self setInvalidated:1];
  id v3 = [(DBSceneHostViewController *)self scenePresenter];
  [v3 invalidate];

  [(DBSceneHostViewController *)self setScenePresenter:0];
  char v4 = [(DBSceneHostViewController *)self sceneHostView];
  [v4 removeFromSuperview];

  [(DBSceneHostViewController *)self setSceneHostView:0];
  id v5 = [(DBSceneHostViewController *)self transaction];
  [v5 failWithReason:@"Invalidating"];

  [(DBSceneHostViewController *)self setTransaction:0];
  [(DBSceneHostViewController *)self _invalidateTransactionRetryTimer];
  id v8 = [(DBSceneHostViewController *)self scene];
  [(DBSceneHostViewController *)self setScene:0];
  if (v8)
  {
    [v8 updateSettingsWithBlock:&__block_literal_global_167];
    double v6 = [MEMORY[0x263F3F4F0] sharedInstance];
    double v7 = [v8 identifier];
    [v6 destroyScene:v7 withTransitionContext:0];
  }
}

uint64_t __39__DBSceneHostViewController_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

- (void)processMonitor:(id)a3 shouldHandleDeathOfBundleIdentifier:(id)a4 isCrash:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = [(DBSceneHostViewController *)self application];
  double v9 = [v8 bundleIdentifier];
  int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    double v11 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      v21 = NSStringFromBOOL();
      int v25 = 138543874;
      double v26 = v20;
      __int16 v27 = 2114;
      id v28 = v7;
      __int16 v29 = 2114;
      double v30 = v21;
      _os_log_error_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Hosted process %{public}@ has died (crash: %{public}@)", (uint8_t *)&v25, 0x20u);
    }
    if (v5)
    {
      [(DBSceneHostViewController *)self setHostedAppCrashTally:[(DBSceneHostViewController *)self hostedAppCrashTally] + 1];
      double v12 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[DBSceneHostViewController processMonitor:shouldHandleDeathOfBundleIdentifier:isCrash:](self);
      }
LABEL_14:
    }
  }
  else
  {
    uint64_t v13 = [(DBSceneHostViewController *)self proxyApplication];
    if (v13)
    {
      double v14 = (void *)v13;
      double v15 = [(DBSceneHostViewController *)self proxyApplication];
      double v16 = [v15 bundleIdentifier];
      int v17 = [v7 isEqualToString:v16];

      if (v17)
      {
        id v18 = DBLogForCategory(6uLL);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          objc_super v24 = NSStringFromBOOL();
          int v25 = 138543874;
          double v26 = v23;
          __int16 v27 = 2114;
          id v28 = v7;
          __int16 v29 = 2114;
          double v30 = v24;
          _os_log_error_impl(&dword_22D6F0000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Hosted proxy process %{public}@ has died (crash: %{public}@", (uint8_t *)&v25, 0x20u);
        }
        if (v5)
        {
          [(DBSceneHostViewController *)self setProxyAppCrashTally:[(DBSceneHostViewController *)self proxyAppCrashTally] + 1];
          double v12 = DBLogForCategory(6uLL);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[DBSceneHostViewController processMonitor:shouldHandleDeathOfBundleIdentifier:isCrash:](self);
          }
          goto LABEL_14;
        }
      }
    }
  }
}

- (void)sceneManager:(id)a3 didAddScene:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = v5;
  if (!self->_scene)
  {
    id v7 = [v5 identifier];
    id v8 = [(DBSceneHostViewController *)self sceneIdentifier];
    int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      int v10 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = (objc_class *)objc_opt_class();
        double v12 = NSStringFromClass(v11);
        int v13 = 138543618;
        double v14 = v12;
        __int16 v15 = 2112;
        double v16 = v6;
        _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received scene: %@", (uint8_t *)&v13, 0x16u);
      }
      [(DBSceneHostViewController *)self setScene:v6];
      [v6 addObserver:self];
    }
  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4 = a3;
  [(DBSceneHostViewController *)self _updateSceneUI];
  uint64_t v5 = [v4 contentState];

  [(DBSceneHostViewController *)self sceneContentStateDidUpdate:v5];
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v7 = [a3 uiClientSettings];
  [(DBSceneHostViewController *)self clientSceneSettingsDidUpdate:v7];
}

- (void)sceneDidInvalidate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 settings];
  double v6 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    int v12 = 138543618;
    int v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scene invalidated: %@", (uint8_t *)&v12, 0x16u);
  }
  [(FBScene *)self->_scene removeObserver:self];
  [(DBSceneHostViewController *)self setScene:0];
  [(DBSceneHostViewController *)self sceneDidInvalidate];
  if (![(DBSceneHostViewController *)self isInvalidated]
    && [(DBSceneHostViewController *)self isPersistent])
  {
    int v9 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      int v12 = 138543362;
      int v13 = v11;
      _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scene is persistent, re-creating...", (uint8_t *)&v12, 0xCu);
    }
    -[DBSceneHostViewController _performSceneUpdateForeground:settings:transitionContext:waitsForSceneCommit:timeout:completion:](self, "_performSceneUpdateForeground:settings:transitionContext:waitsForSceneCommit:timeout:completion:", [v5 isForeground], v5, 0, 0, 0, 0.0);
  }
}

- (void)setScene:(id)a3
{
  id v8 = a3;
  [(UIScenePresenter *)self->_scenePresenter invalidate];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  double v6 = [(DBSceneHostViewController *)self sceneHostView];
  [v6 removeFromSuperview];

  [(DBSceneHostViewController *)self setSceneHostView:0];
  scene = self->_scene;
  self->_scene = 0;

  if (v8)
  {
    objc_storeStrong((id *)&self->_scene, a3);
    if (![(DBSceneHostViewController *)self isScenePresenterInvalidated]) {
      [(DBSceneHostViewController *)self _installScenePresentationView];
    }
  }
}

- (void)_updateSceneUI
{
  id v3 = [(DBSceneHostViewController *)self scene];
  uint64_t v4 = [v3 contentState];

  uint64_t v5 = [(DBSceneHostViewController *)self secondaryScenePresentersByIdentifier];
  double v6 = v5;
  if (v4 == 2)
  {
    [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_170];

    id v7 = (void *)MEMORY[0x263F82E00];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __43__DBSceneHostViewController__updateSceneUI__block_invoke_3;
    id v18 = &unk_2649B3E90;
    v19 = self;
    double v8 = 0.25;
    int v9 = &v15;
  }
  else
  {
    [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_173_0];

    id v7 = (void *)MEMORY[0x263F82E00];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    int v12 = __43__DBSceneHostViewController__updateSceneUI__block_invoke_6;
    int v13 = &unk_2649B3E90;
    __int16 v14 = self;
    double v8 = 0.25;
    int v9 = &v10;
  }
  objc_msgSend(v7, "animateWithDuration:animations:", v9, v8, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
}

void __43__DBSceneHostViewController__updateSceneUI__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 presentationView];
  uint64_t v4 = (void *)MEMORY[0x263F82E00];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__DBSceneHostViewController__updateSceneUI__block_invoke_2;
  v6[3] = &unk_2649B3E90;
  id v7 = v3;
  id v5 = v3;
  [v4 animateWithDuration:v6 animations:0.25];
}

uint64_t __43__DBSceneHostViewController__updateSceneUI__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __43__DBSceneHostViewController__updateSceneUI__block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sceneHostView];
  [v1 setAlpha:1.0];
}

void __43__DBSceneHostViewController__updateSceneUI__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [a3 presentationView];
  uint64_t v4 = (void *)MEMORY[0x263F82E00];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__DBSceneHostViewController__updateSceneUI__block_invoke_5;
  v6[3] = &unk_2649B3E90;
  id v7 = v3;
  id v5 = v3;
  [v4 animateWithDuration:v6 animations:0.25];
}

uint64_t __43__DBSceneHostViewController__updateSceneUI__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __43__DBSceneHostViewController__updateSceneUI__block_invoke_6(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sceneHostView];
  [v1 setAlpha:0.0];
}

- (void)_installScenePresentationView
{
  v34[4] = *MEMORY[0x263EF8340];
  id v3 = [(FBScene *)self->_scene uiPresentationManager];
  uint64_t v4 = [(DBSceneHostViewController *)self scenePresentationIdentifier];
  id v5 = [v3 createPresenterWithIdentifier:v4 priority:1];
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = v5;

  [(UIScenePresenter *)self->_scenePresenter modifyPresentationContext:&__block_literal_global_175];
  [(UIScenePresenter *)self->_scenePresenter activate];
  id v7 = [(UIScenePresenter *)self->_scenePresenter presentationView];
  [(DBSceneHostViewController *)self setSceneHostView:v7];

  double v8 = [(DBSceneHostViewController *)self view];
  int v9 = [(DBSceneHostViewController *)self sceneHostView];
  [v8 addSubview:v9];

  uint64_t v10 = [(DBSceneHostViewController *)self sceneHostView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v23 = (void *)MEMORY[0x263F08938];
  double v32 = [(DBSceneHostViewController *)self sceneHostView];
  double v30 = [v32 leftAnchor];
  uint64_t v31 = [(DBSceneHostViewController *)self view];
  __int16 v29 = [v31 leftAnchor];
  id v28 = [v30 constraintEqualToAnchor:v29];
  v34[0] = v28;
  __int16 v27 = [(DBSceneHostViewController *)self sceneHostView];
  int v25 = [v27 rightAnchor];
  double v26 = [(DBSceneHostViewController *)self view];
  objc_super v24 = [v26 rightAnchor];
  v22 = [v25 constraintEqualToAnchor:v24];
  v34[1] = v22;
  v21 = [(DBSceneHostViewController *)self sceneHostView];
  v20 = [v21 topAnchor];
  uint64_t v11 = [(DBSceneHostViewController *)self view];
  int v12 = [v11 topAnchor];
  int v13 = [v20 constraintEqualToAnchor:v12];
  v34[2] = v13;
  __int16 v14 = [(DBSceneHostViewController *)self sceneHostView];
  uint64_t v15 = [v14 bottomAnchor];
  uint64_t v16 = [(DBSceneHostViewController *)self view];
  uint64_t v17 = [v16 bottomAnchor];
  id v18 = [v15 constraintEqualToAnchor:v17];
  v34[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  [v23 activateConstraints:v19];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__DBSceneHostViewController__installScenePresentationView__block_invoke_2;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__DBSceneHostViewController__installScenePresentationView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:1];
  id v3 = [MEMORY[0x263F825C8] clearColor];
  [v2 setBackgroundColorWhileHosting:v3];
}

void __58__DBSceneHostViewController__installScenePresentationView__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) usesHostContextSnapshotting])
  {
    id v2 = [*(id *)(a1 + 32) sceneHostView];
    id v3 = [v2 _window];
    int v4 = [v3 _contextId];

    id v5 = [*(id *)(a1 + 32) sceneHostView];
    double v6 = [v5 layer];
    uint64_t RenderId = CALayerGetRenderId();

    double v8 = [*(id *)(a1 + 32) scene];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__DBSceneHostViewController__installScenePresentationView__block_invoke_3;
    v10[3] = &unk_2649B6A30;
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = v4;
    v10[4] = v9;
    v10[5] = RenderId;
    [v8 updateUISettingsWithBlock:v10];
  }
}

void __58__DBSceneHostViewController__installScenePresentationView__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 sceneFrame];
  objc_msgSend(v4, "setFrame:");
  [v4 setHostContextIdentifierForSnapshotting:*(unsigned int *)(a1 + 48)];
  [v4 setScenePresenterRenderIdentifierForSnapshotting:*(void *)(a1 + 40)];
}

- (void)_performSceneUpdateForeground:(BOOL)a3 settings:(id)a4 transitionContext:(id)a5 waitsForSceneCommit:(BOOL)a6 timeout:(double)a7 completion:(id)a8
{
  BOOL v10 = a6;
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (void (**)(id, void *))a8;
  if ([(DBSceneHostViewController *)self isInvalidated])
  {
    if (v16)
    {
      uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:@"DBSceneHostErrorDomain" code:6 userInfo:0];
      v16[2](v16, v17);
    }
  }
  else
  {
    unint64_t v18 = [(DBSceneHostViewController *)self hostedAppCrashTally];
    if (v18 >= [(DBSceneHostViewController *)self persistentSceneCrashLimit]
      || (unint64_t v19 = [(DBSceneHostViewController *)self proxyAppCrashTally],
          v19 >= [(DBSceneHostViewController *)self persistentSceneCrashLimit]))
    {
      __int16 v27 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[DBSceneHostViewController _performSceneUpdateForeground:settings:transitionContext:waitsForSceneCommit:timeout:completion:]();
      }

      if (v16)
      {
        id v28 = [MEMORY[0x263F087E8] errorWithDomain:@"DBSceneHostErrorDomain" code:3 userInfo:0];
        v16[2](v16, v28);
      }
    }
    else
    {
      v20 = +[DBApplicationController sharedInstance];
      v21 = [(DBSceneHostViewController *)self application];
      int v22 = [v20 preflightRequiredForApplication:v21];

      if (v22)
      {
        v23 = DBLogForCategory(2uLL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v24 = (objc_class *)objc_opt_class();
          int v25 = NSStringFromClass(v24);
          *(_DWORD *)buf = 138543362;
          __int16 v92 = v25;
          _os_log_impl(&dword_22D6F0000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application requires preflight, ignoring scene update request.", buf, 0xCu);
        }
        if (v16)
        {
          double v26 = [MEMORY[0x263F087E8] errorWithDomain:@"DBSceneHostErrorDomain" code:5 userInfo:0];
          v16[2](v16, v26);
        }
      }
      else
      {
        __int16 v29 = [(DBSceneHostViewController *)self application];
        int v30 = [v29 isLockedOrHidden];

        if (v30)
        {
          uint64_t v31 = DBLogForCategory(6uLL);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            double v32 = (objc_class *)objc_opt_class();
            double v33 = NSStringFromClass(v32);
            *(_DWORD *)buf = 138543362;
            __int16 v92 = v33;
            _os_log_impl(&dword_22D6F0000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application is locked or hidden, ignoring scene update request.", buf, 0xCu);
          }
          if (v16)
          {
            double v34 = [MEMORY[0x263F087E8] errorWithDomain:@"DBSceneHostErrorDomain" code:7 userInfo:0];
            v16[2](v16, v34);
          }
        }
        else
        {
          v69 = [(DBSceneHostViewController *)self processIdentity];
          if (v69)
          {
            double v35 = [(DBSceneHostViewController *)self sceneIdentifier];
            double v36 = (void *)MEMORY[0x263F3F7C8];
            double v37 = [(DBSceneHostViewController *)self workspaceIdentifier];
            v63 = [v36 identityForIdentifier:v35 workspaceIdentifier:v37];

            v67 = [(DBSceneHostViewController *)self sceneSpecification];
            v68 = [MEMORY[0x263F3F768] parametersForSpecification:v67];
            if (!v15) {
              id v15 = objc_alloc_init((Class)[v67 transitionContextClass]);
            }
            [v68 setSettings:v14];
            double v38 = (void *)MEMORY[0x263EFF9C0];
            double v39 = [v15 actions];
            double v40 = objc_msgSend(v38, "setWithCapacity:", objc_msgSend(v39, "count"));

            v41 = (void *)MEMORY[0x263EFF9C0];
            v42 = [v15 actions];
            v43 = objc_msgSend(v41, "setWithCapacity:", objc_msgSend(v42, "count"));

            v44 = [v15 actions];
            v88[0] = MEMORY[0x263EF8330];
            v88[1] = 3221225472;
            v88[2] = __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke;
            v88[3] = &unk_2649B4780;
            id v61 = v43;
            id v89 = v61;
            id v64 = v40;
            id v90 = v64;
            [v44 enumerateObjectsUsingBlock:v88];

            [v15 setActions:v64];
            id v45 = objc_alloc(MEMORY[0x263F3F428]);
            v86[0] = MEMORY[0x263EF8330];
            v86[1] = 3221225472;
            v86[2] = __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_2;
            v86[3] = &__block_descriptor_33_e32___FBProcessExecutionContext_8__0l;
            BOOL v87 = a3;
            id v46 = (void *)[v45 initWithProcessIdentity:v69 executionContextProvider:v86];
            v84[1] = (id)MEMORY[0x263EF8330];
            v84[2] = (id)3221225472;
            v84[3] = __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_3;
            v84[4] = &unk_2649B46F0;
            id v47 = v46;
            id v85 = v47;
            int64_t v60 = BSLogAddStateCaptureBlockWithTitle();
            if (a7 <= 0.0)
            {
              v52 = 0;
            }
            else
            {
              v48 = DBLogForCategory(6uLL);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                v49 = (objc_class *)objc_opt_class();
                int64_t v50 = NSStringFromClass(v49);
                *(_DWORD *)buf = 138543618;
                __int16 v92 = v50;
                __int16 v93 = 2048;
                double v94 = a7;
                _os_log_impl(&dword_22D6F0000, v48, OS_LOG_TYPE_DEFAULT, "[%{public}@] Transaction timeout interval: %f seconds", buf, 0x16u);
              }
              objc_initWeak((id *)buf, self);
              int64_t v51 = (void *)MEMORY[0x263EFFA20];
              v82[0] = MEMORY[0x263EF8330];
              v82[1] = 3221225472;
              v82[2] = __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_194;
              v82[3] = &unk_2649B6A78;
              objc_copyWeak(v84, (id *)buf);
              id v83 = v47;
              v52 = objc_msgSend(v51, "scheduledTimerWithTimeInterval:repeats:block:", 0, v82, a7, v60, v61);

              objc_destroyWeak(v84);
              objc_destroyWeak((id *)buf);
            }
            objc_initWeak(&location, self);
            v70[0] = MEMORY[0x263EF8330];
            v70[1] = 3221225472;
            v70[2] = __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_199;
            v70[3] = &unk_2649B6AC8;
            v70[4] = self;
            id v66 = v35;
            id v71 = v66;
            objc_copyWeak(v78, &location);
            id v54 = v61;
            id v72 = v54;
            BOOL v79 = a3;
            id v73 = v14;
            id v15 = v15;
            id v74 = v15;
            BOOL v80 = v10;
            v78[1] = *(id *)&a7;
            id v55 = v52;
            id v75 = v55;
            v77 = v16;
            id v56 = v60;
            id v76 = v56;
            [v47 setCompletionBlock:v70];
            v62 = v54;
            [v47 setWaitsForSceneCommits:v10];
            [v47 updateSceneWithIdentity:v63 parameters:v68 transitionContext:v15];
            char v57 = DBLogForCategory(6uLL);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              v58 = (objc_class *)objc_opt_class();
              int64_t v59 = NSStringFromClass(v58);
              *(_DWORD *)buf = 138543618;
              __int16 v92 = v59;
              __int16 v93 = 2112;
              double v94 = *(double *)&v47;
              _os_log_impl(&dword_22D6F0000, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting sceneUpdate transaction %@", buf, 0x16u);
            }
            [v47 begin];
            [(DBSceneHostViewController *)self setTransaction:v47];

            objc_destroyWeak(v78);
            objc_destroyWeak(&location);
          }
          else
          {
            v53 = DBLogForCategory(6uLL);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
              -[DBSceneHostViewController _performSceneUpdateForeground:settings:transitionContext:waitsForSceneCommit:timeout:completion:]();
            }

            if (v16)
            {
              v65 = [MEMORY[0x263F087E8] errorWithDomain:@"DBSceneHostErrorDomain" code:1 userInfo:0];
              v16[2](v16, v65);
            }
          }
        }
      }
    }
  }
}

void __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    id v3 = (id *)(a1 + 32);
  }
  else {
    id v3 = (id *)(a1 + 40);
  }
  [*v3 addObject:v4];
}

id __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F3F448]);
  id v3 = v2;
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 2;
  }
  [v2 setLaunchIntent:v4];
  return v3;
}

id __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) debugDescription];
  if (BSLogStateCaptureCheckPlistSizeIsPermitted())
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) description];
  }
  uint64_t v4 = v3;

  return v4;
}

void __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_194(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(a1 + 32);
    int v11 = 138543618;
    int v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fail timer fired for transaction: %@", (uint8_t *)&v11, 0x16u);
  }
  if ([*(id *)(a1 + 32) isRunning])
  {
    id v7 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543618;
      int v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Transaction is running, failing: %@", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(a1 + 32) failWithReason:@"Fail Interval Exceeded"];
  }
}

void __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_199(uint64_t a1, char a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v4 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 40);
    double v8 = NSStringFromBOOL();
    *(_DWORD *)buf = 138543874;
    int v22 = v6;
    __int16 v23 = 2114;
    uint64_t v24 = v7;
    __int16 v25 = 2114;
    double v26 = v8;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] SceneUpdate transaction for scene: %{public}@ completed with success: %{public}@", buf, 0x20u);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_200;
  v9[3] = &unk_2649B6AA0;
  objc_copyWeak(v17, (id *)(a1 + 96));
  id v10 = *(id *)(a1 + 40);
  char v18 = a2;
  id v11 = *(id *)(a1 + 48);
  char v19 = *(unsigned char *)(a1 + 112);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  char v20 = *(unsigned char *)(a1 + 113);
  v17[1] = *(id *)(a1 + 104);
  id v14 = *(id *)(a1 + 72);
  id v16 = *(id *)(a1 + 88);
  id v15 = *(id *)(a1 + 80);
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(v17);
}

void __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_200(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v3 = [MEMORY[0x263F3F4F0] sharedInstance];
  uint64_t v4 = [v3 sceneWithIdentifier:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 104) && [*(id *)(a1 + 40) count])
  {
    id v5 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v8;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Delivering deferred actions to scene: %{public}@", buf, 0x16u);
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_201;
    v14[3] = &unk_2649B47A8;
    id v15 = *(id *)(a1 + 40);
    [v4 updateSettingsWithTransitionBlock:v14];
  }
  if (v4)
  {
    [WeakRetained _invalidateTransactionRetryTimer];
    if (*(unsigned char *)(a1 + 104)) {
      [WeakRetained _postTransactionUpdateSceneSettingsForScene:v4];
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"DBSceneHostErrorDomain" code:4 userInfo:0];
    [WeakRetained _scheduleTransactionRetryForeground:*(unsigned __int8 *)(a1 + 105) settings:*(void *)(a1 + 48) transitionContext:*(void *)(a1 + 56) waitsForSceneCommit:*(unsigned __int8 *)(a1 + 106) timeout:*(double *)(a1 + 96)];
  }
  id v10 = *(void **)(a1 + 64);
  if (v10 && !*(unsigned char *)(a1 + 104) && v4 && *(void *)(a1 + 32))
  {
    [v4 updateSettingsWithBlock:&__block_literal_global_206];
    [v3 destroyScene:*(void *)(a1 + 32) withTransitionContext:0];
    id v10 = *(void **)(a1 + 64);
  }
  [v10 invalidate];
  if (*(void *)(a1 + 80))
  {
    id v11 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v13;
      _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Firing scene update completion", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  [*(id *)(a1 + 72) invalidate];
  [WeakRetained setTransaction:0];
}

id __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_201(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F82468]);
  [v2 setActions:*(void *)(a1 + 32)];
  id v3 = [MEMORY[0x263F29CB8] processHandle];
  [v2 setOriginatingProcess:v3];

  return v2;
}

uint64_t __125__DBSceneHostViewController__performSceneUpdateForeground_settings_transitionContext_waitsForSceneCommit_timeout_completion___block_invoke_2_204(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

- (void)_postTransactionUpdateSceneSettingsForScene:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(DBSceneHostViewController *)self sceneInterfaceStyle];
  int64_t v6 = [(DBSceneHostViewController *)self sceneMapInterfaceStyle];
  uint64_t v7 = [v4 settings];
  int v8 = [v7 conformsToProtocol:&unk_26E239760];

  uint64_t v9 = DBLogForCategory(0x10uLL);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v10) {
      goto LABEL_7;
    }
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = [(DBSceneHostViewController *)self application];
    id v14 = CPUIDescriptionForUserInterfaceStyle();
    id v15 = CPUIDescriptionForUserInterfaceStyle();
    *(_DWORD *)buf = 138544130;
    int64_t v50 = v12;
    __int16 v51 = 2114;
    v52 = v13;
    __int16 v53 = 2112;
    id v54 = v14;
    __int16 v55 = 2114;
    id v56 = v15;
    _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Post scene update for appInfo: %{public}@ to style: %@, map style %{public}@", buf, 0x2Au);
  }
  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    id v16 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v16);
    uint64_t v17 = [(DBSceneHostViewController *)self application];
    id v14 = CPUIDescriptionForUserInterfaceStyle();
    *(_DWORD *)buf = 138543874;
    int64_t v50 = v12;
    __int16 v51 = 2114;
    v52 = v17;
    __int16 v53 = 2114;
    id v54 = v14;
    _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Post scene update for appInfo: %{public}@ to style: %{public}@", buf, 0x20u);
  }
LABEL_7:

  [(DBSceneHostViewController *)self sceneFrame];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  [(DBSceneHostViewController *)self sceneSafeAreaInsets];
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  double v34 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    double v35 = (objc_class *)objc_opt_class();
    double v36 = NSStringFromClass(v35);
    double v37 = [(DBSceneHostViewController *)self application];
    v58.origin.x = v19;
    v58.origin.y = v21;
    v58.size.width = v23;
    v58.size.height = v25;
    double v38 = NSStringFromCGRect(v58);
    v59.top = v27;
    v59.left = v29;
    v59.bottom = v31;
    v59.right = v33;
    double v39 = NSStringFromUIEdgeInsets(v59);
    *(_DWORD *)buf = 138544130;
    int64_t v50 = v36;
    __int16 v51 = 2112;
    v52 = v37;
    __int16 v53 = 2114;
    id v54 = v38;
    __int16 v55 = 2114;
    id v56 = v39;
    _os_log_impl(&dword_22D6F0000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] Post scene update for appInfo: %@ - frame: %{public}@, safe area insets: %{public}@", buf, 0x2Au);
  }
  double v40 = [(DBSceneHostViewController *)self environment];
  v41 = [v40 environmentConfiguration];
  v42 = [v41 wallpaperPreferences];
  v43 = [v42 currentWallpaper];

  v44 = [v43 traits];
  char v45 = [v44 isBlack];
  if (v5 == 2) {
    char v46 = v45;
  }
  else {
    char v46 = 0;
  }

  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __73__DBSceneHostViewController__postTransactionUpdateSceneSettingsForScene___block_invoke;
  v47[3] = &__block_descriptor_113_e50_v16__0__UIMutableCarPlayApplicationSceneSettings_8l;
  char v48 = v46;
  v47[4] = v5;
  *(CGFloat *)&v47[5] = v19;
  *(CGFloat *)&v47[6] = v21;
  *(CGFloat *)&v47[7] = v23;
  *(CGFloat *)&v47[8] = v25;
  *(CGFloat *)&v47[9] = v27;
  *(CGFloat *)&v47[10] = v29;
  *(CGFloat *)&v47[11] = v31;
  *(CGFloat *)&v47[12] = v33;
  v47[13] = v6;
  [v4 updateSettingsWithBlock:v47];
}

void __73__DBSceneHostViewController__postTransactionUpdateSceneSettingsForScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setBlackWallpaperModeEnabled:*(unsigned __int8 *)(a1 + 112)];
  [v3 setUserInterfaceStyle:*(void *)(a1 + 32)];
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v3, "setSafeAreaInsetsPortrait:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  if ([v3 conformsToProtocol:&unk_26E239858]) {
    [v3 setMapStyle:*(void *)(a1 + 104)];
  }
}

- (void)_invalidateTransactionRetryTimer
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [(DBSceneHostViewController *)self transactionRetryTimer];

  if (v3)
  {
    id v4 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v5 = (objc_class *)objc_opt_class();
      int64_t v6 = NSStringFromClass(v5);
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Canceling transaction retry timer", (uint8_t *)&v8, 0xCu);
    }
    [(DBSceneHostViewController *)self setTransactionRetryDelay:0.0];
    uint64_t v7 = [(DBSceneHostViewController *)self transactionRetryTimer];
    [v7 invalidate];

    [(DBSceneHostViewController *)self setTransactionRetryTimer:0];
  }
}

- (void)_scheduleTransactionRetryForeground:(BOOL)a3 settings:(id)a4 transitionContext:(id)a5 waitsForSceneCommit:(BOOL)a6 timeout:(double)a7
{
  id v12 = a4;
  id v13 = a5;
  if (![(DBSceneHostViewController *)self isInvalidated]
    && [(DBSceneHostViewController *)self isPersistent])
  {
    [(DBSceneHostViewController *)self transactionRetryDelay];
    if (v14 < 0.5) {
      [(DBSceneHostViewController *)self setTransactionRetryDelay:0.5];
    }
    id v15 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[DBSceneHostViewController _scheduleTransactionRetryForeground:settings:transitionContext:waitsForSceneCommit:timeout:](self, v15);
    }

    id v16 = [(DBSceneHostViewController *)self transactionRetryTimer];

    if (!v16)
    {
      objc_initWeak(&location, self);
      uint64_t v17 = (void *)MEMORY[0x263EFFA20];
      [(DBSceneHostViewController *)self transactionRetryDelay];
      double v19 = v18;
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      double v24 = __120__DBSceneHostViewController__scheduleTransactionRetryForeground_settings_transitionContext_waitsForSceneCommit_timeout___block_invoke;
      CGFloat v25 = &unk_2649B6B10;
      objc_copyWeak(v28, &location);
      BOOL v29 = a3;
      id v26 = v12;
      id v27 = v13;
      BOOL v30 = a6;
      v28[1] = *(id *)&a7;
      double v20 = [v17 scheduledTimerWithTimeInterval:0 repeats:&v22 block:v19];
      -[DBSceneHostViewController setTransactionRetryTimer:](self, "setTransactionRetryTimer:", v20, v22, v23, v24, v25);

      [(DBSceneHostViewController *)self transactionRetryDelay];
      [(DBSceneHostViewController *)self setTransactionRetryDelay:v21 + v21];

      objc_destroyWeak(v28);
      objc_destroyWeak(&location);
    }
  }
}

void __120__DBSceneHostViewController__scheduleTransactionRetryForeground_settings_transitionContext_waitsForSceneCommit_timeout___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    int64_t v5 = NSStringFromClass(v4);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Retrying scene transaction", (uint8_t *)&v6, 0xCu);
  }
  [WeakRetained _performSceneUpdateForeground:*(unsigned __int8 *)(a1 + 64) settings:*(void *)(a1 + 32) transitionContext:*(void *)(a1 + 40) waitsForSceneCommit:*(unsigned __int8 *)(a1 + 65) timeout:0 completion:*(double *)(a1 + 56)];
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (DBApplication)application
{
  return self->_application;
}

- (DBApplication)proxyApplication
{
  return self->_proxyApplication;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)isScenePresenterInvalidated
{
  return self->_scenePresenterInvalidated;
}

- (void)setScenePresenterInvalidated:(BOOL)a3
{
  self->_scenePresenterInvalidated = a3;
}

- (FBScene)scene
{
  return self->_scene;
}

- (NSString)scenePresentationIdentifier
{
  return self->_scenePresentationIdentifier;
}

- (void)setScenePresentationIdentifier:(id)a3
{
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (void)setScenePresenter:(id)a3
{
}

- (UIScenePresentation)sceneHostView
{
  return self->_sceneHostView;
}

- (void)setSceneHostView:(id)a3
{
}

- (NSMutableDictionary)secondaryScenePresentersByIdentifier
{
  return self->_secondaryScenePresentersByIdentifier;
}

- (void)setSecondaryScenePresentersByIdentifier:(id)a3
{
}

- (FBApplicationUpdateScenesTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSTimer)transactionRetryTimer
{
  return self->_transactionRetryTimer;
}

- (void)setTransactionRetryTimer:(id)a3
{
}

- (double)transactionRetryDelay
{
  return self->_transactionRetryDelay;
}

- (void)setTransactionRetryDelay:(double)a3
{
  self->_transactionRetryDelay = a3;
}

- (unint64_t)hostedAppCrashTally
{
  return self->_hostedAppCrashTally;
}

- (void)setHostedAppCrashTally:(unint64_t)a3
{
  self->_hostedAppCrashTally = a3;
}

- (unint64_t)proxyAppCrashTally
{
  return self->_proxyAppCrashTally;
}

- (void)setProxyAppCrashTally:(unint64_t)a3
{
  self->_proxyAppCrashTally = a3;
}

- (BOOL)usesHostContextSnapshotting
{
  return self->_usesHostContextSnapshotting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionRetryTimer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_secondaryScenePresentersByIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneHostView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scenePresentationIdentifier, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_proxyApplication, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_destroyWeak((id *)&self->_environment);
}

- (void)performSceneUpdateWithBlock:waitsForSceneCommit:timeout:completion:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "[%{public}@] Scene update requested without a display configuration! Ignoring scene update request.", v4, v5, v6, v7, 2u);
}

- (void)processMonitor:(void *)a1 shouldHandleDeathOfBundleIdentifier:isCrash:.cold.1(void *a1)
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  [a1 hostedAppCrashTally];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_2_4(&dword_22D6F0000, v4, v5, "[%{public}@] Crash count for %{public}@ : %lu", v6, v7, v8, v9, v10);
}

- (void)processMonitor:(void *)a1 shouldHandleDeathOfBundleIdentifier:isCrash:.cold.2(void *a1)
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  [a1 proxyAppCrashTally];
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_2_4(&dword_22D6F0000, v4, v5, "[%{public}@] Crash count for %{public}@ : %lu", v6, v7, v8, v9, v10);
}

- (void)_performSceneUpdateForeground:settings:transitionContext:waitsForSceneCommit:timeout:completion:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "[%{public}@] No process identity provided!", v4, v5, v6, v7, 2u);
}

- (void)_performSceneUpdateForeground:settings:transitionContext:waitsForSceneCommit:timeout:completion:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "[%{public}@] Crash limit exceeded! Ignoring scene update request.", v4, v5, v6, v7, 2u);
}

- (void)_scheduleTransactionRetryForeground:(void *)a1 settings:(NSObject *)a2 transitionContext:waitsForSceneCommit:timeout:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [a1 transactionRetryDelay];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Scene transaction failed. Retrying after %.1f seconds...", (uint8_t *)&v7, 0x16u);
}

@end