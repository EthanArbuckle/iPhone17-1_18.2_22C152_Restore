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

+ (BOOL)isGeminiCapable
{
  if (isGeminiCapable_onceToken != -1) {
    dispatch_once(&isGeminiCapable_onceToken, &__block_literal_global_54);
  }
  return isGeminiCapable_geminiSupported;
}

void __27__PHDevice_isGeminiCapable__block_invoke(id a1)
{
  int v4 = 0;
  CFBooleanRef v1 = (const __CFBoolean *)MGCopyAnswerWithError();
  if (v1)
  {
    CFBooleanRef v2 = v1;
    isGeminiCapable_geminiSupported = CFBooleanGetValue(v1) != 0;
    CFRelease(v2);
  }
  else
  {
    v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __27__PHDevice_isGeminiCapable__block_invoke_cold_1(v3);
    }
  }
}

+ (id)currentDevice
{
  if (currentDevice_onceToken != -1) {
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_23);
  }
  CFBooleanRef v2 = (void *)currentDevice_device;

  return v2;
}

void __25__PHDevice_currentDevice__block_invoke(id a1)
{
  CFBooleanRef v1 = objc_alloc_init(PHDevice);
  uint64_t v2 = currentDevice_device;
  currentDevice_device = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

- (PHDevice)init
{
  v9.receiver = self;
  v9.super_class = (Class)PHDevice;
  uint64_t v2 = [(PHDevice *)&v9 init];
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
    block[2] = __16__PHDevice_init__block_invoke;
    block[3] = &unk_10027C670;
    v8 = v2;
    dispatch_barrier_async(v5, block);
  }
  return v2;
}

id __16__PHDevice_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc((Class)RadiosPreferences);
  dispatch_queue_t v3 = [*(id *)(a1 + 32) dispatchQueue];
  id v4 = [v2 initWithQueue:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;

  [*(id *)(*(void *)(a1 + 32) + 24) setDelegate:];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 32) fetchCellularRadioEnabled];
  id result = [*(id *)(a1 + 32) fetchRingerSwitchEnabled];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = (_BYTE)result;
  return result;
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
  id v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(PHDevice *)self dispatchQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __34__PHDevice_isCellularRadioEnabled__block_invoke;
  v5[3] = &unk_10027CE88;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __34__PHDevice_isCellularRadioEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setCellularRadioEnabled:(BOOL)a3
{
  uint64_t v5 = [(PHDevice *)self dispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __36__PHDevice_setCellularRadioEnabled___block_invoke;
  v6[3] = &unk_10027C838;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

void __36__PHDevice_setCellularRadioEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(unsigned char *)(v1 + 8) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __36__PHDevice_setCellularRadioEnabled___block_invoke_2;
    block[3] = &unk_10027C670;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void __36__PHDevice_setCellularRadioEnabled___block_invoke_2(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"PHDeviceCellularRadioEnabledDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)isRingerSwitchEnabled
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(PHDevice *)self dispatchQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __33__PHDevice_isRingerSwitchEnabled__block_invoke;
  v5[3] = &unk_10027CE88;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __33__PHDevice_isRingerSwitchEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

- (void)setRingerSwitchEnabled:(BOOL)a3
{
  uint64_t v5 = [(PHDevice *)self dispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __35__PHDevice_setRingerSwitchEnabled___block_invoke;
  v6[3] = &unk_10027C838;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

void __35__PHDevice_setRingerSwitchEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(unsigned char *)(v1 + 9) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __35__PHDevice_setRingerSwitchEnabled___block_invoke_2;
    block[3] = &unk_10027C670;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void __35__PHDevice_setRingerSwitchEnabled___block_invoke_2(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"PHDeviceRingerSwitchDidChangeNotification" object:*(void *)(a1 + 32)];
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
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  dispatch_queue_t v3 = [(PHDevice *)self dispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __29__PHDevice_radiosPreferences__block_invoke;
  v6[3] = &unk_10027CE88;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (RadiosPreferences *)v4;
}

void __29__PHDevice_radiosPreferences__block_invoke(uint64_t a1)
{
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
    v5[2] = __47__PHDevice_registerForRingerStateNotifications__block_invoke;
    v5[3] = &unk_10027DF68;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, &self->_ringerStateNotifyToken, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __47__PHDevice_registerForRingerStateNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRingerSwitchEnabled:[WeakRetained fetchRingerSwitchEnabled]];
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

void __27__PHDevice_isGeminiCapable__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not retreive Dual SIM activation policy", v1, 2u);
}

void __27__PHDevice_isGeminiCapable__block_invoke_cold_2(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not retreive Dual SIM activation policy, mobileGestaltErrorCode: %d", (uint8_t *)v3, 8u);
}

@end