@interface AXTripleClickHelpers
+ (BOOL)_isAccessibilityAppIntentsProcess;
+ (BOOL)_localValueForTripleClickOption:(int)a3;
+ (BOOL)_npsValueForTripleClickOption:(int)a3;
+ (BOOL)_shouldShowFeatureInShortcutsControlCenterModule:(int)a3 includeGuidedAccess:(BOOL)a4;
+ (BOOL)isReduceWhitePointEnabled;
+ (BOOL)motionCuesShowBanner;
+ (BOOL)switchControlHasScreenSwitch;
+ (BOOL)switchControlRendersDeviceUnusable;
+ (BOOL)valueForTripleClickOption:(int)a3;
+ (BOOL)valueForTripleClickOption:(int)a3 fromSource:(int64_t)a4;
+ (BOOL)valueForZoomTripleClickOption;
+ (id)_allAvailableFeaturesIOS;
+ (id)_allAvailableFeaturesWatchOS;
+ (id)_availableFeatures;
+ (id)_displayFilterUIClient;
+ (id)_npsKeyForTripleClickOption:(int)a3;
+ (id)allTripleClickOptions;
+ (id)allTripleClickOptionsForPlatform:(int64_t)a3;
+ (id)domainAccessorForTripleClickOption:(int)a3;
+ (id)localizationKeyForTripleClickOption:(int)a3;
+ (id)symbolNameForTripleClickOption:(int)a3;
+ (id)titleForTripleClickOption:(int)a3;
+ (id)tripleClickOptionDidChangeNotification;
+ (id)tripleClickOptionsForAccessibilityShortcutControlCenterModuleIncludingGuidedAccess:(BOOL)a3;
+ (int64_t)stateForTripleClickOption:(int)a3;
+ (void)_disableSwitchControlWithHandler:(id)a3;
+ (void)_handleToggleTripleClickTriggeredFromAppIntent:(int)a3;
+ (void)_localToggleTripleClickOption:(int)a3;
+ (void)_npsSyncTripleClickOption:(int)a3;
+ (void)_npsToggleTripleClickOption:(int)a3;
+ (void)_promptToDisableBrightnessFilters:(id)a3 data:(id)a4;
+ (void)_toggleAssistiveTouch;
+ (void)_toggleClassicInvertColors;
+ (void)_toggleLocalizationCaptionPanel;
+ (void)_toggleSmartInvertColorsOffMainThread;
+ (void)_toggleSwitchOver;
+ (void)_toggleSwitchOverOffMainThread;
+ (void)_toggleVoiceOver;
+ (void)attemptToEnterClarityBoard;
+ (void)attemptToPresentNearbyDeviceControlPicker;
+ (void)attemptToToggleConversationBoost;
+ (void)attemptToToggleTwiceRemoteScreen;
+ (void)registerObserverForTripleClickOption:(int)a3;
+ (void)setMotionCuesShowBanner:(BOOL)a3;
+ (void)setSwitchControlHasScreenSwitch:(BOOL)a3;
+ (void)setSwitchControlRendersDeviceUnusable:(BOOL)a3;
+ (void)toggleColorFilter;
+ (void)toggleFullKeyboardAccess;
+ (void)toggleGuidedAccess;
+ (void)toggleHearingControlCenter;
+ (void)toggleHoverText;
+ (void)toggleHoverTextTyping;
+ (void)toggleLiveSpeech;
+ (void)toggleOnDeviceEyeTracking;
+ (void)toggleReduceWhitePoint;
+ (void)toggleTripleClickOption:(int)a3;
+ (void)toggleTripleClickOption:(int)a3 fromSource:(int64_t)a4;
+ (void)toggleZoomOffMainThread;
@end

@implementation AXTripleClickHelpers

+ (id)tripleClickOptionDidChangeNotification
{
  return @"AXTripleClickOptionDidChangeNotification";
}

+ (id)localizationKeyForTripleClickOption:(int)a3
{
  v3 = 0;
  switch(a3)
  {
    case 1:
      v3 = @"ask.sheet.option.VoiceOver.on";
      break;
    case 2:
      v3 = @"ask.sheet.option.WhiteOnBlack.on";
      break;
    case 4:
      v3 = @"ask.sheet.option.Zoom.on";
      break;
    case 6:
      v3 = @"ask.sheet.option.AssistiveTouch.on";
      break;
    case 7:
      v3 = @"ask.sheet.option.GuidedAccess.on";
      break;
    case 8:
      v3 = @"ask.sheet.option.HearingAidControl.on";
      break;
    case 9:
      v3 = @"ask.sheet.option.SwitchOver.on";
      break;
    case 10:
      v4 = +[AXBackBoardServer server];
      int v5 = [v4 supportsAccessibilityDisplayFilters];

      if (v5) {
        v3 = @"ask.sheet.option.DisplayFiltersColor.on";
      }
      else {
        v3 = @"ask.sheet.option.grayscale.on";
      }
      break;
    case 11:
      v3 = @"ask.sheet.option.touch.accommodations";
      break;
    case 12:
      v3 = @"ask.sheet.option.magnifier.on";
      break;
    case 13:
      v3 = @"Loc Caption Panel";
      break;
    case 14:
      v3 = @"ask.sheet.option.reduce.white.point.on";
      break;
    case 15:
      v3 = @"ask.sheet.option.temporarily.undo.double.invert";
      break;
    case 16:
      v3 = @"AX Development Tools";
      break;
    case 17:
      v3 = @"ask.sheet.option.command.and.control.on";
      break;
    case 18:
      v3 = @"ask.sheet.option.full.keyboard.access.on";
      break;
    case 20:
      v3 = @"ask.sheet.option.reduce.transparency";
      break;
    case 21:
      v3 = @"ask.sheet.option.increase.contrast";
      break;
    case 22:
      v3 = @"ask.sheet.option.detection.mode";
      break;
    case 23:
      v3 = @"ask.sheet.option.watch.control.on";
      break;
    case 24:
      v3 = @"ask.sheet.option.reduce.motion";
      break;
    case 25:
      v3 = @"ask.sheet.option.background.sounds";
      break;
    case 26:
      v3 = @"ask.sheet.option.left.right.balance";
      break;
    case 27:
      v3 = @"ask.sheet.option.HoverText.on";
      break;
    case 28:
      v3 = @"ask.sheet.option.remote.screen";
      break;
    case 29:
      v3 = @"ask.sheet.option.live.transcription";
      break;
    case 30:
      v3 = @"ask.sheet.option.custom.accessibility.mode";
      break;
    case 31:
      v3 = @"ask.sheet.option.nearby.device.control";
      break;
    case 33:
      v3 = @"ask.sheet.option.live.speech";
      break;
    case 34:
      v3 = @"ask.sheet.option.speak.screen";
      break;
    case 35:
      v3 = @"ask.sheet.option.dim.flashing.lights";
      break;
    case 36:
      v3 = @"ask.sheet.option.motion.cues";
      break;
    case 38:
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x2020000000;
      v6 = (void (*)(__CFString *, __CFString *))getAXUILocalizedStringForKeyWithTableSymbolLoc_ptr;
      v12 = getAXUILocalizedStringForKeyWithTableSymbolLoc_ptr;
      if (!getAXUILocalizedStringForKeyWithTableSymbolLoc_ptr)
      {
        v7 = (void *)AccessibilityUIUtilitiesLibrary();
        v10[3] = (uint64_t)dlsym(v7, "AXUILocalizedStringForKeyWithTable");
        getAXUILocalizedStringForKeyWithTableSymbolLoc_ptr = (_UNKNOWN *)v10[3];
        v6 = (void (*)(__CFString *, __CFString *))v10[3];
      }
      _Block_object_dispose(&v9, 8);
      if (!v6) {
        +[AXTripleClickHelpers localizationKeyForTripleClickOption:]();
      }
      v6(@"HAPTIC_MUSIC_TITLE", @"Accessibility-HapticMusic");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 39:
      v3 = @"ask.sheet.option.conversation.boost";
      break;
    case 40:
      v3 = @"ask.sheet.option.hovertext.typing";
      break;
    case 41:
      v3 = @"ask.sheet.option.minimum.brightness";
      break;
    case 42:
      v3 = @"ask.sheet.option.EyeTracking.on";
      break;
    default:
      break;
  }

  return v3;
}

