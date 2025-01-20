void sub_10000371C(id *a1)
{
  NSProcessInfo *v2;
  void **v3;
  int v4;
  int v5;
  void (*v6)(void *, char);
  void *v7;
  id v8;
  id v9[3];

  v9[2] = a1;
  v9[1] = a1;
  v2 = +[NSProcessInfo processInfo];
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100003830;
  v7 = &unk_100004080;
  v8 = a1[4];
  v9[0] = a1[5];
  -[NSProcessInfo performExpiringActivityWithReason:usingBlock:](v2, "performExpiringActivityWithReason:usingBlock:", @"Calling AMD extension");

  objc_storeStrong(v9, 0);
  objc_storeStrong(&v8, 0);
}

void sub_100003830(void *a1, char a2)
{
  v13 = a1;
  char v12 = a2 & 1;
  v11[1] = a1;
  v11[0] = 0;
  id v10 = 0;
  if (a2)
  {
    id location = &_os_log_default;
    char v8 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = location;
      os_log_type_t type = v8;
      sub_1000039A4(v7);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "Extension is being terminated", v7, 2u);
    }
    objc_storeStrong(&location, 0);
    +[AMDJSRequestHandler wrapUp];
    objc_storeStrong(&v10, &off_100004180);
    id v2 = +[AMDError allocError:29 withMessage:@"AMD is being killed"];
    id v3 = v11[0];
    v11[0] = v2;

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    +[AMDJSRequestHandler handlePayload:a1[4] withCompletionHandler:a1[5]];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
}

unsigned char *sub_1000039A4(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_wrapUp(void *a1, const char *a2, ...)
{
  return [a1 wrapUp];
}