@interface AXTapticChimesScheduler
+ (id)sharedInstance;
+ (void)initializeIfNeeded;
- (BOOL)_outputTapticChime:(id)a3 atDate:(id)a4;
- (BOOL)canPlayScheduledTapticChime;
- (BOOL)canPlayTapticChime;
- (BOOL)canScheduleTapticChimes;
- (BOOL)processIsAllowedToScheduleChimes;
- (double)_prePlayAudioTimeInterval;
- (double)_preWakeTimeInterval;
- (float)lastMediaVolume;
- (id)_currentDate;
- (id)_init;
- (id)nextChimeAssetForStartDate:(id)a3 frequency:(int64_t)a4 soundType:(int64_t)a5 timeIntervalUntilChime:(double *)a6;
- (unsigned)_createPowerAssertionWithName:(id)a3 timeout:(double)a4;
- (void)_chimeDidFinishPlaying;
- (void)_chimeWakeTimerFired:(id)a3;
- (void)_clearChimeTimer;
- (void)_init;
- (void)_previewChimes;
- (void)_previewChimesForStartDate:(id)a3 chimeDate:(id)a4 frequency:(int64_t)a5 soundType:(int64_t)a6;
- (void)_registerForNotifications;
- (void)_releasePowerAssertionIfPossible:(unsigned int)a3;
- (void)_scheduleChimeTimer;
- (void)_tapticChimesStateDidChange:(BOOL)a3;
- (void)_unregisterForNotifications;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)dealloc;
- (void)setLastMediaVolume:(float)a3;
@end

@implementation AXTapticChimesScheduler

+ (void)initializeIfNeeded
{
  id v2 = +[AXTapticChimesScheduler sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  }
  id v2 = (void *)sharedInstance__Shared;
  return v2;
}

uint64_t __41__AXTapticChimesScheduler_sharedInstance__block_invoke()
{
  sharedInstance__Shared = [[AXTapticChimesScheduler alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v24.receiver = self;
  v24.super_class = (Class)AXTapticChimesScheduler;
  id v2 = [(AXTapticChimesScheduler *)&v24 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.accessibility.AXTapticChimesScheduler", v3);
    mediaQueue = v2->_mediaQueue;
    v2->_mediaQueue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v2);
    if ([(AXTapticChimesScheduler *)v2 processIsAllowedToScheduleChimes])
    {
      v6 = NSString;
      v7 = AXProcessGetName();
      uint64_t v8 = [v6 stringWithFormat:@"com.apple.accessibility.TapticChimesScheduler-%@", v7];
      pcServiceIdentifier = v2->_pcServiceIdentifier;
      v2->_pcServiceIdentifier = (NSString *)v8;

      v10 = AXLogTapticTime();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2352E7000, v10, OS_LOG_TYPE_DEFAULT, "Process handles chimes, registering for updates", buf, 2u);
      }

      v11 = +[AXTimeOutputPreferences sharedInstance];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __32__AXTapticChimesScheduler__init__block_invoke;
      v20[3] = &unk_264C4E4C8;
      objc_copyWeak(&v21, &location);
      [v11 registerUpdateBlock:v20 forRetrieveSelector:sel_voiceOverTapticChimesEnabled withListener:v2];

      v12 = +[AXTimeOutputPreferences sharedInstance];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __32__AXTapticChimesScheduler__init__block_invoke_2;
      v18[3] = &unk_264C4E4C8;
      objc_copyWeak(&v19, &location);
      [v12 registerUpdateBlock:v18 forRetrieveSelector:sel_voiceOverTapticChimesFrequencyEncoding withListener:v2];

      v13 = +[AXTimeOutputPreferences sharedInstance];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __32__AXTapticChimesScheduler__init__block_invoke_286;
      v16[3] = &unk_264C4E4C8;
      objc_copyWeak(&v17, &location);
      [v13 registerUpdateBlock:v16 forRetrieveSelector:sel_voiceOverTapticChimesSoundType withListener:v2];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
    }
    else
    {
      v14 = AXLogTapticTime();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AXTapticChimesScheduler _init]();
      }
    }
    [(AXTapticChimesScheduler *)v2 _tapticChimesStateDidChange:0];
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__AXTapticChimesScheduler__init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tapticChimesStateDidChange:1];
}

