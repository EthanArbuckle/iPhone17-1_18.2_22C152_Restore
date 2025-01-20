@interface PHInCallOrientationMonitor
+ (id)sharedInstance;
- (BKSAccelerometer)accelerometer;
- (BOOL)isOrientationLocked;
- (BOOL)isSpringBoardInterfaceOrientationLocked;
- (PHInCallOrientationMonitor)init;
- (int64_t)activeInterfaceOrientation;
- (int64_t)currentOrientation;
- (int64_t)deviceOrientation;
- (int64_t)lastValidOrientation;
- (int64_t)lockedOrientation;
- (int64_t)springBoardLockedInterfaceOrientation;
- (void)_updateCachedOrientationValues;
- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4;
- (void)dealloc;
- (void)setCurrentOrientation:(int64_t)a3;
- (void)setIsOrientationLocked:(BOOL)a3;
- (void)setLastValidOrientation:(int64_t)a3;
- (void)setLockedOrientation:(int64_t)a3;
- (void)setOrientationEventsEnabled:(BOOL)a3;
@end

@implementation PHInCallOrientationMonitor

+ (id)sharedInstance
{
  if (qword_100326310 != -1) {
    dispatch_once(&qword_100326310, &stru_1002D05D8);
  }
  v2 = (void *)qword_100326308;

  return v2;
}

- (PHInCallOrientationMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHInCallOrientationMonitor;
  v2 = [(PHInCallOrientationMonitor *)&v7 init];
  if (v2)
  {
    v3 = (BKSAccelerometer *)objc_alloc_init((Class)BKSAccelerometer);
    accelerometer = v2->_accelerometer;
    v2->_accelerometer = v3;

    [(BKSAccelerometer *)v2->_accelerometer setDelegate:v2];
    [(PHInCallOrientationMonitor *)v2 _updateCachedOrientationValues];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000D6FE0, @"com.apple.backboardd.orientationlock", 0, CFNotificationSuspensionBehaviorDrop);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:0];
  [(BKSAccelerometer *)self->_accelerometer setPassiveOrientationEvents:1];
  [(BKSAccelerometer *)self->_accelerometer setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)PHInCallOrientationMonitor;
  [(PHInCallOrientationMonitor *)&v4 dealloc];
}

- (void)_updateCachedOrientationValues
{
  if ([(PHInCallOrientationMonitor *)self isSpringBoardInterfaceOrientationLocked])
  {
    self->_lockedOrientation = [(PHInCallOrientationMonitor *)self springBoardLockedInterfaceOrientation];
    self->_isOrientationLocked = 1;
  }
}

- (void)setOrientationEventsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setOrientationEventsEnabled: %d", (uint8_t *)v7, 8u);
  }

  [(BKSAccelerometer *)self->_accelerometer setOrientationEventsEnabled:v3];
  uint64_t v6 = v3 ^ 1;
  [(BKSAccelerometer *)self->_accelerometer setPassiveOrientationEvents:v6];
  if ((v6 & 1) == 0) {
    [(PHInCallOrientationMonitor *)self _updateCachedOrientationValues];
  }
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  uint64_t v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    CFStringRef v17 = [(PHInCallOrientationMonitor *)self currentOrientation];
    __int16 v18 = 2048;
    int64_t v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "accelerometer orientation change from %ld to %ld", buf, 0x16u);
  }

  [(PHInCallOrientationMonitor *)self setCurrentOrientation:a4];
  objc_super v7 = +[PHPIPController defaultPIPController];
  unsigned int v8 = [v7 isPipped];

  if (![(PHInCallOrientationMonitor *)self isOrientationLocked] || v8)
  {
    v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v17 = @"PHInCallOrientationEventNotification";
      __int16 v18 = 2048;
      int64_t v19 = a4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "posting %@ for orientation: %ld", buf, 0x16u);
    }

    v10 = +[NSNotificationCenter defaultCenter];
    v11 = +[NSNumber numberWithInteger:a4, @"kPHInCallOrientationType"];
    v14[1] = @"kPHLastValidInCallOrientationType";
    v15[0] = v11;
    v12 = +[NSNumber numberWithInteger:[(PHInCallOrientationMonitor *)self lastValidOrientation]];
    v15[1] = v12;
    v13 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v10 postNotificationName:@"PHInCallOrientationEventNotification" object:0 userInfo:v13];
  }
}

- (int64_t)currentOrientation
{
  if (![(PHInCallOrientationMonitor *)self isOrientationLocked]) {
    return self->_currentOrientation;
  }
  BOOL v3 = +[UIApplication sharedApplication];
  objc_super v4 = [v3 delegate];
  unsigned int v5 = [v4 isPresentingAmbient];
  uint64_t v6 = 40;
  if (v5) {
    uint64_t v6 = 16;
  }
  int64_t v7 = *(int64_t *)((char *)&self->super.isa + v6);

  return v7;
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
  if ((unint64_t)(a3 - 1) <= 3) {
    -[PHInCallOrientationMonitor setLastValidOrientation:](self, "setLastValidOrientation:");
  }
}

