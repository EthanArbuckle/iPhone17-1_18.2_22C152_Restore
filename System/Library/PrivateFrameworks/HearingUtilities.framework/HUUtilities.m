@interface HUUtilities
+ (BOOL)shouldUseMultideviceV3;
+ (id)XDCObjectFromObject:(id)a3;
+ (id)objectFromXDCObject:(id)a3;
+ (id)sharedUtilities;
- (BOOL)currentRouteSupportsBackgroundSounds;
- (BOOL)deviceIsTinker;
- (BOOL)headphoneStreamSelected;
- (BOOL)hearingAidRouteAvailable;
- (BOOL)hearingAidRouteAvailableForAvailableRoutes:(id)a3;
- (BOOL)hearingAidStreamSelected;
- (BOOL)hearingAidStreamSelectedForAvailableRoutes:(id)a3;
- (BOOL)liveListenRouteSelected;
- (BOOL)liveListenRouteSelectedForAvailableRoutes:(id)a3;
- (BOOL)takingConnection;
- (BOOL)wirelessSplitterEnabled;
- (HURoutesManager)routesManager;
- (HUUtilities)init;
- (OS_dispatch_queue)routingQueue;
- (id)currentPickableAudioRoutes;
- (id)currentPickableAudioRoutesIfExist;
- (id)liveListenDevice;
- (unint64_t)backgroundSoundsRouteDecision;
- (void)addHearingFeatureUsage:(unint64_t)a3;
- (void)checkAudioPlayingWithQueue:(id)a3 andCompletion:(id)a4;
- (void)checkAudioPlayingWithQueue:(id)a3 origin:(void *)a4 andCompletion:(id)a5;
- (void)clearAudioRoutes;
- (void)dealloc;
- (void)hearingAidRouteAvailableAsync:(id)a3;
- (void)hearingAidStreamSelectedAsync:(id)a3;
- (void)liveListenRouteSelectedAsync:(id)a3;
- (void)pauseNowPlaying:(BOOL)a3 withQueue:(id)a4 andCompletion:(id)a5;
- (void)requestCurrentRoutesWithCompletion:(id)a3;
- (void)setRoutesManager:(id)a3;
- (void)setRoutingQueue:(id)a3;
- (void)setTakingConnection:(BOOL)a3;
- (void)updateHearingFeatureUsage;
- (void)updateWirelessSplitterState;
@end

@implementation HUUtilities

- (id)currentPickableAudioRoutes
{
  v2 = [(HUUtilities *)self routesManager];
  v3 = [v2 fetchCurrentPickableAudioRoutesIfNeeded];

  return v3;
}

- (HURoutesManager)routesManager
{
  return self->_routesManager;
}

- (BOOL)wirelessSplitterEnabled
{
  return self->_wirelessSplitterEnabled;
}

+ (id)sharedUtilities
{
  if (sharedUtilities_onceToken != -1) {
    dispatch_once(&sharedUtilities_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedUtilities_UtilityProvider;

  return v2;
}

- (BOOL)currentRouteSupportsBackgroundSounds
{
  return [(HUUtilities *)self backgroundSoundsRouteDecision] == 1;
}

- (void)clearAudioRoutes
{
  id v2 = [(HUUtilities *)self routesManager];
  [v2 clearAudioRoutes];
}

- (unint64_t)backgroundSoundsRouteDecision
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = [(HUUtilities *)self currentPickableAudioRoutes];
  v3 = +[HUUtilities sharedUtilities];
  int v4 = [v3 wirelessSplitterEnabled];

  v5 = (os_log_t *)MEMORY[0x263F47288];
  if (v4)
  {
    CSInitializeLogging();
    v6 = [NSString stringWithFormat:@"Wireless splitter active."];
    v7 = [NSString stringWithFormat:@"%s:%d %@", "-[HUUtilities backgroundSoundsRouteDecision]", 123, v6];
    os_log_t v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v7;
      v10 = v8;
      *(_DWORD *)buf = 136446210;
      uint64_t v24 = [v9 UTF8String];
      _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v11 = 3;
  }
  else
  {
    uint64_t v11 = 1;
  }
  v12 = [v2 valueForKey:@"AXSHARoutePicked"];
  v13 = [v12 valueForKey:@"BTDetails_IsHFPRoute"];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    CSInitializeLogging();
    v15 = [NSString stringWithFormat:@"HFP active."];
    v16 = [NSString stringWithFormat:@"%s:%d %@", "-[HUUtilities backgroundSoundsRouteDecision]", 130, v15];
    os_log_t v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v16;
      v19 = v17;
      uint64_t v20 = [v18 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v24 = v20;
      _os_log_impl(&dword_20CC86000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v11 = 2;
  }
  if (_AXSInUnitTestMode()) {
    unint64_t v21 = 1;
  }
  else {
    unint64_t v21 = v11;
  }

  return v21;
}

uint64_t __30__HUUtilities_sharedUtilities__block_invoke()
{
  sharedUtilities_UtilityProvider = objc_alloc_init(HUUtilities);

  return MEMORY[0x270F9A758]();
}

- (OS_dispatch_queue)routingQueue
{
  id v2 = [(HUUtilities *)self routesManager];
  v3 = [v2 routingQueue];

  return (OS_dispatch_queue *)v3;
}

- (void)updateWirelessSplitterState
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t state64 = -1;
  notify_get_state(self->_wirelessSplitterNotifyToken, &state64);
  self->_wirelessSplitterEnabled = state64 & 1;
  HAInitializeLogging();
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"Wireless splitter updated %d", self->_wirelessSplitterEnabled);
  int v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUUtilities updateWirelessSplitterState]", 109, v3];
  v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    v7 = v5;
    uint64_t v8 = [v6 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = v8;
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(HUUtilities *)self clearAudioRoutes];
}

