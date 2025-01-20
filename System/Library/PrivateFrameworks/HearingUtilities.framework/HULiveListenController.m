@interface HULiveListenController
- (AVAudioSession)session;
- (AXDispatchTimer)accessoryUpdateTimer;
- (AXHALiveListenDelegate)delegate;
- (BOOL)didInitializeAudioUnit;
- (BOOL)exportsLiveListenToFile;
- (BOOL)isListening;
- (BOOL)waitingForAccessoryUpdate;
- (HULiveListenController)init;
- (OpaqueAudioComponentInstance)mixerUnit;
- (OpaqueAudioComponentInstance)rioUnit;
- (OpaqueExtAudioFile)debugAudioFile;
- (float)audioLevel;
- (id)_connectUnits;
- (id)_setupAudioUnitsWithAudioFormat:(AudioStreamBasicDescription *)a3;
- (id)_setupMixerUnitWithAudioFormat:(AudioStreamBasicDescription *)a3;
- (id)_setupRioUnitWithAudioFormat:(AudioStreamBasicDescription *)a3;
- (id)_setupSession;
- (void)audioRouteDidChange:(id)a3;
- (void)audioSessionWasInterrupted:(id)a3;
- (void)dealloc;
- (void)mediaServicesWereReset:(id)a3;
- (void)setAccessoryUpdateTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidInitializeAudioUnit:(BOOL)a3;
- (void)setExportsLiveListenToFile:(BOOL)a3;
- (void)setIsListening:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setWaitingForAccessoryUpdate:(BOOL)a3;
- (void)startListeningWithCompletion:(id)a3;
- (void)stopListeningWithCompletion:(id)a3;
@end

@implementation HULiveListenController

- (HULiveListenController)init
{
  v28[1] = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)HULiveListenController;
  v2 = [(HULiveListenController *)&v27 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F544E0] sharedAVSystemController];
    v4 = (uint64_t *)MEMORY[0x263F54308];
    v28[0] = *MEMORY[0x263F54308];
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    [v3 setAttribute:v5 forKey:*MEMORY[0x263F544A0] error:0];

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("ha_livelisten_audiounits_queue", v6);
    audioUnitsQueue = v2->_audioUnitsQueue;
    v2->_audioUnitsQueue = (OS_dispatch_queue *)v7;

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v2 selector:sel_audioSessionWasInterrupted_ name:*MEMORY[0x263EF90A0] object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel_mediaServicesWereReset_ name:*MEMORY[0x263EF90F8] object:0];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v2 selector:sel_audioRouteDidChange_ name:*MEMORY[0x263EF9248] object:0];

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v13 = *v4;
    v14 = [MEMORY[0x263F544E0] sharedAVSystemController];
    [v12 addObserver:v2 selector:sel_audioRouteDidChange_ name:v13 object:v14];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)userChangedAudioRoute, @"AXSpringBoardUserChangedAudioRouteNotification", 0, (CFNotificationSuspensionBehavior)0);
    v16 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v16, v2, (CFNotificationCallback)_hearingTestStarted_0, @"com.apple.HearingTest.test.started", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_initWeak(&location, v2);
    v17 = +[HUHearingAidSettings sharedInstance];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __30__HULiveListenController_init__block_invoke;
    v24[3] = &unk_2640FC910;
    objc_copyWeak(&v25, &location);
    [v17 registerUpdateBlock:v24 forRetrieveSelector:sel_exportsLiveListenToFile withListener:v2];

    v18 = +[HUComfortSoundsSettings sharedInstance];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __30__HULiveListenController_init__block_invoke_2;
    v22[3] = &unk_2640FC960;
    v19 = v2;
    v23 = v19;
    [v18 registerUpdateBlock:v22 forRetrieveSelector:sel_comfortSoundsEnabled withListener:v19];

    v20 = +[HUHearingAidSettings sharedInstance];
    -[HULiveListenController setExportsLiveListenToFile:](v19, "setExportsLiveListenToFile:", [v20 exportsLiveListenToFile]);

    v19->_noise = -100.0;
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__HULiveListenController_init__block_invoke(uint64_t a1)
{
  id v4 = +[HUHearingAidSettings sharedInstance];
  uint64_t v2 = [v4 exportsLiveListenToFile];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExportsLiveListenToFile:v2];
}

