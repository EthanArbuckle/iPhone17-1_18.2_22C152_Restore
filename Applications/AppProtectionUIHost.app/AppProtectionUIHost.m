void sub_1000043B8(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  NSObject *v3;
  int v4;
  OS_xpc_object *v5;

  v2 = a2;
  v3 = sub_1000051C4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "presenter connection event: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100004ECC(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    keys[0] = "result";
    xpc_object_t values = xpc_int64_create(1);
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(_xpc_connection_s **)(v3 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100005018;
    v7[3] = &unk_100008230;
    v7[4] = v3;
    xpc_connection_send_message_with_reply(v4, v2, (dispatch_queue_t)&_dispatch_main_q, v7);
  }
  else
  {
    v5 = sub_1000051C4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(keys[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No connection to presenter, dismissing self", (uint8_t *)keys, 2u);
    }

    v6 = [*(id *)(*(void *)(a1 + 32) + 40) windowScene];
    [v6 invalidate];
  }
}

void sub_100005018(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    v5 = xpc_copy_description(v3);
    v6 = sub_1000051C4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100005448((uint64_t)v5, v6);
    }

    free(v5);
    v4 = [*(id *)(*(void *)(a1 + 32) + 40) windowScene];
    [v4 invalidate];
  }
  else
  {
    v4 = sub_1000051C4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received reply to our result message, awaiting invalidation", v7, 2u);
    }
  }
}

id sub_1000051C4()
{
  if (qword_10000D6A8 != -1) {
    dispatch_once(&qword_10000D6A8, &stru_100008298);
  }
  v0 = (void *)qword_10000D6B0;

  return v0;
}

void sub_100005218(id a1)
{
  qword_10000D6B0 = (uint64_t)os_log_create("com.apple.appprotection", "UIHost");

  _objc_release_x1();
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100005320(void *a1, NSObject *a2)
{
  id v3 = [a1 configurationContext];
  v4 = [v3 userInfo];
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "no bundleID provided for scene activation: %@", (uint8_t *)&v5, 0xCu);
}

void sub_1000053D0(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unknown feature %lld", (uint8_t *)&v2, 0xCu);
}

void sub_100005448(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error on connection to presenter, dismissing self: %s", (uint8_t *)&v2, 0xCu);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_retainAutoreleaseReturnValue(id a1)
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

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return _xpc_connection_create_from_endpoint(endpoint);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationContext(void *a1, const char *a2, ...)
{
  return [a1 configurationContext];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}