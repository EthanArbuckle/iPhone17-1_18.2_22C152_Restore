@interface ATSACCAPlugin
+ (id)sharedPlugin;
- (ATSACCAPlugin)init;
- (void)addClockWithIdentifier:(unint64_t)a3;
- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3;
- (void)interruptedConnectionForClockManager:(id)a3;
- (void)removeClockWithIdentifier:(unint64_t)a3 force:(BOOL)a4;
- (void)setupIOKitMatching;
@end

@implementation ATSACCAPlugin

+ (id)sharedPlugin
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_31C0;
  block[3] = &unk_C360;
  block[4] = a1;
  if (qword_11228 != -1) {
    dispatch_once(&qword_11228, block);
  }
  v2 = (void *)_sharedPlugin;

  return v2;
}

- (ATSACCAPlugin)init
{
  v13.receiver = self;
  v13.super_class = (Class)ATSACCAPlugin;
  v2 = [(ATSACCAPlugin *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_interruptionLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clockDevices = v3->_clockDevices;
    v3->_clockDevices = v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.audio.AppleTimeSyncAudioClock.create", 0);
    clockAdminQueue = v3->_clockAdminQueue;
    v3->_clockAdminQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.audio.AppleTimeSyncAudioClock.matching", 0);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.audio.AppleTimeSyncAudioClock.processing", 0);
    processQueue = v3->_processQueue;
    v3->_processQueue = (OS_dispatch_queue *)v10;
  }
  return v3;
}

- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATSACCAPlugin;
  [(ATSACCAPlugin *)&v5 halInitializeWithPluginHost:a3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_337C;
  v4[3] = &unk_C388;
  v4[4] = self;
  +[TSClockManager notifyWhenClockManagerIsAvailable:v4];
}

- (void)setupIOKitMatching
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ATSAC setupIOKitMatching", (uint8_t *)buf, 2u);
  }
  os_unfair_lock_lock(&self->_interruptionLock);
  v3 = (IOKNotificationPort *)[objc_alloc((Class)IOKNotificationPort) initOnDispatchQueue:self->_callbackQueue];
  notificationPort = self->_notificationPort;
  self->_notificationPort = v3;

  objc_initWeak(buf, self);
  objc_super v5 = +[IOKService serviceMatching:@"IOTimeSyncService"];
  uint64_t v6 = IOKMatchedNotification;
  v7 = self->_notificationPort;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_36D8;
  v19[3] = &unk_C3D8;
  v19[4] = self;
  objc_copyWeak(&v20, buf);
  dispatch_queue_t v8 = +[IOKService addNotificationOfType:v6 forMatching:v5 usingNotificationPort:v7 error:0 withEnumerationBlock:v19];
  arrivalNotification = self->_arrivalNotification;
  self->_arrivalNotification = v8;

  dispatch_queue_t v10 = +[IOKService serviceMatching:@"IOTimeSyncService"];
  uint64_t v11 = IOKTerminatedNotification;
  v12 = self->_notificationPort;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_3A30;
  v17[3] = &unk_C3D8;
  v17[4] = self;
  objc_copyWeak(&v18, buf);
  objc_super v13 = +[IOKService addNotificationOfType:v11 forMatching:v10 usingNotificationPort:v12 error:0 withEnumerationBlock:v17];
  depatureNotification = self->_depatureNotification;
  self->_depatureNotification = v13;

  callbackQueue = self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3D8C;
  block[3] = &unk_C388;
  block[4] = self;
  dispatch_async((dispatch_queue_t)callbackQueue, block);
  os_unfair_lock_unlock(&self->_interruptionLock);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(buf);
}

- (void)interruptedConnectionForClockManager:(id)a3
{
  v4 = dispatch_get_global_queue(33, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3E80;
  block[3] = &unk_C388;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)addClockWithIdentifier:(unint64_t)a3
{
  clockAdminQueue = self->_clockAdminQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4390;
  v4[3] = &unk_C428;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync((dispatch_queue_t)clockAdminQueue, v4);
}

- (void)removeClockWithIdentifier:(unint64_t)a3 force:(BOOL)a4
{
  clockAdminQueue = self->_clockAdminQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_45E0;
  block[3] = &unk_C450;
  block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_sync((dispatch_queue_t)clockAdminQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_depatureNotification, 0);
  objc_storeStrong((id *)&self->_arrivalNotification, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);
  objc_storeStrong((id *)&self->_clockDevices, 0);

  objc_storeStrong((id *)&self->_clockAdminQueue, 0);
}

@end