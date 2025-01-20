void sub_5300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_5320(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_5508(id a1)
{
  qword_CB40 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"HOST", 0);

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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__insertSecondarySpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _insertSecondarySpecifiers];
}

id objc_msgSend__primarySpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _primarySpecifiers];
}

id objc_msgSend__reloadHostDependentSepcifiers(void *a1, const char *a2, ...)
{
  return [a1 _reloadHostDependentSepcifiers];
}

id objc_msgSend__secondarySpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _secondarySpecifiers];
}

id objc_msgSend__showingSecondarySpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _showingSecondarySpecifiers];
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

id objc_msgSend_attemptedValidation(void *a1, const char *a2, ...)
{
  return [a1 attemptedValidation];
}

id objc_msgSend_backingAccountInfo(void *a1, const char *a2, ...)
{
  return [a1 backingAccountInfo];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_broughtUpInitialKeyboard(void *a1, const char *a2, ...)
{
  return [a1 broughtUpInitialKeyboard];
}

id objc_msgSend_clearTmpICSData(void *a1, const char *a2, ...)
{
  return [a1 clearTmpICSData];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentlyEditingCell(void *a1, const char *a2, ...)
{
  return [a1 currentlyEditingCell];
}

id objc_msgSend_editableTextField(void *a1, const char *a2, ...)
{
  return [a1 editableTextField];
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

id objc_msgSend_isSubCalAuthError(void *a1, const char *a2, ...)
{
  return [a1 isSubCalAuthError];
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

id objc_msgSend_plistSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 plistSpecifiers];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_saveTmpICSData(void *a1, const char *a2, ...)
{
  return [a1 saveTmpICSData];
}

id objc_msgSend_shouldRemoveAlarms(void *a1, const char *a2, ...)
{
  return [a1 shouldRemoveAlarms];
}

id objc_msgSend_showIdenticalAccountFailureView(void *a1, const char *a2, ...)
{
  return [a1 showIdenticalAccountFailureView];
}

id objc_msgSend_showSSLFailureView(void *a1, const char *a2, ...)
{
  return [a1 showSSLFailureView];
}

id objc_msgSend_supportedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 supportedDataclasses];
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

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}