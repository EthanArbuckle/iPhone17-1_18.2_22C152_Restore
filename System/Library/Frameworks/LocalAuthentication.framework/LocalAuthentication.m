void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1BED07C74(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1BED0860C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BED08EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BED09484(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BED09718(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Block_object_dispose((const void *)(v2 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BED098C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BED0A900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED0AF90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BED0B15C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BED0B314(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BED0B4CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BED0B6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED0B7F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BED0B990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED0BC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED0BE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED0C07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getTKBERTLVRecordClass()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2050000000;
  v0 = (void *)getTKBERTLVRecordClass_softClass;
  uint64_t v6 = getTKBERTLVRecordClass_softClass;
  if (!getTKBERTLVRecordClass_softClass)
  {
    CryptoTokenKitLibraryCore();
    v4[3] = (uint64_t)objc_getClass("TKBERTLVRecord");
    getTKBERTLVRecordClass_softClass = v4[3];
    v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_1BED0CBA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED0CFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTKBERTLVRecordClass_block_invoke(uint64_t a1)
{
  CryptoTokenKitLibraryCore();
  Class result = objc_getClass("TKBERTLVRecord");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getTKBERTLVRecordClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CryptoTokenKitLibraryCore()
{
  if (!CryptoTokenKitLibraryCore_frameworkLibrary) {
    CryptoTokenKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
}

uint64_t __CryptoTokenKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CryptoTokenKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getTKTLVRecordClass_block_invoke(uint64_t a1)
{
  CryptoTokenKitLibraryCore();
  Class result = objc_getClass("TKTLVRecord");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getTKTLVRecordClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BED0E470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED0E720(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1BED0E9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BED0EB6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BED0F0EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BED0F16C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BED0F3A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id LA_LOG()
{
  if (LA_LOG_once != -1) {
    dispatch_once(&LA_LOG_once, &__block_literal_global_150);
  }
  v0 = (void *)LA_LOG_log;

  return v0;
}

void sub_1BED101C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_1BED10658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1BED10DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

id LA_LOG_0()
{
  if (LA_LOG_once_0 != -1) {
    dispatch_once(&LA_LOG_once_0, &__block_literal_global_84);
  }
  v0 = (void *)LA_LOG_log_0;

  return v0;
}

void sub_1BED12B7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED12FD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED134F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED14530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED14A8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED14F88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED1555C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED15A04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED15E3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED16530(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

Class __getLAContextUITrampolineClass_block_invoke(uint64_t a1)
{
  if (!LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary) {
    LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("LAContextUITrampoline");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getLAContextUITrampolineClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LocalAuthenticationEmbeddedUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationEmbeddedUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BED169E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1BED16CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED17234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED17530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED17918(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1BED17BC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1BED1806C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED18450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED185AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED18CC4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BED1911C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED193AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED19668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED199EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id LA_LOG_1()
{
  if (LA_LOG_once_1 != -1) {
    dispatch_once(&LA_LOG_once_1, &__block_literal_global_3);
  }
  v0 = (void *)LA_LOG_log_1;

  return v0;
}

id LA_LOG_2()
{
  if (LA_LOG_once_2 != -1) {
    dispatch_once(&LA_LOG_once_2, &__block_literal_global_4);
  }
  v0 = (void *)LA_LOG_log_2;

  return v0;
}

void sub_1BED1C1AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED1ED84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BED1EF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BED1F204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id LA_LOG_laabio()
{
  if (LA_LOG_laabio_once != -1) {
    dispatch_once(&LA_LOG_laabio_once, &__block_literal_global_7);
  }
  v0 = (void *)LA_LOG_laabio_log;

  return v0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id LA_LOG_3()
{
  if (LA_LOG_once_4 != -1) {
    dispatch_once(&LA_LOG_once_4, &__block_literal_global_8);
  }
  v0 = (void *)LA_LOG_log_4;

  return v0;
}

void sub_1BED24D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED25168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BED25758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED25898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED259D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1BED25B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BED25DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BED25FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BED26450(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x26u);
}

void sub_1BED275D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED2A1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BED2A438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BED2A71C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BED2AA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BED2AEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED2B83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BED2BAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED2D090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t LACopyExternalizedContext(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1C189BC00]();
  uint64_t v3 = [a1 externalizedContext];
  return v3;
}

uint64_t _LAMKBLockDevice(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))getMKBLockDeviceSymbolLoc_ptr;
  uint64_t v11 = getMKBLockDeviceSymbolLoc_ptr;
  if (!getMKBLockDeviceSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBLockDeviceSymbolLoc_block_invoke;
    uint64_t v13 = &unk_1E63C3EB0;
    uint64_t v14 = &v8;
    uint64_t v3 = (void *)MobileKeyBagLibrary();
    uint64_t v4 = dlsym(v3, "MKBLockDevice");
    *(void *)(v14[1] + 24) = v4;
    getMKBLockDeviceSymbolLoc_ptr = *(_UNKNOWN **)(v14[1] + 24);
    uint64_t v2 = (uint64_t (*)(uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v5 = v2(a1);
  uint64_t v6 = +[_LAMKBLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "_LAMKBLockDevice";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a1;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v13) = v5;
    _os_log_impl(&dword_1BED06000, v6, OS_LOG_TYPE_INFO, "%s:options:%@ -> %d", buf, 0x1Cu);
  }

  return v5;
}

void sub_1BED2E50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBUnlockDevice(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))getMKBUnlockDeviceSymbolLoc_ptr;
  uint64_t v13 = getMKBUnlockDeviceSymbolLoc_ptr;
  if (!getMKBUnlockDeviceSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBUnlockDeviceSymbolLoc_block_invoke;
    uint64_t v15 = &unk_1E63C3EB0;
    uint64_t v16 = &v10;
    uint64_t v5 = (void *)MobileKeyBagLibrary();
    uint64_t v6 = dlsym(v5, "MKBUnlockDevice");
    *(void *)(v16[1] + 24) = v6;
    getMKBUnlockDeviceSymbolLoc_ptr = *(_UNKNOWN **)(v16[1] + 24);
    uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v4)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v7 = v4(a1, a2);
  uint64_t v8 = +[_LAMKBLog log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "_LAMKBUnlockDevice";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a2;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v15) = v7;
    _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_INFO, "%s:options:%@ -> %d", buf, 0x1Cu);
  }

  return v7;
}

void sub_1BED2E6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBGetDeviceConfigurations(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))getMKBGetDeviceConfigurationsSymbolLoc_ptr;
  uint64_t v11 = getMKBGetDeviceConfigurationsSymbolLoc_ptr;
  if (!getMKBGetDeviceConfigurationsSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBGetDeviceConfigurationsSymbolLoc_block_invoke;
    uint64_t v13 = &unk_1E63C3EB0;
    uint64_t v14 = &v8;
    uint64_t v3 = (void *)MobileKeyBagLibrary();
    uint64_t v4 = dlsym(v3, "MKBGetDeviceConfigurations");
    *(void *)(v14[1] + 24) = v4;
    getMKBGetDeviceConfigurationsSymbolLoc_ptr = *(_UNKNOWN **)(v14[1] + 24);
    uint64_t v2 = (uint64_t (*)(uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v5 = v2(a1);
  uint64_t v6 = +[_LAMKBLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "_LAMKBGetDeviceConfigurations";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a1;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v13 = (void *)v5;
    _os_log_impl(&dword_1BED06000, v6, OS_LOG_TYPE_INFO, "%s:options:%@ -> %@", buf, 0x20u);
  }

  return v5;
}

void sub_1BED2E890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBGetDeviceLockState(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))getMKBGetDeviceLockStateSymbolLoc_ptr;
  uint64_t v11 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    uint64_t v13 = &unk_1E63C3EB0;
    uint64_t v14 = &v8;
    uint64_t v3 = (void *)MobileKeyBagLibrary();
    uint64_t v4 = dlsym(v3, "MKBGetDeviceLockState");
    *(void *)(v14[1] + 24) = v4;
    getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(v14[1] + 24);
    uint64_t v2 = (uint64_t (*)(uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v5 = v2(a1);
  uint64_t v6 = +[_LAMKBLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "_LAMKBGetDeviceLockState";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a1;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v13) = v5;
    _os_log_impl(&dword_1BED06000, v6, OS_LOG_TYPE_INFO, "%s:options:%@ -> %d", buf, 0x1Cu);
  }

  return v5;
}

void sub_1BED2EA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBGetDeviceLockStateInfo(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))getMKBGetDeviceLockStateInfoSymbolLoc_ptr;
  uint64_t v11 = getMKBGetDeviceLockStateInfoSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateInfoSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBGetDeviceLockStateInfoSymbolLoc_block_invoke;
    uint64_t v13 = &unk_1E63C3EB0;
    uint64_t v14 = &v8;
    uint64_t v3 = (void *)MobileKeyBagLibrary();
    uint64_t v4 = dlsym(v3, "MKBGetDeviceLockStateInfo");
    *(void *)(v14[1] + 24) = v4;
    getMKBGetDeviceLockStateInfoSymbolLoc_ptr = *(_UNKNOWN **)(v14[1] + 24);
    uint64_t v2 = (uint64_t (*)(uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v5 = v2(a1);
  uint64_t v6 = +[_LAMKBLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "_LAMKBGetDeviceLockStateInfo";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a1;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v13 = (void *)v5;
    _os_log_impl(&dword_1BED06000, v6, OS_LOG_TYPE_INFO, "%s:options:%@ -> %@", buf, 0x20u);
  }

  return v5;
}

void sub_1BED2EC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBDeviceUnlockedSinceBoot()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v0 = (uint64_t (*)(uint64_t))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  uint64_t v10 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    uint64_t v12 = &unk_1E63C3EB0;
    uint64_t v13 = &v7;
    uint64_t v1 = (void *)MobileKeyBagLibrary();
    uint64_t v2 = dlsym(v1, "MKBDeviceUnlockedSinceBoot");
    *(void *)(v13[1] + 24) = v2;
    getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(v13[1] + 24);
    v0 = (uint64_t (*)(uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v0)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v4 = v0(v3);
  uint64_t v5 = +[_LAMKBLog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "_LAMKBDeviceUnlockedSinceBoot";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1BED06000, v5, OS_LOG_TYPE_INFO, "%s:: -> %d", buf, 0x12u);
  }

  return v4;
}

void sub_1BED2EDB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBDeviceLockAssertion(uint64_t a1, uint64_t *a2)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t *))getMKBDeviceLockAssertionSymbolLoc_ptr;
  uint64_t v14 = getMKBDeviceLockAssertionSymbolLoc_ptr;
  if (!getMKBDeviceLockAssertionSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBDeviceLockAssertionSymbolLoc_block_invoke;
    uint64_t v16 = &unk_1E63C3EB0;
    v17[0] = &v11;
    uint64_t v5 = (void *)MobileKeyBagLibrary();
    uint64_t v6 = dlsym(v5, "MKBDeviceLockAssertion");
    *(void *)(*(void *)(v17[0] + 8) + 24) = v6;
    getMKBDeviceLockAssertionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(v17[0] + 8) + 24);
    uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t *))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v4)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v7 = v4(a1, a2);
  uint64_t v8 = +[_LAMKBLog log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if (a2) {
      uint64_t v9 = *a2;
    }
    else {
      uint64_t v9 = 0;
    }
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "_LAMKBDeviceLockAssertion";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a1;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v16 = (void *)v7;
    LOWORD(v17[0]) = 2112;
    *(void *)((char *)v17 + 2) = v9;
    _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_INFO, "%s:options:%@ -> %@ (%@)", buf, 0x2Au);
  }

  return v7;
}

void sub_1BED2EF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBKeyBagKeyStashCreateWithOpts(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))getMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr;
  uint64_t v18 = getMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr;
  if (!getMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBKeyBagKeyStashCreateWithOptsSymbolLoc_block_invoke;
    *(void *)&long long v20 = &unk_1E63C3EB0;
    *((void *)&v20 + 1) = &v15;
    uint64_t v9 = (void *)MobileKeyBagLibrary();
    uint64_t v10 = dlsym(v9, "MKBKeyBagKeyStashCreateWithOpts");
    *(void *)(*(void *)(*((void *)&v20 + 1) + 8) + 24) = v10;
    getMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*((void *)&v20 + 1) + 8) + 24);
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v8)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v11 = v8(a1, a2, a3, a4);
  uint64_t v12 = +[_LAMKBLog log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = "<...>";
    *(_DWORD *)buf = 136316418;
    *(void *)&buf[4] = "_LAMKBKeyBagKeyStashCreateWithOpts";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a1;
    if (!a4) {
      uint64_t v13 = "NULL";
    }
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v20) = a2;
    WORD2(v20) = 2112;
    *(void *)((char *)&v20 + 6) = a3;
    HIWORD(v20) = 2080;
    v21 = v13;
    __int16 v22 = 1024;
    int v23 = v11;
    _os_log_impl(&dword_1BED06000, v12, OS_LOG_TYPE_INFO, "%s:options:%@ stash_mode:%d ACMRef:%@ passcode:%s -> %d", buf, 0x36u);
  }

  return v11;
}

