void sub_2224(uint64_t a1, void *a2)
{
  unsigned int v3;
  void *v4;
  id v5;
  uint64_t vars8;

  v3 = [a2 intValue];
  if (v3 <= 4)
  {
    v4 = *(void **)(a1 + 32);
    v5 = +[NSNumber numberWithUnsignedInteger:qword_C3C0[v3]];
    [v4 addObject:v5];
  }
}

void sub_52F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5328(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = [a2 objectForKeyedSubscript:@"Default"];
  unsigned int v7 = [v6 BOOLValue];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

id sub_60A0(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:@"RotorItem"];
  v4 = [*(id *)(a1 + 32) identifier];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

BOOL sub_94B4(id a1, NSDictionary *a2, unint64_t a3, BOOL *a4)
{
  v4 = a2;
  id v5 = [(NSDictionary *)v4 objectForKeyedSubscript:@"RotorItem"];
  if ([v5 isEqualToString:kAXSVoiceOverTouchRotorItemNavigationDirection])
  {
    v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"Enabled"];
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

void sub_9838(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_9854(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_988C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_98C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_98FC(uint64_t a1, uint64_t a2)
{
  int v2 = 138543874;
  uint64_t v3 = kAXSVoiceOverTouchShouldRouteToSpeakerWithProximityPreference;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "AX: Value for %{public}@ in %{public}@ was not a number, but %@. That's extremely unexpected.", (uint8_t *)&v2, 0x20u);
}

uint64_t AXAssistiveTouchDefaultIconTypeForMouseButton()
{
  return _AXAssistiveTouchDefaultIconTypeForMouseButton();
}

uint64_t AXAssistiveTouchInsertIconsIntoDictionary()
{
  return _AXAssistiveTouchInsertIconsIntoDictionary();
}

uint64_t AXColorizeFormatLog()
{
  return _AXColorizeFormatLog();
}

uint64_t AXDeviceIsD7x()
{
  return _AXDeviceIsD7x();
}

uint64_t AXDeviceSupportsPhotosensitiveMitigation()
{
  return _AXDeviceSupportsPhotosensitiveMitigation();
}

uint64_t AXGetComponentsInOldSiriVoiceIdentifier()
{
  return _AXGetComponentsInOldSiriVoiceIdentifier();
}

uint64_t AXIsAnyPreferredLanguageRTL()
{
  return _AXIsAnyPreferredLanguageRTL();
}

uint64_t AXIsInternalInstall()
{
  return _AXIsInternalInstall();
}

uint64_t AXLanguageCanonicalFormToGeneralLanguage()
{
  return _AXLanguageCanonicalFormToGeneralLanguage();
}

uint64_t AXLogCommon()
{
  return _AXLogCommon();
}

uint64_t AXLogDataMigrator()
{
  return _AXLogDataMigrator();
}

uint64_t AXLoggerForFacility()
{
  return _AXLoggerForFacility();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return _AXOSLogLevelFromAXLogLevel();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MADisplayFilterPrefGetCategoryEnabled()
{
  return _MADisplayFilterPrefGetCategoryEnabled();
}

uint64_t MADisplayFilterPrefGetType()
{
  return _MADisplayFilterPrefGetType();
}

uint64_t MADisplayFilterPrefSetCategoryEnabled()
{
  return _MADisplayFilterPrefSetCategoryEnabled();
}

uint64_t MADisplayFilterPrefSetType()
{
  return _MADisplayFilterPrefSetType();
}

void NSLog(NSString *format, ...)
{
}

uint64_t TTSGetComponentsInNamedSiriVoiceIdentifier()
{
  return _TTSGetComponentsInNamedSiriVoiceIdentifier();
}

uint64_t UIKeyboardInputModeGetLanguageWithRegion()
{
  return _UIKeyboardInputModeGetLanguageWithRegion();
}

uint64_t _AXDarkenSystemColors()
{
  return __AXDarkenSystemColors();
}

uint64_t _AXSCopyPreferenceValue()
{
  return __AXSCopyPreferenceValue();
}

uint64_t _AXSHearingAidsSetPaired()
{
  return __AXSHearingAidsSetPaired();
}

uint64_t _AXSHearingCCEnabledOptions()
{
  return __AXSHearingCCEnabledOptions();
}

uint64_t _AXSHomeButtonRestingUnlock()
{
  return __AXSHomeButtonRestingUnlock();
}

uint64_t _AXSHomeButtonRestingUnlockPreferredForDevice()
{
  return __AXSHomeButtonRestingUnlockPreferredForDevice();
}

uint64_t _AXSLeftRightAudioBalance()
{
  return __AXSLeftRightAudioBalance();
}

uint64_t _AXSPhotosensitiveMitigationEnabled()
{
  return __AXSPhotosensitiveMitigationEnabled();
}

uint64_t _AXSPhotosensitiveMitigationSetEnabled()
{
  return __AXSPhotosensitiveMitigationSetEnabled();
}

uint64_t _AXSPointerAllowAppCustomizationSetEnabled()
{
  return __AXSPointerAllowAppCustomizationSetEnabled();
}

uint64_t _AXSPointerEffectScalingSetEnabled()
{
  return __AXSPointerEffectScalingSetEnabled();
}

uint64_t _AXSPointerIncreasedContrastSetEnabled()
{
  return __AXSPointerIncreasedContrastSetEnabled();
}

uint64_t _AXSQuickSpeakSetHighlightTextEnabled()
{
  return __AXSQuickSpeakSetHighlightTextEnabled();
}

uint64_t _AXSReduceMotionEnabled()
{
  return __AXSReduceMotionEnabled();
}

uint64_t _AXSSetInDataMigrationMode()
{
  return __AXSSetInDataMigrationMode();
}

uint64_t _AXSVoiceOverTouchBrailleContractionMode()
{
  return __AXSVoiceOverTouchBrailleContractionMode();
}

uint64_t _AXSVoiceOverTouchBrailleEightDotMode()
{
  return __AXSVoiceOverTouchBrailleEightDotMode();
}

uint64_t _AXSVoiceOverTouchBrailleMasterStatusCellIndex()
{
  return __AXSVoiceOverTouchBrailleMasterStatusCellIndex();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

uint64_t _AXSVoiceOverTouchSetBrailleMasterStatusCellIndex()
{
  return __AXSVoiceOverTouchSetBrailleMasterStatusCellIndex();
}

uint64_t _AXSVoiceOverTouchSetShouldRouteToSpeakerWithProximity()
{
  return __AXSVoiceOverTouchSetShouldRouteToSpeakerWithProximity();
}

uint64_t _AXSVoiceOverTouchSetTypingMode()
{
  return __AXSVoiceOverTouchSetTypingMode();
}

uint64_t _AXSetPreferenceWithNotification()
{
  return __AXSetPreferenceWithNotification();
}

uint64_t _AXStringForArgs()
{
  return __AXStringForArgs();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _TTSIdentifierForVoiceInformation()
{
  return __TTSIdentifierForVoiceInformation();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_ActivateBrailleScreenInput(void *a1, const char *a2, ...)
{
  return [a1 ActivateBrailleScreenInput];
}

id objc_msgSend_ActivateBrailleScreenInputCommand(void *a1, const char *a2, ...)
{
  return [a1 ActivateBrailleScreenInputCommand];
}

id objc_msgSend_BSIEscape(void *a1, const char *a2, ...)
{
  return [a1 BSIEscape];
}

id objc_msgSend_BSIExit(void *a1, const char *a2, ...)
{
  return [a1 BSIExit];
}

id objc_msgSend_BSINextRotor(void *a1, const char *a2, ...)
{
  return [a1 BSINextRotor];
}

id objc_msgSend_BSINextTextSegment(void *a1, const char *a2, ...)
{
  return [a1 BSINextTextSegment];
}

id objc_msgSend_BSINextTextSegmentType(void *a1, const char *a2, ...)
{
  return [a1 BSINextTextSegmentType];
}

id objc_msgSend_BSIPreviousRotor(void *a1, const char *a2, ...)
{
  return [a1 BSIPreviousRotor];
}

id objc_msgSend_BSIPreviousTextSegment(void *a1, const char *a2, ...)
{
  return [a1 BSIPreviousTextSegment];
}

id objc_msgSend_BSIPreviousTextSegmentType(void *a1, const char *a2, ...)
{
  return [a1 BSIPreviousTextSegmentType];
}

id objc_msgSend_BSISelectNextTextSegment(void *a1, const char *a2, ...)
{
  return [a1 BSISelectNextTextSegment];
}

id objc_msgSend_BSISelectPreviousTextSegment(void *a1, const char *a2, ...)
{
  return [a1 BSISelectPreviousTextSegment];
}

id objc_msgSend_BrailleScreenInput(void *a1, const char *a2, ...)
{
  return [a1 BrailleScreenInput];
}

id objc_msgSend_Default(void *a1, const char *a2, ...)
{
  return [a1 Default];
}

id objc_msgSend_GesturedTextInputNextBrailleTable(void *a1, const char *a2, ...)
{
  return [a1 GesturedTextInputNextBrailleTable];
}

id objc_msgSend_GesturedTextInputNextKeyboardLanguage(void *a1, const char *a2, ...)
{
  return [a1 GesturedTextInputNextKeyboardLanguage];
}

id objc_msgSend_Invalid(void *a1, const char *a2, ...)
{
  return [a1 Invalid];
}

id objc_msgSend_OneFingerQuadrupleTap(void *a1, const char *a2, ...)
{
  return [a1 OneFingerQuadrupleTap];
}

id objc_msgSend_OneFingerSplitFlickDown(void *a1, const char *a2, ...)
{
  return [a1 OneFingerSplitFlickDown];
}

id objc_msgSend_OneFingerSplitFlickLeft(void *a1, const char *a2, ...)
{
  return [a1 OneFingerSplitFlickLeft];
}

id objc_msgSend_OneFingerSplitFlickRight(void *a1, const char *a2, ...)
{
  return [a1 OneFingerSplitFlickRight];
}

id objc_msgSend_OneFingerSplitFlickUp(void *a1, const char *a2, ...)
{
  return [a1 OneFingerSplitFlickUp];
}

id objc_msgSend_OneFingerTripleTap(void *a1, const char *a2, ...)
{
  return [a1 OneFingerTripleTap];
}

id objc_msgSend_PerformLongPress(void *a1, const char *a2, ...)
{
  return [a1 PerformLongPress];
}

id objc_msgSend_SecondaryActivate(void *a1, const char *a2, ...)
{
  return [a1 SecondaryActivate];
}

id objc_msgSend_TwoDistantFingerDoubleTap(void *a1, const char *a2, ...)
{
  return [a1 TwoDistantFingerDoubleTap];
}

id objc_msgSend_TwoDistantFingerSingleTap(void *a1, const char *a2, ...)
{
  return [a1 TwoDistantFingerSingleTap];
}

id objc_msgSend_TwoDistantFingerTripleTap(void *a1, const char *a2, ...)
{
  return [a1 TwoDistantFingerTripleTap];
}

id objc_msgSend_TwoFingerFlickUp(void *a1, const char *a2, ...)
{
  return [a1 TwoFingerFlickUp];
}

id objc_msgSend_TwoFingerPinch(void *a1, const char *a2, ...)
{
  return [a1 TwoFingerPinch];
}

id objc_msgSend_TwoFingerRotateClockwise(void *a1, const char *a2, ...)
{
  return [a1 TwoFingerRotateClockwise];
}

id objc_msgSend_TwoFingerRotateCounterclockwise(void *a1, const char *a2, ...)
{
  return [a1 TwoFingerRotateCounterclockwise];
}

id objc_msgSend_TwoFingerScrub(void *a1, const char *a2, ...)
{
  return [a1 TwoFingerScrub];
}

id objc_msgSend_TwoFingerSplitFlickLeft(void *a1, const char *a2, ...)
{
  return [a1 TwoFingerSplitFlickLeft];
}

id objc_msgSend_TwoFingerSplitFlickRight(void *a1, const char *a2, ...)
{
  return [a1 TwoFingerSplitFlickRight];
}

id objc_msgSend__azulBMigrateSpeakScreenHighlightSettings(void *a1, const char *a2, ...)
{
  return [a1 _azulBMigrateSpeakScreenHighlightSettings];
}

id objc_msgSend__azulCMigrateAssistiveTouchSpeedSettings(void *a1, const char *a2, ...)
{
  return [a1 _azulCMigrateAssistiveTouchSpeedSettings];
}

id objc_msgSend__azulCMigrateVoiceOverVerbosityContainerSettings(void *a1, const char *a2, ...)
{
  return [a1 _azulCMigrateVoiceOverVerbosityContainerSettings];
}

id objc_msgSend__azulEUpdatesVoicesForSiri(void *a1, const char *a2, ...)
{
  return [a1 _azulEUpdatesVoicesForSiri];
}

id objc_msgSend__azulGUpdateCustomVoiceIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _azulGUpdateCustomVoiceIdentifiers];
}

id objc_msgSend__azulMigrateRestFingerToOpen(void *a1, const char *a2, ...)
{
  return [a1 _azulMigrateRestFingerToOpen];
}

id objc_msgSend__azulMigrateSwitchAndVOSpeechSettingsToNewDomain(void *a1, const char *a2, ...)
{
  return [a1 _azulMigrateSwitchAndVOSpeechSettingsToNewDomain];
}

id objc_msgSend__azulUnmigrateVoiceOverBrailleScreenInputTwoFingerSwipeUp(void *a1, const char *a2, ...)
{
  return [a1 _azulUnmigrateVoiceOverBrailleScreenInputTwoFingerSwipeUp];
}

id objc_msgSend__clearWhitetailMigrationSettings(void *a1, const char *a2, ...)
{
  return [a1 _clearWhitetailMigrationSettings];
}

id objc_msgSend__crystalMigrateAudioDuckingSettings(void *a1, const char *a2, ...)
{
  return [a1 _crystalMigrateAudioDuckingSettings];
}

id objc_msgSend__crystalMigrateBrailleScreenInputActivationGestureUsage(void *a1, const char *a2, ...)
{
  return [a1 _crystalMigrateBrailleScreenInputActivationGestureUsage];
}

id objc_msgSend__crystalMigrateBrailleScreenInputCommands(void *a1, const char *a2, ...)
{
  return [a1 _crystalMigrateBrailleScreenInputCommands];
}

id objc_msgSend__crystalMigrateBrailleTableReplacements(void *a1, const char *a2, ...)
{
  return [a1 _crystalMigrateBrailleTableReplacements];
}

id objc_msgSend__crystalMigrateGrayscaleSetting(void *a1, const char *a2, ...)
{
  return [a1 _crystalMigrateGrayscaleSetting];
}

id objc_msgSend__crystalMigrateHearingControlCenterOrder(void *a1, const char *a2, ...)
{
  return [a1 _crystalMigrateHearingControlCenterOrder];
}

id objc_msgSend__crystalMigratePMESettings(void *a1, const char *a2, ...)
{
  return [a1 _crystalMigratePMESettings];
}

id objc_msgSend__dawnMigrateGrayscaleSetting(void *a1, const char *a2, ...)
{
  return [a1 _dawnMigrateGrayscaleSetting];
}

id objc_msgSend__dawnMigrateJapaneseSystemBrailleTable(void *a1, const char *a2, ...)
{
  return [a1 _dawnMigrateJapaneseSystemBrailleTable];
}

id objc_msgSend__dawnSUMigratePerAppSettingsIDs(void *a1, const char *a2, ...)
{
  return [a1 _dawnSUMigratePerAppSettingsIDs];
}

id objc_msgSend__eagleMigrateBalanceSettingFromCoreAudio(void *a1, const char *a2, ...)
{
  return [a1 _eagleMigrateBalanceSettingFromCoreAudio];
}

id objc_msgSend__ensureDefaultBrailleRotorItemExists(void *a1, const char *a2, ...)
{
  return [a1 _ensureDefaultBrailleRotorItemExists];
}

id objc_msgSend__isFreshInstall(void *a1, const char *a2, ...)
{
  return [a1 _isFreshInstall];
}

id objc_msgSend__migratePreferences(void *a1, const char *a2, ...)
{
  return [a1 _migratePreferences];
}

id objc_msgSend__monarchClearSwitchControlMenuItemVersionPreferences(void *a1, const char *a2, ...)
{
  return [a1 _monarchClearSwitchControlMenuItemVersionPreferences];
}

id objc_msgSend__monarchRemoveNavigationDirectionRotorIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _monarchRemoveNavigationDirectionRotorIfNeeded];
}

id objc_msgSend__okemoMigrateBrailleOutputMode(void *a1, const char *a2, ...)
{
  return [a1 _okemoMigrateBrailleOutputMode];
}

id objc_msgSend__okemoMigrateVoiceOverGradeTwoAutoTranslate(void *a1, const char *a2, ...)
{
  return [a1 _okemoMigrateVoiceOverGradeTwoAutoTranslate];
}

id objc_msgSend__okemoMigrateVoiceOverTypingMode(void *a1, const char *a2, ...)
{
  return [a1 _okemoMigrateVoiceOverTypingMode];
}

id objc_msgSend__peaceMigrateTouchAccommodationsSettings(void *a1, const char *a2, ...)
{
  return [a1 _peaceMigrateTouchAccommodationsSettings];
}

id objc_msgSend__quickSpeakAltVoices(void *a1, const char *a2, ...)
{
  return [a1 _quickSpeakAltVoices];
}

id objc_msgSend__quickSpeakPrefersCompact(void *a1, const char *a2, ...)
{
  return [a1 _quickSpeakPrefersCompact];
}

id objc_msgSend__skyClearGryphonYushu(void *a1, const char *a2, ...)
{
  return [a1 _skyClearGryphonYushu];
}

id objc_msgSend__skyClearIrrelevantSwitchControlVoices(void *a1, const char *a2, ...)
{
  return [a1 _skyClearIrrelevantSwitchControlVoices];
}

id objc_msgSend__skyMigrateActionFeedback(void *a1, const char *a2, ...)
{
  return [a1 _skyMigrateActionFeedback];
}

id objc_msgSend__skyMigrateEmojiSetting(void *a1, const char *a2, ...)
{
  return [a1 _skyMigrateEmojiSetting];
}

id objc_msgSend__skyMigrateFeedbackOptions(void *a1, const char *a2, ...)
{
  return [a1 _skyMigrateFeedbackOptions];
}

id objc_msgSend__skyMigrateHearingDenylist(void *a1, const char *a2, ...)
{
  return [a1 _skyMigrateHearingDenylist];
}

id objc_msgSend__skyMigrateLinkFeedback(void *a1, const char *a2, ...)
{
  return [a1 _skyMigrateLinkFeedback];
}

id objc_msgSend__skyMigrateSoundDetectionSettingsToNewDomain(void *a1, const char *a2, ...)
{
  return [a1 _skyMigrateSoundDetectionSettingsToNewDomain];
}

id objc_msgSend__skyPrimeLeftRightBalance(void *a1, const char *a2, ...)
{
  return [a1 _skyPrimeLeftRightBalance];
}

id objc_msgSend__speechVoiceMigrationWhitetail(void *a1, const char *a2, ...)
{
  return [a1 _speechVoiceMigrationWhitetail];
}

id objc_msgSend__speechVoicesIncludingSiri(void *a1, const char *a2, ...)
{
  return [a1 _speechVoicesIncludingSiri];
}

id objc_msgSend__switchControlAltVoices(void *a1, const char *a2, ...)
{
  return [a1 _switchControlAltVoices];
}

id objc_msgSend__switchControlPrefersCompact(void *a1, const char *a2, ...)
{
  return [a1 _switchControlPrefersCompact];
}

id objc_msgSend__switchControlScannerDefaultDialect(void *a1, const char *a2, ...)
{
  return [a1 _switchControlScannerDefaultDialect];
}

id objc_msgSend__switchVoiceMigrationWhitetail(void *a1, const char *a2, ...)
{
  return [a1 _switchVoiceMigrationWhitetail];
}

id objc_msgSend__sydneyMigrateTapToWakeSetting(void *a1, const char *a2, ...)
{
  return [a1 _sydneyMigrateTapToWakeSetting];
}

id objc_msgSend__tigrisMigrateBrailleStatusCellSettings(void *a1, const char *a2, ...)
{
  return [a1 _tigrisMigrateBrailleStatusCellSettings];
}

id objc_msgSend__tigrisMigrateSwitchSpeechSettingsToNewDomain(void *a1, const char *a2, ...)
{
  return [a1 _tigrisMigrateSwitchSpeechSettingsToNewDomain];
}

id objc_msgSend__tigrisMigrateVoiceOverPunctuationSettings(void *a1, const char *a2, ...)
{
  return [a1 _tigrisMigrateVoiceOverPunctuationSettings];
}

id objc_msgSend__tigrisMigrateVoicesToNewDomain(void *a1, const char *a2, ...)
{
  return [a1 _tigrisMigrateVoicesToNewDomain];
}

id objc_msgSend__turnOffIgnoreTrackpad(void *a1, const char *a2, ...)
{
  return [a1 _turnOffIgnoreTrackpad];
}

id objc_msgSend__updateSiriVoiceList(void *a1, const char *a2, ...)
{
  return [a1 _updateSiriVoiceList];
}

id objc_msgSend__voiceOverAlternativeVoiceIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _voiceOverAlternativeVoiceIdentifiers];
}

id objc_msgSend__voiceOverPrefersCompactByLanguage(void *a1, const char *a2, ...)
{
  return [a1 _voiceOverPrefersCompactByLanguage];
}

id objc_msgSend__voiceOverVoiceMigrationWhitetail(void *a1, const char *a2, ...)
{
  return [a1 _voiceOverVoiceMigrationWhitetail];
}

id objc_msgSend__whitetailMigrateDisplayFilterSettings(void *a1, const char *a2, ...)
{
  return [a1 _whitetailMigrateDisplayFilterSettings];
}

id objc_msgSend__whitetailMigrateTTYSettings(void *a1, const char *a2, ...)
{
  return [a1 _whitetailMigrateTTYSettings];
}

id objc_msgSend__whitetailMigrateVOTShouldRouteToSpeakerWithProx(void *a1, const char *a2, ...)
{
  return [a1 _whitetailMigrateVOTShouldRouteToSpeakerWithProx];
}

id objc_msgSend__whitetailMigrateVoiceSettings(void *a1, const char *a2, ...)
{
  return [a1 _whitetailMigrateVoiceSettings];
}

id objc_msgSend__yukonBMigrateAssistiveTouchMenuForDwell(void *a1, const char *a2, ...)
{
  return [a1 _yukonBMigrateAssistiveTouchMenuForDwell];
}

id objc_msgSend__yukonBMigratePairedHearingAids(void *a1, const char *a2, ...)
{
  return [a1 _yukonBMigratePairedHearingAids];
}

id objc_msgSend__yukonBMigrateVoiceOverCommandsForLongPress(void *a1, const char *a2, ...)
{
  return [a1 _yukonBMigrateVoiceOverCommandsForLongPress];
}

id objc_msgSend__yukonEEnsureInvertColorsPrefHasValidValue(void *a1, const char *a2, ...)
{
  return [a1 _yukonEEnsureInvertColorsPrefHasValidValue];
}

id objc_msgSend__yukonEMigrateASTAlwaysShowMenuForDwell(void *a1, const char *a2, ...)
{
  return [a1 _yukonEMigrateASTAlwaysShowMenuForDwell];
}

id objc_msgSend__yukonEMigrateASTCustomActions(void *a1, const char *a2, ...)
{
  return [a1 _yukonEMigrateASTCustomActions];
}

id objc_msgSend__yukonEMigrateNeuralVoicesForInternalInstalls(void *a1, const char *a2, ...)
{
  return [a1 _yukonEMigrateNeuralVoicesForInternalInstalls];
}

id objc_msgSend__yukonESetAXSettingsForPointer(void *a1, const char *a2, ...)
{
  return [a1 _yukonESetAXSettingsForPointer];
}

id objc_msgSend__yukonMigrateBrailleTables(void *a1, const char *a2, ...)
{
  return [a1 _yukonMigrateBrailleTables];
}

id objc_msgSend__yukonMigrateEmojiSuffixPreference(void *a1, const char *a2, ...)
{
  return [a1 _yukonMigrateEmojiSuffixPreference];
}

id objc_msgSend__yukonMigrateGuidedAccessSettings(void *a1, const char *a2, ...)
{
  return [a1 _yukonMigrateGuidedAccessSettings];
}

id objc_msgSend__yukonMigrateIncorrectVoiceDefaults(void *a1, const char *a2, ...)
{
  return [a1 _yukonMigrateIncorrectVoiceDefaults];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assistiveTouchMainScreenCustomization(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchMainScreenCustomization];
}

id objc_msgSend_assistiveTouchMouseCustomizedClickActions(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchMouseCustomizedClickActions];
}

