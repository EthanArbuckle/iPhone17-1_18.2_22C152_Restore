id sub_100002BB4()
{
  id v0;
  uint64_t vars8;

  v0 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall, UIContentSizeCategoryMedium, UIContentSizeCategoryLarge, UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge, UIContentSizeCategoryExtraExtraExtraLarge, UIContentSizeCategoryAccessibilityMedium, UIContentSizeCategoryAccessibilityLarge, UIContentSizeCategoryAccessibilityExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraExtraLarge, 0);

  return v0;
}

id sub_100004B94()
{
  v0 = +[AXSettings sharedInstance];
  id v1 = [v0 callAudioRoutingAutoAnswerEnabled];

  return v1;
}

uint64_t _AXSAssistiveTouchSetEnabledShortcuts(int a1)
{
  v2 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "_AXSAssistiveTouchSetEnabledShortcuts: %d", (uint8_t *)v4, 8u);
  }

  _AXSAssistiveTouchSetEnabled();
  uint64_t result = _AXSAssistiveTouchSetUIEnabled();
  if (a1) {
    return _AXSHomeButtonSetRestingUnlock();
  }
  return result;
}

void sub_100005050(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000071D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = [v3 localizedSourceDescription];
  v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  if (!v4)
  {
    v5 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v12];
  }
  v6 = [AXSwitchControlSwitch alloc];
  v7 = [v3 name];
  v8 = [v3 name];
  uint64_t v9 = [(AXSwitchControlSwitch *)v6 initWithIdentifier:v7 displayString:v8];

  v10 = [v3 source];

  [(AXSwitchControlSwitch *)v9 setSource:v10];
  v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  [v11 addObject:v9];
}

id sub_100007548(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) switches];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007604;
  v8[3] = &unk_100014468;
  id v9 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "ax_containsObjectUsingBlock:", v8);

  return v6;
}

