void sub_100001640(id a1, BOOL a2, NSError *a3)
{
  NSError *v4;
  NSObject *v5;

  v4 = a3;
  if (!a2)
  {
    v5 = sub_100001E34();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100001FA8();
    }
  }
}

void sub_100001E0C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100001E34()
{
  if (qword_100008D18 != -1) {
    dispatch_once(&qword_100008D18, &stru_1000041C0);
  }
  v0 = (void *)qword_100008D10;

  return v0;
}

void sub_100001E88(id a1)
{
  qword_100008D10 = (uint64_t)os_log_create("com.apple.calls.FaceTimeLinkTrampoline", "Default");

  _objc_release_x1();
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100001F40()
{
  sub_100001E28();
  sub_100001E0C((void *)&_mh_execute_header, v0, v1, "Could not make record for InCallService: %@", v2, v3, v4, v5, v6);
}

void sub_100001FA8()
{
  sub_100001E28();
  sub_100001E0C((void *)&_mh_execute_header, v0, v1, "Could not bounce activity to InCallService: %@", v2, v3, v4, v5, v6);
}

void sub_100002010()
{
  sub_100001E28();
  sub_100001E0C((void *)&_mh_execute_header, v0, v1, "Could not bounce openURL to InCallService: %@", v2, v3, v4, v5, v6);
}

void sub_100002078()
{
  sub_100001E28();
  sub_100001E0C((void *)&_mh_execute_header, v0, v1, "Malformed conversation link: %@", v2, v3, v4, v5, v6);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t TUPreferredFaceTimeBundleIdentifier()
{
  return _TUPreferredFaceTimeBundleIdentifier();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_conversationHandoffEnabled(void *a1, const char *a2, ...)
{
  return [a1 conversationHandoffEnabled];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return [a1 featureFlags];
}

id objc_msgSend_ftAppDeletionEnabled(void *a1, const char *a2, ...)
{
  return [a1 ftAppDeletionEnabled];
}

id objc_msgSend_isFaceTimeApplicationInstalled(void *a1, const char *a2, ...)
{
  return [a1 isFaceTimeApplicationInstalled];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return [a1 webpageURL];
}