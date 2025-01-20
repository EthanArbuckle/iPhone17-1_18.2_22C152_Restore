@interface OnenessService
- (BOOL)canProcessRequest:(id)a3;
- (LACOnenessControlling)controller;
- (OnenessService)initWithUIController:(id)a3 sessionMonitor:(id)a4 workQueue:(id)a5;
- (void)cancelAllRequests;
- (void)cancelRequestsForContextID:(id)a3;
- (void)domainStateForRequest:(id)a3 completion:(id)a4;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)startServices;
@end

@implementation OnenessService

- (void)cancelRequestsForContextID:(id)a3
{
}

- (BOOL)canProcessRequest:(id)a3
{
  return [(LACOnenessControlling *)self->_controller canProcessRequest:a3];
}

- (LACOnenessControlling)controller
{
  return self->_controller;
}

- (OnenessService)initWithUIController:(id)a3 sessionMonitor:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)OnenessService;
  v11 = [(OnenessService *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workQueue, a5);
    v13 = (LACClientInfoProviding *)objc_alloc_init((Class)LACClientInfoProvider);
    infoProvider = v12->_infoProvider;
    v12->_infoProvider = v13;

    v15 = (LACOnenessAuthenticating *)[objc_alloc((Class)LACOnenessAuthenticator) initWithClientInfoProvider:v12->_infoProvider replyQueue:v12->_workQueue];
    authenticator = v12->_authenticator;
    v12->_authenticator = v15;

    objc_storeStrong((id *)&v12->_sessionMonitor, a4);
    id v17 = [objc_alloc((Class)LACUserInterfacePresenter) initWithReplyQueue:v12->_workQueue uiController:v8];
    v18 = (LACOnenessControlling *)[objc_alloc((Class)LACOnenessController) initWithSessionMonitor:v9 authenticator:v12->_authenticator uiPresenter:v17 replyQueue:v12->_workQueue];
    controller = v12->_controller;
    v12->_controller = v18;
  }
  return v12;
}

- (void)startServices
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100011EE8;
  v4[3] = &unk_100038B28;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelAllRequests
{
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionMonitor, 0);
  objc_storeStrong((id *)&self->_infoProvider, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_authenticator, 0);
}

@end