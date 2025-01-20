@interface CLBSceneManager
+ (unint64_t)bottomBarTransitionProgressSetting;
+ (unint64_t)chromeVisibleSetting;
+ (unint64_t)navigationTitlesSetting;
- (BOOL)_shouldCreateHiddenSceneForRequestFromProcess:(id)a3;
- (BOOL)chromeVisibleForScene:(id)a3;
- (BOOL)needsKeyboardForAdminScene;
- (BOOL)shouldAddInProcessKeyboardSceneToRootWindow;
- (BOOL)shouldShowKeyboardWithinAppScene;
- (BSInvalidatable)keyboardObserver;
- (CLBSceneManager)init;
- (CLBSceneManagerDelegate)delegate;
- (FBMainDisplayLayoutPublisher)mainDisplayLayoutPublisher;
- (FBSSceneSpecification)clarityUISceneSpecification;
- (FBSceneWorkspace)workspace;
- (NSMutableDictionary)elementsBySceneIdentifier;
- (NSSet)applicationScenes;
- (NSSet)foregroundApplicationScenes;
- (id)_createInputUIScene;
- (id)bottomBarTransitionProgressForClientSettings:(id)a3;
- (id)navigationTitlesForClientSettings:(id)a3;
- (id)scene:(id)a3 handleActions:(id)a4;
- (void)_publishDisplayLayoutChangeWithScene:(id)a3 foreground:(BOOL)a4;
- (void)_updateForKeyboardScene;
- (void)_updateShouldAddInProcessKeyboardSceneToRootWindow;
- (void)_userInterfaceStyleArbiterStyleChanged:(id)a3;
- (void)addPointerScene:(id)a3;
- (void)dealloc;
- (void)removePointerScene:(id)a3;
- (void)scene:(id)a3 clientDidConnect:(id)a4;
- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sceneDidInvalidate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementsBySceneIdentifier:(id)a3;
- (void)setKeyboardObserver:(id)a3;
- (void)setMainDisplayLayoutPublisher:(id)a3;
- (void)setNeedsKeyboardForAdminScene:(BOOL)a3;
- (void)setShouldAddInProcessKeyboardSceneToRootWindow:(BOOL)a3;
- (void)setShouldShowKeyboardWithinAppScene:(BOOL)a3;
- (void)workspace:(id)a3 clientDidConnectWithHandshake:(id)a4;
- (void)workspace:(id)a3 didAddScene:(id)a4;
- (void)workspace:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 fromProcess:(id)a5 completion:(id)a6;
- (void)workspace:(id)a3 willRemoveScene:(id)a4;
@end

@implementation CLBSceneManager

