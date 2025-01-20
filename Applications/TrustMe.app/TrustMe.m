unsigned char *sub_100003E84(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

uint64_t sub_100004A38(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_100004C3C(uint64_t result, int a2)
{
  *(unsigned char *)result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t start(int a1, char **a2)
{
  CertUILoggingInitialize();
  unsigned int v6 = UIApplicationMain(a1, a2, 0, @"TrustMeAppDelegate");
  return v6;
}

UIUserInterfaceIdiom sub_100005200()
{
  v2 = +[UIDevice currentDevice];
  char v3 = 0;
  if (objc_opt_respondsToSelector())
  {
    v4 = +[UIDevice currentDevice];
    char v3 = 1;
    UIUserInterfaceIdiom v1 = [(UIDevice *)v4 userInterfaceIdiom];
  }
  else
  {
    UIUserInterfaceIdiom v1 = UIUserInterfaceIdiomPhone;
  }
  if (v3) {

  }
  return v1;
}

void sub_1000054D0(id *a1)
{
  v1[2] = a1;
  v1[1] = a1;
  v1[0] = [a1[4] _remoteViewControllerProxy];
  [v1[0] dismiss];
  objc_storeStrong(v1, 0);
}

uint64_t CertUILoggingInitialize()
{
  return _CertUILoggingInitialize();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void exit(int a1)
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__clearTimer(void *a1, const char *a2, ...)
{
  return [a1 _clearTimer];
}

id objc_msgSend__dismissRemoteAlertController(void *a1, const char *a2, ...)
{
  return [a1 _dismissRemoteAlertController];
}

id objc_msgSend__getSpringBoardOrientation(void *a1, const char *a2, ...)
{
  return [a1 _getSpringBoardOrientation];
}

id objc_msgSend__presentNextQueuedMessage(void *a1, const char *a2, ...)
{
  return [a1 _presentNextQueuedMessage];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__scheduleTimer(void *a1, const char *a2, ...)
{
  return [a1 _scheduleTimer];
}

id objc_msgSend__startCenter(void *a1, const char *a2, ...)
{
  return [a1 _startCenter];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentRemoteAlertController(void *a1, const char *a2, ...)
{
  return [a1 currentRemoteAlertController];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delayReply(void *a1, const char *a2, ...)
{
  return [a1 delayReply];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_dismissSheetAndDismissAlert(void *a1, const char *a2, ...)
{
  return [a1 dismissSheetAndDismissAlert];
}

id objc_msgSend_homeButtonWasPressed(void *a1, const char *a2, ...)
{
  return [a1 homeButtonWasPressed];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_runServerOnCurrentThread(void *a1, const char *a2, ...)
{
  return [a1 runServerOnCurrentThread];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_trustControllerToBePresentedByRemoteAlertViewController(void *a1, const char *a2, ...)
{
  return [a1 trustControllerToBePresentedByRemoteAlertViewController];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}