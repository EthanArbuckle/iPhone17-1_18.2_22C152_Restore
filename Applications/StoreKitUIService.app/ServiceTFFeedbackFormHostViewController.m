@interface ServiceTFFeedbackFormHostViewController
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)prefersStatusBarHidden;
- (TFFeedbackSession)hostedFeedbackSession;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismissViewService;
- (void)_presentFormViewControllerForSession:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setHostedFeedbackSession:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ServiceTFFeedbackFormHostViewController

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ServiceTFFeedbackFormHostViewController;
  [(ServiceTFFeedbackFormHostViewController *)&v6 viewDidAppear:a3];
  v4 = [(ServiceTFFeedbackFormHostViewController *)self hostedFeedbackSession];

  if (v4)
  {
    v5 = [(ServiceTFFeedbackFormHostViewController *)self hostedFeedbackSession];
    [(ServiceTFFeedbackFormHostViewController *)self _presentFormViewControllerForSession:v5];
  }
  else
  {
    [(ServiceTFFeedbackFormHostViewController *)self _dismissViewService];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v22 = a3;
  objc_super v6 = (void (**)(void))a4;
  v7 = [(ServiceTFFeedbackFormHostViewController *)self _remoteViewControllerProxy];
  [v7 setDesiredHardwareButtonEvents:16];
  [v7 setAllowsMenuButtonDismissal:1];
  [v7 setWallpaperTunnelActive:0];
  [v7 setAllowsAlertStacking:1];
  [v7 setDismissalAnimationStyle:2];
  [v7 setReachabilityDisabled:1];
  [v7 setSwipeDismissalStyle:1];
  v8 = +[UIDevice currentDevice];
  unint64_t v9 = (unint64_t)[v8 userInterfaceIdiom];

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v10 = +[UIApplication sharedApplication];
    id v11 = [v10 statusBarOrientation];

    [v7 setLaunchingInterfaceOrientation:v11];
  }
  v12 = [v22 userInfo];
  v13 = +[TFFeedbackHandleConfiguration configurationFromUserInfo:v12];

  v14 = [v13 incidentId];
  LODWORD(v12) = v14 != 0;

  id v15 = objc_alloc((Class)TFFeedbackSession);
  v16 = [v13 bundleIdentifier];
  id v17 = [v15 initForContext:2 * v12 betaApplicationIdentifier:v16];
  [(ServiceTFFeedbackFormHostViewController *)self setHostedFeedbackSession:v17];

  v18 = [(ServiceTFFeedbackFormHostViewController *)self hostedFeedbackSession];
  [v18 setDelegate:self];

  v19 = [(ServiceTFFeedbackFormHostViewController *)self hostedFeedbackSession];
  [v19 initiateFeedbackSnapshot];

  v20 = [(ServiceTFFeedbackFormHostViewController *)self hostedFeedbackSession];
  v21 = [v13 incidentId];
  [v20 associateIncidentId:v21];

  if (v6) {
    v6[2](v6);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
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
          [(ServiceTFFeedbackFormHostViewController *)self _dismissViewService];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_presentFormViewControllerForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(ServiceTFFeedbackFormHostViewController *)self view];
  id v6 = [v5 window];
  uint64_t v7 = [v6 _rootSheetPresentationController];
  [v7 _setShouldScaleDownBehindDescendantSheets:0];

  id v14 = [v4 createFeedbackViewControllerForCurrentState];

  id v8 = objc_alloc((Class)UIBarButtonItem);
  long long v9 = +[SKUIClientContext localizedStringForKey:@"CANCEL" inBundles:0];
  id v10 = [v8 initWithTitle:v9 style:0 target:self action:"cancelButtonPressed:"];

  long long v11 = [v14 navigationItem];
  [v11 setLeftBarButtonItem:v10];

  id v12 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v14];
  [v12 setModalPresentationStyle:1];
  v13 = [v12 presentationController];
  [v13 setDelegate:self];

  [(ServiceTFFeedbackFormHostViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_dismissViewService
{
  unint64_t v3 = [(ServiceTFFeedbackFormHostViewController *)self _remoteViewControllerProxy];
  id v4 = [(ServiceTFFeedbackFormHostViewController *)self presentedViewController];

  if (v4)
  {
    id v5 = [(ServiceTFFeedbackFormHostViewController *)self presentedViewController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001140C;
    v6[3] = &unk_10004CEB0;
    id v7 = v3;
    [v5 dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    [v3 dismiss];
  }
}

- (TFFeedbackSession)hostedFeedbackSession
{
  return self->_hostedFeedbackSession;
}

- (void)setHostedFeedbackSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end