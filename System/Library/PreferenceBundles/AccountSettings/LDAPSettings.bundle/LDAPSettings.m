void sub_30BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_30DC(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_32D4(id a1)
{
  qword_D3E8 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"HOST", 0);

  _objc_release_x1();
}

uint64_t DAAccountDescriptionFromHostname()
{
  return _DAAccountDescriptionFromHostname();
}

uint64_t DALoggingwithCategory()
{
  return _DALoggingwithCategory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__checkScopeCell(void *a1, const char *a2, ...)
{
  return [a1 _checkScopeCell];
}

id objc_msgSend__isNewSearchSettings(void *a1, const char *a2, ...)
{
  return [a1 _isNewSearchSettings];
}

id objc_msgSend__markAccountDirty(void *a1, const char *a2, ...)
{
  return [a1 _markAccountDirty];
}

id objc_msgSend__searchBaseSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _searchBaseSpecifiers];
}

id objc_msgSend__searchSettingsAreEmpty(void *a1, const char *a2, ...)
{
  return [a1 _searchSettingsAreEmpty];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return [a1 accountDescription];
}

id objc_msgSend_accountIsManaged(void *a1, const char *a2, ...)
{
  return [a1 accountIsManaged];
}

id objc_msgSend_accountNeedsAdd(void *a1, const char *a2, ...)
{
  return [a1 accountNeedsAdd];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backingAccountInfo(void *a1, const char *a2, ...)
{
  return [a1 backingAccountInfo];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelButtonIndex(void *a1, const char *a2, ...)
{
  return [a1 cancelButtonIndex];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentlyEditingCell(void *a1, const char *a2, ...)
{
  return [a1 currentlyEditingCell];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return [a1 firstResponder];
}

id objc_msgSend_friendlyName(void *a1, const char *a2, ...)
{
  return [a1 friendlyName];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexOfCurrentlyEditingCell(void *a1, const char *a2, ...)
{
  return [a1 indexOfCurrentlyEditingCell];
}

id objc_msgSend_isSettingUpNewAccount(void *a1, const char *a2, ...)
{
  return [a1 isSettingUpNewAccount];
}

id objc_msgSend_ldapHumanReadableStringFromSearchBase(void *a1, const char *a2, ...)
{
  return [a1 ldapHumanReadableStringFromSearchBase];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkSpecifier(void *a1, const char *a2, ...)
{
  return [a1 linkSpecifier];
}

id objc_msgSend_mcBackingProfile(void *a1, const char *a2, ...)
{
  return [a1 mcBackingProfile];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_prompt(void *a1, const char *a2, ...)
{
  return [a1 prompt];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_scope(void *a1, const char *a2, ...)
{
  return [a1 scope];
}

id objc_msgSend_searchBase(void *a1, const char *a2, ...)
{
  return [a1 searchBase];
}

id objc_msgSend_searchDescription(void *a1, const char *a2, ...)
{
  return [a1 searchDescription];
}

id objc_msgSend_searchSettings(void *a1, const char *a2, ...)
{
  return [a1 searchSettings];
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return [a1 show];
}

id objc_msgSend_showIdenticalAccountFailureView(void *a1, const char *a2, ...)
{
  return [a1 showIdenticalAccountFailureView];
}

id objc_msgSend_showSSLFailureView(void *a1, const char *a2, ...)
{
  return [a1 showSSLFailureView];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_specifiersToInsert(void *a1, const char *a2, ...)
{
  return [a1 specifiersToInsert];
}

id objc_msgSend_supportedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 supportedDataclasses];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return [a1 textField];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_updateDoneButton(void *a1, const char *a2, ...)
{
  return [a1 updateDoneButton];
}

id objc_msgSend_useSSL(void *a1, const char *a2, ...)
{
  return [a1 useSSL];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}