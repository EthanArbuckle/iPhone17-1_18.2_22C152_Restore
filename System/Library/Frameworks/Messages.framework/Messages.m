id _MSMainBundleIdentifier()
{
  void *v0;
  uint64_t vars8;

  if (_MSMainBundleIdentifier_once != -1) {
    dispatch_once(&_MSMainBundleIdentifier_once, &__block_literal_global);
  }
  v0 = (void *)_MSMainBundleIdentifier_bundleIdentifier;

  return v0;
}

void sub_1E4A799DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1E4A7A290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCKIsRunningInMacCatalystSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)ChatKitLibrary();
  result = dlsym(v2, "CKIsRunningInMacCatalyst");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCKIsRunningInMacCatalystSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ChatKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ChatKitLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __ChatKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6E98798;
    uint64_t v5 = 0;
    ChatKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = ChatKitLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!ChatKitLibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __ChatKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ChatKitLibraryCore_frameworkLibrary = result;
  return result;
}

void __getCKUIBehaviorClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CKUIBehavior");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCKUIBehaviorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCKUIBehaviorClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0();
  }
}

id MSStickerBrowserStateRestorationInfoPath(void *a1)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F1CB10];
  id v2 = a1;
  v3 = objc_msgSend(v1, "__ms_cachesDirectory");
  long long v4 = [v3 path];
  v13[0] = v4;
  v13[1] = @"BrowserData";
  uint64_t v5 = NSString;
  uint64_t v6 = [v2 hash];

  v7 = objc_msgSend(v5, "stringWithFormat:", @"sticker-browser-%tu", v6);
  v13[2] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];

  v9 = [NSString pathWithComponents:v8];
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  v11 = [v9 stringByDeletingLastPathComponent];
  [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];

  return v9;
}

id MSStickerBrowserStateRestorationInfo(void *a1)
{
  v1 = MSStickerBrowserStateRestorationInfoPath(a1);
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v1];

  return v2;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1E4A852D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKBrowserItemPayloadClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ChatKitLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ChatKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6E989C8;
    uint64_t v6 = 0;
    ChatKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!ChatKitLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("CKBrowserItemPayload");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getCKBrowserItemPayloadClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCKBrowserItemPayloadClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ChatKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ChatKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void handleRunloopEnded(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    long long v4 = [v3 _principalObject];

    id v3 = v5;
    if (v4)
    {
      [v5 _handlePrincipalObjectCreated];
      id v3 = v5;
    }
  }
}

id ms_defaultLog()
{
  if (ms_defaultLog_onceToken != -1) {
    dispatch_once(&ms_defaultLog_onceToken, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)ms_defaultLog_eventLog;

  return v0;
}

uint64_t __ms_defaultLog_block_invoke()
{
  ms_defaultLog_eventLog = (uint64_t)os_log_create("com.apple.Messages.extensions", "Default");

  return MEMORY[0x1F41817F8]();
}

id ms_traceLog()
{
  if (ms_traceLog_onceToken != -1) {
    dispatch_once(&ms_traceLog_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)ms_traceLog_eventLog;

  return v0;
}

uint64_t __ms_traceLog_block_invoke()
{
  ms_traceLog_eventLog = (uint64_t)os_log_create("com.apple.Messages.extensions", "Trace");

  return MEMORY[0x1F41817F8]();
}

id getCKImageDataClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCKImageDataClass_softClass;
  uint64_t v7 = getCKImageDataClass_softClass;
  if (!getCKImageDataClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCKImageDataClass_block_invoke;
    v3[3] = &unk_1E6E98778;
    v3[4] = &v4;
    __getCKImageDataClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1E4A8B03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4A8B418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCKImageDataClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CKImageData");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCKImageDataClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCKImageDataClass_block_invoke_cold_1();
    ChatKitLibrary_0();
  }
}

void ChatKitLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!ChatKitLibraryCore_frameworkLibrary_1)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __ChatKitLibraryCore_block_invoke_1;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6E98AA8;
    uint64_t v3 = 0;
    ChatKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!ChatKitLibraryCore_frameworkLibrary_1)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ChatKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  ChatKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void __getCKPreviewDispatchCacheClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CKPreviewDispatchCache");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCKPreviewDispatchCacheClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCKPreviewDispatchCacheClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0_3();
  }
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

id getCKImageAnimationTimerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCKImageAnimationTimerClass_softClass;
  uint64_t v7 = getCKImageAnimationTimerClass_softClass;
  if (!getCKImageAnimationTimerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCKImageAnimationTimerClass_block_invoke;
    v3[3] = &unk_1E6E98778;
    v3[4] = &v4;
    __getCKImageAnimationTimerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1E4A934E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCKUIBehaviorClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCKUIBehaviorClass_softClass_0;
  uint64_t v7 = getCKUIBehaviorClass_softClass_0;
  if (!getCKUIBehaviorClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCKUIBehaviorClass_block_invoke_0;
    v3[3] = &unk_1E6E98778;
    v3[4] = &v4;
    __getCKUIBehaviorClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1E4A939DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4A93E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCKPreviewDispatchCacheClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCKPreviewDispatchCacheClass_softClass_0;
  uint64_t v7 = getCKPreviewDispatchCacheClass_softClass_0;
  if (!getCKPreviewDispatchCacheClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCKPreviewDispatchCacheClass_block_invoke_0;
    v3[3] = &unk_1E6E98778;
    v3[4] = &v4;
    __getCKPreviewDispatchCacheClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1E4A94570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCKAnimatedImageClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCKAnimatedImageClass_softClass;
  uint64_t v7 = getCKAnimatedImageClass_softClass;
  if (!getCKAnimatedImageClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCKAnimatedImageClass_block_invoke;
    v3[3] = &unk_1E6E98778;
    v3[4] = &v4;
    __getCKAnimatedImageClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1E4A94A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4A94DD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id getSTKStickerUsageManagerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSTKStickerUsageManagerClass_softClass;
  uint64_t v7 = getSTKStickerUsageManagerClass_softClass;
  if (!getSTKStickerUsageManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSTKStickerUsageManagerClass_block_invoke;
    v3[3] = &unk_1E6E98778;
    v3[4] = &v4;
    __getSTKStickerUsageManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1E4A95CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKImageAnimationTimerClass_block_invoke(uint64_t a1)
{
  ChatKitLibrary_1();
  Class result = objc_getClass("CKImageAnimationTimer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKImageAnimationTimerClass_block_invoke_cold_1();
  }
  getCKImageAnimationTimerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ChatKitLibrary_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!ChatKitLibraryCore_frameworkLibrary_2)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __ChatKitLibraryCore_block_invoke_2;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6E98CC0;
    uint64_t v3 = 0;
    ChatKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!ChatKitLibraryCore_frameworkLibrary_2)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ChatKitLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  ChatKitLibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getCKUIBehaviorClass_block_invoke_0(uint64_t a1)
{
  ChatKitLibrary_1();
  Class result = objc_getClass("CKUIBehavior");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCKUIBehaviorClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCKUIBehaviorClass_block_invoke_cold_1();
    return (Class)__getCKImageDataClass_block_invoke_0(v3);
  }
  return result;
}

Class __getCKImageDataClass_block_invoke_0(uint64_t a1)
{
  ChatKitLibrary_1();
  Class result = objc_getClass("CKImageData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCKImageDataClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCKImageDataClass_block_invoke_cold_1();
    return (Class)__getCKPreviewDispatchCacheClass_block_invoke_0(v3);
  }
  return result;
}

Class __getCKPreviewDispatchCacheClass_block_invoke_0(uint64_t a1)
{
  ChatKitLibrary_1();
  Class result = objc_getClass("CKPreviewDispatchCache");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCKPreviewDispatchCacheClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCKPreviewDispatchCacheClass_block_invoke_cold_1();
    return (Class)__getCKAnimatedImageClass_block_invoke(v3);
  }
  return result;
}

Class __getCKAnimatedImageClass_block_invoke(uint64_t a1)
{
  ChatKitLibrary_1();
  Class result = objc_getClass("CKAnimatedImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCKAnimatedImageClass_block_invoke_cold_1();
  }
  getCKAnimatedImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSTKStickerUsageManagerClass_block_invoke(uint64_t a1)
{
  if (!StickersLibraryCore_frameworkLibrary) {
    StickersLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("STKStickerUsageManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSTKStickerUsageManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __StickersLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  StickersLibraryCore_frameworkLibrary = result;
  return result;
}

Messages::MSCriticalMessagingError_optional __swiftcall MSCriticalMessagingError.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 5;
  if ((unint64_t)rawValue < 5) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (Messages::MSCriticalMessagingError_optional)rawValue;
}

uint64_t MSCriticalMessagingError.rawValue.getter()
{
  return *v0;
}

BOOL sub_1E4A9D9AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1E4A9D9C4()
{
  return sub_1E4AA3F48();
}

Messages::MSCriticalMessagingError_optional sub_1E4A9D9F4(Swift::Int *a1)
{
  return MSCriticalMessagingError.init(rawValue:)(*a1);
}

void sub_1E4A9D9FC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1E4A9DA08(uint64_t a1)
{
  unint64_t v2 = sub_1E4AA0A38();

  return MEMORY[0x1F40E6E20](a1, v2);
}

uint64_t sub_1E4A9DA44(uint64_t a1)
{
  unint64_t v2 = sub_1E4AA0A38();
  unint64_t v3 = sub_1E4AA0A8C();
  unint64_t v4 = sub_1E4AA0AE0();

  return MEMORY[0x1F40E6DF8](a1, v2, v3, v4);
}

unint64_t MSCriticalMessagingError.errorDescription.getter()
{
  unint64_t result = 0x206E776F6E6B6E55;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 2:
      unint64_t result = 0x7070757320746F4ELL;
      break;
    case 3:
      unint64_t result = 0x6874756120746F4ELL;
      break;
    case 4:
      unint64_t result = 0x69616620646E6553;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t static MSCriticalMessagingError.errorDomain.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t MSCriticalMessagingError.errorCode.getter()
{
  return *v0;
}

unint64_t sub_1E4A9DBB8()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_1E4A9DBD4()
{
  return *v0;
}

Messages::MSCriticalMessagingAuthorizationStatus_optional __swiftcall MSCriticalMessagingAuthorizationStatus.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (Messages::MSCriticalMessagingAuthorizationStatus_optional)rawValue;
}

uint64_t sub_1E4A9DBF4()
{
  return sub_1E4AA3F58();
}

uint64_t sub_1E4A9DC3C()
{
  return sub_1E4AA3F58();
}

Messages::MSCriticalMessagingAuthorizationStatus_optional sub_1E4A9DC80(Swift::Int *a1)
{
  return MSCriticalMessagingAuthorizationStatus.init(rawValue:)(*a1);
}

uint64_t MSRecipient.phoneNumber.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MSRecipient.phoneNumber.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MSRecipient.phoneNumber.modify())()
{
  return nullsub_1;
}

Messages::MSRecipient __swiftcall MSRecipient.init(phoneNumber:)(Messages::MSRecipient phoneNumber)
{
  Messages::MSRecipient *v1 = phoneNumber;
  return phoneNumber;
}

uint64_t MSRecipient.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1E4AA3DB8();

  return swift_bridgeObjectRelease();
}

uint64_t static MSRecipient.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1E4AA3EC8();
  }
}