- (CLBSceneManager)init
{
  v28.receiver = self;
  v28.super_class = (Class)CLBSceneManager;
  v2 = [(CLBSceneManager *)&v28 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    applicationScenes = v2->_applicationScenes;
    v2->_applicationScenes = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    foregroundApplicationScenes = v2->_foregroundApplicationScenes;
    v2->_foregroundApplicationScenes = v5;

    v2->_shouldAddInProcessKeyboardSceneToRootWindow = 1;
    id v7 = objc_alloc((Class)UIRootWindowScenePresentationBinder);
    v8 = +[FBDisplayManager mainConfiguration];
    v9 = (UIRootWindowScenePresentationBinder *)[v7 initWithPriority:0 displayConfiguration:v8];
    rootWindowScenePresentationBinder = v2->_rootWindowScenePresentationBinder;
    v2->_rootWindowScenePresentationBinder = v9;

    uint64_t v11 = [(CLBSceneManager *)v2 _createInputUIScene];
    inputUIScene = v2->_inputUIScene;
    v2->_inputUIScene = (FBScene *)v11;

    if (v2->_inputUIScene) {
      -[UIRootWindowScenePresentationBinder addScene:](v2->_rootWindowScenePresentationBinder, "addScene:");
    }
    v13 = (FBSceneWorkspace *)[objc_alloc((Class)FBSceneWorkspace) initWithIdentifier:@"CLBSceneManager"];
    workspace = v2->_workspace;
    v2->_workspace = v13;

    [(FBSceneWorkspace *)v2->_workspace setDelegate:v2];
    uint64_t v15 = +[FBMainDisplayLayoutPublisher sharedInstance];
    mainDisplayLayoutPublisher = v2->_mainDisplayLayoutPublisher;
    v2->_mainDisplayLayoutPublisher = (FBMainDisplayLayoutPublisher *)v15;

    uint64_t v17 = objc_opt_new();
    elementsBySceneIdentifier = v2->_elementsBySceneIdentifier;
    v2->_elementsBySceneIdentifier = (NSMutableDictionary *)v17;

    v19 = +[NSNotificationCenter defaultCenter];
    uint64_t v20 = UIUserInterfaceStyleArbiterStyleChangedNotification;
    v21 = +[UIUserInterfaceStyleArbiter sharedInstance];
    [v19 addObserver:v2 selector:"_userInterfaceStyleArbiterStyleChanged:" name:v20 object:v21];

    objc_initWeak(&location, v2);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000177D0;
    v25[3] = &unk_10015C868;
    objc_copyWeak(&v26, &location);
    uint64_t v22 = +[FBSceneManager observeKeyboardSceneAvailability:v25];
    keyboardObserver = v2->_keyboardObserver;
    v2->_keyboardObserver = (BSInvalidatable *)v22;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_keyboardObserver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CLBSceneManager;
  [(CLBSceneManager *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v6 = +[FBProcessManager sharedInstance];
    id v7 = [v6 allProcesses];

    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v13 = [(CLBSceneManager *)self delegate];
          unsigned int v14 = [v13 sceneManager:self createSceneIfNeededForProcess:v12];

          if (v14)
          {
            uint64_t v15 = +[CLFLog commonLog];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v21 = v12;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created scene for existing process: %@", buf, 0xCu);
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v9);
    }
  }
}

- (NSSet)applicationScenes
{
  id v2 = [(NSMutableSet *)self->_applicationScenes copy];

  return (NSSet *)v2;
}

- (NSSet)foregroundApplicationScenes
{
  id v2 = [(NSMutableSet *)self->_foregroundApplicationScenes copy];

  return (NSSet *)v2;
}

- (void)setNeedsKeyboardForAdminScene:(BOOL)a3
{
  if (self->_needsKeyboardForAdminScene != a3)
  {
    BOOL v3 = a3;
    self->_needsKeyboardForAdminScene = a3;
    v5 = +[CLFLog commonLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Needs keyboard for admin scene: %i", buf, 8u);
    }

    inputUIScene = self->_inputUIScene;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100017C4C;
    v7[3] = &unk_10015C210;
    BOOL v8 = v3;
    [(FBScene *)inputUIScene performUpdate:v7];
    [(CLBSceneManager *)self _updateShouldAddInProcessKeyboardSceneToRootWindow];
  }
}

- (void)setShouldShowKeyboardWithinAppScene:(BOOL)a3
{
  if (self->_shouldShowKeyboardWithinAppScene != a3)
  {
    BOOL v3 = a3;
    self->_shouldShowKeyboardWithinAppScene = a3;
    v5 = +[CLFLog commonLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Now showing keyboard within app scene: %i", (uint8_t *)v6, 8u);
    }

    [(CLBSceneManager *)self _updateShouldAddInProcessKeyboardSceneToRootWindow];
  }
}

- (void)_updateShouldAddInProcessKeyboardSceneToRootWindow
{
  if ([(CLBSceneManager *)self shouldShowKeyboardWithinAppScene]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(CLBSceneManager *)self needsKeyboardForAdminScene] ^ 1;
  }

  [(CLBSceneManager *)self setShouldAddInProcessKeyboardSceneToRootWindow:v3];
}

- (void)setShouldAddInProcessKeyboardSceneToRootWindow:(BOOL)a3
{
  if (self->_shouldAddInProcessKeyboardSceneToRootWindow != a3)
  {
    BOOL v3 = a3;
    v5 = +[CLFLog commonLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Should add in-process keyboard scene to root window: %i", (uint8_t *)v6, 8u);
    }

    self->_shouldAddInProcessKeyboardSceneToRootWindow = v3;
    [(CLBSceneManager *)self _updateForKeyboardScene];
  }
}

