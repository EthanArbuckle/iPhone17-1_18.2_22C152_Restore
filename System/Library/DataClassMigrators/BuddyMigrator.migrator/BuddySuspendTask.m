@interface BuddySuspendTask
+ (BOOL)hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:(id)a3;
- (ACMonitoredAccountStore)monitoredAccountStore;
- (BuddyMediaServicesBag)bag;
- (BuddySuspendTask)init;
- (NSString)message;
- (NSURL)launchURL;
- (OS_dispatch_queue)preheatQueue;
- (void)_attemptPreheat:(unint64_t)a3;
- (void)accountWasAdded:(id)a3;
- (void)preheat;
- (void)setBag:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMonitoredAccountStore:(id)a3;
- (void)setPreheatQueue:(id)a3;
@end

@implementation BuddySuspendTask

- (BuddySuspendTask)init
{
  v10.receiver = self;
  v10.super_class = (Class)BuddySuspendTask;
  v2 = [(BuddySuspendTask *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Suspend Task Preheat Queue", 0);
    preheatQueue = v2->_preheatQueue;
    v2->_preheatQueue = (OS_dispatch_queue *)v3;

    id v5 = objc_alloc((Class)ACMonitoredAccountStore);
    v6 = +[NSSet setWithObject:ACAccountTypeIdentifieriTunesStore];
    v7 = (ACMonitoredAccountStore *)[v5 initWithAccountTypes:v6 delegate:v2];
    monitoredAccountStore = v2->_monitoredAccountStore;
    v2->_monitoredAccountStore = v7;

    [(ACMonitoredAccountStore *)v2->_monitoredAccountStore registerWithCompletion:&stru_209F8];
  }
  return v2;
}

+ (BOOL)hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:(id)a3
{
  id v3 = a3;
  v4 = +[NSLocale currentLocale];
  id v5 = [v4 countryCode];
  unsigned int v6 = [v5 isEqualToString:@"RU"];

  if (!v6)
  {
LABEL_5:
    BOOL v9 = 0;
    goto LABEL_6;
  }
  v7 = [v3 objectForKey:@"AppStorePresented" includeCache:0];
  unsigned __int8 v8 = [v7 BOOLValue];

  BOOL v9 = 0;
  if ((v8 & 1) == 0)
  {
    if ((+[BYManagedAppleIDBootstrap isMultiUser] & 1) == 0)
    {
      objc_super v10 = +[MCProfileConnection sharedConnection];
      v11 = [v10 skipSetupKeys];
      unsigned __int8 v12 = [v11 containsObject:kMCCCSkipAppStore];

      if ((v12 & 1) == 0)
      {
        v14 = +[MCProfileConnection sharedConnection];
        BOOL v9 = [v14 effectiveBoolValueForSetting:MCFeatureAppInstallationAllowed] != 2;

        goto LABEL_6;
      }
    }
    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

- (void)preheat
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = [(BuddySuspendTask *)self bag];

  if (!v3)
  {
    v4 = objc_alloc_init(BuddyMediaServicesBag);
    [(BuddySuspendTask *)self setBag:v4];
  }
  uint64_t v5 = [(BuddySuspendTask *)self launchURL];
  if (!v5
    || (unsigned int v6 = (void *)v5,
        [(BuddySuspendTask *)self message],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    unsigned __int8 v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Preheating suspend task...", buf, 2u);
    }
  }
  BOOL v9 = [(BuddySuspendTask *)self preheatQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_92BC;
  block[3] = &unk_20A20;
  block[4] = self;
  dispatch_async(v9, block);
}

- (void)_attemptPreheat:(unint64_t)a3
{
  uint64_t v5 = [(BuddySuspendTask *)self preheatQueue];
  dispatch_assert_queue_V2(v5);

  if (a3)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9940;
    block[3] = &unk_20A48;
    block[4] = self;
    void block[5] = &v38;
    block[6] = &v34;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    if (*((unsigned char *)v39 + 24) && *((unsigned char *)v35 + 24)) {
      goto LABEL_33;
    }
    unsigned int v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Attempting to preheat suspend task...", buf, 2u);
    }

    if (*((unsigned char *)v39 + 24))
    {
      id v7 = 0;
    }
    else
    {
      BOOL v9 = [(BuddySuspendTask *)self bag];
      objc_super v10 = [v9 getAppStoreURL];
      id v32 = 0;
      v11 = [v10 valueWithError:&v32];
      id v7 = v32;

      if (v7 || !v11)
      {
        unsigned __int8 v12 = _BYLoggingFacility();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          if (_BYIsInternalInstall())
          {
            int v24 = 0;
            v25 = v7;
          }
          else if (v7)
          {
            objc_super v10 = [v7 domain];
            v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v10, [v7 code]);
            int v24 = 1;
          }
          else
          {
            int v24 = 0;
            v25 = 0;
          }
          *(_DWORD *)buf = 138543362;
          v43 = v25;
          _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Failed to fetch suspend task URL: %{public}@", buf, 0xCu);
          if (v24)
          {
          }
        }
      }
      else
      {
        *((unsigned char *)v39 + 24) = 1;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_99B4;
        v30[3] = &unk_20A70;
        v30[4] = self;
        id v31 = v11;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v30);
      }
      if (!*((unsigned char *)v39 + 24)) {
        goto LABEL_29;
      }
    }
    if (*((unsigned char *)v35 + 24))
    {
      id v13 = v7;
    }
    else
    {
      v14 = [(BuddySuspendTask *)self bag];
      v15 = [v14 getAppStoreMessage];
      id v29 = v7;
      v16 = [v15 valueWithError:&v29];
      id v13 = v29;

      if (v13)
      {
        v17 = _BYLoggingFacility();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          char v22 = _BYIsInternalInstall();
          v23 = v13;
          if ((v22 & 1) == 0)
          {
            v14 = [v13 domain];
            v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v14, [v13 code]);
          }
          *(_DWORD *)buf = 138543362;
          v43 = v23;
          _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "Failed to fetch store message: %{public}@", buf, 0xCu);
          if ((v22 & 1) == 0)
          {
          }
        }
      }
      else
      {
        *((unsigned char *)v35 + 24) = 1;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_99BC;
        v27[3] = &unk_20A70;
        v27[4] = self;
        id v28 = v16;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v27);
      }
      id v7 = v13;
      if (!*((unsigned char *)v39 + 24)) {
        goto LABEL_29;
      }
    }
    if (*((unsigned char *)v35 + 24))
    {
      v18 = _BYLoggingFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Suspend task preheating completed", buf, 2u);
      }

      id v7 = v13;
