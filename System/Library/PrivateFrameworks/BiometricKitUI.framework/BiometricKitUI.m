void sub_1E4B6F42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *_notificationRegistrationDebugErrorString(int a1)
{
  result = @"OK";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = @"INVALID_NAME";
      break;
    case 2:
      result = @"INVALID_TOKEN";
      break;
    case 3:
      result = @"INVALID_PORT";
      break;
    case 4:
      result = @"INVALID_FILE";
      break;
    case 5:
      result = @"INVALID_SIGNAL";
      break;
    case 6:
      result = @"INVALID_REQUEST";
      break;
    case 7:
      result = @"NOT_AUTHORIZED";
      break;
    default:
      if (a1 == 1000000) {
        result = @"FAILED";
      }
      else {
        result = @"UNKNOWN";
      }
      break;
  }
  return result;
}

void sub_1E4B6FA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4B6FC50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1E4B7163C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E4B71E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4B721EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4B722D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4B755A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E4B75EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1E4B76D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4B78F84(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    v10 = *(NSObject **)(v9 + 528);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BKUICurvesView parser:didStartElement:namespaceURI:qualifiedName:attributes:](a9, v10);
    }
    objc_end_catch();
    JUMPOUT(0x1E4B78F3CLL);
  }
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1E4B7D1B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

id getBYFlowSkipControllerClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getBYFlowSkipControllerClass_softClass;
  uint64_t v7 = getBYFlowSkipControllerClass_softClass;
  if (!getBYFlowSkipControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getBYFlowSkipControllerClass_block_invoke;
    v3[3] = &unk_1E6EA23D0;
    v3[4] = &v4;
    __getBYFlowSkipControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1E4B7D428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBYFlowSkipIdentifierFaceID()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getBYFlowSkipIdentifierFaceIDSymbolLoc_ptr;
  uint64_t v8 = getBYFlowSkipIdentifierFaceIDSymbolLoc_ptr;
  if (!getBYFlowSkipIdentifierFaceIDSymbolLoc_ptr)
  {
    id v1 = (void *)SetupAssistantLibrary();
    v6[3] = (uint64_t)dlsym(v1, "BYFlowSkipIdentifierFaceID");
    getBYFlowSkipIdentifierFaceIDSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    BYFlowSkipIdentifierFaceID_cold_1 = (_Unwind_Exception *)getBYFlowSkipIdentifierFaceID_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(BYFlowSkipIdentifierFaceID_cold_1);
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1E4B7E0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *a12, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v13 - 152));
  _Unwind_Resume(a1);
}

void sub_1E4B7EC40(_Unwind_Exception *a1)
{
  uint64_t v3 = v1;
  objc_destroyWeak(v3);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1E4B7F10C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4B7F94C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getBYFlowSkipControllerClass_block_invoke(uint64_t a1)
{
  SetupAssistantLibrary();
  Class result = objc_getClass("BYFlowSkipController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBYFlowSkipControllerClass_block_invoke_cold_1();
  }
  getBYFlowSkipControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __SetupAssistantLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6EA23F0;
    uint64_t v5 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = SetupAssistantLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getBYFlowSkipIdentifierFaceIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SetupAssistantLibrary();
  uint64_t result = dlsym(v2, "BYFlowSkipIdentifierFaceID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYFlowSkipIdentifierFaceIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id _BKUILoggingFacility()
{
  if (_BKUILoggingFacility_onceToken != -1) {
    dispatch_once(&_BKUILoggingFacility_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)_BKUILoggingFacility_oslog;

  return v0;
}

void sub_1E4B849C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 128));
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1E4B85448(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1E4B85960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initBKDevice()
{
  if (BiometricKitLibrary_sOnce != -1) {
    dispatch_once(&BiometricKitLibrary_sOnce, &__block_literal_global_2);
  }
  Class result = objc_getClass("BKDevice");
  classBKDevice = (uint64_t)result;
  getBKDeviceClass_0 = (uint64_t (*)())BKDeviceFunction;
  return result;
}

id BKDeviceFunction()
{
  return (id)classBKDevice;
}

void *__BiometricKitLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit", 2);
  BiometricKitLibrary_sLib = (uint64_t)result;
  return result;
}

Class initBKDeviceDescriptor()
{
  if (BiometricKitLibrary_sOnce != -1) {
    dispatch_once(&BiometricKitLibrary_sOnce, &__block_literal_global_2);
  }
  Class result = objc_getClass("BKDeviceDescriptor");
  classBKDeviceDescriptor = (uint64_t)result;
  getBKDeviceDescriptorClass_0 = (uint64_t (*)())BKDeviceDescriptorFunction;
  return result;
}

id BKDeviceDescriptorFunction()
{
  return (id)classBKDeviceDescriptor;
}

Class initSFClient()
{
  if (SharingLibrary_sOnce != -1) {
    dispatch_once(&SharingLibrary_sOnce, &__block_literal_global_389);
  }
  Class result = objc_getClass("SFClient");
  classSFClient = (uint64_t)result;
  getSFClientClass = (uint64_t (*)())SFClientFunction;
  return result;
}

id SFClientFunction()
{
  return (id)classSFClient;
}

void *__SharingLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  SharingLibrary_sLib = (uint64_t)result;
  return result;
}

Class initLAContext()
{
  if (LocalAuthenticationLibrary_sOnce != -1) {
    dispatch_once(&LocalAuthenticationLibrary_sOnce, &__block_literal_global_393);
  }
  Class result = objc_getClass("LAContext");
  classLAContext = (uint64_t)result;
  getLAContextClass = (uint64_t (*)())LAContextFunction;
  return result;
}

id LAContextFunction()
{
  return (id)classLAContext;
}

void *__LocalAuthenticationLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/LocalAuthentication.framework/LocalAuthentication", 2);
  LocalAuthenticationLibrary_sLib = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0;
}

