void sub_218643204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2186450D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_218645338(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_218645784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218646208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21864692C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21864792C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218647B6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_218647DE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21864840C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2186487EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_218649018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_21864C9B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_21864D40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_21864EA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
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

void sub_21864EFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_21864F5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_218659924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_21865C880(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21865DF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21866007C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void OUTLINED_FUNCTION_5_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_218664678(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_218664CE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_2186706FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_218673CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_218673FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_21867F698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_21868039C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_2186817C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_218681CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_218682A10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

uint64_t LocalAuthenticationLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = LocalAuthenticationLibraryCore_frameworkLibrary;
  uint64_t v5 = LocalAuthenticationLibraryCore_frameworkLibrary;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_264330570;
    long long v7 = *(_OWORD *)&off_264330580;
    v3[3] = _sl_dlopen();
    LocalAuthenticationLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_218686124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __LocalAuthenticationLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  LocalAuthenticationLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t LocalAuthenticationLibrary()
{
  uint64_t v0 = LocalAuthenticationLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getLAContextClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getLAContextClass_softClass;
  uint64_t v7 = getLAContextClass_softClass;
  if (!getLAContextClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getLAContextClass_block_invoke;
    v3[3] = &unk_2643305C0;
    v3[4] = &v4;
    __getLAContextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2186862F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  LocalAuthenticationLibrary();
  Class result = objc_getClass("LAContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLAContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getLAContextClass_block_invoke_cold_1();
    return (Class)getLAEnvironmentClass(v3);
  }
  return result;
}

id getLAEnvironmentClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getLAEnvironmentClass_softClass;
  uint64_t v7 = getLAEnvironmentClass_softClass;
  if (!getLAEnvironmentClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getLAEnvironmentClass_block_invoke;
    v3[3] = &unk_2643305C0;
    v3[4] = &v4;
    __getLAEnvironmentClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_218686430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLAEnvironmentClass_block_invoke(uint64_t a1)
{
  LocalAuthenticationLibrary();
  Class result = objc_getClass("LAEnvironment");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLAEnvironmentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getLAEnvironmentClass_block_invoke_cold_1();
    return (Class)+[CDPDFollowUpFactory contextToIdentifierMap];
  }
  return result;
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_21868AC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __SetupAssistantLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_264330748;
    uint64_t v7 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
    if (SetupAssistantLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
LABEL_5:
  Class result = dlsym(v2, "BYSetupAssistantFinishedDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21868B444(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_21868C32C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t UserManagementLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = UserManagementLibraryCore_frameworkLibrary;
  uint64_t v5 = UserManagementLibraryCore_frameworkLibrary;
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_2643307B0;
    long long v7 = *(_OWORD *)&off_2643307C0;
    v3[3] = _sl_dlopen();
    UserManagementLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_21868F120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __UserManagementLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  UserManagementLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UserManagementLibrary()
{
  uint64_t v0 = UserManagementLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getUMUserManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getUMUserManagerClass_softClass;
  uint64_t v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_2643305C0;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21868F2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  UserManagementLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("UMUserManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUMUserManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUMUserManagerClass_block_invoke_cold_1();
    [(CDPDClientHandler *)v2 fetchEscrowRecordDevicesWithContext:v4 usingCache:v5 completion:v6];
  }
}

void sub_218691054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_218696BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_218699018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21869AB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_21869C720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2186A35EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void sub_2186A7114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
}

void sub_2186A8708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_2186A8BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2186A8C3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *__getMKBDeviceLockAssertionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __MobileKeyBagLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_264330E20;
    uint64_t v7 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    SEL v3 = (void *)v5[0];
    uint64_t v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
    if (MobileKeyBagLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      SEL v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "MKBDeviceLockAssertion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceLockAssertionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2186AB438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_2186ABDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v9 - 80));
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return v0;
}

uint64_t _networkReachabilityCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _networkReachabilityDidChangeWithFlags:a2];
}

uint64_t sub_2186B10BC()
{
  id v1 = objc_msgSend(v0, sel_escrowInformationMetadata);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  if (!objc_msgSend(v1, sel_hasBuild)
    || (id v3 = objc_msgSend(v2, sel_build)) == 0)
  {

    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = sub_2186D1A30();

  return v5;
}

void sub_2186B115C()
{
  id v1 = objc_msgSend(v0, sel_escrowInformationMetadata);
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = objc_msgSend(v1, sel_clientMetadata);

    if (!v3)
    {
      __break(1u);
      goto LABEL_11;
    }
    unsigned int v4 = objc_msgSend(v3, sel_hasDeviceMid);

    if (v4)
    {
      id v5 = objc_msgSend(v0, sel_escrowInformationMetadata);
      long long v6 = v5;
      if (v5)
      {
        id v7 = objc_msgSend(v5, sel_clientMetadata);

        if (v7)
        {
          id v8 = objc_msgSend(v7, sel_deviceMid);

          if (v8)
          {
            sub_2186D1A30();
          }
          return;
        }
LABEL_11:
        __break(1u);
      }
    }
  }
}

id sub_2186B1280()
{
  id v1 = objc_msgSend(v0, sel_escrowInformationMetadata);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_passcodeGeneration);
  if (v3)
  {
    unsigned int v4 = v3;
    if (objc_msgSend(v3, sel_hasValue)) {
      id v5 = objc_msgSend(v4, sel_value);
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
    unsigned int v4 = v2;
  }

  return v5;
}

uint64_t sub_2186B1340(uint64_t a1, uint64_t a2)
{
  return sub_2186B13A0(a1, a2, (SEL *)&selRef_hasLabel, (SEL *)&selRef_label);
}

uint64_t sub_2186B1354(uint64_t a1, uint64_t a2)
{
  return sub_2186B13A0(a1, a2, (SEL *)&selRef_hasRecordId, (SEL *)&selRef_recordId);
}

uint64_t sub_2186B1368()
{
  return sub_2186B10BC();
}

uint64_t sub_2186B138C(uint64_t a1, uint64_t a2)
{
  return sub_2186B13A0(a1, a2, (SEL *)&selRef_hasSerialNumber, (SEL *)&selRef_serialNumber);
}

uint64_t sub_2186B13A0(uint64_t a1, uint64_t a2, SEL *a3, SEL *a4)
{
  long long v6 = *v4;
  if (![v6 *a3]) {
    return 0;
  }
  id v7 = [v6 *a4];
  if (!v7) {
    return 0;
  }
  id v8 = v7;
  uint64_t v9 = sub_2186D1A30();

  return v9;
}

void sub_2186B141C()
{
}

id sub_2186B1440()
{
  return sub_2186B1280();
}

id sub_2186B1468()
{
  id v1 = *v0;
  id result = objc_msgSend(*v0, sel_hasRecordStatus);
  if (result) {
    return (id)(objc_msgSend(v1, sel_recordStatus) == 0);
  }
  return result;
}

id sub_2186B14B4()
{
  id v1 = *v0;
  id result = objc_msgSend(*v0, sel_hasRecordViability);
  if (result) {
    return (id)(objc_msgSend(v1, sel_recordViability) < 2);
  }
  return result;
}

uint64_t sub_2186B1500(uint64_t a1, uint64_t a2)
{
  uint64_t v56 = *(void *)(a1 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v49 - v8;
  uint64_t v10 = sub_2186D19E0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v49 - v15;
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  if (v18)
  {
    unint64_t v19 = v18;
    uint64_t v55 = v17;
    if (sub_2186D1A80())
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v34 = v10;
    uint64_t v35 = __swift_project_value_buffer(v10, (uint64_t)qword_267BD8760);
    uint64_t v36 = v11;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v35, v34);
    uint64_t v37 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v9, v2, a1);
    swift_bridgeObjectRetain();
    v38 = sub_2186D19C0();
    os_log_type_t v39 = sub_2186D1B40();
    LODWORD(v53) = v39;
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = swift_slowAlloc();
      unint64_t v51 = (unint64_t)"Daemon";
      uint64_t v41 = v40;
      uint64_t v42 = swift_slowAlloc();
      uint64_t v52 = v42;
      *(_DWORD *)uint64_t v41 = 141559043;
      uint64_t v57 = 1752392040;
      uint64_t v58 = v42;
      uint64_t v54 = v34;
      sub_2186D1B90();
      *(_WORD *)(v41 + 12) = 2081;
      v43 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
      os_log_t v50 = v38;
      uint64_t v44 = v43(a1, a2);
      if (v45)
      {
        unint64_t v46 = v45;
      }
      else
      {
        uint64_t v44 = 0x3E6C696E3CLL;
        unint64_t v46 = 0xE500000000000000;
      }
      uint64_t v57 = sub_2186BF898(v44, v46, &v58);
      sub_2186D1B90();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v9, a1);
      *(_WORD *)(v41 + 22) = 2160;
      uint64_t v57 = 1752392040;
      sub_2186D1B90();
      *(_WORD *)(v41 + 32) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_2186BF898(v55, v19, &v58);
      sub_2186D1B90();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v41 + 42) = 2080;
      uint64_t v57 = sub_2186BF898(0xD000000000000015, v51 | 0x8000000000000000, &v58);
      sub_2186D1B90();
      os_log_t v47 = v50;
      _os_log_impl(&dword_218640000, v50, (os_log_type_t)v53, "Unexpected record label for record %{private,mask.hash}s (Got: %{private,mask.hash}s, Expected: %s*", (uint8_t *)v41, 0x34u);
      uint64_t v48 = v52;
      swift_arrayDestroy();
      MEMORY[0x21D470490](v48, -1, -1);
      MEMORY[0x21D470490](v41, -1, -1);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v54);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v37 + 8))(v9, a1);

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v34);
    }
  }
  else
  {
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v21 = v10;
    uint64_t v22 = __swift_project_value_buffer(v10, (uint64_t)qword_267BD8760);
    uint64_t v23 = v11;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v22, v21);
    uint64_t v24 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v7, v2, a1);
    v25 = sub_2186D19C0();
    os_log_type_t v26 = sub_2186D1B50();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v54 = v21;
      uint64_t v28 = v27;
      uint64_t v29 = swift_slowAlloc();
      uint64_t v53 = v29;
      *(_DWORD *)uint64_t v28 = 141558275;
      uint64_t v57 = 1752392040;
      uint64_t v58 = v29;
      uint64_t v55 = v23;
      sub_2186D1B90();
      *(_WORD *)(v28 + 12) = 2081;
      uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
      if (v31)
      {
        unint64_t v32 = v31;
      }
      else
      {
        uint64_t v30 = 0x3E6C696E3CLL;
        unint64_t v32 = 0xE500000000000000;
      }
      uint64_t v57 = sub_2186BF898(v30, v32, &v58);
      sub_2186D1B90();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, a1);
      _os_log_impl(&dword_218640000, v25, v26, "No label found on record %{private,mask.hash}s", (uint8_t *)v28, 0x16u);
      uint64_t v33 = v53;
      swift_arrayDestroy();
      MEMORY[0x21D470490](v33, -1, -1);
      MEMORY[0x21D470490](v28, -1, -1);

      (*(void (**)(char *, uint64_t))(v55 + 8))(v14, v54);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, a1);

      (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v21);
    }
  }
  return 0;
}

uint64_t sub_2186B1C28(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a2 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v57 - v11;
  uint64_t v13 = sub_2186D19E0();
  uint64_t v64 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v62 = (char *)&v57 - v17;
  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  if (!v19)
  {
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v28 = __swift_project_value_buffer(v13, (uint64_t)qword_267BD8760);
    uint64_t v29 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v16, v28, v13);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v3, a2);
    uint64_t v30 = sub_2186D19C0();
    os_log_type_t v31 = sub_2186D1B50();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      v62 = (char *)v33;
      *(_DWORD *)uint64_t v32 = 141558275;
      uint64_t v65 = 1752392040;
      uint64_t v66 = v33;
      uint64_t v63 = v13;
      sub_2186D1B90();
      *(_WORD *)(v32 + 12) = 2081;
      uint64_t v34 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
      if (v35)
      {
        unint64_t v36 = v35;
      }
      else
      {
        uint64_t v34 = 0x3E6C696E3CLL;
        unint64_t v36 = 0xE500000000000000;
      }
      uint64_t v65 = sub_2186BF898(v34, v36, &v66);
      sub_2186D1B90();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, a2);
      _os_log_impl(&dword_218640000, v30, v31, "No serial found on record %{private,mask.hash}s", (uint8_t *)v32, 0x16u);
      uint64_t v37 = v62;
      swift_arrayDestroy();
      MEMORY[0x21D470490](v37, -1, -1);
      MEMORY[0x21D470490](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v64 + 8))(v16, v63);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, a2);

      (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v13);
    }
    return 0;
  }
  unint64_t v20 = v19;
  uint64_t v61 = v18;
  uint64_t v63 = v13;
  id v21 = objc_msgSend(a1, sel_serialNumber);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = sub_2186D1A30();
    uint64_t v25 = v24;

    if (v61 == v23 && v20 == v25)
    {
      swift_bridgeObjectRelease();
LABEL_25:
      swift_bridgeObjectRelease();
      return 1;
    }
    char v27 = sub_2186D1C60();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_25;
    }
  }
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v38 = v63;
  uint64_t v39 = __swift_project_value_buffer(v63, (uint64_t)qword_267BD8760);
  uint64_t v40 = v64;
  uint64_t v41 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v62, v39, v38);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v3, a2);
  uint64_t v42 = v41;
  id v43 = a1;
  swift_bridgeObjectRetain();
  uint64_t v44 = sub_2186D19C0();
  int v60 = sub_2186D1B40();
  if (!os_log_type_enabled(v44, (os_log_type_t)v60))
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, a2);

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v38);
    return 0;
  }
  os_log_t v59 = v44;
  uint64_t v45 = swift_slowAlloc();
  uint64_t v58 = swift_slowAlloc();
  uint64_t v65 = 1752392040;
  uint64_t v66 = v58;
  *(_DWORD *)uint64_t v45 = 141559299;
  sub_2186D1B90();
  *(_WORD *)(v45 + 12) = 2081;
  uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  if (v47)
  {
    unint64_t v48 = v47;
  }
  else
  {
    uint64_t v46 = 0x3E6C696E3CLL;
    unint64_t v48 = 0xE500000000000000;
  }
  uint64_t v65 = sub_2186BF898(v46, v48, &v66);
  sub_2186D1B90();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, a2);
  *(_WORD *)(v45 + 22) = 2160;
  uint64_t v65 = 1752392040;
  sub_2186D1B90();
  *(_WORD *)(v45 + 32) = 2081;
  id v49 = objc_msgSend(v43, sel_serialNumber);
  if (v49)
  {
    os_log_t v50 = v49;
    uint64_t v51 = sub_2186D1A30();
    unint64_t v53 = v52;

    uint64_t v65 = sub_2186BF898(v51, v53, &v66);
    sub_2186D1B90();

    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 42) = 2160;
    uint64_t v65 = 1752392040;
    sub_2186D1B90();
    *(_WORD *)(v45 + 52) = 2081;
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_2186BF898(v61, v20, &v66);
    sub_2186D1B90();
    swift_bridgeObjectRelease_n();
    os_log_t v54 = v59;
    _os_log_impl(&dword_218640000, v59, (os_log_type_t)v60, "Serial number did not match for record %{private,mask.hash}s (Got: %{private,mask.hash}s, Expected: %{private,mask.hash}s", (uint8_t *)v45, 0x3Eu);
    uint64_t v55 = v58;
    swift_arrayDestroy();
    MEMORY[0x21D470490](v55, -1, -1);
    MEMORY[0x21D470490](v45, -1, -1);

    (*(void (**)(char *, uint64_t))(v64 + 8))(v62, v63);
    return 0;
  }

  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2186B2418(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v67 = *(void *)(a2 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v66 = (char *)&v60 - v10;
  uint64_t v11 = sub_2186D19E0();
  uint64_t v12 = *(void (***)(char *, uint64_t, uint64_t))(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v60 - v16;
  id v18 = objc_msgSend(a1, sel_localSecretGeneration);
  if (v18)
  {
    unint64_t v19 = v18;
    id v20 = objc_msgSend(v18, sel_unsignedLongLongValue);

    id v21 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 48);
    uint64_t v22 = a2;
    uint64_t v65 = a3;
    uint64_t v23 = v21(a2, a3);
    if (v24)
    {
      if (qword_267BD7A70 != -1) {
        swift_once();
      }
      uint64_t v30 = __swift_project_value_buffer(v11, (uint64_t)qword_267BD8760);
      v12[2](v15, v30, v11);
      uint64_t v31 = v67;
      (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v9, v3, v22);
      uint64_t v32 = sub_2186D19C0();
      os_log_type_t v33 = sub_2186D1B40();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v64 = v11;
        uint64_t v66 = (char *)v12;
        uint64_t v35 = v34;
        uint64_t v36 = swift_slowAlloc();
        uint64_t v63 = v36;
        *(_DWORD *)uint64_t v35 = 141558275;
        uint64_t v68 = 1752392040;
        uint64_t v69 = v36;
        sub_2186D1B90();
        *(_WORD *)(v35 + 12) = 2081;
        uint64_t v37 = (*(uint64_t (**)(uint64_t))(v65 + 16))(v22);
        if (v38)
        {
          unint64_t v39 = v38;
        }
        else
        {
          uint64_t v37 = 0x3E6C696E3CLL;
          unint64_t v39 = 0xE500000000000000;
        }
        uint64_t v68 = sub_2186BF898(v37, v39, &v69);
        sub_2186D1B90();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v22);
        _os_log_impl(&dword_218640000, v32, v33, "No secret generation found on record with id %{private,mask.hash}s", (uint8_t *)v35, 0x16u);
        uint64_t v40 = v63;
        swift_arrayDestroy();
        MEMORY[0x21D470490](v40, -1, -1);
        MEMORY[0x21D470490](v35, -1, -1);

        (*((void (**)(char *, uint64_t))v66 + 1))(v15, v64);
        return 2;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v22);

        ((void (*)(char *, uint64_t))v12[1])(v15, v11);
        return 2;
      }
    }
    else
    {
      uint64_t v25 = v23;
      if (v20 == (id)v23)
      {
        return 5;
      }
      else
      {
        uint64_t v41 = (uint64_t)v20;
        if (qword_267BD7A70 != -1) {
          swift_once();
        }
        uint64_t v42 = __swift_project_value_buffer(v11, (uint64_t)qword_267BD8760);
        id v43 = v12;
        uint64_t v44 = v17;
        v12[2](v17, v42, v11);
        uint64_t v45 = v66;
        uint64_t v46 = v67;
        uint64_t v47 = v22;
        (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v66, v3, v22);
        unint64_t v48 = sub_2186D19C0();
        os_log_type_t v49 = sub_2186D1B40();
        int v50 = v49;
        if (os_log_type_enabled(v48, v49))
        {
          uint64_t v51 = swift_slowAlloc();
          uint64_t v62 = v41;
          uint64_t v52 = v51;
          uint64_t v53 = swift_slowAlloc();
          uint64_t v63 = v53;
          *(_DWORD *)uint64_t v52 = 141558787;
          uint64_t v68 = 1752392040;
          uint64_t v69 = v53;
          int v61 = v50;
          sub_2186D1B90();
          *(_WORD *)(v52 + 12) = 2081;
          os_log_t v54 = *(uint64_t (**)(uint64_t))(v65 + 16);
          os_log_t v60 = v48;
          uint64_t v55 = v54(v47);
          if (v56)
          {
            unint64_t v57 = v56;
          }
          else
          {
            uint64_t v55 = 0x3E6C696E3CLL;
            unint64_t v57 = 0xE500000000000000;
          }
          uint64_t v64 = v11;
          uint64_t v68 = sub_2186BF898(v55, v57, &v69);
          sub_2186D1B90();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v47);
          *(_WORD *)(v52 + 22) = 2048;
          uint64_t v68 = v25;
          sub_2186D1B90();
          *(_WORD *)(v52 + 32) = 2048;
          uint64_t v68 = v62;
          sub_2186D1B90();
          os_log_t v58 = v60;
          _os_log_impl(&dword_218640000, v60, (os_log_type_t)v61, "Secret generation mismatch for record with id %{private,mask.hash}s (Got: %llu Expected: %llu)", (uint8_t *)v52, 0x2Au);
          uint64_t v59 = v63;
          swift_arrayDestroy();
          MEMORY[0x21D470490](v59, -1, -1);
          MEMORY[0x21D470490](v52, -1, -1);

          ((void (*)(char *, uint64_t))v43[1])(v44, v64);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v47);

          ((void (*)(char *, uint64_t))v43[1])(v44, v11);
        }
        return 3;
      }
    }
  }
  else
  {
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v11, (uint64_t)qword_267BD8760);
    char v27 = sub_2186D19C0();
    os_log_type_t v28 = sub_2186D1B40();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_218640000, v27, v28, "No passcode generation data found on device", v29, 2u);
      MEMORY[0x21D470490](v29, -1, -1);
    }

    return 1;
  }
}