+ (id)symbolNameForTripleClickOption:(int)a3
{
  if ((a3 - 1) > 0x29) {
    return 0;
  }
  else {
    return off_1E5586098[a3 - 1];
  }
}

+ (id)titleForTripleClickOption:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (AXProcessIsBackboard())
  {
    int v5 = NSString;
    v6 = [NSNumber numberWithUnsignedInt:v3];
    uint64_t v7 = [v5 stringWithFormat:@"%@", v6];
LABEL_5:
    v8 = (__CFString *)v7;
  }
  else
  {
    v8 = 0;
    switch((int)v3)
    {
      case 1:
      case 2:
      case 4:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 17:
      case 18:
      case 20:
      case 21:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 29:
      case 30:
      case 31:
      case 33:
      case 34:
      case 35:
      case 36:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
        v6 = [a1 localizationKeyForTripleClickOption:v3];
        uint64_t v7 = AXParameterizedLocalizedString(1, v6, v9, v10, v11, v12, v13, v14, v17);
        goto LABEL_5;
      case 13:
        v8 = @"Loc Caption Panel";
        break;
      case 16:
        v8 = @"AX Development Tools";
        break;
      case 22:
        v16 = AXAssistiveTouchIconTypeDetectionMode;
        goto LABEL_13;
      case 28:
        v16 = AXAssistiveTouchIconTypeWatchRemoteScreen;
LABEL_13:
        soft_AXUIAssistiveTouchStringForName(*v16);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        break;
    }
  }

  return v8;
}

+ (id)domainAccessorForTripleClickOption:(int)a3
{
  uint64_t v3 = (id *)MEMORY[0x1E4FB8FD8];
  if (a3 == 11) {
    uint64_t v3 = (id *)MEMORY[0x1E4FB9338];
  }
  id v4 = *v3;
  int v5 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v6 = [v5 getActivePairedDevice];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:v4 pairedDevice:v6];

  return v7;
}

+ (BOOL)valueForTripleClickOption:(int)a3
{
  return [a1 valueForTripleClickOption:*(void *)&a3 fromSource:0];
}

+ (BOOL)valueForTripleClickOption:(int)a3 fromSource:(int64_t)a4
{
  switch(a4)
  {
    case 3:
      return [a1 _localValueForTripleClickOption:*(void *)&a3];
    case 1:
      return [a1 _npsValueForTripleClickOption:*(void *)&a3];
    case 0:
      return [a1 _localValueForTripleClickOption:*(void *)&a3];
  }
  return 0;
}

