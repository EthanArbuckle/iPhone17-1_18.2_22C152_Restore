void sub_100004B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_100004B64(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained buttonEventMonitor];
  id v3 = objc_loadWeakRetained(v1);
  [v2 addTarget:v3 action:"handleButtonEvent:" forButtonEvents:0xFFFFFFFFLL propagate:0];
}

void sub_100004DBC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) buttonEventMonitor];
  [v2 removeTarget:*(void *)(a1 + 32)];
}

id sub_10000591C(uint64_t a1)
{
  int v2 = reboot3();
  if (v2)
  {
    int v3 = v2;
    v4 = handleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000064D0(v3, v4);
    }

    return [*(id *)(a1 + 32) endTestWithStatusCode:-73 error:0];
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    return [v6 endTestWithStatusCode:0 error:0];
  }
}

uint64_t sub_10000608C()
{
  if (!qword_10000C9F0) {
    qword_10000C9F0 = _sl_dlopen();
  }
  return qword_10000C9F0;
}

uint64_t sub_10000615C()
{
  uint64_t result = _sl_dlopen();
  qword_10000C9F0 = result;
  return result;
}

Class sub_1000061D0(uint64_t a1)
{
  if (!sub_10000608C())
  {
    int v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("DSHardwareButtonEventMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100006548();
  }
  qword_10000C9F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100006448(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ButtonEventMonitor not available", v1, 2u);
}

void sub_10000648C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "DiagnosticsSupport not available", v1, 2u);
}

void sub_1000064D0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Reboot failed with error: %d", (uint8_t *)v2, 8u);
}

void sub_100006548()
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void free(void *a1)
{
}

uint64_t handleForCategory()
{
  return _handleForCategory();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

uint64_t reboot3()
{
  return _reboot3();
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return [a1 boldButton];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_buttonEventMonitor(void *a1, const char *a2, ...)
{
  return [a1 buttonEventMonitor];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return [a1 buttonTray];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return [a1 contentViewController];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_isDenied(void *a1, const char *a2, ...)
{
  return [a1 isDenied];
}

id objc_msgSend_isLostMode(void *a1, const char *a2, ...)
{
  return [a1 isLostMode];
}

id objc_msgSend_isNetworkError(void *a1, const char *a2, ...)
{
  return [a1 isNetworkError];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return [a1 linkButton];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_testIdentifer(void *a1, const char *a2, ...)
{
  return [a1 testIdentifer];
}

id objc_msgSend_testStatusCode(void *a1, const char *a2, ...)
{
  return [a1 testStatusCode];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}