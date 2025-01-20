@interface AppDelegate
- (BOOL)_touchIDDidTimeout;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (FBKLaunchAction)launchAction;
- (LAContext)lastUsedLAContext;
- (NSTimer)biometricsWatchDog;
- (UIVisualEffectView)blurView;
- (UIWindow)window;
- (id)newLAContext;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (unint64_t)biometricsState;
- (unint64_t)orientationMask;
- (unint64_t)supportedInterfaceOrientations;
- (void)_invalidateWatchDogTimer;
- (void)_logOutForBiometricsAuthFailure;
- (void)_performBiometricsEvaluationWithContext:(id)a3;
- (void)_performInteractiveLoginWithManager:(id)a3;
- (void)_startBiometricsTimer;
- (void)addBlurView;
- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4;
- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4;
- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)blockLandscapeOrientations:(BOOL)a3;
- (void)handleInteractiveLoginResultWithLoginManager:(id)a3 pendingUI:(unint64_t)a4 startupFailures:(unint64_t)a5;
- (void)handleInteractiveLoginResultWithLoginManager:(id)a3 pendingUI:(unint64_t)a4 startupFailures:(unint64_t)a5 skipBiometrics:(BOOL)a6;
- (void)handleLaunchAction:(id)a3 completion:(id)a4;
- (void)performBiometricAuthenticationIfNeeded;
- (void)removeBlurView;
- (void)saveBiometricsDate;
- (void)setBiometricsState:(unint64_t)a3;
- (void)setBiometricsWatchDog:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setLastUsedLAContext:(id)a3;
- (void)setLaunchAction:(id)a3;
- (void)setOrientationMask:(unint64_t)a3;
- (void)setWindow:(id)a3;
- (void)showSimpleAlertWithErrorTitle:(id)a3 message:(id)a4;
- (void)updateHomeScreenVisibilityFromLaunchAction:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = &OBJC_IVAR___FBASubmissionTimer__delegate;
  v9 = +[FBALog appHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000A50D8();
  }

  v10 = +[NSProcessInfo processInfo];
  v11 = [v10 environment];
  v12 = [v11 objectForKeyedSubscript:@"FBK_UNIT_TEST"];

  if (!v12)
  {
    +[FBAUserDefaultsMigrator run];
    _FBKResetDefaultsIfNeeded();
    v13 = +[DEDManager sharedInstance];
    [v13 start];
    id v14 = +[FBKDeviceManager sharedInstance];
    v15 = objc_alloc_init(FBATestSupport);
    v16 = +[NSProcessInfo processInfo];
    v17 = [v16 arguments];
    [(FBATestSupport *)v15 processLaunchArgumentsWithArgs:v17];

    v18 = [(AppDelegate *)self window];
    v19 = [v18 rootViewController];

    [v19 setDelegate:self];
    id v20 = objc_alloc((Class)UIVisualEffectView);
    v21 = +[UIBlurEffect effectWithStyle:4];
    id v22 = [v20 initWithEffect:v21];
    [(AppDelegate *)self setBlurView:v22];

    v23 = [(AppDelegate *)self window];
    v24 = [v23 rootViewController];
    v25 = [v24 view];
    [v25 bounds];
    double Height = CGRectGetHeight(v58);

    v27 = [(AppDelegate *)self window];
    v28 = [v27 rootViewController];
    v29 = [v28 view];
    [v29 bounds];
    double Width = CGRectGetWidth(v59);

    if (Height <= Width) {
      double Height = Width;
    }
    v31 = [(AppDelegate *)self blurView];
    [v31 setFrame:CGRectMake(0.0, 0.0, Height, Height)];

    v32 = +[UIApplication sharedApplication];
    id v55 = [v32 applicationState];

    v33 = +[FBKData sharedInstance];
    v34 = [v33 loginManager];

    v35 = +[NSUserDefaults standardUserDefaults];
    unsigned int v36 = [v35 BOOLForKey:FBKPushNotificationsEnabled];

    if (v36) {
      [v6 registerForRemoteNotifications];
    }
    v37 = +[UNUserNotificationCenter currentNotificationCenter];
    [v37 setDelegate:self];

    v38 = +[iFBAConstants tintColor];
    v39 = [(AppDelegate *)self window];
    [v39 setTintColor:v38];

    v40 = [v7 objectForKeyedSubscript:UIApplicationLaunchOptionsURLKey];
    if (FBKIsInternalInstall())
    {
      v54 = v13;
      v41 = +[NSUserDefaults standardUserDefaults];
      uint64_t v42 = FBKLaunchActionOnLaunch;
      v43 = [v41 stringForKey:FBKLaunchActionOnLaunch];

      if (!v43)
      {
        v13 = v54;
        v8 = &OBJC_IVAR___FBASubmissionTimer__delegate;
        if (!v40) {
          goto LABEL_19;
        }
        goto LABEL_14;
      }
      v53 = v19;
      v44 = +[FBALog appHandle];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = +[NSUserDefaults standardUserDefaults];
        v46 = [v45 stringForKey:v42];
        *(_DWORD *)buf = 138412290;
        v57 = v46;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Auto-running URL Action %@", buf, 0xCu);
      }
      v47 = +[NSUserDefaults standardUserDefaults];
      v48 = [v47 stringForKey:v42];
      uint64_t v49 = +[NSURL URLWithString:v48];

      v50 = +[FBKLaunchAction actionWithURL:v49];
      [(AppDelegate *)self handleLaunchAction:v50 completion:0];

      v40 = (void *)v49;
      v19 = v53;
      v13 = v54;
      v8 = &OBJC_IVAR___FBASubmissionTimer__delegate;
    }
    if (!v40) {
      goto LABEL_19;
    }
