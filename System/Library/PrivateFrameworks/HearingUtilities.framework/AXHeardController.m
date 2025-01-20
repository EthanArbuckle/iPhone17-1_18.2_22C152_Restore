@interface AXHeardController
+ (id)entitlementsForMessageID:(unint64_t)a3;
+ (id)sharedServer;
- (AXHeardController)init;
- (BOOL)connection:(id)a3 hasEntitlementForMessage:(unint64_t)a4;
- (BOOL)sendMessage:(id)a3 withError:(id *)a4;
- (HCXPCMessage)boostMessage;
- (NSArray)clients;
- (NSDictionary)handlers;
- (OS_dispatch_queue)personalAudioQueue;
- (id)boostPriority:(id)a3;
- (unint64_t)countOfClientsListeningForIdentifier:(unint64_t)a3;
- (void)_setShutdownTimer;
- (void)_shouldBeRunning:(id)a3;
- (void)_shutdownIfPossible;
- (void)addHandler:(id)a3 andBlock:(id)a4 forMessageIdentifier:(unint64_t)a5;
- (void)bluetoothAvailabilityDidChange:(id)a3;
- (void)continueSetup;
- (void)dealloc;
- (void)handleMessage:(id)a3 forIdentifier:(unint64_t)a4;
- (void)handleNewConnection:(id)a3;
- (void)registerFakeClient:(id)a3;
- (void)sendClientsMessageWithPayload:(id)a3 excluding:(id)a4;
- (void)sendUpdateMessage:(id)a3 forIdentifier:(unint64_t)a4;
- (void)setBoostMessage:(id)a3;
- (void)setClients:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setPersonalAudioQueue:(id)a3;
- (void)shutdownIfPossible;
- (void)startServer;
- (void)updateAnalytics;
- (void)updateHearingControlCenterModule;
- (void)updatePersonalAudioSettingsOnAccessories;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation AXHeardController

+ (id)sharedServer
{
  if (sharedServer_onceToken != -1) {
    dispatch_once(&sharedServer_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)sharedServer_Server;

  return v2;
}

uint64_t __33__AXHeardController_sharedServer__block_invoke()
{
  v0 = objc_alloc_init(AXHeardController);
  uint64_t v1 = sharedServer_Server;
  sharedServer_Server = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)entitlementsForMessageID:(unint64_t)a3
{
  id result = 0;
  if ((uint64_t)a3 <= 0x1FFFFFFFFFLL)
  {
    if ((uint64_t)a3 < 0x200000)
    {
      if ((uint64_t)a3 >= 0x40000)
      {
        if (a3 == 0x40000) {
          return &unk_26C1E5DF0;
        }
        if (a3 == 0x100000) {
          return &unk_26C1E5E08;
        }
      }
      else
      {
        if (a3 == 128) {
          return &unk_26C1E5DD8;
        }
        if (a3 == 0x10000) {
          return &unk_26C1E5E50;
        }
      }
      return &unk_26C1E5E68;
    }
    if ((uint64_t)a3 <= 0x7FFFFFFFFLL)
    {
      if (a3 == 0x200000) {
        return &unk_26C1E5E20;
      }
      if (a3 == 0x400000) {
        return &unk_26C1E5E38;
      }
      return &unk_26C1E5E68;
    }
    if (a3 == 0x800000000) {
      return &unk_26C1E5DA8;
    }
    if (a3 == 0x1000000000) {
      return result;
    }
    return &unk_26C1E5E68;
  }
  if ((uint64_t)a3 > 0x1FFFFFFFFFFLL)
  {
    if ((uint64_t)a3 > 0x7FFFFFFFFFFLL)
    {
      if (a3 != 0x80000000000 && a3 != 0x100000000000)
      {
        if (a3 == 0x200000000000) {
          return &unk_26C1E5D90;
        }
        return &unk_26C1E5E68;
      }
      return &unk_26C1E5DA8;
    }
    if (a3 == 0x20000000000) {
      return &unk_26C1E5DA8;
    }
    uint64_t v4 = 0x40000000000;
LABEL_22:
    if (a3 == v4) {
      return &unk_26C1E5DC0;
    }
    return &unk_26C1E5E68;
  }
  if ((uint64_t)a3 > 0x7FFFFFFFFFLL)
  {
    if (a3 == 0x8000000000) {
      return result;
    }
    if (a3 == 0x10000000000) {
      return &unk_26C1E5DA8;
    }
    return &unk_26C1E5E68;
  }
  if (a3 != 0x2000000000)
  {
    uint64_t v4 = 0x4000000000;
    goto LABEL_22;
  }
  return result;
}

- (AXHeardController)init
{
  v18.receiver = self;
  v18.super_class = (Class)AXHeardController;
  v2 = [(AXHeardController *)&v18 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF8C0] array];
    [(AXHeardController *)v2 setClients:v3];

    uint64_t v4 = [NSDictionary dictionary];
    [(AXHeardController *)v2 setHandlers:v4];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)UserLevelHearingSetupAvailable, @"com.apple.accessibility.hearing.setup.ready", 0, (CFNotificationSuspensionBehavior)0);
    v6 = (void *)MEMORY[0x263F2B998];
    v7 = [MEMORY[0x263F472B0] bluetoothManagerQueue];
    [v6 setSharedInstanceQueue:v7];

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v2 selector:sel_bluetoothAvailabilityDidChange_ name:*MEMORY[0x263F2B8E8] object:0];

    id v9 = (id)[MEMORY[0x263F2B998] sharedInstance];
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v11 = dispatch_queue_create("personal_audio_access_queue", v10);
    personalAudioQueue = v2->_personalAudioQueue;
    v2->_personalAudioQueue = (OS_dispatch_queue *)v11;

    id v13 = objc_alloc(MEMORY[0x263F21398]);
    uint64_t v14 = [v13 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    shutdownTimer = v2->_shutdownTimer;
    v2->_shutdownTimer = (AXDispatchTimer *)v14;

    v17 = v2;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  return v2;
}

uint64_t __25__AXHeardController_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) continueSetup];
}

- (void)bluetoothAvailabilityDidChange:(id)a3
{
  self->_bluetoothReady = 1;
}

- (void)updateHearingControlCenterModule
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = +[HUHearingAidSettings sharedInstance];
  uint64_t v3 = [v2 usedHearingFeatures];

  if (!compoundAttributeContainsAttribute(v3, 2)
    && !compoundAttributeContainsAttribute(v3, 8)
    && !compoundAttributeContainsAttribute(v3, 1024)
    && !compoundAttributeContainsAttribute(v3, 2048))
  {
    HAInitializeLogging();
    uint64_t v14 = NSString;
    BOOL v15 = compoundAttributeContainsAttribute(v3, 2);
    BOOL v16 = compoundAttributeContainsAttribute(v3, 8);
    BOOL v17 = compoundAttributeContainsAttribute(v3, 1024);
    id v6 = [v14 stringWithFormat:@"Not adding hearing module %lu - %d, %d, %d, %d", v3, v15, v16, v17, compoundAttributeContainsAttribute(v3, 2048)];
    id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController updateHearingControlCenterModule]", 276, v6];
    v8 = (void *)*MEMORY[0x263F47290];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"HUHearingControlCenterAddedKey"];

  if (v5)
  {
    HAInitializeLogging();
    id v6 = [NSString stringWithFormat:@"Skipping adding hearing to control center because we already added it."];
    id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController updateHearingControlCenterModule]", 254, v6];
    v8 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      id v7 = v7;
      id v9 = v8;
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v10 = (void *)getCCSIconElementRequestClass_softClass;
    uint64_t v23 = getCCSIconElementRequestClass_softClass;
    if (!getCCSIconElementRequestClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v25 = __getCCSIconElementRequestClass_block_invoke;
      v26 = &unk_2640FC9B0;
      v27 = &v20;
      __getCCSIconElementRequestClass_block_invoke((uint64_t)&buf);
      v10 = (void *)v21[3];
    }
    dispatch_queue_t v11 = v10;
    _Block_object_dispose(&v20, 8);
    v12 = (void *)[[v11 alloc] initWithIntent:2 moduleIdentifier:@"com.apple.accessibility.controlcenter.hearingdevices" containerBundleIdentifier:@"com.apple.accessibility.controlcenter.hearingdevices" moduleSize:0];
    id v13 = [getCCSControlCenterServiceClass() sharedInstance];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __53__AXHeardController_updateHearingControlCenterModule__block_invoke;
    v18[3] = &unk_2640FEB60;
    v19 = v12;
    id v6 = v12;
    [v13 requestIconElementState:v6 completionHandler:v18];

    id v7 = v19;
  }
