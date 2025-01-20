void sub_100001450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001474(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100001484(uint64_t a1)
{
}

void sub_10000148C(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Decompress Pearl frames got response from corerepaird, error: %@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000017EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100001810(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Update Savage firmware got response from corerepaird, error: %@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100001B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100001B94(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Update Brunor firmware got response from corerepaird, error: %@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100001EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100001F18(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Verify PSD3 got response from corerepaird, error: %@", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id createCRError(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  unint64_t v6 = a3;
  int v7 = (void *)v6;
  if (a1)
  {
    if (v5 | v6)
    {
      uint64_t v8 = +[NSMutableDictionary dictionary];
      if (v5)
      {
        v9 = handleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100002AA8(v5, v9);
        }

        [v8 setObject:v5 forKeyedSubscript:NSLocalizedDescriptionKey];
      }
      if (v7) {
        [v8 setObject:v7 forKeyedSubscript:NSUnderlyingErrorKey];
      }
      a1 = +[NSError errorWithDomain:CRErrorDomain code:a1 userInfo:v8];
    }
    else
    {
      a1 = +[NSError errorWithDomain:CRErrorDomain code:a1 userInfo:0];
    }
  }

  return a1;
}

void sub_100002A24(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"/private/var/hardware/FactoryData";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Found no FDR HW folder at: %@", (uint8_t *)&v1, 0xCu);
}

void sub_100002AA8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

uint64_t AMFDRSealingManifestCopyInstanceForClass()
{
  return _AMFDRSealingManifestCopyInstanceForClass();
}

uint64_t AMFDRSealingMapCopyInstanceForClass()
{
  return _AMFDRSealingMapCopyInstanceForClass();
}

uint64_t AMSupportLogSetHandler()
{
  return _AMSupportLogSetHandler();
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

uint64_t handleForCategory()
{
  return _handleForCategory();
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

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_decompressPearlFrames(void *a1, const char *a2, ...)
{
  return [a1 decompressPearlFrames];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_preCheck(void *a1, const char *a2, ...)
{
  return [a1 preCheck];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_updateBrunorDATFirmware(void *a1, const char *a2, ...)
{
  return [a1 updateBrunorDATFirmware];
}

id objc_msgSend_updateSavageDATFirmware(void *a1, const char *a2, ...)
{
  return [a1 updateSavageDATFirmware];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_verifyPSD3(void *a1, const char *a2, ...)
{
  return [a1 verifyPSD3];
}

id objc_msgSend_verifyPSD3WithReply_(void *a1, const char *a2, ...)
{
  return [a1 verifyPSD3WithReply:];
}