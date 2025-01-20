void sub_2432B7580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_2432B85B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t CMIOLog()
{
  if (CMIOLog::once != -1) {
    dispatch_once(&CMIOLog::once, &__block_literal_global_19);
  }
  return CMIOLog::cmioLog;
}

const char *CMIOFilename(const char *a1)
{
  for (size_t i = strlen(a1); i; --i)
  {
    if (a1[i - 1] == 47) {
      break;
    }
  }
  return &a1[i];
}

uint64_t getSTExecutableIdentityResolverClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x3052000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  uint64_t v0 = getSTExecutableIdentityResolverClass_softClass;
  uint64_t v8 = getSTExecutableIdentityResolverClass_softClass;
  if (!getSTExecutableIdentityResolverClass_softClass)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getSTExecutableIdentityResolverClass_block_invoke;
    v2[3] = &unk_26517C258;
    v2[4] = &v3;
    __getSTExecutableIdentityResolverClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2432B8738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SystemStatusLibraryCore()
{
  if (!SystemStatusLibraryCore_frameworkLibrary) {
    SystemStatusLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SystemStatusLibraryCore_frameworkLibrary;
}

os_log_t __CMIOLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.cmio", (const char *)&unk_2433085BA);
  CMIOLog::cmioLog = (uint64_t)result;
  return result;
}

void sub_2432BB34C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,__CFString *a22)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v22 = CMIOLog();
    if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      -[CMIOExtensionStream clientQueue_updateMutableStreamPropertiesByPolicy]();
    }
    v23 = (void *)MEMORY[0x263F087E8];
    a21 = *MEMORY[0x263F08320];
    a22 = @"exception";
    uint64_t v24 = [NSDictionary dictionaryWithObjects:&a22 forKeys:&a21 count:1];
    [v23 errorWithDomain:*MEMORY[0x263F08410] code:-8 userInfo:v24];
    objc_end_catch();
    JUMPOUT(0x2432BB004);
  }
  _Unwind_Resume(exception_object);
}

void sub_2432BB900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2432BD160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2432C095C(_Unwind_Exception *a1)
{
}

void sub_2432C1194(_Unwind_Exception *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    v2 = CMIOLog();
    if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __47__CMIOExtensionProvider_removeProviderContext___block_invoke_cold_1();
    }
    objc_end_catch();
    JUMPOUT(0x2432C1054);
  }
  _Unwind_Resume(exc_buf);
}

void sub_2432C11F0(_Unwind_Exception *a1)
{
}

void sub_2432C1E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_2432C2B1C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    v43 = CMIOLog();
    if (v43 && os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __55__CMIOExtensionProvider_pluginStatesForClientID_reply___block_invoke_cold_2();
    }
    v44 = (void *)MEMORY[0x263F087E8];
    *(void *)(v42 - 224) = *MEMORY[0x263F08320];
    *(void *)(v42 - 216) = @"exception";
    uint64_t v45 = [NSDictionary dictionaryWithObjects:v42 - 216 forKeys:v42 - 224 count:1];
    [v44 errorWithDomain:*MEMORY[0x263F08410] code:-8 userInfo:v45];
    objc_end_catch();
    JUMPOUT(0x2432C2478);
  }
  _Unwind_Resume(exc_buf);
}

void sub_2432C2BDC(_Unwind_Exception *a1)
{
}

void sub_2432C2E34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, __CFString *a12, char a13)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      -[CMIOExtensionProvider _addAvailablePropertyStatesForDevice:toDictionary:]();
    }
    v14 = (void *)MEMORY[0x263F087E8];
    a11 = *MEMORY[0x263F08320];
    a12 = @"exception";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:&a12 forKeys:&a11 count:1];
    [v14 errorWithDomain:*MEMORY[0x263F08410] code:-8 userInfo:v15];
    objc_end_catch();
    JUMPOUT(0x2432C2D2CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_2432C3348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, __CFString *a12, char a13)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __74__CMIOExtensionProvider_pluginPropertyStatesForClientID_properties_reply___block_invoke_cold_2();
    }
    v14 = (void *)MEMORY[0x263F087E8];
    a11 = *MEMORY[0x263F08320];
    a12 = @"exception";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:&a12 forKeys:&a11 count:1];
    [v14 errorWithDomain:*MEMORY[0x263F08410] code:-8 userInfo:v15];
    objc_end_catch();
    JUMPOUT(0x2432C3214);
  }
  _Unwind_Resume(exception_object);
}

void sub_2432C3928(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, __CFString *a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v25 = CMIOLog();
    if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __81__CMIOExtensionProvider_setPluginPropertyValuesForClientID_propertyValues_reply___block_invoke_cold_3();
    }
    v26 = (void *)MEMORY[0x263F087E8];
    a17 = *MEMORY[0x263F08320];
    a18 = @"exception";
    uint64_t v27 = [NSDictionary dictionaryWithObjects:&a18 forKeys:&a17 count:1];
    [v26 errorWithDomain:*MEMORY[0x263F08410] code:-8 userInfo:v27];
    objc_end_catch();
    JUMPOUT(0x2432C3694);
  }
  _Unwind_Resume(exception_object);
}

void sub_2432C4664(_Unwind_Exception *a1)
{
}

void sub_2432C4678(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    v29 = CMIOLog();
    if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __64__CMIOExtensionProvider_deviceStatesForClientID_deviceID_reply___block_invoke_cold_3();
    }
    v30 = (void *)MEMORY[0x263F087E8];
    *(void *)(v28 - 240) = *MEMORY[0x263F08320];
    *(void *)(v28 - 232) = @"exception";
    uint64_t v31 = [NSDictionary dictionaryWithObjects:v28 - 232 forKeys:v28 - 240 count:1];
    [v30 errorWithDomain:*MEMORY[0x263F08410] code:-8 userInfo:v31];
    objc_end_catch();
    JUMPOUT(0x2432C4050);
  }
  _Unwind_Resume(exc_buf);
}

void sub_2432C4C48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, __CFString *a12, char a13)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __83__CMIOExtensionProvider_devicePropertyStatesForClientID_deviceID_properties_reply___block_invoke_cold_3();
    }
    v14 = (void *)MEMORY[0x263F087E8];
    a11 = *MEMORY[0x263F08320];
    a12 = @"exception";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:&a12 forKeys:&a11 count:1];
    [v14 errorWithDomain:*MEMORY[0x263F08410] code:-8 userInfo:v15];
    objc_end_catch();
    JUMPOUT(0x2432C4B14);
  }
  _Unwind_Resume(exception_object);
}

void sub_2432C5678(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v25 = CMIOLog();
    if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __90__CMIOExtensionProvider_setDevicePropertyValuesForClientID_deviceID_propertyValues_reply___block_invoke_cold_4();
    }
    objc_end_catch();
    JUMPOUT(0x2432C527CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_2432C5FA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, __CFString *a12, char a13)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __83__CMIOExtensionProvider_streamPropertyStatesForClientID_streamID_properties_reply___block_invoke_cold_3();
    }
    v14 = (void *)MEMORY[0x263F087E8];
    a11 = *MEMORY[0x263F08320];
    a12 = @"exception";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:&a12 forKeys:&a11 count:1];
    [v14 errorWithDomain:*MEMORY[0x263F08410] code:-8 userInfo:v15];
    objc_end_catch();
    JUMPOUT(0x2432C5E70);
  }
  _Unwind_Resume(exception_object);
}

void sub_2432C67E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, __CFString *a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v25 = CMIOLog();
    if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      __90__CMIOExtensionProvider_setStreamPropertyValuesForClientID_streamID_propertyValues_reply___block_invoke_cold_5();
    }
    v26 = (void *)MEMORY[0x263F087E8];
    a17 = *MEMORY[0x263F08320];
    a18 = @"exception";
    uint64_t v27 = [NSDictionary dictionaryWithObjects:&a18 forKeys:&a17 count:1];
    [v26 errorWithDomain:*MEMORY[0x263F08410] code:-8 userInfo:v27];
    objc_end_catch();
    JUMPOUT(0x2432C6378);
  }
  _Unwind_Resume(exception_object);
}

