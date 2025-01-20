id sub_52B4(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiers];
}

id NTALogForCategory(unint64_t a1)
{
  if (a1 >= 0xF) {
    sub_8904();
  }
  if (qword_115A8 != -1) {
    dispatch_once(&qword_115A8, &stru_C350);
  }
  v2 = (void *)qword_11530[a1];

  return v2;
}

void sub_59FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.nanotimeapps", "NanoTimeApps");
  v2 = (void *)qword_11530[0];
  qword_11530[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.nanotimeapps", "TimeAppServices");
  v4 = (void *)qword_11538;
  qword_11538 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.nanotimeapps", "TimeAppServicesSound");
  v6 = (void *)qword_115A0;
  qword_115A0 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.nanotimeapps", "NanoTimer");
  v8 = (void *)qword_11540;
  qword_11540 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.nanotimeapps", "NanoAlarm");
  v10 = (void *)qword_11548;
  qword_11548 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.nanotimeapps", "NanoStopwatch");
  v12 = (void *)qword_11550;
  qword_11550 = (uint64_t)v11;

  os_log_t v13 = os_log_create("com.apple.nanotimeapps", "NanoWorldClock");
  v14 = (void *)qword_11558;
  qword_11558 = (uint64_t)v13;

  os_log_t v15 = os_log_create("com.apple.nanotimeapps", "NanoClockAlertProvider");
  v16 = (void *)qword_11578;
  qword_11578 = (uint64_t)v15;

  os_log_t v17 = os_log_create("com.apple.nanotimeapps", "NanoClockActivateProvider");
  v18 = (void *)qword_11580;
  qword_11580 = (uint64_t)v17;

  os_log_t v19 = os_log_create("com.apple.nanotimeapps", "NanoTimerSiri");
  v20 = (void *)qword_11588;
  qword_11588 = (uint64_t)v19;

  os_log_t v21 = os_log_create("com.apple.nanotimeapps", "Tool");
  v22 = (void *)qword_11590;
  qword_11590 = (uint64_t)v21;

  os_log_t v23 = os_log_create("com.apple.nanotimeapps", "SessionProvider");
  v24 = (void *)qword_11598;
  qword_11598 = (uint64_t)v23;

  os_log_t v25 = os_log_create("com.apple.nanotimeapps", "Complication");
  v26 = (void *)qword_11560;
  qword_11560 = (uint64_t)v25;

  os_log_t v27 = os_log_create("com.apple.nanotimeapps", "SunriseComplication");
  v28 = (void *)qword_11568;
  qword_11568 = (uint64_t)v27;

  qword_11570 = (uint64_t)os_log_create("com.apple.nanotimeapps", "WorldClockComplication");

  _objc_release_x1();
}

void sub_76BC(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 specifierForID:@"MONOGRAM_ID"];
  [v3 reloadSpecifier:v4];
}

id sub_7E1C(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiers];
}

BOOL _nameContainsEmojiCharacters(void *a1)
{
  uint64_t v1 = qword_115B0;
  v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_115B0, &stru_C398);
  }
  v5.location = 0;
  v5.length = 0;
  CFCharacterSetRef v3 = (const __CFCharacterSet *)qword_115B8;
  v6.length = CFStringGetLength(v2);
  v6.location = 0;
  LODWORD(v3) = CFStringFindCharacterFromSet(v2, v3, v6, 0, &v5);

  return v3 != 0;
}

void sub_8428(id a1)
{
  uint64_t v1 = CTFontCreateWithName(@"AppleColorEmoji", 0.0, 0);
  if (v1)
  {
    v2 = v1;
    CFCharacterSetRef v4 = CTFontCopyCharacterSet(v1);
    id v3 = [(__CFCharacterSet *)v4 mutableCopy];
    objc_msgSend(v3, "removeCharactersInRange:", 0, 128);
    CFRelease(v2);
    qword_115B8 = (uint64_t)v3;
  }
}

void sub_850C(id a1)
{
  qword_115C0 = objc_alloc_init(NCBSWorldCityDisplayListModel);

  _objc_release_x1();
}

id handleMobileTimerPrefsChange(uint64_t a1, void *a2)
{
  return [a2 handleWorldCitiesChanged];
}

void sub_8904()
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindCharacterFromSet(theString, theSet, rangeToSearch, searchOptions, result);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFCharacterSetRef CTFontCopyCharacterSet(CTFontRef font)
{
  return _CTFontCopyCharacterSet(font);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return _CTFontCreateWithName(name, size, matrix);
}

uint64_t NTKCUpNextDataSourcesViewControllerClass()
{
  return _NTKCUpNextDataSourcesViewControllerClass();
}

uint64_t NTKCompanionMonogramEntryViewControllerClass()
{
  return _NTKCompanionMonogramEntryViewControllerClass();
}

