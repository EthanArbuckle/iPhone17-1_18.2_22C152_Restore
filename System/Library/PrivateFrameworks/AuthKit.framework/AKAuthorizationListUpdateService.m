@interface AKAuthorizationListUpdateService
+ (id)sharedService;
- (AKAuthorizationListUpdateService)init;
- (void)_clearStaleCachedDevices;
- (void)performAuthorizationCheckInWithCompletion:(id)a3;
- (void)performGlobalConfigUpdateWithCompletion:(id)a3;
- (void)start;
@end

@implementation AKAuthorizationListUpdateService

+ (id)sharedService
{
  if (qword_1002725C8 != -1) {
    dispatch_once(&qword_1002725C8, &stru_10022AF78);
  }
  v2 = (void *)qword_1002725C0;

  return v2;
}

- (AKAuthorizationListUpdateService)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationListUpdateService;
  v2 = [(AKAuthorizationListUpdateService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[AKAccountManager sharedInstance];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;
  }
  return v2;
}

- (void)start
{
  uint64_t v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v6 = "com.apple.ak.listupdate";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for XPC activity: %s...", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000B4260;
  handler[3] = &unk_100227FF0;
  handler[4] = self;
  xpc_activity_register("com.apple.ak.listupdate", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)performAuthorizationCheckInWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  objc_super v6 = [(AKAccountManager *)self->_accountManager primaryAuthKitAccount];
  dispatch_group_enter(v5);
  if (v6)
  {
    v7 = [(AKAccountManager *)self->_accountManager altDSIDForAccount:v6];
    v8 = +[AKUserInfoController sharedController];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000B47E4;
    v19[3] = &unk_10022AFA0;
    id v20 = v7;
    v21 = v5;
    id v9 = v7;
    [v8 fetchUserInformationForAltDSID:v9 client:0 completion:v19];
  }
  else
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No Primary AuthKit account found skipping user information fetch", buf, 2u);
    }

    dispatch_group_leave(v5);
  }
  v11 = +[AKFeatureManager sharedManager];
  unsigned int v12 = [v11 isDeviceListCacheEnableDryMode];

  if (v12)
  {
    v13 = dispatch_get_global_queue(9, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B48D0;
    block[3] = &unk_100226FB8;
    block[4] = self;
    dispatch_async(v13, block);
  }
  v14 = dispatch_get_global_queue(2, 0);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000B48D8;
  v16[3] = &unk_100228040;
  id v17 = v4;
  id v15 = v4;
  dispatch_group_notify(v5, v14, v16);
}

- (void)performGlobalConfigUpdateWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = [(AKAccountManager *)self->_accountManager primaryAuthKitAccount];
  if (v5)
  {
    objc_super v6 = +[AKGlobalConfigService sharedInstance];
    uint64_t v7 = AKRequestContextScheduledActivity;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000B4A2C;
    v9[3] = &unk_100228318;
    v10 = v4;
    [v6 fetchGlobalConfigUsingCachePolicy:1 context:v7 completion:v9];
  }
  else
  {
    v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No Primary AuthKit account found skipping global config fetch", buf, 2u);
    }

    if (v4) {
      v4[2](v4);
    }
  }
}

- (void)_clearStaleCachedDevices
{
  id v3 = +[AKDeviceListStoreManager sharedManager];
  [v3 clearStaleDevicesWithAccountManager:self->_accountManager completionHandler:&stru_10022AFC0];
}

- (void).cxx_destruct
{
}

@end