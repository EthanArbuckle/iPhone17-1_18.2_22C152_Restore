@interface CRPowerMonitor
+ (id)sharedMonitor;
- (BOOL)isLocked;
- (CRPowerMonitor)init;
- (void)_updateLockStateWithToken:(int)a3;
- (void)dealloc;
@end

@implementation CRPowerMonitor

+ (id)sharedMonitor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001535C;
  block[3] = &unk_10002CA48;
  block[4] = a1;
  if (qword_100034520 != -1) {
    dispatch_once(&qword_100034520, block);
  }
  return (id)qword_100034518;
}

- (CRPowerMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRPowerMonitor;
  id v2 = [(CRPowerMonitor *)&v8 init];
  if (v2)
  {
    __int16 v7 = 0;
    SBSSpringBoardServerPort();
    SBGetScreenLockStatus();
    *((unsigned char *)v2 + 12) = 0;
    *((void *)v2 + 2) = dispatch_queue_create("com.apple.corerecents.sblockqueue", 0);
    objc_initWeak(&location, v2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000154BC;
    handler[3] = &unk_10002D338;
    objc_copyWeak(&v5, &location);
    if (notify_register_dispatch(kSBSLockStateNotifyKey, (int *)v2 + 2, *((dispatch_queue_t *)v2 + 2), handler)) {
      *((_DWORD *)v2 + 2) = -1;
    }
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return (CRPowerMonitor *)v2;
}

- (void)dealloc
{
  int lockNotifyToken = self->_lockNotifyToken;
  if (lockNotifyToken != -1) {
    notify_cancel(lockNotifyToken);
  }

  v4.receiver = self;
  v4.super_class = (Class)CRPowerMonitor;
  [(CRPowerMonitor *)&v4 dealloc];
}

- (void)_updateLockStateWithToken:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = self->_lockState == 0;
  uint64_t v11 = 0;
  notify_get_state(a3, &v11);
  uint64_t v7 = v11;
  BOOL v6 = v11 == 0;
  self->_lockState = v11;
  int v8 = !v6;
  if (((v5 ^ v8) & 1) == 0)
  {
    BOOL v9 = v7 != 0;
    v10 = +[NSNotificationCenter defaultCenter];
    CFStringRef v12 = @"CRPowerMonitorDeviceLockedStateKey";
    v13 = +[NSNumber numberWithBool:v9];
    [(NSNotificationCenter *)v10 postNotificationName:@"CRPowerMonitorDeviceWillLockNotification" object:self userInfo:+[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1]];
  }
}

- (BOOL)isLocked
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015704;
  v5[3] = &unk_10002CAF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end