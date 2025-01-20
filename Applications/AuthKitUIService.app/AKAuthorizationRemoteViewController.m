@interface AKAuthorizationRemoteViewController
- (AKAuthorizationPresentationContext)presentationContext;
- (AKAuthorizationPresenterHostProtocol)hostProxy;
- (AKAuthorizationRemoteViewController)initWithPresentationContext:(id)a3;
- (AKAuthorizationViewController)authorizationViewController;
- (id)remoteObjectInterface;
- (void)_callCompletionWithAuthorization:(id)a3 error:(id)a4;
- (void)_didCompleteWithError:(id)a3;
- (void)_main_dismissAndExit;
- (void)_showTiburonFlow;
- (void)authorizationViewController:(id)a3 didCompleteWithAuthorization:(id)a4 error:(id)a5;
- (void)authorizationViewController:(id)a3 didRequestAuthorizationWithUserProvidedInformation:(id)a4 completion:(id)a5;
- (void)authorizationViewController:(id)a3 didRequestIconForRequestContext:(id)a4 completion:(id)a5;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleCancellation:(id)a3;
- (void)setAuthorizationViewController:(id)a3;
- (void)setHostProxy:(id)a3;
- (void)setPresentationContext:(id)a3;
- (void)setUpHostProxy;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AKAuthorizationRemoteViewController

- (AKAuthorizationRemoteViewController)initWithPresentationContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationRemoteViewController;
  v6 = [(AKAuthorizationRemoteViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_presentationContext, a3);
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationRemoteViewController;
  [(AKAuthorizationRemoteViewController *)&v4 viewWillAppear:a3];
  [(AKRemoteViewController *)self setupRemoteProxy];
  [(AKAuthorizationRemoteViewController *)self _showTiburonFlow];
}

- (void)_showTiburonFlow
{
  if (self->_authorizationViewController)
  {
    v2 = _AKLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100006270(v2);
    }
  }
  else
  {
    id v4 = objc_alloc((Class)AKAuthorizationViewController);
    id v5 = [(AKAuthorizationRemoteViewController *)self presentationContext];
    v6 = (AKAuthorizationViewController *)[v4 initWithAuthorizationContext:v5];
    authorizationViewController = self->_authorizationViewController;
    self->_authorizationViewController = v6;

    [(AKAuthorizationViewController *)self->_authorizationViewController setDelegate:self];
    [(AKAuthorizationViewController *)self->_authorizationViewController willMoveToParentViewController:self];
    [(AKAuthorizationRemoteViewController *)self addChildViewController:self->_authorizationViewController];
    v2 = [(AKAuthorizationViewController *)self->_authorizationViewController view];
    v8 = [(AKAuthorizationRemoteViewController *)self view];
    [v8 addSubview:v2];

    [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = [v2 leadingAnchor];
    v25 = [(AKAuthorizationRemoteViewController *)self view];
    v23 = [v25 leadingAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v26[0] = v22;
    v20 = [v2 trailingAnchor];
    v21 = [(AKAuthorizationRemoteViewController *)self view];
    v19 = [v21 trailingAnchor];
    v18 = [v20 constraintEqualToAnchor:v19];
    v26[1] = v18;
    v16 = [v2 topAnchor];
    v17 = [(AKAuthorizationRemoteViewController *)self view];
    objc_super v9 = [v17 topAnchor];
    v10 = [v16 constraintEqualToAnchor:v9];
    v26[2] = v10;
    v11 = [v2 bottomAnchor];
    v12 = [(AKAuthorizationRemoteViewController *)self view];
    v13 = [v12 bottomAnchor];
    v14 = [v11 constraintEqualToAnchor:v13];
    v26[3] = v14;
    v15 = +[NSArray arrayWithObjects:v26 count:4];
    +[NSLayoutConstraint activateConstraints:v15];

    [(AKAuthorizationViewController *)self->_authorizationViewController didMoveToParentViewController:self];
  }
}

- (void)setUpHostProxy
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000062B4(v3);
  }

  objc_initWeak(&location, self);
  id v4 = [(AKRemoteViewController *)self lookupConnection];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000234C;
  v7[3] = &unk_10000C320;
  objc_copyWeak(&v8, &location);
  id v5 = [v4 remoteObjectProxyWithErrorHandler:v7];
  hostProxy = self->_hostProxy;
  self->_hostProxy = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)remoteObjectInterface
{
  return +[AKAuthorizationPresenterHostInterface XPCInterface];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Configuring remote view service", buf, 2u);
  }

  objc_super v9 = [v7 userInfo];
  v10 = [v9 objectForKeyedSubscript:@"context"];

  v11 = [v7 xpcEndpoint];

  [(AKRemoteViewController *)self setUpLookupConnection:v11];
  if ([v10 length])
  {
    id v15 = 0;
    v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v15];
    v13 = v15;
    [(AKAuthorizationRemoteViewController *)self setPresentationContext:v12];

    if (v13)
    {
      v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000063B4((uint64_t)v13, v14);
      }
    }
  }
  else
  {
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100006370(v13);
    }
  }

  v6[2](v6);
}

