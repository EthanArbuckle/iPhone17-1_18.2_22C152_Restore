void sub_1000012F4(void *a1, uint64_t a2, uint64_t a3)
{
  void (**v5)(id, DNDGetFocusStateIntentResponse *);
  DNDGetFocusStateIntentResponse *v6;
  uint64_t vars8;

  v5 = a1;
  v6 = [[DNDGetFocusStateIntentResponse alloc] initWithCode:a2 userActivity:0];
  [(DNDGetFocusStateIntentResponse *)v6 setState:a3];
  v5[2](v5, v6);
}

void DNDIntentRegisterLogging()
{
  if (qword_1000098B8 != -1) {
    dispatch_once(&qword_1000098B8, &stru_1000041D8);
  }
}

void sub_10000148C(id a1)
{
  DNDIntentLog = (uint64_t)os_log_create("com.apple.donotdisturb", "Intents");
  _objc_release_x1();
}

void sub_100001E0C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100001E4C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100001FAC(uint64_t a1, void *a2)
{
  id v3 = [a2 code];
  id v4 = objc_alloc((Class)INSetBinarySettingIntentResponse);
  if (v3 == (id)5)
  {
    id v5 = [v4 initWithCode:4 userActivity:0];
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    id v7 = v5;
  }
  else
  {
    id v7 = [v4 initWithCode:3 userActivity:0];
    objc_msgSend(v7, "setUpdatedValue:", objc_msgSend(*(id *)(a1 + 32), "binaryValue"));
    [v7 setOldValue:*(void *)(a1 + 48)];
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

void sub_100002420()
{
  sub_100001E28();
  sub_100001E4C((void *)&_mh_execute_header, v0, v1, "Intent: %{public}@ could not take mode assertion due to error: %{public}@");
}

void sub_100002488()
{
  sub_100001E40();
  sub_100001E0C((void *)&_mh_execute_header, v0, v1, "Intent: %{public}@ has an invalid lifetime, will ignore", v2, v3, v4, v5, v6);
}

void sub_1000024F0()
{
  sub_100001E40();
  sub_100001E0C((void *)&_mh_execute_header, v0, v1, "Could not invalidate all active mode assertions due to error: %@", v2, v3, v4, v5, v6);
}

void sub_100002558()
{
  sub_100001E40();
  sub_100001E0C((void *)&_mh_execute_header, v0, v1, "Unknown state for intent: %{public}@", v2, v3, v4, v5, v6);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_binaryValue(void *a1, const char *a2, ...)
{
  return [a1 binaryValue];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_details(void *a1, const char *a2, ...)
{
  return [a1 details];
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return [a1 displayString];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return [a1 event];
}

id objc_msgSend_focus(void *a1, const char *a2, ...)
{
  return [a1 focus];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_lifetimeWithCurrentLocation(void *a1, const char *a2, ...)
{
  return [a1 lifetimeWithCurrentLocation];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_modeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 modeIdentifier];
}

id objc_msgSend_settingMetadata(void *a1, const char *a2, ...)
{
  return [a1 settingMetadata];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_toDNDIntent(void *a1, const char *a2, ...)
{
  return [a1 toDNDIntent];
}

id objc_msgSend_userInteractive(void *a1, const char *a2, ...)
{
  return [a1 userInteractive];
}