void sub_2432C77A8(_Unwind_Exception *a1)
{
}

void sub_2432C7F84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, __CFString *a12, char a13)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v13 = CMIOLog();
    if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProvider.m");
      -[CMIOExtensionProvider _clientQueue_startStreamForClientID:streamID:requestAudio:requestVideo:reply:]();
    }
    v14 = (void *)MEMORY[0x263F087E8];
    a11 = *MEMORY[0x263F08320];
    a12 = @"exception";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:&a12 forKeys:&a11 count:1];
    [v14 errorWithDomain:*MEMORY[0x263F08410] code:-8 userInfo:v15];
    objc_end_catch();
    JUMPOUT(0x2432C7F38);
  }
  _Unwind_Resume(exception_object);
}

void sub_2432C8424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SystemStatusLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SystemStatusLibraryCore_frameworkLibrary = result;
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

Class __getSTExecutableIdentityResolverClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SystemStatusServerLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SystemStatusServerLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_26517C278;
    uint64_t v6 = 0;
    SystemStatusServerLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!SystemStatusServerLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("STExecutableIdentityResolver");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getSTExecutableIdentityResolverClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSTExecutableIdentityResolverClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t __SystemStatusServerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SystemStatusServerLibraryCore_frameworkLibrary = result;
  return result;
}

void __getSTExecutableIdentityClass_block_invoke(uint64_t a1)
{
  if (!SystemStatusLibraryCore())
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_getClass("STExecutableIdentity");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    getSTExecutableIdentityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    __getSTExecutableIdentityClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_2();
  }
}

uint64_t OUTLINED_FUNCTION_3(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  return result;
}

void OUTLINED_FUNCTION_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 20) = v3;
  *(_WORD *)(a3 + 28) = 2112;
  *(void *)(a3 + 30) = a2;
}

void OUTLINED_FUNCTION_8(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x26u);
}

void OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a3 + 14) = v3;
  *(_WORD *)(a3 + 18) = 2080;
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x28u);
}

void OUTLINED_FUNCTION_23(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Cu);
}

BOOL CMIOExtensionPropertyIs4CCProperty(void *a1)
{
  return [a1 hasPrefix:@"4cc_"] && objc_msgSend(a1, "length") == 18;
}

unint64_t CMIOExtensionPropertyAddressFromProperty(void *a1)
{
  if ([a1 hasPrefix:@"4cc_"] && objc_msgSend(a1, "length") == 18)
  {
    uint64_t v2 = [a1 UTF8String];
    unsigned int v3 = *(char *)(v2 + 7) | (*(char *)(v2 + 6) << 8) | (*(char *)(v2 + 5) << 16) | (*(unsigned __int8 *)(v2 + 4) << 24);
    if (v3 == 808464432) {
      unsigned int v3 = 0;
    }
    LODWORD(v4) = *(char *)(v2 + 12) | (*(char *)(v2 + 11) << 8) | (*(char *)(v2 + 10) << 16) | (*(unsigned __int8 *)(v2 + 9) << 24);
    if (v4 == 808464432) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = v4;
    }
  }
  else
  {
    unsigned int v3 = 0;
    uint64_t v4 = 0;
  }
  return v3 | (unint64_t)(v4 << 32);
}

uint64_t CMIOExtensionPropertyFromPropertyAddress(unint64_t a1, unsigned int a2)
{
  if (a2 + 1 <= 3) {
    a2 = *(_DWORD *)&a00001000200000[4 * (a2 + 1)];
  }
  unint64_t v2 = HIDWORD(a1);
  if (!HIDWORD(a1)) {
    LODWORD(v2) = 808464432;
  }
  if (a1) {
    unsigned int v3 = a1;
  }
  else {
    unsigned int v3 = 808464432;
  }
  return objc_msgSend(NSString, "stringWithFormat:", @"4cc_%c%c%c%c_%c%c%c%c_%c%c%c%c", HIBYTE(v3), BYTE2(v3), BYTE1(v3), v3, BYTE3(v2), BYTE2(v2), BYTE1(v2), v2, HIBYTE(a2), BYTE2(a2), BYTE1(a2), a2);
}

uint64_t CMIOExtensionPropertyForPropertyAddressInDictionary(unint64_t a1, unsigned int a2, void *a3)
{
  if ([a3 count])
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3052000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    uint64_t v22 = 0;
    uint64_t v6 = CMIOExtensionPropertyFromPropertyAddress(a1, a2);
    v18[5] = v6;
    if (![a3 objectForKey:v6])
    {
      uint64_t v9 = CMIOExtensionPropertyFromPropertyAddress(a1 | 0x2A2A2A2A00000000, 0xFFFFFFFF);
      v18[5] = v9;
      uint64_t v10 = [a3 objectForKey:v9];
      uint64_t v7 = v18 + 5;
      if (v10) {
        goto LABEL_6;
      }
      *uint64_t v7 = 0;
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"4cc_%c%c%c%c_", BYTE3(a1), BYTE2(a1), BYTE1(a1), a1);
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c_", HIBYTE(HIDWORD(a1)), BYTE6(a1), BYTE5(a1), BYTE4(a1));
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", HIBYTE(a2), BYTE2(a2), BYTE1(a2), a2);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __CMIOExtensionPropertyForPropertyAddressInDictionary_block_invoke;
      v15[3] = &unk_26517C520;
      unsigned int v16 = a2;
      v15[4] = v12;
      v15[5] = v13;
      v15[6] = v14;
      v15[7] = &v17;
      v15[8] = a1;
      [a3 enumerateKeysAndObjectsUsingBlock:v15];
    }
    uint64_t v7 = v18 + 5;
LABEL_6:
    uint64_t v8 = *v7;
    _Block_object_dispose(&v17, 8);
    return v8;
  }
  return 0;
}

void sub_2432CBD44(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t __CMIOExtensionPropertyForPropertyAddressInDictionary_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 hasPrefix:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t v8 = objc_msgSend(a2, "substringWithRange:", 9, 5);
    if (*(_DWORD *)(a1 + 68) == 707406378
      || (uint64_t v9 = v8, ([v8 hasPrefix:@"****_"] & 1) != 0)
      || (uint64_t result = [v9 isEqualToString:*(void *)(a1 + 40)], result))
    {
      uint64_t result = objc_msgSend(a2, "substringWithRange:", 14, 4);
      if (*(_DWORD *)(a1 + 72) == -1
        || (uint64_t v10 = (void *)result, result = [(id)result hasPrefix:@"****"], (result & 1) != 0)
        || (uint64_t result = [v10 isEqualToString:*(void *)(a1 + 48)], result))
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = a2;
        *a4 = 1;
      }
    }
  }
  return result;
}

uint64_t CMIOExtensionPropertyForPropertyAddressInSet(unint64_t a1, unsigned int a2, void *a3)
{
  if (![a3 count]) {
    return 0;
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  uint64_t v22 = 0;
  uint64_t v6 = CMIOExtensionPropertyFromPropertyAddress(a1, a2);
  v18[5] = v6;
  if ([a3 containsObject:v6]) {
    goto LABEL_5;
  }
  uint64_t v7 = CMIOExtensionPropertyFromPropertyAddress(a1 | 0x2A2A2A2A00000000, 0xFFFFFFFF);
  v18[5] = v7;
  char v8 = [a3 containsObject:v7];
  uint64_t v9 = v18 + 5;
  if ((v8 & 1) == 0)
  {
    uint64_t *v9 = 0;
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"4cc_%c%c%c%c_", BYTE3(a1), BYTE2(a1), BYTE1(a1), a1);
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c_", HIBYTE(HIDWORD(a1)), BYTE6(a1), BYTE5(a1), BYTE4(a1));
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", HIBYTE(a2), BYTE2(a2), BYTE1(a2), a2);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __CMIOExtensionPropertyForPropertyAddressInSet_block_invoke;
    v15[3] = &unk_26517C548;
    unsigned int v16 = a2;
    v15[4] = v10;
    v15[5] = v11;
    v15[6] = v12;
    v15[7] = &v17;
    v15[8] = a1;
    [a3 enumerateObjectsUsingBlock:v15];
LABEL_5:
    uint64_t v9 = v18 + 5;
  }
  uint64_t v13 = *v9;
  _Block_object_dispose(&v17, 8);
  return v13;
}

