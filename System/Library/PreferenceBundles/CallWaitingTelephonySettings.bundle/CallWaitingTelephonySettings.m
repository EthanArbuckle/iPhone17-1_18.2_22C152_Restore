uint64_t TPSCallWaitingLog()
{
  if (qword_8C48 != -1) {
    dispatch_once(&qword_8C48, &stru_41B8);
  }
  return qword_8C40;
}

void sub_1B8C(id a1)
{
  qword_8C40 = (uint64_t)os_log_create("com.apple.TelephonySettings", "CallWaiting");
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_callWaitingController(void *a1, const char *a2, ...)
{
  return [a1 callWaitingController];
}

id objc_msgSend_classBundle(void *a1, const char *a2, ...)
{
  return [a1 classBundle];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isSimHidden(void *a1, const char *a2, ...)
{
  return [a1 isSimHidden];
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return [a1 localizationTableName];
}

id objc_msgSend_mainSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 mainSwitchSpecifier];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_requestController(void *a1, const char *a2, ...)
{
  return [a1 requestController];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_subscriptionContext(void *a1, const char *a2, ...)
{
  return [a1 subscriptionContext];
}

id objc_msgSend_telephonyController(void *a1, const char *a2, ...)
{
  return [a1 telephonyController];
}

id objc_msgSend_tps_tapToRadarAlertControllerWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tps_tapToRadarAlertControllerWithError:");
}