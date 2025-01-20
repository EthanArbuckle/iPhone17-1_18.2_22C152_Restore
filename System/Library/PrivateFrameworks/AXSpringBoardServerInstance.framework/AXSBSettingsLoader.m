@interface AXSBSettingsLoader
+ (BOOL)_alreadyRebootedGracefullyOnce;
+ (void)_checkAccessibilityOptionsSetByiTunes;
+ (void)_checkAssistiveTouchSetByiTunes;
+ (void)_checkClosedCaptioningSetByiTunes;
+ (void)_checkContrastSetting;
+ (void)_checkForDataResetFile;
+ (void)_checkForHomeButtonBreakage:(BOOL)a3;
+ (void)_checkInvertColorsSetByiTunes;
+ (void)_checkMonoAudioSetByiTunes;
+ (void)_checkSpeakAutofillSetByiTunes;
+ (void)_checkVoiceOverTouchSetByiTunes;
+ (void)_checkZoomTouchSetByiTunes;
+ (void)_findNoteFromLoginSessionWithCompletion:(id)a3;
+ (void)_gracefulRebootForBrokenHomeButton;
+ (void)_handleLiveListenEventIsListening:(BOOL)a3 audioLevel:(double)a4;
+ (void)_initializeDelayedSpringBoardSettings;
+ (void)_performValidations;
+ (void)_processStartupSoundEnabled;
+ (void)_registerForHomeButtonBreakage;
+ (void)_registerForHomeButtonBreakageNotification;
+ (void)_registerForNotifications;
+ (void)_setRebootedGracefullyOnce;
+ (void)_setVoiceOverTouchSettings:(unsigned __int8)a3;
+ (void)_startAssistiveTouchForBrokenHomeButton;
+ (void)_updateAXSettings;
+ (void)_updateSpringBoardHelper;
+ (void)bootstrapGuidedAccessIfNeeded;
+ (void)checkAccessibilityOptions;
+ (void)checkScreenContrast;
+ (void)initialize;
- (AXSBSettingsLoader)init;
- (BOOL)_isDeviceAffectedByVOActivationWorkaround;
- (void)_bootstrapSoundDetection;
- (void)_ensureUltronAppVisibility:(BOOL)a3;
- (void)_handleGuidedAccessManagedConfigurationDidChange:(id)a3;
- (void)_hideVoiceOverEnabler;
- (void)_initializeRemoteSettingsListener;
- (void)_makeVoiceOverVibrateWindow;
- (void)_playVOActivationSoundEnded;
- (void)_playVOActivationSoundStarted;
- (void)_reachabilityChanged:(id)a3;
- (void)_registerReachability;
- (void)_showSwipeDetectionEnablerView;
- (void)_showVibrationVoiceOverEnablerView;
- (void)_updateAXSettings;
- (void)_voiceOverEnabled:(id)a3;
- (void)dealloc;
- (void)swipeDetectorDetectedSwipe;
@end

@implementation AXSBSettingsLoader

+ (void)_setVoiceOverTouchSettings:(unsigned __int8)a3
{
  if (a3 || _AXSCanDisableApplicationAccessibility()) {
    _AXSApplicationAccessibilitySetEnabled();
  }
  _AXSVoiceOverTouchSetUsageConfirmed();
  _AXSVoiceOverTouchSetEnabled();
}

+ (void)_checkVoiceOverTouchSetByiTunes
{
  int v3 = _AXSVoiceOverTouchEnabled();
  char v8 = 0;
  int v4 = MEMORY[0x22A66DFC0](*MEMORY[0x263F8B3E8], &v8);
  if (v8)
  {
    if (v4) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      uint64_t v7 = 1;
      goto LABEL_12;
    }
    if (v4) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v3 == 0;
    }
    if (!v6)
    {
      uint64_t v7 = 0;
LABEL_12:
      [a1 _setVoiceOverTouchSettings:v7];
    }
  }
}

+ (void)_checkZoomTouchSetByiTunes
{
  int v2 = _AXSZoomTouchEnabled();
  char v6 = 0;
  int v3 = MEMORY[0x22A66DFC0](*MEMORY[0x263F8B450], &v6);
  if (v6)
  {
    BOOL v4 = v3 && v2 == 0;
    if (v4 || (!v3 ? (BOOL v5 = v2 == 0) : (BOOL v5 = 1), !v5)) {
      _AXSZoomTouchSetEnabled();
    }
  }
}

+ (void)_checkInvertColorsSetByiTunes
{
  char v7 = 0;
  int v2 = MEMORY[0x22A66DFC0](*MEMORY[0x263F8B2C0], &v7);
  if (v7)
  {
    int v3 = v2;
    int v4 = _AXSInvertColorsEnabled();
    BOOL v5 = v3 && v4 == 0;
    if (v5 || (!v3 ? (BOOL v6 = v4 == 0) : (BOOL v6 = 1), !v6)) {
      _AXSInvertColorsSetEnabled();
    }
  }
}

+ (void)_checkAssistiveTouchSetByiTunes
{
  char v7 = 0;
  int v2 = MEMORY[0x22A66DFC0](*MEMORY[0x263F8B128], &v7);
  if (v7)
  {
    int v3 = v2;
    int v4 = _AXSAssistiveTouchEnabled();
    if (v3) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      _AXSAssistiveTouchSetEnabled();
      _AXSAssistiveTouchSetUIEnabled();
    }
    else
    {
      if (v3) {
        BOOL v6 = 1;
      }
      else {
        BOOL v6 = v4 == 0;
      }
      if (!v6) {
        _AXSAssistiveTouchSetEnabled();
      }
    }
  }
}

+ (void)_checkMonoAudioSetByiTunes
{
  int v2 = _AXSMonoAudioEnabled();
  char v6 = 0;
  int v3 = MEMORY[0x22A66DFC0](*MEMORY[0x263F8B310], &v6);
  if (v6)
  {
    BOOL v4 = v3 && v2 == 0;
    if (v4 || (!v3 ? (BOOL v5 = v2 == 0) : (BOOL v5 = 1), !v5)) {
      _AXSMonoAudioSetEnabled();
    }
  }
}

+ (void)_checkClosedCaptioningSetByiTunes
{
  char v2 = 0;
  MEMORY[0x22A66DFC0](*MEMORY[0x263F8B168], &v2);
  if (v2) {
    _AXSClosedCaptionsSetEnabled();
  }
}

+ (void)_checkSpeakAutofillSetByiTunes
{
  char v2 = [MEMORY[0x263F22938] sharedInstance];
  int v3 = [v2 speakCorrectionsEnabled];

  char v10 = 0;
  int v4 = MEMORY[0x22A66DFC0](*MEMORY[0x263F8B390], &v10);
  if (v10)
  {
    if (v4) {
      char v5 = v3;
    }
    else {
      char v5 = 1;
    }
    if ((v5 & 1) == 0)
    {
      char v7 = [MEMORY[0x263F22938] sharedInstance];
      char v8 = v7;
      uint64_t v9 = 1;
      goto LABEL_12;
    }
    if (v4) {
      int v6 = 0;
    }
    else {
      int v6 = v3;
    }
    if (v6 == 1)
    {
      char v7 = [MEMORY[0x263F22938] sharedInstance];
      char v8 = v7;
      uint64_t v9 = 0;
LABEL_12:
      [v7 setSpeakCorrectionsEnabled:v9];
    }
  }
}