uint64_t MSRecipient.hashValue.getter()
{
  return sub_1E4AA3F58();
}

uint64_t sub_1E4A9DE00()
{
  return sub_1E4AA3F58();
}

uint64_t sub_1E4A9DE5C()
{
  swift_bridgeObjectRetain();
  sub_1E4AA3DB8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E4A9DEB4()
{
  return sub_1E4AA3F58();
}

uint64_t sub_1E4A9DF0C(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1E4AA3EC8();
  }
}

uint64_t (*MSCriticalMessage.messageText.modify())()
{
  return nullsub_1;
}

id MSCriticalSMSMessenger.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id MSCriticalSMSMessenger.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC8Messages22MSCriticalSMSMessenger_messenger;
  id v2 = objc_allocWithZone(MEMORY[0x1E4F6BBF0]);
  unint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for MSCriticalSMSMessenger();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for MSCriticalSMSMessenger()
{
  return self;
}

uint64_t sub_1E4A9E0B8(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x1F4188298](sub_1E4A9E0D8, 0, 0);
}

uint64_t sub_1E4A9E0D8()
{
  id v1 = objc_msgSend(self, sel_sharedFeatureFlags);
  unsigned int v2 = objc_msgSend(v1, sel_isBackgroundMessagingAPIEnabled);

  if (!v2)
  {
    char v4 = 2;
    goto LABEL_5;
  }
  uint64_t v3 = v0[3];
  if (*(void *)(v3 + 16) > 5uLL)
  {
    char v4 = 1;
LABEL_5:
    sub_1E4A9E43C();
    swift_allocError();
    *objc_super v5 = v4;
    swift_willThrow();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  uint64_t v8 = v0[4];
  uint64_t v9 = swift_task_alloc();
  v0[5] = v9;
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v3;
  uint64_t v10 = (void *)swift_task_alloc();
  v0[6] = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_1EAE88358);
  void *v10 = v0;
  v10[1] = sub_1E4A9E2A0;
  return MEMORY[0x1F4188160](v0 + 2, 0, 0, 0xD00000000000001ALL, 0x80000001E4AAA670, sub_1E4A9FEEC, v9, v11);
}

uint64_t sub_1E4A9E2A0()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unsigned int v2 = sub_1E4A9E3D8;
  }
  else
  {
    swift_task_dealloc();
    unsigned int v2 = sub_1E4A9E3BC;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4A9E3BC()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_1E4A9E3D8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_1E4A9E43C()
{
  unint64_t result = qword_1EAE88350;
  if (!qword_1EAE88350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88350);
  }
  return result;
}

uint64_t sub_1E4A9E490(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE883C0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v11 = a2;
  sub_1E4AA11F8(a3);

  uint64_t v12 = *(void **)&v11[OBJC_IVAR____TtC8Messages22MSCriticalSMSMessenger_messenger];
  sub_1E4AA130C(0, &qword_1EAE883C8);
  id v13 = v12;
  v14 = (void *)sub_1E4AA3DC8();
  swift_bridgeObjectRelease();
  v15 = (void *)swift_allocObject();
  v15[2] = sub_1E4AA0BC0;
  v15[3] = v10;
  v15[4] = v11;
  aBlock[4] = sub_1E4AA150C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E4A9E808;
  aBlock[3] = &block_descriptor_51;
  v16 = _Block_copy(aBlock);
  v17 = v11;
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_requestBackgroundMessagingAuthorizationForRecipients_completion_, v14, v16);
  _Block_release(v16);

  return swift_release();
}