LABEL_11:
}

void __53__AXHeardController_updateHearingControlCenterModule__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  uint64_t v4 = NSString;
  int v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v6 = [v4 stringWithFormat:@"Hearing control status: %@", v5];

  id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController updateHearingControlCenterModule]_block_invoke", 261, v6];
  v8 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v7;
    v10 = v8;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v14 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (a2 == 2)
  {
    dispatch_queue_t v11 = [getCCSControlCenterServiceClass() sharedInstance];
    [v11 handleIconElementRequest:*(void *)(a1 + 32) completionHandler:&__block_literal_global_113];
  }
  v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v12 setBool:1 forKey:@"HUHearingControlCenterAddedKey"];
}

void __53__AXHeardController_updateHearingControlCenterModule__block_invoke_110(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  HAInitializeLogging();
  int v5 = NSString;
  id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v7 = [v6 dictionaryRepresentation];
  v8 = [v5 stringWithFormat:@"Added hearing to control center: %@ success: %d %@", v4, a2, v7];

  id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController updateHearingControlCenterModule]_block_invoke", 266, v8];
  v10 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    v12 = v10;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v14 = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)continueSetup
{
}

void __34__AXHeardController_continueSetup__block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (!v1[40])
  {
    objc_initWeak(&location, v1);
    uint64_t v3 = +[HUUtilities sharedUtilities];
    [v3 updateHearingFeatureUsage];

    [*(id *)(a1 + 32) updateHearingControlCenterModule];
    id v4 = +[HUHearingAidSettings sharedInstance];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __34__AXHeardController_continueSetup__block_invoke_2;
    v54[3] = &unk_2640FC910;
    objc_copyWeak(&v55, &location);
    [v4 registerUpdateBlock:v54 forRetrieveSelector:sel_usedHearingFeatures withListener:*(void *)(a1 + 32)];

    int v5 = +[HUHearingAidSettings sharedInstance];
    [v5 registerUpdateBlock:&__block_literal_global_125 forRetrieveSelector:sel_pairedHearingAids withListener:*(void *)(a1 + 32)];

    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
    PAInitializeLogging();
    id v6 = [NSString stringWithFormat:@"Setting up AA/PA"];
    id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController continueSetup]_block_invoke", 304, v6];
    v8 = (id)*MEMORY[0x263F472C8];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v7 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v58 = v9;
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    v10 = [getPASettingsClass_0() sharedInstance];
    id v11 = (id)[v10 personalMediaConfiguration];

    id v12 = (id)[getPADatabaseManagerClass() sharedManager];
    id v13 = +[AXHeardController sharedServer];
    [v13 updatePersonalAudioSettingsOnAccessories];

    uint64_t v14 = [getPASettingsClass_0() sharedInstance];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __34__AXHeardController_continueSetup__block_invoke_136;
    v52[3] = &unk_2640FC910;
    objc_copyWeak(&v53, &location);
    uint64_t v15 = +[AXHeardController sharedServer];
    [v14 registerUpdateBlock:v52 forRetrieveSelector:sel_personalMediaConfigurationByRouteUID withListener:v15];

    id v16 = (id)[getPAAccessoryManagerClass() sharedInstance];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __34__AXHeardController_continueSetup__block_invoke_2_143;
    v50[3] = &unk_2640FC910;
    objc_copyWeak(&v51, &location);
    BOOL v17 = (void *)MEMORY[0x2105575F0](v50);
    objc_super v18 = [getPASettingsClass_0() sharedInstance];
    [v18 setShouldUpdateAccessory:1];

    v19 = [getPASettingsClass_0() sharedInstance];
    uint64_t v20 = +[AXHeardController sharedServer];
    [v19 registerUpdateBlock:v17 forRetrieveSelector:sel_transparencyBalance withListener:v20];

    v21 = [getPASettingsClass_0() sharedInstance];
    uint64_t v22 = +[AXHeardController sharedServer];
    [v21 registerUpdateBlock:v17 forRetrieveSelector:sel_transparencyAmplification withListener:v22];

    uint64_t v23 = [getPASettingsClass_0() sharedInstance];
    v24 = +[AXHeardController sharedServer];
    [v23 registerUpdateBlock:v17 forRetrieveSelector:sel_transparencyTone withListener:v24];

    v25 = [getPASettingsClass_0() sharedInstance];
    v26 = +[AXHeardController sharedServer];
    [v25 registerUpdateBlock:v17 forRetrieveSelector:sel_transparencyBeamforming withListener:v26];

    v27 = [getPASettingsClass_0() sharedInstance];
    uint64_t v28 = +[AXHeardController sharedServer];
    [v27 registerUpdateBlock:v17 forRetrieveSelector:sel_transparencyNoiseSupressor withListener:v28];

    v29 = [getPASettingsClass_0() sharedInstance];
    v30 = +[AXHeardController sharedServer];
    [v29 registerUpdateBlock:v17 forRetrieveSelector:sel_personalAudioAccommodationTypes withListener:v30];

    v31 = [getPASettingsClass_0() sharedInstance];
    v32 = +[AXHeardController sharedServer];
    [v31 registerUpdateBlock:v17 forRetrieveSelector:sel_personalMediaEnabled withListener:v32];

    v33 = [getPASettingsClass_0() sharedInstance];
    v34 = +[AXHeardController sharedServer];
    [v33 registerUpdateBlock:v17 forRetrieveSelector:sel_transparencyCustomized withListener:v34];

    id v35 = +[HUNoiseSettings sharedInstance];
    if ([MEMORY[0x263F472B0] deviceIsWatch]
      && +[HUNoiseController deviceSupportsEnvironmentalDosimetry])
    {
      id v36 = +[HUNoiseController sharedController];
    }
    id v37 = +[HUAccessoryHearingSyncManager sharedInstance];
    id v38 = +[HUComfortSoundsController sharedController];
    v39 = [MEMORY[0x263EFF910] date];
    [v39 timeIntervalSince1970];
    double v41 = v40;
    uint64_t v42 = [MEMORY[0x263F472B0] systemBootTime];

    if (v41 - (double)v42 < 90.0)
    {
      v43 = +[HUHearingAidSettings sharedInstance];
      int v44 = [v43 isPairedWithFakeHearingAids];

      if (v44)
      {
        HAInitializeLogging();
        v45 = [NSString stringWithFormat:@"Recently rebooted. Disabling fake hearing aids"];
        v46 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController continueSetup]_block_invoke_3", 367, v45];
        v47 = (id)*MEMORY[0x263F47290];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v48 = [v46 UTF8String];
          *(_DWORD *)long long buf = 136446210;
          uint64_t v58 = v48;
          _os_log_impl(&dword_20CC86000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }

        v49 = +[HUHearingAidSettings sharedInstance];
        [v49 setPairedHearingAids:0];
      }
    }
    [*(id *)(a1 + 32) shutdownIfPossible];

    objc_destroyWeak(&v51);
    objc_destroyWeak(&v53);
    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);
  }
}

