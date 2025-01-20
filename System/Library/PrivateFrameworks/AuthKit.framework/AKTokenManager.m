@interface AKTokenManager
+ (AKTokenManager)sharedInstance;
- (AAFKeychainManager)keychainManager;
- (AKTokenCache)tokenCache;
- (AKTokenKeychain)tokenKeychain;
- (AKTokenManager)init;
- (BOOL)_deleteTokenWithIdentifer:(id)a3 altDSID:(id)a4 account:(id)a5 credential:(id)a6 error:(id *)a7;
- (BOOL)deleteTokenFromCacheWithIdentifer:(id)a3 altDSID:(id)a4 error:(id *)a5;
- (BOOL)synchronizeTokensForAllAccounts:(id *)a3;
- (BOOL)synchronizeTokensForAltDSID:(id)a3 account:(id)a4 error:(id *)a5;
- (BOOL)updateToken:(id)a3 identifier:(id)a4 altDSID:(id)a5 account:(id)a6 credential:(id)a7 error:(id *)a8;
- (OS_dispatch_queue)tokenManagerQueue;
- (id)synchronizedCredentialForAccount:(id)a3;
- (id)tokenWithIdentifier:(id)a3 altDSID:(id)a4 forAccount:(id)a5 error:(id *)a6;
- (id)tokenWithIdentifier:(id)a3 altDSID:(id)a4 forAccount:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7;
- (void)setKeychainManager:(id)a3;
- (void)setTokenCache:(id)a3;
- (void)setTokenKeychain:(id)a3;
- (void)setTokenManagerQueue:(id)a3;
@end

@implementation AKTokenManager

+ (AKTokenManager)sharedInstance
{
  if (qword_100272558 != -1) {
    dispatch_once(&qword_100272558, &stru_10022A620);
  }
  v2 = (void *)qword_100272550;

  return (AKTokenManager *)v2;
}

- (AKTokenManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)AKTokenManager;
  v2 = [(AKTokenManager *)&v13 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.authkit.AKTokenManagerQueue", v3);
    tokenManagerQueue = v2->_tokenManagerQueue;
    v2->_tokenManagerQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = (AAFKeychainManager *)v6;

    uint64_t v8 = objc_opt_new();
    tokenCache = v2->_tokenCache;
    v2->_tokenCache = (AKTokenCache *)v8;

    uint64_t v10 = objc_opt_new();
    tokenKeychain = v2->_tokenKeychain;
    v2->_tokenKeychain = (AKTokenKeychain *)v10;
  }
  return v2;
}

- (BOOL)updateToken:(id)a3 identifier:(id)a4 altDSID:(id)a5 account:(id)a6 credential:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = _AKLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10018D194();
  }

  if (v15 && v16)
  {
    if (v14)
    {
      tokenManagerQueue = self->_tokenManagerQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10009C6F0;
      block[3] = &unk_10022A648;
      id v26 = v15;
      id v27 = v16;
      id v28 = v14;
      v29 = self;
      v32 = a8;
      id v30 = v17;
      id v31 = v18;
      dispatch_sync(tokenManagerQueue, block);
      unsigned __int8 v21 = a8 == 0;
    }
    else
    {
      v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        sub_10018D160();
      }

      unsigned __int8 v21 = [(AKTokenManager *)self _deleteTokenWithIdentifer:v15 altDSID:v16 account:v17 credential:v18 error:a8];
    }
  }
  else
  {
    v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10018D12C();
    }

    unsigned __int8 v21 = 0;
  }

  return v21;
}

- (BOOL)deleteTokenFromCacheWithIdentifer:(id)a3 altDSID:(id)a4 error:(id *)a5
{
  return [(AKTokenManager *)self _deleteTokenWithIdentifer:a3 altDSID:a4 account:0 credential:0 error:a5];
}

- (id)tokenWithIdentifier:(id)a3 altDSID:(id)a4 forAccount:(id)a5 error:(id *)a6
{
  return [(AKTokenManager *)self tokenWithIdentifier:a3 altDSID:a4 forAccount:a5 shouldSync:0 error:a6];
}

- (id)tokenWithIdentifier:(id)a3 altDSID:(id)a4 forAccount:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = _AKLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10018D2C4();
  }

  if (!v12)
  {
    v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10018D1C8();
    }

    if (a7)
    {
      uint64_t v21 = -7009;
LABEL_16:
      +[NSError ak_errorWithCode:v21];
      id v19 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_17:
    id v19 = 0;
    goto LABEL_18;
  }
  id v16 = _AKLogSystem();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (!v13)
  {
    if (v17) {
      sub_10018D208();
    }

    if (a7)
    {
      uint64_t v21 = -7025;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v17) {
    sub_10018D23C((uint64_t)v12, (uint64_t)v13, v16);
  }

  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = sub_10000F970;
  v53[4] = sub_10000F808;
  id v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = sub_10000F970;
  v51[4] = sub_10000F808;
  id v52 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = sub_10000F970;
  v49[4] = sub_10000F808;
  id v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_10000F970;
  v47 = sub_10000F808;
  id v48 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  tokenManagerQueue = self->_tokenManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009CB6C;
  block[3] = &unk_10022A670;
  id v24 = v12;
  id v25 = v13;
  id v26 = self;
  id v28 = v53;
  v29 = &v43;
  id v30 = v41;
  id v31 = v51;
  v35 = a7;
  v32 = v39;
  id v27 = v14;
  v33 = v49;
  v34 = v37;
  BOOL v36 = a6;
  dispatch_sync(tokenManagerQueue, block);
  id v19 = (id)v44[5];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(v53, 8);
LABEL_18:

  return v19;
}

