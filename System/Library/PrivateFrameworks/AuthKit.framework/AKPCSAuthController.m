@interface AKPCSAuthController
- (AKPCSAuthController)initWithPCSKeyProvider:(id)a3;
- (void)PCSAuthContextForWebSessionIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5;
- (void)_updateContext:(id)a3 serviceName:(id)a4;
- (void)removeAllPCSAuthCredential;
@end

@implementation AKPCSAuthController

- (AKPCSAuthController)initWithPCSKeyProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKPCSAuthController;
  v6 = [(AKPCSAuthController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyProvider, a3);
  }

  return v7;
}

- (void)PCSAuthContextForWebSessionIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  keyProvider = self->_keyProvider;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003D6E4;
  v13[3] = &unk_1002280C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(AKWebSessionPCSKeyProvider *)keyProvider fetchContextForWebSessionIdentifier:a3 completion:v13];
}

- (void)removeAllPCSAuthCredential
{
}

- (void)_updateContext:(id)a3 serviceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating context for new service request: %@", (uint8_t *)&buf, 0xCu);
  }

  id v9 = objc_alloc_init((Class)NSMutableArray);
  v10 = [v6 userInfo];
  uint64_t v11 = AKWalrusWebAccessRequestedServices;
  id v12 = [v10 objectForKeyedSubscript:AKWalrusWebAccessRequestedServices];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 addObjectsFromArray:v12];
  }
  [v9 addObject:v7];
  uint64_t v24 = v11;
  id v25 = v9;
  v13 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [v6 setUserInfo:v13];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10000F8A0;
  v22 = sub_10000F7A0;
  v23 = self;
  keyProvider = v23->_keyProvider;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003D9D8;
  v16[3] = &unk_1002280E8;
  id v15 = v6;
  id v17 = v15;
  p_long long buf = &buf;
  [(AKWebSessionPCSKeyProvider *)keyProvider updateContext:v15 completion:v16];

  _Block_object_dispose(&buf, 8);
}

- (void).cxx_destruct
{
}

@end