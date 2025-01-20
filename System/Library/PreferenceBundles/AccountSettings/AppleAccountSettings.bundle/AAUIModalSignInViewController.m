@interface AAUIModalSignInViewController
- (AAUIModalSignInViewController)initWithCoder:(id)a3;
- (AAUIModalSignInViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_serviceContextWithResults:(id)a3 parentViewController:(id)a4;
- (id)serviceDescription;
- (id)serviceIcon;
- (id)serviceName;
- (void)_handleiForgotActionURL:(id)a3;
- (void)didCompleteSigningInWithAccount:(id)a3;
- (void)handleAuthCompletionWithResults:(id)a3;
- (void)handleURL:(id)a3;
- (void)willBeginAuthWithContext:(id)a3;
@end

@implementation AAUIModalSignInViewController

- (AAUIModalSignInViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIModalSignInViewController;
  v4 = [(AAUIModalSignInViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(AAUIModalSignInViewController *)v4 setPresentedModally:1];
  }
  return v5;
}

- (AAUIModalSignInViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIModalSignInViewController;
  v3 = [(AAUIModalSignInViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AAUIModalSignInViewController *)v3 setPresentedModally:1];
  }
  return v4;
}

- (id)serviceName
{
  return @"iCloud";
}

- (id)serviceDescription
{
  return @"Access your music, photos, contacts, calendars, and more on all your devices.";
}

- (id)serviceIcon
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[UIImage imageNamed:@"iCloudDrive" inBundle:v2];

  return v3;
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AAUIModalSignInViewController;
  [(AAUIModalSignInViewController *)&v7 handleURL:v4];
  v5 = [v4 objectForKeyedSubscript:@"aaaction"];
  if ([v5 isEqual:@"resetPassword"])
  {
    [(AAUIModalSignInViewController *)self _handleiForgotActionURL:v4];
  }
  else
  {
    objc_super v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Unknown action (%@) sent to AAUIModalSignInViewController. %@", buf, 0x16u);
    }
  }
}

- (void)_handleiForgotActionURL:(id)a3
{
  id v4 = a3;
  v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Received an iForgot redirect action. Will call to akd now...", buf, 2u);
  }

  id v6 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  [v6 setNeedsCredentialRecovery:1];
  [v6 setPresentingViewController:self];
  *(void *)buf = 0;
  __int16 v10 = buf;
  uint64_t v11 = 0x3032000000;
  v12 = sub_1ACAC;
  v13 = sub_1ACBC;
  id v14 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  objc_super v7 = (void *)*((void *)v10 + 5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1ACC4;
  v8[3] = &unk_75A90;
  v8[4] = buf;
  [v7 authenticateWithContext:v6 completion:v8];
  _Block_object_dispose(buf, 8);
}

- (void)willBeginAuthWithContext:(id)a3
{
  id v4 = a3;
  v5 = +[ACAccountStore defaultStore];
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");

  if (!v6)
  {
    [v4 setShouldOfferSecurityUpgrade:1];
    [v4 setAnticipateEscrowAttempt:1];
    [v4 setSupportsPiggybacking:1];
    objc_super v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Will authenticate primary account", buf, 2u);
    }
  }
  [v4 setShouldUpdatePersistentServiceTokens:1];
  [v4 setServiceType:1];
  [v4 setShouldForceInteractiveAuth:1];
  v8.receiver = self;
  v8.super_class = (Class)AAUIModalSignInViewController;
  [(AAUIModalSignInViewController *)&v8 willBeginAuthWithContext:v4];
}

- (void)handleAuthCompletionWithResults:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AAUIModalSignInViewController;
  [(AAUIModalSignInViewController *)&v14 handleAuthCompletionWithResults:v4];
  v5 = [(AAUIModalSignInViewController *)self navigationController];
  id v6 = [(AAUIModalSignInViewController *)self _serviceContextWithResults:v4 parentViewController:v5];

  id v7 = objc_alloc((Class)AIDAServiceOwnersManager);
  objc_super v8 = +[ACAccountStore defaultStore];
  id v9 = [v7 initWithAccountStore:v8];

  uint64_t v10 = AIDAServiceTypeCloud;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1AFEC;
  v12[3] = &unk_756D0;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [v9 signInService:v10 withContext:v6 completion:v12];
}

- (id)_serviceContextWithResults:(id)a3 parentViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)AIDAMutableServiceContext);
  [v8 setAuthenticationResults:v7];

  [v8 setViewController:v6];
  id v9 = [v8 signInContexts];
  id v10 = [v9 mutableCopy];
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_opt_new();
  }
  id v13 = v12;

  id v14 = objc_alloc((Class)AAUISignInFlowControllerDelegate);
  v15 = [v8 viewController];
  v16 = (AAUISignInFlowControllerDelegate *)[v14 initWithPresentingViewController:v15];
  flowControllerDelegate = self->_flowControllerDelegate;
  self->_flowControllerDelegate = v16;

  [v13 setObject:self->_flowControllerDelegate forKeyedSubscript:AIDAServiceTypeCloud];
  [v8 setSignInContexts:v13];
  id v18 = [v8 copy];

  return v18;
}

- (void)didCompleteSigningInWithAccount:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSAppleIDSplashViewController_opaque[OBJC_IVAR___PSViewController__parentController]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [WeakRetained controller:self didFinishSettingUpAccount:v6];
  }
  flowControllerDelegate = self->_flowControllerDelegate;
  self->_flowControllerDelegate = 0;
}

- (void).cxx_destruct
{
}

@end