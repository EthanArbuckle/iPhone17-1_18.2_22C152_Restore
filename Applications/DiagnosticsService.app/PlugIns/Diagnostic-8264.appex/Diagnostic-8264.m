void sub_10000383C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003884(uint64_t a1)
{
}

void sub_10000388C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v11 = v10;
  if (!v9 && (unsigned int v16 = [v10 statusCode], v7) && v16 == 200)
  {
    uint64_t v17 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:0];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    v12 = handleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v20;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "http response: %@", buf, 0xCu);
    }
  }
  else
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"http status code: %d, http error: %@", [v11 statusCode], v9);
    uint64_t v13 = createCRError((void *)0xFFFFFFFFFFFFFFF3, v12, 0);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100004108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 256), 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10000416C(void *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  v11 = handleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Location : %@", buf, 0xCu);
  }

  v12 = handleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error    : %@", buf, 0xCu);
  }

  uint64_t v13 = handleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "response : %@", buf, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  if (v10 || !*(void *)(*(void *)(a1[4] + 8) + 40))
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
    v19 = handleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100005934();
    }
  }
  else
  {
    uint64_t v14 = +[NSFileManager defaultManager];
    uint64_t v15 = *(void *)(*(void *)(a1[4] + 8) + 40);
    unsigned int v16 = +[NSURL fileURLWithPath:@"/private/var/tmp/VeridianFWImage/FirmwareMap.plist"];
    uint64_t v17 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v17 + 40);
    LOBYTE(v15) = [v14 moveItemAtURL:v15 toURL:v16 error:&obj];
    objc_storeStrong((id *)(v17 + 40), obj);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v15;

    uint64_t v18 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24) || v18)
    {
      objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v18);
      v19 = handleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000059A0();
      }
    }
    else
    {
      v19 = handleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v22 = @"/private/var/tmp/VeridianFWImage/FirmwareMap.plist";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "File moved to:%@", buf, 0xCu);
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[8] + 8) + 40));
}

void sub_100004D70(uint64_t a1, uint64_t a2)
{
  v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = a1;
    __int16 v7 = 2080;
    uint64_t v8 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s", (uint8_t *)&v5, 0x16u);
  }
}

void sub_10000509C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

unsigned char *sub_1000050B8(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_1000050C8(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_1000050E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000510C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id createCRError(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  unint64_t v6 = a3;
  __int16 v7 = (void *)v6;
  if (a1)
  {
    if (v5 | v6)
    {
      uint64_t v8 = +[NSMutableDictionary dictionary];
      if (v5)
      {
        uint64_t v9 = handleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100005B08(v5, v9);
        }

        [v8 setObject:v5 forKeyedSubscript:NSLocalizedDescriptionKey];
      }
      if (v7) {
        [v8 setObject:v7 forKeyedSubscript:NSUnderlyingErrorKey];
      }
      a1 = +[NSError errorWithDomain:CRErrorDomain code:a1 userInfo:v8];
    }
    else
    {
      a1 = +[NSError errorWithDomain:CRErrorDomain code:a1 userInfo:0];
    }
  }

  return a1;
}

void sub_1000057F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005864()
{
  sub_100005100();
  sub_10000509C((void *)&_mh_execute_header, v0, v1, "Asset Download Failed", v2, v3, v4, v5, v6);
}

void sub_100005898()
{
  sub_100005100();
  sub_10000509C((void *)&_mh_execute_header, v0, v1, "veridian FW Update not supported on device", v2, v3, v4, v5, v6);
}

void sub_1000058CC()
{
  sub_100005100();
  sub_10000509C((void *)&_mh_execute_header, v0, v1, "fwURL or fwDigest is too long", v2, v3, v4, v5, v6);
}

void sub_100005900()
{
  sub_100005100();
  sub_10000509C((void *)&_mh_execute_header, v0, v1, "Failed to get fwURL and fwDigest from AST2", v2, v3, v4, v5, v6);
}

void sub_100005934()
{
  sub_10000510C(__stack_chk_guard);
  sub_1000050E4((void *)&_mh_execute_header, v0, v1, "Download Failed:%@", v2, v3, v4, v5, 2u);
}

void sub_1000059A0()
{
  sub_10000510C(__stack_chk_guard);
  sub_1000050E4((void *)&_mh_execute_header, v0, v1, "Failed to move file:%@", v2, v3, v4, v5, 2u);
}

void sub_100005A0C()
{
  sub_100005100();
  sub_10000509C((void *)&_mh_execute_header, v0, v1, "Failed to alocate resources", v2, v3, v4, v5, v6);
}

void sub_100005A40(unsigned char *a1, unsigned char *a2)
{
  sub_1000050B8(a1, a2);
  sub_1000050C8((void *)&_mh_execute_header, v2, v3, "updaterOptions failed to allocate", v4);
}

void sub_100005A6C(unsigned char *a1, unsigned char *a2)
{
  sub_1000050B8(a1, a2);
  sub_1000050C8((void *)&_mh_execute_header, v2, v3, "Failed to get default AMAuthInstallRef", v4);
}

void sub_100005A98(unsigned char *a1, unsigned char *a2)
{
  sub_1000050B8(a1, a2);
  sub_1000050C8((void *)&_mh_execute_header, v2, v3, "Failed to enable SSO", v4);
}

void sub_100005AC4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FWURL is invalid", v1, 2u);
}

void sub_100005B08(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

uint64_t AMSupportSafeRelease()
{
  return _AMSupportSafeRelease();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t T200UpdaterCreate()
{
  return _T200UpdaterCreate();
}

uint64_t T200UpdaterExecCommand()
{
  return _T200UpdaterExecCommand();
}

uint64_t T200UpdaterIsDone()
{
  return _T200UpdaterIsDone();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t handleForCategory()
{
  return _handleForCategory();
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

id objc_msgSend_FWDigest(void *a1, const char *a2, ...)
{
  return [a1 FWDigest];
}

id objc_msgSend_FWURL(void *a1, const char *a2, ...)
{
  return [a1 FWURL];
}

id objc_msgSend_SHA256DigestString(void *a1, const char *a2, ...)
{
  return [a1 SHA256DigestString];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_ast2RequestURL(void *a1, const char *a2, ...)
{
  return [a1 ast2RequestURL];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_fwDigest(void *a1, const char *a2, ...)
{
  return [a1 fwDigest];
}

id objc_msgSend_fwURL(void *a1, const char *a2, ...)
{
  return [a1 fwURL];
}

id objc_msgSend_getDefaultAMAuthInstallRef(void *a1, const char *a2, ...)
{
  return [a1 getDefaultAMAuthInstallRef];
}

id objc_msgSend_getVeridianFWVersionInfo(void *a1, const char *a2, ...)
{
  return [a1 getVeridianFWVersionInfo];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isFirstAuthComplete(void *a1, const char *a2, ...)
{
  return [a1 isFirstAuthComplete];
}

id objc_msgSend_isVeridianFWUpdateRequiredLite(void *a1, const char *a2, ...)
{
  return [a1 isVeridianFWUpdateRequiredLite];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_needRequestURL(void *a1, const char *a2, ...)
{
  return [a1 needRequestURL];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_shouldPersonalizeWithSSOByDefault(void *a1, const char *a2, ...)
{
  return [a1 shouldPersonalizeWithSSOByDefault];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_timeoutPeriod(void *a1, const char *a2, ...)
{
  return [a1 timeoutPeriod];
}

id objc_msgSend_useAppleConnect(void *a1, const char *a2, ...)
{
  return [a1 useAppleConnect];
}