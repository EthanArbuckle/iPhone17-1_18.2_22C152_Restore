@interface AXTapToSpeakTimeManager
+ (id)sharedInstance;
- (AVSpeechSynthesizer)avSpeechSynthesizer;
- (AXTapticTimeManager)tapticTimeManager;
- (BOOL)_canOutputPremiumVoice;
- (BOOL)_canSpeakTimeForVoice:(unint64_t)a3 andGesture:(unint64_t)a4;
- (BOOL)_canTapticTime;
- (BOOL)canOutputTime;
- (BOOL)isCurrentlyOutputting;
- (NSDateFormatter)dateFormatter;
- (float)lastMediaVolume;
- (id)_currentLanguageCode;
- (id)_init;
- (id)_ttsSiriVoiceAssetForAFVoice:(id)a3 language:(id)a4;
- (void)_outputTapticTime:(id)a3;
- (void)_registerForNotifications;
- (void)_ringerStateChanged;
- (void)_setupAudioSessionForVoice:(unint64_t)a3;
- (void)_speakTime:(id)a3 preferredVoice:(unint64_t)a4;
- (void)_unregisterForNotifications;
- (void)dealloc;
- (void)outputTime:(id)a3;
- (void)outputTime:(id)a3 preferredVoice:(unint64_t)a4;
- (void)outputTime:(id)a3 preferredVoice:(unint64_t)a4 withGesture:(unint64_t)a5;
- (void)setLastMediaVolume:(float)a3;
- (void)speechOutputDidComplete;
- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4;
- (void)stopOutput;
@end

@implementation AXTapToSpeakTimeManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance__Shared_0;
  return v2;
}

uint64_t __41__AXTapToSpeakTimeManager_sharedInstance__block_invoke()
{
  sharedInstance__Shared_0 = [[AXTapToSpeakTimeManager alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v16.receiver = self;
  v16.super_class = (Class)AXTapToSpeakTimeManager;
  v2 = [(AXTapToSpeakTimeManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.accessibility.AXTapToSpeakTimeManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    avSpeechSynthesizer = v2->_avSpeechSynthesizer;
    v2->_avSpeechSynthesizer = (AVSpeechSynthesizer *)v6;

    [(AVSpeechSynthesizer *)v2->_avSpeechSynthesizer setIsInternalSynth:1];
    [(AVSpeechSynthesizer *)v2->_avSpeechSynthesizer setDelegate:v2];
    uint64_t v8 = [MEMORY[0x263F229A8] sharedInstance];
    tapticTimeManager = v2->_tapticTimeManager;
    v2->_tapticTimeManager = (AXTapticTimeManager *)v8;

    v2->_lastMediaVolume = -1.0;
    v10 = (void *)MEMORY[0x263F08790];
    v11 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    v12 = [v10 dateFormatFromTemplate:@"jjmm" options:0 locale:v11];

    v13 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v13;

    [(NSDateFormatter *)v2->_dateFormatter setDateFormat:v12];
    v2->_ringerStateNotifyToken = -1;
    [(AXTapToSpeakTimeManager *)v2 _registerForNotifications];
    [(AXTapToSpeakTimeManager *)v2 _ringerStateChanged];
  }
  return v2;
}

- (void)dealloc
{
  [(AXTapToSpeakTimeManager *)self _unregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)AXTapToSpeakTimeManager;
  [(AXTapToSpeakTimeManager *)&v3 dealloc];
}

- (void)_registerForNotifications
{
  p_ringerStateNotifyToken = &self->_ringerStateNotifyToken;
  if (self->_ringerStateNotifyToken == -1)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__AXTapToSpeakTimeManager__registerForNotifications__block_invoke;
    v5[3] = &unk_264C4E5B0;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch("com.apple.springboard.ringerstate", p_ringerStateNotifyToken, queue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __52__AXTapToSpeakTimeManager__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _ringerStateChanged];
}

- (void)_unregisterForNotifications
{
  int ringerStateNotifyToken = self->_ringerStateNotifyToken;
  if (ringerStateNotifyToken != -1)
  {
    notify_cancel(ringerStateNotifyToken);
    self->_int ringerStateNotifyToken = -1;
  }
}

- (void)_ringerStateChanged
{
  uint64_t state64 = 1;
  int ringerStateNotifyToken = self->_ringerStateNotifyToken;
  if (ringerStateNotifyToken == -1)
  {
    BOOL v4 = 0;
  }
  else
  {
    notify_get_state(ringerStateNotifyToken, &state64);
    BOOL v4 = state64 == 0;
  }
  self->_cachedRingerIsMuted = v4;
}

- (BOOL)_canSpeakTimeForVoice:(unint64_t)a3 andGesture:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v7 = [MEMORY[0x263F22938] sharedInstance];
  char v8 = [v7 tapToSpeakTimeEnabled];

  if (v8)
  {
    if (a4)
    {
      if (a4 == 1 && a3 - 3 <= 1)
      {
        if (self->_cachedRingerIsMuted)
        {
          v9 = AXLogTapticTime();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            LOWORD(v17) = 0;
            v10 = "ringer is muted, will NOT speak time";
LABEL_10:
            _os_log_impl(&dword_2352E7000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v17, 2u);
            goto LABEL_11;
          }
          goto LABEL_11;
        }
        return 1;
      }
    }
    else
    {
      v12 = [MEMORY[0x263F22938] sharedInstance];
      uint64_t v13 = [v12 tapToSpeakTimeAvailability];

      if (v13 == 1)
      {
        v15 = AXLogTapticTime();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          if (self->_cachedRingerIsMuted) {
            objc_super v16 = @"YES";
          }
          else {
            objc_super v16 = @"NO";
          }
          int v17 = 138412290;
          v18 = v16;
          _os_log_impl(&dword_2352E7000, v15, OS_LOG_TYPE_INFO, "availability = respect mute, ringerIsMuted = %@", (uint8_t *)&v17, 0xCu);
        }

        if (self->_cachedRingerIsMuted)
        {
          v9 = AXLogTapticTime();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
            goto LABEL_11;
          }
          LOWORD(v17) = 0;
          v10 = "ringer is muted, will NOT speak time";
          goto LABEL_10;
        }
        return 1;
      }
      if (v13 == 2)
      {
        v9 = AXLogTapticTime();
        BOOL v11 = 1;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_2352E7000, v9, OS_LOG_TYPE_INFO, "availability = always. ignoring ringer state", (uint8_t *)&v17, 2u);
        }
        goto LABEL_12;
      }
    }
    return 0;
  }
  v9 = AXLogTapticTime();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    v10 = "tap to speak time is disabled";
    goto LABEL_10;
  }
