id sub_63B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableSleepTracking:*(void *)(a1 + 40)];
}

id sub_63BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_6458(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setSleepTracking:", objc_msgSend(v2, "BOOLValue"));
}

void sub_672C(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setChargingReminders:", objc_msgSend(v2, "BOOLValue"));
}

void sub_685C(id a1, HKSPMutableSleepSettings *a2)
{
}

void sub_68A8(id a1, HKSPMutableSleepSettings *a2)
{
}

void sub_6A04(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6AB8;
  block[3] = &unk_C430;
  id v7 = a2;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_6AB8(uint64_t a1)
{
  if ((char *)[*(id *)(a1 + 32) authorizationStatus] - 2 >= (unsigned char *)&dword_0 + 3)
  {
    HKSHUILocalizedString();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = +[UIAlertController hksp_notificationsWontFireAlertControllerWithLocalizedTitle:*(void *)(a1 + 40) localizedDismiss:v3 completion:0];
    [*(id *)(a1 + 48) presentViewController:v2 animated:1 completion:0];
  }
}

void sub_7048(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543618;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2114;
      id v12 = v5;
      id v7 = v10;
      _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to get sleep settings with error %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v6 = [a2 mutableCopy];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v8 = [*(id *)(*(void *)(a1 + 32) + 184) saveCurrentSleepSettings:v6];
  }
}

void sub_73E8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = HKSPLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v7)
    {
      unsigned int v8 = [*(id *)(a1 + 32) intValue];
      int v9 = 67109120;
      LODWORD(v10) = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Successfully updated feature enablement state to %i", (uint8_t *)&v9, 8u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (v7)
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Failed updating sleep apnea notification enablement state.", (uint8_t *)&v9, 2u);
  }

  if (v5)
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Error updating feature enablement state: %@", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t HKSHUILocalizedString()
{
  return _HKSHUILocalizedString();
}

uint64_t HKSPLogForCategory()
{
  return _HKSPLogForCategory();
}

uint64_t HKSPSleepFocusConfigurationURL()
{
  return _HKSPSleepFocusConfigurationURL();
}

uint64_t HKSPSleepFocusOnboardingURL()
{
  return _HKSPSleepFocusOnboardingURL();
}

uint64_t HKSPSleepURL()
{
  return _HKSPSleepURL();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_msgSend__areSleepApneaNotificationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 _areSleepApneaNotificationsEnabled];
}

id objc_msgSend__currentSleepEventRecord(void *a1, const char *a2, ...)
{
  return [a1 _currentSleepEventRecord];
}

id objc_msgSend__currentSleepSchedule(void *a1, const char *a2, ...)
{
  return [a1 _currentSleepSchedule];
}

id objc_msgSend__currentSleepSettings(void *a1, const char *a2, ...)
{
  return [a1 _currentSleepSettings];
}

id objc_msgSend__isAgeGated(void *a1, const char *a2, ...)
{
  return [a1 _isAgeGated];
}

id objc_msgSend__setUpSleepSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _setUpSleepSpecifiers];
}

id objc_msgSend__sleepFocusSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _sleepFocusSpecifiers];
}

id objc_msgSend__sleepSettingsSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _sleepSettingsSpecifiers];
}

id objc_msgSend__useWatch(void *a1, const char *a2, ...)
{
  return [a1 _useWatch];
}

id objc_msgSend__useWatchForSleepSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _useWatchForSleepSpecifiers];
}

id objc_msgSend_areAllRequirementsSatisfied(void *a1, const char *a2, ...)
{
  return [a1 areAllRequirementsSatisfied];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatus];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bridgeSettings(void *a1, const char *a2, ...)
{
  return [a1 bridgeSettings];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_chargingReminders(void *a1, const char *a2, ...)
{
  return [a1 chargingReminders];
}

id objc_msgSend_currentSleepSettingsFuture(void *a1, const char *a2, ...)
{
  return [a1 currentSleepSettingsFuture];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_descriptionText(void *a1, const char *a2, ...)
{
  return [a1 descriptionText];
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return [a1 directionalLayoutMargins];
}

id objc_msgSend_featureAvailabilityProviding(void *a1, const char *a2, ...)
{
  return [a1 featureAvailabilityProviding];
}

id objc_msgSend_featureSettings(void *a1, const char *a2, ...)
{
  return [a1 featureSettings];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_footer(void *a1, const char *a2, ...)
{
  return [a1 footer];
}

id objc_msgSend_footerLink(void *a1, const char *a2, ...)
{
  return [a1 footerLink];
}

id objc_msgSend_footerText(void *a1, const char *a2, ...)
{
  return [a1 footerText];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_hasSleepFocusMode(void *a1, const char *a2, ...)
{
  return [a1 hasSleepFocusMode];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_iconBottomToTitleFirstBaselineMultiplier(void *a1, const char *a2, ...)
{
  return [a1 iconBottomToTitleFirstBaselineMultiplier];
}

id objc_msgSend_iconImage(void *a1, const char *a2, ...)
{
  return [a1 iconImage];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isCurrentSleepCoachingOnboardingCompleted(void *a1, const char *a2, ...)
{
  return [a1 isCurrentSleepCoachingOnboardingCompleted];
}

id objc_msgSend_isCurrentSleepTrackingOnboardingCompleted(void *a1, const char *a2, ...)
{
  return [a1 isCurrentSleepTrackingOnboardingCompleted];
}

id objc_msgSend_isWristDetectEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWristDetectEnabled];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_linkURL(void *a1, const char *a2, ...)
{
  return [a1 linkURL];
}

id objc_msgSend_mirrorsFocusModes(void *a1, const char *a2, ...)
{
  return [a1 mirrorsFocusModes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nebula(void *a1, const char *a2, ...)
{
  return [a1 nebula];
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return [a1 notificationCenter];
}

id objc_msgSend_onboardingRecord(void *a1, const char *a2, ...)
{
  return [a1 onboardingRecord];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_settingEnabled(void *a1, const char *a2, ...)
{
  return [a1 settingEnabled];
}

id objc_msgSend_settingVisible(void *a1, const char *a2, ...)
{
  return [a1 settingVisible];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showOnboarding(void *a1, const char *a2, ...)
{
  return [a1 showOnboarding];
}

id objc_msgSend_sleepApneaFooterURL(void *a1, const char *a2, ...)
{
  return [a1 sleepApneaFooterURL];
}

id objc_msgSend_sleepFocusConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sleepFocusConfiguration];
}

id objc_msgSend_sleepStore(void *a1, const char *a2, ...)
{
  return [a1 sleepStore];
}

id objc_msgSend_sleepTracking(void *a1, const char *a2, ...)
{
  return [a1 sleepTracking];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_titleLastBaselineToDescriptionFirstBaseline(void *a1, const char *a2, ...)
{
  return [a1 titleLastBaselineToDescriptionFirstBaseline];
}

id objc_msgSend_titleText(void *a1, const char *a2, ...)
{
  return [a1 titleText];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topToIconTop(void *a1, const char *a2, ...)
{
  return [a1 topToIconTop];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_watchSleepFeaturesEnabled(void *a1, const char *a2, ...)
{
  return [a1 watchSleepFeaturesEnabled];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_windDownTime(void *a1, const char *a2, ...)
{
  return [a1 windDownTime];
}