void sub_1BED2F1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBKeyBagKeyStashCommit()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v0 = (uint64_t (*)(uint64_t))getMKBKeyBagKeyStashCommitSymbolLoc_ptr;
  uint64_t v10 = getMKBKeyBagKeyStashCommitSymbolLoc_ptr;
  if (!getMKBKeyBagKeyStashCommitSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBKeyBagKeyStashCommitSymbolLoc_block_invoke;
    uint64_t v12 = &unk_1E63C3EB0;
    uint64_t v13 = &v7;
    uint64_t v1 = (void *)MobileKeyBagLibrary();
    uint64_t v2 = dlsym(v1, "MKBKeyBagKeyStashCommit");
    *(void *)(v13[1] + 24) = v2;
    getMKBKeyBagKeyStashCommitSymbolLoc_ptr = *(_UNKNOWN **)(v13[1] + 24);
    v0 = (uint64_t (*)(uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v0)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v4 = v0(v3);
  uint64_t v5 = +[_LAMKBLog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "_LAMKBKeyBagKeyStashCommit";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1BED06000, v5, OS_LOG_TYPE_INFO, "%s:: -> %d", buf, 0x12u);
  }

  return v4;
}

void sub_1BED2F344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBKeyBagKeyStashVerify()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v0 = (uint64_t (*)(uint64_t))getMKBKeyBagKeyStashVerifySymbolLoc_ptr;
  uint64_t v10 = getMKBKeyBagKeyStashVerifySymbolLoc_ptr;
  if (!getMKBKeyBagKeyStashVerifySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBKeyBagKeyStashVerifySymbolLoc_block_invoke;
    uint64_t v12 = &unk_1E63C3EB0;
    uint64_t v13 = &v7;
    uint64_t v1 = (void *)MobileKeyBagLibrary();
    uint64_t v2 = dlsym(v1, "MKBKeyBagKeyStashVerify");
    *(void *)(v13[1] + 24) = v2;
    getMKBKeyBagKeyStashVerifySymbolLoc_ptr = *(_UNKNOWN **)(v13[1] + 24);
    v0 = (uint64_t (*)(uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v0)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v4 = v0(v3);
  uint64_t v5 = +[_LAMKBLog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "_LAMKBKeyBagKeyStashVerify";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1BED06000, v5, OS_LOG_TYPE_INFO, "%s:: -> %@", buf, 0x16u);
  }

  return v4;
}