void __34__AXHeardController_continueSetup__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateHearingControlCenterModule];
}

void __34__AXHeardController_continueSetup__block_invoke_3()
{
  v0 = +[HUHearingAidSettings sharedInstance];
  uint64_t v1 = [v0 pairedHearingAids];
  BOOL v2 = v1 != 0;

  id v3 = [getCCSControlCenterServiceClass() sharedInstance];
  [v3 setVisibility:v2 forModuleWithIdentifier:@"com.apple.accessibility.controlcenter.hearingaids" completionHandler:&__block_literal_global_127];
}

void __34__AXHeardController_continueSetup__block_invoke_4(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  HAInitializeLogging();
  int v5 = [NSString stringWithFormat:@"Aids hearing aids module control center gallery: %@ success: %d", v4, a2];

  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController continueSetup]_block_invoke_4", 298, v5];
  id v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v11 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

void __34__AXHeardController_continueSetup__block_invoke_136(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [getPASettingsClass_0() sharedInstance];
  id v4 = [v3 personalMediaConfiguration];

  PAInitializeLogging();
  int v5 = [NSString stringWithFormat:@"AA changed %@", v4];
  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController continueSetup]_block_invoke", 313, v5];
  id v7 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v18 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (WeakRetained)
  {
    v10 = WeakRetained[8];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__AXHeardController_continueSetup__block_invoke_140;
    block[3] = &unk_2640FC960;
    id v16 = v4;
    dispatch_async(v10, block);
  }
  id v11 = objc_loadWeakRetained(v1);
  [v11 updateAnalytics];

  id v12 = objc_loadWeakRetained(v1);
  [v12 updatePersonalAudioSettingsOnAccessories];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.accessibility.hearing.ui.availability", 0, 0, 1u);
  uint64_t v14 = +[HUUtilities sharedUtilities];
  [v14 updateHearingFeatureUsage];
}

void __34__AXHeardController_continueSetup__block_invoke_140(uint64_t a1)
{
  id v2 = [getPADatabaseManagerClass() sharedManager];
  [v2 saveConfiguration:*(void *)(a1 + 32)];
}

void __34__AXHeardController_continueSetup__block_invoke_2_143(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAnalytics];

  id v3 = objc_loadWeakRetained(v1);
  [v3 updatePersonalAudioSettingsOnAccessories];
}

- (void)shutdownIfPossible
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL bluetoothReady = self->_bluetoothReady;
  HAInitializeLogging();
  if (bluetoothReady)
  {
    id v4 = [NSString stringWithFormat:@"BT ready, processing shutdown check"];
    int v5 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController shutdownIfPossible]", 390, v4];
    id v6 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      id v8 = v6;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [(AXDispatchTimer *)self->_shutdownTimer cancel];
    [(AXHeardController *)self _shutdownIfPossible];
  }
  else
  {
    uint64_t v9 = [NSString stringWithFormat:@"BT not yet ready, delaying shutdown check"];
    v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController shutdownIfPossible]", 383, v9];
    id v11 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      id v13 = v11;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = [v12 UTF8String];
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    shutdownTimer = self->_shutdownTimer;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __39__AXHeardController_shutdownIfPossible__block_invoke;
    v15[3] = &unk_2640FC960;
    v15[4] = self;
    [(AXDispatchTimer *)shutdownTimer afterDelay:v15 processBlock:1.0];
  }
}

uint64_t __39__AXHeardController_shutdownIfPossible__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) shutdownIfPossible];
}

- (void)_shouldBeRunning:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__AXHeardController__shouldBeRunning___block_invoke;
  v5[3] = &unk_2640FCEC8;
  id v6 = v3;
  id v4 = v3;
  hearingDeamonShouldBeRunning(v5);
}

uint64_t __38__AXHeardController__shouldBeRunning___block_invoke(uint64_t a1, char a2)
{
  if (a2) {
    goto LABEL_15;
  }
  id v3 = +[AXHAController sharedController];
  id v4 = [v3 liveListenController];
  int v5 = [v4 isListening];

  if (v5)
  {
    id v6 = HCLogHearingXPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = 0;
      id v7 = "heard will be running for Live Listen session";
      id v8 = (uint8_t *)&v18;
LABEL_13:
      _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  uint64_t v9 = +[HUHeadphoneLevelController sharedController];
  int v10 = [v9 isMeasurementEnabled];

  if (v10)
  {
    id v6 = HCLogHearingXPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      id v7 = "heard will be running for Headphone levels measurements";
      id v8 = (uint8_t *)&v17;
      goto LABEL_13;
    }
LABEL_14:

LABEL_15:
    uint64_t v14 = 1;
    goto LABEL_16;
  }
  id v11 = [getRTTSettingsClass_1() sharedInstance];
  if ([v11 TTYSoftwareEnabled])
  {

    goto LABEL_11;
  }
  id v12 = [getRTTSettingsClass_1() sharedInstance];
  int v13 = [v12 TTYHardwareEnabled];

  if (v13)
  {
LABEL_11:
    id v6 = HCLogHearingXPC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      id v7 = "heard will be running for RTT";
      id v8 = (uint8_t *)&v16;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v14 = 0;
LABEL_16:
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v14);
  }
  return result;
}

- (void)_shutdownIfPossible
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __40__AXHeardController__shutdownIfPossible__block_invoke;
  v2[3] = &unk_2640FCA50;
  v2[4] = self;
  [(AXHeardController *)self _shouldBeRunning:v2];
}

void __40__AXHeardController__shutdownIfPossible__block_invoke(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a2)
  {
    HAInitializeLogging();
    id v3 = [NSString stringWithFormat:@"heard should be running. Continuing"];
    id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController _shutdownIfPossible]_block_invoke", 435, v3];
    int v5 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v4;
      id v7 = v5;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = [v6 UTF8String];
      _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
LABEL_12:
    [*(id *)(a1 + 32) _setShutdownTimer];
    return;
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    HAInitializeLogging();
    int v10 = [NSString stringWithFormat:@"heard shouldn't be running. Starting timer"];
    id v11 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController _shutdownIfPossible]_block_invoke", 461, v10];
    id v12 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v11;
      uint64_t v14 = v12;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = [v13 UTF8String];
      _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
    goto LABEL_12;
  }
  id v8 = HCLogHearingNearbyIDS();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __40__AXHeardController__shutdownIfPossible__block_invoke_cold_1(v8);
  }

  uint64_t v9 = +[HUNearbySettings sharedInstance];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __40__AXHeardController__shutdownIfPossible__block_invoke_182;
  v15[3] = &unk_2640FC960;
  v15[4] = *(void *)(a1 + 32);
  [v9 saveCollectedDataWithCompletion:v15];
}

