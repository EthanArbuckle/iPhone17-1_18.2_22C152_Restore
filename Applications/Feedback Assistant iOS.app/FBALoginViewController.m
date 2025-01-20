@interface FBALoginViewController
- (AAUISignInViewController)signInViewController;
- (NSString)prefilledUsername;
- (UITraitChangeRegistration)traitCollectionObservationToken;
- (id)authenticationContext;
- (id)environmentDescription;
- (id)log;
- (unint64_t)pendingStartupUI;
- (unint64_t)supportedInterfaceOrientations;
- (void)hideLogInUI;
- (void)setPendingStartupUI:(unint64_t)a3;
- (void)setPrefilledUsername:(id)a3;
- (void)setSignInViewController:(id)a3;
- (void)setTraitCollectionObservationToken:(id)a3;
- (void)showLogInUI;
- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4 completionHandler:(id)a5;
- (void)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6 completion:(id)a7;
- (void)signInViewControllerDidCancel:(id)a3;
- (void)signInViewControllerDidSelectChildSignIn:(id)a3;
- (void)signInViewControllerDidSkip:(id)a3;
- (void)updateLoginViewVisibility;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FBALoginViewController

- (id)log
{
  if (qword_100123FB8 != -1) {
    dispatch_once(&qword_100123FB8, &stru_1000F2A28);
  }
  v2 = (void *)qword_100123FB0;

  return v2;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)FBALoginViewController;
  [(FBALoginViewController *)&v41 viewDidLoad];
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [v3 stringForKey:@"LastSuccessfulLogin"];
  [(FBALoginViewController *)self setPrefilledUsername:v4];

  id v5 = objc_alloc_init((Class)AAUISignInViewController);
  [(FBALoginViewController *)self setSignInViewController:v5];

  v6 = [(FBALoginViewController *)self signInViewController];
  [v6 setDelegate:self];

  v7 = [(FBALoginViewController *)self signInViewController];
  [v7 setAllowsAccountCreation:0];

  v8 = [(FBALoginViewController *)self signInViewController];
  [v8 setCanEditUsername:1];

  v9 = [(FBALoginViewController *)self signInViewController];
  [v9 setShowServiceIcons:0];

  v10 = +[UIImage imageNamed:@"fba-ios-128"];
  v11 = [(FBALoginViewController *)self signInViewController];
  [v11 setHeaderImage:v10];

  v12 = [(FBALoginViewController *)self prefilledUsername];
  v13 = [(FBALoginViewController *)self signInViewController];
  [v13 setUsername:v12];

  if (+[FBARootSplitViewController presentsAuthKitUIModally])
  {
    if (([(FBALoginViewController *)self pendingStartupUI] & 2) != 0)
    {
      v31 = [(FBALoginViewController *)self storyboard];
      v15 = [v31 instantiateViewControllerWithIdentifier:@"FBALegalViewController"];

      objc_initWeak(&location, self);
      v34 = _NSConcreteStackBlock;
      uint64_t v35 = 3221225472;
      v36 = sub_100015840;
      v37 = &unk_1000F2A90;
      objc_copyWeak(&v39, &location);
      v38 = self;
      [v15 setCompletion:&v34];
      id v32 = objc_alloc((Class)UINavigationController);
      id v33 = [v32 initWithRootViewController:v15, v34, v35, v36, v37];
      [v33 setToolbarHidden:0];
      [(FBALoginViewController *)self presentViewController:v33 animated:0 completion:0];

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      v14 = [(FBALoginViewController *)self signInViewController];
      [v14 setModalInPresentation:1];

      v15 = [(FBALoginViewController *)self signInViewController];
      [(FBALoginViewController *)self presentViewController:v15 animated:0 completion:0];
    }
  }
  else
  {
    v16 = [(FBALoginViewController *)self view];
    v17 = [(FBALoginViewController *)self signInViewController];
    v18 = [v17 view];
    [v16 addSubview:v18];

    v19 = [(FBALoginViewController *)self signInViewController];
    [v19 willMoveToParentViewController:self];

    v20 = [(FBALoginViewController *)self signInViewController];
    [(FBALoginViewController *)self addChildViewController:v20];

    v21 = [(FBALoginViewController *)self signInViewController];
    [v21 didMoveToParentViewController:self];

    v22 = [(FBALoginViewController *)self signInViewController];
    v23 = [v22 view];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

    v42[0] = @"childView";
    v24 = [(FBALoginViewController *)self signInViewController];
    v25 = [v24 view];
    v43[0] = v25;
    v42[1] = @"containerView";
    v26 = [(FBALoginViewController *)self view];
    v43[1] = v26;
    v15 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];

    v27 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-padding-[childView]-padding-|", 0, &off_1000FAA68, v15);
    v28 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-padding-[childView]-padding-|", 0, &off_1000FAA90, v15);
    v29 = [(FBALoginViewController *)self view];
    [v29 addConstraints:v27];

    v30 = [(FBALoginViewController *)self view];
    [v30 addConstraints:v28];
  }
}