LABEL_14:
    if ([v40 handlesLogin])
    {
      v51 = [v8 + 688 appHandle];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Anon url action found. Skipping interactive login sequence", buf, 2u);
      }

      goto LABEL_22;
    }
LABEL_19:
    if (v55 == (id)2) {
      [v34 backgroundStartupWithCompletion:&stru_1000F2D38];
    }
    else {
      [(AppDelegate *)self _performInteractiveLoginWithManager:v34];
    }
LABEL_22:
    +[FBADraftDirectoriesCleanUp run];
    +[FBADirectoriesMigrator run];
    +[FBAAppGroupMigrator run];
    +[FBKSharedConstants deleteStaleAttachmentLegalTextEntries];
    [(AppDelegate *)self setOrientationMask:[(AppDelegate *)self supportedInterfaceOrientations]];
  }
  return 1;
}

- (void)applicationDidBecomeActive:(id)a3
{
  v4 = +[NSProcessInfo processInfo];
  v5 = [v4 environment];
  id v6 = [v5 objectForKeyedSubscript:@"FBK_UNIT_TEST"];

  if (!v6)
  {
    id v7 = +[FBALog appHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Did become active", buf, 2u);
    }

    v8 = +[FBKData sharedInstance];
    v9 = [v8 loginManager];

    [(AppDelegate *)self _performInteractiveLoginWithManager:v9];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001B9F8;
    v10[3] = &unk_1000F2D60;
    v10[4] = self;
    [v9 runAfterLogin:v10];
  }
}

- (void)applicationWillResignActive:(id)a3
{
  v3 = +[FBALog appHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will resign active", v4, 2u);
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  v4 = +[NSProcessInfo processInfo];
  v5 = [v4 environment];
  id v6 = [v5 objectForKeyedSubscript:@"FBK_UNIT_TEST"];

  if (!v6)
  {
    id v7 = +[FBALog appHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Did enter background", buf, 2u);
    }

    v8 = +[FBKData sharedInstance];
    uint64_t v11 = 0;
    [v8 saveToStore:&v11];
    if (!v11)
    {
      v9 = [v8 currentUser];

      if (v9)
      {
        v10 = [v8 currentUser];
        [v8 reduceToFault:v10];
      }
    }
    [(AppDelegate *)self addBlurView];
    [(AppDelegate *)self saveBiometricsDate];
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  v4 = +[FBALog appHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will enter foreground", buf, 2u);
  }

  v5 = +[FBKData sharedInstance];
  id v6 = [v5 loginManager];

  if ([v6 loginState] != (id)1)
  {
    v9 = sub_10001BBC8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000A515C();
    }

    id v7 = self;
    uint64_t v8 = 1;
    goto LABEL_9;
  }
  if ((id)[(AppDelegate *)self biometricsState] == (id)3)
  {
    id v7 = self;
    uint64_t v8 = 5;
LABEL_9:
    [(AppDelegate *)v7 setBiometricsState:v8];
    goto LABEL_13;
  }
  v10 = sub_10001BBC8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "will perform biometric evaluation if needed", v11, 2u);
  }

  [(AppDelegate *)self performBiometricAuthenticationIfNeeded];
