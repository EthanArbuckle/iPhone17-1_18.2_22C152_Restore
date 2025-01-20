BOOL CSLTritiumEnabled()
{
  int AppBooleanValue;
  BOOL v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AOTEnabled", @"com.apple.system.prefs", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    v1 = AppBooleanValue == 0;
  }
  else {
    v1 = 0;
  }
  return !v1;
}

void sub_4CE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v2 = [v3 target];
  if (objc_opt_respondsToSelector()) {
    [v2 _valueChangedNotificationForSpecifier:v3];
  }
}

id sub_4F88(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiers];
}

void sub_60AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id *location,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,id a54)
{
}

void sub_60DC(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 cellType] == (char *)&dword_0 + 1)
  {
    id v3 = *(void **)(a1 + 32);
    v4 = [v5 identifier];
    [v3 addObject:v4];
  }
}

int64_t sub_6150(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  v6 = [v4 name];

  id v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return (int64_t)v7;
}

void sub_61C0(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained specifierForID:PassbookSettingsBundleID];

  if (v5)
  {
    if (a2) {
      v6 = @"NanoPassbookBridgeSettings";
    }
    else {
      v6 = @"NanoPassbookBridgeSettings_NoStockholm";
    }
    id v7 = sub_62C0(v6);
    [v5 setName:v7];

    v8 = *(void **)(a1 + 32);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_6340;
    v9[3] = &unk_C4E0;
    id v10 = v5;
    [v8 performUpdatesAnimated:0 usingBlock:v9];
  }
}

id sub_62C0(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:v1 value:&stru_C650 table:@"Settings"];

  return v3;
}

id sub_6340(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifier:*(void *)(a1 + 32)];
}

void sub_65F8(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  v6 = v5;
  if (v5
    && ([v5 applicationMode] == (char *)&dword_0 + 3
     || [v6 applicationMode] == (char *)&dword_0 + 2))
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 48) dictionaryForKey:v18];
    if (v7)
    {
      v8 = [v6 bundleIdentifier];
      v9 = [v6 applicationName];
      id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
      [v10 setIdentifier:v8];
      [v10 setProperty:v8 forKey:@"bundleID"];
      [v10 setProperty:v9 forKey:@"localizedName"];
      if ([v6 applicationMode] == (char *)&dword_0 + 2)
      {
        v11 = [v6 companionAppBundleID];
        id v12 = [v11 length];

        if (v12)
        {
          v13 = [v6 companionAppBundleID];
          [v10 setProperty:v13 forKey:@"companionAppBundleID"];
        }
      }
      [*(id *)(a1 + 40) addObject:v10];

      goto LABEL_12;
    }
  }
  else
  {
    v14 = *(void **)(*(void *)(a1 + 32) + 32);
    v15 = [v6 companionAppBundleID];
    LODWORD(v14) = [v14 containsObject:v15];

    if (!v14) {
      goto LABEL_14;
    }
    id v7 = [v6 applicationName];
    if ([v7 length])
    {
      v16 = *(void **)(a1 + 32);
      v17 = [v6 bundleIdentifier];
      v8 = [v16 watchAppSpecifierWithDisplayName:v7 specifierID:v18 identifier:v17];

      [*(id *)(a1 + 40) addObject:v8];
LABEL_12:
    }
  }

LABEL_14:
}

id MappedPhoneBundleIDForNanoSettingsBundleID(void *a1)
{
  id v1 = a1;
  id v2 = [&off_D4D0 mutableCopy];
  id v3 = +[BPSBridgeAppContext shared];
  id v4 = [v3 activeDevice];
  int HasCapabilityForString = BPSDeviceHasCapabilityForString();

  if (HasCapabilityForString) {
    [v2 setObject:@"com.apple.Home" forKey:@"com.apple.NanoHome"];
  }
  v6 = +[BPSBridgeAppContext shared];
  id v7 = [v6 activeDevice];
  int v8 = BPSDeviceHasCapabilityForString();

  if (v8) {
    [v2 setObject:@"com.apple.podcasts" forKey:@"com.apple.private.PodcastsBridgeSettings"];
  }
  v9 = +[BPSBridgeAppContext shared];
  id v10 = [v9 activeDevice];
  int v11 = BPSDeviceHasCapabilityForString();

  if (v11) {
    [v2 setObject:@"com.apple.news" forKey:@"com.apple.nanonews"];
  }
  id v12 = [v2 objectForKey:v1];
  v13 = v12;
  if (!v12) {
    id v12 = v1;
  }
  id v14 = v12;

  return v14;
}

void sub_742C(id a1)
{
  id v1 = (void *)qword_11078;
  qword_11078 = (uint64_t)&off_D4F8;
}

int64_t sub_7B28(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  v6 = [v4 name];

  id v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return (int64_t)v7;
}

int64_t sub_7B98(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  v6 = [v4 name];

  id v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return (int64_t)v7;
}

void sub_8380(void *a1, uint64_t a2)
{
  id v3 = [a1 companionAppBundleID];
  int v4 = 138412546;
  id v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "error while collecting application record %@ with error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_8428()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "No app clip specifiers found for CSLAppClipsNotificationsController", v0, 2u);
}

uint64_t BPSDeviceHasCapabilityForString()
{
  return _BPSDeviceHasCapabilityForString();
}

