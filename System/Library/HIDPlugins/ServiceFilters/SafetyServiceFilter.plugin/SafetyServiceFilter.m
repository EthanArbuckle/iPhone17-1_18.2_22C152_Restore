void sub_2720(id a1, OS_xpc_object *a2)
{
  char *v2;
  NSObject *v3;
  int v4;
  char *v5;

  v2 = xpc_copy_description(a2);
  if (qword_8900 != -1) {
    dispatch_once(&qword_8900, &stru_41F8);
  }
  v3 = qword_8908;
  if (os_log_type_enabled((os_log_t)qword_8908, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "received object: %s", (uint8_t *)&v4, 0xCu);
  }
  free(v2);
}

void sub_2CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2D20(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_interrupted)
    {
      if (qword_8900 != -1) {
        dispatch_once(&qword_8900, &stru_41F8);
      }
      v11 = qword_8908;
      if (os_log_type_enabled((os_log_t)qword_8908, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "error interrupted", (uint8_t *)&v12, 2u);
      }
      WeakRetained[24] = 1;
    }
    else if (v3 == &_xpc_error_connection_invalid)
    {
      if (qword_8900 != -1) {
        dispatch_once(&qword_8900, &stru_41F8);
      }
      uint64_t v10 = qword_8908;
      if (os_log_type_enabled((os_log_t)qword_8908, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        v7 = "connection invalid";
        v8 = v10;
        uint32_t v9 = 2;
        goto LABEL_6;
      }
    }
  }
  else
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "seq");
    if (qword_8900 != -1) {
      dispatch_once(&qword_8900, &stru_41F8);
    }
    uint64_t v6 = qword_8908;
    if (os_log_type_enabled((os_log_t)qword_8908, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      uint64_t v13 = uint64;
      v7 = "got reply seq = %llu";
      v8 = v6;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v12, v9);
    }
  }
}

void sub_32AC(id a1)
{
  qword_8908 = (uint64_t)os_log_create("com.apple.anomalydetectiond", "SafetyFilter");

  _objc_release_x1();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void free(void *a1)
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
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

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_initXPC(void *a1, const char *a2, ...)
{
  return [a1 initXPC];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}
= a3;
  v8 = a4;
  uint32_t v9 = a5;
  if (qword_8900 != -1) {
    dispatch_once(&qword_8900, &stru_41F8);
  }
  uint64_t v10 = qword_8908;
  if (os_log_type_enabled((os_log_t)qword_8908, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412802;
    uint64_t v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "SafetyServiceFilter::filterEventMatching %@ event: %@ client: %@", (uint8_t *)&v12, 0x20u);
  }

  return v8;
}

- (void)setCancelHandler:(id)a3
{
  id v3 = a3;
  if (qword_8900 != -1) {
    dispatch_once(&qword_8900, &stru_41F8);
  }
  v4 = (void *)qword_8908;
  if (os_log_type_enabled((os_log_t)qword_8908, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    id v6 = objc_retainBlock(v3);
    int v7 = 134217984;
    id v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "SafetyServiceFilter::setCancelHandler %p", (uint8_t *)&v7, 0xCu);
  }
}

- (void)activate
{
  if (qword_8900 != -1) {
    dispatch_once(&qword_8900, &stru_41F8);
  }
  v2 = qword_8908;
  if (os_log_type_enabled((os_log_t)qword_8908, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "SafetyServiceFilter::activate", v3, 2u);
  }
}

- (void)cancel
{
  if (qword_8900 != -1) {
    dispatch_once(&qword_8900, &stru_41F8);
  }
  v2 = qword_8908;
  if (os_log_type_enabled((os_log_t)qword_8908, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEBUG, "SafetyServiceFilter::cancel", v3, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_dict, 0);
}

@end