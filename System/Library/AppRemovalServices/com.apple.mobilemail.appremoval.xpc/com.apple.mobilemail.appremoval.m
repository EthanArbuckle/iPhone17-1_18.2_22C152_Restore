void sub_100001C84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100001D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000020B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100002144(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_msgSend(v5, "ef_publicDescription");
    sub_100002B14(a2, v6, v8);
  }
  v7 = *(void **)(a1 + 32);
  if (a2) {
    [v7 finishWithResult:*(void *)(a1 + 40)];
  }
  else {
    [v7 finishWithError:v5];
  }
}

void sub_1000021FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_100002740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002B14(char a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1 & 1;
  *((_WORD *)buf + 4) = 2114;
  *(void *)(buf + 10) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Save account completed: %d %{public}@", buf, 0x12u);
}

void sub_100002B80(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error getting contents of container directory: %{public}@", buf, 0xCu);
}

void sub_100002BDC(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error deleting NanoMail %{public}@", buf, 0xCu);
}

void sub_100002C38(void *a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Joined future error: %{public}@, result: %@", buf, 0x16u);
}

void sub_100002CA0(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to terminate maild: %d", (uint8_t *)v1, 8u);
}

uint64_t MFMailDirectory()
{
  return _MFMailDirectory();
}

uint64_t SFTerminateProcessNamed()
{
  return _SFTerminateProcessNamed();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__disableMailAccounts(void *a1, const char *a2, ...)
{
  return [a1 _disableMailAccounts];
}

id objc_msgSend__recordMailAppUninstalled(void *a1, const char *a2, ...)
{
  return [a1 _recordMailAppUninstalled];
}

id objc_msgSend__removeNanoMailDirectory(void *a1, const char *a2, ...)
{
  return [a1 _removeNanoMailDirectory];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_parentAccount(void *a1, const char *a2, ...)
{
  return [a1 parentAccount];
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return [a1 promise];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}