void sub_87D0(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = a1;
  v6 = [a2 featureIdentifier];
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving remote availability: %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_8890(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[Fitness] Error resetting motion calibration data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_8908(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[Respiratory Rate] Error retrieving feature status: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t BPSDeviceHasCapabilityForString()
{
  return _BPSDeviceHasCapabilityForString();
}

uint64_t FIActivityMoveModeWithHealthStore()
{
  return _FIActivityMoveModeWithHealthStore();
}

uint64_t FIIsFitnessTrackingEnabled()
{
  return _FIIsFitnessTrackingEnabled();
}

uint64_t FIUIIsHeartRateEnabled()
{
  return _FIUIIsHeartRateEnabled();
}

uint64_t HKFeatureFlagBloodOxygenSaturationEnabled()
{
  return _HKFeatureFlagBloodOxygenSaturationEnabled();
}

uint64_t HKRPShouldSkipHardwareCheck()
{
  return _HKRPShouldSkipHardwareCheck();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

id objc_msgSend__doesDeviceSupportOxygenSaturationRecording(void *a1, const char *a2, ...)
{
  return [a1 _doesDeviceSupportOxygenSaturationRecording];
}

id objc_msgSend__hasOxygenSaturationRecordingBeenOnboarded(void *a1, const char *a2, ...)
{
  return [a1 _hasOxygenSaturationRecordingBeenOnboarded];
}

id objc_msgSend__isOxygenSaturationRecordingRemoteDisabled(void *a1, const char *a2, ...)
{
  return [a1 _isOxygenSaturationRecordingRemoteDisabled];
}

id objc_msgSend__isRespiratoryRateEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isRespiratoryRateEnabled];
}

id objc_msgSend__isRespiratoryRateRescinded(void *a1, const char *a2, ...)
{
  return [a1 _isRespiratoryRateRescinded];
}

id objc_msgSend__registerObservers(void *a1, const char *a2, ...)
{
  return [a1 _registerObservers];
}

id objc_msgSend__setupMeasureLevelsGroup(void *a1, const char *a2, ...)
{
  return [a1 _setupMeasureLevelsGroup];
}

id objc_msgSend__setupOtherHeadphonesGroup(void *a1, const char *a2, ...)
{
  return [a1 _setupOtherHeadphonesGroup];
}

id objc_msgSend__setupPruningGroup(void *a1, const char *a2, ...)
{
  return [a1 _setupPruningGroup];
}

id objc_msgSend__shouldShowOxygenSaturationSection(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowOxygenSaturationSection];
}

id objc_msgSend__shouldShowRespiratoryRateSection(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowRespiratoryRateSection];
}

id objc_msgSend__unregisterObservers(void *a1, const char *a2, ...)
{
  return [a1 _unregisterObservers];
}

id objc_msgSend__wristTemperatureSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _wristTemperatureSpecifiers];
}

id objc_msgSend_aboutBloodOxygenFooter(void *a1, const char *a2, ...)
{
  return [a1 aboutBloodOxygenFooter];
}

id objc_msgSend_activeDevice(void *a1, const char *a2, ...)
{
  return [a1 activeDevice];
}

id objc_msgSend_areAllRequirementsSatisfied(void *a1, const char *a2, ...)
{
  return [a1 areAllRequirementsSatisfied];
}

id objc_msgSend_backgroundRecordingsTitle(void *a1, const char *a2, ...)
{
  return [a1 backgroundRecordingsTitle];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_featureAvailabilityProviding(void *a1, const char *a2, ...)
{
  return [a1 featureAvailabilityProviding];
}

id objc_msgSend_featureIdentifier(void *a1, const char *a2, ...)
{
  return [a1 featureIdentifier];
}

id objc_msgSend_featureSettings(void *a1, const char *a2, ...)
{
  return [a1 featureSettings];
}

id objc_msgSend_hasRegisteredObservers(void *a1, const char *a2, ...)
{
  return [a1 hasRegisteredObservers];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isElectrocardiogramSupportedOnAnyWatch(void *a1, const char *a2, ...)
{
  return [a1 isElectrocardiogramSupportedOnAnyWatch];
}

id objc_msgSend_isOnboardingRecordPresent(void *a1, const char *a2, ...)
{
  return [a1 isOnboardingRecordPresent];
}

id objc_msgSend_localizedMicrophonePermissionSwitchFootnote(void *a1, const char *a2, ...)
{
  return [a1 localizedMicrophonePermissionSwitchFootnote];
}

id objc_msgSend_localizedMicrophonePermissionSwitchName(void *a1, const char *a2, ...)
{
  return [a1 localizedMicrophonePermissionSwitchName];
}

id objc_msgSend_microphonePermission(void *a1, const char *a2, ...)
{
  return [a1 microphonePermission];
}

id objc_msgSend_onboardingCompleted(void *a1, const char *a2, ...)
{
  return [a1 onboardingCompleted];
}

id objc_msgSend_onboardingRecord(void *a1, const char *a2, ...)
{
  return [a1 onboardingRecord];
}

id objc_msgSend_oxygenSaturationDisabled(void *a1, const char *a2, ...)
{
  return [a1 oxygenSaturationDisabled];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldShowSmartStackPrivacySwitch(void *a1, const char *a2, ...)
{
  return [a1 shouldShowSmartStackPrivacySwitch];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_standardSettings(void *a1, const char *a2, ...)
{
  return [a1 standardSettings];
}

id objc_msgSend_toggleSecondSection(void *a1, const char *a2, ...)
{
  return [a1 toggleSecondSection];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithNonretainedObject:");
}