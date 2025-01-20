@interface AXPISystemActionHelper
+ (id)sharedInstance;
- (AXPISystemActionHelper)init;
- (BOOL)_hasScreenSwitch;
- (BOOL)isRingerSwitchOn;
- (void)_activateSpeakScreen;
- (void)_cameraAction:(BOOL)a3;
- (void)_handleHomeButtonDispatch:(BOOL)a3;
- (void)_openCamera:(BOOL)a3;
- (void)_performScrollAction:(BOOL)a3;
- (void)_sendButtonEvent:(unsigned int)a3;
- (void)_sendButtonEvent:(unsigned int)a3 postHIDEventDirectly:(BOOL)a4;
- (void)_sendDeviceOrientationChange:(int64_t)a3;
- (void)_sendShakeEvent;
- (void)_showAlertForReboot;
- (void)_toggleAssistiveTouch;
- (void)_toggleClassicInvertColors;
- (void)_toggleColorFilters;
- (void)_toggleFullKeyboardAccess;
- (void)_toggleHoverTextTyping;
- (void)_toggleSmartInvert;
- (void)_toggleSwitchControl;
- (void)_toggleVoiceOver;
- (void)_toggleZoom;
- (void)_toggleZoomController;
- (void)activateDetectionMode;
- (void)activateHomeButton;
- (void)activateLockButton;
- (void)activateMagnifierFromStaccato;
- (void)activateSOSMode;
- (void)activateSiri;
- (void)activateSiriFromClient:(id)a3;
- (void)activateTripleClick;
- (void)activateTypeToSiri;
- (void)activateVoiceControl;
- (void)adjustSystemZoom:(int64_t)a3;
- (void)armApplePay;
- (void)confirmApplePay;
- (void)decreaseVolume;
- (void)doubleLightPressCameraButton;
- (void)hideSpotlight;
- (void)increaseVolume;
- (void)liftHomeButtonUp;
- (void)liftLockButtonUp;
- (void)liftTVMenuButtonUp;
- (void)liftTVSelectButtonUp;
- (void)liftVolumeDownButtonUp;
- (void)liftVolumeUpButtonUp;
- (void)lightPressCameraButton;
- (void)openVisualIntelligence;
- (void)performActionForSystemAction:(id)a3;
- (void)performActionForSystemAction:(id)a3 fromClient:(id)a4;
- (void)performSysdiagnoseWithStatusUpdateHandler:(id)a3;
- (void)pressCameraButton;
- (void)pressHomeButtonDown;
- (void)pressLockButtonDown;
- (void)pressStaccato;
- (void)pressTVMenuButton;
- (void)pressTVMenuButtonDown;
- (void)pressTVSelectButton;
- (void)pressTVSelectButtonDown;
- (void)pressVolumeDownButtonDown;
- (void)pressVolumeUpButtonDown;
- (void)rebootDevice;
- (void)revealSpotlight;
- (void)rotateLeft;
- (void)rotatePortrait;
- (void)rotateRight;
- (void)rotateUpsideDown;
- (void)shake;
- (void)startMagnifier;
- (void)takeScreenshot;
- (void)toggleAppLibrary;
- (void)toggleAppSwitcher;
- (void)toggleAssistiveAccess;
- (void)toggleBackgroundSounds;
- (void)toggleCommandAndControl;
- (void)toggleControlCenter;
- (void)toggleDock;
- (void)toggleLiveCaptions;
- (void)toggleLiveSpeech;
- (void)toggleMute;
- (void)toggleNearbyDeviceControlPicker;
- (void)toggleNotificationCenter;
- (void)toggleQuickNote;
- (void)toggleReachability;
- (void)toggleRingerSwitch:(BOOL)a3;
- (void)toggleSpotlight;
- (void)toggleTorch;
- (void)toggleWatchRemoteScreen;
- (void)turnDigitalCrown:(int64_t)a3;
- (void)turnDigitalCrownFullRevolution:(BOOL)a3;
- (void)warm;
@end

@implementation AXPISystemActionHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance__shared_0;
  return v2;
}

uint64_t __40__AXPISystemActionHelper_sharedInstance__block_invoke()
{
  sharedInstance__shared_0 = objc_alloc_init(AXPISystemActionHelper);
  return MEMORY[0x270F9A758]();
}

- (AXPISystemActionHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXPISystemActionHelper;
  v2 = [(AXPISystemActionHelper *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXPISystemActionHelperSysdiagnoseCancelCountQueue", 0);
    sysdiagnoseCancelCountQueue = v2->_sysdiagnoseCancelCountQueue;
    v2->_sysdiagnoseCancelCountQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)activateSiri
{
}

- (void)activateSiriFromClient:(id)a3
{
  id v3 = a3;
  id v6 = objc_alloc_init((Class)getSiriSimpleActivationSourceClass());
  int v4 = [v3 isEqualToString:@"AXPISystemActionHelperClientBackTap"];

  if (v4) {
    uint64_t v5 = 33;
  }
  else {
    uint64_t v5 = 27;
  }
  [v6 activateFromSource:v5];
}

- (void)activateTypeToSiri
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 openTypeToSiri];
}

- (void)activateVoiceControl
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 openVoiceControl];
}

- (void)activateHomeButton
{
  if ([MEMORY[0x263F22858] isAvailable])
  {
    id v3 = [MEMORY[0x263F22858] server];
    [v3 goHome];
  }
  else
  {
    [(AXPISystemActionHelper *)self pressHomeButtonDown];
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __44__AXPISystemActionHelper_activateHomeButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) liftHomeButtonUp];
}

- (void)pressHomeButtonDown
{
}

- (void)liftHomeButtonUp
{
}

- (void)toggleReachability
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 toggleReachability];
}

