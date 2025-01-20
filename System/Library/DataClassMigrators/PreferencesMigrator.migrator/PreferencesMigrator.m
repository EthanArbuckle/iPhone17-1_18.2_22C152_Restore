void sub_5878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5890(id a1, NSError *a2)
{
  v2 = a2;
  v3 = PSUILogForCategory();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_6354(v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Successfully ran migrateIfNeeded", v5, 2u);
  }
}

void sub_5FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class sub_5FE4(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_C300)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_6128;
    v3[4] = &unk_82B0;
    v3[5] = v3;
    long long v4 = off_8298;
    uint64_t v5 = 0;
    qword_C300 = _sl_dlopen();
    if (!qword_C300)
    {
      abort_report_np();
LABEL_8:
      sub_6400();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("LockdownModeManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_C2F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_6128()
{
  uint64_t result = _sl_dlopen();
  qword_C300 = result;
  return result;
}

Class sub_619C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_C310)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_62E0;
    v3[4] = &unk_82B0;
    v3[5] = v3;
    long long v4 = off_82D0;
    uint64_t v5 = 0;
    qword_C310 = _sl_dlopen();
    if (!qword_C310)
    {
      abort_report_np();
LABEL_8:
      sub_6428();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("UMUserManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_C308 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_62E0()
{
  uint64_t result = _sl_dlopen();
  qword_C310 = result;
  return result;
}

void sub_6354(void *a1, NSObject *a2)
{
  v3 = [a1 description];
  int v4 = 136315394;
  uint64_t v5 = "-[PreferencesDataMigrator _performLockdownModeMigration]_block_invoke";
  __int16 v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s: Error migrating Lockdown Mode: %@", (uint8_t *)&v4, 0x16u);
}

void sub_6400()
{
  uint64_t v0 = abort_report_np();
  sub_6428(v0);
}

void sub_6428()
{
}

uint64_t CFCopySystemVersionString()
{
  return _CFCopySystemVersionString();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
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

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CLCopyAppsUsingLocation()
{
  return _CLCopyAppsUsingLocation();
}

uint64_t GEOGetDefaultInteger()
{
  return _GEOGetDefaultInteger();
}

uint64_t PSIsPearlAvailable()
{
  return _PSIsPearlAvailable();
}

uint64_t PSMigrateSoundsDefaults_10_0()
{
  return _PSMigrateSoundsDefaults_10_0();
}

uint64_t PSUILogForCategory()
{
  return _PSUILogForCategory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__performImproveMapsSettingsMigration(void *a1, const char *a2, ...)
{
  return [a1 _performImproveMapsSettingsMigration];
}

id objc_msgSend__performIsAppAndAccessoryAnalyticsAllowedRemovalMigration(void *a1, const char *a2, ...)
{
  return [a1 _performIsAppAndAccessoryAnalyticsAllowedRemovalMigration];
}

id objc_msgSend__performLocationBasedAlertSettingsMigration(void *a1, const char *a2, ...)
{
  return [a1 _performLocationBasedAlertSettingsMigration];
}

id objc_msgSend__performLocationHomeKitSettingsMigration(void *a1, const char *a2, ...)
{
  return [a1 _performLocationHomeKitSettingsMigration];
}

id objc_msgSend__performLocationRoutingAndTrafficSettingsMigration(void *a1, const char *a2, ...)
{
  return [a1 _performLocationRoutingAndTrafficSettingsMigration];
}

id objc_msgSend__performLocationWifiBluetoothUWBSettingsMigration(void *a1, const char *a2, ...)
{
  return [a1 _performLocationWifiBluetoothUWBSettingsMigration];
}

id objc_msgSend__performLockdownModeMigration(void *a1, const char *a2, ...)
{
  return [a1 _performLockdownModeMigration];
}

id objc_msgSend__performPeaceRestrictionsPinMigration(void *a1, const char *a2, ...)
{
  return [a1 _performPeaceRestrictionsPinMigration];
}

id objc_msgSend__performSydneyHTTP3DeveloperOptInMigration(void *a1, const char *a2, ...)
{
  return [a1 _performSydneyHTTP3DeveloperOptInMigration];
}

id objc_msgSend__performSystemCustomizationSettingsMigration(void *a1, const char *a2, ...)
{
  return [a1 _performSystemCustomizationSettingsMigration];
}

id objc_msgSend__performTigrisAutoBrightnessMigration(void *a1, const char *a2, ...)
{
  return [a1 _performTigrisAutoBrightnessMigration];
}

id objc_msgSend__performTigrisHWAutoLockMigration(void *a1, const char *a2, ...)
{
  return [a1 _performTigrisHWAutoLockMigration];
}

id objc_msgSend__performTigrisSoundSettingsMigration(void *a1, const char *a2, ...)
{
  return [a1 _performTigrisSoundSettingsMigration];
}

id objc_msgSend__performYukonRevertSoundSettingsMigration(void *a1, const char *a2, ...)
{
  return [a1 _performYukonRevertSoundSettingsMigration];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
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

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_homeKitBundles(void *a1, const char *a2, ...)
{
  return [a1 homeKitBundles];
}

id objc_msgSend_improveMapsBundles(void *a1, const char *a2, ...)
{
  return [a1 improveMapsBundles];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_locationBasedAlertBundles(void *a1, const char *a2, ...)
{
  return [a1 locationBasedAlertBundles];
}

id objc_msgSend_migrateRestrictionsPasscode(void *a1, const char *a2, ...)
{
  return [a1 migrateRestrictionsPasscode];
}

id objc_msgSend_routingAndTrafficBundles(void *a1, const char *a2, ...)
{
  return [a1 routingAndTrafficBundles];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_systemCustomizationBundles(void *a1, const char *a2, ...)
{
  return [a1 systemCustomizationBundles];
}

id objc_msgSend_wirelessBundles(void *a1, const char *a2, ...)
{
  return [a1 wirelessBundles];
}