+ (void)_checkContrastSetting
{
  _AXSScreenContrast();
  if (v2 > 0.0)
  {
    float v3 = v2;
    id v7 = [MEMORY[0x263F15920] serverIfRunning];
    int v4 = [v7 displays];
    if ([v4 count])
    {
      int v6 = [v4 objectAtIndex:0];
    }
    else
    {
      int v6 = 0;
    }
    *(float *)&double v5 = v3;
    [v6 setContrast:v5];
    NSLog(&cfstr_SettingScreenC.isa, (float)(v3 * 100.0), v6);
  }
}

+ (void)checkScreenContrast
{
  float v3 = (void *)MEMORY[0x22A66E690](a1, a2);
  [MEMORY[0x263F08B88] detachNewThreadSelector:sel__checkContrastSetting toTarget:a1 withObject:0];
}

+ (void)checkAccessibilityOptions
{
  if (checkAccessibilityOptions_onceToken != -1) {
    dispatch_once(&checkAccessibilityOptions_onceToken, &__block_literal_global_4);
  }
  [(id)CheckOptionsTimer cancel];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__AXSBSettingsLoader_checkAccessibilityOptions__block_invoke_2;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  [(id)CheckOptionsTimer afterDelay:v3 processBlock:0.25];
}

uint64_t __47__AXSBSettingsLoader_checkAccessibilityOptions__block_invoke()
{
  CheckOptionsTimer = (uint64_t)objc_alloc_init(MEMORY[0x263F21398]);
  return MEMORY[0x270F9A758]();
}

uint64_t __47__AXSBSettingsLoader_checkAccessibilityOptions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkAccessibilityOptionsSetByiTunes];
}

+ (void)_checkAccessibilityOptionsSetByiTunes
{
  [a1 _checkVoiceOverTouchSetByiTunes];
  [a1 _checkZoomTouchSetByiTunes];
  [a1 _checkInvertColorsSetByiTunes];
  [a1 _checkMonoAudioSetByiTunes];
  [a1 _checkSpeakAutofillSetByiTunes];
  [a1 _checkClosedCaptioningSetByiTunes];
  [a1 _checkAssistiveTouchSetByiTunes];
  [a1 _checkContrastSetting];
}

+ (void)_updateSpringBoardHelper
{
  if ((_updateSpringBoardHelper_isInitialized & 1) == 0)
  {
    if (AXIsInternalInstall())
    {
      float v2 = (void *)_AXSTripleClickCopyOptions();
      unsigned int v3 = _AXSAccessibilityEnabled();
      NSLog(&cfstr_AxUpdateSbServ.isa, v3, [v2 count]);
    }
    +[AXSpringBoardServerHelper initialize];
    _updateSpringBoardHelper_isInitialized = 1;
  }
}

- (void)_updateAXSettings
{
  float v2 = objc_opt_class();
  [v2 _updateAXSettings];
}

+ (void)_updateAXSettings
{
}

uint64_t __39__AXSBSettingsLoader__updateAXSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSpringBoardHelper];
}

+ (void)_registerForNotifications
{
  if ((ListeningForNotifications & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_accessibilityiTunesSettings, (CFStringRef)*MEMORY[0x263F8B470], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    int v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, a1, (CFNotificationCallback)_accessibilityCheckContrast, (CFStringRef)*MEMORY[0x263F8B368], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, a1, (CFNotificationCallback)_accessibilityVisualAlertChanged, (CFStringRef)*MEMORY[0x263F8B3D8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    int v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, a1, (CFNotificationCallback)_accessibilitySpeakTypingChanged, (CFStringRef)*MEMORY[0x263F8B440], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, a1, (CFNotificationCallback)_accessibilitySpeakTypingChanged, (CFStringRef)*MEMORY[0x263F8B2D8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    char v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, a1, (CFNotificationCallback)_accessibilitySpeakTypingChanged, (CFStringRef)*MEMORY[0x263F8B330], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, a1, (CFNotificationCallback)_accessibilityEnhanceTextLegibilityChanged, (CFStringRef)*MEMORY[0x263F8B1B0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__AXSBSettingsLoader__registerForNotifications__block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = a1;
    char v10 = (void (**)(void))_Block_copy(aBlock);
    v11 = [MEMORY[0x263F22938] sharedInstance];
    [v11 registerUpdateBlock:v10 forRetrieveSelector:sel_startupSoundEnabled withListener:a1];

    v10[2](v10);
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v13 = *MEMORY[0x263F832E8];
    v14 = [MEMORY[0x263F08A48] mainQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __47__AXSBSettingsLoader__registerForNotifications__block_invoke_2;
    v17[3] = &unk_2647F1438;
    id v18 = v10;
    v15 = v10;
    id v16 = (id)[v12 addObserverForName:v13 object:0 queue:v14 usingBlock:v17];

    ListeningForNotifications = 1;
  }
}

uint64_t __47__AXSBSettingsLoader__registerForNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processStartupSoundEnabled];
}

uint64_t __47__AXSBSettingsLoader__registerForNotifications__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_processStartupSoundEnabled
{
  float v2 = AXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_226EBC000, v2, OS_LOG_TYPE_INFO, "Processing change for startup sound", v6, 2u);
  }

  if (AXAssetAndDataClient_onceToken != -1) {
    dispatch_once(&AXAssetAndDataClient_onceToken, &__block_literal_global_700);
  }
  unsigned int v3 = (void *)MEMORY[0x263F21380];
  id v4 = (id)AXAssetAndDataClient_Client;
  double v5 = [v3 mainAccessQueue];
  [v4 sendAsynchronousMessage:MEMORY[0x263EFFA78] withIdentifier:13 targetAccessQueue:v5 completion:0];
}

+ (void)_findNoteFromLoginSessionWithCompletion:(id)a3
{
  id v3 = a3;
  if ((AXCurrentProcessExistsInLoginSessionSBOnly() & 1) == 0)
  {
    id v4 = [MEMORY[0x263F21198] sharedManager];
    uint64_t v5 = *MEMORY[0x263F22680];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__AXSBSettingsLoader__findNoteFromLoginSessionWithCompletion___block_invoke;
    v6[3] = &unk_2647F1460;
    id v7 = v3;
    [v4 readDataForFileAtAccessibilityContainerPath:v5 completion:v6];
  }
}

void __62__AXSBSettingsLoader__findNoteFromLoginSessionWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v12 = 0;
    int v6 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:&v12];
    id v7 = v12;

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F22688]];
      uint64_t v9 = [v8 BOOLValue];

      char v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F22690]];
      uint64_t v11 = [v10 BOOLValue];

      (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v9, v11);
    }
    else
    {
      _AXLogWithFacility();
      (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0);
    }
  }
  else
  {
    _AXLogWithFacility();
    (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0);
    id v7 = v5;
  }
}

