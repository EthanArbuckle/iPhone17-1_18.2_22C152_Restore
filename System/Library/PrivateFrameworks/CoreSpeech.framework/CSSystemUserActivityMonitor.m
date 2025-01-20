@interface CSSystemUserActivityMonitor
+ (id)sharedInstance;
- (CSSystemUserActivityMonitor)init;
- (OS_dispatch_queue)workQueue;
- (int)systemUserActivityNotificationToken;
- (int64_t)systemUserActivityState;
- (int64_t)userActivityStatus;
- (void)_fetchSystemUserActivityState;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)dealloc;
- (void)setSystemUserActivityNotificationToken:(int)a3;
- (void)setUserActivityStatus:(int64_t)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CSSystemUserActivityMonitor

- (void).cxx_destruct
{
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setUserActivityStatus:(int64_t)a3
{
  self->_userActivityStatus = a3;
}

- (int64_t)userActivityStatus
{
  return self->_userActivityStatus;
}

- (void)setSystemUserActivityNotificationToken:(int)a3
{
  self->_systemUserActivityNotificationToken = a3;
}

- (int)systemUserActivityNotificationToken
{
  return self->_systemUserActivityNotificationToken;
}

- (int64_t)systemUserActivityState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  workQueue = self->_workQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000153D4;
  v5[3] = &unk_100253A90;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_fetchSystemUserActivityState
{
  int64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CSSystemUserActivityMonitor _fetchSystemUserActivityState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  int systemUserActivityNotificationToken = self->_systemUserActivityNotificationToken;
  if (systemUserActivityNotificationToken == -1)
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSSystemUserActivityMonitor _fetchSystemUserActivityState]";
    __int16 v15 = 1024;
    LODWORD(v16) = -1;
    v7 = "%s Invalid notification token %d";
    uint64_t v8 = v10;
    uint32_t v9 = 18;
    goto LABEL_9;
  }
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(systemUserActivityNotificationToken, &state64);
  uint64_t v6 = CSLogContextFacilityCoreSpeech;
  if (state)
  {
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    v14 = "-[CSSystemUserActivityMonitor _fetchSystemUserActivityState]";
    v7 = "%s Failed to fetch user idle activity state";
    uint64_t v8 = v6;
    uint32_t v9 = 12;
LABEL_9:
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
    return;
  }
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSSystemUserActivityMonitor _fetchSystemUserActivityState]";
    __int16 v15 = 2048;
    uint64_t v16 = state64;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Current user activity: %llu", buf, 0x16u);
  }
  self->_userActivityStatus = state64 != 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100015650;
  v11[3] = &unk_100253A08;
  v11[4] = self;
  [(CSSystemUserActivityMonitor *)self enumerateObserversInQueue:v11];
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015774;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)_stopMonitoring
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015AA8;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)dealloc
{
  [(CSSystemUserActivityMonitor *)self _stopMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)CSSystemUserActivityMonitor;
  [(CSSystemUserActivityMonitor *)&v3 dealloc];
}

- (CSSystemUserActivityMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSSystemUserActivityMonitor;
  v2 = [(CSSystemUserActivityMonitor *)&v7 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_int systemUserActivityNotificationToken = -1;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.corespeech.CSSystemUserActivityMonitor", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_1002A3588 != -1) {
    dispatch_once(&qword_1002A3588, &stru_10024E5D8);
  }
  v2 = (void *)qword_1002A3580;
  return v2;
}

@end