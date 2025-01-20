@interface SSSDittoRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldForceLayoutForHostedAnimation;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)isTransitioningStates;
- (SSSDittoRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SSSDittoRemoteAlertViewControllerDelegate)dittoRemoteAlertDelegate;
- (SSSDittoRootViewController)rootViewController;
- (SSSViewControllerManager)viewControllerManager;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (int)_preferredStatusBarVisibility;
- (int64_t)preferredStatusBarStyle;
- (void)_addRootViewController;
- (void)_performDismiss;
- (void)_updateReachabilityEnabled;
- (void)becomeParentOfDittoRootViewController:(id)a3;
- (void)cleanupRootViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dittoRootViewController:(id)a3 didTransitionToState:(unint64_t)a4;
- (void)dittoRootViewController:(id)a3 wantsBackground:(BOOL)a4 duration:(double)a5;
- (void)dittoRootViewController:(id)a3 willShowShowSharingUIWithBlock:(id)a4;
- (void)dittoRootViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4;
- (void)dittoRootViewController:(id)a3 willTransitionToState:(unint64_t)a4 changeBlock:(id)a5;
- (void)dittoRootViewControllerFinishedShowingSharingUI:(id)a3 inStateTransition:(BOOL)a4;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setDittoRemoteAlertDelegate:(id)a3;
- (void)setIsTransitioningStates:(BOOL)a3;
- (void)setViewControllerManager:(id)a3;
- (void)stopBeingParentOfDittoRootViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SSSDittoRemoteAlertViewController