- (void)toggleCommandAndControl
{
  BOOL v2 = _AXSCommandAndControlEnabled() == 0;
  MEMORY[0x270F906C8](v2);
}

- (void)armApplePay
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 armApplePay];
}

- (void)confirmApplePay
{
}

- (void)toggleDock
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 toggleDock];
}

- (BOOL)isRingerSwitchOn
{
  return BKSHIDServicesGetRingerState() != 0;
}

- (void)toggleAppSwitcher
{
  id v2 = [MEMORY[0x263F22960] server];
  int v3 = [v2 isAppSwitcherVisible];

  int v4 = [MEMORY[0x263F22960] server];
  id v5 = v4;
  if (v3) {
    [v4 dismissAppSwitcher];
  }
  else {
    [v4 openAppSwitcher];
  }
}

- (void)toggleAppLibrary
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 toggleAppLibrary];
}

- (void)toggleQuickNote
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 toggleQuickNote];
}

- (void)activateLockButton
{
}

uint64_t __44__AXPISystemActionHelper_activateLockButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) liftLockButtonUp];
}

- (void)pressLockButtonDown
{
}

- (void)liftLockButtonUp
{
}

- (void)toggleRingerSwitch:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 1013;
  }
  else {
    uint64_t v3 = 1012;
  }
  [(AXPISystemActionHelper *)self _sendButtonEvent:v3];
}

- (void)pressStaccato
{
}

uint64_t __39__AXPISystemActionHelper_pressStaccato__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendButtonEvent:1042];
}

- (void)toggleMute
{
  [(AXPISystemActionHelper *)self _sendButtonEvent:1025];
  [(AXPISystemActionHelper *)self _sendButtonEvent:1026];
}

- (void)decreaseVolume
{
}

uint64_t __40__AXPISystemActionHelper_decreaseVolume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) liftVolumeDownButtonUp];
}

- (void)increaseVolume
{
}

uint64_t __40__AXPISystemActionHelper_increaseVolume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) liftVolumeUpButtonUp];
}

- (void)pressVolumeDownButtonDown
{
}

- (void)liftVolumeDownButtonUp
{
}

- (void)pressVolumeUpButtonDown
{
}

- (void)liftVolumeUpButtonUp
{
}

- (void)pressTVMenuButton
{
}

uint64_t __43__AXPISystemActionHelper_pressTVMenuButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) liftTVMenuButtonUp];
}

- (void)pressTVMenuButtonDown
{
}

- (void)liftTVMenuButtonUp
{
}

- (void)pressTVSelectButton
{
}

uint64_t __45__AXPISystemActionHelper_pressTVSelectButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) liftTVSelectButtonUp];
}

- (void)pressTVSelectButtonDown
{
}

- (void)liftTVSelectButtonUp
{
}

- (void)toggleSpotlight
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 toggleSpotlight];
}

- (void)hideSpotlight
{
  id v2 = [MEMORY[0x263F22960] server];
  int v3 = [v2 isSpotlightVisible];

  if (v3)
  {
    id v4 = [MEMORY[0x263F22960] server];
    [v4 toggleSpotlight];
  }
}

- (void)revealSpotlight
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 revealSpotlight];
}

- (void)toggleBackgroundSounds
{
  id v2 = [MEMORY[0x263F22998] server];
  [v2 toggleBackgroundSounds];
}

- (void)toggleLiveCaptions
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 toggleLiveTranscription];
}

- (void)toggleLiveSpeech
{
}

- (void)toggleNearbyDeviceControlPicker
{
}

- (void)toggleTorch
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 toggleTorch];
}

- (void)_toggleClassicInvertColors
{
  id v4 = [MEMORY[0x263F22940] sharedInstance];
  uint64_t v2 = [v4 classicInvertColors] ^ 1;
  int v3 = [MEMORY[0x263F22940] sharedInstance];
  [v3 setClassicInvertColors:v2];
}

- (void)_toggleHoverTextTyping
{
}

- (void)_toggleVoiceOver
{
  if (!_AXSVoiceOverTouchUsageConfirmed()) {
    _AXSVoiceOverTouchSetUsageConfirmed();
  }
  int v2 = _AXSVoiceOverTouchEnabled();
  if (!v2 && _AXSCanDisableApplicationAccessibility()) {
    _AXSApplicationAccessibilitySetEnabled();
  }
  _AXSVoiceOverTouchSetEnabled();
  MEMORY[0x270F90BB0](v2 == 0);
}

- (void)_toggleSmartInvert
{
  int v2 = _AXSInvertColorsEnabled();
  int v3 = [MEMORY[0x263F22940] sharedInstance];
  int v4 = [v3 classicInvertColors];

  if (v4) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v6 = [MEMORY[0x263F22940] sharedInstance];
    [v6 setClassicInvertColors:0];

    _AXSInvertColorsSetEnabled();
  }
  else
  {
    _AXSInvertColorsSetEnabled();
    if (v2) {
      return;
    }
  }
  double Current = CFAbsoluteTimeGetCurrent();
  id v8 = [MEMORY[0x263F22940] sharedInstance];
  [v8 setLastSmartInvertColorsEnablement:Current];
}

- (void)_toggleZoom
{
  BOOL v2 = _AXSZoomTouchEnabled() == 0;
  MEMORY[0x270F90C18](v2);
}

- (void)_toggleZoomController
{
  id v4 = [MEMORY[0x263F22940] sharedInstance];
  uint64_t v2 = [v4 zoomShouldShowSlug] ^ 1;
  int v3 = [MEMORY[0x263F22940] sharedInstance];
  [v3 setZoomShouldShowSlug:v2];
}

- (void)startMagnifier
{
  id v2 = [MEMORY[0x263F88148] sharedInstance];
  [v2 startMagnifierChangeTripleClickMenu:0];
}