void sub_1E4B91EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _initalInterfaceOrientationFor(int a1, uint64_t a2)
{
  int64_t v4 = +[BKUIUtils activeInterfaceOrientationForView:0];
  uint64_t result = objc_msgSend(MEMORY[0x1E4F42FF8], "bkui_reverseLeftRight:", v4);
  if (a2) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = result;
  }
  if (a1) {
    return v6;
  }
  return result;
}

void _layoutNavigationBarCopy(void *a1, void *a2)
{
  id v6 = a1;
  [a2 size];
  double v4 = v3;
  [v6 size];
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, v4, v5);
}

void sub_1E4B92DE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

void sub_1E4B932C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getBKDeviceClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBKDeviceClass_softClass;
  uint64_t v7 = getBKDeviceClass_softClass;
  if (!getBKDeviceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getBKDeviceClass_block_invoke;
    v3[3] = &unk_1E6EA23D0;
    v3[4] = &v4;
    __getBKDeviceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1E4B943E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBKDeviceDescriptorClass()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBKDeviceDescriptorClass_softClass;
  uint64_t v7 = getBKDeviceDescriptorClass_softClass;
  if (!getBKDeviceDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getBKDeviceDescriptorClass_block_invoke;
    v3[3] = &unk_1E6EA23D0;
    v3[4] = &v4;
    __getBKDeviceDescriptorClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1E4B944C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBKDeviceClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BKDevice");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBKDeviceClass_block_invoke_cold_1();
    BiometricKitLibrary();
  }
}

void BiometricKitLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __BiometricKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6EA28A0;
    uint64_t v3 = 0;
    BiometricKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __BiometricKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiometricKitLibraryCore_frameworkLibrary = result;
  return result;
}

BKUIFingerPrintPosedVideoPlayerView *__getBKDeviceDescriptorClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  uint64_t result = (BKUIFingerPrintPosedVideoPlayerView *)objc_getClass("BKDeviceDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (BKUIFingerPrintPosedVideoPlayerView *)__getBKDeviceDescriptorClass_block_invoke_cold_1();
    return [(BKUIFingerPrintPosedVideoPlayerView *)v3 initWithAssetName:v5 subdirectory:v6];
  }
  return result;
}

void sub_1E4B96BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4B970A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4B97174(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4B9723C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4B97FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4B98600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
}

void sub_1E4B9981C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E4B99A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBKDeviceClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BKDevice");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBKDeviceClass_block_invoke_cold_1();
    BiometricKitLibrary_0();
  }
}

void BiometricKitLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!BiometricKitLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __BiometricKitLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6EA29C8;
    uint64_t v3 = 0;
    BiometricKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!BiometricKitLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __BiometricKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  BiometricKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getBKDeviceDescriptorClass_block_invoke_0(uint64_t a1)
{
  BiometricKitLibrary_0();
  Class result = objc_getClass("BKDeviceDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceDescriptorClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBKDeviceDescriptorClass_block_invoke_cold_1();
    return (Class)__getBMStreamsClass_block_invoke(v3);
  }
  return result;
}

