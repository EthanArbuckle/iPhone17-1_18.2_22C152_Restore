void sub_22151ABD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CCSResolveModuleVisibility(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  v6 = v5;
  if (a2 == 2)
  {
    if (!v5)
    {
      a3 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (a2 == 1)
  {
    if (!v5)
    {
      a3 = 1;
      goto LABEL_8;
    }
LABEL_6:
    a3 = [v5 BOOLValue];
  }
LABEL_8:

  return a3;
}

uint64_t CCSVisibilityPreferenceForBundleRecord(void *a1)
{
  v1 = [a1 infoDictionary];
  v2 = [v1 objectForKey:@"SBIconVisibilitySetByAppPreference" ofClass:objc_opt_class()];
  v3 = [v1 objectForKey:@"SBIconVisibilityDefaultVisible" ofClass:objc_opt_class()];
  v4 = [v1 objectForKey:@"SBIconVisibilityDefaultVisibleInstallTypes" ofClass:objc_opt_class()];
  id v5 = [v1 objectForKey:@"SBIconVisibilityDefaultVisiblePlatforms" ofClass:objc_opt_class()];
  uint64_t v6 = _CCSModuleVisibilityPreferenceFromFlagsAndAllowableInstallTypes(v2, v3, v4, v5);

  return v6;
}

uint64_t _CCSModuleVisibilityPreferenceFromFlagsAndAllowableInstallTypes(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  unint64_t v9 = a3;
  unint64_t v10 = a4;
  v11 = (void *)v10;
  if (v7)
  {
    if (v8)
    {
      BOOL v12 = [v8 BOOLValue] == 0;
    }
    else
    {
      if (!(v9 | v10))
      {
        uint64_t v13 = 2;
        goto LABEL_21;
      }
      if (v9)
      {
        if (CCSIsInternalInstall())
        {
          v14 = @"internal";
        }
        else
        {
          v17 = [MEMORY[0x263F29CA0] sharedInstance];
          int v18 = [v17 isCarrierInstall];

          if (v18) {
            v14 = @"carrier";
          }
          else {
            v14 = @"user";
          }
        }
        int v16 = [(id)v9 containsObject:v14];
        int v15 = v16 ^ 1;
      }
      else
      {
        int v15 = 0;
        int v16 = 0;
      }
      if (v11)
      {
        v19 = (void *)MGGetStringAnswer();
        int v20 = [v11 containsObject:v19];
        v15 |= v20 ^ 1;
        v16 |= v20;
      }
      BOOL v12 = (v16 & (v15 ^ 1)) == 0;
    }
    if (v12) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_21:

  return v13;
}

uint64_t CCSIsInternalInstall()
{
  return MEMORY[0x270EDAB30]("com.apple.controlcenter");
}

uint64_t _SBIconVisibilityNotificationRecieved(uint64_t a1, void *a2)
{
  return [a2 _updateAvailableModuleMetadata];
}

void sub_22151C550(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22151D8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22151E34C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

__CFString *NSStringFromIconElementType(unint64_t a1)
{
  if (a1 > 2) {
    return @"unknown";
  }
  else {
    return off_2645B63B0[a1];
  }
}

__CFString *NSStringFromIconElementRequestIntent(unint64_t a1)
{
  if (a1 > 3) {
    return @"unknown";
  }
  else {
    return off_2645B6390[a1];
  }
}

__CFString *NSStringFromIconElementRequestErrorCode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"CCSIconElementRequestErrorCodeUnknown";
  }
  else {
    return off_2645B6360[a1 - 1];
  }
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

__CFString *NSStringFromCCSModuleSize(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"CCSModuleSizeSmall";
  }
  else {
    return off_2645B6738[a1 - 1];
  }
}

uint64_t CCSModuleSizeFromNSString(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"CCSModuleSizeSmall"] & 1) == 0)
  {
    if ([v1 isEqualToString:@"CCSModuleSizeSmallTall"])
    {
      uint64_t v2 = 1;
      goto LABEL_19;
    }
    if ([v1 isEqualToString:@"CCSModuleSizeSmallWide"])
    {
      uint64_t v2 = 2;
      goto LABEL_19;
    }
    if ([v1 isEqualToString:@"CCSModuleSizeSmallExtraWide"])
    {
      uint64_t v2 = 3;
      goto LABEL_19;
    }
    if ([v1 isEqualToString:@"CCSModuleSizeMedium"])
    {
      uint64_t v2 = 4;
      goto LABEL_19;
    }
    if ([v1 isEqualToString:@"CCSModuleSizeMediumWide"])
    {
      uint64_t v2 = 5;
      goto LABEL_19;
    }
    if ([v1 isEqualToString:@"CCSModuleSizeLarge"])
    {
      uint64_t v2 = 6;
      goto LABEL_19;
    }
    if ([v1 isEqualToString:@"CCSModuleSizeLargeTall"])
    {
      uint64_t v2 = 7;
      goto LABEL_19;
    }
    if ([v1 isEqualToString:@"CCSModuleSizeLargeExtraTall"])
    {
      uint64_t v2 = 8;
      goto LABEL_19;
    }
    v4 = CCSLogRemoteService;
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR)) {
      CCSModuleSizeFromNSString_cold_1((uint64_t)v1, v4);
    }
  }
  uint64_t v2 = 0;