LABEL_11:
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)canOutputTime
{
  objc_super v3 = [MEMORY[0x263F22938] sharedInstance];
  int v4 = [v3 tapToSpeakTimeEnabled];

  if (!v4) {
    return 0;
  }
  v5 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v6 = [v5 tapToSpeakTimeAvailability];

  if (v6 != 2)
  {
    if (v6 == 1) {
      return !self->_cachedRingerIsMuted;
    }
    return 0;
  }
  return 1;
}

- (BOOL)isCurrentlyOutputting
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__AXTapToSpeakTimeManager_isCurrentlyOutputting__block_invoke;
  v5[3] = &unk_264C4E5D8;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __48__AXTapToSpeakTimeManager_isCurrentlyOutputting__block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 32) isSpeaking] & 1) != 0
    || ([*(id *)(a1 + 32) tapticTimeManager],
        v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 isCurrentlyOutputting],
        v2,
        v3))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)_canTapticTime
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F22938] sharedInstance];
  int v3 = [v2 voiceOverTapticTimeMode];

  int v4 = AXLogTapticTime();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = @"NO";
    if (v3) {
      v5 = @"YES";
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_2352E7000, v4, OS_LOG_TYPE_INFO, "tapticTimeEnabled = %@", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

- (void)outputTime:(id)a3
{
}

- (void)outputTime:(id)a3 preferredVoice:(unint64_t)a4
{
}

- (void)outputTime:(id)a3 preferredVoice:(unint64_t)a4 withGesture:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = AXLogTapticTime();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (a4 - 1 > 3) {
      v10 = @"Default";
    }
    else {
      v10 = off_264C4E648[a4 - 1];
    }
    BOOL v11 = @"One Finger Tap";
    if (!a5) {
      BOOL v11 = @"Two Finger Hold";
    }
    v12 = v11;
    *(_DWORD *)buf = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_2352E7000, v9, OS_LOG_TYPE_INFO, "Attempting to start time output: %@, for preferredVoice: %@, with gesture: %@", buf, 0x20u);
  }
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__AXTapToSpeakTimeManager_outputTime_preferredVoice_withGesture___block_invoke;
  v15[3] = &unk_264C4E600;
  unint64_t v17 = a4;
  unint64_t v18 = a5;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __65__AXTapToSpeakTimeManager_outputTime_preferredVoice_withGesture___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _canSpeakTimeForVoice:*(void *)(a1 + 48) andGesture:*(void *)(a1 + 56)];
  int v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    return [v3 _speakTime:v4 preferredVoice:v5];
  }
  else
  {
    uint64_t result = [v3 _canTapticTime];
    if (result && !*(void *)(a1 + 56))
    {
      int v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      return [v7 _outputTapticTime:v8];
    }
  }
  return result;
}