Class __getBMStreamsClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMStreamsClass_block_invoke_cold_1();
  }
  getBMStreamsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void BiomeStreamsLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __BiomeStreamsLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6EA29E0;
    uint64_t v3 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __BiomeStreamsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiomeStreamsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getBMDiscoverabilitySignalEventClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMDiscoverabilitySignalEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1();
  }
  getBMDiscoverabilitySignalEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

double timingEaseInOut_block_invoke(double a1)
{
  _QUINTIC_GENERATOR(-2.0, 3.0, 0.0);
  long long v2 = (double (**)(double))objc_claimAutoreleasedReturnValue();
  double v3 = v2[2](a1);

  return v3;
}

id _QUINTIC_GENERATOR(double a1, double a2, double a3)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___QUINTIC_GENERATOR_block_invoke;
  aBlock[3] = &__block_descriptor_72_e8_d16__0d8l;
  aBlock[4] = 0;
  aBlock[5] = 0;
  *(double *)&aBlock[6] = a1;
  *(double *)&aBlock[7] = a2;
  *(double *)&aBlock[8] = a3;
  double v3 = _Block_copy(aBlock);
  uint64_t v4 = _Block_copy(v3);

  return v4;
}

double timingEaseOut_block_invoke_2(double a1)
{
  _QUINTIC_GENERATOR(1.0, -3.0, 3.0);
  long long v2 = (double (**)(double))objc_claimAutoreleasedReturnValue();
  double v3 = v2[2](a1);

  return v3;
}

double timingEaseIn_block_invoke_3(double a1)
{
  _QUINTIC_GENERATOR(1.0, 0.0, 0.0);
  long long v2 = (double (**)(double))objc_claimAutoreleasedReturnValue();
  double v3 = v2[2](a1);

  return v3;
}

void sub_1E4B9AF90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1E4B9B0C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4B9B5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

double _radiansForOrientations(uint64_t a1, uint64_t a2)
{
  double result = 0.0;
  switch(a2)
  {
    case 1:
      uint64_t v3 = a1 - 2;
      if ((unint64_t)(a1 - 2) < 3)
      {
        uint64_t v4 = (double *)&unk_1E4BD1790;
        goto LABEL_10;
      }
      break;
    case 2:
      uint64_t v3 = a1 - 1;
      if ((unint64_t)(a1 - 1) < 4)
      {
        uint64_t v4 = (double *)&unk_1E4BD17E0;
        goto LABEL_10;
      }
      break;
    case 3:
      uint64_t v3 = a1 - 1;
      if ((unint64_t)(a1 - 1) < 4)
      {
        uint64_t v4 = (double *)&unk_1E4BD17C0;
        goto LABEL_10;
      }
      break;
    case 4:
      uint64_t v3 = a1 - 1;
      if ((unint64_t)(a1 - 1) < 3)
      {
        uint64_t v4 = (double *)&unk_1E4BD17A8;
LABEL_10:
        double result = v4[v3];
      }
      break;
    default:
      return result;
  }
  return result;
}

double _UIRotationRadiansForDeviceOrientation(uint64_t a1)
{
  double result = 0.0;
  if ((unint64_t)(a1 - 2) <= 2) {
    return dbl_1E4BD1800[a1 - 2];
  }
  return result;
}

__CFString *_deviceOrientationToString(unint64_t a1)
{
  if (a1 > 6) {
    return @"UIDeviceOrientationPortrait";
  }
  else {
    return off_1E6EA2B08[a1];
  }
}

double _landscapeRightRadiansForOrientations(uint64_t a1)
{
  double result = 0.0;
  if ((unint64_t)(a1 - 1) <= 3) {
    return dbl_1E4BD1838[a1 - 1];
  }
  return result;
}

void sub_1E4B9F1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1E4BA061C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E4BA0748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E4BA07B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E4BA0978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E4BA0A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E4BA0B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E4BA0CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E4BA0DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<InstanceInfo>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6EA1F10, MEMORY[0x1E4FBA1C8]);
}