id sub_2186B2BBC(void *a1, void *a2)
{
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2186D19E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_267BD8760);
  sub_2186B49D8((uint64_t)a1, (uint64_t)v51);
  uint64_t v5 = sub_2186D19C0();
  os_log_type_t v6 = sub_2186D1B40();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 141558275;
    v48[0] = v8;
    sub_2186D1B90();
    *(_WORD *)(v7 + 12) = 2081;
    uint64_t v10 = v52;
    uint64_t v9 = v53;
    __swift_project_boxed_opaque_existential_1(v51, v52);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 16))(v10, v9);
    if (v12)
    {
      unint64_t v13 = v12;
    }
    else
    {
      uint64_t v11 = 0;
      unint64_t v13 = 0xE000000000000000;
    }
    sub_2186BF898(v11, v13, v48);
    sub_2186D1B90();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    _os_log_impl(&dword_218640000, v5, v6, "Evaluating record %{private,mask.hash}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D470490](v8, -1, -1);
    MEMORY[0x21D470490](v7, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  }

  uint64_t v14 = a1[3];
  uint64_t v15 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v14);
  char v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 56))(v14, v15);
  sub_2186B49D8((uint64_t)a1, (uint64_t)v51);
  if (v16)
  {
    uint64_t v17 = v52;
    uint64_t v18 = v53;
    __swift_project_boxed_opaque_existential_1(v51, v52);
    char v47 = sub_2186B1500(v17, v18);
  }
  else
  {
    char v47 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  uint64_t v19 = a1[3];
  uint64_t v20 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  char v21 = sub_2186B1C28(a2, v19, v20);
  uint64_t v22 = a1[3];
  uint64_t v23 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v22);
  (*(void (**)(uint64_t, uint64_t))(v23 + 40))(v22, v23);
  uint64_t v25 = v24;
  if (v24) {
    swift_bridgeObjectRelease();
  }
  uint64_t v26 = a1[3];
  uint64_t v27 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v26);
  char v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 56))(v26, v27);
  sub_2186B49D8((uint64_t)a1, (uint64_t)v48);
  uint64_t v29 = a2;
  if ((v28 & 1) == 0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
LABEL_19:
    uint64_t v33 = 3;
    if ((v21 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  uint64_t v30 = v49;
  uint64_t v31 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  char v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 64))(v30, v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
  if ((v32 & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v33 = 1;
  if ((v21 & 1) == 0)
  {
LABEL_17:
    uint64_t v34 = 0;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v35 = a1[3];
  uint64_t v36 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v35);
  uint64_t v34 = sub_2186B2418(v29, v35, v36);
LABEL_21:
  uint64_t v37 = a1[3];
  uint64_t v38 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v37);
  (*(void (**)(uint64_t, uint64_t))(v38 + 16))(v37, v38);
  if (v39)
  {
    uint64_t v40 = (void *)sub_2186D1A20();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v40 = 0;
  }
  uint64_t v41 = a1[3];
  uint64_t v42 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v41);
  (*(void (**)(uint64_t, uint64_t))(v42 + 24))(v41, v42);
  if (v43)
  {
    uint64_t v44 = (void *)sub_2186D1A20();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v44 = 0;
  }
  id v45 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRecordPresence_isValid_recordId_buildVersion_isForCurrentDevice_hasMachineId_recordViability_localSecretViability_tlkRecoveryViability_sosViability_pcsRecoveryViability_, 1, v47 & 1, v40, v44, v21 & 1, v25 != 0, v33, v34, 3, 3, 3);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v45;
}

void sub_2186B3084(uint64_t a1, NSObject *a2)
{
  unint64_t v4 = sub_2186D19E0();
  uint64_t v5 = *(void **)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v92 = (char *)&v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v97 = (char *)&v89 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v93 = (char *)&v89 - v11;
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = ((char *)&v89 - v12);
  if (qword_267BD7A70 != -1) {
    goto LABEL_77;
  }
  while (1)
  {
    uint64_t v14 = __swift_project_value_buffer(v4, (uint64_t)qword_267BD8760);
    uint64_t v15 = (char *)v5[2];
    uint64_t v100 = (uint64_t)(v5 + 2);
    v99 = v15;
    ((void (*)(NSObject *, NSObject *, unint64_t))v15)(v13, v14, v4);
    char v16 = a2;
    uint64_t v17 = sub_2186D19C0();
    os_log_type_t v18 = sub_2186D1B70();
    BOOL v19 = os_log_type_enabled(v17, v18);
    unint64_t v101 = v4;
    v102 = v5;
    os_log_t v103 = v14;
    if (v19)
    {
      uint64_t v20 = swift_slowAlloc();
      v98 = (void (*)(void, void))swift_slowAlloc();
      *(void *)&long long v109 = v98;
      *(_DWORD *)uint64_t v20 = 141558275;
      *(void *)&long long v107 = 1752392040;
      sub_2186D1B90();
      *(_WORD *)(v20 + 12) = 2081;
      id v21 = objc_msgSend(v16, sel_serialNumber);
      v104 = v16;
      if (!v21)
      {

        __break(1u);
LABEL_79:

        __break(1u);
LABEL_80:

        __break(1u);
LABEL_81:

        __break(1u);
        return;
      }
      uint64_t v22 = v21;
      uint64_t v23 = sub_2186D1A30();
      unint64_t v25 = v24;

      *(void *)&long long v107 = sub_2186BF898(v23, v25, (uint64_t *)&v109);
      sub_2186D1B90();
      uint64_t v26 = v104;

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_218640000, v17, v18, "Beginning account escrow record evaluation to find viable escrow records matching this device's serial number: %{private,mask.hash}s", (uint8_t *)v20, 0x16u);
      uint64_t v27 = v98;
      swift_arrayDestroy();
      MEMORY[0x21D470490](v27, -1, -1);
      MEMORY[0x21D470490](v20, -1, -1);

      unint64_t v4 = v101;
      v98 = (void (*)(void, void))v102[1];
      v98(v13, v101);
      char v16 = v26;
    }
    else
    {

      v98 = (void (*)(void, void))v5[1];
      v98(v13, v4);
    }
    swift_bridgeObjectRetain();
    char v28 = sub_2186D19C0();
    os_log_type_t v29 = sub_2186D1B40();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 134217984;
      *(void *)&long long v109 = *(void *)(a1 + 16);
      sub_2186D1B90();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_218640000, v28, v29, "Starting with %ld records", v30, 0xCu);
      MEMORY[0x21D470490](v30, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    uint64_t v31 = v16;
    swift_bridgeObjectRetain_n();
    v104 = v31;
    unint64_t v13 = sub_2186D19C0();
    int v32 = sub_2186D1B40();
    if (!os_log_type_enabled(v13, (os_log_type_t)v32))
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_37;
    }
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = v33;
    *(_DWORD *)uint64_t v33 = 134217984;
    unint64_t v4 = *(void *)(a1 + 16);
    if (!v4) {
      break;
    }
    v89 = v33;
    int v90 = v32;
    v91 = v13;
    unint64_t v13 = sub_2186B4B00(0, &qword_267BD7B80);
    uint64_t v35 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v36 = 0;
    while (1)
    {
      sub_2186B49D8(v35, (uint64_t)&v109);
      sub_2186B49D8((uint64_t)&v109, (uint64_t)&v107);
      uint64_t v37 = v104;
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_2186B2BBC(&v107, v37);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v109);
      swift_bridgeObjectRelease();
      unsigned __int8 v38 = objc_msgSend(v5, sel_isForCurrentDevice);

      if (v38) {
        break;
      }
      ++v36;
      v35 += 40;
      if (v4 == v36) {
        goto LABEL_21;
      }
    }
    if (v4 >= v36)
    {
      if (v4 == v36)
      {
LABEL_21:
        swift_bridgeObjectRelease_n();
        a2 = 0;
LABEL_35:
        unint64_t v13 = v91;
        LOBYTE(v32) = v90;
        uint64_t v34 = v89;
        goto LABEL_36;
      }
      uint64_t v39 = 1;
      unint64_t v40 = v4;
    }
    else
    {
      uint64_t v39 = -1;
      unint64_t v40 = v36;
      uint64_t v36 = v4;
    }
    a2 = 0;
    uint64_t v96 = a1 + 72;
    uint64_t v95 = v39;
    unint64_t v94 = v40;
    while (1)
    {
      BOOL v41 = __OFADD__(a2, v39);
      a2 = ((char *)a2 + v39);
      if (v41) {
        break;
      }
      if (v36 == v4) {
        goto LABEL_76;
      }
      unint64_t v42 = v4;
      if (v36 + 1 != v4)
      {
        uint64_t v43 = v96 + 40 * v36;
        unint64_t v42 = v36 + 1;
        while (v36 >= -1)
        {
          if (v42 >= *(void *)(a1 + 16)) {
            goto LABEL_72;
          }
          sub_2186B49D8(v43, (uint64_t)&v109);
          sub_2186B49D8((uint64_t)&v109, (uint64_t)&v107);
          uint64_t v44 = v37;
          swift_bridgeObjectRetain();
          uint64_t v5 = sub_2186B2BBC(&v107, v44);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v109);
          swift_bridgeObjectRelease();
          unsigned __int8 v45 = objc_msgSend(v5, sel_isForCurrentDevice);

          if (v45) {
            goto LABEL_23;
          }
          ++v42;
          v43 += 40;
          if (v4 == v42)
          {
            unint64_t v42 = v4;
LABEL_23:
            uint64_t v39 = v95;
            unint64_t v40 = v94;
            goto LABEL_24;
          }
        }
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
        break;
      }
LABEL_24:
      uint64_t v36 = v42;
      if (v42 == v40)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_35;
      }
    }
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    swift_once();
  }
  swift_bridgeObjectRelease();
  a2 = 0;
LABEL_36:
  *(void *)&long long v109 = a2;
  sub_2186D1B90();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_218640000, v13, (os_log_type_t)v32, "Found %ld records for current device", v34, 0xCu);
  MEMORY[0x21D470490](v34, -1, -1);

  unint64_t v4 = v101;
