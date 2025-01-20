@interface FAAccountNotificationPlugin
- (void)_enableScreentimeForAccount:(id)a3;
- (void)_notifyAccountChange:(id)a3 changeType:(int)a4;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation FAAccountNotificationPlugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v15 = a3;
  id v10 = a5;
  id v11 = a6;
  if (a4 == 3)
  {
    v12 = self;
    id v13 = v11;
    uint64_t v14 = 3;
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    v12 = self;
    id v13 = v15;
    uint64_t v14 = 1;
  }
  [(FAAccountNotificationPlugin *)v12 _notifyAccountChange:v13 changeType:v14];
LABEL_6:
}

- (void)_notifyAccountChange:(id)a3 changeType:(int)a4
{
  id v6 = a3;
  v7 = _FALogSystem();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Account changed. Let familycircled know about it.", buf, 2u);
    }

    v8 = objc_alloc_init((Class)FAFamilyCircleRequest);
    v9 = (void *)os_transaction_create();
    id v10 = [v8 serviceRemoteObjectWithErrorHandler:&stru_40F8];
    if (a4 == 3)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = nullsub_2;
      v12[3] = &unk_4120;
      id v11 = &v13;
      id v13 = v9;
      [v10 didDeleteAccount:v6 replyBlock:v12];
    }
    else
    {
      if (a4 != 1)
      {
LABEL_11:

        goto LABEL_12;
      }
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = nullsub_1;
      v14[3] = &unk_4120;
      id v11 = &v15;
      id v15 = v9;
      [v10 didAddAccount:v6 replyBlock:v14];
      [(FAAccountNotificationPlugin *)self _enableScreentimeForAccount:v6];
    }

    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_3440(v8);
  }
LABEL_12:
}

- (void)_enableScreentimeForAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSNumberFormatter);
  v5 = objc_msgSend(v3, "aa_personID");

  id v6 = [v4 numberFromString:v5];

  v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[FAAccountNotificationPlugin _enableScreentimeForAccount:]";
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s: Setting up Screentime for dsid: %@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = [objc_alloc((Class)FAFetchScreenTimeSettingsCacheRequest) initWithFamilyMemberDSID:v6];
  [v8 startRequestWithCompletionHandler:&stru_4160];
}

@end