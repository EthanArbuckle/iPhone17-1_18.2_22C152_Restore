@interface AVKitGlobalSettings
+ (BOOL)_enhanceDialogueEnabled;
+ (BOOL)_isDisplayingCaptionsOnSkipBack;
+ (BOOL)_overVideoScrubbingGestureEnabled;
+ (id)_mostRecentAudioLanguageCode;
+ (id)_mostRecentLegibleLanguageCode;
+ (id)shared;
+ (uint64_t)_deviceSupportsVisualAnalysis;
+ (uint64_t)_isQuickLook;
+ (unint64_t)_subtitleAutomaticallyEnabledState;
- (AVKitGlobalSettings)init;
- (BOOL)attributedContentTitlesSupported;
- (BOOL)backgroundEffectEnabled;
- (BOOL)enhanceDialogueEnabled;
- (BOOL)extendedVisualAnalysisEnabled;
- (BOOL)fluidSliderEnabled;
- (BOOL)frameCountingForAllVideosEnabled;
- (BOOL)isAVKitMacPlayer;
- (BOOL)isAVKitTester;
- (BOOL)isArtemisApp;
- (BOOL)isDisplayingCaptionsOnSkipBack;
- (BOOL)isPhotosApp;
- (BOOL)isQuickLook;
- (BOOL)isQuickTimePlayerX;
- (BOOL)isSpotlight;
- (BOOL)isTVApp;
- (BOOL)overVideoScrubbingGestureEnabled;
- (BOOL)playbackSpeedControlEnabled;
- (BOOL)quickLookModernPlayerControlsEnabled;
- (BOOL)searchBannerEnabled;
- (BOOL)secondGenerationPlayerEnabled;
- (BOOL)showsTVControls;
- (BOOL)skipBackCaptionsEnabled;
- (BOOL)subjectLiftGestureEnabled;
- (BOOL)subtitlesOnMuteEnabled;
- (BOOL)visualAnalysisEnabled;
- (BOOL)visualAnalysisSupported;
- (NSArray)preferredLanguages;
- (NSString)mostRecentAudioLanguageCode;
- (NSString)mostRecentLegibleLanguageCode;
- (unint64_t)subtitleAutomaticallyEnabledState;
- (void)setDisplayingCaptionsOnSkipBack:(BOOL)a3;
- (void)setMostRecentAudioLanguageCode:(id)a3;
- (void)setMostRecentLegibleLanguageCode:(id)a3;
- (void)setSecondGenerationPlayerEnabled:(BOOL)a3;
- (void)setSharedSetting:(id)a3 toString:(id)a4;
- (void)setSubtitleAutomaticallyEnabledState:(unint64_t)a3;
@end

@implementation AVKitGlobalSettings

- (NSString)mostRecentLegibleLanguageCode
{
  return self->_mostRecentLegibleLanguageCode;
}

- (NSString)mostRecentAudioLanguageCode
{
  return self->_mostRecentAudioLanguageCode;
}

void __27__AVKitGlobalSettings_init__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__AVKitGlobalSettings_init__block_invoke_2;
  block[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __27__AVKitGlobalSettings_init__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__AVKitGlobalSettings_init__block_invoke_4;
  block[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

uint64_t __29__AVKitGlobalSettings_shared__block_invoke()
{
  AVKitSharedGlobalSettings = objc_alloc_init(AVKitGlobalSettings);

  return MEMORY[0x1F41817F8]();
}

void __27__AVKitGlobalSettings_init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSubtitleAutomaticallyEnabledState:", +[AVKitGlobalSettings _subtitleAutomaticallyEnabledState](AVKitGlobalSettings, "_subtitleAutomaticallyEnabledState"));
}

- (void)setSubtitleAutomaticallyEnabledState:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_subtitleAutomaticallyEnabledState != a3)
  {
    v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "YES";
      *(_DWORD *)buf = 136315650;
      v10 = "-[AVKitGlobalSettings setSubtitleAutomaticallyEnabledState:]";
      v12 = "subtitleAutomaticallyEnabledState";
      __int16 v11 = 2080;
      if (!a3) {
        v6 = "NO";
      }
      __int16 v13 = 2080;
      v14 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
    }

    self->_subtitleAutomaticallyEnabledState = a3;
    if (+[AVKitGlobalSettings _subtitleAutomaticallyEnabledState] != a3)
    {
      v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[AVKitGlobalSettings setSubtitleAutomaticallyEnabledState:]";
        __int16 v11 = 2048;
        v12 = (const char *)a3;
        _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s updating the shared setting: %ld ", buf, 0x16u);
      }

      v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
      [(AVKitGlobalSettings *)self setSharedSetting:@"subtitleAutomaticallyEnabledState" toString:v8];
    }
  }
}