LABEL_37:
  uint64_t v5 = *(void **)(a1 + 16);
  uint64_t v46 = a1 + 32;
  swift_bridgeObjectRetain();
  unint64_t v47 = 0;
  a2 = &qword_267BD7B80;
  while (1)
  {
    if ((void *)v47 == v5)
    {
      uint64_t v111 = 0;
      long long v110 = 0u;
      unint64_t v47 = (unint64_t)v5;
      long long v109 = 0u;
    }
    else
    {
      if (v47 >= *(void *)(a1 + 16)) {
        goto LABEL_73;
      }
      sub_2186B49D8(v46 + 40 * v47++, (uint64_t)&v109);
    }
    sub_2186B4A3C((uint64_t)&v109, (uint64_t)&v107);
    if (!v108)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      unint64_t v66 = 0;
      while (1)
      {
        if ((void *)v66 == v5)
        {
          uint64_t v111 = 0;
          long long v110 = 0u;
          unint64_t v66 = (unint64_t)v5;
          long long v109 = 0u;
        }
        else
        {
          if (v66 >= *(void *)(a1 + 16)) {
            goto LABEL_74;
          }
          sub_2186B49D8(v46 + 40 * v66++, (uint64_t)&v109);
        }
        sub_2186B4A3C((uint64_t)&v109, (uint64_t)&v107);
        if (!v108)
        {
          swift_bridgeObjectRelease();
          v77 = v97;
          ((void (*)(char *, os_log_t, unint64_t))v99)(v97, v103, v4);
          a2 = v104;
          v78 = sub_2186D19C0();
          int v79 = sub_2186D1B50();
          if (os_log_type_enabled(v78, (os_log_type_t)v79))
          {
            LODWORD(v103) = v79;
            uint64_t v17 = swift_slowAlloc();
            uint64_t v100 = swift_slowAlloc();
            *(void *)&long long v109 = v100;
            LODWORD(v17->isa) = 141558275;
            *(void *)&long long v107 = 1752392040;
            sub_2186D1B90();
            WORD2(v17[1].isa) = 2081;
            id v80 = [a2 serialNumber];
            if (!v80) {
              goto LABEL_79;
            }
            v81 = v80;
            uint64_t v82 = sub_2186D1A30();
            unint64_t v84 = v83;

            *(void *)&long long v107 = sub_2186BF898(v82, v84, (uint64_t *)&v109);
            sub_2186D1B90();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_218640000, v78, (os_log_type_t)v103, "No records found for device with serial number %{private,mask.hash}s", (uint8_t *)v17, 0x16u);
            uint64_t v85 = v100;
            swift_arrayDestroy();
            MEMORY[0x21D470490](v85, -1, -1);
            MEMORY[0x21D470490](v17, -1, -1);

            v86 = v97;
          }
          else
          {

            v86 = v77;
          }
          v98(v86, v4);
          id v87 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          a2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F34380]), sel_initWithDefaultValues);
          objc_msgSend(v87, sel_initWithDeviceStatus_, a2);
          goto LABEL_70;
        }
        sub_2186B4AE8(&v107, (uint64_t)v106);
        unint64_t v13 = sub_2186B4B00(0, &qword_267BD7B80);
        sub_2186B49D8((uint64_t)v106, (uint64_t)v105);
        uint64_t v67 = v104;
        a2 = sub_2186B2BBC(v105, v67);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v106);
        if ([a2 isForCurrentDevice])
        {
          if ([a2 recordIsValid]) {
            break;
          }
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v49 = v92;
      ((void (*)(char *, os_log_t, unint64_t))v99)(v92, v103, v4);
      uint64_t v17 = v67;
      uint64_t v68 = sub_2186D19C0();
      int v69 = sub_2186D1B70();
      if (!os_log_type_enabled(v68, (os_log_type_t)v69))
      {

        goto LABEL_68;
      }
      LODWORD(v103) = v69;
      uint64_t v70 = swift_slowAlloc();
      uint64_t v100 = swift_slowAlloc();
      *(void *)&long long v109 = v100;
      *(_DWORD *)uint64_t v70 = 141558275;
      *(void *)&long long v107 = 1752392040;
      v99 = (char *)&v107 + 8;
      sub_2186D1B90();
      *(_WORD *)(v70 + 12) = 2081;
      id v71 = [v17 serialNumber];
      if (!v71) {
        goto LABEL_81;
      }
      v72 = v71;
      uint64_t v73 = sub_2186D1A30();
      unint64_t v75 = v74;

      *(void *)&long long v107 = sub_2186BF898(v73, v75, (uint64_t *)&v109);
      sub_2186D1B90();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_218640000, v68, (os_log_type_t)v103, "Records found but none were viable for device with serial number %{private,mask.hash}s", (uint8_t *)v70, 0x16u);
      uint64_t v76 = v100;
      swift_arrayDestroy();
      MEMORY[0x21D470490](v76, -1, -1);
      MEMORY[0x21D470490](v70, -1, -1);

      uint64_t v65 = v92;
      goto LABEL_69;
    }
    sub_2186B4AE8(&v107, (uint64_t)v106);
    sub_2186B4B00(0, &qword_267BD7B80);
    sub_2186B49D8((uint64_t)v106, (uint64_t)v105);
    unint64_t v48 = v104;
    unint64_t v13 = sub_2186B2BBC(v105, v48);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v106);
    if ([v13 isForCurrentDevice])
    {
      if ([v13 localViability] == (id)1) {
        break;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v49 = v93;
  ((void (*)(char *, os_log_t, unint64_t))v99)(v93, v103, v4);
  uint64_t v50 = v48;
  uint64_t v51 = v13;
  uint64_t v17 = v50;
  a2 = v51;
  uint64_t v52 = sub_2186D19C0();
  int v53 = sub_2186D1B70();
  if (os_log_type_enabled(v52, (os_log_type_t)v53))
  {
    LODWORD(v97) = v53;
    os_log_t v103 = v52;
    uint64_t v54 = swift_slowAlloc();
    uint64_t v55 = (char *)swift_slowAlloc();
    uint64_t v100 = swift_slowAlloc();
    *(void *)&long long v109 = v100;
    *(_DWORD *)uint64_t v54 = 138412803;
    *(void *)&long long v107 = a2;
    unint64_t v56 = a2;
    sub_2186D1B90();
    v99 = v55;
    *(void *)uint64_t v55 = a2;

    *(_WORD *)(v54 + 12) = 2160;
    *(void *)&long long v107 = 1752392040;
    sub_2186D1B90();
    *(_WORD *)(v54 + 22) = 2081;
    id v57 = [v17 serialNumber];
    if (!v57) {
      goto LABEL_80;
    }
    os_log_t v58 = v57;
    uint64_t v59 = sub_2186D1A30();
    unint64_t v61 = v60;

    *(void *)&long long v107 = sub_2186BF898(v59, v61, (uint64_t *)&v109);
    sub_2186D1B90();

    swift_bridgeObjectRelease();
    os_log_t v62 = v103;
    _os_log_impl(&dword_218640000, v103, (os_log_type_t)v97, "Found viable record: %@ for device with serial number %{private,mask.hash}s", (uint8_t *)v54, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7B88);
    uint64_t v63 = v99;
    swift_arrayDestroy();
    MEMORY[0x21D470490](v63, -1, -1);
    uint64_t v64 = v100;
    swift_arrayDestroy();
    MEMORY[0x21D470490](v64, -1, -1);
    MEMORY[0x21D470490](v54, -1, -1);

    uint64_t v65 = v93;
  }
  else
  {

LABEL_68:
    uint64_t v65 = v49;
  }
LABEL_69:
  v98(v65, v4);
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithDeviceStatus_, a2);
LABEL_70:

  swift_bridgeObjectRelease_n();
  v88 = v104;
}

