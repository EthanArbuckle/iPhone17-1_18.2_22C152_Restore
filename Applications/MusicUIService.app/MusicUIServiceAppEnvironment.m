@interface MusicUIServiceAppEnvironment
- (BOOL)appMustBeRunning;
- (BOOL)launchRequested;
- (BSProcessHandle)appHandle;
- (MusicUIServiceAppEnvironmentDelegate)delegate;
- (MusicUIServiceCarDisplayBrowsableContentViewController)contentViewController;
- (NSString)applicationIdentifier;
- (RBSAssertion)processAssertion;
- (UIWindow)window;
- (void)_launchTargetApp;
- (void)_launchTargetAppIfNecessary;
- (void)_switchToNowPlaying;
- (void)dealloc;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setAppHandle:(id)a3;
- (void)setAppMustBeRunning:(BOOL)a3;
- (void)setContentViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLaunchRequested:(BOOL)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setScene:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation MusicUIServiceAppEnvironment

- (void)setScene:(id)a3
{
  id v4 = a3;
  id v22 = [v4 _FBSScene];
  id v5 = objc_alloc((Class)UIWindow);
  v6 = [v22 settings];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [v22 identifier];
  v16 = [v5 _initWithFrame:v15 debugName:v4 windowScene:v8];

  window = self->_window;
  self->_window = v16;

  [(UIWindow *)self->_window makeKeyAndVisible];
  v18 = [v22 settings];
  v19 = [v18 proxiedApplicationBundleIdentifier];
  applicationIdentifier = self->_applicationIdentifier;
  self->_applicationIdentifier = v19;

  v21 = [(MusicUIServiceAppEnvironment *)self applicationIdentifier];
  [(UIWindow *)self->_window setAccessibilityLabel:v21];
}

- (void)dealloc
{
  v3 = [(MusicUIServiceAppEnvironment *)self processAssertion];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)MusicUIServiceAppEnvironment;
  [(MusicUIServiceAppEnvironment *)&v4 dealloc];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  [(MusicUIServiceAppEnvironment *)self setScene:v6];
  double v7 = objc_alloc_init(MusicUIServiceCarDisplayBrowsableContentViewController);
  [(MusicUIServiceAppEnvironment *)self setContentViewController:v7];

  double v8 = [(MusicUIServiceAppEnvironment *)self contentViewController];
  double v9 = [(MusicUIServiceAppEnvironment *)self window];
  [v9 setRootViewController:v8];

  id v10 = [v6 activationState];
  [(MusicUIServiceAppEnvironment *)self setAppMustBeRunning:(unint64_t)v10 < 2];

  [(MusicUIServiceAppEnvironment *)self _launchTargetApp];
}

- (void)sceneDidDisconnect:(id)a3
{
  [(MusicUIServiceAppEnvironment *)self setAppMustBeRunning:0];
  objc_super v4 = [(MusicUIServiceAppEnvironment *)self delegate];
  [v4 appEnvironmentWillDisconnect:self];

  id v5 = [(MusicUIServiceAppEnvironment *)self processAssertion];
  [v5 invalidate];

  [(MusicUIServiceAppEnvironment *)self setProcessAssertion:0];
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v6 = [[MusicUIDisplayNowPlayingStateContext alloc] initWithStateContext:@"current"];
  objc_super v4 = [(MusicUIServiceAppEnvironment *)self applicationIdentifier];
  [(MusicUIDisplayNowPlayingStateContext *)v6 setAssociatedBundleID:v4];

  id v5 = [(MusicUIServiceAppEnvironment *)self contentViewController];
  [v5 switchToState:v6];
}

- (void)sceneWillResignActive:(id)a3
{
  id v3 = [(MusicUIServiceAppEnvironment *)self contentViewController];
  [v3 switchToState:0];
}

- (void)sceneWillEnterForeground:(id)a3
{
  [(MusicUIServiceAppEnvironment *)self setAppMustBeRunning:1];

  [(MusicUIServiceAppEnvironment *)self _launchTargetApp];
}

- (void)sceneDidEnterBackground:(id)a3
{
  [(MusicUIServiceAppEnvironment *)self setAppMustBeRunning:0];
  objc_super v4 = [(MusicUIServiceAppEnvironment *)self processAssertion];
  [v4 invalidate];

  [(MusicUIServiceAppEnvironment *)self setProcessAssertion:0];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006608;
  v4[3] = &unk_10000C3C8;
  v4[4] = self;
  [a4 enumerateObjectsUsingBlock:v4];
}

- (void)_switchToNowPlaying
{
  id v5 = +[MusicUIDisplayNowPlayingStateContext stateContextForNowPlaying];
  id v3 = [(MusicUIServiceAppEnvironment *)self applicationIdentifier];
  [v5 setAssociatedBundleID:v3];

  objc_super v4 = [(MusicUIServiceAppEnvironment *)self contentViewController];
  [v4 switchToState:v5];
}

- (void)_launchTargetApp
{
  if ([(MusicUIServiceAppEnvironment *)self appMustBeRunning])
  {
    [(MusicUIServiceAppEnvironment *)self _launchTargetAppIfNecessary];
  }
  else
  {
    [(MusicUIServiceAppEnvironment *)self setAppMustBeRunning:1];
    [(MusicUIServiceAppEnvironment *)self _launchTargetAppIfNecessary];
    [(MusicUIServiceAppEnvironment *)self setAppMustBeRunning:0];
  }
}

- (void)_launchTargetAppIfNecessary
{
  if ([(MusicUIServiceAppEnvironment *)self appMustBeRunning]
    && ![(MusicUIServiceAppEnvironment *)self launchRequested])
  {
    id v3 = [(MusicUIServiceAppEnvironment *)self appHandle];

    if (!v3)
    {
      [(MusicUIServiceAppEnvironment *)self setLaunchRequested:1];
      objc_initWeak(&location, self);
      objc_super v4 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
      uint64_t v13 = FBSOpenApplicationOptionKeyActivateSuspended;
      double v14 = &__kCFBooleanTrue;
      id v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v6 = +[FBSOpenApplicationOptions optionsWithDictionary:v5];

      double v7 = [(MusicUIServiceAppEnvironment *)self applicationIdentifier];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000697C;
      v9[3] = &unk_10000C3F0;
      v9[4] = self;
      objc_copyWeak(&v11, &location);
      id v8 = v4;
      id v10 = v8;
      [v8 openApplication:v7 withOptions:v6 completion:v9];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

- (MusicUIServiceAppEnvironmentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MusicUIServiceAppEnvironmentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)appMustBeRunning
{
  return self->_appMustBeRunning;
}

- (void)setAppMustBeRunning:(BOOL)a3
{
  self->_appMustBeRunning = a3;
}

- (BOOL)launchRequested
{
  return self->_launchRequested;
}

- (void)setLaunchRequested:(BOOL)a3
{
  self->_launchRequested = a3;
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (BSProcessHandle)appHandle
{
  return self->_appHandle;
}

- (void)setAppHandle:(id)a3
{
}

- (MusicUIServiceCarDisplayBrowsableContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_appHandle, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end