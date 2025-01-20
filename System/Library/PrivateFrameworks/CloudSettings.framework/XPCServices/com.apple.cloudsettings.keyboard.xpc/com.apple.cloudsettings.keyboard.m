int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;
  uint8_t v6[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN XPCSERVICE - MAIN", v6, 2u);
  }
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100003814(id a1)
{
  v3[0] = TIHWKeyboardGlobeAsEmojiKeyPreference;
  v3[1] = TIHWKeyboardCapsLockRomanSwitchPreference;
  v4[0] = @"KB_FnKeyFunction";
  v4[1] = @"KB_CapsLockSwitch";
  v3[2] = TIHWKeyboardAutocapitalizationPreference;
  v3[3] = TIHWKeyboardAutocorrectionPreference;
  v4[2] = @"KB_AutomaticCapitalization";
  v4[3] = @"KB_AutomaticSpellingCorrection";
  v3[4] = TIHWKeyboardPeriodShortcutPreference;
  v4[4] = @"KB_AutomaticPeriod";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  v2 = (void *)qword_10000CB20;
  qword_10000CB20 = v1;
}

void sub_100005A00(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100005A28()
{
  sub_100005A1C();
  sub_100005A00((void *)&_mh_execute_header, &_os_log_default, v0, "XPCSERVICE - New Text input menu: %@", v1, v2, v3, v4, v5);
}

void sub_100005A98()
{
  sub_100005A1C();
  sub_100005A00((void *)&_mh_execute_header, &_os_log_default, v0, "XPCSERVICE - Automatic spelling correction: %@", v1, v2, v3, v4, v5);
}

void sub_100005B08()
{
  sub_100005A1C();
  sub_100005A00((void *)&_mh_execute_header, &_os_log_default, v0, "XPCSERVICE - Dictation languages: %@", v1, v2, v3, v4, v5);
}

void sub_100005B78()
{
  sub_100005A1C();
  sub_100005A00((void *)&_mh_execute_header, &_os_log_default, v0, "XPCSERVICE - Dictation shortcut: %@", v1, v2, v3, v4, v5);
}

void sub_100005BE8()
{
  sub_100005A1C();
  sub_100005A00((void *)&_mh_execute_header, &_os_log_default, v0, "XPCSERVICE - New Automatic capitalization: %@", v1, v2, v3, v4, v5);
}

void sub_100005C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cloudSettingKeyFromTextInputUIKey(void *a1, const char *a2, ...)
{
  return [a1 cloudSettingKeyFromTextInputUIKey];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_preferencesActions(void *a1, const char *a2, ...)
{
  return [a1 preferencesActions];
}

id objc_msgSend_preferencesController(void *a1, const char *a2, ...)
{
  return [a1 preferencesController];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedPreferencesController(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferencesController];
}

id objc_msgSend_synchronizePreferences(void *a1, const char *a2, ...)
{
  return [a1 synchronizePreferences];
}

id objc_msgSend_valueForPreferenceKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForPreferenceKey:");
}