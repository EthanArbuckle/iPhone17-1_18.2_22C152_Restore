id STStorageLocStr(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t vars8;

  v1 = qword_C920;
  v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_C920, &stru_82B0);
  }
  v3 = [(id)qword_C918 localizedStringForKey:v2 value:v2 table:0];

  return v3;
}

void sub_4E78(id a1)
{
  qword_C918 = +[NSBundle bundleForClass:NSClassFromString(@"STStorageController")];

  _objc_release_x1();
}

void sub_54C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_5508(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 identifier];
  if (([v4 isEqualToString:@"com.apple.news"] & 1) == 0)
  {
    uint64_t v5 = (uint64_t)[v3 size];
    if (v5 >= 1)
    {
      uint64_t v6 = v5;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
      if ((uint64_t)[v3 size] >= 50000001) {
        [*(id *)(a1 + 32) addObject:v3];
      }
      if ([v3 purgeabilityScoreAtUrgency:3]) {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v6;
      }
    }
  }

  return 1;
}

int64_t sub_55D0(id a1, CacheManagementAsset *a2, CacheManagementAsset *a3)
{
  v4 = a3;
  id v5 = [(CacheManagementAsset *)a2 size];
  id v6 = [(CacheManagementAsset *)v4 size];

  if ((uint64_t)v5 > (uint64_t)v6) {
    return -1;
  }
  else {
    return 1;
  }
}

void sub_5CD4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setImmediateGain:", objc_msgSend(v4, "purgeableSize"));
  }
}

void sub_5DF8(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  v2 = *(void ***)(a1 + 40);
  if (v3 == v2[3])
  {
    id v11 = v3;
    LODWORD(v12) = -1.0;
    [v11 setActivationPercent:v12];
    if ((+[UIApplication isRunningInStoreDemoMode] & 1) == 0)
    {
      [*(id *)(a1 + 40) setAutoDemoteEnabled:1];
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2050000000;
      v14 = (void *)qword_C938;
      uint64_t v27 = qword_C938;
      if (!qword_C938)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_62E0;
        v23[3] = &unk_83D8;
        v23[4] = &v24;
        sub_62E0((uint64_t)v23);
        v14 = (void *)v25[3];
      }
      id v15 = v14;
      _Block_object_dispose(&v24, 8);
      v16 = objc_opt_new();
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_60F8;
      v21[3] = &unk_8368;
      dispatch_semaphore_t v22 = v13;
      v17 = v13;
      [v16 startWithCompletionHandler:v21];
      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    }
    usleep(0xF4240u);
    LODWORD(v18) = 1.0;
    [v11 setActivationPercent:v18];
    [*(id *)(a1 + 32) setSize:0];
    [*(id *)(a1 + 32) setImmediateGain:0];
    v19 = STStorageLocStr(@"OPTIMIZE_APPS_ENABLED");
    [*(id *)(a1 + 32) setInfoText:v19];
  }
  else if (v3 == v2[9])
  {
    uint64_t v4 = (uint64_t)[v2[10] longLongValue];
    id v5 = @"Low";
    if (v4 <= 10485760) {
      id v5 = @"Large";
    }
    id v6 = *(void **)(*(void *)(a1 + 40) + 80);
    v7 = v5;
    [v6 longLongValue];
    v8 = STFormattedSize();
    id v20 = +[NSString stringWithFormat:@"[%@ System Data]: %@ of System Data", v7, v8];

    v9 = STTapToRadarURLWithTitle();
    v10 = +[LSApplicationWorkspace defaultWorkspace];
    [v10 openURL:v9 configuration:0 completionHandler:0];
  }
}

void sub_60E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_60F8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_6294(id a1)
{
  qword_C928 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeProduction];

  _objc_release_x1();
}

Class sub_62E0(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_C940)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_6424;
    v3[4] = &unk_8410;
    v3[5] = v3;
    long long v4 = off_83F8;
    uint64_t v5 = 0;
    qword_C940 = _sl_dlopen();
    if (!qword_C940)
    {
      abort_report_np();
LABEL_8:
      sub_6498();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("ASDPushCacheDeleteUpdateRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_C938 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_6424()
{
  uint64_t result = _sl_dlopen();
  qword_C940 = result;
  return result;
}

void sub_6498()
{
  CFStringRef v0 = (const __CFString *)abort_report_np();
  CFPreferencesCopyValue(v0, v1, v2, v3);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

uint64_t CacheManagementEnumerateAssets()
{
  return _CacheManagementEnumerateAssets();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t STFormattedSize()
{
  return _STFormattedSize();
}

uint64_t STSharedSerialQueue()
{
  return _STSharedSerialQueue();
}

uint64_t STStorageIsInternalInstall()
{
  return _STStorageIsInternalInstall();
}

uint64_t STTapToRadarURLWithTitle()
{
  return _STTapToRadarURLWithTitle();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_consumedDate(void *a1, const char *a2, ...)
{
  return [a1 consumedDate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAsynchronouslyLoaded(void *a1, const char *a2, ...)
{
  return [a1 isAsynchronouslyLoaded];
}

id objc_msgSend_isAutoDemoteEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAutoDemoteEnabled];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInStoreDemoMode];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_purgeableSize(void *a1, const char *a2, ...)
{
  return [a1 purgeableSize];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_systemGray3Color(void *a1, const char *a2, ...)
{
  return [a1 systemGray3Color];
}

id objc_msgSend_totalSize(void *a1, const char *a2, ...)
{
  return [a1 totalSize];
}

id objc_msgSend_tvUsageBundleApp(void *a1, const char *a2, ...)
{
  return [a1 tvUsageBundleApp];
}

id objc_msgSend_usageBundleApps(void *a1, const char *a2, ...)
{
  return [a1 usageBundleApps];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}