+ (id)_mostRecentLegibleLanguageCode
{
  id v2 = AVKitUserDefaults();
  v3 = [v2 stringForKey:@"RecentLegibleLanguageCode"];

  return v3;
}

- (AVKitGlobalSettings)init
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  v67.receiver = self;
  v67.super_class = (Class)AVKitGlobalSettings;
  id v2 = [(AVKitGlobalSettings *)&v67 init];
  if (v2)
  {
    self;
    v3 = AVApplicationIdentifier();
    char v4 = [v3 isEqualToString:@"com.apple.Home"];
    v5 = AVKitUserDefaults();
    uint64_t v6 = [v5 integerForKey:@"playerGeneration"];
    v7 = (void *)v6;
    char v8 = v4 ^ 1;
    if (v6)
    {
      if (v6 == 1)
      {
        char v8 = 0;
      }
      else if (v6 == 2)
      {
        char v8 = 1;
      }
      else
      {
        v9 = _AVLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 134217984;
          *(id *)((char *)location + 4) = v7;
          _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Error: Invalid player generation %ld", (uint8_t *)location, 0xCu);
        }
      }
    }

    v2->_secondGenerationPlayerEnabled = v8;
    self;
    self;
    _CFMZEnabled();
    int v10 = dyld_program_sdk_at_least();
    int v11 = dyld_program_sdk_at_least();
    char v12 = v11;
    if (((v11 | v10 ^ 1) & 1) == 0)
    {
      __int16 v13 = AVApplicationIdentifier();
      v14 = [v13 lowercaseString];

      char v12 = [v14 hasPrefix:@"com.apple."];
    }
    v2->_playbackSpeedControlEnabled = v12;
    self;
    int v15 = +[AVKitGlobalSettings _deviceSupportsVisualAnalysis]();
    if (v15) {
      LOBYTE(v15) = dyld_program_sdk_at_least();
    }
    v2->_visualAnalysisSupported = v15;
    v2->_visualAnalysisEnabled = v15;
    v2->_isQuickLook = +[AVKitGlobalSettings _isQuickLook]();
    self;
    v16 = AVApplicationIdentifier();
    char v17 = [v16 isEqualToString:@"com.apple.tv"];

    v2->_isTVApp = v17;
    self;
    v18 = AVApplicationIdentifier();
    char v19 = [v18 isEqualToString:@"com.apple.applemediaroom"];

    v2->_isArtemisApp = v19;
    self;
    v20 = AVKitUserDefaults();
    v21 = [v20 valueForKey:@"fluidSliderEnabled"];

    if (v21) {
      char v22 = [v20 BOOLForKey:@"fluidSliderEnabled"];
    }
    else {
      char v22 = 1;
    }

    v2->_fluidSliderEnabled = v22;
    v2->_showsTVControls = 0;
    self;
    v2->_frameCountingForAllVideosEnabled = 0;
    v2->_overVideoScrubbingGestureEnabled = +[AVKitGlobalSettings _overVideoScrubbingGestureEnabled];
    self;
    int v23 = +[AVKitGlobalSettings _deviceSupportsVisualAnalysis]();
    if (v23) {
      LOBYTE(v23) = dyld_program_sdk_at_least();
    }
    v2->_extendedVisualAnalysisEnabled = v23;
    self;
    v24 = AVKitUserDefaults();
    v25 = [v24 valueForKey:@"subjectLiftGestureEnabled"];
    BOOL v26 = v25 == 0;

    if (v26) {
      char v27 = 1;
    }
    else {
      char v27 = [v24 BOOLForKey:@"subjectLiftGestureEnabled"];
    }

    v2->_subjectLiftGestureEnabled = v27;
    self;
    v28 = AVApplicationIdentifier();
    BOOL v29 = ([v28 isEqualToString:@"com.apple.Fitness"] & 1) != 0
       || [v28 isEqualToString:@"com.apple.AVKitTester"];

    v2->_attributedContentTitlesSupported = v29;
    self;
    v30 = AVKitUserDefaults();
    v31 = [v30 valueForKey:@"searchBannerEnabled"];

    if (v31) {
      LOBYTE(v31) = [v30 BOOLForKey:@"searchBannerEnabled"];
    }

    v2->_searchBannerEnabled = (char)v31;
    self;
    v2->_isAVKitMacPlayer = 0;
    self;
    v32 = AVApplicationIdentifier();
    char v33 = [v32 isEqualToString:@"com.apple.AVKitTester"];

    v2->_isAVKitTester = v33;
    self;
    v34 = AVApplicationIdentifier();
    if ([v34 isEqualToString:@"com.apple.Photos"]) {
      char v35 = 1;
    }
    else {
      char v35 = [v34 isEqualToString:@"com.appleinternal.PhotosPlayground-macOS"];
    }

    v2->_isPhotosApp = v35;
    self;
    v36 = AVApplicationIdentifier();
    char v37 = [v36 isEqualToString:@"com.apple.QuickTimePlayerX"];

    v2->_isQuickTimePlayerX = v37;
    self;
    v38 = AVApplicationIdentifier();
    char v39 = [v38 isEqualToString:@"com.apple.Spotlight"];

    v2->_isSpotlight = v39;
    self;
    int isQuick = _os_feature_enabled_impl();
    if (isQuick)
    {
      int isQuick = +[AVKitGlobalSettings _isQuickLook]();
      if (isQuick) {
        LOBYTE(isQuick) = dyld_program_sdk_at_least();
      }
    }
    v2->_quickLookModernPlayerControlsEnabled = isQuick;
    self;
    v2->_backgroundEffectEnabled = 0;
    self;
    v41 = AVKitUserDefaults();
    v42 = [v41 objectForKey:@"visualAnalysisEnabled"];
    if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v43 = v42;
    }
    else {
      id v43 = 0;
    }

    if (v43) {
      v2->_visualAnalysisEnabled = [v43 BOOLValue];
    }
    uint64_t v44 = +[AVKitGlobalSettings _mostRecentAudioLanguageCode];
    mostRecentAudioLanguageCode = v2->_mostRecentAudioLanguageCode;
    v2->_mostRecentAudioLanguageCode = (NSString *)v44;

    uint64_t v46 = _ObservationForSharedAVKitSetting(v2, @"RecentAudioLanguageCode", @"mostRecentAudioLanguageCode");
    mostRecentAudioLanguageCodeObservation = v2->_mostRecentAudioLanguageCodeObservation;
    v2->_mostRecentAudioLanguageCodeObservation = (NSObservation *)v46;

    uint64_t v48 = +[AVKitGlobalSettings _mostRecentLegibleLanguageCode];
    mostRecentLegibleLanguageCode = v2->_mostRecentLegibleLanguageCode;
    v2->_mostRecentLegibleLanguageCode = (NSString *)v48;

    uint64_t v50 = _ObservationForSharedAVKitSetting(v2, @"RecentLegibleLanguageCode", @"mostRecentLegibleLanguageCode");
    mostRecentLegibleLanguageCodeObservation = v2->_mostRecentLegibleLanguageCodeObservation;
    v2->_mostRecentLegibleLanguageCodeObservation = (NSObservation *)v50;

    v2->_displayingCaptionsOnSkipBack = +[AVKitGlobalSettings _isDisplayingCaptionsOnSkipBack];
    objc_initWeak(location, v2);
    v52 = (void *)MEMORY[0x1E4F28EE8];
    v53 = AVKitUserDefaults();
    v54 = [v52 keyPathWithRootObject:v53, objc_msgSend(@"isDisplayingCaptionsOnSkipBack", "UTF8String") path];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __27__AVKitGlobalSettings_init__block_invoke;
    v65[3] = &unk_1E5FC1DE8;
    objc_copyWeak(&v66, location);
    uint64_t v55 = [v54 addObserverBlock:v65];
    displayingCaptionsOnSkipBackObservation = v2->_displayingCaptionsOnSkipBackObservation;
    v2->_displayingCaptionsOnSkipBackObservation = (NSObservation *)v55;

    v2->_enhanceDialogueEnabled = +[AVKitGlobalSettings _enhanceDialogueEnabled];
    v2->_subtitleAutomaticallyEnabledState = +[AVKitGlobalSettings _subtitleAutomaticallyEnabledState];
    v57 = (void *)MEMORY[0x1E4F28EE8];
    v58 = AVKitUserDefaults();
    v59 = [v57 keyPathWithRootObject:v58, objc_msgSend(@"subtitleAutomaticallyEnabledState", "UTF8String") path];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __27__AVKitGlobalSettings_init__block_invoke_3;
    v63[3] = &unk_1E5FC1DE8;
    objc_copyWeak(&v64, location);
    uint64_t v60 = [v59 addObserverBlock:v63];
    subtitleEnabledFromAutoStateCodeObservation = v2->_subtitleEnabledFromAutoStateCodeObservation;
    v2->_subtitleEnabledFromAutoStateCodeObservation = (NSObservation *)v60;

    objc_destroyWeak(&v64);
    objc_destroyWeak(&v66);
    objc_destroyWeak(location);
  }
  return v2;
}

