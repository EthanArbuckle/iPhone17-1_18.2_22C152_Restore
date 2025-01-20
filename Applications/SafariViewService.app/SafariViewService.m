uint64_t start(int a1, char **a2)
{
  void *v4;
  id v5;
  const char *v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  uint64_t v10;

  _SFSafariContainerPath();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (const char *)[v5 fileSystemRepresentation];
  setenv("HOME", v6, 1);
  setenv("CFFIXED_USER_HOME", v6, 1);
  _SFSafariTemporaryDirectoryPath();
  v7 = objc_claimAutoreleasedReturnValue();
  setenv("TMPDIR", (const char *)[v7 fileSystemRepresentation], 1);

  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  v10 = UIApplicationMain(a1, a2, v9, v9);

  return v10;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _SFSafariContainerPath()
{
  return __SFSafariContainerPath();
}

uint64_t _SFSafariIconImageCacheDirectoryPath()
{
  return __SFSafariIconImageCacheDirectoryPath();
}

uint64_t _SFSafariTemporaryDirectoryPath()
{
  return __SFSafariTemporaryDirectoryPath();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

id objc_msgSend_createDefaultWebsiteDataStore(void *a1, const char *a2, ...)
{
  return [a1 createDefaultWebsiteDataStore];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_mainSystem(void *a1, const char *a2, ...)
{
  return [a1 mainSystem];
}

id objc_msgSend_modifierFlags(void *a1, const char *a2, ...)
{
  return [a1 modifierFlags];
}

id objc_msgSend_registerReaderCustomProtocols(void *a1, const char *a2, ...)
{
  return [a1 registerReaderCustomProtocols];
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return [a1 sharedProvider];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return [a1 system];
}