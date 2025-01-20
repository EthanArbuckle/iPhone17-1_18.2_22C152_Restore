@interface PHDevice
+ (BOOL)isGeminiCapable;
+ (id)currentDevice;
- (BOOL)fetchCellularRadioEnabled;
- (BOOL)fetchRingerSwitchEnabled;
- (BOOL)isCellularRadioEnabled;
- (BOOL)isRingerSwitchEnabled;
- (BOOL)proximitySensorState;
- (OS_dispatch_queue)dispatchQueue;
- (PHDevice)init;
- (RadiosPreferences)radiosPreferences;
- (UIImage)audioRouteGlyphImage;
- (int)ringerStateNotifyToken;
- (unint64_t)stateForNotifyToken:(int)a3;
- (void)airplaneModeChanged;
- (void)dealloc;
- (void)registerForRingerStateNotifications;
- (void)setCellularRadioEnabled:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setProximitySensorState:(BOOL)a3;
- (void)setRadiosPreferences:(id)a3;
- (void)setRingerStateNotifyToken:(int)a3;
- (void)setRingerSwitchEnabled:(BOOL)a3;
- (void)unregisterForRingerStateNotifications;
@end

@implementation PHDevice

+ (id)currentDevice
{
  if (qword_1000A2168 != -1) {
    dispatch_once(&qword_1000A2168, &stru_10008D9B8);
  }
  v2 = (void *)qword_1000A2160;

  return v2;
}

+ (BOOL)isGeminiCapable
{
  if (qword_1000A2178 != -1) {
    dispatch_once(&qword_1000A2178, &stru_10008D9D8);
  }
  return byte_1000A2170;
}

- (PHDevice)init
{
  v9.receiver = self;
  v9.super_class = (Class)PHDevice;
  v2 = [(PHDevice *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("PHDevice.serialQueue", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_ringerStateNotifyToken = -1;
    v2->_ringerSwitchEnabled = 0;
    [(PHDevice *)v2 registerForRingerStateNotifications];
    v5 = [(PHDevice *)v2 dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012D84;
    block[3] = &unk_10008D758;
    v8 = v2;
    dispatch_barrier_async(v5, block);
  }
  return v2;
}

- (void)dealloc
{
  [(PHDevice *)self unregisterForRingerStateNotifications];
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHDevice;
  [(PHDevice *)&v4 dealloc];
}

- (BOOL)isCellularRadioEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(PHDevice *)self dispatchQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012F58;
  v5[3] = &unk_10008DA00;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setCellularRadioEnabled:(BOOL)a3
{
  v5 = [(PHDevice *)self dispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013004;
  v6[3] = &unk_10008DA28;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

- (BOOL)isRingerSwitchEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(PHDevice *)self dispatchQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000131CC;
  v5[3] = &unk_10008DA00;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setRingerSwitchEnabled:(BOOL)a3
{
  v5 = [(PHDevice *)self dispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013278;
  v6[3] = &unk_10008DA28;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

- (UIImage)audioRouteGlyphImage
{
  return (UIImage *)+[UIImage currentDeviceRouteGlyphForDisplayStyle:0];
}

- (RadiosPreferences)radiosPreferences
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100013494;
  v11 = sub_1000134A4;
  id v12 = 0;
  dispatch_queue_t v3 = [(PHDevice *)self dispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000134AC;
  v6[3] = &unk_10008DA00;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (RadiosPreferences *)v4;
}

- (BOOL)fetchCellularRadioEnabled
{
  return [(RadiosPreferences *)self->_radiosPreferences airplaneMode] ^ 1;
}

- (BOOL)fetchRingerSwitchEnabled
{
  return [(PHDevice *)self stateForNotifyToken:[(PHDevice *)self ringerStateNotifyToken]] != 0;
}

- (void)registerForRingerStateNotifications
{
  if ([(PHDevice *)self ringerStateNotifyToken] == -1)
  {
    objc_initWeak(&location, self);
    dispatch_queue_t v3 = (const char *)[@"com.apple.springboard.ringerstate" UTF8String];
    id v4 = [(PHDevice *)self dispatchQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100013624;
    v5[3] = &unk_10008DA50;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, &self->_ringerStateNotifyToken, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)unregisterForRingerStateNotifications
{
  if ([(PHDevice *)self ringerStateNotifyToken] != -1)
  {
    notify_cancel([(PHDevice *)self ringerStateNotifyToken]);
    [(PHDevice *)self setRingerStateNotifyToken:0xFFFFFFFFLL];
  }
}

- (unint64_t)stateForNotifyToken:(int)a3
{
  uint64_t state64 = 0;
  if (a3 == -1) {
    return 0;
  }
  notify_get_state(a3, &state64);
  return state64;
}

- (void)airplaneModeChanged
{
  BOOL v3 = [(PHDevice *)self fetchCellularRadioEnabled];

  [(PHDevice *)self setCellularRadioEnabled:v3];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setRadiosPreferences:(id)a3
{
}

- (int)ringerStateNotifyToken
{
  return self->_ringerStateNotifyToken;
}

- (void)setRingerStateNotifyToken:(int)a3
{
  self->_ringerStateNotifyToken = a3;
}

- (BOOL)proximitySensorState
{
  return self->_proximitySensorState;
}

- (void)setProximitySensorState:(BOOL)a3
{
  self->_proximitySensorState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPreferences, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end