+ (uint64_t)_isQuickLook
{
  self;
  v0 = AVApplicationIdentifier();
  if ([v0 isEqualToString:@"com.apple.quicklook.UIExtension"]) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = [v0 isEqualToString:@"com.apple.quicklook.extension.previewUI"];
  }

  return v1;
}

+ (uint64_t)_deviceSupportsVisualAnalysis
{
  self;
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getVKCImageAnalyzerClass_softClass;
  uint64_t v7 = getVKCImageAnalyzerClass_softClass;
  if (!getVKCImageAnalyzerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVKCImageAnalyzerClass_block_invoke;
    v3[3] = &unk_1E5FC42C0;
    v3[4] = &v4;
    __getVKCImageAnalyzerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return [v1 deviceSupportsImageAnalysis];
}

+ (unint64_t)_subtitleAutomaticallyEnabledState
{
  id v2 = AVKitUserDefaults();
  unint64_t v3 = [v2 integerForKey:@"subtitleAutomaticallyEnabledState"];

  return v3;
}

void __27__AVKitGlobalSettings_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setDisplayingCaptionsOnSkipBack:", +[AVKitGlobalSettings _isDisplayingCaptionsOnSkipBack](AVKitGlobalSettings, "_isDisplayingCaptionsOnSkipBack"));
}

