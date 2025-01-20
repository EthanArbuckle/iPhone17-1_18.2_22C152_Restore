@interface AXSpeechAssetMonitorHelper
+ (id)sharedInstance;
- (AXSpeechAssetMonitorHelper)init;
- (BOOL)_platformSupportsMobileAssetVoices;
- (OS_dispatch_queue)longOperationQueue;
- (OS_dispatch_queue)migrationQueue;
- (id)_assetUpdaterClient;
- (void)_monitorSpeechAssetChanges;
- (void)_registerForReachabilityNotifications;
- (void)_unregisterForReachabilityNotifications;
- (void)_updateSpeechSourceIdentifiersIfNeeded;
- (void)handeDeviceFirstUnlock;
- (void)setLongOperationQueue:(id)a3;
- (void)setMigrationQueue:(id)a3;
- (void)startMigrationOnDeviceUnlock;
@end

@implementation AXSpeechAssetMonitorHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_Monitor;

  return v2;
}

uint64_t __44__AXSpeechAssetMonitorHelper_sharedInstance__block_invoke()
{
  sharedInstance_Monitor = objc_alloc_init(AXSpeechAssetMonitorHelper);

  return MEMORY[0x270F9A758]();
}

- (AXSpeechAssetMonitorHelper)init
{
  v19.receiver = self;
  v19.super_class = (Class)AXSpeechAssetMonitorHelper;
  v2 = [(AXSpeechAssetMonitorHelper *)&v19 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXSAM.operation", 0);
    longOperationQueue = v2->_longOperationQueue;
    v2->_longOperationQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessibility.migrationQueue", v6);
    migrationQueue = v2->_migrationQueue;
    v2->_migrationQueue = (OS_dispatch_queue *)v7;

    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v9 = (void *)getAXAssetsServiceClass_softClass;
    uint64_t v24 = getAXAssetsServiceClass_softClass;
    if (!getAXAssetsServiceClass_softClass)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __getAXAssetsServiceClass_block_invoke;
      v20[3] = &unk_264675BE8;
      v20[4] = &v21;
      __getAXAssetsServiceClass_block_invoke((uint64_t)v20);
      v9 = (void *)v22[3];
    }
    v10 = v9;
    _Block_object_dispose(&v21, 8);
    v11 = (AXAssetsService *)objc_alloc_init(v10);
    assetService = v2->_assetService;
    v2->_assetService = v11;

    v2->_lastVoiceAssetUpdateTime = -3061152000.0;
    v13 = v2;
    AXPerformBlockOnMainThreadAfterDelay();
    v14 = [MEMORY[0x263F22938] sharedInstance];
    char v15 = [v14 siriAutoUpdateListInitialized];

    if ((v15 & 1) == 0)
    {
      v18 = v13;
      AXPerformBlockOnMainThreadAfterDelay();
    }
    v16 = v13;
  }
  return v2;
}

uint64_t __34__AXSpeechAssetMonitorHelper_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _monitorSpeechAssetChanges];
}

void __34__AXSpeechAssetMonitorHelper_init__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _assetUpdaterClient];
  dispatch_queue_t v3 = [MEMORY[0x263F21380] mainAccessQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__AXSpeechAssetMonitorHelper_init__block_invoke_3;
  v4[3] = &unk_264675BC0;
  id v5 = *(id *)(a1 + 32);
  [v2 sendAsynchronousMessage:0 withIdentifier:10 targetAccessQueue:v3 completion:v4];
}

void __34__AXSpeechAssetMonitorHelper_init__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[4];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__AXSpeechAssetMonitorHelper_init__block_invoke_4;
  v3[3] = &unk_264675B98;
  v4 = v1;
  [v2 invalidate:v3];
}

void __34__AXSpeechAssetMonitorHelper_init__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (id)_assetUpdaterClient
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  speechAssetClient = self->_speechAssetClient;
  if (!speechAssetClient)
  {
    id v4 = objc_alloc(MEMORY[0x263F22198]);
    id v5 = NSString;
    v6 = [NSNumber numberWithInt:getpid()];
    dispatch_queue_t v7 = [v5 stringWithFormat:@"AXAssetAndDataServer-migrate-siri-list-%@", v6];
    v8 = (AXUIClient *)[v4 initWithIdentifier:v7 serviceBundleName:@"AXAssetAndDataServer"];
    v9 = self->_speechAssetClient;
    self->_speechAssetClient = v8;

    v10 = AXLogUI();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_speechAssetClient;
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_impl(&dword_222E44000, v10, OS_LOG_TYPE_DEFAULT, "Making new speech migration client: %@", buf, 0xCu);
    }

    speechAssetClient = self->_speechAssetClient;
  }

  return speechAssetClient;
}

- (BOOL)_platformSupportsMobileAssetVoices
{
  return 1;
}

- (void)_registerForReachabilityNotifications
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!self->_reachability)
  {
    sockaddr address = (sockaddr)xmmword_222E477F0;
    dispatch_queue_t v3 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x263EFFB08], &address);
    self->_reachability = v3;
    v4.version = 0;
    memset(&v4.retain, 0, 24);
    v4.info = self;
    SCNetworkReachabilitySetCallback(v3, (SCNetworkReachabilityCallBack)__ReachabilityCallback, &v4);
    SCNetworkReachabilitySetDispatchQueue(self->_reachability, MEMORY[0x263EF83A0]);
  }
}