void __32__AXTapticChimesScheduler__init__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F22938] sharedInstance];
  int v3 = [v2 voiceOverTapticChimesEnabled];

  if (v3)
  {
    dispatch_queue_t v4 = AXLogTapticTime();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2352E7000, v4, OS_LOG_TYPE_DEFAULT, "Taptic Chimes frequency changed, will re-schedule chimes", v6, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _scheduleChimeTimer];
  }
}

void __32__AXTapticChimesScheduler__init__block_invoke_286(uint64_t a1)
{
  id v7 = [MEMORY[0x263F22938] sharedInstance];
  if ([v7 voiceOverTapticChimesEnabled])
  {
    id v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v2);
    int v4 = [WeakRetained canPlayScheduledTapticChime];

    if (v4)
    {
      v5 = AXLogTapticTime();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2352E7000, v5, OS_LOG_TYPE_DEFAULT, "Taptic Chimes sound type changed, will preview chimes", buf, 2u);
      }

      id v6 = objc_loadWeakRetained(v2);
      [v6 _previewChimes];
    }
  }
  else
  {
  }
}

- (void)_registerForNotifications
{
  objc_initWeak(&location, self);
  if (AXProcessIsClockFace())
  {
    int v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *MEMORY[0x263F8B3F0];
    v5 = [MEMORY[0x263F08A48] mainQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __52__AXTapticChimesScheduler__registerForNotifications__block_invoke;
    v8[3] = &unk_264C4E4F0;
    objc_copyWeak(&v9, &location);
    id v6 = (id)[v3 addObserverForName:v4 object:0 queue:v5 usingBlock:v8];

    objc_destroyWeak(&v9);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_ntkDefaultsChanged, @"NanoTimeKitFaceDefaultsChangedDarwinNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_destroyWeak(&location);
}

void __52__AXTapticChimesScheduler__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = AXLogTapticTime();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl(&dword_2352E7000, v2, OS_LOG_TYPE_INFO, "VoiceOver status changed!", v3, 2u);
  }

  [WeakRetained _scheduleChimeTimer];
}

- (void)_unregisterForNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"NanoTimeKitFaceDefaultsChangedDarwinNotification", 0);
}

- (void)dealloc
{
  [(AXTapticChimesScheduler *)self _unregisterForNotifications];
  [(AXTapticChimesScheduler *)self _clearChimeTimer];
  v3.receiver = self;
  v3.super_class = (Class)AXTapticChimesScheduler;
  [(AXTapticChimesScheduler *)&v3 dealloc];
}

- (void)_tapticChimesStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x263F22938] sharedInstance];
  int v6 = [v5 voiceOverTapticChimesEnabled];

  id v7 = AXLogTapticTime();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2352E7000, v7, OS_LOG_TYPE_DEFAULT, "Taptic Chimes enabled, will begin scheduling chimes", buf, 2u);
    }

    [(AXTapticChimesScheduler *)self _registerForNotifications];
    if (v3)
    {
      if ([(AXTapticChimesScheduler *)self canPlayScheduledTapticChime]) {
        [(AXTapticChimesScheduler *)self _previewChimes];
      }
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_2352E7000, v7, OS_LOG_TYPE_DEFAULT, "Taptic Chimes disabled, will stop scheduling chimes", v9, 2u);
    }

    [(AXTapticChimesScheduler *)self _unregisterForNotifications];
    [(AXTapticChimesScheduler *)self _clearChimeTimer];
  }
}

- (BOOL)canPlayTapticChime
{
  char v2 = AXIsBuddyCompleted();
  if ((v2 & 1) == 0)
  {
    BOOL v3 = AXLogTapticTime();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2352E7000, v3, OS_LOG_TYPE_INFO, "Buddy not yet complete! suppresing chime", v5, 2u);
    }
  }
  return v2;
}

- (BOOL)processIsAllowedToScheduleChimes
{
  if ((AXProcessIsClockFace() & 1) == 0)
  {
    JUMPOUT(0x237DD9130);
  }
  return 1;
}