+ (BOOL)_localValueForTripleClickOption:(int)a3
{
  char v3 = 0;
  switch(a3)
  {
    case 1:
      int CategoryEnabled = _AXSVoiceOverTouchEnabled();
      return CategoryEnabled != 0;
    case 2:
      int CategoryEnabled = _AXSInvertColorsEnabledGlobalCached();
      return CategoryEnabled != 0;
    case 4:
      return [a1 valueForZoomTripleClickOption];
    case 6:
      int CategoryEnabled = _AXSAssistiveTouchEnabled();
      return CategoryEnabled != 0;
    case 7:
      v6 = +[AXBackBoardServer server];
      char v7 = [v6 isGuidedAccessActive];
      goto LABEL_28;
    case 9:
      int CategoryEnabled = _AXSAssistiveTouchScannerEnabled();
      return CategoryEnabled != 0;
    case 10:
      v8 = +[AXBackBoardServer server];
      int v9 = [v8 supportsAccessibilityDisplayFilters];

      if (v9) {
        int CategoryEnabled = MADisplayFilterPrefGetCategoryEnabled();
      }
      else {
        int CategoryEnabled = _AXSGrayscaleEnabled();
      }
      return CategoryEnabled != 0;
    case 11:
      v6 = +[AXSettings sharedInstance];
      char v7 = [v6 touchAccommodationsEnabled];
      goto LABEL_28;
    case 13:
      v6 = +[AXSettings sharedInstance];
      char v7 = [v6 localizationQACaptionMode];
      goto LABEL_28;
    case 14:
      int CategoryEnabled = _AXSReduceWhitePointEnabled();
      return CategoryEnabled != 0;
    case 15:
      v6 = +[AXSettings sharedInstance];
      char v7 = [v6 classicInvertColors];
      goto LABEL_28;
    case 17:
      int CategoryEnabled = _AXSCommandAndControlEnabled();
      return CategoryEnabled != 0;
    case 18:
      int CategoryEnabled = _AXSFullKeyboardAccessEnabled();
      return CategoryEnabled != 0;
    case 20:
      int CategoryEnabled = _AXSEnhanceBackgroundContrastEnabledGlobal();
      return CategoryEnabled != 0;
    case 21:
      int CategoryEnabled = _AXDarkenSystemColorsGlobal();
      return CategoryEnabled != 0;
    case 22:
      if (!_AXSVoiceOverTouchEnabled()) {
        return 0;
      }
      v6 = +[AXSettings sharedInstance];
      char v7 = [v6 liveRecognitionActive];
LABEL_28:
      BOOL v13 = v7;

      return v13;
    case 23:
      int CategoryEnabled = _AXSWatchControlEnabled();
      return CategoryEnabled != 0;
    case 24:
      int CategoryEnabled = _AXSReduceMotionEnabledGlobal();
      return CategoryEnabled != 0;
    case 25:
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2050000000;
      uint64_t v10 = (void *)getHUComfortSoundsSettingsClass_softClass;
      v29 = (void *)getHUComfortSoundsSettingsClass_softClass;
      if (!getHUComfortSoundsSettingsClass_softClass)
      {
        uint64_t v21 = MEMORY[0x1E4F143A8];
        uint64_t v22 = 3221225472;
        v23 = __getHUComfortSoundsSettingsClass_block_invoke;
        v24 = &unk_1E5585E30;
        v25 = &v26;
        __getHUComfortSoundsSettingsClass_block_invoke((uint64_t)&v21);
        uint64_t v10 = (void *)v27[3];
      }
      id v11 = v10;
      _Block_object_dispose(&v26, 8);
      uint64_t v12 = [v11 sharedInstance];
      char v3 = [v12 comfortSoundsEnabled];
      goto LABEL_51;
    case 26:
      v6 = +[AXSettings sharedInstance];
      char v7 = [v6 leftRightBalanceEnabled];
      goto LABEL_28;
    case 27:
      int CategoryEnabled = _AXSHoverTextEnabled();
      return CategoryEnabled != 0;
    case 28:
      return _AXSTwiceRemoteScreenEnabled() && _AXSTwiceRemoteScreenPlatform() == 0;
    case 29:
      int CategoryEnabled = _AXSLiveTranscriptionEnabled();
      return CategoryEnabled != 0;
    case 33:
      int CategoryEnabled = _AXSLiveSpeechEnabled();
      return CategoryEnabled != 0;
    case 35:
      int CategoryEnabled = _AXSPhotosensitiveMitigationEnabled();
      return CategoryEnabled != 0;
    case 36:
      int CategoryEnabled = _AXSMotionCuesActive();
      return CategoryEnabled != 0;
    case 38:
      int CategoryEnabled = _AXSHapticMusicEnabled();
      return CategoryEnabled != 0;
    case 39:
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      uint64_t v14 = (void (*)(void))getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsSymbolLoc_ptr;
      v29 = getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsSymbolLoc_ptr;
      if (!getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsSymbolLoc_ptr)
      {
        uint64_t v21 = MEMORY[0x1E4F143A8];
        uint64_t v22 = 3221225472;
        v23 = __getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsSymbolLoc_block_invoke;
        v24 = &unk_1E5585E30;
        v25 = &v26;
        v15 = (void *)PersonalAudioLibrary();
        v27[3] = (uint64_t)dlsym(v15, "paCurrentBluetoothDeviceSupportingTransparencyAccommodations");
        getpaCurrentBluetoothDeviceSupportingTransparencyAccommodationsSymbolLoc_ptr = *(_UNKNOWN **)(v25[1] + 24);
        uint64_t v14 = (void (*)(void))v27[3];
      }
      _Block_object_dispose(&v26, 8);
      if (!v14) {
        +[AXTripleClickHelpers _localValueForTripleClickOption:]();
      }
      uint64_t v12 = v14();
      v16 = [v12 address];
      if (![v16 length]
        || !soft_paCurrentRouteSupportsTransparencyAccommodations()
        || !soft_paBluetoothDeviceSupportsSSL(v12))
      {
        char v3 = 0;
        goto LABEL_50;
      }
      uint64_t v17 = [getPASettingsClass() sharedInstance];
      if ([v17 personalMediaEnabled])
      {
        int v18 = [v12 listeningMode];

        if (v18 == 3)
        {
          v19 = [getPASettingsClass() sharedInstance];
          char v20 = [v19 transparencyCustomizedForAddress:v16];
          goto LABEL_59;
        }
      }
      else
      {
      }
      v19 = [getPASettingsClass() sharedInstance];
      char v20 = [v19 sslEnabledForAddress:v16];
LABEL_59:
      char v3 = v20;

LABEL_50:
LABEL_51:

      return v3;
    case 40:
      int CategoryEnabled = _AXSHoverTextTypingEnabled();
      return CategoryEnabled != 0;
    case 41:
      int CategoryEnabled = _AXSIncreaseBrightnessFloorEnabled();
      return CategoryEnabled != 0;
    case 42:
      int CategoryEnabled = _AXSOnDeviceEyeTrackingEnabled();
      return CategoryEnabled != 0;
    default:
      return v3;
  }
}

+ (BOOL)valueForZoomTripleClickOption
{
  return _AXSZoomTouchEnabled() != 0;
}

+ (int64_t)stateForTripleClickOption:(int)a3
{
  if (a3 <= 0x22 && ((1 << a3) & 0x4C0401008) != 0) {
    return 0;
  }
  if (objc_msgSend(a1, "valueForTripleClickOption:", v3, v4)) {
    return 1;
  }
  return 2;
}

+ (id)_npsKeyForTripleClickOption:(int)a3
{
  uint64_t v3 = 0;
  if (a3 > 19)
  {
    if (a3 > 25)
    {
      if (a3 == 26)
      {
        uint64_t v4 = (id *)MEMORY[0x1E4FB91E0];
      }
      else
      {
        if (a3 != 33) {
          goto LABEL_21;
        }
        uint64_t v4 = (id *)MEMORY[0x1E4FB91F0];
      }
    }
    else if (a3 == 20)
    {
      uint64_t v4 = (id *)MEMORY[0x1E4FB9120];
    }
    else
    {
      if (a3 != 24) {
        goto LABEL_21;
      }
      uint64_t v4 = (id *)MEMORY[0x1E4FB9298];
    }
  }
  else if (a3 > 9)
  {
    if (a3 == 10)
    {
      uint64_t v3 = @"ColorFiltersEnabled";
      goto LABEL_21;
    }
    if (a3 != 11) {
      goto LABEL_21;
    }
    uint64_t v4 = (id *)kAXSTouchAccommodationsEnabledPreference;
  }
  else if (a3 == 1)
  {
    uint64_t v4 = (id *)MEMORY[0x1E4FB9390];
  }
  else
  {
    if (a3 != 4) {
      goto LABEL_21;
    }
    uint64_t v4 = (id *)MEMORY[0x1E4FB93C8];
  }
  uint64_t v3 = (__CFString *)*v4;
LABEL_21:

  return v3;
}

