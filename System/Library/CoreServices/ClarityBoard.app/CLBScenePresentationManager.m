@interface CLBScenePresentationManager
- (BOOL)avoidsBackButton;
- (BOOL)canHandleOpenApplicationRequest:(id)a3;
- (BOOL)isAllowedOnLockScreen;
- (BOOL)isPresented;
- (BOOL)requestsSceneWhenNeeded;
- (BOOL)shouldDisableIdleTimer;
- (BOOL)supportsClarityUI;
- (BSProcessDeathWatcher)terminationWatcher;
- (CLBScenePresentationManager)init;
- (CLBScenePresentationManagerDelegate)delegate;
- (CLBScenePresentationViewController)scenePresentationViewController;
- (NSString)bundleIdentifier;
- (NSString)entitlement;
- (NSString)name;
- (NSString)sceneSessionRole;
- (UIWindow)window;
- (id)_process;
- (int)presentedPID;
- (int64_t)displayLayoutStyle;
- (void)_continueOpenApplicationRequest:(id)a3 withResult:(id)a4;
- (void)_didDisableSecureMode:(id)a3;
- (void)_willEnableSecureMode:(id)a3;
- (void)createSceneWithRequestOptions:(id)a3 completion:(id)a4;
- (void)handleOpenApplicationRequest:(id)a3 withResult:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setScenePresentationViewController:(id)a3;
- (void)setTerminationWatcher:(id)a3;
- (void)setWindow:(id)a3;
- (void)tearDownSceneIfNeeded;
@end

@implementation CLBScenePresentationManager

- (CLBScenePresentationManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLBScenePresentationManager;
  v2 = [(CLBScenePresentationManager *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_willEnableSecureMode:" name:CLBWillEnableSecureModeNotification object:0];
    [v3 addObserver:v2 selector:"_didDisableSecureMode:" name:CLBDidDisableSecureModeNotification object:0];
  }
  return v2;
}

- (BOOL)canHandleOpenApplicationRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 application];
  v6 = [v5 bundleIdentifier];
  v7 = [(CLBScenePresentationManager *)self bundleIdentifier];
  if ([v6 isEqualToString:v7])
  {
    v8 = [v4 systemRequest];
    v9 = [v8 clientProcess];
    v10 = [v9 state];
    unsigned __int8 v11 = [v10 isRunning];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (void)_continueOpenApplicationRequest:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  v53 = (void (**)(id, void))a4;
  BSDispatchQueueAssertMain();
  v7 = [v6 systemRequest];
  v8 = [v7 options];
  uint64_t v9 = [v7 bundleIdentifier];
  v10 = +[FBProcessManager sharedInstanceIfExists];
  v50 = (void *)v9;
  unsigned __int8 v11 = [v10 applicationProcessesForBundleIdentifier:v9];

  v49 = v11;
  v12 = [v11 firstObject];
  uint64_t v13 = [v8 url];
  v55 = v12;
  v47 = [v12 workspace];
  v52 = v7;
  v46 = [v7 clientProcess];
  v57 = [v46 handle];
  v51 = v8;
  v45 = [v8 dictionary];
  v14 = objc_msgSend(v45, "bs_safeArrayForKey:", FBSOpenApplicationOptionKeyActions);
  v15 = +[CLFLog commonLog];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(CLBScenePresentationManager *)self name];
    *(_DWORD *)buf = 138412546;
    v69 = v16;
    __int16 v70 = 2114;
    v71 = v57;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ open application request from origin %{public}@", buf, 0x16u);
  }
  v54 = v6;
  v44 = v14;
  v48 = (void *)v13;
  if (v13)
  {
    id v17 = [objc_alloc((Class)UIOpenURLAction) initWithURL:v13];
    v18 = +[NSSet setWithObject:v17];
  }
  else
  {
    if ([v14 count]) {
      +[NSSet setWithArray:v14];
    }
    else {
    v18 = +[NSSet set];
    }
  }
  id v56 = objc_msgSend(v18, "mutableCopy", self);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v63;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v63 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        if ([v24 UIActionType] == (id)1 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v25 = objc_alloc((Class)UIOpenURLAction);
          v26 = [v24 url];
          uint64_t v27 = [v24 workspaceOriginatingProcess];
          v28 = (void *)v27;
          if (v27) {
            v29 = (void *)v27;
          }
          else {
            v29 = v57;
          }
          id v30 = [v25 initWithURL:v26 workspaceOriginatingProcess:v29];

          [v56 removeObject:v24];
          [v56 addObject:v30];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v21);
  }

  id v31 = [v55 pid];
  if (v31 != -1)
  {
    v32 = +[RBSTarget targetWithPid:v31];
    v33 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.ClarityBoard" name:@"OpenApp"];
    v66 = v33;
    v34 = +[NSArray arrayWithObjects:&v66 count:1];

    id v35 = [objc_alloc((Class)RBSAssertion) initWithExplanation:@"CLBScenePresentationManagerHandlingOpenApplication" target:v32 attributes:v34];
    id v61 = 0;
    unsigned __int8 v36 = [v35 acquireWithError:&v61];
    id v37 = v61;
    if ((v36 & 1) == 0)
    {
      v38 = +[CLFLog commonLog];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_1000FF2F4();
      }
    }
    dispatch_time_t v39 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007F4C;
    block[3] = &unk_10015BEB8;
    id v60 = v35;
    id v40 = v35;
    dispatch_after(v39, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  [v47 sendActions:v56];
  if (([v54 requiresNewScene] & 1) != 0
    || ([v57 bundleIdentifier],
        v41 = objc_claimAutoreleasedReturnValue(),
        unsigned int v42 = [v41 isEqualToString:CLBClarityBoardBundleIdentifier],
        v41,
        v42))
  {
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100007F54;
    v58[3] = &unk_10015C010;
    v58[4] = v43;
    [v43 createSceneWithRequestOptions:0 completion:v58];
  }
  v53[2](v53, 0);
}

