id sub_4CE0()
{
  void *v0;
  id v1;
  void v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars8;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_C268;
  v7 = qword_C268;
  if (!qword_C268)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_61CC;
    v3[3] = &unk_81F8;
    v3[4] = &v4;
    sub_61CC((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_4DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_533C()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_C278;
  uint64_t v7 = qword_C278;
  if (!qword_C278)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_636C;
    v3[3] = &unk_81F8;
    v3[4] = &v4;
    sub_636C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_5408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_61AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_61CC(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_C270)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_62F8;
    v3[4] = &unk_8230;
    void v3[5] = v3;
    long long v4 = off_8218;
    uint64_t v5 = 0;
    qword_C270 = _sl_dlopen();
  }
  if (!qword_C270) {
    sub_66AC(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("NPSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_672C();
  }
  qword_C268 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_62F8()
{
  uint64_t result = _sl_dlopen();
  qword_C270 = result;
  return result;
}

Class sub_636C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_C280)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_6498;
    v3[4] = &unk_8230;
    void v3[5] = v3;
    long long v4 = off_8250;
    uint64_t v5 = 0;
    qword_C280 = _sl_dlopen();
  }
  if (!qword_C280) {
    sub_67A8(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SOSUtilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_6828();
  }
  qword_C278 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_6498()
{
  uint64_t result = _sl_dlopen();
  qword_C280 = result;
  return result;
}

Class sub_650C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_C290)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_6638;
    v3[4] = &unk_8230;
    void v3[5] = v3;
    long long v4 = off_8268;
    uint64_t v5 = 0;
    qword_C290 = _sl_dlopen();
  }
  if (!qword_C290) {
    sub_68A4(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("UNNotificationSettingsCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_6924();
  }
  qword_C288 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_6638()
{
  uint64_t result = _sl_dlopen();
  qword_C290 = result;
  return result;
}

void sub_66AC(void *a1)
{
  v2 = +[NSAssertionHandler currentHandler];
  v3 = +[NSString stringWithUTF8String:"void *NanoPreferencesSyncLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MessagesNotificationFilteringController.m", 17, @"%s", *a1);

  __break(1u);
}

void sub_672C()
{
  v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"Class getNPSManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MessagesNotificationFilteringController.m", 18, @"Unable to find class %s", "NPSManager");

  __break(1u);
}

void sub_67A8(void *a1)
{
  v2 = +[NSAssertionHandler currentHandler];
  v3 = +[NSString stringWithUTF8String:"void *SOSLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MessagesNotificationFilteringController.m", 33, @"%s", *a1);

  __break(1u);
}

void sub_6828()
{
  v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"Class getSOSUtilitiesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MessagesNotificationFilteringController.m", 34, @"Unable to find class %s", "SOSUtilities");

  __break(1u);
}

void sub_68A4(void *a1)
{
  v2 = +[NSAssertionHandler currentHandler];
  v3 = +[NSString stringWithUTF8String:"void *UserNotificationsSettingsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MessagesNotificationFilteringController.m", 27, @"%s", *a1);

  __break(1u);
}

void sub_6924()
{
  v0 = +[NSAssertionHandler currentHandler];
  id v1 = +[NSString stringWithUTF8String:"Class getUNNotificationSettingsCenterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MessagesNotificationFilteringController.m", 28, @"Unable to find class %s", "UNNotificationSettingsCenter");

  __break(1u);
  CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
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

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t PSIsNanoMirroringDomain()
{
  return _PSIsNanoMirroringDomain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void free(void *a1)
{
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_criticalAlertPreference(void *a1, const char *a2, ...)
{
  return [a1 criticalAlertPreference];
}

id objc_msgSend_criticalAlertSetting(void *a1, const char *a2, ...)
{
  return [a1 criticalAlertSetting];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentNotificationSettingsCenter(void *a1, const char *a2, ...)
{
  return [a1 currentNotificationSettingsCenter];
}

id objc_msgSend_isSOSAlertingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSOSAlertingEnabled];
}

id objc_msgSend_isSOSMessagesUrgentAlertingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSOSMessagesUrgentAlertingEnabled];
}

id objc_msgSend_isZelkovaEnabled(void *a1, const char *a2, ...)
{
  return [a1 isZelkovaEnabled];
}

id objc_msgSend_notificationSettings(void *a1, const char *a2, ...)
{
  return [a1 notificationSettings];
}

id objc_msgSend_sharedFeatureFlags(void *a1, const char *a2, ...)
{
  return [a1 sharedFeatureFlags];
}

id objc_msgSend_showSafetyMonitorUseCriticalAlertsSwitch(void *a1, const char *a2, ...)
{
  return [a1 showSafetyMonitorUseCriticalAlertsSwitch];
}

id objc_msgSend_sourceSettings(void *a1, const char *a2, ...)
{
  return [a1 sourceSettings];
}

id objc_msgSend_synchronizeUserDefaultsDomain_keys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronizeUserDefaultsDomain:keys:");
}