- (BOOL)_hasScreenSwitch
{
  id v2 = [MEMORY[0x263F22940] sharedInstance];
  int v3 = [v2 assistiveTouchSwitches];
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__AXPISystemActionHelper__hasScreenSwitch__block_invoke;
  v6[3] = &unk_264D86448;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__AXPISystemActionHelper__hasScreenSwitch__block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 source];
  int v4 = [v3 isEqual:*MEMORY[0x263F22A00]];

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (void)_toggleSwitchControl
{
  int v3 = _AXSAssistiveTouchScannerEnabled();
  BOOL v4 = v3 != 0;
  if (v3)
  {
    if (![(AXPISystemActionHelper *)self _hasScreenSwitch])
    {
      id v6 = [MEMORY[0x263F22960] server];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __46__AXPISystemActionHelper__toggleSwitchControl__block_invoke;
      v7[3] = &__block_descriptor_33_e8_v16__0q8l;
      BOOL v8 = v4;
      [v6 showAlert:9 withHandler:v7];

      return;
    }
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  MEMORY[0x270F905B8](v5);
}

uint64_t __46__AXPISystemActionHelper__toggleSwitchControl__block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return MEMORY[0x270F905B8](*(unsigned __int8 *)(result + 32) ^ 1u);
  }
  return result;
}

- (void)_toggleAssistiveTouch
{
  int v2 = _AXSAssistiveTouchEnabled();
  _AXSAssistiveTouchSetEnabled();
  if (!v2)
  {
    MEMORY[0x270F905D8](1);
  }
}

- (void)_toggleFullKeyboardAccess
{
}

- (void)activateDetectionMode
{
  v19[4] = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F086E0] mainBundle];
  int v3 = [v2 bundleIdentifier];

  if (![(__CFString *)v3 length])
  {

    int v3 = @"com.apple.voiceovertouch";
  }
  BOOL v4 = (void *)MEMORY[0x263F3F778];
  v18[0] = *MEMORY[0x263F3F5E0];
  uint64_t v5 = [NSURL URLWithString:@"apple-magnifier://detectionMode"];
  uint64_t v6 = *MEMORY[0x263F3F608];
  v19[0] = v5;
  v19[1] = MEMORY[0x263EFFA88];
  uint64_t v7 = *MEMORY[0x263F3F5E8];
  v18[1] = v6;
  v18[2] = v7;
  v19[2] = MEMORY[0x263EFFA88];
  v18[3] = *MEMORY[0x263F3F5D0];
  uint64_t v16 = *MEMORY[0x263F83358];
  v17 = v3;
  BOOL v8 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[3] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  char v10 = [v4 optionsWithDictionary:v9];

  v11 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  uint64_t v12 = *MEMORY[0x263F8B0C8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__AXPISystemActionHelper_activateDetectionMode__block_invoke;
  v14[3] = &unk_264D86490;
  id v15 = v10;
  id v13 = v10;
  [v11 openApplication:v12 withOptions:v13 completion:v14];
}

void __47__AXPISystemActionHelper_activateDetectionMode__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = AXLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [v6 localizedDescription];
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412802;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_2390FC000, v7, OS_LOG_TYPE_DEFAULT, "DetectionMode gesture launched process: %@, launch error: %@ (options: %@)", (uint8_t *)&v10, 0x20u);
  }
}

- (void)activateMagnifierFromStaccato
{
  v20[5] = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F086E0] mainBundle];
  int v3 = [v2 bundleIdentifier];

  if (![(__CFString *)v3 length])
  {

    int v3 = @"com.apple.voiceovertouch";
  }
  BOOL v4 = (void *)MEMORY[0x263F3F778];
  v19[0] = *MEMORY[0x263F3F5E0];
  id v5 = [NSURL URLWithString:@"apple-magnifier://staccato"];
  uint64_t v6 = *MEMORY[0x263F3F608];
  v20[0] = v5;
  v20[1] = MEMORY[0x263EFFA88];
  uint64_t v7 = *MEMORY[0x263F3F5E8];
  v19[1] = v6;
  v19[2] = v7;
  v20[2] = MEMORY[0x263EFFA88];
  v19[3] = *MEMORY[0x263F3F5D0];
  uint64_t v17 = *MEMORY[0x263F83358];
  v18 = v3;
  BOOL v8 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v19[4] = *MEMORY[0x263F3F5C0];
  uint64_t v9 = *MEMORY[0x263F79538];
  v20[3] = v8;
  v20[4] = v9;
  int v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];
  id v11 = [v4 optionsWithDictionary:v10];

  __int16 v12 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  uint64_t v13 = *MEMORY[0x263F8B0C8];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__AXPISystemActionHelper_activateMagnifierFromStaccato__block_invoke;
  v15[3] = &unk_264D86490;
  id v16 = v11;
  id v14 = v11;
  [v12 openApplication:v13 withOptions:v14 completion:v15];
}

void __55__AXPISystemActionHelper_activateMagnifierFromStaccato__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = AXLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [v6 localizedDescription];
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412802;
    id v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_2390FC000, v7, OS_LOG_TYPE_DEFAULT, "Magnifier Staccato gesture launched process: %@, launch error: %@ (options: %@)", (uint8_t *)&v10, 0x20u);
  }
}

- (void)_openCamera:(BOOL)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v8 = [MEMORY[0x263F01880] defaultWorkspace];
    int v3 = [NSURL URLWithString:@"camera://configuration?capturemode=photo&capturedevice=front"];
    [v8 openSensitiveURL:v3 withOptions:0];
  }
  else
  {
    BOOL v4 = (void *)MEMORY[0x263F3F778];
    uint64_t v9 = *MEMORY[0x263F3F608];
    v10[0] = MEMORY[0x263EFFA88];
    id v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v6 = [v4 optionsWithDictionary:v5];

    uint64_t v7 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
    [v7 openApplication:*MEMORY[0x263F21308] withOptions:v6 completion:0];
  }
}