- (BOOL)canScheduleTapticChimes
{
  if (AXProcessIsClockFace() && _AXSVoiceOverTouchEnabled())
  {
    BOOL v3 = AXLogTapticTime();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_2352E7000, v3, OS_LOG_TYPE_INFO, "ClockFace not scheduling chimes because VoiceOver is enabled", v7, 2u);
    }

    return 0;
  }
  if (![(AXTapticChimesScheduler *)self processIsAllowedToScheduleChimes]) {
    return 0;
  }
  uint64_t v4 = [MEMORY[0x263F22938] sharedInstance];
  if ([v4 voiceOverTapticChimesEnabled]) {
    BOOL v5 = [(AXTapticChimesScheduler *)self canPlayTapticChime];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canPlayScheduledTapticChime
{
  if ([(AXTapticChimesScheduler *)self canScheduleTapticChimes])
  {
    if ([(AXTapticChimesScheduler *)self canPlayTapticChime]) {
      return 1;
    }
    uint64_t v4 = AXLogTapticTime();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      BOOL v5 = "cannot play scheduled chime";
      int v6 = (uint8_t *)&v7;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v4 = AXLogTapticTime();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      BOOL v5 = "cannot schedule chime";
      int v6 = (uint8_t *)&v8;
LABEL_8:
      _os_log_impl(&dword_2352E7000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }

  return 0;
}

- (double)_preWakeTimeInterval
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v2 = 3.0;
  if (AXIsInternalInstall())
  {
    CFNumberRef v3 = (const __CFNumber *)CFPreferencesCopyAppValue(@"TapticChimesPreWakeOverride", (CFStringRef)*MEMORY[0x263F8B0F8]);
    if (v3)
    {
      CFNumberRef v4 = v3;
      float valuePtr = 0.0;
      int Value = CFNumberGetValue(v3, kCFNumberFloatType, &valuePtr);
      CFRelease(v4);
      if (Value)
      {
        int v6 = AXLogTapticTime();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          double v10 = valuePtr;
          _os_log_impl(&dword_2352E7000, v6, OS_LOG_TYPE_INFO, "Using PreWakeOverride value: %f", buf, 0xCu);
        }

        return valuePtr;
      }
    }
  }
  return v2;
}

- (double)_prePlayAudioTimeInterval
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v2 = 0.0;
  if (AXIsInternalInstall())
  {
    CFNumberRef v3 = (const __CFNumber *)CFPreferencesCopyAppValue(@"TapticChimesPrePlayAudioOverride", (CFStringRef)*MEMORY[0x263F8B0F8]);
    if (v3)
    {
      CFNumberRef v4 = v3;
      float valuePtr = 0.0;
      int Value = CFNumberGetValue(v3, kCFNumberFloatType, &valuePtr);
      CFRelease(v4);
      if (Value)
      {
        int v6 = AXLogTapticTime();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          double v10 = valuePtr;
          _os_log_impl(&dword_2352E7000, v6, OS_LOG_TYPE_INFO, "Using PrePlayAudioOverride value: %f", buf, 0xCu);
        }

        return valuePtr;
      }
    }
  }
  return v2;
}

- (id)_currentDate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFPreferencesAppSynchronize(@"com.apple.NanoTimeKit.face");
  double v2 = (void *)CFPreferencesCopyAppValue(@"NTKFacePreferencesTimeOffsetKey", @"com.apple.NanoTimeKit.face");
  [v2 floatValue];
  float v4 = v3;

  float v5 = 0.0;
  if (v4 > 0.0) {
    float v5 = v4;
  }
  double v6 = v5;
  __int16 v7 = [MEMORY[0x263EFF910] date];
  __int16 v8 = [v7 dateByAddingTimeInterval:v6];

  id v9 = AXLogTapticTime();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2048;
    double v14 = v6;
    _os_log_impl(&dword_2352E7000, v9, OS_LOG_TYPE_INFO, "Using face display time for current date: %@, with time offset=%f", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (void)_previewChimes
{
  id v9 = [(AXTapticChimesScheduler *)self _currentDate];
  float v3 = (void *)MEMORY[0x263EFF910];
  float v4 = [MEMORY[0x263EFF910] date];
  float v5 = [v3 dateWithTimeInterval:v4 sinceDate:0.5];
  double v6 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v7 = [v6 voiceOverTapticChimesFrequencyEncoding];
  __int16 v8 = [MEMORY[0x263F22938] sharedInstance];
  -[AXTapticChimesScheduler _previewChimesForStartDate:chimeDate:frequency:soundType:](self, "_previewChimesForStartDate:chimeDate:frequency:soundType:", v9, v5, v7, [v8 voiceOverTapticChimesSoundType]);
}

- (void)_previewChimesForStartDate:(id)a3 chimeDate:(id)a4 frequency:(int64_t)a5 soundType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([(AXTapticChimesScheduler *)self canPlayTapticChime])
  {
    [(AXTapticChimesScheduler *)self _clearChimeTimer];
    v12 = AXLogTapticTime();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2352E7000, v12, OS_LOG_TYPE_INFO, "Previewing chimes", buf, 2u);
    }

    uint64_t v14 = 0;
    __int16 v13 = [(AXTapticChimesScheduler *)self nextChimeAssetForStartDate:v10 frequency:a5 soundType:a6 timeIntervalUntilChime:&v14];
    if (![(AXTapticChimesScheduler *)self _outputTapticChime:v13 atDate:v11]) {
      [(AXTapticChimesScheduler *)self _scheduleChimeTimer];
    }
  }
}

