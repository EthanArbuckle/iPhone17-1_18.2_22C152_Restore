@interface TVRemoteViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isConfigured;
- (BOOL)isConnectedToDevice;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldReplayHints;
- (SBSAssertion)appSwitcherAssertion;
- (TVRUIDevice)device;
- (TVRUIHintsViewController)hintsViewController;
- (TVRUIRemoteViewController)remoteViewController;
- (UIViewController)tipViewController;
- (int64_t)overrideUserInterfaceStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_acquireAppSwitcherAssertion;
- (void)_appWillTerminate:(id)a3;
- (void)_configureWithDefaultContext;
- (void)_dismissHintsAnimated:(BOOL)a3;
- (void)_dismissPresentedContentAnimated:(BOOL)a3;
- (void)_releaseAppSwitcherAssertion;
- (void)configureWithContext:(id)a3;
- (void)device:(id)a3 supportsSiri:(BOOL)a4 volume:(BOOL)a5;
- (void)device:(id)a3 supportsVolume:(BOOL)a4;
- (void)deviceDidConnect;
- (void)deviceDidDisconnect;
- (void)devicePickerWillExpand;
- (void)dismiss;
- (void)presentFindMyTip;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillDeactivate:(id)a3;
- (void)setAppSwitcherAssertion:(id)a3;
- (void)setDevice:(id)a3;
- (void)setHintsViewController:(id)a3;
- (void)setIsConfigured:(BOOL)a3;
- (void)setIsConnectedToDevice:(BOOL)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setShouldReplayHints:(BOOL)a3;
- (void)setTipViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willEnterLockScreenScene;
- (void)willExitLockScreenScene;
@end

@implementation TVRemoteViewController

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)TVRemoteViewController;
  [(TVRemoteViewController *)&v35 viewDidLoad];
  id v3 = objc_alloc_init((Class)TVRUIHintsViewController);
  [(TVRemoteViewController *)self setHintsViewController:v3];

  v4 = [(TVRemoteViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(TVRemoteViewController *)self hintsViewController];
  v14 = [v13 view];
  [v14 setFrame:v6, v8, v10, v12];

  id v15 = objc_alloc_init((Class)TVRUIRemoteViewController);
  [(TVRemoteViewController *)self setRemoteViewController:v15];

  v16 = [(TVRemoteViewController *)self view];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v25 = [(TVRemoteViewController *)self remoteViewController];
  v26 = [v25 view];
  [v26 setFrame:v18, v20, v22, v24];

  v27 = [(TVRemoteViewController *)self remoteViewController];
  [v27 setDelegate:self];

  v28 = [(TVRemoteViewController *)self remoteViewController];
  [v28 setDeviceConnectionStatusDelegate:self];

  v29 = [(TVRemoteViewController *)self remoteViewController];
  [(TVRemoteViewController *)self bs_addChildViewController:v29];

  v30 = [(TVRemoteViewController *)self hintsViewController];
  [(TVRemoteViewController *)self bs_addChildViewController:v30];

  v31 = +[NSNotificationCenter defaultCenter];
  [v31 addObserver:self selector:"_appWillTerminate:" name:UIApplicationWillTerminateNotification object:0];

  v32 = +[NSNotificationCenter defaultCenter];
  [v32 addObserver:self selector:"sceneDidActivate:" name:UISceneDidActivateNotification object:0];

  v33 = +[NSNotificationCenter defaultCenter];
  [v33 addObserver:self selector:"sceneWillDeactivate:" name:UISceneWillDeactivateNotification object:0];

  v34 = +[NSNotificationCenter defaultCenter];
  [v34 addObserver:self selector:"sceneDidEnterBackground:" name:UISceneDidEnterBackgroundNotification object:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)overrideUserInterfaceStyle
{
  return 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v11 = "-[TVRemoteViewController viewWillAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)TVRemoteViewController;
  [(TVRemoteViewController *)&v9 viewWillAppear:v3];
  double v6 = [(TVRemoteViewController *)self remoteViewController];
  unsigned __int8 v7 = [v6 isConfigured];

  if ((v7 & 1) == 0) {
    [(TVRemoteViewController *)self _configureWithDefaultContext];
  }
  double v8 = [(TVRemoteViewController *)self remoteViewController];
  [v8 startConnections];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TVRemoteViewController;
  [(TVRemoteViewController *)&v5 viewWillDisappear:a3];
  [(TVRemoteViewController *)self _dismissHintsAnimated:1];
  v4 = +[TipsManager shared];
  [v4 invalidate];
}

- (void)sceneDidActivate:(id)a3
{
  v4 = [a3 object];
  objc_super v5 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    objc_super v9 = "-[TVRemoteViewController sceneDidActivate:]";
    __int16 v10 = 2112;
    double v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v8, 0x16u);
  }

  if ([(TVRemoteViewController *)self isConnectedToDevice]
    && [(TVRemoteViewController *)self shouldReplayHints])
  {
    double v6 = _TVRUIServiceAppLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Replaying hints", (uint8_t *)&v8, 2u);
    }

    unsigned __int8 v7 = [(TVRemoteViewController *)self hintsViewController];
    [v7 replayHints];

    [(TVRemoteViewController *)self setShouldReplayHints:0];
  }
}

