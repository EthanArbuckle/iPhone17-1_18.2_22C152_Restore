void sub_100003200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003224(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003234(uint64_t a1)
{
}

void sub_10000323C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    if (qword_100008158 != -1) {
      dispatch_once(&qword_100008158, &stru_1000041A8);
    }
    v6 = qword_100008160;
    if (os_log_type_enabled((os_log_t)qword_100008160, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Got reply with error : %@ , diagnostic extention export error", buf, 0xCu);
    }
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) BOOLValue])
  {
    if (qword_100008158 != -1) {
      dispatch_once(&qword_100008158, &stru_1000041A8);
    }
    id v24 = v5;
    v7 = qword_100008160;
    if (os_log_type_enabled((os_log_t)qword_100008160, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "database export reply called with urls: %@", buf, 0xCu);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v25 = v4;
    id obj = v4;
    id v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v29;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v11);
          v13 = +[NSFileManager defaultManager];
          v14 = [v12 path];
          unsigned __int8 v15 = [v13 fileExistsAtPath:v14];

          if ((v15 & 1) == 0)
          {
            if (qword_100008158 != -1) {
              dispatch_once(&qword_100008158, &stru_1000041A8);
            }
            v21 = (void *)qword_100008160;
            if (os_log_type_enabled((os_log_t)qword_100008160, OS_LOG_TYPE_ERROR))
            {
              v22 = v21;
              v23 = [v12 path];
              *(_DWORD *)buf = 138412290;
              id v34 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Diagnostics extension non existing file, got a non-existing file from exportDatabase! This should never happen. path: %@", buf, 0xCu);
            }
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

            id v5 = v24;
            id v4 = v25;
            goto LABEL_37;
          }
          v16 = [v12 path];
          v17 = +[DEAttachmentItem attachmentWithPath:v16];

          [v17 setDeleteOnAttach:&__kCFBooleanTrue];
          [v17 setShouldCompress:&__kCFBooleanTrue];
          if (qword_100008158 != -1) {
            dispatch_once(&qword_100008158, &stru_1000041A8);
          }
          v18 = qword_100008160;
          if (os_log_type_enabled((os_log_t)qword_100008160, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "MiLoAttachment attachment : %@", buf, 0xCu);
          }
          [*(id *)(a1 + 40) addObject:v17];

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    if (qword_100008158 != -1) {
      dispatch_once(&qword_100008158, &stru_1000041A8);
    }
    id v5 = v24;
    id v4 = v25;
    v19 = qword_100008160;
    if (os_log_type_enabled((os_log_t)qword_100008160, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "database export reply finished", buf, 2u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    if (qword_100008158 != -1) {
      dispatch_once(&qword_100008158, &stru_1000041A8);
    }
    v20 = qword_100008160;
    if (os_log_type_enabled((os_log_t)qword_100008160, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Diagnostics extension export timeout, export timed out", buf, 2u);
    }
  }
LABEL_37:
}

void sub_10000370C(id a1)
{
  qword_100008160 = (uint64_t)os_log_create("com.apple.MicroLocation", "MicroLocation");
  _objc_release_x1();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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