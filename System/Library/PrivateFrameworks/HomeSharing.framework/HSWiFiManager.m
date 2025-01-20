@interface HSWiFiManager
+ (id)sharedWiFiManager;
- (BOOL)_getWiFiAssociated;
- (BOOL)_getWiFiEnabledFromPrefs;
- (BOOL)isWiFiAssociated;
- (BOOL)isWiFiEnabled;
- (HSWiFiManager)init;
- (id)_processIdentifier;
- (void)_wifiCallBack:(unsigned int)a3;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)setWiFiAssociated:(BOOL)a3;
- (void)setWiFiEnabled:(BOOL)a3;
@end

@implementation HSWiFiManager

- (void).cxx_destruct
{
}

- (void)setWiFiAssociated:(BOOL)a3
{
  self->_wiFiAssociated = a3;
}

- (BOOL)isWiFiAssociated
{
  return self->_wiFiAssociated;
}

- (void)setWiFiEnabled:(BOOL)a3
{
  self->_wiFiEnabled = a3;
}

- (BOOL)isWiFiEnabled
{
  return self->_wiFiEnabled;
}

- (void)_wifiCallBack:(unsigned int)a3
{
  char v3 = a3;
  v13[2] = *MEMORY[0x263EF8340];
  BOOL v5 = [(HSWiFiManager *)self _getWiFiEnabledFromPrefs];
  BOOL v6 = [(HSWiFiManager *)self _getWiFiAssociated];
  if (v3)
  {
    BOOL v7 = v6;
    if (v5 != [(HSWiFiManager *)self isWiFiEnabled]
      || v7 != [(HSWiFiManager *)self isWiFiAssociated])
    {
      [(HSWiFiManager *)self setWiFiEnabled:v5];
      [(HSWiFiManager *)self setWiFiAssociated:v7];
      v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HSWiFiManager isWiFiEnabled](self, "isWiFiEnabled"));
      v12[0] = v8;
      v13[0] = @"HSWiFiManagerWiFiEnabledUserInfoKey";
      v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HSWiFiManager isWiFiAssociated](self, "isWiFiAssociated"));
      v12[1] = v9;
      v13[1] = @"HSWiFiManagerWiFiAssociatedUserInfoKey";
      v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

      v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 postNotificationName:@"HSWiFiManagerWiFiDidChangeNotification" object:self userInfo:v10];
    }
  }
}

- (BOOL)_getWiFiAssociated
{
  v2 = [MEMORY[0x263F89110] sharedMonitor];
  char v3 = [v2 isWiFiAssociated];

  return v3;
}

- (BOOL)_getWiFiEnabledFromPrefs
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__HSWiFiManager__getWiFiEnabledFromPrefs__block_invoke;
  v5[3] = &unk_26423A438;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__HSWiFiManager__getWiFiEnabledFromPrefs__block_invoke(uint64_t a1)
{
  CFBooleanRef Value = (const __CFBoolean *)SCPreferencesGetValue(*(SCPreferencesRef *)(*(void *)(a1 + 32) + 8), @"AllowEnable");
  if (Value)
  {
    CFBooleanRef v3 = Value;
    CFTypeID v4 = CFGetTypeID(Value);
    if (v4 == CFNumberGetTypeID() || (CFTypeID v5 = CFGetTypeID(v3), v5 == CFBooleanGetTypeID())) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFBooleanGetValue(v3) != 0;
    }
  }
  uint64_t v6 = *(const __SCPreferences **)(*(void *)(a1 + 32) + 8);
  SCPreferencesSynchronize(v6);
}

- (id)_processIdentifier
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  CFBooleanRef v3 = [v2 bundleIdentifier];

  if (!v3)
  {
    CFTypeID v4 = NSString;
    CFTypeID v5 = getprogname();
    CFBooleanRef v3 = objc_msgSend(v4, "stringWithFormat:", @"%s (%d)", v5, getpid());
  }
  return v3;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
}

- (void)dealloc
{
  wifiPreferences = self->_wifiPreferences;
  Main = CFRunLoopGetMain();
  SCPreferencesUnscheduleFromRunLoop(wifiPreferences, Main, (CFStringRef)*MEMORY[0x263EFFE78]);
  CFRelease(self->_wifiPreferences);
  v5.receiver = self;
  v5.super_class = (Class)HSWiFiManager;
  [(HSWiFiManager *)&v5 dealloc];
}

- (HSWiFiManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)HSWiFiManager;
  v2 = [(HSWiFiManager *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.amp.HomeSharing.HSWiFiManager.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    CFStringRef v5 = [(HSWiFiManager *)v2 _processIdentifier];
    uint64_t v6 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, @"com.apple.wifi.plist");
    v2->_wifiPreferences = v6;
    v12.version = 0;
    memset(&v12.retain, 0, 24);
    v12.info = v2;
    SCPreferencesSetCallback(v6, (SCPreferencesCallBack)_WiFiCallBack, &v12);
    wifiPreferences = v2->_wifiPreferences;
    Main = CFRunLoopGetMain();
    SCPreferencesScheduleWithRunLoop(wifiPreferences, Main, (CFStringRef)*MEMORY[0x263EFFE78]);
    v2->_wiFiEnabled = [(HSWiFiManager *)v2 _getWiFiEnabledFromPrefs];
    v2->_wiFiAssociated = 1;
    char v9 = [MEMORY[0x263F89110] sharedMonitor];
    [v9 registerObserver:v2];

    v10 = v2;
  }

  return v2;
}

+ (id)sharedWiFiManager
{
  if (sharedWiFiManager_onceToken != -1) {
    dispatch_once(&sharedWiFiManager_onceToken, &__block_literal_global_1242);
  }
  v2 = (void *)sharedWiFiManager_sharedWiFiManager;
  return v2;
}

uint64_t __34__HSWiFiManager_sharedWiFiManager__block_invoke()
{
  sharedWiFiManager_sharedWiFiManager = objc_alloc_init(HSWiFiManager);
  return MEMORY[0x270F9A758]();
}

@end