- (void)_cameraAction:(BOOL)a3
{
  [(AXPISystemActionHelper *)self _openCamera:a3];
  int v3 = [MEMORY[0x263F22940] sharedInstance];
  int v4 = [v3 assistiveTouchMouseOnDeviceEyeTrackingEnabled];

  if (v4) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __40__AXPISystemActionHelper__cameraAction___block_invoke(uint64_t a1)
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __40__AXPISystemActionHelper__cameraAction___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateHomeButton];
}

- (void)_toggleColorFilters
{
  BOOL v2 = MADisplayFilterPrefGetCategoryEnabled() == 0;
  MEMORY[0x270EF5B48](1, v2);
}

- (void)turnDigitalCrown:(int64_t)a3
{
  if (turnDigitalCrown__onceToken != -1) {
    dispatch_once(&turnDigitalCrown__onceToken, &__block_literal_global_347);
  }
  if (a3 >= 0) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = -a3;
  }
  if (a3)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      double v7 = v7 + 0.01;
      uint64_t v8 = v4 - v5;
      if (v8 >= 10) {
        uint64_t v8 = 10;
      }
      if (a3 >= 0) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = -v8;
      }
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __43__AXPISystemActionHelper_turnDigitalCrown___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v9;
      dispatch_after(v10, (dispatch_queue_t)turnDigitalCrown__digitalCrownHIDQueue, block);
      v6 += v9;
      if (v6 >= 0) {
        unint64_t v5 = v6;
      }
      else {
        unint64_t v5 = -v6;
      }
    }
    while (v5 < v4);
  }
}

void __43__AXPISystemActionHelper_turnDigitalCrown___block_invoke()
{
  BOOL v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.axpi.digital.crown.scroll.queue", v2);
  v1 = (void *)turnDigitalCrown__digitalCrownHIDQueue;
  turnDigitalCrown__digitalCrownHIDQueue = (uint64_t)v0;
}

void __43__AXPISystemActionHelper_turnDigitalCrown___block_invoke_2()
{
  mach_absolute_time();
  ScrollEvent = (const void *)IOHIDEventCreateScrollEvent();
  v1 = +[AXPIEventSender sharedInstance];
  [v1 sendIOHIDEventRef:ScrollEvent];

  if (ScrollEvent)
  {
    CFRelease(ScrollEvent);
  }
}

- (void)turnDigitalCrownFullRevolution:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = -200;
  }
  else {
    uint64_t v3 = 200;
  }
  [(AXPISystemActionHelper *)self turnDigitalCrown:v3];
}

- (void)_activateSpeakScreen
{
  if (!_AXSSpeakThisEnabled())
  {
    _AXSSetSpeakThisEnabled();
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x263EFFE88], 0.5, 0);
  }
  id v2 = [MEMORY[0x263F78B78] sharedInstance];
  [v2 speakThisWithOptions:12 errorHandler:&__block_literal_global_354];
}

uint64_t __46__AXPISystemActionHelper__activateSpeakScreen__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return _AXLogWithFacility();
  }
  return result;
}

- (void)activateTripleClick
{
  uint64_t v3 = [MEMORY[0x263F32050] sharedSystemShellSwitcher];
  int v4 = [v3 isClarityBoardEnabled];

  if (v4)
  {
    if (AXDeviceHasHomeButton()) {
      [(AXPISystemActionHelper *)self activateHomeButton];
    }
    else {
      [(AXPISystemActionHelper *)self activateLockButton];
    }
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    MEMORY[0x270F907C8]();
  }
}

uint64_t __45__AXPISystemActionHelper_activateTripleClick__block_invoke(uint64_t a1)
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __45__AXPISystemActionHelper_activateTripleClick__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateHomeButton];
}

uint64_t __45__AXPISystemActionHelper_activateTripleClick__block_invoke_3(uint64_t a1)
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __45__AXPISystemActionHelper_activateTripleClick__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateLockButton];
}

- (void)shake
{
  if (_AXSShakeToUndoDisabled()) {
    _AXSSetShakeToUndoDisabled();
  }
  [(AXPISystemActionHelper *)self _sendShakeEvent];
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __31__AXPISystemActionHelper_shake__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 32)) {
    return _AXSSetShakeToUndoDisabled();
  }
  return result;
}

- (void)_sendShakeEvent
{
  unint64_t v2 = 0;
  do
  {
    id v3 = objc_alloc_init(MEMORY[0x263F22878]);
    int v4 = (_DWORD *)((char *)&unk_239110F74 + 4 * v2);
    LODWORD(v5) = *v4;
    [v3 setX:v5];
    LODWORD(v6) = v4[1];
    [v3 setY:v6];
    LODWORD(v7) = v4[2];
    [v3 setZ:v7];
    [v3 setType:1];
    uint64_t v8 = [MEMORY[0x263F228A0] accelerometerRepresentation:v3];
    [v8 setPostHIDEventDirectly:1];
    uint64_t v9 = +[AXPIEventSender sharedInstance];
    [v9 sendEventRepresentation:v8];

    BOOL v10 = v2 >= 0x1E;
    v2 += 3;
  }
  while (!v10);
}

