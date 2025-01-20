@interface ActiveAccountObserver
+ (ACAccount)activeAccount;
+ (ACAccount)activeSandboxAccount;
+ (BOOL)_shouldNotifyChangeFromExistingAccount:(id)a3 toCurrentAccount:(id)a4;
+ (id)sharedInstance;
+ (void)_postAccountDidChangeFromOldAccount:(id)a3 withAccountStore:(id)a4;
- (ACAccount)activeAccount;
- (ACAccount)activeSandboxAccount;
- (ActiveAccountObserver)init;
- (void)handleAccountStoreDidChangeNotification:(id)a3;
- (void)handleSandboxAccountDidChangeNotification:(id)a3;
@end

@implementation ActiveAccountObserver

+ (id)sharedInstance
{
  if (qword_1003A05A8 != -1) {
    dispatch_once(&qword_1003A05A8, &stru_10035A630);
  }
  v2 = (void *)qword_1003A05B0;

  return v2;
}

- (ActiveAccountObserver)init
{
  v16.receiver = self;
  v16.super_class = (Class)ActiveAccountObserver;
  v2 = [(ActiveAccountObserver *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storekit.AccountStore", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = +[ACAccountStore ams_sharedAccountStore];
    uint64_t v6 = objc_msgSend(v5, "ams_activeiTunesAccount");
    account = v2->_account;
    v2->_account = (ACAccount *)v6;

    if (qword_1003A0600 != -1) {
      dispatch_once(&qword_1003A0600, &stru_10035A668);
    }
    v8 = (void *)qword_1003A05B8;
    if (os_log_type_enabled((os_log_t)qword_1003A05B8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = objc_opt_class();
      v11 = v2->_account;
      id v12 = v10;
      v13 = [(ACAccount *)v11 ams_DSID];
      *(_DWORD *)buf = 138543619;
      v18 = v10;
      __int16 v19 = 2113;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Intialized with account: %{private}@", buf, 0x16u);
    }
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"handleAccountStoreDidChangeNotification:" name:@"com.apple.appstored.ASDItunesAccountDidChangeNotification" object:0];
    [v14 addObserver:v2 selector:"handleSandboxAccountDidChangeNotification:" name:@"com.apple.appstored.ASDSandboxAccountDidChangeNotification" object:0];
  }
  return v2;
}

+ (ACAccount)activeAccount
{
  v2 = +[ACAccountStore ams_sharedAccountStore];
  dispatch_queue_t v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  return (ACAccount *)v3;
}

+ (ACAccount)activeSandboxAccount
{
  v2 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStoreSandbox];
  dispatch_queue_t v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  return (ACAccount *)v3;
}

- (void)handleSandboxAccountDidChangeNotification:(id)a3
{
  id v4 = a3;
  if (qword_1003A0600 != -1) {
    dispatch_once(&qword_1003A0600, &stru_10035A668);
  }
  v5 = (void *)qword_1003A05B8;
  if (os_log_type_enabled((os_log_t)qword_1003A05B8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received sandbox account changed notification", buf, 0xCu);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009595C;
  block[3] = &unk_100358170;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)handleAccountStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100095AD0;
  v7[3] = &unk_1003580D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

+ (void)_postAccountDidChangeFromOldAccount:(id)a3 withAccountStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(21, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100096074;
  v10[3] = &unk_1003580D0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

+ (BOOL)_shouldNotifyChangeFromExistingAccount:(id)a3 toCurrentAccount:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  id v7 = (void *)v6;
  if (!(v5 | v6)) {
    goto LABEL_2;
  }
  if (!v5 && v6)
  {
    if (qword_1003A0600 != -1) {
      dispatch_once(&qword_1003A0600, &stru_10035A668);
    }
    id v9 = (void *)qword_1003A05B8;
    if (os_log_type_enabled((os_log_t)qword_1003A05B8, OS_LOG_TYPE_DEBUG)) {
      sub_1002CA658(v9);
    }
LABEL_15:
    BOOL v8 = 1;
    goto LABEL_16;
  }
  if (v5 && !v6)
  {
    if (qword_1003A0600 != -1) {
      dispatch_once(&qword_1003A0600, &stru_10035A668);
    }
    v10 = (void *)qword_1003A05B8;
    if (os_log_type_enabled((os_log_t)qword_1003A05B8, OS_LOG_TYPE_DEBUG)) {
      sub_1002CA704(v10);
    }
    goto LABEL_15;
  }
  uint64_t v12 = objc_msgSend((id)v6, "ams_DSID");
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = objc_msgSend((id)v5, "ams_DSID");
    if (v14)
    {
      v15 = (void *)v14;
      objc_super v16 = objc_msgSend(v7, "ams_DSID");
      v17 = objc_msgSend((id)v5, "ams_DSID");
      unsigned __int8 v18 = [v16 isEqualToNumber:v17];

      if ((v18 & 1) == 0)
      {
        if (qword_1003A0600 != -1) {
          dispatch_once(&qword_1003A0600, &stru_10035A668);
        }
        __int16 v19 = (void *)qword_1003A05B8;
        if (os_log_type_enabled((os_log_t)qword_1003A05B8, OS_LOG_TYPE_DEBUG)) {
          sub_1002CA7B0(v19);
        }
        goto LABEL_15;
      }
    }
    else
    {
    }
  }
LABEL_2:
  BOOL v8 = 0;
LABEL_16:

  return v8;
}

- (ACAccount)activeAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 24, 1);
}

- (ACAccount)activeSandboxAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSandboxAccount, 0);
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end