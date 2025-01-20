@interface HUComfortSoundsController
+ (id)sharedController;
- (AVAudioEngine)engine;
- (AVAudioPlayerNode)audioPlayerNodeA;
- (AVAudioPlayerNode)audioPlayerNodeB;
- (AVAudioPlayerNode)currentNode;
- (AVAudioSession)session;
- (BOOL)changePending;
- (BOOL)changingSounds;
- (BOOL)crossFading;
- (BOOL)currentRouteSupported;
- (BOOL)hasCurrentCall;
- (BOOL)holdingForCall;
- (BOOL)isDeviceLockedWithPasscode;
- (BOOL)isInContinuitySession;
- (BOOL)isPlaying;
- (BOOL)isPlayingOnQueue;
- (BOOL)isScreenBlank;
- (BOOL)liveListenComfortSoundsSwitch;
- (BOOL)shouldContinuePlayback;
- (BOOL)temporaryAirpodsDisconnect;
- (HUComfortSound)selectedSound;
- (HUComfortSoundsAssetManager)assetManager;
- (HUComfortSoundsController)init;
- (NSString)routeUID;
- (OS_dispatch_queue)audioQueue;
- (OS_os_transaction)transaction;
- (double)outputGain;
- (id)nextFileToPlay;
- (id)processComfortSoundsAssetRequest:(id)a3;
- (int)blankScreenToken;
- (int)keybagLockStateToken;
- (int)lockStateNotifyToken;
- (void)_handleContinuitySessionCheck;
- (void)assetDownloadDidUpdate;
- (void)audioEngineWasInterrupted:(id)a3;
- (void)audioSessionWasInterrupted:(id)a3;
- (void)availableAssetsDidUpdate;
- (void)callStatusDidChange:(id)a3;
- (void)clearActiveRoute;
- (void)clearEngine;
- (void)deviceScreenStatusDidChange:(int)a3 systemLocked:(int)a4;
- (void)mediaPlaybackDidChange:(id)a3;
- (void)mediaServerDied;
- (void)play;
- (void)playOnQueue;
- (void)rampNodeVolume:(id)a3 from:(double)a4 to:(double)a5 fadeDuration:(double)a6;
- (void)rampNodeVolume:(id)a3 from:(double)a4 to:(double)a5 fadeDuration:(double)a6 withProgress:(double)a7;
- (void)rampOutputGainFrom:(double)a3 to:(double)a4 withProgress:(double)a5;
- (void)registerHasBlankedScreenNotification;
- (void)registerNotifications;
- (void)routesDidChange:(id)a3;
- (void)scheduleFile;
- (void)scheduleNewFile;
- (void)setAssetManager:(id)a3;
- (void)setAudioPlayerNodeA:(id)a3;
- (void)setAudioPlayerNodeB:(id)a3;
- (void)setAudioQueue:(id)a3;
- (void)setBlankScreenToken:(int)a3;
- (void)setChangePending:(BOOL)a3;
- (void)setChangingSounds:(BOOL)a3;
- (void)setCrossFading:(BOOL)a3;
- (void)setCurrentNode:(id)a3;
- (void)setEngine:(id)a3;
- (void)setHoldingForCall:(BOOL)a3;
- (void)setIsDeviceLockedWithPasscode:(BOOL)a3;
- (void)setIsInContinuitySession:(BOOL)a3;
- (void)setIsScreenBlank:(BOOL)a3;
- (void)setKeybagLockStateToken:(int)a3;
- (void)setLiveListenComfortSoundsSwitch:(BOOL)a3;
- (void)setLockStateNotifyToken:(int)a3;
- (void)setOutputGain:(double)a3;
- (void)setRouteUID:(id)a3;
- (void)setSelectedSound:(id)a3;
- (void)setSession:(id)a3;
- (void)setTemporaryAirpodsDisconnect:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setVolume:(double)a3 forNode:(id)a4 andRamp:(BOOL)a5;
- (void)setupEngine;
- (void)startComfortSounds;
- (void)stop;
- (void)stopAndClearRoute:(BOOL)a3;
- (void)stopOnQueueAndClearRoute:(BOOL)a3;
- (void)updateAnalytics;
- (void)updateVolumeForSessionAndRamp:(BOOL)a3;
@end

@implementation HUComfortSoundsController

- (void)routesDidChange:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v4 = +[HUUtilities sharedUtilities];
  [v4 clearAudioRoutes];

  BOOL v5 = [(HUComfortSoundsController *)self currentRouteSupported];
  v6 = +[HUUtilities sharedUtilities];
  v7 = [v6 currentPickableAudioRoutes];

  v8 = [v7 valueForKey:@"AXSHARoutePicked"];
  v39 = v7;
  v9 = [v7 valueForKey:@"AXSHARouteSpeaker"];
  char v38 = [v8 isEqualToDictionary:v9];

  routeUID = self->_routeUID;
  v11 = [v8 valueForKey:@"RouteUID"];
  BOOL v12 = [(NSString *)routeUID isEqualToString:v11];

  CSInitializeLogging();
  v13 = NSString;
  v14 = self->_routeUID;
  v15 = [v8 valueForKey:@"RouteUID"];
  v16 = [v13 stringWithFormat:@"Route changed %d, %d - %@, %@ = %@", v5, !v12, v14, v15, v8];

  v17 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController routesDidChange:]", 635, v16];
  v18 = (os_log_t *)MEMORY[0x263F47288];
  v19 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v20 = v17;
    v21 = v19;
    *(_DWORD *)buf = 136446210;
    uint64_t v42 = [v20 UTF8String];
    _os_log_impl(&dword_20CC86000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (!self->_holdingForCall)
  {
    if (v12 && v5)
    {
      if ((v38 & 1) != 0
        || ![(NSString *)self->_routeUID length]
        || !self->_selectedSound
        || !self->_temporaryAirpodsDisconnect)
      {
        goto LABEL_7;
      }
      CSInitializeLogging();
      v28 = [NSString stringWithFormat:@"CS route changed. Starting"];
      v29 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController routesDidChange:]", 654, v28];
      os_log_t v30 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = v29;
        v32 = v30;
        uint64_t v33 = [v31 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v42 = v33;
        _os_log_impl(&dword_20CC86000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      v34 = +[HUComfortSoundsSettings sharedInstance];
      v35 = v34;
      uint64_t v36 = 1;
    }
    else
    {
      if (self->_liveListenComfortSoundsSwitch) {
        goto LABEL_7;
      }
      audioQueue = self->_audioQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __45__HUComfortSoundsController_routesDidChange___block_invoke;
      block[3] = &unk_2640FC960;
      block[4] = self;
      dispatch_async(audioQueue, block);
      v34 = +[HUComfortSoundsSettings sharedInstance];
      v35 = v34;
      uint64_t v36 = 0;
    }
    [v34 setComfortSoundsEnabled:v36];

    goto LABEL_7;
  }
  CSInitializeLogging();
  v22 = [NSString stringWithFormat:@"CS route changed while holding for call"];
  v23 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController routesDidChange:]", 639, v22];
  os_log_t v24 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = v23;
    v26 = v24;
    uint64_t v27 = [v25 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v42 = v27;
    _os_log_impl(&dword_20CC86000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(HUComfortSoundsController *)self callStatusDidChange:0];
LABEL_7:
  [(HUComfortSoundsController *)self _handleContinuitySessionCheck];
}

- (BOOL)currentRouteSupported
{
  v2 = +[HUUtilities sharedUtilities];
  char v3 = [v2 currentRouteSupportsBackgroundSounds];

  return v3;
}

+ (id)sharedController
{
  if (sharedController_onceToken_2 != -1) {
    dispatch_once(&sharedController_onceToken_2, &__block_literal_global_20);
  }
  v2 = (void *)sharedController_Controller_1;

  return v2;
}

uint64_t __45__HUComfortSoundsController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(HUComfortSoundsController);
  uint64_t v1 = sharedController_Controller_1;
  sharedController_Controller_1 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (HUComfortSoundsController)init
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  v64.receiver = self;
  v64.super_class = (Class)HUComfortSoundsController;
  v2 = [(HUComfortSoundsController *)&v64 init];
  if (v2)
  {
    char v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("comfort_sounds_audio", v3);
    BOOL v5 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v4;

    v6 = [MEMORY[0x263EFF910] date];
    [v6 timeIntervalSince1970];
    double v8 = v7;
    uint64_t v9 = [MEMORY[0x263F472B0] systemBootTime];

    v10 = [MEMORY[0x263EFF910] date];
    [v10 timeIntervalSince1970];
    double v12 = v11;
    v13 = +[HUComfortSoundsSettings sharedInstance];
    [v13 lastEnablementTimestamp];
    double v15 = v14;

    CSInitializeLogging();
    double v16 = v8 - (double)v9;
    double v17 = v12 - v15;
    v18 = [NSString stringWithFormat:@"Starting up (%f, %f)", *(void *)&v16, *(void *)&v17];
    v19 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController init]", 132, v18];
    id v20 = (os_log_t *)MEMORY[0x263F47288];
    v21 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v19;
      v23 = v21;
      uint64_t v24 = [v22 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v66 = v24;
      _os_log_impl(&dword_20CC86000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (v16 < 90.0 && v17 > v16)
    {
      CSInitializeLogging();
      v26 = [NSString stringWithFormat:@"Recently rebooted (%f, %f). Disabling", *(void *)&v16, *(void *)&v17];
      uint64_t v27 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController init]", 135, v26];
      os_log_t v28 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = v27;
        os_log_t v30 = v28;
        uint64_t v31 = [v29 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v66 = v31;
        _os_log_impl(&dword_20CC86000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      v32 = +[HUComfortSoundsSettings sharedInstance];
      [v32 setComfortSoundsEnabled:0];
    }
    *(_OWORD *)(v2 + 40) = xmmword_20CD0F6A0;
    *(_OWORD *)(v2 + 56) = xmmword_20CD0F6B0;
    *((void *)v2 + 9) = 0x3FA1111111111111;
    uint64_t v33 = objc_alloc_init(HUComfortSoundsAssetManager);
    v34 = (void *)*((void *)v2 + 22);
    *((void *)v2 + 22) = v33;

    [*((id *)v2 + 22) setDelegate:v2];
    v35 = +[HUComfortSoundsSettings sharedInstance];
    uint64_t v36 = [v35 selectedComfortSound];
    [v2 setSelectedSound:v36];

    objc_initWeak((id *)buf, v2);
    v37 = +[HUComfortSoundsSettings sharedInstance];
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __33__HUComfortSoundsController_init__block_invoke;
    v61[3] = &unk_2640FD1D0;
    char v38 = v2;
    v62 = v38;
    objc_copyWeak(&v63, (id *)buf);
    [v37 registerUpdateBlock:v61 forRetrieveSelector:sel_comfortSoundsEnabled withListener:v38];

    v39 = +[HUComfortSoundsSettings sharedInstance];
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __33__HUComfortSoundsController_init__block_invoke_3;
    v58[3] = &unk_2640FDBA0;
    objc_copyWeak(&v60, (id *)buf);
    v40 = v38;
    v59 = v40;
    [v39 registerUpdateBlock:v58 forRetrieveSelector:sel_selectedComfortSound withListener:v40];

    v41 = +[HUComfortSoundsSettings sharedInstance];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __33__HUComfortSoundsController_init__block_invoke_31;
    v56[3] = &unk_2640FC910;
    objc_copyWeak(&v57, (id *)buf);
    [v41 registerUpdateBlock:v56 forRetrieveSelector:sel_relativeVolume withListener:v40];

    uint64_t v42 = +[HUComfortSoundsSettings sharedInstance];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __33__HUComfortSoundsController_init__block_invoke_2_38;
    v54[3] = &unk_2640FC910;
    objc_copyWeak(&v55, (id *)buf);
    [v42 registerUpdateBlock:v54 forRetrieveSelector:sel_mixesWithMedia withListener:v40];

    uint64_t v43 = +[HUComfortSoundsSettings sharedInstance];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __33__HUComfortSoundsController_init__block_invoke_2_45;
    v52[3] = &unk_2640FC910;
    objc_copyWeak(&v53, (id *)buf);
    [v43 registerUpdateBlock:v52 forRetrieveSelector:sel_mediaVolume withListener:v40];

    v44 = +[HUComfortSoundsSettings sharedInstance];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __33__HUComfortSoundsController_init__block_invoke_2_52;
    v50[3] = &unk_2640FC910;
    objc_copyWeak(&v51, (id *)buf);
    [v44 registerUpdateBlock:v50 forRetrieveSelector:sel_forceMixingBehavior withListener:v40];

    v45 = *((void *)v2 + 18);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__HUComfortSoundsController_init__block_invoke_2_59;
    block[3] = &unk_2640FC960;
    v46 = v40;
    v49 = v46;
    dispatch_async(v45, block);
    [v46 registerNotifications];
    [v46 _handleContinuitySessionCheck];

    objc_destroyWeak(&v51);
    objc_destroyWeak(&v53);
    objc_destroyWeak(&v55);
    objc_destroyWeak(&v57);

    objc_destroyWeak(&v60);
    objc_destroyWeak(&v63);

    objc_destroyWeak((id *)buf);
  }
  return (HUComfortSoundsController *)v2;
}

void __33__HUComfortSoundsController_init__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = +[HUComfortSoundsSettings sharedInstance];
  int v3 = [v2 comfortSoundsEnabled];

  if (v3)
  {
    dispatch_queue_t v4 = +[HUComfortSoundsSettings sharedInstance];
    BOOL v5 = [MEMORY[0x263EFF910] date];
    [v5 timeIntervalSince1970];
    objc_msgSend(v4, "setLastEnablementTimestamp:");
  }
  else
  {
    [*(id *)(a1 + 32) setLiveListenComfortSoundsSwitch:0];
  }
  v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v6);
  int v8 = [WeakRetained shouldContinuePlayback];

  if (!v8)
  {
    id v20 = objc_loadWeakRetained(v6);
    [v20 stop];
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v9 = +[AXHAController sharedController];
  v10 = [v9 liveListenController];
  int v11 = [v10 isListening];

  if (!v11)
  {
    id v20 = objc_loadWeakRetained(v6);
    [v20 startComfortSounds];
    goto LABEL_11;
  }
  CSInitializeLogging();
  double v12 = [NSString stringWithFormat:@"Switching to Background Sounds from Live Listen"];
  v13 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController init]_block_invoke", 167, v12];
  double v14 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v13;
    double v16 = v14;
    *(_DWORD *)buf = 136446210;
    uint64_t v26 = [v15 UTF8String];
    _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v17 = objc_loadWeakRetained(v6);
  [v17 setLiveListenComfortSoundsSwitch:1];

  v18 = +[AXHAController sharedController];
  v19 = [v18 liveListenController];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __33__HUComfortSoundsController_init__block_invoke_18;
  v23[3] = &unk_2640FEE00;
  objc_copyWeak(&v24, v6);
  [v19 stopListeningWithCompletion:v23];

  objc_destroyWeak(&v24);
LABEL_12:
  id v21 = objc_loadWeakRetained(v6);
  [v21 updateAnalytics];

  id v22 = +[HUUtilities sharedUtilities];
  [v22 updateHearingFeatureUsage];
}

