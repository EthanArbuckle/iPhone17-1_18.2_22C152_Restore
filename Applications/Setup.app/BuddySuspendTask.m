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
  SEL v11 = a2;
  id location = 0;
  v10.receiver = self;
  v10.super_class = (Class)BuddySuspendTask;
  id location = [(BuddySuspendTask *)&v10 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    dispatch_queue_t v2 = dispatch_queue_create("Suspend Task Preheat Queue", 0);
    v3 = (void *)*((void *)location + 4);
    *((void *)location + 4) = v2;

    id v4 = objc_alloc((Class)ACMonitoredAccountStore);
    v5 = +[NSSet setWithObject:ACAccountTypeIdentifieriTunesStore];
    id v6 = [v4 initWithAccountTypes:v5 delegate:location];
    v7 = (void *)*((void *)location + 5);
    *((void *)location + 5) = v6;

    [*((id *)location + 5) registerWithCompletion:&stru_1002B2700];
  }
  v8 = (BuddySuspendTask *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

+ (BOOL)hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSLocale currentLocale];
  id v4 = [(NSLocale *)v3 countryCode];
  char v5 = ![(NSString *)v4 isEqualToString:@"RU"];

  if (v5)
  {
    BOOL v15 = 0;
  }
  else
  {
    id v6 = [location[0] objectForKey:@"AppStorePresented" includeCache:0];
    unsigned __int8 v7 = [v6 BOOLValue];

    if (v7)
    {
      BOOL v15 = 0;
    }
    else if (+[BYManagedAppleIDBootstrap isMultiUser])
    {
      BOOL v15 = 0;
    }
    else
    {
      id v8 = +[MCProfileConnection sharedConnection];
      id v9 = [v8 skipSetupKeys];
      unsigned __int8 v10 = [v9 containsObject:kMCCCSkipAppStore];

      if (v10)
      {
        BOOL v15 = 0;
      }
      else
      {
        id v11 = +[MCProfileConnection sharedConnection];
        BOOL v12 = [v11 effectiveBoolValueForSetting:MCFeatureAppInstallationAllowed] == 2;

        BOOL v15 = !v12;
      }
    }
  }
  objc_storeStrong(location, 0);
  return v15;
}

- (void)preheat
{
  v22 = self;
  SEL v21 = a2;
  dispatch_queue_t v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  v3 = [(BuddySuspendTask *)v22 bag];
  if (!v3)
  {
    id v4 = objc_alloc_init(BuddyMediaServicesBag);
    [(BuddySuspendTask *)v22 setBag:v4];
  }
  char v5 = [(BuddySuspendTask *)v22 launchURL];
  char v19 = 0;
  BOOL v6 = 1;
  if (v5)
  {
    v20 = [(BuddySuspendTask *)v22 message];
    char v19 = 1;
    BOOL v6 = v20 == 0;
  }
  if (v19) {

  }
  if (v6)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = oslog;
      os_log_type_t v8 = v17;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Preheating suspend task...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v9 = [(BuddySuspendTask *)v22 preheatQueue];
  block = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_1000C51E8;
  v14 = &unk_1002B0D20;
  BOOL v15 = v22;
  dispatch_async(v9, &block);

  objc_storeStrong((id *)&v15, 0);
}

