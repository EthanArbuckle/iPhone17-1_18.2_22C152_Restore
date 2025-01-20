void sub_100002158(id a1)
{
  qword_100008A10 = (uint64_t)os_log_create("com.apple.telephony.abm", "diagext");
}

void sub_100002288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)RFSelfAuthExtensionHelper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10000234C(void *a1)
{
}

void sub_100002754(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t BasebandDiagnostics::readIntegerFromUserDefaults()
{
  return BasebandDiagnostics::readIntegerFromUserDefaults();
}

uint64_t BasebandRFDiagnostics::getPersonalizationInfo(BasebandRFDiagnostics *this)
{
  return BasebandRFDiagnostics::getPersonalizationInfo(this);
}

uint64_t BasebandRFDiagnostics::getSignedTicketAndStore(BasebandRFDiagnostics *this, BOOL a2)
{
  return BasebandRFDiagnostics::getSignedTicketAndStore(this, a2);
}

uint64_t BasebandRFDiagnostics::create(BasebandRFDiagnostics *this)
{
  return BasebandRFDiagnostics::create(this);
}

uint64_t BasebandRFDiagnostics::asString()
{
  return BasebandRFDiagnostics::asString();
}

uint64_t BasebandRFDiagnostics::resetAll(BasebandRFDiagnostics *this)
{
  return BasebandRFDiagnostics::resetAll(this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_msgSend_addAPTagToTicket(void *a1, const char *a2, ...)
{
  return [a1 addAPTagToTicket];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clearRFSelfTestTicket(void *a1, const char *a2, ...)
{
  return [a1 clearRFSelfTestTicket];
}

id objc_msgSend_getOSLogHandler(void *a1, const char *a2, ...)
{
  return [a1 getOSLogHandler];
}

id objc_msgSend_getPersonalizationInfo(void *a1, const char *a2, ...)
{
  return [a1 getPersonalizationInfo];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_loadTestConfigFromUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 loadTestConfigFromUserDefaults];
}

id objc_msgSend_resetAll(void *a1, const char *a2, ...)
{
  return [a1 resetAll];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_testConfiguration(void *a1, const char *a2, ...)
{
  return [a1 testConfiguration];
}