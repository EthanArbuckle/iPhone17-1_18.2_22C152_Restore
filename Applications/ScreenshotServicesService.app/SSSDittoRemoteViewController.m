@interface SSSDittoRemoteViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (BOOL)willSoonUnparentChildDittoRootViewController;
- (SSSDittoRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SSSDittoRootViewController)rootViewController;
- (SSSViewControllerManager)viewControllerManager;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)loadedView;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addRootViewController;
- (void)_performDismiss;
- (void)_statusBarHeightChanged;
- (void)becomeParentOfDittoRootViewController:(id)a3;
- (void)cleanupRootViewController;
- (void)dealloc;
- (void)dittoRootViewController:(id)a3 willShowShowSharingUIWithBlock:(id)a4;
- (void)dittoRootViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4;
- (void)dittoRootViewController:(id)a3 willTransitionToState:(unint64_t)a4 changeBlock:(id)a5;
- (void)informHostThatScreenshotsHaveDismissed;
- (void)loadView;
- (void)setViewControllerManager:(id)a3;
- (void)setWillSoonUnparentChildDittoRootViewController:(BOOL)a3;
- (void)stopBeingParentOfDittoRootViewController:(id)a3;
- (void)tearDownScreenshotExperience;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SSSDittoRemoteViewController

- (void)_addRootViewController
{
  [(SSSDittoRemoteViewController *)self addChildViewController:self->_rootViewController];
  v3 = [(SSSDittoRemoteViewController *)self view];
  v4 = [(SSSDittoRootViewController *)self->_rootViewController view];
  [v3 addSubview:v4];

  [(SSSDittoRootViewController *)self->_rootViewController didMoveToParentViewController:self];
  v5 = [(SSSDittoRootViewController *)self->_rootViewController view];
  v6 = [(SSSDittoRemoteViewController *)self view];
  [v6 frame];
  [v5 setFrame:];

  rootViewController = self->_rootViewController;

  [(SSSDittoRootViewController *)rootViewController setDelegate:self];
}

- (void)_performDismiss
{
  id v2 = [(SSSDittoRemoteViewController *)self viewControllerManager];
  [v2 screenshotsDismissed];
}

- (void)dittoRootViewController:(id)a3 willTransitionToState:(unint64_t)a4 changeBlock:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  v9 = v8;
  if (a4 == 1)
  {
    v10 = [(SSSDittoRemoteViewController *)self viewControllerManager];
    [v10 moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady:v9];
  }
  else if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
  }
}

- (void)dittoRootViewController:(id)a3 willShowShowSharingUIWithBlock:(id)a4
{
  id v5 = a4;
  id v6 = [(SSSDittoRemoteViewController *)self viewControllerManager];
  [v6 moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady:v5];
}

- (void)dittoRootViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4
{
  id v5 = a4;
  id v6 = [(SSSDittoRemoteViewController *)self viewControllerManager];
  [v6 moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady:v5];
}

- (void)becomeParentOfDittoRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);

  [(SSSDittoRemoteViewController *)self _addRootViewController];
}

- (void)stopBeingParentOfDittoRootViewController:(id)a3
{
  id v4 = a3;
  [v4 willMoveToParentViewController:0];
  v3 = [v4 view];
  [v3 removeFromSuperview];

  [v4 removeFromParentViewController];
}

- (void)cleanupRootViewController
{
  [(SSSDittoRootViewController *)self->_rootViewController setDelegate:0];
  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;
}

- (SSSDittoRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (SSSDittoRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SSSDittoRemoteViewController;
  id v4 = [(SSSDittoRemoteViewController *)&v7 initWithNibName:a3 bundle:a4];
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:v4 selector:"_statusBarHeightChanged" name:UIApplicationStatusBarHeightChangedNotification object:0];

  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SSSDittoRemoteViewController;
  [(SSSDittoRemoteViewController *)&v4 dealloc];
}

- (void)_statusBarHeightChanged
{
  v3 = [(SSSDittoRemoteViewController *)self view];
  objc_super v4 = [v3 window];
  id v5 = [v4 screen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [(SSSDittoRemoteViewController *)self view];
  v15 = [(SSSDittoRemoteViewController *)self view];
  v16 = [v15 window];
  v17 = [v16 screen];
  v18 = [v17 coordinateSpace];
  [v14 convertRect:v18 fromCoordinateSpace:v7, v9, v11, v13];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  id v27 = [(SSSDittoRootViewController *)self->_rootViewController view];
  [v27 setFrame:v20, v22, v24, v26];
}

- (id)loadedView
{
  return [(SSSDittoRemoteViewController *)self viewIfLoaded];
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(SSSDittoRemoteViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteViewController;
  [(SSSDittoRemoteViewController *)&v5 viewDidLoad];
  id v3 = [(SSSDittoRemoteViewController *)self view];
  objc_super v4 = +[UIColor greenColor];
  SSApplyDebuggingCustomizationsToViewIfAppropriate();
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteViewController;
  [(SSSDittoRemoteViewController *)&v5 viewWillAppear:a3];
  objc_super v4 = [(SSSDittoRemoteViewController *)self loadedView];
  [v4 setAcceptsTouches:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteViewController;
  [(SSSDittoRemoteViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"SSSDittoRemoteViewControllerIsReadyForViewControllerManagerNotificationName" object:self];
}

- (void)setViewControllerManager:(id)a3
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SSSDittoRemoteViewController;
  id v7 = a4;
  -[SSSDittoRemoteViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D768;
  v8[3] = &unk_10009ADE0;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (id)childViewControllerForStatusBarStyle
{
  return [(SSSDittoRootViewController *)self->_rootViewController childViewControllerForStatusBarStyle];
}

- (id)childViewControllerForStatusBarHidden
{
  return [(SSSDittoRootViewController *)self->_rootViewController childViewControllerForStatusBarHidden];
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)informHostThatScreenshotsHaveDismissed
{
  id v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Service informing host that the screenshot experience dismissed", v6, 2u);
  }

  objc_super v4 = [(SSSDittoRemoteViewController *)self _remoteViewControllerProxy];
  [v4 screenshotExperienceHasDismissed];

  objc_super v5 = [(SSSDittoRemoteViewController *)self _remoteViewControllerProxy];
  [v5 dismiss];
}

- (void)tearDownScreenshotExperience
{
  id v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Service received request to tear down screenshot experience", v5, 2u);
  }

  objc_super v4 = [(SSSDittoRemoteViewController *)self viewControllerManager];
  [v4 dismissScreenshots];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SSRemoteViewControllerServiceToHostInterface];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SSRemoteViewControllerHostToServiceInterface];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SSSViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerManager);

  return (SSSViewControllerManager *)WeakRetained;
}

- (BOOL)willSoonUnparentChildDittoRootViewController
{
  return self->_willSoonUnparentChildDittoRootViewController;
}

- (void)setWillSoonUnparentChildDittoRootViewController:(BOOL)a3
{
  self->_willSoonUnparentChildDittoRootViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);

  objc_destroyWeak((id *)&self->_viewControllerManager);
}

@end