- (BOOL)synchronizeTokensForAltDSID:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = 1;
  id v11 = [(AKTokenManager *)self tokenWithIdentifier:ACContinuationTokenKey altDSID:v8 forAccount:v9 shouldSync:1 error:a5];
  id v12 = [(AKTokenManager *)self tokenWithIdentifier:ACPasswordResetTokenKey altDSID:v8 forAccount:v9 shouldSync:1 error:a5];
  id v13 = [(AKTokenManager *)self tokenWithIdentifier:ACHeartbeatTokenKey altDSID:v8 forAccount:v9 shouldSync:1 error:a5];
  if (a5) {
    BOOL v10 = *a5 == 0;
  }

  return v10;
}

- (BOOL)synchronizeTokensForAllAccounts:(id *)a3
{
  v5 = +[AKAccountManager sharedInstance];
  uint64_t v6 = [v5 allAuthKitAccountsWithError:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138412290;
    long long v18 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v13 = objc_msgSend(v5, "altDSIDForAccount:", v12, v18);
        if ([v13 length]
          && ![(AKTokenManager *)self synchronizeTokensForAltDSID:v13 account:v12 error:a3])
        {
          id v14 = _AKLogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            id v15 = *a3;
            *(_DWORD *)buf = v18;
            id v24 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "AKTokenManager sync hit an error: %@.", buf, 0xCu);
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }
  if (a3) {
    BOOL v16 = *a3 == 0;
  }
  else {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)_deleteTokenWithIdentifer:(id)a3 altDSID:(id)a4 account:(id)a5 credential:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  BOOL v16 = _AKLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10018D644();
  }

  if (v13)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_10000F970;
    v29[4] = sub_10000F808;
    id v30 = v14;
    tokenManagerQueue = self->_tokenManagerQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10009D610;
    v22[3] = &unk_10022A698;
    id v23 = v12;
    id v24 = v13;
    id v25 = self;
    id v27 = v29;
    id v28 = a7;
    id v26 = v15;
    dispatch_sync(tokenManagerQueue, v22);
    BOOL v18 = a7 == 0;
    if (a7)
    {
      long long v19 = _AKLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10018D5C8((uint64_t *)a7, v19);
      }
    }
    _Block_object_dispose(v29, 8);
  }
  else
  {
    long long v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_10018D594();
    }

    BOOL v18 = 0;
  }

  return v18;
}

- (id)synchronizedCredentialForAccount:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10018D6AC();
  }

  id v20 = 0;
  uint64_t v6 = [v4 credentialWithError:&v20];
  id v7 = v20;
  long long v8 = +[AKFeatureManager sharedManager];
  unsigned int v9 = [v8 isTokenCacheEnabled];

  if (v9 && v6)
  {
    uint64_t v10 = [v4 accountPropertyForKey:AKAltDSID];
    uint64_t v11 = ACContinuationTokenKey;
    uint64_t v19 = 0;
    id v12 = [(AKTokenManager *)self tokenWithIdentifier:ACContinuationTokenKey altDSID:v10 forAccount:v4 error:&v19];
    uint64_t v13 = ACPasswordResetTokenKey;
    uint64_t v18 = 0;
    id v14 = [(AKTokenManager *)self tokenWithIdentifier:ACPasswordResetTokenKey altDSID:v10 forAccount:v4 error:&v18];
    if (v12)
    {
      id v15 = [v12 stringValue];
      [v6 setCredentialItem:v15 forKey:v11];
    }
    if (v14)
    {
      BOOL v16 = [v14 stringValue];
      [v6 setCredentialItem:v16 forKey:v13];
    }
  }

  return v6;
}

- (AAFKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
}

- (OS_dispatch_queue)tokenManagerQueue
{
  return self->_tokenManagerQueue;
}

- (void)setTokenManagerQueue:(id)a3
{
}

- (AKTokenCache)tokenCache
{
  return self->_tokenCache;
}

- (void)setTokenCache:(id)a3
{
}

- (AKTokenKeychain)tokenKeychain
{
  return self->_tokenKeychain;
}

- (void)setTokenKeychain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenKeychain, 0);
  objc_storeStrong((id *)&self->_tokenCache, 0);
  objc_storeStrong((id *)&self->_tokenManagerQueue, 0);

  objc_storeStrong((id *)&self->_keychainManager, 0);
}

@end