+ (BOOL)_npsValueForTripleClickOption:(int)a3
{
  if (a3 == 23)
  {
    if (!WatchControlSettingsLibraryCore()) {
      return 0;
    }
    uint64_t v3 = [getWatchControlSettingsClass() sharedInstance];
    char v4 = [v3 featureEnabled];
  }
  else
  {
    uint64_t v5 = *(void *)&a3;
    uint64_t v3 = objc_msgSend(a1, "domainAccessorForTripleClickOption:");
    char v7 = [a1 _npsKeyForTripleClickOption:v5];
    v8 = [v3 domain];

    char v4 = 0;
    if (v8 && v7)
    {
      id v9 = (id)[v3 synchronize];
      char v4 = [v3 BOOLForKey:v7];
    }
  }
  return v4;
}

+ (void)_npsSyncTripleClickOption:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a1, "domainAccessorForTripleClickOption:");
  v6 = [a1 _npsKeyForTripleClickOption:v3];
  char v7 = [v5 domain];

  if (v7 && v6)
  {
    v8 = objc_opt_new();
    id v9 = [v5 domain];
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = v6;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v12 = [v10 setWithArray:v11];
    [v8 synchronizeUserDefaultsDomain:v9 keys:v12];
  }
}

+ (void)_toggleVoiceOver
{
  if (!_AXSVoiceOverTouchUsageConfirmed()) {
    _AXSVoiceOverTouchSetUsageConfirmed();
  }
  int v2 = _AXSVoiceOverTouchEnabled();
  if (!v2 && _AXSCanDisableApplicationAccessibility()) {
    _AXSApplicationAccessibilitySetEnabled();
  }
  _AXSVoiceOverTouchSetEnabled();

  MEMORY[0x1F41791B8](v2 == 0, v3);
}

+ (void)_promptToDisableBrightnessFilters:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  char v16 = [a1 _isAccessibilityAppIntentsProcess];
  v8 = +[AXSpringBoardServer server];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__AXTripleClickHelpers__promptToDisableBrightnessFilters_data___block_invoke;
  v10[3] = &unk_1E5585E98;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = &v13;
  [v8 showAlert:7 withHandler:v10 withData:v7];

  while (*((unsigned char *)v14 + 24))
  {
    CFRunLoopGetCurrent();
    CFRunLoopRunSpecific();
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __63__AXTripleClickHelpers__promptToDisableBrightnessFilters_data___block_invoke(uint64_t result, int a2)
{
  uint64_t v2 = result;
  if (a2 == 1)
  {
    (*(void (**)(void))(*(void *)(result + 32) + 16))();
    result = _AXSScreenFilterSetShowInitialAlert();
  }
  *(unsigned char *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = 0;
  return result;
}

+ (id)_displayFilterUIClient
{
  if (_displayFilterUIClient_onceToken != -1) {
    dispatch_once(&_displayFilterUIClient_onceToken, &__block_literal_global_1);
  }
  uint64_t v2 = (void *)_displayFilterUIClient_DisplayFilterUIClient;

  return v2;
}

uint64_t __46__AXTripleClickHelpers__displayFilterUIClient__block_invoke()
{
  _displayFilterUIClient_DisplayFilterUIClient = [objc_alloc((Class)getAXUIClientClass()) initWithIdentifier:@"HomeClickController" serviceBundleName:@"DisplayFilterUIServer"];

  return MEMORY[0x1F41817F8]();
}

+ (void)_toggleSmartInvertColorsOffMainThread
{
  int v3 = _AXSInvertColorsEnabledGlobalCached();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__AXTripleClickHelpers__toggleSmartInvertColorsOffMainThread__block_invoke;
  v8[3] = &__block_descriptor_41_e5_v8__0l;
  v8[4] = a1;
  BOOL v9 = v3 != 0;
  char v4 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v8);
  v4[2](v4, v5, v6, v7);
}

void __61__AXTripleClickHelpers__toggleSmartInvertColorsOffMainThread__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AXSettings sharedInstance];
  int v3 = [v2 classicInvertColors];

  if (v3)
  {
    char v4 = +[AXSettings sharedInstance];
    [v4 setClassicInvertColors:0];
  }
  uint64_t v5 = [MEMORY[0x1E4F48368] sharedInstance];
  char v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F48368] identifier];
    v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = AXColorizeFormatLog();
      id v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v11;
        _os_log_impl(&dword_18D308000, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  uint64_t v12 = [*(id *)(a1 + 32) _displayFilterUIClient];
  uint64_t v13 = [MEMORY[0x1E4F482E0] mainAccessQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__AXTripleClickHelpers__toggleSmartInvertColorsOffMainThread__block_invoke_503;
  v14[3] = &__block_descriptor_33_e34_v24__0__NSDictionary_8__NSError_16l;
  char v15 = *(unsigned char *)(a1 + 40);
  [v12 sendAsynchronousMessage:MEMORY[0x1E4F1CC08] withIdentifier:1 targetAccessQueue:v13 completion:v14];
}

uint64_t __61__AXTripleClickHelpers__toggleSmartInvertColorsOffMainThread__block_invoke_503(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 objectForKeyedSubscript:@"animationDuration"];
  [v2 doubleValue];

  int v3 = [MEMORY[0x1E4F48368] sharedInstance];
  char v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F48368] identifier];
    char v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = AXColorizeFormatLog();
      os_log_type_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v12 = v9;
        _os_log_impl(&dword_18D308000, v6, v7, "%{public}@", buf, 0xCu);
      }
    }
  }
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __61__AXTripleClickHelpers__toggleSmartInvertColorsOffMainThread__block_invoke_510(uint64_t a1)
{
  _AXSInvertColorsSetEnabled();
  if (!*(unsigned char *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v3 = +[AXSettings sharedInstance];
    [v3 setLastSmartInvertColorsEnablement:Current];
  }
}

+ (void)_toggleClassicInvertColors
{
  id v4 = +[AXSettings sharedInstance];
  uint64_t v2 = [v4 classicInvertColors] ^ 1;
  id v3 = +[AXSettings sharedInstance];
  [v3 setClassicInvertColors:v2];
}

+ (void)toggleColorFilter
{
  BOOL v2 = MADisplayFilterPrefGetCategoryEnabled() == 0;

  MEMORY[0x1F40ED030](1, v2);
}

+ (void)toggleZoomOffMainThread
{
  id v4 = +[AXSettings sharedInstance];
  uint64_t v2 = [v4 zoomEnabled] ^ 1;
  id v3 = +[AXSettings sharedInstance];
  [v3 setZoomEnabled:v2];
}

+ (void)toggleLiveSpeech
{
  if (_os_feature_enabled_impl())
  {
    _AXSLiveSpeechEnabled();
    _AXSLiveSpeechSetEnabled();
  }
}

+ (void)toggleHoverText
{
  id v4 = +[AXSettings sharedInstance];
  uint64_t v2 = [v4 hoverTextEnabled] ^ 1;
  id v3 = +[AXSettings sharedInstance];
  [v3 setHoverTextEnabled:v2];
}

+ (void)toggleHoverTextTyping
{
  BOOL v2 = _AXSHoverTextTypingEnabled() == 0;

  MEMORY[0x1F4178C90](v2, v3);
}

+ (void)_disableSwitchControlWithHandler:(id)a3
{
  id v3 = a3;
  if ((_disableSwitchControlWithHandler___isDisableSwitchAlertVisible & 1) == 0)
  {
    _disableSwitchControlWithHandler___isDisableSwitchAlertVisible = 1;
    id v4 = +[AXSpringBoardServer server];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__AXTripleClickHelpers__disableSwitchControlWithHandler___block_invoke;
    v5[3] = &unk_1E5585F20;
    id v6 = v3;
    [v4 showAlert:9 withHandler:v5];
  }
}

uint64_t __57__AXTripleClickHelpers__disableSwitchControlWithHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v2 = result;
    _AXSAssistiveTouchScannerSetEnabled();
    result = *(void *)(v2 + 32);
    if (result) {
      result = (*(uint64_t (**)(void))(result + 16))();
    }
  }
  _disableSwitchControlWithHandler___isDisableSwitchAlertVisible = 0;
  return result;
}