- (int64_t)lastValidOrientation
{
  if ([(PHInCallOrientationMonitor *)self isOrientationLocked])
  {
    BOOL v3 = +[UIApplication sharedApplication];
    objc_super v4 = [v3 delegate];
    unsigned __int8 v5 = [v4 isPresentingAmbient];

    if ((v5 & 1) == 0) {
      self->_lastValidOrientation = [(PHInCallOrientationMonitor *)self lockedOrientation];
    }
  }
  int64_t result = self->_lastValidOrientation;
  if (!result)
  {
    int64_t result = [(PHInCallOrientationMonitor *)self deviceOrientation];
    self->_lastValidOrientation = result;
  }
  if ((unint64_t)(result - 1) >= 4)
  {
    int64_t v7 = (void *)UIApp;
    return (int64_t)_[v7 statusBarOrientation];
  }
  return result;
}

- (int64_t)deviceOrientation
{
  v2 = +[UIApplication sharedApplication];
  BOOL v3 = [v2 delegate];
  objc_super v4 = [v3 currentInCallScene];
  id v5 = [v4 interfaceOrientation];

  return (int64_t)v5;
}

- (int64_t)activeInterfaceOrientation
{
  if (+[PHUIConfiguration canAutoRotateInCallUIForFaceTime])
  {
    if ([(PHInCallOrientationMonitor *)self isOrientationLocked])
    {
      int64_t lockedOrientation = self->_lockedOrientation;
      objc_super v4 = sub_1000D5130();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 67109120;
        int v8 = lockedOrientation;
        id v5 = "activeInterfaceOrientation: device allows UI rotation and is orientation locked to %d";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 8u);
      }
    }
    else
    {
      int64_t lockedOrientation = BKHIDServicesGetNonFlatDeviceOrientation();
      objc_super v4 = sub_1000D5130();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 67109120;
        int v8 = lockedOrientation;
        id v5 = "activeInterfaceOrientation: device allows UI rotation and the last flat orientation was %d";
        goto LABEL_10;
      }
    }
  }
  else
  {
    objc_super v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "activeInterfaceOrientation: we'll default to UIInterfaceOrientationPortrait", (uint8_t *)&v7, 2u);
    }
    int64_t lockedOrientation = 1;
  }

  return lockedOrientation;
}

- (BOOL)isSpringBoardInterfaceOrientationLocked
{
  if (byte_10032631C) {
    goto LABEL_2;
  }
  if (!notify_register_check("com.apple.backboardd.orientationlock", &dword_100326318))
  {
    byte_10032631C = 1;
LABEL_2:
    uint64_t state64 = 0;
    goto LABEL_3;
  }
  uint64_t state64 = 0;
  if (!byte_10032631C) {
    return 0;
  }
LABEL_3:
  notify_get_state(dword_100326318, &state64);
  return state64 != 0;
}

- (int64_t)springBoardLockedInterfaceOrientation
{
  if (byte_100326324) {
    goto LABEL_2;
  }
  if (!notify_register_check("com.apple.backboardd.orientation", &dword_100326320))
  {
    byte_100326324 = 1;
LABEL_2:
    uint64_t state64 = 1;
LABEL_3:
    notify_get_state(dword_100326320, &state64);
    return state64;
  }
  int64_t result = 1;
  uint64_t state64 = 1;
  if (byte_100326324) {
    goto LABEL_3;
  }
  return result;
}

- (void)setIsOrientationLocked:(BOOL)a3
{
  if (self->_isOrientationLocked != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v15 = v3;
      __int16 v16 = 2048;
      int64_t v17 = [(PHInCallOrientationMonitor *)self lockedOrientation];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "set orientation locked: %d to orientation: %ld", buf, 0x12u);
    }

    self->_isOrientationLocked = v3;
    uint64_t v6 = +[NSNotificationCenter defaultCenter];
    if (v3)
    {
      int v7 = +[NSNumber numberWithInteger:[(PHInCallOrientationMonitor *)self lockedOrientation]];
      v11 = v7;
      int v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      [v6 postNotificationName:@"PHInCallOrientationEventNotification" object:0 userInfo:v8];
    }
    else
    {
      v12[0] = @"kPHInCallOrientationType";
      int v7 = +[NSNumber numberWithInteger:[(PHInCallOrientationMonitor *)self currentOrientation]];
      v12[1] = @"kPHLastValidInCallOrientationType";
      v13[0] = v7;
      int v8 = +[NSNumber numberWithInteger:[(PHInCallOrientationMonitor *)self lastValidOrientation]];
      v13[1] = v8;
      v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
      [v6 postNotificationName:@"PHInCallOrientationEventNotification" object:0 userInfo:v9];
    }
  }
}

- (void)setLastValidOrientation:(int64_t)a3
{
  self->_lastValidOrientation = a3;
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (int64_t)lockedOrientation
{
  return self->_lockedOrientation;
}

- (void)setLockedOrientation:(int64_t)a3
{
  self->_int64_t lockedOrientation = a3;
}

- (BOOL)isOrientationLocked
{
  return self->_isOrientationLocked;
}

- (void).cxx_destruct
{
}

@end