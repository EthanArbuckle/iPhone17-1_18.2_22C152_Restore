void sub_222E4632C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void __ReachabilityCallback(const __SCNetworkReachability *a1)
{
  v2 = AXLogSpeechAssetDownload();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222E44000, v2, OS_LOG_TYPE_DEFAULT, "Got reachability change", buf, 2u);
  }

  SCNetworkReachabilityFlags flags = 0;
  if (a1)
  {
    SCNetworkReachabilityGetFlags(a1, &flags);
    if ((flags & 2) != 0)
    {
      v3 = AXLogSpeechAssetDownload();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_222E44000, v3, OS_LOG_TYPE_DEFAULT, "Looks like we're reachable, try again", v5, 2u);
      }

      v4 = +[AXSpeechAssetMonitorHelper sharedInstance];
      [v4 _unregisterForReachabilityNotifications];
    }
  }
}

uint64_t _deviceLockStateChanged(uint64_t a1, void *a2)
{
  if ((deviceHasBeenUnlockedOnce & 1) == 0) {
    uint64_t result = [a2 handeDeviceFirstUnlock];
  }
  deviceHasBeenUnlockedOnce = 1;
  return result;
}

Class __getAXAssetsServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AXAssetLoaderLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AXAssetLoaderLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264675C08;
    uint64_t v5 = 0;
    AXAssetLoaderLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AXAssetLoaderLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getAXAssetsServiceClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AXAssetsService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getAXAssetsServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AXAssetLoaderLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXAssetLoaderLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __ReachabilityCallback_0(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _updateAllowedToDownload];
}

void __getAXAssetsServiceClass_block_invoke_cold_1()
{
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x270F09178]();
}

uint64_t AXDeviceIsUnlocked()
{
  return MEMORY[0x270F0A010]();
}

uint64_t AXLanguageCanonicalFormToGeneralLanguage()
{
  return MEMORY[0x270F0A160]();
}

uint64_t AXLogSpeechAssetDownload()
{
  return MEMORY[0x270F09390]();
}

uint64_t AXLogUI()
{
  return MEMORY[0x270F093C8]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x270F093F8]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x270F09420]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AXkMobileKeyBagLockStatusNotificationID()
{
  return MEMORY[0x270F0A3C0]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x270F05630](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x270F05638](target, queue);
}

uint64_t TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences()
{
  return MEMORY[0x270F7D758]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x270F095F8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}