- (void)takeScreenshot
{
  unint64_t v2 = [MEMORY[0x263F22840] server];
  char v3 = [v2 isGuidedAccessActive];

  if ((v3 & 1) == 0)
  {
    if (_AXSCommandAndControlEnabled())
    {
      ct_green_tea_logger_create();
      int v4 = getCTGreenTeaOsLogHandle();
      double v5 = v4;
      if (!v4 || !os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      __int16 v13 = 0;
      double v6 = "Voice Control took screenshot";
      double v7 = (uint8_t *)&v13;
    }
    else
    {
      int v8 = _AXSAssistiveTouchEnabled();
      ct_green_tea_logger_create();
      uint64_t v9 = getCTGreenTeaOsLogHandle();
      double v5 = v9;
      if (v8)
      {
        if (!v9 || !os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          goto LABEL_14;
        }
        __int16 v12 = 0;
        double v6 = "AssistiveTouch took screenshot";
        double v7 = (uint8_t *)&v12;
      }
      else
      {
        if (!v9 || !os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          goto LABEL_14;
        }
        __int16 v11 = 0;
        double v6 = "Switch Control took screenshot";
        double v7 = (uint8_t *)&v11;
      }
    }
    _os_log_impl(&dword_2390FC000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
LABEL_14:

    ct_green_tea_logger_destroy();
    BOOL v10 = [MEMORY[0x263F22960] server];
    [v10 takeScreenshot];
  }
}

- (void)toggleControlCenter
{
  unint64_t v2 = [MEMORY[0x263F22998] server];
  int v3 = [v2 isControlCenterVisible];

  id v4 = [MEMORY[0x263F22998] server];
  [v4 showControlCenter:v3 ^ 1u];
}

- (void)toggleAssistiveAccess
{
}

- (void)toggleWatchRemoteScreen
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2390FC000, log, OS_LOG_TYPE_ERROR, "Can't start remote screen on this device", v1, 2u);
}

- (void)toggleNotificationCenter
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v2 = [MEMORY[0x263F22960] server];
  int v3 = [v2 isNotificationCenterVisible];

  id v4 = AXLogPhysicalInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_2390FC000, v4, OS_LOG_TYPE_INFO, "NC is visible: %d", (uint8_t *)v6, 8u);
  }

  if (v3)
  {
    double v5 = objc_msgSend(MEMORY[0x263F22960], "server", 0.0);
    [v5 showNotificationCenter:0];
  }
  AXPerformBlockOnMainThreadAfterDelay();
}

void __50__AXPISystemActionHelper_toggleNotificationCenter__block_invoke()
{
  id v0 = [MEMORY[0x263F22960] server];
  [v0 toggleNotificationCenter];
}

- (void)adjustSystemZoom:(int64_t)a3
{
  id v4 = [MEMORY[0x263F22840] server];
  id v6 = v4;
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [v4 adjustSystemZoom:v5];
}

- (void)rotatePortrait
{
}

- (void)rotateUpsideDown
{
}

- (void)rotateLeft
{
}

- (void)rotateRight
{
}

- (void)activateSOSMode
{
  id v2 = [MEMORY[0x263F22960] server];
  [v2 activateSOSMode];
}

- (void)rebootDevice
{
  id v2 = [MEMORY[0x263F22998] server];
  [v2 rebootDevice];
}

- (void)performSysdiagnoseWithStatusUpdateHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogPhysicalInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2390FC000, v5, OS_LOG_TYPE_DEFAULT, "Generating sysdiagnose.", buf, 2u);
  }

  id v6 = dispatch_get_global_queue(9, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke;
  v8[3] = &unk_264D86590;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v58 = 0;
  int v2 = [MEMORY[0x263F8C7E8] isSysdiagnoseInProgressWithError:&v58];
  id v3 = v58;
  id v4 = v3;
  if (v2)
  {
    id v57 = v3;
    int v5 = [MEMORY[0x263F8C7E8] cancelActiveSysdiagnoseWithError:&v57];
    id v6 = v57;

    id v7 = AXLogPhysicalInteraction();
    int v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2390FC000, v8, OS_LOG_TYPE_DEFAULT, "Interrupting current sysdiagnose before generating.", buf, 2u);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_367;
      block[3] = &unk_264D86518;
      id v9 = &v56;
      id v56 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], block);
      uint64_t v10 = *(void *)(a1 + 32);
      __int16 v11 = *(NSObject **)(v10 + 24);
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2;
      v54[3] = &unk_264D86378;
      v54[4] = v10;
      dispatch_sync(v11, v54);
      goto LABEL_14;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_cold_1((uint64_t)v6, v8, v19, v20, v21, v22, v23, v24);
    }

    uint64_t v25 = *(void *)(a1 + 32);
    v26 = *(NSObject **)(v25 + 24);
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_374;
    v53[3] = &unk_264D86378;
    v53[4] = v25;
    dispatch_sync(v26, v53);
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2_375;
    v51[3] = &unk_264D86518;
    id v52 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v51);
  }
  else
  {
    if (!v3)
    {
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2_383;
      v47[3] = &unk_264D86518;
      id v9 = &v48;
      id v48 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], v47);
      id v6 = 0;
LABEL_14:

      id v46 = v6;
      v27 = [MEMORY[0x263F8C7E8] sysdiagnoseWithMetadata:&unk_26EC8F118 withError:&v46];
      id v28 = v46;

      *(void *)buf = 0;
      v41 = buf;
      uint64_t v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__0;
      v44 = __Block_byref_object_dispose__0;
      id v45 = 0;
      if (v27)
      {
        v29 = AXLogPhysicalInteraction();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v59 = 138543362;
          v60 = v27;
          _os_log_impl(&dword_2390FC000, v29, OS_LOG_TYPE_DEFAULT, "Sysdiagnose completed. File path: %{public}@", v59, 0xCu);
        }

        uint64_t v30 = AXPILocalizedString(@"SYSDIAGNOSE_COMPLETED");
        v31 = (void *)*((void *)v41 + 5);
        *((void *)v41 + 5) = v30;
      }
      else
      {
        uint64_t v32 = *(void *)(a1 + 32);
        v33 = *(NSObject **)(v32 + 24);
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_394;
        v37[3] = &unk_264D86540;
        v37[4] = v32;
        id v38 = v28;
        v39 = buf;
        dispatch_sync(v33, v37);
      }
      if (*((void *)v41 + 5))
      {
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_395;
        v34[3] = &unk_264D86568;
        id v35 = *(id *)(a1 + 40);
        v36 = buf;
        dispatch_async(MEMORY[0x263EF83A0], v34);
      }
      _Block_object_dispose(buf, 8);

      id v6 = v28;
      goto LABEL_22;
    }
    __int16 v12 = AXLogPhysicalInteraction();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_cold_2((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);
    }

    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_379;
    v49[3] = &unk_264D86518;
    id v50 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], v49);

    id v6 = v4;
  }