LABEL_13:
}

- (void)applicationWillTerminate:(id)a3
{
  v4 = +[FBALog appHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will terminate", buf, 2u);
  }

  v5 = +[DEDRequestAdvertiser sharedInstance];
  [v5 stop];

  id v6 = +[FBKData sharedInstance];
  id v7 = [v6 loginManager];

  if ([v7 loginState] == (id)1)
  {
    uint64_t v8 = [(AppDelegate *)self launchAction];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(AppDelegate *)self launchAction];
      unsigned int v11 = [v10 isCaptive];

      if (v11)
      {
        v12 = +[FBALog appHandle];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "App was force quit in restricted mode, logging out.", v15, 2u);
        }

        [v7 logOut];
        v13 = [(AppDelegate *)self launchAction];
        if ([v13 shouldMakeFBAVisible])
        {
          unsigned __int8 v14 = +[iFBKUtils wasFBAVisibleAtFirstLaunch];

          if ((v14 & 1) == 0) {
            +[iFBKUtils removeFromHomeScreen];
          }
        }
        else
        {
        }
        [(AppDelegate *)self setLaunchAction:0];
      }
    }
  }
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  v13 = (void (**)(id, void))a5;
  id v7 = [a4 type];
  uint64_t v8 = [v7 componentsSeparatedByString:@"."];
  v9 = [v8 lastObject];
  unsigned int v10 = [v9 isEqualToString:@"compose"];

  if (v10)
  {
    unsigned int v11 = +[NSURL URLWithString:@"applefeedback://new"];
    v12 = +[FBKLaunchAction actionWithURL:v11];

    [(AppDelegate *)self handleLaunchAction:v12 completion:v13];
  }
  else
  {
    v13[2](v13, 0);
  }
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6 = a4;
  id v7 = +[FBALog appHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 136446210;
    unsigned int v11 = "-[AppDelegate application:openURL:options:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}s]", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v8 = +[FBKLaunchAction actionWithURL:v6];

  [(AppDelegate *)self handleLaunchAction:v8 completion:0];
  return 1;
}

- (void)handleLaunchAction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[FBALog appHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling Launch Action [%{public}@]", buf, 0xCu);
  }

  [(AppDelegate *)self setLaunchAction:v6];
  if ([v6 launchesInbox]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = (uint64_t)[v6 isShowContentItemAction];
  }
  int v10 = +[FBADraftManager sharedInstance];
  [v10 setInboxLiteMode:v9];

  unsigned int v11 = +[FBKData sharedInstance];
  v12 = [v11 loginManager];
  if ([v6 handlesLogin])
  {
    [v12 clearLoginTaskQueue];
    v13 = +[FBALog newURLActionActivity];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C53C;
    block[3] = &unk_1000F2DB0;
    unsigned __int8 v14 = &v24;
    id v24 = v12;
    id v25 = v6;
    v26 = self;
    id v27 = v7;
    id v15 = v6;
    id v16 = v7;
    os_activity_apply(v13, block);

    v17 = v25;
  }
  else
  {
    [(AppDelegate *)self updateHomeScreenVisibilityFromLaunchAction:v6];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001C7A0;
    v20[3] = &unk_1000F2E00;
    unsigned __int8 v14 = &v22;
    id v21 = v6;
    id v22 = v7;
    v20[4] = self;
    id v18 = v6;
    id v19 = v7;
    [v12 runAfterLogin:v20];
    v17 = v21;
  }
}

- (void)updateHomeScreenVisibilityFromLaunchAction:(id)a3
{
  id v3 = a3;
  if ([v3 shouldMakeFBAVisible])
  {
    +[iFBKUtils addToHomeScreen];
  }
  else if ([v3 shouldUndoMakeFBAVisible])
  {
    +[iFBKUtils removeFromHomeScreen];
  }
}

