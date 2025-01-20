id getLogger()
{
  void *v0;
  uint64_t vars8;

  if (qword_8368 != -1) {
    dispatch_once(&qword_8368, &stru_41C0);
  }
  v0 = (void *)qword_8370;

  return v0;
}

void sub_1198(id a1)
{
  qword_8370 = (uint64_t)os_log_create("com.apple.EmergencyAlerts", "SwitchExtension");

  _objc_release_x1();
}

__CFString *asSwitchState(int a1)
{
  if (a1) {
    return @"enabled";
  }
  else {
    return @"disabled";
  }
}

void sub_2A44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_2A5C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Invalid alert state read", v1, 2u);
}

void sub_2AA0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error reading Always deliver preference for: %@", (uint8_t *)&v3, 0xCu);
}

void sub_2B1C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  sub_2A44(&dword_0, a3, (uint64_t)a3, "Error reading key: %{public}@ from %{public}@", (uint8_t *)&v3);
}

void sub_2B9C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 134218240;
  uint64_t v4 = (int)a1;
  __int16 v5 = 2048;
  uint64_t v6 = a1 >> 32;
  sub_2A44(&dword_0, a2, a3, "Error with CT: domain %ld code %ld ", (uint8_t *)&v3);
}

void sub_2C20(uint64_t a1, char a2, NSObject *a3)
{
  uint64_t v4 = @"disabled";
  if (a2) {
    uint64_t v4 = @"enabled";
  }
  __int16 v5 = v4;
  sub_2A2C();
  sub_2A44(&dword_0, a3, v6, "Enhanced delivery pref for %@: %@", v7);
}

void sub_2CD4(uint64_t a1, char a2, NSObject *a3)
{
  uint64_t v4 = @"disabled";
  if (a2) {
    uint64_t v4 = @"enabled";
  }
  __int16 v5 = v4;
  sub_2A2C();
  sub_2A44(&dword_0, a3, v6, "Always delivery pref for %@: %@", v7);
}

void sub_2D88(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Invalid custom preferences array: %{public}@", (uint8_t *)&v2, 0xCu);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t _CTServerConnectionCreate()
{
  return __CTServerConnectionCreate();
}

uint64_t _CTServerConnectionGetCellBroadcastCustomPrefForAlertType()
{
  return __CTServerConnectionGetCellBroadcastCustomPrefForAlertType();
}

uint64_t _CTServerConnectionGetCellBroadcastSettingForAlertType()
{
  return __CTServerConnectionGetCellBroadcastSettingForAlertType();
}

uint64_t _CTServerConnectionSetCellBroadcastCustomPrefForAlertType()
{
  return __CTServerConnectionSetCellBroadcastCustomPrefForAlertType();
}

uint64_t _CTServerConnectionSetCellBroadcastSettingForAlertType()
{
  return __CTServerConnectionSetCellBroadcastSettingForAlertType();
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

id objc_msgSend_addAlwaysDeliverOption(void *a1, const char *a2, ...)
{
  return [a1 addAlwaysDeliverOption];
}

id objc_msgSend_addEnhancedDeliveryOption(void *a1, const char *a2, ...)
{
  return [a1 addEnhancedDeliveryOption];
}

id objc_msgSend_addRootAlertSwitch(void *a1, const char *a2, ...)
{
  return [a1 addRootAlertSwitch];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_onEnhancedDeliveryPageVisited(void *a1, const char *a2, ...)
{
  return [a1 onEnhancedDeliveryPageVisited];
}

id objc_msgSend_performConfirmationAction(void *a1, const char *a2, ...)
{
  return [a1 performConfirmationAction];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAlwaysDeliverOption(void *a1, const char *a2, ...)
{
  return [a1 removeAlwaysDeliverOption];
}

id objc_msgSend_removeEnhancedDeliveryOption(void *a1, const char *a2, ...)
{
  return [a1 removeEnhancedDeliveryOption];
}

id objc_msgSend_resetItems(void *a1, const char *a2, ...)
{
  return [a1 resetItems];
}

id objc_msgSend_sharedInterface(void *a1, const char *a2, ...)
{
  return [a1 sharedInterface];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}