- (HUUtilities)init
{
  v16.receiver = self;
  v16.super_class = (Class)HUUtilities;
  id v2 = [(HUUtilities *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    routesManager = v2->_routesManager;
    v2->_routesManager = (HURoutesManager *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)UserRequestedAudioTransferCompleteNotification, @"com.apple.accessibility.hearing.audio.transfer.complete", 0, (CFNotificationSuspensionBehavior)0);
    id v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)UserRequestedAudioTransferNotification_0, @"com.apple.accessibility.hearing.audio.transfer", 0, (CFNotificationSuspensionBehavior)0);
    objc_initWeak(&location, v2);
    v7 = MEMORY[0x263EF83A0];
    id v8 = MEMORY[0x263EF83A0];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __19__HUUtilities_init__block_invoke;
    v13 = &unk_2640FDC78;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch("com.apple.bluetooth.WirelessSplitterOn", &v2->_wirelessSplitterNotifyToken, v7, &v10);

    [(HUUtilities *)v2 updateWirelessSplitterState];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __19__HUUtilities_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateWirelessSplitterState];

  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"com.apple.accessibility.hearing.wireless.splitter.changed" object:0];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.accessibility.hearing.audio.transfer.complete", 0);
  int v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"com.apple.accessibility.hearing.audio.transfer", 0);
  v5.receiver = self;
  v5.super_class = (Class)HUUtilities;
  [(HUUtilities *)&v5 dealloc];
}

- (BOOL)hearingAidStreamSelected
{
  id v2 = self;
  uint64_t v3 = [(HUUtilities *)self currentPickableAudioRoutes];
  LOBYTE(v2) = [(HUUtilities *)v2 hearingAidStreamSelectedForAvailableRoutes:v3];

  return (char)v2;
}

- (void)hearingAidStreamSelectedAsync:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HUUtilities *)self routesManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__HUUtilities_hearingAidStreamSelectedAsync___block_invoke;
  v7[3] = &unk_2640FE838;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchCurrentPickableAudioRoutesIfNeededAsync:v7];
}

uint64_t __45__HUUtilities_hearingAidStreamSelectedAsync___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (v2)
  {
    uint64_t v3 = [*(id *)(result + 32) hearingAidStreamSelectedForAvailableRoutes:a2];
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (BOOL)hearingAidStreamSelectedForAvailableRoutes:(id)a3
{
  uint64_t v3 = [a3 valueForKey:@"AXSHARoutePicked"];
  id v4 = [v3 valueForKey:@"AVAudioRouteName"];
  char v5 = [v4 isEqual:@"BluetoothLEOutput"];

  return v5;
}

- (BOOL)hearingAidRouteAvailable
{
  uint64_t v2 = self;
  uint64_t v3 = [(HUUtilities *)self currentPickableAudioRoutes];
  LOBYTE(v2) = [(HUUtilities *)v2 hearingAidRouteAvailableForAvailableRoutes:v3];

  return (char)v2;
}

- (void)hearingAidRouteAvailableAsync:(id)a3
{
  id v4 = a3;
  char v5 = [(HUUtilities *)self routesManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__HUUtilities_hearingAidRouteAvailableAsync___block_invoke;
  v7[3] = &unk_2640FE838;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchCurrentPickableAudioRoutesIfNeededAsync:v7];
}

uint64_t __45__HUUtilities_hearingAidRouteAvailableAsync___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (v2)
  {
    uint64_t v3 = [*(id *)(result + 32) hearingAidRouteAvailableForAvailableRoutes:a2];
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (BOOL)hearingAidRouteAvailableForAvailableRoutes:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 valueForKey:@"AXSHARouteHearingAid"];
  HAInitializeLogging();
  char v5 = [NSString stringWithFormat:@"%@", v3];

  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUUtilities hearingAidRouteAvailableForAvailableRoutes:]", 224, v5];
  v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    id v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return v4 != 0;
}