- (void)handleOpenApplicationRequest:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  v8 = [v6 systemRequest];
  uint64_t v9 = [v8 bundleIdentifier];
  v10 = +[FBProcessManager sharedInstanceIfExists];
  unsigned __int8 v11 = [v10 applicationProcessesForBundleIdentifier:v9];

  v12 = [v11 firstObject];
  if (v12)
  {
    [(CLBScenePresentationManager *)self _continueOpenApplicationRequest:v6 withResult:v7];
  }
  else
  {
    uint64_t v13 = +[ClarityBoard sharedApplicationLibrary];
    v14 = [v13 applicationInfoForBundleIdentifier:v9];
    v15 = [v14 processIdentity];

    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = sub_100008254;
    v33 = sub_100008264;
    id v16 = objc_alloc((Class)FBApplicationProcessLaunchTransaction);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000826C;
    v27[3] = &unk_10015C038;
    id v17 = v15;
    id v28 = v17;
    id v34 = [v16 initWithProcessIdentity:v17 executionContextProvider:v27];
    v18 = (void *)v30[5];
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    id v21 = sub_1000082C0;
    uint64_t v22 = &unk_10015C060;
    v23 = self;
    id v24 = v6;
    id v25 = v7;
    v26 = &v29;
    [v18 setCompletionBlock:&v19];
    objc_msgSend((id)v30[5], "begin", v19, v20, v21, v22, v23);

    _Block_object_dispose(&v29, 8);
  }
}

