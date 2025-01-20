@interface TVAccessViewServiceViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)shouldAutorotate;
- (TVAccessViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)completionHandler;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss;
- (void)_willAppearInRemoteViewController:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)configureWithUserInfo:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation TVAccessViewServiceViewController

- (TVAccessViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TVAccessViewServiceViewController;
  v4 = [(TVAccessViewServiceViewController *)&v8 initWithNibName:0 bundle:0];
  if (v4)
  {
    v5 = sub_100003488();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TVAccessViewServiceViewController init", v7, 2u);
    }
  }
  return v4;
}

- (BOOL)shouldAutorotate
{
  return 1;
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

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  accountName = self->_accountName;
  if (accountName) {
    v6 = accountName;
  }
  else {
    v6 = &stru_100004200;
  }
  v18[0] = VUIAccessOptionsAccountKey;
  v18[1] = VUIAccessOptionsShouldDenyOnCancelKey;
  v19[0] = v6;
  v19[1] = &__kCFBooleanTrue;
  v7 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v8 = objc_alloc((Class)VUIAccessViewController);
  bundleIDs = self->_bundleIDs;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003010;
  v15[3] = &unk_100004178;
  objc_copyWeak(&v16, &location);
  v10 = (VUIAccessViewController *)[v8 initWithBundleIDs:bundleIDs options:v7 completionHandler:v15];
  accessViewController = self->_accessViewController;
  self->_accessViewController = v10;

  [(VUIAccessViewController *)self->_accessViewController setModalPresentationStyle:2];
  [(VUIAccessViewController *)self->_accessViewController setModalPresentationCapturesStatusBarAppearance:1];
  v12 = self->_accessViewController;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100003050;
  v14[3] = &unk_1000041A0;
  v14[4] = self;
  [(TVAccessViewServiceViewController *)self presentViewController:v12 animated:1 completion:v14];
  v13.receiver = self;
  v13.super_class = (Class)TVAccessViewServiceViewController;
  [(TVAccessViewServiceViewController *)&v13 viewDidAppear:v3];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 0;
}

- (void)configureWithUserInfo:(id)a3
{
  id v6 = a3;
  v4 = [v6 objectForKey:WLKViewServiceAppBundlesKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_bundleIDs, v4);
  }
  v5 = [v6 objectForKey:WLKViewServiceAccountNameKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_accountName, v5);
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 userInfo];
  [(TVAccessViewServiceViewController *)self configureWithUserInfo:v8];
  v9.receiver = self;
  v9.super_class = (Class)TVAccessViewServiceViewController;
  [(TVAccessViewServiceViewController *)&v9 configureWithContext:v7 completion:v6];
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4 = a3;
  v5 = sub_100003488();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TVAccessViewServiceViewController _willAppearInRemoteViewController:", buf, 2u);
  }

  [v4 setShouldDisableFadeInAnimation:1];
  [v4 setAllowsMenuButtonDismissal:1];
  [v4 setShouldDismissOnUILock:1];
  [v4 setAllowsAlertStacking:1];
  v6.receiver = self;
  v6.super_class = (Class)TVAccessViewServiceViewController;
  [(TVAccessViewServiceViewController *)&v6 _willAppearInRemoteViewController:v4];
}

- (void)_dismiss
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003314;
  v2[3] = &unk_1000041A0;
  v2[4] = self;
  [(TVAccessViewServiceViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);

  objc_storeStrong((id *)&self->_accessViewController, 0);
}

@end