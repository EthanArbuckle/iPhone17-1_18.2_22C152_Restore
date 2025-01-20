uint64_t start(int a1, char **a2)
{
  void *v4;
  uint64_t v5;

  v5 = UIApplicationMain(a1, a2, 0, 0);
  return v5;
}

id sub_100002580(void *a1)
{
  uint64_t v1 = qword_1000086C0;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_1000086C0, &stru_100004178);
  }
  v3 = +[NSBundle bundleForClass:qword_1000086B8];
  v4 = [v3 localizedStringForKey:v2 value:&stru_1000041F8 table:@"WebContentAnalysisUI"];

  return v4;
}

void sub_10000262C(id a1)
{
  qword_1000086B8 = (uint64_t)NSClassFromString(@"WFServicePINEntryViewController");
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_settingEnabled(void *a1, const char *a2, ...)
{
  return [a1 settingEnabled];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}