void __30__HULiveListenController_init__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[HUComfortSoundsSettings sharedInstance];
  int v3 = [v2 comfortSoundsEnabled];

  if (v3)
  {
    HAInitializeLogging();
    id v4 = [NSString stringWithFormat:@"Background Sounds enabled. Stopping."];
    v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController init]_block_invoke_2", 129, v4];
    v6 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      v8 = v6;
      *(_DWORD *)buf = 136446210;
      uint64_t v10 = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [*(id *)(a1 + 32) stopListeningWithCompletion:0];
  }
}

- (void)dealloc
{
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HULiveListenController;
  [(HULiveListenController *)&v4 dealloc];
}

- (void)mediaServicesWereReset:(id)a3
{
}

uint64_t __49__HULiveListenController_mediaServicesWereReset___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int v2 = [*(id *)(a1 + 32) isListening];
  HAInitializeLogging();
  int v3 = [NSString stringWithFormat:@"Media reset, wasListening = %d", v2];
  objc_super v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController mediaServicesWereReset:]_block_invoke", 170, v3];
  v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t result = [*(id *)(a1 + 32) stopListeningWithCompletion:0];
  if (v2) {
    return [*(id *)(a1 + 32) startListeningWithCompletion:0];
  }
  return result;
}

- (void)audioSessionWasInterrupted:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __53__HULiveListenController_audioSessionWasInterrupted___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unsigned int v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 valueForKey:*MEMORY[0x263EF90C8]];
  int v4 = [v3 intValue];

  if (v4 == 1)
  {
    HAInitializeLogging();
    v5 = [NSString stringWithFormat:@"Session reset. Stopping"];
    id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController audioSessionWasInterrupted:]_block_invoke", 185, v5];
    id v7 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      v9 = v7;
      *(_DWORD *)buf = 136446210;
      uint64_t v11 = [v8 UTF8String];
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [*(id *)(a1 + 40) stopListeningWithCompletion:0];
  }
}

- (void)audioRouteDidChange:(id)a3
{
}

uint64_t __46__HULiveListenController_audioRouteDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t result = hearingAidStreamSelected();
  if ((result & 1) == 0)
  {
    uint64_t result = liveListenStreamSelected();
    if ((result & 1) == 0)
    {
      HAInitializeLogging();
      id v3 = NSString;
      unsigned int v4 = hearingAidStreamSelected();
      v5 = [v3 stringWithFormat:@"Route changed. Stopping %d, %d", v4, liveListenStreamSelected()];
      id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController audioRouteDidChange:]_block_invoke", 196, v5];
      id v7 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v6;
        v9 = v7;
        *(_DWORD *)buf = 136446210;
        uint64_t v11 = [v8 UTF8String];
        _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      return [*(id *)(a1 + 32) stopListeningWithCompletion:0];
    }
  }
  return result;
}

- (float)audioLevel
{
  BOOL v3 = [(HULiveListenController *)self isListening];
  float result = 0.0;
  if (v3)
  {
    AudioUnitParameterValue outValue = 0.0;
    AudioUnitGetParameter(self->_mixerUnit, 0x3E8u, 1u, 0, &outValue);
    double v5 = __exp10(outValue * 0.05) * 50.0;
    AudioUnitParameterValue v9 = 0.0;
    AudioUnitGetParameter(self->_mixerUnit, 0xFA0u, 1u, 0, &v9);
    p_signal = &self->_signal;
    if (v9 >= self->_signal)
    {
      float noise = self->_noise;
      p_float noise = &self->_noise;
      if (v9 <= noise) {
        return v5;
      }
      p_signal = p_noise;
    }
    float *p_signal = v9;
    return v5;
  }
  return result;
}

- (OpaqueExtAudioFile)debugAudioFile
{
  return self->_debugAudioFile;
}

- (void)startListeningWithCompletion:(id)a3
{
  id v4 = a3;
  audioUnitsQueue = self->_audioUnitsQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HULiveListenController_startListeningWithCompletion___block_invoke;
  v7[3] = &unk_2640FCD88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(audioUnitsQueue, v7);
}

