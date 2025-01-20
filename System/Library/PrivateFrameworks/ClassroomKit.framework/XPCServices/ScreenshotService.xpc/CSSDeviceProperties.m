@interface CSSDeviceProperties
- (BOOL)isLocked;
- (BOOL)isScreenOn;
- (CSSDeviceProperties)init;
- (int)lockedNotificationToken;
- (int)screenStateNotificationToken;
- (void)dealloc;
- (void)setLocked:(BOOL)a3;
- (void)setLockedNotificationToken:(int)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setScreenStateNotificationToken:(int)a3;
- (void)updateDeviceLocked;
- (void)updateScreenState;
@end

@implementation CSSDeviceProperties

- (void)dealloc
{
  int screenStateNotificationToken = self->_screenStateNotificationToken;
  if (screenStateNotificationToken != -1) {
    notify_cancel(screenStateNotificationToken);
  }
  int lockedNotificationToken = self->_lockedNotificationToken;
  if (lockedNotificationToken != -1) {
    notify_cancel(lockedNotificationToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSSDeviceProperties;
  [(CSSDeviceProperties *)&v5 dealloc];
}

- (CSSDeviceProperties)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSSDeviceProperties;
  v2 = [(CSSDeviceProperties *)&v12 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    id v3 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000036BC;
    handler[3] = &unk_10000C598;
    objc_copyWeak(&v10, &location);
    uint32_t v4 = notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &v2->_screenStateNotificationToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    if (v4) {
      v2->_int screenStateNotificationToken = -1;
    }
    else {
      [(CSSDeviceProperties *)v2 updateScreenState];
    }
    objc_super v5 = (const char *)kSBSLockStateNotifyKey;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000036FC;
    v7[3] = &unk_10000C598;
    objc_copyWeak(&v8, &location);
    LODWORD(v5) = notify_register_dispatch(v5, &v2->_lockedNotificationToken, (dispatch_queue_t)&_dispatch_main_q, v7);

    if (v5) {
      v2->_int lockedNotificationToken = -1;
    }
    else {
      [(CSSDeviceProperties *)v2 updateDeviceLocked];
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)updateScreenState
{
  uint64_t state64 = 0;
  notify_get_state([(CSSDeviceProperties *)self screenStateNotificationToken], &state64);
  [(CSSDeviceProperties *)self setScreenOn:state64 == 0];
}

- (void)updateDeviceLocked
{
  BOOL v3 = SBSGetScreenLockStatus() != 0;

  [(CSSDeviceProperties *)self setLocked:v3];
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (void)setScreenOn:(BOOL)a3
{
  self->_screenOn = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (int)screenStateNotificationToken
{
  return self->_screenStateNotificationToken;
}

- (void)setScreenStateNotificationToken:(int)a3
{
  self->_int screenStateNotificationToken = a3;
}

- (int)lockedNotificationToken
{
  return self->_lockedNotificationToken;
}

- (void)setLockedNotificationToken:(int)a3
{
  self->_int lockedNotificationToken = a3;
}

@end