- (void)_attemptPreheat:(unint64_t)a3
{
  v93 = self;
  SEL v92 = a2;
  v91 = (void *)a3;
  v3 = [(BuddySuspendTask *)self preheatQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  if (v91)
  {
    uint64_t v83 = 0;
    v84 = &v83;
    int v85 = 0x20000000;
    int v86 = 32;
    char v87 = 0;
    uint64_t v78 = 0;
    v79 = &v78;
    int v80 = 0x20000000;
    int v81 = 32;
    char v82 = 0;
    BOOL v6 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v73 = -1073741824;
    int v74 = 0;
    v75 = sub_1000C5CD0;
    v76 = &unk_1002B2728;
    v77[1] = &v83;
    v77[0] = v93;
    v77[2] = &v78;
    dispatch_sync((dispatch_queue_t)v6, &block);

    if (v84[3] & 1) != 0 && (v79[3])
    {
      int v71 = 1;
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v69 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v7 = oslog;
        os_log_type_t v8 = v69;
        sub_10004B24C(v68);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Attempting to preheat suspend task...", v68, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v67 = 0;
      if ((v84[3] & 1) == 0)
      {
        id v9 = [(BuddySuspendTask *)v93 bag];
        id v10 = [(BuddyMediaServicesBag *)v9 getAppStoreURL];
        id obj = v67;
        id v11 = [v10 valueWithError:&obj];
        objc_storeStrong(&v67, obj);
        id v66 = v11;

        if (!v67 && v66)
        {
          *((unsigned char *)v84 + 24) = 1;
          v13 = &_dispatch_main_q;
          v52 = _NSConcreteStackBlock;
          int v53 = -1073741824;
          int v54 = 0;
          v55 = sub_1000C5D58;
          v56 = &unk_1002B12F0;
          v57 = v93;
          id v58 = v66;
          dispatch_async((dispatch_queue_t)v13, &v52);

          objc_storeStrong(&v58, 0);
          objc_storeStrong((id *)&v57, 0);
        }
        else
        {
          os_log_t v64 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v63 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            char v61 = 0;
            char v59 = 0;
            if (_BYIsInternalInstall())
            {
              int v12 = (NSString *)v67;
            }
            else if (v67)
            {
              id v62 = [v67 domain];
              char v61 = 1;
              int v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v62, [v67 code]);
              v60 = v12;
              char v59 = 1;
            }
            else
            {
              int v12 = 0;
            }
            sub_10004BB7C((uint64_t)v95, (uint64_t)v12);
            _os_log_error_impl((void *)&_mh_execute_header, v64, v63, "Failed to fetch suspend task URL: %{public}@", v95, 0xCu);
            if (v59) {

            }
            if (v61) {
          }
            }
          objc_storeStrong((id *)&v64, 0);
        }
        objc_storeStrong(&v66, 0);
      }
      if ((v84[3] & 1) != 0 && (v79[3] & 1) == 0)
      {
        v14 = [(BuddySuspendTask *)v93 bag];
        id v15 = [(BuddyMediaServicesBag *)v14 getAppStoreMessage];
        id v50 = v67;
        id v16 = [v15 valueWithError:&v50];
        objc_storeStrong(&v67, v50);
        id v51 = v16;

        if (v67)
        {
          os_log_t v49 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v48 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            char v46 = 0;
            char v44 = 0;
            if (_BYIsInternalInstall())
            {
              os_log_type_t v17 = (NSString *)v67;
            }
            else if (v67)
            {
              id v47 = [v67 domain];
              char v46 = 1;
              os_log_type_t v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v47, [v67 code]);
              v45 = v17;
              char v44 = 1;
            }
            else
            {
              os_log_type_t v17 = 0;
            }
            sub_10004BB7C((uint64_t)v94, (uint64_t)v17);
            _os_log_error_impl((void *)&_mh_execute_header, v49, v48, "Failed to fetch store message: %{public}@", v94, 0xCu);
            if (v44) {

            }
            if (v46) {
          }
            }
          objc_storeStrong((id *)&v49, 0);
        }
        else
        {
          *((unsigned char *)v79 + 24) = 1;
          v18 = &_dispatch_main_q;
          v37 = _NSConcreteStackBlock;
          int v38 = -1073741824;
          int v39 = 0;
          v40 = sub_1000C5D88;
          v41 = &unk_1002B12F0;
          v42 = v93;
          id v43 = v51;
          dispatch_async((dispatch_queue_t)v18, &v37);

          objc_storeStrong(&v43, 0);
          objc_storeStrong((id *)&v42, 0);
        }
        objc_storeStrong(&v51, 0);
      }
      if (v84[3] & 1) != 0 && (v79[3])
      {
        os_log_t v27 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v27;
          os_log_type_t v24 = v26;
          sub_10004B24C(v25);
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Suspend task preheating completed", v25, 2u);
        }
        objc_storeStrong((id *)&v27, 0);
      }
      else
      {
        os_log_t v36 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          char v19 = v36;
          os_log_type_t v20 = v35;
          sub_10004B24C(v34);
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to preheat suspend task, will retry...", v34, 2u);
        }
        objc_storeStrong((id *)&v36, 0);
        dispatch_time_t v21 = dispatch_time(0, 10000000000);
        v22 = [(BuddySuspendTask *)v93 preheatQueue];
        v28 = _NSConcreteStackBlock;
        int v29 = -1073741824;
        int v30 = 0;
        v31 = sub_1000C5DB8;
        v32 = &unk_1002B1198;
        v33[0] = v93;
        v33[1] = v91;
        dispatch_after(v21, v22, &v28);

        objc_storeStrong(v33, 0);
      }
      objc_storeStrong(&v67, 0);
      int v71 = 0;
    }
    objc_storeStrong(v77, 0);
    _Block_object_dispose(&v78, 8);
    _Block_object_dispose(&v83, 8);
  }
  else
  {
    id location = (id)_BYLoggingFacility();
    char v89 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      id v4 = location;
      os_log_type_t v5 = v89;
      sub_10004B24C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v4, v5, "No further attempts remaining for preheating suspend task", buf, 2u);
    }
    objc_storeStrong(&location, 0);
  }
}

- (void)accountWasAdded:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = (id)_BYLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v14;
    os_log_type_t v4 = v13;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Detected store account addition; attempting to preheat suspend task (if needed)",
      buf,
      2u);
  }
  objc_storeStrong(&v14, 0);
  os_log_type_t v5 = [(BuddySuspendTask *)v16 preheatQueue];
  block = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_1000C5F40;
  id v10 = &unk_1002B0D20;
  id v11 = v16;
  dispatch_async(v5, &block);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
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
}

@end