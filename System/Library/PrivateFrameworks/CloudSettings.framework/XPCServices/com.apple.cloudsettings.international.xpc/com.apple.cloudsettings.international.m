int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_10000137C(uint64_t a1, void *a2, uint64_t a3)
{
  v10 = a2;
  if ([(__CFString *)v10 isEqualToString:@"AppleLocale"])
  {
    v5 = *(void **)(a1 + 32);
    CFStringRef v6 = @"en_US";
    CFStringRef v7 = @"AppleLocale";
LABEL_13:
    [v5 setObject:v6 forKey:v7];
    v9 = v10;
    goto LABEL_14;
  }
  if (objc_opt_class() == a3)
  {
    v5 = *(void **)(a1 + 32);
    CFStringRef v6 = &stru_1000042E0;
    goto LABEL_12;
  }
  if (objc_opt_class() == a3)
  {
    v5 = *(void **)(a1 + 32);
    CFStringRef v6 = (const __CFString *)&off_100004828;
    goto LABEL_12;
  }
  if (objc_opt_class() == a3)
  {
    v5 = *(void **)(a1 + 32);
    CFStringRef v6 = (const __CFString *)&__NSArray0__struct;
    goto LABEL_12;
  }
  BOOL v8 = objc_opt_class() == a3;
  v9 = v10;
  if (v8)
  {
    v5 = *(void **)(a1 + 32);
    CFStringRef v6 = (const __CFString *)&__NSDictionary0__struct;
LABEL_12:
    CFStringRef v7 = v10;
    goto LABEL_13;
  }
LABEL_14:
}

void sub_100001C34(uint64_t a1, void *a2, void *a3)
{
  v5 = a2;
  id v6 = a3;
  if ([(__CFString *)v5 isEqualToString:@"AppleLocale"])
  {
    CFStringRef v7 = (void *)CFPreferencesCopyAppValue(v5, kCFPreferencesAnyApplication);
    BOOL v8 = +[NSLocale componentsFromLocaleIdentifier:v7];
    v9 = [v8 objectForKeyedSubscript:NSLocaleLanguageCode];

    v10 = +[NSLocale componentsFromLocaleIdentifier:v6];
    id v11 = [v10 mutableCopy];

    [v11 setObject:v9 forKeyedSubscript:NSLocaleLanguageCode];
    v12 = +[NSLocale localeIdentifierFromComponents:v11];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000024E4();
    }
    CFPreferencesSetAppValue(v5, v12, kCFPreferencesAnyApplication);
  }
  else if ([*(id *)(a1 + 32) containsObject:v5])
  {
    CFPreferencesSetAppValue(v5, v6, kCFPreferencesAnyApplication);
  }
}

void sub_10000213C(uint64_t a1, void *a2)
{
  v4 = a2;
  v3 = (void *)CFPreferencesCopyAppValue(v4, kCFPreferencesAnyApplication);
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKey:v4];
  }
}

void sub_10000244C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100002474()
{
  sub_100002468();
  sub_10000244C((void *)&_mh_execute_header, &_os_log_default, v0, "IN XPCSERVICE - Update locale settings: %@", v1, v2, v3, v4, v5);
}

void sub_1000024E4()
{
  sub_100002468();
  sub_10000244C((void *)&_mh_execute_header, &_os_log_default, v0, "IN XPCSERVICE - localeID: %@", v1, v2, v3, v4, v5);
}

void sub_100002554()
{
  sub_100002468();
  sub_10000244C((void *)&_mh_execute_header, &_os_log_default, v0, "IN XPCSERVICE - Update live text: %@", v1, v2, v3, v4, v5);
}

void sub_1000025C4()
{
  sub_100002468();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "IN XPCSERVEC - Can't get inflection due to %@", v0, 0xCu);
}

void sub_100002640()
{
  sub_100002468();
  sub_10000244C((void *)&_mh_execute_header, &_os_log_default, v0, "IN SERVICE Locale: %@", v1, v2, v3, v4, v5);
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

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t _CFLocaleCopyAsIfCurrentWithOverrides()
{
  return __CFLocaleCopyAsIfCurrentWithOverrides();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__currentGlobalUserInflection(void *a1, const char *a2, ...)
{
  return [a1 _currentGlobalUserInflection];
}

id objc_msgSend__deviceLanguage(void *a1, const char *a2, ...)
{
  return [a1 _deviceLanguage];
}

id objc_msgSend__setAsGlobalUserInflection(void *a1, const char *a2, ...)
{
  return [a1 _setAsGlobalUserInflection];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
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

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_externalRepresentation(void *a1, const char *a2, ...)
{
  return [a1 externalRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_localePreferenceKeysAndClasses(void *a1, const char *a2, ...)
{
  return [a1 localePreferenceKeysAndClasses];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_mutablePreferences(void *a1, const char *a2, ...)
{
  return [a1 mutablePreferences];
}

id objc_msgSend_preferences(void *a1, const char *a2, ...)
{
  return [a1 preferences];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}