unint64_t sub_1E4A9E6F4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unsigned int v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE883E0);
  unsigned int v2 = (void *)sub_1E4AA3EB8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1E4AA0BC4(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_1E4A9E808(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_1E4AA130C(0, &qword_1EAE883C8);
  sub_1E4AA130C(0, &qword_1EAE883D0);
  sub_1E4AA1348();
  uint64_t v5 = sub_1E4AA3D88();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_1E4A9E8E4(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x1F4188298](sub_1E4A9E904, 0, 0);
}

uint64_t sub_1E4A9E904()
{
  id v1 = objc_msgSend(self, sel_sharedFeatureFlags);
  unsigned int v2 = objc_msgSend(v1, sel_isBackgroundMessagingAPIEnabled);

  if (!v2)
  {
    char v4 = 2;
    goto LABEL_5;
  }
  uint64_t v3 = v0[3];
  if (*(void *)(v3 + 16) > 5uLL)
  {
    char v4 = 1;
LABEL_5:
    sub_1E4A9E43C();
    swift_allocError();
    *uint64_t v5 = v4;
    swift_willThrow();
    id v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  uint64_t v8 = v0[4];
  uint64_t v9 = swift_task_alloc();
  v0[5] = v9;
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v3;
  uint64_t v10 = (void *)swift_task_alloc();
  v0[6] = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(qword_1EAE88358);
  void *v10 = v0;
  v10[1] = sub_1E4A9EACC;
  return MEMORY[0x1F4188160](v0 + 2, 0, 0, 0xD00000000000001ELL, 0x80000001E4AAA690, sub_1E4A9FF38, v9, v11);
}

uint64_t sub_1E4A9EACC()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unsigned int v2 = sub_1E4AA156C;
  }
  else
  {
    swift_task_dealloc();
    unsigned int v2 = sub_1E4AA153C;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4A9EBE8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE883C0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x1F4188790]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v11 = a2;
  sub_1E4AA11F8(a3);

  uint64_t v12 = *(void **)&v11[OBJC_IVAR____TtC8Messages22MSCriticalSMSMessenger_messenger];
  sub_1E4AA130C(0, &qword_1EAE883C8);
  id v13 = v12;
  v14 = (void *)sub_1E4AA3DC8();
  swift_bridgeObjectRelease();
  v15 = (void *)swift_allocObject();
  v15[2] = sub_1E4AA0BC0;
  v15[3] = v10;
  v15[4] = v11;
  aBlock[4] = sub_1E4AA1560;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E4A9E808;
  aBlock[3] = &block_descriptor_42;
  v16 = _Block_copy(aBlock);
  v17 = v11;
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_checkAuthorizationStatusForRecipients_completion_, v14, v16);
  _Block_release(v16);

  return swift_release();
}

uint64_t sub_1E4A9EE4C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1E4AA3D78();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE883C0);
    return sub_1E4AA3DE8();
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE883C0);
    return sub_1E4AA3DF8();
  }
}