- (void)workspace:(id)a3 clientDidConnectWithHandshake:(id)a4
{
  id v5 = a4;
  v6 = +[CLFLog commonLog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Did connect to client with handshake %@", (uint8_t *)&v16, 0xCu);
  }

  id v7 = +[FBProcessManager sharedInstance];
  BOOL v8 = [v5 process];
  id v9 = [v8 handle];
  BOOL v10 = [v9 identity];
  uint64_t v11 = [v7 processForIdentity:v10];

  if (!v11)
  {
    unsigned int v14 = +[CLFLog commonLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000FFEF0();
    }
    goto LABEL_9;
  }
  uint64_t v12 = [(CLBSceneManager *)self delegate];
  unsigned int v13 = [v12 sceneManager:self createSceneIfNeededForProcess:v11];

  if (v13)
  {
    unsigned int v14 = +[CLFLog commonLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v5 process];
      int v16 = 138412290;
      id v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Created scene on launch of process: %@", (uint8_t *)&v16, 0xCu);
    }
LABEL_9:
  }
}

- (void)workspace:(id)a3 didAddScene:(id)a4
{
  id v5 = a4;
  v6 = +[CLFLog commonLog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 identifier];
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Did add scene: %@", (uint8_t *)&v8, 0xCu);
  }
  [v5 setDelegate:self];
  [v5 addExtension:objc_opt_class()];
}

- (void)workspace:(id)a3 willRemoveScene:(id)a4
{
  id v5 = a4;
  v6 = +[CLFLog commonLog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 identifier];
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will remove scene: %@", (uint8_t *)&v8, 0xCu);
  }
  if ([(NSMutableSet *)self->_applicationScenes containsObject:v5]) {
    [(CLBSceneManager *)self _publishDisplayLayoutChangeWithScene:v5 foreground:0];
  }
  [v5 setDelegate:0];
  [(NSMutableSet *)self->_applicationScenes removeObject:v5];
  [(NSMutableSet *)self->_foregroundApplicationScenes removeObject:v5];
  [(UIRootWindowScenePresentationBinder *)self->_rootWindowScenePresentationBinder removeScene:v5];
}

- (void)workspace:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 fromProcess:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void *, void *))a6;
  BSDispatchQueueAssertMain();
  uint64_t v12 = +[FBProcessManager sharedInstance];
  unsigned int v13 = [v10 handle];
  unsigned int v14 = [v13 identity];
  uint64_t v15 = [v12 processForIdentity:v14];

  if (!v15)
  {
    uint64_t v20 = +[CLFLog commonLog];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000FFF58();
    }
    goto LABEL_33;
  }
  int v16 = [(CLBSceneManager *)self delegate];
  unsigned __int8 v17 = [v16 sceneManager:self handleSceneRequestFromProcess:v15 options:v9 completion:v11];

  if ((v17 & 1) == 0)
  {
    if ([(CLBSceneManager *)self _shouldCreateHiddenSceneForRequestFromProcess:v15])
    {
      long long v18 = [v9 identifier];
      long long v19 = v18;
      if (v18)
      {
        uint64_t v20 = v18;
      }
      else
      {
        uint64_t v22 = +[NSUUID UUID];
        uint64_t v20 = [v22 UUIDString];
      }
      v23 = [(CLBSceneManager *)self workspace];
      v24 = [v23 sceneWithIdentifier:v20];

      if (v24)
      {
        v25 = [v24 clientHandle];
        id v26 = [v25 processHandle];
        unsigned int v27 = [v26 pid];
        unsigned int v28 = [v15 pid];

        v29 = +[CLFLog commonLog];
        v30 = v29;
        if (v27 != v28)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            id v54 = v15;
            __int16 v55 = 2112;
            v56 = v20;
            __int16 v57 = 2112;
            v58 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Process (%{public}@) requested scene creation with identifier \"%@\" but a scene with that identifier already exists. Scene: %@", buf, 0x20u);
          }

          v34 = +[NSError errorWithDomain:@"CLBSceneManager" code:2 userInfo:0];
          v24 = 0;
          goto LABEL_30;
        }
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v54 = v15;
          __int16 v55 = 2112;
          v56 = v20;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Process (%{public}@) requested scene creation with identifier \"%@\" but it already had one.", buf, 0x16u);
        }
      }
      else
      {
        v31 = [v9 initialClientSettings];
        v32 = v31;
        if (v31) {
          id v33 = v31;
        }
        else {
          id v33 = (id)objc_opt_new();
        }
        v35 = v33;

        v36 = (char *)[v35 preferredInterfaceOrientation];
        if ((unint64_t)(v36 - 1) >= 4) {
          uint64_t v37 = 1;
        }
        else {
          uint64_t v37 = (uint64_t)v36;
        }
        [v35 preferredLevel];
        double v39 = v38;
        v40 = +[FBDisplayManager mainConfiguration];
        v41 = +[FBSMutableSceneSettings settings];
        [v41 setDisplayConfiguration:v40];
        v46 = v40;
        [v40 bounds];
        objc_msgSend(v41, "setFrame:");
        [v41 setLevel:v39];
        [v41 setInterfaceOrientation:v37];
        [v41 setForeground:0];
        v42 = [(CLBSceneManager *)self workspace];
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_100018868;
        v50[3] = &unk_10015C348;
        v51 = v20;
        id v43 = v15;
        id v52 = v43;
        v24 = [v42 createScene:v50];

        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100018904;
        v47[3] = &unk_10015C890;
        id v44 = v41;
        id v48 = v44;
        v30 = v35;
        v49 = v30;
        [v24 configureParameters:v47];
        [v24 activate:0];
        v45 = +[CLFLog commonLog];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v54 = v43;
          __int16 v55 = 2114;
          v56 = v24;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Process (%{public}@) requested scene creation -> %{public}@", buf, 0x16u);
        }
      }
      v34 = 0;