void __55__HULiveListenController_startListeningWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  unsigned int v2 = +[HUUtilities sharedUtilities];
  [v2 clearAudioRoutes];

  unsigned __int8 v3 = hearingAidStreamAvailable();
  if ((liveListenStreamSelected() & 1) == 0 && (v3 & 1) == 0)
  {
    HAInitializeLogging();
    id v4 = [NSString stringWithFormat:@"LiveListen not streamable"];
    double v5 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController startListeningWithCompletion:]_block_invoke", 242, v4];
    id v6 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      id v8 = v6;
      LODWORD(buf.mSampleRate) = 136446210;
      *(void *)((char *)&buf.mSampleRate + 4) = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, 0, 0);
    }
    return;
  }
  uint64_t v10 = +[HUComfortSoundsSettings sharedInstance];
  int v11 = [v10 comfortSoundsEnabled];

  if (v11)
  {
    CSInitializeLogging();
    uint64_t v12 = [NSString stringWithFormat:@"Disabling to start Live Listen"];
    uint64_t v13 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController startListeningWithCompletion:]_block_invoke", 251, v12];
    v14 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v13;
      v16 = v14;
      LODWORD(buf.mSampleRate) = 136446210;
      *(void *)((char *)&buf.mSampleRate + 4) = [v15 UTF8String];
      _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    v17 = +[HUComfortSoundsSettings sharedInstance];
    [v17 setComfortSoundsEnabled:0];

    v18 = +[HUComfortSoundsController sharedController];
    [v18 stop];
  }
  v19 = [*(id *)(a1 + 32) _setupSession];
  if (v19) {
    goto LABEL_12;
  }
  v29 = [*(id *)(a1 + 32) session];
  [v29 sampleRate];
  double v31 = v30;

  if ((v3 & (v31 > 0.0)) == 0) {
    double v31 = 16000.0;
  }
  v32 = [*(id *)(a1 + 32) session];
  unsigned int v33 = [v32 inputNumberOfChannels];

  if (v33 - 3 >= 0xFFFFFFFE) {
    uint64_t v34 = v33;
  }
  else {
    uint64_t v34 = 2;
  }
  HAInitializeLogging();
  v35 = [NSString stringWithFormat:@"LiveListen: starting - sampleRate = %.f, numberOfChannels = %d, isInitialized = %d", *(void *)&v31, v34, objc_msgSend(*(id *)(a1 + 32), "didInitializeAudioUnit")];
  v36 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController startListeningWithCompletion:]_block_invoke", 291, v35];
  v37 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v38 = v36;
    v39 = v37;
    uint64_t v40 = [v38 UTF8String];
    LODWORD(buf.mSampleRate) = 136446210;
    *(void *)((char *)&buf.mSampleRate + 4) = v40;
    _os_log_impl(&dword_20CC86000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }
  if ([*(id *)(a1 + 32) didInitializeAudioUnit])
  {
LABEL_33:
    OSStatus v54 = AudioOutputUnitStart(*(AudioUnit *)(*(void *)(a1 + 32) + 48));
    if (v54)
    {
      v55 = (void *)MEMORY[0x263F087E8];
      uint64_t v56 = v54;
      v57 = [NSDictionary dictionaryWithObject:@"Couldn't start remote i/o unit" forKey:*MEMORY[0x263F08320]];
      v19 = [v55 errorWithDomain:@"com.apple.axlivelisten.audio" code:v56 userInfo:v57];

      [*(id *)(a1 + 32) setIsListening:v19 == 0];
      if (v19) {
        goto LABEL_13;
      }
    }
    else
    {
      v58 = +[HUUtilities sharedUtilities];
      v59 = [v58 currentPickableAudioRoutes];
      v60 = [v59 valueForKey:@"AXSHARouteHearingAid"];

      if (v60)
      {
        v61 = [MEMORY[0x263F544E0] sharedAVSystemController];
        [v61 setAttribute:v60 forKey:*MEMORY[0x263F543F8] error:0];
      }
      [*(id *)(a1 + 32) setIsListening:1];
    }
    v62 = +[HUUtilities sharedUtilities];
    [v62 addHearingFeatureUsage:8];

    v19 = 0;
    uint64_t v20 = 1;
    goto LABEL_14;
  }
  v41 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initStandardFormatWithSampleRate:v34 channels:v31];
  uint64_t v42 = [v41 streamDescription];
  uint64_t v43 = *(void *)(v42 + 32);
  long long v44 = *(_OWORD *)(v42 + 16);
  *(_OWORD *)&buf.mSampleRate = *(_OWORD *)v42;
  *(_OWORD *)&buf.mBytesPerPacket = v44;
  *(void *)&buf.mBitsPerChannel = v43;
  if ([*(id *)(a1 + 32) exportsLiveListenToFile])
  {
    v45 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithCommonFormat:3 sampleRate:v34 channels:1 interleaved:v31];
    uint64_t v46 = [v45 streamDescription];
    uint64_t v47 = *(void *)(v46 + 32);
    long long v48 = *(_OWORD *)(v46 + 16);
    *(_OWORD *)&inStreamDesc.mSampleRate = *(_OWORD *)v46;
    *(_OWORD *)&inStreamDesc.mBytesPerPacket = v48;
    *(void *)&inStreamDesc.mBitsPerChannel = v47;
    v49 = [MEMORY[0x263F08850] defaultManager];
    [v49 createDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Accessibility/" withIntermediateDirectories:1 attributes:0 error:0];

    v50 = NSURL;
    v51 = [NSString stringWithFormat:@"%@/%@", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Accessibility/", @"LiveListenCapture.wav"];
    ExtAudioFileCreateWithURL((CFURLRef)[v50 fileURLWithPath:v51], 0x57415645u, &inStreamDesc, 0, 1u, (ExtAudioFileRef *)(*(void *)(a1 + 32) + 24));

    ExtAudioFileSetProperty(*(ExtAudioFileRef *)(*(void *)(a1 + 32) + 24), 0x63666D74u, 0x28u, &buf);
  }
  v52 = *(void **)(a1 + 32);
  AudioStreamBasicDescription inStreamDesc = buf;
  uint64_t v53 = [v52 _setupAudioUnitsWithAudioFormat:&inStreamDesc];
  if (!v53)
  {
    [*(id *)(a1 + 32) setDidInitializeAudioUnit:1];

    goto LABEL_33;
  }
  v19 = (void *)v53;

LABEL_12:
  [*(id *)(a1 + 32) setIsListening:0];
LABEL_13:
  [*(id *)(a1 + 32) stopListeningWithCompletion:0];
  uint64_t v20 = 0;
LABEL_14:
  HAInitializeLogging();
  v21 = [NSString stringWithFormat:@"Is Listening (%d) with error %@", objc_msgSend(*(id *)(a1 + 32), "isListening"), v19];
  v22 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController startListeningWithCompletion:]_block_invoke", 346, v21];
  v23 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v24 = v22;
    id v25 = v23;
    uint64_t v26 = [v24 UTF8String];
    LODWORD(buf.mSampleRate) = 136446210;
    *(void *)((char *)&buf.mSampleRate + 4) = v26;
    _os_log_impl(&dword_20CC86000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }
  objc_super v27 = [*(id *)(a1 + 32) delegate];
  [v27 liveListenControllerStateDidChange];

  uint64_t v28 = *(void *)(a1 + 40);
  if (v28) {
    (*(void (**)(uint64_t, uint64_t, void *))(v28 + 16))(v28, v20, v19);
  }
}