void sub_1E4BA0EB0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<InstanceInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(80 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

double _degreesToRadians(double a1)
{
  return a1 * 3.14159265 / 180.0;
}

double _arrowContainerCenter()
{
  return 14.0;
}

void sub_1E4BA7210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLAUIPhysicalButtonViewClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!LocalAuthenticationPrivateUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __LocalAuthenticationPrivateUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6EA2BB8;
    uint64_t v6 = 0;
    LocalAuthenticationPrivateUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!LocalAuthenticationPrivateUILibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("LAUIPhysicalButtonView");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getLAUIPhysicalButtonViewClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLAUIPhysicalButtonViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LocalAuthenticationPrivateUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationPrivateUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E4BA814C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4BA99A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4BAB288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4BAB794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4BADCE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E4BADD90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E4BADE44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E4BB0294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4BB2248(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1E4BB2B88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Block_object_dispose((const void *)(v3 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1E4BB2C7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1E4BB6410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4BB7040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4BBA968(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 248));
  _Unwind_Resume(a1);
}

void sub_1E4BBBBF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __DisplayAndBrightnessSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DisplayAndBrightnessSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!MetalLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __MetalLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6EA3088;
    uint64_t v7 = 0;
    MetalLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)MetalLibraryCore_frameworkLibrary;
    if (MetalLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)MetalLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "MTLCreateSystemDefaultDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMTLCreateSystemDefaultDeviceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MetalLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MetalLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1E4BC0EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E4BC4BC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1E4BC4D08(_Unwind_Exception *exception_object)
{
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1E4BC67A8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

uint64_t *sub_1E4BC6A8C()
{
  return &qword_1EAE8C480;
}

uint64_t sub_1E4BC6A98()
{
  swift_beginAccess();
  uint64_t v0 = qword_1EAE8C480;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1E4BC6AEC(uint64_t a1, void *a2)
{
  qword_1EAE8C480 = a1;
  off_1EAE8C488 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1E4BC6B48())()
{
  return j__swift_endAccess;
}

uint64_t sub_1E4BC6BA4()
{
  uint64_t v0 = sub_1E4BCAD70();
  __swift_allocate_value_buffer(v0, qword_1EAE8C7F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAE8C7F8);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  return sub_1E4BCAD60();
}

uint64_t sub_1E4BC6C48()
{
  if (qword_1EAE8C638 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1E4BCAD70();

  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAE8C7F8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1E4BC6CE4@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAE8C638 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E4BCAD70();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAE8C7F8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1E4BC6DF0()
{
  return 0x100000000;
}

id sub_1E4BC6E0C()
{
  id v0 = objc_msgSend(self, sel_weakObjectsHashTable);

  return v0;
}

uint64_t sub_1E4BC6E4C()
{
  uint64_t v0 = sub_1E4BCAE10();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4BCAE40();
  MEMORY[0x1F4188790]();
  sub_1E4BCADB0();
  MEMORY[0x1F4188790]();
  sub_1E4BC7C88(0, &qword_1EAE8C490);
  sub_1E4BCADA0();
  v5[1] = MEMORY[0x1E4FBC860];
  sub_1E4BC7BF0(&qword_1EAE8C498, MEMORY[0x1E4FBCCB8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8C4A0);
  sub_1E4BC7C38(&qword_1EAE8C4A8, &qword_1EAE8C4A0);
  sub_1E4BCAE60();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC68], v0);
  return sub_1E4BCAE50();
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1E4BC7120(int a1, int a2, uint64_t (*a3)(), uint64_t a4)
{
  long long v5 = v4;
  uint64_t v10 = sub_1E4BCAD80();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4BCADB0();
  uint64_t result = MEMORY[0x1F4188790]();
  v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v5[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetState];
  if ((v5[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetState + 4] & 1) != 0
    || *(_DWORD *)v18 != a1
    || (v5[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetStartState + 4] & 1) != 0
    || *(_DWORD *)&v5[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetStartState] != a2)
  {
    *(_DWORD *)v18 = a1;
    v18[4] = 0;
    v19 = &v5[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetStartState];
    *(_DWORD *)v19 = a2;
    v19[4] = 0;
    uint64_t v26 = v15;
    uint64_t v27 = result;
    sub_1E4BCADA0();
    v33 = a3;
    uint64_t v34 = a4;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v30 = 1107296256;
    uint64_t v25 = v11;
    v31 = sub_1E4BC7578;
    v32 = &block_descriptor;
    _Block_copy(&aBlock);
    uint64_t v28 = MEMORY[0x1E4FBC860];
    v24[1] = sub_1E4BC7BF0(&qword_1EAE8C4C0, MEMORY[0x1E4FBCB00]);
    swift_retain();
    v24[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8C4C8);
    sub_1E4BC7C38(&qword_1EAE8C4D0, &qword_1EAE8C4C8);
    sub_1E4BCAE60();
    sub_1E4BCADF0();
    swift_allocObject();
    sub_1E4BCADC0();
    swift_release();
    sub_1E4BC7C88(0, &qword_1EAE8C4D8);
    v20 = (void *)sub_1E4BCAE20();
    uint64_t v21 = swift_allocObject();
    swift_weakInit();
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v5;
    *(void *)(v22 + 24) = v21;
    v33 = sub_1E4BC7D3C;
    uint64_t v34 = v22;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v30 = 1107296256;
    v31 = sub_1E4BC7578;
    v32 = &block_descriptor_6;
    v23 = _Block_copy(&aBlock);
    v5;
    swift_retain();
    sub_1E4BCAD90();
    uint64_t v28 = MEMORY[0x1E4FBC860];
    sub_1E4BCAE60();
    sub_1E4BCADE0();
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v10);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v27);
    swift_release();
    swift_release();
    sub_1E4BCAE30();
    return swift_release();
  }
  return result;
}

uint64_t sub_1E4BC7578(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_1E4BC7664()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetState;
  *(_DWORD *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 4) = 1;
  uint64_t v2 = v0 + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetStartState;
  *(_DWORD *)uint64_t v2 = 0;
  *(unsigned char *)(v2 + 4) = 1;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_pendingOperations);
  id v4 = objc_msgSend(v3, sel_allObjects);
  sub_1E4BCADF0();
  unint64_t v5 = sub_1E4BCAE00();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    id result = (id)sub_1E4BCAE80();
    uint64_t v6 = (uint64_t)result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain();
    if (!v6) {
      goto LABEL_10;
    }
  }
  if (v6 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v6; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      MEMORY[0x1E4E88DB0](i, v5);
    }
    else {
      swift_retain();
    }
    sub_1E4BCADD0();
    swift_release();
  }
LABEL_10:
  swift_bridgeObjectRelease_n();

  return objc_msgSend(v3, sel_removeAllObjects);
}

