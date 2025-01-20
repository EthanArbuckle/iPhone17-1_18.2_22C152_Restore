@interface ProcessExitFetcher
+ (id)sharedInstance;
- (NSMutableArray)processExitRecords;
- (NSString)launchServiceMonitorID;
- (OS_dispatch_source)fetchTimer;
- (ProcessExitFetcher)initWithMonitorID:(id)a3 fetchIntervalMs:(double)a4;
- (double)fetchIntervalMs;
- (id)extractProcessNameToDisplayFromBundleID:(id)a3;
- (id)getProcessExitRecordFetchQueue;
- (id)processExitHandler;
- (id)processNameToDisplayForBundleID:(id)a3;
- (int64_t)launchServiceMaxRecordCount;
- (void)fetchProcessExitInfo;
- (void)kickOffFetchTimer;
- (void)setFetchIntervalMs:(double)a3;
- (void)setFetchTimer:(id)a3;
- (void)setLaunchServiceMaxRecordCount:(int64_t)a3;
- (void)setLaunchServiceMonitorID:(id)a3;
- (void)setProcessExitHandler:(id)a3;
- (void)setProcessExitRecords:(id)a3;
- (void)stopFetchTimer;
@end

@implementation ProcessExitFetcher

+ (id)sharedInstance
{
  if (qword_10003EA38 != -1) {
    dispatch_once(&qword_10003EA38, &stru_100031930);
  }
  v2 = (void *)qword_10003EA30;

  return v2;
}

- (ProcessExitFetcher)initWithMonitorID:(id)a3 fetchIntervalMs:(double)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ProcessExitFetcher;
  v8 = [(ProcessExitFetcher *)&v19 init];
  v9 = v8;
  if (v8)
  {
    id processExitHandler = v8->_processExitHandler;
    v8->_id processExitHandler = 0;

    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    processExitRecords = v9->_processExitRecords;
    v9->_processExitRecords = v11;

    objc_storeStrong((id *)&v9->_launchServiceMonitorID, a3);
    v9->_launchServiceMaxRecordCount = 128;
    v9->_fetchIntervalMs = a4;
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.HangHUD.procExitfetchTimer", v13);
    timerQueue = v9->_timerQueue;
    v9->_timerQueue = (OS_dispatch_queue *)v14;

    v16 = (NSCache *)objc_alloc_init((Class)NSCache);
    bundleIdToProcessNameCache = v9->_bundleIdToProcessNameCache;
    v9->_bundleIdToProcessNameCache = v16;

    [(NSCache *)v9->_bundleIdToProcessNameCache setCountLimit:100];
  }

  return v9;
}

- (id)getProcessExitRecordFetchQueue
{
  if (qword_10003EA48 != -1) {
    dispatch_once(&qword_10003EA48, &stru_100031950);
  }
  v2 = (void *)qword_10003EA40;

  return v2;
}

- (void)fetchProcessExitInfo
{
  uint64_t v31 = 0;
  uint64_t v3 = mach_absolute_time();
  [(NSString *)self->_launchServiceMonitorID UTF8String];
  int v4 = _launch_service_stats_copy_impl();
  uint64_t v5 = mach_absolute_time();
  if (v4)
  {
    v6 = sub_10000E760();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = strerror(v4);
      sub_10001D41C((uint64_t)v7, buf, v4, v6);
    }
  }
  else
  {
    uint64_t v8 = v5;
    [(NSMutableArray *)self->_processExitRecords removeAllObjects];
    v6 = objc_alloc_init((Class)NSMutableDictionary);
    if (v31)
    {
      v9 = 0;
      unint64_t v10 = 0;
      unint64_t v30 = v8 - v3;
      do
      {
        v11 = +[NSString stringWithCString:xpc_array_get_string(0, *v9) encoding:1];
        v12 = [(ProcessExitFetcher *)self processNameToDisplayForBundleID:v11];
        double v13 = sub_10001B47C(*(void *)(v9 + 1));
        double v14 = sub_10001B47C(*(void *)(v9 + 3));
        v15 = [HTProcessLaunchExitRecord alloc];
        LOWORD(v29) = *(_WORD *)((char *)v9 + 49);
        v16 = [(HTProcessLaunchExitRecord *)v15 initWithInfo:v12 pid:v9[5] spawnTimestamp:(unint64_t)v13 exitTimestamp:(unint64_t)v14 exitReasonCode:*(void *)((char *)v9 + 29) exitReasonNamespace:*((unsigned __int8 *)v9 + 28) jetsam_priority:v29];
        v17 = sub_10000E760();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          double v25 = sub_10001B3C0(v30);
          id v26 = [(HTProcessLaunchExitRecord *)v16 exitReasonCode];
          unsigned int v27 = [(HTProcessLaunchExitRecord *)v16 exitReasonNamespace];
          *(_DWORD *)buf = 138413058;
          v33 = v12;
          __int16 v34 = 2048;
          double v35 = v25;
          __int16 v36 = 2048;
          id v37 = v26;
          __int16 v38 = 1024;
          unsigned int v39 = v27;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, " Process %@ exited - Fetch duration is : %f MS, reasonCode:%llu, exitReasonNamespce:%i", buf, 0x26u);
        }

        v18 = [v6 objectForKey:v12];
        BOOL v19 = v18 == 0;

        if (v19)
        {
          [v6 setObject:&off_100035BA0 forKeyedSubscript:v12];
        }
        else
        {
          v20 = [v6 objectForKeyedSubscript:v12];
          v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v20 integerValue] + 1);
          [v6 setObject:v21 forKeyedSubscript:v12];
        }
        v22 = +[ProcessExitScreener sharedInstance];
        unsigned int v23 = [v22 isProcessExitRecordAllowed:v16];

        if (v23)
        {
          v24 = sub_10000E760();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Adding process exit with process name %@", buf, 0xCu);
          }

          [(NSMutableArray *)self->_processExitRecords addObject:v16];
        }

        ++v10;
        v9 = (unsigned int *)((char *)v9 + 51);
      }
      while (v10 < v31);
      if (v31)
      {
        v28 = sub_10000E760();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_10001D2F0((uint64_t)v6, v28);
        }
      }
    }
  }
}

