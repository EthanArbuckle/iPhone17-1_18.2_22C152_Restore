@interface AKTokenUpgrader
- (AKTokenUpgrader)initWithClient:(id)a3;
- (id)_fetchDependentAuthTokenForAltDSID:(id)a3;
- (void)_performTokenUpgradeWithContext:(id)a3 completion:(id)a4;
- (void)upgradeTokenWithContext:(id)a3 completion:(id)a4;
@end

@implementation AKTokenUpgrader

- (AKTokenUpgrader)initWithClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKTokenUpgrader;
  v6 = [(AKTokenUpgrader *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = +[AKAccountManager sharedInstance];
    accountManager = v7->_accountManager;
    v7->_accountManager = (AKAccountManager *)v8;
  }
  return v7;
}

- (void)upgradeTokenWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 authenticationType] != (id)2 && objc_msgSend(v6, "authenticationType") != (id)3)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000D1478;
    v10[3] = &unk_10022B6F0;
    id v12 = v7;
    id v11 = v6;
    [(AKTokenUpgrader *)self _performTokenUpgradeWithContext:v11 completion:v10];

    v9 = v12;
    goto LABEL_8;
  }
  uint64_t v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current context requires interactive auth, skipping token upgrade flow.", buf, 2u);
  }

  if (v7)
  {
    v9 = +[NSError ak_errorWithCode:-7034];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
LABEL_8:
  }
}

- (id)_fetchDependentAuthTokenForAltDSID:(id)a3
{
  id v3 = a3;
  v4 = +[AKAccountManager sharedInstance];
  id v5 = [v4 appleIDAccountWithAltDSID:v3];
  if (v5)
  {
    id v6 = [v4 dependentAuthTokenForAccount:v5];
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100194F10((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
    }

    id v6 = 0;
  }

  return v6;
}

- (void)_performTokenUpgradeWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 altDSID];
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting Upgrade Token request with altDSID %@...", buf, 0xCu);
  }
  uint64_t v10 = [AKTokenUpgradeRequestProvider alloc];
  uint64_t v11 = [(AKURLRequestProviderImpl *)v10 initWithContext:v6 urlBagKey:AKURLBagKeyTokenUpgrade];
  [(AKURLRequestProviderImpl *)v11 setClient:self->_client];
  uint64_t v12 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v11];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000D184C;
  v14[3] = &unk_100227340;
  id v15 = v7;
  id v13 = v7;
  [(AKServiceControllerImpl *)v12 executeRequestWithCompletion:v14];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end