- (void)stopListeningWithCompletion:(id)a3
{
  id v4 = a3;
  self->_waitingForAccessoryUpdate = 0;
  int32x2_t v5 = *(int32x2_t *)&self->_noise;
  *(void *)&self->_float noise = 3267887104;
  BOOL v6 = [(HULiveListenController *)self isListening];
  [(HULiveListenController *)self setIsListening:0];
  audioUnitsQueue = self->_audioUnitsQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__HULiveListenController_stopListeningWithCompletion___block_invoke;
  v9[3] = &unk_2640FEF60;
  BOOL v12 = v6;
  v9[4] = self;
  id v10 = v4;
  int32x2_t v11 = vrev64_s32(v5);
  id v8 = v4;
  dispatch_async(audioUnitsQueue, v9);
}

void __54__HULiveListenController_stopListeningWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  unsigned int v2 = (os_log_t *)MEMORY[0x263F47290];
  if (*(unsigned char *)(a1 + 56)) {
    goto LABEL_2;
  }
  if ([*(id *)(a1 + 32) didInitializeAudioUnit])
  {
    if (!*(unsigned char *)(a1 + 56))
    {
      id v4 = 0;
LABEL_7:
      v17 = *(ExtAudioFileRef **)(a1 + 32);
      if (v17[3])
      {
        ExtAudioFileDispose(v17[3]);
        *(void *)(*(void *)(a1 + 32) + 24) = 0;
        v18 = [MEMORY[0x263F08850] defaultManager];
        v19 = [NSString stringWithFormat:@"%@/%@", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Accessibility/", @"LiveListenCapture.wav"];
        uint64_t v20 = NSString;
        double v21 = vabds_f32(*(float *)(a1 + 48), *(float *)(a1 + 52));
        v22 = [MEMORY[0x263EFF910] date];
        v23 = [v20 stringWithFormat:@"LiveListenComplete(%1.2lf_dB)_%@.wav", *(void *)&v21, v22];
        id v24 = [v20 stringWithFormat:@"%@/%@", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Accessibility/", v23];
        id v44 = v4;
        [v18 moveItemAtPath:v19 toPath:v24 error:&v44];
        id v25 = v44;

        unsigned int v2 = (os_log_t *)MEMORY[0x263F47290];
        v17 = *(ExtAudioFileRef **)(a1 + 32);
        id v4 = v25;
      }
      if (v17[5])
      {
        AudioComponentInstanceDispose(v17[5]);
        *(void *)(*(void *)(a1 + 32) + 40) = 0;
        v17 = *(ExtAudioFileRef **)(a1 + 32);
      }
      if ([(ExtAudioFileRef *)v17 rioUnit])
      {
        AudioComponentInstanceDispose(*(AudioComponentInstance *)(*(void *)(a1 + 32) + 48));
        *(void *)(*(void *)(a1 + 32) + 48) = 0;
      }
      [*(id *)(a1 + 32) setIsListening:0];
      [*(id *)(a1 + 32) setDidInitializeAudioUnit:0];
      uint64_t v26 = [*(id *)(a1 + 32) delegate];
      [v26 liveListenControllerStateDidChange];

      HAInitializeLogging();
      objc_super v27 = [NSString stringWithFormat:@"Is Listening (%d) %@ - %lf, %lf", objc_msgSend(*(id *)(a1 + 32), "isListening"), v4, *(float *)(a1 + 48), *(float *)(a1 + 52)];
      uint64_t v28 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController stopListeningWithCompletion:]_block_invoke", 422, v27];
      os_log_t v29 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = v28;
        double v31 = v29;
        uint64_t v32 = [v30 UTF8String];
        *(_DWORD *)AudioStreamBasicDescription buf = 136446210;
        uint64_t v47 = v32;
        _os_log_impl(&dword_20CC86000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      HAInitializeLogging();
      unsigned int v33 = NSString;
      uint64_t v34 = [*(id *)(a1 + 32) session];
      v35 = [v33 stringWithFormat:@"LiveListen will release auxiliarySession: %@", v34];

      v36 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController stopListeningWithCompletion:]_block_invoke", 424, v35];
      os_log_t v37 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        id v38 = v36;
        v39 = v37;
        uint64_t v40 = [v38 UTF8String];
        *(_DWORD *)AudioStreamBasicDescription buf = 136446210;
        uint64_t v47 = v40;
        _os_log_impl(&dword_20CC86000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      [*(id *)(a1 + 32) setSession:0];
      uint64_t v41 = *(void *)(a1 + 40);
      if (v41) {
        (*(void (**)(uint64_t, uint64_t, id))(v41 + 16))(v41, 1, v4);
      }

      return;
    }
LABEL_2:
    unsigned __int8 v3 = [*(id *)(a1 + 32) session];
    id v45 = 0;
    [v3 setActive:0 forFeature:8 error:&v45];
    id v4 = v45;

    int32x2_t v5 = *(OpaqueAudioComponentInstance **)(*(void *)(a1 + 32) + 48);
    if (v5)
    {
      OSStatus v6 = AudioOutputUnitStop(v5);
      if (v6)
      {
        id v7 = (void *)MEMORY[0x263F087E8];
        uint64_t v8 = v6;
        uint64_t v9 = [NSDictionary dictionaryWithObject:@"Couldn't stop remote I/O unit" forKey:*MEMORY[0x263F08320]];
        uint64_t v10 = [v7 errorWithDomain:@"com.apple.axlivelisten.audio" code:v8 userInfo:v9];

        HAInitializeLogging();
        int32x2_t v11 = [NSString stringWithFormat:@"Stop LiveListen unit error: %@", v10];
        BOOL v12 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController stopListeningWithCompletion:]_block_invoke", 391, v11];
        os_log_t v13 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = v12;
          id v15 = v13;
          uint64_t v16 = [v14 UTF8String];
          *(_DWORD *)AudioStreamBasicDescription buf = 136446210;
          uint64_t v47 = v16;
          _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        id v4 = (id)v10;
      }
    }
    goto LABEL_7;
  }
  uint64_t v42 = *(void *)(a1 + 40);
  if (v42)
  {
    objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"Hearing", @"Won't stop live listen controller, not listening");
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v42 + 16))(v42, 0);
  }
}

