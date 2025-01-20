@interface BLRestoreAccountsHelper
- (BLRestoreAccountsHelper)initWithAuthenticationQueue:(id)a3;
- (NSMutableDictionary)accountIDsByAppleID;
- (OS_dispatch_queue)authenticationQueue;
- (id)_enqueueAuthenticateTask:(id)a3 error:(id *)a4;
- (id)_newDefaultAuthenticateOptions;
- (id)accountIDForAccountName:(id)a3 error:(id *)a4;
- (id)preflightAccount:(id)a3 error:(id *)a4;
- (void)_dq_establishPrimaryAccount;
- (void)establishPrimaryAccount;
- (void)setAccountIDsByAppleID:(id)a3;
@end

@implementation BLRestoreAccountsHelper

- (BLRestoreAccountsHelper)initWithAuthenticationQueue:(id)a3
{
  dispatch_queue_t v4 = (dispatch_queue_t)a3;
  v8.receiver = self;
  v8.super_class = (Class)BLRestoreAccountsHelper;
  v5 = [(BLRestoreAccountsHelper *)&v8 init];
  if (v5)
  {
    if (!v4)
    {
      v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v4 = dispatch_queue_create("com.apple.ibooks.BLService.BLRestoreAccountsHelper", v6);
    }
    objc_storeStrong((id *)&v5->_authenticationQueue, v4);
  }

  return v5;
}

- (id)accountIDForAccountName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  accountIDsByAppleID = self->_accountIDsByAppleID;
  if (!accountIDsByAppleID)
  {
    objc_super v8 = +[ACAccountStore bu_sharedAccountStore];
    v9 = [v8 accounts];

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v11 = self->_accountIDsByAppleID;
    self->_accountIDsByAppleID = v10;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v40;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "ams_DSID");
          uint64_t v19 = [v17 username];
          v20 = (void *)v19;
          if (v18) {
            BOOL v21 = v19 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21) {
            [(NSMutableDictionary *)self->_accountIDsByAppleID setObject:v18 forKeyedSubscript:v19];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
      }
      while (v14);
    }

    accountIDsByAppleID = self->_accountIDsByAppleID;
  }
  v22 = [(NSMutableDictionary *)accountIDsByAppleID objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v22;
    id v23 = 0;
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (!v22)
  {
    id v23 = 0;
    goto LABEL_17;
  }
  v27 = +[BUAccountsProvider sharedProvider];
  id v23 = [v27 activeStoreAccount];

  if (!v23) {
    goto LABEL_17;
  }
  v28 = BLServiceLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v6;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "ContentRestore: Attempting to resolve unknown Apple Account: %@", buf, 0xCu);
  }

  id v29 = [(BLRestoreAccountsHelper *)self _newDefaultAuthenticateOptions];
  id v30 = [objc_alloc((Class)AMSAuthenticateTask) initWithAccount:0 options:v29];
  [v30 setUsername:v6];
  id v38 = 0;
  v31 = [(BLRestoreAccountsHelper *)self _enqueueAuthenticateTask:v30 error:&v38];
  id v23 = v38;
  v32 = [v31 account];

  if (!v32) {
    goto LABEL_34;
  }
  id v37 = v29;
  v33 = [v31 account];
  v34 = [v33 username];
  if (![v34 length])
  {

    id v29 = v37;
LABEL_34:
    v36 = BLServiceLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v6;
      __int16 v45 = 2112;
      id v46 = v23;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "ContentRestore: Could not resolve AppleID: %@ error:  %@", buf, 0x16u);
    }

    if (!v23)
    {
      sub_10004B6AC(0, 0, 0);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    [(NSMutableDictionary *)self->_accountIDsByAppleID setObject:v23 forKeyedSubscript:v6];
    goto LABEL_39;
  }
  v35 = BLServiceLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v44 = v6;
    __int16 v45 = 2112;
    id v46 = v34;
    __int16 v47 = 2112;
    uint64_t v48 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "ContentRestore: Resolved AppleID: %@ to AppleID: %@ and DSID: %@", buf, 0x20u);
  }

  [(NSMutableDictionary *)self->_accountIDsByAppleID setObject:0 forKeyedSubscript:v6];
  [(NSMutableDictionary *)self->_accountIDsByAppleID setObject:0 forKeyedSubscript:v34];

  id v29 = v37;
LABEL_39:

LABEL_17:
  id v24 = 0;
  if (a4) {
LABEL_18:
  }
    *a4 = v23;
LABEL_19:
  id v25 = v24;

  return v25;
}

