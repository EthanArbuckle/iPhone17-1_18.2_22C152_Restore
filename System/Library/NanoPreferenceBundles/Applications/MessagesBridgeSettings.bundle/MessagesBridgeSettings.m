id CKBSFrameworkBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_8508 != -1) {
    dispatch_once(&qword_8508, &stru_41B0);
  }
  v0 = (void *)qword_8500;

  return v0;
}

void sub_1830(id a1)
{
  qword_8500 = +[NSBundle bundleWithIdentifier:@"com.apple.MessagesBridgeSettings"];

  _objc_release_x1();
}

BOOL sub_1CB8(id a1, PSSpecifier *a2, unint64_t a3, BOOL *a4)
{
  v4 = [(PSSpecifier *)a2 identifier];
  unsigned __int8 v5 = [v4 isEqualToString:@"PLAY_ALERT_TONE"];

  return v5;
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t CKFrameworkBundle()
{
  return _CKFrameworkBundle();
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

void objc_release(id a1)
{
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

id objc_msgSend__mirroringReadReceiptsString(void *a1, const char *a2, ...)
{
  return [a1 _mirroringReadReceiptsString];
}

id objc_msgSend__mirroringRepeatAlertsString(void *a1, const char *a2, ...)
{
  return [a1 _mirroringRepeatAlertsString];
}

id objc_msgSend__supportModernTextInput(void *a1, const char *a2, ...)
{
  return [a1 _supportModernTextInput];
}

id objc_msgSend_alertSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 alertSpecifiers];
}

id objc_msgSend_applicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_domainAccessor(void *a1, const char *a2, ...)
{
  return [a1 domainAccessor];
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

id objc_msgSend_mirrorSettings(void *a1, const char *a2, ...)
{
  return [a1 mirrorSettings];
}

id objc_msgSend_mirroredSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 mirroredSpecifiers];
}

id objc_msgSend_nanoSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 nanoSpecifiers];
}

id objc_msgSend_settingsMode(void *a1, const char *a2, ...)
{
  return [a1 settingsMode];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_syncManager(void *a1, const char *a2, ...)
{
  return [a1 syncManager];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return [a1 values];
}