id sub_1E4BC7808()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id sub_1E4BC783C()
{
  uint64_t v13 = sub_1E4BCAE10();
  uint64_t v1 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E4BCAE40();
  MEMORY[0x1F4188790]();
  sub_1E4BCADB0();
  MEMORY[0x1F4188790]();
  id v4 = &v0[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetState];
  *(_DWORD *)id v4 = 0;
  v4[4] = 1;
  unint64_t v5 = &v0[OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_targetStartState];
  *(_DWORD *)unint64_t v5 = 0;
  v5[4] = 1;
  uint64_t v6 = OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_pendingOperations;
  uint64_t v7 = self;
  uint64_t v8 = v0;
  *(void *)&v0[v6] = objc_msgSend(v7, sel_weakObjectsHashTable);
  uint64_t v12 = OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_stateQueue;
  sub_1E4BC7C88(0, &qword_1EAE8C490);
  sub_1E4BCADA0();
  uint64_t v15 = MEMORY[0x1E4FBC860];
  sub_1E4BC7BF0(&qword_1EAE8C498, MEMORY[0x1E4FBCCB8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE8C4A0);
  sub_1E4BC7C38(&qword_1EAE8C4A8, &qword_1EAE8C4A0);
  sub_1E4BCAE60();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC68], v13);
  *(void *)&v8[v12] = sub_1E4BCAE50();

  uint64_t v9 = (objc_class *)type metadata accessor for EnrollStateDispatchWorkItemsManager();
  v14.receiver = v8;
  v14.super_class = v9;
  return objc_msgSendSuper2(&v14, sel_init);
}

id sub_1E4BC7B44()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EnrollStateDispatchWorkItemsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_1E4BC7BC4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
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

uint64_t sub_1E4BC7BF0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E4BC7C38(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E4BC7C88(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1E4BC7CC4()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4BC7CFC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1E4BC7D3C()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 16)
                + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_pendingOperations);
  swift_beginAccess();
  unsigned int v2 = objc_msgSend(v1, sel_containsObject_, swift_weakLoadStrong());
  uint64_t result = swift_release();
  if (v2)
  {
    swift_beginAccess();
    objc_msgSend(v1, sel_removeObject_, swift_weakLoadStrong());
    return swift_release();
  }
  return result;
}

_DWORD *sub_1E4BC7DFC@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_1E4BC7E0C(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t type metadata accessor for EnrollStateDispatchWorkItemsManager()
{
  return self;
}

void type metadata accessor for BKUIPearlEnrollState()
{
  if (!qword_1EAE8C4F0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EAE8C4F0);
    }
  }
}

uint64_t sub_1E4BC7E94()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E4BC7ECC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_1E4BC7EDC()
{
}

uint64_t sub_1E4BC7EFC()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

id sub_1E4BC7F0C()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1EAE8C748 = (uint64_t)result;
  return result;
}

