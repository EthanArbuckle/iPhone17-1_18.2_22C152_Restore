void sub_48F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_4A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_562C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [*(id *)(a1 + 32) identifier];
      v7 = objc_msgSend(v4, "ef_publicDescription");
      sub_6670(v6, v7, v8, v5);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_56F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_58A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_599C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_5A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_5C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_61F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_62D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_65F4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to find parent account with identifier %@", (uint8_t *)&v3, 0xCu);
}

void sub_6670(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error saving account %@: %{public}@", buf, 0x16u);
}

uint64_t ACAccountTypeIdentifierForASSAccountType()
{
  return _ACAccountTypeIdentifierForASSAccountType();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t CPSystemRootDirectory()
{
  return _CPSystemRootDirectory();
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

uint64_t MFMobileMailPreferenceDomain()
{
  return _MFMobileMailPreferenceDomain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t createACAccountWithASAccountPropertiesAndACAccountType()
{
  return _createACAccountWithASAccountPropertiesAndACAccountType();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__accountTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _accountTypeIdentifier];
}

id objc_msgSend__isActive(void *a1, const char *a2, ...)
{
  return [a1 _isActive];
}

id objc_msgSend__legacyAccountsPlistPath(void *a1, const char *a2, ...)
{
  return [a1 _legacyAccountsPlistPath];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isValidDefaultSendingAccount(void *a1, const char *a2, ...)
{
  return [a1 isValidDefaultSendingAccount];
}

id objc_msgSend_legacyProperties(void *a1, const char *a2, ...)
{
  return [a1 legacyProperties];
}

id objc_msgSend_migrateLegacyAccounts(void *a1, const char *a2, ...)
{
  return [a1 migrateLegacyAccounts];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_parentAccount(void *a1, const char *a2, ...)
{
  return [a1 parentAccount];
}

id objc_msgSend_specifyDefaultSendingAccountIfNotSet(void *a1, const char *a2, ...)
{
  return [a1 specifyDefaultSendingAccountIfNotSet];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}