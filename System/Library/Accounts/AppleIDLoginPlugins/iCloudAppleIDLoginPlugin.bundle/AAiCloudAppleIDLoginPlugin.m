@interface AAiCloudAppleIDLoginPlugin
- (id)_accountStore;
- (id)_descriptionFromEmailAddress:(id)a3;
- (id)parametersForIdentityEstablishmentRequest;
- (id)parametersForLoginRequest;
- (id)serviceIdentifier;
- (void)_addAccountWithServerResponse:(id)a3 password:(id)a4 emailAddress:(id)a5;
- (void)_updateAccount:(id)a3 withProvisioningResponse:(id)a4 emailAddress:(id)a5;
- (void)handleLoginResponse:(id)a3 completion:(id)a4;
@end

@implementation AAiCloudAppleIDLoginPlugin

- (id)serviceIdentifier
{
  return kAAProtocolMobileMeDataKey;
}

- (id)parametersForLoginRequest
{
  v2 = +[FMDFMIPManager sharedInstance];
  if ([v2 needsLostModeExitAuth]) {
    v3 = &off_43C8;
  }
  else {
    v3 = (_UNKNOWN **)&__NSDictionary0__struct;
  }

  return v3;
}

- (id)parametersForIdentityEstablishmentRequest
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(AAiCloudAppleIDLoginPlugin *)self _accountStore];
  v5 = objc_msgSend(v4, "aa_primaryAppleAccount");

  if (v5)
  {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"account-exists"];
    v6 = [v5 username];

    if (v6)
    {
      v7 = [v5 username];
      [v3 setObject:v7 forKeyedSubscript:@"appleId"];
    }
    v8 = objc_msgSend(v5, "aa_personID");

    if (v8)
    {
      v9 = objc_msgSend(v5, "aa_personID");
      [v3 setObject:v9 forKeyedSubscript:@"dsid"];
    }
    v10 = objc_msgSend(v5, "aa_password");

    if (v10)
    {
      v11 = objc_msgSend(v5, "aa_password");
      [v3 setObject:v11 forKeyedSubscript:@"password"];
    }
  }
  else
  {
    [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:@"account-exists"];
  }

  return v3;
}

- (void)handleLoginResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    kdebug_trace();
    v8 = [v6 objectForKeyedSubscript:@"password"];
    uint64_t v35 = [v6 objectForKeyedSubscript:@"appleIDEnteredByUser"];
    v9 = [v6 objectForKeyedSubscript:@"status"];
    unsigned int v10 = [v9 intValue];

    v34 = self;
    if (v10)
    {
      v11 = [v6 objectForKeyedSubscript:@"status-message"];
      id v12 = 0;
      id v36 = 0;
      v13 = 0;
      int v14 = 0;
      int v15 = 0;
    }
    else
    {
      id v18 = [objc_alloc((Class)AAProvisioningResponse) initWithDictionary:v6];
      if (v18)
      {
        id v36 = v18;
        v13 = [v18 personID];
        v19 = [(AAiCloudAppleIDLoginPlugin *)self _accountStore];
        v20 = objc_msgSend(v19, "aa_appleAccounts");

        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v21 = v20;
        v11 = (__CFString *)[v21 countByEnumeratingWithState:&v39 objects:v46 count:16];
        if (v11)
        {
          v33 = v8;
          uint64_t v22 = *(void *)v40;
          while (2)
          {
            for (i = 0; i != v11; i = (__CFString *)((char *)i + 1))
            {
              if (*(void *)v40 != v22) {
                objc_enumerationMutation(v21);
              }
              v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              v25 = objc_msgSend(v24, "aa_personID");
              unsigned int v26 = [v25 isEqualToString:v13];

              if (v26)
              {
                v27 = [(AAiCloudAppleIDLoginPlugin *)v34 _accountStore];
                v28 = objc_msgSend(v27, "aa_primaryAppleAccount");

                if (!v28) {
                  objc_msgSend(v24, "aa_setPrimaryAccount:", 1);
                }
                id v12 = v24;
                int v15 = 0;
                int v14 = 1;
                v11 = @"The account already exists.";
                goto LABEL_22;
              }
            }
            v11 = (__CFString *)[v21 countByEnumeratingWithState:&v39 objects:v46 count:16];
            if (v11) {
              continue;
            }
            break;
          }
          id v12 = 0;
          int v14 = 0;
          int v15 = 1;
LABEL_22:
          v8 = v33;
        }
        else
        {
          id v12 = 0;
          int v14 = 0;
          int v15 = 1;
        }
        v16 = (void *)v35;

LABEL_26:
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_2620;
        v37[3] = &unk_41A8;
        id v38 = v7;
        v29 = objc_retainBlock(v37);
        if (v15)
        {
          v30 = v36;
          [(AAiCloudAppleIDLoginPlugin *)v34 _addAccountWithServerResponse:v36 password:v8 emailAddress:v16];
        }
        else
        {
          if (!v14)
          {
            NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
            v45 = v11;
            v31 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
            v32 = +[NSError errorWithDomain:@"com.apple.appleaccount" code:0 userInfo:v31];
            ((void (*)(void *, void, void *))v29[2])(v29, 0, v32);

            v30 = v36;
            goto LABEL_32;
          }
          objc_msgSend(v12, "aa_setPassword:", v8);
          v30 = v36;
          [(AAiCloudAppleIDLoginPlugin *)v34 _updateAccount:v12 withProvisioningResponse:v36 emailAddress:v16];
        }
        ((void (*)(void *, uint64_t, void))v29[2])(v29, 1, 0);
LABEL_32:

        goto LABEL_33;
      }
      id v12 = 0;
      id v36 = 0;
      v13 = 0;
      int v14 = 0;
      int v15 = 0;
      v11 = @"Communications error with setup server.";
    }
    v16 = (void *)v35;
    goto LABEL_26;
  }
  v17 = _AALogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "ERROR: The server response parameters being passed in is empty - will not run iCloud account setup", buf, 2u);
  }

  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