- (void)createSceneWithRequestOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  BSDispatchQueueAssertMain();
  v8 = [(CLBScenePresentationManager *)self window];

  if (v8)
  {
    uint64_t v9 = +[CLFLog commonLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(CLBScenePresentationManager *)self name];
      *(_DWORD *)buf = 138412290;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Skipping scene request for %@ because it already has one.", buf, 0xCu);
    }
    unsigned __int8 v11 = +[NSError errorWithDomain:@"CLBScenePresentationManagerErrorDomain" code:-2006 userInfo:0];
    v7[2](v7, 0, v11);
  }
  else
  {
    unsigned __int8 v11 = [(CLBScenePresentationManager *)self _process];
    if ([v11 isRunning])
    {
      v12 = [CLBScenePresentationViewController alloc];
      uint64_t v13 = [(CLBScenePresentationManager *)self name];
      v14 = [(CLBScenePresentationManager *)self bundleIdentifier];
      v15 = [(CLBScenePresentationViewController *)v12 initWithName:v13 bundleIdentifier:v14 supportsClarityUI:[(CLBScenePresentationManager *)self supportsClarityUI] sceneRequestOptions:v6 shouldDisableIdleTimer:[(CLBScenePresentationManager *)self shouldDisableIdleTimer] avoidsBackButton:[(CLBScenePresentationManager *)self avoidsBackButton] displayLayoutStyle:[(CLBScenePresentationManager *)self displayLayoutStyle]];

      if (v15)
      {
        id v16 = [(CLBScenePresentationManager *)self delegate];
        id v17 = [v16 windowForScenePresentationManager:self];

        if (v17)
        {
          if ([(CLBScenePresentationManager *)self avoidsBackButton])
          {
            v18 = +[UIViewController backButtonAvoidingHostingControllerWithContainedViewController:v15];
          }
          else
          {
            v18 = v15;
          }
          uint64_t v22 = v18;
          [v17 setRootViewController:v18];
          [v17 makeKeyAndVisible];
          [(CLBScenePresentationManager *)self setWindow:v17];
          [(CLBScenePresentationManager *)self setScenePresentationViewController:v15];
          v23 = [(CLBScenePresentationManager *)self terminationWatcher];

          if (!v23)
          {
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_100008830;
            v26[3] = &unk_10015BEB8;
            v26[4] = self;
            id v24 = objc_msgSend(objc_alloc((Class)BSProcessDeathWatcher), "initWithPID:queue:deathHandler:", objc_msgSend(v11, "pid"), &_dispatch_main_q, v26);
            [(CLBScenePresentationManager *)self setTerminationWatcher:v24];
          }
          id v25 = [(CLBScenePresentationViewController *)v15 scene];
          ((void (**)(id, void *, void *))v7)[2](v7, v25, 0);
        }
        else
        {
          id v21 = +[NSError errorWithDomain:@"CLBScenePresentationManagerErrorDomain" code:-2005 userInfo:0];
          v7[2](v7, 0, v21);
        }
      }
      else
      {
        uint64_t v20 = +[NSError errorWithDomain:@"CLBScenePresentationManagerErrorDomain" code:-2004 userInfo:0];
        v7[2](v7, 0, v20);
      }
    }
    else
    {
      id v19 = +[CLFLog commonLog];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000FF4B0(self, v19);
      }

      v15 = +[NSError errorWithDomain:@"CLBScenePresentationManagerErrorDomain" code:-2003 userInfo:0];
      v7[2](v7, 0, v15);
    }
  }
}