uint64_t NTKWorldClockCityAbbreviation()
{
  return _NTKWorldClockCityAbbreviation();
}

uint64_t PSLocaleUses24HourClock()
{
  return _PSLocaleUses24HourClock();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

id objc_msgSend__checkAndUpdateSettings(void *a1, const char *a2, ...)
{
  return [a1 _checkAndUpdateSettings];
}

id objc_msgSend__currentLocale(void *a1, const char *a2, ...)
{
  return [a1 _currentLocale];
}

id objc_msgSend__loadSectionInfo(void *a1, const char *a2, ...)
{
  return [a1 _loadSectionInfo];
}

id objc_msgSend__notifyClientsOfChange(void *a1, const char *a2, ...)
{
  return [a1 _notifyClientsOfChange];
}

id objc_msgSend__writeSectionState(void *a1, const char *a2, ...)
{
  return [a1 _writeSectionState];
}

id objc_msgSend_alCityId(void *a1, const char *a2, ...)
{
  return [a1 alCityId];
}

id objc_msgSend_applicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cities(void *a1, const char *a2, ...)
{
  return [a1 cities];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_editableTextField(void *a1, const char *a2, ...)
{
  return [a1 editableTextField];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return [a1 firstResponder];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isNotificationsIndicatorEnabled(void *a1, const char *a2, ...)
{
  return [a1 isNotificationsIndicatorEnabled];
}

id objc_msgSend_isTimeTravelEnabled(void *a1, const char *a2, ...)
{
  return [a1 isTimeTravelEnabled];
}

id objc_msgSend_isValidCityAbbreviation(void *a1, const char *a2, ...)
{
  return [a1 isValidCityAbbreviation];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return [a1 keyWindow];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadCities(void *a1, const char *a2, ...)
{
  return [a1 loadCities];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedTitle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_tapToSpeakAvailabilityOptions(void *a1, const char *a2, ...)
{
  return [a1 tapToSpeakAvailabilityOptions];
}

id objc_msgSend_tapToSpeakTimeAvailability(void *a1, const char *a2, ...)
{
  return [a1 tapToSpeakTimeAvailability];
}

id objc_msgSend_tapToSpeakTimeEnabled(void *a1, const char *a2, ...)
{
  return [a1 tapToSpeakTimeEnabled];
}

id objc_msgSend_tapToSpeakTimeLocalizedDescription(void *a1, const char *a2, ...)
{
  return [a1 tapToSpeakTimeLocalizedDescription];
}

id objc_msgSend_tapToSpeakTimeLocalizedTitle(void *a1, const char *a2, ...)
{
  return [a1 tapToSpeakTimeLocalizedTitle];
}

id objc_msgSend_tapticChimesLocalizedCurrentSounds(void *a1, const char *a2, ...)
{
  return [a1 tapticChimesLocalizedCurrentSounds];
}

id objc_msgSend_tapticChimesLocalizedDescription(void *a1, const char *a2, ...)
{
  return [a1 tapticChimesLocalizedDescription];
}

id objc_msgSend_tapticChimesLocalizedTitle(void *a1, const char *a2, ...)
{
  return [a1 tapticChimesLocalizedTitle];
}

id objc_msgSend_tapticChimesSoundsLocalizedTitle(void *a1, const char *a2, ...)
{
  return [a1 tapticChimesSoundsLocalizedTitle];
}

id objc_msgSend_tapticChimesSoundsOptions(void *a1, const char *a2, ...)
{
  return [a1 tapticChimesSoundsOptions];
}

id objc_msgSend_tapticTimeEncodingOptions(void *a1, const char *a2, ...)
{
  return [a1 tapticTimeEncodingOptions];
}

id objc_msgSend_tapticTimeIsAvailable(void *a1, const char *a2, ...)
{
  return [a1 tapticTimeIsAvailable];
}

id objc_msgSend_tapticTimeLocalizedDescription(void *a1, const char *a2, ...)
{
  return [a1 tapticTimeLocalizedDescription];
}

id objc_msgSend_tapticTimeLocalizedTitle(void *a1, const char *a2, ...)
{
  return [a1 tapticTimeLocalizedTitle];
}

id objc_msgSend_tapticTimeModeLocalizedDescription(void *a1, const char *a2, ...)
{
  return [a1 tapticTimeModeLocalizedDescription];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_voiceOverTapticChimesEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceOverTapticChimesEnabled];
}

id objc_msgSend_voiceOverTapticChimesSoundType(void *a1, const char *a2, ...)
{
  return [a1 voiceOverTapticChimesSoundType];
}

id objc_msgSend_voiceOverTapticTimeEncoding(void *a1, const char *a2, ...)
{
  return [a1 voiceOverTapticTimeEncoding];
}

id objc_msgSend_voiceOverTapticTimeMode(void *a1, const char *a2, ...)
{
  return [a1 voiceOverTapticTimeMode];
}