+ (BOOL)_isDisplayingCaptionsOnSkipBack
{
  id v2 = AVKitUserDefaults();
  char v3 = [v2 BOOLForKey:@"isDisplayingCaptionsOnSkipBack"];

  return v3;
}

- (void)setDisplayingCaptionsOnSkipBack:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_displayingCaptionsOnSkipBack != a3)
  {
    BOOL v3 = a3;
    v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = "NO";
      *(_DWORD *)v9 = 136315650;
      *(void *)&v9[4] = "-[AVKitGlobalSettings setDisplayingCaptionsOnSkipBack:]";
      *(void *)&v9[14] = "displayingCaptionsOnSkipBack";
      *(_WORD *)&v9[12] = 2080;
      if (v3) {
        uint64_t v6 = "YES";
      }
      *(_WORD *)&v9[22] = 2080;
      int v10 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", v9, 0x20u);
    }

    self->_displayingCaptionsOnSkipBack = v3;
    if (+[AVKitGlobalSettings _isDisplayingCaptionsOnSkipBack] != v3)
    {
      uint64_t v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v9 = 136315138;
        *(void *)&v9[4] = "-[AVKitGlobalSettings setDisplayingCaptionsOnSkipBack:]";
        _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s updating the shared setting", v9, 0xCu);
      }

      if (v3) {
        char v8 = @"YES";
      }
      else {
        char v8 = @"NO";
      }
      [(AVKitGlobalSettings *)self setSharedSetting:@"isDisplayingCaptionsOnSkipBack", v8, *(_OWORD *)v9, *(void *)&v9[16] toString];
    }
  }
}

