void sub_100003400(id a1)
{
  operator new();
}

void sub_1000034D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000371C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100003F40(id a1)
{
}

void sub_100004154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100004A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_100004F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000050B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000516C(id a1)
{
}

void sub_1000058F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100005E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100005EC0((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_100005EC0(uint64_t a1)
{
  return a1;
}

void sub_100005F0C(void *a1)
{
}

uint64_t BOMCopierCopyWithOptions()
{
  return _BOMCopierCopyWithOptions();
}

uint64_t BOMCopierFree()
{
  return _BOMCopierFree();
}

uint64_t BOMCopierNew()
{
  return _BOMCopierNew();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
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

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createAttachments(void *a1, const char *a2, ...)
{
  return [a1 createAttachments];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileUtilities(void *a1, const char *a2, ...)
{
  return [a1 fileUtilities];
}

id objc_msgSend_filesize(void *a1, const char *a2, ...)
{
  return [a1 filesize];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_folderPath(void *a1, const char *a2, ...)
{
  return [a1 folderPath];
}

id objc_msgSend_generateTimeStamp(void *a1, const char *a2, ...)
{
  return [a1 generateTimeStamp];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_zipManager(void *a1, const char *a2, ...)
{
  return [a1 zipManager];
}