LABEL_22:
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_367(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  AXPILocalizedString(@"SYSDIAGNOSE_BEGAN_AFTER_CANCEL");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2(uint64_t result)
{
  return result;
}

uint64_t __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_374(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2) {
    *(void *)(v1 + ++*(void *)(*(void *)(result + 32) + 16) = v2 - 1;
  }
  return result;
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2_375(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  AXPILocalizedString(@"SYSDIAGNOSE_IN_PROGRESS");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_379(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  AXPILocalizedString(@"SYSDIAGNOSE_FAILED");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_2_383(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  AXPILocalizedString(@"SYSDIAGNOSE_BEGAN");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_394(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  id v3 = AXLogPhysicalInteraction();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4) {
      __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_394_cold_2(a1, v3, v5, v6, v7, v8, v9, v10);
    }

    --*(void *)(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v4) {
      __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_394_cold_1(a1, v3, v5, v6, v7, v8, v9, v10);
    }

    if ([*(id *)(a1 + 40) code] == -56) {
      __int16 v11 = @"SYSDIAGNOSE_IN_PROGRESS";
    }
    else {
      __int16 v11 = @"SYSDIAGNOSE_FAILED";
    }
    __int16 v12 = AXPILocalizedString(v11);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v12);
  }
}

uint64_t __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_395(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)_showAlertForReboot
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_2390FC000, a2, OS_LOG_TYPE_ERROR, "Failed to create notification with error code: %i", (uint8_t *)v3, 8u);
}

- (void)pressCameraButton
{
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x263F21358]];
  uint64_t v5 = [v4 objectForKey:@"SBCaptureButtonClickCount"];
  int v6 = [v5 intValue];

  [(AXPISystemActionHelper *)self _sendButtonEvent:1044];
  if (v6 > 1)
  {
    AXPerformBlockOnMainThreadAfterDelay();
    AXPerformBlockOnMainThreadAfterDelay();
  }
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __43__AXPISystemActionHelper_pressCameraButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendButtonEvent:1045];
}

uint64_t __43__AXPISystemActionHelper_pressCameraButton__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendButtonEvent:1045];
}

uint64_t __43__AXPISystemActionHelper_pressCameraButton__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendButtonEvent:1044];
}

uint64_t __43__AXPISystemActionHelper_pressCameraButton__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendButtonEvent:1045];
}

- (void)lightPressCameraButton
{
}

uint64_t __48__AXPISystemActionHelper_lightPressCameraButton__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendButtonEvent:1051];
  [*(id *)(a1 + 32) _sendButtonEvent:1050];
  int v2 = *(void **)(a1 + 32);
  return [v2 _sendButtonEvent:1049];
}

- (void)doubleLightPressCameraButton
{
}

uint64_t __54__AXPISystemActionHelper_doubleLightPressCameraButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) lightPressCameraButton];
}

- (void)openVisualIntelligence
{
  id v2 = objc_alloc_init((Class)getSiriSimpleActivationSourceClass());
  [v2 activateFromSource:53];
  [v2 invalidate];
}

- (void)warm
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2390FC000, log, OS_LOG_TYPE_ERROR, "Could not create _homeButtonUserDevice", v1, 2u);
}

uint64_t __30__AXPISystemActionHelper_warm__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  CFRunLoopRef Main = CFRunLoopGetMain();
  uint64_t v3 = *MEMORY[0x263EFFE88];
  return MEMORY[0x270EF4720](v1, Main, v3);
}

- (void)_handleHomeButtonDispatch:(BOOL)a3
{
  if (self->_homeButtonUserDevice) {
    goto LABEL_5;
  }
  uint64_t v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[AXPISystemActionHelper _handleHomeButtonDispatch:](v5);
  }

  if (self->_homeButtonUserDevice)
  {
LABEL_5:
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __52__AXPISystemActionHelper__handleHomeButtonDispatch___block_invoke;
    v10[3] = &unk_264D865B8;
    BOOL v11 = a3;
    v10[4] = self;
    uint64_t v8 = CFRunLoopTimerCreateWithHandler(v6, Current, 0.0, 0, 0, v10);
    CFRunLoopRef Main = CFRunLoopGetMain();
    CFRunLoopAddTimer(Main, v8, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    CFRelease(v8);
  }
}

uint64_t __52__AXPISystemActionHelper__handleHomeButtonDispatch___block_invoke(uint64_t a1)
{
  id v2 = AXLogPhysicalInteraction();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __52__AXPISystemActionHelper__handleHomeButtonDispatch___block_invoke_cold_1(a1, v2);
  }

  return IOHIDUserDeviceHandleReport();
}

- (void)_sendButtonEvent:(unsigned int)a3
{
}

- (void)_sendButtonEvent:(unsigned int)a3 postHIDEventDirectly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [MEMORY[0x263F228A0] buttonRepresentationWithType:*(void *)&a3];
  objc_msgSend(v6, "setAdditionalFlags:", objc_msgSend(v6, "additionalFlags") | 0x4000);
  [v6 setPostHIDEventDirectly:v4];
  uint64_t v5 = +[AXPIEventSender sharedInstance];
  [v5 sendEventRepresentation:v6];
}