- (BOOL)liveListenRouteSelected
{
  uint64_t v2 = self;
  id v3 = [(HUUtilities *)self currentPickableAudioRoutes];
  LOBYTE(v2) = [(HUUtilities *)v2 liveListenRouteSelectedForAvailableRoutes:v3];

  return (char)v2;
}

- (void)liveListenRouteSelectedAsync:(id)a3
{
  id v4 = a3;
  char v5 = [(HUUtilities *)self routesManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__HUUtilities_liveListenRouteSelectedAsync___block_invoke;
  v7[3] = &unk_2640FE838;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchCurrentPickableAudioRoutesIfNeededAsync:v7];
}

uint64_t __44__HUUtilities_liveListenRouteSelectedAsync___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (v2)
  {
    uint64_t v3 = [*(id *)(result + 32) liveListenRouteSelectedForAvailableRoutes:a2];
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (BOOL)liveListenRouteSelectedForAvailableRoutes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HUUtilities *)self hearingAidStreamSelectedForAvailableRoutes:v4];
  id v6 = [v4 valueForKey:@"AXSHARouteLiveListen"];

  v7 = [v6 valueForKey:*MEMORY[0x263F54440]];
  unsigned int v8 = [v7 BOOLValue];

  HAInitializeLogging();
  id v9 = [NSString stringWithFormat:@"%d, %d %@", v5, v8, v6];
  uint64_t v10 = [NSString stringWithFormat:@"%s:%d %@", "-[HUUtilities liveListenRouteSelectedForAvailableRoutes:]", 251, v9];
  uint64_t v11 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v10;
    uint64_t v13 = v11;
    *(_DWORD *)buf = 136446210;
    uint64_t v16 = [v12 UTF8String];
    _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return v5 | v8;
}

- (BOOL)headphoneStreamSelected
{
  uint64_t v2 = [(HUUtilities *)self currentPickableAudioRoutes];
  uint64_t v3 = [v2 valueForKey:@"AXSHARoutePicked"];
  id v4 = [v3 valueForKey:@"AVAudioRouteName"];
  char v5 = [v4 hasPrefix:@"Headphone"];

  return v5;
}

- (id)currentPickableAudioRoutesIfExist
{
  uint64_t v2 = [(HUUtilities *)self routesManager];
  uint64_t v3 = [v2 currentPickableAudioRoutes];

  return v3;
}

- (void)requestCurrentRoutesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HUUtilities *)self routesManager];
  [v5 fetchCurrentPickableAudioRoutesIfNeededAsync:v4];
}

- (void)checkAudioPlayingWithQueue:(id)a3 origin:(void *)a4 andCompletion:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  if (v7)
  {
    if (!v6)
    {
      dispatch_get_global_queue(0, 0);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = v7;
    MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();
  }
}

uint64_t __63__HUUtilities_checkAudioPlayingWithQueue_origin_andCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkAudioPlayingWithQueue:(id)a3 andCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HUUtilities *)self checkAudioPlayingWithQueue:v7 origin:MRMediaRemoteGetLocalOrigin() andCompletion:v6];
}

- (void)pauseNowPlaying:(BOOL)a3 withQueue:(id)a4 andCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    dispatch_get_global_queue(0, 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke;
  v12[3] = &unk_2640FE8D8;
  BOOL v16 = a3;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(HUUtilities *)self checkAudioPlayingWithQueue:v11 andCompletion:v12];
}