LABEL_30:
      if (v11) {
        v11[2](v11, v24, v34);
      }

      goto LABEL_33;
    }
    uint64_t v21 = +[CLFLog commonLog];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000FFFC0();
    }

    if (v11)
    {
      uint64_t v20 = +[NSError errorWithDomain:@"CLBSceneManager" code:1 userInfo:0];
      v11[2](v11, 0, v20);
LABEL_33:
    }
  }
}

- (void)sceneDidActivate:(id)a3
{
  id v4 = a3;
  id v5 = +[CLFLog commonLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scene did activate: %@", (uint8_t *)&v14, 0xCu);
  }

  v6 = [v4 settings];
  unsigned __int8 v7 = [v6 isSystemScene];

  int v8 = [v4 definition];
  id v9 = [v8 specification];

  if (v7)
  {
    [(UIRootWindowScenePresentationBinder *)self->_rootWindowScenePresentationBinder addScene:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NSMutableSet *)self->_applicationScenes addObject:v4];
      uint64_t v10 = [v4 settings];
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        uint64_t v12 = [v4 settings];
        unsigned int v13 = [v12 isForeground];

        if (v13)
        {
          [(NSMutableSet *)self->_foregroundApplicationScenes addObject:v4];
          [(CLBSceneManager *)self _publishDisplayLayoutChangeWithScene:v4 foreground:1];
        }
      }
    }
  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v5 = a3;
  v6 = +[CLFLog commonLog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scene did deactivate: %@", (uint8_t *)&v10, 0xCu);
  }

  if ([(NSMutableSet *)self->_applicationScenes containsObject:v5])
  {
    unsigned __int8 v7 = +[CLBHIDInterface sharedInstance];
    [v7 updateDeferringRulesForScene:v5];

    [(CLBSceneManager *)self _publishDisplayLayoutChangeWithScene:v5 foreground:0];
  }
  [(NSMutableSet *)self->_applicationScenes removeObject:v5];
  [(NSMutableSet *)self->_foregroundApplicationScenes removeObject:v5];
  [(UIRootWindowScenePresentationBinder *)self->_rootWindowScenePresentationBinder removeScene:v5];
  int v8 = [(CLBSceneManager *)self delegate];
  id v9 = [v5 identifier];
  [v8 sceneManager:self didDeactivateSceneWithID:v9];
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!self->_clientSettingsDiffInspector)
  {
    int v14 = (CLBClientSettingsDiffInspector *)objc_opt_new();
    clientSettingsDiffInspector = self->_clientSettingsDiffInspector;
    self->_clientSettingsDiffInspector = v14;

    objc_initWeak(location, self);
    int v16 = self->_clientSettingsDiffInspector;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10001900C;
    v33[3] = &unk_10015C8B8;
    objc_copyWeak(&v34, location);
    v33[4] = self;
    [(CLBClientSettingsDiffInspector *)v16 observeNavigationTitlesWithHandler:v33];
    unsigned __int8 v17 = self->_clientSettingsDiffInspector;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100019178;
    v31[3] = &unk_10015C8B8;
    objc_copyWeak(&v32, location);
    v31[4] = self;
    [(CLBClientSettingsDiffInspector *)v17 observeChromeVisibleWithHandler:v31];
    long long v18 = self->_clientSettingsDiffInspector;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000192C8;
    v29[3] = &unk_10015C8B8;
    objc_copyWeak(&v30, location);
    v29[4] = self;
    [(CLBClientSettingsDiffInspector *)v18 observeBottomBarTransitionProgressWithHandler:v29];
    long long v19 = self->_clientSettingsDiffInspector;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100019434;
    v27[3] = &unk_10015C8E0;
    objc_copyWeak(&v28, location);
    [(CLBClientSettingsDiffInspector *)v19 observeSupportedInterfaceOrientationsWithBlock:v27];
    uint64_t v20 = self->_clientSettingsDiffInspector;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000195C4;
    v25[3] = &unk_10015C8E0;
    objc_copyWeak(&v26, location);
    [(CLBClientSettingsDiffInspector *)v20 observeInterfaceOrientationWithBlock:v25];
    uint64_t v21 = self->_clientSettingsDiffInspector;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100019754;
    v23[3] = &unk_10015C8E0;
    objc_copyWeak(&v24, location);
    [(CLBClientSettingsDiffInspector *)v21 observePreferredInterfaceOrientationWithBlock:v23];
    [(CLBClientSettingsDiffInspector *)self->_clientSettingsDiffInspector observeIdleTimerDisabledWithBlock:&stru_10015C920];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(location);
  }
  uint64_t v22 = objc_opt_new();
  [v22 setScene:v10];
  [v11 evaluateWithInspector:self->_clientSettingsDiffInspector context:v22];
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v7 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "UIActionType", (void)v17) == (id)12 || objc_msgSend(v13, "UIActionType") == (id)13)
        {
          int v14 = (void *)qword_100186478;
          id v15 = +[CLBEvent eventWithType:3 context:v5];
          [v14 handleEvent:v15];

          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v5 = a3;
  id v6 = +[CLFLog commonLog];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v7 = [v5 settings];
    v12[0] = 67109378;
    v12[1] = [v7 isForeground];
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scene did apply update (foreground: %i): %@", (uint8_t *)v12, 0x12u);
  }
  if ([(NSMutableSet *)self->_applicationScenes containsObject:v5])
  {
    id v8 = [v5 settings];
    id v9 = [v8 isForeground];

    foregroundApplicationScenes = self->_foregroundApplicationScenes;
    if (v9) {
      [(NSMutableSet *)foregroundApplicationScenes addObject:v5];
    }
    else {
      [(NSMutableSet *)foregroundApplicationScenes removeObject:v5];
    }
    [(CLBSceneManager *)self _publishDisplayLayoutChangeWithScene:v5 foreground:v9];
    uint64_t v11 = +[CLBHIDInterface sharedInstance];
    [v11 updateDeferringRulesForScene:v5];
  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v5 = a3;
  if ([v5 contentState] == (id)2
    && [(NSMutableSet *)self->_applicationScenes containsObject:v5])
  {
    id v4 = +[CLBHIDInterface sharedInstance];
    [v4 updateDeferringRulesForScene:v5];
  }
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  id v6 = a3;
  if (-[NSMutableSet containsObject:](self->_applicationScenes, "containsObject:"))
  {
    id v5 = +[CLBHIDInterface sharedInstance];
    [v5 updateDeferringRulesForScene:v6];
  }
}

