void KmlLogFunc2(os_log_type_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x263EF8340];
  v12 = (objc_class *)NSString;
  v13 = a4;
  v14 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&a9];

  v15 = (void *)[[NSString alloc] initWithFormat:@"%s : %d : %@", a2, a3, v14];
  v16 = KmlLogger();
  if (os_log_type_enabled(v16, a1))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v15;
    _os_log_impl(&dword_214D6D000, v16, a1, "%{public}@", buf, 0xCu);
  }
}

void sub_214D6F57C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 56));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id KmlLogger()
{
  if (KmlLogger_onceToken != -1) {
    dispatch_once(&KmlLogger_onceToken, &__block_literal_global);
  }
  v0 = (void *)KmlLogger__logger;

  return v0;
}

uint64_t __KmlLogger_block_invoke()
{
  KmlLogger__logger = (uint64_t)os_log_create("com.apple.sesd.kml", "GeneralLogging");

  return MEMORY[0x270F9A758]();
}

void KmlSharingLogFunc(os_log_type_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v13 = (objc_class *)NSString;
  id v14 = a5;
  v15 = (void *)[[v13 alloc] initWithFormat:v14 arguments:&a9];

  v16 = (void *)[[NSString alloc] initWithFormat:@"%s : %d : %s : %@", a2, a3, a4, v15];
  v17 = KmlLogger();
  if (os_log_type_enabled(v17, a1))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v16;
    _os_log_impl(&dword_214D6D000, v17, a1, "%{public}@", buf, 0xCu);
  }
}

void KmlLogFunc_InternalOnly(os_log_type_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v12 = a4;
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_11);
  }
  if (isInternalBuild_internalBuild)
  {
    v13 = (void *)[[NSString alloc] initWithFormat:v12 arguments:&a9];
    id v14 = (void *)[[NSString alloc] initWithFormat:@"%s : %d : %@", a2, a3, v13];
    v15 = KmlLogger();
    if (os_log_type_enabled(v15, a1))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v14;
      _os_log_impl(&dword_214D6D000, v15, a1, "%{public}@", buf, 0xCu);
    }
  }
}

id KmlSignpostLogger()
{
  if (KmlSignpostLogger_onceToken != -1) {
    dispatch_once(&KmlSignpostLogger_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)KmlSignpostLogger__signpostLogger;

  return v0;
}

uint64_t __KmlSignpostLogger_block_invoke()
{
  KmlSignpostLogger__signpostLogger = (uint64_t)os_log_create("com.apple.sesd.kml", "SignpostLogging");

  return MEMORY[0x270F9A758]();
}

uint64_t __isInternalBuild_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  isInternalBuild_internalBuild = result;
  return result;
}

void sub_214D70598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

void sub_214D70BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D70EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D712FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL isEndOfKeyConfigTag(int a1)
{
  return a1 == 0x7FFF || a1 == 24415;
}

BOOL isDeviceKeyAttestationTag(int a1)
{
  return (a1 & 0xFFFFDFFF) == 24410;
}

void sub_214D74C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
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

void sub_214D7561C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_214D758F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_214D75C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D75EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D7611C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D764A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_214D767B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D76B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_214D76F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D77328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_214D77784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_214D77C54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_214D7804C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D78400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D787B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D78B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D78EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D79848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_214D79BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D79FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_214D7A3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_214D7A7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_214D7ABE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_214D7AFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D7B378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

const char *DAErrorString(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t result = "Unknown Error";
  while (DAErrorString_DAErrorStrings[v2] != a1)
  {
    v2 += 2;
    if (v2 == 124) {
      return result;
    }
  }
  return (const char *)DAErrorString_DAErrorStrings[v2 + 1];
}

uint64_t kmlErrorCodeToDAErrorCode(int a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t result = 213;
  while (1)
  {
    uint64_t v4 = v2 + 16;
    if (v2 == 1328) {
      break;
    }
    int v5 = *(_DWORD *)((char *)&unk_214D8F810 + v2 + 16);
    v2 += 16;
    if (v5 == a1) {
      return *(void *)((char *)&unk_214D8F810 + v4 + 8);
    }
  }
  return result;
}

