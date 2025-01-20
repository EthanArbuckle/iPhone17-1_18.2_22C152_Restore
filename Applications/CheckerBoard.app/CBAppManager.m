@interface CBAppManager
+ (id)sharedInstance;
- (BSInvalidatable)layoutElementInvalidator;
- (CBAppManager)init;
- (NSMutableSet)openApps;
- (NSSet)whitelist;
- (NSSet)whitelistPrefixes;
- (UIApplicationSceneClientSettingsDiffInspector)appClientSettingsDiffInspector;
- (double)_effectiveKeyboardSceneLevelForClientSettings:(id)a3;
- (id)_appClientSettingsDiffInspector;
- (id)currentOpenAppBundleIDs;
- (void)_createInputScene;
- (void)_terminateApps:(id)a3 reason:(int64_t)a4 reportCrash:(BOOL)a5 description:(id)a6 completion:(id)a7;
- (void)_updateLevelForScene:(id)a3 transitionContext:(id)a4;
- (void)_windowDidBecomeKey:(id)a3;
- (void)launchAppWithBundleID:(id)a3 suspended:(BOOL)a4 native:(BOOL)a5 completion:(id)a6;
- (void)processManager:(id)a3 didAddProcess:(id)a4;
- (void)processManager:(id)a3 didRemoveProcess:(id)a4;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)sceneManager:(id)a3 willDestroyScene:(id)a4;
- (void)setAppClientSettingsDiffInspector:(id)a3;
- (void)setLayoutElementInvalidator:(id)a3;
- (void)setOpenApps:(id)a3;
- (void)systemService:(id)a3 canActivateApplication:(id)a4 withResult:(id)a5;
- (void)systemService:(id)a3 dataReset:(id)a4 completion:(id)a5;
- (void)systemService:(id)a3 handleActions:(id)a4 origin:(id)a5 withResult:(id)a6;
- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5;
- (void)systemService:(id)a3 isPasscodeLockedOrBlockedWithResult:(id)a4;
- (void)terminateAppWithBundleID:(id)a3 reason:(int64_t)a4 reportCrash:(BOOL)a5 description:(id)a6 completion:(id)a7;
@end

@implementation CBAppManager

+ (id)sharedInstance
{
  if (qword_10008FDF0 != -1) {
    dispatch_once(&qword_10008FDF0, &stru_100079B38);
  }
  v2 = (void *)qword_10008FDE8;

  return v2;
}

- (CBAppManager)init
{
  v26.receiver = self;
  v26.super_class = (Class)CBAppManager;
  v2 = [(CBAppManager *)&v26 init];
  if (v2)
  {
    uint64_t v3 = +[NSSet setWithObjects:@"com.apple.Diagnostics", @"com.apple.DiagnosticsService", 0];
    whitelist = v2->_whitelist;
    v2->_whitelist = (NSSet *)v3;

    uint64_t v5 = +[CBEmergencyCallManager setByAddingEmergencyCallAppToSet:v2->_whitelist];
    v6 = v2->_whitelist;
    v2->_whitelist = (NSSet *)v5;

    uint64_t v7 = +[NSSet setWithObject:@"com.apple.DiagnosticsService."];
    whitelistPrefixes = v2->_whitelistPrefixes;
    v2->_whitelistPrefixes = (NSSet *)v7;

    uint64_t v9 = +[NSMutableSet set];
    openApps = v2->_openApps;
    v2->_openApps = (NSMutableSet *)v9;

    v11 = +[FBSystemService sharedInstance];
    [v11 setDelegate:v2];

    v12 = +[FBProcessManager sharedInstance];
    [v12 addObserver:v2];

    v13 = +[FBSceneManager sharedInstance];
    [v13 addObserver:v2];
    [v13 setDelegate:v2];
    id v14 = objc_alloc((Class)UIRootWindowScenePresentationBinder);
    v15 = +[FBDisplayManager sharedInstance];
    v16 = [v15 mainConfiguration];
    v17 = (UIRootWindowScenePresentationBinder *)[v14 initWithPriority:0 displayConfiguration:v16];
    rootWindowSceneBinder = v2->_rootWindowSceneBinder;
    v2->_rootWindowSceneBinder = v17;

    v19 = +[FBSceneManager sharedInstance];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100019324;
    v24[3] = &unk_100079B60;
    v20 = v2;
    v25 = v20;
    [v19 enumerateScenesWithBlock:v24];

    v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:v20 selector:"_windowDidBecomeKey:" name:UIWindowDidBecomeKeyNotification object:0];

    id v22 = +[_UIKeyboardArbiterHost launchAdvisorWithOmniscientDelegate:0 sceneDelegate:v20];
    [(CBAppManager *)v20 _createInputScene];
  }
  return v2;
}