- (void)_clearChimeTimer
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_2352E7000, a2, OS_LOG_TYPE_FAULT, "failed to deactivate audio session due to: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_scheduleChimeTimer
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  [(AXTapticChimesScheduler *)self _clearChimeTimer];
  if ([(AXTapticChimesScheduler *)self canScheduleTapticChimes])
  {
    uint64_t v3 = AXLogTapticTime();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2352E7000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling chime timer", buf, 2u);
    }

    uint64_t v4 = [(AXTapticChimesScheduler *)self _currentDate];
    double v23 = 0.0;
    float v5 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v6 = [v5 voiceOverTapticChimesFrequencyEncoding];
    uint64_t v7 = [MEMORY[0x263F22938] sharedInstance];
    -[AXTapticChimesScheduler nextChimeAssetForStartDate:frequency:soundType:timeIntervalUntilChime:](self, "nextChimeAssetForStartDate:frequency:soundType:timeIntervalUntilChime:", v4, v6, [v7 voiceOverTapticChimesSoundType], &v23);
    __int16 v8 = (AXTapticChimeAsset *)objc_claimAutoreleasedReturnValue();
    currentChimeAsset = self->_currentChimeAsset;
    self->_currentChimeAsset = v8;

    double v10 = v23;
    [(AXTapticChimesScheduler *)self _preWakeTimeInterval];
    double v12 = v10 - v11;
    __int16 v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v12];
    uint64_t v14 = (void *)MEMORY[0x263EFF910];
    double v15 = v23;
    [(AXTapticChimesScheduler *)self _prePlayAudioTimeInterval];
    id v17 = [v14 dateWithTimeIntervalSinceNow:v15 - v16];
    objc_storeStrong((id *)&self->_lastExpectedWakeTime, v13);
    objc_storeStrong((id *)&self->_lastExpectedChimeTime, v17);
    v18 = AXLogTapticTime();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v25 = v13;
      __int16 v26 = 2048;
      double v27 = v12;
      __int16 v28 = 2112;
      v29 = v17;
      __int16 v30 = 2048;
      double v31 = v23;
      _os_log_impl(&dword_2352E7000, v18, OS_LOG_TYPE_INFO, "Scheduling wake!! Wake time: %@ (%f seconds), Chime time: %@ (%f seconds)", buf, 0x2Au);
    }

    id v19 = (PCSimpleTimer *)[objc_alloc(MEMORY[0x263F5D410]) initWithTimeInterval:self->_pcServiceIdentifier serviceIdentifier:self target:sel__chimeWakeTimerFired_ selector:0 userInfo:v12];
    chimeTimer = self->_chimeTimer;
    self->_chimeTimer = v19;

    [(PCSimpleTimer *)self->_chimeTimer setUserVisible:1];
    id v21 = self->_chimeTimer;
    v22 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [(PCSimpleTimer *)v21 scheduleInRunLoop:v22];
  }
}