+ (void)initialize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__AXSBSettingsLoader_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken_0 != -1) {
    dispatch_once(&initialize_onceToken_0, block);
  }
}

uint64_t __32__AXSBSettingsLoader_initialize__block_invoke()
{
  v0 = objc_alloc_init(AXSBSettingsLoader);
  v1 = (void *)_AXSettingsLoaderDelegate;
  _AXSettingsLoaderDelegate = (uint64_t)v0;

  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __32__AXSBSettingsLoader_initialize__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeDelayedSpringBoardSettings];
}

+ (void)_checkForDataResetFile
{
}

+ (void)_initializeDelayedSpringBoardSettings
{
  [a1 _updateSpringBoardHelper];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke;
  v17 = &__block_descriptor_40_e5_v8__0l;
  id v18 = a1;
  AXPerformBlockOnMainThreadAfterDelay();
  [a1 _registerForNotifications];
  if (_AXSVisualAlertEnabled() && _accessibilityHasCameraFlash()) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
  AXPerformBlockOnMainThreadAfterDelay();
  _accessibilityInitializeSpeakTypingServer();
  if (AXIsBuddyCompleted())
  {
    id v3 = (void *)_AXSTripleClickCopyOptions();
    if (_AXSTripleClickContainsOption())
    {
      id v4 = AXLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226EBC000, v4, OS_LOG_TYPE_DEFAULT, "Triple click buddy still in settings, need to remove", buf, 2u);
      }

      _AXSTripleClickRemoveOption();
    }
  }
  if (AXIsInternalInstall()) {
    NSLog(&cfstr_AxRegisteringF.isa);
  }
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:_AXSettingsLoaderDelegate selector:sel__updateAXSettings name:@"AccessibilitySettingsLoaderDidUpdateSettings" object:0];

  int v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:_AXSettingsLoaderDelegate selector:sel__updateAXSettings name:*MEMORY[0x263F8B0F0] object:0];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:_AXSettingsLoaderDelegate selector:sel__handleGuidedAccessManagedConfigurationDidChange_ name:*MEMORY[0x263F53B18] object:0];

  AXPerformBlockOnMainThreadAfterDelay();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)_AXSettingsLoaderDelegate, (CFNotificationCallback)_accessibilityTripleHomeEnabled, (CFStringRef)*MEMORY[0x263F8B3B8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v9 = [MEMORY[0x263F22808] sharedInstance];
  [v9 start];

  [(id)_AXSettingsLoaderDelegate _bootstrapSoundDetection];
  [a1 _registerForHomeButtonBreakage];
  [a1 _performValidations];
  char v10 = [MEMORY[0x263F47568] sharedUtilities];
  [v10 updateHearingFeatureUsage];

  if (AXDeviceHasJindo())
  {
    uint64_t v11 = [MEMORY[0x263F47528] sharedInstance];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_2_344;
    v12[3] = &__block_descriptor_40_e11_v20__0d8B16l;
    v12[4] = a1;
    [v11 registerListener:a1 forLiveListenLevelsHandler:v12];
  }
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _checkForDataResetFile];
  if (_AXSVoiceOverTouchEnabled()) {
    _AXSVoiceOverTouchSetEnabled();
  }
  if (_AXSAssistiveTouchEnabled()) {
    _AXSAssistiveTouchSetEnabled();
  }
  if (_AXSAssistiveTouchScannerEnabled()) {
    _AXSAssistiveTouchScannerSetEnabled();
  }
  if (_AXSCommandAndControlEnabled()) {
    _AXSCommandAndControlSetEnabled();
  }
  if (_AXSCommandAndControlCarPlayEnabled()) {
    _AXSCommandAndControlCarPlaySetEnabled();
  }
  if (_AXSFullKeyboardAccessEnabled()) {
    _AXSFullKeyboardAccessSetEnabled();
  }
  if (_AXSSpeakThisEnabled()) {
    _AXSSetSpeakThisEnabled();
  }
  if (_AXSWordFeedbackEnabled()) {
    _AXSSetWordFeedbackEnabled();
  }
  if (_AXSLetterFeedbackEnabled()) {
    _AXSSetLetterFeedbackEnabled();
  }
  if (_AXSPhoneticFeedbackEnabled()) {
    _AXSSetPhoneticFeedbackEnabled();
  }
  if (_AXSInvertColorsEnabled()) {
    _AXSInvertColorsSetEnabled();
  }
  _AXSHomeButtonRestingUnlock();
  _AXSPearlRestingUnlock();
  if (!_AXSHomeButtonRestingUnlockEverSet() && _AXSAssistiveTouchEnabled())
  {
    _AXSHomeButtonSetRestingUnlock();
    _AXLogWithFacility();
  }
  uint64_t result = AXDeviceIsMultiUser();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _findNoteFromLoginSessionWithCompletion:&__block_literal_global_323];
  }
  return result;
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_2(uint64_t a1, int a2, int a3)
{
  if (a2) {
    uint64_t result = _AXSVoiceOverTouchSetEnabled();
  }
  if (a3)
  {
    return _AXSZoomTouchSetEnabled();
  }
  return result;
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_4()
{
  return [(id)_AXSettingsLoaderDelegate _initializeRemoteSettingsListener];
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_338()
{
  return +[AXSBSettingsLoader bootstrapGuidedAccessIfNeeded];
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_2_344()
{
  return AXPerformBlockOnMainThread();
}

uint64_t __59__AXSBSettingsLoader__initializeDelayedSpringBoardSettings__block_invoke_3_345(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLiveListenEventIsListening:*(unsigned __int8 *)(a1 + 48) audioLevel:*(double *)(a1 + 40)];
}

+ (void)_handleLiveListenEventIsListening:(BOOL)a3 audioLevel:(double)a4
{
  BOOL v4 = a3;
  if (AXDeviceHasJindo())
  {
    if (!v4 || _handleLiveListenEventIsListening_audioLevel___IsLiveListenRunning)
    {
      if (!v4 && _handleLiveListenEventIsListening_audioLevel___IsLiveListenRunning) {
        [(id)_handleLiveListenEventIsListening_audioLevel___ActivityProxy finishWithCompletionHandler:&__block_literal_global_353];
      }
    }
    else
    {
      id v5 = (void *)_handleLiveListenEventIsListening_audioLevel___ActivityProxy;
      if (!_handleLiveListenEventIsListening_audioLevel___ActivityProxy)
      {
        int v6 = objc_alloc_init(_TtC27AXSpringBoardServerInstance20HearingActivityProxy);
        id v7 = (void *)_handleLiveListenEventIsListening_audioLevel___ActivityProxy;
        _handleLiveListenEventIsListening_audioLevel___ActivityProxy = (uint64_t)v6;

        id v5 = (void *)_handleLiveListenEventIsListening_audioLevel___ActivityProxy;
      }
      [v5 startWithCompletionHandler:&__block_literal_global_351];
    }
    _handleLiveListenEventIsListening_audioLevel___IsLiveListenRunning = v4;
  }
}

- (void)_ensureUltronAppVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x263EF8340];
  CFPreferencesSetAppValue(@"SBIconVisibility", (CFPropertyListRef)objc_msgSend(NSNumber, "numberWithBool:"), @"com.apple.imgaudio.UltronApp");
  CFPreferencesSynchronize(@"com.apple.imgaudio.UltronApp", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  notify_post("com.apple.springboard.appIconVisibilityPreferencesChanged");
  BOOL v4 = AXLogUltron();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_226EBC000, v4, OS_LOG_TYPE_DEFAULT, "Writing visiblity for ultron app: %d", (uint8_t *)v5, 8u);
  }
}