id kmlErrorToDAError(void *a1)
{
  v27[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1)
  {
    id v5 = 0;
    goto LABEL_26;
  }
  v3 = [v1 domain];
  int v4 = [v3 isEqual:@"DigitalAccessError"];

  if (v4)
  {
    id v5 = v2;
    goto LABEL_26;
  }
  v6 = [v2 domain];
  v7 = [NSString stringWithUTF8String:"com.apple.sesd.kml.sharing"];
  if ([v6 isEqual:v7]) {
    goto LABEL_8;
  }
  v8 = [v2 domain];
  uint64_t v9 = [NSString stringWithUTF8String:"com.apple.sesd.kml.pairing"];
  if ([v8 isEqual:v9])
  {

LABEL_8:
    goto LABEL_9;
  }
  v15 = [v2 domain];
  v16 = [NSString stringWithUTF8String:"com.apple.sesd.kml"];
  char v17 = [v15 isEqual:v16];

  if (v17)
  {
LABEL_9:
    int v10 = [v2 code];
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 213;
      while (1)
      {
        uint64_t v13 = v11 + 16;
        if (v11 == 1328) {
          break;
        }
        int v14 = *(_DWORD *)((char *)&unk_214D8F810 + v11 + 16);
        v11 += 16;
        if (v14 == v10)
        {
          uint64_t v12 = *(void *)((char *)&unk_214D8F810 + v13 + 8);
          goto LABEL_17;
        }
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    goto LABEL_17;
  }
  uint64_t v12 = 213;
LABEL_17:
  uint64_t v18 = 0;
  v19 = "Unknown Error";
  while (DAErrorString_DAErrorStrings[v18] != v12)
  {
    v18 += 2;
    if (v18 == 124) {
      goto LABEL_22;
    }
  }
  v19 = (const char *)DAErrorString_DAErrorStrings[v18 + 1];
LABEL_22:
  uint64_t v20 = [NSString stringWithUTF8String:v19];
  v21 = [v2 localizedFailureReason];
  if (v21)
  {
    v22 = [v2 localizedFailureReason];
  }
  else
  {
    v22 = &stru_26C5B7750;
  }

  uint64_t v23 = *MEMORY[0x263F08338];
  v26[0] = *MEMORY[0x263F08320];
  v26[1] = v23;
  v27[0] = v20;
  v27[1] = v22;
  v24 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"DigitalAccessError" code:v12 userInfo:v24];

LABEL_26:

  return v5;
}

void sub_214D7D330(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 80), 8);
  objc_sync_exit(v1);
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

