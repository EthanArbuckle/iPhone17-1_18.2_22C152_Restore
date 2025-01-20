int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;
  void *v5;
  void v7[6];
  long long v8;
  uint64_t v9;

  setenv("TMPDIR", "/private/var/tmp", 1);
  _set_user_dir_suffix();
  v7[0] = 0;
  if (!qword_10000CA40)
  {
    v7[1] = _NSConcreteStackBlock;
    v7[2] = 3221225472;
    v7[3] = sub_100004540;
    v7[4] = &unk_1000083C0;
    v7[5] = v7;
    v8 = off_1000082D8;
    v9 = 0;
    qword_10000CA40 = _sl_dlopen();
    v3 = (void *)v7[0];
    if (qword_10000CA40)
    {
      if (!v7[0]) {
        goto LABEL_4;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
  }
LABEL_4:
  v4 = objc_opt_new();
  v5 = +[NSXPCListener serviceListener];
  [v5 setDelegate:v4];
  [v5 resume];

  return 0;
}

uint64_t sub_100004540()
{
  uint64_t result = _sl_dlopen();
  qword_10000CA40 = result;
  return result;
}

void sub_100004C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100004C50(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_10000CA60)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_100004D90;
    v5[4] = &unk_1000083C0;
    v5[5] = v5;
    long long v6 = off_1000083E0;
    uint64_t v7 = 0;
    qword_10000CA60 = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)qword_10000CA60;
    if (qword_10000CA60)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)qword_10000CA60;
LABEL_5:
  uint64_t result = dlsym(v2, "_PSIntentForSelectedSuggestionWithContextExtensionUUID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000CA58 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004D90()
{
  uint64_t result = _sl_dlopen();
  qword_10000CA60 = result;
  return result;
}

id sub_100005230(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_10000523C(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v3 = [v6 objectForInfoDictionaryKey:PKSDKInfoKey ofClass:objc_opt_class() inScope:1];
      if ([v3 isEqualToString:INIntentsServiceExtensionPointName])
      {
        v4 = *(void **)(a1 + 32);
        v5 = [v6 containingBundle];
        LOBYTE(v4) = [v4 containsObject:v5];

        if ((v4 & 1) == 0) {
          [*(id *)(a1 + 32) addObject:v6];
        }
      }
    }
  }
}

NSString *__cdecl sub_10000533C(id a1, LSBundleProxy *a2, unint64_t a3)
{
  return (NSString *)[(LSBundleProxy *)a2 bundleIdentifier];
}

void sub_100005B94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  if (*(double *)(a1 + 40) <= 0.0 || *(double *)(a1 + 48) <= 0.0)
  {
    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  id v8 = v5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v9 = (void *)qword_10000CA48;
  uint64_t v20 = qword_10000CA48;
  if (!qword_10000CA48)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100005D3C;
    v16[3] = &unk_100008388;
    v16[4] = &v17;
    sub_100005D3C((uint64_t)v16);
    v9 = (void *)v18[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v17, 8);
  double v11 = *(double *)(a1 + 40);
  double v12 = *(double *)(a1 + 48);
  id v15 = 0;
  v13 = objc_msgSend(v10, "downscaledPNGImageForImage:size:error:", v8, &v15, v11, v12);
  id v14 = v15;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_10:
}

void sub_100005D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100005D3C(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_10000CA50)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100005E90;
    v4[4] = &unk_1000083C0;
    v4[5] = v4;
    long long v5 = off_1000083A8;
    uint64_t v6 = 0;
    qword_10000CA50 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_10000CA50)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("INUIImageSizeProvider");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_10000CA48 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100005E90()
{
  uint64_t result = _sl_dlopen();
  qword_10000CA50 = result;
  return result;
}

uint64_t INSupportedIntentsByExtensions()
{
  return _INSupportedIntentsByExtensions();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _INVCIntentDefinitionManagerClass()
{
  return __INVCIntentDefinitionManagerClass();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutorelease(id a1)
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

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

id objc_msgSend_accessLevel(void *a1, const char *a2, ...)
{
  return [a1 accessLevel];
}

id objc_msgSend_allBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allBundleIdentifiers];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return [a1 containingBundle];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_intentDefinitionURLs(void *a1, const char *a2, ...)
{
  return [a1 intentDefinitionURLs];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return [a1 protocol];
}

id objc_msgSend_purgeExpiredImagesInEphemeralStore(void *a1, const char *a2, ...)
{
  return [a1 purgeExpiredImagesInEphemeralStore];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_servingConnection(void *a1, const char *a2, ...)
{
  return [a1 servingConnection];
}

id objc_msgSend_sharedStore(void *a1, const char *a2, ...)
{
  return [a1 sharedStore];
}

id objc_msgSend_storeUserContext_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeUserContext:forBundleIdentifier:");
}