- (id)_setupSession
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  session = self->_session;
  if (!session)
  {
    id v4 = [MEMORY[0x263EF93E0] auxiliarySession];
    int32x2_t v5 = self->_session;
    self->_session = v4;

    HAInitializeLogging();
    OSStatus v6 = [NSString stringWithFormat:@"LiveListen created auxiliarySession: %@", self->_session];
    id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[HULiveListenController _setupSession]", 443, v6];
    uint64_t v8 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v7;
      uint64_t v10 = v8;
      *(_DWORD *)AudioStreamBasicDescription buf = 136446210;
      uint64_t v30 = [v9 UTF8String];
      _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    session = self->_session;
  }
  id v28 = 0;
  [(AVAudioSession *)session setAudioHardwareControlFlags:18 error:&v28];
  id v11 = v28;
  if (!v11)
  {
    BOOL v12 = self->_session;
    uint64_t v13 = *MEMORY[0x263EF9050];
    id v27 = 0;
    [(AVAudioSession *)v12 setCategory:v13 withOptions:5 error:&v27];
    id v11 = v27;
    if (!v11)
    {
      id v14 = self->_session;
      uint64_t v15 = *MEMORY[0x263EF9118];
      id v26 = 0;
      [(AVAudioSession *)v14 setMode:v15 error:&v26];
      id v11 = v26;
      if (!v11)
      {
        uint64_t v16 = self->_session;
        id v25 = 0;
        [(AVAudioSession *)v16 setPreferredIOBufferFrameSize:128 error:&v25];
        id v11 = v25;
        if (!v11)
        {
          v17 = self->_session;
          id v24 = 0;
          [(AVAudioSession *)v17 setPrefersNoDucking:0 error:&v24];
          id v11 = v24;
          if (!v11)
          {
            v18 = self->_session;
            uint64_t v19 = *MEMORY[0x263F54670];
            id v23 = 0;
            [(AVAudioSession *)v18 setMXSessionProperty:v19 value:MEMORY[0x263EFFA88] error:&v23];
            id v11 = v23;
            if (!v11)
            {
              uint64_t v20 = self->_session;
              id v22 = 0;
              [(AVAudioSession *)v20 setActive:1 forFeature:8 error:&v22];
              id v11 = v22;
            }
          }
        }
      }
    }
  }

  return v11;
}

