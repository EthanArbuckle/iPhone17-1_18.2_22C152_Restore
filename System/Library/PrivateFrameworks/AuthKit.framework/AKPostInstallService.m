@interface AKPostInstallService
+ (id)sharedService;
- (void)_performPostInstallWithCompletion:(id)a3;
- (void)fetchUserInfoForAltDSID:(id)a3 completion:(id)a4;
- (void)start;
@end

@implementation AKPostInstallService

+ (id)sharedService
{
  if (qword_100272398 != -1) {
    dispatch_once(&qword_100272398, &stru_100227FC8);
  }
  v2 = (void *)qword_100272390;

  return v2;
}

- (void)start
{
  v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "com.apple.ak.postinstall";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for XPC activity: %s...", buf, 0xCu);
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10003CBD8;
  handler[3] = &unk_100227FF0;
  handler[4] = self;
  xpc_activity_register("com.apple.ak.postinstall", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)_performPostInstallWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = [[AKSatoriController alloc] initWithClient:0];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10003D1FC;
  v32[3] = &unk_100228018;
  v7 = v5;
  v33 = v7;
  [(AKSatoriController *)v6 warmUpVerificationSessionWithCompletionHandler:v32];
  v8 = +[AKAccountManager sharedInstance];
  v9 = [v8 primaryAuthKitAccount];
  if (v9)
  {
    v10 = [v8 altDSIDForAccount:v9];
    dispatch_group_enter(v7);
    v11 = +[AKFeatureManager sharedManager];
    unsigned int v12 = [v11 isTokenCacheEnabled];

    if (v12)
    {
      v13 = _AKLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AKAppleIDCheckInHelperService attempt token sync after OS upgrade...", buf, 2u);
      }

      v14 = +[AKTokenManager sharedInstance];
      uint64_t v30 = 0;
      [v14 synchronizeTokensForAllAccounts:&v30];

      v15 = _AKLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AKAppleIDCheckInHelperService finished token sync after OS upgrade...", buf, 2u);
      }
    }
    v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AKAppleIDCheckInHelperService attempt performHeartbeatCheckIn after OS upgrade...", buf, 2u);
    }

    v17 = +[AKAppleIDCheckInHelperService sharedService];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10003D2B4;
    v27[3] = &unk_100226BD8;
    v27[4] = self;
    id v28 = v10;
    v18 = v7;
    v29 = v18;
    id v19 = v10;
    [v17 performLivenessCheckInForAllEligibleAccountsWithReason:3 completion:v27];

    v20 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003D39C;
    block[3] = &unk_100228040;
    id v26 = v4;
    dispatch_group_notify(v18, v20, block);
  }
  else
  {
    v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Post install activity triggered without IdMS account, skipping liveness update...", buf, 2u);
    }

    v22 = dispatch_get_global_queue(2, 0);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003D3B4;
    v23[3] = &unk_100228040;
    id v24 = v4;
    dispatch_group_notify(v7, v22, v23);

    id v19 = v24;
  }
}

- (void)fetchUserInfoForAltDSID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AKUserInfoController attempt fetchUserInfo after OS upgrade...", buf, 2u);
  }

  v8 = +[AKUserInfoController sharedController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003D4DC;
  v10[3] = &unk_100228068;
  id v11 = v5;
  id v9 = v5;
  [v8 fetchUserInformationForAltDSID:v6 client:0 completion:v10];
}

@end