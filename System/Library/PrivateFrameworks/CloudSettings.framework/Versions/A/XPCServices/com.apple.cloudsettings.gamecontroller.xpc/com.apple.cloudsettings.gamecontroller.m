uint64_t start()
{
  void *v0;
  void *v1;
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IN XPCSERVICE - MAIN", v3, 2u);
  }
  v0 = objc_opt_new();
  v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];

  return 0;
}

id sub_100003F94()
{
  if (qword_10000C8D0 != -1) {
    dispatch_once(&qword_10000C8D0, &stru_100008198);
  }
  v0 = (void *)qword_10000C8C8;

  return v0;
}

void sub_100003FE8(id a1)
{
  qword_10000C8C8 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.GameController"];

  _objc_release_x1();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t getGCSLogger()
{
  return _getGCSLogger();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_controllers(void *a1, const char *a2, ...)
{
  return [a1 controllers];
}

id objc_msgSend_copilotFusedControllers(void *a1, const char *a2, ...)
{
  return [a1 copilotFusedControllers];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_fusedControllerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 fusedControllerIdentifier];
}

id objc_msgSend_games(void *a1, const char *a2, ...)
{
  return [a1 games];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_jsonObject(void *a1, const char *a2, ...)
{
  return [a1 jsonObject];
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return [a1 modifiedDate];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 persistentIdentifier];
}

id objc_msgSend_profiles(void *a1, const char *a2, ...)
{
  return [a1 profiles];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_timeToLiveSeconds(void *a1, const char *a2, ...)
{
  return [a1 timeToLiveSeconds];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}