uint64_t sub_1E4BC7F60(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C810);
}

uint64_t sub_1E4BC7F84()
{
  return sub_1E4BC887C(&qword_1EAE8C750, (uint64_t)qword_1EAE8C810);
}

uint64_t sub_1E4BC7FA8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C750, (uint64_t)qword_1EAE8C810, a1);
}

uint64_t sub_1E4BC7FCC(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C828);
}

uint64_t sub_1E4BC7FF4()
{
  return sub_1E4BC887C(&qword_1EAE8C758, (uint64_t)qword_1EAE8C828);
}

uint64_t sub_1E4BC8018@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C758, (uint64_t)qword_1EAE8C828, a1);
}

uint64_t sub_1E4BC803C(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C840);
}

uint64_t sub_1E4BC8058()
{
  return sub_1E4BC887C(&qword_1EAE8C760, (uint64_t)qword_1EAE8C840);
}

uint64_t sub_1E4BC807C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C760, (uint64_t)qword_1EAE8C840, a1);
}

uint64_t sub_1E4BC80A0(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C858);
}

uint64_t sub_1E4BC80BC()
{
  return sub_1E4BC887C(&qword_1EAE8C768, (uint64_t)qword_1EAE8C858);
}

uint64_t sub_1E4BC80E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C768, (uint64_t)qword_1EAE8C858, a1);
}

uint64_t sub_1E4BC8104(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C870);
}

uint64_t sub_1E4BC8128()
{
  return sub_1E4BC887C(&qword_1EAE8C770, (uint64_t)qword_1EAE8C870);
}

uint64_t sub_1E4BC814C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C770, (uint64_t)qword_1EAE8C870, a1);
}

uint64_t sub_1E4BC8170(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C888);
}

uint64_t sub_1E4BC8194()
{
  return sub_1E4BC887C(&qword_1EAE8C778, (uint64_t)qword_1EAE8C888);
}

uint64_t sub_1E4BC81B8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C778, (uint64_t)qword_1EAE8C888, a1);
}

uint64_t sub_1E4BC81DC(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C8A0);
}

uint64_t sub_1E4BC8200()
{
  return sub_1E4BC887C(&qword_1EAE8C780, (uint64_t)qword_1EAE8C8A0);
}

uint64_t sub_1E4BC8224@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C780, (uint64_t)qword_1EAE8C8A0, a1);
}

uint64_t sub_1E4BC8248(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C8B8);
}

uint64_t sub_1E4BC8274()
{
  return sub_1E4BC887C(&qword_1EAE8C788, (uint64_t)qword_1EAE8C8B8);
}

uint64_t sub_1E4BC8298@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C788, (uint64_t)qword_1EAE8C8B8, a1);
}

uint64_t sub_1E4BC82BC(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C8D0);
}

uint64_t sub_1E4BC82E8()
{
  return sub_1E4BC887C(&qword_1EAE8C790, (uint64_t)qword_1EAE8C8D0);
}

uint64_t sub_1E4BC830C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C790, (uint64_t)qword_1EAE8C8D0, a1);
}

uint64_t sub_1E4BC8330(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C8E8);
}

uint64_t sub_1E4BC835C()
{
  return sub_1E4BC887C(&qword_1EAE8C798, (uint64_t)qword_1EAE8C8E8);
}

uint64_t sub_1E4BC8380@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C798, (uint64_t)qword_1EAE8C8E8, a1);
}

uint64_t sub_1E4BC83A4(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C900);
}

uint64_t sub_1E4BC83D0()
{
  return sub_1E4BC887C(&qword_1EAE8C7A0, (uint64_t)qword_1EAE8C900);
}

uint64_t sub_1E4BC83F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C7A0, (uint64_t)qword_1EAE8C900, a1);
}

uint64_t sub_1E4BC8418(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C918);
}

uint64_t sub_1E4BC8444()
{
  return sub_1E4BC887C(&qword_1EAE8C7A8, (uint64_t)qword_1EAE8C918);
}

uint64_t sub_1E4BC8468@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C7A8, (uint64_t)qword_1EAE8C918, a1);
}

uint64_t sub_1E4BC848C(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C930);
}

uint64_t sub_1E4BC84B0()
{
  return sub_1E4BC887C(&qword_1EAE8C7B0, (uint64_t)qword_1EAE8C930);
}

uint64_t sub_1E4BC84D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C7B0, (uint64_t)qword_1EAE8C930, a1);
}

uint64_t sub_1E4BC84F8(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C948);
}

