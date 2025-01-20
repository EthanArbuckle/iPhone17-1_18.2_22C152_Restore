@interface AKServiceControllerImpl
- (AKAuthHandler)reauthHandler;
- (AKRequestDispatcher)requestDispatcher;
- (AKServiceControllerImpl)initWithRequestProvider:(id)a3;
- (AKURLRequestProvider)requestProvider;
- (void)executeRequestWithCompletion:(id)a3;
- (void)setAuthenticationDelegate:(id)a3;
- (void)setReauthHandler:(id)a3;
- (void)setRequestDispatcher:(id)a3;
- (void)setRequestProvider:(id)a3;
@end

@implementation AKServiceControllerImpl

- (AKServiceControllerImpl)initWithRequestProvider:(id)a3
{
  id v5 = a3;
  v6 = [(AKServiceControllerImpl *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestProvider, a3);
    uint64_t v8 = +[AKRequestDispatcher sharedDispatcher];
    requestDispatcher = v7->_requestDispatcher;
    v7->_requestDispatcher = (AKRequestDispatcher *)v8;
  }
  return v7;
}

- (void)setAuthenticationDelegate:(id)a3
{
}

- (void)executeRequestWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [AKDispatchableURLRequest alloc];
  requestProvider = self->_requestProvider;
  reauthHandler = self->_reauthHandler;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007F1A4;
  v11[3] = &unk_100229988;
  id v12 = v4;
  id v8 = v4;
  v9 = [(AKDispatchableURLRequest *)v5 initWithURLRequestProvider:requestProvider authenticationHandler:reauthHandler completionHandler:v11];
  v10 = [(AKServiceControllerImpl *)self requestDispatcher];
  [v10 submitDispatchableRequest:v9];
}

- (AKRequestDispatcher)requestDispatcher
{
  return self->_requestDispatcher;
}

- (void)setRequestDispatcher:(id)a3
{
}

- (AKURLRequestProvider)requestProvider
{
  return self->_requestProvider;
}

- (void)setRequestProvider:(id)a3
{
}

- (AKAuthHandler)reauthHandler
{
  return self->_reauthHandler;
}

- (void)setReauthHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reauthHandler, 0);
  objc_storeStrong((id *)&self->_requestDispatcher, 0);

  objc_storeStrong((id *)&self->_requestProvider, 0);
}

@end