- (void)stopOutput
{
  int v3 = AXLogTapticTime();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2352E7000, v3, OS_LOG_TYPE_INFO, "Stopping (any) existing output", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__AXTapToSpeakTimeManager_stopOutput__block_invoke;
  block[3] = &unk_264C4E540;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__AXTapToSpeakTimeManager_stopOutput__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) avSpeechSynthesizer];
  int v3 = [v2 isSpeaking];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v7 = [v4 avSpeechSynthesizer];
    [v7 stopSpeakingAtBoundary:0];
  }
  else
  {
    uint64_t v5 = [v4 tapticTimeManager];
    int v6 = [v5 isCurrentlyOutputting];

    if (!v6) {
      return;
    }
    id v7 = [*(id *)(a1 + 32) tapticTimeManager];
    [v7 stopCurrentOutput];
  }
}

- (void)_speakTime:(id)a3 preferredVoice:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(AXTapToSpeakTimeManager *)self _setupAudioSessionForVoice:a4];
  [(AXTapToSpeakTimeManager *)self _normalizeVolumeIfNecessary];
  if ((a4 | 2) == 2)
  {
    id v7 = [MEMORY[0x263F285A0] sharedPreferences];
    uint64_t v8 = [v7 outputVoice];

    uint64_t v9 = AXLogTapticTime();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v8;
      _os_log_impl(&dword_2352E7000, v9, OS_LOG_TYPE_DEFAULT, "AFPreferences outputVoice: %@", buf, 0xCu);
    }

    v10 = [MEMORY[0x263F228D0] sharedInstance];
    BOOL v11 = [v10 systemLanguageID];

    v12 = AXLogTapticTime();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v11;
      _os_log_impl(&dword_2352E7000, v12, OS_LOG_TYPE_DEFAULT, "System general language: %@", buf, 0xCu);
    }

    uint64_t v13 = [v8 languageCode];
    if ([v13 hasPrefix:v11])
    {
      id v14 = AXCLanguageConvertToCanonicalForm();
      v15 = [(AXTapToSpeakTimeManager *)self _ttsSiriVoiceAssetForAFVoice:v8 language:v14];

      id v16 = [v15 identifier];
      unint64_t v17 = AXLogTapticTime();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v16;
        _os_log_impl(&dword_2352E7000, v17, OS_LOG_TYPE_DEFAULT, "Siri TTS voice identifier: %@", buf, 0xCu);
      }

      if (v16)
      {
        unint64_t v18 = [MEMORY[0x263EF9490] _voiceFromInternalVoiceListWithIdentifier:v16];
      }
      else
      {
        unint64_t v18 = 0;
      }
    }
    else
    {
      v15 = AXLogTapticTime();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v25 = v13;
        __int16 v26 = 2112;
        v27 = v11;
        _os_log_impl(&dword_2352E7000, v15, OS_LOG_TYPE_DEFAULT, "Siri voice language: %@ does not match system general language: %@. Will default to current locale system voice.", buf, 0x16u);
      }
      unint64_t v18 = 0;
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __53__AXTapToSpeakTimeManager__speakTime_preferredVoice___block_invoke;
  activity_block[3] = &unk_264C4E628;
  activity_block[4] = self;
  id v22 = v6;
  id v23 = v18;
  id v19 = v18;
  id v20 = v6;
  _os_activity_initiate(&dword_2352E7000, "Tap to speak time - voice services", OS_ACTIVITY_FLAG_DETACHED, activity_block);
}

