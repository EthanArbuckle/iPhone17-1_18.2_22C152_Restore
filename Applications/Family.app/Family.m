void sub_10000406C(id a1, FAFamilyCircle *a2, NSError *a3)
{
  FAFamilyCircle *v3;
  void block[4];
  FAFamilyCircle *v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004100;
  block[3] = &unk_100008248;
  v5 = a2;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100004100(uint64_t a1)
{
  id v1 = [objc_alloc((Class)FACacheImageMarqueeOperationWrapper) initWithFamilyCircle:*(void *)(a1 + 32)];
  [v1 createAndCacheData];
}

void sub_1000043A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [v3 loadSuccess];
  v5 = _FALogSystem();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100004EA4(v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100004EE8(v3, v6);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004490;
  block[3] = &unk_100008248;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100004490(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  unsigned int v4 = *(void **)(a1 + 32);

  return [v4 _destroyCurrentSceneSession];
}

void sub_100004550(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Error destroying sceneSession: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100004CC0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to connect to the session.", v1, 2u);
}

void sub_100004D04()
{
  sub_100004844();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to handle aaaction (%{public}@) with components: %{private}@", v1, 0x16u);
}

void sub_100004D7C(void *a1, NSObject *a2)
{
  int v4 = [a1 scheme];
  int v5 = 138543619;
  v6 = v4;
  __int16 v7 = 2113;
  v8 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received unsupported scheme (%{public}@) from url: %{private}@", (uint8_t *)&v5, 0x16u);
}

void sub_100004E2C()
{
  sub_100004844();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Handling event type (%{public}@) with components: %{private}@", v1, 0x16u);
}

void sub_100004EA4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Successfully performed circle operation!", v1, 2u);
}

void sub_100004EE8(void *a1, NSObject *a2)
{
  id v3 = [a1 error];
  int v4 = 138543362;
  int v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to perform circle operation, error: %{public}@", (uint8_t *)&v4, 0xCu);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _FALogSystem()
{
  return __FALogSystem();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return _class_getProperty(cls, name);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return [a1 URLContexts];
}

id objc_msgSend__currentSceneSession(void *a1, const char *a2, ...)
{
  return [a1 _currentSceneSession];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_createAndCacheData(void *a1, const char *a2, ...)
{
  return [a1 createAndCacheData];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_loadSuccess(void *a1, const char *a2, ...)
{
  return [a1 loadSuccess];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_openSessions(void *a1, const char *a2, ...)
{
  return [a1 openSessions];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return [a1 scene];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return [a1 windows];
}