uint64_t sub_2186B4194(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2186D1C20();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t result = sub_2186B47A4(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = v17;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = MEMORY[0x21D46F650](v5, a1);
        uint64_t v17 = v3;
        unint64_t v8 = *(void *)(v3 + 16);
        unint64_t v7 = *(void *)(v3 + 24);
        if (v8 >= v7 >> 1)
        {
          sub_2186B47A4(v7 > 1, v8 + 1, 1);
          uint64_t v3 = v17;
        }
        ++v5;
        uint64_t v15 = sub_2186B4B00(0, (unint64_t *)&qword_267BD7B70);
        char v16 = &off_26C9BC0C0;
        *(void *)&long long v14 = v6;
        *(void *)(v3 + 16) = v8 + 1;
        sub_2186B4AE8(&v14, v3 + 40 * v8 + 32);
      }
      while (v2 != v5);
    }
    else
    {
      uint64_t v9 = (void **)(a1 + 32);
      do
      {
        uint64_t v10 = *v9;
        uint64_t v17 = v3;
        unint64_t v12 = *(void *)(v3 + 16);
        unint64_t v11 = *(void *)(v3 + 24);
        id v13 = v10;
        if (v12 >= v11 >> 1)
        {
          sub_2186B47A4(v11 > 1, v12 + 1, 1);
          uint64_t v3 = v17;
        }
        uint64_t v15 = sub_2186B4B00(0, (unint64_t *)&qword_267BD7B70);
        char v16 = &off_26C9BC0C0;
        *(void *)&long long v14 = v13;
        *(void *)(v3 + 16) = v12 + 1;
        sub_2186B4AE8(&v14, v3 + 40 * v12 + 32);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2186B4388(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_2186B4B00(0, (unint64_t *)&qword_267BD7B70);
  unint64_t v5 = sub_2186D1AB0();
  swift_getObjectType();
  uint64_t v6 = a4;
  uint64_t v7 = sub_2186B4194(v5);
  swift_bridgeObjectRelease();
  sub_2186B3084(v7, v6);
  uint64_t v9 = v8;
  swift_deallocPartialClassInstance();
  return v9;
}

uint64_t variable initialization expression of CDPEscapeOffersLedger._escapeOffersPresented()
{
  return 1;
}

uint64_t variable initialization expression of CDPEscapeOffersLedger._manateeRepaired()
{
  return 0;
}

void type metadata accessor for CDPRemoteApprovalEscapeOfferMask(uint64_t a1)
{
}

void type metadata accessor for CDPContextType(uint64_t a1)
{
}

void type metadata accessor for CDPEDPState(uint64_t a1)
{
}

void *sub_2186B4488@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_2186B4494@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2186B44A4(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_2186B44B0(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_2186B44B8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_2186B44CC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_2186B44E0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_2186B44F4(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_2186B4524@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_2186B4550@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_2186B4574(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_2186B4588(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_2186B459C(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_2186B45B0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_2186B45C4(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_2186B45D8(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_2186B45EC(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_2186B4600()
{
  return *v0 == 0;
}

uint64_t sub_2186B4610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_2186B4628(void *result)
{
  *v1 &= ~*result;
  return result;
}

BOOL sub_2186B463C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2186B4650@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_2186B4968(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_2186B4690()
{
  return sub_2186B46F8(&qword_267BD7A90);
}

uint64_t sub_2186B46C4()
{
  return sub_2186B46F8(&qword_267BD7A98);
}

uint64_t sub_2186B46F8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CDPRemoteApprovalEscapeOfferMask(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2186B473C()
{
  return sub_2186B46F8(&qword_267BD7AA0);
}

uint64_t sub_2186B4770()
{
  return sub_2186B46F8(&qword_267BD7AA8);
}

uint64_t sub_2186B47A4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2186B47C4(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2186B47C4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7B90);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7B98);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2186D1C40();
  __break(1u);
  return result;
}

uint64_t sub_2186B4968(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2186B49D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2186B4A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

uint64_t sub_2186B4AE8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2186B4B00(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void type metadata accessor for CDPRPDType(uint64_t a1)
{
}

void type metadata accessor for CDPStateError(uint64_t a1)
{
}

void sub_2186B4BFC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t CDPRemoteApprovalEscapeOfferMask.description.getter(__int16 a1)
{
  if ((a1 & 1) == 0)
  {
    long long v2 = (void *)MEMORY[0x263F8EE78];
    if ((a1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  long long v2 = sub_2186B5250(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    long long v2 = sub_2186B5250((void *)(v3 > 1), v4 + 1, 1, v2);
  }
  v2[2] = v4 + 1;
  uint64_t v5 = &v2[2 * v4];
  v5[4] = 1701736302;
  v5[5] = 0xE400000000000000;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v2 = sub_2186B5250(0, v2[2] + 1, 1, v2);
    }
    unint64_t v7 = v2[2];
    unint64_t v6 = v2[3];
    if (v7 >= v6 >> 1) {
      long long v2 = sub_2186B5250((void *)(v6 > 1), v7 + 1, 1, v2);
    }
    v2[2] = v7 + 1;
    uint64_t v8 = (char *)&v2[2 * v7];
    strcpy(v8 + 32, "otherDevices");
    v8[45] = 0;
    *((_WORD *)v8 + 23) = -5120;
  }
LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v2 = sub_2186B5250(0, v2[2] + 1, 1, v2);
    }
    unint64_t v10 = v2[2];
    unint64_t v9 = v2[3];
    if (v10 >= v9 >> 1) {
      long long v2 = sub_2186B5250((void *)(v9 > 1), v10 + 1, 1, v2);
    }
    v2[2] = v10 + 1;
    size_t v11 = (char *)&v2[2 * v10];
    strcpy(v11 + 32, "remoteApproval");
    v11[47] = -18;
    if ((a1 & 8) == 0)
    {
LABEL_14:
      if ((a1 & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_27;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_14;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    long long v2 = sub_2186B5250(0, v2[2] + 1, 1, v2);
  }
  unint64_t v13 = v2[2];
  unint64_t v12 = v2[3];
  if (v13 >= v12 >> 1) {
    long long v2 = sub_2186B5250((void *)(v12 > 1), v13 + 1, 1, v2);
  }
  v2[2] = v13 + 1;
  long long v14 = (char *)&v2[2 * v13];
  strcpy(v14 + 32, "accountReset");
  v14[45] = 0;
  *((_WORD *)v14 + 23) = -5120;
  if ((a1 & 0x10) == 0)
  {
LABEL_15:
    if ((a1 & 0x20) == 0) {
      goto LABEL_37;
    }
    goto LABEL_32;
  }
LABEL_27:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    long long v2 = sub_2186B5250(0, v2[2] + 1, 1, v2);
  }
  unint64_t v16 = v2[2];
  unint64_t v15 = v2[3];
  if (v16 >= v15 >> 1) {
    long long v2 = sub_2186B5250((void *)(v15 > 1), v16 + 1, 1, v2);
  }
  v2[2] = v16 + 1;
  uint64_t v17 = &v2[2 * v16];
  v17[4] = 1885956979;
  v17[5] = 0xE400000000000000;
  if ((a1 & 0x20) != 0)
  {
LABEL_32:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v2 = sub_2186B5250(0, v2[2] + 1, 1, v2);
    }
    unint64_t v19 = v2[2];
    unint64_t v18 = v2[3];
    if (v19 >= v18 >> 1) {
      long long v2 = sub_2186B5250((void *)(v18 > 1), v19 + 1, 1, v2);
    }
    v2[2] = v19 + 1;
    uint64_t v20 = &v2[2 * v19];
    v20[4] = 0x797265766F636572;
    v20[5] = 0xEB0000000079654BLL;
  }
LABEL_37:
  if ((a1 & 0x40) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v2 = sub_2186B5250(0, v2[2] + 1, 1, v2);
    }
    unint64_t v22 = v2[2];
    unint64_t v21 = v2[3];
    if (v22 >= v21 >> 1) {
      long long v2 = sub_2186B5250((void *)(v21 > 1), v22 + 1, 1, v2);
    }
    v2[2] = v22 + 1;
    uint64_t v23 = &v2[2 * v22];
    v23[4] = 0xD000000000000011;
    v23[5] = 0x80000002186F1B80;
    if ((a1 & 0x80) == 0)
    {
LABEL_39:
      if ((a1 & 0x100) == 0) {
        goto LABEL_56;
      }
      goto LABEL_51;
    }
  }
  else if ((a1 & 0x80) == 0)
  {
    goto LABEL_39;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    long long v2 = sub_2186B5250(0, v2[2] + 1, 1, v2);
  }
  unint64_t v25 = v2[2];
  unint64_t v24 = v2[3];
  if (v25 >= v24 >> 1) {
    long long v2 = sub_2186B5250((void *)(v24 > 1), v25 + 1, 1, v2);
  }
  v2[2] = v25 + 1;
  uint64_t v26 = (char *)&v2[2 * v25];
  strcpy(v26 + 32, "piggybacking");
  v26[45] = 0;
  *((_WORD *)v26 + 23) = -5120;
  if ((a1 & 0x100) != 0)
  {
LABEL_51:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v2 = sub_2186B5250(0, v2[2] + 1, 1, v2);
    }
    unint64_t v28 = v2[2];
    unint64_t v27 = v2[3];
    if (v28 >= v27 >> 1) {
      long long v2 = sub_2186B5250((void *)(v27 > 1), v28 + 1, 1, v2);
    }
    v2[2] = v28 + 1;
    os_log_type_t v29 = &v2[2 * v28];
    v29[4] = 0xD000000000000010;
    v29[5] = 0x80000002186F1B60;
  }
LABEL_56:
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7C10);
  sub_2186B51AC();
  uint64_t v30 = sub_2186D1A10();
  swift_bridgeObjectRelease();
  return v30;
}

__C::CDPRemoteApprovalEscapeOfferMask __swiftcall CDPRemoteApprovalEscapeOfferMask.removing(_:)(__C::CDPRemoteApprovalEscapeOfferMask a1)
{
  Swift::UInt v2 = -1;
  if ((v1 & a1.rawValue) != 0) {
    Swift::UInt v2 = ~a1.rawValue;
  }
  return (__C::CDPRemoteApprovalEscapeOfferMask)(v2 & v1);
}

uint64_t sub_2186B51A4()
{
  return CDPRemoteApprovalEscapeOfferMask.description.getter(*v0);
}

unint64_t sub_2186B51AC()
{
  unint64_t result = qword_267BD7C18;
  if (!qword_267BD7C18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BD7C10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BD7C18);
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

void *sub_2186B5250(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7C28);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2186B5470(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2186B5360(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7C20);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2186B5564(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2186B5470(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2186D1C40();
  __break(1u);
  return result;
}

char *sub_2186B5564(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_2186D1C40();
  __break(1u);
  return result;
}

uint64_t CDPEDPState.description.getter(unint64_t a1)
{
  if (a1 < 3) {
    return *(void *)&aUnknown_1[8 * a1];
  }
  type metadata accessor for CDPEDPState(0);
  uint64_t result = sub_2186D1C70();
  __break(1u);
  return result;
}

uint64_t sub_2186B56C0()
{
  return CDPEDPState.description.getter(*v0);
}

void sub_2186B57DC(uint64_t a1)
{
  if (!a1)
  {
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_2186D19E0();
    __swift_project_value_buffer(v17, (uint64_t)qword_267BD8760);
    id v66 = v1;
    unint64_t v18 = sub_2186D19C0();
    os_log_type_t v19 = sub_2186D1B60();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      v68[0] = v21;
      *(_DWORD *)uint64_t v20 = 136446210;
      id v22 = v66;
      id v23 = objc_msgSend(v22, sel_description);
      uint64_t v24 = sub_2186D1A30();
      unint64_t v26 = v25;

      sub_2186BF898(v24, v26, v68);
      sub_2186D1B90();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_218640000, v18, v19, "%{public}s received a nil eventName", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D470490](v21, -1, -1);
      MEMORY[0x21D470490](v20, -1, -1);

      return;
    }

    goto LABEL_27;
  }
  uint64_t v4 = sub_2186D1A60();
  unint64_t v5 = v3;
  if ((v4 != 0xD000000000000024 || v3 != 0x80000002186F1C50) && (sub_2186D1C60() & 1) == 0)
  {
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_2186D19E0();
    __swift_project_value_buffer(v38, (uint64_t)qword_267BD8760);
    id v66 = v1;
    swift_bridgeObjectRetain();
    unint64_t v28 = sub_2186D19C0();
    os_log_type_t v29 = sub_2186D1B30();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      v68[0] = v31;
      *(_DWORD *)uint64_t v30 = 136446466;
      id v39 = v66;
      id v40 = objc_msgSend(v39, sel_description);
      uint64_t v41 = sub_2186D1A30();
      unint64_t v43 = v42;

      sub_2186BF898(v41, v43, v68);
      sub_2186D1B90();

      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2082;
      swift_bridgeObjectRetain();
      sub_2186BF898(v4, v5, v68);
      sub_2186D1B90();
      swift_bridgeObjectRelease_n();
      uint64_t v37 = "%{public}s ignoring notification event %{public}s";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (!objc_msgSend(v1, sel_currentDeviceIsUnlocked))
  {
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_2186D19E0();
    __swift_project_value_buffer(v27, (uint64_t)qword_267BD8760);
    id v66 = v1;
    swift_bridgeObjectRetain();
    unint64_t v28 = sub_2186D19C0();
    os_log_type_t v29 = sub_2186D1B40();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      v68[0] = v31;
      *(_DWORD *)uint64_t v30 = 136446466;
      id v32 = v66;
      id v33 = objc_msgSend(v32, sel_description);
      uint64_t v34 = sub_2186D1A30();
      unint64_t v36 = v35;

      sub_2186BF898(v34, v36, v68);
      sub_2186D1B90();

      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2082;
      swift_bridgeObjectRetain();
      sub_2186BF898(v4, v5, v68);
      sub_2186D1B90();
      swift_bridgeObjectRelease_n();
      uint64_t v37 = "%{public}s ignoring event %{public}s because device is not unlocked";
LABEL_25:
      _os_log_impl(&dword_218640000, v28, v29, v37, (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21D470490](v31, -1, -1);
      MEMORY[0x21D470490](v30, -1, -1);

      return;
    }
LABEL_26:

    swift_bridgeObjectRelease_n();
LABEL_27:

    return;
  }
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2186D19E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_267BD8760);
  uint64_t v7 = v1;
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_2186D19C0();
  os_log_type_t v9 = sub_2186D1B30();
  if (!os_log_type_enabled((os_log_t)v8, v9))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_31;
  }
  log = v8;
  uint64_t v8 = swift_slowAlloc();
  uint64_t v62 = swift_slowAlloc();
  v68[0] = v62;
  *(_DWORD *)uint64_t v8 = 136446722;
  Swift::UInt v2 = v7;
  id v10 = objc_msgSend(v2, sel_description);
  uint64_t v11 = sub_2186D1A30();
  unint64_t v13 = v12;

  sub_2186BF898(v11, v13, v68);
  sub_2186D1B90();

  swift_bridgeObjectRelease();
  *(_WORD *)(v8 + 12) = 2082;
  swift_bridgeObjectRetain();
  sub_2186BF898(v4, v5, v68);
  sub_2186D1B90();
  swift_bridgeObjectRelease_n();
  *(_WORD *)(v8 + 22) = 2050;
  long long v14 = &v2[OBJC_IVAR___CDPDUnlockObserver_listeners];
  swift_beginAccess();
  unint64_t v15 = *(void *)v14;
  if (v15 >> 62) {
    goto LABEL_45;
  }
  uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);

  while (1)
  {
    uint64_t v67 = v16;
    sub_2186D1B90();

    _os_log_impl(&dword_218640000, log, v9, "%{public}s recognizes event name %{public}s as unlocked. Notifying %{public}ld listeners.", (uint8_t *)v8, 0x20u);
    os_log_type_t v9 = v62;
    swift_arrayDestroy();
    MEMORY[0x21D470490](v62, -1, -1);
    MEMORY[0x21D470490](v8, -1, -1);

LABEL_31:
    uint64_t v44 = &v7[OBJC_IVAR___CDPDUnlockObserver_listeners];
    swift_beginAccess();
    unint64_t v45 = *(void *)v44;
    if (v45 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_2186D1C20();
      if (!v46) {
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v46 = *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v46) {
        goto LABEL_43;
      }
    }
    if (v46 >= 1) {
      break;
    }
    __break(1u);
LABEL_45:
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_2186D1C20();

    swift_bridgeObjectRelease();
  }
  uint64_t v47 = 0;
  unint64_t v48 = v45 & 0xC000000000000001;
  uint64_t v49 = &selRef_setService_;
  unint64_t v61 = v45 & 0xC000000000000001;
  unint64_t v63 = v45;
  do
  {
    if (v48)
    {
      uint64_t v50 = (void *)MEMORY[0x21D46F650](v47, v45);
    }
    else
    {
      uint64_t v50 = *(void **)(v45 + 8 * v47 + 32);
      swift_unknownObjectRetain();
    }
    swift_unknownObjectRetain_n();
    uint64_t v51 = sub_2186D19C0();
    os_log_type_t v52 = sub_2186D1B40();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = swift_slowAlloc();
      os_log_t loga = (os_log_t)swift_slowAlloc();
      uint64_t v67 = (uint64_t)loga;
      *(_DWORD *)uint64_t v53 = 136446210;
      uint64_t v54 = v49;
      id v55 = objc_msgSend(v50, sel_description);
      uint64_t v56 = v46;
      uint64_t v57 = sub_2186D1A30();
      unint64_t v59 = v58;

      uint64_t v49 = v54;
      uint64_t v60 = v57;
      uint64_t v46 = v56;
      *(void *)(v53 + 4) = sub_2186BF898(v60, v59, &v67);
      swift_unknownObjectRelease_n();
      unint64_t v45 = v63;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_218640000, v51, v52, "Notifying listener %{public}s", (uint8_t *)v53, 0xCu);
      swift_arrayDestroy();
      unint64_t v48 = v61;
      MEMORY[0x21D470490](loga, -1, -1);
      MEMORY[0x21D470490](v53, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    ++v47;
    [v50 v49[341]];
    swift_unknownObjectRelease();
  }
  while (v46 != v47);
LABEL_43:
  swift_bridgeObjectRelease();
}

BOOL sub_2186B6364()
{
  int v1 = MKBGetDeviceLockState();
  if (v1)
  {
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2186D19E0();
    __swift_project_value_buffer(v2, (uint64_t)qword_267BD8760);
    id v3 = v0;
    uint64_t v4 = sub_2186D19C0();
    os_log_type_t v5 = sub_2186D1B40();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v14 = v7;
      *(_DWORD *)uint64_t v6 = 136446466;
      id v8 = v3;
      id v9 = objc_msgSend(v8, sel_description);
      uint64_t v10 = sub_2186D1A30();
      unint64_t v12 = v11;

      sub_2186BF898(v10, v12, &v14);
      sub_2186D1B90();

      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 1026;
      sub_2186D1B90();
      _os_log_impl(&dword_218640000, v4, v5, "%{public}s device is not unlocked. Found lock state %{public}d.", (uint8_t *)v6, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x21D470490](v7, -1, -1);
      MEMORY[0x21D470490](v6, -1, -1);
    }
    else
    {
    }
  }
  return v1 == 0;
}

unint64_t type metadata accessor for CDPDUnlockObserver()
{
  unint64_t result = qword_267BD7C48;
  if (!qword_267BD7C48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BD7C48);
  }
  return result;
}

uint64_t sub_2186B662C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_2186B665C()
{
  uint64_t v0 = sub_2186D19E0();
  __swift_allocate_value_buffer(v0, qword_267BD8760);
  __swift_project_value_buffer(v0, (uint64_t)qword_267BD8760);
  return sub_2186D19D0();
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

uint64_t sub_2186B6808()
{
  *(void *)(v1 + 184) = v0;
  return MEMORY[0x270FA2498](sub_2186B6828, 0, 0);
}

uint64_t sub_2186B6828()
{
  id v1 = objc_msgSend(*(id *)(v0[23] + OBJC_IVAR___CDPDRPDExecutor_ledger), sel_manateeRPDBlockingError);
  if (!v1)
  {
LABEL_4:
    uint64_t v3 = *(void **)(v0[23] + OBJC_IVAR___CDPDRPDExecutor_sbDeleter);
    v0[10] = v0;
    v0[15] = v0 + 27;
    v0[11] = sub_2186B6A80;
    uint64_t v4 = swift_continuation_init();
    v0[18] = MEMORY[0x263EF8330];
    v0[19] = 0x40000000;
    v0[20] = sub_2186B74A0;
    v0[21] = &block_descriptor_16;
    v0[22] = v4;
    objc_msgSend(v3, sel_deleteAllBackupRecordsWithCompletion_, v0 + 18);
    return MEMORY[0x270FA23F0](v0 + 10);
  }
  uint64_t v2 = v1;
  if (objc_msgSend(*(id *)(v0[23] + OBJC_IVAR___CDPDRPDExecutor_cdpContext), sel__forceManateeReset))
  {

    goto LABEL_4;
  }
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2186D19E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_267BD8760);
  uint64_t v6 = sub_2186D19C0();
  os_log_type_t v7 = sub_2186D1B30();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_218640000, v6, v7, "CDPDRPDExecutor: Manatee RPD is not permitted...", v8, 2u);
    MEMORY[0x21D470490](v8, -1, -1);
  }

  swift_willThrow();
  id v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_2186B6A80()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 192) = v1;
  if (v1) {
    uint64_t v2 = sub_2186B6FB0;
  }
  else {
    uint64_t v2 = sub_2186B6B90;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2186B6B90()
{
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2186D19E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BD8760);
  uint64_t v2 = sub_2186D19C0();
  os_log_type_t v3 = sub_2186D1B40();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_218640000, v2, v3, "CDPRPDExecutor: Secure backup deleted. Proceeding with resetting the circle", v4, 2u);
    MEMORY[0x21D470490](v4, -1, -1);
  }

  uint64_t v5 = *(void **)(v0[23] + OBJC_IVAR___CDPDRPDExecutor_circleControl);
  uint64_t v6 = sub_2186D1A20();
  v0[25] = v6;
  v0[2] = v0;
  v0[7] = v0 + 27;
  v0[3] = sub_2186B6D80;
  uint64_t v7 = swift_continuation_init();
  v0[18] = MEMORY[0x263EF8330];
  v0[19] = 0x40000000;
  v0[20] = sub_2186B74A0;
  v0[21] = &block_descriptor_17;
  v0[22] = v7;
  objc_msgSend(v5, sel_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion_, 1, v6, v0 + 18);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2186B6D80()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_2186B7298;
  }
  else {
    uint64_t v2 = sub_2186B6E90;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2186B6E90()
{
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2186D19E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_267BD8760);
  uint64_t v2 = sub_2186D19C0();
  os_log_type_t v3 = sub_2186D1B40();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_218640000, v2, v3, "CDPDRPDExecutor: Circle reset completed.", v4, 2u);
    MEMORY[0x21D470490](v4, -1, -1);
  }

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2186B6FB0()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 18;
  os_log_type_t v3 = v1 + 27;
  swift_willThrow();
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)v1[24];
  uint64_t v5 = sub_2186D19E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_267BD8760);
  id v6 = v4;
  id v7 = v4;
  id v8 = sub_2186D19C0();
  os_log_type_t v9 = sub_2186D1B50();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v1[24];
  if (v10)
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    unint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v12 = 138412290;
    id v14 = v11;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v1[18] = v15;
    sub_2186D1B90();
    *unint64_t v13 = v15;

    _os_log_impl(&dword_218640000, v8, v9, "CDPDRPDExecutor: Failed to delete secure backup with error: %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7B88);
    swift_arrayDestroy();
    uint64_t v16 = v13;
    os_log_type_t v3 = v1 + 27;
    MEMORY[0x21D470490](v16, -1, -1);
    MEMORY[0x21D470490](v12, -1, -1);
  }
  else
  {
  }
  uint64_t v17 = *(void **)(v1[23] + OBJC_IVAR___CDPDRPDExecutor_circleControl);
  uint64_t v18 = sub_2186D1A20();
  v1[25] = v18;
  v1[2] = v1;
  v1[7] = v3;
  v1[3] = sub_2186B6D80;
  uint64_t v19 = swift_continuation_init();
  v1[18] = MEMORY[0x263EF8330];
  v1[19] = 0x40000000;
  v1[20] = sub_2186B74A0;
  v1[21] = &block_descriptor_17;
  v1[22] = v19;
  objc_msgSend(v17, sel_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion_, 1, v18, v2);
  return MEMORY[0x270FA23F0](v1 + 2);
}

