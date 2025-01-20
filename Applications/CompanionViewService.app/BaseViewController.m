@interface BaseViewController
- (CPSViewServicePresentationContext)presentationContext;
- (CPSViewServicePresenterInterface)viewServicePresenter;
- (SBUIRemoteAlertHostInterface)viewServiceHost;
- (void)configureWithContext:(id)a3 completion:(id)a4;
@end

@implementation BaseViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  id v7 = a3;
  v8 = [v7 xpcEndpoint];
  sub_100005518((id *)self, v8);

  sub_10000565C((uint64_t)self, v7);
  v9 = (CPSViewServicePresentationContext *)objc_claimAutoreleasedReturnValue();

  presentationContext = self->_presentationContext;
  self->_presentationContext = v9;

  v11 = sub_100005780();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_presentationContext;
    int v13 = 138412290;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received presentation context: %@", (uint8_t *)&v13, 0xCu);
  }

  v6[2](v6);
}

- (SBUIRemoteAlertHostInterface)viewServiceHost
{
  return (SBUIRemoteAlertHostInterface *)[(BaseViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_10000C448];
}

- (CPSViewServicePresenterInterface)viewServicePresenter
{
  return (CPSViewServicePresenterInterface *)[(NSXPCConnection *)self->_presenterConnection remoteObjectProxyWithErrorHandler:&stru_10000C468];
}

- (CPSViewServicePresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationContext, 0);

  objc_storeStrong((id *)&self->_presenterConnection, 0);
}

@end