void __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke(int8x16_t *a1, int a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (a1[3].i8[8])
    {
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      BOOL v30 = 0;
      BOOL v30 = MRMediaRemoteSendCommandToApp() != 0;
      dispatch_time_t v3 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_2;
      block[3] = &unk_2640FE8B0;
      int8x16_t v19 = a1[2];
      int8x16_t v25 = vextq_s8(v19, v19, 8uLL);
      v26 = &v27;
      dispatch_after(v3, (dispatch_queue_t)(id)v19.i64[0], block);
      HAInitializeLogging();
      if (*((unsigned char *)v28 + 24)) {
        id v4 = @"success";
      }
      else {
        id v4 = @"fail";
      }
      id v5 = [NSString stringWithFormat:@"Media Pause command %@", v4];
      id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUUtilities pauseNowPlaying:withQueue:andCompletion:]_block_invoke", 339, v5];
      id v7 = (id)*MEMORY[0x263F47290];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v6 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v32 = v8;
        _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }

      uint64_t v9 = a1[3].i64[0];
      if (v9) {
        (*(void (**)(uint64_t, void))(v9 + 16))(v9, *((unsigned __int8 *)v28 + 24));
      }

LABEL_24:
      _Block_object_dispose(&v27, 8);
      return;
    }
LABEL_16:
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    BOOL v30 = 0;
    BOOL v30 = MRMediaRemoteSendCommandToApp() != 0;
    dispatch_time_t v12 = dispatch_time(0, 500000000);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_48;
    v21[3] = &unk_2640FE8B0;
    int8x16_t v20 = a1[2];
    int8x16_t v22 = vextq_s8(v20, v20, 8uLL);
    v23 = &v27;
    dispatch_after(v12, (dispatch_queue_t)(id)v20.i64[0], v21);
    HAInitializeLogging();
    if (*((unsigned char *)v28 + 24)) {
      id v13 = @"success";
    }
    else {
      id v13 = @"fail";
    }
    id v14 = [NSString stringWithFormat:@"Media Play command %@", v13];
    id v15 = [NSString stringWithFormat:@"%s:%d %@", "-[HUUtilities pauseNowPlaying:withQueue:andCompletion:]_block_invoke", 360, v14];
    BOOL v16 = (id)*MEMORY[0x263F47290];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v15 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v32 = v17;
      _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    uint64_t v18 = a1[3].i64[0];
    if (v18) {
      (*(void (**)(uint64_t, void))(v18 + 16))(v18, *((unsigned __int8 *)v28 + 24));
    }

    goto LABEL_24;
  }
  if (!a1[3].i8[8]) {
    goto LABEL_16;
  }
  uint64_t v10 = a1[3].i64[0];
  if (v10)
  {
    id v11 = *(void (**)(void))(v10 + 16);
    v11();
  }
}

uint64_t __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_3;
  v4[3] = &unk_2640FE888;
  v4[4] = a1[6];
  return [v2 checkAudioPlayingWithQueue:v1 andCompletion:v4];
}

void __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = MRMediaRemoteSendCommandToApp() != 0;
    HAInitializeLogging();
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      dispatch_time_t v3 = @"success";
    }
    else {
      dispatch_time_t v3 = @"fail";
    }
    id v4 = [NSString stringWithFormat:@"Retried media pause, %@", v3];
    id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUUtilities pauseNowPlaying:withQueue:andCompletion:]_block_invoke_3", 334, v4];
    id v6 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      uint64_t v8 = v6;
      *(_DWORD *)buf = 136446210;
      uint64_t v10 = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_48(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_2_49;
  v4[3] = &unk_2640FE888;
  v4[4] = a1[6];
  return [v2 checkAudioPlayingWithQueue:v1 andCompletion:v4];
}

void __55__HUUtilities_pauseNowPlaying_withQueue_andCompletion___block_invoke_2_49(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = MRMediaRemoteSendCommandToApp() != 0;
    HAInitializeLogging();
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      dispatch_time_t v3 = @"success";
    }
    else {
      dispatch_time_t v3 = @"fail";
    }
    id v4 = [NSString stringWithFormat:@"Retried media play, %@", v3];
    id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUUtilities pauseNowPlaying:withQueue:andCompletion:]_block_invoke_2", 355, v4];
    id v6 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      uint64_t v8 = v6;
      *(_DWORD *)buf = 136446210;
      uint64_t v10 = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (id)liveListenDevice
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int8x16_t v20 = __Block_byref_object_copy__6;
  unint64_t v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(HUUtilities *)self currentPickableAudioRoutes];
  id v5 = [v4 objectForKey:@"AXSHARouteLiveListen"];
  id v6 = [v5 objectForKey:*MEMORY[0x263F54460]];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __31__HUUtilities_liveListenDevice__block_invoke;
  v14[3] = &unk_2640FE900;
  id v7 = v6;
  id v15 = v7;
  BOOL v16 = &v17;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __31__HUUtilities_liveListenDevice__block_invoke_2;
  v12[3] = &unk_2640FCA50;
  uint64_t v8 = v3;
  id v13 = v8;
  iteratePairedBluetoothDevicesOnQueueCBv1(v14, v12);
  dispatch_time_t v9 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v8, v9);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v10;
}

