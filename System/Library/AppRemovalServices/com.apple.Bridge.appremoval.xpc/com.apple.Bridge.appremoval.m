int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t _LSAppRemovalServiceXPCInterface()
{
  return __LSAppRemovalServiceXPCInterface();
}

int *__error(void)
{
  return ___error();
}

void free(void *a1)
{
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__bridgeDeleteMobileAssets(void *a1, const char *a2, ...)
{
  return [a1 _bridgeDeleteMobileAssets];
}

id objc_msgSend__clearAppConduitData(void *a1, const char *a2, ...)
{
  return [a1 _clearAppConduitData];
}

id objc_msgSend__clearBridgeData(void *a1, const char *a2, ...)
{
  return [a1 _clearBridgeData];
}

id objc_msgSend__clearNanoPassKitData(void *a1, const char *a2, ...)
{
  return [a1 _clearNanoPassKitData];
}

id objc_msgSend__clearNanoPreferencesSyncData(void *a1, const char *a2, ...)
{
  return [a1 _clearNanoPreferencesSyncData];
}

id objc_msgSend__clearNanoRegistryData(void *a1, const char *a2, ...)
{
  return [a1 _clearNanoRegistryData];
}

id objc_msgSend__clearNanoSystemSettingsData(void *a1, const char *a2, ...)
{
  return [a1 _clearNanoSystemSettingsData];
}

id objc_msgSend__clearNanoTimeKitData(void *a1, const char *a2, ...)
{
  return [a1 _clearNanoTimeKitData];
}

id objc_msgSend__clearPairedSyncData(void *a1, const char *a2, ...)
{
  return [a1 _clearPairedSyncData];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}