void sub_214D7D6A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_214D7D818(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

__CFString *DAKeyTransportTypeAsString(uint64_t a1)
{
  id v1 = @"Bluetooth";
  if (a1 == 1) {
    id v1 = @"NearField";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Unknown";
  }
}

void sub_214D7F250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D7F620(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214D7F6BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214D7F760(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214D7FBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_214D7FEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D801EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void DAManagerSetMachServiceName(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    id v2 = +[DAManager sharedManager];
    -[DAManager setServiceName:]((uint64_t)v2, v1);
  }
}

const char *KmlErrorString(int a1)
{
  uint64_t v2 = 0;
  uint64_t result = "Unknown Error";
  while (KmlErrorString_KmlErrorStrings[v2] != a1)
  {
    v2 += 4;
    if (v2 == 328) {
      return result;
    }
  }
  return *(const char **)&KmlErrorString_KmlErrorStrings[v2 + 2];
}

uint64_t sesErrorCodeToKmlErrorCode(uint64_t a1, uint64_t a2)
{
  v7[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = 209;
  *((void *)&v6 + 1) = 6;
  v7[0] = 215;
  v7[1] = -1;
  v7[2] = 0xFFFFFFFFLL;
  if (a1 != 3)
  {
    for (i = (unsigned int *)v7; ; i += 4)
    {
      uint64_t v2 = *i;
      if (v2 == -1) {
        break;
      }
      uint64_t v4 = *((void *)i - 1);
      if (v4 == a1) {
        return v2;
      }
    }
    return a2;
  }
  return v2;
}

id sesErrorToKmlError(void *a1, unsigned int a2)
{
  v32[3] = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  id v5 = [v3 domain];
  long long v6 = [NSString stringWithUTF8String:"com.apple.sesd.kml.sharing"];
  if ([v5 isEqual:v6]) {
    goto LABEL_5;
  }
  v7 = [v4 domain];
  v8 = [NSString stringWithUTF8String:"com.apple.sesd.kml.pairing"];
  if ([v7 isEqual:v8])
  {

LABEL_5:
LABEL_6:
    id v9 = v4;
    goto LABEL_7;
  }
  uint64_t v11 = [v4 domain];
  uint64_t v12 = [NSString stringWithUTF8String:"com.apple.sesd.kml"];
  char v13 = [v11 isEqual:v12];

  if (v13) {
    goto LABEL_6;
  }
  int v14 = [v4 underlyingErrors];
  if ([v14 count])
  {
    v15 = [v4 underlyingErrors];
    v16 = [v15 firstObject];
    uint64_t v17 = [v16 code];
  }
  else
  {
    uint64_t v17 = [v4 code];
  }

  v31[2] = 3;
  unsigned int v18 = 209;
  v31[3] = 209;
  v31[4] = 6;
  v32[0] = 215;
  v32[1] = -1;
  v32[2] = 0xFFFFFFFFLL;
  if (v17 != 3)
  {
    v19 = (unsigned int *)v32;
    while (1)
    {
      unsigned int v18 = *v19;
      if (*v19 == -1) {
        break;
      }
      uint64_t v20 = *((void *)v19 - 1);
      v19 += 4;
      if (v20 == v17) {
        goto LABEL_20;
      }
    }
    unsigned int v18 = a2;
  }
LABEL_20:
  uint64_t v21 = 0;
  v22 = "Unknown Error";
  while (KmlErrorString_KmlErrorStrings[v21] != v18)
  {
    v21 += 4;
    if (v21 == 328) {
      goto LABEL_25;
    }
  }
  v22 = *(const char **)&KmlErrorString_KmlErrorStrings[v21 + 2];
LABEL_25:
  uint64_t v23 = [NSString stringWithUTF8String:v22];
  v24 = [v4 localizedFailureReason];
  if (v24)
  {
    v25 = [v4 localizedFailureReason];
  }
  else
  {
    v25 = &stru_26C5B7750;
  }

  uint64_t v26 = *MEMORY[0x263F08338];
  v30[0] = *MEMORY[0x263F08320];
  v30[1] = v26;
  v31[0] = v23;
  v31[1] = v25;
  v27 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  v28 = (void *)MEMORY[0x263F087E8];
  v29 = [NSString stringWithUTF8String:"com.apple.sesd.kml"];
  id v9 = [v28 errorWithDomain:v29 code:v18 userInfo:v27];

LABEL_7:

  return v9;
}

id kmlUtilDataForHexString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && [v1 length])
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
    uint64_t v4 = [v2 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C5B7750];
    id v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_26C5B7750];

    if ([v5 length] != 1)
    {
      unint64_t v6 = 0;
      do
      {
        char v17 = 0;
        __darwin_ct_rune_t v7 = [v5 characterAtIndex:v6];
        __darwin_ct_rune_t v8 = [v5 characterAtIndex:v6 + 1];
        unsigned __int16 v9 = __toupper(v7);
        unsigned int v10 = v9 - 48;
        if (v10 >= 0xA) {
          unsigned int v10 = -1;
        }
        if (v9 - 65 >= 6) {
          int v11 = v10;
        }
        else {
          int v11 = v9 - 55;
        }
        unsigned __int16 v12 = __toupper(v8);
        unsigned int v13 = v12 - 48;
        if (v13 >= 0xA) {
          unsigned int v13 = -1;
        }
        if (v12 - 65 < 6) {
          unsigned int v13 = v12 - 55;
        }
        BOOL v14 = v13 == -1 || v11 == -1;
        char v15 = v13 | (16 * v11);
        if (v14) {
          char v15 = 0;
        }
        char v17 = v15;
        [v3 appendBytes:&v17 length:1];
        v6 += 2;
      }
      while ([v5 length] - 1 > v6);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id kmlUtilHexStringFromData(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && [v1 length])
  {
    uint64_t v3 = 2 * [v2 length];
    uint64_t v4 = (char *)malloc_type_malloc(v3 | 1, 0x8F3A8AADuLL);
    v4[v3] = 0;
    id v5 = v2;
    uint64_t v6 = [v5 bytes];
    if ([v5 length])
    {
      unint64_t v7 = 0;
      __darwin_ct_rune_t v8 = v4;
      do
      {
        sprintf(v8, "%02X", *(unsigned __int8 *)(v6 + v7++));
        v8 += 2;
      }
      while ([v5 length] > v7);
    }
    unsigned __int16 v9 = (void *)[[NSString alloc] initWithUTF8String:v4];
    free(v4);
  }
  else
  {
    unsigned __int16 v9 = 0;
  }

  return v9;
}

id kmlUtilSHA1(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = (const void *)[v1 bytes];
  CC_LONG v3 = [v1 length];

  uint64_t v4 = CC_SHA1(v2, v3, md);
  if (v4)
  {
    uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:20];
  }

  return v4;
}

