void sub_100001EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, void);
  v14 = va_arg(va1, void);
  v15 = va_arg(va1, void);
  v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001F24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100001F34(uint64_t a1)
{
}

void sub_100001F3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Powerlog] Adding powerlog archive file: %@", buf, 0xCu);
    }

    v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v6 + 40);
    unsigned __int8 v7 = [v5 addURL:v3 prefix:@"PLArchive" error:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    if ((v7 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      v8 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100002CB8(a1 + 48, v8, v9, v10, v11, v12, v13, v14);
      }

      v15 = +[DASharedTestStatusHelper statusCodeForArchiveError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      v16 = [*(id *)(a1 + 32) result];
      [v16 setStatusCode:v15];
    }
  }
}

void sub_100002B98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002BB4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100002BD0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002C44(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002CB8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002D30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002BB4((void *)&_mh_execute_header, a1, a3, "[ERROR] Failed to generate current powerlog. PLQueryRegistered() returned a nil path.", a5, a6, a7, a8, 0);
}

void sub_100002D68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002DA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002DD8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002E44(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t CPFileCompressionZDeflate()
{
  return _CPFileCompressionZDeflate();
}

uint64_t DKTemporaryDirectoryURL()
{
  return _DKTemporaryDirectoryURL();
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PLQueryRegistered()
{
  return _PLQueryRegistered();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
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

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return [a1 archive];
}

id objc_msgSend_archivesDirectory(void *a1, const char *a2, ...)
{
  return [a1 archivesDirectory];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectLogFile(void *a1, const char *a2, ...)
{
  return [a1 collectLogFile];
}

id objc_msgSend_createWorkingDirectories(void *a1, const char *a2, ...)
{
  return [a1 createWorkingDirectories];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_workingDirectory(void *a1, const char *a2, ...)
{
  return [a1 workingDirectory];
}

id objc_msgSend_writeCurrentPowerLog(void *a1, const char *a2, ...)
{
  return [a1 writeCurrentPowerLog];
}