id objc_msgSend_assistiveTouchMouseDwellControlEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchMouseDwellControlEnabled];
}

id objc_msgSend_assistiveTouchMouseDwellControlMutatedMenu(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchMouseDwellControlMutatedMenu];
}

id objc_msgSend_audiogramConfigurationByRouteUID(void *a1, const char *a2, ...)
{
  return [a1 audiogramConfigurationByRouteUID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buttonMap(void *a1, const char *a2, ...)
{
  return [a1 buttonMap];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_didMigrateBackupFromDifferentDevice(void *a1, const char *a2, ...)
{
  return [a1 didMigrateBackupFromDifferentDevice];
}

id objc_msgSend_didRestoreFromBackup(void *a1, const char *a2, ...)
{
  return [a1 didRestoreFromBackup];
}

id objc_msgSend_didUpgrade(void *a1, const char *a2, ...)
{
  return [a1 didUpgrade];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enabledInputModeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 enabledInputModeIdentifiers];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_guidedAccessOverrideIdleTime(void *a1, const char *a2, ...)
{
  return [a1 guidedAccessOverrideIdleTime];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return [a1 ignoreLogging];
}

id objc_msgSend_ignoreTrackpad(void *a1, const char *a2, ...)
{
  return [a1 ignoreTrackpad];
}

id objc_msgSend_inUnitTest(void *a1, const char *a2, ...)
{
  return [a1 inUnitTest];
}

id objc_msgSend_initPreferringUserProfile(void *a1, const char *a2, ...)
{
  return [a1 initPreferringUserProfile];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return [a1 language];
}

id objc_msgSend_laserEnabled(void *a1, const char *a2, ...)
{
  return [a1 laserEnabled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_pairedHearingAids(void *a1, const char *a2, ...)
{
  return [a1 pairedHearingAids];
}

id objc_msgSend_perAppSettingsCustomizedAppIDs(void *a1, const char *a2, ...)
{
  return [a1 perAppSettingsCustomizedAppIDs];
}

id objc_msgSend_personalMediaConfigurationByRouteUID(void *a1, const char *a2, ...)
{
  return [a1 personalMediaConfigurationByRouteUID];
}

id objc_msgSend_quality(void *a1, const char *a2, ...)
{
  return [a1 quality];
}

id objc_msgSend_resolverForCurrentHost(void *a1, const char *a2, ...)
{
  return [a1 resolverForCurrentHost];
}

id objc_msgSend_saveAsUserProfile(void *a1, const char *a2, ...)
{
  return [a1 saveAsUserProfile];
}

id objc_msgSend_selectedSpeechVoiceIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 selectedSpeechVoiceIdentifiers];
}

id objc_msgSend_selectedSpeechVoiceIdentifiersWithLanguageSource(void *a1, const char *a2, ...)
{
  return [a1 selectedSpeechVoiceIdentifiersWithLanguageSource];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInputModeController(void *a1, const char *a2, ...)
{
  return [a1 sharedInputModeController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_systemLanguageID(void *a1, const char *a2, ...)
{
  return [a1 systemLanguageID];
}

id objc_msgSend_touchAccommodationsHoldDurationAllowsSwipeGesturesToBypass(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsHoldDurationAllowsSwipeGesturesToBypass];
}

id objc_msgSend_touchAccommodationsHoldDurationSwipeGestureSensitivity(void *a1, const char *a2, ...)
{
  return [a1 touchAccommodationsHoldDurationSwipeGestureSensitivity];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userLocale(void *a1, const char *a2, ...)
{
  return [a1 userLocale];
}

id objc_msgSend_voiceOverActionsFeedback(void *a1, const char *a2, ...)
{
  return [a1 voiceOverActionsFeedback];
}

id objc_msgSend_voiceOverAudioDuckingEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceOverAudioDuckingEnabled];
}

id objc_msgSend_voiceOverBrailleLanguageRotorItems(void *a1, const char *a2, ...)
{
  return [a1 voiceOverBrailleLanguageRotorItems];
}

id objc_msgSend_voiceOverBrailleTableIdentifier(void *a1, const char *a2, ...)
{
  return [a1 voiceOverBrailleTableIdentifier];
}

id objc_msgSend_voiceOverContainerOutputFeedback(void *a1, const char *a2, ...)
{
  return [a1 voiceOverContainerOutputFeedback];
}

id objc_msgSend_voiceOverLinkFeedback(void *a1, const char *a2, ...)
{
  return [a1 voiceOverLinkFeedback];
}

id objc_msgSend_voiceOverRotorItems(void *a1, const char *a2, ...)
{
  return [a1 voiceOverRotorItems];
}