id sub_100007604(uint64_t a1, void *a2)
{
  id v3 = [a2 displayString];
  v4 = [*(id *)(a1 + 32) name];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_10000C1B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown state for intent: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10000C230()
{
  sub_10000506C();
  sub_100005050((void *)&_mh_execute_header, v0, v1, "Unknown state for intent: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000C298(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AXIntentHandler: Unsupported intent: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000C310(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 identifier];
  int v5 = 138412546;
  uint8_t v6 = v4;
  __int16 v7 = 2112;
  v8 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "SetSoundDetectorIntentHandler: Recieved an intent to toggle/set the state on a custom detector, but no detector was found for identifier: %@. Parameter: %@", (uint8_t *)&v5, 0x16u);
}

uint64_t AXDeviceSupportsWatchRemoteScreen()
{
  return _AXDeviceSupportsWatchRemoteScreen();
}

uint64_t AXGuidedAccessGetAvailability()
{
  return _AXGuidedAccessGetAvailability();
}

uint64_t AXLogSiriShortcuts()
{
  return _AXLogSiriShortcuts();
}

uint64_t AXSDSoundDetectionCategories()
{
  return _AXSDSoundDetectionCategories();
}

uint64_t AXSDSoundDetectionLocalizedStringForCategory()
{
  return _AXSDSoundDetectionLocalizedStringForCategory();
}

uint64_t AXSDSoundDetectionTypeIsAppliance()
{
  return _AXSDSoundDetectionTypeIsAppliance();
}

uint64_t AXSDSoundDetectionTypesForCategory()
{
  return _AXSDSoundDetectionTypesForCategory();
}

uint64_t AXSLogarithmicValueForLinearValue()
{
  return _AXSLogarithmicValueForLinearValue();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

uint64_t GAXLogCommon()
{
  return _GAXLogCommon();
}

uint64_t MAAudibleMediaPrefCopyPreferDescriptiveVideo()
{
  return _MAAudibleMediaPrefCopyPreferDescriptiveVideo();
}

uint64_t MAAudibleMediaPrefSetPreferDescriptiveVideo()
{
  return _MAAudibleMediaPrefSetPreferDescriptiveVideo();
}

uint64_t MADisplayFilterPrefGetCategoryEnabled()
{
  return _MADisplayFilterPrefGetCategoryEnabled();
}

uint64_t MADisplayFilterPrefSetCategoryEnabled()
{
  return _MADisplayFilterPrefSetCategoryEnabled();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SCATAddOrUpdateSwitchToSettings()
{
  return _SCATAddOrUpdateSwitchToSettings();
}

uint64_t _AXDarkenSystemColors()
{
  return __AXDarkenSystemColors();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return __AXSAssistiveTouchEnabled();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return __AXSAssistiveTouchScannerEnabled();
}

uint64_t _AXSAssistiveTouchScannerSetEnabled()
{
  return __AXSAssistiveTouchScannerSetEnabled();
}

uint64_t _AXSAssistiveTouchSetEnabled()
{
  return __AXSAssistiveTouchSetEnabled();
}

uint64_t _AXSAssistiveTouchSetUIEnabled()
{
  return __AXSAssistiveTouchSetUIEnabled();
}

uint64_t _AXSClosedCaptionsEnabled()
{
  return __AXSClosedCaptionsEnabled();
}

uint64_t _AXSClosedCaptionsSetEnabled()
{
  return __AXSClosedCaptionsSetEnabled();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return __AXSCommandAndControlEnabled();
}

uint64_t _AXSCommandAndControlSetEnabled()
{
  return __AXSCommandAndControlSetEnabled();
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return __AXSEnhanceBackgroundContrastEnabled();
}

uint64_t _AXSGrayscaleEnabled()
{
  return __AXSGrayscaleEnabled();
}

uint64_t _AXSGrayscaleSetEnabled()
{
  return __AXSGrayscaleSetEnabled();
}

uint64_t _AXSGuidedAccessEnabled()
{
  return __AXSGuidedAccessEnabled();
}

uint64_t _AXSGuidedAccessStartSession()
{
  return __AXSGuidedAccessStartSession();
}

uint64_t _AXSHomeButtonSetRestingUnlock()
{
  return __AXSHomeButtonSetRestingUnlock();
}

uint64_t _AXSInvertColorsEnabled()
{
  return __AXSInvertColorsEnabled();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return __AXSInvertColorsSetEnabled();
}

uint64_t _AXSLiveTranscriptionEnabled()
{
  return __AXSLiveTranscriptionEnabled();
}

uint64_t _AXSLiveTranscriptionSetEnabled()
{
  return __AXSLiveTranscriptionSetEnabled();
}

uint64_t _AXSMonoAudioEnabled()
{
  return __AXSMonoAudioEnabled();
}

uint64_t _AXSMonoAudioSetEnabled()
{
  return __AXSMonoAudioSetEnabled();
}

uint64_t _AXSReduceMotionAutoplayMessagesEffectsEnabled()
{
  return __AXSReduceMotionAutoplayMessagesEffectsEnabled();
}

uint64_t _AXSReduceMotionEnabled()
{
  return __AXSReduceMotionEnabled();
}

uint64_t _AXSReduceWhitePointEnabled()
{
  return __AXSReduceWhitePointEnabled();
}

uint64_t _AXSSetDarkenSystemColors()
{
  return __AXSSetDarkenSystemColors();
}

uint64_t _AXSSetEnhanceBackgroundContrastEnabled()
{
  return __AXSSetEnhanceBackgroundContrastEnabled();
}

uint64_t _AXSSetLargeTextUsesExtendedRange()
{
  return __AXSSetLargeTextUsesExtendedRange();
}

uint64_t _AXSSetLeftRightAudioBalance()
{
  return __AXSSetLeftRightAudioBalance();
}

uint64_t _AXSSetPreferredContentSizeCategoryName()
{
  return __AXSSetPreferredContentSizeCategoryName();
}

uint64_t _AXSSetReduceMotionEnabled()
{
  return __AXSSetReduceMotionEnabled();
}

uint64_t _AXSSetReduceWhitePointEnabled()
{
  return __AXSSetReduceWhitePointEnabled();
}

uint64_t _AXSSetSpeakThisEnabled()
{
  return __AXSSetSpeakThisEnabled();
}

uint64_t _AXSSetTripleClickOptions()
{
  return __AXSSetTripleClickOptions();
}

uint64_t _AXSTripleClickAddOption()
{
  return __AXSTripleClickAddOption();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return __AXSTripleClickCopyOptions();
}

uint64_t _AXSTwiceRemoteScreenSetEnabled()
{
  return __AXSTwiceRemoteScreenSetEnabled();
}

uint64_t _AXSTwiceRemoteScreenSetPlatform()
{
  return __AXSTwiceRemoteScreenSetPlatform();
}

uint64_t _AXSVisualAlertEnabled()
{
  return __AXSVisualAlertEnabled();
}

uint64_t _AXSVisualAlertSetEnabled()
{
  return __AXSVisualAlertSetEnabled();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return __AXSVoiceOverTouchSetEnabled();
}

uint64_t _AXSVoiceOverTouchSetUIEnabled()
{
  return __AXSVoiceOverTouchSetUIEnabled();
}

uint64_t _AXSVoiceOverTouchSetUsageConfirmed()
{
  return __AXSVoiceOverTouchSetUsageConfirmed();
}

uint64_t _AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription()
{
  return __AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription();
}

uint64_t _AXSZoomTouchEnabled()
{
  return __AXSZoomTouchEnabled();
}

uint64_t _AXSZoomTouchSetEnabled()
{
  return __AXSZoomTouchSetEnabled();
}

uint64_t _AXSZoomTouchSetToggledByPreferenceSwitch()
{
  return __AXSZoomTouchSetToggledByPreferenceSwitch();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_assistiveTouchScannerAddedTripleClickAutomatically(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchScannerAddedTripleClickAutomatically];
}

id objc_msgSend_assistiveTouchSwitches(void *a1, const char *a2, ...)
{
  return [a1 assistiveTouchSwitches];
}

id objc_msgSend_backgroundSound(void *a1, const char *a2, ...)
{
  return [a1 backgroundSound];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_callAudioRoutingAutoAnswerEnabled(void *a1, const char *a2, ...)
{
  return [a1 callAudioRoutingAutoAnswerEnabled];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_classicInvertColors(void *a1, const char *a2, ...)
{
  return [a1 classicInvertColors];
}

id objc_msgSend_comfortSoundsEnabled(void *a1, const char *a2, ...)
{
  return [a1 comfortSoundsEnabled];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return [a1 displayString];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enabledKShotDetectorIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 enabledKShotDetectorIdentifiers];
}

id objc_msgSend_enabledSoundDetectionTypes(void *a1, const char *a2, ...)
{
  return [a1 enabledSoundDetectionTypes];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isCustom(void *a1, const char *a2, ...)
{
  return [a1 isCustom];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isTrainingComplete(void *a1, const char *a2, ...)
{
  return [a1 isTrainingComplete];
}

id objc_msgSend_leftRightBalanceEnabled(void *a1, const char *a2, ...)
{
  return [a1 leftRightBalanceEnabled];
}

id objc_msgSend_loadDetectors(void *a1, const char *a2, ...)
{
  return [a1 loadDetectors];
}

id objc_msgSend_localizedNamesByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localizedNamesByIdentifier];
}

id objc_msgSend_localizedSourceDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedSourceDescription];
}

id objc_msgSend_mixesWithMedia(void *a1, const char *a2, ...)
{
  return [a1 mixesWithMedia];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_operation(void *a1, const char *a2, ...)
{
  return [a1 operation];
}

id objc_msgSend_parameter(void *a1, const char *a2, ...)
{
  return [a1 parameter];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_setting(void *a1, const char *a2, ...)
{
  return [a1 setting];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_soundDetectionState(void *a1, const char *a2, ...)
{
  return [a1 soundDetectionState];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_startMagnifier(void *a1, const char *a2, ...)
{
  return [a1 startMagnifier];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_supportsAccessibilityDisplayFilters(void *a1, const char *a2, ...)
{
  return [a1 supportsAccessibilityDisplayFilters];
}

id objc_msgSend_switches(void *a1, const char *a2, ...)
{
  return [a1 switches];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_textSize(void *a1, const char *a2, ...)
{
  return [a1 textSize];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_volumeType(void *a1, const char *a2, ...)
{
  return [a1 volumeType];
}

id objc_msgSend_volumeValue(void *a1, const char *a2, ...)
{
  return [a1 volumeValue];
}