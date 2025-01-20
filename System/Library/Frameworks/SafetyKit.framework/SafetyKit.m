void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2451841A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

id sa_default_log()
{
  if (sa_default_log_onceToken != -1) {
    dispatch_once(&sa_default_log_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)sa_default_log___logger;

  return v0;
}

void sub_24518498C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_245184F00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id SAServerInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F9EBB68];
  v1 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v1 forSelector:sel_dialVoiceCallToPhoneNumber_completionHandler_ argumentIndex:0 ofReply:0];

  uint64_t v2 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v2 forSelector:sel_dialVoiceCallToPhoneNumber_completionHandler_ argumentIndex:1 ofReply:1];

  v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v3 forSelector:sel_requestCrashDetectionAuthorization_ argumentIndex:1 ofReply:1];

  return v0;
}

id SAClientInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F9EABE0];
  v1 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v1 forSelector:sel_updateMostRecentCrashDetectionEvent_ argumentIndex:0 ofReply:0];

  return v0;
}

void sub_245186454(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245186518(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_245186684(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245186C18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_2451877DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_2451899B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245189BA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24518A670(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24518AA18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24518B280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24518B3E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t __sa_default_log_block_invoke()
{
  sa_default_log___logger = (uint64_t)os_log_create("com.apple.SafetyKit", "default");

  return MEMORY[0x270F9A758]();
}

void authorizationPromptResponseHandler(const void *a1, char a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v4 = +[SAAuthorizationInFlight sharedInstance];
  if ([v4 isInFlight])
  {
    if ((unint64_t)(a2 & 3) - 2 < 2)
    {
      uint64_t v5 = sa_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        authorizationPromptResponseHandler_cold_5(v5, v6, v7, v8, v9, v10, v11, v12);
      }

      v13 = [v4 completionHandler];
      uint64_t v14 = [v4 preflightAuthorizationStatus];
      v15 = +[SAError errorWithCode:4];
      ((void (**)(void, uint64_t, void *))v13)[2](v13, v14, v15);

      [v4 reset];
      goto LABEL_39;
    }
    if ((a2 & 3) != 0)
    {
      v35 = sa_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [v4 toBundleId];
        int v45 = 136315394;
        v46 = "void authorizationPromptResponseHandler(CFUserNotificationRef, CFOptionFlags)";
        __int16 v47 = 2112;
        v48 = v36;
        _os_log_impl(&dword_245182000, v35, OS_LOG_TYPE_DEFAULT, "%s - Authorization not granted, denying permissions to app, bundleId: %@", (uint8_t *)&v45, 0x16u);
      }
      v37 = [v4 completionHandler];
      v37[2](v37, 1, 0);

      [v4 reset];
      goto LABEL_33;
    }
    v24 = [v4 fromApp];
    v25 = [v24 bundleId];

    if (!v25) {
      goto LABEL_14;
    }
    v26 = sa_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v45 = 136315394;
      v46 = "void authorizationPromptResponseHandler(CFUserNotificationRef, CFOptionFlags)";
      __int16 v47 = 2112;
      v48 = v25;
      _os_log_impl(&dword_245182000, v26, OS_LOG_TYPE_DEFAULT, "%s - Authorization granted, revoking permissions from previous app, bundleId: %@", (uint8_t *)&v45, 0x16u);
    }

    if (!+[SAAuthorization setAccess:0 forBundleId:v25])
    {
      v40 = sa_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        authorizationPromptResponseHandler_cold_4();
      }
    }
    else
    {
LABEL_14:
      v27 = sa_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [v4 toBundleId];
        int v45 = 136315394;
        v46 = "void authorizationPromptResponseHandler(CFUserNotificationRef, CFOptionFlags)";
        __int16 v47 = 2112;
        v48 = v28;
        _os_log_impl(&dword_245182000, v27, OS_LOG_TYPE_DEFAULT, "%s - Authorization granted, granting permissions to app, bundleId: %@", (uint8_t *)&v45, 0x16u);
      }
      v29 = [v4 toBundleId];
      BOOL v30 = +[SAAuthorization setAccess:1 forBundleId:v29];

      v31 = sa_default_log();
      v32 = v31;
      if (v30)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v33 = [v4 toBundleId];
          int v45 = 136315394;
          v46 = "void authorizationPromptResponseHandler(CFUserNotificationRef, CFOptionFlags)";
          __int16 v47 = 2112;
          v48 = v33;
          _os_log_impl(&dword_245182000, v32, OS_LOG_TYPE_DEFAULT, "%s - Successfully granted permissions to app, bundleId: %@", (uint8_t *)&v45, 0x16u);
        }
        v34 = [v4 completionHandler];
        v34[2](v34, 2, 0);

        [v4 reset];
        goto LABEL_32;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        authorizationPromptResponseHandler_cold_3(v4);
      }

      if (!v25) {
        goto LABEL_32;
      }
      v38 = [v4 toBundleId];
      BOOL v39 = +[SAAuthorization setAccess:1 forBundleId:v38];

      if (v39) {
        goto LABEL_32;
      }
      v40 = sa_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
        authorizationPromptResponseHandler_cold_2();
      }
    }