void __53__AXTapToSpeakTimeManager__speakTime_preferredVoice___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = (void *)MEMORY[0x263EF94B8];
  int v3 = [*(id *)(a1 + 32) dateFormatter];
  uint64_t v4 = [v3 stringFromDate:*(void *)(a1 + 40)];
  uint64_t v5 = [v2 speechUtteranceWithString:v4];

  LODWORD(v6) = *(_DWORD *)"333?";
  [v5 setVolume:v6];
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(v5, "setVoice:");
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x263EF9490], "voiceWithLanguage:");
    [v5 setVoice:v7];
  }
  uint64_t v8 = [*(id *)(a1 + 32) avSpeechSynthesizer];
  [v8 speakUtterance:v5];

  uint64_t v9 = AXLogTapticTime();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    BOOL v11 = v5;
    _os_log_impl(&dword_2352E7000, v9, OS_LOG_TYPE_INFO, "Speaking time: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (id)_ttsSiriVoiceAssetForAFVoice:(id)a3 language:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 name];
  uint64_t v8 = [v6 footprint];

  if (v8 == 1) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 4;
  }
  int v10 = TTSSupportsNeuralVoices();
  BOOL v11 = AXLogTapticTime();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 67109120;
    LODWORD(v20) = v10;
    _os_log_impl(&dword_2352E7000, v11, OS_LOG_TYPE_DEFAULT, "TTSSupportsNeuralVoices: %d", (uint8_t *)&v19, 8u);
  }

  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v12 = AXLogTapticTime();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[AXTapToSpeakTimeManager _ttsSiriVoiceAssetForAFVoice:language:]((uint64_t)v5);
  }

  uint64_t v13 = AXLogTapticTime();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138413314;
    id v20 = v5;
    __int16 v21 = 2048;
    uint64_t v22 = 0;
    __int16 v23 = 2048;
    uint64_t v24 = v9;
    __int16 v25 = 2112;
    __int16 v26 = v7;
    __int16 v27 = 2048;
    uint64_t v28 = 5;
    _os_log_impl(&dword_2352E7000, v13, OS_LOG_TYPE_DEFAULT, "TTSSiriAssetManager installedAssetForLanguage:%@ gender:%ld footprint:%ld voiceName:%@ voiceType:%ld", (uint8_t *)&v19, 0x34u);
  }

  id v14 = [MEMORY[0x263F7EEE0] installedAssetForLanguage:v5 gender:0 footprint:v9 voiceName:v7 voiceType:5];
  if (!v14)
  {
    v15 = AXLogTapticTime();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v7;
      _os_log_impl(&dword_2352E7000, v15, OS_LOG_TYPE_DEFAULT, "Neural voice not found for name: %@. Will try looking for Gryphon voice.", (uint8_t *)&v19, 0xCu);
    }

LABEL_15:
    id v16 = AXLogTapticTime();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[AXTapToSpeakTimeManager _ttsSiriVoiceAssetForAFVoice:language:]((uint64_t)v5);
    }

    unint64_t v17 = AXLogTapticTime();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138413314;
      id v20 = v5;
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2048;
      uint64_t v24 = v9;
      __int16 v25 = 2112;
      __int16 v26 = v7;
      __int16 v27 = 2048;
      uint64_t v28 = 4;
      _os_log_impl(&dword_2352E7000, v17, OS_LOG_TYPE_DEFAULT, "TTSSiriAssetManager installedAssetForLanguage:%@ gender:%ld footprint:%ld voiceName:%@ voiceType:%ld", (uint8_t *)&v19, 0x34u);
    }

    id v14 = [MEMORY[0x263F7EEE0] installedAssetForLanguage:v5 gender:0 footprint:v9 voiceName:v7 voiceType:4];
  }

  return v14;
}

