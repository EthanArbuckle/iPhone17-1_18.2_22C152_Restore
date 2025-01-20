uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

id sub_100004284()
{
  if (qword_10000D440 != -1) {
    dispatch_once(&qword_10000D440, &stru_100008228);
  }
  v0 = (void *)qword_10000D438;

  return v0;
}

void sub_1000042D8(id a1)
{
  qword_10000D438 = (uint64_t)os_log_create("com.apple.carplay.splashscreen", "General");

  _objc_release_x1();
}

void sub_100004C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004C80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissAlertAnimated:1];
}

void sub_100004CC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissAlertAnimated:1];
}

void sub_100004DF0(id a1, NSError *a2)
{
  v2 = sub_100004284();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100005668(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_100004E34(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004F2C;
  v5[3] = &unk_1000082B8;
  v2 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004F84;
  v3[3] = &unk_1000082E0;
  id v4 = *(id *)(a1 + 40);
  +[UIView animateWithDuration:v5 animations:v3 completion:0.25];
}

id sub_100004F2C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 setWallpaperStyle:0 withDuration:0.25];
}

id sub_100004F84(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  v1 = (void *)UIApp;

  return [v1 terminateWithSuccess];
}

id sub_100005090(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissAnimated:*(unsigned __int8 *)(a1 + 40)];
}

void sub_100005168(id a1, NSError *a2)
{
  v2 = sub_100004284();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100005668(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_1000052C8(id a1, NSError *a2)
{
  v2 = sub_100004284();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100005668(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void sub_10000530C(void *a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000053A8;
  v3[3] = &unk_1000082B8;
  uint64_t v1 = a1[4];
  v2 = (void *)a1[6];
  void v3[4] = a1[5];
  id v4 = v2;
  +[BSUIAnimationFactory animateWithFactory:v1 actions:v3];
}

id sub_1000053A8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];

  [*(id *)(a1 + 40) setWallpaperTunnelActive:1];
  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 setWallpaperStyle:4 withDuration:0.25];
}

void sub_1000054E0(uint64_t a1, void *a2)
{
  if (([a2 events] & 0x10) != 0)
  {
    uint64_t v3 = sub_100004284();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling home button action", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000055B4;
    block[3] = &unk_100008398;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_1000055B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissAnimated:1];
}

void sub_1000055F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005668(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return [a1 xpcEndpoint];
}