id kmlUtilSHA256(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = (const void *)[v1 bytes];
  CC_LONG v3 = [v1 length];

  uint64_t v4 = CC_SHA256(v2, v3, md);
  if (v4)
  {
    uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:32];
  }

  return v4;
}

void kmlUtilLogLargeData(void *a1, void *a2)
{
  id v25 = a1;
  id v3 = a2;
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_INFO, (uint64_t)"void kmlUtilLogLargeData(NSString *__strong, NSData *__strong)", 117, @"--- start %@ ---", v4, v5, v6, v7, (uint64_t)v25);
  __darwin_ct_rune_t v8 = kmlUtilHexStringFromData(v3);
  unint64_t v9 = [v8 length];
  if (v9 < 0x321)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      int v11 = objc_msgSend(v8, "substringWithRange:", v10, 800);
      KmlLogFunc_InternalOnly(OS_LOG_TYPE_INFO, (uint64_t)"void kmlUtilLogLargeData(NSString *__strong, NSData *__strong)", 122, @"%@", v12, v13, v14, v15, (uint64_t)v11);

      v10 += 800;
      v9 -= 800;
    }
    while (v9 > 0x320);
  }
  v16 = objc_msgSend(v8, "substringWithRange:", v10, v9);
  KmlLogFunc_InternalOnly(OS_LOG_TYPE_INFO, (uint64_t)"void kmlUtilLogLargeData(NSString *__strong, NSData *__strong)", 126, @"%@", v17, v18, v19, v20, (uint64_t)v16);

  KmlLogFunc_InternalOnly(OS_LOG_TYPE_INFO, (uint64_t)"void kmlUtilLogLargeData(NSString *__strong, NSData *__strong)", 127, @"--- end %@ ---", v21, v22, v23, v24, (uint64_t)v25);
}

id kmlUtilUUIDToData(void *a1)
{
  v3[2] = *MEMORY[0x263EF8340];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  id v1 = [MEMORY[0x263EFF8F8] dataWithBytes:v3 length:16];

  return v1;
}

id kmlUtilTimeNow()
{
  v0 = [MEMORY[0x263EFF910] date];
  id v1 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v2 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  [v1 setTimeZone:v2];

  [v1 setDateFormat:@"yyyyMMddHHmmss'Z'"];
  id v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v1 setLocale:v3];

  uint64_t v4 = [v1 stringFromDate:v0];
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"NSData *kmlUtilTimeNow(void)", 149, @"date now %@", v5, v6, v7, v8, (uint64_t)v4);
  unint64_t v9 = (void *)MEMORY[0x263EFF8F8];
  id v10 = v4;
  int v11 = objc_msgSend(v9, "dataWithBytes:length:", objc_msgSend(v10, "UTF8String"), objc_msgSend(v10, "length"));

  return v11;
}

id kmlUtilTimeFiveMinutesFromNow()
{
  v0 = [MEMORY[0x263EFF910] date];
  [v0 timeIntervalSince1970];
  uint64_t v2 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v1 + 300.0];
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v4 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  [v3 setTimeZone:v4];

  [v3 setDateFormat:@"yyyyMMddHHmmss'Z'"];
  uint64_t v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v3 setLocale:v5];

  uint64_t v6 = [v3 stringFromDate:v2];
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"NSData *kmlUtilTimeFiveMinutesFromNow(void)", 167, @"date five minutes from %@", v7, v8, v9, v10, (uint64_t)v6);
  int v11 = (void *)MEMORY[0x263EFF8F8];
  id v12 = v6;
  uint64_t v13 = objc_msgSend(v11, "dataWithBytes:length:", objc_msgSend(v12, "UTF8String"), objc_msgSend(v12, "length"));

  return v13;
}