uint64_t __40__AXHeardController__shutdownIfPossible__block_invoke_182(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__AXHeardController__shutdownIfPossible__block_invoke_2;
  v3[3] = &unk_2640FCA50;
  v3[4] = v1;
  return [v1 _shouldBeRunning:v3];
}

uint64_t __40__AXHeardController__shutdownIfPossible__block_invoke_2(uint64_t a1, int a2)
{
  id v4 = HCLogHearingNearbyIDS();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __40__AXHeardController__shutdownIfPossible__block_invoke_2_cold_1(a2, v4);
  }

  if (!a2)
  {
    id v6 = +[AXHAController sharedController];
    [v6 cleanUp];

    id v7 = HCLogHearingXPC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "heard shouldn't be running. Shutting down.", v8, 2u);
    }

    exit(0);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  return [*(id *)(a1 + 32) _setShutdownTimer];
}

- (void)_setShutdownTimer
{
  objc_initWeak(&location, self);
  shutdownTimer = self->_shutdownTimer;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__AXHeardController__setShutdownTimer__block_invoke;
  v4[3] = &unk_2640FC910;
  objc_copyWeak(&v5, &location);
  [(AXDispatchTimer *)shutdownTimer afterDelay:v4 processBlock:180.0];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __38__AXHeardController__setShutdownTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained shutdownIfPossible];
}

- (void)updateAnalytics
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = [getPASettingsClass_0() sharedInstance];
  id v3 = [v2 personalMediaConfiguration];

  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu_%lu", objc_msgSend(v3, "level"), objc_msgSend(v3, "shape"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = &stru_26C1D5720;
  }
  id v5 = [getPASettingsClass_0() sharedInstance];
  uint64_t v6 = [v5 personalAudioAccommodationTypes];

  v27[0] = @"enabled";
  id v7 = NSNumber;
  id v8 = [getPASettingsClass_0() sharedInstance];
  uint64_t v9 = objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "personalMediaEnabled"));
  v28[0] = v9;
  v27[1] = @"mediaEnabled";
  int v10 = objc_msgSend(NSNumber, "numberWithBool:", compoundAttributeContainsAttribute(v6, 4));
  v28[1] = v10;
  v27[2] = @"phoneEnabled";
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", compoundAttributeContainsAttribute(v6, 2));
  v28[2] = v11;
  v27[3] = @"profile";
  v28[3] = v4;
  id v12 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];

  PAInitializeLogging();
  id v13 = [NSString stringWithFormat:@"Updating PME analytics %@", v12];
  uint64_t v14 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController updateAnalytics]", 494, v13];
  uint64_t v15 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v14;
    uint64_t v17 = v15;
    uint64_t v18 = [v16 UTF8String];
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }
  id v19 = v12;
  AnalyticsSendEventLazy();
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v20 = (void (*)(void *))getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsyncSymbolLoc_ptr;
  v26 = getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsyncSymbolLoc_ptr;
  if (!getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsyncSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v30 = __getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsyncSymbolLoc_block_invoke;
    v31 = &unk_2640FC9B0;
    v32 = &v23;
    v21 = (void *)PersonalAudioLibrary();
    uint64_t v22 = dlsym(v21, "paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync");
    *(void *)(v32[1] + 24) = v22;
    getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsyncSymbolLoc_ptr = *(_UNKNOWN **)(v32[1] + 24);
    uint64_t v20 = (void (*)(void *))v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v20)
  {
    getADAFMetadataKeyHAEDataForGauge_cold_1();
    __break(1u);
  }
  v20(&__block_literal_global_213);
}

id __36__AXHeardController_updateAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __36__AXHeardController_updateAnalytics__block_invoke_2(uint64_t a1, void *a2)
{
  v31[6] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v2 = [a2 address];
    v30[0] = @"enabled";
    id v3 = NSNumber;
    v27 = [getPASettingsClass_0() sharedInstance];
    v26 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v27, "transparencyCustomizedForAddress:", v2));
    v31[0] = v26;
    v30[1] = @"amplification";
    id v4 = NSNumber;
    uint64_t v25 = [getPASettingsClass_0() sharedInstance];
    [v25 transparencyAmplificationForAddress:v2];
    v24 = objc_msgSend(v4, "numberWithDouble:");
    v31[1] = v24;
    v30[2] = @"balance";
    id v5 = NSNumber;
    uint64_t v6 = [getPASettingsClass_0() sharedInstance];
    [v6 transparencyBalanceForAddress:v2];
    id v7 = objc_msgSend(v5, "numberWithDouble:");
    v31[2] = v7;
    v30[3] = @"beamformerEnabled";
    id v8 = NSNumber;
    uint64_t v9 = [getPASettingsClass_0() sharedInstance];
    int v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "transparencyBeamformingForAddress:", v2));
    v31[3] = v10;
    v30[4] = @"noiseSuppressorValue";
    id v11 = NSNumber;
    id v12 = [getPASettingsClass_0() sharedInstance];
    [v12 transparencyNoiseSupressorForAddress:v2];
    id v13 = objc_msgSend(v11, "numberWithDouble:");
    v31[4] = v13;
    v30[5] = @"tone";
    uint64_t v14 = NSNumber;
    uint64_t v15 = [getPASettingsClass_0() sharedInstance];
    [v15 transparencyToneForAddress:v2];
    id v16 = objc_msgSend(v14, "numberWithDouble:");
    v31[5] = v16;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];

    PAInitializeLogging();
    uint64_t v18 = [NSString stringWithFormat:@"Updating PSE analytics %@", v17];
    id v19 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController updateAnalytics]_block_invoke_2", 512, v18];
    uint64_t v20 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v19;
      uint64_t v22 = v20;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v29 = [v21 UTF8String];
      _os_log_impl(&dword_20CC86000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v23 = v17;
    AnalyticsSendEventLazy();
  }
}

