@interface AKPasswordResetRemoteViewController
- (AKAppleIDAuthenticationContext)context;
- (AKPasswordResetPresenterHostProtocol)hostProxy;
- (AKPasswordResetRemoteViewController)initWithContext:(id)a3;
- (BOOL)needsOptionsView;
- (UINavigationController)rootNavigationController;
- (UIViewController)fullscreenBackDropViewController;
- (UIViewController)passwordResetController;
- (id)remoteObjectInterface;
- (int64_t)modalPresentationStyle;
- (void)_passwordResetDidFinishWithResult:(id)a3 error:(id)a4;
- (void)_presentPasswordResetFlowForUsername:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleCancellation:(id)a3;
- (void)passwordResetControllerDidSelectClose:(id)a3;
- (void)passwordResetControllerDidSelectOtherUser:(id)a3;
- (void)passwordResetControllerDidSelectPrimaryUser:(id)a3;
- (void)setContext:(id)a3;
- (void)setFullscreenBackDropViewController:(id)a3;
- (void)setHostProxy:(id)a3;
- (void)setPasswordResetController:(id)a3;
- (void)setRootNavigationController:(id)a3;
- (void)setUpHostProxy;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willShowViewController:(id)a3;
@end

@implementation AKPasswordResetRemoteViewController

- (BOOL)needsOptionsView
{
  v3 = [(AKPasswordResetRemoteViewController *)self context];
  v4 = [v3 username];
  if (v4)
  {
    v5 = [(AKPasswordResetRemoteViewController *)self context];
    v6 = [v5 username];
    BOOL v7 = [v6 length] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (AKPasswordResetRemoteViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKPasswordResetRemoteViewController;
  v6 = [(AKPasswordResetRemoteViewController *)&v9 initWithNibName:0 bundle:0];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)AKPasswordResetRemoteViewController;
  [(AKPasswordResetRemoteViewController *)&v7 viewDidLoad];
  v3 = +[UIColor clearColor];
  v4 = [(AKPasswordResetRemoteViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc_init((Class)UIViewController);
  [(AKPasswordResetRemoteViewController *)self setFullscreenBackDropViewController:v5];

  v6 = [(AKPasswordResetRemoteViewController *)self fullscreenBackDropViewController];
  [v6 setModalPresentationStyle:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AKPasswordResetRemoteViewController;
  [(AKPasswordResetRemoteViewController *)&v8 viewWillAppear:a3];
  [(AKRemoteViewController *)self setupRemoteProxy];
  v4 = [(AKPasswordResetRemoteViewController *)self fullscreenBackDropViewController];
  id v5 = [v4 presentingViewController];

  if (!v5)
  {
    v6 = [(AKPasswordResetRemoteViewController *)self fullscreenBackDropViewController];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100003B00;
    v7[3] = &unk_10000C398;
    v7[4] = self;
    [(AKPasswordResetRemoteViewController *)self presentViewController:v6 animated:0 completion:v7];
  }
}

- (int64_t)modalPresentationStyle
{
  return 0;
}

- (void)setUpHostProxy
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000062B4(v3);
  }

  objc_initWeak(&location, self);
  v4 = [(AKRemoteViewController *)self lookupConnection];
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  objc_super v8 = sub_100003DE8;
  objc_super v9 = &unk_10000C320;
  objc_copyWeak(&v10, &location);
  id v5 = [v4 remoteObjectProxyWithErrorHandler:&v6];
  -[AKPasswordResetRemoteViewController setHostProxy:](self, "setHostProxy:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)remoteObjectInterface
{
  return +[AKPasswordResetPresenterHostInterface XPCInterface];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = a3;
  objc_super v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Configuring remote view service", buf, 2u);
  }

  objc_super v9 = [v7 userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"context"];

  v11 = [v7 xpcEndpoint];

  [(AKRemoteViewController *)self setUpLookupConnection:v11];
  if ([v10 length])
  {
    id v21 = 0;
    v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v21];
    v13 = v21;
    [(AKPasswordResetRemoteViewController *)self setContext:v12];

    if (v13)
    {
      v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10000658C((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
  else
  {
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100006548(v13);
    }
  }

  if (v6) {
    v6[2](v6);
  }
}

- (void)handleCancellation:(id)a3
{
  id v4 = +[NSError ak_errorWithCode:-7003];
  [(AKPasswordResetRemoteViewController *)self _passwordResetDidFinishWithResult:0 error:v4];
}

- (void)passwordResetControllerDidSelectPrimaryUser:(id)a3
{
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Primary user password reset option selected", v7, 2u);
  }

  id v5 = [(AKPasswordResetRemoteViewController *)self context];
  v6 = [v5 username];
  [(AKPasswordResetRemoteViewController *)self _presentPasswordResetFlowForUsername:v6];
}

- (void)passwordResetControllerDidSelectOtherUser:(id)a3
{
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Different user password reset option selected", v5, 2u);
  }

  [(AKPasswordResetRemoteViewController *)self _presentPasswordResetFlowForUsername:0];
}

- (void)passwordResetControllerDidSelectClose:(id)a3
{
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Closing password reset options screen", v6, 2u);
  }

  id v5 = +[NSError ak_errorWithCode:-7003];
  [(AKPasswordResetRemoteViewController *)self _passwordResetDidFinishWithResult:0 error:v5];
}

- (void)willShowViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 stopLoading];
  }
}