- (void)tearDownSceneIfNeeded
{
  BSDispatchQueueAssertMain();
  v3 = [(CLBScenePresentationManager *)self window];

  if (v3)
  {
    id v4 = [(CLBScenePresentationManager *)self scenePresentationViewController];
    [v4 invalidateIfNeeded];

    [(CLBScenePresentationManager *)self setScenePresentationViewController:0];
    objc_super v5 = [(CLBScenePresentationManager *)self window];
    [v5 setHidden:1];

    [(CLBScenePresentationManager *)self setWindow:0];
    id v6 = +[CLFLog commonLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(CLBScenePresentationManager *)self name];
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Tore down %@ scene.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (BOOL)isPresented
{
  BSDispatchQueueAssertMain();
  v3 = [(CLBScenePresentationManager *)self window];
  LOBYTE(self) = v3 != 0;

  return (char)self;
}

- (int)presentedPID
{
  v2 = [(CLBScenePresentationManager *)self _process];
  int v3 = [v2 pid];

  return v3;
}

- (BOOL)shouldDisableIdleTimer
{
  return 0;
}

- (BOOL)avoidsBackButton
{
  return 0;
}

- (int64_t)displayLayoutStyle
{
  return 1;
}

- (id)_process
{
  int v3 = +[FBProcessManager sharedInstanceIfExists];
  id v4 = [(CLBScenePresentationManager *)self bundleIdentifier];
  objc_super v5 = [v3 processesForBundleIdentifier:v4];
  id v6 = [v5 firstObject];

  return v6;
}

- (void)_willEnableSecureMode:(id)a3
{
  if (![(CLBScenePresentationManager *)self isAllowedOnLockScreen])
  {
    id v4 = [(CLBScenePresentationManager *)self window];

    if (v4)
    {
      objc_super v5 = +[CLFLog commonLog];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [(CLBScenePresentationManager *)self bundleIdentifier];
        int v8 = 138412290;
        uint64_t v9 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Hiding window for %@ before enabling secure mode.", (uint8_t *)&v8, 0xCu);
      }
      id v7 = [(CLBScenePresentationManager *)self window];
      [v7 setHidden:1];
    }
  }
}

- (void)_didDisableSecureMode:(id)a3
{
  if (![(CLBScenePresentationManager *)self isAllowedOnLockScreen])
  {
    id v4 = [(CLBScenePresentationManager *)self window];

    if (v4)
    {
      objc_super v5 = +[CLFLog commonLog];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [(CLBScenePresentationManager *)self bundleIdentifier];
        int v8 = 138412290;
        uint64_t v9 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing window for %@ after disabling secure mode.", (uint8_t *)&v8, 0xCu);
      }
      id v7 = [(CLBScenePresentationManager *)self window];
      [v7 setHidden:0];
    }
  }
}

- (CLBScenePresentationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CLBScenePresentationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (CLBScenePresentationViewController)scenePresentationViewController
{
  return self->_scenePresentationViewController;
}

- (void)setScenePresentationViewController:(id)a3
{
}

- (BSProcessDeathWatcher)terminationWatcher
{
  return self->_terminationWatcher;
}

- (void)setTerminationWatcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminationWatcher, 0);
  objc_storeStrong((id *)&self->_scenePresentationViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (NSString)name
{
  sub_100008E58();
  uint64_t v2 = objc_opt_class();
  sub_100008E3C(v2);
  return (NSString *)&stru_100167328;
}

- (NSString)sceneSessionRole
{
  sub_100008E58();
  uint64_t v2 = objc_opt_class();
  sub_100008E3C(v2);
  int v3 = (void *)UISceneSessionRoleNone;

  return (NSString *)v3;
}

- (BOOL)isAllowedOnLockScreen
{
  sub_100008E58();
  uint64_t v2 = objc_opt_class();
  sub_100008E3C(v2);
  return 0;
}

- (NSString)bundleIdentifier
{
  sub_100008E58();
  uint64_t v2 = objc_opt_class();
  sub_100008E3C(v2);
  return (NSString *)&stru_100167328;
}

- (BOOL)supportsClarityUI
{
  sub_100008E58();
  uint64_t v2 = objc_opt_class();
  sub_100008E3C(v2);
  return 0;
}

- (BOOL)requestsSceneWhenNeeded
{
  sub_100008E58();
  uint64_t v2 = objc_opt_class();
  sub_100008E3C(v2);
  return 0;
}

- (NSString)entitlement
{
  sub_100008E58();
  uint64_t v2 = objc_opt_class();
  sub_100008E3C(v2);
  return (NSString *)&stru_100167328;
}

@end