void __33__HUComfortSoundsController_init__block_invoke_18(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_init__block_invoke_2;
  block[3] = &unk_2640FC910;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v4);
}

void __33__HUComfortSoundsController_init__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLiveListenComfortSoundsSwitch:0];

  int v3 = +[HUComfortSoundsSettings sharedInstance];
  int v4 = [v3 comfortSoundsEnabled];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    [v5 startComfortSounds];
  }
}

void __33__HUComfortSoundsController_init__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained audioQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__HUComfortSoundsController_init__block_invoke_4;
  v5[3] = &unk_2640FDBA0;
  objc_copyWeak(&v7, v2);
  id v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v7);
}

void __33__HUComfortSoundsController_init__block_invoke_4(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  dispatch_time_t v2 = +[HUComfortSoundsSettings sharedInstance];
  int v3 = [v2 selectedComfortSound];

  CSInitializeLogging();
  int v4 = NSString;
  id v5 = [v3 name];
  id v6 = [v4 stringWithFormat:@"Updating sound to %@", v5];

  id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController init]_block_invoke_4", 199, v6];
  int v8 = (os_log_t *)MEMORY[0x263F47288];
  uint64_t v9 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v7;
    int v11 = v9;
    *(_DWORD *)buf = 136446210;
    uint64_t v31 = [v10 UTF8String];
    _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  double v12 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v14 = [WeakRetained selectedSound];
  char v15 = [v14 isEqual:v3];

  if ((v15 & 1) == 0)
  {
    id v16 = objc_loadWeakRetained((id *)(a1 + 40));
    [v16 setSelectedSound:v3];

    if (*(unsigned char *)(*(void *)(a1 + 32) + 80)) {
      goto LABEL_14;
    }
    id v17 = objc_loadWeakRetained((id *)(a1 + 40));
    int v18 = [v17 shouldContinuePlayback];

    if (!v18) {
      goto LABEL_14;
    }
    id v19 = objc_loadWeakRetained(v12);
    if ([v19 isPlayingOnQueue])
    {
      id v20 = objc_loadWeakRetained(v12);
      int v21 = [v20 currentRouteSupported];

      if (v21)
      {
        id v22 = objc_loadWeakRetained(v12);
        [v22 scheduleNewFile];
LABEL_13:

LABEL_14:
        id v29 = objc_loadWeakRetained(v12);
        [v29 updateAnalytics];

        goto LABEL_15;
      }
    }
    else
    {
    }
    CSInitializeLogging();
    v23 = [NSString stringWithFormat:@"CS sound changed. Starting"];
    id v24 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController init]_block_invoke", 214, v23];
    os_log_t v25 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = v24;
      uint64_t v27 = v25;
      uint64_t v28 = [v26 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v31 = v28;
      _os_log_impl(&dword_20CC86000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v22 = objc_loadWeakRetained(v12);
    [v22 playOnQueue];
    goto LABEL_13;
  }
LABEL_15:
}

void __33__HUComfortSoundsController_init__block_invoke_31(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  dispatch_time_t v2 = NSString;
  int v3 = +[HUComfortSoundsSettings sharedInstance];
  [v3 relativeVolume];
  id v5 = objc_msgSend(v2, "stringWithFormat:", @"Setting relative volume %lf", v4);

  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController init]_block_invoke", 225, v5];
  id v7 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v16 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v10);
  double v12 = [WeakRetained audioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_init__block_invoke_35;
  block[3] = &unk_2640FC910;
  objc_copyWeak(&v14, v10);
  dispatch_async(v12, block);

  objc_destroyWeak(&v14);
}

void __33__HUComfortSoundsController_init__block_invoke_35(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateVolumeForSessionAndRamp:0];
}

void __33__HUComfortSoundsController_init__block_invoke_2_38(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  dispatch_time_t v2 = NSString;
  int v3 = +[HUComfortSoundsSettings sharedInstance];
  uint64_t v4 = objc_msgSend(v2, "stringWithFormat:", @"Setting mixing preference %d", objc_msgSend(v3, "mixesWithMedia"));

  id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController init]_block_invoke_2", 232, v4];
  id v6 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    id v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = [v7 UTF8String];
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v9);
  int v11 = [WeakRetained audioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_init__block_invoke_42;
  block[3] = &unk_2640FC910;
  objc_copyWeak(&v13, v9);
  dispatch_async(v11, block);

  objc_destroyWeak(&v13);
}

void __33__HUComfortSoundsController_init__block_invoke_42(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateVolumeForSessionAndRamp:0];
}

void __33__HUComfortSoundsController_init__block_invoke_2_45(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  dispatch_time_t v2 = NSString;
  int v3 = +[HUComfortSoundsSettings sharedInstance];
  [v3 mediaVolume];
  id v5 = objc_msgSend(v2, "stringWithFormat:", @"Setting media volume %lf", v4);

  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController init]_block_invoke_2", 239, v5];
  id v7 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v16 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v10);
  double v12 = [WeakRetained audioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_init__block_invoke_49;
  block[3] = &unk_2640FC910;
  objc_copyWeak(&v14, v10);
  dispatch_async(v12, block);

  objc_destroyWeak(&v14);
}

void __33__HUComfortSoundsController_init__block_invoke_49(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateVolumeForSessionAndRamp:0];
}

void __33__HUComfortSoundsController_init__block_invoke_2_52(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  dispatch_time_t v2 = NSString;
  int v3 = +[HUComfortSoundsSettings sharedInstance];
  uint64_t v4 = objc_msgSend(v2, "stringWithFormat:", @"Setting force media %d", objc_msgSend(v3, "forceMixingBehavior"));

  id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController init]_block_invoke_2", 246, v4];
  id v6 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    id v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = [v7 UTF8String];
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v9);
  int v11 = [WeakRetained audioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_init__block_invoke_56;
  block[3] = &unk_2640FC910;
  objc_copyWeak(&v13, v9);
  dispatch_async(v11, block);

  objc_destroyWeak(&v13);
}

void __33__HUComfortSoundsController_init__block_invoke_56(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateVolumeForSessionAndRamp:1];
}