LABEL_33:
}

- (void)_addAccountWithServerResponse:(id)a3 password:(id)a4 emailAddress:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 appleID];
  unsigned int v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Adding account with server response", buf, 2u);
  }

  if (v9)
  {
    v11 = [(AAiCloudAppleIDLoginPlugin *)self _descriptionFromEmailAddress:v9];
    id v12 = objc_alloc((Class)ACAccount);
    v13 = [(AAiCloudAppleIDLoginPlugin *)self _accountStore];
    int v14 = objc_msgSend(v13, "aa_appleAccountType");
    id v15 = [v12 initWithAccountType:v14];

    [v15 setUsername:v9];
    objc_msgSend(v15, "aa_setPassword:", v8);
    [v15 setAccountDescription:v11];
    v16 = [v7 iCloudAuthToken];
    objc_msgSend(v15, "aa_setAuthToken:", v16);

    v17 = [(AAiCloudAppleIDLoginPlugin *)self _accountStore];
    id v18 = objc_msgSend(v17, "aa_primaryAppleAccount");

    if (!v18) {
      objc_msgSend(v15, "aa_setPrimaryAccount:", 1);
    }
    objc_msgSend(v15, "aa_updateWithProvisioningResponse:", v7);
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    v20 = _AALogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v15;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Saving account: %@", buf, 0xCu);
    }

    id v21 = [(AAiCloudAppleIDLoginPlugin *)self _accountStore];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_2950;
    v23[3] = &unk_41D0;
    dispatch_semaphore_t v24 = v19;
    uint64_t v22 = v19;
    [v21 saveAccount:v15 withCompletionHandler:v23];

    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_updateAccount:(id)a3 withProvisioningResponse:(id)a4 emailAddress:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Updating account with server response", buf, 2u);
  }

  unsigned int v10 = [v8 provisionedDataclasses];
  v11 = [v7 provisionedDataclasses];
  id v12 = +[NSMutableSet setWithArray:v10];
  [v12 minusSet:v11];
  v13 = [v8 fmipLostModeToken];
  if (v13)
  {
    int v14 = +[FMDFMIPManager sharedInstance];
    unsigned int v15 = [v14 needsLostModeExitAuth];

    if (v15)
    {
      v16 = _AALogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Sending lost mode token to FMIP", buf, 2u);
      }

      v17 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_2D20;
      block[3] = &unk_41F8;
      id v25 = v13;
      dispatch_async(v17, block);
    }
  }
  objc_msgSend(v7, "aa_updateWithProvisioningResponse:", v8);
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v19 = _AALogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v7;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Updating existing account: %@", buf, 0xCu);
  }

  v20 = [(AAiCloudAppleIDLoginPlugin *)self _accountStore];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_2D78;
  v22[3] = &unk_41D0;
  dispatch_semaphore_t v23 = v18;
  id v21 = v18;
  [v20 saveAccount:v7 withCompletionHandler:v22];

  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)_descriptionFromEmailAddress:(id)a3
{
  id v4 = a3;
  v5 = [(AAiCloudAppleIDLoginPlugin *)self _accountStore];
  id v6 = @"iCloud";
  unsigned int v7 = [v5 hasAccountWithDescription:@"iCloud"];

  if (v7) {
    id v6 = (__CFString *)v4;
  }

  return v6;
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    id v4 = +[ACAccountStore defaultStore];
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (void).cxx_destruct
{
}

@end