uint64_t sub_2186B7298()
{
  uint64_t v1 = (void *)v0[25];
  swift_willThrow();

  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)v0[26];
  uint64_t v3 = sub_2186D19E0();
  __swift_project_value_buffer(v3, (uint64_t)qword_267BD8760);
  id v4 = v2;
  id v5 = v2;
  id v6 = sub_2186D19C0();
  os_log_type_t v7 = sub_2186D1B50();
  BOOL v8 = os_log_type_enabled(v6, v7);
  os_log_type_t v9 = (void *)v0[26];
  if (v8)
  {
    BOOL v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v10 = 138412290;
    id v12 = v9;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[18] = v13;
    sub_2186D1B90();
    *uint64_t v11 = v13;

    _os_log_impl(&dword_218640000, v6, v7, "CDPDRPDExecutor: Failed to reset circle with error: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7B88);
    swift_arrayDestroy();
    MEMORY[0x21D470490](v11, -1, -1);
    MEMORY[0x21D470490](v10, -1, -1);
  }
  else
  {
  }
  swift_willThrow();
  id v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_2186B74A0(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BD7CC0);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

BOOL sub_2186B7554()
{
  if (objc_msgSend(*(id *)(v0 + OBJC_IVAR___CDPDRPDExecutor_cdpContext), sel__forceManateeReset))
  {
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2186D19E0();
    __swift_project_value_buffer(v1, (uint64_t)qword_267BD8760);
    uint64_t v2 = sub_2186D19C0();
    os_log_type_t v3 = sub_2186D1B30();
    if (os_log_type_enabled(v2, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_218640000, v2, v3, "CDPDRPDExecutor: _forceManateeReset was set. Allowing Manatee RPD...", v4, 2u);
      MEMORY[0x21D470490](v4, -1, -1);
    }

    return 1;
  }
  else
  {
    return *(unsigned char *)(v0 + OBJC_IVAR___CDPDRPDExecutor_isICDPEnabled) == 1
        && objc_msgSend(*(id *)(v0 + OBJC_IVAR___CDPDRPDExecutor_circleControl), sel_circleStatus) != (id)1;
  }
}

uint64_t sub_2186B768C()
{
  *(void *)(v1 + 128) = v0;
  return MEMORY[0x270FA2498](sub_2186B76AC, 0, 0);
}

uint64_t sub_2186B76AC()
{
  *(void *)(v0 + 104) = &type metadata for CDPFeatureFlags;
  unint64_t v1 = sub_2186B93B8();
  *(unsigned char *)(v0 + 80) = 1;
  *(void *)(v0 + 112) = v1;
  char v2 = sub_2186D1980();
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  if ((v2 & 1) == 0)
  {
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2186D19E0();
    __swift_project_value_buffer(v9, (uint64_t)qword_267BD8760);
    uint64_t v5 = sub_2186D19C0();
    os_log_type_t v10 = sub_2186D1B40();
    if (os_log_type_enabled(v5, v10))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v7 = 0;
      uint64_t v11 = "CDPDRPDExecutor: Device not enabled for EDP";
LABEL_16:
      _os_log_impl(&dword_218640000, v5, v10, v11, v7, 2u);
      uint64_t v8 = 0;
LABEL_17:
      MEMORY[0x21D470490](v7, -1, -1);
LABEL_19:

      uint64_t v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
      return v13(v8);
    }
LABEL_18:
    uint64_t v8 = 0;
    goto LABEL_19;
  }
  os_log_type_t v3 = *(void **)(*(void *)(v0 + 128) + OBJC_IVAR___CDPDRPDExecutor_cdpContext);
  if (objc_msgSend(v3, sel_edpState) != (id)2)
  {
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_2186D19E0();
    __swift_project_value_buffer(v12, (uint64_t)qword_267BD8760);
    uint64_t v5 = sub_2186D19C0();
    os_log_type_t v10 = sub_2186D1B30();
    if (os_log_type_enabled(v5, v10))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v7 = 0;
      uint64_t v11 = "CDPDRPDExecutor: Account not eligible for EDP";
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  if (objc_msgSend(v3, sel__forceEDPReset))
  {
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2186D19E0();
    __swift_project_value_buffer(v4, (uint64_t)qword_267BD8760);
    uint64_t v5 = sub_2186D19C0();
    os_log_type_t v6 = sub_2186D1B30();
    if (!os_log_type_enabled(v5, v6))
    {
      uint64_t v8 = 1;
      goto LABEL_19;
    }
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_218640000, v5, v6, "CDPDRPDExecutor: _forceEDPReset was set. Allowing EDP RPD for eligible account...", v7, 2u);
    uint64_t v8 = 1;
    goto LABEL_17;
  }
  uint64_t v15 = *(void **)(*(void *)(v0 + 128) + OBJC_IVAR___CDPDRPDExecutor_edpController);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_2186B7A5C;
  uint64_t v16 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_2186B7C8C;
  *(void *)(v0 + 104) = &block_descriptor_19;
  *(void *)(v0 + 112) = v16;
  objc_msgSend(v15, sel_edpHealthIgnoringErrorWithCompletion_, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_2186B7A5C()
{
  return MEMORY[0x270FA2498](sub_2186B7B3C, 0, 0);
}

uint64_t sub_2186B7B3C()
{
  uint64_t v1 = v0[15];
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2186D19E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BD8760);
  os_log_type_t v3 = sub_2186D19C0();
  os_log_type_t v4 = sub_2186D1B30();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    v0[10] = v1;
    sub_2186D1B90();
    _os_log_impl(&dword_218640000, v3, v4, "CDPDRPDExecutor: edpHealth is %lu", v5, 0xCu);
    MEMORY[0x21D470490](v5, -1, -1);
  }

  os_log_type_t v6 = (uint64_t (*)(BOOL))v0[1];
  return v6(v1 == 4);
}

uint64_t sub_2186B7C8C(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

uint64_t sub_2186B7CB0()
{
  *(void *)(v1 + 304) = v0;
  return MEMORY[0x270FA2498](sub_2186B7CD0, 0, 0);
}

uint64_t sub_2186B7CD0()
{
  *(unsigned char *)(v0 + 346) = sub_2186B7554();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v1;
  void *v1 = v0;
  v1[1] = sub_2186B7D8C;
  v1[16] = *(void *)(v0 + 304);
  return MEMORY[0x270FA2498](sub_2186B76AC, 0, 0);
}

uint64_t sub_2186B7D8C(char a1)
{
  *(unsigned char *)(*(void *)v1 + 347) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2186B7E8C, 0, 0);
}

uint64_t sub_2186B7E8C()
{
  if (*(unsigned char *)(v0 + 346) != 1)
  {
    if ((*(unsigned char *)(v0 + 347) & 1) == 0)
    {
      if (qword_267BD7A70 != -1) {
        swift_once();
      }
      uint64_t v22 = sub_2186D19E0();
      __swift_project_value_buffer(v22, (uint64_t)qword_267BD8760);
      id v23 = sub_2186D19C0();
      os_log_type_t v24 = sub_2186D1B40();
      if (os_log_type_enabled(v23, v24))
      {
        unint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v25 = 0;
        _os_log_impl(&dword_218640000, v23, v24, "CDPDRPDExecutor: RPD is not allowed.", v25, 2u);
        MEMORY[0x21D470490](v25, -1, -1);
      }

      objc_msgSend(self, sel_cdp_errorWithCode_, -5302);
      goto LABEL_34;
    }
    *(void *)(v0 + 248) = &type metadata for CDPFeatureFlags;
    *(void *)(v0 + 256) = sub_2186B93B8();
    *(unsigned char *)(v0 + 224) = 1;
    char v11 = sub_2186D1980();
    __swift_destroy_boxed_opaque_existential_1(v0 + 224);
    if (v11)
    {
      if (qword_267BD7A70 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_2186D19E0();
      __swift_project_value_buffer(v12, (uint64_t)qword_267BD8760);
      uint64_t v13 = sub_2186D19C0();
      os_log_type_t v14 = sub_2186D1B40();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_218640000, v13, v14, "CDPDRPDExecutor: Not eligible for Manatee RPD.. Eligible for EDP RPD. Resetting EDP only...", v15, 2u);
        MEMORY[0x21D470490](v15, -1, -1);
      }
      uint64_t v16 = *(void *)(v0 + 304);

      if (objc_msgSend(*(id *)(v16 + OBJC_IVAR___CDPDRPDExecutor_ledger), sel_edpRPDBlockingError))
      {
        id v7 = sub_2186D19C0();
        os_log_type_t v8 = sub_2186D1B30();
        if (os_log_type_enabled(v7, v8))
        {
          uint64_t v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v9 = 0;
          os_log_type_t v10 = "CDPRPDExecutor: EDP RPD is not permitted...";
          goto LABEL_20;
        }
LABEL_21:

LABEL_34:
        swift_willThrow();
        unint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
        return v26();
      }
      uint64_t v35 = *(void *)(v0 + 304);
      uint64_t v36 = *(unsigned __int8 *)(v35 + OBJC_IVAR___CDPDRPDExecutor_isICDPEnabled);
      uint64_t v37 = *(void **)(v35 + OBJC_IVAR___CDPDRPDExecutor_edpController);
      *(void *)(v0 + 80) = v0;
      *(void *)(v0 + 120) = v0 + 344;
      *(void *)(v0 + 88) = sub_2186B88F4;
      uint64_t v38 = swift_continuation_init();
      *(void *)(v0 + 184) = MEMORY[0x263EF8330];
      *(void *)(v0 + 192) = 0x40000000;
      *(void *)(v0 + 200) = sub_2186B74A0;
      *(void *)(v0 + 208) = &block_descriptor;
      *(void *)(v0 + 216) = v38;
      objc_msgSend(v37, sel_resetProtectedDataShouldJoinCDP_edpOnly_withCompletion_, 0, v36, v0 + 184);
      uint64_t v34 = v0 + 80;
      goto LABEL_46;
    }
    goto LABEL_37;
  }
  if (*(unsigned char *)(v0 + 347))
  {
    *(void *)(v0 + 168) = &type metadata for CDPFeatureFlags;
    *(void *)(v0 + 176) = sub_2186B93B8();
    *(unsigned char *)(v0 + 144) = 1;
    char v1 = sub_2186D1980();
    __swift_destroy_boxed_opaque_existential_1(v0 + 144);
    if (v1)
    {
      if (qword_267BD7A70 != -1) {
        swift_once();
      }
      uint64_t v2 = sub_2186D19E0();
      __swift_project_value_buffer(v2, (uint64_t)qword_267BD8760);
      uint64_t v3 = sub_2186D19C0();
      os_log_type_t v4 = sub_2186D1B40();
      if (os_log_type_enabled(v3, v4))
      {
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_218640000, v3, v4, "CDPDRPDExecutor: Eligible for both Manatee and EDP RPD. Resetting both Manatee and EDP...", v5, 2u);
        MEMORY[0x21D470490](v5, -1, -1);
      }
      uint64_t v6 = *(void *)(v0 + 304);

      if (objc_msgSend(*(id *)(v6 + OBJC_IVAR___CDPDRPDExecutor_ledger), sel_manateeRPDBlockingError))
      {
        id v7 = sub_2186D19C0();
        os_log_type_t v8 = sub_2186D1B30();
        if (os_log_type_enabled(v7, v8))
        {
          uint64_t v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v9 = 0;
          os_log_type_t v10 = "CDPDRPDExecutor: Manatee RPD is not permitted...";
LABEL_20:
          _os_log_impl(&dword_218640000, v7, v8, v10, v9, 2u);
          MEMORY[0x21D470490](v9, -1, -1);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
      id v32 = *(void **)(*(void *)(v0 + 304) + OBJC_IVAR___CDPDRPDExecutor_edpController);
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 345;
      *(void *)(v0 + 24) = sub_2186B87C8;
      uint64_t v33 = swift_continuation_init();
      *(void *)(v0 + 264) = MEMORY[0x263EF8330];
      *(void *)(v0 + 272) = 0x40000000;
      *(void *)(v0 + 280) = sub_2186B74A0;
      *(void *)(v0 + 288) = &block_descriptor_15;
      *(void *)(v0 + 296) = v33;
      objc_msgSend(v32, sel_resetProtectedDataShouldJoinCDP_edpOnly_withCompletion_, 1, 0, v0 + 264);
      uint64_t v34 = v0 + 16;
LABEL_46:
      return MEMORY[0x270FA23F0](v34);
    }
LABEL_37:
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_2186D19E0();
    __swift_project_value_buffer(v27, (uint64_t)qword_267BD8760);
    unint64_t v28 = sub_2186D19C0();
    os_log_type_t v29 = sub_2186D1B40();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_218640000, v28, v29, "This is a no-op and only here for completeness.", v30, 2u);
      MEMORY[0x21D470490](v30, -1, -1);
    }

    uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31(0);
  }
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_2186D19E0();
  __swift_project_value_buffer(v17, (uint64_t)qword_267BD8760);
  uint64_t v18 = sub_2186D19C0();
  os_log_type_t v19 = sub_2186D1B40();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_218640000, v18, v19, "CDPDRPDExecutor: Eligible for Manatee RPD.... Resetting Manatee only...", v20, 2u);
    MEMORY[0x21D470490](v20, -1, -1);
  }

  uint64_t v21 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_2186B86CC;
  v21[23] = *(void *)(v0 + 304);
  return MEMORY[0x270FA2498](sub_2186B6828, 0, 0);
}

uint64_t sub_2186B86CC()
{
  uint64_t v5 = *v1;
  uint64_t v2 = swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  if (!v0) {
    uint64_t v2 = 1;
  }
  return v3(v2);
}

uint64_t sub_2186B87C8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 328) = v1;
  if (v1) {
    uint64_t v2 = sub_2186B8A20;
  }
  else {
    uint64_t v2 = sub_2186B88D8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2186B88D8()
{
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(3);
}

uint64_t sub_2186B88F4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 336) = v1;
  if (v1) {
    uint64_t v2 = sub_2186B8A8C;
  }
  else {
    uint64_t v2 = sub_2186B8A04;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2186B8A04()
{
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(2);
}

uint64_t sub_2186B8A20()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2186B8A8C()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2186B8C60(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2186B8D24;
  v5[38] = v4;
  return MEMORY[0x270FA2498](sub_2186B7CD0, 0, 0);
}

uint64_t sub_2186B8D24(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  uint64_t v9 = *(void *)(v5 + 24);
  if (v3)
  {
    os_log_type_t v10 = (void *)sub_2186D1960();

    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, a1, 0);
  }
  _Block_release(*(const void **)(v6 + 24));
  char v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

void __swiftcall CDPDRPDExecutor.init()(CDPDRPDExecutor *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void CDPDRPDExecutor.init()()
{
}

unint64_t type metadata accessor for CDPDRPDExecutor()
{
  unint64_t result = qword_267BD7C80;
  if (!qword_267BD7C80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BD7C80);
  }
  return result;
}

uint64_t sub_2186B9004()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2186B9044()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *id v4 = v1;
  v4[1] = sub_2186B940C;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_267BD7C88 + dword_267BD7C88);
  return v5(v2, v3);
}

uint64_t sub_2186B90F4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  id v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_2186B940C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267BD7D20 + dword_267BD7D20);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2186B91F8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2186B92C4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_267BD7D30 + dword_267BD7D30);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_2186B92C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_2186B93B8()
{
  unint64_t result = qword_267BD7F00;
  if (!qword_267BD7F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BD7F00);
  }
  return result;
}

uint64_t CDPExponentialRetryScheduler.retryFetchEscrowRecord(_:cdpContext:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_267BD7CD8 + dword_267BD7CD8);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2186BCE74;
  return v7(a1, a2);
}

uint64_t sub_2186B94C4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_2186B9554, 0, 0);
}

uint64_t sub_2186B9554()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = self;
  v0[2] = 0;
  id v3 = objc_msgSend(v2, sel_fetchEscrowRecords_error_, v1, v0 + 2);
  uint64_t v4 = (void *)v0[2];
  if (v3)
  {
    uint64_t v5 = (uint64_t *)v0[3];
    sub_2186BC898();
    uint64_t v6 = sub_2186D1AB0();
    id v7 = v4;

    *uint64_t v5 = v6;
  }
  else
  {
    id v9 = v4;
    sub_2186D1970();

    swift_willThrow();
  }
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

id sub_2186B969C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  uint64_t v6 = sub_2186D1C50();
  if (v6)
  {
    id v7 = (void *)v6;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    id v7 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v8, v4, a1);
  }
  id v9 = (void *)sub_2186D1960();

  id v10 = objc_msgSend(v9, sel_isRecoverableError);
  return v10;
}

void sub_2186B97FC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_2186B99F8(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  uint64_t v13 = (uint64_t (*)(id, id))((char *)&dword_267BD7CD8 + dword_267BD7CD8);
  id v8 = a1;
  id v9 = a2;
  id v10 = a4;
  uint64_t v11 = (void *)swift_task_alloc();
  v4[6] = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_2186B9AE4;
  return v13(v8, v9);
}