uint64_t __31__HUUtilities_liveListenDevice__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = [v4 address];
  uint64_t v7 = [v5 containsString:v6];

  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }

  return v7;
}

intptr_t __31__HUUtilities_liveListenDevice__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addHearingFeatureUsage:(unint64_t)a3
{
  id v4 = +[HUHearingAidSettings sharedInstance];
  uint64_t v5 = [v4 usedHearingFeatures];

  uint64_t v6 = compoundAttributeByAddingAttribute(v5, a3);
  id v7 = +[HUHearingAidSettings sharedInstance];
  [v7 setUsedHearingFeatures:v6];
}

- (void)updateHearingFeatureUsage
{
  uint64_t v2 = +[HUHearingAidSettings sharedInstance];
  uint64_t v3 = [v2 usedHearingFeatures];

  id v4 = +[HUHearingAidSettings sharedInstance];
  if ([v4 isPairedWithRealHearingAids]) {
    uint64_t v5 = compoundAttributeByAddingAttribute(v3, 2);
  }
  else {
    uint64_t v5 = compoundAttributeByRemovingAttribute(v3, 2);
  }
  uint64_t v6 = v5;

  if (AXHACHearingAidComplianceEnabled()) {
    uint64_t v7 = compoundAttributeByAddingAttribute(v6, 4);
  }
  else {
    uint64_t v7 = compoundAttributeByRemovingAttribute(v6, 4);
  }
  uint64_t v8 = v7;
  dispatch_time_t v9 = [getRTTSettingsClass_0() sharedInstance];
  if ([v9 TTYHardwareEnabled])
  {
    uint64_t v10 = compoundAttributeByAddingAttribute(v8, 16);
  }
  else
  {
    uint64_t v11 = [getRTTSettingsClass_0() sharedInstance];
    if ([v11 TTYSoftwareEnabled]) {
      uint64_t v12 = compoundAttributeByAddingAttribute(v8, 16);
    }
    else {
      uint64_t v12 = compoundAttributeByRemovingAttribute(v8, 16);
    }
    uint64_t v10 = v12;
  }
  if (_AXSMonoAudioEnabled()) {
    uint64_t v13 = compoundAttributeByAddingAttribute(v10, 32);
  }
  else {
    uint64_t v13 = compoundAttributeByRemovingAttribute(v10, 32);
  }
  uint64_t v14 = v13;
  if (_AXSEarpieceNoiseCancellationEnabled()) {
    uint64_t v15 = compoundAttributeByAddingAttribute(v14, 64);
  }
  else {
    uint64_t v15 = compoundAttributeByRemovingAttribute(v14, 64);
  }
  uint64_t v16 = v15;
  _AXSLeftRightAudioBalance();
  if (v17 == 0.0) {
    uint64_t v18 = compoundAttributeByRemovingAttribute(v16, 128);
  }
  else {
    uint64_t v18 = compoundAttributeByAddingAttribute(v16, 128);
  }
  uint64_t v19 = v18;
  if (_AXSVisualAlertEnabled()) {
    uint64_t v20 = compoundAttributeByAddingAttribute(v19, 256);
  }
  else {
    uint64_t v20 = compoundAttributeByRemovingAttribute(v19, 256);
  }
  uint64_t v21 = v20;
  if (_AXSClosedCaptionsEnabled()) {
    uint64_t v22 = compoundAttributeByAddingAttribute(v21, 512);
  }
  else {
    uint64_t v22 = compoundAttributeByRemovingAttribute(v21, 512);
  }
  uint64_t v23 = v22;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  uint64_t v24 = (void *)getPASettingsClass_softClass_0;
  uint64_t v38 = getPASettingsClass_softClass_0;
  if (!getPASettingsClass_softClass_0)
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __getPASettingsClass_block_invoke_0;
    v34[3] = &unk_2640FC9B0;
    v34[4] = &v35;
    __getPASettingsClass_block_invoke_0((uint64_t)v34);
    uint64_t v24 = (void *)v36[3];
  }
  id v25 = v24;
  _Block_object_dispose(&v35, 8);
  v26 = [v25 sharedInstance];
  uint64_t v27 = [v26 personalMediaConfiguration];
  if (v27) {
    uint64_t v28 = compoundAttributeByAddingAttribute(v23, 1024);
  }
  else {
    uint64_t v28 = compoundAttributeByRemovingAttribute(v23, 1024);
  }
  uint64_t v29 = v28;

  BOOL v30 = +[HUComfortSoundsSettings sharedInstance];
  if ([v30 comfortSoundsEnabled]) {
    uint64_t v31 = compoundAttributeByAddingAttribute(v29, 2048);
  }
  else {
    uint64_t v31 = compoundAttributeByRemovingAttribute(v29, 2048);
  }
  uint64_t v32 = v31;

  uint64_t v33 = +[HUHearingAidSettings sharedInstance];
  [v33 setUsedHearingFeatures:v32];
}