void sub_2432CC05C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __CMIOExtensionPropertyForPropertyAddressInSet_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 hasPrefix:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t v7 = objc_msgSend(a2, "substringWithRange:", 9, 5);
    if (*(_DWORD *)(a1 + 68) == 707406378
      || (char v8 = v7, ([v7 hasPrefix:@"****_"] & 1) != 0)
      || (uint64_t result = [v8 isEqualToString:*(void *)(a1 + 40)], result))
    {
      uint64_t result = objc_msgSend(a2, "substringWithRange:", 14, 4);
      if (*(_DWORD *)(a1 + 72) == -1
        || (v9 = (void *)result, uint64_t result = [(id)result hasPrefix:@"****"], (result & 1) != 0)
        || (uint64_t result = [v9 isEqualToString:*(void *)(a1 + 48)], result))
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = a2;
        *a3 = 1;
      }
    }
  }
  return result;
}

BOOL CMIOExtensionPropertyIs4CCBooleanControlProperty(void *a1)
{
  return [a1 hasPrefix:@"4cc_"]
      && [a1 length] == 28
      && !objc_msgSend(a1, "compare:options:range:", @"_togl_", 0, 18, 6);
}

BOOL CMIOExtensionPropertyIs4CCSelectorControlProperty(void *a1)
{
  return [a1 hasPrefix:@"4cc_"]
      && [a1 length] == 28
      && !objc_msgSend(a1, "compare:options:range:", @"_slct_", 0, 18, 6);
}

BOOL CMIOExtensionPropertyIs4CCFeatureControlProperty(void *a1)
{
  return [a1 hasPrefix:@"4cc_"]
      && [a1 length] == 28
      && !objc_msgSend(a1, "compare:options:range:", @"_ftct_", 0, 18, 6);
}

BOOL CMIOExtensionPropertyIs4CCControlProperty(void *a1)
{
  if (CMIOExtensionPropertyIs4CCBooleanControlProperty(a1) || CMIOExtensionPropertyIs4CCSelectorControlProperty(a1)) {
    return 1;
  }

  return CMIOExtensionPropertyIs4CCFeatureControlProperty(a1);
}

BOOL CMIOExtensionFeatureControlFromProperty(void *a1, int *a2, int *a3, int *a4, int *a5)
{
  BOOL v10 = CMIOExtensionPropertyIs4CCFeatureControlProperty(a1);
  if (v10)
  {
    uint64_t v11 = [a1 UTF8String];
    int v12 = *(char *)(v11 + 7) | (*(char *)(v11 + 6) << 8) | (*(char *)(v11 + 5) << 16) | (*(unsigned __int8 *)(v11 + 4) << 24);
    if (v12 == 808464432) {
      int v12 = 0;
    }
    int v13 = *(char *)(v11 + 12) | (*(char *)(v11 + 11) << 8) | (*(char *)(v11 + 10) << 16) | (*(unsigned __int8 *)(v11 + 9) << 24);
    if (v13 == 808464432) {
      int v13 = 0;
    }
    int v14 = *(char *)(v11 + 17) | (*(char *)(v11 + 16) << 8) | (*(char *)(v11 + 15) << 16) | (*(unsigned __int8 *)(v11 + 14) << 24);
    switch(v14)
    {
      case 707406378:
        int v14 = -1;
        break;
      case 808464433:
        int v14 = 1;
        break;
      case 808464432:
        int v14 = 0;
        break;
      case 808464434:
        int v14 = 2;
        break;
    }
    int v15 = *(char *)(v11 + 27) | (*(char *)(v11 + 26) << 8) | (*(char *)(v11 + 25) << 16) | (*(unsigned __int8 *)(v11 + 24) << 24);
    if (v15 == 808464432) {
      int v15 = 0;
    }
    if (a2) {
      *a2 = v12;
    }
    if (a3) {
      *a3 = v13;
    }
    if (a4) {
      *a4 = v14;
    }
    if (a5) {
      *a5 = v15;
    }
  }
  return v10;
}

uint64_t CMIOExtensionPropertyFromFeatureControl(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  if (a3 + 1 >= 3)
  {
    unsigned int v4 = 808464434;
    if (a3 != 2) {
      unsigned int v4 = a3;
    }
  }
  else
  {
    unsigned int v4 = *(_DWORD *)&a00001000200000[4 * (a3 + 1) + 16];
  }
  if (a2) {
    unsigned int v5 = a2;
  }
  else {
    unsigned int v5 = 808464432;
  }
  if (a1) {
    unsigned int v6 = a1;
  }
  else {
    unsigned int v6 = 808464432;
  }
  if (a4) {
    unsigned int v7 = a4;
  }
  else {
    unsigned int v7 = 808464432;
  }
  return objc_msgSend(NSString, "stringWithFormat:", @"4cc_%c%c%c%c_%c%c%c%c_%c%c%c%c_ftct_%c%c%c%c", HIBYTE(v6), BYTE2(v6), BYTE1(v6), v6, HIBYTE(v5), BYTE2(v5), BYTE1(v5), v5, HIBYTE(v4), BYTE2(v4), BYTE1(v4), v4, HIBYTE(v7), BYTE2(v7), BYTE1(v7), v7);
}

BOOL CMIOExtensionControlFromProperty(void *a1, int *a2, int *a3, int *a4, int *a5, int *a6)
{
  BOOL v12 = CMIOExtensionPropertyIs4CCControlProperty(a1);
  if (v12)
  {
    uint64_t v13 = [a1 UTF8String];
    int v14 = *(char *)(v13 + 7) | (*(char *)(v13 + 6) << 8) | (*(char *)(v13 + 5) << 16) | (*(unsigned __int8 *)(v13 + 4) << 24);
    if (v14 == 808464432) {
      int v14 = 0;
    }
    int v15 = *(char *)(v13 + 12) | (*(char *)(v13 + 11) << 8) | (*(char *)(v13 + 10) << 16) | (*(unsigned __int8 *)(v13 + 9) << 24);
    if (v15 == 808464432) {
      int v15 = 0;
    }
    int v16 = *(char *)(v13 + 17) | (*(char *)(v13 + 16) << 8) | (*(char *)(v13 + 15) << 16) | (*(unsigned __int8 *)(v13 + 14) << 24);
    switch(v16)
    {
      case 707406378:
        int v16 = -1;
        break;
      case 808464433:
        int v16 = 1;
        break;
      case 808464432:
        int v16 = 0;
        break;
      case 808464434:
        int v16 = 2;
        break;
    }
    int v17 = *(char *)(v13 + 22) | (*(char *)(v13 + 21) << 8) | (*(char *)(v13 + 20) << 16) | (*(unsigned __int8 *)(v13 + 19) << 24);
    if (v17 == 808464432) {
      int v17 = 0;
    }
    int v18 = *(char *)(v13 + 27) | (*(char *)(v13 + 26) << 8) | (*(char *)(v13 + 25) << 16) | (*(unsigned __int8 *)(v13 + 24) << 24);
    if (v18 == 808464432) {
      int v18 = 0;
    }
    if (a3) {
      *a3 = v14;
    }
    if (a4) {
      *a4 = v15;
    }
    if (a5) {
      *a5 = v16;
    }
    if (a6) {
      *a6 = v18;
    }
    if (a2) {
      *a2 = v17;
    }
  }
  return v12;
}