uint64_t sub_2186B9AE4()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 24);
  id v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v8 = sub_2186D1960();

    uint64_t v9 = 0;
    id v10 = (void *)v8;
  }
  else
  {
    sub_2186BC898();
    uint64_t v9 = sub_2186D1AA0();
    swift_bridgeObjectRelease();
    uint64_t v8 = 0;
    id v10 = (void *)v9;
  }
  uint64_t v11 = *(void (***)(void, void, void))(v3 + 40);
  v11[2](v11, v9, v8);

  _Block_release(v11);
  uint64_t v12 = *(uint64_t (**)(void))(v7 + 8);
  return v12();
}

uint64_t CDPExponentialRetryScheduler.retryFetchAllEscrowRecord(_:cdpContext:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_267BD7CE8 + dword_267BD7CE8);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2186BCE74;
  return v7(a1, a2);
}

uint64_t sub_2186B9D60(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_2186B9DF0, 0, 0);
}

uint64_t sub_2186B9DF0()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = self;
  v0[2] = 0;
  id v3 = objc_msgSend(v2, sel_fetchAllEscrowRecords_error_, v1, v0 + 2);
  uint64_t v4 = (void *)v0[2];
  if (v3)
  {
    uint64_t v5 = (uint64_t *)v0[3];
    sub_2186BC898();
    uint64_t v6 = sub_2186D1AB0();
    id v7 = v4;

    *uint64_t v5 = v6;
  }
  else
  {
    id v9 = v4;
    sub_2186D1970();

    swift_willThrow();
  }
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_2186BA0BC(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  uint64_t v13 = (uint64_t (*)(id, id))((char *)&dword_267BD7CE8 + dword_267BD7CE8);
  id v8 = a1;
  id v9 = a2;
  id v10 = a4;
  uint64_t v11 = (void *)swift_task_alloc();
  v4[6] = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_2186BCE84;
  return v13(v8, v9);
}

uint64_t CDPExponentialRetryScheduler.retryFetchAccountInfo(_:cdpContext:)(uint64_t a1, uint64_t a2)
{
  id v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_267BD7CF8 + dword_267BD7CF8);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2186BCE74;
  return v7(a1, a2);
}

uint64_t sub_2186BA25C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_2186BA27C, 0, 0);
}

uint64_t sub_2186BA27C()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  id v2 = objc_msgSend(*(id *)(v0 + 24), sel_getAccountInfoWithError_, 0);
  uint64_t v3 = sub_2186D1A00();

  uint64_t *v1 = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2186BA32C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = swift_allocObject();
  swift_getErrorValue();
  *(unsigned char *)(v7 + 16) = sub_2186B969C(v11[7]) & 1;
  v11[4] = a3;
  v11[5] = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_2186B97FC;
  v11[3] = a4;
  uint64_t v8 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(a2, sel_reauthenticateUserWithCompletion_, v8);
  _Block_release(v8);
  swift_beginAccess();
  uint64_t v9 = *(unsigned __int8 *)(v7 + 16);
  swift_release();
  return v9;
}

uint64_t sub_2186BA5D4(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  uint64_t v13 = (uint64_t (*)(id, id))((char *)&dword_267BD7CF8 + dword_267BD7CF8);
  id v8 = a1;
  id v9 = a2;
  id v10 = a4;
  uint64_t v11 = (void *)swift_task_alloc();
  v4[6] = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_2186BA6C0;
  return v13(v8, v9);
}

uint64_t sub_2186BA6C0()
{
  id v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 24);
  uint64_t v6 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v8 = sub_2186D1960();

    uint64_t v9 = 0;
    id v10 = (void *)v8;
  }
  else
  {
    uint64_t v9 = sub_2186D19F0();
    swift_bridgeObjectRelease();
    uint64_t v8 = 0;
    id v10 = (void *)v9;
  }
  uint64_t v11 = *(void (***)(void, void, void))(v3 + 40);
  v11[2](v11, v9, v8);

  _Block_release(v11);
  uint64_t v12 = *(uint64_t (**)(void))(v7 + 8);
  return v12();
}

uint64_t CDPExponentialRetryScheduler.retrySilentAuth(authContext:)(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_267BD7D08 + dword_267BD7D08);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2186BA940;
  return v5(a1);
}

uint64_t sub_2186BA940(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_2186BAA40(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return MEMORY[0x270FA2498](sub_2186BAA60, 0, 0);
}

uint64_t sub_2186BAA60()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29118]), sel_init);
  v0[18] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = v0[17];
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_2186BAB88;
    uint64_t v4 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_2186BAD74;
    v0[13] = &block_descriptor_0;
    v0[14] = v4;
    objc_msgSend(v2, sel_authenticateWithContext_completion_, v3, v0 + 10);
    id v1 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA23F0](v1);
}

uint64_t sub_2186BAB88()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_2186BAD04;
  }
  else {
    uint64_t v2 = sub_2186BAC98;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2186BAC98()
{
  uint64_t v1 = *(void **)(v0 + 144);
  **(void **)(v0 + 128) = *(void *)(v0 + 120);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2186BAD04()
{
  uint64_t v1 = *(void **)(v0 + 144);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2186BAD74(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BD7CC0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC0B4B0);
      uint64_t v8 = sub_2186D1A00();
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v8;
    sub_2186BCAA4((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

unint64_t sub_2186BAE68()
{
  swift_getErrorValue();
  return (unint64_t)sub_2186B969C(v1) & 1;
}

uint64_t sub_2186BB024(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)&dword_267BD7D08 + dword_267BD7D08);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = (void *)swift_task_alloc();
  void v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_2186BB0F8;
  return v10((uint64_t)v6);
}

uint64_t sub_2186BB0F8(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  id v6 = *(void **)(*v2 + 24);
  id v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  if (v3)
  {
    a1 = sub_2186D1960();

    uint64_t v9 = 0;
    uint64_t v10 = (void *)a1;
  }
  else if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AC0B4B0);
    uint64_t v9 = sub_2186D19F0();
    swift_bridgeObjectRelease();
    a1 = 0;
    uint64_t v10 = (void *)v9;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(void (***)(void, void, void))(v5 + 32);
  v11[2](v11, v9, a1);

  _Block_release(v11);
  uint64_t v12 = *(uint64_t (**)(void))(v8 + 8);
  return v12();
}

id CDPExponentialRetryScheduler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id CDPExponentialRetryScheduler.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDPExponentialRetryScheduler();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CDPExponentialRetryScheduler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDPExponentialRetryScheduler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2186BB3A8(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_2186B940C;
  return v6();
}

uint64_t sub_2186BB474(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_2186B940C;
  return v7();
}

uint64_t sub_2186BB540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2186D1B20();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2186D1B10();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2186BC5B0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2186D1B00();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2186BB6E4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2186BB7C0;
  return v6(a1);
}

uint64_t sub_2186BB7C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2186BB8B8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return MEMORY[0x270FA2498](sub_2186BB8D8, 0, 0);
}

uint64_t sub_2186BB8D8()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)v0[5];
  uint64_t v3 = sub_2186D19B0();
  uint64_t v4 = sub_2186D19A0();
  v0[6] = v4;
  v0[3] = v4;
  uint64_t v5 = swift_task_alloc();
  v0[7] = v5;
  *(void *)(v5 + 16) = v1;
  uint64_t v6 = swift_allocObject();
  v0[8] = v6;
  *(void *)(v6 + 16) = v2;
  id v7 = v2;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7DF8);
  *uint64_t v8 = v0;
  v8[1] = sub_2186BBA40;
  uint64_t v10 = MEMORY[0x263F203E8];
  return MEMORY[0x270F083E0](v0 + 2, &unk_267BD7E08, v5, sub_2186BCDF8, v6, v3, v9, v10);
}

uint64_t sub_2186BBA40()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2186BCE70;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v2 = sub_2186BCE78;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2186BBB64(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return MEMORY[0x270FA2498](sub_2186BBB84, 0, 0);
}

uint64_t sub_2186BBB84()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)v0[5];
  uint64_t v3 = sub_2186D19B0();
  uint64_t v4 = sub_2186D19A0();
  v0[6] = v4;
  v0[3] = v4;
  uint64_t v5 = swift_task_alloc();
  v0[7] = v5;
  *(void *)(v5 + 16) = v1;
  uint64_t v6 = swift_allocObject();
  v0[8] = v6;
  *(void *)(v6 + 16) = v2;
  id v7 = v2;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7DF8);
  *uint64_t v8 = v0;
  v8[1] = sub_2186BBA40;
  uint64_t v10 = MEMORY[0x263F203E8];
  return MEMORY[0x270F083E0](v0 + 2, &unk_267BD7DF0, v5, sub_2186BCD0C, v6, v3, v9, v10);
}

uint64_t sub_2186BBCEC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return MEMORY[0x270FA2498](sub_2186BBD0C, 0, 0);
}

uint64_t sub_2186BBD0C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)v0[5];
  uint64_t v3 = sub_2186D19B0();
  uint64_t v4 = sub_2186D19A0();
  v0[6] = v4;
  v0[3] = v4;
  uint64_t v5 = swift_task_alloc();
  v0[7] = v5;
  *(void *)(v5 + 16) = v1;
  uint64_t v6 = swift_allocObject();
  v0[8] = v6;
  *(void *)(v6 + 16) = v2;
  id v7 = v2;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7DE0);
  *uint64_t v8 = v0;
  v8[1] = sub_2186BBE74;
  uint64_t v10 = MEMORY[0x263F203E8];
  return MEMORY[0x270F083E0](v0 + 2, &unk_267BD7DD8, v5, sub_2186BCBF4, v6, v3, v9, v10);
}

uint64_t sub_2186BBE74()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2186BC000;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v2 = sub_2186BBF98;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2186BBF98()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2186BC000()
{
  uint64_t v1 = *(void **)(v0 + 48);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2186BC074(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return MEMORY[0x270FA2498](sub_2186BC094, 0, 0);
}

uint64_t sub_2186BC094()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = sub_2186D19B0();
  uint64_t v3 = sub_2186D19A0();
  v0[5] = v3;
  v0[3] = v3;
  uint64_t v4 = swift_task_alloc();
  v0[6] = v4;
  *(void *)(v4 + 16) = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC0B4C0);
  *uint64_t v5 = v0;
  v5[1] = sub_2186BC1CC;
  uint64_t v7 = MEMORY[0x263F203E8];
  return MEMORY[0x270F083E0](v0 + 2, &unk_267BD7DC8, v4, sub_2186BAE68, 0, v2, v6, v7);
}

uint64_t sub_2186BC1CC()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2186BC350;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2186BC2E8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2186BC2E8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2186BC350()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t type metadata accessor for CDPExponentialRetryScheduler()
{
  return self;
}

uint64_t sub_2186BC3E0()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2186BC428()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_2186B92C4;
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_267BD7D10 + dword_267BD7D10);
  return v6(v2, v3, v4);
}

uint64_t sub_2186BC4E4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2186B940C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_267BD7D30 + dword_267BD7D30);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_2186BC5B0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC0B4A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2186BC610()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2186BC648(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2186B940C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267BD7D40 + dword_267BD7D40);
  return v6(a1, v4);
}

uint64_t sub_2186BC704()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_2186B940C;
  uint64_t v7 = (uint64_t (*)(void *, void *, void *, void *))((char *)&dword_267BD7D58 + dword_267BD7D58);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_2186BC7D0()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_2186B940C;
  uint64_t v7 = (uint64_t (*)(void *, void *, void *, void *))((char *)&dword_267BD7D78 + dword_267BD7D78);
  return v7(v2, v3, v5, v4);
}

unint64_t sub_2186BC898()
{
  unint64_t result = qword_267BD7B70;
  if (!qword_267BD7B70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BD7B70);
  }
  return result;
}

uint64_t objectdestroy_28Tm()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2186BC92C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_2186B940C;
  uint64_t v7 = (uint64_t (*)(void *, void *, void *, void *))((char *)&dword_267BD7DA0 + dword_267BD7DA0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_2186BC9F4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2186B92C4;
  v5[16] = a1;
  v5[17] = v4;
  return MEMORY[0x270FA2498](sub_2186BAA60, 0, 0);
}

uint64_t sub_2186BCAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC0B4C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2186BCB0C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_2186B940C;
  return MEMORY[0x270FA2498](sub_2186BA27C, 0, 0);
}

uint64_t sub_2186BCBBC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2186BCBF4(uint64_t a1)
{
  return sub_2186BA32C(a1, *(void **)(v1 + 16), (uint64_t)sub_2186BCC40, (uint64_t)&block_descriptor_85) & 1;
}

uint64_t sub_2186BCC30()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
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

uint64_t sub_2186BCC5C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2186B940C;
  v5[3] = a1;
  v5[4] = v4;
  return MEMORY[0x270FA2498](sub_2186B9DF0, 0, 0);
}

uint64_t sub_2186BCD0C(uint64_t a1)
{
  return sub_2186BA32C(a1, *(void **)(v1 + 16), (uint64_t)sub_2186BCC40, (uint64_t)&block_descriptor_95) & 1;
}

uint64_t sub_2186BCD48(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2186B940C;
  v5[3] = a1;
  v5[4] = v4;
  return MEMORY[0x270FA2498](sub_2186B9554, 0, 0);
}

uint64_t sub_2186BCDF8(uint64_t a1)
{
  return sub_2186BA32C(a1, *(void **)(v1 + 16), (uint64_t)sub_2186BCC40, (uint64_t)&block_descriptor_106) & 1;
}

uint64_t sub_2186BCE34(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t result = swift_beginAccess();
    *(unsigned char *)(v2 + 16) = 0;
  }
  return result;
}

id CDPEscapeOffersLedger.description.getter()
{
  sub_2186D1BC0();
  sub_2186D1A50();
  CDPRemoteApprovalEscapeOfferMask.description.getter((__int16)objc_msgSend(v0, sel_escapeOffersPresented));
  sub_2186D1A50();
  swift_bridgeObjectRelease();
  sub_2186D1A50();
  CDPRemoteApprovalEscapeOfferMask.description.getter(*(void *)&v0[OBJC_IVAR___CDPEscapeOffersLedger_expectedEscapeOffers]);
  sub_2186D1A50();
  swift_bridgeObjectRelease();
  sub_2186D1A50();
  sub_2186D1A50();
  swift_bridgeObjectRelease();
  sub_2186D1A50();
  sub_2186D1A50();
  swift_bridgeObjectRelease();
  sub_2186D1A50();
  sub_2186BD1D8();
  sub_2186D1A50();
  swift_bridgeObjectRelease();
  sub_2186D1A50();
  id result = objc_msgSend(*(id *)&v0[OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext], sel_context);
  if (result)
  {
    uint64_t v2 = result;
    objc_msgSend(result, sel_type);

    type metadata accessor for CDPContextType(0);
    sub_2186D1C00();
    sub_2186D1A50();
    sub_2186D1A50();
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_2186BD1D8()
{
  id result = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                                 + OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext), sel_context));
  if (result)
  {
    uint64_t v2 = result;
    id v3 = objc_msgSend(result, sel_type);

    return (id)sub_2186BE2E4((uint64_t)v3, (uint64_t)&unk_26C9BC070);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2186BD250(uint64_t a1, uint64_t a2)
{
  unint64_t result = 0;
  if (a2 <= -6104)
  {
    if (a2 == -7209)
    {
      sub_2186D1BC0();
      swift_bridgeObjectRelease();
      unint64_t v3 = 0xD00000000000002BLL;
LABEL_15:
      unint64_t v4 = v3;
      goto LABEL_16;
    }
    if (a2 != -7208) {
      return result;
    }
  }
  else
  {
    switch(a2)
    {
      case -6103:
        sub_2186D1BC0();
        swift_bridgeObjectRelease();
        unint64_t v3 = 0xD000000000000012;
        goto LABEL_15;
      case -6102:
        sub_2186D1BC0();
        swift_bridgeObjectRelease();
        unint64_t v3 = 0xD000000000000010;
        goto LABEL_15;
      case -6101:
        sub_2186D1BC0();
        swift_bridgeObjectRelease();
        unint64_t v3 = 0xD000000000000011;
        goto LABEL_15;
      case -6100:
        sub_2186D1BC0();
        swift_bridgeObjectRelease();
        unint64_t v3 = 0xD00000000000001BLL;
        goto LABEL_15;
      default:
        if (a2 == -5500)
        {
          sub_2186D1BC0();
          swift_bridgeObjectRelease();
          unint64_t v3 = 0xD000000000000016;
          goto LABEL_15;
        }
        if (a2 != -5110) {
          return result;
        }
        break;
    }
  }
  sub_2186D1BC0();
  swift_bridgeObjectRelease();
  unint64_t v4 = 0xD000000000000019;
LABEL_16:
  sub_2186D1A50();
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_2186BD4E4()
{
  return sub_2186BD250(*v0, *((void *)v0 + 1));
}

uint64_t sub_2186BD4F0()
{
  uint64_t v2 = sub_2186D19E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext), sel_context);
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v1 = (unint64_t)objc_msgSend(v6, sel_edpState);

    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v8 = __swift_project_value_buffer(v2, (uint64_t)qword_267BD8760);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    uint64_t v9 = sub_2186D19C0();
    os_log_type_t v10 = sub_2186D1B30();
    if (!os_log_type_enabled(v9, v10)) {
      goto LABEL_7;
    }
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v16 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    if (v1 < 3)
    {
      uint64_t v13 = v12;
      uint64_t v15 = sub_2186BF898(*(void *)&aUnknown_2[8 * v1], *(void *)&aIneligibeligib_0[8 * v1 + 16], &v16);
      sub_2186D1B90();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_218640000, v9, v10, "Ledger: EDP State is: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D470490](v13, -1, -1);
      MEMORY[0x21D470490](v11, -1, -1);
LABEL_7:

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return v1;
    }
  }
  else
  {
    __break(1u);
  }
  type metadata accessor for CDPEDPState(0);
  uint64_t v15 = v1;
  uint64_t result = sub_2186D1C70();
  __break(1u);
  return result;
}

