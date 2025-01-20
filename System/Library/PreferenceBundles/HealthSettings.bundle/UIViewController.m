@interface UIViewController
- (void)hk_authenticateWithCompletionViewController:(id)a3;
- (void)hk_authenticateWithGuard:(id)a3 completionViewController:(id)a4;
@end

@implementation UIViewController

- (void)hk_authenticateWithCompletionViewController:(id)a3
{
  id v4 = a3;
  id v5 = +[APGuard sharedGuard];
  [(UIViewController *)self hk_authenticateWithGuard:v5 completionViewController:v4];
}

- (void)hk_authenticateWithGuard:(id)a3 completionViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_92AC;
  v9[3] = &unk_105D8;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v10 = v8;
  v11 = self;
  +[AuthenticationHelper _authenticateWithGuard:v6 completion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

@end