- (void)_bootstrapSoundDetection
{
  objc_initWeak(&location, self);
  BOOL v3 = [MEMORY[0x263F21DA0] sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__AXSBSettingsLoader__bootstrapSoundDetection__block_invoke;
  v4[3] = &unk_2647F14E8;
  objc_copyWeak(&v5, &location);
  [v3 registerUpdateBlock:v4 forRetrieveSelector:sel_ultronSupportEnabled withListener:self];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__AXSBSettingsLoader__bootstrapSoundDetection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x263F21DA0] sharedInstance];
  objc_msgSend(WeakRetained, "_ensureUltronAppVisibility:", objc_msgSend(v1, "ultronSupportEnabled"));
}

+ (void)_performValidations
{
  id v2 = [MEMORY[0x263F21400] sharedInstance];
  [v2 performValidations:&__block_literal_global_367_0 withPreValidationHandler:&__block_literal_global_384 postValidationHandler:0];
}

uint64_t __41__AXSBSettingsLoader__performValidations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"SpringBoard" hasInstanceVariable:@"_restartManager" withType:"SBRestartManager"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRestartManager", @"rebootForReason:", "v", "@", 0);

  return 1;
}

uint64_t __41__AXSBSettingsLoader__performValidations__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AXSBSettingsLoader"];
  [v2 setOverrideProcessName:@"AXSBSettingsLoader"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

+ (void)_registerForHomeButtonBreakageNotification
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F213B8] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    BOOL v4 = [MEMORY[0x263F213B8] identifier];
    id v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = AXColorizeFormatLog();
      char v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_226EBC000, v5, v6, "%{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  io_object_t notification = 0;
  v22[0] = @"DeviceUsagePage";
  v22[1] = @"DeviceUsage";
  *(void *)&long long buf = &unk_26DB20310;
  *((void *)&buf + 1) = &unk_26DB20328;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:&buf forKeys:v22 count:2];
  v17 = deviceUsagePairs(v9, v10, v11, v12, v13, v14, v15, v16, 0);
  v22[0] = @"DeviceUsagePairs";
  *(void *)&long long buf = v17;
  id v18 = [NSDictionary dictionaryWithObjects:&buf forKeys:v22 count:1];
  v19 = (void *)[v18 mutableCopy];

  [v19 setObject:@"AppleSPUHIDDevice" forKey:@"IOProviderClass"];
  LODWORD(v18) = *MEMORY[0x263F0EC88];
  LODWORD(v19) = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], (CFDictionaryRef)v19);
  v20 = IONotificationPortCreate((mach_port_t)v18);
  IOServiceAddInterestNotification(v20, (io_service_t)v19, "IOGeneralInterest", (IOServiceInterestCallback)_homeButtonBreakageMessageHandler, 0, &notification);
  IONotificationPortSetDispatchQueue(v20, MEMORY[0x263EF83A0]);
}

+ (BOOL)_alreadyRebootedGracefullyOnce
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"AXBrokenHomeButtonAlreadyRebootedOnce"];

  return v3;
}

+ (void)_setRebootedGracefullyOnce
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F213B8] sharedInstance];
  char v3 = [v2 ignoreLogging];

  if ((v3 & 1) == 0)
  {
    BOOL v4 = [MEMORY[0x263F213B8] identifier];
    id v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = AXColorizeFormatLog();
      char v8 = _AXStringForArgs();
      if (os_log_type_enabled(v5, v6))
      {
        int v11 = 138543362;
        uint64_t v12 = v8;
        _os_log_impl(&dword_226EBC000, v5, v6, "%{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  uint64_t v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v9 setBool:1 forKey:@"AXBrokenHomeButtonAlreadyRebootedOnce"];

  uint64_t v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v10 synchronize];
}

+ (void)_gracefulRebootForBrokenHomeButton
{
  [a1 _setRebootedGracefullyOnce];
  AnalyticsSendEventLazy();
  AXPerformBlockOnMainThreadAfterDelay();
}

void *__56__AXSBSettingsLoader__gracefulRebootForBrokenHomeButton__block_invoke()
{
  return &unk_26DB20520;
}

uint64_t __56__AXSBSettingsLoader__gracefulRebootForBrokenHomeButton__block_invoke_2()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F213B8] sharedInstance];
  char v1 = [v0 ignoreLogging];

  if ((v1 & 1) == 0)
  {
    id v2 = [MEMORY[0x263F213B8] identifier];
    char v3 = AXLoggerForFacility();

    os_log_type_t v4 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = AXColorizeFormatLog();
      os_log_type_t v6 = _AXStringForArgs();
      if (os_log_type_enabled(v3, v4))
      {
        int v8 = 138543362;
        uint64_t v9 = v6;
        _os_log_impl(&dword_226EBC000, v3, v4, "%{public}@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  return AXPerformSafeBlock();
}

void __56__AXSBSettingsLoader__gracefulRebootForBrokenHomeButton__block_invoke_424()
{
  id v0 = [(id)*MEMORY[0x263F83300] safeValueForKey:@"_restartManager"];
  [v0 rebootForReason:@"MESA FAILURE: Home button broke, rebooting"];
}

+ (void)_startAssistiveTouchForBrokenHomeButton
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (_AXSAssistiveTouchEnabled())
  {
    id v2 = [MEMORY[0x263F213B8] sharedInstance];
    char v3 = [v2 ignoreLogging];

    if (v3) {
      return;
    }
    os_log_type_t v4 = [MEMORY[0x263F213B8] identifier];
    id v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (!os_log_type_enabled(v5, v6)) {
      goto LABEL_17;
    }
    id v7 = AXColorizeFormatLog();
    int v8 = _AXStringForArgs();
    if (!os_log_type_enabled(v5, v6)) {
      goto LABEL_16;
    }
    int v16 = 138543362;
    v17 = v8;
    goto LABEL_15;
  }
  if (UIAccessibilityIsSwitchControlRunning())
  {
    uint64_t v9 = +[AXSpringBoardServerHelper sharedServerHelper];
    [v9 handleBrokenHomeButtonAlert];

    uint64_t v10 = [MEMORY[0x263F213B8] sharedInstance];
    char v11 = [v10 ignoreLogging];

    if (v11) {
      return;
    }
    uint64_t v12 = [MEMORY[0x263F213B8] identifier];
    id v5 = AXLoggerForFacility();

    os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
    if (!os_log_type_enabled(v5, v6)) {
      goto LABEL_17;
    }
    id v7 = AXColorizeFormatLog();
    int v8 = _AXStringForArgs();
    if (!os_log_type_enabled(v5, v6)) {
      goto LABEL_16;
    }
    int v16 = 138543362;
    v17 = v8;
    goto LABEL_15;
  }
  _AXSAssistiveTouchSetRepairIncarnationModeEnabled();
  uint64_t v13 = [MEMORY[0x263F213B8] sharedInstance];
  char v14 = [v13 ignoreLogging];

  if (v14) {
    return;
  }
  uint64_t v15 = [MEMORY[0x263F213B8] identifier];
  id v5 = AXLoggerForFacility();

  os_log_type_t v6 = AXOSLogLevelFromAXLogLevel();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = AXColorizeFormatLog();
    int v8 = _AXStringForArgs();
    if (!os_log_type_enabled(v5, v6))
    {
LABEL_16:

      goto LABEL_17;
    }
    int v16 = 138543362;
    v17 = v8;
LABEL_15:
    _os_log_impl(&dword_226EBC000, v5, v6, "%{public}@", (uint8_t *)&v16, 0xCu);
    goto LABEL_16;
  }
LABEL_17:
}