id __36__AXHeardController_updateAnalytics__block_invoke_235(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updatePersonalAudioSettingsOnAccessories
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!self->_transparencyHysteresisTimer)
  {
    id v3 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x263F21398]);
    transparencyHysteresisTimer = self->_transparencyHysteresisTimer;
    self->_transparencyHysteresisTimer = v3;
  }
  id v5 = [getPASettingsClass_0() sharedInstance];
  if ([v5 shouldUpdateAccessory])
  {
    uint64_t v6 = [getPASettingsClass_0() sharedInstance];
    id v7 = [v6 personalMediaConfiguration];

    if (v7)
    {
      PAInitializeLogging();
      id v8 = NSString;
      uint64_t v9 = [getPASettingsClass_0() sharedInstance];
      unsigned int v10 = [v9 shouldUpdateAccessory];
      id v11 = [getPASettingsClass_0() sharedInstance];
      id v12 = [v11 personalMediaConfiguration];
      id v13 = [v8 stringWithFormat:@"Sending accessory update %d, %d", v10, v12 != 0];

      uint64_t v14 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController updatePersonalAudioSettingsOnAccessories]", 531, v13];
      uint64_t v15 = (void *)*MEMORY[0x263F472C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v14;
        uint64_t v17 = v15;
        *(_DWORD *)long long buf = 136446210;
        uint64_t v29 = [v16 UTF8String];
        _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      if (([(AXDispatchTimer *)self->_transparencyHysteresisTimer isPending] & 1) == 0) {
        [(AXDispatchTimer *)self->_transparencyHysteresisTimer afterDelay:&__block_literal_global_240 processBlock:0.1];
      }
      return;
    }
  }
  else
  {
  }
  PAInitializeLogging();
  uint64_t v18 = NSString;
  id v19 = [getPASettingsClass_0() sharedInstance];
  unsigned int v20 = [v19 shouldUpdateAccessory];
  id v21 = [getPASettingsClass_0() sharedInstance];
  uint64_t v22 = [v21 personalMediaConfiguration];
  id v23 = [v18 stringWithFormat:@"Skipping accessory update %d, %d", v20, v22 != 0];

  v24 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController updatePersonalAudioSettingsOnAccessories]", 543, v23];
  uint64_t v25 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v26 = v24;
    v27 = v25;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v29 = [v26 UTF8String];
    _os_log_impl(&dword_20CC86000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

void __61__AXHeardController_updatePersonalAudioSettingsOnAccessories__block_invoke()
{
  id v0 = [getPAAccessoryManagerClass() sharedInstance];
  [v0 sendUpdateToAccessory];
}

- (void)startServer
{
  id v3 = (void *)MEMORY[0x210557390](self, a2);
  objc_initWeak(&location, self);
  id v4 = [getRTTControllerClass() sharedController];
  [v4 setDelegate:self];
  id v5 = +[AXHAController sharedController];
  v89[0] = MEMORY[0x263EF8330];
  v89[1] = 3221225472;
  v89[2] = __32__AXHeardController_startServer__block_invoke;
  v89[3] = &unk_2640FEBD0;
  id v6 = v5;
  id v90 = v6;
  [(AXHeardController *)self addHandler:v6 andBlock:v89 forMessageIdentifier:2];
  v87[0] = MEMORY[0x263EF8330];
  v87[1] = 3221225472;
  v87[2] = __32__AXHeardController_startServer__block_invoke_2;
  v87[3] = &unk_2640FEBD0;
  id v7 = v6;
  id v88 = v7;
  [(AXHeardController *)self addHandler:v7 andBlock:v87 forMessageIdentifier:4];
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __32__AXHeardController_startServer__block_invoke_3;
  v85[3] = &unk_2640FEBD0;
  id v8 = v7;
  id v86 = v8;
  [(AXHeardController *)self addHandler:v8 andBlock:v85 forMessageIdentifier:16];
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __32__AXHeardController_startServer__block_invoke_4;
  v83[3] = &unk_2640FEBD0;
  id v9 = v8;
  id v84 = v9;
  [(AXHeardController *)self addHandler:v9 andBlock:v83 forMessageIdentifier:8];
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __32__AXHeardController_startServer__block_invoke_5;
  v81[3] = &unk_2640FEBD0;
  id v10 = v9;
  id v82 = v10;
  [(AXHeardController *)self addHandler:v10 andBlock:v81 forMessageIdentifier:32];
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = __32__AXHeardController_startServer__block_invoke_6;
  v79[3] = &unk_2640FEBD0;
  id v11 = v10;
  id v80 = v11;
  [(AXHeardController *)self addHandler:v11 andBlock:v79 forMessageIdentifier:128];
  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __32__AXHeardController_startServer__block_invoke_7;
  v77[3] = &unk_2640FEBD0;
  id v12 = v11;
  id v78 = v12;
  [(AXHeardController *)self addHandler:v12 andBlock:v77 forMessageIdentifier:256];
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __32__AXHeardController_startServer__block_invoke_8;
  v75[3] = &unk_2640FEBD0;
  id v13 = v12;
  id v76 = v13;
  [(AXHeardController *)self addHandler:v13 andBlock:v75 forMessageIdentifier:2048];
  v73[0] = MEMORY[0x263EF8330];
  v73[1] = 3221225472;
  v73[2] = __32__AXHeardController_startServer__block_invoke_9;
  v73[3] = &unk_2640FEBD0;
  id v14 = v13;
  id v74 = v14;
  [(AXHeardController *)self addHandler:v14 andBlock:v73 forMessageIdentifier:0x8000];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __32__AXHeardController_startServer__block_invoke_10;
  v71[3] = &unk_2640FEBD0;
  id v15 = v14;
  id v72 = v15;
  [(AXHeardController *)self addHandler:v15 andBlock:v71 forMessageIdentifier:0x2000];
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __32__AXHeardController_startServer__block_invoke_11;
  v69[3] = &unk_2640FEBD0;
  id v16 = v15;
  id v70 = v16;
  [(AXHeardController *)self addHandler:v16 andBlock:v69 forMessageIdentifier:0x8000000000000000];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __32__AXHeardController_startServer__block_invoke_12;
  v67[3] = &unk_2640FEBF8;
  objc_copyWeak(&v68, &location);
  [(AXHeardController *)self addHandler:self andBlock:v67 forMessageIdentifier:0x10000];
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __32__AXHeardController_startServer__block_invoke_13;
  v65[3] = &unk_2640FEBD0;
  id v17 = v16;
  id v66 = v17;
  [(AXHeardController *)self addHandler:self andBlock:v65 forMessageIdentifier:0x20000];
  [(AXHeardController *)self addHandler:v17 andBlock:&__block_literal_global_246 forMessageIdentifier:0x40000];
  uint64_t v18 = +[HUHeadphoneLevelController sharedController];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __32__AXHeardController_startServer__block_invoke_15;
  v63[3] = &unk_2640FEBD0;
  id v19 = v18;
  id v64 = v19;
  [(AXHeardController *)self addHandler:v19 andBlock:v63 forMessageIdentifier:0x100000];
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __32__AXHeardController_startServer__block_invoke_16;
  v61[3] = &unk_2640FEBD0;
  id v20 = v19;
  id v62 = v20;
  [(AXHeardController *)self addHandler:v20 andBlock:v61 forMessageIdentifier:0x200000];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __32__AXHeardController_startServer__block_invoke_17;
  v59[3] = &unk_2640FEBD0;
  id v21 = v20;
  id v60 = v21;
  [(AXHeardController *)self addHandler:v21 andBlock:v59 forMessageIdentifier:0x400000];
  uint64_t v22 = +[HUComfortSoundsController sharedController];
  [(AXHeardController *)self addHandler:v22 andBlock:&__block_literal_global_248 forMessageIdentifier:0x1000000];

  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __32__AXHeardController_startServer__block_invoke_19;
  v57[3] = &unk_2640FEBD0;
  id v23 = v4;
  id v58 = v23;
  [(AXHeardController *)self addHandler:v23 andBlock:v57 forMessageIdentifier:0x1000000000];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __32__AXHeardController_startServer__block_invoke_20;
  v55[3] = &unk_2640FEBD0;
  id v24 = v23;
  id v56 = v24;
  [(AXHeardController *)self addHandler:v24 andBlock:v55 forMessageIdentifier:0x800000000];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __32__AXHeardController_startServer__block_invoke_21;
  v53[3] = &unk_2640FEBD0;
  id v25 = v24;
  id v54 = v25;
  [(AXHeardController *)self addHandler:v25 andBlock:v53 forMessageIdentifier:0x2000000000];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __32__AXHeardController_startServer__block_invoke_22;
  v51[3] = &unk_2640FEBD0;
  id v26 = v25;
  id v52 = v26;
  [(AXHeardController *)self addHandler:v26 andBlock:v51 forMessageIdentifier:0x4000000000];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __32__AXHeardController_startServer__block_invoke_23;
  v49[3] = &unk_2640FEBD0;
  id v27 = v26;
  id v50 = v27;
  [(AXHeardController *)self addHandler:v27 andBlock:v49 forMessageIdentifier:0x8000000000];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __32__AXHeardController_startServer__block_invoke_24;
  v47[3] = &unk_2640FEBD0;
  id v28 = v27;
  id v48 = v28;
  [(AXHeardController *)self addHandler:v28 andBlock:v47 forMessageIdentifier:0x10000000000];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __32__AXHeardController_startServer__block_invoke_25;
  v45[3] = &unk_2640FEBD0;
  id v29 = v28;
  id v46 = v29;
  [(AXHeardController *)self addHandler:v29 andBlock:v45 forMessageIdentifier:0x20000000000];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __32__AXHeardController_startServer__block_invoke_26;
  v43[3] = &unk_2640FEBD0;
  id v30 = v29;
  id v44 = v30;
  [(AXHeardController *)self addHandler:v30 andBlock:v43 forMessageIdentifier:0x80000000000];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __32__AXHeardController_startServer__block_invoke_27;
  v41[3] = &unk_2640FEBD0;
  id v31 = v30;
  id v42 = v31;
  [(AXHeardController *)self addHandler:v31 andBlock:v41 forMessageIdentifier:0x100000000000];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __32__AXHeardController_startServer__block_invoke_28;
  v39[3] = &unk_2640FEBD0;
  id v32 = v31;
  id v40 = v32;
  [(AXHeardController *)self addHandler:v32 andBlock:v39 forMessageIdentifier:0x200000000000];

  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.SoundDetectionNotifications"];
  [v33 setDelegate:self];
  [v33 setWantsNotificationResponsesDelivered];
  v34 = (const char *)[(id)*MEMORY[0x263F47280] UTF8String];
  id v35 = MEMORY[0x263EF83A0];
  mach_service = xpc_connection_create_mach_service(v34, MEMORY[0x263EF83A0], 1uLL);
  service = self->_service;
  self->_service = mach_service;

  xpc_connection_set_event_handler(self->_service, &__block_literal_global_255);
  xpc_connection_set_target_queue(self->_service, v35);

  xpc_connection_resume(self->_service);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.accessibility.hearing.server.ready", 0, 0, 1u);
}

uint64_t __32__AXHeardController_startServer__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerForAvailableDevicesUpdates:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerForDeviceUpdates:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) readDeviceProperty:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeDeviceProperty:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) readAvailableDevices:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) toggleLiveListen:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerForLiveListenUpdates:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) readAvailableControllers:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) connectToControllerWithID:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) disconnectAndForceClient:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_11(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerForControlMessageUpdates:a2];
}