LABEL_32:
LABEL_33:
    if ([v4 isInFlight])
    {
      v41 = sa_default_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        authorizationPromptResponseHandler_cold_1(v4);
      }

      v42 = [v4 completionHandler];
      uint64_t v43 = [v4 preflightAuthorizationStatus];
      v44 = +[SAError errorWithCode:4];
      ((void (**)(void, uint64_t, void *))v42)[2](v42, v43, v44);

      [v4 reset];
    }
    if (a1) {
      CFRelease(a1);
    }
    goto LABEL_39;
  }
  v16 = sa_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    authorizationPromptResponseHandler_cold_6(v16, v17, v18, v19, v20, v21, v22, v23);
  }

LABEL_39:
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t localMGGetBoolAnswer(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))getMGGetBoolAnswerSymbolLoc_ptr;
  uint64_t v8 = getMGGetBoolAnswerSymbolLoc_ptr;
  if (!getMGGetBoolAnswerSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getMGGetBoolAnswerSymbolLoc_block_invoke;
    v4[3] = &unk_2651C9688;
    v4[4] = &v5;
    __getMGGetBoolAnswerSymbolLoc_block_invoke((uint64_t)v4);
    uint64_t v2 = (uint64_t (*)(uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    localMGGetBoolAnswer_cold_1();
  }
  return v2(a1);
}

void sub_24518EA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMGGetBoolAnswerSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v2 = (void *)libMobileGestaltLibraryCore_frameworkLibrary;
  uint64_t v10 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __libMobileGestaltLibraryCore_block_invoke;
    v4[4] = &unk_2651C96C8;
    uint64_t v5 = &v7;
    uint64_t v6 = v4;
    long long v11 = xmmword_2651C96A8;
    uint64_t v12 = 0;
    v8[3] = _sl_dlopen();
    libMobileGestaltLibraryCore_frameworkLibrary = *(void *)(v5[1] + 24);
    uint64_t v2 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2) {
    __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "MGGetBoolAnswer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMGGetBoolAnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_24518EC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libMobileGestaltLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libMobileGestaltLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void authorizationPromptResponseHandler_cold_1(void *a1)
{
  v1 = [a1 toBundleId];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_245182000, v2, v3, "%s - Failed to successfully apply permissions to app, bundleId: %@", v4, v5, v6, v7, 2u);
}

void authorizationPromptResponseHandler_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_245182000, v0, OS_LOG_TYPE_FAULT, "%s - Failed to reinstate permissions to app, no app is authorized, bundleId: %@", (uint8_t *)v1, 0x16u);
}

void authorizationPromptResponseHandler_cold_3(void *a1)
{
  v1 = [a1 toBundleId];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_245182000, v2, v3, "%s - Failed to grant permissions to app, bundleId: %@", v4, v5, v6, v7, 2u);
}

void authorizationPromptResponseHandler_cold_4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_245182000, v0, OS_LOG_TYPE_ERROR, "%s - Failed to revoke permissions from previous app, bundleId: %@", (uint8_t *)v1, 0x16u);
}

void authorizationPromptResponseHandler_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void authorizationPromptResponseHandler_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void localMGGetBoolAnswer_cold_1()
{
  os_log_t v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"_Bool localMGGetBoolAnswer(CFStringRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SAGestalt.m", 18, @"%s", dlerror());

  __break(1u);
}

void __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *libMobileGestaltLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SAGestalt.m", 13, @"%s", *a1);

  __break(1u);
  CFBundleGetIdentifier(v4);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x270F795A8]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x270F795C0]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x270F79600]();
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return MEMORY[0x270F79610]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x270F79660]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x270F79688]();
}

uint64_t tcc_authorization_record_get_last_modified_date()
{
  return MEMORY[0x270F79690]();
}

uint64_t tcc_authorization_record_get_subject_attributed_entity()
{
  return MEMORY[0x270F796A0]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x270F796A8]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x270F796E8]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x270F796F0]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x270F796F8]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x270F79700]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x270F79708]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x270F79710]();
}

uint64_t tcc_server_message_get_authorization_records_by_service()
{
  return MEMORY[0x270F79720]();
}

uint64_t tcc_service_get_CF_name()
{
  return MEMORY[0x270F79748]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x270F79758]();
}