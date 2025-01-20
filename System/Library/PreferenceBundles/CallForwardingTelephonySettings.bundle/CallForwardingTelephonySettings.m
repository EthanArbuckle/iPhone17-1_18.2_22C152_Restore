uint64_t TPSCallForwardingLog()
{
  if (qword_D400 != -1) {
    dispatch_once(&qword_D400, &stru_8210);
  }
  return qword_D3F8;
}

void sub_12C4(id a1)
{
  qword_D3F8 = (uint64_t)os_log_create("com.apple.TelephonySettings", "CallForwarding");
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t TPSLocalizedPhoneNumberString()
{
  return _TPSLocalizedPhoneNumberString();
}

uint64_t TPSNormalizedPhoneNumberString()
{
  return _TPSNormalizedPhoneNumberString();
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

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_callForwardingController(void *a1, const char *a2, ...)
{
  return [a1 callForwardingController];
}

id objc_msgSend_carrierBundleController(void *a1, const char *a2, ...)
{
  return [a1 carrierBundleController];
}

id objc_msgSend_carrierBundleLocalizedStringKeys(void *a1, const char *a2, ...)
{
  return [a1 carrierBundleLocalizedStringKeys];
}

id objc_msgSend_classBundle(void *a1, const char *a2, ...)
{
  return [a1 classBundle];
}

id objc_msgSend_conditionalServiceBusyPhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 conditionalServiceBusyPhoneNumber];
}

id objc_msgSend_conditionalServiceBusyValue(void *a1, const char *a2, ...)
{
  return [a1 conditionalServiceBusyValue];
}

id objc_msgSend_conditionalServiceRequests(void *a1, const char *a2, ...)
{
  return [a1 conditionalServiceRequests];
}

id objc_msgSend_conditionalServiceState(void *a1, const char *a2, ...)
{
  return [a1 conditionalServiceState];
}

id objc_msgSend_conditionalServiceSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 conditionalServiceSwitchSpecifier];
}

id objc_msgSend_conditionalServiceTypeSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 conditionalServiceTypeSpecifiers];
}

id objc_msgSend_conditionalServiceUnansweredPhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 conditionalServiceUnansweredPhoneNumber];
}

id objc_msgSend_conditionalServiceUnansweredValue(void *a1, const char *a2, ...)
{
  return [a1 conditionalServiceUnansweredValue];
}

id objc_msgSend_conditionalServiceUnreachablePhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 conditionalServiceUnreachablePhoneNumber];
}

id objc_msgSend_conditionalServiceUnreachableValue(void *a1, const char *a2, ...)
{
  return [a1 conditionalServiceUnreachableValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentServiceType(void *a1, const char *a2, ...)
{
  return [a1 currentServiceType];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_enableConditionalServiceIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 enableConditionalServiceIfNeeded];
}

id objc_msgSend_enableUnconditionalServiceIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 enableUnconditionalServiceIfNeeded];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_isConditionalServiceAvailable(void *a1, const char *a2, ...)
{
  return [a1 isConditionalServiceAvailable];
}

id objc_msgSend_isConditionalServiceLoading(void *a1, const char *a2, ...)
{
  return [a1 isConditionalServiceLoading];
}

id objc_msgSend_isLoading(void *a1, const char *a2, ...)
{
  return [a1 isLoading];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isSimHidden(void *a1, const char *a2, ...)
{
  return [a1 isSimHidden];
}

id objc_msgSend_isUnloading(void *a1, const char *a2, ...)
{
  return [a1 isUnloading];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return [a1 localizationTableName];
}

id objc_msgSend_localizedConditionalBusyTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedConditionalBusyTitle];
}

id objc_msgSend_localizedConditionalUnansweredTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedConditionalUnansweredTitle];
}

id objc_msgSend_localizedConditionalUnreachableTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedConditionalUnreachableTitle];
}

id objc_msgSend_mainSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 mainSwitchSpecifier];
}

id objc_msgSend_pendingServiceType(void *a1, const char *a2, ...)
{
  return [a1 pendingServiceType];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_requestController(void *a1, const char *a2, ...)
{
  return [a1 requestController];
}

id objc_msgSend_resetPendingServiceType(void *a1, const char *a2, ...)
{
  return [a1 resetPendingServiceType];
}

id objc_msgSend_saveNumber(void *a1, const char *a2, ...)
{
  return [a1 saveNumber];
}

id objc_msgSend_sendConditionalServicesRequest(void *a1, const char *a2, ...)
{
  return [a1 sendConditionalServicesRequest];
}

id objc_msgSend_sendServicesRequest(void *a1, const char *a2, ...)
{
  return [a1 sendServicesRequest];
}

id objc_msgSend_sendSetAllServicesDisabledRequest(void *a1, const char *a2, ...)
{
  return [a1 sendSetAllServicesDisabledRequest];
}

id objc_msgSend_sendSetUnconditionalServiceDisabledRequest(void *a1, const char *a2, ...)
{
  return [a1 sendSetUnconditionalServiceDisabledRequest];
}

id objc_msgSend_sendUnconditionalServicesRequest(void *a1, const char *a2, ...)
{
  return [a1 sendUnconditionalServicesRequest];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return [a1 serviceType];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_subscriptionContext(void *a1, const char *a2, ...)
{
  return [a1 subscriptionContext];
}

id objc_msgSend_subscriptionISOCountryCode(void *a1, const char *a2, ...)
{
  return [a1 subscriptionISOCountryCode];
}

id objc_msgSend_telephonyController(void *a1, const char *a2, ...)
{
  return [a1 telephonyController];
}

id objc_msgSend_unconditionalServicePhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 unconditionalServicePhoneNumber];
}

id objc_msgSend_unconditionalServiceRequests(void *a1, const char *a2, ...)
{
  return [a1 unconditionalServiceRequests];
}

id objc_msgSend_unconditionalServiceState(void *a1, const char *a2, ...)
{
  return [a1 unconditionalServiceState];
}

id objc_msgSend_unconditionalServiceTypeSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 unconditionalServiceTypeSpecifiers];
}

id objc_msgSend_unconditionalServiceValue(void *a1, const char *a2, ...)
{
  return [a1 unconditionalServiceValue];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}