- (void)launchAppWithBundleID:(id)a3 suspended:(BOOL)a4 native:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = +[NSString stringWithFormat:@"FBSystemService-OpenApplicationRequest: %@", v10];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100019458;
  v16[3] = &unk_100079B88;
  BOOL v20 = a4;
  BOOL v21 = a5;
  id v17 = v10;
  v18 = self;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  v15 = +[FBWorkspaceEvent eventWithName:v12 handler:v16];
  [v15 execute];
}

- (void)terminateAppWithBundleID:(id)a3 reason:(int64_t)a4 reportCrash:(BOOL)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    FBSApplicationTerminationReasonDescription();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  int IsGraceful = FBSApplicationTerminationReasonIsGraceful();
  v18 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = IsGraceful;
    __int16 v31 = 2112;
    v32 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Terminating application (gracefully %d) because %@", (uint8_t *)&buf, 0x12u);
  }

  id v19 = +[NSString stringWithFormat:@"TerminateApp: %@ (%@)", v12, v16];
  objc_initWeak(&buf, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100019844;
  v24[3] = &unk_100079BB0;
  objc_copyWeak(v28, &buf);
  id v20 = v12;
  id v25 = v20;
  v28[1] = (id)a4;
  BOOL v29 = a5;
  id v21 = v13;
  id v26 = v21;
  id v22 = v14;
  id v27 = v22;
  v23 = +[FBWorkspaceEvent eventWithName:v19 handler:v24];
  [v23 execute];

  objc_destroyWeak(v28);
  objc_destroyWeak(&buf);
}

- (void)_terminateApps:(id)a3 reason:(int64_t)a4 reportCrash:(BOOL)a5 description:(id)a6 completion:(id)a7
{
  BOOL v29 = a5;
  id v9 = a3;
  id v31 = a6;
  id v10 = a7;
  id v11 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v9 description];
    *(_DWORD *)id buf = 138412802;
    v42 = v12;
    __int16 v43 = 2048;
    int64_t v44 = a4;
    __int16 v45 = 2112;
    id v46 = v31;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Processes to be killed: (%@) for reason (%ld) and description (%@)", buf, 0x20u);
  }
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100019D14;
  v38[3] = &unk_100079BD8;
  id v13 = v10;
  id v39 = v13;
  id v14 = objc_retainBlock(v38);
  id v15 = [v9 count];
  v16 = CheckerBoardLogHandleForCategory();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    id v28 = v13;
    if (v17)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "We have at least one process to kill", buf, 2u);
    }

    v18 = +[BSBlockSentinel sentinelWithQueue:signalCount:completion:](BSBlockSentinel, "sentinelWithQueue:signalCount:completion:", &_dispatch_main_q, [v9 count], v14);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v19 = v9;
    id v20 = [v19 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v35;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v35 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          unsigned int v25 = [v24 isSystemApplicationProcess];
          id v26 = CheckerBoardLogHandleForCategory();
          BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
          if (v25)
          {
            if (v27)
            {
              *(_WORD *)id buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Process is the system application. Let's leave it be.", buf, 2u);
            }

            [v18 signal];
          }
          else
          {
            if (v27)
            {
              *(_WORD *)id buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Process is a non-system application. Killing process…", buf, 2u);
            }

            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_100019D30;
            v32[3] = &unk_1000795B8;
            id v33 = v18;
            [v24 killForReason:a4 andReport:v29 withDescription:v31 completion:v32];
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v21);
    }

    id v13 = v28;
  }
  else
  {
    if (v17)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "There are no processes to kill…", buf, 2u);
    }

    ((void (*)(void *))v14[2])(v14);
  }
}

- (id)currentOpenAppBundleIDs
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(CBAppManager *)self openApps];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) bundleID];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return v10;
}