+ (void)_toggleAssistiveTouch
{
  int v3 = _AXSAssistiveTouchScannerEnabled();
  int v4 = _AXSAssistiveTouchEnabled();
  int v5 = v4;
  if (!v3 || v4)
  {
    _AXSAssistiveTouchSetEnabled();
    if (!v5)
    {
      MEMORY[0x1F4178930](1, v6);
    }
  }
  else
  {
    [a1 _disableSwitchControlWithHandler:&__block_literal_global_517];
  }
}

uint64_t __45__AXTripleClickHelpers__toggleAssistiveTouch__block_invoke()
{
  _AXSAssistiveTouchSetEnabled();

  return MEMORY[0x1F4178930](1, v0);
}

+ (void)toggleReduceWhitePoint
{
  BOOL v2 = _AXSReduceWhitePointEnabled() == 0;

  MEMORY[0x1F4178FD0](v2, v3);
}

+ (BOOL)isReduceWhitePointEnabled
{
  return _AXSReduceWhitePointEnabled() != 0;
}

+ (void)toggleGuidedAccess
{
  int IsBackboard = AXProcessIsBackboard();
  uint64_t v3 = +[AXBackBoardServer server];
  id v7 = v3;
  if (IsBackboard)
  {
    [v3 toggleGuidedAccess];
  }
  else
  {
    int v4 = [v3 guidedAccessEffectiveAppBundleIdentifier];

    int v5 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__AXTripleClickHelpers_toggleGuidedAccess__block_invoke;
    block[3] = &unk_1E5585F48;
    id v9 = v4;
    id v6 = v4;
    dispatch_async(v5, block);
  }
}

void __42__AXTripleClickHelpers_toggleGuidedAccess__block_invoke(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openApplicationWithBundleID:*(void *)(a1 + 32)];

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  int v4 = MEMORY[0x1E4F14428];

  dispatch_after(v3, v4, &__block_literal_global_520);
}

void __42__AXTripleClickHelpers_toggleGuidedAccess__block_invoke_2()
{
  id v0 = +[AXBackBoardServer server];
  [v0 toggleGuidedAccess];
}

+ (void)toggleFullKeyboardAccess
{
  int v3 = _AXSFullKeyboardAccessEnabled();
  BOOL v4 = v3 != 0;
  if (v3)
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    char v11 = [a1 _isAccessibilityAppIntentsProcess];
    int v5 = +[AXSpringBoardServer server];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__AXTripleClickHelpers_toggleFullKeyboardAccess__block_invoke;
    v6[3] = &unk_1E5585F70;
    BOOL v7 = v4;
    v6[4] = &v8;
    [v5 showAlert:18 withHandler:v6];

    while (*((unsigned char *)v9 + 24))
    {
      CFRunLoopGetCurrent();
      CFRunLoopRunSpecific();
    }
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    _AXSFullKeyboardAccessSetEnabled();
  }
}

uint64_t __48__AXTripleClickHelpers_toggleFullKeyboardAccess__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  if (!a2) {
    result = _AXSFullKeyboardAccessSetEnabled();
  }
  *(unsigned char *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = 0;
  return result;
}

+ (void)attemptToToggleTwiceRemoteScreen
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D308000, log, OS_LOG_TYPE_ERROR, "Can't start remote screen on this device", v1, 2u);
}

+ (void)attemptToEnterClarityBoard
{
  uint64_t v2 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v3 = [v2 processIdentifier];

  BOOL v4 = NSString;
  int v5 = [NSNumber numberWithInt:v3];
  id v9 = [v4 stringWithFormat:@"ClarityUIClientIdentifier-%@", v5];

  id v6 = (void *)[objc_alloc((Class)getAXUIClientClass()) initWithIdentifier:v9 serviceBundleName:@"ClarityUIServer"];
  uint64_t v7 = AXTripleClickAttemptToEnterClarityBoardMessageIdentifier;
  uint64_t v8 = [MEMORY[0x1E4F482E0] mainAccessQueue];
  [v6 sendAsynchronousMessage:0 withIdentifier:v7 targetAccessQueue:v8 completion:&__block_literal_global_529];
}