void sub_1BED2F4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBEventsRegister(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___LAMKBEventsRegister_block_invoke;
  v14[3] = &unk_1E63C5508;
  id v5 = v4;
  id v15 = v5;
  id v6 = v3;
  uint64_t v7 = v14;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v8 = (uint64_t (*)(id, void *))getMKBEventsRegisterSymbolLoc_ptr;
  v19 = getMKBEventsRegisterSymbolLoc_ptr;
  if (!getMKBEventsRegisterSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBEventsRegisterSymbolLoc_block_invoke;
    v21 = &unk_1E63C3EB0;
    __int16 v22 = &v16;
    uint64_t v9 = (void *)MobileKeyBagLibrary();
    uint64_t v10 = dlsym(v9, "MKBEventsRegister");
    *(void *)(v22[1] + 24) = v10;
    getMKBEventsRegisterSymbolLoc_ptr = *(_UNKNOWN **)(v22[1] + 24);
    uint64_t v8 = (uint64_t (*)(id, void *))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v8)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v11 = v8(v6, v7);

  uint64_t v12 = +[_LAMKBLog log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "_LAMKBEventsRegister";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2048;
    v21 = (void *)v11;
    _os_log_impl(&dword_1BED06000, v12, OS_LOG_TYPE_INFO, "%s:queue:%@ -> %p", buf, 0x20u);
  }

  return v11;
}