id __32__AXHeardController_startServer__block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained boostPriority:v3];

  return v5;
}

uint64_t __32__AXHeardController_startServer__block_invoke_13(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendMessagesPriority:a2];
}

id __32__AXHeardController_startServer__block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HUNoiseController sharedController];
  id v4 = [v3 registerForEnvironmentalDosimetryUpdates:v2];

  return v4;
}

uint64_t __32__AXHeardController_startServer__block_invoke_15(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerForHeadphoneLevelUpdates:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_16(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerForRemoteHeadphoneLevelUpdates:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_17(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerForRemoteHeadphoneLevelChangesUpdates:a2];
}

id __32__AXHeardController_startServer__block_invoke_18(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HUComfortSoundsController sharedController];
  id v4 = [v3 processComfortSoundsAssetRequest:v2];

  return v4;
}

uint64_t __32__AXHeardController_startServer__block_invoke_19(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) displayCallPrompt:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_20(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleDatabaseRequest:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_21(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleDictionaryRequest:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_22(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleSettingsRequest:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_23(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleIncomingNotificationSuppressionChange:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_24(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleDatabaseRequest:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_25(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleDatabaseRequest:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_26(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleMediaAction:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_27(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleRTTControllerIsVisible:a2];
}

uint64_t __32__AXHeardController_startServer__block_invoke_28(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleRTTVoicemailMessage:a2];
}

void __32__AXHeardController_startServer__block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (MEMORY[0x210557890]() == MEMORY[0x263EF8720])
  {
    HAInitializeLogging();
    objc_msgSend(NSString, "stringWithFormat:", @"XPC error: %s", xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x263EF86B0]));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController startServer]_block_invoke_29", 626, v3];
    id v7 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      id v9 = v7;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v11 = [v8 UTF8String];
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    id v3 = v2;
    id v4 = (void *)MEMORY[0x210557390]();
    id v5 = +[AXHeardController sharedServer];
    [v5 handleNewConnection:v3];
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v5 = (void (**)(void))a5;
  AXSDSoundDetectionHandleNotificationsForResponse();
  v5[2]();
}

- (void)dealloc
{
  xpc_connection_cancel(self->_service);
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXHeardController;
  [(AXHeardController *)&v4 dealloc];
}

- (BOOL)connection:(id)a3 hasEntitlementForMessage:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  xpc_connection_get_audit_token();
  memset(&token, 0, sizeof(token));
  SecTaskRef v6 = SecTaskCreateWithAuditToken(0, &token);
  if (v6)
  {
    id v7 = +[AXHeardController entitlementsForMessageID:a4];
    if ([v7 count])
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __57__AXHeardController_connection_hasEntitlementForMessage___block_invoke;
      v10[3] = &unk_2640FEC60;
      v10[4] = &v14;
      v10[5] = v6;
      [v7 enumerateObjectsUsingBlock:v10];
    }
    else
    {
      *((unsigned char *)v15 + 24) = 1;
    }
    CFRelease(v6);
  }
  char v8 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __57__AXHeardController_connection_hasEntitlementForMessage___block_invoke(uint64_t a1, const __CFString *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  CFTypeRef v6 = SecTaskCopyValueForEntitlement(*(SecTaskRef *)(a1 + 40), a2, &error);
  if (error)
  {
    HAInitializeLogging();
    id v7 = [NSString stringWithFormat:@"Unable to get entitlements for client task. Error: %@", error];
    char v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController connection:hasEntitlementForMessage:]_block_invoke", 682, v7];
    id v9 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v8;
      uint64_t v11 = v9;
      uint64_t v12 = [v10 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = v12;
      _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    CFRelease(error);
  }
  if (v6)
  {
    CFTypeID v13 = CFGetTypeID(v6);
    BOOL v14 = v13 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v6) != 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v14;
    CFRelease(v6);
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (NSArray)clients
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSArray *)v2->_clients copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setClients:(id)a3
{
  id v7 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  clients = v4->_clients;
  v4->_clients = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (NSDictionary)handlers
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSDictionary *)v2->_handlers copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)setHandlers:(id)a3
{
  id v7 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  handlers = v4->_handlers;
  v4->_handlers = (NSDictionary *)v5;

  objc_sync_exit(v4);
}