+ (BOOL)_overVideoScrubbingGestureEnabled
{
  id v2 = AVKitUserDefaults();
  BOOL v3 = [v2 valueForKey:@"overVideoScrubbingGestureEnabled"];

  if (v3) {
    LOBYTE(v3) = [v2 BOOLForKey:@"overVideoScrubbingGestureEnabled"];
  }

  return (char)v3;
}

+ (id)_mostRecentAudioLanguageCode
{
  id v2 = AVKitUserDefaults();
  BOOL v3 = [v2 stringForKey:@"RecentAudioLanguageCode"];

  return v3;
}

+ (BOOL)_enhanceDialogueEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)overVideoScrubbingGestureEnabled
{
  return self->_overVideoScrubbingGestureEnabled;
}

- (BOOL)secondGenerationPlayerEnabled
{
  return self->_secondGenerationPlayerEnabled;
}

- (BOOL)enhanceDialogueEnabled
{
  return self->_enhanceDialogueEnabled;
}

+ (id)shared
{
  if (shared_createAVKitGlobalSettingsOnce != -1) {
    dispatch_once(&shared_createAVKitGlobalSettingsOnce, &__block_literal_global);
  }
  id v2 = (void *)AVKitSharedGlobalSettings;

  return v2;
}

- (BOOL)visualAnalysisEnabled
{
  return self->_visualAnalysisEnabled;
}

- (BOOL)showsTVControls
{
  return self->_showsTVControls;
}

- (BOOL)quickLookModernPlayerControlsEnabled
{
  return self->_quickLookModernPlayerControlsEnabled;
}

- (BOOL)extendedVisualAnalysisEnabled
{
  return self->_extendedVisualAnalysisEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentAudioLanguageCode, 0);
  objc_storeStrong((id *)&self->_mostRecentLegibleLanguageCode, 0);
  objc_storeStrong((id *)&self->_subtitleEnabledFromAutoStateCodeObservation, 0);
  objc_storeStrong((id *)&self->_displayingCaptionsOnSkipBackObservation, 0);
  objc_storeStrong((id *)&self->_mostRecentAudioLanguageCodeObservation, 0);

  objc_storeStrong((id *)&self->_mostRecentLegibleLanguageCodeObservation, 0);
}

- (unint64_t)subtitleAutomaticallyEnabledState
{
  return self->_subtitleAutomaticallyEnabledState;
}

- (BOOL)isDisplayingCaptionsOnSkipBack
{
  return self->_displayingCaptionsOnSkipBack;
}

- (BOOL)attributedContentTitlesSupported
{
  return self->_attributedContentTitlesSupported;
}

- (BOOL)backgroundEffectEnabled
{
  return self->_backgroundEffectEnabled;
}

- (BOOL)frameCountingForAllVideosEnabled
{
  return self->_frameCountingForAllVideosEnabled;
}

- (BOOL)fluidSliderEnabled
{
  return self->_fluidSliderEnabled;
}

- (BOOL)searchBannerEnabled
{
  return self->_searchBannerEnabled;
}

- (BOOL)subjectLiftGestureEnabled
{
  return self->_subjectLiftGestureEnabled;
}

- (BOOL)isSpotlight
{
  return self->_isSpotlight;
}

- (BOOL)isTVApp
{
  return self->_isTVApp;
}

- (BOOL)isQuickTimePlayerX
{
  return self->_isQuickTimePlayerX;
}

- (BOOL)isPhotosApp
{
  return self->_isPhotosApp;
}

- (BOOL)isAVKitTester
{
  return self->_isAVKitTester;
}

- (BOOL)isAVKitMacPlayer
{
  return self->_isAVKitMacPlayer;
}

- (BOOL)isArtemisApp
{
  return self->_isArtemisApp;
}

- (BOOL)isQuickLook
{
  return self->_isQuickLook;
}

- (BOOL)visualAnalysisSupported
{
  return self->_visualAnalysisSupported;
}

- (BOOL)playbackSpeedControlEnabled
{
  return self->_playbackSpeedControlEnabled;
}