- (void)handleInteractiveLoginResultWithLoginManager:(id)a3 pendingUI:(unint64_t)a4 startupFailures:(unint64_t)a5
{
}

- (void)handleInteractiveLoginResultWithLoginManager:(id)a3 pendingUI:(unint64_t)a4 startupFailures:(unint64_t)a5 skipBiometrics:(BOOL)a6
{
  id v12 = a3;
  int v10 = [(AppDelegate *)self window];
  unsigned int v11 = [v10 rootViewController];

  if (a5)
  {
    [v11 presentConnectionErrorUI];
    goto LABEL_9;
  }
  if ((a5 & 2) != 0)
  {
    [v11 presentVersionOutdatedUI];
    goto LABEL_9;
  }
  if ((a5 & 4) != 0)
  {
    [v11 displayNonParticipant];
LABEL_9:
    if (a4) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (a4)
  {
    [v11 presentStartupUI:a4];
    goto LABEL_13;
  }
  if (!a5) {
    [v11 clearBlockingUI];
  }
LABEL_10:
  if ([v12 loginState] == (id)1 && !a6) {
    [(AppDelegate *)self performBiometricAuthenticationIfNeeded];
  }
LABEL_13:
}

- (void)_performInteractiveLoginWithManager:(id)a3
{
  id v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_10001CBB0;
  v8[4] = sub_10001CBC0;
  uint64_t v9 = self;
  if ([v4 loginState] != (id)3
    && [v4 loginState] != (id)4
    && [v4 loginState] != (id)1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001CBC8;
    v5[3] = &unk_1000F2E28;
    id v7 = v8;
    id v6 = v4;
    [v6 interactiveStartupWithCompletion:v5];
  }
  _Block_object_dispose(v8, 8);
}

- (void)addBlurView
{
  if (+[iFBAConstants supportsBiometricsLock])
  {
    id v3 = +[FBALog appHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000A5190();
    }

    id v4 = [(AppDelegate *)self blurView];
    v5 = [v4 superview];

    if (!v5)
    {
      id v6 = +[FBALog appHandle];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did add blur view", v9, 2u);
      }

      id v7 = [(AppDelegate *)self window];
      uint64_t v8 = [(AppDelegate *)self blurView];
      [v7 addSubview:v8];
    }
  }
}

- (void)removeBlurView
{
  id v3 = +[FBALog appHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000A51C4();
  }

  id v4 = [(AppDelegate *)self blurView];
  v5 = [v4 superview];

  if (v5)
  {
    id v6 = +[FBALog appHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "did remove blur view", v8, 2u);
    }

    id v7 = [(AppDelegate *)self blurView];
    [v7 removeFromSuperview];
  }
}

- (BOOL)_touchIDDidTimeout
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"TouchIDLastRequested"];

  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 integerForKey:@"TouchIDTimeoutDuration"];

  id v6 = +[NSDate date];
  [v6 timeIntervalSinceDate:v3];
  LOBYTE(v5) = v7 >= (double)(uint64_t)v5;

  return (char)v5;
}