- (void)sceneDidInvalidate:(id)a3
{
}

- (void)addPointerScene:(id)a3
{
  id v4 = a3;
  id v5 = +[CLFLog commonLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding pointer scene to root window: %@", (uint8_t *)&v6, 0xCu);
  }

  [(UIRootWindowScenePresentationBinder *)self->_rootWindowScenePresentationBinder addScene:v4];
}

- (void)removePointerScene:(id)a3
{
  id v4 = a3;
  id v5 = +[CLFLog commonLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing pointer scene from root window: %@", (uint8_t *)&v6, 0xCu);
  }

  [(UIRootWindowScenePresentationBinder *)self->_rootWindowScenePresentationBinder removeScene:v4];
}

- (void)_updateForKeyboardScene
{
  BOOL v3 = +[FBSceneManager keyboardScene];
  if (v3)
  {
    unsigned int v4 = [(CLBSceneManager *)self shouldAddInProcessKeyboardSceneToRootWindow];
    id v5 = +[CLFLog commonLog];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding keyboard scene to root window.", buf, 2u);
      }

      [(UIRootWindowScenePresentationBinder *)self->_rootWindowScenePresentationBinder addScene:v3];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing keyboard scene from root window.", v7, 2u);
      }

      [(UIRootWindowScenePresentationBinder *)self->_rootWindowScenePresentationBinder removeScene:v3];
    }
  }
}