uint64_t sub_1E4BC8524()
{
  return sub_1E4BC887C(&qword_1EAE8C7B8, (uint64_t)qword_1EAE8C948);
}

uint64_t sub_1E4BC8548@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C7B8, (uint64_t)qword_1EAE8C948, a1);
}

uint64_t sub_1E4BC856C(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C960);
}

uint64_t sub_1E4BC8590()
{
  return sub_1E4BC887C(&qword_1EAE8C7C0, (uint64_t)qword_1EAE8C960);
}

uint64_t sub_1E4BC85B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C7C0, (uint64_t)qword_1EAE8C960, a1);
}

uint64_t sub_1E4BC85D8(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C978);
}

uint64_t sub_1E4BC85FC()
{
  return sub_1E4BC887C(&qword_1EAE8C7C8, (uint64_t)qword_1EAE8C978);
}

uint64_t sub_1E4BC8620@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C7C8, (uint64_t)qword_1EAE8C978, a1);
}

uint64_t sub_1E4BC8644(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C990);
}

uint64_t sub_1E4BC8668()
{
  return sub_1E4BC887C(&qword_1EAE8C7D0, (uint64_t)qword_1EAE8C990);
}

uint64_t sub_1E4BC868C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C7D0, (uint64_t)qword_1EAE8C990, a1);
}

uint64_t sub_1E4BC86B0(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C9A8);
}

uint64_t sub_1E4BC86D8()
{
  return sub_1E4BC887C(&qword_1EAE8C7D8, (uint64_t)qword_1EAE8C9A8);
}

uint64_t sub_1E4BC86FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C7D8, (uint64_t)qword_1EAE8C9A8, a1);
}

uint64_t sub_1E4BC8720(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C9C0);
}

uint64_t sub_1E4BC8748()
{
  return sub_1E4BC887C(&qword_1EAE8C7E0, (uint64_t)qword_1EAE8C9C0);
}

uint64_t sub_1E4BC876C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C7E0, (uint64_t)qword_1EAE8C9C0, a1);
}

uint64_t sub_1E4BC8790(uint64_t a1)
{
  return sub_1E4BC87B4(a1, qword_1EAE8C9D8);
}

uint64_t sub_1E4BC87B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1E4BCAD50();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_1EAE8C740 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1EAE8C748;
  return sub_1E4BCAD40();
}

uint64_t sub_1E4BC8858()
{
  return sub_1E4BC887C(&qword_1EAE8C7E8, (uint64_t)qword_1EAE8C9D8);
}

uint64_t sub_1E4BC887C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1E4BCAD50();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_1E4BC88D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E4BC88F4(&qword_1EAE8C7E8, (uint64_t)qword_1EAE8C9D8, a1);
}

uint64_t sub_1E4BC88F4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1E4BCAD50();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t getBYFlowSkipIdentifierFaceID_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[BKUIPearlEnrollViewController(ButtonActionWithNavigation) updatePeriocularEnrollmentSettings:](v0);
}

void __getBYFlowSkipControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[BKUILegacyOperationsHandler enrollOperation:finishedWithEnrollResult:](v0);
}

uint64_t __getBKDeviceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKDeviceDescriptorClass_block_invoke_cold_1(v0);
}

uint64_t __getBKDeviceDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[BKUIFingerPrintPosedVideoPlayerView load](v0);
}

void __getBMStreamsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1(v0);
}

void __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[BKUIPearlPositioningGuideView _startDisplay](v0);
}

uint64_t __getLAUIPhysicalButtonViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[BKUIFingerPrintEnrollmentPhaseViewController _updateEnrollViewsForSize:](v0);
}

uint64_t sub_1E4BCAD40()
{
  return MEMORY[0x1F40E05E0]();
}

uint64_t sub_1E4BCAD50()
{
  return MEMORY[0x1F40E05E8]();
}

uint64_t sub_1E4BCAD60()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1E4BCAD70()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1E4BCAD80()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1E4BCAD90()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1E4BCADA0()
{
  return MEMORY[0x1F4186D18]();
}

uint64_t sub_1E4BCADB0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1E4BCADC0()
{
  return MEMORY[0x1F4186E98]();
}

uint64_t sub_1E4BCADD0()
{
  return MEMORY[0x1F4186EC0]();
}

uint64_t sub_1E4BCADE0()
{
  return MEMORY[0x1F4186EC8]();
}

uint64_t sub_1E4BCADF0()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t sub_1E4BCAE00()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1E4BCAE10()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1E4BCAE20()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1E4BCAE30()
{
  return MEMORY[0x1F41870F0]();
}

