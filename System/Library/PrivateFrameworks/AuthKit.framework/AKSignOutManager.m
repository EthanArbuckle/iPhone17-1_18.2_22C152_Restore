@interface AKSignOutManager
+ (id)sharedManager;
- (BOOL)markAccountForSignOutForAltDSID:(id)a3;
- (void)processPushMessage:(id)a3;
@end

@implementation AKSignOutManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100098360;
  block[3] = &unk_1002295D0;
  block[4] = a1;
  if (qword_100272548 != -1) {
    dispatch_once(&qword_100272548, block);
  }
  v2 = (void *)qword_100272540;

  return v2;
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)2100)
  {
    v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received push command to sign out.", buf, 2u);
    }

    v6 = [v4 altDSID];
    unsigned __int8 v7 = [(AKSignOutManager *)self markAccountForSignOutForAltDSID:v6];
    v8 = _AKLogSystem();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully saved account after marking for sign out.", v17, 2u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_10018C240(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (BOOL)markAccountForSignOutForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = +[AKAccountManager sharedInstance];
  v5 = [v4 authKitAccountWithAltDSID:v3 error:0];

  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10018C348(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  if (v5)
  {
    [v4 setMarkedForSignOut:1 forAccount:v5];
    id v25 = 0;
    unsigned __int8 v14 = [v4 saveAccount:v5 error:&v25];
    uint64_t v15 = v25;
    if (v15)
    {
      uint64_t v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10018C2B0(v15, v16);
      }
    }
  }
  else
  {
    uint64_t v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10018C278(v15, v17, v18, v19, v20, v21, v22, v23);
    }
    unsigned __int8 v14 = 0;
  }

  return v14;
}

@end