- (id)processNameToDisplayForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSCache *)self->_bundleIdToProcessNameCache objectForKey:v4];
  if (!v5)
  {
    id v11 = 0;
    id v6 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v11];
    id v7 = v11;
    if (v7)
    {
      uint64_t v5 = [(ProcessExitFetcher *)self extractProcessNameToDisplayFromBundleID:v4];
    }
    else
    {
      uint64_t v8 = +[HUDConfiguration sharedInstance];
      v9 = [v8 thirdPartyDevPreferredLanguages];

      if ([v9 count]) {
        [v6 localizedNameWithPreferredLocalizations:v9];
      }
      else {
      uint64_t v5 = [v6 localizedName];
      }
    }
    [(NSCache *)self->_bundleIdToProcessNameCache setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)extractProcessNameToDisplayFromBundleID:(id)a3
{
  uint64_t v3 = [a3 componentsSeparatedByString:@"."];
  id v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", (char *)objc_msgSend(v3, "count") - 1);
  uint64_t v5 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @"[({<");
  id v6 = [v4 rangeOfCharacterFromSet:v5];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v4 substringToIndex:v6];

    id v4 = (void *)v7;
  }

  return v4;
}

- (void)kickOffFetchTimer
{
  if (!self->_fetchTimer)
  {
    [(NSString *)self->_launchServiceMonitorID UTF8String];
    int v3 = launch_service_stats_enable();
    id v4 = sub_10000E760();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10001D4AC(v3, v4);
    }

    uint64_t v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_timerQueue);
    fetchTimer = self->_fetchTimer;
    self->_fetchTimer = v5;

    dispatch_time_t v7 = dispatch_time(0, 0);
    dispatch_source_set_timer((dispatch_source_t)self->_fetchTimer, v7, (unint64_t)(self->_fetchIntervalMs * 1000000.0), (unint64_t)(self->_fetchIntervalMs * 1000000.0) / 0xA);
    uint64_t v8 = self->_fetchTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100014B44;
    handler[3] = &unk_100030668;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    v9 = sub_10000E760();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10001D474(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    dispatch_resume((dispatch_object_t)self->_fetchTimer);
  }
}

- (void)stopFetchTimer
{
  if (self->_fetchTimer)
  {
    int v3 = sub_10000E760();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10001D53C(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    dispatch_source_cancel((dispatch_source_t)self->_fetchTimer);
    fetchTimer = self->_fetchTimer;
    self->_fetchTimer = 0;

    [(NSString *)self->_launchServiceMonitorID UTF8String];
    launch_service_stats_disable();
  }
}

- (id)processExitHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setProcessExitHandler:(id)a3
{
}

- (NSMutableArray)processExitRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProcessExitRecords:(id)a3
{
}

- (NSString)launchServiceMonitorID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLaunchServiceMonitorID:(id)a3
{
}

- (int64_t)launchServiceMaxRecordCount
{
  return self->_launchServiceMaxRecordCount;
}

- (void)setLaunchServiceMaxRecordCount:(int64_t)a3
{
  self->_launchServiceMaxRecordCount = a3;
}

- (double)fetchIntervalMs
{
  return self->_fetchIntervalMs;
}

- (void)setFetchIntervalMs:(double)a3
{
  self->_fetchIntervalMs = a3;
}

- (OS_dispatch_source)fetchTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFetchTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchTimer, 0);
  objc_storeStrong((id *)&self->_launchServiceMonitorID, 0);
  objc_storeStrong((id *)&self->_processExitRecords, 0);
  objc_storeStrong(&self->_processExitHandler, 0);
  objc_storeStrong((id *)&self->_bundleIdToProcessNameCache, 0);

  objc_storeStrong((id *)&self->_timerQueue, 0);
}

@end