- (BOOL)_shouldCreateHiddenSceneForRequestFromProcess:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 hasEntitlement:@"com.apple.springboard.requestScene-daemon"];
  if ((v4 & 1) == 0)
  {
    id v5 = +[CLFLog commonLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100100028();
    }
  }
  return v4;
}

- (id)_createInputUIScene
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    id v3 = [(CLBSceneManager *)self workspace];
    unsigned __int8 v4 = [v3 createScene:&stru_10015C960];

    +[FBDisplayManager mainConfiguration];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001A320;
    v7[3] = &unk_10015C988;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v8;
    [v4 performUpdate:v7];
    [v4 activate:0];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_userInterfaceStyleArbiterStyleChanged:(id)a3
{
  unsigned __int8 v4 = +[UIUserInterfaceStyleArbiter sharedInstance];
  unint64_t v5 = (unint64_t)[v4 currentStyle];

  BOOL v6 = CLFLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v5 >= 3)
    {
      id v7 = +[NSString stringWithFormat:@"Unknown (%ld)", v5];
    }
    else
    {
      id v7 = off_10015C9F0[v5];
    }
    *(_DWORD *)buf = 138543362;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got a user interface style change, forwarding %{public}@ to scenes", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A53C;
  block[3] = &unk_10015C9D0;
  block[4] = self;
  block[5] = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_publishDisplayLayoutChangeWithScene:(id)a3 foreground:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BSDispatchQueueAssertMain();
  id v7 = [v6 settings];
  id v8 = [v7 displayLayoutStyle];

  if (v8 != (id)1)
  {
    id v9 = [v6 clientHandle];
    id v10 = [v9 bundleIdentifier];

    uint64_t v11 = [v6 identifier];
    id v12 = +[CLFLog commonLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)id v34 = v4;
      *(_WORD *)&v34[4] = 2112;
      *(void *)&v34[6] = v10;
      __int16 v35 = 2112;
      v36 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempt to publish display layout change (foreground: %i) with bundle id: %@, scene id: %@", buf, 0x1Cu);
    }

    if (!v10 && v4 || !v11) {
      goto LABEL_31;
    }
    if (v8 != (id)2)
    {
LABEL_24:
      uint64_t v22 = [(CLBSceneManager *)self elementsBySceneIdentifier];
      v23 = [v22 objectForKeyedSubscript:v11];

      if (v4)
      {
        if (!v23)
        {
          id v24 = [objc_alloc((Class)FBSDisplayLayoutElement) initWithIdentifier:v11];
          [v24 setBundleIdentifier:v10];
          [v24 setLevel:1];
          [v24 setUIApplicationElement:1];
          v25 = [(CLBSceneManager *)self mainDisplayLayoutPublisher];
          id v26 = [v25 addElement:v24];

          unsigned int v27 = [(CLBSceneManager *)self elementsBySceneIdentifier];
          [v27 setObject:v26 forKeyedSubscript:v11];

LABEL_29:
        }
      }
      else if (v23)
      {
        [v23 invalidate];
        id v24 = [(CLBSceneManager *)self elementsBySceneIdentifier];
        [v24 setObject:0 forKeyedSubscript:v11];
        goto LABEL_29;
      }

LABEL_31:
      goto LABEL_32;
    }
    __int16 v13 = +[CLFLog commonLog];
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)id v34 = v11;
        id v15 = "Clearing out all other display layout elements to accommodate primary foreground scene: %@";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }
    else if (v14)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v34 = v11;
      id v15 = "Adding display layout elements for foreground apps now that primary foreground scene has backgrounded: %@";
      goto LABEL_13;
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    int v16 = self->_foregroundApplicationScenes;
    id v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(id *)(*((void *)&v28 + 1) + 8 * i);
          if (v21 != v6) {
            -[CLBSceneManager _publishDisplayLayoutChangeWithScene:foreground:](self, "_publishDisplayLayoutChangeWithScene:foreground:", v21, !v4, (void)v28);
          }
        }
        id v18 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v18);
    }

    goto LABEL_24;
  }