- (void)_presentPasswordResetFlowForUsername:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initiating password reset flow from view service", (uint8_t *)buf, 2u);
  }

  id v6 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  [v6 setUsername:v4];
  [v6 setIsEphemeral:1];
  [v6 setAuthenticationType:2];
  [v6 setNeedsCredentialRecovery:1];
  id v7 = [(AKPasswordResetRemoteViewController *)self context];
  objc_msgSend(v6, "setIsNativeTakeover:", objc_msgSend(v7, "isNativeTakeover"));

  [v6 setIsRequestedFromOOPViewService:1];
  objc_super v8 = [(AKPasswordResetRemoteViewController *)self context];
  [v6 setServiceType:[v8 serviceType]];

  objc_super v9 = [(AKPasswordResetRemoteViewController *)self context];
  id v10 = [v9 serviceIdentifier];
  [v6 setServiceIdentifier:v10];

  v11 = [(AKPasswordResetRemoteViewController *)self context];
  v12 = [v11 httpHeadersForRemoteUI];
  [v6 setHttpHeadersForRemoteUI:v12];

  [v6 setShouldPromptForPasswordOnly:0];
  [v6 setIsUsernameEditable:0];
  [v6 setForceInlinePresentation:[self needsOptionsView]];
  if ([(AKPasswordResetRemoteViewController *)self needsOptionsView]) {
    [(AKPasswordResetRemoteViewController *)self rootNavigationController];
  }
  else {
  v13 = [(AKPasswordResetRemoteViewController *)self fullscreenBackDropViewController];
  }
  [v6 setPresentingViewController:v13];

  [v6 setDelegate:self];
  objc_initWeak(buf, self);
  id v14 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100004544;
  v16[3] = &unk_10000C4A8;
  objc_copyWeak(&v18, buf);
  id v15 = v14;
  id v17 = v15;
  [v15 authenticateWithContext:v6 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(buf);
}

- (void)_passwordResetDidFinishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Password reset flow finished", (uint8_t *)buf, 2u);
  }

  objc_super v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100006668((uint64_t)v6, (uint64_t)v7, v9);
  }

  objc_initWeak(buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000049B4;
  v16[3] = &unk_10000C4D0;
  objc_copyWeak(&v17, buf);
  id v10 = objc_retainBlock(v16);
  v11 = [(AKPasswordResetRemoteViewController *)self hostProxy];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004A94;
  v13[3] = &unk_10000C520;
  objc_copyWeak(&v15, buf);
  v12 = v10;
  id v14 = v12;
  [v11 passwordResetFinishedWithResult:v6 error:v7 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);
}

- (AKAppleIDAuthenticationContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (UIViewController)fullscreenBackDropViewController
{
  return self->_fullscreenBackDropViewController;
}

- (void)setFullscreenBackDropViewController:(id)a3
{
}

- (UINavigationController)rootNavigationController
{
  return self->_rootNavigationController;
}

- (void)setRootNavigationController:(id)a3
{
}

- (UIViewController)passwordResetController
{
  return self->_passwordResetController;
}

- (void)setPasswordResetController:(id)a3
{
}

- (AKPasswordResetPresenterHostProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_passwordResetController, 0);
  objc_storeStrong((id *)&self->_rootNavigationController, 0);
  objc_storeStrong((id *)&self->_fullscreenBackDropViewController, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end