- (void)_chimeWakeTimerFired:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = [MEMORY[0x263EFF910] date];
  lastActualWakeTime = self->_lastActualWakeTime;
  self->_lastActualWakeTime = v5;

  uint64_t v7 = AXLogTapticTime();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v17 = *(double *)&v4;
    _os_log_impl(&dword_2352E7000, v7, OS_LOG_TYPE_DEFAULT, "chime wake timer fired: %@", buf, 0xCu);
  }

  [(AXTapticChimesScheduler *)self _preWakeTimeInterval];
  uint64_t v9 = [(AXTapticChimesScheduler *)self _createPowerAssertionWithName:@"chime-wake-fired" timeout:v8 + v8];
  if ([(AXTapticChimesScheduler *)self canPlayScheduledTapticChime]
    && [(AXTapticChimesScheduler *)self _outputTapticChime:self->_currentChimeAsset atDate:self->_lastExpectedChimeTime])
  {
    [(AXTapticChimesScheduler *)self _releasePowerAssertionIfPossible:v9];
  }
  else
  {
    [(AXTapticChimesScheduler *)self _preWakeTimeInterval];
    double v11 = v10;
    double v12 = AXLogTapticTime();
    double v13 = v11 + 0.5;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v17 = v13;
      _os_log_impl(&dword_2352E7000, v12, OS_LOG_TYPE_INFO, "scheduling NEXT chime in %f seconds", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    objc_copyWeak(&v14, (id *)buf);
    int v15 = v9;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __48__AXTapticChimesScheduler__chimeWakeTimerFired___block_invoke(uint64_t a1)
{
  int v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scheduleChimeTimer];

  id v4 = objc_loadWeakRetained(v2);
  [v4 _releasePowerAssertionIfPossible:*(unsigned int *)(a1 + 40)];
}

- (unsigned)_createPowerAssertionWithName:(id)a3 timeout:(double)a4
{
  v19[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v18[0] = @"AssertType";
  v18[1] = @"AssertName";
  IOPMAssertionID AssertionID = 0;
  v18[2] = @"FrameworkBundleID";
  v18[3] = @"TimeoutAction";
  v19[2] = @"com.apple.AXTapToSpeakTime.TapticChimesScheduler";
  v19[3] = @"TimeoutActionRelease";
  void v18[4] = @"TimeoutSeconds";
  v19[0] = @"PreventUserIdleSystemSleep";
  v19[1] = v5;
  uint64_t v6 = [NSNumber numberWithDouble:a4 + 2.0];
  v19[4] = v6;
  CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];

  if (IOPMAssertionCreateWithProperties(v7, &AssertionID)) {
    IOPMAssertionID AssertionID = 0;
  }
  double v8 = AXLogTapticTime();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v13 = v5;
    __int16 v14 = 2048;
    double v15 = a4;
    __int16 v16 = 1024;
    IOPMAssertionID v17 = AssertionID;
    _os_log_impl(&dword_2352E7000, v8, OS_LOG_TYPE_INFO, "created power assertion with name: %@, timeout: %f, ID: %d", buf, 0x1Cu);
  }

  IOPMAssertionID v9 = AssertionID;
  return v9;
}

- (void)_releasePowerAssertionIfPossible:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = AXLogTapticTime();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109120;
      v5[1] = a3;
      _os_log_impl(&dword_2352E7000, v4, OS_LOG_TYPE_INFO, "releasing power assertion with ID: %d", (uint8_t *)v5, 8u);
    }

    IOPMAssertionRelease(a3);
  }
}