- (void)establishPrimaryAccount
{
  v3 = +[BUAccountsProvider sharedProvider];
  dispatch_queue_t v4 = [v3 activeStoreAccount];

  if (!v4)
  {
    v5 = [(BLRestoreAccountsHelper *)self authenticationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000626AC;
    block[3] = &unk_1001A0FE8;
    block[4] = self;
    dispatch_sync(v5, block);
  }
}

- (void)_dq_establishPrimaryAccount
{
  v3 = [(BLRestoreAccountsHelper *)self authenticationQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = +[BUAccountsProvider sharedProvider];
  v5 = [v4 activeStoreAccount];

  if (!v5)
  {
    id v6 = BLServiceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ContentRestore: Attempt to establish primary account", buf, 2u);
    }

    id v7 = [(BLRestoreAccountsHelper *)self _newDefaultAuthenticateOptions];
    [v7 setCanMakeAccountActive:1];
    id v8 = [objc_alloc((Class)AMSAuthenticateTask) initWithAccount:0 options:v7];
    v9 = [v8 performAuthentication];
    id v16 = 0;
    v10 = [v9 resultWithError:&v16];
    id v11 = v16;

    id v12 = BLServiceLog();
    id v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "ContentRestore: Encountered error trying to establish primary account:  %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v10 account];
      uint64_t v15 = [v10 serverResponse];
      *(_DWORD *)buf = 138412546;
      id v18 = v14;
      __int16 v19 = 2112;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ContentRestore: Got account: %@, serverResponse: %@", buf, 0x16u);
    }
  }
}

- (id)preflightAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 ams_DSID];
  id v8 = [v6 username];
  if ([v8 length])
  {
    id v24 = a4;
    if (v7)
    {
      v9 = +[ACAccount bu_storeAccountWithDSID:v7];
    }
    else
    {
      v9 = 0;
    }
    if (v9) {
      id v12 = v9;
    }
    else {
      id v12 = v6;
    }
    id v13 = v12;
    id v14 = BLServiceLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v27 = v7;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 1024;
      BOOL v31 = v9 == 0;
      __int16 v32 = 1024;
      unsigned int v33 = [v13 isActive];
      __int16 v34 = 1024;
      unsigned int v35 = [v13 isAuthenticated];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ContentRestore: Preflight account: %@ | %@, accountIsNew: %d, active: %d, isAuthenticated: %d", buf, 0x28u);
    }
    id v23 = v8;

    id v15 = [(BLRestoreAccountsHelper *)self _newDefaultAuthenticateOptions];
    [v15 setAuthenticationType:0];
    id v16 = [objc_alloc((Class)AMSAuthenticateTask) initWithAccount:v13 options:v15];
    id v25 = 0;
    v17 = [(BLRestoreAccountsHelper *)self _enqueueAuthenticateTask:v16 error:&v25];
    id v10 = v25;
    id v11 = [v17 account];
    id v18 = BLServiceLog();
    __int16 v19 = v18;
    if (v10)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v7;
        __int16 v28 = 2112;
        id v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "ContentRestore: Encountered error trying to preflight account: %@, error: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v17 account];
      BOOL v21 = [v17 serverResponse];
      *(_DWORD *)buf = 138412546;
      v27 = v22;
      __int16 v28 = 2112;
      id v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "ContentRestore: Got account: %@, serverResponse: %@", buf, 0x16u);
    }
    id v8 = v23;
    a4 = v24;
  }
  else
  {
    sub_10004B6AC(114, 0, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = BLServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v7;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "ContentRestore: Cannot restore without an AppleID for account: %@, error: %@", buf, 0x16u);
    }
    id v11 = 0;
  }

  if (a4) {
    *a4 = v10;
  }

  return v11;
}

- (id)_newDefaultAuthenticateOptions
{
  v2 = objc_opt_new();
  [v2 setAuthenticationType:1];
  int v3 = _os_feature_enabled_impl();
  dispatch_queue_t v4 = BLBundle();
  v5 = v4;
  if (v3) {
    CFStringRef v6 = @"To restore your apps, books, and other media from backup, enter your Apple Account password in Settings. Your content cannot be restored without this verification. ";
  }
  else {
    CFStringRef v6 = @"To restore your apps, books, and other media from backup, enter your Apple ID password in Settings. Your content cannot be restored without this verification. ";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_1001ABB60 table:@"Localizable"];
  [v2 setReason:v7];

  id v8 = BLBundle();
  v9 = [v8 localizedStringForKey:@"Restore from Backup" value:&stru_1001ABB60 table:@"Localizable"];
  [v2 setPromptTitle:v9];

  id v10 = BLBundle();
  id v11 = [v10 localizedStringForKey:@"Don\\U2019t Restore" value:&stru_1001ABB60 table:@"Localizable"];
  [v2 setCancelButtonString:v11];

  [v2 setDebugReason:@"Books content restore"];
  return v2;
}

- (id)_enqueueAuthenticateTask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100062EF0;
  __int16 v19 = sub_100062F00;
  id v20 = 0;
  id v7 = [(BLRestoreAccountsHelper *)self authenticationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062F08;
  block[3] = &unk_1001A2E38;
  id v12 = v6;
  id v13 = &v15;
  id v14 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (NSMutableDictionary)accountIDsByAppleID
{
  return self->_accountIDsByAppleID;
}

- (void)setAccountIDsByAppleID:(id)a3
{
}

- (OS_dispatch_queue)authenticationQueue
{
  return self->_authenticationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationQueue, 0);

  objc_storeStrong((id *)&self->_accountIDsByAppleID, 0);
}

@end