- (id)_setupAudioUnitsWithAudioFormat:(AudioStreamBasicDescription *)a3
{
  long long v5 = *(_OWORD *)&a3->mBytesPerPacket;
  long long v10 = *(_OWORD *)&a3->mSampleRate;
  long long v11 = v5;
  uint64_t v12 = *(void *)&a3->mBitsPerChannel;
  OSStatus v6 = [(HULiveListenController *)self _setupMixerUnitWithAudioFormat:&v10];
  if (!v6)
  {
    long long v7 = *(_OWORD *)&a3->mBytesPerPacket;
    long long v10 = *(_OWORD *)&a3->mSampleRate;
    long long v11 = v7;
    uint64_t v12 = *(void *)&a3->mBitsPerChannel;
    OSStatus v6 = [(HULiveListenController *)self _setupRioUnitWithAudioFormat:&v10];
    if (!v6)
    {
      OSStatus v6 = [(HULiveListenController *)self _connectUnits];
    }
  }
  id v8 = v6;

  return v8;
}

- (id)_setupMixerUnitWithAudioFormat:(AudioStreamBasicDescription *)a3
{
  int v25 = 1;
  inData[0] = RenderAudio;
  inData[1] = self;
  *(_OWORD *)&v23.componentType = xmmword_20CD0F6D0;
  v23.componentFlagsMask = 0;
  Next = AudioComponentFindNext(0, &v23);
  p_mixerUnit = &self->_mixerUnit;
  OSStatus v7 = AudioComponentInstanceNew(Next, p_mixerUnit);
  if (v7)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v7;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't open the mixer unit";
LABEL_17:
    uint64_t v20 = [v10 dictionaryWithObject:v12 forKey:v11];
    double v21 = [v8 errorWithDomain:@"com.apple.axlivelisten.audio" code:v9 userInfo:v20];

    goto LABEL_18;
  }
  OSStatus v13 = AudioUnitSetProperty(*p_mixerUnit, 0x17u, 1u, 0, inData, 0x10u);
  if (v13)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v13;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't set mixer render callback";
    goto LABEL_17;
  }
  OSStatus v14 = AudioUnitSetProperty(*p_mixerUnit, 8u, 1u, 0, a3, 0x28u);
  if (v14)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v14;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't set the mixer unit's input bus format";
    goto LABEL_17;
  }
  OSStatus v15 = AudioUnitSetProperty(*p_mixerUnit, 8u, 2u, 0, a3, 0x28u);
  if (v15)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v15;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't set the mixer unit's output bus format";
    goto LABEL_17;
  }
  OSStatus v16 = AudioUnitSetProperty(*p_mixerUnit, 0xBBFu, 1u, 0, &v25, 4u);
  if (v16)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v16;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't enable metering mode";
    goto LABEL_17;
  }
  OSStatus v17 = AudioUnitInitialize(*p_mixerUnit);
  if (v17)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v17;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't initialize the mixer unit";
    goto LABEL_17;
  }
  OSStatus v18 = AudioUnitSetParameter(*p_mixerUnit, 0, 2u, 0, 1.0, 0);
  if (v18)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v18;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't set mixer output volume";
    goto LABEL_17;
  }
  OSStatus v19 = AudioUnitSetParameter(*p_mixerUnit, 0, 1u, 0, 1.0, 0);
  if (v19)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v19;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't set mixer input volume";
    goto LABEL_17;
  }
  double v21 = 0;