BOOL sub_2186BD7CC()
{
  id v1 = objc_msgSend(v0, sel_edpRPDBlockingError);
  id v2 = v1;
  if (v1) {

  }
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2186D19E0();
  __swift_project_value_buffer(v3, (uint64_t)qword_267BD8760);
  uint64_t v4 = sub_2186D19C0();
  os_log_type_t v5 = sub_2186D1B30();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v6 = 67109120;
    sub_2186D1B90();
    _os_log_impl(&dword_218640000, v4, v5, "Ledger: EDP Reset is allowed = %{BOOL}d", v6, 8u);
    MEMORY[0x21D470490](v6, -1, -1);
  }

  return v2 == 0;
}

id sub_2186BD910()
{
  uint64_t v2 = sub_2186BD9FC();
  id result = (id)sub_2186BD4F0();
  if (*(void *)(v2 + 16) < 2uLL)
  {
    __break(1u);
    goto LABEL_6;
  }
  id result = sub_2186C0110(2, 2, result == (id)2, -7208);
  if (*(void *)(v2 + 16) < 3uLL)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_2186C0110(3, 3, (v0[OBJC_IVAR___CDPEscapeOffersLedger_isWalrusEnabled] & 1) == 0, -7209);
  id result = objc_msgSend(v0, sel_escapeOffersPresented);
  if (*(void *)(v2 + 16) >= 4uLL)
  {
    sub_2186C0110(4, 4, BYTE1(result) & 1, -6100);
    return (id)v2;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2186BD9FC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7C20);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2186D75E0;
  unsigned __int8 v2 = 1;
  *(unsigned char *)(v1 + 32) = (*(unsigned char *)(v0 + OBJC_IVAR___CDPEscapeOffersLedger_deviceIsVM) & 1) == 0;
  *(void *)(v1 + 40) = -6103;
  *(unsigned char *)(v1 + 48) = sub_2186BD4F0() != 0;
  *(void *)(v1 + 56) = -7212;
  *(unsigned char *)(v1 + 64) = sub_2186BD1D8() & 1;
  *(void *)(v1 + 72) = -6102;
  if (sub_2186BDC48()) {
    unsigned __int8 v2 = sub_2186BDDD0();
  }
  *(unsigned char *)(v1 + 80) = v2 & 1;
  *(void *)(v1 + 88) = -6101;
  return v1;
}

id sub_2186BDAEC()
{
  return sub_2186BEAEC((SEL *)&selRef__forceEDPReset, "Ledger: CLI asked for a force EDP reset. Overriding all other checks.", (void (*)(void))sub_2186BD910, "Ledger: edpRPDBlockingError - Finding first unsatisfied requirement in conditions: %s");
}

unint64_t sub_2186BDB1C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7EE8);
  uint64_t v2 = sub_2186D1C30();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2186C0440(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2186C0288(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2186C04A8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

BOOL sub_2186BDC48()
{
  char v1 = *(unsigned char *)(v0 + OBJC_IVAR___CDPEscapeOffersLedger_isWalrusEnabled);
  BOOL v12 = v1;
  char v10 = &type metadata for CDPFeatureFlags;
  unint64_t v11 = sub_2186B93B8();
  LOBYTE(v9[0]) = 1;
  char v2 = sub_2186D1980();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  if (v2)
  {
    BOOL v3 = (v1 & 1) != 0 || sub_2186BD4F0() == 2;
    BOOL v12 = v3;
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2186D19E0();
    __swift_project_value_buffer(v4, (uint64_t)qword_267BD8760);
    uint64_t v5 = sub_2186D19C0();
    os_log_type_t v6 = sub_2186D1B30();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67109120;
      v9[0] = v3;
      sub_2186D1B90();
      _os_log_impl(&dword_218640000, v5, v6, "Ledger: isProbationCheckRequired: %{BOOL}d.", v7, 8u);
      MEMORY[0x21D470490](v7, -1, -1);
    }
  }
  swift_beginAccess();
  return v12;
}

id sub_2186BDDD0()
{
  char v1 = *(void **)(v0 + OBJC_IVAR___CDPEscapeOffersLedger_probationChecker);
  sub_2186BE1A8();
  double v3 = v2;
  id v4 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext), sel_context);
  id v5 = objc_msgSend(v1, sel_rpdProbationIsInEffectForDuration_context_, v4, v3);

  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2186D19E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_267BD8760);
  uint64_t v7 = sub_2186D19C0();
  os_log_type_t v8 = sub_2186D1B30();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109120;
    sub_2186D1B90();
    _os_log_impl(&dword_218640000, v7, v8, "Ledger: probationEnded: %{BOOL}d", v9, 8u);
    MEMORY[0x21D470490](v9, -1, -1);
  }

  return v5;
}

unint64_t sub_2186BDF44()
{
  char v1 = (void *)sub_2186BD9FC();
  char v2 = v0[OBJC_IVAR___CDPEscapeOffersLedger_deviceHasPasscode];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v1 = sub_2186B5360(0, v1[2] + 1, 1, v1);
  }
  unint64_t v4 = v1[2];
  unint64_t v3 = v1[3];
  if (v4 >= v3 >> 1) {
    char v1 = sub_2186B5360((void *)(v3 > 1), v4 + 1, 1, v1);
  }
  v1[2] = v4 + 1;
  id v5 = &v1[2 * v4];
  *((unsigned char *)v5 + 32) = v2;
  v5[5] = -5500;
  if (v0[OBJC_IVAR___CDPEscapeOffersLedger__manateeRepaired] == 1)
  {
    unint64_t result = (unint64_t)objc_msgSend(v0, sel_escapeOffersPresented);
    uint64_t v7 = (result >> 8) & 1;
  }
  else
  {
    unint64_t v8 = *(void *)&v0[OBJC_IVAR___CDPEscapeOffersLedger_expectedEscapeOffers];
    unint64_t result = (unint64_t)objc_msgSend(v0, sel_escapeOffersPresented);
    LOBYTE(v7) = v8 == result;
  }
  if (v1[2])
  {
    sub_2186C0110(1, 1, v7, -6100);
    return (unint64_t)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_2186BE070()
{
  char v2 = v0;
  uint64_t v8 = sub_2186BD9FC();
  if (*(void *)(v8 + 16))
  {
    sub_2186C0110(1, 1, *((unsigned char *)v0 + OBJC_IVAR___CDPEscapeOffersLedger_isICDPEnabled), -5302);
    unint64_t v3 = (unint64_t)objc_msgSend(v0, sel_escapeOffersPresented);
    if (*(void *)(v8 + 16) >= 2uLL)
    {
      sub_2186C0110(2, 2, ((*(void *)((char *)v0 + OBJC_IVAR___CDPEscapeOffersLedger_expectedEscapeOffers) ^ v3) & 0xFFFFFFFFFFFFFEFFLL) == 0, -6100);
      char v1 = *((unsigned char *)v0 + OBJC_IVAR___CDPEscapeOffersLedger_deviceHasPasscode);
      char v2 = (void *)v8;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_9:
  char v2 = sub_2186B5360(0, v2[2] + 1, 1, v2);
LABEL_4:
  unint64_t v5 = v2[2];
  unint64_t v4 = v2[3];
  if (v5 >= v4 >> 1) {
    char v2 = sub_2186B5360((void *)(v4 > 1), v5 + 1, 1, v2);
  }
  v2[2] = v5 + 1;
  uint64_t v6 = &v2[2 * v5];
  *((unsigned char *)v6 + 32) = v1;
  v6[5] = -5500;
  return v2;
}

void sub_2186BE1A8()
{
  if (sub_2186BDC48())
  {
    char v1 = *(void **)(v0 + OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext);
    objc_msgSend(v1, sel_rpdProbationDuration, 0.0);
    if (v2 == 0.0)
    {
      if (qword_267BD7A70 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_2186D19E0();
      __swift_project_value_buffer(v3, (uint64_t)qword_267BD8760);
      unint64_t v4 = sub_2186D19C0();
      os_log_type_t v5 = sub_2186D1B30();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_218640000, v4, v5, "Ledger: rpdProbationDuration is not set. Deafulting to CDPRPDProbationTimeInterval", v6, 2u);
        MEMORY[0x21D470490](v6, -1, -1);
      }
    }
    else
    {
      objc_msgSend(v1, sel_rpdProbationDuration);
    }
  }
}

uint64_t sub_2186BE2E4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

BOOL sub_2186BE37C()
{
  id v1 = objc_msgSend(v0, sel_rpdBlockingError);
  BOOL v10 = 1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = (void *)sub_2186D1960();
    unsigned int v4 = objc_msgSend(v3, sel_cdp_isCDPErrorWithCode_, -5500);

    if (!v4) {
      BOOL v10 = 0;
    }
  }
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2186D19E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_267BD8760);
  BOOL v6 = sub_2186D19C0();
  os_log_type_t v7 = sub_2186D1B30();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 67109120;
    sub_2186D1B90();
    _os_log_impl(&dword_218640000, v6, v7, "Ledger: canOfferRPD: %{BOOL}d", v8, 8u);
    MEMORY[0x21D470490](v8, -1, -1);
  }

  swift_beginAccess();
  return v10;
}

id sub_2186BE564()
{
  id result = objc_msgSend(*(id *)&v0[OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext], sel_context);
  if (result)
  {
    uint64_t v2 = result;
    unsigned int v3 = objc_msgSend(result, sel__forceReset);

    if (v3)
    {
      if (qword_267BD7A70 == -1)
      {
LABEL_4:
        uint64_t v4 = sub_2186D19E0();
        __swift_project_value_buffer(v4, (uint64_t)qword_267BD8760);
        uint64_t v5 = sub_2186D19C0();
        os_log_type_t v6 = sub_2186D1B40();
        if (os_log_type_enabled(v5, v6))
        {
          os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v7 = 0;
          _os_log_impl(&dword_218640000, v5, v6, "Ledger: CLI asked for a force reset. Overriding all other checks.", v7, 2u);
          MEMORY[0x21D470490](v7, -1, -1);
        }

        return 0;
      }
LABEL_28:
      swift_once();
      goto LABEL_4;
    }
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2186D19E0();
    __swift_project_value_buffer(v9, (uint64_t)qword_267BD8760);
    BOOL v10 = v0;
    unint64_t v11 = sub_2186D19C0();
    os_log_type_t v12 = sub_2186D1B30();
    if (os_log_type_enabled(v11, v12))
    {
      BOOL v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v34 = v14;
      *(_DWORD *)BOOL v13 = 136315138;
      sub_2186BDF44();
      uint64_t v15 = MEMORY[0x21D46F530]();
      unint64_t v17 = v16;
      swift_bridgeObjectRelease();
      sub_2186BF898(v15, v17, &v34);
      sub_2186D1B90();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_218640000, v11, v12, "Ledger: rpdBlockingError - Finding first unsatisfied requirement in conditions: %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D470490](v14, -1, -1);
      MEMORY[0x21D470490](v13, -1, -1);
    }
    else
    {
    }
    unint64_t v18 = sub_2186BDF44();
    uint64_t v19 = *(void *)(v18 + 16);
    if (v19)
    {
      if ((*(unsigned char *)(v18 + 32) & 1) == 0)
      {
        uint64_t v22 = (uint64_t *)(v18 + 40);
LABEL_17:
        char v21 = 0;
        uint64_t v20 = *v22;
        goto LABEL_18;
      }
      if (v19 != 1)
      {
        uint64_t v22 = (uint64_t *)(v18 + 56);
        uint64_t v32 = 1;
        char v21 = 2;
        while (1)
        {
          uint64_t v33 = v32 + 1;
          if (__OFADD__(v32, 1)) {
            break;
          }
          if (*((unsigned char *)v22 - 8) != 1) {
            goto LABEL_17;
          }
          v22 += 2;
          ++v32;
          if (v33 == v19)
          {
            uint64_t v20 = 0;
            goto LABEL_18;
          }
        }
        __break(1u);
        goto LABEL_28;
      }
    }
    uint64_t v20 = 0;
    char v21 = 2;
LABEL_18:
    swift_bridgeObjectRelease();
    id v23 = v10;
    sub_2186C03E4(v21, v20, v23);
    uint64_t v8 = v24;

    id v25 = v8;
    unint64_t v26 = sub_2186D19C0();
    os_log_type_t v27 = sub_2186D1B30();
    if (os_log_type_enabled(v26, v27))
    {
      unint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v34 = v29;
      *(_DWORD *)unint64_t v28 = 136315138;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7F08);
      uint64_t v30 = sub_2186D1B80();
      sub_2186BF898(v30, v31, &v34);
      sub_2186D1B90();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_218640000, v26, v27, "Ledger: rpdBlockingError - error: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D470490](v29, -1, -1);
      MEMORY[0x21D470490](v28, -1, -1);
    }
    else
    {
    }
    return v8;
  }
  __break(1u);
  return result;
}

id sub_2186BEA28(void *a1, uint64_t a2, SEL *a3, char *a4, void (*a5)(void), char *a6)
{
  id v10 = a1;
  id v11 = sub_2186BEAEC(a3, a4, a5, a6);

  if (v11)
  {
    os_log_type_t v12 = (void *)sub_2186D1960();
  }
  else
  {
    os_log_type_t v12 = 0;
  }
  return v12;
}

id sub_2186BEABC()
{
  return sub_2186BEAEC((SEL *)&selRef__forceManateeReset, "Ledger: CLI asked for a force Manatee reset. Overriding all other checks.", (void (*)(void))sub_2186BE070, "Ledger: manateeRPDBlockingError - Finding first unsatisfied requirement in conditions: %s");
}

