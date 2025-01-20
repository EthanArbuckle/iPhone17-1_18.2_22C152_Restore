void sub_100003690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, void);
  v11 = va_arg(va1, void);
  v12 = va_arg(va1, void);
  v13 = va_arg(va1, void);
  v14 = va_arg(va1, void);
  v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000036E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000036F8(uint64_t a1)
{
}

void sub_100003700(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10000379C(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_1000037FC);
  }
  v2 = (void *)predicate[2];
  return v2;
}

os_log_t sub_1000037FC(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
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

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
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

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_setMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMask:");
}
k:v9];
  id v12 = dispatch_semaphore_create(0);
  v13 = +[RTRoutineManager defaultManager];
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_100003700;
  v27 = &unk_100004148;
  v29 = &v37;
  v30 = &v31;
  v14 = v12;
  v28 = v14;
  [v13 fetchPathToDiagnosticFilesWithOptions:v6 handler:&v24];

  v15 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v14, v15))
  {
    v16 = sub_10000379C(&qword_100008140);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Timed-out waiting for fetchPathToDiagnosticFilesWithOptions:handler", buf, 2u);
    }
    v17 = &__NSArray0__struct;
    goto LABEL_20;
  }
  v18 = sub_10000379C(&qword_100008140);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = NSStringFromSelector(a2);
    v20 = v38[5];
    v21 = v32[5];
    *(_DWORD *)buf = 138412802;
    v45 = v19;
    v46 = 2112;
    v47 = v20;
    v48 = 2112;
    v49 = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@, path to CoreRoutine diagnostic files, %@, error, %@", buf, 0x20u);
  }
  if (objc_msgSend((id)v38[5], "length", v24, v25, v26, v27))
  {
    v16 = +[DEAttachmentItem attachmentWithPath:v38[5]];
    v43 = v16;
    v17 = +[NSArray arrayWithObjects:&v43 count:1];
LABEL_20:

    goto LABEL_21;
  }
  v17 = &__NSArray0__struct;
LABEL_21:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v17;
}

@end