void sub_1BED2F738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _LAMKBEventsUnregister(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (void (*)(uint64_t))getMKBEventsUnregisterSymbolLoc_ptr;
  uint64_t v9 = getMKBEventsUnregisterSymbolLoc_ptr;
  if (!getMKBEventsUnregisterSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBEventsUnregisterSymbolLoc_block_invoke;
    uint64_t v11 = &unk_1E63C3EB0;
    uint64_t v12 = &v6;
    id v3 = (void *)MobileKeyBagLibrary();
    id v4 = dlsym(v3, "MKBEventsUnregister");
    *(void *)(v12[1] + 24) = v4;
    getMKBEventsUnregisterSymbolLoc_ptr = *(_UNKNOWN **)(v12[1] + 24);
    uint64_t v2 = (void (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  v2(a1);
  id v5 = +[_LAMKBLog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "_LAMKBEventsUnregister";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a1;
    _os_log_impl(&dword_1BED06000, v5, OS_LOG_TYPE_INFO, "%s:ref:%p", buf, 0x16u);
  }
}

void sub_1BED2F9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBKeyBagPerformRecovery(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v4 = (uint64_t (*)(uint64_t, void *))getMKBKeyBagPerformRecoverySymbolLoc_ptr;
  uint64_t v14 = getMKBKeyBagPerformRecoverySymbolLoc_ptr;
  if (!getMKBKeyBagPerformRecoverySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBKeyBagPerformRecoverySymbolLoc_block_invoke;
    uint64_t v16 = &unk_1E63C3EB0;
    uint64_t v17 = &v11;
    id v5 = (void *)MobileKeyBagLibrary();
    uint64_t v6 = dlsym(v5, "MKBKeyBagPerformRecovery");
    *(void *)(v17[1] + 24) = v6;
    getMKBKeyBagPerformRecoverySymbolLoc_ptr = *(_UNKNOWN **)(v17[1] + 24);
    id v4 = (uint64_t (*)(uint64_t, void *))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v4)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v7 = v4(a1, a2);
  uint64_t v8 = +[_LAMKBLog log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = "<...>";
    *(void *)&buf[4] = "_LAMKBKeyBagPerformRecovery";
    *(_WORD *)&buf[12] = 2080;
    *(_DWORD *)buf = 136315906;
    if (!a1) {
      uint64_t v9 = "NULL";
    }
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v16 = a2;
    LOWORD(v17) = 1024;
    *(_DWORD *)((char *)&v17 + 2) = v7;
    _os_log_impl(&dword_1BED06000, v8, OS_LOG_TYPE_INFO, "%s:secret:%s option:%@ -> %d", buf, 0x26u);
  }

  return v7;
}

void sub_1BED2FBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _LAMKBPrewarmSPS(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))getMKBPrewarmSPSSymbolLoc_ptr;
  uint64_t v11 = getMKBPrewarmSPSSymbolLoc_ptr;
  if (!getMKBPrewarmSPSSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMKBPrewarmSPSSymbolLoc_block_invoke;
    uint64_t v13 = &unk_1E63C3EB0;
    uint64_t v14 = &v8;
    id v3 = (void *)MobileKeyBagLibrary();
    id v4 = dlsym(v3, "MKBPrewarmSPS");
    *(void *)(v14[1] + 24) = v4;
    getMKBPrewarmSPSSymbolLoc_ptr = *(_UNKNOWN **)(v14[1] + 24);
    uint64_t v2 = (uint64_t (*)(uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    _LAMKBLockDevice_cold_1();
    __break(1u);
  }
  uint64_t v5 = v2(a1);
  uint64_t v6 = +[_LAMKBLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "_LAMKBPrewarmSPS";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a1;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v13) = v5;
    _os_log_impl(&dword_1BED06000, v6, OS_LOG_TYPE_INFO, "%s:options:%@ -> %d", buf, 0x1Cu);
  }

  return v5;
}

void sub_1BED2FD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *__getMKBLockDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBLockDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBLockDeviceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileKeyBagLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MobileKeyBagLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E63C5528;
    uint64_t v5 = 0;
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MobileKeyBagLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMKBUnlockDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBUnlockDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBUnlockDeviceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBGetDeviceConfigurationsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBGetDeviceConfigurations");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceConfigurationsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBGetDeviceLockStateInfoSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBGetDeviceLockStateInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateInfoSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBDeviceLockAssertionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBDeviceLockAssertion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceLockAssertionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBKeyBagKeyStashCreateWithOptsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBKeyBagKeyStashCreateWithOpts");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBKeyBagKeyStashCreateWithOptsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBKeyBagKeyStashCommitSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBKeyBagKeyStashCommit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBKeyBagKeyStashCommitSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBKeyBagKeyStashVerifySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBKeyBagKeyStashVerify");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBKeyBagKeyStashVerifySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBEventsRegisterSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBEventsRegister");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBEventsRegisterSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBEventsUnregisterSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBEventsUnregister");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBEventsUnregisterSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBKeyBagPerformRecoverySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBKeyBagPerformRecovery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBKeyBagPerformRecoverySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMKBPrewarmSPSSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileKeyBagLibrary();
  uint64_t result = dlsym(v2, "MKBPrewarmSPS");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBPrewarmSPSSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id LA_LOG_4()
{
  if (LA_LOG_once_5 != -1) {
    dispatch_once(&LA_LOG_once_5, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)LA_LOG_log_5;

  return v0;
}

void sub_1BED30A10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED30F90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED31664(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromLARatchetStateRawValue(unint64_t a1)
{
  if (a1 > 4) {
    return &stru_1F19E1C60;
  }
  else {
    return off_1E63C55C0[a1];
  }
}

__CFString *NSStringFromLARatchetStateDuration(double a1)
{
  if (*MEMORY[0x1E4F72E40] == a1)
  {
    uint64_t v1 = @"INF";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ds", (int)a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

id LA_LOG_5()
{
  if (LA_LOG_once_6 != -1) {
    dispatch_once(&LA_LOG_once_6, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)LA_LOG_log_6;

  return v0;
}

void sub_1BED32CC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED3347C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED33C1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BED34874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BED35504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBKDeviceDescriptorClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  Class result = objc_getClass("BKDeviceDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBKDeviceDescriptorClass_block_invoke_cold_1();
    return (Class)BiometricKitLibrary();
  }
  return result;
}

uint64_t BiometricKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __BiometricKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E63C5660;
    uint64_t v5 = 0;
    BiometricKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = BiometricKitLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __BiometricKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiometricKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getBKDeviceClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  Class result = objc_getClass("BKDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBKDeviceClass_block_invoke_cold_1();
    return (Class)__getBKErrorDomainSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getBKErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BiometricKitLibrary();
  Class result = dlsym(v2, "BKErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBKErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBKMatchPearlOperationClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  Class result = objc_getClass("BKMatchPearlOperation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKMatchPearlOperationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBKMatchPearlOperationClass_block_invoke_cold_1();
    return (Class)__getBKMatchOperationClass_block_invoke(v3);
  }
  return result;
}

Class __getBKMatchOperationClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  Class result = objc_getClass("BKMatchOperation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKMatchOperationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBKMatchOperationClass_block_invoke_cold_1();
    return (Class)__getBKFaceDetectOperationClass_block_invoke(v3);
  }
  return result;
}

Class __getBKFaceDetectOperationClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  Class result = objc_getClass("BKFaceDetectOperation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKFaceDetectOperationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBKFaceDetectOperationClass_block_invoke_cold_1();
    return (Class)__getBKFingerDetectOperationClass_block_invoke(v3);
  }
  return result;
}

Class __getBKFingerDetectOperationClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  Class result = objc_getClass("BKFingerDetectOperation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKFingerDetectOperationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBKFingerDetectOperationClass_block_invoke_cold_1();
    return (Class)__getBKPresenceDetectOperationClass_block_invoke(v3);
  }
  return result;
}

void __getBKPresenceDetectOperationClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BKPresenceDetectOperation");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKPresenceDetectOperationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBKPresenceDetectOperationClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0_3();
  }
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_1BED3861C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id LA_LOG_6()
{
  if (LA_LOG_once_7 != -1) {
    dispatch_once(&LA_LOG_once_7, &__block_literal_global_212);
  }
  uint64_t v0 = (void *)LA_LOG_log_7;

  return v0;
}

