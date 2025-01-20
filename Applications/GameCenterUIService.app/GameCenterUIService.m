uint64_t start(int a1, char **a2)
{
  return UIApplicationMain(a1, a2, 0, @"AppDelegateService");
}

uint64_t GKUISetRemote()
{
  return _GKUISetRemote();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_release(id a1)
{
}

id objc_msgSend_daemonProxy(void *a1, const char *a2, ...)
{
  return [a1 daemonProxy];
}

id objc_msgSend_localPlayer(void *a1, const char *a2, ...)
{
  return [a1 localPlayer];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_updateFromLocalPlayer_(void *a1, const char *a2, ...)
{
  return [a1 updateFromLocalPlayer:];
}