uint64_t CMIOExtensionPropertyFromControl(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  if (a4 + 1 >= 3)
  {
    if (a4 == 2) {
      unsigned int v5 = 808464434;
    }
    else {
      unsigned int v5 = a4;
    }
  }
  else
  {
    unsigned int v5 = *(_DWORD *)&a00001000200000[4 * (a4 + 1) + 16];
  }
  if (a3) {
    unsigned int v6 = a3;
  }
  else {
    unsigned int v6 = 808464432;
  }
  if (a2) {
    unsigned int v7 = a2;
  }
  else {
    unsigned int v7 = 808464432;
  }
  if (a5) {
    unsigned int v8 = a5;
  }
  else {
    unsigned int v8 = 808464432;
  }
  if (a1) {
    unsigned int v9 = a1;
  }
  else {
    unsigned int v9 = 808464432;
  }
  return objc_msgSend(NSString, "stringWithFormat:", @"4cc_%c%c%c%c_%c%c%c%c_%c%c%c%c_%c%c%c%c_%c%c%c%c", HIBYTE(v7), BYTE2(v7), BYTE1(v7), v7, HIBYTE(v6), BYTE2(v6), BYTE1(v6), v6, HIBYTE(v5), BYTE2(v5), BYTE1(v5), v5, HIBYTE(v9), BYTE2(v9), BYTE1(v9), v9,
           HIBYTE(v8),
           BYTE2(v8),
           BYTE1(v8),
           v8);
}

void cmio_bbufUtilXPCObjectReleaser(xpc_object_t object)
{
  if (object) {
    xpc_release(object);
  }
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

uint64_t CMIOFormatDescriptionGetOnlyHasIFrames(const opaqueCMFormatDescription *a1)
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(a1);
  if (!Extensions) {
    return 0;
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(Extensions, (const void *)kCMIOFormatDescriptionExtensionKey_OnlyHasIFrames);
  if (!Value) {
    return 0;
  }

  return CFBooleanGetValue(Value);
}

uint64_t CMIOFormatDescriptionGetManufacturerCode(const opaqueCMFormatDescription *a1, _DWORD *a2)
{
  if (!a2) {
    return 4294967246;
  }
  *a2 = 0;
  if (!a1) {
    return 4294967246;
  }
  uint64_t result = (uint64_t)CMFormatDescriptionGetExtensions(a1);
  if (result)
  {
    uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x263F00EA8]);
    if (result)
    {
      *(_DWORD *)buffer = 0;
      v5.location = 0;
      v5.length = 4;
      if (CFStringGetBytes((CFStringRef)result, v5, 0, 0, 0, buffer, 4, 0) == 4)
      {
        uint64_t result = 0;
        *a2 = bswap32(*(unsigned int *)buffer);
        return result;
      }
      return 4294967246;
    }
  }
  return result;
}

BOOL CMIOFormatDescriptionSignifiesDiscontinuity(CMFormatDescriptionRef desc, const opaqueCMFormatDescription *a2)
{
  BOOL result = 0;
  v23[12] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F03EC0];
  v23[0] = *MEMORY[0x263F00E58];
  v23[1] = v4;
  uint64_t v5 = *MEMORY[0x263F03F38];
  v23[2] = *MEMORY[0x263F03F30];
  v23[3] = v5;
  uint64_t v6 = *MEMORY[0x263F03ED8];
  v23[4] = *MEMORY[0x263F03FA8];
  v23[5] = v6;
  uint64_t v7 = *MEMORY[0x263F03F48];
  v23[6] = *MEMORY[0x263F03FC0];
  v23[7] = v7;
  uint64_t v8 = *MEMORY[0x263F00E78];
  v23[8] = *MEMORY[0x263F04020];
  v23[9] = v8;
  uint64_t v9 = *MEMORY[0x263F03E48];
  v23[10] = *MEMORY[0x263F03E58];
  v23[11] = v9;
  if (a2 && desc && desc != a2)
  {
    CMMediaType MediaType = CMFormatDescriptionGetMediaType(desc);
    CMMediaType v12 = CMFormatDescriptionGetMediaType(a2);
    if (MediaType != 1986618469 || v12 != 1986618469) {
      return CMFormatDescriptionEqual(desc, a2) == 0;
    }
    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(desc);
    if (MediaSubType != CMFormatDescriptionGetMediaSubType(a2)) {
      return 1;
    }
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(desc);
    if (Dimensions != CMVideoFormatDescriptionGetDimensions(a2)) {
      return 1;
    }
    CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(desc);
    CFDictionaryRef v16 = CMFormatDescriptionGetExtensions(a2);
    if (Extensions == v16) {
      return 0;
    }
    CFDictionaryRef v17 = v16;
    BOOL result = 1;
    if (Extensions && v17)
    {
      uint64_t v18 = 0;
      while (1)
      {
        uint64_t v19 = (const void *)v23[v18];
        CFBooleanRef Value = CFDictionaryGetValue(Extensions, v19);
        v21 = CFDictionaryGetValue(v17, v19);
        if (Value != v21)
        {
          BOOL v22 = !Value || v21 == 0;
          if (v22 || !CFEqual(Value, v21)) {
            break;
          }
        }
        BOOL result = 0;
        if (++v18 == 12) {
          return result;
        }
      }
      return 1;
    }
  }
  return result;
}

void sub_2432DA6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __CMIOModuleLogLevel_block_invoke()
{
  uint64_t result = CMIOPreferencesGetIntegerValue(@"CMIOExtensionSession.Debug", 0);
  CMIOModuleLogLevel_cmioLevel = result;
  return result;
}

void OUTLINED_FUNCTION_6_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 30) = v3;
  *(_WORD *)(a3 + 38) = 2114;
  *(void *)(a3 + 40) = a2;
}

void sub_2432DB120(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 152));
  _Unwind_Resume(a1);
}

void sub_2432DD5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __CMIOModuleLogLevel_block_invoke_0()
{
  uint64_t result = CMIOPreferencesGetIntegerValue(@"CMIOExtensionProxy.Debug", 0);
  CMIOModuleLogLevel_cmioLevel_0 = result;
  return result;
}

uint64_t cmio_XPCMessageSetCFNumber(void *a1, const char *a2, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (a1)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFNumberGetTypeID() || (CFTypeID v7 = CFGetTypeID(cf), v7 == CFBooleanGetTypeID()))
    {
      uint64_t v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v8)
      {
        uint64_t v9 = v8;
        xpc_dictionary_set_value(a1, a2, v8);
        xpc_release(v9);
        return 0;
      }
      CMMediaType v12 = CMIOLog();
      if (v12)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          cmio_XPCMessageSetCFNumber_cold_2();
        }
      }
    }
    else
    {
      uint64_t v13 = CMIOLog();
      if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        cmio_XPCMessageSetCFNumber_cold_3();
      }
    }
  }
  else
  {
    uint64_t v11 = CMIOLog();
    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageSetCFNumber_cold_1();
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t cmio_XPCMessageSetCFString(void *a1, const char *a2, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (a1)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFStringGetTypeID())
    {
      CFTypeID v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v6)
      {
        CFTypeID v7 = v6;
        xpc_dictionary_set_value(a1, a2, v6);
        xpc_release(v7);
        return 0;
      }
      uint64_t v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          cmio_XPCMessageSetCFString_cold_2();
        }
      }
    }
    else
    {
      uint64_t v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        cmio_XPCMessageSetCFString_cold_3();
      }
    }
  }
  else
  {
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageSetCFString_cold_1();
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t cmio_XPCMessageSetCFData(void *a1, const char *a2, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (a1)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFDataGetTypeID())
    {
      CFTypeID v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v6)
      {
        CFTypeID v7 = v6;
        xpc_dictionary_set_value(a1, a2, v6);
        xpc_release(v7);
        return 0;
      }
      uint64_t v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          cmio_XPCMessageSetCFData_cold_2();
        }
      }
    }
    else
    {
      uint64_t v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        cmio_XPCMessageSetCFData_cold_3();
      }
    }
  }
  else
  {
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageSetCFData_cold_1();
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t cmio_XPCMessageSetCFArray(void *a1, const char *a2, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (a1)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFArrayGetTypeID())
    {
      CFTypeID v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v6)
      {
        CFTypeID v7 = v6;
        xpc_dictionary_set_value(a1, a2, v6);
        xpc_release(v7);
        return 0;
      }
      uint64_t v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          cmio_XPCMessageSetCFArray_cold_2();
        }
      }
    }
    else
    {
      uint64_t v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        cmio_XPCMessageSetCFArray_cold_3();
      }
    }
  }
  else
  {
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageSetCFArray_cold_1();
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t cmio_XPCMessageSetCFDictionary(void *a1, const char *a2, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (a1)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFDictionaryGetTypeID())
    {
      CFTypeID v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v6)
      {
        CFTypeID v7 = v6;
        xpc_dictionary_set_value(a1, a2, v6);
        xpc_release(v7);
        return 0;
      }
      uint64_t v11 = CMIOLog();
      if (v11)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          cmio_XPCMessageSetCFDictionary_cold_2();
        }
      }
    }
    else
    {
      uint64_t v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        cmio_XPCMessageSetCFDictionary_cold_3();
      }
    }
  }
  else
  {
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageSetCFDictionary_cold_1();
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t cmio_XPCMessageCopyCFNumber(void *a1, const char *a2, NSObject **a3)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    CFTypeID v6 = 0;
    goto LABEL_7;
  }
  CFTypeID v5 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    uint64_t v9 = CMIOLog();
    CFTypeID v6 = v9;
    if (!v9)
    {
LABEL_16:
      uint64_t result = 0xFFFFFFFFLL;
      goto LABEL_7;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageCopyCFNumber_cold_1();
    }
