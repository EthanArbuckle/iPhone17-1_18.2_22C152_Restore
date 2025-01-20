@interface AKAuthModeController
- ($1A23BB056C565A410801C90FE7234890)_authModeInfoFromResponse:(id)a3;
- ($1A23BB056C565A410801C90FE7234890)_unknownAuthModeInfo;
- (BOOL)_isClientEntitledForAuthMode:(id)a3;
- (id)_authModeErrorFromError:(id)a3;
- (void)_executeFetchAuthModeInfoWithContext:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_saveAuthMode:(id)a3 withContext:(id)a4;
- (void)fetchAuthModeWithContext:(id)a3 client:(id)a4 completion:(id)a5;
@end

@implementation AKAuthModeController

- (void)fetchAuthModeWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(AKAuthModeController *)self _isClientEntitledForAuthMode:v9])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000BB654;
    v15[3] = &unk_100226C30;
    id v17 = v10;
    v15[4] = self;
    id v16 = v8;
    [(AKAuthModeController *)self _executeFetchAuthModeInfoWithContext:v16 client:v9 completion:v15];
  }
  else
  {
    id v11 = [(AKAuthModeController *)self _unknownAuthModeInfo];
    uint64_t v13 = v12;
    v14 = +[NSError ak_errorWithCode:-7026];
    (*((void (**)(id, id, uint64_t, void *))v10 + 2))(v10, v11, v13, v14);
  }
}

- (BOOL)_isClientEntitledForAuthMode:(id)a3
{
  unsigned __int8 v3 = [a3 hasInternalPrivateAccess];
  if ((v3 & 1) == 0)
  {
    v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100192A98(v4);
    }
  }
  return v3;
}

- ($1A23BB056C565A410801C90FE7234890)_unknownAuthModeInfo
{
  unint64_t v2 = 0;
  BOOL v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)_executeFetchAuthModeInfoWithContext:(id)a3 client:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [AKAuthModeRequestProvider alloc];
  uint64_t v12 = [(AKURLRequestProviderImpl *)v10 initWithContext:v9 urlBagKey:AKURLBagKeyFetchAuthenticationMode];

  [(AKURLRequestProviderImpl *)v12 setClient:v8];
  id v11 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v12];
  [(AKServiceControllerImpl *)v11 executeRequestWithCompletion:v7];
}

- (id)_authModeErrorFromError:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:AKErrorStatusCodeKey];

  if ([v5 integerValue] == (id)-28043)
  {
    uint64_t v6 = -7093;
LABEL_9:
    id v7 = +[NSError ak_errorWithCode:v6];
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100192ADC();
    }

    goto LABEL_12;
  }
  if ([v5 integerValue] == (id)-28044)
  {
    uint64_t v6 = -7094;
    goto LABEL_9;
  }
  if ([v5 integerValue] == (id)-310003)
  {
    uint64_t v6 = -7100;
    goto LABEL_9;
  }
  if ([v5 integerValue] == (id)-80039)
  {
    uint64_t v6 = -7120;
    goto LABEL_9;
  }
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100192B44();
  }

  id v7 = v3;
LABEL_12:

  return v7;
}

- ($1A23BB056C565A410801C90FE7234890)_authModeInfoFromResponse:(id)a3
{
  id v3 = +[AAFSerialization dictionaryFromObject:a3 ofType:@"application/x-plist"];
  v4 = [v3 objectForKeyedSubscript:AKAuthenticationModeKey];
  id v5 = [v4 unsignedIntegerValue];

  if (+[AKFeatureManager isEnforceMDMPolicyEnabled])
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:AKMDMInfoRequiredKey];
    uint64_t v7 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v7 = 0;
  }

  unint64_t v8 = (unint64_t)v5;
  BOOL v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (void)_saveAuthMode:(id)a3 withContext:(id)a4
{
  unint64_t var0 = a3.var0;
  id v12 = 0;
  id v5 = objc_msgSend(a4, "authKitAccount:", &v12, *(void *)&a3.var1);
  id v6 = v12;
  if (v6)
  {
    uint64_t v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100192C14();
    }
  }
  else
  {
    uint64_t v7 = _AKLogSystem();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving auth mode to AuthKit account %@.", buf, 0xCu);
      }

      uint64_t v7 = +[AKAccountManager sharedInstance];
      [v7 setAuthenticationMode:var0 forAccount:v5];
      id v11 = 0;
      [v7 saveAccount:v5 error:&v11];
      id v9 = v11;
      if (v9)
      {
        id v10 = _AKLogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100192BAC();
        }
      }
    }
    else if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No AuthKit account found, skipping auth mode save.", buf, 2u);
    }
  }
}

@end