void __50__AXTripleClickHelpers_attemptToEnterClarityBoard__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = CLFLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__AXTripleClickHelpers_attemptToEnterClarityBoard__block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

+ (void)attemptToPresentNearbyDeviceControlPicker
{
  id v2 = +[AXSpringBoardServer server];
  [v2 presentNearbyDeviceControlPicker];
}

+ (void)toggleHearingControlCenter
{
  id v2 = +[AXSpringBoardServer server];
  [v2 setHearingAidControlVisible:1];
}

+ (void)toggleOnDeviceEyeTracking
{
  BOOL v2 = _AXSOnDeviceEyeTrackingEnabled() == 0;
  id v3 = +[AXSettings sharedInstance];
  [v3 setAssistiveTouchMouseOnDeviceEyeTrackingEnabled:v2];
}

+ (void)attemptToToggleConversationBoost
{
  id v2 = +[AXSpringBoardServer server];
  [v2 toggleConversationBoost];
}

+ (void)toggleTripleClickOption:(int)a3
{
}

+ (void)toggleTripleClickOption:(int)a3 fromSource:(int64_t)a4
{
  switch(a4)
  {
    case 3:
      [a1 _handleToggleTripleClickTriggeredFromAppIntent:*(void *)&a3];
      break;
    case 1:
      [a1 _npsToggleTripleClickOption:*(void *)&a3];
      break;
    case 0:
      [a1 _localToggleTripleClickOption:*(void *)&a3];
      break;
  }
}

+ (void)_handleToggleTripleClickTriggeredFromAppIntent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 36) {
    [a1 setMotionCuesShowBanner:0];
  }

  [a1 _localToggleTripleClickOption:v3];
}

+ (void)_localToggleTripleClickOption:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  int v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [a1 titleForTripleClickOption:v3];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_DEFAULT, "Toggling option: %@", (uint8_t *)&buf, 0xCu);
  }
  [a1 registerObserverForTripleClickOption:v3];
  switch((int)v3)
  {
    case 1:
      [a1 _toggleVoiceOver];
      break;
    case 2:
      [a1 performSelectorInBackground:sel__toggleSmartInvertColorsOffMainThread withObject:0];
      break;
    case 4:
      [a1 toggleZoomOffMainThread];
      break;
    case 6:
      [a1 _toggleAssistiveTouch];
      break;
    case 7:
      if (_AXSGuidedAccessEnabled()) {
        [a1 toggleGuidedAccess];
      }
      break;
    case 8:
      [a1 toggleHearingControlCenter];
      break;
    case 9:
      [a1 _toggleSwitchOver];
      break;
    case 10:
      uint64_t v7 = +[AXBackBoardServer server];
      int v8 = [v7 supportsAccessibilityDisplayFilters];

      if (v8)
      {
        [a1 toggleColorFilter];
      }
      else
      {
        _AXSGrayscaleEnabled();
        _AXSGrayscaleSetEnabled();
      }
      break;
    case 11:
      id v9 = +[AXSettings sharedInstance];
      int v10 = [v9 touchAccommodationsEnabled];
      char v11 = +[AXSettings sharedInstance];
      [v11 setTouchAccommodationsEnabled:v10 ^ 1u];

      break;
    case 12:
      uint64_t v12 = [getAXPISystemActionHelperClass() sharedInstance];
      [v12 startMagnifier];

      break;
    case 13:
      [a1 _toggleLocalizationCaptionPanel];
      break;
    case 14:
      [a1 toggleReduceWhitePoint];
      break;
    case 15:
      [a1 _toggleClassicInvertColors];
      break;
    case 17:
      _AXSCommandAndControlEnabled();
      _AXSCommandAndControlSetEnabled();
      break;
    case 18:
      [a1 toggleFullKeyboardAccess];
      break;
    case 20:
      uint64_t v13 = +[AXSettings sharedInstance];
      int v14 = [v13 enhanceBackgroundContrastEnabled];
      char v15 = +[AXSettings sharedInstance];
      [v15 setEnhanceBackgroundContrastEnabled:v14 ^ 1u];

      break;
    case 21:
      _AXDarkenSystemColorsGlobal();
      _AXSSetDarkenSystemColors();
      break;
    case 22:
      if (_AXSVoiceOverTouchEnabled())
      {
        char v16 = +[AXSettings sharedInstance];
        int v17 = [v16 liveRecognitionActive];

        uint64_t v18 = +[AXVoiceOverServer server];
        v19 = v18;
        if (v17) {
          [v18 triggerCommand:51];
        }
        else {
          [v18 triggerCommand:50];
        }
      }
      else
      {
        v40 = [getAXPISystemActionHelperClass() sharedInstance];
        [v40 activateDetectionMode];
      }
      break;
    case 23:
      [a1 _toggleWatchControl];
      break;
    case 24:
      char v20 = +[AXSettings sharedInstance];
      int v21 = [v20 reduceMotionEnabled];
      uint64_t v22 = +[AXSettings sharedInstance];
      [v22 setReduceMotionEnabled:v21 ^ 1u];

      break;
    case 25:
      v23 = +[AXSystemAppServer server];
      [v23 toggleBackgroundSounds];

      break;
    case 26:
      v24 = +[AXSettings sharedInstance];
      int v25 = [v24 leftRightBalanceEnabled];
      uint64_t v26 = +[AXSettings sharedInstance];
      [v26 setLeftRightBalanceEnabled:v25 ^ 1u];

      break;
    case 27:
      [a1 toggleHoverText];
      break;
    case 28:
      [a1 attemptToToggleTwiceRemoteScreen];
      break;
    case 29:
      v27 = +[AXSpringBoardServer server];
      [v27 toggleLiveTranscription];

      break;
    case 30:
      [a1 attemptToEnterClarityBoard];
      break;
    case 31:
      [a1 attemptToPresentNearbyDeviceControlPicker];
      break;
    case 33:
      [a1 toggleLiveSpeech];
      break;
    case 34:
      _AXSSetSpeakThisEnabled();
      uint64_t v41 = 0;
      v42 = &v41;
      uint64_t v43 = 0x2050000000;
      uint64_t v28 = (void *)getSpeakThisServicesClass_softClass;
      uint64_t v44 = getSpeakThisServicesClass_softClass;
      if (!getSpeakThisServicesClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v48 = __getSpeakThisServicesClass_block_invoke;
        v49 = &unk_1E5585E30;
        v50 = &v41;
        __getSpeakThisServicesClass_block_invoke((uint64_t)&buf);
        uint64_t v28 = (void *)v42[3];
      }
      id v29 = v28;
      _Block_object_dispose(&v41, 8);
      v30 = [v29 sharedInstance];
      [v30 speakThisWithOptions:12 errorHandler:0];

      break;
    case 35:
      _AXSPhotosensitiveMitigationEnabled();
      _AXSPhotosensitiveMitigationSetEnabled();
      break;
    case 36:
      int v31 = _AXSMotionCuesActive();
      v32 = AXLogMotionCues();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v31 == 0;
        _os_log_impl(&dword_18D308000, v32, OS_LOG_TYPE_DEFAULT, "Triple click: active=%{BOOL}d", (uint8_t *)&buf, 8u);
      }

      v45[0] = @"enable";
      v33 = [NSNumber numberWithUnsignedChar:v31 == 0];
      v45[1] = @"reason";
      v46[0] = v33;
      v46[1] = &unk_1EDC61FB0;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];

      AnalyticsSendEvent();
      _AXSSetMotionCuesModeAndShowBanner();
      [a1 setMotionCuesShowBanner:1];

      break;
    case 38:
      v35 = AXLogHapticMusic();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [NSNumber numberWithInt:_AXSHapticMusicEnabled() == 0];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v36;
        _os_log_impl(&dword_18D308000, v35, OS_LOG_TYPE_DEFAULT, "Turning on haptic music from TC (new value: %@)", (uint8_t *)&buf, 0xCu);
      }
      _AXSHapticMusicEnabled();
      _AXSSetHapticMusicEnabled();
      if (_AXSHapticMusicEnabled())
      {
        v37 = +[AXSettings sharedInstance];
        char v38 = [v37 hapticMusicActive];

        if ((v38 & 1) == 0)
        {
          v39 = +[AXSettings sharedInstance];
          [v39 setHapticMusicActive:1];
        }
      }
      break;
    case 39:
      [a1 attemptToToggleConversationBoost];
      break;
    case 40:
      [a1 toggleHoverTextTyping];
      break;
    case 42:
      [a1 toggleOnDeviceEyeTracking];
      break;
    default:
      break;
  }
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __54__AXTripleClickHelpers__localToggleTripleClickOption___block_invoke(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)[*(id *)(a1 + 32) tripleClickOptionDidChangeNotification];
  uint64_t v3 = (const void *)[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, v2, v3, 0, 1u);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v2, 0, 0, 1u);
}