LABEL_19:

  return v2;
}

void CCSRegisterControlCenterLogging()
{
  if (CCSRegisterControlCenterLogging_onceToken != -1) {
    dispatch_once(&CCSRegisterControlCenterLogging_onceToken, &__block_literal_global_2);
  }
}

uint64_t __CCSRegisterControlCenterLogging_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ControlCenter", "ModuleSettings");
  id v1 = (void *)CCSLogModuleSettings;
  CCSLogModuleSettings = (uint64_t)v0;

  CCSLogRemoteService = (uint64_t)os_log_create("com.apple.ControlCenter", "RemoteService");

  return MEMORY[0x270F9A758]();
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

__CFString *CCSModuleVisibilityPreferenceDescription(uint64_t a1)
{
  id v1 = @"unsupported";
  if (a1 == 1) {
    id v1 = @"default visible";
  }
  if (a1 == 2) {
    return @"default hidden";
  }
  else {
    return v1;
  }
}

uint64_t CCSVisibilityPreferenceForBundleInfoDictionary(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "bs_safeNumberForKey:", @"SBIconVisibilitySetByAppPreference");
  v3 = objc_msgSend(v1, "bs_safeNumberForKey:", @"SBIconVisibilityDefaultVisible");
  uint64_t v4 = objc_msgSend(v1, "bs_safeArrayForKey:", @"SBIconVisibilityDefaultVisibleInstallTypes");
  id v5 = objc_msgSend(v1, "bs_safeArrayForKey:", @"SBIconVisibilityDefaultVisiblePlatforms");

  uint64_t v6 = _CCSModuleVisibilityPreferenceFromFlagsAndAllowableInstallTypes(v2, v3, v4, v5);
  return v6;
}

id CCSRemoteServiceServerInterface()
{
  if (CCSRemoteServiceServerInterface_onceToken != -1) {
    dispatch_once(&CCSRemoteServiceServerInterface_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)CCSRemoteServiceServerInterface_remoteServiceServerInterface;

  return v0;
}

uint64_t __CCSRemoteServiceServerInterface_block_invoke()
{
  CCSRemoteServiceServerInterface_remoteServiceServerInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D39C9A0];

  return MEMORY[0x270F9A758]();
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_221527434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CCSModuleSizeFromNSString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221518000, a2, OS_LOG_TYPE_ERROR, "No matching module size found for string: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t BSCurrentUserDirectory()
{
  return MEMORY[0x270F106F0]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x270F10970]();
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x270EE4560](bundleURL);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x270F95F88]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x270F95FB0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x270F96018]();
}

uint64_t MGRegisterForBulkUpdates()
{
  return MEMORY[0x270F96028]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}