+ (void)_checkForHomeButtonBreakage:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v48 = *MEMORY[0x263EF8340];
  mach_port_t mainPort = 0;
  MEMORY[0x22A66DD80](*MEMORY[0x263EF87F0], &mainPort);
  io_iterator_t existing = 0;
  CFDictionaryRef v5 = IOServiceMatching("AppleSPUHIDDevice");
  IOServiceGetMatchingServices(mainPort, v5, &existing);
  io_object_t v6 = IOIteratorNext(existing);
  if (v6)
  {
    io_registry_entry_t v7 = v6;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    while (1)
    {
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v7, @"button-err-state", v8, 0);
      if (CFProperty)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
      IOObjectRelease(v7);

      io_registry_entry_t v7 = IOIteratorNext(existing);
      if (!v7) {
        goto LABEL_6;
      }
    }
    unsigned int v10 = [CFProperty BOOLValue];
    char v11 = [MEMORY[0x263F213B8] sharedInstance];
    char v12 = [v11 ignoreLogging];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [MEMORY[0x263F213B8] identifier];
      char v14 = AXLoggerForFacility();

      os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        int v16 = AXColorizeFormatLog();
        uint64_t v40 = v10;
        v17 = _AXStringForArgs();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)long long buf = 138543362;
          v47 = v17;
          _os_log_impl(&dword_226EBC000, v14, v15, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
LABEL_6:
    unsigned int v10 = 0;
  }
  unsigned int v18 = objc_msgSend(a1, "_alreadyRebootedGracefullyOnce", v40);
  v19 = [MEMORY[0x263F213B8] sharedInstance];
  char v20 = [v19 ignoreLogging];

  if ((v20 & 1) == 0)
  {
    v21 = [MEMORY[0x263F213B8] identifier];
    v22 = AXLoggerForFacility();

    os_log_type_t v23 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = AXColorizeFormatLog();
      BOOL v42 = v3;
      uint64_t v43 = v18;
      uint64_t v41 = v10;
      v25 = _AXStringForArgs();
      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)long long buf = 138543362;
        v47 = v25;
        _os_log_impl(&dword_226EBC000, v22, v23, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (v10)
  {
    if ((v3 | v18) == 1)
    {
      [a1 _startAssistiveTouchForBrokenHomeButton];
      AXPerformBlockOnMainThreadAfterDelay();
    }
    else
    {
      [a1 _gracefulRebootForBrokenHomeButton];
    }
  }
  else if (_AXSAssistiveTouchRepairIncarnationModeEnabled())
  {
    v26 = [MEMORY[0x263F213B8] sharedInstance];
    char v27 = [v26 ignoreLogging];

    if ((v27 & 1) == 0)
    {
      v28 = [MEMORY[0x263F213B8] identifier];
      v29 = AXLoggerForFacility();

      os_log_type_t v30 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = AXColorizeFormatLog();
        v32 = _AXStringForArgs();
        if (os_log_type_enabled(v29, v30))
        {
          *(_DWORD *)long long buf = 138543362;
          v47 = v32;
          _os_log_impl(&dword_226EBC000, v29, v30, "%{public}@", buf, 0xCu);
        }
      }
    }
    _AXSAssistiveTouchSetRepairIncarnationModeEnabled();
  }
  v33 = objc_msgSend(MEMORY[0x263F213B8], "sharedInstance", v41, v42, v43);
  char v34 = [v33 ignoreLogging];

  if ((v34 & 1) == 0)
  {
    v35 = [MEMORY[0x263F213B8] identifier];
    v36 = AXLoggerForFacility();

    os_log_type_t v37 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = AXColorizeFormatLog();
      _AXSAssistiveTouchRepairIncarnationModeEnabled();
      v39 = _AXStringForArgs();
      if (os_log_type_enabled(v36, v37))
      {
        *(_DWORD *)long long buf = 138543362;
        v47 = v39;
        _os_log_impl(&dword_226EBC000, v36, v37, "%{public}@", buf, 0xCu);
      }
    }
  }
}

uint64_t __50__AXSBSettingsLoader__checkForHomeButtonBreakage___block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v0 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v1 = [v0 brokenHomeButtonCount] + 1;

  id v2 = [MEMORY[0x263F22938] sharedInstance];
  [v2 setBrokenHomeButtonCount:v1];

  BOOL v3 = [MEMORY[0x263F213B8] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    CFDictionaryRef v5 = [MEMORY[0x263F213B8] identifier];
    io_object_t v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      CFAllocatorRef v8 = AXColorizeFormatLog();
      uint64_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)long long buf = 138543362;
        char v12 = v9;
        _os_log_impl(&dword_226EBC000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  return AnalyticsSendEventLazy();
}

id __50__AXSBSettingsLoader__checkForHomeButtonBreakage___block_invoke_457()
{
  v6[1] = *MEMORY[0x263EF8340];
  CFDictionaryRef v5 = @"resetCount";
  id v0 = NSNumber;
  uint64_t v1 = [MEMORY[0x263F22938] sharedInstance];
  id v2 = objc_msgSend(v0, "numberWithInteger:", objc_msgSend(v1, "brokenHomeButtonCount"));
  v6[0] = v2;
  BOOL v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (void)_registerForHomeButtonBreakage
{
  if (MGGetBoolAnswer())
  {
    [a1 _registerForHomeButtonBreakageNotification];
    [a1 _checkForHomeButtonBreakage:1];
  }
}

- (void)_handleGuidedAccessManagedConfigurationDidChange:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __71__AXSBSettingsLoader__handleGuidedAccessManagedConfigurationDidChange___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F21398]);
    uint64_t v4 = [v3 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    uint64_t v5 = *(void *)(a1 + 32);
    io_object_t v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  [v2 cancel];
  os_log_type_t v7 = *(void **)(*(void *)(a1 + 32) + 24);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__AXSBSettingsLoader__handleGuidedAccessManagedConfigurationDidChange___block_invoke_2;
  v8[3] = &unk_2647F0648;
  id v9 = *(id *)(a1 + 40);
  [v7 afterDelay:v8 processBlock:0.5];
}

