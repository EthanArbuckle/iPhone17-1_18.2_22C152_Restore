void sub_1EF4(_Unwind_Exception *exception_object)
{
  char v1;

  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_1F20(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x1D04);
  }
  JUMPOUT(0x1F18);
}

void sub_2334(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_2360(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x2124);
  }
  JUMPOUT(0x2358);
}

void sub_2AF8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_2B20()
{
  sub_2B14();
  sub_2AF8(&dword_0, v0, v1, "@\"Disabling local store for events because we set up a syncing account\"", v2, v3, v4, v5, v6);
}

void sub_2B54()
{
  sub_2B14();
  sub_2AF8(&dword_0, v0, v1, "@\"Disabling local store for events because we enabled events in iCloud\"", v2, v3, v4, v5, v6);
}

void sub_2B88()
{
  sub_2B14();
  sub_2AF8(&dword_0, v0, v1, "@\"Disabling local store for events because we merged the events into iCloud\"", v2, v3, v4, v5, v6);
}

void sub_2BBC()
{
  sub_2B14();
  sub_2AF8(&dword_0, v0, v1, "@\"Enabling local store for events because are merging iCloud events into it.\"", v2, v3, v4, v5, v6);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t CalDatabaseCreateWithConfigurationForAccount()
{
  return _CalDatabaseCreateWithConfigurationForAccount();
}

uint64_t CalDatabaseIsAuxiliaryDatabase()
{
  return _CalDatabaseIsAuxiliaryDatabase();
}

uint64_t CalDatabaseSetClientIdentifier()
{
  return _CalDatabaseSetClientIdentifier();
}

uint64_t _ACLogSystem()
{
  return __ACLogSystem();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}