- (void)setSharedSetting:(id)a3 toString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.avkit.SharedPreferences"];
  char v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F09B4238];
  [v7 setRemoteObjectInterface:v8];

  [v7 resume];
  v9 = [v7 remoteObjectProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__AVKitGlobalSettings_setSharedSetting_toString___block_invoke;
  v13[3] = &unk_1E5FC3B98;
  id v14 = v5;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v5;
  [v9 setString:v11 forKey:v12 completion:v13];
}

uint64_t __49__AVKitGlobalSettings_setSharedSetting_toString___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = _AVLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_DEFAULT, "setSharedSetting: set %{public}@ to %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 48) invalidate];
}

- (BOOL)subtitlesOnMuteEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2) {
    LOBYTE(v2) = _AXSAutomaticSubtitlesShowWhenMuted() != 0;
  }
  return v2;
}

- (NSArray)preferredLanguages
{
  return (NSArray *)[MEMORY[0x1E4F1CA20] preferredLanguages];
}

- (BOOL)skipBackCaptionsEnabled
{
  int v2 = _os_feature_enabled_impl();
  if (v2) {
    LOBYTE(v2) = _AXSAutomaticSubtitlesShowOnSkipBack() != 0;
  }
  return v2;
}

- (void)setMostRecentAudioLanguageCode:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSString *)a3;
  mostRecentAudioLanguageCode = self->_mostRecentAudioLanguageCode;
  if (mostRecentAudioLanguageCode != v4
    && (!v4 || ![(NSString *)mostRecentAudioLanguageCode isEqualToString:v4]))
  {
    int v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      __int16 v13 = "-[AVKitGlobalSettings setMostRecentAudioLanguageCode:]";
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s '%{public}@", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v7 = (NSString *)[(NSString *)v4 copy];
    __int16 v8 = self->_mostRecentAudioLanguageCode;
    self->_mostRecentAudioLanguageCode = v7;

    uint64_t v9 = +[AVKitGlobalSettings _mostRecentAudioLanguageCode];
    uint64_t v10 = v9;
    if (v9 != v4 && (!v4 || !v9 || ![(NSString *)v9 isEqualToString:v4]))
    {
      id v11 = _AVLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        __int16 v13 = "-[AVKitGlobalSettings setMostRecentAudioLanguageCode:]";
        _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s updating the shared setting", (uint8_t *)&v12, 0xCu);
      }

      [(AVKitGlobalSettings *)self setSharedSetting:@"RecentAudioLanguageCode" toString:v4];
    }
  }
}

- (void)setMostRecentLegibleLanguageCode:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSString *)a3;
  mostRecentLegibleLanguageCode = self->_mostRecentLegibleLanguageCode;
  if (mostRecentLegibleLanguageCode != v4
    && (!v4 || ![(NSString *)mostRecentLegibleLanguageCode isEqualToString:v4]))
  {
    int v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      __int16 v13 = "-[AVKitGlobalSettings setMostRecentLegibleLanguageCode:]";
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s '%{public}@", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v7 = (NSString *)[(NSString *)v4 copy];
    __int16 v8 = self->_mostRecentLegibleLanguageCode;
    self->_mostRecentLegibleLanguageCode = v7;

    uint64_t v9 = +[AVKitGlobalSettings _mostRecentLegibleLanguageCode];
    uint64_t v10 = v9;
    if (v9 != v4 && (!v4 || !v9 || ![(NSString *)v9 isEqualToString:v4]))
    {
      id v11 = _AVLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        __int16 v13 = "-[AVKitGlobalSettings setMostRecentLegibleLanguageCode:]";
        _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s updating the shared setting", (uint8_t *)&v12, 0xCu);
      }

      [(AVKitGlobalSettings *)self setSharedSetting:@"RecentLegibleLanguageCode" toString:v4];
    }
  }
}

- (void)setSecondGenerationPlayerEnabled:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_secondGenerationPlayerEnabled != a3)
  {
    BOOL v3 = a3;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = "NO";
      int v7 = 136315650;
      __int16 v8 = "-[AVKitGlobalSettings setSecondGenerationPlayerEnabled:]";
      uint64_t v10 = "secondGenerationPlayerEnabled";
      __int16 v9 = 2080;
      if (v3) {
        int v6 = "YES";
      }
      __int16 v11 = 2080;
      int v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    self->_secondGenerationPlayerEnabled = v3;
  }
}

@end