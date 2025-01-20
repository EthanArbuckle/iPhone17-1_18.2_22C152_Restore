void sub_100003BA8(id a1)
{
  id v1;
  uint64_t vars8;

  v1 = +[IMSystemMonitor sharedInstance];
  [v1 _forceResumed];
}

uint64_t start(int a1, char **a2)
{
  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:1 forKey:@"UIDisableLegacyTextView"];

  IMSetEmbeddedTempDirectory();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

uint64_t CKMVCListenerCapabilities()
{
  return _CKMVCListenerCapabilities();
}

uint64_t IMSetEmbeddedTempDirectory()
{
  return _IMSetEmbeddedTempDirectory();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

void objc_release(id a1)
{
}

id objc_msgSend__forceResumed(void *a1, const char *a2, ...)
{
  return [a1 _forceResumed];
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return [a1 blockUntilConnected];
}

id objc_msgSend_iMessageEnabled(void *a1, const char *a2, ...)
{
  return [a1 iMessageEnabled];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}