uint64_t kmlUtilInfiniteTime(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"NSData *kmlUtilInfiniteTime(void)", 175, @"infinite date %@", a5, a6, a7, a8, @"99991231235959Z");
  uint64_t v8 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v9 = [@"99991231235959Z" UTF8String];
  uint64_t v10 = [@"99991231235959Z" length];

  return [v8 dataWithBytes:v9 length:v10];
}

uint64_t isInternalBuild()
{
  if ((isInternalBuild_hasChecked & 1) == 0)
  {
    if (MGGetBoolAnswer()) {
      isInternalBuild_internalBuild_0 = 1;
    }
    isInternalBuild_hasChecked = 1;
  }
  return isInternalBuild_internalBuild_0;
}

id randomStringWithLength(uint64_t a1)
{
  uint32_t v2 = [@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" length];
  for (i = [MEMORY[0x263F089D8] stringWithCapacity:a1];
    [i appendFormat:@"%C", objc_msgSend(@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", "characterAtIndex:", arc4random_uniform(v2))];

  return i;
}

id kmlUtilSanitizeFriendlyName(void *a1)
{
  id v1 = a1;
  uint32_t v2 = [v1 dataUsingEncoding:4];
  if ((unint64_t)[v2 length] > 0x1E)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__3;
    uint64_t v20 = __Block_byref_object_dispose__3;
    id v21 = [MEMORY[0x263F089D8] string];
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    uint64_t v8 = [v1 length];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __kmlUtilSanitizeFriendlyName_block_invoke;
    v14[3] = &unk_26422D8F8;
    v14[4] = v15;
    v14[5] = &v16;
    objc_msgSend(v1, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v14);
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSString *kmlUtilSanitizeFriendlyName(NSString *__strong)", 234, @"Original key name: %@ ,  truncated key name: %@", v9, v10, v11, v12, (uint64_t)v1);
    id v7 = (id)v17[5];
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSString *kmlUtilSanitizeFriendlyName(NSString *__strong)", 216, @"UTF8 encoded friendly name is less than %ld chars : %@", v3, v4, v5, v6, 30);
    id v7 = v1;
  }

  return v7;
}

void sub_214D84F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
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

void __kmlUtilSanitizeFriendlyName_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v9 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v9 lengthOfBytesUsingEncoding:4];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > 0x1EuLL) {
    *a7 = 1;
  }
  else {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:v9];
  }
}

id kmlUtilGetDckIdFromSlotId(void *a1)
{
  id v1 = a1;
  uint64_t v6 = v1;
  if (!v1 || ![v1 length])
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"NSData *kmlUtilGetDckIdFromSlotId(NSData *__strong)", 241, @"Invalid slotId %@:", v2, v3, v4, v5, (uint64_t)v6);
    uint64_t v8 = 0;
    goto LABEL_10;
  }
  if ([v6 length] == 8)
  {
    id v7 = v6;
LABEL_8:
    uint64_t v8 = v7;
    goto LABEL_10;
  }
  if ((unint64_t)[v6 length] >= 9)
  {
    objc_msgSend(v6, "subdataWithRange:", 0, 8);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  uint64_t v8 = [MEMORY[0x263EFF990] dataWithLength:8];
  objc_msgSend(v8, "replaceBytesInRange:withBytes:", 8 - objc_msgSend(v6, "length"), objc_msgSend(v6, "length"), objc_msgSend(v6, "bytes"));
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSData *kmlUtilGetDckIdFromSlotId(NSData *__strong)", 255, @"DCK Identifier : %@", v9, v10, v11, v12, (uint64_t)v8);
LABEL_10:

  return v8;
}