LABEL_15:
    CFTypeID v6 = 0;
    goto LABEL_16;
  }
  CFTypeID v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 != CFNumberGetTypeID())
  {
    CFTypeID v8 = CFGetTypeID(v6);
    if (v8 != CFBooleanGetTypeID())
    {
      uint64_t v10 = CMIOLog();
      if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        cmio_XPCMessageCopyCFNumber_cold_2();
      }
      CFRelease(v6);
      goto LABEL_15;
    }
  }
  uint64_t result = 0;
LABEL_7:
  *a3 = v6;
  return result;
}

uint64_t cmio_XPCMessageCopyCFString(void *a1, const char *a2, NSObject **a3)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    CFTypeID v6 = 0;
    goto LABEL_6;
  }
  CFTypeID v5 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    CFTypeID v8 = CMIOLog();
    CFTypeID v6 = v8;
    if (!v8)
    {
LABEL_15:
      uint64_t result = 0xFFFFFFFFLL;
      goto LABEL_6;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageCopyCFString_cold_1();
    }
LABEL_14:
    CFTypeID v6 = 0;
    goto LABEL_15;
  }
  CFTypeID v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 != CFStringGetTypeID())
  {
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageCopyCFString_cold_2();
    }
    CFRelease(v6);
    goto LABEL_14;
  }
  uint64_t result = 0;
LABEL_6:
  *a3 = v6;
  return result;
}

uint64_t cmio_XPCMessageCopyCFData(void *a1, const char *a2, NSObject **a3)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    CFTypeID v6 = 0;
    goto LABEL_6;
  }
  CFTypeID v5 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    CFTypeID v8 = CMIOLog();
    CFTypeID v6 = v8;
    if (!v8)
    {
LABEL_15:
      uint64_t result = 0xFFFFFFFFLL;
      goto LABEL_6;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageCopyCFData_cold_1();
    }
LABEL_14:
    CFTypeID v6 = 0;
    goto LABEL_15;
  }
  CFTypeID v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 != CFDataGetTypeID())
  {
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageCopyCFData_cold_2();
    }
    CFRelease(v6);
    goto LABEL_14;
  }
  uint64_t result = 0;
LABEL_6:
  *a3 = v6;
  return result;
}

uint64_t cmio_XPCMessageCopyCFArray(void *a1, const char *a2, NSObject **a3)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    CFTypeID v6 = 0;
    goto LABEL_6;
  }
  CFTypeID v5 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    CFTypeID v8 = CMIOLog();
    CFTypeID v6 = v8;
    if (!v8)
    {
LABEL_15:
      uint64_t result = 0xFFFFFFFFLL;
      goto LABEL_6;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageCopyCFArray_cold_1();
    }
LABEL_14:
    CFTypeID v6 = 0;
    goto LABEL_15;
  }
  CFTypeID v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 != CFArrayGetTypeID())
  {
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageCopyCFArray_cold_2();
    }
    CFRelease(v6);
    goto LABEL_14;
  }
  uint64_t result = 0;
LABEL_6:
  *a3 = v6;
  return result;
}

uint64_t cmio_XPCMessageCopyCFDictionary(void *a1, const char *a2, NSObject **a3)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    CFTypeID v6 = 0;
    goto LABEL_6;
  }
  CFTypeID v5 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    CFTypeID v8 = CMIOLog();
    CFTypeID v6 = v8;
    if (!v8)
    {
LABEL_15:
      uint64_t result = 0xFFFFFFFFLL;
      goto LABEL_6;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageCopyCFDictionary_cold_1();
    }
LABEL_14:
    CFTypeID v6 = 0;
    goto LABEL_15;
  }
  CFTypeID v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  if (v7 != CFDictionaryGetTypeID())
  {
    uint64_t v9 = CMIOLog();
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      cmio_XPCMessageCopyCFDictionary_cold_2();
    }
    CFRelease(v6);
    goto LABEL_14;
  }
  uint64_t result = 0;
LABEL_6:
  *a3 = v6;
  return result;
}

uint64_t cmio_VDCAssistantDeviceUIDForUSBAssistantNSUUID(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [a1 getUUIDBytes:v2];
  return objc_msgSend(NSString, "stringWithFormat:", @"0x%016llx", (int)(bswap32(v5) & 0xFFFF0000) | (unint64_t)(bswap32(v6) >> 16) | ((unint64_t)(bswap32(v3) >> 16) << 48) | ((unint64_t)(bswap32(v4) >> 16) << 32));
}

uint64_t cmio_getSTCameraCaptureAttributionMapKey(__CFString *a1, __CFString *a2)
{
  unint64_t v2 = @"unknownDevice";
  if (a1) {
    unint64_t v2 = a1;
  }
  unsigned __int16 v3 = @"unknownStream";
  if (a2) {
    unsigned __int16 v3 = a2;
  }
  return [NSString stringWithFormat:@"%@_%@", v2, v3];
}

void sub_2432DF8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2432E133C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __62__CMIOExtensionProviderHostContext_availablePluginProperties___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E1300);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E1970(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      uint64_t v19 = CMIOLog();
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        -[CMIOExtensionProviderHostContext pluginStates:]();
      }
      objc_end_catch();
      JUMPOUT(0x2432E18B8);
    }
    objc_begin_catch(exception_object);
    JUMPOUT(0x2432E18BCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E2108(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __76__CMIOExtensionProviderHostContext_pluginPropertyStatesForProperties_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E20CCLL);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E2670(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __66__CMIOExtensionProviderHostContext_setPluginPropertyValues_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E2634);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E2BF8(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __80__CMIOExtensionProviderHostContext_availableDevicePropertiesWithDeviceID_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E2BBCLL);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E3270(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      CFDictionaryRef v16 = CMIOLog();
      if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __67__CMIOExtensionProviderHostContext_deviceStatesWithDeviceID_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E3230);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v15 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E3938(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_devicePropertyStatesWithDeviceID_properties_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E38FCLL);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E3EF0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __93__CMIOExtensionProviderHostContext_setDevicePropertyValuesWithDeviceID_propertyValues_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E3EB4);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E4478(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __80__CMIOExtensionProviderHostContext_availableStreamPropertiesWithStreamID_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E443CLL);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E4AA0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __86__CMIOExtensionProviderHostContext_streamPropertyStatesWithStreamID_properties_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E4A64);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E5224(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __93__CMIOExtensionProviderHostContext_setStreamPropertyValuesWithStreamID_propertyValues_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E51E8);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E56FC(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __66__CMIOExtensionProviderHostContext_startStreamWithStreamID_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E56C0);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E5BD4(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __65__CMIOExtensionProviderHostContext_stopStreamWithStreamID_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E5B98);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E6568(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      CMMediaType v12 = CMIOLog();
      if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __94__CMIOExtensionProviderHostContext_captureAsyncStillImageWithStreamID_uniqueID_options_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E652CLL);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v11 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2432E6AAC(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(exception_object);
      unsigned __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderHostContext.m");
        __77__CMIOExtensionProviderHostContext_enqueueReactionEffect_reactionType_reply___block_invoke_cold_1();
      }
      objc_end_catch();
      JUMPOUT(0x2432E6A70);
    }
    objc_begin_catch(exception_object);
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(v2 + 32) + 24));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __CMIOModuleLogLevel_block_invoke_1()
{
  uint64_t result = CMIOPreferencesGetIntegerValue(@"CMIOExtensionProviderHostContext.Debug", 0);
  CMIOModuleLogLevel_cmioLevel_1 = result;
  return result;
}

