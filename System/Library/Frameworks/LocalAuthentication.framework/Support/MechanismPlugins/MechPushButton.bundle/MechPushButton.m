id sub_1EBC()
{
  void *v0;
  uint64_t vars8;

  if (qword_88A8 != -1) {
    dispatch_once(&qword_88A8, &stru_4170);
  }
  v0 = (void *)qword_88B0;

  return v0;
}

void sub_2A24(id a1)
{
  qword_88B0 = LALogForCategory();

  _objc_release_x1();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

uint64_t LALogForCategory()
{
  return _LALogForCategory();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend__checkDoublePressRequirementEnabled(void *a1, const char *a2, ...)
{
  return [a1 _checkDoublePressRequirementEnabled];
}

id objc_msgSend_acmContext(void *a1, const char *a2, ...)
{
  return [a1 acmContext];
}

id objc_msgSend_adviseDoubleTap(void *a1, const char *a2, ...)
{
  return [a1 adviseDoubleTap];
}

id objc_msgSend_axDoubleTapDetected(void *a1, const char *a2, ...)
{
  return [a1 axDoubleTapDetected];
}

id objc_msgSend_axMode(void *a1, const char *a2, ...)
{
  return [a1 axMode];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_checkCredentialValid(void *a1, const char *a2, ...)
{
  return [a1 checkCredentialValid];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceHasPearl(void *a1, const char *a2, ...)
{
  return [a1 deviceHasPearl];
}

id objc_msgSend_deviceHasTouchIDAndSecureDoublePress(void *a1, const char *a2, ...)
{
  return [a1 deviceHasTouchIDAndSecureDoublePress];
}

id objc_msgSend_deviceSupportsSecureDoubleClick(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsSecureDoubleClick];
}

id objc_msgSend_doubleTapDetected(void *a1, const char *a2, ...)
{
  return [a1 doubleTapDetected];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isCredentialValid(void *a1, const char *a2, ...)
{
  return [a1 isCredentialValid];
}

id objc_msgSend_isPurposeApplePay(void *a1, const char *a2, ...)
{
  return [a1 isPurposeApplePay];
}

id objc_msgSend_isPurposeInAppPayment(void *a1, const char *a2, ...)
{
  return [a1 isPurposeInAppPayment];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return [a1 policy];
}

id objc_msgSend_policyOptions(void *a1, const char *a2, ...)
{
  return [a1 policyOptions];
}

id objc_msgSend_preCompanion(void *a1, const char *a2, ...)
{
  return [a1 preCompanion];
}

id objc_msgSend_prearmAssertion(void *a1, const char *a2, ...)
{
  return [a1 prearmAssertion];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_secondary(void *a1, const char *a2, ...)
{
  return [a1 secondary];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_succeedAuthenticationWithDefaultResult(void *a1, const char *a2, ...)
{
  return [a1 succeedAuthenticationWithDefaultResult];
}

id objc_msgSend_verifyRequirementOfType_policy_mustBePresent_parameter_flags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyRequirementOfType:policy:mustBePresent:parameter:flags:error:");
}