void sub_1BED38884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BED38BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t LADomainStateCompanion.availableCompanionTypes.getter()
{
  id v1 = objc_msgSend(v0, sel_availableCompanionTypes);
  sub_1BED39924();
  sub_1BED3A96C(&qword_1EA132F40, (void (*)(uint64_t))sub_1BED39924);
  uint64_t v2 = sub_1BED3D0A0();

  uint64_t v3 = sub_1BED39964(v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_1BED3A7D0(v3);
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_1BED39924()
{
  unint64_t result = qword_1EA132F38;
  if (!qword_1EA132F38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA132F38);
  }
  return result;
}

uint64_t sub_1BED39964(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1BED3D0D0();
    sub_1BED39924();
    sub_1BED3A96C(&qword_1EA132F40, (void (*)(uint64_t))sub_1BED39924);
    uint64_t result = sub_1BED3D0C0();
    uint64_t v1 = v22;
    uint64_t v21 = v23;
    uint64_t v3 = v24;
    uint64_t v4 = v25;
    unint64_t v5 = v26;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v21 = a1 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = 0;
  }
  int64_t v20 = (unint64_t)(v3 + 64) >> 6;
  uint64_t v9 = MEMORY[0x1E4FBC860];
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
      uint64_t v12 = v4;
      goto LABEL_29;
    }
    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v14 >= v20) {
      goto LABEL_36;
    }
    unint64_t v15 = *(void *)(v21 + 8 * v14);
    uint64_t v12 = v4 + 1;
    if (!v15)
    {
      uint64_t v12 = v4 + 2;
      if (v4 + 2 >= v20) {
        goto LABEL_36;
      }
      unint64_t v15 = *(void *)(v21 + 8 * v12);
      if (!v15)
      {
        uint64_t v12 = v4 + 3;
        if (v4 + 3 >= v20) {
          goto LABEL_36;
        }
        unint64_t v15 = *(void *)(v21 + 8 * v12);
        if (!v15)
        {
          uint64_t v12 = v4 + 4;
          if (v4 + 4 >= v20) {
            goto LABEL_36;
          }
          unint64_t v15 = *(void *)(v21 + 8 * v12);
          if (!v15)
          {
            uint64_t v12 = v4 + 5;
            if (v4 + 5 >= v20) {
              goto LABEL_36;
            }
            unint64_t v15 = *(void *)(v21 + 8 * v12);
            if (!v15)
            {
              uint64_t v16 = v4 + 6;
              while (v20 != v16)
              {
                unint64_t v15 = *(void *)(v21 + 8 * v16++);
                if (v15)
                {
                  uint64_t v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_36:
              sub_1BED3A918();
              return v9;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
    id v13 = *(id *)(*(void *)(v1 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_36;
    }
    while (1)
    {
      id v17 = objc_msgSend(v13, sel_integerValue);

      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1BED3A6D4(0, *(void *)(v9 + 16) + 1, 1, (char *)v9);
        uint64_t v9 = result;
      }
      unint64_t v19 = *(void *)(v9 + 16);
      unint64_t v18 = *(void *)(v9 + 24);
      if (v19 >= v18 >> 1)
      {
        uint64_t result = (uint64_t)sub_1BED3A6D4((char *)(v18 > 1), v19 + 1, 1, (char *)v9);
        uint64_t v9 = result;
      }
      *(void *)(v9 + 16) = v19 + 1;
      *(void *)(v9 + 8 * v19 + 32) = v17;
      uint64_t v4 = v12;
      unint64_t v5 = v10;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_1BED3D0E0())
      {
        sub_1BED39924();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v13 = v27;
        swift_unknownObjectRelease();
        uint64_t v12 = v4;
        uint64_t v10 = v5;
        if (v27) {
          continue;
        }
      }
      goto LABEL_36;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1BED39CBC()
{
  return sub_1BED3D140();
}

uint64_t sub_1BED39D04()
{
  return sub_1BED3D130();
}

uint64_t sub_1BED39D30()
{
  return sub_1BED3D140();
}

BOOL sub_1BED39D74(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_1BED39D88@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + _Block_object_dispose(&a9, 8) = 0;
  return result;
}

void sub_1BED39D98(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1BED39DA4(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_1BED3D120();
  sub_1BED3D130();
  uint64_t v6 = sub_1BED3D140();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_1BED3A170(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_1BED39EC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA132F50);
  uint64_t result = sub_1BED3D100();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_1BED3D120();
      sub_1BED3D130();
      uint64_t result = sub_1BED3D140();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1BED3A170(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1BED39EC4();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_1BED3A2C0();
      goto LABEL_14;
    }
    sub_1BED3A458();
  }
  uint64_t v8 = *v3;
  sub_1BED3D120();
  sub_1BED3D130();
  uint64_t result = sub_1BED3D140();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for LACompanionType();
      uint64_t result = sub_1BED3D110();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_1BED3A2C0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA132F50);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BED3D0F0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1BED3A458()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA132F50);
  uint64_t result = sub_1BED3D100();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_1BED3D120();
    sub_1BED3D130();
    uint64_t result = sub_1BED3D140();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_1BED3A6D4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA132F58);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1BED3A7D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for LACompanionType();
  sub_1BED3A96C(&qword_1EA132F48, (void (*)(uint64_t))type metadata accessor for LACompanionType);
  uint64_t result = sub_1BED3D0B0();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      sub_1BED39DA4(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

void type metadata accessor for LACompanionType()
{
  if (!qword_1EA132F60)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA132F60);
    }
  }
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

uint64_t sub_1BED3A918()
{
  return swift_release();
}

uint64_t sub_1BED3A924()
{
  return sub_1BED3A96C(&qword_1EA132F68, (void (*)(uint64_t))type metadata accessor for LACompanionType);
}

uint64_t sub_1BED3A96C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BED3A9B4()
{
  return MEMORY[0x1E4F1ABE8];
}

uint64_t sub_1BED3A9C0@<X0>(uint64_t *a1@<X8>)
{
  sub_1BED3AA00();
  uint64_t result = sub_1BED3D090();
  *a1 = result;
  return result;
}

unint64_t sub_1BED3AA00()
{
  unint64_t result = qword_1EA132F70;
  if (!qword_1EA132F70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA132F70);
  }
  return result;
}

BOOL LAUpdateAccessControl(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x1C189BC00]();
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:&unk_1F19EC820];
    uint64_t v7 = v6;
    if (v6 && [v6 count])
    {
      uint64_t v8 = SecAccessControlGetConstraints();
      if (v8)
      {
        uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __LAUpdateAccessControl_block_invoke;
        v13[3] = &unk_1E63C5908;
        id v14 = v8;
        unint64_t v16 = &v17;
        id v10 = v9;
        id v15 = v10;
        [v7 enumerateKeysAndObjectsUsingBlock:v13];
        if (!v18[3]) {
          SecAccessControlSetConstraints();
        }
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v11 = v18[3];
  if (a3)
  {
    *a3 = v11;
  }
  else if (v11)
  {
    CFRelease((CFTypeRef)v18[3]);
  }

  _Block_object_dispose(&v17, 8);

  return v11 == 0;
}

void sub_1BED3ABF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __LAUpdateAccessControl_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (!*(void *)(a1 + 32))
  {
    uint64_t v12 = (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    unint64_t v13 = @"Invalid update request.";
LABEL_9:
    makeCFError(v13, -1000, v12);
    *a4 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = objc_opt_class();
    if (v14 == objc_opt_class())
    {
      [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
      goto LABEL_10;
    }
    uint64_t v12 = (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    unint64_t v13 = @"Invalid update value type.";
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    unint64_t v13 = @"Invalid update value type, expecting dictionary.";
    goto LABEL_9;
  }
  id v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v9];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __LAUpdateAccessControl_block_invoke_2;
  v15[3] = &unk_1E63C58E0;
  id v16 = v10;
  id v11 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v15];
  [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v7];

LABEL_10:
}

void makeCFError(void *a1, uint64_t a2, uint64_t *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28228];
    v11[0] = a1;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    id v7 = a1;
    id v8 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = [v5 errorWithDomain:@"Error.LocalAuthentication.coreauthd_client" code:a2 userInfo:v8];

    *a3 = v9;
  }
}

uint64_t __LAUpdateAccessControl_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

BOOL LAEvaluateAndUpdateACL(void *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (void *)MEMORY[0x1C189BC00]();
  unint64_t v13 = LA_LOG_coreauthd_client();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v25 = 138412802;
    *(void *)&v25[4] = a1;
    *(_WORD *)&v25[12] = 2112;
    *(void *)&v25[14] = a3;
    __int16 v26 = 2112;
    uint64_t v27 = a4;
    _os_log_impl(&dword_1BED06000, v13, OS_LOG_TYPE_DEFAULT, "LAEvaluateAndUpdateACL(%@, %@, %@)", v25, 0x20u);
  }

  uint64_t v14 = LAContextFromCFType(a1, a6);
  if (!a1) {
    goto LABEL_13;
  }
  CFTypeID v15 = CFGetTypeID(a3);
  if (v15 != CFStringGetTypeID())
  {
    unint64_t v21 = @"Invalid operation type.";
LABEL_12:
    makeCFError(v21, -1006, a6);
LABEL_13:
    BOOL v20 = 0;
    goto LABEL_14;
  }
  if (!a2)
  {
    unint64_t v21 = @"Invalid 'ACL' argument.";
    goto LABEL_12;
  }
  id v16 = (void *)SecAccessControlCreateFromData();
  if (v16)
  {
    *(void *)uint64_t v25 = 0;
    uint64_t v17 = [v14 evaluateAccessControl:v16 aksOperation:a3 options:a4 error:v25];
    id v18 = *(id *)v25;
    uint64_t v19 = v18;
    BOOL v20 = v17 != 0;
    if (v17)
    {
      if (a5) {
        *a5 = SecAccessControlCopyData();
      }
    }
    else if (a6)
    {
      *a6 = (uint64_t)v18;
    }
  }
  else
  {
    makeCFError(@"Invalid 'ACL' argument.", -1006, a6);
    BOOL v20 = 0;
  }

LABEL_14:
  char v22 = LA_LOG_coreauthd_client();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (a6) {
      uint64_t v23 = *a6;
    }
    else {
      uint64_t v23 = 0;
    }
    *(_DWORD *)uint64_t v25 = 67109378;
    *(_DWORD *)&v25[4] = v20;
    *(_WORD *)&v25[8] = 2112;
    *(void *)&v25[10] = v23;
    _os_log_impl(&dword_1BED06000, v22, OS_LOG_TYPE_DEFAULT, "LAEvaluateAndUpdateACL -> %d, %@", v25, 0x12u);
  }

  return v20;
}

