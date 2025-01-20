@interface GSSystemResourcesManager
+ (id)manager;
- (BOOL)isPowerOK;
- (GSSystemResourcesManager)init;
- (unsigned)deviceLowSpaceFlags:(int)a3;
- (void)_didReceiveMemoryWarning;
- (void)_initLowDiskManager;
- (void)_initLowMemory;
- (void)_initPowerManager;
- (void)_invalidateLowDiskManager;
- (void)_invalidateLowMemory;
- (void)_invalidatePowerManager;
- (void)_processLowDiskNotification:(BOOL)a3;
- (void)_resetLowDiskManager;
- (void)_resetPowerManager;
- (void)_setPowerLevel:(BOOL)a3;
- (void)_setPowerLevelWithCoalescing:(BOOL)a3;
- (void)addLowDiskObserver:(id)a3 forDevice:(int)a4;
- (void)addLowMemoryObserver:(id)a3;
- (void)addPowerObserver:(id)a3;
- (void)close;
- (void)dealloc;
- (void)removeLowDiskObserver:(id)a3 forDevice:(int)a4;
- (void)removeLowMemoryObserver:(id)a3;
- (void)removePowerObserver:(id)a3;
- (void)reset;
@end

@implementation GSSystemResourcesManager

+ (id)manager
{
  if (qword_10004CF08 != -1) {
    dispatch_once(&qword_10004CF08, &stru_1000415C0);
  }
  v2 = (void *)qword_10004CF00;
  return v2;
}

- (GSSystemResourcesManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)GSSystemResourcesManager;
  v2 = [(GSSystemResourcesManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.revisiond.system-resources", v3);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v4;

    [(GSSystemResourcesManager *)v2 _initPowerManager];
    [(GSSystemResourcesManager *)v2 _initLowDiskManager];
    [(GSSystemResourcesManager *)v2 _initLowMemory];
    v6 = sub_100002D4C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      id v8 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] [%@] has been initialized", buf, 0xCu);
    }
  }
  return v2;
}

- (void)close
{
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D1A4;
  block[3] = &unk_100040B00;
  block[4] = self;
  dispatch_sync(notificationQueue, block);
}

- (void)dealloc
{
  [(GSSystemResourcesManager *)self close];
  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = 0;

  v4.receiver = self;
  v4.super_class = (Class)GSSystemResourcesManager;
  [(GSSystemResourcesManager *)&v4 dealloc];
}

- (void)reset
{
  [(GSSystemResourcesManager *)self _resetPowerManager];
  [(GSSystemResourcesManager *)self _resetLowDiskManager];
  v3 = sub_100002D4C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] [%@] has been reset", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_initPowerManager
{
  self->_powerLevelOK = 1;
  v3 = +[NSHashTable weakObjectsHashTable];
  powerObservers = self->_powerObservers;
  self->_powerObservers = v3;

  notificationQueue = self->_notificationQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001D454;
  handler[3] = &unk_1000415E8;
  handler[4] = self;
  notify_register_dispatch("com.apple.system.powermanagement.SystemLoadAdvisory", &self->_powerNotifyToken, notificationQueue, handler);
  [(GSSystemResourcesManager *)self _resetPowerManager];
}

- (void)_invalidatePowerManager
{
  notify_cancel(self->_powerNotifyToken);
  self->_powerNotifyToken = 0;
  powerObservers = self->_powerObservers;
  self->_powerObservers = 0;
}

- (void)_resetPowerManager
{
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D5B8;
  block[3] = &unk_100040B00;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (BOOL)isPowerOK
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  notificationQueue = self->_notificationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D6C8;
  v5[3] = &unk_100041610;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(notificationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setPowerLevelWithCoalescing:(BOOL)a3
{
  int v5 = +[GSUserDefaults defaults];
  [v5 doubleForKey:@"system.power" min:0.001 max:172800.0 byDefault:1.0];
  double v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  if (a3)
  {
    powerLevelOKTimer = self->_powerLevelOKTimer;
    if (self->_powerLevelOK)
    {
      if (powerLevelOKTimer)
      {
        dispatch_source_cancel(powerLevelOKTimer);
        char v9 = self->_powerLevelOKTimer;
        self->_powerLevelOKTimer = 0;
      }
    }
    else if (!powerLevelOKTimer)
    {
      v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_notificationQueue);
      dispatch_time_t v13 = dispatch_time(0, (unint64_t)(v7 * 1000000000.0));
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(unint64_t)(v7 * 1000000000.0) / 10);

      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10001D894;
      handler[3] = &unk_100040B00;
      handler[4] = self;
      dispatch_source_set_event_handler(v12, handler);
      v14 = self->_powerLevelOKTimer;
      self->_powerLevelOKTimer = (OS_dispatch_source *)v12;
      v15 = v12;

      dispatch_resume(v15);
    }
  }
  else
  {
    objc_super v10 = self->_powerLevelOKTimer;
    if (v10)
    {
      dispatch_source_cancel(v10);
      v11 = self->_powerLevelOKTimer;
      self->_powerLevelOKTimer = 0;
    }
    if (self->_powerLevelOK) {
      [(GSSystemResourcesManager *)self _setPowerLevel:0];
    }
  }
}

