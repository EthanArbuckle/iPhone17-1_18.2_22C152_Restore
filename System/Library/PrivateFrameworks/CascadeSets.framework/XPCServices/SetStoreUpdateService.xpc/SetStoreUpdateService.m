int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char v23[8];
  uint64_t v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;

  bzero(v23, 0x400uLL);
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100003804();
    }

    exit(1);
  }
  if (!confstr(65537, v23, 0x400uLL))
  {
    v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000036FC();
    }

    exit(1);
  }
  v4 = realpath_DARWIN_EXTSN(v23, 0);
  if (!v4)
  {
    v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100003780();
    }

    exit(1);
  }
  free(v4);
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = dispatch_queue_create("SetStoreUpdateService", v5);
  v7 = (void *)qword_100008040;
  qword_100008040 = (uint64_t)v6;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v8 = (void *)qword_100008058;
  v22 = qword_100008058;
  if (!qword_100008058)
  {
    *(void *)v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_10000353C;
    v26 = &unk_100004110;
    v27 = &v19;
    sub_10000353C((uint64_t)v23);
    v8 = (void *)v20[3];
  }
  v9 = v8;
  _Block_object_dispose(&v19, 8);
  v10 = [v9 alloc];
  v11 = [v10 initWithQueue:qword_100008040];
  v12 = (void *)qword_100008050;
  qword_100008050 = (uint64_t)v11;

  v13 = +[BMXPCListener serviceListener];
  v14 = (void *)qword_100008048;
  qword_100008048 = v13;

  [(id)qword_100008048 setDelegate:qword_100008050];
  [(id)qword_100008048 setQueue:qword_100008040];
  [(id)qword_100008048 activate];
  return 1;
}

void sub_10000351C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10000353C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100008060)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100003668;
    v3[4] = &unk_100004148;
    v3[5] = v3;
    long long v4 = off_100004130;
    uint64_t v5 = 0;
    qword_100008060 = _sl_dlopen();
  }
  if (!qword_100008060) {
    sub_100003884(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CCSetStoreUpdateService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100003904();
  }
  qword_100008058 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100003668()
{
  uint64_t result = _sl_dlopen();
  qword_100008060 = result;
  return result;
}

void sub_1000036DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000036FC()
{
  __error();
  sub_1000036DC((void *)&_mh_execute_header, v0, v1, "Failed to initialize temporary directory: %{darwin.errno}d", v2, v3, v4, v5, 0);
}

void sub_100003780()
{
  __error();
  sub_1000036DC((void *)&_mh_execute_header, v0, v1, "Failed to resolve temporary directory: %{darwin.errno}d", v2, v3, v4, v5, 0);
}

void sub_100003804()
{
  __error();
  sub_1000036DC((void *)&_mh_execute_header, v0, v1, "Failed to set user dir suffix: %{darwin.errno}d", v2, v3, v4, v5, 0);
}

void sub_100003884(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *CascadeEngineLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SetStoreUpdateService.m", 27, @"%s", *a1);

  __break(1u);
}

void sub_100003904()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getCCSetStoreUpdateServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SetStoreUpdateService.m", 28, @"Unable to find class %s", "CCSetStoreUpdateService");

  __break(1u);
  _Block_object_dispose(v2, v3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __biome_log_for_category()
{
  return ___biome_log_for_category();
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void exit(int a1)
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}