+ (BOOL)switchControlRendersDeviceUnusable
{
  return SwitchControlRendersDeviceUnusable;
}

+ (void)setSwitchControlRendersDeviceUnusable:(BOOL)a3
{
  SwitchControlRendersDeviceUnusable = a3;
}

+ (BOOL)switchControlHasScreenSwitch
{
  return SwitchControlHasScreenSwitch;
}

+ (void)setSwitchControlHasScreenSwitch:(BOOL)a3
{
  SwitchControlHasScreenSwitch = a3;
}

+ (BOOL)motionCuesShowBanner
{
  return MotionCuesShowBanner;
}

+ (void)setMotionCuesShowBanner:(BOOL)a3
{
  MotionCuesShowBanner = a3;
}

+ (void)_toggleSwitchOverOffMainThread
{
  if (!_AXSAssistiveTouchScannerEnabled()
    || SwitchControlRendersDeviceUnusable | SwitchControlHasScreenSwitch)
  {
    _AXSAssistiveTouchScannerSetEnabled();
  }
  else
  {
    [a1 _disableSwitchControlWithHandler:0];
  }
}

+ (void)_toggleLocalizationCaptionPanel
{
  id v4 = +[AXSettings sharedInstance];
  uint64_t v2 = [v4 localizationQACaptionMode] ^ 1;
  uint64_t v3 = +[AXSettings sharedInstance];
  [v3 setLocalizationQACaptionMode:v2];
}

+ (void)_toggleSwitchOver
{
}

+ (void)registerObserverForTripleClickOption:(int)a3
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v4 = AXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_DEFAULT, "Should register observer(s) for triple click option", buf, 2u);
  }

  if (!RegisteredTripleClickObservers)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v6 = (void *)RegisteredTripleClickObservers;
    RegisteredTripleClickObservers = (uint64_t)v5;
  }
  uint64_t v7 = 0;
  switch(a3)
  {
    case 1:
    case 5:
      v50[0] = *MEMORY[0x1E4FB9388];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = v50;
      goto LABEL_27;
    case 2:
      uint64_t v49 = *MEMORY[0x1E4FB91D8];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v49;
      goto LABEL_27;
    case 4:
      uint64_t v44 = *MEMORY[0x1E4FB93B8];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v44;
      goto LABEL_27;
    case 6:
      uint64_t v43 = *MEMORY[0x1E4FB9088];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v43;
      goto LABEL_27;
    case 9:
      uint64_t v42 = *MEMORY[0x1E4FB9088];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v42;
      goto LABEL_27;
    case 10:
      uint64_t v10 = *MEMORY[0x1E4FB9160];
      v47[0] = *MEMORY[0x1E4FB9278];
      v47[1] = v10;
      uint64_t v11 = *MEMORY[0x1E4FB9328];
      v47[2] = *MEMORY[0x1E4FB90D8];
      v47[3] = v11;
      v47[4] = *MEMORY[0x1E4FB9158];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = v47;
      uint64_t v12 = 5;
      goto LABEL_28;
    case 14:
      uint64_t v48 = *MEMORY[0x1E4FB92A8];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v48;
      goto LABEL_27;
    case 15:
      uint64_t v41 = *MEMORY[0x1E4FB90F0];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v41;
      goto LABEL_27;
    case 17:
      uint64_t v37 = *MEMORY[0x1E4FB9100];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v37;
      goto LABEL_27;
    case 18:
      uint64_t v36 = *MEMORY[0x1E4FB9140];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v36;
      goto LABEL_27;
    case 20:
      uint64_t v39 = *MEMORY[0x1E4FB9118];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v39;
      goto LABEL_27;
    case 21:
      uint64_t v40 = *MEMORY[0x1E4FB9108];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v40;
      goto LABEL_27;
    case 24:
      uint64_t v38 = *MEMORY[0x1E4FB9290];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v38;
      goto LABEL_27;
    case 27:
      uint64_t v46 = *MEMORY[0x1E4FB91C0];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v46;
      goto LABEL_27;
    case 29:
      uint64_t v35 = *MEMORY[0x1E4FB91F8];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v35;
      goto LABEL_27;
    case 33:
      uint64_t v45 = *MEMORY[0x1E4FB91E8];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v45;
      goto LABEL_27;
    case 34:
      uint64_t v30 = *MEMORY[0x1E4FB92F8];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v30;
      goto LABEL_27;
    case 35:
      uint64_t v31 = *MEMORY[0x1E4FB9230];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v31;
      goto LABEL_27;
    case 36:
      uint64_t v34 = *MEMORY[0x1E4FB9218];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v34;
      goto LABEL_27;
    case 38:
      uint64_t v33 = *MEMORY[0x1E4FB9188];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v33;
      goto LABEL_27;
    case 40:
      uint64_t v32 = *MEMORY[0x1E4FB91C8];
      int v8 = (void *)MEMORY[0x1E4F1C978];
      id v9 = &v32;
LABEL_27:
      uint64_t v12 = 1;
LABEL_28:
      uint64_t v7 = [v8 arrayWithObjects:v9 count:v12];
      break;
    default:
      break;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v24;
    *(void *)&long long v15 = 138412290;
    long long v22 = v15;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v13);
        }
        CFStringRef v19 = *(const __CFString **)(*((void *)&v23 + 1) + 8 * i);
        if ((objc_msgSend((id)RegisteredTripleClickObservers, "containsObject:", v19, v22, (void)v23) & 1) == 0)
        {
          char v20 = AXLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v22;
            CFStringRef v28 = v19;
            _os_log_impl(&dword_18D308000, v20, OS_LOG_TYPE_DEFAULT, "Registering triple click notification observer for %@", buf, 0xCu);
          }

          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_handleTripleClickPrefNotificationChanged, v19, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
          [(id)RegisteredTripleClickObservers addObject:v19];
        }
      }
      uint64_t v16 = [v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v16);
  }
}