- (void)processManager:(id)a3 didAddProcess:(id)a4
{
  id v5 = a4;
  id v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 bundleIdentifier];
    *(_DWORD *)id buf = 138412290;
    long long v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "processManager:didAddProcess: %@", buf, 0xCu);
  }
  v8 = [v5 bundleIdentifier];
  unsigned int v9 = [v8 isEqual:@"com.apple.Diagnostics"];

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001A060;
    v10[3] = &unk_1000795E0;
    id v11 = v5;
    long long v12 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  id v5 = a4;
  id v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 bundleIdentifier];
    *(_DWORD *)id buf = 138412290;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "processManager:didRemoveProcess: %@", buf, 0xCu);
  }
  v8 = [v5 bundleIdentifier];
  unsigned int v9 = [v8 isEqual:@"com.apple.Diagnostics"];

  if (v9)
  {
    id v10 = +[CBIdleSleepManager sharedInstance];
    [v10 setIdleTimerDisabled:0 forReason:@"AppRequest"];

    id v11 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100048E28(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    id v19 = +[NSNotificationCenter defaultCenter];
    [v19 postNotificationName:@"AppManagerPrimaryAppDidExit" object:self];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001A39C;
    v20[3] = &unk_1000795E0;
    id v21 = v5;
    uint64_t v22 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 clientProcess];
  if ([v14 isApplicationProcess]
    && ([v14 isSystemApplicationProcess] & 1) == 0)
  {
    uint64_t v15 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Process is a non-system application.", v20, 2u);
    }

    uint64_t v16 = objc_alloc_init(CBAppClientSettingObserverContext);
    [(CBAppClientSettingObserverContext *)v16 setScene:v10];
    uint64_t v17 = [v10 settings];
    [(CBAppClientSettingObserverContext *)v16 setSettings:v17];

    [(CBAppClientSettingObserverContext *)v16 setOldClientSettings:v12];
    uint64_t v18 = [v10 clientSettings];
    [(CBAppClientSettingObserverContext *)v16 setUpdatedClientSettings:v18];

    [(CBAppClientSettingObserverContext *)v16 setTransition:v13];
    id v19 = [(CBAppManager *)self _appClientSettingsDiffInspector];
    [v19 inspectDiff:v11 withContext:v16];
  }
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v5 = a4;
  [v5 addObserver:self];
  [(UIRootWindowScenePresentationBinder *)self->_rootWindowSceneBinder addScene:v5];
}

- (void)_windowDidBecomeKey:(id)a3
{
  v4 = +[FBSceneManager sharedInstance];
  id v5 = +[CBSceneManager sceneIdentifier:1];
  id v7 = [v4 sceneWithIdentifier:v5];

  id v6 = v7;
  if (v7)
  {
    [(CBAppManager *)self _updateLevelForScene:v7 transitionContext:0];
    id v6 = v7;
  }
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v6 = [v9 identifier];
  id v7 = +[CBSceneManager sceneIdentifier:1];
  unsigned int v8 = [v6 isEqualToString:v7];

  if (v8) {
    [(CBAppManager *)self _updateLevelForScene:v9 transitionContext:0];
  }
}

- (double)_effectiveKeyboardSceneLevelForClientSettings:(id)a3
{
  id v3 = a3;
  v4 = [v3 preferredSceneHostIdentifier];
  if (![v4 length]
    || (FBSystemAppBundleID(),
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v4 isEqualToString:v5],
        v5,
        double v7 = 11.0,
        v6))
  {
    unsigned int v8 = +[UIWindow keyWindow];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 firstResponder];

      if (v10)
      {
        [v9 windowLevel];
        double v7 = v11 + 2.0;
      }
      else
      {
        [v3 preferredLevel];
        double v7 = v12;
      }
    }
    else
    {
      double v7 = 11.0;
    }
  }
  return v7;
}

- (void)_updateLevelForScene:(id)a3 transitionContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[CBSceneManager windowLevel:1];
  double v8 = v7;
  id v9 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412546;
    id v20 = v5;
    __int16 v21 = 2048;
    double v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating level for scene (%@) to client settings' preferred level %f", buf, 0x16u);
  }

  id v10 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = [v5 settings];
    [v11 level];
    *(_DWORD *)id buf = 134218240;
    id v20 = v12;
    __int16 v21 = 2048;
    double v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Comparing scene settings level (%f) to level (%f)", buf, 0x16u);
  }
  id v13 = [v5 settings];
  [v13 level];
  double v15 = v14;

  if (v15 != v8)
  {
    uint64_t v16 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412546;
      id v20 = v5;
      __int16 v21 = 2048;
      double v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Scene (%@) is setting level to: %f", buf, 0x16u);
    }

    if (v6)
    {
      uint64_t v17 = [v6 animationFence];
      +[UIScene _synchronizeDrawingWithFence:v17];
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001AAE0;
    v18[3] = &unk_100079BF8;
    *(double *)&v18[4] = v8;
    [v5 updateSettingsWithBlock:v18];
  }
}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
}

- (id)_appClientSettingsDiffInspector
{
  id v3 = [(CBAppManager *)self appClientSettingsDiffInspector];

  if (!v3)
  {
    v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating app client settings diff inspector…", v9, 2u);
    }

    id v5 = objc_alloc_init((Class)UIApplicationSceneClientSettingsDiffInspector);
    [(CBAppManager *)self setAppClientSettingsDiffInspector:v5];

    id v6 = [(CBAppManager *)self appClientSettingsDiffInspector];
    [v6 observeIdleTimerDisabledWithBlock:&stru_100079C38];
  }
  double v7 = [(CBAppManager *)self appClientSettingsDiffInspector];

  return v7;
}