- (void)setBiometricsState:(unint64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v4->_biometricsState = a3;
  switch(a3)
  {
    case 0uLL:
      id v16 = sub_10001BBC8();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Biometrics authentication is not enabled", (uint8_t *)&v20, 2u);
      }

      goto LABEL_38;
    case 1uLL:
      goto LABEL_38;
    case 2uLL:
      uint64_t v9 = sub_10001BBC8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Biometric evaluation pending. Will perform evaluation", (uint8_t *)&v20, 2u);
      }

      [(AppDelegate *)v4 addBlurView];
      int v10 = [(AppDelegate *)v4 lastUsedLAContext];
      [(AppDelegate *)v4 _performBiometricsEvaluationWithContext:v10];
      goto LABEL_12;
    case 3uLL:
      unsigned int v11 = sub_10001BBC8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v17 = [(AppDelegate *)v4 lastUsedLAContext];
        int v20 = 138412290;
        id v21 = v17;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Biometric evaluation began with context [%@]", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_34;
    case 4uLL:
    case 0xAuLL:
      id v5 = sub_10001BBC8();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_19;
      }
      LOWORD(v20) = 0;
      id v6 = "Biometrics stuck - locking out";
      double v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_INFO;
      goto LABEL_18;
    case 5uLL:
      id v18 = sub_10001BBC8();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Biometrics evaluation happened while app was in background - Retrying", (uint8_t *)&v20, 2u);
      }

      [(AppDelegate *)v4 addBlurView];
      [(AppDelegate *)v4 performBiometricAuthenticationIfNeeded];
      goto LABEL_39;
    case 6uLL:
      unsigned int v11 = sub_10001BBC8();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
      LOWORD(v20) = 0;
      id v12 = "Biometric evaluation completed";
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
      goto LABEL_33;
    case 7uLL:
      unsigned int v11 = sub_10001BBC8();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      LOWORD(v20) = 0;
      id v12 = "Biometric unlock failed - not authenticated";
      goto LABEL_32;
    case 8uLL:
      id v15 = sub_10001BBC8();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Biometric unlock cancelled by user - likely that user pressed Cancel (suspending).", (uint8_t *)&v20, 2u);
      }

      [(AppDelegate *)v4 addBlurView];
      int v10 = +[UIApplication sharedApplication];
      [v10 suspendReturningToLastApp:1];
LABEL_12:

      goto LABEL_39;
    case 9uLL:
      unsigned int v11 = sub_10001BBC8();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      LOWORD(v20) = 0;
      id v12 = "Biometric unlock cancelled by system – likely that user went home.";
LABEL_32:
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v20, 2u);
LABEL_34:

      [(AppDelegate *)v4 addBlurView];
      goto LABEL_39;
    case 0xBuLL:
      id v5 = sub_10001BBC8();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      LOWORD(v20) = 0;
      id v6 = "Biometric unlock unavailable - biometry is in lockout.";
      goto LABEL_17;
    case 0xCuLL:
      id v5 = sub_10001BBC8();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      LOWORD(v20) = 0;
      id v6 = "Biometric unlock failed - unknown error.";
LABEL_17:
      double v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, (uint8_t *)&v20, 2u);
LABEL_19:

      [(AppDelegate *)v4 _logOutForBiometricsAuthFailure];
LABEL_39:
      objc_sync_exit(v4);

      return;
    case 0xDuLL:
      id v19 = sub_10001BBC8();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Biometric unlock succeeded", (uint8_t *)&v20, 2u);
      }

      [(AppDelegate *)v4 _invalidateWatchDogTimer];
      [(AppDelegate *)v4 saveBiometricsDate];
LABEL_38:
      [(AppDelegate *)v4 removeBlurView];
      goto LABEL_39;
    default:
      goto LABEL_39;
  }
}

- (void)_invalidateWatchDogTimer
{
  id v3 = [(AppDelegate *)self biometricsWatchDog];

  if (v3)
  {
    id v4 = [(AppDelegate *)self biometricsWatchDog];
    [v4 invalidate];

    [(AppDelegate *)self setBiometricsWatchDog:0];
  }
}

- (void)_startBiometricsTimer
{
  [(AppDelegate *)self _invalidateWatchDogTimer];
  [(AppDelegate *)self lastUsedLAContext];
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  double v7 = sub_10001D484;
  os_log_type_t v8 = &unk_1000F2E50;
  uint64_t v9 = self;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v10;
  id v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v5 block:8.0];
  -[AppDelegate setBiometricsWatchDog:](self, "setBiometricsWatchDog:", v4, v5, v6, v7, v8, v9);
}

- (void)_logOutForBiometricsAuthFailure
{
  [(AppDelegate *)self addBlurView];
  id v3 = +[FBKData sharedInstance];
  id v4 = [v3 loginManager];
  [v4 logOut];

  id v6 = [(AppDelegate *)self window];
  id v5 = [v6 rootViewController];
  [v5 dismissViewControllerAnimated:0 completion:0];
}

