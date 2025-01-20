@interface AAUIServiceAuthHandler
- (AAUIServiceAuthHandler)initWithAccountManager:(id)a3;
- (AAUIServiceAuthHandler)initWithAccountManager:(id)a3 presenter:(id)a4;
- (AIDAServiceOwnerProtocol)serviceOwnersManager;
- (BOOL)accountMatchesPrimaryAccount:(id)a3 service:(id)a4;
- (id)account;
- (void)signInAccountForService:(id)a3 completion:(id)a4;
- (void)signOutAccountForService:(id)a3 completion:(id)a4;
@end

@implementation AAUIServiceAuthHandler

- (AAUIServiceAuthHandler)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIServiceAuthHandler;
  v9 = [(AAUIServiceAuthHandler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
  }

  return v10;
}

- (AAUIServiceAuthHandler)initWithAccountManager:(id)a3
{
  return [(AAUIServiceAuthHandler *)self initWithAccountManager:a3 presenter:0];
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:AIDAServiceTypeCloud];

  return v3;
}

- (AIDAServiceOwnerProtocol)serviceOwnersManager
{
  serviceOwnersManager = self->_serviceOwnersManager;
  if (!serviceOwnersManager)
  {
    id v4 = objc_alloc((Class)AIDAServiceOwnersManager);
    v5 = [(AIDAAccountManager *)self->_accountManager accountStore];
    v6 = (AIDAServiceOwnerProtocol *)[v4 initWithAccountStore:v5];
    id v7 = self->_serviceOwnersManager;
    self->_serviceOwnersManager = v6;

    serviceOwnersManager = self->_serviceOwnersManager;
  }

  return serviceOwnersManager;
}

- (void)signInAccountForService:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_7FB0;
  v38[3] = &unk_753E8;
  id v7 = a4;
  id v39 = v7;
  id v8 = objc_retainBlock(v38);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_805C;
  v35[3] = &unk_75460;
  v35[4] = self;
  id v9 = v6;
  id v36 = v9;
  v10 = v8;
  id v37 = v10;
  v11 = objc_retainBlock(v35);
  objc_super v12 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager accountForService:v9];
  if (v12)
  {
    unsigned int v13 = [(AAUIServiceAuthHandler *)self accountMatchesPrimaryAccount:v12 service:v9];
    v14 = _AAUILogSystem();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v9;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Already signed in to service %@, marking as such...", buf, 0xCu);
      }

      ((void (*)(void *, uint64_t))v10[2])(v10, 1);
    }
    else
    {
      v30 = v11;
      v31 = v7;
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v9;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "User already signed in to service %@, prompting for clarification...", buf, 0xCu);
      }

      v16 = AALocalizedStringForServiceType();
      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = [v17 localizedStringForKey:@"ICLOUD_SERVICE_SWAP_ACCOUNT_MESSAGE" value:&stru_76890 table:@"Localizable"];
      v19 = [(AAUIServiceAuthHandler *)self account];
      v20 = [v19 username];
      v21 = [v12 username];
      v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v16, v20, v21);

      v22 = +[NSBundle bundleForClass:objc_opt_class()];
      v23 = [v22 localizedStringForKey:@"ICLOUD_SERVICE_SWAP_ACCOUNT_ACTION" value:&stru_76890 table:@"Localizable"];
      v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v16);

      v24 = +[NSBundle bundleForClass:objc_opt_class()];
      v25 = [v24 localizedStringForKey:@"CANCEL" value:&stru_76890 table:@"Localizable"];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_8618;
      v32[3] = &unk_75488;
      id v7 = v31;
      id v33 = v31;
      id v34 = v30;
      v26 = +[UIAlertController alertWithTitle:v29 message:0 cancelButtonTitle:v25 defaultButtonTitle:v28 actionHandler:v32];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      [WeakRetained presentViewController:v26 animated:1 completion:0];

      v11 = v30;
    }
  }
  else
  {
    ((void (*)(void *, void))v11[2])(v11, 0);
  }
}

- (void)signOutAccountForService:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_82F8;
  v30 = sub_8308;
  id v8 = objc_alloc((Class)AAUISignOutFlowControllerDelegate);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v31 = [v8 initWithPresentingViewController:WeakRetained];

  [(id)v27[5] setAccountManager:self->_accountManager];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_8A54;
  v23[3] = &unk_754B0;
  v25 = &v26;
  id v10 = v7;
  id v24 = v10;
  v11 = objc_retainBlock(v23);
  id v12 = objc_alloc_init((Class)AIDAMutableServiceContext);
  id v13 = objc_loadWeakRetained((id *)&self->_listController);
  [v12 setViewController:v13];

  if ((id)AIDAServiceTypeGameCenter == v6)
  {
    uint64_t v15 = v27[5];
    v36[0] = AIDAServiceTypeCloud;
    v36[1] = v6;
    v37[0] = v15;
    v37[1] = &off_79D30;
    +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    uint64_t v34 = AIDAServiceTypeCloud;
    uint64_t v35 = v27[5];
    +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v14 = };
  [v12 setSignOutContexts:v14];

  v16 = _AAUILogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = v6;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Attempting sign out for service: %{public}@", buf, 0xCu);
  }

  serviceOwnersManager = self->_serviceOwnersManager;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_8B18;
  v20[3] = &unk_75410;
  id v18 = v6;
  id v21 = v18;
  v19 = v11;
  id v22 = v19;
  [(AIDAServiceOwnerProtocol *)serviceOwnersManager signOutService:v18 withContext:v12 completion:v20];

  _Block_object_dispose(&v26, 8);
}

- (BOOL)accountMatchesPrimaryAccount:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager altDSIDForAccount:v6 service:v7];
  if (v8)
  {
    id v9 = [(AAUIServiceAuthHandler *)self account];
    id v10 = objc_msgSend(v9, "aa_altDSID");
    v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 isEqualToString:v8]);
    id v12 = v11;
  }
  else
  {
    id v9 = [(AIDAServiceOwnerProtocol *)self->_serviceOwnersManager DSIDForAccount:v6 service:v7];
    id v13 = [(AAUIServiceAuthHandler *)self account];
    id v10 = v13;
    if (v9)
    {
      v11 = objc_msgSend(v13, "aa_personID");
      v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isEqualToString:v9]);
      id v12 = v14;
    }
    else
    {
      v11 = [v13 username];
      v14 = [v6 username];
      id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isEqualToString:v14]);
    }
  }

  return v12 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_destroyWeak((id *)&self->_listController);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end