id kmlUtilGetOOBKey(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v9 = v4;
  if (v3 && v4)
  {
    uint64_t v10 = [MEMORY[0x263EFF990] dataWithLength:64];
    ccsha256_di();
    [v3 length];
    [v3 bytes];
    [v9 length];
    [v9 bytes];
    [v10 length];
    id v11 = v10;
    uint64_t v20 = [v11 mutableBytes];
    uint64_t v12 = cchkdf();
    if (v12)
    {
      KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"NSData *kmlUtilGetOOBKey(NSData *__strong, NSData *__strong)", 273, @"cchkdf failed with %d", v13, v14, v15, v16, v12);
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = objc_msgSend(v11, "subdataWithRange:", 0, 16, v20);
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"NSData *kmlUtilGetOOBKey(NSData *__strong, NSData *__strong)", 262, @"Missing masterKey or identifier", v5, v6, v7, v8, v19);
    uint64_t v17 = 0;
  }

  return v17;
}

id kmlUtilRandomDataWithSize(size_t a1)
{
  id v2 = [MEMORY[0x263EFF990] dataWithLength:a1];
  arc4random_buf((void *)[v2 mutableBytes], a1);

  return v2;
}

id kmlUtilGeneratePasscode(void *a1, void *a2, unint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if ([v5 length] && (uint64_t v7 = objc_msgSend(v6, "length"), a3) && v7)
  {
    unsigned __int8 v33 = 0;
    uint64_t v12 = [MEMORY[0x263F089D8] stringWithCapacity:a3];
    unint64_t v13 = 0;
    id v31 = v6;
    id v32 = v5;
    while (1)
    {
      KmlLogFunc_InternalOnly(OS_LOG_TYPE_DEBUG, (uint64_t)"NSString *kmlUtilGeneratePasscode(NSData *__strong, NSData *__strong, NSUInteger)", 305, @"counter : %u ; digits scored : %u",
        v8,
        v9,
        v10,
        v11,
        v33);
      uint64_t v14 = [MEMORY[0x263EFF990] dataWithBytes:&v33 length:1];
      [v14 appendData:v5];
      [v14 appendData:v6];
      kmlUtilSHA256(v14);
      id v15 = objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 bytes];
      if ([v15 length])
      {
        uint64_t v21 = 0;
        while (1)
        {
          if (*(unsigned __int8 *)(v16 + v21) <= 0xF9u)
          {
            uint64_t v30 = a0123456789[*(unsigned __int16 *)(v16 + v21) % 0xAu];
            [v12 appendFormat:@"%C"];
            if (++v13 == a3) {
              break;
            }
          }
          if (++v21 >= (unint64_t)[v15 length]) {
            goto LABEL_12;
          }
        }
        unint64_t v13 = a3;
      }
LABEL_12:
      if (v33 == 255) {
        break;
      }
      ++v33;

      id v6 = v31;
      id v5 = v32;
      if (v13 >= a3)
      {
        uint64_t v22 = v12;
        goto LABEL_17;
      }
    }
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"NSString *kmlUtilGeneratePasscode(NSData *__strong, NSData *__strong, NSUInteger)", 326, @"Ran out of randomizer counter. Abort!", v17, v18, v19, v20, v30);

    uint64_t v22 = 0;
    id v6 = v31;
    id v5 = v32;
LABEL_17:
    id v28 = v22;
  }
  else
  {
    uint64_t v23 = [v5 length];
    [v6 length];
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"NSString *kmlUtilGeneratePasscode(NSData *__strong, NSData *__strong, NSUInteger)", 290, @"length of : longTermSecret:%u; seed:%u; desiredPasscode:%u",
      v24,
      v25,
      v26,
      v27,
      v23);
    id v28 = 0;
  }

  return v28;
}

id kmlUtilGenerateAccountInfoHash(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length] && objc_msgSend(v4, "length"))
  {
    id v5 = [MEMORY[0x263EFF990] data];
    [v5 appendData:v3];
    [v5 appendData:v4];
    id v6 = kmlUtilSHA256(v5);
  }
  else
  {
    uint64_t v7 = [v3 length];
    [v4 length];
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSData *kmlUtilGenerateAccountInfoHash(NSData *__strong, NSData *__strong)", 340, @"anonymizedDsid.length = %lu, readerIdentifier.length = %lu", v8, v9, v10, v11, v7);
    id v6 = 0;
  }

  return v6;
}