- (void)handleNewConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F472B8] clientWithConnection:v4];
  CFTypeRef v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__AXHeardController_handleNewConnection___block_invoke;
    block[3] = &unk_2640FC960;
    id v7 = v5;
    id v21 = v7;
    if (handleNewConnection__token != -1) {
      dispatch_once(&handleNewConnection__token, block);
    }
    char v8 = [(AXHeardController *)self clients];
    id v9 = (void *)[v8 mutableCopy];

    [v9 addObject:v7];
    [(AXHeardController *)self setClients:v9];
    id inited = objc_initWeak(&location, v4);
    objc_initWeak(&v18, self);
    objc_initWeak(&from, v7);
    id v11 = inited;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __41__AXHeardController_handleNewConnection___block_invoke_2;
    v13[3] = &unk_2640FECD8;
    objc_copyWeak(&v14, &from);
    v13[4] = self;
    objc_copyWeak(&v15, &v18);
    objc_copyWeak(&v16, &location);
    xpc_connection_set_event_handler((xpc_connection_t)v4, v13);

    uint64_t v12 = (_xpc_connection_s *)objc_loadWeakRetained(&location);
    xpc_connection_resume(v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __41__AXHeardController_handleNewConnection___block_invoke(uint64_t a1)
{
  id v2 = +[HUNearbySettings sharedInstance];
  objc_msgSend(v2, "incomingXPCMessageID:fromPid:", 0, objc_msgSend(*(id *)(a1 + 32), "pid"));
}

void __41__AXHeardController_handleNewConnection___block_invoke_2(id *a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x210557390]();
  uint64_t v5 = MEMORY[0x210557890](v3);
  if (v5 == MEMORY[0x263EF8720])
  {
    HAInitializeLogging();
    id v19 = [NSString stringWithFormat:@"Error in client connection event handler"];
    id v20 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController handleNewConnection:]_block_invoke_2", 761, v19];
    id v21 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v20;
      id v23 = v21;
      *(_DWORD *)long long buf = 136446210;
      *(void *)v49 = [v22 UTF8String];
      _os_log_impl(&dword_20CC86000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v24 = [getRTTControllerClass() sharedController];
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
    [v24 clientRemoved:WeakRetained];

    id v26 = objc_loadWeakRetained(a1 + 5);
    [v26 teardownConnection];

    v46[1] = (id)MEMORY[0x263EF8330];
    v46[2] = (id)3221225472;
    v46[3] = __41__AXHeardController_handleNewConnection___block_invoke_269;
    v46[4] = &unk_2640FD1D0;
    v46[5] = a1[4];
    objc_copyWeak(&v47, a1 + 5);
    AXPerformBlockSynchronouslyOnMainThread();
    objc_destroyWeak(&v47);
  }
  else if (v5 == MEMORY[0x263EF8708])
  {
    v46[0] = 0;
    v43 = [MEMORY[0x263F21408] dictionaryFromXPCMessage:v3 error:v46];
    id v42 = v46[0];
    CFTypeRef v6 = [v43 objectForKey:*MEMORY[0x263F47268]];
    unint64_t v7 = [v6 unsignedLongLongValue];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__AXHeardController_handleNewConnection___block_invoke_4;
    block[3] = &unk_2640FECB0;
    v45[1] = (id)v7;
    char v8 = a1 + 5;
    objc_copyWeak(v45, a1 + 5);
    if (CCSIconElementRequestErrorDomain_block_invoke_token == -1)
    {
      if (v7)
      {
LABEL_5:
        id v9 = a1 + 6;
        id v10 = objc_loadWeakRetained(a1 + 6);
        id v11 = a1 + 7;
        id v12 = objc_loadWeakRetained(a1 + 7);
        int v13 = [v10 connection:v12 hasEntitlementForMessage:v7];

        if (v13)
        {
          id v14 = [v43 objectForKey:*MEMORY[0x263F47270]];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = (void *)MEMORY[0x263F472C0];
            id v16 = objc_loadWeakRetained(v8);
            uint64_t v17 = [v15 messageWithPayload:v14 xpcMessage:v3 andClient:v16];

            if (v17)
            {
              id v18 = objc_loadWeakRetained(v9);
              [v18 handleMessage:v17 forIdentifier:v7];
            }
          }
          goto LABEL_23;
        }
        if (v7 >> 35)
        {
          id v14 = AXLogRTT();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v35 = (_xpc_connection_s *)objc_loadWeakRetained(v11);
            pid_t pid = xpc_connection_get_pid(v35);
            id v37 = (_xpc_connection_s *)objc_loadWeakRetained(v11);
            name = xpc_connection_get_name(v37);
            id v39 = objc_loadWeakRetained(v8);
            *(_DWORD *)long long buf = 67109890;
            *(_DWORD *)v49 = pid;
            *(_WORD *)&void v49[4] = 2080;
            *(void *)&v49[6] = name;
            __int16 v50 = 2048;
            unint64_t v51 = v7;
            __int16 v52 = 2112;
            id v53 = v39;
            _os_log_error_impl(&dword_20CC86000, v14, OS_LOG_TYPE_ERROR, "Message missing entitlement %d - %s, message: %llu: %@", buf, 0x26u);
          }
          goto LABEL_23;
        }
        HAInitializeLogging();
        double v41 = NSString;
        id v27 = (_xpc_connection_s *)objc_loadWeakRetained(v11);
        uint64_t v28 = xpc_connection_get_pid(v27);
        id v29 = (_xpc_connection_s *)objc_loadWeakRetained(v11);
        id v30 = xpc_connection_get_name(v29);
        id v31 = objc_loadWeakRetained(v8);
        id v14 = [v41 stringWithFormat:@"Message missing entitlement %d - %llu - %s: %@", v28, v7, v30, v31];

        id v32 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController handleNewConnection:]_block_invoke_5", 818, v14];
        uint64_t v33 = (id)*MEMORY[0x263F47290];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = [v32 UTF8String];
          *(_DWORD *)long long buf = 136446210;
          *(void *)v49 = v34;
          _os_log_impl(&dword_20CC86000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
LABEL_22:

LABEL_23:
        objc_destroyWeak(v45);

        goto LABEL_24;
      }
    }
    else
    {
      dispatch_once(&CCSIconElementRequestErrorDomain_block_invoke_token, block);
      if (v7) {
        goto LABEL_5;
      }
    }
    HAInitializeLogging();
    id v14 = [NSString stringWithFormat:@"Malformed message %@", v43];
    id v32 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController handleNewConnection:]_block_invoke", 828, v14];
    uint64_t v33 = (id)*MEMORY[0x263F47290];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = [v32 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      *(void *)v49 = v40;
      _os_log_impl(&dword_20CC86000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    goto LABEL_22;
  }
LABEL_24:
}

void __41__AXHeardController_handleNewConnection___block_invoke_269(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clients];
  id v3 = (void *)[v2 mutableCopy];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 removeObject:WeakRetained];

  [*(id *)(a1 + 32) setClients:v3];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  uint64_t v5 = [*(id *)(a1 + 32) clients];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__AXHeardController_handleNewConnection___block_invoke_2_270;
  v8[3] = &unk_2640FEC88;
  v8[4] = v9;
  [v5 enumerateObjectsUsingBlock:v8];

  CFTypeRef v6 = +[AXHearingAidDeviceController sharedController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__AXHeardController_handleNewConnection___block_invoke_3;
  v7[3] = &unk_2640FE888;
  v7[4] = v9;
  [v6 checkPartiallyPairedWithCompletion:v7];

  _Block_object_dispose(v9, 8);
}

uint64_t __41__AXHeardController_handleNewConnection___block_invoke_2_270(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 wantsUpdatesForIdentifier:32];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __41__AXHeardController_handleNewConnection___block_invoke_3(uint64_t a1, char a2)
{
  if (a2)
  {
    unsigned int v3 = 1;
  }
  else
  {
    id v4 = +[HUHearingAidSettings sharedInstance];
    unsigned int v3 = [v4 isiCloudPaired] ^ 1;
  }
  uint64_t v5 = +[AXHAController sharedController];
  id v7 = v5;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  [v5 setListenForAvailableDeviceUpdates:v6];
}

