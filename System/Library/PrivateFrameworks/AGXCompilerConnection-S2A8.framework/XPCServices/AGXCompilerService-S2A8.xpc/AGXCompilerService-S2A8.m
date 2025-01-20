void start()
{
  xpc_main((xpc_connection_handler_t)sub_100003650);
}

void sub_100003650(_xpc_connection_s *a1)
{
  sub_1000036B8();
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)qword_100008040);
  xpc_connection_set_qos_class_floor();
  xpc_connection_set_event_handler(a1, &stru_100004160);
  xpc_connection_resume(a1);
}

void sub_1000036B8()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100008068, memory_order_acquire) & 1) == 0)
  {
    if (__cxa_guard_acquire(&qword_100008068)) {
      sub_100003A3C();
    }
  }
}

void sub_100003710(id a1, void *a2)
{
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    remote_connection = xpc_dictionary_get_remote_connection(a2);
    if (xpc_dictionary_get_BOOL(a2, "connection_ping"))
    {
      xpc_connection_send_message(remote_connection, reply);
      xpc_release(reply);
    }
    else
    {
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2000000000;
      sub_1000036B8();
      v25 = &qword_100008040;
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_1000039A4;
      block[3] = &unk_1000041A8;
      block[4] = &v22;
      block[5] = a2;
      if (qword_100008070 != -1) {
        dispatch_once(&qword_100008070, block);
      }
      size_t length = 0;
      data = xpc_dictionary_get_data(a2, "state", &length);
      size_t v19 = 0;
      v6 = xpc_dictionary_get_data(a2, "bitcode", &v19);
      size_t v17 = 0;
      bytes = 0;
      string = xpc_dictionary_get_string(a2, "log_file_name");
      v8 = *(NSObject **)(v23[3] + 8);
      dispatch_time_t v9 = dispatch_time(0, 70000000000);
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume(*(dispatch_object_t *)(v23[3] + 8));
      uint64_t v10 = v23[3];
      uint64_t v12 = *(void *)(v10 + 16);
      uint64_t v11 = *(void *)(v10 + 24);
      uint64_t v13 = *(unsigned int *)(v10 + 32);
      if (string) {
        char v14 = (*(uint64_t (**)(uint64_t, const void *, size_t, const void *, size_t, uint64_t, const char *))(v12 + 32))(v11, data, length, v6, v19, v13, string);
      }
      else {
        char v14 = (*(uint64_t (**)(uint64_t, const void *, size_t, const void *, size_t, uint64_t, void **, size_t *))(v12 + 24))(v11, data, length, v6, v19, v13, &bytes, &v17);
      }
      BOOL v15 = v14;
      dispatch_suspend(*(dispatch_object_t *)(v23[3] + 8));
      xpc_dictionary_set_BOOL(reply, "error", v15);
      if (bytes)
      {
        xpc_object_t v16 = xpc_data_create(bytes, v17);
        xpc_dictionary_set_value(reply, "reply", v16);
        xpc_release(v16);
      }
      xpc_connection_send_message(remote_connection, reply);
      xpc_release(reply);
      if (bytes) {
        (*(void (**)(void))(*(void *)(v23[3] + 16) + 40))(*(void *)(v23[3] + 24));
      }
      _Block_object_dispose(&v22, 8);
    }
  }
}

uint64_t sub_1000039A4(uint64_t a1)
{
  size_t length = 0;
  data = xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 40), "compiler_options", &length);
  *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 32) = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "architecture");
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = (*(uint64_t (**)(const void *, size_t, void))(*(void *)(v3 + 16) + 8))(data, length, *(unsigned int *)(v3 + 32));
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 24) = result;
  return result;
}

void sub_100003A3C()
{
  qword_100008040 = 0;
  qword_100008050 = 0;
  unk_100008058 = 0;
  dword_100008060 = 0;
  qword_100008040 = (uint64_t)dispatch_queue_create(0, 0);
  global_queue = dispatch_get_global_queue(0, 0);
  qword_100008048 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, global_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100003BD4;
  handler[3] = &unk_100004180;
  handler[4] = &qword_100008040;
  dispatch_source_set_event_handler((dispatch_source_t)qword_100008048, handler);
  operator new();
}

void sub_100003BD4(uint64_t a1)
{
  qword_100008008 = (uint64_t)"Compiler service plugin hung";
  abort();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void operator new()
{
  while (1)
    ;
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void abort(void)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_qos_class_floor()
{
  return _xpc_connection_set_qos_class_floor();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

void xpc_release(xpc_object_t object)
{
}