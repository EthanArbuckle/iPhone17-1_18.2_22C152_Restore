@interface AppDeletionUISOSState
+ (id)sharedInstance;
- (AppDeletionUISOSState)init;
- (BOOL)sosIsAvailable;
- (CTStewieStateMonitor)monitor;
- (OS_dispatch_queue)internalQueue;
@end

@implementation AppDeletionUISOSState

- (AppDeletionUISOSState)init
{
  v9.receiver = self;
  v9.super_class = (Class)AppDeletionUISOSState;
  v2 = [(AppDeletionUISOSState *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AppDeletionUIHost.AppDeletionUICTStewieStateMonitorDelegate.internal", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    v6 = (CTStewieStateMonitor *)[objc_alloc((Class)CTStewieStateMonitor) initWithDelegate:v2 queue:v2->_internalQueue];
    monitor = v2->_monitor;
    v2->_monitor = v6;

    [(CTStewieStateMonitor *)v2->_monitor start];
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000046C0;
  block[3] = &unk_100010328;
  block[4] = a1;
  if (qword_1000175B8 != -1) {
    dispatch_once(&qword_1000175B8, block);
  }
  v2 = (void *)qword_1000175B0;

  return v2;
}

- (BOOL)sosIsAvailable
{
  v2 = [(AppDeletionUISOSState *)self monitor];
  v3 = [v2 getState];

  unsigned int v4 = [v3 isPermittedAtCurrentLocation:1];
  v5 = sub_1000072E4((uint64_t)off_100017300);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      int v6 = 89;
    }
    else {
      int v6 = 78;
    }
    int v8 = 136315394;
    objc_super v9 = "-[AppDeletionUISOSState sosIsAvailable]";
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: CTStewieStateMonitor returned %c for SOS state", (uint8_t *)&v8, 0x12u);
  }

  return v4;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (CTStewieStateMonitor)monitor
{
  return self->_monitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end