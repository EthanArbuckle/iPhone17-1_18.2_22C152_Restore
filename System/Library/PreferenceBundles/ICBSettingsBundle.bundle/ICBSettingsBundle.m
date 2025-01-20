uint64_t sub_41AC(uint64_t a1)
{
  uint64_t vars8;

  qword_C938 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id PHPreferencesGetValue(void *a1)
{
  return PHPreferencesGetValueInDomain(a1, 0);
}

id PHPreferencesGetValueInDomain(void *a1, void *a2)
{
  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    v5 = +[NSBundle mainBundle];
    v4 = [v5 bundleIdentifier];
  }
  if ([(__CFString *)v3 length] && [(__CFString *)v4 length]) {
    v6 = (void *)CFPreferencesCopyValue(v3, v4, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
  else {
    v6 = 0;
  }

  return v6;
}

void PHPreferencesSetValue(void *a1, void *a2)
{
}

void PHPreferencesSetValueInDomain(void *a1, void *a2, void *a3)
{
  key = a1;
  id v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = +[NSBundle mainBundle];
    v6 = [v7 bundleIdentifier];
  }
  if ([(__CFString *)key length] && [(__CFString *)v6 length])
  {
    CFPreferencesSetValue(key, v5, v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesSynchronize(v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
}

id PHDefaultLog()
{
  if (qword_C950 != -1) {
    dispatch_once(&qword_C950, &stru_82A8);
  }
  v0 = (void *)qword_C948;

  return v0;
}

void sub_4D18(id a1)
{
  qword_C948 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  _objc_release_x1();
}

id PHOversizedLog()
{
  if (qword_C960 != -1) {
    dispatch_once(&qword_C960, &stru_82C8);
  }
  v0 = (void *)qword_C958;

  return v0;
}

void sub_4DB0(id a1)
{
  qword_C958 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Oversized");

  _objc_release_x1();
}

id PHOversizedLogQueue()
{
  if (qword_C970 != -1) {
    dispatch_once(&qword_C970, &stru_82E8);
  }
  v0 = (void *)qword_C968;

  return v0;
}

void sub_4E48(id a1)
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v3);
  v2 = (void *)qword_C968;
  qword_C968 = (uint64_t)v1;
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t _TUIsInternalInstall()
{
  return __TUIsInternalInstall();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bannerSpecifier(void *a1, const char *a2, ...)
{
  return [a1 bannerSpecifier];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_controllerParent(void *a1, const char *a2, ...)
{
  return [a1 controllerParent];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return [a1 emitNavigationEvent];
}

id objc_msgSend_fullScreenSpecifier(void *a1, const char *a2, ...)
{
  return [a1 fullScreenSpecifier];
}

id objc_msgSend_groupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 groupSpecifier];
}

id objc_msgSend_hasBannersEnabled(void *a1, const char *a2, ...)
{
  return [a1 hasBannersEnabled];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_incomingCallStyleIcon(void *a1, const char *a2, ...)
{
  return [a1 incomingCallStyleIcon];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadDataSource(void *a1, const char *a2, ...)
{
  return [a1 loadDataSource];
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return [a1 localizationTableName];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return [a1 parentListController];
}

id objc_msgSend_setGroupAliasLabelText(void *a1, const char *a2, ...)
{
  return [a1 setGroupAliasLabelText];
}

id objc_msgSend_setGroupFooterText(void *a1, const char *a2, ...)
{
  return [a1 setGroupFooterText];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifierID(void *a1, const char *a2, ...)
{
  return [a1 specifierID];
}

id objc_msgSend_styleSpecifier(void *a1, const char *a2, ...)
{
  return [a1 styleSpecifier];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}