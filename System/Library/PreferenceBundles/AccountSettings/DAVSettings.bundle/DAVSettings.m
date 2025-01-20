void sub_3B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_3BB0(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_acAccountTypeString(void *a1, const char *a2, ...)
{
  return [a1 acAccountTypeString];
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

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_attemptedInitialValidation(void *a1, const char *a2, ...)
{
  return [a1 attemptedInitialValidation];
}

id objc_msgSend_attemptedValidation(void *a1, const char *a2, ...)
{
  return [a1 attemptedValidation];
}

id objc_msgSend_backingAccountInfo(void *a1, const char *a2, ...)
{
  return [a1 backingAccountInfo];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentlyEditingCell(void *a1, const char *a2, ...)
{
  return [a1 currentlyEditingCell];
}

id objc_msgSend_defaultDADataclassesToEnable(void *a1, const char *a2, ...)
{
  return [a1 defaultDADataclassesToEnable];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
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

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isSettingUpNewAccount(void *a1, const char *a2, ...)
{
  return [a1 isSettingUpNewAccount];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkSpecifier(void *a1, const char *a2, ...)
{
  return [a1 linkSpecifier];
}

id objc_msgSend_managingOwnerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 managingOwnerIdentifier];
}

id objc_msgSend_mcBackingProfile(void *a1, const char *a2, ...)
{
  return [a1 mcBackingProfile];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_principalURL(void *a1, const char *a2, ...)
{
  return [a1 principalURL];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_saveModifiedPropertiesOnBackingAccount(void *a1, const char *a2, ...)
{
  return [a1 saveModifiedPropertiesOnBackingAccount];
}

id objc_msgSend_settingsPlistName(void *a1, const char *a2, ...)
{
  return [a1 settingsPlistName];
}

id objc_msgSend_showDeleteButton(void *a1, const char *a2, ...)
{
  return [a1 showDeleteButton];
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

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
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

id objc_msgSend_updateDoneButton(void *a1, const char *a2, ...)
{
  return [a1 updateDoneButton];
}

id objc_msgSend_useSSL(void *a1, const char *a2, ...)
{
  return [a1 useSSL];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_usernameWithoutDomain(void *a1, const char *a2, ...)
{
  return [a1 usernameWithoutDomain];
}

id objc_msgSend_validatedSuccessfully(void *a1, const char *a2, ...)
{
  return [a1 validatedSuccessfully];
}

id objc_msgSend_validationInProgress(void *a1, const char *a2, ...)
{
  return [a1 validationInProgress];
}