- (void)_outputTapticTime:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = [MEMORY[0x263F229A8] sharedInstance];
  int v3 = [MEMORY[0x263F22938] sharedInstance];
  objc_msgSend(v4, "outputHoursAndMinutes:", objc_msgSend(v3, "voiceOverTapticTimeEncoding"));
}

- (id)_currentLanguageCode
{
  int v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  int v3 = [v2 localeIdentifier];

  return v3;
}

- (BOOL)_canOutputPremiumVoice
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (_canOutputPremiumVoice_onceToken != -1) {
    dispatch_once(&_canOutputPremiumVoice_onceToken, &__block_literal_global_302_0);
  }
  int v2 = AXLogTapticTime();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (_canOutputPremiumVoice_canOutputPremiumVoice) {
      int v3 = @"YES";
    }
    else {
      int v3 = @"NO";
    }
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_2352E7000, v2, OS_LOG_TYPE_INFO, "canOutputPremiumVoice: %@", (uint8_t *)&v5, 0xCu);
  }

  return _canOutputPremiumVoice_canOutputPremiumVoice;
}

uint64_t __49__AXTapToSpeakTimeManager__canOutputPremiumVoice__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _canOutputPremiumVoice_canOutputPremiumVoice = result;
  return result;
}

- (void)_setupAudioSessionForVoice:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = AXLogTapticTime();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (a3 - 1 > 3) {
      int v5 = @"Default";
    }
    else {
      int v5 = off_264C4E648[a3 - 1];
    }
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_2352E7000, v4, OS_LOG_TYPE_INFO, "Setting up audio session for %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [MEMORY[0x263EF93E0] sharedInstance];
  [v6 setCategory:*MEMORY[0x263EF9090] withOptions:19 error:0];
  [v6 setActive:1 error:0];
}

- (void)speechOutputDidComplete
{
  int v3 = AXLogTapticTime();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2352E7000, v3, OS_LOG_TYPE_INFO, "Speech output did complete", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__AXTapToSpeakTimeManager_speechOutputDidComplete__block_invoke;
  block[3] = &unk_264C4E540;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__AXTapToSpeakTimeManager_speechOutputDidComplete__block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263EF93E0] sharedInstance];
  [v2 setActive:0 withOptions:1 error:0];

  int v3 = *(void **)(a1 + 32);
  return [v3 _denormalizeVolumeIfNecessary];
}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a4;
  int v5 = AXLogTapticTime();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_2352E7000, v5, OS_LOG_TYPE_INFO, "did start AVSpeechUtterance: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = AXLogTapticTime();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_2352E7000, v6, OS_LOG_TYPE_INFO, "did finish AVSpeechUtterance: %@", (uint8_t *)&v7, 0xCu);
  }

  [(AXTapToSpeakTimeManager *)self speechOutputDidComplete];
}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = AXLogTapticTime();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_2352E7000, v6, OS_LOG_TYPE_INFO, "did cancel AVSpeechUtterance: %@", (uint8_t *)&v7, 0xCu);
  }

  [(AXTapToSpeakTimeManager *)self speechOutputDidComplete];
}

- (AVSpeechSynthesizer)avSpeechSynthesizer
{
  return self->_avSpeechSynthesizer;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (AXTapticTimeManager)tapticTimeManager
{
  return self->_tapticTimeManager;
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
  objc_storeStrong((id *)&self->_tapticTimeManager, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_avSpeechSynthesizer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_ttsSiriVoiceAssetForAFVoice:(uint64_t)a1 language:.cold.1(uint64_t a1)
{
  v1 = [MEMORY[0x263F7EEE0] installedAssetsForLanguage:a1 voiceType:4];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2352E7000, v2, v3, "TTSSiriAssetManager installedAssetsForLanguage: %@ voiceType: %ld\n%@", v4, v5, v6, v7, v8);
}

- (void)_ttsSiriVoiceAssetForAFVoice:(uint64_t)a1 language:.cold.2(uint64_t a1)
{
  v1 = [MEMORY[0x263F7EEE0] installedAssetsForLanguage:a1 voiceType:5];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2352E7000, v2, v3, "TTSSiriAssetManager installedAssetsForLanguage: %@ voiceType: %ld\n%@", v4, v5, v6, v7, v8);
}

@end