id LA_LOG_coreauthd_client()
{
  if (LA_LOG_coreauthd_client_once != -1) {
    dispatch_once(&LA_LOG_coreauthd_client_once, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)LA_LOG_coreauthd_client_log;

  return v0;
}

uint64_t LAEvaluatePolicy(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  id v8 = (void *)MEMORY[0x1C189BC00]();
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __LAEvaluatePolicy_block_invoke;
  block[3] = &unk_1E63C5930;
  int v12 = a2;
  block[6] = a3;
  block[7] = a4;
  block[4] = &v13;
  block[5] = a1;
  dispatch_block_perform(DISPATCH_BLOCK_DETACHED, block);
  uint64_t v9 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __LAEvaluatePolicy_block_invoke(uint64_t a1)
{
  uint64_t v2 = (const void *)LACopyResultOfPolicyEvaluation(*(void **)(a1 + 40), *(_DWORD *)(a1 + 64), *(void *)(a1 + 48), *(uint64_t **)(a1 + 56));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2 != 0;
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t LACopyResultOfPolicyEvaluation(void *a1, int a2, uint64_t a3, uint64_t *a4)
{
  *(void *)&v20[13] = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1C189BC00]();
  uint64_t v9 = LA_LOG_coreauthd_client();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v18 = 138412802;
    *(void *)&v18[4] = a1;
    __int16 v19 = 1024;
    *(_DWORD *)BOOL v20 = a2;
    v20[2] = 2112;
    *(void *)&v20[3] = a3;
    _os_log_impl(&dword_1BED06000, v9, OS_LOG_TYPE_DEFAULT, "LACopyResultOfPolicyEvaluation(%@, %d, %@)", v18, 0x1Cu);
  }

  uint64_t v10 = LAContextFromCFType(a1, a4);
  id v11 = v10;
  if (v10)
  {
    *(void *)id v18 = 0;
    uint64_t v12 = [v10 evaluatePolicy:a2 options:a3 error:v18];
    id v13 = *(id *)v18;
    uint64_t v14 = v13;
    if (a4 && !v12) {
      *a4 = (uint64_t)v13;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  uint64_t v15 = LA_LOG_coreauthd_client();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (a4) {
      uint64_t v16 = *a4;
    }
    else {
      uint64_t v16 = 0;
    }
    *(_DWORD *)id v18 = 138412546;
    *(void *)&v18[4] = v12;
    __int16 v19 = 2112;
    *(void *)BOOL v20 = v16;
    _os_log_impl(&dword_1BED06000, v15, OS_LOG_TYPE_DEFAULT, "LACopyResultOfPolicyEvaluation -> %@, %@", v18, 0x16u);
  }

  return v12;
}

uint64_t LASetCredential(void *a1, uint64_t a2, int a3, uint64_t *a4)
{
  id v8 = (void *)MEMORY[0x1C189BC00]();
  uint64_t v9 = LAContextFromCFType(a1, a4);
  uint64_t v10 = [v9 setCredential:a2 type:a3];

  return v10;
}

id LAContextFromCFType(void *a1, uint64_t *a2)
{
  id v3 = a1;
  if (v3 && (getLAContextClass(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
  }
  else
  {
    makeCFError(@"Invalid 'context' argument.", -1006, a2);
    id v4 = 0;
  }

  return v4;
}

uint64_t LAIsCredentialSet(void *a1, int a2, uint64_t *a3)
{
  uint64_t v6 = (void *)MEMORY[0x1C189BC00]();
  id v7 = LAContextFromCFType(a1, a3);
  uint64_t v8 = [v7 isCredentialSet:a2];

  return v8;
}

uint64_t LACreateNewContextWithACMContext(void *a1, uint64_t *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1C189BC00]();
  id v5 = a1;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v10 = LA_LOG_coreauthd_client();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      LACreateNewContextWithACMContext_cold_1(v10);
    }

    makeCFError(@"Invalid acmContext.", -1006, a2);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = [objc_alloc((Class)getLAContextClass()) initWithExternalizedContext:v5];
    uint64_t v7 = v6;
    if (a2 && !v6)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28228];
      v13[0] = @"Failed to create LAContext";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *a2 = [v8 errorWithDomain:@"Error.LocalAuthentication.coreauthd_client" code:-1000 userInfo:v9];
    }
  }

  return v7;
}

id getLAContextClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getLAContextClass_softClass;
  uint64_t v7 = getLAContextClass_softClass;
  if (!getLAContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLAContextClass_block_invoke;
    v3[3] = &unk_1E63C3EB0;
    v3[4] = &v4;
    __getLAContextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1BED3B814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t LACopyACMContext(void *a1, uint64_t *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1C189BC00]();
  id v5 = LAContextFromCFType(a1, a2);
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v7 = [v5 externalizedContext];
  uint64_t v8 = v7;
  if (a2 && !v7)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13[0] = @"Failed to get externalized context from LAContext";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a2 = [v9 errorWithDomain:@"Error.LocalAuthentication.coreauthd_client" code:-1000 userInfo:v10];

LABEL_5:
    uint64_t v8 = 0;
  }

  return v8;
}

BOOL LAEvaluateACL(void *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10 = (void *)MEMORY[0x1C189BC00]();
  BOOL updated = LAEvaluateAndUpdateACL(a1, a2, a3, a4, 0, a5);
  return updated;
}

uint64_t LACreateNewContextWithACMContextInSession(int a1, uint64_t a2, uint64_t *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  int v11 = a1;
  id v5 = (void *)MEMORY[0x1C189BC00]();
  uint64_t v6 = [objc_alloc((Class)getLAContextClass()) initWithExternalizedContext:a2 userSession:&v11];
  uint64_t v7 = v6;
  if (a3 && !v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13[0] = @"Failed to create LAContext";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a3 = [v8 errorWithDomain:@"Error.LocalAuthentication.coreauthd_client" code:-1000 userInfo:v9];
  }
  return v7;
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __LocalAuthenticationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E63C5950;
    uint64_t v6 = 0;
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("LAContext");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getLAContextClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getLAContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __LocalAuthenticationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LocalAuthenticationLibraryCore_frameworkLibrary = result;
  return result;
}