uint64_t __71__AXSBSettingsLoader__handleGuidedAccessManagedConfigurationDidChange___block_invoke_2()
{
  _AXLogWithFacility();
  return +[AXSBSettingsLoader bootstrapGuidedAccessIfNeeded];
}

+ (void)bootstrapGuidedAccessIfNeeded
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!_AXSGuidedAccessEnabledByManagedConfiguration())
  {
    id v2 = [MEMORY[0x263F53C50] sharedConnection];
    id v3 = [v2 effectiveWhitelistedAppsAndOptions];

    uint64_t v4 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v5 = [v4 autonomousSingleAppModePermittedBundleIDs];

    if ([v3 count] || objc_msgSend(v5, "count"))
    {
      io_object_t v6 = GAXLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 138543618;
        id v9 = v3;
        __int16 v10 = 2114;
        char v11 = v5;
        _os_log_impl(&dword_226EBC000, v6, OS_LOG_TYPE_INFO, "allowedApps (%{public}@) or appSelfLockIDs (%{public}@) exist. WIll enable GAX (Single App Mode) now", (uint8_t *)&v8, 0x16u);
      }

      _AXSGuidedAccessSetEnabledByManagedConfiguration();
    }
    else
    {
      os_log_type_t v7 = GAXLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_226EBC000, v7, OS_LOG_TYPE_INFO, "allowedApps and appSelfLockIDs both nil.  No need to enable GAX (Single App Mode)", (uint8_t *)&v8, 2u);
      }
    }
  }
}

- (AXSBSettingsLoader)init
{
  v10.receiver = self;
  v10.super_class = (Class)AXSBSettingsLoader;
  id v2 = [(AXSBSettingsLoader *)&v10 init];
  if (v2)
  {
    id v3 = (AXAssetsService *)objc_alloc_init(MEMORY[0x263F21150]);
    assetsService = v2->_assetsService;
    v2->_assetsService = v3;

    AXPerformBlockOnMainThreadAfterDelay();
    id v9 = v2;
    AXPerformBlockOnMainThreadAfterDelay();
    int v8 = v9;
    AXPerformBlockOnMainThreadAfterDelay();
    os_log_type_t v7 = v8;
    AXPerformBlockOnMainThreadAfterDelay();
    uint64_t v5 = v7;
  }
  return v2;
}

id __26__AXSBSettingsLoader_init__block_invoke()
{
  id v0 = AXLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_226EBC000, v0, OS_LOG_TYPE_INFO, "Initializing AXSpeechAssetMonitorHelper so that we check for assets if we need to.", v2, 2u);
  }

  return (id)[MEMORY[0x263F21DB0] sharedInstance];
}

void __26__AXSBSettingsLoader_init__block_invoke_482(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  if ((unint64_t)[v2 physicalMemory] <= 0x773593FF) {
    goto LABEL_4;
  }
  int v3 = AXRuntimeCheck_HasANE();

  if (v3)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
    id v2 = [MEMORY[0x263F21178] policy];
    [v4 updateAssetForPolicy:v2];
LABEL_4:
  }
  uint64_t v5 = [MEMORY[0x263F08AB0] processInfo];
  if ((unint64_t)[v5 physicalMemory] > 0x773593FF && AXRuntimeCheck_HasANE())
  {
  }
  else
  {
    io_object_t v6 = [MEMORY[0x263F08AB0] processInfo];
    if ((unint64_t)[v6 physicalMemory] <= 0x773593FF)
    {

      goto LABEL_12;
    }
    int v7 = AXRuntimeCheck_HasANE();

    if (!v7) {
      goto LABEL_13;
    }
  }
  int v8 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = [MEMORY[0x263F21168] policy];
  [v8 updateAssetForPolicy:v5];
LABEL_12:

LABEL_13:
  id v9 = *(void **)(*(void *)(a1 + 32) + 32);
  id v10 = [MEMORY[0x263F21170] policy];
  [v9 updateAssetForPolicy:v10];
}

void __26__AXSBSettingsLoader_init__block_invoke_488(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32);
  id v2 = [MEMORY[0x263F21180] policy];
  [v1 updateAssetForPolicy:v2];
}

- (void)dealloc
{
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  managedConfigurationNotificationCoalesceTimer = self->_managedConfigurationNotificationCoalesceTimer;
  self->_managedConfigurationNotificationCoalesceTimer = 0;

  v6.receiver = self;
  v6.super_class = (Class)AXSBSettingsLoader;
  [(AXSBSettingsLoader *)&v6 dealloc];
}

- (void)_initializeRemoteSettingsListener
{
  if ([(AXSBSettingsLoader *)self _isDeviceAffectedByVOActivationWorkaround])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_voiceOverVibrateEnable, (CFStringRef)*MEMORY[0x263F22710], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_voiceOverSwipeEnable, (CFStringRef)*MEMORY[0x263F22718], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel__remoteAccessibilitySettingsChanged_ name:*MEMORY[0x263F255E8] object:0];

    objc_super v6 = [MEMORY[0x263F255C8] sharedInstance];
    [v6 registerNetworkDefaultsForAppID:@"com.apple.accessibility.remote"];

    _AXLogWithFacility();
  }
  [(AXSBSettingsLoader *)self _updateRemoteAccessibilitySettings];
}

- (void)_voiceOverEnabled:(id)a3
{
  if (_AXSVoiceOverTouchEnabled())
  {
    [(AXSBSettingsLoader *)self _hideVoiceOverEnabler];
  }
}

- (void)_hideVoiceOverEnabler
{
  uint64_t v5 = [MEMORY[0x263F08B88] callStackSymbols];
  LOBYTE(v4) = 1;
  _AXLogWithFacility();

  [(AXAccessQueueTimer *)self->_voiceOverActivationCanceler cancel];
  if (!_AXSVoiceOverTouchEnabled()) {
    [(AXSBSettingsLoader *)self _playVOActivationSoundEnded];
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__AXSBSettingsLoader__hideVoiceOverEnabler__block_invoke;
  v7[3] = &unk_2647F0648;
  v7[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __43__AXSBSettingsLoader__hideVoiceOverEnabler__block_invoke_2;
  v6[3] = &unk_2647F0FF8;
  void v6[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v7 animations:v6 completion:0.25];
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F8B3F0] object:0];
}