- (void)saveBiometricsDate
{
  if ((id)[(AppDelegate *)self biometricsState] == (id)13)
  {
    id v3 = +[NSDate date];
    id v4 = sub_10001BBC8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 description];
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saving biometrics date [%@]", (uint8_t *)&v9, 0xCu);
    }
    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setObject:v3 forKey:@"TouchIDLastRequested"];
  }
  else
  {
    unint64_t v7 = [(AppDelegate *)self biometricsState];
    os_log_type_t v8 = sub_10001BBC8();
    id v3 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Not Authenticated. Will not save bio timer", (uint8_t *)&v9, 2u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      sub_1000A539C();
    }
  }
}

- (id)newLAContext
{
  id v3 = objc_opt_new();
  [(AppDelegate *)self setLastUsedLAContext:v3];
  return v3;
}

- (void)performBiometricAuthenticationIfNeeded
{
  if (!+[iFBAConstants supportsBiometricsLock]) {
    goto LABEL_12;
  }
  if ((id)[(AppDelegate *)self biometricsState] == (id)3)
  {
    id v3 = sub_10001BBC8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Already evaluating biometrics", buf, 2u);
    }

    return;
  }
  id v4 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v5 = [v4 BOOLForKey:@"UseTouchIDLogin"];

  if (v5)
  {
    id v6 = sub_10001BBC8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Biometrics authentication enabled", v15, 2u);
    }

    if ([(AppDelegate *)self _touchIDDidTimeout])
    {
      id v7 = [(AppDelegate *)self newLAContext];
      id v13 = 0;
      unsigned __int8 v8 = [v7 canEvaluatePolicy:1 error:&v13];
      id v9 = v13;
      id v10 = v9;
      if (v8)
      {
        uint64_t v11 = 2;
      }
      else if (v9 && [v9 code] == (id)-8)
      {
        uint64_t v11 = 11;
      }
      else
      {
        uint64_t v11 = 12;
      }
      [(AppDelegate *)self setBiometricsState:v11];
    }
    else
    {
      id v12 = sub_10001BBC8();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)os_log_type_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Biometrics authentication has not timed out", v14, 2u);
      }

      [(AppDelegate *)self setBiometricsState:13];
    }
  }
  else
  {
LABEL_12:
    [(AppDelegate *)self setBiometricsState:0];
  }
}

