@interface WebAuthenticationViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (void)_viewControllerDismissed:(id)a3;
- (void)cancel;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WebAuthenticationViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WebAuthenticationViewController;
  [(WebAuthenticationViewController *)&v4 viewDidLoad];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_viewControllerDismissed:" name:UIPresentationControllerDismissalTransitionDidEndNotification object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WebAuthenticationViewController;
  [(WebAuthenticationViewController *)&v8 viewDidAppear:a3];
  objc_super v4 = [(WebAuthenticationViewController *)self view];
  v5 = [v4 window];
  v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  v7 = [(BaseViewController *)self viewServiceHost];
  [v7 setAllowsAlertStacking:1];

  sub_100002FD0((id *)self);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)cancel
{
}

- (void)_viewControllerDismissed:(id)a3
{
  id v4 = a3;
  v5 = sub_1000034A4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "View controller dismissed: %@", (uint8_t *)&v8, 0xCu);
  }

  viewControllerDismissedHandler = (void (**)(void))self->_viewControllerDismissedHandler;
  if (viewControllerDismissedHandler)
  {
    viewControllerDismissedHandler[2]();
    id v7 = self->_viewControllerDismissedHandler;
    self->_viewControllerDismissedHandler = 0;
  }
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  v3 = [(WebAuthenticationViewController *)self view];
  id v4 = [v3 window];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewControllerDismissedHandler, 0);

  objc_storeStrong((id *)&self->_authenticationSession, 0);
}

@end