- (void)sceneWillDeactivate:(id)a3
{
  v4 = [a3 object];
  objc_super v5 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[TVRemoteViewController sceneWillDeactivate:]";
    __int16 v9 = 2112;
    __int16 v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v7, 0x16u);
  }

  [(TVRemoteViewController *)self _dismissHintsAnimated:0];
  double v6 = +[TipsManager shared];
  [v6 invalidate];
}

- (void)_dismissHintsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(TVRemoteViewController *)self hintsViewController];
  unsigned int v6 = [v5 hasPresentedContent];

  if (v6)
  {
    id v7 = [(TVRemoteViewController *)self hintsViewController];
    [v7 dismissPresentedContentAnimated:v3 completion:0];
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  v4 = [a3 object];
  objc_super v5 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    __int16 v9 = "-[TVRemoteViewController sceneDidEnterBackground:]";
    __int16 v10 = 2112;
    double v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - %@", (uint8_t *)&v8, 0x16u);
  }

  unsigned int v6 = [(TVRemoteViewController *)self hintsViewController];
  [v6 remoteWillBeDismissed];

  id v7 = +[TipsManager shared];
  [v7 invalidate];
}

- (BOOL)isConfigured
{
  v2 = [(TVRemoteViewController *)self remoteViewController];
  unsigned __int8 v3 = [v2 isConfigured];

  return v3;
}

- (void)willEnterLockScreenScene
{
  unsigned __int8 v3 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "willEnterLockScreenScene", v5, 2u);
  }

  v4 = [(TVRemoteViewController *)self remoteViewController];
  [v4 setIsInSecureWindow:1];
}

- (void)willExitLockScreenScene
{
  unsigned __int8 v3 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "willExitLockScreenScene", v5, 2u);
  }

  v4 = [(TVRemoteViewController *)self remoteViewController];
  [v4 setIsInSecureWindow:0];
}

- (void)_acquireAppSwitcherAssertion
{
  if (!self->_appSwitcherAssertion)
  {
    unsigned __int8 v3 = _TVRUIServiceAppLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Acquiring AppSwitcher Assertion", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    objc_copyWeak(&v4, buf);
    SBSRequestAppSwitcherAppearanceForHiddenApplication();
    objc_destroyWeak(&v4);
    objc_destroyWeak(buf);
  }
}

void __54__TVRemoteViewController__acquireAppSwitcherAssertion__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setAppSwitcherAssertion:v3];
}

- (void)_releaseAppSwitcherAssertion
{
  id v3 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing AppSwitcher Assertion", v5, 2u);
  }

  [(SBSAssertion *)self->_appSwitcherAssertion invalidate];
  appSwitcherAssertion = self->_appSwitcherAssertion;
  self->_appSwitcherAssertion = 0;
}

- (void)_appWillTerminate:(id)a3
{
  id v4 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    unsigned int v6 = "-[TVRemoteViewController _appWillTerminate:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(TVRemoteViewController *)self dismiss];
}

- (void)_dismissPresentedContentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(TVRemoteViewController *)self remoteViewController];
  unsigned int v6 = [v5 hasPresentedContent];

  if (v6)
  {
    id v7 = [(TVRemoteViewController *)self remoteViewController];
    [v7 dismissPresentedContentAnimated:v3 completion:0];
  }
  int v8 = [(TVRemoteViewController *)self hintsViewController];
  unsigned int v9 = [v8 hasPresentedContent];

  if (v9)
  {
    __int16 v10 = [(TVRemoteViewController *)self hintsViewController];
    [v10 dismissPresentedContentAnimated:v3 completion:0];
  }
  id v11 = +[TipsManager shared];
  [v11 invalidate];
}

- (void)_configureWithDefaultContext
{
  BOOL v3 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Configuring RemoteViewController with default context", v5, 2u);
  }

  id v4 = [(TVRemoteViewController *)self remoteViewController];
  [v4 configureWithDeviceIdentifier:0 identifierType:TVRViewServiceDeviceIdentifierTypeNone deviceType:0 launchContext:1];
}