LABEL_18:

  return v21;
}

- (id)_setupRioUnitWithAudioFormat:(AudioStreamBasicDescription *)a3
{
  int v25 = 1;
  *(_OWORD *)&inDesc.componentType = xmmword_20CD0F6E0;
  inDesc.componentFlagsMask = 0;
  Next = AudioComponentFindNext(0, &inDesc);
  p_rioUnit = &self->_rioUnit;
  OSStatus v7 = AudioComponentInstanceNew(Next, &self->_rioUnit);
  if (v7)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v7;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't open the remote I/O unit";
LABEL_15:
    uint64_t v20 = [v10 dictionaryWithObject:v12 forKey:v11];
    double v21 = [v8 errorWithDomain:@"com.apple.axlivelisten.audio" code:v9 userInfo:v20];

    goto LABEL_16;
  }
  session = self->_session;
  if (session)
  {
    OSStatus v14 = [MEMORY[0x263EF93E0] sharedInstance];

    if (session != v14)
    {
      int inData = [(AVAudioSession *)self->_session opaqueSessionID];
      OSStatus v15 = AudioUnitSetProperty(self->_rioUnit, 0x7E7u, 0, 0, &inData, 4u);
      if (v15)
      {
        id v8 = (void *)MEMORY[0x263F087E8];
        uint64_t v9 = v15;
        long long v10 = NSDictionary;
        uint64_t v11 = *MEMORY[0x263F08320];
        uint64_t v12 = @"Couldn't set rio unit's sessionID";
        goto LABEL_15;
      }
    }
  }
  OSStatus v16 = AudioUnitSetProperty(*p_rioUnit, 0x7D3u, 2u, 0, &v25, 4u);
  if (v16)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v16;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't enable output on the remote I/O unit";
    goto LABEL_15;
  }
  OSStatus v17 = AudioUnitSetProperty(*p_rioUnit, 0x7D3u, 1u, 1u, &v25, 4u);
  if (v17)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v17;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't enable input on the remote I/O unit";
    goto LABEL_15;
  }
  OSStatus v18 = AudioUnitSetProperty(*p_rioUnit, 8u, 1u, 0, a3, 0x28u);
  if (v18)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v18;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't set the remote I/O unit's output client format";
    goto LABEL_15;
  }
  OSStatus v19 = AudioUnitSetProperty(*p_rioUnit, 8u, 2u, 1u, a3, 0x28u);
  if (v19)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = v19;
    long long v10 = NSDictionary;
    uint64_t v11 = *MEMORY[0x263F08320];
    uint64_t v12 = @"Couldn't set the remote I/O unit's input client format";
    goto LABEL_15;
  }
  double v21 = 0;