uint64_t sub_1E4A9EEC0(unint64_t a1, uint64_t a2, void (*a3)(unint64_t, void *))
{
  if (a2)
  {
    uint64_t v4 = (void *)sub_1E4AA3D78();
    id v5 = objc_msgSend(v4, sel_code);
    if ((unint64_t)v5 >= 5) {
      char v6 = 0;
    }
    else {
      char v6 = (char)v5;
    }
    unint64_t v7 = sub_1E4A9E6F4(MEMORY[0x1E4FBC860]);
    sub_1E4A9E43C();
    uint64_t v8 = (void *)swift_allocError();
    unsigned char *v9 = v6;
    a3(v7, v8);

    return swift_bridgeObjectRelease();
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    unint64_t v54 = 0;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    unint64_t v13 = sub_1E4AA3E78() | 0x8000000000000000;
  }
  else
  {
    uint64_t v14 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v11 = ~v14;
    unint64_t v54 = a1 + 64;
    uint64_t v15 = -v14;
    if (v15 < 64) {
      uint64_t v16 = ~(-1 << v15);
    }
    else {
      uint64_t v16 = -1;
    }
    unint64_t v12 = v16 & *(void *)(a1 + 64);
    unint64_t v13 = a1;
  }
  swift_bridgeObjectRetain();
  uint64_t v17 = 0;
  int64_t v53 = (unint64_t)(v11 + 64) >> 6;
  v18 = (void *)MEMORY[0x1E4FBC868];
  unint64_t v55 = v13;
  while (1)
  {
    if ((v13 & 0x8000000000000000) != 0)
    {
      v19 = v18;
      if (!sub_1E4AA3E88()) {
        goto LABEL_53;
      }
      sub_1E4AA130C(0, &qword_1EAE883C8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v23 = v57;
      swift_unknownObjectRelease();
      sub_1E4AA130C(0, &qword_1EAE883D0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v24 = v57;
      swift_unknownObjectRelease();
      uint64_t v22 = v17;
      uint64_t v20 = v12;
      if (!v57) {
        goto LABEL_53;
      }
    }
    else
    {
      if (v12)
      {
        v19 = v18;
        uint64_t v20 = (v12 - 1) & v12;
        unint64_t v21 = __clz(__rbit64(v12)) | (v17 << 6);
        uint64_t v22 = v17;
      }
      else
      {
        int64_t v25 = v17 + 1;
        if (__OFADD__(v17, 1)) {
          goto LABEL_56;
        }
        if (v25 >= v53) {
          goto LABEL_52;
        }
        unint64_t v26 = *(void *)(v54 + 8 * v25);
        uint64_t v22 = v17 + 1;
        if (!v26)
        {
          uint64_t v22 = v17 + 2;
          if (v17 + 2 >= v53) {
            goto LABEL_52;
          }
          unint64_t v26 = *(void *)(v54 + 8 * v22);
          if (!v26)
          {
            uint64_t v22 = v17 + 3;
            if (v17 + 3 >= v53) {
              goto LABEL_52;
            }
            unint64_t v26 = *(void *)(v54 + 8 * v22);
            if (!v26)
            {
              uint64_t v22 = v17 + 4;
              if (v17 + 4 >= v53) {
                goto LABEL_52;
              }
              unint64_t v26 = *(void *)(v54 + 8 * v22);
              if (!v26)
              {
                uint64_t v27 = v17 + 5;
                while (v53 != v27)
                {
                  unint64_t v26 = *(void *)(v54 + 8 * v27++);
                  if (v26)
                  {
                    uint64_t v22 = v27 - 1;
                    goto LABEL_36;
                  }
                }
LABEL_52:
                v19 = v18;
LABEL_53:
                sub_1E4AA13B0();
                a3((unint64_t)v19, 0);
                return swift_bridgeObjectRelease();
              }
            }
          }
        }
LABEL_36:
        v19 = v18;
        uint64_t v20 = (v26 - 1) & v26;
        unint64_t v21 = __clz(__rbit64(v26)) + (v22 << 6);
      }
      uint64_t v28 = 8 * v21;
      v29 = *(void **)(*(void *)(v13 + 56) + v28);
      id v23 = *(id *)(*(void *)(v13 + 48) + v28);
      id v24 = v29;
      if (!v23) {
        goto LABEL_53;
      }
    }
    unint64_t v56 = v20;
    v30 = v23;
    id v31 = objc_msgSend(v23, sel_phoneNumber);
    uint64_t v32 = sub_1E4AA3DA8();
    uint64_t v34 = v33;

    id v35 = v24;
    id v36 = objc_msgSend(v35, sel_integerValue);
    char v37 = v36 == (id)2 ? 2 : v36 == (id)1;
    v38 = v19;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v57 = v19;
    unint64_t v41 = sub_1E4AA0BC4(v32, v34);
    uint64_t v42 = v38[2];
    BOOL v43 = (v40 & 1) == 0;
    uint64_t v44 = v42 + v43;
    if (__OFADD__(v42, v43)) {
      break;
    }
    char v45 = v40;
    if (v38[3] >= v44)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        v18 = v57;
        if (v40) {
          goto LABEL_15;
        }
      }
      else
      {
        sub_1E4AA104C();
        v18 = v57;
        if (v45) {
          goto LABEL_15;
        }
      }
    }
    else
    {
      sub_1E4AA0C4C(v44, isUniquelyReferenced_nonNull_native);
      unint64_t v46 = sub_1E4AA0BC4(v32, v34);
      if ((v45 & 1) != (v47 & 1)) {
        goto LABEL_57;
      }
      unint64_t v41 = v46;
      v18 = v57;
      if (v45)
      {
LABEL_15:
        *(unsigned char *)(v18[7] + v41) = v37;
        goto LABEL_16;
      }
    }
    v18[(v41 >> 6) + 8] |= 1 << v41;
    v48 = (uint64_t *)(v18[6] + 16 * v41);
    uint64_t *v48 = v32;
    v48[1] = v34;
    *(unsigned char *)(v18[7] + v41) = v37;
    uint64_t v49 = v18[2];
    BOOL v50 = __OFADD__(v49, 1);
    uint64_t v51 = v49 + 1;
    if (v50) {
      goto LABEL_55;
    }
    v18[2] = v51;
    swift_bridgeObjectRetain();
LABEL_16:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v17 = v22;
    unint64_t v13 = v55;
    unint64_t v12 = v56;
  }
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  uint64_t result = sub_1E4AA3EE8();
  __break(1u);
  return result;
}