- (void)_sendDeviceOrientationChange:(int64_t)a3
{
  BOOL v4 = (id *)0x263F22858;
  if (([MEMORY[0x263F22858] isAvailable] & 1) != 0
    || (BOOL v4 = (id *)0x263F22960,
        [MEMORY[0x263F22960] server],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isControlCenterVisible],
        v5,
        (v6 & 1) == 0))
  {
    id v7 = [*v4 server];
    [v7 setOrientation:a3];
  }
}

- (void)performActionForSystemAction:(id)a3
{
}

- (void)performActionForSystemAction:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 isEqualToString:*MEMORY[0x263F22538]])
  {
    if ([v6 isEqualToString:*MEMORY[0x263F223E8]])
    {
      [(AXPISystemActionHelper *)self toggleAppSwitcher];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22450]])
    {
      [(AXPISystemActionHelper *)self toggleControlCenter];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22480]])
    {
      [(AXPISystemActionHelper *)self activateHomeButton];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F224A0]])
    {
      [(AXPISystemActionHelper *)self activateLockButton];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F224B8]])
    {
      [(AXPISystemActionHelper *)self toggleRingerSwitch:[(AXPISystemActionHelper *)self isRingerSwitchOn] ^ 1];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F224C8]])
    {
      [(AXPISystemActionHelper *)self toggleNotificationCenter];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F224D8]])
    {
      [(AXPISystemActionHelper *)self toggleReachability];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F224E8]])
    {
      [(AXPISystemActionHelper *)self takeScreenshot];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22500]])
    {
      [(AXPISystemActionHelper *)self shake];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22508]])
    {
      [(AXPISystemActionHelper *)self activateSiriFromClient:v7];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22540]])
    {
      [(AXPISystemActionHelper *)self activateTypeToSiri];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F224E0]])
    {
      [(AXPISystemActionHelper *)self activateSOSMode];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22520]])
    {
      [(AXPISystemActionHelper *)self toggleSpotlight];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22440]])
    {
      [(AXPISystemActionHelper *)self toggleCommandAndControl];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22560]])
    {
      [(AXPISystemActionHelper *)self increaseVolume];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22558]])
    {
      [(AXPISystemActionHelper *)self decreaseVolume];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F223F0]])
    {
      [(AXPISystemActionHelper *)self armApplePay];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22488]])
    {
      [(AXPISystemActionHelper *)self _toggleHoverTextTyping];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22448]])
    {
      [(AXPISystemActionHelper *)self confirmApplePay];
      goto LABEL_48;
    }
    uint64_t v8 = *MEMORY[0x263F22390];
    if ([v6 hasPrefix:*MEMORY[0x263F22390]])
    {
      uint64_t v9 = [NSString stringWithFormat:@"%@-", v8];
      uint64_t v10 = [v6 rangeOfString:v9];
      __int16 v12 = [v6 substringFromIndex:v10 + v11];

      uint64_t v13 = [MEMORY[0x263F22950] sharedManager];
      uint64_t v14 = [v13 shortcutForIdentifier:v12];

      uint64_t v15 = [MEMORY[0x263F22950] sharedManager];
      [v15 performShortcut:v14];

      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F224F8]])
    {
      uint64_t v16 = self;
      uint64_t v17 = 0;
LABEL_47:
      [(AXPISystemActionHelper *)v16 _performScrollAction:v17];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F224F0]])
    {
      uint64_t v16 = self;
      uint64_t v17 = 1;
      goto LABEL_47;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22400]])
    {
      [(AXPISystemActionHelper *)self _toggleAssistiveTouch];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22550]])
    {
      [(AXPISystemActionHelper *)self _toggleVoiceOver];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22430]])
    {
      [(AXPISystemActionHelper *)self _toggleClassicInvertColors];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22438]])
    {
      [(AXPISystemActionHelper *)self _toggleColorFilters];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22510]])
    {
      [(AXPISystemActionHelper *)self _toggleSmartInvert];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22570]])
    {
      [(AXPISystemActionHelper *)self _toggleZoom];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22578]])
    {
      [(AXPISystemActionHelper *)self _toggleZoomController];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F224A8]])
    {
      [(AXPISystemActionHelper *)self startMagnifier];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22528]])
    {
      [(AXPISystemActionHelper *)self _toggleSwitchControl];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22470]])
    {
      [(AXPISystemActionHelper *)self _toggleFullKeyboardAccess];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22518]])
    {
      [(AXPISystemActionHelper *)self _activateSpeakScreen];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22530]])
    {
      [(AXPISystemActionHelper *)self toggleTorch];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22408]])
    {
      [(AXPISystemActionHelper *)self toggleBackgroundSounds];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22490]])
    {
      [(AXPISystemActionHelper *)self toggleLiveCaptions];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22498]])
    {
      [(AXPISystemActionHelper *)self toggleLiveSpeech];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22460]])
    {
      uint64_t v18 = (void *)MEMORY[0x263F229B0];
      uint64_t v19 = 35;
LABEL_85:
      [v18 toggleTripleClickOption:v19];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F224B0]])
    {
      uint64_t v18 = (void *)MEMORY[0x263F229B0];
      uint64_t v19 = 36;
      goto LABEL_85;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22478]])
    {
      uint64_t v18 = (void *)MEMORY[0x263F229B0];
      uint64_t v19 = 38;
      goto LABEL_85;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F224C0]])
    {
      [(AXPISystemActionHelper *)self toggleNearbyDeviceControlPicker];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22458]])
    {
      if (!_AXSVoiceOverTouchEnabled())
      {
        [(AXPISystemActionHelper *)self activateDetectionMode];
        goto LABEL_48;
      }
      uint64_t v20 = [MEMORY[0x263F22940] sharedInstance];
      int v21 = [v20 liveRecognitionActive];

      uint64_t v22 = [MEMORY[0x263F229E0] server];
      uint64_t v23 = v22;
      if (v21) {
        uint64_t v24 = 51;
      }
      else {
        uint64_t v24 = 50;
      }
      [v22 triggerCommand:v24];
LABEL_102:

      goto LABEL_48;
    }
    if (AXDeviceSupportsWatchRemoteScreen()
      && [v6 isEqualToString:*MEMORY[0x263F22568]])
    {
      [(AXPISystemActionHelper *)self toggleWatchRemoteScreen];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F223F8]])
    {
      [(AXPISystemActionHelper *)self toggleAssistiveAccess];
      goto LABEL_48;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F22410]])
    {
      uint64_t v25 = self;
      uint64_t v26 = 0;
    }
    else
    {
      if (![v6 isEqualToString:*MEMORY[0x263F22468]])
      {
        if ([v6 isEqualToString:*MEMORY[0x263F224D0]])
        {
          uint64_t v23 = [MEMORY[0x263F22960] server];
          [v23 setOrientationLocked:[v23 isOrientationLocked] ^ 1];
        }
        else
        {
          if ([v6 isEqualToString:*MEMORY[0x263F22418]])
          {
            [(AXPISystemActionHelper *)self pressCameraButton];
            goto LABEL_48;
          }
          if ([v6 isEqualToString:*MEMORY[0x263F22428]])
          {
            [(AXPISystemActionHelper *)self lightPressCameraButton];
            goto LABEL_48;
          }
          if ([v6 isEqualToString:*MEMORY[0x263F22420]])
          {
            [(AXPISystemActionHelper *)self doubleLightPressCameraButton];
            goto LABEL_48;
          }
          if ([v6 isEqualToString:*MEMORY[0x263F22548]])
          {
            [(AXPISystemActionHelper *)self openVisualIntelligence];
            goto LABEL_48;
          }
          if (AXDeviceHasStaccato()
            && [v6 isEqualToString:*MEMORY[0x263F223E0]])
          {
            uint64_t v23 = +[AXPISystemActionHelper sharedInstance];
            [v23 pressStaccato];
          }
          else
          {
            if (!v6) {
              goto LABEL_48;
            }
            uint64_t v23 = AXLogPhysicalInteraction();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              -[AXPISystemActionHelper performActionForSystemAction:fromClient:]((uint64_t)v6, v23, v27, v28, v29, v30, v31, v32);
            }
          }
        }
        goto LABEL_102;
      }
      uint64_t v25 = self;
      uint64_t v26 = 1;
    }
    [(AXPISystemActionHelper *)v25 _cameraAction:v26];
    goto LABEL_48;
  }
  [(AXPISystemActionHelper *)self activateTripleClick];