- (SSSDittoRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SSSDittoRemoteAlertViewController;
  v4 = [(SSSDittoRemoteAlertViewController *)&v11 initWithNibName:a3 bundle:a4];
  v5 = (UIVisualEffectView *)objc_alloc_init((Class)UIVisualEffectView);
  backgroundView = v4->_backgroundView;
  v4->_backgroundView = v5;

  v7 = v4->_backgroundView;
  v8 = +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", +[SSChromeHelper backgroundBlurEffectStyle]);
  [(UIVisualEffectView *)v7 setEffect:v8];

  v9 = [(UIVisualEffectView *)v4->_backgroundView layer];
  [v9 setAllowsGroupOpacity:0];

  [(UIVisualEffectView *)v4->_backgroundView setUserInteractionEnabled:0];
  [(UIVisualEffectView *)v4->_backgroundView setAlpha:0.0];
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_addRootViewController
{
  [(SSSDittoRemoteAlertViewController *)self addChildViewController:self->_rootViewController];
  v3 = [(SSSDittoRemoteAlertViewController *)self view];
  v4 = [(SSSDittoRootViewController *)self->_rootViewController view];
  [v3 addSubview:v4];

  [(SSSDittoRootViewController *)self->_rootViewController didMoveToParentViewController:self];
  id v6 = [(SSSDittoRootViewController *)self->_rootViewController view];
  v5 = [(SSSDittoRemoteAlertViewController *)self view];
  [v5 frame];
  [v6 setFrame:];
}

- (void)_performDismiss
{
  id v2 = [(SSSDittoRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v2 dismiss];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteAlertViewController;
  [(SSSDittoRemoteAlertViewController *)&v5 viewWillLayoutSubviews];
  backgroundView = self->_backgroundView;
  v4 = [(SSSDittoRemoteAlertViewController *)self view];
  [v4 bounds];
  -[UIVisualEffectView setFrame:](backgroundView, "setFrame:");
}

- (void)setIsTransitioningStates:(BOOL)a3
{
  if ([(SSSDittoRemoteAlertViewController *)self isTransitioningStates] != a3)
  {
    self->_isTransitioningStates = a3;
    [(SSSDittoRemoteAlertViewController *)self _updateReachabilityEnabled];
  }
}

- (void)dittoRootViewController:(id)a3 willTransitionToState:(unint64_t)a4 changeBlock:(id)a5
{
  id v6 = (void (**)(void))a5;
  [(SSSDittoRemoteAlertViewController *)self setIsTransitioningStates:1];
  v6[2]();
}

- (void)dittoRootViewController:(id)a3 didTransitionToState:(unint64_t)a4
{
  if (!a4)
  {
    objc_super v5 = [(SSSDittoRemoteAlertViewController *)self viewControllerManager];
    [v5 moveFromRemoteAlertViewControllerToRemoteViewController];
  }

  [(SSSDittoRemoteAlertViewController *)self setIsTransitioningStates:0];
}

- (void)dittoRootViewController:(id)a3 willShowShowSharingUIWithBlock:(id)a4
{
}

- (void)dittoRootViewController:(id)a3 willShowTestFlightUIWithBlock:(id)a4
{
}

- (void)dittoRootViewControllerFinishedShowingSharingUI:(id)a3 inStateTransition:(BOOL)a4
{
  if (![a3 state] && !a4)
  {
    id v6 = [(SSSDittoRemoteAlertViewController *)self viewControllerManager];
    [v6 moveFromRemoteAlertViewControllerToRemoteViewController];
  }
}

- (void)dittoRootViewController:(id)a3 wantsBackground:(BOOL)a4 duration:(double)a5
{
  double v6 = 1.0;
  if (!a4) {
    double v6 = 0.0;
  }
  if (a5 <= 0.00000011920929)
  {
    backgroundView = self->_backgroundView;
    -[UIVisualEffectView setAlpha:](backgroundView, "setAlpha:", a3, v6);
  }
  else
  {
    double v7 = a5 * 0.6;
    double v8 = a5 * 0.4;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000DAA8;
    v10[3] = &unk_100099AE0;
    if (!a4) {
      double v8 = 0.0;
    }
    v10[4] = self;
    *(double *)&v10[5] = v6;
    +[UIView animateWithDuration:0 delay:v10 options:0 animations:v7 completion:v8];
  }
}

- (void)becomeParentOfDittoRootViewController:(id)a3
{
  p_rootViewController = &self->_rootViewController;
  objc_storeStrong((id *)&self->_rootViewController, a3);
  id v6 = a3;
  [(SSSDittoRootViewController *)*p_rootViewController setDelegate:self];
  [(SSSDittoRemoteAlertViewController *)self _addRootViewController];
  double v7 = [(SSSDittoRemoteAlertViewController *)self view];
  [v7 insertSubview:self->_backgroundView atIndex:0];

  [(SSSDittoRemoteAlertViewController *)self _updateReachabilityEnabled];
}

- (void)stopBeingParentOfDittoRootViewController:(id)a3
{
  backgroundView = self->_backgroundView;
  id v5 = a3;
  [(UIVisualEffectView *)backgroundView removeFromSuperview];
  [v5 willMoveToParentViewController:0];
  v4 = [v5 view];
  [v4 removeFromSuperview];

  [v5 removeFromParentViewController];
}

- (void)cleanupRootViewController
{
  [(SSSDittoRootViewController *)self->_rootViewController setDelegate:0];
  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;

  [(SSSDittoRemoteAlertViewController *)self _performDismiss];
}

- (SSSDittoRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)handleButtonActions:(id)a3
{
  int v4 = _SSShouldHomeButtonDismiss();
  rootViewController = self->_rootViewController;
  if (v4)
  {
    [(SSSDittoRootViewController *)rootViewController performProgrammaticDismiss];
  }
  else
  {
    [(SSSDittoRootViewController *)rootViewController pipify];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSSDittoRemoteAlertViewController;
  [(SSSDittoRemoteAlertViewController *)&v4 viewDidAppear:a3];
  [(SSSDittoRootViewController *)self->_rootViewController performInteractiveGesturePresentationCompleteAnimations];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteAlertViewController;
  [(SSSDittoRemoteAlertViewController *)&v5 viewWillAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dittoRemoteAlertDelegate);
  [WeakRetained dittoRemoteAlertViewControllerViewWillAppear:self];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SSSDittoRemoteAlertViewController;
  [(SSSDittoRemoteAlertViewController *)&v5 viewDidLoad];
  v3 = [(SSSDittoRemoteAlertViewController *)self view];
  objc_super v4 = +[UIColor orangeColor];
  SSApplyDebuggingCustomizationsToViewIfAppropriate();
}

- (id)childViewControllerForStatusBarStyle
{
  return [(SSSDittoRootViewController *)self->_rootViewController childViewControllerForStatusBarStyle];
}

- (id)childViewControllerForStatusBarHidden
{
  return [(SSSDittoRootViewController *)self->_rootViewController childViewControllerForStatusBarHidden];
}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return -1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SSSDittoRemoteAlertViewController;
  objc_super v5 = (void (**)(void))a4;
  [(SSSDittoRemoteAlertViewController *)&v6 prepareForActivationWithContext:a3 completion:v5];
  v5[2](v5);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v13 = (void (**)(void))a4;
  objc_super v5 = [(SSSDittoRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v5 setDesiredHardwareButtonEvents:16];

  objc_super v6 = [(SSSDittoRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v6 setOrientationChangedEventsEnabled:0];

  double v7 = [(SSSDittoRemoteAlertViewController *)self _remoteViewControllerProxy];
  double v8 = +[UIApplication sharedApplication];
  [v7 setLaunchingInterfaceOrientation:[v8 activeInterfaceOrientation]];

  v9 = [(SSSDittoRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v9 setAllowsAlertItems:1];

  v10 = [(SSSDittoRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v10 setAllowsAlertStacking:1];

  objc_super v11 = [(SSSDittoRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v11 setReachabilityDisabled:1];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 postNotificationName:@"SSSDittoRemoteAlertViewControllerIsReadyForViewControllerManagerNotificationName" object:self];

  v13[2]();
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)_updateReachabilityEnabled
{
  BOOL v3 = [(SSSDittoRemoteAlertViewController *)self isTransitioningStates];
  id v4 = [(SSSDittoRemoteAlertViewController *)self _remoteViewControllerProxy];
  [v4 setReachabilityDisabled:v3];
}

- (BOOL)_shouldForceLayoutForHostedAnimation
{
  return 0;
}

- (SSSViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->viewControllerManager);

  return (SSSViewControllerManager *)WeakRetained;
}

- (void)setViewControllerManager:(id)a3
{
}

- (SSSDittoRemoteAlertViewControllerDelegate)dittoRemoteAlertDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dittoRemoteAlertDelegate);

  return (SSSDittoRemoteAlertViewControllerDelegate *)WeakRetained;
}

- (void)setDittoRemoteAlertDelegate:(id)a3
{
}

- (BOOL)isTransitioningStates
{
  return self->_isTransitioningStates;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dittoRemoteAlertDelegate);
  objc_destroyWeak((id *)&self->viewControllerManager);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end