uint64_t sub_1E4A9F3F4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  v3[2] = v2;
  v3[3] = v4;
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  v3[4] = v5;
  void v3[5] = v6;
  void v3[6] = v7;
  return MEMORY[0x1F4188298](sub_1E4A9F424, 0, 0);
}

uint64_t sub_1E4A9F424()
{
  id v1 = objc_msgSend(self, sel_sharedFeatureFlags);
  unsigned int v2 = objc_msgSend(v1, sel_isBackgroundMessagingAPIEnabled);

  if (v2)
  {
    v0[7] = self;
    v0[8] = sub_1E4AA3E18();
    v0[9] = sub_1E4AA3E08();
    uint64_t v4 = sub_1E4AA3DD8();
    return MEMORY[0x1F4188298](sub_1E4A9F578, v4, v3);
  }
  else
  {
    sub_1E4A9E43C();
    swift_allocError();
    *uint64_t v5 = 2;
    swift_willThrow();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6(0);
  }
}

uint64_t sub_1E4A9F578()
{
  id v1 = *(void **)(v0 + 56);
  swift_release();
  *(void *)(v0 + 80) = objc_msgSend(v1, sel_sharedApplication);
  return MEMORY[0x1F4188298](sub_1E4A9F600, 0, 0);
}

uint64_t sub_1E4A9F600()
{
  *(void *)(v0 + 8_Block_object_dispose(&a9, 8) = sub_1E4AA3E08();
  uint64_t v2 = sub_1E4AA3DD8();
  return MEMORY[0x1F4188298](sub_1E4A9F68C, v2, v1);
}

uint64_t sub_1E4A9F68C()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_release();
  *(void *)(v0 + 96) = objc_msgSend(v1, sel_applicationState);

  return MEMORY[0x1F4188298](sub_1E4A9F70C, 0, 0);
}

uint64_t sub_1E4A9F70C()
{
  if (*(void *)(v0 + 96) == 2)
  {
    uint64_t v1 = *(void *)(v0 + 48);
    long long v8 = *(_OWORD *)(v0 + 16);
    long long v9 = *(_OWORD *)(v0 + 32);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 104) = v2;
    *(_OWORD *)(v2 + 16) = v8;
    *(_OWORD *)(v2 + 32) = v9;
    *(void *)(v2 + 4_Block_object_dispose(&a9, 8) = v1;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v3;
    void *v3 = v0;
    v3[1] = sub_1E4A9F898;
    uint64_t v4 = MEMORY[0x1E4FBB390];
    return MEMORY[0x1F4188160](v0 + 128, 0, 0, 0x743A5F28646E6573, 0xEB00000000293A6FLL, sub_1E4A9FF84, v2, v4);
  }
  else
  {
    sub_1E4A9E43C();
    swift_allocError();
    *uint64_t v5 = 2;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6(0);
  }
}

uint64_t sub_1E4A9F898()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1E4A9F9D0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1E4A9F9B4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1E4A9F9B4()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 128));
}

uint64_t sub_1E4A9F9D0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_1E4A9FA38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE883B8);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790]();
  v18[0] = a3;
  v18[1] = a4;
  v17[0] = a5;
  v17[1] = a6;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v15 + v14, (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  sub_1E4A9FC14((uint64_t)v18, (uint64_t)v17, (uint64_t)sub_1E4AA0B40, v15);
  return swift_release();
}

uint64_t sub_1E4A9FBA4(uint64_t a1)
{
  if (a1)
  {
    sub_1E4AA3D78();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE883B8);
    return sub_1E4AA3DE8();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE883B8);
    return sub_1E4AA3DF8();
  }
}

void sub_1E4A9FC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F6E608]), sel_init);
  long long v8 = (void *)sub_1E4AA3D98();
  objc_msgSend(v7, sel_setMessageText_, v8);

  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F6E610]), sel_init);
  uint64_t v10 = (void *)sub_1E4AA3D98();
  objc_msgSend(v9, sel_setPhoneNumber_, v10);

  uint64_t v11 = *(void **)(v4 + OBJC_IVAR____TtC8Messages22MSCriticalSMSMessenger_messenger);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  v15[4] = sub_1E4AA0A18;
  v15[5] = v12;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  v15[2] = sub_1E4A9FE78;
  v15[3] = &block_descriptor;
  uint64_t v13 = _Block_copy(v15);
  id v14 = v11;
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_sendBackgroundMessage_toRecipient_completion_, v7, v9, v13);
  _Block_release(v13);
}