- (id)environmentDescription
{
  if (FBKIsInternalInstall())
  {
    unsigned int v2 = +[iFBAConstants environment];
    unsigned int v3 = +[iFBAConstants currentIDMSEnvironmentMatchesCurrentFBKSEnvironment];
    if ((v3 & (v2 == 0)) != 0) {
      v4 = 0;
    }
    else {
      v4 = @"[Error: FBA ≠ IDMS Environment]";
    }
    if ((v3 & (v2 == 0)) == 0 && v3)
    {
      uint64_t v5 = (int)+[iFBAConstants environment] - 1;
      if (v5 > 3) {
        CFStringRef v6 = @"Prod";
      }
      else {
        CFStringRef v6 = *(&off_1000F2AF8 + v5);
      }
      v4 = +[NSString stringWithFormat:@"[Environment: %@]", v6];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FBALoginViewController;
  [(FBALoginViewController *)&v7 viewWillAppear:a3];
  v4 = [(FBALoginViewController *)self navigationController];
  [v4 setNavigationBarHidden:1];

  [(FBALoginViewController *)self updateLoginViewVisibility];
  uint64_t v5 = +[UIApplication sharedApplication];
  CFStringRef v6 = [v5 delegate];
  [v6 removeBlurView];
}

- (void)showLogInUI
{
  unsigned int v2 = [(FBALoginViewController *)self signInViewController];
  unsigned int v3 = [v2 view];

  if (v3 && [v3 isHidden])
  {
    v4 = +[FBALog appHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "showing login UI", v5, 2u);
    }

    [v3 setHidden:0];
  }
}

- (void)hideLogInUI
{
  unsigned int v2 = [(FBALoginViewController *)self signInViewController];
  unsigned int v3 = [v2 view];

  if (v3)
  {
    v4 = +[FBALog appHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "hiding login UI", v5, 2u);
    }

    [v3 setHidden:1];
  }
}

- (void)updateLoginViewVisibility
{
  unsigned int v3 = +[FBKData sharedInstance];
  v4 = [v3 loginManager];
  id v5 = [v4 loginState];

  if (v5 == (id)1)
  {
    [(FBALoginViewController *)self hideLogInUI];
  }
  else
  {
    [(FBALoginViewController *)self showLogInUI];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 6;
}

- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = sub_1000159F8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v18 = "-[FBALoginViewController signInViewController:didCompleteWithAuthenticationResults:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  v10 = [v7 objectForKeyedSubscript:AKAuthenticationUsernameKey];
  v11 = [(FBALoginViewController *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000A495C((uint64_t)v10, v7, v11);
  }

  v12 = +[FBKData sharedInstance];
  v13 = [v12 loginManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100015F54;
  v15[3] = &unk_1000F2AB8;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [v13 loginWithUsername:v10 authenticationResults:v7 completion:v15];
}

- (void)signInViewControllerDidCancel:(id)a3
{
  unsigned int v3 = sub_1000159F8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[FBALoginViewController signInViewControllerDidCancel:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)signInViewControllerDidSkip:(id)a3
{
  unsigned int v3 = sub_1000159F8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[FBALoginViewController signInViewControllerDidSkip:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)signInViewController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6 completion:(id)a7
{
  id v8 = a5;
  v9 = (void (**)(id, BOOL))a7;
  v10 = sub_1000159F8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446210;
    v13 = "-[FBALoginViewController signInViewController:shouldContinueWithAuthenticationResults:error:forContext:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v12, 0xCu);
  }

  if (v8)
  {
    v11 = sub_1000159F8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000A4A1C((uint64_t)v8, v11);
    }
  }
  v9[2](v9, v8 == 0);
}

- (void)signInViewControllerDidSelectChildSignIn:(id)a3
{
  unsigned int v3 = sub_1000159F8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[FBALoginViewController signInViewControllerDidSelectChildSignIn:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v4, 0xCu);
  }
}

- (id)authenticationContext
{
  unsigned int v3 = sub_1000159F8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446210;
    v13 = "-[FBALoginViewController authenticationContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v12, 0xCu);
  }

  int v4 = +[FBKData sharedInstance];
  id v5 = [v4 loginManager];
  CFStringRef v6 = [v5 authenticationContextForUsername:0];

  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"FEEDBACK_ASSISTANT" value:&stru_1000F6658 table:0];
  [v6 setTitle:v8];

  v9 = [(FBALoginViewController *)self environmentDescription];
  if (v9) {
    [v6 setReason:v9];
  }
  v10 = [(FBALoginViewController *)self signInViewController];
  [v6 setPresentingViewController:v10];

  return v6;
}

- (unint64_t)pendingStartupUI
{
  return self->_pendingStartupUI;
}

- (void)setPendingStartupUI:(unint64_t)a3
{
  self->_pendingStartupUI = a3;
}

- (AAUISignInViewController)signInViewController
{
  return self->_signInViewController;
}

- (void)setSignInViewController:(id)a3
{
}

- (NSString)prefilledUsername
{
  return self->_prefilledUsername;
}

- (void)setPrefilledUsername:(id)a3
{
}

- (UITraitChangeRegistration)traitCollectionObservationToken
{
  return self->_traitCollectionObservationToken;
}

- (void)setTraitCollectionObservationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollectionObservationToken, 0);
  objc_storeStrong((id *)&self->_prefilledUsername, 0);

  objc_storeStrong((id *)&self->_signInViewController, 0);
}

@end