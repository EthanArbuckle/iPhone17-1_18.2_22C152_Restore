id PHDefaultLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_CCA8 != -1) {
    dispatch_once(&qword_CCA8, &stru_8268);
  }
  v0 = (void *)qword_CCA0;

  return v0;
}

void sub_6038(id a1)
{
  qword_CCA0 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  _objc_release_x1();
}

id PHOversizedLog()
{
  if (qword_CCB8 != -1) {
    dispatch_once(&qword_CCB8, &stru_8288);
  }
  v0 = (void *)qword_CCB0;

  return v0;
}

void sub_60D0(id a1)
{
  qword_CCB0 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Oversized");

  _objc_release_x1();
}

id PHOversizedLogQueue()
{
  if (qword_CCC8 != -1) {
    dispatch_once(&qword_CCC8, &stru_82A8);
  }
  v0 = (void *)qword_CCC0;

  return v0;
}

void sub_6168(id a1)
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v3);
  v2 = (void *)qword_CCC0;
  qword_CCC0 = (uint64_t)v1;
}

uint64_t TUSilenceUnknownFaceTimeCallersDefaultValue()
{
  return _TUSilenceUnknownFaceTimeCallersDefaultValue();
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

void objc_destroyWeak(id *location)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_activeSpecifier(void *a1, const char *a2, ...)
{
  return [a1 activeSpecifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_carrierBundleController(void *a1, const char *a2, ...)
{
  return [a1 carrierBundleController];
}

id objc_msgSend_configurationProvider(void *a1, const char *a2, ...)
{
  return [a1 configurationProvider];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_deviceExpertMigrationEnabled(void *a1, const char *a2, ...)
{
  return [a1 deviceExpertMigrationEnabled];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return [a1 emitNavigationEvent];
}

id objc_msgSend_getSilenceUnknownCallersEnabled(void *a1, const char *a2, ...)
{
  return [a1 getSilenceUnknownCallersEnabled];
}

id objc_msgSend_isSilenceUnknownCallersEnabledForFaceTime(void *a1, const char *a2, ...)
{
  return [a1 isSilenceUnknownCallersEnabledForFaceTime];
}

id objc_msgSend_isSilenceUnknownCallersEnabledForPhone(void *a1, const char *a2, ...)
{
  return [a1 isSilenceUnknownCallersEnabledForPhone];
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return [a1 localizationTableName];
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return [a1 parentListController];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifierID(void *a1, const char *a2, ...)
{
  return [a1 specifierID];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return [a1 telephonyClient];
}

id objc_msgSend_tuFeatureFlags(void *a1, const char *a2, ...)
{
  return [a1 tuFeatureFlags];
}