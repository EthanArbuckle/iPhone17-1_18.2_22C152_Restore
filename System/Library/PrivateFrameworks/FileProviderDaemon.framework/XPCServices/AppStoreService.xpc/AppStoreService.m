uint64_t start()
{
  void *v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];

  return 0;
}

void sub_1000028A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t sub_10000291C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000292C(uint64_t a1)
{
}

void sub_100002934(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100002D3C(v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_1000029A4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100002F04();
    }
LABEL_4:

    goto LABEL_5;
  }
  if (!v7)
  {
    v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100002DD4();
    }
    goto LABEL_4;
  }
  id v21 = 0;
  v11 = +[NSData dataWithContentsOfURL:v7 options:8 error:&v21];
  id v12 = v21;
  v13 = v12;
  if (v11 && !v12) {
    goto LABEL_13;
  }
  v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100002E50((uint64_t)v7, v13, v14);
  }

  if (v11)
  {
LABEL_13:
    uint64_t v15 = *(void *)(a1 + 32);
    v22[0] = @"appBundleID";
    v22[1] = @"mappedData";
    v23[0] = v15;
    v23[1] = v11;
    v22[2] = @"undecorated";
    v16 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    v23[2] = v16;
    v17 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100002BF8;
    v19[3] = &unk_100004228;
    v18 = *(void **)(a1 + 40);
    id v20 = *(id *)(a1 + 48);
    [v18 operationDidProgressWithInfo:v17 error:0 completionHandler:v19];

    goto LABEL_6;
  }
LABEL_5:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
LABEL_6:
}

void sub_100002BF8(uint64_t a1)
{
}

uint64_t sub_100002C00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100002C10(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.FileProviderDaemon.AppStoreService.notify-queue", v3);
  v2 = (void *)qword_100008780;
  qword_100008780 = (uint64_t)v1;
}

void sub_100002C8C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[ERROR] remote lookup failed with %@", buf, 0xCu);
}

void sub_100002CE4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] starting remote lookup for [%@]", buf, 0xCu);
}

void sub_100002D3C(void *a1, NSObject *a2)
{
  id v3 = objc_msgSend(a1, "fp_prettyDescription");
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[ERROR] connection to operation client was terminated with %@", (uint8_t *)&v4, 0xCu);
}

void sub_100002DD4()
{
  sub_100002C74();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching icon for %@ succeeded but returned no data (resp:%@)", v1, 0x16u);
}

void sub_100002E50(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] can't map data at %@ – %@", (uint8_t *)&v6, 0x16u);
}

void sub_100002F04()
{
  sub_100002C74();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[ERROR] fetching icon for %@ failed with %@", v1, 0x16u);
}

uint64_t FPDAppStoreServiceXPCInterface()
{
  return _FPDAppStoreServiceXPCInterface();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uint64_t fp_current_or_default_log()
{
  return _fp_current_or_default_log();
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return [a1 perform];
}

id objc_msgSend_responseDataItems(void *a1, const char *a2, ...)
{
  return [a1 responseDataItems];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}