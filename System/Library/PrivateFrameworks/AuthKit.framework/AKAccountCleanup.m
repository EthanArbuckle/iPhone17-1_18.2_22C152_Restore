@interface AKAccountCleanup
- (AKAccountCleanup)init;
- (id)_eligibleCleanupAccounts;
- (id)_inMemoryTokensForAccounts:(id)a3;
- (void)_cleanupAccountsToRemove:(id)a3 accountsToSave:(id)a4 completion:(id)a5;
- (void)_removeAccounts:(id)a3;
- (void)_saveAccounts:(id)a3 inMemoryTokens:(id)a4 completion:(id)a5;
- (void)cleanupStaleAccountsWithCompletion:(id)a3;
@end

@implementation AKAccountCleanup

- (AKAccountCleanup)init
{
  v11.receiver = self;
  v11.super_class = (Class)AKAccountCleanup;
  v2 = [(AKAccountCleanup *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[AKAccountManager sharedInstance];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("AKAccountManager.groupedAccountCleanup", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    dispatch_group_t v8 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v8;
  }
  return v2;
}

- (void)cleanupStaleAccountsWithCompletion:(id)a3
{
  id v35 = a3;
  v4 = [(AKAccountCleanup *)self _eligibleCleanupAccounts];
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v51 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking if IDMS account cleanup is necessary (%lu accounts found)...", buf, 0xCu);
  }

  v38 = objc_opt_new();
  dispatch_queue_t v6 = +[NSMutableDictionary dictionary];
  v36 = +[NSMutableDictionary dictionary];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v13 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:v12];
        v14 = [(AKAccountManager *)self->_accountManager servicesUsingAccount:v12];
        if ([v14 count])
        {
          [v6 setObject:v12 forKeyedSubscript:v13];
        }
        else
        {
          v15 = _AKLogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v51 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removing unusued IDMS account %@...", buf, 0xCu);
          }

          [v38 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v9);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v7;
  id v16 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v41;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
        v21 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:v20];
        v22 = [v6 objectForKeyedSubscript:v21];
        v23 = [v22 identifier];
        v24 = [v20 identifier];

        if (v23 == v24)
        {
          v27 = +[AKFeatureManager sharedManager];
          unsigned int v28 = [v27 isTokenCacheEnabled];

          if (v28)
          {
            v29 = +[AKTokenManager sharedInstance];
            id v39 = 0;
            unsigned __int8 v30 = [v29 synchronizeTokensForAltDSID:v21 account:v22 error:&v39];
            id v31 = v39;

            if ((v30 & 1) == 0)
            {
              v32 = _AKLogSystem();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                id v51 = v31;
                _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "AKTokenManager sync hit an error: %@.", buf, 0xCu);
              }
            }
          }
        }
        else if (v22)
        {
          v25 = _AKLogSystem();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v51 = v22;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Preserving IDMS account %@...", buf, 0xCu);
          }

          [v36 setObject:v22 forKeyedSubscript:v21];
          v26 = _AKLogSystem();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v51 = v20;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Removing duplicate IDMS account %@...", buf, 0xCu);
          }

          [v38 addObject:v20];
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v17);
  }

  v33 = [v38 allObjects];
  v34 = [v36 allValues];
  [(AKAccountCleanup *)self _cleanupAccountsToRemove:v33 accountsToSave:v34 completion:v35];
}

- (id)_eligibleCleanupAccounts
{
  uint64_t v3 = [(AKAccountManager *)self->_accountManager allAuthKitAccountsWithError:0];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002BFBC;
  v6[3] = &unk_1002275F0;
  v6[4] = self;
  v4 = objc_msgSend(v3, "aaf_filter:", v6);

  return v4;
}

- (void)_cleanupAccountsToRemove:(id)a3 accountsToSave:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  objc_super v11 = [(AKAccountCleanup *)self _inMemoryTokensForAccounts:v8];
  [(AKAccountCleanup *)self _removeAccounts:v10];

  queue = self->_queue;
  group = self->_group;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002C168;
  v17[3] = &unk_100227618;
  v17[4] = self;
  id v18 = v8;
  id v19 = v11;
  id v20 = v9;
  id v14 = v9;
  id v15 = v11;
  id v16 = v8;
  dispatch_group_notify(group, queue, v17);
}

- (id)_inMemoryTokensForAccounts:(id)a3
{
  id v4 = a3;
  id v20 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v23;
    *(void *)&long long v7 = 138412546;
    long long v19 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v12 = -[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v11, v19);
        accountManager = self->_accountManager;
        id v21 = 0;
        id v14 = [(AKAccountManager *)accountManager allTokensForAccount:v11 error:&v21];
        id v15 = v21;
        if (v15)
        {
          id v16 = _AKLogSystem();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            uint64_t v27 = v11;
            __int16 v28 = 2112;
            id v29 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Something went wrong when fetching tokens for account %@. Error: %@", buf, 0x16u);
          }
        }
        else
        {
          [v20 setObject:v14 forKeyedSubscript:v12];
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v8);
  }

  id v17 = [v20 copy];

  return v17;
}

- (void)_removeAccounts:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        dispatch_group_enter((dispatch_group_t)self->_group);
        id v10 = [(AKAccountManager *)self->_accountManager store];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10002C4F0;
        v11[3] = &unk_100227640;
        v11[4] = v9;
        v11[5] = self;
        [v10 removeAccount:v9 withCompletionHandler:v11];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)_saveAccounts:(id)a3 inMemoryTokens:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v16 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v14 = (void (**)(void))a5;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10002C890;
        v18[3] = &unk_100226BD8;
        v18[4] = self;
        v18[5] = v12;
        id v19 = v16;
        +[AKAccountManager performWithinPersonaForAccount:v12 withBlock:v18];
      }
      id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  long long v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Done removing unused and duplicate IDMS accounts.", buf, 2u);
  }

  if (v14) {
    v14[2](v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end