- (void)configureWithContext:(id)a3
{
  id v4 = a3;
  int v5 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Configuring RemoteViewController with context: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  if (([(TVRemoteViewController *)self isViewLoaded] & 1) == 0) {
    [(TVRemoteViewController *)self loadViewIfNeeded];
  }
  unsigned int v6 = [(TVRemoteViewController *)self remoteViewController];
  [v6 configureWithContext:v4];
}

- (void)dismiss
{
  BOOL v3 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing HintsViewController and RemoteViewController", v8, 2u);
  }

  [(TVRemoteViewController *)self _dismissPresentedContentAnimated:0];
  id v4 = [(TVRemoteViewController *)self hintsViewController];
  [v4 remoteWillBeDismissed];

  int v5 = [(TVRemoteViewController *)self hintsViewController];
  [v5 dismissHints];

  unsigned int v6 = [(TVRemoteViewController *)self remoteViewController];
  [v6 _disconnectUserInitiated];

  int v7 = [(TVRemoteViewController *)self remoteViewController];
  [v7 stopConnections];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(TVRemoteViewController *)self traitCollection];
  if ([v2 userInterfaceIdiom] == (id)1) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)deviceDidConnect
{
  unint64_t v3 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device did connect. Acquiring AppSwitcher assertion", buf, 2u);
  }

  [(TVRemoteViewController *)self setIsConnectedToDevice:1];
  [(TVRemoteViewController *)self _acquireAppSwitcherAssertion];
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __42__TVRemoteViewController_deviceDidConnect__block_invoke;
  block[3] = &unk_100018BF0;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

id __42__TVRemoteViewController_deviceDidConnect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentFindMyTip];
}

- (void)deviceDidDisconnect
{
  unint64_t v3 = _TVRUIServiceAppLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device did disconnect. Releasing AppSwitcher assertion", v4, 2u);
  }

  [(TVRemoteViewController *)self setIsConnectedToDevice:0];
  [(TVRemoteViewController *)self _releaseAppSwitcherAssertion];
}

- (void)presentFindMyTip
{
  unint64_t v3 = [(TVRemoteViewController *)self remoteViewController];
  unsigned __int8 v4 = [v3 isInSecureWindow];

  if (v4)
  {
    int v5 = _TVRUIServiceAppLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not showing the mini tip since the view controller is in a secure window", buf, 2u);
    }
  }
  else
  {
    id v8 = +[TipsManager shared];
    unsigned int v6 = [(TVRemoteViewController *)self remoteViewController];
    int v7 = [v6 tipSourceViewProvider];
    [v8 updatePresentingViewController:v7];

    [v8 presentTip];
  }
}

- (void)device:(id)a3 supportsSiri:(BOOL)a4 volume:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(TVRemoteViewController *)self hintsViewController];
  [v9 device:v8 supportsSiri:v6 volume:v5];
}

- (void)device:(id)a3 supportsVolume:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(TVRemoteViewController *)self hintsViewController];
  [v7 device:v6 supportsVolume:v4];
}

- (void)devicePickerWillExpand
{
  unint64_t v3 = [(TVRemoteViewController *)self hintsViewController];
  [v3 devicePickerWillExpand];

  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__TVRemoteViewController_devicePickerWillExpand__block_invoke;
  block[3] = &unk_100018BF0;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

id __48__TVRemoteViewController_devicePickerWillExpand__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentFindMyTip];
}

- (void)setIsConfigured:(BOOL)a3
{
  self->_isConfigured = a3;
}

- (TVRUIRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (TVRUIHintsViewController)hintsViewController
{
  return self->_hintsViewController;
}

- (void)setHintsViewController:(id)a3
{
}

- (SBSAssertion)appSwitcherAssertion
{
  return self->_appSwitcherAssertion;
}

- (void)setAppSwitcherAssertion:(id)a3
{
}

- (BOOL)isConnectedToDevice
{
  return self->_isConnectedToDevice;
}

- (void)setIsConnectedToDevice:(BOOL)a3
{
  self->_isConnectedToDevice = a3;
}

- (BOOL)shouldReplayHints
{
  return self->_shouldReplayHints;
}

- (void)setShouldReplayHints:(BOOL)a3
{
  self->_shouldReplayHints = a3;
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (UIViewController)tipViewController
{
  return self->_tipViewController;
}

- (void)setTipViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipViewController, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_appSwitcherAssertion, 0);
  objc_storeStrong((id *)&self->_hintsViewController, 0);

  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

@end