- (BOOL)_outputTapticChime:(id)a3 atDate:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = AXLogTapticTime();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2352E7000, v8, OS_LOG_TYPE_DEFAULT, "chime output start", buf, 2u);
  }

  BOOL v9 = [(AXTapticChimesScheduler *)self canPlayTapticChime];
  double v10 = AXLogTapticTime();
  double v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2352E7000, v11, OS_LOG_TYPE_DEFAULT, "cannot play chime output", buf, 2u);
    }
    goto LABEL_47;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v58 = v6;
    __int16 v59 = 2112;
    v60 = @"NO";
    _os_log_impl(&dword_2352E7000, v11, OS_LOG_TYPE_INFO, "chime starting: %@, isRingerMuted=%@", buf, 0x16u);
  }

  double v12 = AXLogTapticTime();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2352E7000, v12, OS_LOG_TYPE_INFO, "ringer NOT muted, setting up audio session", buf, 2u);
  }

  double v11 = [MEMORY[0x263EF93E0] sharedInstance];
  uint64_t v13 = [v6 volume];
  float v15 = v14;
  if (MEMORY[0x237DD9130](v13))
  {
    __int16 v16 = AXLogTapticTime();
    float v15 = 1.0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2352E7000, v16, OS_LOG_TYPE_INFO, "Using VoiceOver's current audio session", buf, 2u);
    }
  }
  else
  {
    IOPMAssertionID v17 = [v11 category];
    previousAudioSessionCategory = self->_previousAudioSessionCategory;
    self->_previousAudioSessionCategory = v17;

    [(AXTapticChimesScheduler *)self _normalizeVolumeIfNecessary];
    id v19 = (id)*MEMORY[0x263EF9048];
    id v56 = 0;
    char v20 = [v11 setCategory:v19 error:&v56];
    __int16 v16 = v56;
    if ((v20 & 1) == 0)
    {
      v48 = AXLogTapticTime();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
        -[AXTapticChimesScheduler _outputTapticChime:atDate:].cold.4((uint64_t)v19, (uint64_t)v16, v48);
      }

      goto LABEL_46;
    }
  }
  id v55 = 0;
  char v21 = [v11 setActive:1 error:&v55];
  __int16 v16 = v55;
  if ((v21 & 1) == 0)
  {
    id v19 = AXLogTapticTime();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[AXTapticChimesScheduler _outputTapticChime:atDate:]((uint64_t)v16, v19);
    }
    goto LABEL_46;
  }
  id v22 = objc_alloc(MEMORY[0x263EF93B8]);
  double v23 = NSURL;
  objc_super v24 = [v6 audioFilePath];
  v25 = [v23 URLWithString:v24];
  __int16 v26 = (AVAudioPlayer *)[v22 initWithContentsOfURL:v25 error:0];
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = v26;

  [(AVAudioPlayer *)self->_audioPlayer setDelegate:self];
  *(float *)&double v28 = v15;
  [(AVAudioPlayer *)self->_audioPlayer setVolume:v28];
  v29 = AXLogTapticTime();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    [v7 timeIntervalSinceNow];
    *(_DWORD *)buf = 134217984;
    id v58 = v30;
    _os_log_impl(&dword_2352E7000, v29, OS_LOG_TYPE_INFO, "[START] prewarming audio player: (%f seconds away)", buf, 0xCu);
  }

  BOOL v31 = [(AVAudioPlayer *)self->_audioPlayer prepareToPlay];
  uint64_t v32 = AXLogTapticTime();
  id v19 = v32;
  if (!v31)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      -[AXTapticChimesScheduler _outputTapticChime:atDate:]();
    }
    goto LABEL_46;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    [v7 timeIntervalSinceNow];
    *(_DWORD *)buf = 134217984;
    id v58 = v33;
    _os_log_impl(&dword_2352E7000, v19, OS_LOG_TYPE_INFO, "[END] prewarming audio player: (%f seconds away)", buf, 0xCu);
  }

  [v7 timeIntervalSinceNow];
  if (v34 >= 0.0) {
    double v35 = v34;
  }
  else {
    double v35 = 0.0;
  }
  v36 = AXLogTapticTime();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v58 = v7;
    __int16 v59 = 2048;
    v60 = *(__CFString **)&v35;
    _os_log_impl(&dword_2352E7000, v36, OS_LOG_TYPE_INFO, "[START] schedule chime time: %@ (%f seconds away)", buf, 0x16u);
  }

  v37 = self->_audioPlayer;
  [(AVAudioPlayer *)v37 deviceCurrentTime];
  BOOL v39 = [(AVAudioPlayer *)v37 playAtTime:v35 + v38];
  v40 = AXLogTapticTime();
  id v19 = v40;
  if (!v39)
  {
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
      -[AXTapticChimesScheduler _outputTapticChime:atDate:]();
    }
LABEL_46:

