id sub_100002980()
{
  void *v0;
  uint64_t vars8;

  if (qword_100008168 != -1) {
    dispatch_once(&qword_100008168, &stru_1000041D8);
  }
  v0 = (void *)qword_100008170;
  return v0;
}

void sub_100002E78(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002E9C(const char *a1)
{
  int out_token = -1;
  notify_register_check(a1, &out_token);
  if (out_token == -1)
  {
    v2 = sub_100002980();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000033BC(v2);
    }
  }
  else
  {
    notify_set_state(out_token, 1uLL);
    notify_post(a1);
  }
  return out_token;
}

void sub_100002F20(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  v4 = a3;
  v5 = sub_100002980();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      v7 = "triggering force analysis successful";
      v8 = v5;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    int v10 = 138543362;
    v11 = v4;
    v7 = "triggering force analysis failed with error %{public}@";
    v8 = v5;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

void sub_100003008(id a1)
{
  qword_100008170 = (uint64_t)os_log_create("com.apple.HealthAlgorithms", "diagnostic");
  _objc_release_x1();
}

Class sub_10000304C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100008180)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100003190;
    v3[4] = &unk_100004238;
    v3[5] = v3;
    long long v4 = off_100004220;
    uint64_t v5 = 0;
    qword_100008180 = _sl_dlopen();
    if (!qword_100008180)
    {
      abort_report_np();
LABEL_8:
      sub_100003400();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("HKHealthStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100008178 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100003190()
{
  uint64_t result = _sl_dlopen();
  qword_100008180 = result;
  return result;
}

Class sub_100003204(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100008190)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100003348;
    v3[4] = &unk_100004238;
    v3[5] = v3;
    long long v4 = off_100004258;
    uint64_t v5 = 0;
    qword_100008190 = _sl_dlopen();
    if (!qword_100008190)
    {
      abort_report_np();
LABEL_8:
      sub_100003428();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("HKMenstrualCyclesDiagnostics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100008188 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100003348()
{
  uint64_t result = _sl_dlopen();
  qword_100008190 = result;
  return result;
}

void sub_1000033BC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "token == NOTIFY_TOKEN_INVALID", v1, 2u);
}

void sub_100003400()
{
  uint64_t v0 = abort_report_np();
  sub_100003428(v0);
}

void sub_100003428()
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_enabledHealthSensitiveLogging(void *a1, const char *a2, ...)
{
  return [a1 enabledHealthSensitiveLogging];
}

id objc_msgSend_triggerAnalysisForDiagnosticsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerAnalysisForDiagnosticsWithCompletion:");
}