- (void)systemService:(id)a3 canActivateApplication:(id)a4 withResult:(id)a5
{
  id v7 = a4;
  double v8 = (void (**)(id, uint64_t))a5;
  id v9 = [(CBAppManager *)self whitelist];
  unsigned __int8 v10 = [v9 containsObject:v7];

  if (v10)
  {
    uint64_t v11 = 0;
    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  double v12 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100048E60((uint64_t)v7, v12);
  }

  uint64_t v11 = 3;
  if (v8) {
LABEL_7:
  }
    v8[2](v8, v11);
LABEL_8:
}

- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 bundleIdentifier];
  unsigned __int8 v10 = [(CBAppManager *)self whitelist];
  unsigned int v11 = [v10 containsObject:v9];

  if (v11)
  {
    double v12 = [v7 clientProcess];
    id v13 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412546;
      id v20 = v9;
      __int16 v21 = 2112;
      double v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received open application request for [%@] from %@.", buf, 0x16u);
    }

    double v14 = [v7 options];
    double v15 = [v14 dictionary];
    uint64_t v16 = [v15 bs_safeObjectForKey:FBSOpenApplicationOptionKeyActivateSuspended ofType:objc_opt_class()];

    uint64_t v17 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      id v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Suspended request: %@", buf, 0xCu);
    }

    -[CBAppManager launchAppWithBundleID:suspended:native:completion:](self, "launchAppWithBundleID:suspended:native:completion:", v9, [v16 BOOLValue], 0, v8);
  }
  else
  {
    uint64_t v18 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100048E60((uint64_t)v9, v18);
    }

    double v12 = FBSOpenApplicationErrorCreate();
    (*((void (**)(id, void *))v8 + 2))(v8, v12);
    uint64_t v16 = v8;
  }
}

- (void)systemService:(id)a3 isPasscodeLockedOrBlockedWithResult:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
}

- (void)systemService:(id)a3 handleActions:(id)a4 origin:(id)a5 withResult:(id)a6
{
  if (a6) {
    (*((void (**)(id, void))a6 + 2))(a6, 0);
  }
}

- (void)systemService:(id)a3 dataReset:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  }
}

- (void)_createInputScene
{
  id v3 = +[NSUUID UUID];
  v4 = [v3 UUIDString];

  id v5 = +[FBSMutableSceneDefinition definition];
  id v6 = +[FBSSceneIdentity identityForIdentifier:v4];
  [v5 setIdentity:v6];

  id v7 = +[RBSProcessIdentity identityForAngelJobLabel:@"com.apple.InputUI"];
  if (v7)
  {
    id v8 = +[FBSSceneClientIdentity identityForProcessIdentity:v7];
    [v5 setClientIdentity:v8];

    id v9 = +[UIApplicationSceneSpecification specification];
    [v5 setSpecification:v9];

    unsigned __int8 v10 = +[FBSceneManager sharedInstance];
    unsigned int v11 = [v10 createSceneWithDefinition:v5];

    if (v11)
    {
      +[FBDisplayManager mainConfiguration];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10001B3A0;
      v27[3] = &unk_100079C60;
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      double v12 = v28;
      [v11 performUpdate:v27];
      [(UIRootWindowScenePresentationBinder *)self->_rootWindowSceneBinder addScene:v11];
    }
    else
    {
      double v12 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100048F10(v12, v20, v21, v22, v23, v24, v25, v26);
      }
    }
  }
  else
  {
    unsigned int v11 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100048ED8(v11, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (NSMutableSet)openApps
{
  return self->_openApps;
}

- (void)setOpenApps:(id)a3
{
}

- (NSSet)whitelist
{
  return self->_whitelist;
}

- (NSSet)whitelistPrefixes
{
  return self->_whitelistPrefixes;
}

- (UIApplicationSceneClientSettingsDiffInspector)appClientSettingsDiffInspector
{
  return self->_appClientSettingsDiffInspector;
}

- (void)setAppClientSettingsDiffInspector:(id)a3
{
}

- (BSInvalidatable)layoutElementInvalidator
{
  return self->_layoutElementInvalidator;
}

- (void)setLayoutElementInvalidator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutElementInvalidator, 0);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_whitelistPrefixes, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_openApps, 0);

  objc_storeStrong((id *)&self->_rootWindowSceneBinder, 0);
}

@end