+ (void)_npsToggleTripleClickOption:(int)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 23)
  {
    if (WatchControlSettingsLibraryCore())
    {
      uint64_t v3 = [getWatchControlSettingsClass() sharedInstance];
      int v4 = [v3 featureEnabled];

      id v17 = [getWatchControlSettingsClass() sharedInstance];
      [v17 setFeatureEnabled:v4 ^ 1u];
    }
  }
  else
  {
    uint64_t v5 = *(void *)&a3;
    uint64_t v7 = objc_msgSend(a1, "domainAccessorForTripleClickOption:");
    int v8 = [a1 _npsKeyForTripleClickOption:v5];
    id v9 = [v7 domain];

    if (v9 && v8)
    {
      int v10 = [v7 BOOLForKey:v8];
      if ([v8 isEqualToString:*MEMORY[0x1E4FB91E0]])
      {
        _AXSLeftRightAudioBalance();
        objc_msgSend(v7, "setFloat:forKey:", v8);
      }
      else
      {
        [v7 setBool:v10 ^ 1u forKey:v8];
      }
      id v11 = (id)[v7 synchronize];
      uint64_t v12 = objc_opt_new();
      id v13 = [v7 domain];
      uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
      v18[0] = v8;
      long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      uint64_t v16 = [v14 setWithArray:v15];
      [v12 synchronizeUserDefaultsDomain:v13 keys:v16];
    }
  }
}

+ (id)allTripleClickOptions
{
  return (id)[a1 allTripleClickOptionsForPlatform:0];
}

+ (id)allTripleClickOptionsForPlatform:(int64_t)a3
{
  if (a3 == 2) {
    [a1 _allAvailableFeaturesWatchOS];
  }
  else {
  uint64_t v3 = [a1 _allAvailableFeaturesIOS];
  }

  return v3;
}

+ (id)_allAvailableFeaturesIOS
{
  return &unk_1EDC63150;
}

+ (id)_allAvailableFeaturesWatchOS
{
  return &unk_1EDC63168;
}

+ (id)_availableFeatures
{
  uint64_t v2 = (void *)_AXSTripleClickCopyOptions();

  return v2;
}

+ (BOOL)_shouldShowFeatureInShortcutsControlCenterModule:(int)a3 includeGuidedAccess:(BOOL)a4
{
  if (a3 == 7)
  {
    if (a4) {
      return 1;
    }
  }
  else if (a3 != 8)
  {
    return 1;
  }
  return 0;
}

+ (id)tripleClickOptionsForAccessibilityShortcutControlCenterModuleIncludingGuidedAccess:(BOOL)a3
{
  uint64_t v5 = [a1 _availableFeatures];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __107__AXTripleClickHelpers_tripleClickOptionsForAccessibilityShortcutControlCenterModuleIncludingGuidedAccess___block_invoke;
  v8[3] = &__block_descriptor_41_e21_B24__0__NSNumber_8Q16l;
  v8[4] = a1;
  BOOL v9 = a3;
  id v6 = [v5 axFilterObjectsUsingBlock:v8];

  return v6;
}

uint64_t __107__AXTripleClickHelpers_tripleClickOptionsForAccessibilityShortcutControlCenterModuleIncludingGuidedAccess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 intValue];
  unsigned int v4 = [*(id *)(a1 + 32) _shouldShowFeatureInShortcutsControlCenterModule:v3 includeGuidedAccess:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v5 = +[AXTripleClickHelpers titleForTripleClickOption:v3];
  uint64_t v6 = [v5 length];

  if (v6) {
    return v4;
  }
  else {
    return 0;
  }
}

+ (BOOL)_isAccessibilityAppIntentsProcess
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.AccessibilityUIServer.AccessibilityAppIntents"];

  return v4;
}

+ (void)localizationKeyForTripleClickOption:.cold.1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *soft_AXUILocalizedStringForKeyWithTable(NSString *__strong, NSString *__strong)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXTripleClickHelpers.m", 41, @"%s", dlerror());

  __break(1u);
}

+ (void)_localValueForTripleClickOption:.cold.1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"BluetoothDevice *soft_paCurrentBluetoothDeviceSupportingTransparencyAccommodations(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXTripleClickHelpers.m", 85, @"%s", dlerror());

  __break(1u);
}

void __50__AXTripleClickHelpers_attemptToEnterClarityBoard__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Error attempting to enter ClarityBoard: %@", (uint8_t *)&v2, 0xCu);
}

@end