uint64_t BPSDeviceHasStandaloneAppsCapability()
{
  return _BPSDeviceHasStandaloneAppsCapability();
}

uint64_t BPSIsIconForBundleIDRemote()
{
  return _BPSIsIconForBundleIDRemote();
}

uint64_t BPSIsNewsAllowed()
{
  return _BPSIsNewsAllowed();
}

uint64_t BPSIsWalkieTalkieAppInstalled()
{
  return _BPSIsWalkieTalkieAppInstalled();
}

uint64_t BPSLocalIconName()
{
  return _BPSLocalIconName();
}

uint64_t BPSMappedNanoBundleIDForNanoSettingsBundleID()
{
  return _BPSMappedNanoBundleIDForNanoSettingsBundleID();
}

uint64_t BPSMappedNanoSettingsBundleIDForNanoBundleID()
{
  return _BPSMappedNanoSettingsBundleIDForNanoBundleID();
}

uint64_t BPSRemoveHiddenAppsFromSpecifiers()
{
  return _BPSRemoveHiddenAppsFromSpecifiers();
}

uint64_t BPSRemoveSystemDeletedAppBundleIDsFromSpecifiers()
{
  return _BPSRemoveSystemDeletedAppBundleIDsFromSpecifiers();
}

uint64_t BPSRemoveSystemDeletedAppBundleSettingsFromSpecifiers()
{
  return _BPSRemoveSystemDeletedAppBundleSettingsFromSpecifiers();
}

uint64_t BPSStockholmSupportedInGizmoRegion()
{
  return _BPSStockholmSupportedInGizmoRegion();
}

uint64_t BPSSystemAppIsRemoved()
{
  return _BPSSystemAppIsRemoved();
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t SpecifiersFromPlist()
{
  return _SpecifiersFromPlist();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_msgSend_activeDevice(void *a1, const char *a2, ...)
{
  return [a1 activeDevice];
}

id objc_msgSend_additionalSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 additionalSpecifiers];
}

id objc_msgSend_alertType(void *a1, const char *a2, ...)
{
  return [a1 alertType];
}

id objc_msgSend_allowsNotifications(void *a1, const char *a2, ...)
{
  return [a1 allowsNotifications];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appBacklightPrivacyLinkSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 appBacklightPrivacyLinkSpecifiers];
}

id objc_msgSend_applicationMode(void *a1, const char *a2, ...)
{
  return [a1 applicationMode];
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return [a1 applicationName];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bbSections(void *a1, const char *a2, ...)
{
  return [a1 bbSections];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_cellType(void *a1, const char *a2, ...)
{
  return [a1 cellType];
}

id objc_msgSend_cleanBBSections(void *a1, const char *a2, ...)
{
  return [a1 cleanBBSections];
}

id objc_msgSend_companionAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 companionAppBundleID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_counterpartIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 counterpartIdentifiers];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deniedNotificationApps(void *a1, const char *a2, ...)
{
  return [a1 deniedNotificationApps];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hardcodedSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 hardcodedSpecifiers];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_iconData(void *a1, const char *a2, ...)
{
  return [a1 iconData];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return [a1 imageData];
}

id objc_msgSend_imageName(void *a1, const char *a2, ...)
{
  return [a1 imageName];
}

id objc_msgSend_installedWatchkitApps(void *a1, const char *a2, ...)
{
  return [a1 installedWatchkitApps];
}

id objc_msgSend_isAppClip(void *a1, const char *a2, ...)
{
  return [a1 isAppClip];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isNotificationsIndicatorEnabled(void *a1, const char *a2, ...)
{
  return [a1 isNotificationsIndicatorEnabled];
}

id objc_msgSend_isPrecomposed(void *a1, const char *a2, ...)
{
  return [a1 isPrecomposed];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadBBSections(void *a1, const char *a2, ...)
{
  return [a1 loadBBSections];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_lockScreenSetting(void *a1, const char *a2, ...)
{
  return [a1 lockScreenSetting];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_refreshBBSections(void *a1, const char *a2, ...)
{
  return [a1 refreshBBSections];
}

id objc_msgSend_secondPartyApps(void *a1, const char *a2, ...)
{
  return [a1 secondPartyApps];
}

id objc_msgSend_sectionID(void *a1, const char *a2, ...)
{
  return [a1 sectionID];
}

id objc_msgSend_sectionInfo(void *a1, const char *a2, ...)
{
  return [a1 sectionInfo];
}

id objc_msgSend_sectionType(void *a1, const char *a2, ...)
{
  return [a1 sectionType];
}

id objc_msgSend_setupAllowlistFromInheritedSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 setupAllowlistFromInheritedSpecifiers];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_showAlerts(void *a1, const char *a2, ...)
{
  return [a1 showAlerts];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_specifiersForWatchKitAppsWithNotifications(void *a1, const char *a2, ...)
{
  return [a1 specifiersForWatchKitAppsWithNotifications];
}

id objc_msgSend_specifiersFromBBSections(void *a1, const char *a2, ...)
{
  return [a1 specifiersFromBBSections];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByResolvingSymlinksInPath];
}

id objc_msgSend_suppressFromSettings(void *a1, const char *a2, ...)
{
  return [a1 suppressFromSettings];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_watchSupportsAOT(void *a1, const char *a2, ...)
{
  return [a1 watchSupportsAOT];
}