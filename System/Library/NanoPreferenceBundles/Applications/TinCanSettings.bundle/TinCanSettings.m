id sub_4E58(uint64_t a1, void *a2)
{
  return [a2 _handleNamePreferencesChangeNotification];
}

void sub_62D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_62F0(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

void sub_6438(void *a1, void *a2)
{
  v3 = a1;
  v4 = [a2 localizedDescription];
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Failed to generate unified contact: %@", (uint8_t *)&v5, 0xCu);
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _TCSInitializeLogging()
{
  return __TCSInitializeLogging();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__allContactSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _allContactSpecifiers];
}

id objc_msgSend__hasWalkieTalkieContacts(void *a1, const char *a2, ...)
{
  return [a1 _hasWalkieTalkieContacts];
}

id objc_msgSend__updateEditDoneButton(void *a1, const char *a2, ...)
{
  return [a1 _updateEditDoneButton];
}

id objc_msgSend__updateForEditingState(void *a1, const char *a2, ...)
{
  return [a1 _updateForEditingState];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return [a1 contactStore];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_settingsMode(void *a1, const char *a2, ...)
{
  return [a1 settingsMode];
}

id objc_msgSend_sortedContacts(void *a1, const char *a2, ...)
{
  return [a1 sortedContacts];
}

id objc_msgSend_sortedInvitees(void *a1, const char *a2, ...)
{
  return [a1 sortedInvitees];
}

id objc_msgSend_sortedInviters(void *a1, const char *a2, ...)
{
  return [a1 sortedInviters];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllerForUnknownContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForUnknownContact:");
}