void OUTLINED_FUNCTION_5_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 20) = v3;
  *(_WORD *)(a3 + 28) = 2114;
  *(void *)(a3 + 30) = a2;
}

void OUTLINED_FUNCTION_9_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)(a3 + 28) = v3;
  *(void *)(a3 + 30) = a2;
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  return result;
}

void OUTLINED_FUNCTION_12_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

void OUTLINED_FUNCTION_13_0(uint64_t a1@<X1>, int a2@<W8>)
{
  *(_DWORD *)(a1 + 14) = a2;
  *(_WORD *)(a1 + 18) = 2080;
}

uint64_t CMIOPreferences()
{
  if (CMIOPreferences::once != -1) {
    dispatch_once(&CMIOPreferences::once, &__block_literal_global_5);
  }
  return CMIOPreferences::cmioPref;
}

CFDictionaryRef __CMIOPreferences_block_invoke()
{
  CFDictionaryRef result = CFPreferencesCopyMultiple(0, @"com.apple.cmio", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CMIOPreferences::cmioPref = (uint64_t)result;
  return result;
}

uint64_t CMIOPreferencesGetIntegerValue(void *key, char *a2)
{
  if (CMIOPreferences::once != -1) {
    dispatch_once(&CMIOPreferences::once, &__block_literal_global_5);
  }
  if (CMIOPreferences::cmioPref)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)CMIOPreferences::cmioPref, key);
    if (Value)
    {
      CFStringRef v5 = Value;
      CFTypeID v6 = CFGetTypeID(Value);
      if (v6 == CFStringGetTypeID())
      {
        IntCFStringRef Value = CFStringGetIntValue(v5);
        if (IntValue)
        {
          uint64_t v8 = IntValue;
          goto LABEL_21;
        }
        uint64_t v8 = 1;
        if (CFStringCompare(v5, @"true", 1uLL))
        {
          uint64_t v8 = 1;
          if (CFStringCompare(v5, @"yes", 1uLL))
          {
            if (CFStringCompare(v5, @"false", 1uLL)
              && CFStringCompare(v5, @"no", 1uLL)
              && CFStringCompare(v5, @"0", 1uLL))
            {
              goto LABEL_17;
            }
            uint64_t v8 = 0;
          }
        }
      }
      else
      {
        CFTypeID v9 = CFGetTypeID(v5);
        if (v9 == CFNumberGetTypeID())
        {
          uint64_t valuePtr = 0;
          CFNumberGetValue((CFNumberRef)v5, kCFNumberCFIndexType, &valuePtr);
          uint64_t v8 = valuePtr;
        }
        else
        {
          CFTypeID v10 = CFGetTypeID(v5);
          if (v10 != CFBooleanGetTypeID()) {
            goto LABEL_17;
          }
          uint64_t v8 = CFBooleanGetValue((CFBooleanRef)v5) != 0;
        }
      }
LABEL_21:
      char v11 = 1;
      if (!a2) {
        return v8;
      }
      goto LABEL_18;
    }
  }
LABEL_17:
  char v11 = 0;
  uint64_t v8 = 0;
  if (a2) {
LABEL_18:
  }
    *a2 = v11;
  return v8;
}

uint64_t CMIOLogLevel(int a1)
{
  if (CMIOLogLevel::once != -1) {
    dispatch_once(&CMIOLogLevel::once, &__block_literal_global_24);
  }
  if (CMIOLogLevel::cmioLevel < a1) {
    return 0;
  }
  if (CMIOLog::once != -1) {
    dispatch_once(&CMIOLog::once, &__block_literal_global_19);
  }
  return CMIOLog::cmioLog;
}

uint64_t __CMIOLogLevel_block_invoke()
{
  uint64_t result = CMIOPreferencesGetIntegerValue(@"Debug", 0);
  CMIOLogLevel::cmioLevel = result;
  return result;
}

void sub_2432E73E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2432EBDA4(_Unwind_Exception *exception_object, int a2, ...)
{
  va_start(va, a2);
  if (a2)
  {
    if (a2 == 2)
    {
      id v2 = objc_begin_catch(exception_object);
      __int16 v3 = CMIOLog();
      if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        unsigned __int16 v4 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProviderContext.m");
        __73__CMIOExtensionProviderContext_pullSampleBufferForStreamID_replyq_reply___block_invoke_cold_1((uint64_t)v4, (uint64_t)v2, (uint64_t)va);
      }
      objc_end_catch();
      JUMPOUT(0x2432EBD74);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

OSStatus CMIOSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, UInt32 numSamples, UInt32 numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, UInt32 numSampleSizeEntries, const size_t *sampleSizeArray, UInt64 sequenceNumber, UInt32 discontinuityFlags, CMSampleBufferRef *sBufOut)
{
  char v11 = sBufOut;
  CMAttachmentBearerRef target = 0;
  if (!sBufOut) {
    return -50;
  }
  CFNumberRef v13 = 0;
  OSStatus v14 = -50;
  if (formatDescription)
  {
    if (sampleTimingArray)
    {
      if (CMFormatDescriptionGetMediaType(formatDescription) != 1986618469
        || (CFNumberRef v13 = 0, v14 = -50, numSamples == 1) && numSampleSizeEntries == 1)
      {
        OSStatus v21 = CMSampleBufferCreate(allocator, dataBuffer, 1u, 0, 0, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray, (CMSampleBufferRef *)&target);
        if (v21)
        {
          OSStatus v14 = v21;
          BOOL v22 = CMIOLog();
          CFNumberRef v13 = (CFNumberRef)v22;
          if (v22)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              CMIOSampleBufferCreate_cold_1();
            }
            CFNumberRef v13 = 0;
          }
        }
        else
        {
          CFNumberRef v13 = CFNumberCreate(allocator, kCFNumberSInt64Type, &sequenceNumber);
          if (v13)
          {
            CMSetAttachment(target, kCMIOSampleBufferAttachmentKey_SequenceNumber, v13, 1u);
            CFNumberRef v23 = CFNumberCreate(allocator, kCFNumberSInt32Type, &discontinuityFlags);
            if (v23)
            {
              CFNumberRef v24 = v23;
              CMSetAttachment(target, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, v23, 1u);
              *char v11 = (CMSampleBufferRef)target;
              CMAttachmentBearerRef target = 0;
              CFRelease(v13);
              OSStatus v14 = 0;
              CFNumberRef v13 = v24;
LABEL_20:
              CFRelease(v13);
              return v14;
            }
          }
          OSStatus v14 = -108;
        }
      }
    }
  }
  if (target)
  {
    CFRelease(target);
    CMAttachmentBearerRef target = 0;
  }
  if (v13) {
    goto LABEL_20;
  }
  return v14;
}