uint64_t __33__HUComfortSoundsController_init__block_invoke_2_59(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) shouldContinuePlayback];
  if (result)
  {
    CSInitializeLogging();
    int v3 = [NSString stringWithFormat:@"CS enabled at start. Starting"];
    uint64_t v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController init]_block_invoke_2", 255, v3];
    id v5 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v4;
      id v7 = v5;
      *(_DWORD *)buf = 136446210;
      uint64_t v9 = [v6 UTF8String];
      _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    return [*(id *)(a1 + 32) playOnQueue];
  }
  return result;
}

- (void)updateAnalytics
{
  v20[2] = *MEMORY[0x263EF8340];
  dispatch_time_t v2 = +[HUComfortSoundsSettings sharedInstance];
  int v3 = [v2 selectedComfortSound];
  uint64_t v4 = [v3 name];

  if (v4) {
    id v5 = (__CFString *)v4;
  }
  else {
    id v5 = &stru_26C1D5720;
  }
  v19[0] = @"enabled";
  id v6 = NSNumber;
  id v7 = +[HUComfortSoundsSettings sharedInstance];
  id v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "comfortSoundsEnabled"));
  v19[1] = @"sound";
  v20[0] = v8;
  v20[1] = v5;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  CSInitializeLogging();
  uint64_t v10 = [NSString stringWithFormat:@"Updating analytics %@", v9];
  int v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController updateAnalytics]", 280, v10];
  double v12 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v11;
    id v14 = v12;
    *(_DWORD *)buf = 136446210;
    uint64_t v18 = [v13 UTF8String];
    _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v16 = v9;
  id v15 = v9;
  AnalyticsSendEventLazy();
}

id __44__HUComfortSoundsController_updateAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)registerNotifications
{
  v23[1] = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_callStatusDidChange_ name:*MEMORY[0x263F7E310] object:0];

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_callStatusDidChange_ name:*MEMORY[0x263F7E328] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_routesDidChange_ name:@"com.apple.accessibility.hearing.wireless.splitter.changed" object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel_audioSessionWasInterrupted_ name:*MEMORY[0x263EF90A0] object:0];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_audioEngineWasInterrupted_ name:*MEMORY[0x263EF9020] object:0];

  MRMediaRemoteSetWantsNowPlayingNotifications();
  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel_mediaPlaybackDidChange_ name:*MEMORY[0x263F54B28] object:0];

  MRMediaRemoteSetWantsRouteChangeNotifications();
  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel_routesDidChange_ name:*MEMORY[0x263F54DE0] object:0];

  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel_routesDidChange_ name:*MEMORY[0x263F54E10] object:0];

  int v11 = [MEMORY[0x263F544E0] sharedAVSystemController];
  double v12 = (uint64_t *)MEMORY[0x263F54470];
  v23[0] = *MEMORY[0x263F54470];
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [v11 setAttribute:v13 forKey:*MEMORY[0x263F544A0] error:0];

  id v14 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v15 = *v12;
  uint64_t v16 = [MEMORY[0x263F544E0] sharedAVSystemController];
  [v14 addObserver:self selector:sel_mediaServerDied name:v15 object:v16];

  uint64_t v17 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v18 = *MEMORY[0x263EF9FA0];
  id v19 = [MEMORY[0x263EFA7B8] sharedSystemAudioContext];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __50__HUComfortSoundsController_registerNotifications__block_invoke;
  v22[3] = &unk_2640FEE28;
  v22[4] = self;
  id v20 = (id)[v17 addObserverForName:v18 object:v19 queue:0 usingBlock:v22];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_hearingTestStarted, @"com.apple.HearingTest.test.started", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  [(HUComfortSoundsController *)self registerHasBlankedScreenNotification];
}

uint64_t __50__HUComfortSoundsController_registerNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleContinuitySessionCheck];
}

- (void)registerHasBlankedScreenNotification
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke;
  v39[3] = &unk_2640FDC78;
  uint64_t v31 = &v40;
  objc_copyWeak(&v40, &location);
  int v3 = (void (**)(void, void))MEMORY[0x2105575F0](v39);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke_105;
  v37[3] = &unk_2640FDC78;
  objc_copyWeak(&v38, &location);
  uint64_t v4 = (void (**)(void, void))MEMORY[0x2105575F0](v37);
  uint64_t v32 = MEMORY[0x263EF8330];
  uint64_t v33 = 3221225472;
  v34 = __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke_109;
  v35 = &unk_2640FDC78;
  objc_copyWeak(&v36, &location);
  id v5 = (void (**)(void, void))MEMORY[0x2105575F0](&v32);
  p_keybagLockStateToken = &self->_keybagLockStateToken;
  id v7 = MEMORY[0x263EF83A0];
  id v8 = MEMORY[0x263EF83A0];
  LODWORD(v7) = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &self->_keybagLockStateToken, v7, v4) == 0;

  if (v7)
  {
    v4[2](v4, *p_keybagLockStateToken);
    CSInitializeLogging();
    uint64_t v9 = NSString;
    uint64_t v10 = [NSNumber numberWithInt:*p_keybagLockStateToken];
    int v11 = [v9 stringWithFormat:@"Registered keybag lock state: %@ %@", self, v10];

    double v12 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController registerHasBlankedScreenNotification]", 371, v11, &v40, v32, v33, v34, v35];
    id v13 = (id)*MEMORY[0x263F47288];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v12 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v43 = v14;
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    int *p_keybagLockStateToken = -1;
  }
  p_blankScreenToken = &self->_blankScreenToken;
  BOOL v16 = notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &self->_blankScreenToken, MEMORY[0x263EF83A0], v5) == 0;

  if (v16)
  {
    v5[2](v5, *p_blankScreenToken);
    CSInitializeLogging();
    uint64_t v17 = NSString;
    uint64_t v18 = [NSNumber numberWithInt:*p_blankScreenToken];
    id v19 = [v17 stringWithFormat:@"Registered blank screen state: %@ %@", self, v18];

    id v20 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController registerHasBlankedScreenNotification]", 381, v19];
    int v21 = (id)*MEMORY[0x263F47288];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v20 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v43 = v22;
      _os_log_impl(&dword_20CC86000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    int *p_blankScreenToken = -1;
  }
  p_lockStateNotifyToken = &self->_lockStateNotifyToken;
  BOOL v24 = notify_register_dispatch("ccom.apple.springboard.passcodeLockedOrBlocked", &self->_lockStateNotifyToken, MEMORY[0x263EF83A0], v3) == 0;

  if (v24)
  {
    v3[2](v3, *p_lockStateNotifyToken);
    CSInitializeLogging();
    os_log_t v25 = NSString;
    id v26 = [NSNumber numberWithInt:*p_lockStateNotifyToken];
    uint64_t v27 = [v25 stringWithFormat:@"Registered lock screen state: %@ %@", self, v26];

    uint64_t v28 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController registerHasBlankedScreenNotification]", 391, v27];
    id v29 = (id)*MEMORY[0x263F47288];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v28 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v43 = v30;
      _os_log_impl(&dword_20CC86000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    int *p_blankScreenToken = -1;
  }

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
}

void __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  uint64_t v4 = NSString;
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [NSNumber numberWithInt:a2];
  id v8 = [v4 stringWithFormat:@"Handled device lock with passcode: %@ %@", WeakRetained, v7];

  uint64_t v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController registerHasBlankedScreenNotification]_block_invoke", 340, v8];
  uint64_t v10 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    double v12 = v10;
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v13 = objc_loadWeakRetained(v5);

  if (v13)
  {
    *(void *)buf = 0;
    notify_get_state(a2, (uint64_t *)buf);
    id v14 = objc_loadWeakRetained(v5);
    uint64_t v15 = [v14 isScreenBlank];
    [v14 deviceScreenStatusDidChange:v15 systemLocked:*(unsigned int *)buf];
  }
}

void __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke_105(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  uint64_t v4 = NSString;
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [NSNumber numberWithInt:a2];
  id v8 = [v4 stringWithFormat:@"Handled keybag lock: %@ %@", WeakRetained, v7];

  uint64_t v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController registerHasBlankedScreenNotification]_block_invoke", 350, v8];
  uint64_t v10 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    double v12 = v10;
    *(_DWORD *)buf = 136446210;
    uint64_t v18 = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v13 = objc_loadWeakRetained(v5);

  if (v13)
  {
    id v14 = objc_loadWeakRetained(v5);
    uint64_t v15 = [v14 isScreenBlank];
    id v16 = objc_loadWeakRetained(v5);
    objc_msgSend(v14, "deviceScreenStatusDidChange:systemLocked:", v15, objc_msgSend(v16, "isDeviceLockedWithPasscode"));
  }
}

void __65__HUComfortSoundsController_registerHasBlankedScreenNotification__block_invoke_109(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  uint64_t v4 = NSString;
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [NSNumber numberWithInt:a2];
  id v8 = [v4 stringWithFormat:@"Handled screen wake: %@ %@", WeakRetained, v7];

  uint64_t v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController registerHasBlankedScreenNotification]_block_invoke", 359, v8];
  uint64_t v10 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    double v12 = v10;
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v13 = objc_loadWeakRetained(v5);

  if (v13)
  {
    *(void *)buf = 0;
    notify_get_state(a2, (uint64_t *)buf);
    id v14 = objc_loadWeakRetained(v5);
    uint64_t v15 = *(unsigned int *)buf;
    id v16 = v14;
    objc_msgSend(v16, "deviceScreenStatusDidChange:systemLocked:", v15, objc_msgSend(v16, "isDeviceLockedWithPasscode"));
  }
}

- (void)deviceScreenStatusDidChange:(int)a3 systemLocked:(int)a4
{
  if (a3) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = a4 != 0;
  }
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a4) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = a3 != 0;
  }
  id v8 = +[HUComfortSoundsSettings sharedInstance];
  unsigned int v9 = [v8 stopsOnLock];

  CSInitializeLogging();
  uint64_t v10 = [NSString stringWithFormat:@"Screen blank status has changed - %d, %d, %d", v6, v7, v9];
  id v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController deviceScreenStatusDidChange:systemLocked:]", 407, v10];
  double v12 = (os_log_t *)MEMORY[0x263F47288];
  id v13 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v11;
    uint64_t v15 = v13;
    *(_DWORD *)buf = 136446210;
    uint64_t v24 = [v14 UTF8String];
    _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ((((a3 != 0) ^ (a4 != 0)) & v9) == 1)
  {
    CSInitializeLogging();
    id v16 = [NSString stringWithFormat:@"The device is locked. Comfort sounds should stop on lock"];
    uint64_t v17 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController deviceScreenStatusDidChange:systemLocked:]", 411, v16];
    os_log_t v18 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v17;
      id v20 = v18;
      uint64_t v21 = [v19 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v24 = v21;
      _os_log_impl(&dword_20CC86000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v22 = +[HUComfortSoundsSettings sharedInstance];
    [v22 setComfortSoundsEnabled:0];
  }
}

