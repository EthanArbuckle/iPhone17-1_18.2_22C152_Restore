@interface ActiveAccountObserver
+ (ACAccount)activeAccount;
+ (ACAccount)activeSandboxAccount;
+ (id)sharedInstance;
- (ActiveAccountObserver)init;
- (id)oneAccountDSIDWithLogKey:(id)a3;
- (void)handleAccountStoreDidChangeNotification:(id)a3;
- (void)handleSandboxAccountDidChangeNotification:(id)a3;
- (void)handleStorefrontChangedNotification:(id)a3;
@end

@implementation ActiveAccountObserver

+ (ACAccount)activeAccount
{
  v2 = +[ACAccountStore ams_sharedAccountStore];
  v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  return (ACAccount *)v3;
}

+ (id)sharedInstance
{
  if (qword_1005B0CC8 != -1) {
    dispatch_once(&qword_1005B0CC8, &stru_100524EE8);
  }
  v2 = (void *)qword_1005B0CD0;
  return v2;
}

- (ActiveAccountObserver)init
{
  v20.receiver = self;
  v20.super_class = (Class)ActiveAccountObserver;
  v2 = [(ActiveAccountObserver *)&v20 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.AccountStore", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = +[ACAccountStore ams_sharedAccountStore];
    uint64_t v7 = objc_msgSend(v6, "ams_activeiTunesAccount");
    account = v2->_account;
    v2->_account = (ACAccount *)v7;

    uint64_t v9 = [(ACAccount *)v2->_account ams_storefront];
    cachedStoreFront = v2->_cachedStoreFront;
    v2->_cachedStoreFront = (NSString *)v9;

    v11 = objc_alloc_init(UnfairLock);
    lock = v2->_lock;
    v2->_lock = v11;

    v13 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      v15 = v2->_account;
      id v16 = v14;
      v17 = [(ACAccount *)v15 ams_DSID];
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      __int16 v23 = 2114;
      v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Intialized with account account: %{public}@", buf, 0x16u);
    }
    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v2 selector:"handleAccountStoreDidChangeNotification:" name:@"com.apple.appstored.ASDItunesAccountDidChangeNotification" object:0];
    [v18 addObserver:v2 selector:"handleSandboxAccountDidChangeNotification:" name:@"com.apple.appstored.ASDSandboxAccountDidChangeNotification" object:0];
    [v18 addObserver:v2 selector:"handleStorefrontChangedNotification:" name:@"com.apple.StoreServices.StorefrontChanged" object:0];
  }
  return v2;
}

+ (ACAccount)activeSandboxAccount
{
  v2 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStoreSandbox];
  v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  return (ACAccount *)v3;
}

- (id)oneAccountDSIDWithLogKey:(id)a3
{
  id v4 = a3;
  if (self)
  {
    v5 = sub_10030B11C();
    unsigned int v6 = sub_10030CE24(v5, @"one-apple-account-enabled", (void *)1, 0);

    if (v6 && self->_account)
    {
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x3032000000;
      v27 = sub_100018028;
      v28 = sub_100017BD0;
      id v29 = 0;
      lock = self->_lock;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100289A04;
      v23[3] = &unk_100521988;
      v23[4] = self;
      v23[5] = &v24;
      sub_100010468(lock, v23);
      v8 = (void *)v25[5];
      if (v8)
      {
        self = v8;
      }
      else
      {
        dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
        v10 = [_TtC9appstored23AccountCacheCoordinator alloc];
        account = self->_account;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100289A18;
        v19[3] = &unk_100524F10;
        id v20 = v4;
        v22 = &v24;
        v12 = v9;
        v21 = v12;
        [(AccountCacheCoordinator *)v10 oneAccountDSID:account logKey:v20 completionHandler:v19];

        dispatch_time_t v13 = dispatch_time(0, 5000000000);
        if (dispatch_semaphore_wait(v12, v13))
        {
          v14 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Timed out attempting to lookup oneAccountDSID", buf, 2u);
          }
        }
        else
        {
          v15 = self->_lock;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_100289B08;
          v17[3] = &unk_100524F38;
          v17[4] = self;
          v17[5] = &v24;
          sub_100010468(v15, v17);
        }
        self = (ActiveAccountObserver *)(id)v25[5];
      }
      _Block_object_dispose(&v24, 8);
    }
    else
    {
      self = 0;
    }
  }

  return self;
}

- (void)handleSandboxAccountDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received sandbox account changed notification", buf, 0xCu);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100289C54;
  block[3] = &unk_100521388;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)handleAccountStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100289DC8;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  dispatch_semaphore_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)handleStorefrontChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028A6B8;
  block[3] = &unk_100521388;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_lockedCachedOneAccountDSID, 0);
  objc_storeStrong((id *)&self->_cachedStoreFront, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end