LABEL_32:
}

- (CLBSceneManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CLBSceneManagerDelegate *)WeakRetained;
}

- (BOOL)needsKeyboardForAdminScene
{
  return self->_needsKeyboardForAdminScene;
}

- (BOOL)shouldShowKeyboardWithinAppScene
{
  return self->_shouldShowKeyboardWithinAppScene;
}

- (FBSceneWorkspace)workspace
{
  return self->_workspace;
}

- (FBMainDisplayLayoutPublisher)mainDisplayLayoutPublisher
{
  return self->_mainDisplayLayoutPublisher;
}

- (void)setMainDisplayLayoutPublisher:(id)a3
{
}

- (NSMutableDictionary)elementsBySceneIdentifier
{
  return self->_elementsBySceneIdentifier;
}

- (void)setElementsBySceneIdentifier:(id)a3
{
}

- (BOOL)shouldAddInProcessKeyboardSceneToRootWindow
{
  return self->_shouldAddInProcessKeyboardSceneToRootWindow;
}

- (BSInvalidatable)keyboardObserver
{
  return self->_keyboardObserver;
}

- (void)setKeyboardObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardObserver, 0);
  objc_storeStrong((id *)&self->_elementsBySceneIdentifier, 0);
  objc_storeStrong((id *)&self->_mainDisplayLayoutPublisher, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inputUIScene, 0);
  objc_storeStrong((id *)&self->_clientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_foregroundApplicationScenes, 0);
  objc_storeStrong((id *)&self->_applicationScenes, 0);

  objc_storeStrong((id *)&self->_rootWindowScenePresentationBinder, 0);
}

- (FBSSceneSpecification)clarityUISceneSpecification
{
  type metadata accessor for ClarityUIApplicationSceneSpecificationWrapper();
  id v3 = self;
  static ClarityUIApplicationSceneSpecificationWrapper.specificationClass.getter();
  sub_10002A544(0, &qword_10017D7B0);
  if (swift_dynamicCastMetatype())
  {
    id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];

    return (FBSSceneSpecification *)v4;
  }
  else
  {
    result = (FBSSceneSpecification *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (id)navigationTitlesForClientSettings:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_100064D20(v4);

  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (BOOL)chromeVisibleForScene:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  char v6 = sub_100064F9C(v4);

  return v6 & 1;
}

- (id)bottomBarTransitionProgressForClientSettings:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  Class v6 = sub_10006582C(v4);

  return v6;
}

+ (unint64_t)navigationTitlesSetting
{
  return sub_100064174((uint64_t)a1, (uint64_t)a2, &qword_10017B5B0, (uint64_t)&qword_1001864B8);
}

+ (unint64_t)chromeVisibleSetting
{
  return sub_100064174((uint64_t)a1, (uint64_t)a2, &qword_10017B5B8, (uint64_t)&qword_1001864C0);
}

+ (unint64_t)bottomBarTransitionProgressSetting
{
  return sub_100064174((uint64_t)a1, (uint64_t)a2, &qword_10017B5C0, (uint64_t)&qword_1001864C8);
}

@end