- (void)_handleContinuitySessionCheck
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [MEMORY[0x263EFA7B8] sharedAudioPresentationOutputContext];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v14 = v18 = 0u;
  int v3 = [v14 outputDevices];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) isActivatedForContinuityScreen];
        [(HUComfortSoundsController *)self setIsInContinuitySession:v8];
        unsigned int v9 = HCLogHearingXPC();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [NSNumber numberWithBool:v8];
          *(_DWORD *)buf = 136315394;
          id v20 = "-[HUComfortSoundsController _handleContinuitySessionCheck]";
          __int16 v21 = 2112;
          uint64_t v22 = v10;
          _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%s: session active: %@", buf, 0x16u);
        }
        if (v8)
        {
          id v11 = +[HUComfortSoundsSettings sharedInstance];
          int v12 = [v11 comfortSoundsEnabled];

          if (v12)
          {
            id v13 = +[HUComfortSoundsSettings sharedInstance];
            [v13 setComfortSoundsEnabled:0];

            goto LABEL_14;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)mediaServerDied
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  int v3 = [NSString stringWithFormat:@"Mediaserverd died"];
  uint64_t v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController mediaServerDied]", 496, v3];
  uint64_t v5 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    BOOL v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HUComfortSoundsController_mediaServerDied__block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_after(v8, audioQueue, block);
}

uint64_t __44__HUComfortSoundsController_mediaServerDied__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) stopOnQueueAndClearRoute:1];
  [*(id *)(a1 + 32) setupEngine];
  dispatch_time_t v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) registerNotifications];
  uint64_t result = [*(id *)(a1 + 32) shouldContinuePlayback];
  if (result)
  {
    CSInitializeLogging();
    uint64_t v4 = [NSString stringWithFormat:@"Continuing playback after server died"];
    uint64_t v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController mediaServerDied]_block_invoke", 506, v4];
    id v6 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      dispatch_time_t v8 = v6;
      *(_DWORD *)buf = 136446210;
      uint64_t v10 = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    return [*(id *)(a1 + 32) playOnQueue];
  }
  return result;
}

- (void)audioSessionWasInterrupted:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CSInitializeLogging();
  uint64_t v5 = [NSString stringWithFormat:@"Session interrupted. %@", v4];
  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController audioSessionWasInterrupted:]", 514, v5];
  id v7 = (os_log_t *)MEMORY[0x263F47288];
  dispatch_time_t v8 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v6;
    uint64_t v10 = v8;
    *(_DWORD *)buf = 136446210;
    uint64_t v23 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v11 = [v4 userInfo];
  uint64_t v12 = [v11 valueForKey:*MEMORY[0x263EF90C8]];
  int v13 = [v12 intValue];

  if (v13 == 1)
  {
    [(HUComfortSoundsController *)self stopAndClearRoute:0];
    audioQueue = self->_audioQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__HUComfortSoundsController_audioSessionWasInterrupted___block_invoke;
    block[3] = &unk_2640FC960;
    void block[4] = self;
    dispatch_async(audioQueue, block);
  }
  else
  {
    [(HUComfortSoundsController *)self play];
    if (self->_holdingForCall)
    {
      CSInitializeLogging();
      long long v15 = [NSString stringWithFormat:@"CS interrupted changed while holding for call"];
      long long v16 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController audioSessionWasInterrupted:]", 529, v15];
      os_log_t v17 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v16;
        id v19 = v17;
        uint64_t v20 = [v18 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v23 = v20;
        _os_log_impl(&dword_20CC86000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      [(HUComfortSoundsController *)self callStatusDidChange:0];
    }
  }
}

uint64_t __56__HUComfortSoundsController_audioSessionWasInterrupted___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) engine];
  [v2 stop];

  int v3 = *(void **)(a1 + 32);

  return [v3 setEngine:0];
}

- (void)audioEngineWasInterrupted:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CSInitializeLogging();
  uint64_t v5 = [NSString stringWithFormat:@"Audio Engine interrupted. %@", v4];

  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController audioEngineWasInterrupted:]", 537, v5];
  id v7 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    id v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v13 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__HUComfortSoundsController_audioEngineWasInterrupted___block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(audioQueue, block);
}

uint64_t __55__HUComfortSoundsController_audioEngineWasInterrupted___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) stopOnQueueAndClearRoute:1];
  [*(id *)(a1 + 32) setupEngine];
  uint64_t result = [*(id *)(a1 + 32) shouldContinuePlayback];
  if (result)
  {
    CSInitializeLogging();
    int v3 = [NSString stringWithFormat:@"Continuing playback after restarting the engine"];
    id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController audioEngineWasInterrupted:]_block_invoke", 544, v3];
    uint64_t v5 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v4;
      id v7 = v5;
      *(_DWORD *)buf = 136446210;
      uint64_t v9 = [v6 UTF8String];
      _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    return [*(id *)(a1 + 32) playOnQueue];
  }
  return result;
}

- (void)setupEngine
{
  id v3 = objc_alloc_init(MEMORY[0x263EF9360]);
  [(HUComfortSoundsController *)self setEngine:v3];
  id v4 = objc_alloc_init(MEMORY[0x263EF93C8]);
  [v3 attachNode:v4];
  [(HUComfortSoundsController *)self setAudioPlayerNodeA:v4];
  id v5 = objc_alloc_init(MEMORY[0x263EF93C8]);

  [v3 attachNode:v5];
  [(HUComfortSoundsController *)self setAudioPlayerNodeB:v5];
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v6 = +[HUComfortSoundsSettings sharedInstance];
  [v6 relativeVolume];
  uint64_t v8 = v7;

  uint64_t v17 = v8;
  uint64_t v9 = +[HUComfortSoundsSettings sharedInstance];
  int v10 = [v9 mixesWithMedia];

  if (v10)
  {
    uint64_t v11 = +[HUUtilities sharedUtilities];
    audioQueue = self->_audioQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __40__HUComfortSoundsController_setupEngine__block_invoke;
    v13[3] = &unk_2640FE888;
    v13[4] = &v14;
    [v11 checkAudioPlayingWithQueue:audioQueue andCompletion:v13];
  }
  *(void *)&self->_outputGain = v15[3];
  _Block_object_dispose(&v14, 8);
}

void __40__HUComfortSoundsController_setupEngine__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = +[HUComfortSoundsSettings sharedInstance];
    [v4 mediaVolume];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  }
}

- (void)clearEngine
{
  [(HUComfortSoundsController *)self setEngine:0];
  [(HUComfortSoundsController *)self setAudioPlayerNodeA:0];

  [(HUComfortSoundsController *)self setAudioPlayerNodeB:0];
}

- (BOOL)shouldContinuePlayback
{
  uint64_t v3 = +[HUComfortSoundsSettings sharedInstance];
  if ([v3 comfortSoundsEnabled] && self->_selectedSound) {
    BOOL v4 = ![(HUComfortSoundsController *)self isInContinuitySession];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)clearActiveRoute
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __45__HUComfortSoundsController_clearActiveRoute__block_invoke;
  v40[3] = &unk_2640FC960;
  v40[4] = self;
  uint64_t v3 = (void *)MEMORY[0x2105575F0](v40, a2);
  BOOL v4 = +[HUUtilities sharedUtilities];
  id v5 = [v4 currentPickableAudioRoutes];

  id v6 = [v5 valueForKey:@"AXSHARoutePicked"];
  routeUID = self->_routeUID;
  uint64_t v8 = [v6 valueForKey:@"RouteUID"];
  BOOL v9 = [(NSString *)routeUID isEqualToString:v8];

  CSInitializeLogging();
  int v10 = objc_msgSend(NSString, "stringWithFormat:", @"The temporary airpods disconnect mode is - %hhd", self->_temporaryAirpodsDisconnect);
  uint64_t v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController clearActiveRoute]", 606, v10];
  uint64_t v12 = (os_log_t *)MEMORY[0x263F47288];
  uint64_t v13 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v12;
    long long v15 = v6;
    uint64_t v16 = v3;
    id v17 = v11;
    id v18 = v13;
    id v19 = v17;
    uint64_t v3 = v16;
    id v6 = v15;
    uint64_t v12 = v14;
    uint64_t v20 = [v19 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v42 = v20;
    _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (![(HUComfortSoundsController *)self isPlayingOnQueue] || v9)
  {
    if (v9)
    {
      CSInitializeLogging();
      __int16 v21 = [NSString stringWithFormat:@"Turning off temporary airpods disconnect mode."];
      uint64_t v22 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController clearActiveRoute]", 616, v21];
      os_log_t v23 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = v22;
        uint64_t v25 = v23;
        uint64_t v26 = [v24 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v42 = v26;
        _os_log_impl(&dword_20CC86000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      self->_temporaryAirpodsDisconnect = 0;
    }
    else if (!self->_temporaryAirpodsDisconnect)
    {
      CSInitializeLogging();
      v34 = [NSString stringWithFormat:@"Clearing route now"];
      v35 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController clearActiveRoute]", 621, v34];
      os_log_t v36 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = v35;
        id v38 = v36;
        uint64_t v39 = [v37 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v42 = v39;
        _os_log_impl(&dword_20CC86000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      dispatch_async((dispatch_queue_t)self->_audioQueue, v3);
    }
  }
  else
  {
    CSInitializeLogging();
    uint64_t v27 = [NSString stringWithFormat:@"Clearing route after grace period"];
    uint64_t v28 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController clearActiveRoute]", 610, v27];
    os_log_t v29 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = v28;
      uint64_t v31 = v29;
      uint64_t v32 = [v30 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v42 = v32;
      _os_log_impl(&dword_20CC86000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    self->_temporaryAirpodsDisconnect = 1;
    dispatch_time_t v33 = dispatch_time(0, 15000000000);
    dispatch_after(v33, (dispatch_queue_t)self->_audioQueue, v3);
  }
}

void __45__HUComfortSoundsController_clearActiveRoute__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isPlayingOnQueue] & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 152);
    *(void *)(v2 + 152) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 81) = 0;
  }
}

uint64_t __45__HUComfortSoundsController_routesDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearActiveRoute];
}

- (BOOL)hasCurrentCall
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__HUComfortSoundsController_hasCurrentCall__block_invoke;
  v8[3] = &unk_2640FCBB0;
  v8[4] = &v21;
  v8[5] = &v17;
  v8[6] = &v13;
  v8[7] = &v9;
  getCallStatus(v8);
  if (*((unsigned char *)v18 + 24) || *((unsigned char *)v10 + 24) || *((unsigned char *)v14 + 24))
  {
    CSInitializeLogging();
    uint64_t v2 = [NSString stringWithFormat:@"Active Call Status - [pending = %d, active = %d, avc = %d, endpoint = %d]", *((unsigned __int8 *)v10 + 24), *((unsigned __int8 *)v18 + 24), *((unsigned __int8 *)v14 + 24), *((unsigned __int8 *)v22 + 24)];
    uint64_t v3 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController hasCurrentCall]", 679, v2];
    BOOL v4 = (id)*MEMORY[0x263F47288];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [v3 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v26 = v5;
      _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v6;
}

