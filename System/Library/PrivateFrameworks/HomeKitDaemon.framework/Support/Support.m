uint64_t start()
{
  void *v0;
  void *v1;
  id v2;
  NSObject *v3;
  void *v4;
  void v6[5];
  void **v7;
  uint64_t v8;
  Class (*v9)(uint64_t);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (CFPreferencesGetAppBooleanValue(@"isHH2Enabled", @"com.apple.homed", 0))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v1 = (void *)qword_100008020;
    v15 = qword_100008020;
    if (!qword_100008020)
    {
      v7 = _NSConcreteStackBlock;
      v8 = 3221225472;
      v9 = sub_10000341C;
      v10 = &unk_1000040D8;
      v11 = &v12;
      sub_10000341C((uint64_t)&v7);
LABEL_6:
      v1 = (void *)v13[3];
    }
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v1 = (void *)qword_100008030;
    v15 = qword_100008030;
    if (!qword_100008030)
    {
      v7 = _NSConcreteStackBlock;
      v8 = 3221225472;
      v9 = sub_100003570;
      v10 = &unk_1000040D8;
      v11 = &v12;
      sub_100003570((uint64_t)&v7);
      goto LABEL_6;
    }
  }
  v2 = v1;
  _Block_object_dispose(&v12, 8);
  v3 = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000036C4;
  v6[3] = &unk_1000040B0;
  v6[4] = v2;
  dispatch_async(v3, v6);

  v4 = +[NSRunLoop currentRunLoop];
  [v4 run];

  return 0;
}

void sub_100003400(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class sub_10000341C(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100008028)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10000377C;
    v4[4] = &unk_100004110;
    v4[5] = v4;
    long long v5 = off_1000040F8;
    uint64_t v6 = 0;
    qword_100008028 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_100008028)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HMDMainDriver");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_100008020 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100003570(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100008038)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100003708;
    v4[4] = &unk_100004110;
    v4[5] = v4;
    long long v5 = off_100004130;
    uint64_t v6 = 0;
    qword_100008038 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_100008038)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HMDMainDriver");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_100008030 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000036C4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) driver];
  [v1 start];
}

uint64_t sub_100003708()
{
  uint64_t result = _sl_dlopen();
  qword_100008038 = result;
  return result;
}

uint64_t sub_10000377C()
{
  uint64_t result = _sl_dlopen();
  qword_100008028 = result;
  return result;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void free(void *a1)
{
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

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_driver(void *a1, const char *a2, ...)
{
  return [a1 driver];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}