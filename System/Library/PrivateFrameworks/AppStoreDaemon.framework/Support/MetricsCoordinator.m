@interface MetricsCoordinator
- (MetricsCoordinator)init;
- (void)_handleAppleIDDidChangeNotification:(id)a3;
@end

@implementation MetricsCoordinator

- (MetricsCoordinator)init
{
  v31.receiver = self;
  v31.super_class = (Class)MetricsCoordinator;
  v2 = [(MetricsCoordinator *)&v31 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC9appstored6LogKey);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.MetricsCoordinator.dispatch", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = +[ACAccountStore ams_sharedAccountStore];
    v8 = objc_msgSend(v7, "ams_activeiTunesAccount");

    if (v8)
    {
      v9 = +[ACAccountStore ams_sharedAccountStore];
      v10 = objc_msgSend(v9, "ams_activeiTunesAccount");
      uint64_t v11 = objc_msgSend(v10, "ams_DSID");
      activeAccountID = v2->_activeAccountID;
      v2->_activeAccountID = (NSNumber *)v11;
    }
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"_handleAppleIDDidChangeNotification:" name:@"com.apple.appstored.ASDItunesAccountDidChangeNotification" object:0];

    id v14 = objc_alloc((Class)NSDate);
    v15 = +[NSProcessInfo processInfo];
    [v15 systemUptime];
    v17 = (NSDate *)[v14 initWithTimeIntervalSinceNow:-v16];
    systemUpDate = v2->_systemUpDate;
    v2->_systemUpDate = v17;

    v19 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      v21 = v2->_systemUpDate;
      id v22 = v20;
      if (v21)
      {
        [(NSDate *)v21 timeIntervalSince1970];
        uint64_t v24 = (uint64_t)v23;
      }
      else
      {
        uint64_t v24 = 0;
      }
      *(_DWORD *)buf = 138543874;
      v33 = v20;
      __int16 v34 = 2112;
      v35 = v3;
      __int16 v36 = 2048;
      uint64_t v37 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@/%@] Metrics coordinator started with system up date %{time_t}ld", buf, 0x20u);
    }
    v25 = v2->_dispatchQueue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1002E1984;
    v28[3] = &unk_1005218C0;
    v29 = v2;
    v30 = v3;
    v26 = v3;
    dispatch_async(v25, v28);
  }
  return v2;
}

- (void)_handleAppleIDDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002E5FF4;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemUpDate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_activeAccountID, 0);
}

@end