- (BOOL)deviceIsTinker
{
  return 0;
}

+ (BOOL)shouldUseMultideviceV3
{
  return _os_feature_enabled_impl();
}

+ (id)XDCObjectFromObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = 0;
    dispatch_time_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__6;
    uint64_t v12 = __Block_byref_object_dispose__6;
    id v13 = [MEMORY[0x263EFF9A0] dictionary];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__HUUtilities_XDCObjectFromObject___block_invoke;
    v7[3] = &unk_2640FE928;
    v7[4] = &v8;
    [v3 enumerateKeysAndObjectsUsingBlock:v7];
  }
  else
  {
    objc_opt_class();
    id v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v8 = 0;
    dispatch_time_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = __Block_byref_object_copy__6;
    uint64_t v12 = __Block_byref_object_dispose__6;
    id v13 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __35__HUUtilities_XDCObjectFromObject___block_invoke_2;
    v6[3] = &unk_2640FE950;
    v6[4] = &v8;
    [v3 enumerateObjectsUsingBlock:v6];
  }
  id v4 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
LABEL_6:

  return v4;
}

void __35__HUUtilities_XDCObjectFromObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = +[HUUtilities XDCObjectFromObject:a3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (isKindOfClass)
  {
    uint64_t v8 = [NSString stringWithFormat:@"hai.%@", v5];

    id v5 = (id)v8;
  }
  [v7 setObject:v9 forKey:v5];
}

void __35__HUUtilities_XDCObjectFromObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = +[HUUtilities XDCObjectFromObject:a2];
  [v2 addObject:v3];
}

+ (id)objectFromXDCObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __35__HUUtilities_objectFromXDCObject___block_invoke;
    v12[3] = &unk_2640FCDB0;
    id v5 = &v13;
    id v6 = v4;
    id v13 = v6;
    [v3 enumerateKeysAndObjectsUsingBlock:v12];
  }
  else
  {
    objc_opt_class();
    id v7 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__HUUtilities_objectFromXDCObject___block_invoke_2;
    v10[3] = &unk_2640FE810;
    id v5 = &v11;
    id v6 = v8;
    id v11 = v6;
    [v3 enumerateObjectsUsingBlock:v10];
  }
  id v7 = v6;

LABEL_6:

  return v7;
}

void __35__HUUtilities_objectFromXDCObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v10 = +[HUUtilities objectFromXDCObject:a3];
  int v6 = [v5 hasPrefix:@"hai."];
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v8 = [v5 componentsSeparatedByString:@"hai."];

    id v9 = [v8 lastObject];
    [v7 setObject:v10 forKey:v9];

    id v5 = v8;
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v10 forKey:v5];
  }
}

void __35__HUUtilities_objectFromXDCObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[HUUtilities objectFromXDCObject:a2];
  [v2 addObject:v3];
}

- (void)setRoutingQueue:(id)a3
{
}

- (BOOL)takingConnection
{
  return self->_takingConnection;
}

- (void)setTakingConnection:(BOOL)a3
{
  self->_takingConnection = a3;
}

- (void)setRoutesManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routesManager, 0);

  objc_storeStrong((id *)&self->_routingQueue, 0);
}

@end