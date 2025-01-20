@interface AXSBUIOnboardingRootViewController
+ (BOOL)_isSecureForRemoteViewService;
- (UIAdaptivePresentationControllerDelegate)hostingController;
- (void)_setupRemoteProxy;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setHostingController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AXSBUIOnboardingRootViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  Class v8 = NSClassFromString(@"AXOnboardingObjC");
  if (v8)
  {
    Class v9 = v8;
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, self);
      v10 = [v6 userInfo];
      v11 = [v10 objectForKeyedSubscript:@"type"];
      unsigned int v12 = [v11 isEqualToString:@"voicecontrol"];

      if (v12)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100012290;
        v20[3] = &unk_100024860;
        v13 = &v21;
        objc_copyWeak(&v21, &location);
        v14 = [(objc_class *)v9 viewControllerForType:0 onDismiss:v20];
        [(AXSBUIOnboardingRootViewController *)self setHostingController:v14];
      }
      else
      {
        v15 = [v6 userInfo];
        v16 = [v15 objectForKeyedSubscript:@"type"];
        unsigned int v17 = [v16 isEqualToString:@"voiceover"];

        if (!v17)
        {
LABEL_8:
          objc_destroyWeak(&location);
          goto LABEL_9;
        }
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000122D0;
        v18[3] = &unk_100024860;
        v13 = &v19;
        objc_copyWeak(&v19, &location);
        v14 = [(objc_class *)v9 viewControllerForType:1 onDismiss:v18];
        [(AXSBUIOnboardingRootViewController *)self setHostingController:v14];
      }

      objc_destroyWeak(v13);
      goto LABEL_8;
    }
  }
LABEL_9:
  if (v7) {
    v7[2](v7);
  }
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)AXSBUIOnboardingRootViewController;
  [(AXSBUIOnboardingRootViewController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AXSBUIOnboardingRootViewController;
  [(AXSBUIOnboardingRootViewController *)&v9 viewDidAppear:a3];
  [(AXSBUIOnboardingRootViewController *)self _setupRemoteProxy];
  id v4 = objc_alloc((Class)UINavigationController);
  v5 = [(AXSBUIOnboardingRootViewController *)self hostingController];
  id v6 = [v4 initWithRootViewController:v5];

  [v6 setModalPresentationStyle:0];
  [v6 setModalTransitionStyle:0];
  if (AXDeviceIsPhone()) {
    [v6 setModalPresentationStyle:1];
  }
  v7 = [(AXSBUIOnboardingRootViewController *)self hostingController];
  Class v8 = [v6 presentationController];
  [v8 setDelegate:v7];

  [(AXSBUIOnboardingRootViewController *)self presentViewController:v6 animated:1 completion:&stru_100024E48];
}

- (void)dismiss
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000124C0;
  v2[3] = &unk_100024748;
  v2[4] = self;
  [(AXSBUIOnboardingRootViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

- (void)_setupRemoteProxy
{
  id v2 = [(AXSBUIOnboardingRootViewController *)self _remoteViewControllerProxy];
  [v2 setDismissalAnimationStyle:2];
  [v2 setOrientationChangedEventsEnabled:0];
  [v2 setAllowsMenuButtonDismissal:1];
  [v2 setWallpaperTunnelActive:0];
}

- (UIAdaptivePresentationControllerDelegate)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end