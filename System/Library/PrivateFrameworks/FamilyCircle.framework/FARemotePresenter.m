@interface FARemotePresenter
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)remoteListener;
- (id)presentationCompletion;
- (void)_callCompletionWithResponse:(id)a3;
- (void)dealloc;
- (void)presentRemoteUserInterfaceWithOptions:(id)a3 completion:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setPresentationCompletion:(id)a3;
- (void)setRemoteListener:(id)a3;
@end

@implementation FARemotePresenter

- (void)presentRemoteUserInterfaceWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSXPCListener anonymousListener];
  remoteListener = self->_remoteListener;
  self->_remoteListener = v8;

  [(NSXPCListener *)self->_remoteListener setDelegate:self];
  [(NSXPCListener *)self->_remoteListener resume];
  [(FARemotePresenter *)self setPresentationCompletion:v6];

  id v10 = objc_alloc((Class)SBSRemoteAlertDefinition);
  id v11 = [v10 initWithServiceName:FARemoteServiceName viewControllerClassName:FARemoteAlertServiceViewControllerClassName];
  v12 = objc_opt_new();
  [v12 setUserInfo:v7];

  v13 = [(NSXPCListener *)self->_remoteListener endpoint];
  v14 = [v13 _endpoint];
  [v12 setXpcEndpoint:v14];

  id v15 = +[SBSRemoteAlertHandle newHandleWithDefinition:v11 configurationContext:v12];
  [v15 addObserver:self];
  v16 = _FALogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Activating handle: %@", (uint8_t *)&v18, 0xCu);
  }

  v17 = objc_opt_new();
  [v15 activateWithContext:v17];
}

- (void)_callCompletionWithResponse:(id)a3
{
  id v6 = a3;
  v4 = [(FARemotePresenter *)self presentationCompletion];

  if (v4)
  {
    v5 = [(FARemotePresenter *)self presentationCompletion];
    ((void (**)(void, id))v5)[2](v5, v6);

    [(FARemotePresenter *)self setPresentationCompletion:0];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = +[FAFamilyPresenterHostInterface XPCInterface];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = a3;
  v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Alert handle activated: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  int v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Alert handle deactivated %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = +[NSError errorWithDomain:FAErrorDomain code:-1005 userInfo:0];
  id v7 = [objc_alloc((Class)FACircleStateResponse) initWithLoadSuccess:0 error:v6 userInfo:0];
  [(FARemotePresenter *)self _callCompletionWithResponse:v7];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Alert handler interrupted!: %@ %@", (uint8_t *)&v10, 0x16u);
  }

  if (v7)
  {
    id v9 = [objc_alloc((Class)FACircleStateResponse) initWithLoadSuccess:0 error:v7 userInfo:0];
    [(FARemotePresenter *)self _callCompletionWithResponse:v9];
  }
}

- (void)dealloc
{
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100036278((uint64_t)self, v3);
  }

  v4.receiver = self;
  v4.super_class = (Class)FARemotePresenter;
  [(FARemotePresenter *)&v4 dealloc];
}

- (NSXPCListener)remoteListener
{
  return self->_remoteListener;
}

- (void)setRemoteListener:(id)a3
{
}

- (id)presentationCompletion
{
  return self->_presentationCompletion;
}

- (void)setPresentationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_storeStrong((id *)&self->_remoteListener, 0);
}

@end