- (void)handleCancellation:(id)a3
{
  id v4 = +[NSError ak_errorWithCode:-7003];
  [(AKAuthorizationRemoteViewController *)self _callCompletionWithAuthorization:0 error:v4];
}

- (void)authorizationViewController:(id)a3 didCompleteWithAuthorization:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_super v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AKRemoteViewController did complete with authorization %@ (error: %@)", (uint8_t *)&v10, 0x16u);
  }

  if (v8 && (objc_msgSend(v8, "ak_isUserInitiatedError") & 1) == 0) {
    [(AKAuthorizationRemoteViewController *)self _didCompleteWithError:v8];
  }
  else {
    [(AKAuthorizationRemoteViewController *)self _callCompletionWithAuthorization:v7 error:v8];
  }
}

- (void)authorizationViewController:(id)a3 didRequestAuthorizationWithUserProvidedInformation:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_super v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "UI service initiating authorization request with userSelection: %@", (uint8_t *)&v10, 0xCu);
  }

  [(AKAuthorizationPresenterHostProtocol *)self->_hostProxy authorizationRequestInitiatedWithUserProvidedInformation:v7 completion:v8];
}

- (void)authorizationViewController:(id)a3 didRequestIconForRequestContext:(id)a4 completion:(id)a5
{
}

- (void)_callCompletionWithAuthorization:(id)a3 error:(id)a4
{
  hostProxy = self->_hostProxy;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100002850;
  v5[3] = &unk_10000C348;
  v5[4] = self;
  [(AKAuthorizationPresenterHostProtocol *)hostProxy authorizationRequestFinishedWithAuthorization:a3 error:a4 completion:v5];
}

- (void)_didCompleteWithError:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 1100000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002914;
  v7[3] = &unk_10000C370;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)_main_dismissAndExit
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100002C8C;
  v20[3] = &unk_10000C398;
  v20[4] = self;
  v3 = objc_retainBlock(v20);
  id v4 = [(AKAuthorizationRemoteViewController *)self authorizationViewController];

  if (v4)
  {
    dispatch_time_t v5 = [(AKAuthorizationRemoteViewController *)self authorizationViewController];
    id v6 = [v5 navigationController];
    id v7 = [v6 view];
    [v7 frame];
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;

    v14 = [(AKAuthorizationRemoteViewController *)self view];
    [v14 frame];
    uint64_t v16 = v15;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100002CDC;
    v19[3] = &unk_10000C3C0;
    v19[4] = self;
    v19[5] = v9;
    v19[6] = v16;
    v19[7] = v11;
    v19[8] = v13;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100002D70;
    v17[3] = &unk_10000C3E8;
    v17[4] = self;
    v18 = v3;
    +[UIView _animateUsingDefaultTimingWithOptions:134 animations:v19 completion:v17];
  }
  else
  {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (AKAuthorizationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (AKAuthorizationViewController)authorizationViewController
{
  return self->_authorizationViewController;
}

- (void)setAuthorizationViewController:(id)a3
{
}

- (AKAuthorizationPresenterHostProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_authorizationViewController, 0);

  objc_storeStrong((id *)&self->_presentationContext, 0);
}

@end