- (void)_unregisterForReachabilityNotifications
{
  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetCallback(reachability, 0, 0);
    SCNetworkReachabilityContext v4 = self->_reachability;
    if (v4)
    {
      CFRelease(v4);
      self->_reachability = 0;
    }
  }
}

- (void)handeDeviceFirstUnlock
{
  [(AXSpeechAssetMonitorHelper *)self startMigrationOnDeviceUnlock];
  assetService = self->_assetService;

  [(AXAssetsService *)assetService runFirstUnlockTasks];
}

- (void)startMigrationOnDeviceUnlock
{
  if (AXDeviceIsUnlocked())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__AXSpeechAssetMonitorHelper_startMigrationOnDeviceUnlock__block_invoke;
    block[3] = &unk_264675B98;
    block[4] = self;
    if (startMigrationOnDeviceUnlock_onceToken != -1) {
      dispatch_once(&startMigrationOnDeviceUnlock_onceToken, block);
    }
  }
}

void __58__AXSpeechAssetMonitorHelper_startMigrationOnDeviceUnlock__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) componentCacheChanged];
  v2 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222E44000, v2, OS_LOG_TYPE_INFO, "AXSpeechAssetMonitorHelper: Migration task timer set for 5 minutes.", buf, 2u);
  }

  dispatch_time_t v3 = dispatch_time(0, 300000000000);
  SCNetworkReachabilityContext v4 = [*(id *)(a1 + 32) migrationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__AXSpeechAssetMonitorHelper_startMigrationOnDeviceUnlock__block_invoke_280;
  block[3] = &unk_264675B98;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, v4, block);
}

uint64_t __58__AXSpeechAssetMonitorHelper_startMigrationOnDeviceUnlock__block_invoke_280(uint64_t a1)
{
  v2 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222E44000, v2, OS_LOG_TYPE_INFO, "AXSpeechAssetMonitorHelper: Running migration from SpringBoard after first unlock.", buf, 2u);
  }

  dispatch_time_t v3 = [MEMORY[0x263F7EEA8] sharedInstance];
  [v3 restartMigrationIfNeeded];

  SCNetworkReachabilityContext v4 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_222E44000, v4, OS_LOG_TYPE_INFO, "AXSpeechAssetMonitorHelper: Updating super compact voice identifiers for all speech sources if needed.", v6, 2u);
  }

  return [*(id *)(a1 + 32) _updateSpeechSourceIdentifiersIfNeeded];
}

- (void)_monitorSpeechAssetChanges
{
  [(AXAssetsService *)self->_assetService runFirstBootTasks:0];
  if (AXDeviceIsUnlocked())
  {
    [(AXSpeechAssetMonitorHelper *)self startMigrationOnDeviceUnlock];
    assetService = self->_assetService;
    [(AXAssetsService *)assetService runFirstUnlockTasks];
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v5 = (const __CFString *)AXkMobileKeyBagLockStatusNotificationID();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_deviceLockStateChanged, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)_updateSpeechSourceIdentifiersIfNeeded
{
  id v16 = (id)TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  v2 = MEMORY[0x223CA9A90]();
  dispatch_time_t v3 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v4 = *MEMORY[0x263F212E8];
  CFStringRef v5 = [v3 speechVoiceIdentifierForLanguage:v16 sourceKey:*MEMORY[0x263F212E8] exists:0];

  uint64_t v6 = [MEMORY[0x263F7EEA8] sharedInstance];
  [v6 downloadCompactResourceIfNeededForIdentifier:v5];

  dispatch_queue_t v7 = [MEMORY[0x263F22938] sharedInstance];
  v8 = [v7 speechVoiceIdentifierForLanguage:v2 sourceKey:v4 exists:0];

  v9 = [MEMORY[0x263F7EEA8] sharedInstance];
  [v9 downloadCompactResourceIfNeededForIdentifier:v8];

  v10 = [MEMORY[0x263F22938] sharedInstance];
  v11 = [v10 speechVoiceIdentifierForLanguage:v2 sourceKey:*MEMORY[0x263F212D8] exists:0];

  v12 = [MEMORY[0x263F7EEA8] sharedInstance];
  [v12 downloadCompactResourceIfNeededForIdentifier:v11];

  v13 = [MEMORY[0x263F22938] sharedInstance];
  v14 = [v13 speechVoiceIdentifierForLanguage:v2 sourceKey:*MEMORY[0x263F212E0] exists:0];

  uint64_t v15 = [MEMORY[0x263F7EEA8] sharedInstance];
  [v15 downloadCompactResourceIfNeededForIdentifier:v14];
}

- (OS_dispatch_queue)longOperationQueue
{
  return self->_longOperationQueue;
}

- (void)setLongOperationQueue:(id)a3
{
}

- (OS_dispatch_queue)migrationQueue
{
  return self->_migrationQueue;
}

- (void)setMigrationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationQueue, 0);
  objc_storeStrong((id *)&self->_longOperationQueue, 0);
  objc_storeStrong((id *)&self->_speechAssetClient, 0);

  objc_storeStrong((id *)&self->_assetService, 0);
}

@end