void __43__AXSBSettingsLoader__hideVoiceOverEnabler__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v3 = [v2 voiceOverActivationWorkaround];

  if (v3 == 2)
  {
    char v14 = *(void **)(*(void *)(a1 + 32) + 8);
    [v14 setAlpha:0.0];
  }
  else if (v3 == 1)
  {
    uint64_t v4 = objc_getAssociatedObject(*(id *)(*(void *)(a1 + 32) + 8), &AXActivationRotationKey);
    uint64_t v5 = (int)[v4 intValue];

    [*(id *)(*(void *)(a1 + 32) + 8) frame];
    double v9 = v8;
    double v11 = v10;
    CGFloat v12 = v6;
    CGFloat v13 = v7;
    switch(v5)
    {
      case 1:
        double v11 = v7;
        break;
      case 2:
        double v11 = -v7;
        break;
      case 3:
        double v9 = -v6;
        break;
      case 4:
        double v9 = v6;
        break;
      default:
        break;
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setFrame:", v9, v11, v6, v7);
    v17.origin.x = v9;
    v17.origin.y = v11;
    v17.size.width = v12;
    v17.size.height = v13;
    NSStringFromCGRect(v17);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    _AXLogWithFacility();
  }
}

uint64_t __43__AXSBSettingsLoader__hideVoiceOverEnabler__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;

  return _AXLogWithFacility();
}

- (void)_makeVoiceOverVibrateWindow
{
  id v3 = objc_allocWithZone(MEMORY[0x263F82E88]);
  uint64_t v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 bounds];
  uint64_t v5 = (UIWindow *)objc_msgSend(v3, "initWithContentRect:");

  [(UIWindow *)v5 setWindowLevel:10000013.0];
  [(UIWindow *)v5 setOpaque:0];
  [(UIWindow *)v5 setAlpha:1.0];
  double v6 = [MEMORY[0x263F825C8] clearColor];
  [(UIWindow *)v5 setBackgroundColor:v6];

  id v7 = objc_allocWithZone(MEMORY[0x263F82E00]);
  [(UIWindow *)v5 bounds];
  id v10 = (id)objc_msgSend(v7, "initWithFrame:");
  double v8 = [MEMORY[0x263F825C8] clearColor];
  [v10 setBackgroundColor:v8];

  [v10 setAlpha:1.0];
  [v10 setUserInteractionEnabled:0];
  [v10 setOpaque:0];
  [(UIWindow *)v5 setContentView:v10];
  voiceOverVibrateWindow = self->_voiceOverVibrateWindow;
  self->_voiceOverVibrateWindow = v5;
}

- (void)_playVOActivationSoundEnded
{
  v3[1] = *MEMORY[0x263EF8340];
  if (_playVOActivationSoundEnded_onceToken != -1) {
    dispatch_once(&_playVOActivationSoundEnded_onceToken, &__block_literal_global_516);
  }
  uint64_t v2 = *MEMORY[0x263EFC0F0];
  v3[0] = &unk_26DB20340;
  [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  AudioServicesPlaySystemSoundWithOptions();
}

void __49__AXSBSettingsLoader__playVOActivationSoundEnded__block_invoke()
{
  id v0 = objc_allocWithZone(NSURL);
  uint64_t v1 = NSString;
  uint64_t v2 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/CoreServices/VoiceOverTouch.app"];
  id v3 = [v2 resourcePath];
  uint64_t v4 = [v1 stringWithFormat:@"%@/%@", v3, @"Sounds/FolderClosed.aiff"];
  CFURLRef inFileURL = (const __CFURL *)[v0 initFileURLWithPath:v4 isDirectory:0];

  AudioServicesCreateSystemSoundID(inFileURL, (SystemSoundID *)&_playVOActivationSoundEnded_SoundID);
}

- (void)_playVOActivationSoundStarted
{
  v3[1] = *MEMORY[0x263EF8340];
  if (_playVOActivationSoundStarted_onceToken != -1) {
    dispatch_once(&_playVOActivationSoundStarted_onceToken, &__block_literal_global_530);
  }
  uint64_t v2 = *MEMORY[0x263EFC0F0];
  v3[0] = &unk_26DB20340;
  [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  AudioServicesPlaySystemSoundWithOptions();
}

void __51__AXSBSettingsLoader__playVOActivationSoundStarted__block_invoke()
{
  id v0 = objc_allocWithZone(NSURL);
  uint64_t v1 = NSString;
  uint64_t v2 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/CoreServices/VoiceOverTouch.app"];
  id v3 = [v2 resourcePath];
  uint64_t v4 = [v1 stringWithFormat:@"%@/%@", v3, @"Sounds/FolderOpened.aiff"];
  CFURLRef inFileURL = (const __CFURL *)[v0 initFileURLWithPath:v4 isDirectory:0];

  AudioServicesCreateSystemSoundID(inFileURL, (SystemSoundID *)&_playVOActivationSoundStarted_SoundID);
}

- (void)swipeDetectorDetectedSwipe
{
  if (!_AXSApplicationAccessibilityEnabled()) {
    _AXSApplicationAccessibilitySetEnabled();
  }
  _AXSVoiceOverTouchSetEnabled();
  [(AXSBSettingsLoader *)self _hideVoiceOverEnabler];
}

- (void)_showSwipeDetectionEnablerView
{
  if (!self->_voiceOverVibrateWindow)
  {
    [(AXSBSettingsLoader *)self _playVOActivationSoundStarted];
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__voiceOverEnabled_ name:*MEMORY[0x263F8B3F0] object:0];

    [(AXSBSettingsLoader *)self _makeVoiceOverVibrateWindow];
    uint64_t v4 = [(id)*MEMORY[0x263F83300] safeIntegerForKey:@"activeInterfaceOrientation"];
    voiceOverVibrateWindow = self->_voiceOverVibrateWindow;
    double v6 = [NSNumber numberWithInteger:v4];
    objc_setAssociatedObject(voiceOverVibrateWindow, &AXActivationRotationKey, v6, (void *)1);

    id v7 = [(UIWindow *)self->_voiceOverVibrateWindow subviews];
    double v8 = [v7 lastObject];

    [v8 setUserInteractionEnabled:1];
    double v9 = [AXSBVoiceOverSwipeDetectorView alloc];
    [v8 bounds];
    id v10 = -[AXSBVoiceOverSwipeDetectorView initWithFrame:](v9, "initWithFrame:");
    [v8 addSubview:v10];
    [(AXSBVoiceOverSwipeDetectorView *)v10 setDelegate:self];
    [(UIWindow *)self->_voiceOverVibrateWindow frame];
    double v14 = v13;
    double v16 = v15;
    double v17 = v12;
    switch(v4)
    {
      case 1:
        double v14 = v12;
        goto LABEL_4;
      case 2:
        double v14 = -v12;
        double v18 = 565.486678;
        break;
      case 3:
        [(AXSBVoiceOverSwipeDetectorView *)v10 bounds];
        -[AXSBVoiceOverSwipeDetectorView setBounds:](v10, "setBounds:");
        -[AXSBVoiceOverSwipeDetectorView setCenter:](v10, "setCenter:", 1.0, 0.0);
        double v11 = -v16;
        double v18 = 282.743339;
        break;
      case 4:
        [(AXSBVoiceOverSwipeDetectorView *)v10 frame];
        -[AXSBVoiceOverSwipeDetectorView setFrame:](v10, "setFrame:");
        double v18 = -282.743339;
        double v11 = v16;
        break;
      default:
LABEL_4:
        double v18 = 0.0;
        break;
    }
    -[UIWindow setFrame:](self->_voiceOverVibrateWindow, "setFrame:", v11, v14, v16, v17);
    long long v19 = *MEMORY[0x263F000D0];
    long long v20 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&v29.c = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v29.tx = v20;
    *(_OWORD *)&v28.a = v19;
    *(_OWORD *)&v28.c = *(_OWORD *)&v29.c;
    *(_OWORD *)&v28.tx = v20;
    *(_OWORD *)&v29.a = v19;
    [(AXSBVoiceOverSwipeDetectorView *)v10 setTransform:&v28];
    CGAffineTransformMakeRotation(&v29, v18 / 180.0);
    CGAffineTransform v27 = v29;
    UIIntegralTransform();
    CGAffineTransform v29 = v28;
    [(AXSBVoiceOverSwipeDetectorView *)v10 setTransform:&v28];
    [(AXSBVoiceOverSwipeDetectorView *)v10 frame];
    if ((unint64_t)(v4 - 2) < 3)
    {
      double v21 = 0.0;
      double v22 = 0.0;
    }
    -[AXSBVoiceOverSwipeDetectorView setFrame:](v10, "setFrame:", v21, v22);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __52__AXSBSettingsLoader__showSwipeDetectionEnablerView__block_invoke;
    v26[3] = &unk_2647F0700;
    v26[4] = self;
    v26[5] = v4;
    [MEMORY[0x263F82E00] animateWithDuration:v26 animations:0.25];
    voiceOverActivationCanceler = self->_voiceOverActivationCanceler;
    double v24 = *MEMORY[0x263F22780];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __52__AXSBSettingsLoader__showSwipeDetectionEnablerView__block_invoke_2;
    v25[3] = &unk_2647F0648;
    v25[4] = self;
    [(AXAccessQueueTimer *)voiceOverActivationCanceler afterDelay:v25 processBlock:v24];
  }
}

void __52__AXSBSettingsLoader__showSwipeDetectionEnablerView__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) frame];
  double v5 = v4;
  double v7 = v6;
  CGFloat v8 = v2;
  CGFloat v9 = v3;
  switch(*(void *)(a1 + 40))
  {
    case 1:
    case 2:
      double v7 = 0.0;
      break;
    case 3:
    case 4:
      double v5 = 0.0;
      break;
    default:
      break;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setFrame:", v5, v7, v2, v3);
  v12.origin.x = v5;
  v12.origin.y = v7;
  v12.size.width = v8;
  v12.size.height = v9;
  NSStringFromCGRect(v12);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  _AXLogWithFacility();
}

