@interface AKUserConfigController
+ (id)sharedController;
- (AKUserConfigController)init;
- (id)_decodeConfigurationInfo:(id)a3;
- (id)_requestProvider:(id)a3 client:(id)a4 dataCenter:(id)a5 urlBagKey:(id)a6;
- (id)_userConfigChangeNotificationDictionaryForAccount:(id)a3 configurationInfo:(id)a4;
- (void)fetchUserConfigForAltDSID:(id)a3 client:(id)a4 dataCenter:(id)a5 forIdentifiers:(id)a6 completion:(id)a7;
- (void)processPushMessage:(id)a3;
- (void)setUserConfigForAltDSID:(id)a3 client:(id)a4 configurationInfo:(id)a5 forIdentifier:(id)a6 completion:(id)a7;
- (void)updateUserConfigForAccount:(id)a3 configurationInfo:(id)a4;
- (void)updateUserConfigForAltDSID:(id)a3 configurationInfo:(id)a4;
@end

@implementation AKUserConfigController

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080034;
  block[3] = &unk_1002295D0;
  block[4] = a1;
  if (qword_1002724B0 != -1) {
    dispatch_once(&qword_1002724B0, block);
  }
  v2 = (void *)qword_1002724A8;

  return v2;
}

- (AKUserConfigController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKUserConfigController;
  v2 = [(AKUserConfigController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AKAccountManager sharedInstance];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;
  }
  return v2;
}

- (void)fetchUserConfigForAltDSID:(id)a3 client:(id)a4 dataCenter:(id)a5 forIdentifiers:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void, void *))a7;
  if (![v15 count]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v15 firstObject],
        v17 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v17,
        (isKindOfClass & 1) == 0))
  {
    v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100189388((uint64_t)v15, v22);
    }

    uint64_t v23 = -7053;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = _AKLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100189410();
    }

    uint64_t v23 = -7025;
LABEL_9:
    v19 = +[NSError ak_errorWithCode:v23];
    v16[2](v16, 0, v19);
    goto LABEL_10;
  }
  v19 = [(AKUserConfigController *)self _requestProvider:v12 client:v13 dataCenter:v14 urlBagKey:AKURLBagKeyFetchConfigData];
  CFStringRef v28 = @"cdks";
  id v29 = v15;
  v20 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  [v19 setAuthKitBody:v20];

  v21 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v19];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100080398;
  v25[3] = &unk_100226C30;
  v27 = v16;
  v25[4] = self;
  id v26 = v12;
  [(AKServiceControllerImpl *)v21 executeRequestWithCompletion:v25];

LABEL_10:
}

- (void)setUserConfigForAltDSID:(id)a3 client:(id)a4 configurationInfo:(id)a5 forIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void, id))a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1001895FC();
    }

    uint64_t v22 = -7053;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100189410();
    }

    uint64_t v22 = -7025;
LABEL_13:
    id v18 = +[NSError ak_errorWithCode:v22];
    v16[2](v16, 0, v18);
    goto LABEL_21;
  }
  id v31 = 0;
  v17 = +[NSPropertyListSerialization dataWithPropertyList:v14 format:200 options:0 error:&v31];
  id v18 = v31;
  if (v18)
  {
    v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100189594();
    }

    v20 = +[NSError ak_errorWithCode:-7054 underlyingError:v18];
    v16[2](v16, 0, v20);
  }
  else
  {
    v20 = [v17 base64EncodedStringWithOptions:0];
    if (v20)
    {
      v24 = [(AKUserConfigController *)self _requestProvider:v12 client:v13 dataCenter:0 urlBagKey:AKURLBagKeyConfigurationInfo];
      id v32 = v15;
      v33 = v20;
      v25 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      [v24 setAuthKitBody:v25];

      id v26 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v24];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10008098C;
      v28[3] = &unk_100228748;
      v30 = v16;
      id v29 = v12;
      [(AKServiceControllerImpl *)v26 executeRequestWithCompletion:v28];
    }
    else
    {
      v27 = _AKLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100189560();
      }

      v24 = +[NSError ak_errorWithCode:-7054];
      v16[2](v16, 0, v24);
    }
  }
LABEL_21:
}