OSStatus CMIOSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, UInt64 sequenceNumber, UInt32 discontinuityFlags, CMSampleBufferRef *sBufOut)
{
  UInt64 valuePtr = sequenceNumber;
  UInt32 v17 = discontinuityFlags;
  CMSampleBufferRef sampleBufferOut = 0;
  if (!sBufOut) {
    return -50;
  }
  CFNumberRef v8 = 0;
  OSStatus v9 = -50;
  if (formatDescription && sampleTiming)
  {
    OSStatus v11 = CMSampleBufferCreateForImageBuffer(allocator, imageBuffer, 1u, 0, 0, formatDescription, sampleTiming, &sampleBufferOut);
    if (v11)
    {
      OSStatus v9 = v11;
      CMMediaType v12 = CMIOLog();
      CFNumberRef v8 = (CFNumberRef)v12;
      if (v12)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          CMIOSampleBufferCreateForImageBuffer_cold_1();
        }
        CFNumberRef v8 = 0;
      }
    }
    else
    {
      CFNumberRef v8 = CFNumberCreate(allocator, kCFNumberSInt64Type, &valuePtr);
      if (v8)
      {
        CMSetAttachment(sampleBufferOut, kCMIOSampleBufferAttachmentKey_SequenceNumber, v8, 1u);
        CFNumberRef v13 = CFNumberCreate(allocator, kCFNumberSInt32Type, &v17);
        if (v13)
        {
          CFNumberRef v14 = v13;
          CMSetAttachment(sampleBufferOut, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, v13, 1u);
          *sBufOut = sampleBufferOut;
          CMSampleBufferRef sampleBufferOut = 0;
          CFRelease(v8);
          OSStatus v9 = 0;
          CFNumberRef v8 = v14;
LABEL_17:
          CFRelease(v8);
          return v9;
        }
      }
      OSStatus v9 = -108;
    }
  }
  if (sampleBufferOut)
  {
    CFRelease(sampleBufferOut);
    CMSampleBufferRef sampleBufferOut = 0;
  }
  if (v8) {
    goto LABEL_17;
  }
  return v9;
}

OSStatus CMIOSampleBufferCreateNoDataMarker(CFAllocatorRef allocator, UInt32 noDataEvent, CMFormatDescriptionRef formatDescription, UInt64 sequenceNumber, UInt32 discontinuityFlags, CMSampleBufferRef *sBufOut)
{
  CFNumberRef v6 = 0;
  UInt32 v19 = noDataEvent;
  *(_DWORD *)&v17[8] = 0;
  UInt64 valuePtr = sequenceNumber;
  *(void *)UInt32 v17 = discontinuityFlags | 0x1000;
  OSStatus v7 = -50;
  if (sequenceNumber == -1)
  {
    CFNumberRef v9 = 0;
  }
  else
  {
    CFNumberRef v9 = 0;
    if (sBufOut)
    {
      OSStatus v11 = CMSampleBufferCreate(allocator, 0, 0, 0, 0, formatDescription, 0, 0, 0, 0, 0, (CMSampleBufferRef *)&v17[4]);
      if (v11)
      {
        OSStatus v7 = v11;
        CMMediaType v12 = CMIOLog();
        CFNumberRef v6 = (CFNumberRef)v12;
        if (v12)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            CMIOSampleBufferCreateNoDataMarker_cold_1();
          }
          CFNumberRef v6 = 0;
        }
        CFNumberRef v9 = 0;
      }
      else
      {
        CFNumberRef v6 = CFNumberCreate(allocator, kCFNumberSInt64Type, &valuePtr);
        if (v6)
        {
          CMSetAttachment(*(CMAttachmentBearerRef *)&v17[4], kCMIOSampleBufferAttachmentKey_SequenceNumber, v6, 1u);
          CFNumberRef v9 = CFNumberCreate(allocator, kCFNumberSInt32Type, v17);
          if (v9)
          {
            CMSetAttachment(*(CMAttachmentBearerRef *)&v17[4], kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, v9, 1u);
            CFNumberRef v13 = CFNumberCreate(allocator, kCFNumberSInt32Type, &v19);
            if (v13)
            {
              CFNumberRef v14 = v13;
              CMSetAttachment(*(CMAttachmentBearerRef *)&v17[4], kCMIOSampleBufferAttachmentKey_NoDataMarker, v13, 1u);
              OSStatus v7 = 0;
              *sBufOut = *(CMSampleBufferRef *)&v17[4];
              *(void *)&v17[4] = 0;
LABEL_19:
              CFRelease(v6);
              CFNumberRef v15 = v14;
              goto LABEL_20;
            }
          }
        }
        else
        {
          CFNumberRef v9 = 0;
        }
        OSStatus v7 = -108;
      }
    }
  }
  if (*(void *)&v17[4])
  {
    CFRelease(*(CFTypeRef *)&v17[4]);
    *(void *)&v17[4] = 0;
  }
  CFNumberRef v14 = 0;
  CFNumberRef v15 = 0;
  if (v6) {
    goto LABEL_19;
  }
LABEL_20:
  if (v9) {
    CFRelease(v9);
  }
  if (v15) {
    CFRelease(v15);
  }
  return v7;
}

void CMIOSampleBufferSetSequenceNumber(CFAllocatorRef allocator, CMSampleBufferRef sbuf, UInt64 sequenceNumber)
{
  UInt64 valuePtr = sequenceNumber;
  if (sbuf)
  {
    CFNumberRef v4 = CFNumberCreate(allocator, kCFNumberSInt64Type, &valuePtr);
    if (v4)
    {
      CFNumberRef v5 = v4;
      CMSetAttachment(sbuf, kCMIOSampleBufferAttachmentKey_SequenceNumber, v4, 1u);
      CFRelease(v5);
    }
  }
}

UInt64 CMIOSampleBufferGetSequenceNumber(CMSampleBufferRef sbuf)
{
  if (!sbuf) {
    return -1;
  }
  CFTypeRef v1 = CMGetAttachment(sbuf, kCMIOSampleBufferAttachmentKey_SequenceNumber, 0);
  if (!v1) {
    return -1;
  }
  id v2 = v1;
  CFTypeID TypeID = CFNumberGetTypeID();
  if (TypeID != CFGetTypeID(v2)) {
    return -1;
  }
  UInt64 valuePtr = 0;
  if (CFNumberGetValue((CFNumberRef)v2, kCFNumberSInt64Type, &valuePtr)) {
    return valuePtr;
  }
  else {
    return -1;
  }
}

void CMIOSampleBufferSetDiscontinuityFlags(CFAllocatorRef allocator, CMSampleBufferRef sbuf, UInt32 discontinuityFlags)
{
  UInt32 valuePtr = discontinuityFlags;
  if (sbuf)
  {
    CFNumberRef v4 = CFNumberCreate(allocator, kCFNumberSInt32Type, &valuePtr);
    if (v4)
    {
      CFNumberRef v5 = v4;
      CMSetAttachment(sbuf, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, v4, 1u);
      CFRelease(v5);
    }
  }
}

UInt32 CMIOSampleBufferGetDiscontinuityFlags(CMSampleBufferRef sbuf)
{
  if (!sbuf) {
    return 1;
  }
  CFTypeRef v1 = CMGetAttachment(sbuf, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags, 0);
  if (!v1) {
    return 1;
  }
  id v2 = v1;
  CFTypeID TypeID = CFNumberGetTypeID();
  if (TypeID != CFGetTypeID(v2)) {
    return 1;
  }
  UInt32 valuePtr = 0;
  if (CFNumberGetValue((CFNumberRef)v2, kCFNumberSInt32Type, &valuePtr)) {
    return valuePtr;
  }
  else {
    return 1;
  }
}