void *__43__HUComfortSoundsController_hasCurrentCall__block_invoke(void *result, char a2, char a3, char a4, char a5)
{
  *(unsigned char *)(*(void *)(result[4] + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = a3;
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = a4;
  *(unsigned char *)(*(void *)(result[7] + 8) + 24) = a5;
  return result;
}

- (void)callStatusDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_t *)MEMORY[0x263F47288];
  BOOL v6 = *MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEBUG)) {
    -[HUComfortSoundsController callStatusDidChange:]((uint64_t)v4, v6);
  }
  uint64_t v7 = +[HUComfortSoundsSettings sharedInstance];
  int v8 = [v7 comfortSoundsAvailable];

  if (v8)
  {
    uint64_t v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
      [(HUComfortSoundsController *)(uint64_t)self callStatusDidChange:v9];
    }
    if ([(HUComfortSoundsController *)self hasCurrentCall])
    {
      int v10 = +[HUComfortSoundsSettings sharedInstance];
      int v11 = [v10 comfortSoundsEnabled];

      if (v11)
      {
        self->_holdingForCall = 1;
        [(HUComfortSoundsController *)self stopAndClearRoute:0];
      }
    }
    else if (self->_holdingForCall)
    {
      char v12 = +[HUComfortSoundsSettings sharedInstance];
      char v13 = [v12 comfortSoundsEnabled];

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = +[HUComfortSoundsSettings sharedInstance];
        [v14 setComfortSoundsEnabled:1];
      }
      dispatch_time_t v15 = dispatch_time(0, 3000000000);
      audioQueue = self->_audioQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __49__HUComfortSoundsController_callStatusDidChange___block_invoke;
      block[3] = &unk_2640FC960;
      void block[4] = self;
      dispatch_after(v15, audioQueue, block);
    }
  }
}

void __49__HUComfortSoundsController_callStatusDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) hasCurrentCall])
  {
    if ([*(id *)(a1 + 32) hasCurrentCall])
    {
      uint64_t v2 = +[HUComfortSoundsSettings sharedInstance];
      int v3 = [v2 comfortSoundsEnabled];

      if (v3)
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 80) = 1;
        id v4 = *(void **)(a1 + 32);
        [v4 stopAndClearRoute:0];
      }
    }
  }
  else
  {
    CSInitializeLogging();
    uint64_t v5 = [NSString stringWithFormat:@"Removing call hold and playing"];
    BOOL v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController callStatusDidChange:]_block_invoke", 711, v5];
    uint64_t v7 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      uint64_t v9 = v7;
      *(_DWORD *)buf = 136446210;
      uint64_t v11 = [v8 UTF8String];
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [*(id *)(a1 + 32) playOnQueue];
    *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
  }
}

- (void)mediaPlaybackDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CSInitializeLogging();
  uint64_t v5 = [NSString stringWithFormat:@"Now playing notification: %@", v4];

  BOOL v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController mediaPlaybackDidChange:]", 735, v5];
  uint64_t v7 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v13 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HUComfortSoundsController_mediaPlaybackDidChange___block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(audioQueue, block);
}

uint64_t __52__HUComfortSoundsController_mediaPlaybackDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVolumeForSessionAndRamp:1];
}

- (void)play
{
  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_play__block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(audioQueue, block);
}

uint64_t __33__HUComfortSoundsController_play__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) playOnQueue];
}