uint64_t kmlUtilIsFleetKey(unsigned int a1)
{
  return (a1 >> 3) & 1;
}

uint64_t kmlUtilIsServerIssuedKey(unsigned int a1)
{
  return (a1 >> 2) & 1;
}

uint64_t kmlUtilKeyClassOriginBitmap(unsigned int a1)
{
  return (a1 >> 2) & 3;
}

id kmlUtilGetMockInstanceCAData()
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFF990] data];
  id v1 = [MEMORY[0x263EFF980] array];
  id v2 = [@"ECIES_v1" dataUsingEncoding:4];
  id v3 = +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 218, v2);
  [v1 addObject:v3];

  id v4 = kmlUtilRandomDataWithSize(0x41uLL);
  id v5 = +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 69, v4);
  [v1 addObject:v5];

  id v6 = kmlUtilRandomDataWithSize(0x20uLL);
  uint64_t v7 = +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 70, v6);
  [v1 addObject:v7];

  uint64_t v8 = kmlUtilRandomDataWithSize(0x80uLL);
  uint64_t v9 = +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 74, v8);
  [v1 addObject:v9];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v1;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = -[KmlTlv asData](*(void *)(*((void *)&v19 + 1) + 8 * i));
        objc_msgSend(v0, "appendData:", v15, (void)v19);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  uint64_t v16 = +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 32546, v0);
  uint64_t v17 = -[KmlTlv asData]((uint64_t)v16);

  return v17;
}

id kmlUtilDecodeJson(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (![v7 length])
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 407, @"json data is nil", v10, v11, v12, v13, v61);
    id v29 = 0;
    goto LABEL_39;
  }
  v66 = [MEMORY[0x263EFF9A0] dictionary];
  id v71 = 0;
  uint64_t v14 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v71];
  id v15 = v71;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 417, @"json serialization error : %@", v16, v17, v18, v19, (uint64_t)v15);
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 418, @"jsonObject : %@", v20, v21, v22, v23, (uint64_t)v14);
  if (v15 || !v14)
  {
    uint64_t v30 = 0;
    id v29 = 0;
    if (a4) {
      *a4 = v15;
    }
    goto LABEL_38;
  }
  if ([v9 length])
  {
    id v24 = [v14 objectForKey:v9];
    if (!v24)
    {
      id v64 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    id v24 = v14;
  }
  id v64 = v24;
  if ([v24 count])
  {
    v62 = v14;
    id v63 = v7;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v31 = [v8 allKeys];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v67 objects:v72 count:16];
    unsigned __int8 v33 = v64;
    if (v32)
    {
      uint64_t v34 = v32;
      uint64_t v35 = *(void *)v68;
      v65 = v31;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v68 != v35) {
            objc_enumerationMutation(v31);
          }
          uint64_t v37 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          v38 = [v33 objectForKey:v37];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v43 = [v8 objectForKeyedSubscript:v37];
            if (v43 == objc_opt_class())
            {
              [v66 setObject:v38 forKeyedSubscript:v37];
            }
            else if (v43 == objc_opt_class())
            {
              id v48 = v8;
              id v49 = objc_alloc_init(MEMORY[0x263F08A30]);
              v54 = [v49 numberFromString:v38];
              if (v54) {
                [v66 setObject:v54 forKeyedSubscript:v37];
              }
              else {
                KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 457, @"Skip %@, since value is nil", v50, v51, v52, v53, v37);
              }

              id v8 = v48;
              unsigned __int8 v33 = v64;
              id v31 = v65;
            }
            else if (v43 == objc_opt_class())
            {
              v55 = kmlUtilDataForHexString(v38);
              if ([v55 length]) {
                [v66 setObject:v55 forKeyedSubscript:v37];
              }
              else {
                KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 467, @"Skip %@, since value is nil", v56, v57, v58, v59, v37);
              }

              id v31 = v65;
            }
            else
            {
              KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 471, @"Skip %@, since it is expected to have value of unsupported class", v44, v45, v46, v47, v37);
            }
          }
          else
          {
            KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 441, @"Skip %@, since it has non string value in json", v39, v40, v41, v42, v37);
          }
        }
        uint64_t v34 = [v31 countByEnumeratingWithState:&v67 objects:v72 count:16];
      }
      while (v34);
    }

    id v29 = v66;
    id v7 = v63;
    uint64_t v30 = v33;
    uint64_t v14 = v62;
    id v15 = 0;
    goto LABEL_38;
  }