OSStatus CMIOSampleBufferCopyNonRequiredAttachments(CMSampleBufferRef sourceSBuf, CMSampleBufferRef destSBuf, CMAttachmentMode attachmentMode)
{
  OSStatus v3 = -50;
  if (sourceSBuf && destSBuf)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDictionaryRef v7 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x263EFFB08], sourceSBuf, attachmentMode);
    if (v7)
    {
      CFDictionaryRef v8 = v7;
      if (CFDictionaryGetCount(v7) >= 1)
      {
        if (CFDictionaryContainsKey(v8, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags)
          || CFDictionaryContainsKey(v8, kCMIOSampleBufferAttachmentKey_SequenceNumber))
        {
          MutableCopy = CFDictionaryCreateMutableCopy(v6, 0, v8);
          if (MutableCopy)
          {
            CFTypeID v10 = MutableCopy;
            CFDictionaryRemoveValue(MutableCopy, kCMIOSampleBufferAttachmentKey_DiscontinuityFlags);
            CFDictionaryRemoveValue(v10, kCMIOSampleBufferAttachmentKey_SequenceNumber);
            if (CFDictionaryGetCount(v10) >= 1) {
              CMSetAttachments(destSBuf, v10, attachmentMode);
            }
            CFRelease(v8);
            OSStatus v3 = 0;
            goto LABEL_16;
          }
          OSStatus v3 = -108;
LABEL_15:
          CFTypeID v10 = v8;
LABEL_16:
          CFRelease(v10);
          return v3;
        }
        CMSetAttachments(destSBuf, v8, attachmentMode);
      }
      OSStatus v3 = 0;
      goto LABEL_15;
    }
    return 0;
  }
  return v3;
}

OSStatus CMIOSampleBufferCopySampleAttachments(CMSampleBufferRef sourceSBuf, CMSampleBufferRef destSBuf)
{
  LODWORD(v2) = -50;
  if (sourceSBuf && destSBuf)
  {
    CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(sourceSBuf, 0);
    if (SampleAttachmentsArray)
    {
      CFArrayRef v5 = SampleAttachmentsArray;
      CFIndex Count = CFArrayGetCount(SampleAttachmentsArray);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        CFArrayRef v8 = CMSampleBufferGetSampleAttachmentsArray(destSBuf, 1u);
        if (!v8)
        {
          LODWORD(v2) = -108;
          return v2;
        }
        CFArrayRef v9 = v8;
        CFIndex v10 = CFArrayGetCount(v8);
        if (v7 >= v10) {
          uint64_t v11 = v10;
        }
        else {
          uint64_t v11 = v7;
        }
        if (v11 >= 1)
        {
          CFIndex v12 = 0;
          uint64_t v2 = 0;
          uint64_t v22 = v11;
          CFArrayRef v23 = v5;
          while (1)
          {
            uint64_t v13 = v2;
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v12);
            CFNumberRef v15 = (__CFDictionary *)CFArrayGetValueAtIndex(v9, v12);
            LODWORD(v2) = -50;
            if (!ValueAtIndex) {
              return v2;
            }
            CFDictionaryRef v16 = v15;
            if (!v15) {
              return v2;
            }
            CFIndex v17 = CFDictionaryGetCount(ValueAtIndex);
            uint64_t v18 = (const void **)malloc_type_malloc(8 * v17, 0x80040B8603338uLL);
            UInt32 v19 = (const void **)malloc_type_malloc(8 * v17, 0x80040B8603338uLL);
            v20 = v19;
            if (v18)
            {
              if (v19) {
                break;
              }
            }
            uint64_t v13 = 4294967188;
            uint64_t v2 = 4294967188;
            if (v18) {
              goto LABEL_19;
            }
LABEL_20:
            if (v20) {
              free(v20);
            }
            if (++v12 == v11) {
              return v2;
            }
          }
          CFDictionaryGetKeysAndValues(ValueAtIndex, v18, v19);
          if (v17)
          {
            do
            {
              CFDictionarySetValue(v16, v18[v17 - 1], v20[v17 - 1]);
              --v17;
            }
            while (v17);
            uint64_t v11 = v22;
            CFArrayRef v5 = v23;
          }
LABEL_19:
          free(v18);
          uint64_t v2 = v13;
          goto LABEL_20;
        }
      }
    }
    LODWORD(v2) = 0;
  }
  return v2;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t __getSTExecutableIdentityResolverClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSTExecutableIdentityClass_block_invoke_cold_1(v0);
}

uint64_t __getSTExecutableIdentityClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[CMIOExtensionPropertyAttributes copyXPCDictionary](v0);
}

void cmio_XPCMessageSetCFNumber_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFNumber_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFNumber_cold_3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFString_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFString_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFString_cold_3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFData_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFData_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFData_cold_3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFArray_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFArray_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFArray_cold_3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFDictionary_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFDictionary_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageSetCFDictionary_cold_3()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageCopyCFNumber_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageCopyCFNumber_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageCopyCFString_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageCopyCFString_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageCopyCFData_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageCopyCFData_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageCopyCFArray_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageCopyCFArray_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageCopyCFDictionary_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void cmio_XPCMessageCopyCFDictionary_cold_2()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionUtilities.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_23(&dword_2432B6000, v0, v1, "%s:%d cmio assert: \"%s\" at %s - (err=%d)", v2, v3, v4, v5, v6);
}

void CMIOSampleBufferCreate_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Common/Sources/CMIOSampleBuffer.c");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
}

void CMIOSampleBufferCreateForImageBuffer_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Common/Sources/CMIOSampleBuffer.c");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
}

void CMIOSampleBufferCreateNoDataMarker_cold_1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Common/Sources/CMIOSampleBuffer.c");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_2432B6000, v0, v1, "%s:%d:%s ### Err %ld, ", v2, v3, v4, v5, v6);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x270EE4CB8](keysToFetch, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE79F8](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A08](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x270EE7A30](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x270EE7A38](theBuffer, offset, length);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x270EE7AA0]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x270EE7AA8](retstr, clock);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x270EE7AC8](allocator, target, *(void *)&attachmentMode);
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x270EE7AE0](formatDescription, otherFormatDescription);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x270EE7B00](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B10](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B20](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

OSStatus CMMuxedFormatDescriptionCreate(CFAllocatorRef allocator, CMMuxedStreamType muxType, CFDictionaryRef extensions, CMMuxedFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7B78](allocator, *(void *)&muxType, extensions, formatDescriptionOut);
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BD0](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BE8](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C28](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x270EE7C30](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x270EE7C88](sbuf, createIfNecessary);
}

OSStatus CMSampleBufferGetSampleTimingInfoArray(CMSampleBufferRef sbuf, CMItemCount numSampleTimingEntries, CMSampleTimingInfo *timingArrayOut, CMItemCount *timingArrayEntriesNeededOut)
{
  return MEMORY[0x270EE7CA0](sbuf, numSampleTimingEntries, timingArrayOut, timingArrayEntriesNeededOut);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7D98](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x270EE7DE0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7FB8](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x270EE9FC0](buffer, key, attachmentMode);
}

Boolean CVBufferHasAttachment(CVBufferRef buffer, CFStringRef key)
{
  return MEMORY[0x270EE9FE0](buffer, key);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x270EEA230]();
}

uint64_t FigCopyBacktrace()
{
  return MEMORY[0x270EE8158]();
}

uint64_t FigDispatchQueueCreateTargetingWorkloopWithPriority()
{
  return MEMORY[0x270EE81A0]();
}

uint64_t FigGetUpTimeNanoseconds()
{
  return MEMORY[0x270EE8258]();
}

uint64_t FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer()
{
  return MEMORY[0x270EE8320]();
}

uint64_t FigRemote_CreateSerializedAtomDataBlockBufferForSampleBuffer()
{
  return MEMORY[0x270EE8330]();
}

uint64_t FigXPCMessageCopyFormatDescription()
{
  return MEMORY[0x270EE8450]();
}

uint64_t FigXPCMessageCreateBlockBufferData()
{
  return MEMORY[0x270EE8458]();
}

uint64_t FigXPCMessageSetBlockBuffer()
{
  return MEMORY[0x270EE8468]();
}

uint64_t FigXPCMessageSetFormatDescription()
{
  return MEMORY[0x270EE8488]();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x270EF4C38](aSurface);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x270EF4E38](xobj);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x270F795A8]();
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return MEMORY[0x270F79610]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x270F79650]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
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

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
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

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

uint64_t voucher_copy()
{
  return MEMORY[0x270EDBAD8]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD58](xarray, index);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x270EDBE48](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x270EDC0B8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x270EDC0D8]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x270EDC180](connection);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x270EDC198]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x270EDC1A0]();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return MEMORY[0x270EDC1B0]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x270EDC1B8]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x270EDC1C0]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}