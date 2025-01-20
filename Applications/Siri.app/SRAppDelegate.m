@interface SRAppDelegate
+ (id)sharedApplication;
+ (id)sharedDelegate;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (SRApplicationDataSource)dataSource;
- (UIScene)currentScene;
- (UIWindow)appWindow;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)_invalidateTrialManager;
- (void)_updateDeferral;
- (void)_verifyAndSyncTrialExperiments;
- (void)_windowDidCreateContext:(id)a3;
- (void)_windowWillDestroyContext:(id)a3;
- (void)didBecomeActiveHandler;
- (void)invalidateKeyboardWindowIfNeeded;
- (void)setAppWindow:(id)a3;
- (void)setCurrentScene:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setUpViews;
- (void)tearDownViews;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
- (void)willEnterForegroundHandler;
- (void)willResignActiveHandler;
@end

@implementation SRAppDelegate

+ (id)sharedApplication
{
  return +[UIApplication sharedApplication];
}

+ (id)sharedDelegate
{
  return [UIApp delegate];
}

- (void)_verifyAndSyncTrialExperiments
{
  id v3 = objc_alloc((Class)SRUIFPreferences);
  id v4 = [v3 initWithSuiteName:SRUIFPreferencesDefaultDomain];
  if (([v4 BOOLForKey:SRUIFPreferencesDeviceEnrolledInASRSettingTrialExperiment] & 1) == 0)
  {
    trialManager = self->_trialManager;
    if (!trialManager)
    {
      id v6 = objc_alloc((Class)SRUIFTrialManager);
      v7 = (SRUIFTrialManager *)[v6 initWithNamespace:SRUIFTrialNamespaceForResponsesSettings];
      v8 = self->_trialManager;
      self->_trialManager = v7;

      trialManager = self->_trialManager;
    }
    uint64_t v9 = SRUIFTrialFactorForOverrideAlwaysShowRecognizedSpeech;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10007B9B0;
    v10[3] = &unk_1001444D8;
    id v11 = v4;
    [(SRUIFTrialManager *)trialManager BOOLValueForFactor:v9 defaultValueIfNoFactorsFilePresent:0 withCompletionHandler:v10];
  }
}

- (void)_invalidateTrialManager
{
  if (self->_trialManager)
  {
    self->_trialManager = 0;
    _objc_release_x1();
  }
}

- (void)_windowDidCreateContext:(id)a3
{
  id v4 = [a3 object];
  if (v4 == self->_appWindow)
  {
    v5 = v4;
    [(SRAppDelegate *)self _updateDeferral];
    id v4 = v5;
  }
}

- (void)_windowWillDestroyContext:(id)a3
{
  id v4 = [a3 object];
  if (v4 == self->_appWindow)
  {
    v5 = v4;
    [(SRAppDelegate *)self _updateDeferral];
    id v4 = v5;
  }
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_windowDidCreateContext:" name:UIWindowDidCreateWindowContextNotification object:0];
  [v5 addObserver:self selector:"_windowWillDestroyContext:" name:UIWindowWillDestroyWindowContextNotification object:0];
  +[SRAssetsUtilities setupBackgroundAssetCheck];
  id v6 = objc_alloc_init(SRViewController);
  v7 = objc_alloc_init(SRSecureWindow);
  v8 = +[UIColor clearColor];
  [(SRSecureWindow *)v7 setBackgroundColor:v8];

  [(SRSecureWindow *)v7 setRootViewController:v6];
  [(SRSecureWindow *)v7 makeKeyAndVisible];
  +[SRUIDSurveyNotificationUtility setupUserNotificationCenterDelegateIfNeeded:self];
  uint64_t v9 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    int v12 = 136316162;
    v13 = "-[SRAppDelegate application:didFinishLaunchingWithOptions:]";
    __int16 v14 = 1024;
    pid_t v15 = getpid();
    __int16 v16 = 2048;
    v17 = v6;
    __int16 v18 = 2048;
    v19 = v7;
    __int16 v20 = 1024;
    unsigned int v21 = [(SRSecureWindow *)v7 _contextId];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s (%u) Creating initial viewController (%p) and window (%p) and contextID %u", (uint8_t *)&v12, 0x2Cu);
  }
  [(SRAppDelegate *)self setAppWindow:v7];

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  v5 = [a4 configuration:a3];
  [v5 setDelegateClass:objc_opt_class()];

  return v5;
}

- (void)_updateDeferral
{
  objc_initWeak(&location, self);
  id v3 = [(UIScene *)self->_currentScene _FBSScene];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007BF10;
  v4[3] = &unk_100144AC0;
  objc_copyWeak(&v5, &location);
  [v3 updateClientSettingsWithBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)invalidateKeyboardWindowIfNeeded
{
  id v3 = +[UIKeyboard activeKeyboard];
  id v4 = [v3 window];
  Class v5 = NSClassFromString(@"UIRemoteKeyboardWindow");
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
    if (v4)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v7);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            id v4 = v10;
            goto LABEL_15;
          }
        }
        id v4 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  id v11 = [v4 _windowInterfaceOrientation];
  int v12 = [(SRAppDelegate *)self appWindow];
  id v13 = [v12 _windowInterfaceOrientation];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0 && v11 != v13)
  {
    __int16 v14 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v20 = "-[SRAppDelegate invalidateKeyboardWindowIfNeeded]";
      __int16 v21 = 2048;
      id v22 = v11;
      __int16 v23 = 2048;
      id v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #keyboardInvalidation: Invalidating keyboard window because orientation (%ld) didn't match our launch orientation (%ld)", buf, 0x20u);
    }
    [v4 invalidate];
  }
}

- (void)setUpViews
{
  id v3 = [(SRAppDelegate *)self appWindow];
  v2 = [v3 rootViewController];
  [v2 setUpViews];
}

- (void)tearDownViews
{
  [(SRAppDelegate *)self _invalidateTrialManager];
  id v4 = [(SRAppDelegate *)self appWindow];
  id v3 = [v4 rootViewController];
  [v3 tearDownViews];
}

- (void)didBecomeActiveHandler
{
  id v3 = [(SRAppDelegate *)self appWindow];
  v2 = [v3 rootViewController];
  [v2 didBecomeActiveHandler];
}

- (void)willResignActiveHandler
{
  id v3 = [(SRAppDelegate *)self appWindow];
  v2 = [v3 rootViewController];
  [v2 willResignActiveHandler];
}

- (void)willEnterForegroundHandler
{
  [(SRAppDelegate *)self _verifyAndSyncTrialExperiments];
  SiriUISyncCachedPreferences();
  id v4 = [(SRAppDelegate *)self appWindow];
  id v3 = [v4 rootViewController];
  [v3 willEnterForegroundHandler];
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (UIWindow)appWindow
{
  return self->_appWindow;
}

- (void)setAppWindow:(id)a3
{
}

- (UIScene)currentScene
{
  return self->_currentScene;
}

- (void)setCurrentScene:(id)a3
{
}

- (SRApplicationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SRApplicationDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_currentScene, 0);
  objc_storeStrong((id *)&self->_appWindow, 0);

  objc_storeStrong((id *)&self->_trialManager, 0);
}

@end