void sub_1E4A9FDC0(uint64_t a1, void (*a2)(void))
{
  if (a1)
  {
    id v7 = (id)sub_1E4AA3D78();
    id v3 = objc_msgSend(v7, sel_code);
    if ((unint64_t)v3 >= 5) {
      char v4 = 0;
    }
    else {
      char v4 = (char)v3;
    }
    sub_1E4A9E43C();
    uint64_t v5 = (void *)swift_allocError();
    *uint64_t v6 = v4;
    a2();
  }
  else
  {
    a2();
  }
}

void sub_1E4A9FE78(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1E4A9FEE4()
{
  return 5;
}

uint64_t sub_1E4A9FEEC(uint64_t a1)
{
  return sub_1E4A9E490(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1E4A9FF38(uint64_t a1)
{
  return sub_1E4A9EBE8(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

id MSCriticalSMSMessenger.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MSCriticalSMSMessenger();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1E4A9FF84(uint64_t a1)
{
  return sub_1E4A9FA38(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

unint64_t sub_1E4A9FF98()
{
  unint64_t result = qword_1EAE88370;
  if (!qword_1EAE88370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88370);
  }
  return result;
}

unint64_t sub_1E4A9FFF4()
{
  unint64_t result = qword_1EAE88378;
  if (!qword_1EAE88378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88378);
  }
  return result;
}

unint64_t sub_1E4AA004C()
{
  unint64_t result = qword_1EAE88380;
  if (!qword_1EAE88380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE88380);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MSCriticalMessagingError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MSCriticalMessagingError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    void *result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1E4AA020CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_1E4AA0234(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1E4AA023C(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MSCriticalMessagingError()
{
  return &type metadata for MSCriticalMessagingError;
}

uint64_t getEnumTagSinglePayload for MSCriticalMessagingAuthorizationStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MSCriticalMessagingAuthorizationStatus(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    void *result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1E4AA03B0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MSCriticalMessagingAuthorizationStatus()
{
  return &type metadata for MSCriticalMessagingAuthorizationStatus;
}

void *initializeBufferWithCopyOfBuffer for MSRecipient(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MSRecipient()
{
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for MSRecipient(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for MSRecipient()
{
  return &type metadata for MSRecipient;
}

void *_s8Messages11MSRecipientVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s8Messages11MSRecipientVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1E4AA0508(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + _Block_object_dispose(&a9, 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose(&a9, 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MSCriticalMessage()
{
  return &type metadata for MSCriticalMessage;
}

uint64_t method lookup function for MSCriticalSMSMessenger(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MSCriticalSMSMessenger);
}

uint64_t dispatch thunk of MSCriticalSMSMessenger.requestAuthorization(for:)(uint64_t a1)
{
  unsigned int v4 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x70);
  BOOL v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E4AA0680;
  return v7(a1);
}

uint64_t sub_1E4AA0680(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of MSCriticalSMSMessenger.checkAuthorizationStatus(for:)(uint64_t a1)
{
  unsigned int v4 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x80);
  BOOL v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1E4AA1570;
  return v7(a1);
}

uint64_t dispatch thunk of MSCriticalSMSMessenger.send(_:to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)((*MEMORY[0x1E4FBC8C8] & *v2) + 0x90);
  id v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_1E4AA0680;
  return v9(a1, a2);
}

uint64_t dispatch thunk of MSCriticalSMSMessenger.maximumCriticalMessagingRecipients.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t sub_1E4AA09E0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1E4AA0A18(uint64_t a1)
{
  sub_1E4A9FDC0(a1, *(void (**)(void))(v1 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_1E4AA0A38()
{
  unint64_t result = qword_1EAE883A0;
  if (!qword_1EAE883A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE883A0);
  }
  return result;
}

unint64_t sub_1E4AA0A8C()
{
  unint64_t result = qword_1EAE883A8;
  if (!qword_1EAE883A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE883A8);
  }
  return result;
}

unint64_t sub_1E4AA0AE0()
{
  unint64_t result = qword_1EAE883B0;
  if (!qword_1EAE883B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE883B0);
  }
  return result;
}

uint64_t sub_1E4AA0B34()
{
  return objectdestroy_32Tm(&qword_1EAE883B8);
}

uint64_t sub_1E4AA0B40(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE883B8);

  return sub_1E4A9FBA4(a1);
}

uint64_t sub_1E4AA0BB4()
{
  return objectdestroy_32Tm(&qword_1EAE883C0);
}

unint64_t sub_1E4AA0BC4(uint64_t a1, uint64_t a2)
{
  sub_1E4AA3F38();
  swift_bridgeObjectRetain();
  sub_1E4AA3DB8();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_1E4AA3F58();

  return sub_1E4AA0F68(a1, a2, v4);
}

uint64_t sub_1E4AA0C4C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE883E0);
  char v37 = a2;
  uint64_t v6 = sub_1E4AA3EA8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1E4AA3F38();
    swift_bridgeObjectRetain();
    sub_1E4AA3DB8();
    swift_bridgeObjectRelease();
    uint64_t result = sub_1E4AA3F58();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_1E4AA0F68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1E4AA3EC8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1E4AA3EC8() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1E4AA104C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAE883E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E4AA3E98();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    void *v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1E4AA11F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v8 = MEMORY[0x1E4FBC860];
    sub_1E4AA3E48();
    uint64_t v4 = a1 + 40;
    do
    {
      id v5 = objc_allocWithZone(MEMORY[0x1E4F6E610]);
      swift_bridgeObjectRetain();
      id v6 = objc_msgSend(v5, sel_init);
      unint64_t v7 = (void *)sub_1E4AA3D98();
      objc_msgSend(v6, sel_setPhoneNumber_, v7);
      swift_bridgeObjectRelease();

      sub_1E4AA3E28();
      sub_1E4AA3E58();
      sub_1E4AA3E68();
      sub_1E4AA3E38();
      v4 += 16;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1E4AA130C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_1E4AA1348()
{
  unint64_t result = qword_1EAE883D8;
  if (!qword_1EAE883D8)
  {
    sub_1E4AA130C(255, &qword_1EAE883C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAE883D8);
  }
  return result;
}

uint64_t sub_1E4AA13B0()
{
  return swift_release();
}

uint64_t sub_1E4AA13B8()
{
  return objectdestroy_32Tm(&qword_1EAE883C0);
}

uint64_t objectdestroy_32Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x1F4186498](v1, v6, v7);
}

uint64_t sub_1E4AA1450(uint64_t a1, uint64_t a2)
{
  return sub_1E4A9EE4C(a1, a2);
}

uint64_t objectdestroy_38Tm()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E4AA150C(unint64_t a1, uint64_t a2)
{
  return sub_1E4A9EEC0(a1, a2, *(void (**)(unint64_t, void *))(v2 + 16));
}

uint64_t sub_1E4AA157C()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getCKUIBehaviorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[_MSMessageMediaPayload convertToStickerWithExtensionIdentifier:](v0);
}

uint64_t __getCKBrowserItemPayloadClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[_MSMessageAppExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](v0);
}

uint64_t __getCKImageDataClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCKPreviewDispatchCacheClass_block_invoke_cold_1(v0);
}

uint64_t __getCKPreviewDispatchCacheClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[_MSMessageAppBundleContext balloonHostAuditToken](v0);
}

void __getCKImageAnimationTimerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getCKAnimatedImageClass_block_invoke_cold_1(v0);
}

void __getCKAnimatedImageClass_block_invoke_cold_1()
{
}

uint64_t sub_1E4AA3D38()
{
  return MEMORY[0x1F40E3618]();
}

uint64_t sub_1E4AA3D48()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1E4AA3D58()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1E4AA3D68()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1E4AA3D78()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1E4AA3D88()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1E4AA3D98()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1E4AA3DA8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1E4AA3DB8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1E4AA3DC8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1E4AA3DD8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1E4AA3DE8()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1E4AA3DF8()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1E4AA3E08()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1E4AA3E18()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1E4AA3E28()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1E4AA3E38()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1E4AA3E48()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1E4AA3E58()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1E4AA3E68()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1E4AA3E78()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1E4AA3E88()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1E4AA3E98()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1E4AA3EA8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1E4AA3EB8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1E4AA3EC8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E4AA3EE8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1E4AA3F18()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1E4AA3F28()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1E4AA3F38()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E4AA3F48()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1E4AA3F58()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1F40F4D10](retstr, m);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80D8](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CFArrayRef CGImageDestinationCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1F40E9730]();
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return MEMORY[0x1F4123F30]();
}

uint64_t IMFileURLIsActuallyAnimated()
{
  return MEMORY[0x1F41240F0]();
}

uint64_t IMIsRunningIniMessageAppExtension()
{
  return MEMORY[0x1F41241F0]();
}

uint64_t IMIsRunningIniMessageAppsViewService()
{
  return MEMORY[0x1F41241F8]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x1F4124230]();
}

uint64_t IMSafeTemporaryDirectory()
{
  return MEMORY[0x1F4124380]();
}

uint64_t IMSharedHelperDeviceIsiPad()
{
  return MEMORY[0x1F4124460]();
}

uint64_t IMSharedHelperMD5HashOfFileAtPath()
{
  return MEMORY[0x1F41244A0]();
}

uint64_t IMStickerEffectTypeShouldAvoidEffectView()
{
  return MEMORY[0x1F4124578]();
}

uint64_t IMSupportedAnimatedImageUTTypesSortedByPreference()
{
  return MEMORY[0x1F4124608]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x1F4123AF0]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4102B00]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4102C78](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4102C80](image);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1F40DEE50](inUTI, inTagClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _IMWarn()
{
  return MEMORY[0x1F4123C00]();
}

uint64_t _UIImageJPEGRepresentation()
{
  return MEMORY[0x1F4102F08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

void free(void *a1)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1F40CCE18](a1, *(void *)&a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}