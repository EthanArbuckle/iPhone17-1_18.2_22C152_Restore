@interface NavdLocationAuthorizationMonitor
+ (id)sharedMonitor;
- (BOOL)isAuthorizedForLocationWithClientBundleIdentifier:(id)a3;
- (NavdLocationAuthorizationMonitor)init;
- (int)_q_getAuthorizationForLocationWithBundleIdentifier:(id)a3;
- (void)_q_reset;
- (void)_reset;
@end

@implementation NavdLocationAuthorizationMonitor

+ (id)sharedMonitor
{
  if (qword_1000A24E0 != -1) {
    dispatch_once(&qword_1000A24E0, &stru_100089698);
  }
  v2 = (void *)qword_1000A24D8;

  return v2;
}

- (NavdLocationAuthorizationMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)NavdLocationAuthorizationMonitor;
  v2 = [(NavdLocationAuthorizationMonitor *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    authStatusDictionary = v2->_authStatusDictionary;
    v2->_authStatusDictionary = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("NavdLocationAuthorizationMonitor", v5);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100015940, CLAuthorizationStatusChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)_q_reset
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Clearing auth status dictionary", v4, 2u);
  }

  [(NSMutableDictionary *)self->_authStatusDictionary removeAllObjects];
}

- (void)_reset
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015AD4;
  block[3] = &unk_100088EE0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (int)_q_getAuthorizationForLocationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_authStatusDictionary objectForKey:v4];
  dispatch_queue_t v6 = GEOFindOrCreateLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      int v13 = 138477827;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Location auth for %{private}@ found in the dictionary. Not requesting from CL.", (uint8_t *)&v13, 0xCu);
    }

    LODWORD(v6) = [v5 integerValue];
  }
  else
  {
    if (v7)
    {
      int v13 = 138477827;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Location auth for %{private}@ NOT found in the dictionary. Requesting from CL.", (uint8_t *)&v13, 0xCu);
    }

    v8 = +[NSBundle bundleWithPath:v4];
    v9 = [v8 bundlePath];
    dispatch_queue_t v6 = +[CLLocationManager authorizationStatusForBundlePath:v9];

    authStatusDictionary = self->_authStatusDictionary;
    v11 = +[NSNumber numberWithInt:v6];
    [(NSMutableDictionary *)authStatusDictionary setObject:v11 forKey:v4];
  }
  return (int)v6;
}

- (BOOL)isAuthorizedForLocationWithClientBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015FDC;
  block[3] = &unk_1000896C0;
  v20 = &v25;
  block[4] = self;
  id v6 = v4;
  id v19 = v6;
  dispatch_sync(serialQueue, block);
  BOOL v7 = self->_serialQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100016014;
  v17[3] = &unk_100089438;
  v17[4] = self;
  v17[5] = &v21;
  dispatch_sync(v7, v17);
  if ((*((_DWORD *)v26 + 6) - 3) > 1 || (*((_DWORD *)v22 + 6) - 3) > 1)
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v13 = *((_DWORD *)v26 + 6);
      int v14 = *((_DWORD *)v22 + 6);
      v15 = +[CLLocationManager navdLocationBundleSource];
      *(_DWORD *)buf = 67109891;
      int v30 = v13;
      __int16 v31 = 1024;
      int v32 = v14;
      __int16 v33 = 2113;
      v34 = v15;
      __int16 v35 = 2113;
      id v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Location Authorization Denied (Client Auth Status %d,  NavdAuthStatus %d, NavdLocationBundleSource %{private}@, ClientBundleIdentifier %{private}@)", buf, 0x22u);
    }
    BOOL v12 = 0;
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = *((_DWORD *)v26 + 6);
      int v10 = *((_DWORD *)v22 + 6);
      v11 = +[CLLocationManager navdLocationBundleSource];
      *(_DWORD *)buf = 67109891;
      int v30 = v9;
      __int16 v31 = 1024;
      int v32 = v10;
      __int16 v33 = 2113;
      v34 = v11;
      __int16 v35 = 2113;
      id v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Location Authorization Approved (Client Auth Status %d,  NavdAuthStatus %d, NavdLocationBundleSource %{private}@, ClientBundleIdentifier %{private}@)", buf, 0x22u);
    }
    BOOL v12 = 1;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_authStatusDictionary, 0);
}

@end