- (void)_performBiometricsEvaluationWithContext:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSMutableDictionary dictionary];
  [v5 setObject:&off_1000FA890 forKey:&off_1000FA8A8];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"TOUCH_ID_PROMPT" value:&stru_1000F6658 table:0];

  if (+[iFBKUtils deviceSupportsFaceID])
  {
    unsigned __int8 v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"FACE_ID_PROMPT" value:&stru_1000F6658 table:0];

    id v7 = (void *)v9;
  }
  [v5 setObject:v7 forKey:&off_1000FA8C0];
  [(AppDelegate *)self setBiometricsState:3];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001DC60;
  v11[3] = &unk_1000F2E78;
  id v12 = v4;
  id v13 = self;
  id v10 = v4;
  [v10 evaluatePolicy:1 options:v5 reply:v11];
}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  id v4 = a4;
  id v5 = +[FBANotificationManager sharedManager];
  [v5 saveToken:v4];
}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v4 = a4;
  id v5 = +[FBALog appHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000A5478(v4);
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  unsigned __int8 v8 = (void (**)(void))a5;
  uint64_t v9 = +[FBALog appHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000A5500();
  }

  id v10 = [v7 notification];
  uint64_t v11 = [v10 request];
  id v12 = [v11 content];
  id v13 = [v12 userInfo];

  os_log_type_t v14 = +[FBALog appHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CGRect v58 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "user info: %@", buf, 0xCu);
  }

  id v15 = [v13 objectForKeyedSubscript:FBKPushItemTypeKey];
  id v16 = [v13 objectForKeyedSubscript:FBKPushItemIDKey];
  if (v16 && v15)
  {
    id v47 = v7;
    v17 = [(AppDelegate *)self window];
    id v18 = [v17 rootViewController];

    id v19 = +[FBKData sharedInstance];
    int v20 = [v18 viewControllers];
    id v21 = [v20 lastObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v23 = [v18 viewControllers];
      id v24 = [v23 lastObject];

      id v25 = [v24 topViewController];
    }
    else
    {
      id v25 = 0;
    }
    v26 = +[UIStoryboard storyboardWithName:@"Main" bundle:0];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10001E5B0;
    v48[3] = &unk_1000F2F48;
    id v49 = v15;
    id v27 = v25;
    id v50 = v27;
    id v28 = v26;
    id v51 = v28;
    id v29 = v19;
    id v52 = v29;
    id v53 = v16;
    id v30 = v18;
    id v54 = v30;
    id v55 = &stru_1000F2EB8;
    v46 = v8;
    v56 = v8;
    v45 = objc_retainBlock(v48);
    if (([v29 isReloadingContentAndFormItems] & 1) != 0
      || ([v29 loginManager],
          v31 = objc_claimAutoreleasedReturnValue(),
          id v32 = [v31 loginState],
          v31,
          !v32))
    {
      v34 = [v29 notificationCenter];
      uint64_t v35 = FBKDidRefreshContentItemsNotification;
      +[NSOperationQueue mainQueue];
      unsigned int v36 = v13;
      v37 = v16;
      v38 = v15;
      id v39 = v30;
      id v40 = v28;
      uint64_t v42 = v41 = v27;
      uint64_t v43 = v35;
      v33 = v45;
      id v44 = [v34 addObserverForName:v43 object:v29 queue:v42 usingBlock:v45];

      id v27 = v41;
      id v28 = v40;
      id v30 = v39;
      id v15 = v38;
      id v16 = v37;
      id v13 = v36;
    }
    else
    {
      v33 = v45;
      ((void (*)(void *, void))v45[2])(v45, 0);
    }

    unsigned __int8 v8 = v46;
    id v7 = v47;
  }
  else
  {
    v8[2](v8);
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (unint64_t)supportedInterfaceOrientations
{
  if (qword_100124018 != -1) {
    dispatch_once(&qword_100124018, &stru_1000F2F68);
  }
  return qword_100124010;
}

- (void)blockLandscapeOrientations:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    unint64_t v5 = 6;
  }
  else {
    unint64_t v5 = [(AppDelegate *)self supportedInterfaceOrientations];
  }
  [(AppDelegate *)self setOrientationMask:v5];
  id v6 = +[FBALog appHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 136446722;
    unsigned __int8 v8 = "-[AppDelegate blockLandscapeOrientations:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    __int16 v11 = 2048;
    unint64_t v12 = [(AppDelegate *)self orientationMask];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}s shouldBlock? [%i] mask [%lu]", (uint8_t *)&v7, 0x1Cu);
  }
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  unint64_t v5 = +[FBALog appHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned __int8 v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "handleEventsForBackgroundURLSession", v8, 2u);
  }

  id v6 = +[FBKData sharedInstance];
  int v7 = [v6 loginManager];
  [v7 backgroundStartupWithCompletion:&stru_1000F2F88];
}

- (void)showSimpleAlertWithErrorTitle:(id)a3 message:(id)a4
{
  id v10 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  unint64_t v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"OK" value:&stru_1000F6658 table:0];
  int v7 = +[UIAlertAction actionWithTitle:v6 style:1 handler:0];
  [v10 addAction:v7];

  unsigned __int8 v8 = [(AppDelegate *)self window];
  __int16 v9 = [v8 rootViewController];
  [v9 presentViewController:v10 animated:1 completion:0];
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v4 = [a3 viewControllerForColumn:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 topViewController],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = 2;
  }

  return v7;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (unint64_t)biometricsState
{
  return self->_biometricsState;
}

- (LAContext)lastUsedLAContext
{
  return self->_lastUsedLAContext;
}

- (void)setLastUsedLAContext:(id)a3
{
}

- (NSTimer)biometricsWatchDog
{
  return (NSTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBiometricsWatchDog:(id)a3
{
}

- (FBKLaunchAction)launchAction
{
  return self->_launchAction;
}

- (void)setLaunchAction:(id)a3
{
}

- (unint64_t)orientationMask
{
  return self->_orientationMask;
}

- (void)setOrientationMask:(unint64_t)a3
{
  self->_orientationMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchAction, 0);
  objc_storeStrong((id *)&self->_biometricsWatchDog, 0);
  objc_storeStrong((id *)&self->_lastUsedLAContext, 0);
  objc_storeStrong((id *)&self->_blurView, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end