void LACreateNewContextWithACMContext_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1BED06000, log, OS_LOG_TYPE_ERROR, "Invalid acmContext", v1, 2u);
}

void __getLAContextClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  [(LAEnvironment *)v0 _registerDarwinNotification];
}

uint64_t _LAMKBLockDevice_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[_LAAuthenticationBiometricMethodShim init](v0);
}

uint64_t __getBKDeviceDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKDeviceClass_block_invoke_cold_1(v0);
}

uint64_t __getBKDeviceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKMatchPearlOperationClass_block_invoke_cold_1(v0);
}

uint64_t __getBKMatchPearlOperationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKMatchOperationClass_block_invoke_cold_1(v0);
}

uint64_t __getBKMatchOperationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKFaceDetectOperationClass_block_invoke_cold_1(v0);
}

uint64_t __getBKFaceDetectOperationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKFingerDetectOperationClass_block_invoke_cold_1(v0);
}

uint64_t __getBKFingerDetectOperationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBKPresenceDetectOperationClass_block_invoke_cold_1(v0);
}

uint64_t __getBKPresenceDetectOperationClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return [(LANotification *)v0 _appActivityChanged:v2];
}

uint64_t sub_1BED3D090()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1BED3D0A0()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1BED3D0B0()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1BED3D0C0()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1BED3D0D0()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1BED3D0E0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1BED3D0F0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BED3D100()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BED3D110()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BED3D120()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BED3D130()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BED3D140()
{
  return MEMORY[0x1F4185EF8]();
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t LACLogEnvironment()
{
  return MEMORY[0x1F412AA08]();
}

uint64_t LALogCategoryForOptions()
{
  return MEMORY[0x1F40ECD60]();
}

uint64_t LALogCategoryForPolicy()
{
  return MEMORY[0x1F40ECD68]();
}

uint64_t LALogForCategory()
{
  return MEMORY[0x1F40ECD70]();
}

uint64_t LALogForPolicy()
{
  return MEMORY[0x1F40ECD78]();
}

uint64_t LALogTypeForInternalError()
{
  return MEMORY[0x1F40ECD88]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t SecAccessControlCopyData()
{
  return MEMORY[0x1F40F6A00]();
}

uint64_t SecAccessControlCreate()
{
  return MEMORY[0x1F40F6A08]();
}

uint64_t SecAccessControlCreateFromData()
{
  return MEMORY[0x1F40F6A10]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1F40F6A18](allocator, protection, flags, error);
}

uint64_t SecAccessControlGetConstraints()
{
  return MEMORY[0x1F40F6A28]();
}

uint64_t SecAccessControlGetRequirePassword()
{
  return MEMORY[0x1F40F6A38]();
}

uint64_t SecAccessControlSetConstraints()
{
  return MEMORY[0x1F40F6A58]();
}

uint64_t SecAccessControlSetProtection()
{
  return MEMORY[0x1F40F6A60]();
}

uint64_t SecAccessControlSetRequirePassword()
{
  return MEMORY[0x1F40F6A68]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1F40F6D68](*(void *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x1F40F6E38](key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E40](key, error);
}

CFDataRef SecKeyCopyKeyExchangeResult(SecKeyRef privateKey, SecKeyAlgorithm algorithm, SecKeyRef publicKey, CFDictionaryRef parameters, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E50](privateKey, algorithm, publicKey, parameters, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1F40F6E70](key);
}

CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E98](key, algorithm, ciphertext, error);
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6EB0](key, algorithm, plaintext, error);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6EE0](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6EF8](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6F08](keyData, attributes, error);
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x1F40F6F60](key, operation, algorithm);
}

uint64_t SecKeySetParameter()
{
  return MEMORY[0x1F40F6F78]();
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1F40F6F80](key, algorithm, signedData, signature, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x1F415CBE0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
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

void objc_copyWeak(id *to, id *from)
{
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1F40CECF0]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}