- (void)updateUserConfigForAltDSID:(id)a3 configurationInfo:(id)a4
{
  accountManager = self->_accountManager;
  id v7 = a4;
  id v8 = [(AKAccountManager *)accountManager authKitAccountWithAltDSID:a3 error:0];
  [(AKUserConfigController *)self updateUserConfigForAccount:v8 configurationInfo:v7];
}

- (void)updateUserConfigForAccount:(id)a3 configurationInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1001896CC();
    }
    id v8 = 0;
    goto LABEL_19;
  }
  id v8 = [(AKUserConfigController *)self _userConfigChangeNotificationDictionaryForAccount:v6 configurationInfo:v7];
  if ([v8 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v8;
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v14 = [v8 objectForKeyedSubscript:v13];
          [(AKAccountManager *)self->_accountManager setConfigValue:v14 forKey:v13 forAccount:v6];
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v10);

      accountManager = self->_accountManager;
      id v20 = 0;
      unsigned int v16 = [(AKAccountManager *)accountManager saveAccount:v6 error:&v20];
      v17 = v20;
      id v18 = _AKLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v26[0]) = v16;
        WORD2(v26[0]) = 2112;
        *(void *)((char *)v26 + 6) = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Did Configuration info save to account: %{BOOL}d with error: %@", buf, 0x12u);
      }
    }
    else
    {
      v17 = 0;
      id v18 = v8;
    }

    v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26[0] = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updated User Configs %@", buf, 0xCu);
    }

LABEL_19:
  }
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)1400)
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling push in config controller with command AKPushMessageCommandAccountInfoChanged...", buf, 2u);
    }

    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"userinfodata"];

    if (v7)
    {
      uint64_t v8 = [v7 objectForKeyedSubscript:AKConfigDataVersion];
      if (v8)
      {
        id v9 = (void *)v8;
        accountManager = self->_accountManager;
        uint64_t v11 = [v4 altDSID];
        id v12 = [(AKAccountManager *)accountManager authKitAccountWithAltDSID:v11 error:0];

        uint64_t v13 = [(AKAccountManager *)self->_accountManager configDataVersionForAccount:v12];
        if (!v13 || ([v9 isEqual:v13] & 1) == 0)
        {
          id v14 = [v4 eventDetails];
          id v15 = [v14 objectForKeyedSubscript:@"dataCenter"];

          unsigned int v16 = (void *)os_transaction_create();
          v17 = [v4 altDSID];
          uint64_t v23 = AKAllConfigsKey;
          id v18 = +[NSArray arrayWithObjects:&v23 count:1];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = nullsub_5;
          v20[3] = &unk_1002299D8;
          id v21 = v16;
          id v19 = v16;
          [(AKUserConfigController *)self fetchUserConfigForAltDSID:v17 client:0 dataCenter:v15 forIdentifiers:v18 completion:v20];
        }
      }
    }
  }
}

- (id)_requestProvider:(id)a3 client:(id)a4 dataCenter:(id)a5 urlBagKey:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  [v13 setAltDSID:v12];

  id v14 = [(AKURLRequestProviderImpl *)[AKGrandSlamRequestProvider alloc] initWithContext:v13 urlBagKey:v9];
  [(AKURLRequestProviderImpl *)v14 setClient:v11];

  [(AKGrandSlamRequestProvider *)v14 setAuthenticatedRequest:1];
  [(AKURLRequestProviderImpl *)v14 setDataCenterIdentifier:v10];

  return v14;
}

- (id)_decodeConfigurationInfo:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"cd"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[AKAuthenticationServerResponse decodedConfigurationInfo:v3];
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 allKeys];
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetch configuration info completed with keys: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100189700();
    }
    id v4 = 0;
  }

  return v4;
}

- (id)_userConfigChangeNotificationDictionaryForAccount:(id)a3 configurationInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[NSMutableDictionary dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v15 = objc_msgSend(v9, "objectForKeyedSubscript:", v14, (void)v20);
        uint64_t v16 = [(AKAccountManager *)self->_accountManager configValue:v14 forAccount:v6];
        v17 = (void *)v16;
        if (v15 && (!v16 || ([v15 isEqual:v16] & 1) == 0)) {
          [v8 setObject:v15 forKeyedSubscript:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  id v18 = [v8 copy];

  return v18;
}

- (void).cxx_destruct
{
}

@end