LABEL_47:
    BOOL v47 = 0;
    goto LABEL_48;
  }
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    [v7 timeIntervalSinceNow];
    *(_DWORD *)buf = 134217984;
    id v58 = v41;
    _os_log_impl(&dword_2352E7000, v19, OS_LOG_TYPE_INFO, "[END] schedule chime time: (%f seconds away)", buf, 0xCu);
  }

  [v7 timeIntervalSinceNow];
  if (v42 >= 0.0) {
    double v43 = v42;
  }
  else {
    double v43 = 0.0;
  }
  v44 = AXLogTapticTime();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v58 = v7;
    __int16 v59 = 2048;
    v60 = *(__CFString **)&v43;
    _os_log_impl(&dword_2352E7000, v44, OS_LOG_TYPE_INFO, "expected haptic time: %@ (%f seconds away)", buf, 0x16u);
  }

  *(_DWORD *)buf = [v6 createSystemSoundIDForStartTime:v43];
  int inPropertyData = 1;
  AudioServicesSetProperty(0x61637421u, 4u, buf, 4u, &inPropertyData);
  inCompletionBlock[0] = MEMORY[0x263EF8330];
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = __53__AXTapticChimesScheduler__outputTapticChime_atDate___block_invoke;
  inCompletionBlock[3] = &unk_264C4E568;
  int v52 = *(_DWORD *)buf;
  char v53 = 0;
  inCompletionBlock[4] = self;
  AudioServicesPlaySystemSoundWithCompletion(*(SystemSoundID *)buf, inCompletionBlock);
  v45 = AXLogTapticTime();
  if (os_signpost_enabled(v45))
  {
    __int16 v50 = 0;
    _os_signpost_emit_with_name_impl(&dword_2352E7000, v45, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TapticChime-Output", (const char *)&unk_2352F154E, (uint8_t *)&v50, 2u);
  }

  kdebug_trace();
  objc_storeStrong((id *)&self->_lastActualChimeTime, a4);
  [(AXTapticChimesScheduler *)self _preWakeTimeInterval];
  self->_audioPlaybackPowerIOPMAssertionID AssertionID = [(AXTapticChimesScheduler *)self _createPowerAssertionWithName:@"chime-playback" timeout:v46 + v46];
  BOOL v47 = 1;
LABEL_48:

  return v47;
}

void __53__AXTapticChimesScheduler__outputTapticChime_atDate___block_invoke(uint64_t a1)
{
  int inPropertyData = 0;
  AudioServicesSetProperty(0x61637421u, 4u, (const void *)(a1 + 40), 4u, &inPropertyData);
  AudioServicesDisposeSystemSoundID(*(_DWORD *)(a1 + 40));
  int v2 = AXLogTapticTime();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2352E7000, v2, OS_LOG_TYPE_DEFAULT, "chimes haptics completed", buf, 2u);
  }

  if (*(unsigned char *)(a1 + 44)) {
    AXPerformBlockOnMainThread();
  }
}

uint64_t __53__AXTapticChimesScheduler__outputTapticChime_atDate___block_invoke_352(uint64_t a1)
{
  int v2 = AXLogTapticTime();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2352E7000, v2, OS_LOG_TYPE_DEFAULT, "ringer IS muted, not waiting for audio player callback", v4, 2u);
  }

  return [*(id *)(a1 + 32) _chimeDidFinishPlaying];
}

- (id)nextChimeAssetForStartDate:(id)a3 frequency:(int64_t)a4 soundType:(int64_t)a5 timeIntervalUntilChime:(double *)a6
{
  BOOL v9 = a4 == 2;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (a4 == 3) {
    double v11 = 900.0;
  }
  else {
    double v11 = dbl_2352F05F0[v9];
  }
  double v12 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v13 = [v12 components:60 fromDate:v10];
  float v14 = [v12 dateFromComponents:v13];
  float v15 = AXLogTapticTime();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138412290;
    BOOL v31 = v14;
    _os_log_impl(&dword_2352E7000, v15, OS_LOG_TYPE_DEFAULT, "starting hour date: %@", (uint8_t *)&v30, 0xCu);
  }

  __int16 v16 = [v14 dateByAddingTimeInterval:v11];
  [v16 timeIntervalSinceDate:v10];
  if (v17 <= 0.0)
  {
    do
    {
      uint64_t v18 = [v16 dateByAddingTimeInterval:v11];

      [v18 timeIntervalSinceDate:v10];
      __int16 v16 = v18;
    }
    while (v19 <= 0.0);
  }
  else
  {
    uint64_t v18 = v16;
  }
  char v20 = AXLogTapticTime();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    [v18 timeIntervalSinceDate:v10];
    int v30 = 134218240;
    BOOL v31 = v21;
    __int16 v32 = 2048;
    double v33 = v11;
    _os_log_impl(&dword_2352E7000, v20, OS_LOG_TYPE_DEFAULT, "start date to chime date interval: %f seconds (next interval: %f seconds)", (uint8_t *)&v30, 0x16u);
  }

  id v22 = [v12 components:96 fromDate:v18];
  uint64_t v23 = [v22 hour];
  if ([v22 minute]) {
    +[AXTapticChimeAsset quarterHourAssetForType:a5];
  }
  else {
  objc_super v24 = +[AXTapticChimeAsset hourAssetForType:a5 hour:v23];
  }
  [v18 timeIntervalSinceDate:v10];
  double v26 = v25;
  [v24 prePlayTimeInterval];
  *a6 = v26 - v27;
  double v28 = AXLogTapticTime();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    int v30 = 138412546;
    BOOL v31 = v24;
    __int16 v32 = 2112;
    double v33 = *(double *)&v18;
    _os_log_impl(&dword_2352E7000, v28, OS_LOG_TYPE_INFO, "chimeAsset: %@, for chime date: %@", (uint8_t *)&v30, 0x16u);
  }

  return v24;
}