id sub_2186BEAEC(SEL *a1, char *a2, void (*a3)(void), char *a4)
{
  id result = objc_msgSend(*(id *)&v4[OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext], sel_context);
  if (result)
  {
    id v10 = result;
    unsigned int v11 = [result *a1];

    if (v11)
    {
      if (qword_267BD7A70 == -1)
      {
LABEL_4:
        uint64_t v12 = sub_2186D19E0();
        __swift_project_value_buffer(v12, (uint64_t)qword_267BD8760);
        BOOL v13 = sub_2186D19C0();
        os_log_type_t v14 = sub_2186D1B40();
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v15 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v15 = 0;
          _os_log_impl(&dword_218640000, v13, v14, a2, v15, 2u);
          MEMORY[0x21D470490](v15, -1, -1);
        }

        return 0;
      }
LABEL_26:
      swift_once();
      goto LABEL_4;
    }
    if (qword_267BD7A70 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_2186D19E0();
    __swift_project_value_buffer(v17, (uint64_t)qword_267BD8760);
    a2 = v4;
    unint64_t v18 = sub_2186D19C0();
    os_log_type_t v19 = sub_2186D1B30();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v36 = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      a3();
      format = a4;
      uint64_t v35 = a3;
      uint64_t v22 = MEMORY[0x21D46F530]();
      unint64_t v24 = v23;
      swift_bridgeObjectRelease();
      sub_2186BF898(v22, v24, &v36);
      sub_2186D1B90();

      a3 = v35;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_218640000, v18, v19, format, v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D470490](v21, -1, -1);
      MEMORY[0x21D470490](v20, -1, -1);
    }
    else
    {
    }
    uint64_t v25 = ((uint64_t (*)(void))a3)();
    uint64_t v26 = *(void *)(v25 + 16);
    if (v26)
    {
      if ((*(unsigned char *)(v25 + 32) & 1) == 0)
      {
        uint64_t v29 = (uint64_t *)(v25 + 40);
LABEL_17:
        char v28 = 0;
        uint64_t v27 = *v29;
        goto LABEL_18;
      }
      if (v26 != 1)
      {
        uint64_t v29 = (uint64_t *)(v25 + 56);
        uint64_t v32 = 1;
        char v28 = 2;
        while (1)
        {
          uint64_t v33 = v32 + 1;
          if (__OFADD__(v32, 1)) {
            break;
          }
          if (*((unsigned char *)v29 - 8) != 1) {
            goto LABEL_17;
          }
          v29 += 2;
          ++v32;
          if (v33 == v26)
          {
            uint64_t v27 = 0;
            goto LABEL_18;
          }
        }
        __break(1u);
        goto LABEL_26;
      }
    }
    uint64_t v27 = 0;
    char v28 = 2;
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v30 = a2;
    sub_2186C03E4(v28, v27, v30);
    uint64_t v16 = v31;

    return (id)v16;
  }
  __break(1u);
  return result;
}

void sub_2186BEE64(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 8);
  sub_2186D1A30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7EE0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2186D75F0;
  *(void *)(inited + 32) = sub_2186D1A30();
  *(void *)(inited + 40) = v7;
  sub_2186D1BC0();
  swift_bridgeObjectRelease();
  strcpy((char *)v15, "Ledger State: ");
  HIBYTE(v15[1]) = -18;
  id v8 = objc_msgSend(a2, sel_description);
  sub_2186D1A30();

  sub_2186D1A50();
  swift_bridgeObjectRelease();
  uint64_t v9 = v15[0];
  uint64_t v10 = v15[1];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 56) = v10;
  sub_2186BDB1C(inited);
  id v11 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v12 = (void *)sub_2186D1A20();
  swift_bridgeObjectRelease();
  BOOL v13 = (void *)sub_2186D19F0();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v11, sel_initWithDomain_code_userInfo_, v12, v5, v13);

  *a3 = v14;
}

id sub_2186BF030(uint64_t a1, void *a2, char a3, uint64_t a4, char a5, char a6)
{
  *(void *)&v6[OBJC_IVAR___CDPEscapeOffersLedger__escapeOffersPresented] = 1;
  v6[OBJC_IVAR___CDPEscapeOffersLedger__manateeRepaired] = 0;
  *(void *)&v6[OBJC_IVAR___CDPEscapeOffersLedger_expectedEscapeOffers] = a1 & 0xFFFFFFFFFFFFFFE2;
  uint64_t v12 = v6;
  unsigned __int8 v13 = objc_msgSend(a2, sel_isWalrusEnabled);
  v12[OBJC_IVAR___CDPEscapeOffersLedger_isWalrusEnabled] = v13;
  v12[OBJC_IVAR___CDPEscapeOffersLedger_deviceHasPasscode] = a3;
  objc_msgSend(a2, sel_rpdProbationDuration);
  *(void *)&v12[OBJC_IVAR___CDPEscapeOffersLedger_probationDuration] = v14;
  *(void *)&v12[OBJC_IVAR___CDPEscapeOffersLedger_probationChecker] = a4;
  *(void *)&v12[OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext] = a2;
  v12[OBJC_IVAR___CDPEscapeOffersLedger_deviceIsVM] = a5;
  v12[OBJC_IVAR___CDPEscapeOffersLedger_isICDPEnabled] = a6;
  swift_unknownObjectRetain();
  id v15 = a2;

  v29.receiver = v12;
  v29.super_class = (Class)CDPEscapeOffersLedger;
  id v16 = objc_msgSendSuper2(&v29, sel_init);
  uint64_t v17 = qword_267BD7A70;
  id v18 = v16;
  if (v17 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_2186D19E0();
  __swift_project_value_buffer(v19, (uint64_t)qword_267BD8760);
  id v20 = v18;
  uint64_t v21 = sub_2186D19C0();
  os_log_type_t v22 = sub_2186D1B40();
  if (os_log_type_enabled(v21, v22))
  {
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    id v28 = v15;
    unint64_t v24 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v23 = 138412290;
    id v25 = v20;
    sub_2186D1B90();
    *unint64_t v24 = v20;

    _os_log_impl(&dword_218640000, v21, v22, "Ledger: Initialized: %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BD7B88);
    swift_arrayDestroy();
    uint64_t v26 = v24;
    id v15 = v28;
    MEMORY[0x21D470490](v26, -1, -1);
    MEMORY[0x21D470490](v23, -1, -1);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
  return v20;
}

void sub_2186BF35C(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2186D19E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_267BD8760);
  uint64_t v5 = sub_2186D19C0();
  os_log_type_t v6 = sub_2186D1B40();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v11 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v9 = CDPRemoteApprovalEscapeOfferMask.description.getter(a1);
    sub_2186BF898(v9, v10, &v11);
    sub_2186D1B90();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_218640000, v5, v6, "Ledger: User was offered %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D470490](v8, -1, -1);
    MEMORY[0x21D470490](v7, -1, -1);
  }

  *(void *)(v2 + OBJC_IVAR___CDPEscapeOffersLedger__escapeOffersPresented) |= a1 & 0xFFFFFFFFFFFFFFE2;
}

void sub_2186BF554()
{
  uint64_t v1 = v0;
  if (qword_267BD7A70 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2186D19E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_267BD8760);
  unsigned int v3 = sub_2186D19C0();
  os_log_type_t v4 = sub_2186D1B30();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_218640000, v3, v4, "Ledger: Manatee was repaired. Removing Manatee requirements.", v5, 2u);
    MEMORY[0x21D470490](v5, -1, -1);
  }

  *(unsigned char *)(v1 + OBJC_IVAR___CDPEscapeOffersLedger__manateeRepaired) = 1;
}

void __swiftcall CDPEscapeOffersLedger.init()(CDPEscapeOffersLedger *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void CDPEscapeOffersLedger.init()()
{
}

unint64_t type metadata accessor for CDPEscapeOffersLedger()
{
  unint64_t result = qword_267BD7EC8;
  if (!qword_267BD7EC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267BD7EC8);
  }
  return result;
}

uint64_t sub_2186BF7AC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2186BF7BC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2186BF7F8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2186BF820(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2186BF898(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2186D1B90();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2186BF898(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2186BF96C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2186BFF00((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2186BFF00((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2186BF96C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2186D1BA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2186BFB28(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_2186D1BF0();
  if (!v8)
  {
    sub_2186D1C10();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2186D1C40();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_2186BFB28(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2186BFBC0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2186BFDA0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2186BFDA0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2186BFBC0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_2186BFD38(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2186D1BD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2186D1C10();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2186D1A70();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2186D1C40();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2186D1C10();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2186BFD38(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BD7ED0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2186BFDA0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BD7ED0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unsigned __int8 v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2186D1C40();
  __break(1u);
  return result;
}

unsigned char **sub_2186BFEF0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_2186BFF00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_2186BFF5C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_2186D1C40();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_2186C0000(uint64_t (*a1)(void))
{
  return a1();
}

void sub_2186C0028(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_2186D1B90();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_2186C00E0@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

char *sub_2186C0110(uint64_t a1, int64_t a2, char a3, uint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v6 = *v4;
  int64_t v7 = *((void *)*v4 + 2);
  if (v7 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v10 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v11 = v7 + v10;
  if (__OFADD__(v7, v10))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v11 > *((void *)v6 + 3) >> 1)
  {
    if (v7 <= v11) {
      int64_t v15 = v7 + v10;
    }
    else {
      int64_t v15 = v7;
    }
    uint64_t result = (char *)sub_2186B5360(result, v15, 1, v6);
    unint64_t v6 = result;
  }
  uint64_t v16 = (uint64_t)&v6[16 * a1 + 32];
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v17 = *((void *)v6 + 2);
  BOOL v18 = __OFSUB__(v17, a2);
  uint64_t v19 = v17 - a2;
  if (v18) {
    goto LABEL_26;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    uint64_t result = (char *)(v16 + 16);
    id v20 = &v6[16 * a2 + 32];
    if ((char *)(v16 + 16) != v20 || result >= &v20[16 * v19]) {
      uint64_t result = (char *)memmove(result, v20, 16 * v19);
    }
    uint64_t v21 = *((void *)v6 + 2);
    BOOL v18 = __OFADD__(v21, v10);
    uint64_t v22 = v21 + v10;
    if (!v18)
    {
      *((void *)v6 + 2) = v22;
LABEL_20:
      *(unsigned char *)uint64_t v16 = a3 & 1;
      *(void *)(v16 + 8) = a4;
      *uint64_t v4 = v6;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = (char *)sub_2186D1C40();
  __break(1u);
  return result;
}

unint64_t sub_2186C0288(uint64_t a1, uint64_t a2)
{
  sub_2186D1C80();
  sub_2186D1A40();
  uint64_t v4 = sub_2186D1CA0();
  return sub_2186C0300(a1, a2, v4);
}

unint64_t sub_2186C0300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2186D1C60() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unsigned __int8 v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2186D1C60() & 1) == 0);
    }
  }
  return v6;
}

void sub_2186C03E4(char a1, uint64_t a2, void *a3)
{
  if (a1 != 2)
  {
    v3[0] = a1 & 1;
    uint64_t v4 = a2;
    sub_2186BEE64((uint64_t)v3, a3, &v5);
  }
}

uint64_t sub_2186C0440(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BD7EF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2186C04A8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t _s9ConditionVwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t _s9ConditionVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *_s9ConditionVMa()
{
  return &_s9ConditionVN;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CDPFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CDPFeatureFlags(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x2186C06D4);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_2186C06FC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2186C0708(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CDPFeatureFlags()
{
  return &type metadata for CDPFeatureFlags;
}

unint64_t sub_2186C0728()
{
  unint64_t result = qword_267BD7F10;
  if (!qword_267BD7F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BD7F10);
  }
  return result;
}

BOOL sub_2186C077C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2186C0794()
{
  return sub_2186D1CA0();
}

uint64_t sub_2186C07DC()
{
  return sub_2186D1C90();
}

uint64_t sub_2186C0808()
{
  return sub_2186D1CA0();
}

const char *sub_2186C084C()
{
  if (*v0) {
    return "CloudServices";
  }
  else {
    return "AppleAccount";
  }
}

const char *sub_2186C0878()
{
  if (*v0) {
    return "Guitarfish";
  }
  else {
    return "AABranding";
  }
}

uint64_t __getLAContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getLAEnvironmentClass_block_invoke_cold_1(v0);
}

void __getLAEnvironmentClass_block_invoke_cold_1()
{
}

void __getUMUserManagerClass_block_invoke_cold_1()
{
}

uint64_t sub_2186D1960()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2186D1970()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2186D1980()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2186D19A0()
{
  return MEMORY[0x270F08428]();
}

uint64_t sub_2186D19B0()
{
  return MEMORY[0x270F08430]();
}

uint64_t sub_2186D19C0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2186D19D0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2186D19E0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2186D19F0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2186D1A00()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2186D1A10()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2186D1A20()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2186D1A30()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2186D1A40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2186D1A50()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2186D1A60()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_2186D1A70()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2186D1A80()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2186D1A90()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2186D1AA0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2186D1AB0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2186D1AC0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2186D1AD0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2186D1AE0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2186D1AF0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2186D1B00()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2186D1B10()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2186D1B20()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2186D1B30()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2186D1B40()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2186D1B50()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2186D1B60()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2186D1B70()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2186D1B80()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_2186D1B90()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2186D1BA0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2186D1BC0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2186D1BD0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2186D1BE0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2186D1BF0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2186D1C00()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2186D1C10()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2186D1C20()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2186D1C30()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2186D1C40()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2186D1C50()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_2186D1C60()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2186D1C70()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_2186D1C80()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2186D1C90()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2186D1CA0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A40]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x270ED7910]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x270ED7918]();
}

uint64_t CDPContextTypeAnalyticsString()
{
  return MEMORY[0x270F18B40]();
}

uint64_t CDPDaemonExportedInterface()
{
  return MEMORY[0x270F18B48]();
}

uint64_t CDPEscrowRecordStateString()
{
  return MEMORY[0x270F18B50]();
}

uint64_t CDPLocalizedString()
{
  return MEMORY[0x270F18B58]();
}

uint64_t CDPLocalizedStringInTable()
{
  return MEMORY[0x270F18B60]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PCSIdentitySetCreate()
{
  return MEMORY[0x270F584A8]();
}

uint64_t PCSIdentitySetEnumerateIdentities()
{
  return MEMORY[0x270F584B8]();
}

uint64_t PCSIdentitySetIsICDP()
{
  return MEMORY[0x270F584C0]();
}

uint64_t PCSIdentitySetIsICDPNetwork()
{
  return MEMORY[0x270F584C8]();
}

uint64_t PCSIdentitySetIsICDPNetworkWithOptions()
{
  return MEMORY[0x270F584D0]();
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

uint64_t SOSCCCopyMyPeerInfo()
{
  return MEMORY[0x270EFD408]();
}

uint64_t SOSCCCopyMyPeerWithNewDeviceRecoverySecret()
{
  return MEMORY[0x270EFD410]();
}

uint64_t SOSCCFetchCompatibilityMode()
{
  return MEMORY[0x270EFD428]();
}

uint64_t SOSCCRegisterRecoveryPublicKey()
{
  return MEMORY[0x270EFD458]();
}

uint64_t SOSCCResetToOffering()
{
  return MEMORY[0x270EFD488]();
}

uint64_t SOSCCSetCompatibilityMode()
{
  return MEMORY[0x270EFD490]();
}

uint64_t SOSPeerInfoCopyBackupKey()
{
  return MEMORY[0x270EFD4D8]();
}

uint64_t SecPasswordGenerate()
{
  return MEMORY[0x270EFDAF0]();
}

uint64_t SecRKCreateRecoveryKeyWithError()
{
  return MEMORY[0x270EFDC10]();
}

uint64_t SecRKRegisterBackupPublicKey()
{
  return MEMORY[0x270EFDC18]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x270EFDCA0](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

uint64_t _AKLogSystem()
{
  return MEMORY[0x270F0FFD8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CDPLogSystem()
{
  return MEMORY[0x270F18B68]();
}

uint64_t _CDPLogSystemAnalytics()
{
  return MEMORY[0x270F18B70]();
}

uint64_t _CDPSignpostCreate()
{
  return MEMORY[0x270F18B78]();
}

uint64_t _CDPSignpostGetNanoseconds()
{
  return MEMORY[0x270F18B80]();
}

uint64_t _CDPSignpostLogSystem()
{
  return MEMORY[0x270F18B88]();
}

uint64_t _CDPStateError()
{
  return MEMORY[0x270F18B90]();
}

uint64_t _CDPStateErrorWithUnderlying()
{
  return MEMORY[0x270F18B98]();
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x270EE55A0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _PCSIdentityGetKey()
{
  return MEMORY[0x270F58510]();
}

uint64_t _PCSKeyCopyExportedPrivateKey()
{
  return MEMORY[0x270F58520]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

uint64_t cdp_dispatch_after_with_qos()
{
  return MEMORY[0x270F18BA0]();
}

uint64_t cdp_dispatch_async_with_qos()
{
  return MEMORY[0x270F18BA8]();
}

uint64_t cdp_dispatch_sync_with_qos()
{
  return MEMORY[0x270F18BB0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
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

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}