LABEL_37:
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"NSDictionary *kmlUtilDecodeJson(NSData *__strong, NSDictionary *__strong, NSString *__strong, NSError *__autoreleasing *)", 434, @"Missing target dictionary with keyName : %@", v25, v26, v27, v28, (uint64_t)v9);
  id v29 = 0;
  uint64_t v30 = v64;
LABEL_38:

LABEL_39:

  return v29;
}

uint64_t kmlUtilAddUniqueTagToSet(void *a1, unsigned int a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  int v6 = [v3 containsObject:v5];

  if (v6)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"_Bool kmlUtilAddUniqueTagToSet(NSMutableSet *__strong, uint16_t)", 480, @"Received duplicated tag: 0x%02X", v7, v8, v9, v10, v4);
  }
  else
  {
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:v4];
    [v3 addObject:v11];
  }
  return v6 ^ 1u;
}

uint64_t cccErrorCodeToKmlErrorCode(int a1)
{
  uint64_t v1 = 0;
  while (LOBYTE(KmlCCCErrorConversionMap[v1 + 1]) != a1)
  {
    v1 += 2;
    if (v1 == 8) {
      return 105;
    }
  }
  return KmlCCCErrorConversionMap[v1];
}

uint64_t kmlErrorCodeToCCCErrorCode(int a1)
{
  uint64_t v1 = 0;
  while (KmlCCCErrorConversionMap[v1] != a1)
  {
    v1 += 2;
    if (v1 == 8) {
      return 255;
    }
  }
  return LOBYTE(KmlCCCErrorConversionMap[v1 + 1]);
}

const char *cccErrorString(int a1)
{
  uint64_t v2 = 0;
  uint64_t result = "Unknown Error";
  while (cccErrorString_CCCErrorStrings[v2] != a1)
  {
    v2 += 16;
    if (v2 == 208) {
      return result;
    }
  }
  return *(const char **)&cccErrorString_CCCErrorStrings[v2 + 8];
}

void sub_214D87940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
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

void sub_214D87D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_214D88118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D8844C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D889A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_214D88D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D89218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_214D89600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_214D899E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D89D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D8A230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_214D8A66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_214D8AC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_214D8B0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D8B46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D8B8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_214D8BC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D8BFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_214D8C350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D8C70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_214D8CB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_214D8CF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_214D8D344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_214D8D708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214D8DADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t SESEndPointCarKeyDowngradeVersionSetting()
{
  return MEMORY[0x270F5C110]();
}

uint64_t SESEndPointCreateForHydraWithSession()
{
  return MEMORY[0x270F5C120]();
}

uint64_t SESEndPointCreateForLyonHydraWithSession()
{
  return MEMORY[0x270F5C128]();
}

uint64_t SESEndPointCreateForLyonWithSession()
{
  return MEMORY[0x270F5C130]();
}

uint64_t SESEndPointIsCarKeySupported()
{
  return MEMORY[0x270F5C138]();
}

uint64_t SESEndPointList()
{
  return MEMORY[0x270F5C140]();
}

uint64_t SESEndPointListWithSession()
{
  return MEMORY[0x270F5C148]();
}

uint64_t SESEndPointPreWarm()
{
  return MEMORY[0x270F5C150]();
}

uint64_t SESEndPointPrivacyDecryption()
{
  return MEMORY[0x270F5C158]();
}

uint64_t SESEndpointGetBindingAttestationRequestWithSession()
{
  return MEMORY[0x270F5C168]();
}

uint64_t SESEndpointNotifyPassAdded()
{
  return MEMORY[0x270F5C178]();
}

uint64_t SESendPointCreateForHomeWithSession()
{
  return MEMORY[0x270F5C180]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

uint64_t cchkdf()
{
  return MEMORY[0x270ED8BA8]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_suspend(dispatch_object_t object)
{
}

void free(void *a1)
{
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

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x270F9AA48](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}