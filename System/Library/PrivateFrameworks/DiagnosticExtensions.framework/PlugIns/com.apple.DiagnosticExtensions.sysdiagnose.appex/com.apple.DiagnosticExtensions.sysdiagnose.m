id sub_1000011D4(void *a1)
{
  id v1;
  NSObject *v2;
  _xpc_connection_s *mach_service;
  xpc_object_t v4;
  void *v5;
  id v6;
  uint8_t v8[16];
  uint64_t vars8;

  v1 = a1;
  v2 = dispatch_get_global_queue(33, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", v2, 2uLL);
  xpc_connection_set_event_handler(mach_service, &stru_100004318);
  xpc_connection_resume(mach_service);
  if (mach_service)
  {
    v4 = xpc_connection_send_message_with_reply_sync(mach_service, v1);
    v5 = v4;
    if (v4
      && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary
      && xpc_dictionary_get_uint64(v5, "RESPONSE_TYPE") == 1)
    {
      v6 = v5;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't get valid reply from sysdiagnose server", v8, 2u);
      }
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_10000172C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100001750(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_1000082B8 != -1) {
      dispatch_once(&qword_1000082B8, &stru_100004358);
    }
    if (byte_1000082B0)
    {
      v2 = objc_msgSend(v1, "substringFromIndex:", objc_msgSend(v1, "rangeOfString:", @"/Library/Logs"));
      if ([v1 rangeOfString:@"/private/var/mobile"] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"CrashReporter" withString:@"DiagnosticReports"];

        v2 = (void *)v3;
      }
      if (qword_1000082C8 != -1) {
        dispatch_once(&qword_1000082C8, &stru_100004378);
      }
      id v4 = (id)qword_1000082C0;
      id v5 = [v4 stringByAppendingPathComponent:v2];
    }
    else
    {
      id v5 = v1;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = v1;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "File %@ realpath %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t sub_100001924(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100001934(uint64_t a1)
{
}

void sub_10000193C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Remote Path: %@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = +[DEAttachmentItem attachmentWithPath:v3];
  [v4 addObject:v5];
}

uint64_t sub_1000020A8(uint64_t result, void *a2, unsigned char *a3)
{
  if (result && a2)
  {
    uint64_t v4 = [a2 objectForKey:result];
    if (v4)
    {
      int v6 = (void *)v4;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (a3)
      {
        if (isKindOfClass) {
          *a3 = [v6 BOOLValue];
        }
      }
    }
    return _objc_release_x1();
  }
  return result;
}

void sub_10000250C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Reporting progress to DE. Received progressDict: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v4 = [v3 objectForKey:sdProgressPercent];
  id v5 = [v3 objectForKey:sdProgressDiagnosticId];
  if (v4)
  {
    [v4 doubleValue];
    id v7 = [objc_alloc((Class)DECollectionProgress) initWithPercentComplete:v6];
    id v8 = v7;
    if (v5) {
      [v7 setStatusString:v5];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100002A28();
  }
}

void sub_1000026E8(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "com.apple.sysdiagnose.service.xpc";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPC connection to %s failed", (uint8_t *)&v2, 0xCu);
  }
}

void sub_10000279C(id a1)
{
  byte_1000082B0 = OSAInMultiUserMode();
}

void sub_1000027BC(id a1)
{
  if (qword_1000082B8 != -1) {
    dispatch_once(&qword_1000082B8, &stru_100004358);
  }
  if (byte_1000082B0)
  {
    uint64_t v1 = container_system_group_path_for_identifier();
    if (v1)
    {
      int v2 = (void *)v1;
      id v3 = +[NSURL fileURLWithFileSystemRepresentation:v1 isDirectory:1 relativeToURL:0];
      uint64_t v4 = [v3 path];
      id v5 = (void *)qword_1000082C0;
      qword_1000082C0 = v4;

      free(v2);
    }
    else
    {
      id v7 = (void *)qword_1000082C0;
      qword_1000082C0 = @"/private/var/mobile/";

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v9 = 1;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error finding path %llu", buf, 0xCu);
      }
    }
  }
  else
  {
    double v6 = (void *)qword_1000082C0;
    qword_1000082C0 = @"/private/var/mobile/";
  }
}

BOOL sub_100002960(id a1, NSURL *a2, NSError *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(NSError *)a3 localizedDescription];
    int v7 = 138412546;
    id v8 = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "DE Enumeration error for url: %@: %@\n", (uint8_t *)&v7, 0x16u);
  }
  return 1;
}

void sub_100002A28()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Received malformed progressDict — no progress percent found. Not reporting to DE", v0, 2u);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t OSAInMultiUserMode()
{
  return _OSAInMultiUserMode();
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

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_getRemoteArchives(void *a1, const char *a2, ...)
{
  return [a1 getRemoteArchives];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathSubmission(void *a1, const char *a2, ...)
{
  return [a1 pathSubmission];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_tryReusingSysdiagnoseForParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tryReusingSysdiagnoseForParameters:");
}