uint64_t __52__AXSBSettingsLoader__showSwipeDetectionEnablerView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideVoiceOverEnabler];
}

- (void)_showVibrationVoiceOverEnablerView
{
  if (!self->_voiceOverVibrateWindow)
  {
    [(AXSBSettingsLoader *)self _playVOActivationSoundStarted];
    double v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__voiceOverEnabled_ name:*MEMORY[0x263F8B3F0] object:0];

    [(AXSBSettingsLoader *)self _makeVoiceOverVibrateWindow];
    double v4 = [(UIWindow *)self->_voiceOverVibrateWindow subviews];
    double v5 = [v4 lastObject];

    double v6 = [AXSBVoiceOverShakeMessage alloc];
    double v7 = -[AXSBVoiceOverShakeMessage initWithFrame:](v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AXSBVoiceOverShakeMessage *)v7 setAlpha:0.0];
    [v5 addSubview:v7];
    CGFloat v8 = (void *)MEMORY[0x263F82E00];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __56__AXSBSettingsLoader__showVibrationVoiceOverEnablerView__block_invoke;
    v13[3] = &unk_2647F0648;
    double v14 = v7;
    CGFloat v9 = v7;
    [v8 animateWithDuration:v13 animations:0.25];
    voiceOverActivationCanceler = self->_voiceOverActivationCanceler;
    double v11 = *MEMORY[0x263F22780];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __56__AXSBSettingsLoader__showVibrationVoiceOverEnablerView__block_invoke_2;
    v12[3] = &unk_2647F0648;
    v12[4] = self;
    [(AXAccessQueueTimer *)voiceOverActivationCanceler afterDelay:v12 processBlock:v11];
  }
}

uint64_t __56__AXSBSettingsLoader__showVibrationVoiceOverEnablerView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __56__AXSBSettingsLoader__showVibrationVoiceOverEnablerView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideVoiceOverEnabler];
}

- (BOOL)_isDeviceAffectedByVOActivationWorkaround
{
  return 0;
}

- (void)_reachabilityChanged:(id)a3
{
  double v3 = [a3 userInfo];
  double v4 = [v3 objectForKey:*MEMORY[0x263F25550]];
  int v5 = [v4 BOOLValue];

  _AXLogWithFacility();
  if (v5) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __43__AXSBSettingsLoader__reachabilityChanged___block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x263F255C8] sharedInstance];
  unsigned int v3 = [v2 registerNetworkDefaultsForAppIDs:&unk_26DB203A0 forceUpdate:1];

  LOBYTE(v4) = 1;
  _AXLogWithFacility();
  objc_msgSend(MEMORY[0x263F255C0], "sharedNetworkObserver", v4, @"VOWORK: force registration again: %d", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 removeObserver:*(void *)(a1 + 32) forHostname:@"configuration.apple.com"];
}

- (void)_registerReachability
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__AXSBSettingsLoader__registerReachability__block_invoke;
  block[3] = &unk_2647F0648;
  block[4] = self;
  if (_registerReachability_onceToken[0] != -1) {
    dispatch_once(_registerReachability_onceToken, block);
  }
}

void __43__AXSBSettingsLoader__registerReachability__block_invoke(uint64_t a1)
{
  unsigned int v3 = [MEMORY[0x263F08B88] callStackSymbols];
  LOBYTE(v2) = 1;
  _AXLogWithFacility();

  id v4 = [MEMORY[0x263F255C0] sharedNetworkObserver:v2, @"VOWORK: register for reachability changed %@", v3];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__reachabilityChanged_ forHostname:@"configuration.apple.com"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsService, 0);
  objc_storeStrong((id *)&self->_managedConfigurationNotificationCoalesceTimer, 0);
  objc_storeStrong((id *)&self->_voiceOverActivationCanceler, 0);
  objc_storeStrong((id *)&self->_voiceOverVibrateWindow, 0);
}

@end