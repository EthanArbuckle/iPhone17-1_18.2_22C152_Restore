void sub_1000026D4(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  int v9;
  NSError *v10;

  v2 = a2;
  v3 = BLBooksAskPermissionExtensionLog();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v2;
      v5 = "BooksAskPermissionExtension: reloadFromServer encountered error: %@";
      v6 = v4;
      v7 = OS_LOG_TYPE_ERROR;
      v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    v5 = "BooksAskPermissionExtension: reloadFromServer requested";
    v6 = v4;
    v7 = OS_LOG_TYPE_DEFAULT;
    v8 = 2;
    goto LABEL_6;
  }
}

void sub_100002988(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = BLBooksAskPermissionExtensionLog();
  v11 = v10;
  if (v9)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v17 = 138543618;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v9;
    v12 = "(dID=%{public}@) BooksAskPermissionExtension: Purchase encountered error: %@";
    v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v17 = 138543618;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    v12 = "(dID=%{public}@) BooksAskPermissionExtension: Purchase done! %@";
    v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v17, 0x16u);
LABEL_7:

  id v15 = objc_retainBlock(*(id *)(a1 + 32));
  v16 = v15;
  if (v15) {
    (*((void (**)(id))v15 + 2))(v15);
  }
}

void sub_100002B30(id a1, BOOL a2)
{
  v2 = BLBooksAskPermissionExtensionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "BooksAskPermissionExtension: Extension finished", v3, 2u);
  }
}

void sub_100002EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100002F00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = BLBooksAskPermissionExtensionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "BooksAskPermissionExtension: Result observer finished", v3, 2u);
  }

  [WeakRetained _finish];
}

Class sub_100002FA0(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100008618)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_1000030E4;
    v3[4] = &unk_100004248;
    v3[5] = v3;
    long long v4 = off_100004230;
    uint64_t v5 = 0;
    qword_100008618 = _sl_dlopen();
    if (!qword_100008618)
    {
      abort_report_np();
LABEL_8:
      sub_100003158();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("APResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100008610 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000030E4()
{
  uint64_t result = _sl_dlopen();
  qword_100008618 = result;
  return result;
}

void sub_100003158()
{
}

uint64_t BLBooksAskPermissionExtensionLog()
{
  return _BLBooksAskPermissionExtensionLog();
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__finish(void *a1, const char *a2, ...)
{
  return [a1 _finish];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buyParams(void *a1, const char *a2, ...)
{
  return [a1 buyParams];
}

id objc_msgSend_checkDownloadQueue(void *a1, const char *a2, ...)
{
  return [a1 checkDownloadQueue];
}

id objc_msgSend_compile(void *a1, const char *a2, ...)
{
  return [a1 compile];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemIdentifier];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}