LABEL_16:

  return v21;
}

- (id)_connectUnits
{
  unsigned __int8 v3 = malloc_type_malloc(0x10uLL, 0x44D5A3EFuLL);
  void *v3 = self->_mixerUnit;
  v3[1] = 0;
  OSStatus v4 = AudioUnitSetProperty(self->_rioUnit, 1u, 1u, 0, v3, 0x10u);
  free(v3);
  if (v4)
  {
    long long v5 = (void *)MEMORY[0x263F087E8];
    OSStatus v6 = [NSDictionary dictionaryWithObject:@"Couldn't connect mixer to rio" forKey:*MEMORY[0x263F08320]];
    OSStatus v7 = v5;
    uint64_t v8 = v4;
LABEL_5:
    uint64_t v12 = [v7 errorWithDomain:@"com.apple.axlivelisten.audio" code:v8 userInfo:v6];

    goto LABEL_6;
  }
  OSStatus v9 = AudioUnitInitialize(self->_rioUnit);
  if (v9)
  {
    long long v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = v9;
    OSStatus v6 = [NSDictionary dictionaryWithObject:@"Couldn't initialize the remote I/O unit" forKey:*MEMORY[0x263F08320]];
    OSStatus v7 = v10;
    uint64_t v8 = v11;
    goto LABEL_5;
  }
  uint64_t v12 = 0;
LABEL_6:

  return v12;
}

- (BOOL)isListening
{
  return self->isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->isListening = a3;
}

- (OpaqueAudioComponentInstance)rioUnit
{
  return self->_rioUnit;
}

- (OpaqueAudioComponentInstance)mixerUnit
{
  return self->_mixerUnit;
}

- (AXHALiveListenDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXHALiveListenDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)didInitializeAudioUnit
{
  return self->_didInitializeAudioUnit;
}

- (void)setDidInitializeAudioUnit:(BOOL)a3
{
  self->_didInitializeAudioUnit = a3;
}

- (BOOL)exportsLiveListenToFile
{
  return self->_exportsLiveListenToFile;
}

- (void)setExportsLiveListenToFile:(BOOL)a3
{
  self->_exportsLiveListenToFile = a3;
}

- (BOOL)waitingForAccessoryUpdate
{
  return self->_waitingForAccessoryUpdate;
}

- (void)setWaitingForAccessoryUpdate:(BOOL)a3
{
  self->_waitingForAccessoryUpdate = a3;
}

- (AXDispatchTimer)accessoryUpdateTimer
{
  return self->_accessoryUpdateTimer;
}

- (void)setAccessoryUpdateTimer:(id)a3
{
}

- (AVAudioSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_accessoryUpdateTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_audioUnitsQueue, 0);
}

@end