- (void)playOnQueue
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HUComfortSoundsController *)self currentRouteSupported];
  CSInitializeLogging();
  id v4 = NSString;
  BOOL v5 = [(HUComfortSoundsController *)self isPlayingOnQueue];
  BOOL holdingForCall = self->_holdingForCall;
  uint64_t v7 = +[HUComfortSoundsSettings sharedInstance];
  id v8 = [v4 stringWithFormat:@"Playing [%d, %d, %d] {%d, %d}", v5, v3, holdingForCall, objc_msgSend(v7, "comfortSoundsEnabled"), self->_selectedSound != 0];

  uint64_t v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController playOnQueue]", 756, v8];
  int v10 = (os_log_t *)MEMORY[0x263F47288];
  uint64_t v11 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v9;
    uint64_t v13 = v11;
    *(_DWORD *)buf = 136446210;
    uint64_t v96 = [v12 UTF8String];
    _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (![(HUComfortSoundsController *)self isPlayingOnQueue]
    && v3
    && !self->_holdingForCall
    && [(HUComfortSoundsController *)self shouldContinuePlayback])
  {
    uint64_t v14 = [MEMORY[0x263EF93E0] sharedInstance];
    session = self->_session;
    self->_session = v14;

    char v16 = self->_session;
    uint64_t v17 = *MEMORY[0x263EF9060];
    id v94 = 0;
    [(AVAudioSession *)v16 setCategory:v17 withOptions:1 error:&v94];
    id v18 = v94;
    if (v18)
    {
      CSInitializeLogging();
      uint64_t v19 = [NSString stringWithFormat:@"Error setting category for session: %@", v18];
      char v20 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController playOnQueue]", 768, v19];
      os_log_t v21 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = v20;
        uint64_t v23 = v21;
        uint64_t v24 = [v22 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v96 = v24;
        _os_log_impl(&dword_20CC86000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    uint64_t v25 = self->_session;
    uint64_t v26 = *MEMORY[0x263EF9108];
    id v93 = v18;
    [(AVAudioSession *)v25 setMode:v26 error:&v93];
    id v27 = v93;

    if (v27)
    {
      CSInitializeLogging();
      uint64_t v28 = [NSString stringWithFormat:@"Error setting default mode for session: %@", v27];
      os_log_t v29 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController playOnQueue]", 774, v28];
      os_log_t v30 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = v29;
        uint64_t v32 = v30;
        uint64_t v33 = [v31 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v96 = v33;
        _os_log_impl(&dword_20CC86000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    v34 = self->_session;
    id v92 = v27;
    [(AVAudioSession *)v34 setPrefersNoDucking:1 error:&v92];
    id v35 = v92;

    if (v35)
    {
      CSInitializeLogging();
      os_log_t v36 = [NSString stringWithFormat:@"Error preventing ducking with session: %@", v35];
      id v37 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController playOnQueue]", 780, v36];
      os_log_t v38 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = v37;
        id v40 = v38;
        uint64_t v41 = [v39 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v96 = v41;
        _os_log_impl(&dword_20CC86000, v40, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    uint64_t v42 = self->_session;
    id v91 = v35;
    [(AVAudioSession *)v42 setAudioHardwareControlFlags:0x100000 error:&v91];
    id v43 = v91;

    if (v43)
    {
      CSInitializeLogging();
      uint64_t v44 = [NSString stringWithFormat:@"Error setting volume desired hardware control flag with session: %@", v43];
      v45 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController playOnQueue]", 786, v44];
      os_log_t v46 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        id v47 = v45;
        v48 = v46;
        uint64_t v49 = [v47 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v96 = v49;
        _os_log_impl(&dword_20CC86000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    v50 = self->_session;
    id v90 = v43;
    [(AVAudioSession *)v50 setActive:1 forFeature:2048 error:&v90];
    id v51 = v90;

    if (v51)
    {
      CSInitializeLogging();
      v52 = [NSString stringWithFormat:@"Error activating session: %@", v51];
      id v53 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController playOnQueue]", 792, v52];
      os_log_t v54 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        id v53 = v53;
        id v55 = v54;
        uint64_t v56 = [v53 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v96 = v56;
        _os_log_impl(&dword_20CC86000, v55, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    else
    {
      id v57 = +[HUUtilities sharedUtilities];
      v58 = [v57 currentPickableAudioRoutes];
      id v51 = [v58 valueForKey:@"AXSHARoutePicked"];

      v59 = [v51 valueForKey:@"RouteUID"];
      routeUID = self->_routeUID;
      self->_routeUID = v59;

      v61 = (void *)os_transaction_create();
      [(HUComfortSoundsController *)self setTransaction:v61];

      v62 = [(HUComfortSoundsController *)self engine];

      if (!v62) {
        [(HUComfortSoundsController *)self setupEngine];
      }
      id v63 = [(HUComfortSoundsController *)self engine];
      v52 = [v63 mainMixerNode];

      id v53 = [(HUComfortSoundsController *)self nextFileToPlay];
      if (v53)
      {
        objc_super v64 = [(HUComfortSoundsController *)self engine];
        v65 = [(HUComfortSoundsController *)self audioPlayerNodeA];
        uint64_t v66 = [v53 processingFormat];
        [v64 connect:v65 to:v52 format:v66];

        uint64_t v67 = [(HUComfortSoundsController *)self engine];
        v68 = [(HUComfortSoundsController *)self audioPlayerNodeB];
        v69 = [v53 processingFormat];
        [v67 connect:v68 to:v52 format:v69];

        v70 = [(HUComfortSoundsController *)self engine];
        id v89 = 0;
        char v71 = [v70 startAndReturnError:&v89];
        id v72 = v89;

        if (!v72 || (v71 & 1) != 0)
        {
          id mixingBlock = self->_mixingBlock;
          if (mixingBlock) {
            dispatch_block_cancel(mixingBlock);
          }
          v86 = [(HUComfortSoundsController *)self audioPlayerNodeA];
          [v86 setVolume:0.0];

          v87 = [(HUComfortSoundsController *)self audioPlayerNodeB];
          [v87 setVolume:0.0];

          [(HUComfortSoundsController *)self setCrossFading:0];
          v88 = [(HUComfortSoundsController *)self audioPlayerNodeB];
          [(HUComfortSoundsController *)self setCurrentNode:v88];

          [(HUComfortSoundsController *)self scheduleNewFile];
        }
        else
        {
          CSInitializeLogging();
          v73 = [NSString stringWithFormat:@"Error starting engine: %@", v72];
          v74 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController playOnQueue]", 822, v73];
          os_log_t v75 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            id v76 = v74;
            v77 = v75;
            uint64_t v78 = [v76 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v96 = v78;
            _os_log_impl(&dword_20CC86000, v77, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
        }
      }
      else
      {
        CSInitializeLogging();
        v79 = [NSString stringWithFormat:@"Missing file. Stopping"];
        v80 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController playOnQueue]", 811, v79];
        os_log_t v81 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
        {
          id v82 = v80;
          v83 = v81;
          uint64_t v84 = [v82 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v96 = v84;
          _os_log_impl(&dword_20CC86000, v83, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        [(HUComfortSoundsController *)self stopOnQueueAndClearRoute:1];
      }
    }
  }
}

- (id)nextFileToPlay
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HUComfortSound *)self->_selectedSound nextFilePath];
  if (!v3)
  {
    id v5 = 0;
LABEL_9:
    id v4 = [(HUComfortSound *)self->_selectedSound asset];

    if (v4)
    {
      id v12 = +[HUComfortSound defaultComfortSoundForGroup:[(HUComfortSound *)self->_selectedSound soundGroup]];
      selectedSound = self->_selectedSound;
      self->_selectedSound = v12;

      CSInitializeLogging();
      uint64_t v14 = [NSString stringWithFormat:@"Missing file. Falling back %@", self->_selectedSound];
      dispatch_time_t v15 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController nextFileToPlay]", 858, v14];
      char v16 = (os_log_t *)MEMORY[0x263F47288];
      uint64_t v17 = (void *)*MEMORY[0x263F47288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v15;
        uint64_t v19 = v17;
        uint64_t v20 = [v18 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v33 = v20;
        _os_log_impl(&dword_20CC86000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      os_log_t v21 = [(HUComfortSound *)self->_selectedSound nextFilePath];
      if (v21)
      {
        id v30 = v5;
        id v4 = (void *)[objc_alloc(MEMORY[0x263EF9380]) initForReading:v21 error:&v30];
        id v22 = v30;

        if (v22)
        {
          CSInitializeLogging();
          uint64_t v23 = [NSString stringWithFormat:@"Error loading file: %@", v22];
          uint64_t v24 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController nextFileToPlay]", 866, v23];
          os_log_t v25 = *v16;
          if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
          {
            id v26 = v24;
            id v27 = v25;
            uint64_t v28 = [v26 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v33 = v28;
            _os_log_impl(&dword_20CC86000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
        }
      }
      else
      {
        id v4 = 0;
        id v22 = v5;
      }

      id v5 = v22;
    }
    goto LABEL_19;
  }
  id v31 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EF9380]) initForReading:v3 error:&v31];
  id v5 = v31;
  if (v5)
  {
    CSInitializeLogging();
    BOOL v6 = [NSString stringWithFormat:@"Error loading file: %@", v5];
    uint64_t v7 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController nextFileToPlay]", 851, v6];
    id v8 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v7;
      int v10 = v8;
      uint64_t v11 = [v9 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v33 = v11;
      _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  if (!v4) {
    goto LABEL_9;
  }
LABEL_19:

  return v4;
}

- (void)scheduleNewFile
{
  [(HUComfortSoundsController *)self setChangingSounds:1];
  id rampUpBlock = self->_rampUpBlock;
  if (rampUpBlock) {
    dispatch_block_cancel(rampUpBlock);
  }
  id rampDownBlock = self->_rampDownBlock;
  if (rampDownBlock) {
    dispatch_block_cancel(rampDownBlock);
  }
  [(HUComfortSoundsController *)self rampNodeVolume:self->_currentNode from:1.0 to:0.0 fadeDuration:self->_changeDuration];

  [(HUComfortSoundsController *)self scheduleFile];
}

- (void)scheduleFile
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  BOOL v3 = NSString;
  id v4 = [(HUComfortSoundsController *)self engine];
  id v48 = 0;
  unsigned int v5 = [v4 startAndReturnError:&v48];
  id v6 = v48;
  uint64_t v7 = objc_msgSend(v3, "stringWithFormat:", @"Starting engine %d", v5);

  id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController scheduleFile]", 899, v7];
  id v9 = (os_log_t *)MEMORY[0x263F47288];
  int v10 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v8;
    id v12 = v10;
    uint64_t v13 = [v11 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v50 = v13;
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (v6)
  {
    CSInitializeLogging();
    uint64_t v14 = [NSString stringWithFormat:@"Error starting engine %@", v6];
    dispatch_time_t v15 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController scheduleFile]", 902, v14];
    os_log_t v16 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v15;
      id v18 = v16;
      uint64_t v19 = [v17 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v50 = v19;
      _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [(HUComfortSoundsController *)self setupEngine];
    [(HUComfortSoundsController *)self scheduleFile];
  }
  else
  {
    audioPlayerNodeA = self->_audioPlayerNodeA;
    if (self->_currentNode == audioPlayerNodeA) {
      audioPlayerNodeA = self->_audioPlayerNodeB;
    }
    os_log_t v21 = audioPlayerNodeA;
    [(HUComfortSoundsController *)self setCurrentNode:v21];
    id v22 = [(HUComfortSoundsController *)self nextFileToPlay];
    if (v22)
    {
      [(AVAudioPlayerNode *)v21 setVolume:0.0];
      -[AVAudioPlayerNode prepareWithFrameCount:](v21, "prepareWithFrameCount:", [v22 length]);
      [(AVAudioPlayerNode *)v21 scheduleFile:v22 atTime:0 completionCallbackType:2 completionHandler:&__block_literal_global_231];
      uint64_t v23 = [v22 length];
      uint64_t v24 = [(AVAudioPlayerNode *)v21 outputFormatForBus:0];
      [v24 sampleRate];
      double v26 = v25;

      double v27 = (double)v23 / v26;
      if (v27 <= 20.0) {
        double v28 = v27 - self->_fadeDuration;
      }
      else {
        double v28 = (v27 - self->_fadeDuration) * 0.8;
      }
      id mixingBlock = self->_mixingBlock;
      if (mixingBlock) {
        dispatch_block_cancel(mixingBlock);
      }
      objc_initWeak((id *)buf, self);
      double fadeDuration = self->_fadeDuration;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__HUComfortSoundsController_scheduleFile__block_invoke_2;
      block[3] = &unk_2640FEE70;
      objc_copyWeak(v47, (id *)buf);
      id v31 = v21;
      os_log_t v46 = v31;
      v47[1] = *(id *)&fadeDuration;
      dispatch_block_t v32 = dispatch_block_create((dispatch_block_flags_t)0, block);
      id v33 = self->_mixingBlock;
      self->_id mixingBlock = v32;

      dispatch_time_t v34 = dispatch_time(0, (uint64_t)(v28 * 1000000000.0));
      dispatch_after(v34, (dispatch_queue_t)self->_audioQueue, self->_mixingBlock);
      id v35 = [(HUComfortSoundsController *)self engine];
      char v36 = [v35 isRunning];

      if ((v36 & 1) == 0) {
        [(HUComfortSoundsController *)self setupEngine];
      }
      [(AVAudioPlayerNode *)v31 play];
      BOOL v37 = [(HUComfortSoundsController *)self changingSounds];
      uint64_t v38 = 40;
      if (v37) {
        uint64_t v38 = 56;
      }
      [(HUComfortSoundsController *)self rampNodeVolume:v31 from:0.0 to:1.0 fadeDuration:*(double *)((char *)&self->super.isa + v38)];
      [(HUComfortSoundsController *)self setCrossFading:1];

      objc_destroyWeak(v47);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      CSInitializeLogging();
      id v39 = [NSString stringWithFormat:@"Missing file. Stopping"];
      id v40 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController scheduleFile]", 913, v39];
      os_log_t v41 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = v40;
        id v43 = v41;
        uint64_t v44 = [v42 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v50 = v44;
        _os_log_impl(&dword_20CC86000, v43, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      [(HUComfortSoundsController *)self stopOnQueueAndClearRoute:1];
    }
  }
}

void __41__HUComfortSoundsController_scheduleFile__block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained shouldContinuePlayback])
  {
    id v4 = objc_loadWeakRetained(v2);
    int v5 = [v4 currentRouteSupported];

    if (v5)
    {
      CSInitializeLogging();
      id v6 = NSString;
      uint64_t v7 = +[HUComfortSoundsSettings sharedInstance];
      unsigned int v8 = [v7 comfortSoundsEnabled];
      id v9 = objc_loadWeakRetained(v2);
      int v10 = [v6 stringWithFormat:@"Continuing playback [%d, %d]", v8, objc_msgSend(v9, "currentRouteSupported")];

      id v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController scheduleFile]_block_invoke_2", 943, v10];
      id v12 = (void *)*MEMORY[0x263F47288];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v11;
        uint64_t v14 = v12;
        *(_DWORD *)buf = 136446210;
        uint64_t v26 = [v13 UTF8String];
        _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      id v15 = objc_loadWeakRetained(v2);
      [v15 rampNodeVolume:*(void *)(a1 + 32) from:1.0 to:0.0 fadeDuration:*(double *)(a1 + 48)];

      os_log_t v16 = objc_loadWeakRetained(v2);
      [v16 scheduleFile];
      goto LABEL_10;
    }
  }
  else
  {
  }
  CSInitializeLogging();
  id v17 = NSString;
  id v18 = +[HUComfortSoundsSettings sharedInstance];
  unsigned int v19 = [v18 comfortSoundsEnabled];
  id v20 = objc_loadWeakRetained(v2);
  os_log_t v16 = [v17 stringWithFormat:@"Stopping playback [%d, %d]", v19, objc_msgSend(v20, "currentRouteSupported")];

  os_log_t v21 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController scheduleFile]_block_invoke", 949, v16];
  id v22 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v23 = v21;
    uint64_t v24 = v22;
    *(_DWORD *)buf = 136446210;
    uint64_t v26 = [v23 UTF8String];
    _os_log_impl(&dword_20CC86000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
LABEL_10:
}

- (BOOL)isPlaying
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  audioQueue = self->_audioQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__HUComfortSoundsController_isPlaying__block_invoke;
  v5[3] = &unk_2640FD6A0;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(audioQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__HUComfortSoundsController_isPlaying__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isPlayingOnQueue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isPlayingOnQueue
{
  char v3 = [(HUComfortSoundsController *)self audioPlayerNodeA];
  if ([v3 isPlaying])
  {
    char v4 = 1;
  }
  else
  {
    int v5 = [(HUComfortSoundsController *)self audioPlayerNodeB];
    char v4 = [v5 isPlaying];
  }
  return v4;
}

- (void)updateVolumeForSessionAndRamp:(BOOL)a3
{
  if (!self->_holdingForCall)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    int v5 = +[HUUtilities sharedUtilities];
    audioQueue = self->_audioQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__HUComfortSoundsController_updateVolumeForSessionAndRamp___block_invoke;
    v7[3] = &unk_2640FEE98;
    v7[4] = self;
    v7[5] = v9;
    BOOL v8 = a3;
    [v5 checkAudioPlayingWithQueue:audioQueue andCompletion:v7];

    _Block_object_dispose(v9, 8);
  }
}

void __59__HUComfortSoundsController_updateVolumeForSessionAndRamp___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v2 = +[HUComfortSoundsSettings sharedInstance];
    if ([v2 mixesWithMedia])
    {

      goto LABEL_8;
    }
  }
  int v5 = +[HUComfortSoundsSettings sharedInstance];
  int v6 = [v5 forceMixingBehavior];

  if (!a2)
  {
    if (!v6)
    {
      uint64_t v7 = +[HUComfortSoundsSettings sharedInstance];
      [v7 relativeVolume];
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v7 = +[HUComfortSoundsSettings sharedInstance];
    [v7 mediaVolume];
LABEL_10:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;

    goto LABEL_11;
  }

  if (v6) {
    goto LABEL_8;
  }
LABEL_11:
  CSInitializeLogging();
  char v9 = NSString;
  int v10 = +[HUComfortSoundsSettings sharedInstance];
  id v11 = [v9 stringWithFormat:@"Updating volume %d, %d, %lf", a2, objc_msgSend(v10, "mixesWithMedia"), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];

  id v12 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController updateVolumeForSessionAndRamp:]_block_invoke", 1018, v11];
  id v13 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v12;
    id v15 = v13;
    *(_DWORD *)buf = 136446210;
    uint64_t v20 = [v14 UTF8String];
    _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  os_log_t v16 = *(void **)(a1 + 32);
  double v17 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v18 = [v16 currentNode];
  [v16 setVolume:v18 forNode:*(unsigned __int8 *)(a1 + 48) andRamp:v17];
}

- (void)setVolume:(double)a3 forNode:(id)a4 andRamp:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (v5)
  {
    id duckingBlock = self->_duckingBlock;
    if (duckingBlock) {
      dispatch_block_cancel(duckingBlock);
    }
    [(HUComfortSoundsController *)self outputGain];
    -[HUComfortSoundsController rampOutputGainFrom:to:withProgress:](self, "rampOutputGainFrom:to:withProgress:");
  }
  else
  {
    [(HUComfortSoundsController *)self setOutputGain:a3];
    if (a3 <= 0.0)
    {
      [(HUComfortSoundsController *)self stopOnQueueAndClearRoute:0];
      goto LABEL_11;
    }
    CSInitializeLogging();
    int v10 = objc_msgSend(NSString, "stringWithFormat:", @"CS volume changed. Starting %d", -[HUComfortSoundsController shouldContinuePlayback](self, "shouldContinuePlayback"));
    id v11 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController setVolume:forNode:andRamp:]", 1042, v10];
    id v12 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v11;
      id v14 = v12;
      *(_DWORD *)buf = 136446210;
      uint64_t v16 = [v13 UTF8String];
      _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  [(HUComfortSoundsController *)self playOnQueue];
LABEL_11:
}

- (void)setOutputGain:(double)a3
{
  double v4 = 0.0;
  if (a3 >= 0.0) {
    double v4 = a3;
  }
  if (a3 <= 1.0) {
    double v5 = v4;
  }
  else {
    double v5 = 1.0;
  }
  self->_double outputGain = v5;
  if (![(HUComfortSoundsController *)self crossFading])
  {
    currentNode = self->_currentNode;
    double outputGain = self->_outputGain;
    *(float *)&double outputGain = outputGain;
    [(AVAudioPlayerNode *)currentNode setVolume:outputGain];
  }
}

- (void)rampOutputGainFrom:(double)a3 to:(double)a4 withProgress:(double)a5
{
  if (a3 != a4)
  {
    v24[1] = v10;
    v24[2] = v9;
    v24[3] = v8;
    v24[4] = v7;
    v24[7] = v5;
    v24[8] = v6;
    double duckDuration = self->_duckDuration;
    double stepsPerSecond = self->_stepsPerSecond;
    double v17 = 1.0 / (duckDuration * stepsPerSecond);
    [(HUComfortSoundsController *)self setOutputGain:self->_outputGain + (a4 - a3) / (duckDuration * stepsPerSecond + 1.0)];
    id v18 = objc_initWeak(v24, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__HUComfortSoundsController_rampOutputGainFrom_to_withProgress___block_invoke;
    block[3] = &unk_2640FEEC0;
    v23[1] = *(id *)&a5;
    void v23[2] = *(id *)&v17;
    void block[4] = self;
    v23[3] = *(id *)&a3;
    void v23[4] = *(id *)&a4;
    objc_copyWeak(v23, v24);
    dispatch_block_t v19 = dispatch_block_create((dispatch_block_flags_t)0, block);
    id duckingBlock = self->_duckingBlock;
    self->_id duckingBlock = v19;

    dispatch_time_t v21 = dispatch_time(0, (uint64_t)(self->_stepDuration * 1000000000.0));
    dispatch_after(v21, (dispatch_queue_t)self->_audioQueue, self->_duckingBlock);
    objc_destroyWeak(v23);

    objc_destroyWeak(v24);
  }
}

void __64__HUComfortSoundsController_rampOutputGainFrom_to_withProgress___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48) + *(double *)(a1 + 56);
  char v3 = *(void **)(a1 + 32);
  if (v3) {
    BOOL v4 = v2 < 1.0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    double v6 = *(double *)(a1 + 64);
    double v7 = *(double *)(a1 + 72);
    [v3 rampOutputGainFrom:v6 to:v7 withProgress:v2];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setOutputGain:*(double *)(a1 + 72)];

    if (*(double *)(a1 + 72) == 0.0)
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 40));
      [v8 stopOnQueueAndClearRoute:1];
    }
  }
}