void __41__AXHeardController_handleNewConnection___block_invoke_4(uint64_t a1)
{
  id v4 = +[HUNearbySettings sharedInstance];
  uint64_t v2 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v4, "incomingXPCMessageID:fromPid:", v2, objc_msgSend(WeakRetained, "pid"));
}

- (BOOL)sendMessage:(id)a3 withError:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 client];
  char v6 = [v5 sendMessage:v4 errorBlock:&__block_literal_global_285];

  return v6;
}

void __43__AXHeardController_sendMessage_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  HAInitializeLogging();
  unsigned int v3 = [NSString stringWithFormat:@"Error: %@", v2];

  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController sendMessage:withError:]_block_invoke", 841, v3];
  uint64_t v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)sendUpdateMessage:(id)a3 forIdentifier:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x210557390]();
  char v8 = [v6 payload];
  unint64_t v9 = [v8 count];

  if (v9 >= 2)
  {
    uint64_t v10 = [(AXHeardController *)self clients];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__AXHeardController_sendUpdateMessage_forIdentifier___block_invoke;
    v11[3] = &unk_2640FED20;
    unint64_t v13 = a4;
    id v12 = v6;
    [v10 enumerateObjectsUsingBlock:v11];
  }
}

void __53__AXHeardController_sendUpdateMessage_forIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 wantsUpdatesForIdentifier:*(void *)(a1 + 40)]) {
    [v3 sendMessage:*(void *)(a1 + 32) errorBlock:&__block_literal_global_290];
  }
}

void __53__AXHeardController_sendUpdateMessage_forIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  HAInitializeLogging();
  id v3 = [NSString stringWithFormat:@"Error: %@", v2];

  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController sendUpdateMessage:forIdentifier:]_block_invoke_2", 854, v3];
  uint64_t v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)sendClientsMessageWithPayload:(id)a3 excluding:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    char v8 = [(AXHeardController *)self clients];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__AXHeardController_sendClientsMessageWithPayload_excluding___block_invoke;
    void v9[3] = &unk_2640FED48;
    id v10 = v7;
    id v11 = v6;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

void __61__AXHeardController_sendClientsMessageWithPayload_excluding___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v3 = [MEMORY[0x263F472C0] messageWithPayload:*(void *)(a1 + 40)];
    [v4 sendMessage:v3 errorBlock:&__block_literal_global_292];
  }
}

void __61__AXHeardController_sendClientsMessageWithPayload_excluding___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  HAInitializeLogging();
  id v3 = [NSString stringWithFormat:@"Error: %@", v2];

  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController sendClientsMessageWithPayload:excluding:]_block_invoke_2", 870, v3];
  uint64_t v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (unint64_t)countOfClientsListeningForIdentifier:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(AXHeardController *)self clients];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__AXHeardController_countOfClientsListeningForIdentifier___block_invoke;
  v18[3] = &__block_descriptor_40_e28_B32__0__HCXPCClient_8Q16_B24l;
  void v18[4] = a3;
  id v6 = [v5 indexesOfObjectsPassingTest:v18];

  HAInitializeLogging();
  id v7 = NSString;
  char v8 = [(AXHeardController *)self clients];
  uint64_t v9 = [v8 objectsAtIndexes:v6];
  uint64_t v10 = [v7 stringWithFormat:@"Found clients %llu = %@", a3, v9];

  id v11 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController countOfClientsListeningForIdentifier:]", 883, v10];
  id v12 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v11;
    id v14 = v12;
    uint64_t v15 = [v13 UTF8String];
    *(_DWORD *)long long buf = 136446210;
    uint64_t v20 = v15;
    _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  unint64_t v16 = [v6 count];

  return v16;
}

uint64_t __58__AXHeardController_countOfClientsListeningForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 wantsUpdatesForIdentifier:*(void *)(a1 + 32)];
}

- (void)addHandler:(id)a3 andBlock:(id)a4 forMessageIdentifier:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v13 = [[AXHAMessageHandlerContext alloc] initWithTarget:v9 block:v8];

  if (v13)
  {
    uint64_t v10 = [(AXHeardController *)self handlers];
    id v11 = (void *)[v10 mutableCopy];

    id v12 = [NSNumber numberWithUnsignedLongLong:a5];
    [v11 setObject:v13 forKey:v12];

    [(AXHeardController *)self setHandlers:v11];
  }
}

- (void)handleMessage:(id)a3 forIdentifier:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 == 0x800000000)
  {
    id v7 = *MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218498;
      uint64_t v20 = 0x800000000;
      __int16 v21 = 2160;
      uint64_t v22 = 1752392040;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%llu - %{mask.hash}@", buf, 0x20u);
    }
  }
  else
  {
    HAInitializeLogging();
    id v8 = [NSString stringWithFormat:@"%llu - %@", a4, v6];
    id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController handleMessage:forIdentifier:]", 910, v8];
    uint64_t v10 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v9;
      id v12 = v10;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v20 = [v11 UTF8String];
      _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  id v13 = (void *)MEMORY[0x210557390]();
  id v14 = [(AXHeardController *)self handlers];
  uint64_t v15 = [NSNumber numberWithUnsignedLongLong:a4];
  unint64_t v16 = [v14 objectForKey:v15];

  if (v6 && v16)
  {
    uint64_t v17 = [v16 block];
    id v18 = ((void (**)(void, id))v17)[2](v17, v6);

    if (v18) {
      [(AXHeardController *)self sendMessage:v18 withError:0];
    }
  }
}

- (id)boostPriority:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  id v6 = [v5 objectForKey:@"ax_hearing_should_register_client_key"];
  uint64_t v7 = [v6 BOOLValue];

  id v8 = [v4 client];
  [v8 setWantsUpdates:v7 forIdentifier:0x10000];

  id v9 = +[AXHeardController sharedServer];
  uint64_t v10 = [v9 countOfClientsListeningForIdentifier:0x10000];

  if (v10) {
    id v11 = v4;
  }
  else {
    id v11 = 0;
  }
  [(AXHeardController *)self setBoostMessage:v11];
  HAInitializeLogging();
  id v12 = NSString;
  id v13 = [(AXHeardController *)self boostMessage];
  id v14 = [v12 stringWithFormat:@"Setting boost %@", v13];

  uint64_t v15 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHeardController boostPriority:]", 939, v14];
  unint64_t v16 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v15;
    id v18 = v16;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v21 = [v17 UTF8String];
    _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return 0;
}

- (void)registerFakeClient:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(AXHeardController *)self clients];
    id v6 = (id)[v5 mutableCopy];

    [v6 addObject:v4];
    [(AXHeardController *)self setClients:v6];
  }
}

- (OS_dispatch_queue)personalAudioQueue
{
  return self->_personalAudioQueue;
}

- (void)setPersonalAudioQueue:(id)a3
{
}

- (HCXPCMessage)boostMessage
{
  return self->_boostMessage;
}

- (void)setBoostMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boostMessage, 0);
  objc_storeStrong((id *)&self->_personalAudioQueue, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_shutdownTimer, 0);

  objc_storeStrong((id *)&self->_transparencyHysteresisTimer, 0);
}

void __40__AXHeardController__shutdownIfPossible__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_20CC86000, log, OS_LOG_TYPE_DEBUG, "Will shutdown, save IDS stats", v1, 2u);
}

void __40__AXHeardController__shutdownIfPossible__block_invoke_2_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_20CC86000, a2, OS_LOG_TYPE_DEBUG, "IDS stats is saved, should be running: %d", (uint8_t *)v2, 8u);
}

@end