LABEL_32:

LABEL_33:
      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v38, 8);
      return;
    }
    id v7 = v13;
LABEL_29:
    v19 = _BYLoggingFacility();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Failed to preheat suspend task, will retry...", buf, 2u);
    }

    dispatch_time_t v20 = dispatch_time(0, 10000000000);
    v21 = [(BuddySuspendTask *)self preheatQueue];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_99C4;
    v26[3] = &unk_20A98;
    v26[4] = self;
    v26[5] = a3;
    dispatch_after(v20, v21, v26);

    goto LABEL_32;
  }
  unsigned __int8 v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_160C4(v8);
  }
}

- (void)accountWasAdded:(id)a3
{
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Detected store account addition; attempting to preheat suspend task (if needed)",
      buf,
      2u);
  }

  uint64_t v5 = [(BuddySuspendTask *)self preheatQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9AA4;
  block[3] = &unk_20A20;
  block[4] = self;
  dispatch_async(v5, block);
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (void)setLaunchURL:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (BuddyMediaServicesBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (OS_dispatch_queue)preheatQueue
{
  return self->_preheatQueue;
}

- (void)setPreheatQueue:(id)a3
{
}

- (ACMonitoredAccountStore)monitoredAccountStore
{
  return self->_monitoredAccountStore;
}

- (void)setMonitoredAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredAccountStore, 0);
  objc_storeStrong((id *)&self->_preheatQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_launchURL, 0);
}

@end