- (void)_chimeDidFinishPlaying
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 134218496;
  uint64_t v4 = 0x4014000000000000;
  __int16 v5 = 2048;
  double v6 = a2;
  __int16 v7 = 2048;
  double v8 = a3;
  _os_log_fault_impl(&dword_2352E7000, log, OS_LOG_TYPE_FAULT, "wake to chime start took over %f seconds! actual time: %f seconds. wake delta: %f seconds", (uint8_t *)&v3, 0x20u);
}

uint64_t __49__AXTapticChimesScheduler__chimeDidFinishPlaying__block_invoke(uint64_t a1)
{
  return MEMORY[0x270F18A38](@"com.apple.accessibility.AXTapticChimesScheduler.ChimeFire", *(void *)(a1 + 32));
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v6 = AXLogTapticTime();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    __int16 v7 = @"NO";
    if (v4) {
      __int16 v7 = @"YES";
    }
    int v10 = 138412290;
    double v11 = v7;
    _os_log_impl(&dword_2352E7000, v6, OS_LOG_TYPE_INFO, "audioPlayerDidFinishPlaying: successfully: %@", (uint8_t *)&v10, 0xCu);
  }

  if (!v4)
  {
    double v8 = AXLogTapticTime();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[AXTapticChimesScheduler audioPlayerDidFinishPlaying:successfully:]();
    }
  }
  [(AXTapticChimesScheduler *)self _chimeDidFinishPlaying];
  if (AXIsInternalInstall())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AXChimesFinishedPlaying", 0, 0, 1u);
  }
}

- (float)lastMediaVolume
{
  return self->_lastMediaVolume;
}

- (void)setLastMediaVolume:(float)a3
{
  self->_lastMediaVolume = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaQueue, 0);
  objc_storeStrong((id *)&self->_lastActualChimeTime, 0);
  objc_storeStrong((id *)&self->_lastExpectedChimeTime, 0);
  objc_storeStrong((id *)&self->_lastActualWakeTime, 0);
  objc_storeStrong((id *)&self->_lastExpectedWakeTime, 0);
  objc_storeStrong((id *)&self->_currentChimeAsset, 0);
  objc_storeStrong((id *)&self->_previousAudioSessionCategory, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_chimeTimer, 0);
  objc_storeStrong((id *)&self->_pcServiceIdentifier, 0);
}

- (void)_init
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2352E7000, v0, OS_LOG_TYPE_ERROR, "Process DOES NOT handles chimes, this call was probably in error", v1, 2u);
}

- (void)_outputTapticChime:atDate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2352E7000, v0, v1, "failed to schedule chime playback", v2, v3, v4, v5, v6);
}

- (void)_outputTapticChime:atDate:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2352E7000, v0, v1, "failed to prepare audio player", v2, v3, v4, v5, v6);
}

- (void)_outputTapticChime:(uint64_t)a1 atDate:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_2352E7000, a2, OS_LOG_TYPE_FAULT, "failed to set audio session active due to: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_outputTapticChime:(NSObject *)a3 atDate:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2(&dword_2352E7000, a2, a3, "failed to set audio session category (%@) due to: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)audioPlayerDidFinishPlaying:successfully:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2352E7000, v0, v1, "chime failed to play successfully", v2, v3, v4, v5, v6);
}

@end