- (void)rampNodeVolume:(id)a3 from:(double)a4 to:(double)a5 fadeDuration:(double)a6
{
}

- (void)rampNodeVolume:(id)a3 from:(double)a4 to:(double)a5 fadeDuration:(double)a6 withProgress:(double)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a3;
  double stepsPerSecond = self->_stepsPerSecond;
  double v14 = vabdd_f64(a5, a4);
  double v15 = a7 * 1.57079633;
  if (a5 <= a4) {
    double v16 = a5 + cos(v15) * v14;
  }
  else {
    double v16 = a4 + sin(v15) * v14;
  }
  [(HUComfortSoundsController *)self outputGain];
  double v18 = v16 * v17;
  double v19 = 0.0;
  if (v18 >= 0.0) {
    double v19 = v18;
  }
  if (v18 <= 1.0) {
    double v20 = v19;
  }
  else {
    double v20 = 1.0;
  }
  *(float *)&double v20 = v20;
  objc_msgSend(v12, "setVolume:", v20, v19);
  if (a5 <= a4) {
    BOOL v21 = v16 <= a5;
  }
  else {
    BOOL v21 = v16 >= a5;
  }
  if (v21)
  {
    if (a5 <= a4)
    {
      [v12 stop];
      if (![(HUComfortSoundsController *)self shouldContinuePlayback])
      {
        CSInitializeLogging();
        id v33 = [NSString stringWithFormat:@"Playback ended. Stopping"];
        dispatch_time_t v34 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController rampNodeVolume:from:to:fadeDuration:withProgress:]", 1176, v33];
        id v35 = (void *)*MEMORY[0x263F47288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
        {
          id v36 = v34;
          BOOL v37 = v35;
          *(_DWORD *)buf = 136446210;
          uint64_t v44 = [v36 UTF8String];
          _os_log_impl(&dword_20CC86000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        uint64_t v38 = [(HUComfortSoundsController *)self engine];
        [v38 stop];
      }
      id rampDownBlock = self->_rampDownBlock;
      self->_id rampDownBlock = 0;
    }
    else
    {
      id rampUpBlock = self->_rampUpBlock;
      self->_id rampUpBlock = 0;

      [(HUComfortSoundsController *)self setCrossFading:0];
      [(HUComfortSoundsController *)self setChangingSounds:0];
      if ([(HUComfortSoundsController *)self changePending])
      {
        CSInitializeLogging();
        id v23 = [NSString stringWithFormat:@"Performing pending change request."];
        uint64_t v24 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController rampNodeVolume:from:to:fadeDuration:withProgress:]", 1165, v23];
        double v25 = (void *)*MEMORY[0x263F47288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
        {
          id v26 = v24;
          uint64_t v27 = v25;
          *(_DWORD *)buf = 136446210;
          uint64_t v44 = [v26 UTF8String];
          _os_log_impl(&dword_20CC86000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        [(HUComfortSoundsController *)self setChangePending:0];
        [(HUComfortSoundsController *)self scheduleNewFile];
      }
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__HUComfortSoundsController_rampNodeVolume_from_to_fadeDuration_withProgress___block_invoke;
    block[3] = &unk_2640FEEE8;
    objc_copyWeak(v42, (id *)buf);
    v42[1] = *(id *)&a7;
    *(double *)&v42[2] = 1.0 / (stepsPerSecond * a6);
    id v41 = v12;
    v42[3] = *(id *)&a4;
    v42[4] = *(id *)&a5;
    v42[5] = *(id *)&a6;
    dispatch_block_t v28 = dispatch_block_create((dispatch_block_flags_t)0, block);
    os_log_t v29 = (objc_class *)MEMORY[0x2105575F0]();
    uint64_t v30 = 32;
    if (a5 > a4) {
      uint64_t v30 = 24;
    }
    id v31 = *(Class *)((char *)&self->super.isa + v30);
    *(Class *)((char *)&self->super.isa + v30) = v29;

    dispatch_time_t v32 = dispatch_time(0, (uint64_t)(self->_stepDuration * 1000000000.0));
    dispatch_after(v32, (dispatch_queue_t)self->_audioQueue, v28);

    objc_destroyWeak(v42);
    objc_destroyWeak((id *)buf);
  }
}

void __78__HUComfortSoundsController_rampNodeVolume_from_to_fadeDuration_withProgress___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained rampNodeVolume:*(void *)(a1 + 32) from:*(double *)(a1 + 64) to:*(double *)(a1 + 72) fadeDuration:*(double *)(a1 + 80) withProgress:*(double *)(a1 + 48) + *(double *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

- (void)startComfortSounds
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  id v3 = [NSString stringWithFormat:@"CS enabled. Starting"];
  BOOL v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController startComfortSounds]", 1187, v3];
  double v5 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    double v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(HUComfortSoundsController *)self play];
  id v8 = +[HUComfortSoundsSettings sharedInstance];
  char v9 = [v8 selectedComfortSound];
  uint64_t v10 = [v9 soundGroup];

  id v11 = [(HUComfortSoundsController *)self assetManager];
  id v12 = [v11 availableAssets];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__HUComfortSoundsController_startComfortSounds__block_invoke;
  v13[3] = &unk_2640FEF10;
  v13[4] = self;
  void v13[5] = v10;
  [v12 enumerateObjectsUsingBlock:v13];
}

void __47__HUComfortSoundsController_startComfortSounds__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 properties];
  BOOL v4 = [v3 valueForKey:@"SoundGroup"];
  uint64_t v5 = [v4 integerValue];
  uint64_t v6 = *(void *)(a1 + 40);

  if (v5 == v6)
  {
    double v7 = [*(id *)(a1 + 32) assetManager];
    id v8 = [v9 assetId];
    [v7 downloadAssetWithId:v8];
  }
}

