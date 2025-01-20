@interface ServicePrivacyPromptViewController
- (BOOL)_shouldIncludeAcknowledgementButtonInSplashController;
- (BOOL)acknowledgementReceived;
- (BOOL)prefersStatusBarHidden;
- (BOOL)privacyControllerShown;
- (BOOL)shouldAutorotate;
- (BSAction)didContinueAction;
- (NSString)privacyIdentifier;
- (UINavigationController)splashNavigationController;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applyCustomTintColorToViewController:(id)a3;
- (void)_dismiss;
- (void)_privacyViewControllerDidFinishWithResult:(unint64_t)a3;
- (void)_willAppearInRemoteViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)setAcknowledgementReceived:(BOOL)a3;
- (void)setDidContinueAction:(id)a3;
- (void)setPrivacyControllerShown:(BOOL)a3;
- (void)setPrivacyIdentifier:(id)a3;
- (void)setSplashNavigationController:(id)a3;
- (void)splashDoneButtonPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ServicePrivacyPromptViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v12 = a3;
  v6 = (void (**)(void))a4;
  if (!+[objc_LockscreenStatus isDeviceUnlocked])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002D878();
    }
    exit(0);
  }
  v7 = [v12 actions];
  v8 = [v7 allObjects];
  v9 = [v8 firstObject];
  [(ServicePrivacyPromptViewController *)self setDidContinueAction:v9];

  v10 = [v12 userInfo];
  v11 = [v10 objectForKeyedSubscript:@"privacyIdentifier"];
  [(ServicePrivacyPromptViewController *)self setPrivacyIdentifier:v11];

  v6[2](v6);
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) events] & 0x10) != 0) {
          [(ServicePrivacyPromptViewController *)self _dismiss];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ServicePrivacyPromptViewController;
  [(ServicePrivacyPromptViewController *)&v5 viewDidLoad];
  v3 = +[UIColor clearColor];
  id v4 = [(ServicePrivacyPromptViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(ServicePrivacyPromptViewController *)self _applyCustomTintColorToViewController:self];
}

- (void)_willAppearInRemoteViewController
{
  v4.receiver = self;
  v4.super_class = (Class)ServicePrivacyPromptViewController;
  [(ServicePrivacyPromptViewController *)&v4 _willAppearInRemoteViewController];
  v3 = [(ServicePrivacyPromptViewController *)self _remoteViewControllerProxy];
  [v3 setDesiredHardwareButtonEvents:16];
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ServicePrivacyPromptViewController;
  [(ServicePrivacyPromptViewController *)&v12 viewDidAppear:a3];
  if (![(ServicePrivacyPromptViewController *)self privacyControllerShown])
  {
    objc_initWeak(&location, self);
    objc_super v4 = [(ServicePrivacyPromptViewController *)self privacyIdentifier];
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    v8 = sub_10000E24C;
    long long v9 = &unk_10004D2E8;
    objc_copyWeak(&v10, &location);
    objc_super v5 = +[AMSUIPrivacyViewController privacyControllerWithIdentifier:v4 acknowledgementHandler:&v6];

    -[ServicePrivacyPromptViewController _applyCustomTintColorToViewController:](self, "_applyCustomTintColorToViewController:", v5, v6, v7, v8, v9);
    [(ServicePrivacyPromptViewController *)self presentViewController:v5 animated:1 completion:0];
    [(ServicePrivacyPromptViewController *)self setPrivacyControllerShown:1];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 2;
  }
  objc_super v4 = +[UIApplication sharedApplication];
  unsigned __int8 v5 = [v4 statusBarOrientation];

  if (MGCopyAnswer()) {
    return 30;
  }
  else {
    return 1 << v5;
  }
}

- (BOOL)shouldAutorotate
{
  uint64_t v2 = MGCopyAnswer();
  unint64_t v3 = +[UIDevice currentDevice];
  unint64_t v4 = (unint64_t)[v3 userInterfaceIdiom];

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v2 != 0;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)splashDoneButtonPressed:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unsigned __int8 v5 = [(ServicePrivacyPromptViewController *)self splashNavigationController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E4A0;
  v6[3] = &unk_10004CDC8;
  objc_copyWeak(&v7, &location);
  [v5 dismissViewControllerAnimated:1 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_applyCustomTintColorToViewController:(id)a3
{
  id v8 = a3;
  if (qword_100067320 != -1) {
    dispatch_once(&qword_100067320, &stru_10004D308);
  }
  id v4 = (void *)qword_100067318;
  unsigned __int8 v5 = [(ServicePrivacyPromptViewController *)self privacyIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [v8 view];
    [v7 setTintColor:v6];
  }
}

- (void)_dismiss
{
  unint64_t v3 = [(ServicePrivacyPromptViewController *)self didContinueAction];
  unsigned int v4 = [v3 canSendResponse];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)BSMutableSettings);
    id v6 = +[NSNumber numberWithBool:[(ServicePrivacyPromptViewController *)self acknowledgementReceived]];
    [v5 setObject:v6 forSetting:1];

    id v7 = [(ServicePrivacyPromptViewController *)self didContinueAction];
    id v8 = +[BSActionResponse responseWithInfo:v5];
    [v7 sendResponse:v8];
  }
  long long v9 = [(ServicePrivacyPromptViewController *)self _remoteViewControllerProxy];
  id v10 = [(ServicePrivacyPromptViewController *)self presentedViewController];

  if (v10)
  {
    long long v11 = [(ServicePrivacyPromptViewController *)self presentedViewController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000E7D4;
    v12[3] = &unk_10004CEB0;
    id v13 = v9;
    [v11 dismissViewControllerAnimated:1 completion:v12];
  }
  else
  {
    [v9 dismiss];
  }
}

- (void)_privacyViewControllerDidFinishWithResult:(unint64_t)a3
{
  if (a3 == 1)
  {
    unsigned int v4 = [(ServicePrivacyPromptViewController *)self privacyIdentifier];
    id v5 = +[OBPrivacySplashController splashPageWithBundleIdentifier:v4];

    if ([(ServicePrivacyPromptViewController *)self _shouldIncludeAcknowledgementButtonInSplashController])
    {
      objc_initWeak(&location, self);
      long long v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      long long v11 = sub_10000E9C0;
      objc_super v12 = &unk_10004CDC8;
      objc_copyWeak(&v13, &location);
      [v5 setDismissHandlerForDefaultButton:&v9];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    [v5 setShowsLinkToUnifiedAbout:1 v9, v10, v11, v12];
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"splashDoneButtonPressed:"];
    id v7 = [v5 navigationItem];
    [v7 setRightBarButtonItem:v6];

    id v8 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
    [v8 setModalPresentationStyle:2];
    [(ServicePrivacyPromptViewController *)self _applyCustomTintColorToViewController:v8];
    [(ServicePrivacyPromptViewController *)self setSplashNavigationController:v8];
    [(ServicePrivacyPromptViewController *)self presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    [(ServicePrivacyPromptViewController *)self setAcknowledgementReceived:1];
    [(ServicePrivacyPromptViewController *)self _dismiss];
  }
}

- (BOOL)_shouldIncludeAcknowledgementButtonInSplashController
{
  if (qword_100067330 != -1) {
    dispatch_once(&qword_100067330, &stru_10004D328);
  }
  unint64_t v3 = (void *)qword_100067328;
  unsigned int v4 = [(ServicePrivacyPromptViewController *)self privacyIdentifier];
  LOBYTE(v3) = [v3 containsObject:v4];

  return (char)v3;
}

- (BOOL)privacyControllerShown
{
  return self->_privacyControllerShown;
}

- (void)setPrivacyControllerShown:(BOOL)a3
{
  self->_privacyControllerShown = a3;
}

- (BOOL)acknowledgementReceived
{
  return self->_acknowledgementReceived;
}

- (void)setAcknowledgementReceived:(BOOL)a3
{
  self->_acknowledgementReceived = a3;
}

- (NSString)privacyIdentifier
{
  return self->_privacyIdentifier;
}

- (void)setPrivacyIdentifier:(id)a3
{
}

- (BSAction)didContinueAction
{
  return self->_didContinueAction;
}

- (void)setDidContinueAction:(id)a3
{
}

- (UINavigationController)splashNavigationController
{
  return self->_splashNavigationController;
}

- (void)setSplashNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splashNavigationController, 0);
  objc_storeStrong((id *)&self->_didContinueAction, 0);

  objc_storeStrong((id *)&self->_privacyIdentifier, 0);
}

@end