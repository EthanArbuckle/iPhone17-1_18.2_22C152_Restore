@interface AKAuthorizationRevokeUpgradeController
- (id)_authenticationContextForRevokingUpgrade;
- (id)_requestBodyForUpgradeRevokeContext:(id)a3;
- (void)revokeUpgradeWithContext:(id)a3 client:(id)a4 completion:(id)a5;
@end

@implementation AKAuthorizationRevokeUpgradeController

- (void)revokeUpgradeWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [(AKAuthorizationRevokeUpgradeController *)self _authenticationContextForRevokingUpgrade];
  v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100190CAC(v8, v12);
  }

  v13 = [AKGrandSlamRequestProvider alloc];
  v14 = [(AKURLRequestProviderImpl *)v13 initWithContext:v11 urlBagKey:AKURLBagKeyDeleteAuthorizedApp];
  [(AKGrandSlamRequestProvider *)v14 setAuthenticatedRequest:1];
  [(AKURLRequestProviderImpl *)v14 setClient:v10];

  v15 = [(AKAuthorizationRevokeUpgradeController *)self _requestBodyForUpgradeRevokeContext:v8];
  [(AKURLRequestProviderImpl *)v14 setAuthKitBody:v15];

  v16 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v14];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000B17FC;
  v18[3] = &unk_100227340;
  id v19 = v9;
  id v17 = v9;
  [(AKServiceControllerImpl *)v16 executeRequestWithCompletion:v18];
}

- (id)_requestBodyForUpgradeRevokeContext:(id)a3
{
  v9[0] = @"atxid";
  id v3 = a3;
  v4 = [v3 transactionID];
  v10[0] = v4;
  v9[1] = @"client_id";
  v5 = [v3 bundleID];
  v10[1] = v5;
  v9[2] = @"team_id";
  v6 = [v3 teamID];

  v10[2] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (id)_authenticationContextForRevokingUpgrade
{
  id v2 = objc_alloc_init((Class)AKAccountManager);
  id v3 = [v2 altDSIDforPrimaryiCloudAccount];
  id v4 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  [v4 setAltDSID:v3];

  return v4;
}

@end