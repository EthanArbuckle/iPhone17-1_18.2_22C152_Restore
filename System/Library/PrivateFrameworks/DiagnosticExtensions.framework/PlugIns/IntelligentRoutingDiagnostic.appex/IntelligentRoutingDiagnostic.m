void sub_10000318C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000031AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000031BC(uint64_t a1)
{
}

void sub_1000031C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (os_log_t *)&IRLogObject;
  if (v6)
  {
    v8 = IRLogObject;
    if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_ERROR)) {
      sub_100003638((uint64_t)v6, v8);
    }
  }
  unsigned __int8 v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) BOOLValue];
  v10 = IRLogObject;
  if (v9)
  {
    id v25 = v6;
    if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#diagnosticExtension, database export reply called with urls: %@", buf, 0xCu);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v26 = v5;
    id obj = v5;
    id v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v29;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          v15 = v7;
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v17 = +[NSFileManager defaultManager];
          v18 = [v16 path];
          unsigned __int8 v19 = [v17 fileExistsAtPath:v18];

          if ((v19 & 1) == 0)
          {
            os_log_t v24 = *v15;
            if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR)) {
              sub_10000354C(v24, v16);
            }
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

            goto LABEL_25;
          }
          v20 = [v16 path];
          v21 = +[DEAttachmentItem attachmentWithPath:v20];

          [v21 setDeleteOnAttach:&__kCFBooleanTrue];
          [v21 setShouldCompress:&__kCFBooleanTrue];
          v7 = v15;
          v22 = *v15;
          if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#diagnosticExtension, intelligentRoutingAttachment attachment: %@", buf, 0xCu);
          }
          [*(id *)(a1 + 40) addObject:v21];
        }
        id v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    v23 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#diagnosticExtension, database export reply finished", buf, 2u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_25:
    id v6 = v25;
    id v5 = v26;
  }
  else if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_ERROR))
  {
    sub_1000035F4(v10);
  }
}

void sub_100003508(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#diagnosticExtension, [ErrorId - TTR denied] called by TTR and user denied collecting IntelligentRouting log", v1, 2u);
}

void sub_10000354C(void *a1, void *a2)
{
  v3 = a1;
  v4 = [a2 path];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#diagnosticExtension, [ErrorId - Diagnostics extension non existing file] got a non-existing file from exportDatabase! This should never happen. path: %@", (uint8_t *)&v5, 0xCu);
}

void sub_1000035F4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#diagnosticExtension, [ErrorId - Diagnostics extension export timeout] export timed out", v1, 2u);
}

void sub_100003638(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#diagnosticExtension, [ErrorId - Diagnostics extension export error] got reply with error: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t IRSetupLogging()
{
  return _IRSetupLogging();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_setShouldCompress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCompress:");
}