- (void)_setPowerLevel:(BOOL)a3
{
  BOOL v3 = a3;
  powerLevelOKTimer = self->_powerLevelOKTimer;
  if (powerLevelOKTimer)
  {
    dispatch_source_cancel(powerLevelOKTimer);
    double v6 = self->_powerLevelOKTimer;
    self->_powerLevelOKTimer = 0;
  }
  self->_powerLevelOK = v3;
  double v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = "bad";
    if (v3) {
      uint64_t v8 = "good";
    }
    *(_DWORD *)buf = 136315138;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] Power level really becomes %s", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v9 = self->_powerObservers;
  id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      dispatch_time_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v13), "powerLevelChanged:", v3, (void)v14);
        dispatch_time_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)addPowerObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DAB4;
  v7[3] = &unk_100041638;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

- (void)removePowerObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DC34;
  v7[3] = &unk_100041638;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

- (void)_initLowDiskManager
{
  BOOL v3 = (NSMutableSet *)objc_opt_new();
  lowDiskSet = self->_lowDiskSet;
  self->_lowDiskSet = v3;

  int v5 = (NSMutableDictionary *)objc_opt_new();
  lowDiskDict = self->_lowDiskDict;
  self->_lowDiskDict = v5;

  double v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vfs, 0, 0x304uLL, (dispatch_queue_t)self->_notificationQueue);
  lowDiskSource = self->_lowDiskSource;
  self->_lowDiskSource = v7;

  char v9 = self->_lowDiskSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001DDC0;
  handler[3] = &unk_100040B00;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_lowDiskSource);
}

- (void)_invalidateLowDiskManager
{
  lowDiskTimer = self->_lowDiskTimer;
  if (lowDiskTimer)
  {
    dispatch_source_cancel(lowDiskTimer);
    id v4 = self->_lowDiskTimer;
    self->_lowDiskTimer = 0;
  }
  lowDiskSource = self->_lowDiskSource;
  if (lowDiskSource)
  {
    dispatch_source_cancel(lowDiskSource);
    id v6 = self->_lowDiskSource;
    self->_lowDiskSource = 0;
  }
  lowDiskDict = self->_lowDiskDict;
  self->_lowDiskDict = 0;

  lowDiskSet = self->_lowDiskSet;
  self->_lowDiskSet = 0;
}

- (void)_resetLowDiskManager
{
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E064;
  block[3] = &unk_100040B00;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void)_processLowDiskNotification:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  lowDiskDict = self->_lowDiskDict;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001E0FC;
  v6[3] = &unk_100041660;
  v6[4] = self;
  BOOL v7 = a3;
  [(NSMutableDictionary *)lowDiskDict enumerateKeysAndObjectsUsingBlock:v6];
}

- (unsigned)deviceLowSpaceFlags:(int)a3
{
  return sub_10001E2F4(a3);
}

- (void)addLowDiskObserver:(id)a3 forDevice:(int)a4
{
  id v6 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E498;
  block[3] = &unk_100041688;
  int v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(notificationQueue, block);
}

- (void)removeLowDiskObserver:(id)a3 forDevice:(int)a4
{
  id v6 = a3;
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E6F0;
  block[3] = &unk_100041688;
  int v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(notificationQueue, block);
}

- (void)_initLowMemory
{
  BOOL v3 = +[NSHashTable weakObjectsHashTable];
  lowMemoryObservers = self->_lowMemoryObservers;
  self->_lowMemoryObservers = v3;

  if (self->_memoryNotificationEventSource) {
    sub_10002BC90();
  }
  int v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 6uLL, (dispatch_queue_t)self->_notificationQueue);
  memoryNotificationEventSource = self->_memoryNotificationEventSource;
  self->_memoryNotificationEventSource = v5;

  BOOL v7 = self->_memoryNotificationEventSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001E8F4;
  handler[3] = &unk_100040B00;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_memoryNotificationEventSource);
}

- (void)_invalidateLowMemory
{
  lowMemoryObservers = self->_lowMemoryObservers;
  self->_lowMemoryObservers = 0;

  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E984;
  block[3] = &unk_100040B00;
  block[4] = self;
  dispatch_sync(notificationQueue, block);
}

- (void)_didReceiveMemoryWarning
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_notificationQueue);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  BOOL v3 = self->_lowMemoryObservers;
  id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "didReceiveMemoryWarning", (void)v8);
        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)addLowMemoryObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001EB5C;
  v7[3] = &unk_100041638;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

- (void)removeLowMemoryObserver:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001EC00;
  v7[3] = &unk_100041638;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(notificationQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);
  objc_storeStrong((id *)&self->_lowMemoryObservers, 0);
  objc_storeStrong((id *)&self->_lowDiskTimer, 0);
  objc_storeStrong((id *)&self->_lowDiskSource, 0);
  objc_storeStrong((id *)&self->_lowDiskDict, 0);
  objc_storeStrong((id *)&self->_lowDiskSet, 0);
  objc_storeStrong((id *)&self->_powerLevelOKTimer, 0);
  objc_storeStrong((id *)&self->_powerObservers, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end