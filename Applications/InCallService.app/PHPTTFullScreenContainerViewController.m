@interface PHPTTFullScreenContainerViewController
- (BOOL)_canShowWhileLocked;
- (PHPTTFullScreenContainerViewController)initWithBannerPresentationManager:(id)a3;
- (UIViewController)pttFullScreenViewController;
- (id)pttViewControllerWithBannerPresentationManager:(id)a3;
- (void)callStateChangedNotification:(id)a3;
- (void)dealloc;
- (void)obtainDismissalAssertion;
- (void)releaseDismissalAssertion;
- (void)setPttFullScreenViewController:(id)a3;
- (void)setupConstraints;
- (void)viewDidLoad;
@end

@implementation PHPTTFullScreenContainerViewController

- (PHPTTFullScreenContainerViewController)initWithBannerPresentationManager:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHPTTFullScreenContainerViewController;
  v5 = [(PHPTTFullScreenContainerViewController *)&v13 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(PHPTTFullScreenContainerViewController *)v5 obtainDismissalAssertion];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"callStateChangedNotification:" name:TUBargeCallStatusChangedNotification object:0];

    uint64_t v8 = [(PHPTTFullScreenContainerViewController *)v6 pttViewControllerWithBannerPresentationManager:v4];
    pttFullScreenViewController = v6->_pttFullScreenViewController;
    v6->_pttFullScreenViewController = (UIViewController *)v8;

    if (v6->_pttFullScreenViewController)
    {
      -[PHPTTFullScreenContainerViewController addChildViewController:](v6, "addChildViewController:");
      [(UIViewController *)v6->_pttFullScreenViewController didMoveToParentViewController:v6];
      v10 = [(PHPTTFullScreenContainerViewController *)v6 view];
      v11 = [(UIViewController *)v6->_pttFullScreenViewController view];
      [v10 addSubview:v11];

      [(PHPTTFullScreenContainerViewController *)v6 setupConstraints];
    }
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHPTTFullScreenContainerViewController;
  [(PHPTTFullScreenContainerViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PHPTTFullScreenContainerViewController;
  [(PHPTTFullScreenContainerViewController *)&v2 viewDidLoad];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setupConstraints
{
  id firstValue = [(UIViewController *)self->_pttFullScreenViewController view];
  [firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [(PHPTTFullScreenContainerViewController *)self view];
  objc_super v4 = _NSDictionaryOfVariableBindings(@"pttFullScreenView", firstValue, 0);
  v5 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[pttFullScreenView]|" options:0 metrics:0 views:v4];
  [v3 addConstraints:v5];

  v6 = [(PHPTTFullScreenContainerViewController *)self view];
  v7 = _NSDictionaryOfVariableBindings(@"pttFullScreenView", firstValue, 0);
  uint64_t v8 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[pttFullScreenView]|" options:0 metrics:0 views:v7];
  [v6 addConstraints:v8];
}

- (void)callStateChangedNotification:(id)a3
{
  objc_super v4 = [a3 object];
  if ([v4 isPTT] && objc_msgSend(v4, "status") - 5 <= 1)
  {
    v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Releasing PTT dismissal assertion.", v6, 2u);
    }

    [(PHPTTFullScreenContainerViewController *)self releaseDismissalAssertion];
  }
}

- (void)releaseDismissalAssertion
{
}

- (void)obtainDismissalAssertion
{
}

- (UIViewController)pttFullScreenViewController
{
  return self->_pttFullScreenViewController;
}

- (void)setPttFullScreenViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)pttViewControllerWithBannerPresentationManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)PHPTTFullScreenContainerViewController.pttViewController(bannnerPresentationManager:)();

  return v6;
}

@end