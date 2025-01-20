void sub_1000033EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v2;

  container_query_free();
  _Unwind_Resume(a1);
}

void sub_10000357C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000365C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000366C(void *a1)
{
}

void sub_100003680(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000369C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000036D8(uint64_t a1)
{
  int v1 = 136446210;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error executing query: %{public}s", (uint8_t *)&v1, 0xCu);
}

void sub_100003758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t container_copy_sandbox_token()
{
  return _container_copy_sandbox_token();
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_identifiers()
{
  return _container_query_set_identifiers();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}
  v8 = t:"", [v7 BOOLValue]);
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    v12 = v8;
    v10 = +[NSArray arrayWithObjects:&v12 count:1];
  }
  else
  {
    v10 = &__NSArray0__struct;
  }

  return v10;
}

- (void)teardownWithParameters:(id)a3
{
  id v4 = a3;
  if ((self->_commCenterExtensionToken & 0x8000000000000000) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Releasing sandbox extension", v5, 2u);
    }
    sandbox_extension_release();
    self->_commCenterExtensionToken = -1;
  }
}

@end