- (void)stop
{
  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HUComfortSoundsController_stop__block_invoke;
  block[3] = &unk_2640FC960;
  void block[4] = self;
  dispatch_async(audioQueue, block);
}

uint64_t __33__HUComfortSoundsController_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopOnQueueAndClearRoute:1];
}

- (void)stopAndClearRoute:(BOOL)a3
{
  audioQueue = self->_audioQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__HUComfortSoundsController_stopAndClearRoute___block_invoke;
  v4[3] = &unk_2640FEF38;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(audioQueue, v4);
}

uint64_t __47__HUComfortSoundsController_stopAndClearRoute___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopOnQueueAndClearRoute:*(unsigned __int8 *)(a1 + 40)];
}

- (void)stopOnQueueAndClearRoute:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  BOOL v5 = [NSString stringWithFormat:@"Stopping"];
  uint64_t v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController stopOnQueueAndClearRoute:]", 1221, v5];
  double v7 = (os_log_t *)MEMORY[0x263F47288];
  id v8 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v6;
    uint64_t v10 = v8;
    *(_DWORD *)buf = 136446210;
    uint64_t v24 = [v9 UTF8String];
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id mixingBlock = self->_mixingBlock;
  if (mixingBlock) {
    dispatch_block_cancel(mixingBlock);
  }
  id rampUpBlock = self->_rampUpBlock;
  if (rampUpBlock) {
    dispatch_block_cancel(rampUpBlock);
  }
  id rampDownBlock = self->_rampDownBlock;
  if (rampDownBlock) {
    dispatch_block_cancel(rampDownBlock);
  }
  if (v3) {
    [(HUComfortSoundsController *)self clearActiveRoute];
  }
  double v14 = [(HUComfortSoundsController *)self audioPlayerNodeA];
  [v14 stop];

  uint64_t v15 = [(HUComfortSoundsController *)self audioPlayerNodeB];
  [v15 stop];

  if (![(HUComfortSoundsController *)self shouldContinuePlayback])
  {
    CSInitializeLogging();
    uint64_t v16 = [NSString stringWithFormat:@"Stopping engine"];
    double v17 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController stopOnQueueAndClearRoute:]", 1246, v16];
    os_log_t v18 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v17;
      double v20 = v18;
      uint64_t v21 = [v19 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v24 = v21;
      _os_log_impl(&dword_20CC86000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v22 = [(HUComfortSoundsController *)self engine];
    [v22 stop];

    [(HUComfortSoundsController *)self setTransaction:0];
    [(AVAudioSession *)self->_session setActive:0 forFeature:2048 error:0];
  }
  [(HUComfortSoundsController *)self clearEngine];
}

- (void)availableAssetsDidUpdate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v2 = (void *)MEMORY[0x263F21138];
  BOOL v3 = [(HUComfortSoundsAssetManager *)self->_assetManager availableAssets];
  id v13 = 0;
  BOOL v4 = [v2 archivedAssets:v3 error:&v13];
  id v5 = v13;

  if ([v4 length]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v12 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v4, @"HUComfortSoundsAvailableAssetsKey", 0);
    double v7 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:v12 andIdentifier:0x1000000];

    id v8 = +[AXHeardController sharedServer];
    uint64_t v10 = [MEMORY[0x263F472C0] messageWithPayload:v7];
    [v8 sendUpdateMessage:v10 forIdentifier:0x1000000];
    goto LABEL_8;
  }
  CSInitializeLogging();
  double v7 = [NSString stringWithFormat:@"Error archiving assets %@", v5];
  id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController availableAssetsDidUpdate]", 1274, v7];
  id v9 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v8;
    uint64_t v10 = v9;
    uint64_t v11 = [v8 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = v11;
    _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
LABEL_8:
  }
}

- (void)assetDownloadDidUpdate
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263F21138];
  BOOL v4 = [(HUComfortSoundsAssetManager *)self->_assetManager availableAssets];
  id v16 = 0;
  id v5 = [v3 archivedAssets:v4 error:&v16];
  id v6 = v16;

  if ([v5 length]) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v13 = NSDictionary;
    double v14 = [(HUComfortSoundsAssetManager *)self->_assetManager assetDownloadProgress];
    uint64_t v15 = objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v5, @"HUComfortSoundsAvailableAssetsKey", v14, @"HUComfortSoundsDownloadProgressKey", 0);

    id v8 = [MEMORY[0x263F472B0] messagePayloadFromDictionary:v15 andIdentifier:0x1000000];

    id v9 = +[AXHeardController sharedServer];
    uint64_t v11 = [MEMORY[0x263F472C0] messageWithPayload:v8];
    [v9 sendUpdateMessage:v11 forIdentifier:0x1000000];
    goto LABEL_8;
  }
  CSInitializeLogging();
  id v8 = [NSString stringWithFormat:@"Error archiving assets %@", v6];
  id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsController assetDownloadDidUpdate]", 1290, v8];
  uint64_t v10 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v9;
    uint64_t v11 = v10;
    uint64_t v12 = [v9 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v18 = v12;
    _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
LABEL_8:
  }
}

- (id)processComfortSoundsAssetRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 payload];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__HUComfortSoundsController_processComfortSoundsAssetRequest___block_invoke;
  v8[3] = &unk_2640FE148;
  id v9 = v4;
  uint64_t v10 = self;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return 0;
}

void __62__HUComfortSoundsController_processComfortSoundsAssetRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([v11 isEqualToString:@"ax_hearing_should_register_client_key"])
  {
    uint64_t v6 = [v5 BOOLValue];
    BOOL v7 = [*(id *)(a1 + 32) client];
    [v7 setWantsUpdates:v6 forIdentifier:0x1000000];

    if (v6)
    {
      id v8 = [*(id *)(*(void *)(a1 + 40) + 176) availableAssets];
      uint64_t v9 = [v8 count];

      uint64_t v10 = *(id **)(a1 + 40);
      if (v9) {
        [v10 availableAssetsDidUpdate];
      }
      else {
        [v10[22] refreshAssets];
      }
    }
  }
  else if ([v11 isEqualToString:@"HUComfortSoundsDownloadAssetKey"])
  {
    [*(id *)(*(void *)(a1 + 40) + 176) downloadAssetWithId:v5];
  }
  else if ([v11 isEqualToString:@"HUComfortSoundsRemoveAssetKey"])
  {
    [*(id *)(*(void *)(a1 + 40) + 176) removeAssetWithId:v5];
  }
}

- (AVAudioSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (AVAudioEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (AVAudioPlayerNode)audioPlayerNodeA
{
  return self->_audioPlayerNodeA;
}

- (void)setAudioPlayerNodeA:(id)a3
{
}

- (AVAudioPlayerNode)audioPlayerNodeB
{
  return self->_audioPlayerNodeB;
}

- (void)setAudioPlayerNodeB:(id)a3
{
}

- (AVAudioPlayerNode)currentNode
{
  return self->_currentNode;
}

- (void)setCurrentNode:(id)a3
{
}

- (OS_dispatch_queue)audioQueue
{
  return self->_audioQueue;
}

- (void)setAudioQueue:(id)a3
{
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (void)setRouteUID:(id)a3
{
}

- (BOOL)holdingForCall
{
  return self->_holdingForCall;
}

- (void)setHoldingForCall:(BOOL)a3
{
  self->_BOOL holdingForCall = a3;
}

- (BOOL)temporaryAirpodsDisconnect
{
  return self->_temporaryAirpodsDisconnect;
}

- (void)setTemporaryAirpodsDisconnect:(BOOL)a3
{
  self->_temporaryAirpodsDisconnect = a3;
}

- (BOOL)liveListenComfortSoundsSwitch
{
  return self->_liveListenComfortSoundsSwitch;
}

- (void)setLiveListenComfortSoundsSwitch:(BOOL)a3
{
  self->_liveListenComfortSoundsSwitch = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (HUComfortSound)selectedSound
{
  return self->_selectedSound;
}

- (void)setSelectedSound:(id)a3
{
}

- (HUComfortSoundsAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
}

- (double)outputGain
{
  return self->_outputGain;
}

- (BOOL)crossFading
{
  return self->_crossFading;
}

- (void)setCrossFading:(BOOL)a3
{
  self->_crossFading = a3;
}

- (BOOL)changingSounds
{
  return self->_changingSounds;
}

- (void)setChangingSounds:(BOOL)a3
{
  self->_changingSounds = a3;
}

- (BOOL)changePending
{
  return self->_changePending;
}

- (void)setChangePending:(BOOL)a3
{
  self->_changePending = a3;
}

- (BOOL)isScreenBlank
{
  return self->_isScreenBlank;
}

- (void)setIsScreenBlank:(BOOL)a3
{
  self->_isScreenBlank = a3;
}

- (BOOL)isDeviceLockedWithPasscode
{
  return self->_isDeviceLockedWithPasscode;
}

- (void)setIsDeviceLockedWithPasscode:(BOOL)a3
{
  self->_isDeviceLockedWithPasscode = a3;
}

- (BOOL)isInContinuitySession
{
  return self->_isInContinuitySession;
}

- (void)setIsInContinuitySession:(BOOL)a3
{
  self->_isInContinuitySession = a3;
}

- (int)blankScreenToken
{
  return self->_blankScreenToken;
}

- (void)setBlankScreenToken:(int)a3
{
  self->_blankScreenToken = a3;
}

- (int)keybagLockStateToken
{
  return self->_keybagLockStateToken;
}

- (void)setKeybagLockStateToken:(int)a3
{
  self->_keybagLockStateToken = a3;
}

- (int)lockStateNotifyToken
{
  return self->_lockStateNotifyToken;
}

- (void)setLockStateNotifyToken:(int)a3
{
  self->_lockStateNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_selectedSound, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_storeStrong((id *)&self->_audioQueue, 0);
  objc_storeStrong((id *)&self->_currentNode, 0);
  objc_storeStrong((id *)&self->_audioPlayerNodeB, 0);
  objc_storeStrong((id *)&self->_audioPlayerNodeA, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_rampDownBlock, 0);
  objc_storeStrong(&self->_rampUpBlock, 0);
  objc_storeStrong(&self->_duckingBlock, 0);

  objc_storeStrong(&self->_mixingBlock, 0);
}

- (void)callStatusDidChange:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *(unsigned __int8 *)(a1 + 80);
  v4[0] = 67109379;
  v4[1] = v3;
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_20CC86000, log, OS_LOG_TYPE_DEBUG, "Phone call holding %d with notification %{private}@", (uint8_t *)v4, 0x12u);
}

- (void)callStatusDidChange:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20CC86000, a2, OS_LOG_TYPE_DEBUG, "Call status changed - %{private}@", (uint8_t *)&v2, 0xCu);
}

@end