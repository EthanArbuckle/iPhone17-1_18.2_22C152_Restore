@interface AKEDPRequestController
- (AKClient)client;
- (void)_edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 serviceController:(id)a5 completion:(id)a6;
- (void)_performRepairWithContext:(id)a3 completionHandler:(id)a4;
- (void)edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 completion:(id)a5;
- (void)isEDPHealthyForCDPContext:(id)a3 completion:(id)a4;
- (void)repairEDPStateForContext:(id)a3 authenticationResults:(id)a4 completion:(id)a5;
- (void)setClient:(id)a3;
@end

@implementation AKEDPRequestController

- (void)edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = (id)objc_opt_new();
  [v14 setAltDSID:v10];
  v11 = [(AKURLRequestProviderImpl *)[AKGrandSlamRequestProvider alloc] initWithContext:v14 urlBagKey:v9];
  [(AKGrandSlamRequestProvider *)v11 setExpectedResponseType:1];
  [(AKGrandSlamRequestProvider *)v11 setRequestBodyType:1];
  [(AKURLRequestProviderImpl *)v11 setAuthKitBody:&__NSDictionary0__struct];
  v12 = [(AKEDPRequestController *)self client];
  [(AKURLRequestProviderImpl *)v11 setClient:v12];

  v13 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v11];
  [(AKEDPRequestController *)self _edpRequestWithAltDSID:v10 URLKey:v9 serviceController:v13 completion:v8];
}

- (void)_edpRequestWithAltDSID:(id)a3 URLKey:(id)a4 serviceController:(id)a5 completion:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100020C68;
  v10[3] = &unk_100227080;
  id v11 = a4;
  id v12 = a6;
  id v8 = v12;
  id v9 = v11;
  [a5 executeRequestWithCompletion:v10];
}

- (void)repairEDPStateForContext:(id)a3 authenticationResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10017CE0C((uint64_t)v8, v11);
  }

  id v27 = 0;
  id v12 = [v8 authKitAccount:&v27];
  id v13 = v27;
  if (v12)
  {
    id v14 = +[AKAccountManager sharedInstance];
    id v15 = [v14 edpStateValueForAccount:v12];

    v16 = _AKLogSystem();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v15 == (id)1)
    {
      if (v17) {
        sub_10017CD9C(v16, v18, v19, v20, v21, v22, v23, v24);
      }

      v25 = +[AKCDPFactory contextWithAuthResults:v9];
      [v25 setType:11];
      [(AKEDPRequestController *)self _performRepairWithContext:v25 completionHandler:v10];
    }
    else
    {
      if (v17) {
        sub_10017CDD4(v16, v18, v19, v20, v21, v22, v23, v24);
      }

      if (v10) {
        (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      }
    }
  }
  else
  {
    v26 = _AKLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10017CD24((uint64_t)v13, v26);
    }

    if (v10) {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
    }
  }
}

- (void)_performRepairWithContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = +[AKCDPFactory stateControllerWithContext:a3];
  if (objc_opt_respondsToSelector())
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000210B0;
    v8[3] = &unk_1002270A8;
    id v9 = v5;
    [v6 repairEDPStateWithCompletion:v8];
  }
  else if (v5)
  {
    v7 = +[NSError ak_errorWithCode:-7027];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v7);
  }
}

- (void)isEDPHealthyForCDPContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[AKCDPFactory stateControllerWithContext:v6];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002121C;
  v9[3] = &unk_1002270D0;
  id v10 = v5;
  id v8 = v5;
  [v7 validateEDPIdentitiesWithContext:v6 completion:v9];
}

- (AKClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end