uint64_t sub_1E4BCAE40()
{
  return MEMORY[0x1F41872A0]();
}

uint64_t sub_1E4BCAE50()
{
  return MEMORY[0x1F41872A8]();
}

uint64_t sub_1E4BCAE60()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1E4BCAE70()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1E4BCAE80()
{
  return MEMORY[0x1F4185350]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

uint64_t AudioServicesPlaySystemSoundWithVibration()
{
  return MEMORY[0x1F40D4E50]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  MEMORY[0x1F40F4AC8](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1F40F4CD8](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1F40F4D18](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
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

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB048](path, transform);
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x1F40DB0C8](path1, path2);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBD0](desc);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

uint64_t IOHIDEventSystemClientActivate()
{
  return MEMORY[0x1F40E8AA0]();
}

uint64_t IOHIDEventSystemClientCancel()
{
  return MEMORY[0x1F40E8AA8]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1F40E8AC8]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1F40E8AF0]();
}

uint64_t IOHIDEventSystemClientSetDispatchQueue()
{
  return MEMORY[0x1F40E8B30]();
}

Boolean IOHIDEventSystemClientSetProperty(IOHIDEventSystemClientRef client, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1F40E8B48](client, key, property);
}

uint64_t IOHIDEventSystemClientUnregisterDeviceMatchingBlock()
{
  return MEMORY[0x1F40E8B50]();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return MEMORY[0x1F40E8B68]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1F4102B38]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1F4102B58]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x1F4179120]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)(*(uint64_t (**)(const void *))&aNamedB1Askscon[104])(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__double2 __sincos_stret(double a1)
{
  off_1F40C9C80(a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  off_1F40C9C88(a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return off_1F40CA1E8();
}

long double atan2(long double __y, long double __x)
{
  off_1F40CA460(__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  off_1F40CA468(a1, a2);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)sel_initAndReturnError_(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)(*(uint64_t (**)(void))&sel_initForReading_error_[16])();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)sel_initWithEvents_parameters_error_(attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)((uint64_t (*)(const char *, dispatch_queue_attr_t))*(&sel_initWithEvents_parameters_error_
                                                                                         + 1))(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)(*(uint64_t (**)(intptr_t))&sel_initWithIdentifier_bundleID_context_[8])(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return (*(uint64_t (**)(dispatch_semaphore_t))&sel_initWithIdentifier_bundleID_context_[24])(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return sel_initWithImage_(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)(*(uint64_t (**)(dispatch_source_type_t, uintptr_t, uintptr_t, dispatch_queue_t))&sel_initWithObjects_[8])(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return (*(uint64_t (**)(dispatch_time_t, int64_t))&sel_initWithPoints_colors_count_strokeWeight_pattern_rotation_scale_translation_[16])(when, delta);
}

char *dlerror(void)
{
  return (char *)(*(uint64_t (**)(void))&sel_initWithStateName_darkStateName_transitionDuration_transitionSpeed_[8])();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)(*(uint64_t (**)(const char *, void))&sel_initWithStateName_darkStateName_transitionDuration_transitionSpeed_[16])(__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)(*(uint64_t (**)(void *, const char *))&sel_initWithStateName_darkStateName_transitionDuration_transitionSpeed_[32])(__handle, __symbol);
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return sel_preferredFontDescriptorWithTextStyle_();
}

uint64_t matrix_look_at()
{
  return MEMORY[0x1F410CA40]();
}

uint64_t matrix_ortho()
{
  return MEMORY[0x1F410CA48]();
}

uint32_t notify_cancel(int token)
{
  return off_1F40CD028(*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return (*(uint64_t (**)(void, int *))&sel_setMuteHapticsWhileRecordingAudio_[8])(*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return (*(uint64_t (**)(void, uint64_t *))&sel_setMuteHapticsWhileRecordingAudio_[16])(*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return (*(uint64_t (**)(void))&sel_setMuteHapticsWhileRecordingAudio_[24])(*(void *)&val);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return sel_setMuted_(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return ((uint64_t (*)(const char *, int *, dispatch_queue_t, notify_handler_t))*(&sel_setMuted_ + 1))(name, out_token, queue, handler);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)sel_setPurpose_(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return (*(uint64_t (**)(os_log_t, void))&sel_setRevealed_animated_[16])(oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return off_1F40CD658();
}

long double pow(long double __x, long double __y)
{
  sel_superview(__x, __y);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

int usleep(useconds_t a1)
{
}