LABEL_48:
}

- (void)_performScrollAction:(BOOL)a3
{
}

void __47__AXPISystemActionHelper__performScrollAction___block_invoke(uint64_t a1)
{
  v32[2] = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1 + 32) + 32))
  {
    id v2 = objc_alloc_init(AXPIFingerController);
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;
  }
  uint64_t v5 = [MEMORY[0x263F22960] server];
  unint64_t v6 = [v5 activeApplicationOrientation];

  id v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  AX_CGRectGetCenter();
  if (v6)
  {
    double v18 = v16;
    double v19 = v17;
    if (v6 > 2)
    {
      if (v6 - 3 <= 1)
      {
        int v24 = *(unsigned __int8 *)(a1 + 40);
        v36.origin.x = v9;
        v36.origin.y = v11;
        v36.size.width = v13;
        v36.size.height = v15;
        double Width = CGRectGetWidth(v36);
        if (v24) {
          double Width = -Width;
        }
        double v26 = Width / 3.0;
        if (v6 != 4) {
          double v26 = -v26;
        }
        double v18 = v18 + v26;
      }
    }
    else
    {
      int v20 = *(unsigned __int8 *)(a1 + 40);
      v35.origin.x = v9;
      v35.origin.y = v11;
      v35.size.width = v13;
      v35.size.height = v15;
      double Height = CGRectGetHeight(v35);
      if (v20) {
        double Height = -Height;
      }
      double v22 = Height * 0.25;
      double v23 = -(Height * 0.25);
      if (v6 == 1) {
        double v23 = v22;
      }
      double v19 = v19 + v23;
    }
    uint64_t v27 = (void *)MEMORY[0x263F228F8];
    AX_CGRectGetCenter();
    uint64_t v28 = NSStringFromCGPoint(v33);
    v32[0] = v28;
    v34.x = v18;
    v34.y = v19;
    uint64_t v29 = NSStringFromCGPoint(v34);
    v32[1] = v29;
    uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    uint64_t v31 = [v27 lineGestureBetweenPoints:v30 duration:0.25];

    [*(id *)(*(void *)(a1 + 32) + 32) performGesture:v31];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerController, 0);
  objc_storeStrong((id *)&self->_sysdiagnoseCancelCountQueue, 0);
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_394_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68__AXPISystemActionHelper_performSysdiagnoseWithStatusUpdateHandler___block_invoke_394_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleHomeButtonDispatch:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_2390FC000, log, OS_LOG_TYPE_FAULT, "_homeButtonUserDevice expectedly nil. Need to call warm", v1, 2u);
}

void __52__AXPISystemActionHelper__handleHomeButtonDispatch___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_2390FC000, a2, OS_LOG_TYPE_DEBUG, "send home button state down: %d", (uint8_t *)v3, 8u);
}

- (void)performActionForSystemAction:(uint64_t)a3 fromClient:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end