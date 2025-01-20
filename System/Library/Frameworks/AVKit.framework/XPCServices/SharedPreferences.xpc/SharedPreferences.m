uint64_t start()
{
  void *v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];

  return 0;
}

void sub_100003318(uint64_t a1, void *a2)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)v11;
    id v7 = v4;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isMirrored", (void)v10))
        {
          LODWORD(v7) = 1;
          goto LABEL_12;
        }
      }
      id v7 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    LODWORD(v7) = 0;
  }
LABEL_12:

  if (v5) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v9);
}

id sub_1000035B8()
{
  if (qword_1000087A0 != -1) {
    dispatch_once(&qword_1000087A0, &stru_100004128);
  }
  v0 = (void *)qword_100008798;

  return v0;
}

void sub_10000360C(id a1)
{
  qword_100008798 = (uint64_t)os_log_create("com.apple.avkit.SharedPreferences", "AVKitSharedPreferences");

  _objc_release_x1();
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_msgSend_isMirrored(void *a1, const char *a2, ...)
{
  return [a1 isMirrored];
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