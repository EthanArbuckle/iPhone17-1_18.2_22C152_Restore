void sub_1B2820BCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B2820D20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B2821224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _log()
{
  v0 = (void *)qword_1EB5E7D70;
  if (!qword_1EB5E7D70)
  {
    QLTInitLogging();
    v0 = (void *)qword_1EB5E7D70;
  }

  return v0;
}

id _log_0()
{
  v0 = (void *)qltLogHandles;
  if (!qltLogHandles)
  {
    QLTInitLogging();
    v0 = (void *)qltLogHandles;
  }

  return v0;
}

id _log_1()
{
  v0 = (void *)qword_1EB5E7D68;
  if (!qword_1EB5E7D68)
  {
    QLTInitLogging();
    v0 = (void *)qword_1EB5E7D68;
  }

  return v0;
}

id _log_2()
{
  v0 = (void *)qword_1EB5E7D88;
  if (!qword_1EB5E7D88)
  {
    QLTInitLogging();
    v0 = (void *)qword_1EB5E7D88;
  }

  return v0;
}

CGImageRef QLImageCreateForDefaultThumbnailGenerationFromData(void *a1)
{
  id v1 = a1;
  v2 = [v1 format];
  CFDataRef v3 = [v1 data];

  v4 = CGDataProviderCreateWithCFData(v3);
  size_t v5 = [v2 width];
  size_t v6 = [v2 height];
  size_t v7 = [v2 bitsPerComponent];
  size_t v8 = [v2 bitsPerPixel];
  size_t v9 = [v2 bytesPerRow];
  v10 = (CGColorSpace *)[v2 colorSpace];
  if (!v10) {
    v10 = CGColorSpaceCreateDeviceRGB();
  }
  CGImageRef v11 = CGImageCreate(v5, v6, v7, v8, v9, v10, [v2 bitmapInfo], v4, 0, 1, kCGRenderingIntentDefault);
  if (!v11)
  {
    size_t v12 = [v2 width];
    size_t v13 = [v2 height];
    size_t v14 = [v2 bitsPerComponent];
    size_t v15 = [v2 bitsPerPixel];
    size_t v16 = [v2 bytesPerRow];
    v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB88]);
    CGImageRef v11 = CGImageCreate(v12, v13, v14, v15, v16, v17, [v2 bitmapInfo], v4, 0, 1, kCGRenderingIntentDefault);
    if (!v11)
    {
      size_t v18 = [v2 width];
      size_t v19 = [v2 height];
      size_t v20 = [v2 bitsPerComponent];
      size_t v21 = [v2 bitsPerPixel];
      size_t v22 = [v2 bytesPerRow];
      v23 = CGColorSpaceCreateDeviceGray();
      CGImageRef v11 = CGImageCreate(v18, v19, v20, v21, v22, v23, [v2 bitmapInfo], v4, 0, 1, kCGRenderingIntentDefault);
    }
  }
  if (v4) {
    CGDataProviderRelease(v4);
  }

  return v11;
}

id QLTImageClassWithError(void *a1)
{
  if (QLTImageClassWithError_once != -1) {
    dispatch_once(&QLTImageClassWithError_once, &__block_literal_global_7);
  }
  if (!QLTImageClassWithError_ImageClass)
  {
    NSLog(&cfstr_QlErrorYouNeed.isa);
    if (a1)
    {
      *a1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"QLThumbnailErrorDomain" code:103 userInfo:0];
    }
  }
  v2 = (void *)QLTImageClassWithError_ImageClass;

  return v2;
}

void sub_1B2823054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFPSandboxingURLWrapperClass()
{
  uint64_t v4 = 0;
  size_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getFPSandboxingURLWrapperClass_softClass;
  uint64_t v7 = getFPSandboxingURLWrapperClass_softClass;
  if (!getFPSandboxingURLWrapperClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFPSandboxingURLWrapperClass_block_invoke;
    v3[3] = &unk_1E6009910;
    v3[4] = &v4;
    __getFPSandboxingURLWrapperClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B2823138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void QLTInitLogging()
{
  if (QLTInitLogging_once != -1) {
    dispatch_once(&QLTInitLogging_once, &__block_literal_global_11);
  }
}

void sub_1B28253C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2825A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
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

Class __QLTImageClassWithError_block_invoke()
{
  Class result = NSClassFromString(&cfstr_Uiimage.isa);
  QLTImageClassWithError_ImageClass = (uint64_t)result;
  return result;
}

void sub_1B2826210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __QLTInitLogging_block_invoke()
{
  for (uint64_t i = 0; i != 23; ++i)
  {
    os_log_t v1 = os_log_create("com.apple.quicklook", _block_invoke_categories[i]);
    v2 = (void *)qltLogHandles[i];
    qltLogHandles[i] = (uint64_t)v1;
  }
}

uint64_t QLCompareVersion(const __CFString *a1, const __CFString *cf)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    BOOL v8 = cf == 0;
    uint64_t v9 = 1;
    goto LABEL_9;
  }
  if (!cf) {
    return 1;
  }
  CFTypeID v4 = CFGetTypeID(cf);
  CFTypeID v5 = CFGetTypeID(cf);
  CFTypeID TypeID = CFStringGetTypeID();
  if (v4 != TypeID)
  {
    BOOL v8 = v5 == TypeID;
    uint64_t v9 = -1;
LABEL_9:
    if (v8) {
      return v9;
    }
    else {
      return -v9;
    }
  }
  if (v5 != v4) {
    return 1;
  }
  if (CFEqual(a1, cf)) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  if ((unint64_t)(Length - 101) < 0xFFFFFFFFFFFFFF9CLL)
  {
    uint64_t v11 = 0;
LABEL_25:
    uint64_t v16 = 0;
    goto LABEL_26;
  }
  uint64_t v12 = Length;
  size_t v13 = v38;
  v40.location = 0;
  v40.length = Length;
  CFStringGetCharacters(a1, v40, v38);
  uint64_t v11 = 0;
  while (1)
  {
    unsigned int v14 = *v13;
    if (v14 - 58 < 0xFFFFFFF6) {
      break;
    }
    uint64_t v11 = v14 - 48 + 10 * v11;
    ++v13;
    BOOL v15 = v12-- <= 1;
    if (v15) {
      goto LABEL_25;
    }
  }
  if (v14 == 46)
  {
    if ((unint64_t)v12 < 2) {
      goto LABEL_25;
    }
    uint64_t v16 = 0;
    ++v13;
    while (1)
    {
      uint64_t v17 = v12 - 1;
      unsigned int v14 = *v13;
      if (v14 - 58 < 0xFFFFFFF6) {
        break;
      }
      uint64_t v16 = v14 - 48 + 10 * v16;
      ++v13;
      --v12;
      if ((unint64_t)(v17 + 1) <= 2) {
        goto LABEL_26;
      }
    }
    if (v14 == 46)
    {
      if ((unint64_t)v12 < 3)
      {
LABEL_26:
        uint64_t v18 = 0;
LABEL_27:
        unsigned int v14 = 0;
        goto LABEL_28;
      }
      uint64_t v18 = 0;
      v12 -= 2;
      ++v13;
      while (1)
      {
        unsigned int v14 = *v13;
        if (v14 - 58 < 0xFFFFFFF6) {
          break;
        }
        uint64_t v18 = v14 - 48 + 10 * v18;
        ++v13;
        BOOL v15 = v12-- <= 1;
        if (v15) {
          goto LABEL_27;
        }
      }
    }
    else
    {
      uint64_t v18 = 0;
      --v12;
    }
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v16 = 0;
  }
  if (v12 < 2)
  {
LABEL_28:
    uint64_t v19 = 0;
    goto LABEL_29;
  }
  uint64_t v19 = 0;
  v29 = v13 + 1;
  uint64_t v30 = v12 + 1;
  do
  {
    int v32 = *v29++;
    int v31 = v32;
    if ((v32 - 58) < 0xFFFFFFF6) {
      break;
    }
    uint64_t v19 = (v31 - 48) + 10 * v19;
    --v30;
  }
  while (v30 > 2);
LABEL_29:
  CFIndex v20 = CFStringGetLength(cf);
  if ((unint64_t)(v20 - 101) < 0xFFFFFFFFFFFFFF9CLL)
  {
    uint64_t v21 = 0;
LABEL_42:
    uint64_t v25 = 0;
    goto LABEL_43;
  }
  uint64_t v22 = v20;
  v23 = v38;
  v41.location = 0;
  v41.length = v20;
  CFStringGetCharacters(cf, v41, v38);
  uint64_t v21 = 0;
  while (1)
  {
    unsigned int v24 = *v23;
    if (v24 - 58 < 0xFFFFFFF6) {
      break;
    }
    uint64_t v21 = v24 - 48 + 10 * v21;
    ++v23;
    BOOL v15 = v22-- <= 1;
    if (v15) {
      goto LABEL_42;
    }
  }
  if (v24 == 46)
  {
    if ((unint64_t)v22 < 2) {
      goto LABEL_42;
    }
    uint64_t v25 = 0;
    ++v23;
    while (1)
    {
      uint64_t v26 = v22 - 1;
      unsigned int v24 = *v23;
      if (v24 - 58 < 0xFFFFFFF6) {
        break;
      }
      uint64_t v25 = v24 - 48 + 10 * v25;
      ++v23;
      --v22;
      if ((unint64_t)(v26 + 1) <= 2) {
        goto LABEL_43;
      }
    }
    if (v24 == 46)
    {
      if ((unint64_t)v22 < 3)
      {
LABEL_43:
        uint64_t v27 = 0;
LABEL_44:
        unsigned int v24 = 0;
        goto LABEL_45;
      }
      uint64_t v27 = 0;
      v22 -= 2;
      ++v23;
      while (1)
      {
        int v37 = *v23;
        if ((v37 - 58) < 0xFFFFFFF6) {
          break;
        }
        uint64_t v27 = (v37 - 48) + 10 * v27;
        ++v23;
        BOOL v15 = v22-- <= 1;
        if (v15) {
          goto LABEL_44;
        }
      }
      unsigned int v24 = *v23;
    }
    else
    {
      uint64_t v27 = 0;
      --v22;
    }
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v25 = 0;
  }
  if (v22 >= 2)
  {
    uint64_t v28 = 0;
    v33 = v23 + 1;
    uint64_t v34 = v22 + 1;
    do
    {
      int v36 = *v33++;
      int v35 = v36;
      if ((v36 - 58) < 0xFFFFFFF6) {
        break;
      }
      uint64_t v28 = (v35 - 48) + 10 * v28;
      --v34;
    }
    while (v34 > 2);
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v28 = 0;
LABEL_46:
  if (v11 > v21) {
    return 1;
  }
  if (v11 < v21) {
    return -1;
  }
  if (v16 > v25) {
    return 1;
  }
  if (v16 < v25) {
    return -1;
  }
  if (v18 > v27) {
    return 1;
  }
  if (v18 < v27) {
    return -1;
  }
  if (v14 > v24) {
    return 1;
  }
  if (v14 < v24) {
    return -1;
  }
  if (v19 > v28) {
    return 1;
  }
  if (v19 >= v28) {
    return 0;
  }
  else {
    return -1;
  }
}

void sub_1B28277C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B2827854(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B28278D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B2827B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1B2827C5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B2827E10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

Class __getFPItemIDClass_block_invoke(uint64_t a1)
{
  FileProviderLibrary();
  Class result = objc_getClass("FPItemID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFPItemIDClass_block_invoke_cold_1();
  }
  getFPItemIDClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

Class __getFPItemClass_block_invoke(uint64_t a1)
{
  FileProviderLibrary();
  Class result = objc_getClass("FPItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFPItemClass_block_invoke_cold_1();
  }
  getFPItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1B282A638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1B282ABE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B282B124(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_1B282BC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B282C088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1B282D1E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B282D768(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t ql_external_thumbnail_cache_create_tables_initial(void *a1, void *a2)
{
  id v3 = a1;
  if ([v3 execute:@"CREATE TABLE thumbnails( fpitemId TEXT NOT NULL, versionId BLOB NOT NULL, last_hit_date INTEGER NOT NULL, size INTEGER NOT NULL, file_extension TEXT NOT NULL, PRIMARY KEY (fpitemId))"]&& objc_msgSend(v3, "execute:", @"CREATE INDEX last_hit_date ON thumbnails (last_hit_date)"))
  {
    uint64_t v4 = [v3 setUserVersion:1];
    if (!a2) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (!a2) {
      goto LABEL_8;
    }
  }
  if ((v4 & 1) == 0)
  {
    *a2 = [v3 lastError];
  }
LABEL_8:

  return v4;
}

void sub_1B282E1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B282E538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B282E6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B282E868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B282EA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B282EC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1B282F0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B282F508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1B282FDFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B282FF54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B2830148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1B2830398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_activity_scope_state_s state)
{
}

void sub_1B2830AB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B2830DA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B2830E78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1B2832114(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t QLIconAutoDisplayExtension(void *a1)
{
  uint64_t v1 = QLIconAutoDisplayExtension_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&QLIconAutoDisplayExtension_onceToken, &__block_literal_global_5);
  }
  uint64_t v3 = QLSetContainsContentType((void *)QLIconAutoDisplayExtension_autoDisplayExtensionUTIs, v2);

  return v3;
}

void __QLIconAutoDisplayExtension_block_invoke()
{
  uint64_t v14 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v13 = *MEMORY[0x1E4F44470];
  uint64_t v12 = *MEMORY[0x1E4F44488];
  uint64_t v0 = *MEMORY[0x1E4F444A0];
  uint64_t v1 = *MEMORY[0x1E4F444A8];
  uint64_t v15 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"org.oasis-open.opendocument.text"];
  id v2 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.microsoft.word.doc"];
  uint64_t v3 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"org.openxmlformats.wordprocessingml.document"];
  uint64_t v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.microsoft.excel.xls"];
  CFTypeID v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"org.openxmlformats.spreadsheetml.sheet"];
  uint64_t v6 = *MEMORY[0x1E4F44450];
  uint64_t v7 = *MEMORY[0x1E4F443F0];
  BOOL v8 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"public.xhtml"];
  uint64_t v9 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.webarchive"];
  uint64_t v10 = objc_msgSend(v14, "setWithObjects:", v13, v12, v0, v1, v15, v2, v3, v4, v5, v6, v7, v8, v9, 0);
  uint64_t v11 = (void *)QLIconAutoDisplayExtension_autoDisplayExtensionUTIs;
  QLIconAutoDisplayExtension_autoDisplayExtensionUTIs = v10;
}

void sub_1B2833698(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B2833784(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B28338F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void setErrorWrappingUnderlyingError(void *a1, void *a2, uint64_t a3, void *a4)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  if (a4)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    if (v7)
    {
      uint64_t v11 = *MEMORY[0x1E4F28A50];
      v12[0] = v7;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    }
    else
    {
      uint64_t v10 = 0;
    }
    *a4 = [v9 errorWithDomain:v8 code:a3 userInfo:v10];
    if (v7) {
  }
    }
}

void sub_1B2834088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1B2835048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B283666C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1B2837300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B28375EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B283783C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B2838904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CloudDocsLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CloudDocsLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CloudDocsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E600A300;
    uint64_t v5 = 0;
    CloudDocsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CloudDocsLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!CloudDocsLibraryCore_frameworkLibrary)
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

void sub_1B283A140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose((const void *)(v17 - 176), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B283AD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _QLCopyResourcePropertyForKey(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = _log_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = a1;
    _os_log_impl(&dword_1B281E000, v8, OS_LOG_TYPE_INFO, "Getting NSURL thumbnails property for %@", buf, 0xCu);
  }

  id v9 = a2;
  uint64_t v10 = *MEMORY[0x1E4F1C710];
  if (([v9 isEqualToString:*MEMORY[0x1E4F1C710]] & 1) == 0)
  {
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"QLUnsupportedURLKey", @"QuickLook only handles NSURLThumbnailDictionaryKey and, on OS X, NSURLThumbnailKey", 0 reason userInfo];
    objc_exception_throw(v21);
  }
  id v22 = 0;
  uint64_t v11 = +[QLThumbnailAddition thumbnailsDictionaryForURL:a1 error:&v22];
  id v12 = v22;
  if (a3)
  {
    id v13 = v11;
    if (([v9 isEqualToString:v10] & 1) == 0)
    {
      uint64_t v14 = [v13 objectForKey:*MEMORY[0x1E4F1C500]];

      id v13 = (id)v14;
    }
    *a3 = v13;
  }
  if (v11) {
    goto LABEL_9;
  }
  if (!v12)
  {
    CFIndex v20 = _log_0();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = a1;
      _os_log_impl(&dword_1B281E000, v20, OS_LOG_TYPE_INFO, "Returning empty thumbnails dictionary for %@", buf, 0xCu);
    }

LABEL_9:
    uint64_t v15 = 1;
    goto LABEL_10;
  }
  if ([v12 code] == 2
    && ([v12 domain],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v17 isEqualToString:*MEMORY[0x1E4F28798]],
        v17,
        v18))
  {
    uint64_t v19 = _log_0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v12;
      __int16 v25 = 2112;
      uint64_t v26 = a1;
      _os_log_impl(&dword_1B281E000, v19, OS_LOG_TYPE_INFO, "Hit error %@ retrieving the thumbnails property for %@. This is expected if this is a logical URL corresponding to a sidefault.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v19 = _log_0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      _QLCopyResourcePropertyForKey_cold_1();
    }
  }

  uint64_t v15 = 0;
  if (a4) {
    *a4 = v12;
  }
LABEL_10:

  return v15;
}

BOOL _QLSetResourcePropertyForKey(uint64_t a1, void *a2, const void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = _log_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = a1;
    _os_log_impl(&dword_1B281E000, v8, OS_LOG_TYPE_INFO, "Setting NSURL thumbnails property for %@", buf, 0xCu);
  }

  id v9 = a2;
  if (![v9 isEqualToString:*MEMORY[0x1E4F1C710]])
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = @"QLUnsupportedURLKey";
    uint64_t v17 = @"QuickLook only handles NSURLThumbnailsKey";
    goto LABEL_12;
  }
  if (a3)
  {
    if ((const void *)*MEMORY[0x1E4F1D260] != a3)
    {
      CFTypeID v10 = CFGetTypeID(a3);
      if (v10 != CFDictionaryGetTypeID())
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = @"QLThumbnailInvalidFormat";
        uint64_t v17 = @"The value for the NSURL thumbnails key should be a dictionary where keys are dimensions and values are NSImage / UIImage instances";
LABEL_12:
        id v18 = [v15 exceptionWithName:v16 reason:v17 userInfo:0];
        objc_exception_throw(v18);
      }
    }
  }
  id v19 = 0;
  BOOL v11 = +[QLThumbnailAddition setThumbnailsDictionary:a3 forURL:a1 error:&v19];
  id v12 = v19;
  id v13 = v12;
  if (a4) {
    *a4 = v12;
  }

  return v11;
}

void *__getBRStartDownloadForItemsWithOptionsSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CloudDocsLibrary();
  Class result = dlsym(v2, "BRStartDownloadForItemsWithOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBRStartDownloadForItemsWithOptionsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBRThumbnailChangedAtURLSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CloudDocsLibrary();
  Class result = dlsym(v2, "BRThumbnailChangedAtURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBRThumbnailChangedAtURLSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CloudDocsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudDocsLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

__CFString *QLThumbnailRepresentationTypeToString(uint64_t a1)
{
  uint64_t v1 = @"Icon";
  if (a1 == 1) {
    uint64_t v1 = @"LowQualityThumbnail";
  }
  if (a1 == 2) {
    return @"Thumbnail";
  }
  else {
    return v1;
  }
}

void sub_1B283CF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B283D0F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id errorWithCodeAndUnderlyingError(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  if (a2)
  {
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    v10[0] = a2;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a2;
    id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = [v3 errorWithDomain:@"QLExternalThumbnailCache" code:a1 userInfo:v6];
  }
  else
  {
    id v6 = 0;
    id v7 = [v3 errorWithDomain:@"QLExternalThumbnailCache" code:a1 userInfo:0];
  }

  return v7;
}

void sub_1B283F4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAVFileTypeAVCISymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVFileTypeAVCI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVFileTypeAVCISymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t QLTSandboxWrapperForParentURLOf()
{
  return 0;
}

BOOL QLGetRealPath(const char *a1, unsigned char *a2)
{
  int v3 = open(a1, 0x8000, 0);
  if (v3 < 0)
  {
    id v6 = _log_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      QLGetRealPath_cold_1();
    }
  }
  else
  {
    int v4 = v3;
    if (fcntl(v3, 50, a2) != -1)
    {
      close(v4);
      return *a2 != 0;
    }
    id v7 = _log_0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      QLGetRealPath_cold_2();
    }

    close(v4);
  }
  return 0;
}

uint64_t QLTPrefersExtendedRange()
{
  if (QLTPrefersExtendedRange_onceToken != -1) {
    dispatch_once(&QLTPrefersExtendedRange_onceToken, &__block_literal_global_10);
  }
  return QLTPrefersExtendedRange_supportsDeepColor;
}

uint64_t __QLTPrefersExtendedRange_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  QLTPrefersExtendedRange_supportsDeepColor = result;
  return result;
}

uint64_t _QLComputeValuesForCGContextCreationWithSizeAndScale(_DWORD *a1, _DWORD *a2, int *a3, _DWORD *a4, int *a5, void *a6, CGColorSpaceRef space, double a8, double a9, double a10)
{
  int NumberOfComponents = CGColorSpaceGetNumberOfComponents(space);
  BOOL v21 = CGColorSpaceUsesExtendedRange(space);
  BOOL v22 = v21;
  int v23 = 16;
  if (NumberOfComponents != 1 || !v21)
  {
    if (CGColorSpaceIsWideGamutRGB(space)) {
      int v23 = 16;
    }
    else {
      int v23 = 8;
    }
  }
  *a1 = vcvtpd_s64_f64(a8 * a10);
  *a2 = vcvtpd_s64_f64(a9 * a10);
  *a3 = v23;
  int Type = CGColorSpaceGetType();
  BOOL v27 = (Type == 6 || Type == 10) && NumberOfComponents == 4 || NumberOfComponents == 1;
  int v28 = !v27;
  if (v27) {
    int v29 = NumberOfComponents;
  }
  else {
    int v29 = NumberOfComponents + 1;
  }
  if (Type == 2) {
    int v30 = 0;
  }
  else {
    int v30 = v28;
  }
  if (Type == 2) {
    int v31 = NumberOfComponents;
  }
  else {
    int v31 = v29;
  }
  *a4 = *a3 * v31;
  uint64_t result = CGBitmapGetAlignedBytesPerRow();
  *a6 = result;
  if (v22) {
    int v33 = 4352;
  }
  else {
    int v33 = 0;
  }
  *a5 = v30 | v33;
  return result;
}

CGContext *QLTCreateCGContext(int a1, int a2, int a3, size_t *a4, double a5, double a6, double a7)
{
  if (!a1) {
    goto LABEL_9;
  }
  if (!a2) {
    goto LABEL_6;
  }
  if (QLTPrefersExtendedRange_onceToken != -1) {
    dispatch_once(&QLTPrefersExtendedRange_onceToken, &__block_literal_global_10);
  }
  if (QLTPrefersExtendedRange_supportsDeepColor)
  {
LABEL_6:
    if (ExtendedSRGBColorSpace_onceToken != -1) {
      dispatch_once(&ExtendedSRGBColorSpace_onceToken, &__block_literal_global_19);
    }
    id v12 = &ExtendedSRGBColorSpace_extendedSRGBColorSpace;
  }
  else
  {
LABEL_9:
    if (StandardSRGBColorSpace_onceToken != -1) {
      dispatch_once(&StandardSRGBColorSpace_onceToken, &__block_literal_global_21);
    }
    id v12 = &StandardSRGBColorSpace_standardSRGBColorSpace;
  }
  id v13 = (CGColorSpace *)*v12;

  return QLTCreateCGContextWithSize(v13, a3, a4, a5, a6, a7);
}

CGContext *QLTCreateCGContextWithSize(CGColorSpaceRef a1, int a2, size_t *a3, double a4, double a5, double a6)
{
  uint64_t v9 = a1;
  if (!a1)
  {
    if (QLTPrefersExtendedRange_onceToken != -1) {
      dispatch_once(&QLTPrefersExtendedRange_onceToken, &__block_literal_global_10);
    }
    if (QLTPrefersExtendedRange_supportsDeepColor)
    {
      if (ExtendedSRGBColorSpace_onceToken != -1) {
        dispatch_once(&ExtendedSRGBColorSpace_onceToken, &__block_literal_global_19);
      }
      id v12 = &ExtendedSRGBColorSpace_extendedSRGBColorSpace;
    }
    else
    {
      if (StandardSRGBColorSpace_onceToken != -1) {
        dispatch_once(&StandardSRGBColorSpace_onceToken, &__block_literal_global_21);
      }
      id v12 = &StandardSRGBColorSpace_standardSRGBColorSpace;
    }
    uint64_t v9 = (CGColorSpace *)*v12;
  }
  if (CGColorSpaceUsesITUR_2100TF(v9))
  {
    if (DisplayP3_onceToken != -1) {
      dispatch_once(&DisplayP3_onceToken, &__block_literal_global_23);
    }
    uint64_t v9 = (CGColorSpace *)DisplayP3_displayP3ColorSpace;
  }
  size_t bitsPerComponent = 0;
  uint64_t v26 = 0;
  uint32_t bitmapInfo = 0;
  size_t v23 = 0;
  _QLComputeValuesForCGContextCreationWithSizeAndScale((_DWORD *)&v26 + 1, &v26, (int *)&bitsPerComponent + 1, &bitsPerComponent, (int *)&bitmapInfo, &v23, v9, a4, a5, a6);
  size_t v14 = v26;
  size_t v13 = HIDWORD(v26);
  if (SHIDWORD(v26) < 1 || (int)v26 <= 0)
  {
    uint64_t v16 = _log_0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      QLTCreateCGContextWithSize_cold_1(v13, v14, v16);
    }

    return 0;
  }
  else
  {
    size_t v18 = v23;
    if (a2)
    {
      size_t v19 = (*MEMORY[0x1E4F14B00] + v23 * v26 - 1) & -*MEMORY[0x1E4F14B00];
      *a3 = v19;
      CFIndex v20 = mmap(0, v19, 3, 4097, 1627389952, 0);
    }
    else
    {
      CFIndex v20 = 0;
      if (a3) {
        *a3 = v23 * v26;
      }
    }
    BOOL v21 = CGBitmapContextCreate(v20, v13, v14, SHIDWORD(bitsPerComponent), v18, v9, bitmapInfo);
    uint64_t v17 = v21;
    if (v21)
    {
      v27.size.width = (double)(int)v13;
      v27.size.height = (double)(int)v14;
      v27.origin.x = 0.0;
      v27.origin.y = 0.0;
      CGContextClearRect(v21, v27);
    }
  }
  return v17;
}

id QLTGetDefaultCacheLocation()
{
  uint64_t v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  uint64_t v1 = [v0 objectAtIndexedSubscript:0];

  id v2 = [v1 stringByAppendingPathComponent:@"com.apple.QuickLook.thumbnailcache"];

  return v2;
}

CGImage *QLCGImageRefPNGRepresentation(CGImage *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F1CA58] data];
    int v3 = [(id)*MEMORY[0x1E4F44460] identifier];
    int v4 = CGImageDestinationCreateWithData(v2, v3, 1uLL, 0);

    if (v4)
    {
      CGImageDestinationAddImage(v4, v1, 0);
      BOOL v5 = CGImageDestinationFinalize(v4);
      CFRelease(v4);
      if (v5) {
        id v6 = v2;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v1 = v6;
  }

  return v1;
}

void QLTRunInMainThreadAsync(void *a1)
{
  uint64_t v1 = a1;
  if (!v1) {
    QLTRunInMainThreadAsync_cold_1();
  }
  block = v1;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void QLTRunInMainThreadSync(void *a1)
{
  uint64_t v1 = a1;
  if (!v1) {
    QLTRunInMainThreadSync_cold_1();
  }
  block = v1;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    block[2]();
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

uint64_t QLSetContainsContentType(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    pthread_mutex_lock(&QLSetContainsContentType_lock);
    if ([v3 containsObject:v5])
    {
      uint64_t v6 = 1;
    }
    else
    {
      [v3 allObjects];
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        uint64_t v8 = *(void *)v12;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v7);
            }
            if (objc_msgSend(v5, "conformsToType:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
            {
              if (([v5 isDynamic] & 1) == 0) {
                [v3 addObject:v5];
              }
              uint64_t v6 = 1;
              goto LABEL_17;
            }
          }
          uint64_t v6 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
    pthread_mutex_unlock(&QLSetContainsContentType_lock);
  }

  return v6;
}

CGColorSpaceRef __ExtendedSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
  ExtendedSRGBColorSpace_extendedSRGBColorSpace = (uint64_t)result;
  return result;
}

CGColorSpaceRef __StandardSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  StandardSRGBColorSpace_standardSRGBColorSpace = (uint64_t)result;
  return result;
}

CGColorSpaceRef __DisplayP3_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
  DisplayP3_displayP3ColorSpace = (uint64_t)result;
  return result;
}

uint64_t AVFoundationLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = AVFoundationLibraryCore_frameworkLibrary;
  uint64_t v5 = AVFoundationLibraryCore_frameworkLibrary;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E600A400;
    long long v7 = *(_OWORD *)&off_1E600A410;
    v3[3] = _sl_dlopen();
    AVFoundationLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1B284158C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __AVFoundationLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  AVFoundationLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AVFoundationLibrary()
{
  uint64_t v0 = AVFoundationLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t UIKitLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = UIKitLibraryCore_frameworkLibrary;
  uint64_t v5 = UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E600A420;
    long long v7 = *(_OWORD *)&off_1E600A430;
    v3[3] = _sl_dlopen();
    UIKitLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1B28417A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __UIKitLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  UIKitLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitLibrary()
{
  uint64_t v0 = UIKitLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getUIImageClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getUIImageClass_softClass;
  uint64_t v7 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getUIImageClass_block_invoke;
    v3[3] = &unk_1E6009910;
    v3[4] = &v4;
    __getUIImageClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B2841970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UIImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getUIImageClass_block_invoke_cold_1();
    return (Class)getUIGraphicsBeginImageContextWithOptionsSymbolLoc(v3);
  }
  return result;
}

uint64_t getUIGraphicsBeginImageContextWithOptionsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  uint64_t v6 = getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  if (!getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr)
  {
    id v1 = (void *)UIKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UIGraphicsBeginImageContextWithOptions");
    getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B2841AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUIGraphicsBeginImageContextWithOptionsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsBeginImageContextWithOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _UIGraphicsBeginImageContextWithOptions(uint64_t a1, double a2, double a3, double a4)
{
  UIGraphicsBeginImageContextWithOptionsSymbolLoc = (uint64_t (*)(uint64_t, __n128, __n128, __n128))getUIGraphicsBeginImageContextWithOptionsSymbolLoc();
  if (UIGraphicsBeginImageContextWithOptionsSymbolLoc)
  {
    v9.n128_f64[0] = a2;
    v10.n128_f64[0] = a3;
    v11.n128_f64[0] = a4;
    return UIGraphicsBeginImageContextWithOptionsSymbolLoc(a1, v9, v10, v11);
  }
  else
  {
    uint64_t v13 = +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
    return getUIGraphicsGetCurrentContextSymbolLoc(v13);
  }
}

uint64_t getUIGraphicsGetCurrentContextSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  uint64_t v6 = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  if (!getUIGraphicsGetCurrentContextSymbolLoc_ptr)
  {
    id v1 = (void *)UIKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UIGraphicsGetCurrentContext");
    getUIGraphicsGetCurrentContextSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B2841C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUIGraphicsGetCurrentContextSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsGetCurrentContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsGetCurrentContextSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _UIGraphicsGetCurrentContext()
{
  CurrentContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsGetCurrentContextSymbolLoc();
  if (CurrentContextSymbolLoc)
  {
    return CurrentContextSymbolLoc();
  }
  else
  {
    uint64_t v2 = +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
    return getUIGraphicsEndImageContextSymbolLoc(v2);
  }
}

uint64_t getUIGraphicsEndImageContextSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUIGraphicsEndImageContextSymbolLoc_ptr;
  uint64_t v6 = getUIGraphicsEndImageContextSymbolLoc_ptr;
  if (!getUIGraphicsEndImageContextSymbolLoc_ptr)
  {
    id v1 = (void *)UIKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UIGraphicsEndImageContext");
    getUIGraphicsEndImageContextSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B2841DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUIGraphicsEndImageContextSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsEndImageContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsEndImageContextSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _UIGraphicsEndImageContext()
{
  UIGraphicsEndImageContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsEndImageContextSymbolLoc();
  if (UIGraphicsEndImageContextSymbolLoc)
  {
    return UIGraphicsEndImageContextSymbolLoc();
  }
  else
  {
    +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
    return getUIGraphicsPushContextSymbolLoc();
  }
}

uint64_t getUIGraphicsPushContextSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUIGraphicsPushContextSymbolLoc_ptr;
  uint64_t v6 = getUIGraphicsPushContextSymbolLoc_ptr;
  if (!getUIGraphicsPushContextSymbolLoc_ptr)
  {
    id v1 = (void *)UIKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UIGraphicsPushContext");
    getUIGraphicsPushContextSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B2841F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUIGraphicsPushContextSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsPushContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsPushContextSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _UIGraphicsPushContext(uint64_t a1)
{
  UIGraphicsPushContextSymbolLoc = (uint64_t (*)(uint64_t))getUIGraphicsPushContextSymbolLoc();
  if (UIGraphicsPushContextSymbolLoc)
  {
    return UIGraphicsPushContextSymbolLoc(a1);
  }
  else
  {
    uint64_t v4 = +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
    return getUIGraphicsPopContextSymbolLoc(v4);
  }
}

uint64_t getUIGraphicsPopContextSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getUIGraphicsPopContextSymbolLoc_ptr;
  uint64_t v6 = getUIGraphicsPopContextSymbolLoc_ptr;
  if (!getUIGraphicsPopContextSymbolLoc_ptr)
  {
    id v1 = (void *)UIKitLibrary();
    v4[3] = (uint64_t)dlsym(v1, "UIGraphicsPopContext");
    getUIGraphicsPopContextSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B28420C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getUIGraphicsPopContextSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsPopContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsPopContextSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _UIGraphicsPopContext()
{
  UIGraphicsPopContextSymbolLoc = (uint64_t (*)(void))getUIGraphicsPopContextSymbolLoc();
  if (UIGraphicsPopContextSymbolLoc)
  {
    return UIGraphicsPopContextSymbolLoc();
  }
  else
  {
    +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
    return FileProviderLibraryCore();
  }
}

uint64_t FileProviderLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = FileProviderLibraryCore_frameworkLibrary;
  uint64_t v5 = FileProviderLibraryCore_frameworkLibrary;
  if (!FileProviderLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E600A440;
    long long v7 = *(_OWORD *)&off_1E600A450;
    v3[3] = _sl_dlopen();
    FileProviderLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1B2842270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __FileProviderLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  FileProviderLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t FileProviderLibrary()
{
  uint64_t v0 = FileProviderLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t getFPIsCloudDocsWithFPFSEnabledSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getFPIsCloudDocsWithFPFSEnabledSymbolLoc_ptr;
  uint64_t v6 = getFPIsCloudDocsWithFPFSEnabledSymbolLoc_ptr;
  if (!getFPIsCloudDocsWithFPFSEnabledSymbolLoc_ptr)
  {
    id v1 = (void *)FileProviderLibrary();
    v4[3] = (uint64_t)dlsym(v1, "FPIsCloudDocsWithFPFSEnabled");
    getFPIsCloudDocsWithFPFSEnabledSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B284244C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFPIsCloudDocsWithFPFSEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)FileProviderLibrary();
  uint64_t result = dlsym(v2, "FPIsCloudDocsWithFPFSEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFPIsCloudDocsWithFPFSEnabledSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _FPIsCloudDocsWithFPFSEnabled()
{
  FPIsCloudDocsWithFPFSEnabledSymbolLoc = (uint64_t (*)(void))getFPIsCloudDocsWithFPFSEnabledSymbolLoc();
  if (FPIsCloudDocsWithFPFSEnabledSymbolLoc)
  {
    return FPIsCloudDocsWithFPFSEnabledSymbolLoc();
  }
  else
  {
    uint64_t v2 = +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
    return getFPURLMightBeInFileProviderSymbolLoc(v2);
  }
}

uint64_t getFPURLMightBeInFileProviderSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getFPURLMightBeInFileProviderSymbolLoc_ptr;
  uint64_t v6 = getFPURLMightBeInFileProviderSymbolLoc_ptr;
  if (!getFPURLMightBeInFileProviderSymbolLoc_ptr)
  {
    id v1 = (void *)FileProviderLibrary();
    v4[3] = (uint64_t)dlsym(v1, "FPURLMightBeInFileProvider");
    getFPURLMightBeInFileProviderSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B28425BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getFPURLMightBeInFileProviderSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)FileProviderLibrary();
  uint64_t result = dlsym(v2, "FPURLMightBeInFileProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFPURLMightBeInFileProviderSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

QLFileThumbnailRequest *_FPURLMightBeInFileProvider(uint64_t a1)
{
  FPURLMightBeInFileProviderSymbolLoc = (uint64_t (*)(uint64_t))getFPURLMightBeInFileProviderSymbolLoc();
  if (FPURLMightBeInFileProviderSymbolLoc)
  {
    return (QLFileThumbnailRequest *)FPURLMightBeInFileProviderSymbolLoc(a1);
  }
  else
  {
    uint64_t v4 = +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:]();
    return __getFPSandboxingURLWrapperClass_block_invoke(v4);
  }
}

QLFileThumbnailRequest *__getFPSandboxingURLWrapperClass_block_invoke(uint64_t a1)
{
  FileProviderLibrary();
  uint64_t result = (QLFileThumbnailRequest *)objc_getClass("FPSandboxingURLWrapper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFPSandboxingURLWrapperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (QLFileThumbnailRequest *)__getFPSandboxingURLWrapperClass_block_invoke_cold_1();
    return [(QLFileThumbnailRequest *)v3 initWithItem:v5 maximumSize:v10 minimumSize:v8 scale:v9 options:v6 generationData:v7];
  }
  return result;
}

void sub_1B28433FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

CGImageRef QLCreateCGImageWithData(const __CFData *a1, CGColorSpaceRef space, double a3, double a4, double a5)
{
  int v16 = 0;
  int v15 = 0;
  uint64_t v14 = 0;
  CGBitmapInfo v13 = 0;
  size_t bytesPerRow = 0;
  _QLComputeValuesForCGContextCreationWithSizeAndScale(&v16, &v15, (int *)&v14 + 1, &v14, (int *)&v13, &bytesPerRow, space, a3, a4, a5);
  if (v16 < 1 || v15 <= 0)
  {
    double v8 = qword_1EB5E7D88;
    if (!qword_1EB5E7D88)
    {
      QLTInitLogging();
      double v8 = qword_1EB5E7D88;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      QLCreateCGImageWithData_cold_1(&v16, &v15, v8);
    }
    return 0;
  }
  else
  {
    double v9 = CGDataProviderCreateWithCFData(a1);
    CGImageRef v10 = CGImageCreate(v16, v15, SHIDWORD(v14), (int)v14, bytesPerRow, space, v13, v9, 0, 0, kCGRenderingIntentDefault);
    CGDataProviderRelease(v9);
    CGColorSpaceRelease(space);
  }
  return v10;
}

CGImageRef QLCreateCGImageWithDataAndFormat(const __CFData *a1, void *a2)
{
  id v3 = a2;
  SEL v4 = CGDataProviderCreateWithCFData(a1);
  size_t v5 = [v3 width];
  size_t v6 = [v3 height];
  size_t v7 = [v3 bitsPerComponent];
  size_t v8 = [v3 bitsPerPixel];
  size_t v9 = [v3 bytesPerRow];
  CGImageRef v10 = (CGColorSpace *)[v3 colorSpace];
  CGBitmapInfo v11 = [v3 bitmapInfo];

  CGImageRef v12 = CGImageCreate(v5, v6, v7, v8, v9, v10, v11, v4, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v4);
  return v12;
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_1B2845BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B284607C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

Class __getFPItemClass_block_invoke_0(uint64_t a1)
{
  FileProviderLibrary();
  Class result = objc_getClass("FPItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFPItemClass_block_invoke_cold_1();
  }
  getFPItemClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ThumbnailExtension.configuration.getter(void *a1@<X8>)
{
  type metadata accessor for ThumbnailExtensionConfiguration();
  id v3 = (char *)objc_allocWithZone((Class)type metadata accessor for ThumbnailExtensionConfiguration());
  uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v5 = *MEMORY[0x1E4FBC8C8] & *(void *)v3;
  *(void *)&v3[*(void *)(v5 + 0x60)] = 0;
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)(v5 + 80) - 8) + 16))(&v3[*(void *)((*v4 & *(void *)v3) + 0x68)], v1, *(void *)(v5 + 80));
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for ThumbnailExtensionConfiguration();
  id v11 = objc_msgSendSuper2(&v12, sel_init);
  id v6 = objc_allocWithZone((Class)QLThumbnailConnectionHandler);
  size_t v7 = v11;
  id v8 = objc_msgSend(v6, sel_initWithPrincipalObject_, sub_1B2853B10());

  swift_unknownObjectRelease();
  uint64_t v9 = *(void *)((*v4 & *v7) + 0x60);
  CGImageRef v10 = *(void **)((char *)v7 + v9);
  *(void *)((char *)v7 + v9) = v8;

  *a1 = v7;
}

uint64_t type metadata accessor for ThumbnailExtensionConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static ThumbnailProviderBuilder.buildBlock(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v10 = MEMORY[0x1E4FBC860];
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v5 = a1 + 32;
    swift_bridgeObjectRetain();
    do
    {
      v5 += 24;
      uint64_t v6 = swift_bridgeObjectRetain();
      sub_1B284B800(v6);
      --v4;
    }
    while (v4);
    uint64_t v7 = v10;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = MEMORY[0x1E4FBC860];
  }
  uint64_t v8 = sub_1B284D920(v7);
  swift_bridgeObjectRelease();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *a2 = v8;
  a2[1] = (uint64_t)&unk_1E9C2FAE8;
  a2[2] = result;
  return result;
}

double ThumbnailRequest.Options.maximumSize.getter()
{
  return *(double *)v0;
}

double ThumbnailRequest.Options.minimumSize.getter()
{
  return *(double *)(v0 + 16);
}

double ThumbnailRequest.Options.scale.getter()
{
  return *(double *)(v0 + 32);
}

uint64_t ThumbnailRequest.Options.wantsLowQuality.getter()
{
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t ThumbnailRequest.Options.interpolationQuality.getter()
{
  return *(unsigned int *)(v0 + 44);
}

uint64_t ThumbnailRequest.Options.iconFlavor.getter()
{
  return *(unsigned int *)(v0 + 48);
}

uint64_t ThumbnailRequest.Options.iconCorner.getter()
{
  return *(unsigned int *)(v0 + 52);
}

uint64_t ThumbnailRequest.Options.thirdPartyVideoDecodersAllowed.getter()
{
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t sub_1B28467B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>)
{
  if (!*(void *)(a1 + 16))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    goto LABEL_9;
  }
  uint64_t v14 = @"WantsLowQuality";
  unint64_t v15 = sub_1B284D0D4((uint64_t)v14);
  if ((v16 & 1) == 0)
  {
    long long v32 = 0u;
    long long v33 = 0u;

    goto LABEL_9;
  }
  sub_1B284ED50(*(void *)(a1 + 56) + 32 * v15, (uint64_t)&v32);

  if (!*((void *)&v33 + 1))
  {
LABEL_9:
    sub_1B284F440((uint64_t)&v32, &qword_1E9C2F5E0);
LABEL_10:
    char v17 = 0;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
  if (!swift_dynamicCast()) {
    goto LABEL_10;
  }
  char v17 = v31;
  if (!*(void *)(a1 + 16))
  {
LABEL_6:
    long long v32 = 0u;
    long long v33 = 0u;
LABEL_18:
    sub_1B284F440((uint64_t)&v32, &qword_1E9C2F5E0);
    goto LABEL_19;
  }
LABEL_11:
  size_t v18 = @"ThirdPartyVideoDecodersAllowed";
  unint64_t v19 = sub_1B284D0D4((uint64_t)v18);
  if (v20)
  {
    sub_1B284ED50(*(void *)(a1 + 56) + 32 * v19, (uint64_t)&v32);
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
  }

  if (!*((void *)&v33 + 1)) {
    goto LABEL_18;
  }
  if (swift_dynamicCast())
  {
    char v21 = v31;
    if (*(void *)(a1 + 16)) {
      goto LABEL_20;
    }
LABEL_17:
    long long v32 = 0u;
    long long v33 = 0u;
LABEL_27:
    sub_1B284F440((uint64_t)&v32, &qword_1E9C2F5E0);
LABEL_28:
    unsigned int v25 = 0;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_26;
    }
    goto LABEL_29;
  }
LABEL_19:
  char v21 = 0;
  if (!*(void *)(a1 + 16)) {
    goto LABEL_17;
  }
LABEL_20:
  BOOL v22 = @"InterpolationQuality";
  unint64_t v23 = sub_1B284D0D4((uint64_t)v22);
  if (v24)
  {
    sub_1B284ED50(*(void *)(a1 + 56) + 32 * v23, (uint64_t)&v32);
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
  }

  if (!*((void *)&v33 + 1)) {
    goto LABEL_27;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_28;
  }
  unsigned int v25 = v31;
  if (!*(void *)(a1 + 16))
  {
LABEL_26:
    long long v32 = 0u;
    long long v33 = 0u;
    goto LABEL_33;
  }
LABEL_29:
  uint64_t v26 = @"IconFlavor";
  unint64_t v27 = sub_1B284D0D4((uint64_t)v26);
  if (v28)
  {
    sub_1B284ED50(*(void *)(a1 + 56) + 32 * v27, (uint64_t)&v32);
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
  }

LABEL_33:
  swift_bridgeObjectRelease();
  if (!*((void *)&v33 + 1))
  {
    uint64_t result = sub_1B284F440((uint64_t)&v32, &qword_1E9C2F5E0);
    goto LABEL_37;
  }
  uint64_t result = swift_dynamicCast();
  if (!result)
  {
LABEL_37:
    unsigned int v30 = 0;
    goto LABEL_38;
  }
  unsigned int v30 = v31;
LABEL_38:
  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(double *)(a2 + 32) = a7;
  *(unsigned char *)(a2 + 40) = v17;
  *(_DWORD *)(a2 + 44) = v25;
  *(_DWORD *)(a2 + 48) = v30;
  *(_DWORD *)(a2 + 52) = (v30 >> 8) & 7;
  *(unsigned char *)(a2 + 56) = v21;
  return result;
}

double ThumbnailRequest.options.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  char v3 = *(unsigned char *)(v1 + 40);
  int v4 = *(_DWORD *)(v1 + 52);
  char v5 = *(unsigned char *)(v1 + 56);
  long long v6 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 40) = v3;
  double result = *(double *)(v1 + 44);
  *(double *)(a1 + 44) = result;
  *(_DWORD *)(a1 + 52) = v4;
  *(unsigned char *)(a1 + 56) = v5;
  return result;
}

uint64_t ThumbnailRequest.contentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1B2853900();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  long long v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(*(id *)(v1 + 64), sel_contentType);
  if (v7)
  {
    uint64_t v8 = v7;
    sub_1B28538D0();

    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v6, v3);
  }
  else
  {
    return sub_1B28538E0();
  }
}

uint64_t ThumbnailRequest.fileURL.getter(uint64_t a1)
{
  v2[2] = a1;
  sub_1B28537B0();
  v2[3] = swift_task_alloc();
  uint64_t v3 = sub_1B28537C0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  uint64_t v4 = sub_1B2853870();
  v2[7] = v4;
  v2[8] = *(void *)(v4 - 8);
  v2[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2F5A8);
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = *(void *)(v1 + 64);
  v2[10] = v5;
  v2[11] = v6;
  return MEMORY[0x1F4188298](sub_1B2846D98, 0, 0);
}

uint64_t sub_1B2846D98()
{
  id v1 = objc_msgSend(*(id *)(v0 + 88), sel_fileURL);
  uint64_t v2 = *(void *)(v0 + 80);
  if (v1)
  {
    uint64_t v3 = v1;
    uint64_t v5 = *(void *)(v0 + 64);
    uint64_t v4 = *(void *)(v0 + 72);
    uint64_t v6 = *(void *)(v0 + 56);
    sub_1B2853860();

    id v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
    v7(v2, v4, v6);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v2, 0, 1, v6);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v2, 1, v6) != 1)
    {
      v7(*(void *)(v0 + 16), *(void *)(v0 + 80), *(void *)(v0 + 56));
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_6;
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 64) + 56))(*(void *)(v0 + 80), 1, 1, *(void *)(v0 + 56));
  }
  uint64_t v10 = *(void *)(v0 + 40);
  uint64_t v9 = *(void *)(v0 + 48);
  uint64_t v11 = *(void *)(v0 + 32);
  sub_1B284F440(*(void *)(v0 + 80), &qword_1E9C2F5A8);
  sub_1B28537A0();
  sub_1B284B130(MEMORY[0x1E4FBC860]);
  sub_1B284EC6C(&qword_1E9C2FAF8, MEMORY[0x1E4F26C20]);
  sub_1B2853830();
  sub_1B2853790();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
LABEL_6:
  return v8();
}

uint64_t ThumbnailRequest.data.getter()
{
  sub_1B28537B0();
  v1[2] = swift_task_alloc();
  uint64_t v2 = sub_1B28537C0();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = *(void *)(v0 + 64);
  v1[5] = v3;
  v1[6] = v4;
  return MEMORY[0x1F4188298](sub_1B28470D0, 0, 0);
}

uint64_t sub_1B28470D0()
{
  id v1 = objc_msgSend(*(id *)(v0 + 48), sel_fileData);
  uint64_t v2 = *(void *)(v0 + 40);
  if (v1)
  {
    uint64_t v3 = v1;
    uint64_t v4 = sub_1B2853890();
    uint64_t v6 = v5;

    swift_task_dealloc();
    swift_task_dealloc();
    id v7 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v7(v4, v6);
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 24);
    uint64_t v10 = *(void *)(v0 + 32);
    sub_1B28537A0();
    sub_1B284B130(MEMORY[0x1E4FBC860]);
    sub_1B284EC6C(&qword_1E9C2FAF8, MEMORY[0x1E4F26C20]);
    sub_1B2853830();
    sub_1B2853790();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2, v9);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

BOOL ThumbnailRequest.isFileBacked.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + 64), sel_data);
  if (v1)
  {
    uint64_t v2 = sub_1B2853890();
    unint64_t v4 = v3;

    sub_1B284DC0C(v2, v4);
  }
  return v1 == 0;
}

id ThumbnailReply.inner.getter()
{
  return *v0;
}

uint64_t ThumbnailReply.extensionBadge.getter()
{
  id v1 = objc_msgSend(*v0, sel_extensionBadge);
  uint64_t v2 = sub_1B28539C0();

  return v2;
}

void sub_1B284733C(void **a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v3 = *a1;
  id v4 = a1[1];
  swift_bridgeObjectRetain();
  id v5 = v3;
  id v6 = objc_msgSend(v5, sel_extensionBadge);
  uint64_t v7 = sub_1B28539C0();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();

  *a2 = v7;
  a2[1] = v9;
}

void sub_1B28473D4(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_bridgeObjectRetain();
  id v3 = (id)sub_1B2853990();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setExtensionBadge_, v3);
}

void ThumbnailReply.extensionBadge.setter()
{
  id v1 = *v0;
  id v2 = (id)sub_1B2853990();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setExtensionBadge_, v2);
}

void (*ThumbnailReply.extensionBadge.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = (uint64_t)v1;
  id v3 = objc_msgSend(*v1, sel_extensionBadge);
  uint64_t v4 = sub_1B28539C0();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
  return sub_1B2847554;
}

void sub_1B2847554(uint64_t a1, char a2)
{
  id v2 = **(void ***)(a1 + 16);
  if (a2)
  {
    swift_bridgeObjectRetain();
    id v3 = (id)sub_1B2853990();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setExtensionBadge_, v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = (id)sub_1B2853990();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setExtensionBadge_, v3);
  }
}

id ThumbnailReply.metadata.getter()
{
  id v1 = objc_msgSend(*v0, sel_metadata);

  return v1;
}

double static ThumbnailReply.fileURL(_:contentType:)@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2F5C0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B284F368(a1, (uint64_t)v6, &qword_1E9C2F5C0);
  uint64_t v7 = (void *)sub_1B2853850();
  uint64_t v8 = sub_1B2853900();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    uint64_t v10 = (void *)sub_1B28538C0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  id v11 = objc_msgSend(self, sel_replyWithFileURL_contentType_, v7, v10);

  unint64_t v12 = sub_1B2847E24(MEMORY[0x1E4FBC860]);
  *(void *)a2 = v11;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)&double result = 0x7FFFFFFFLL;
  *(void *)(a2 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a2 + 28) = 1;
  *(void *)(a2 + 32) = v12;
  return result;
}

double static ThumbnailReply.cgRenderer(size:renderer:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  v16[4] = sub_1B284DC64;
  v16[5] = v10;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_1B2847938;
  v16[3] = &block_descriptor;
  id v11 = _Block_copy(v16);
  unint64_t v12 = self;
  swift_retain();
  id v13 = objc_msgSend(v12, sel_replyWithContextSize_drawingBlock_, v11, a4, a5);
  _Block_release(v11);
  swift_release();
  unint64_t v14 = sub_1B2847E24(MEMORY[0x1E4FBC860]);
  *(void *)a3 = v13;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)&double result = 0x7FFFFFFFLL;
  *(void *)(a3 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a3 + 28) = 1;
  *(void *)(a3 + 32) = v14;
  return result;
}

uint64_t sub_1B2847938(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

double static ThumbnailReply.currentContextRenderer(size:renderer:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  v16[4] = sub_1B284DC80;
  v16[5] = v10;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = sub_1B2847ADC;
  v16[3] = &block_descriptor_12;
  id v11 = _Block_copy(v16);
  unint64_t v12 = self;
  swift_retain();
  id v13 = objc_msgSend(v12, sel_replyWithContextSize_currentContextDrawingBlock_, v11, a4, a5);
  _Block_release(v11);
  swift_release();
  unint64_t v14 = sub_1B2847E24(MEMORY[0x1E4FBC860]);
  *(void *)a3 = v13;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)&double result = 0x7FFFFFFFLL;
  *(void *)(a3 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a3 + 28) = 1;
  *(void *)(a3 + 32) = v14;
  return result;
}

uint64_t sub_1B2847ADC(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  return v1 & 1;
}

double static ThumbnailReply.data(_:contentType:attachments:)@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X3>, uint64_t a4@<X8>)
{
  sub_1B284DCD0(a1, a2);
  uint64_t v8 = (void *)sub_1B2853880();
  uint64_t v9 = (void *)sub_1B28538C0();
  id v10 = objc_msgSend(self, sel_replyWithData_contentType_, v8, v9);

  sub_1B284DC0C(a1, a2);
  id v11 = objc_msgSend(v10, sel_item);
  if (v11)
  {
    unint64_t v12 = v11;
    if (a3)
    {
      sub_1B284DD28();
      a3 = (void *)sub_1B2853940();
    }
    objc_msgSend(v12, sel_setAttachments_, a3);
  }
  unint64_t v13 = sub_1B2847E24(MEMORY[0x1E4FBC860]);
  *(void *)a4 = v10;
  *(void *)(a4 + 8) = 0;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)&double result = 0x7FFFFFFFLL;
  *(void *)(a4 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a4 + 28) = 1;
  *(void *)(a4 + 32) = v13;
  return result;
}

CGColorSpace *static ThumbnailReply.cgImage(_:scale:isLowQuality:)@<X0>(CGImage *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v8 = (double)(uint64_t)CGImageGetWidth(a1) / a4;
  double v9 = (double)(uint64_t)CGImageGetHeight(a1) / a4;
  uint64_t v10 = swift_allocObject();
  *(double *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = a1;
  *(double *)(v10 + 32) = v8;
  *(double *)(v10 + 40) = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1B284DDA0;
  *(void *)(v11 + 24) = v10;
  v18[4] = sub_1B284DC64;
  v18[5] = v11;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 1107296256;
  v18[2] = sub_1B2847938;
  v18[3] = &block_descriptor_22;
  unint64_t v12 = _Block_copy(v18);
  unint64_t v13 = self;
  unint64_t v14 = a1;
  swift_retain();
  id v15 = objc_msgSend(v13, sel_replyWithContextSize_drawingBlock_, v12, v8, v9);
  _Block_release(v12);
  swift_release();
  unint64_t v16 = sub_1B2847E24(MEMORY[0x1E4FBC860]);
  swift_release();
  *(void *)a3 = v15;
  *(void *)(a3 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a3 + 28) = 1;
  *(void *)(a3 + 32) = v16;
  double result = CGImageGetColorSpace(v14);
  *(void *)(a3 + 8) = result;
  *(unsigned char *)(a3 + 16) = a2;
  return result;
}

unint64_t sub_1B2847E24(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2FB90);
  uint64_t v2 = sub_1B2853AE0();
  id v3 = (void *)v2;
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
    sub_1B284F368(v6, (uint64_t)&v15, &qword_1E9C2FB98);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1B284D168(v15, v16, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1B284D364);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1B284F354(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t static ThumbnailReply.images(_:properties:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1B284802C(a1);
  uint64_t v5 = (void *)sub_1B28539E0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel_replyWithImages_, v5);

  sub_1B2847E24(MEMORY[0x1E4FBC860]);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a3 + 28) = 1;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a3 + 32) = a2;
  return result;
}

uint64_t sub_1B284802C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1B2853AD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1B284D448(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x1B3EAB4E0](i, a1);
        type metadata accessor for CGImage(0);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B284D448(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1B284D448(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_1B284F354(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      type metadata accessor for CGImage(0);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B284D448(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1B284D448(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_1B284F354(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

double static ThumbnailReply.imageRenderer(_:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  v12[4] = sub_1B284DE94;
  v12[5] = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  _OWORD v12[2] = sub_1B2848388;
  v12[3] = &block_descriptor_28;
  unint64_t v7 = _Block_copy(v12);
  uint64_t v8 = self;
  swift_retain();
  id v9 = objc_msgSend(v8, sel_replyWithImageRenderer_, v7);
  _Block_release(v7);
  swift_release();
  unint64_t v10 = sub_1B2847E24(MEMORY[0x1E4FBC860]);
  *(void *)a3 = v9;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)&double result = 0x7FFFFFFFLL;
  *(void *)(a3 + 20) = 0x7FFFFFFFLL;
  *(_DWORD *)(a3 + 28) = 1;
  *(void *)(a3 + 32) = v10;
  return result;
}

uint64_t sub_1B2848388(uint64_t a1, void *aBlock)
{
  uint64_t v2 = *(void (**)(uint64_t (*)(), uint64_t))(a1 + 32);
  uint64_t v3 = _Block_copy(aBlock);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  v2(sub_1B284F308, v4);
  swift_release();

  return swift_release();
}

void *ThumbnailReply.colorSpace.getter()
{
  id v1 = *(void **)(v0 + 8);
  id v2 = v1;
  return v1;
}

void ThumbnailReply.colorSpace.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

uint64_t (*ThumbnailReply.colorSpace.modify())()
{
  return nullsub_1;
}

uint64_t ThumbnailReply.isLowQuality.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t ThumbnailReply.isLowQuality.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*ThumbnailReply.isLowQuality.modify())()
{
  return nullsub_1;
}

uint64_t ThumbnailReply.iconFlavor.getter()
{
  return *(unsigned int *)(v0 + 20);
}

uint64_t ThumbnailReply.iconFlavor.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 20) = result;
  return result;
}

uint64_t (*ThumbnailReply.iconFlavor.modify())()
{
  return nullsub_1;
}

uint64_t ThumbnailReply.iconCorner.getter()
{
  return *(unsigned int *)(v0 + 24);
}

uint64_t ThumbnailReply.iconCorner.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*ThumbnailReply.iconCorner.modify())()
{
  return nullsub_1;
}

uint64_t ThumbnailReply.inlinePreviewMode.getter()
{
  return *(unsigned int *)(v0 + 28);
}

uint64_t ThumbnailReply.inlinePreviewMode.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 28) = result;
  return result;
}

uint64_t (*ThumbnailReply.inlinePreviewMode.modify())()
{
  return nullsub_1;
}

uint64_t ThumbnailReply.additionalProperties.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ThumbnailReply.additionalProperties.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*ThumbnailReply.additionalProperties.modify())()
{
  return nullsub_1;
}

uint64_t sub_1B28485A8()
{
  uint64_t v0 = sub_1B2853930();
  __swift_allocate_value_buffer(v0, qword_1E9C30468);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E9C30468);
  return sub_1B2853920();
}

void *ThumbnailProvider.init<A>(for:generator:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v10 = sub_1B28538A0();
  uint64_t v11 = sub_1B284D920(v10);
  swift_bridgeObjectRelease();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a1;
  result[5] = a2;
  *a5 = v11;
  a5[1] = (uint64_t)&unk_1E9C2FB18;
  a5[2] = (uint64_t)result;
  return result;
}

uint64_t sub_1B28486C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 104) = a5;
  *(void *)(v6 + 112) = a6;
  *(void *)(v6 + 88) = a3;
  *(void *)(v6 + 96) = a4;
  *(void *)(v6 + 80) = a1;
  sub_1B28537B0();
  *(void *)(v6 + 120) = swift_task_alloc();
  uint64_t v9 = sub_1B28537C0();
  *(void *)(v6 + 128) = v9;
  *(void *)(v6 + 136) = *(void *)(v9 - 8);
  *(void *)(v6 + 144) = swift_task_alloc();
  uint64_t v10 = sub_1B2853900();
  *(void *)(v6 + 152) = v10;
  *(void *)(v6 + 160) = *(void *)(v10 - 8);
  *(void *)(v6 + 168) = swift_task_alloc();
  *(void *)(v6 + 176) = swift_task_alloc();
  *(void *)(v6 + 184) = *(void *)(a5 - 8);
  uint64_t v11 = swift_task_alloc();
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v6 + 200) = *(_OWORD *)a2;
  *(void *)(v6 + 192) = v11;
  *(_OWORD *)(v6 + 216) = v12;
  *(void *)(v6 + 232) = *(void *)(a2 + 32);
  *(unsigned char *)(v6 + 73) = *(unsigned char *)(a2 + 40);
  *(_DWORD *)(v6 + 76) = *(_DWORD *)(a2 + 44);
  *(void *)(v6 + 280) = *(void *)(a2 + 48);
  *(unsigned char *)(v6 + 74) = *(unsigned char *)(a2 + 56);
  uint64_t v13 = *(void **)(a2 + 64);
  *(void *)(v6 + 240) = v13;
  id v14 = v13;
  return MEMORY[0x1F4188298](sub_1B28488C8, 0, 0);
}

uint64_t sub_1B28488C8()
{
  id v1 = objc_msgSend(*(id *)(v0 + 240), sel_fileData);
  id v2 = *(void **)(v0 + 240);
  if (v1)
  {
    uint64_t v3 = v1;
    uint64_t v4 = sub_1B2853890();
    uint64_t v6 = v5;

    id v7 = objc_msgSend(v2, sel_contentType);
    uint64_t v8 = *(void *)(v0 + 176);
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v11 = *(void *)(v0 + 160);
      uint64_t v10 = *(void *)(v0 + 168);
      uint64_t v12 = *(void *)(v0 + 152);
      sub_1B28538D0();

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v8, v10, v12);
    }
    else
    {
      sub_1B28538E0();
    }

    size_t v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 248) = v18;
    *size_t v18 = v0;
    v18[1] = sub_1B2848B3C;
    uint64_t v19 = *(void *)(v0 + 192);
    uint64_t v20 = *(void *)(v0 + 176);
    return MEMORY[0x1F40DFA20](v19, v4, v6, v20);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 136);
    uint64_t v13 = *(void *)(v0 + 144);
    uint64_t v15 = *(void *)(v0 + 128);
    sub_1B28537A0();
    sub_1B284B130(MEMORY[0x1E4FBC860]);
    sub_1B284EC6C(&qword_1E9C2FAF8, MEMORY[0x1E4F26C20]);
    sub_1B2853830();
    sub_1B2853790();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
}

uint64_t sub_1B2848B3C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 256) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B2848F04, 0, 0);
  }
  else
  {
    *(_OWORD *)(v2 + 16) = *(_OWORD *)(v2 + 200);
    char v3 = *(unsigned char *)(v2 + 74);
    int v4 = *(_DWORD *)(v2 + 76);
    char v5 = *(unsigned char *)(v2 + 73);
    uint64_t v6 = *(void *)(v2 + 232);
    id v7 = *(int **)(v2 + 88);
    *(_OWORD *)(v2 + 32) = *(_OWORD *)(v2 + 216);
    *(void *)(v2 + 48) = v6;
    *(unsigned char *)(v2 + 56) = v5;
    *(_DWORD *)(v2 + 60) = v4;
    *(void *)(v2 + 64) = *(void *)(v2 + 280);
    *(unsigned char *)(v2 + 72) = v3;
    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v7 + *v7);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v2 + 264) = v8;
    *uint64_t v8 = v2;
    v8[1] = sub_1B2848D34;
    uint64_t v9 = *(void *)(v2 + 192);
    uint64_t v10 = *(void *)(v2 + 80);
    return v12(v10, v9, v2 + 16);
  }
}

uint64_t sub_1B2848D34()
{
  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B2848FA4;
  }
  else {
    uint64_t v2 = sub_1B2848E48;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B2848E48()
{
  (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[13]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_1B2848F04()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B2848FA4()
{
  (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[13]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t ThumbnailProvider.init(contentType:generator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2F5D8);
  uint64_t v8 = sub_1B2853900();
  uint64_t v9 = *(void *)(v8 - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1B2857900;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 16))(v11 + v10, a1, v8);
  uint64_t v12 = sub_1B284D920(v11);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = a3;
  *a4 = v12;
  a4[1] = (uint64_t)&unk_1E9C2FB28;
  a4[2] = result;
  return result;
}

uint64_t sub_1B28491D4(uint64_t a1, uint64_t a2, int *a3)
{
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 32);
  char v7 = *(unsigned char *)(a2 + 40);
  int v8 = *(_DWORD *)(a2 + 52);
  char v9 = *(unsigned char *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 64);
  *(_OWORD *)(v3 + 32) = v5;
  *(void *)(v3 + 48) = v6;
  *(unsigned char *)(v3 + 56) = v7;
  *(void *)(v3 + 60) = *(void *)(a2 + 44);
  *(_DWORD *)(v3 + 68) = v8;
  *(unsigned char *)(v3 + 72) = v9;
  *(void *)(v3 + 80) = v10;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 88) = v11;
  *uint64_t v11 = v3;
  v11[1] = sub_1B28492F8;
  return v13(a1, v3 + 16);
}

uint64_t sub_1B28492F8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_1B284942C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1B284942C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B2849444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 176) = a1;
  *(void *)(v3 + 184) = a3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 64) = v4;
  *(void *)(v3 + 80) = *(void *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 32) = v5;
  return MEMORY[0x1F4188298](sub_1B284947C, 0, 0);
}

uint64_t sub_1B284947C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 184) + 16);
  if (v1)
  {
    uint64_t v2 = (void *)(swift_bridgeObjectRetain() + 48);
    while (1)
    {
      uint64_t v3 = *(v2 - 2);
      *(void *)(v0 + 192) = v3;
      *(void *)(v0 + 200) = *v2;
      long long v4 = (int *)*(v2 - 1);
      sub_1B284F3CC(v0 + 16);
      swift_bridgeObjectRetain_n();
      swift_retain();
      char v5 = sub_1B284EF04(v3, v0 + 16);
      sub_1B284F3F8(v0 + 16);
      swift_bridgeObjectRelease();
      if (v5) {
        break;
      }
      swift_bridgeObjectRelease();
      swift_release();
      v2 += 3;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    long long v8 = *(_OWORD *)(v0 + 16);
    *(_OWORD *)(v0 + 104) = *(_OWORD *)(v0 + 32);
    long long v9 = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v0 + 120) = *(_OWORD *)(v0 + 48);
    *(_OWORD *)(v0 + 136) = v9;
    *(void *)(v0 + 152) = *(void *)(v0 + 80);
    *(_OWORD *)(v0 + 88) = v8;
    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v10;
    void *v10 = v0;
    v10[1] = sub_1B28496F4;
    uint64_t v11 = *(void *)(v0 + 176);
    return v12(v11, v0 + 88);
  }
  else
  {
LABEL_6:
    type metadata accessor for QLThumbnailError(0);
    *(void *)(v0 + 168) = 0;
    sub_1B284B130(MEMORY[0x1E4FBC860]);
    sub_1B284EC6C(&qword_1E9C2FBA0, type metadata accessor for QLThumbnailError);
    sub_1B2853830();
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_1B28496F4()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1B2849874;
  }
  else {
    uint64_t v2 = sub_1B2849808;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B2849808()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1B2849874()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_1B28498E0(uint64_t a1)
{
  id result = *(id *)((char *)v1 + *(void *)((*MEMORY[0x1E4FBC8C8] & *v1) + 0x60));
  if (result) {
    return objc_msgSend(result, sel_shouldAcceptXPCConnection_, a1);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B2849934(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2F5C8);
  MEMORY[0x1F4188790](v7 - 8);
  long long v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1B2853A30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_1B2853A10();
  id v11 = a1;
  id v12 = v3;
  swift_retain();
  uint64_t v13 = sub_1B2853A00();
  uint64_t v14 = (void *)swift_allocObject();
  uint64_t v15 = MEMORY[0x1E4FBCFD8];
  v14[2] = v13;
  v14[3] = v15;
  v14[4] = v11;
  v14[5] = v12;
  v14[6] = a2;
  v14[7] = a3;
  sub_1B284A43C((uint64_t)v9, (uint64_t)&unk_1E9C2FB68, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_1B2849A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  v7[23] = a6;
  v7[24] = a7;
  v7[21] = a4;
  v7[22] = a5;
  v7[25] = *MEMORY[0x1E4FBC8C8] & *a5;
  sub_1B2853A10();
  v7[26] = sub_1B2853A00();
  uint64_t v9 = sub_1B28539F0();
  v7[27] = v9;
  v7[28] = v8;
  return MEMORY[0x1F4188298](sub_1B2849B50, v9, v8);
}

uint64_t sub_1B2849B50()
{
  uint64_t v33 = v0;
  uint64_t v1 = *(void *)(v0 + 200);
  id v2 = *(id *)(v0 + 168);
  id v3 = objc_msgSend(v2, sel_item);
  *(void *)(v0 + 232) = v3;
  objc_msgSend(v2, sel_maximumSize);
  double v5 = v4;
  double v7 = v6;
  objc_msgSend(v2, sel_minimumSize);
  double v9 = v8;
  double v11 = v10;
  objc_msgSend(v2, sel_scale);
  double v13 = v12;
  id v14 = objc_msgSend(v2, sel_options);
  type metadata accessor for QLFileThumbnailRequestOptions(0);
  sub_1B284EC6C(&qword_1E9C2F5D0, type metadata accessor for QLFileThumbnailRequestOptions);
  uint64_t v15 = sub_1B2853950();

  sub_1B28467B8(v15, (uint64_t)v27, v5, v7, v9, v11, v13);
  long long v24 = v27[1];
  long long v25 = v27[0];
  uint64_t v16 = v28;
  LOBYTE(v14) = v29;
  LODWORD(v15) = v31;
  char v17 = v32;
  uint64_t v18 = v30;
  (*(void (**)(void))(*(void *)(v1 + 88) + 16))(*(void *)(v1 + 80));
  uint64_t v19 = *(void *)(v0 + 128);
  uint64_t v20 = *(int **)(v0 + 136);
  uint64_t v21 = *(void *)(v0 + 144);
  *(_OWORD *)(v0 + 16) = v25;
  *(void *)(v0 + 240) = v19;
  *(void *)(v0 + 248) = v21;
  *(_OWORD *)(v0 + 32) = v24;
  *(void *)(v0 + 48) = v16;
  *(unsigned char *)(v0 + 56) = (_BYTE)v14;
  *(void *)(v0 + 60) = v18;
  *(_DWORD *)(v0 + 68) = v15;
  *(unsigned char *)(v0 + 72) = v17;
  *(void *)(v0 + 80) = v3;
  uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t))((char *)v20 + *v20);
  BOOL v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v22;
  *BOOL v22 = v0;
  v22[1] = sub_1B2849E14;
  return v26(v0 + 88, v0 + 16);
}

uint64_t sub_1B2849E14()
{
  *(void *)(*(void *)v1 + 264) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_1B284A134;
  }
  else {
    id v2 = sub_1B2849F28;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1B2849F28()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 224);
  return MEMORY[0x1F4188298](sub_1B2849F94, v1, v2);
}

uint64_t sub_1B2849F94()
{
  swift_release();
  uint64_t v2 = *(void **)(v0 + 88);
  uint64_t v1 = *(void **)(v0 + 96);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 104);
  int v4 = *(_DWORD *)(v0 + 108);
  uint64_t v5 = *(unsigned int *)(v0 + 116);
  if (v4 != 0x7FFFFFFF)
  {
    objc_msgSend(v2, sel_setIconFlavor_, v4 | ((*(_DWORD *)(v0 + 112) & 7u) << 8));
    if (!v1) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v6 = v2;
  if (v1) {
LABEL_5:
  }
    objc_msgSend(v2, sel_setColorSpace_, v1);
LABEL_6:
  double v7 = *(void **)(v0 + 232);
  double v8 = *(void (**)(void *, void))(v0 + 184);
  objc_msgSend(v2, sel_setIsLowQuality_, v3);
  objc_msgSend(v2, sel_setInlinePreviewMode_, v5);
  id v9 = objc_msgSend(v2, sel_metadata);
  double v10 = (void *)sub_1B2853940();
  objc_msgSend(v9, sel_setAdditionalProperties_, v10);

  id v11 = v2;
  v8(v2, 0);

  swift_bridgeObjectRelease();
  double v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_1B284A134()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 224);
  return MEMORY[0x1F4188298](sub_1B284A1A0, v1, v2);
}

uint64_t sub_1B284A1A0()
{
  uint64_t v1 = (void *)v0[29];
  swift_release();

  if (qword_1E9C2FE50 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)v0[21];
  uint64_t v3 = (void *)v0[33];
  uint64_t v4 = sub_1B2853930();
  __swift_project_value_buffer(v4, (uint64_t)qword_1E9C30468);
  id v5 = v2;
  id v6 = v3;
  id v7 = v5;
  id v8 = v3;
  id v9 = sub_1B2853910();
  os_log_type_t v10 = sub_1B2853A60();
  BOOL v11 = os_log_type_enabled(v9, v10);
  double v12 = (void *)v0[33];
  double v13 = (void *)v0[21];
  if (v11)
  {
    uint64_t v14 = swift_slowAlloc();
    unint64_t v23 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 138412546;
    v0[19] = v13;
    long long v24 = v9;
    id v15 = v13;
    sub_1B2853A80();
    void *v23 = v13;

    *(_WORD *)(v14 + 12) = 2112;
    id v16 = v12;
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    v0[20] = v17;
    sub_1B2853A80();
    v23[1] = v17;
    id v9 = v24;

    _os_log_impl(&dword_1B281E000, v24, v10, "Generation error for request %@ : %@", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2FB80);
    swift_arrayDestroy();
    MEMORY[0x1B3EAC460](v23, -1, -1);
    MEMORY[0x1B3EAC460](v14, -1, -1);
  }
  else
  {
  }
  uint64_t v18 = (void *)v0[33];
  uint64_t v19 = (void (*)(void, void *))v0[23];

  id v20 = v18;
  v19(0, v18);

  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_1B284A43C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B2853A30();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B2853A20();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1B284F440(a1, &qword_1E9C2F5C8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B28539F0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B284A5E8(void *a1, int a2, void *a3, void *aBlock)
{
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = a1;
  sub_1B2849934(v8, (uint64_t)sub_1B284F300, v7);

  return swift_release();
}

void sub_1B284A688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1B2853840();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_1B284A6F8()
{
}

id sub_1B284A708()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ThumbnailExtensionConfiguration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1B284A77C(void *a1)
{
  objc_super v2 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v3 = *MEMORY[0x1E4FBC8C8] & *a1;

  uint64_t v4 = (char *)a1 + *(void *)((*v2 & *a1) + 0x68);
  uint64_t v5 = *(uint64_t (**)(char *))(*(void *)(*(void *)(v3 + 80) - 8) + 8);

  return v5(v4);
}

unint64_t sub_1B284A83C(uint64_t a1)
{
  return (unint64_t)sub_1B28498E0(a1) & 1;
}

uint64_t sub_1B284A864(uint64_t a1, uint64_t a2)
{
  return sub_1B284A9D0(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1B284A87C(uint64_t a1, id *a2)
{
  uint64_t result = sub_1B28539A0();
  *a2 = 0;
  return result;
}

uint64_t sub_1B284A8F4(uint64_t a1, id *a2)
{
  char v3 = sub_1B28539B0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1B284A974@<X0>(uint64_t *a1@<X8>)
{
  sub_1B28539C0();
  uint64_t v2 = sub_1B2853990();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B284A9B8(uint64_t a1, uint64_t a2)
{
  return sub_1B284A9D0(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1B284A9D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1B28539C0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1B284AA14()
{
  sub_1B28539C0();
  sub_1B28539D0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1B284AA68()
{
  sub_1B28539C0();
  sub_1B2853B70();
  sub_1B28539D0();
  uint64_t v0 = sub_1B2853B80();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B284AADC(uint64_t a1)
{
  uint64_t v2 = sub_1B284EC6C(&qword_1E9C2FBD8, type metadata accessor for QLThumbnailError);

  return MEMORY[0x1F40E6E20](a1, v2);
}

uint64_t sub_1B284AB48(uint64_t a1)
{
  uint64_t v2 = sub_1B284EC6C(&qword_1E9C2FBD8, type metadata accessor for QLThumbnailError);

  return MEMORY[0x1F40E6E10](a1, v2);
}

uint64_t sub_1B284ABB8(uint64_t a1)
{
  uint64_t v2 = sub_1B284EC6C(&qword_1E9C2FBA0, type metadata accessor for QLThumbnailError);

  return MEMORY[0x1F40E4480](a1, v2);
}

id sub_1B284AC24()
{
  return *v0;
}

uint64_t sub_1B284AC2C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1B284AC34()
{
  uint64_t v0 = sub_1B28539C0();
  uint64_t v2 = v1;
  if (v0 == sub_1B28539C0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1B2853B20();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1B284ACC0()
{
  return sub_1B28539C0();
}

uint64_t sub_1B284ACD0(uint64_t a1)
{
  uint64_t v2 = sub_1B284EC6C(&qword_1E9C2FBA0, type metadata accessor for QLThumbnailError);

  return MEMORY[0x1F40E44F0](a1, v2);
}

uint64_t sub_1B284AD3C(uint64_t a1)
{
  uint64_t v2 = sub_1B284EC6C(&qword_1E9C2FBA0, type metadata accessor for QLThumbnailError);

  return MEMORY[0x1F40E44A8](a1, v2);
}

uint64_t sub_1B284ADA8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1B284EC6C(&qword_1E9C2FBA0, type metadata accessor for QLThumbnailError);
  id v5 = a1;

  return MEMORY[0x1F40E4498](v5, a2, v4);
}

uint64_t sub_1B284AE38()
{
  id v1 = *v0;
  uint64_t v2 = sub_1B2853A70();

  return v2;
}

uint64_t sub_1B284AE70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B284EC6C(&qword_1E9C2FBA0, type metadata accessor for QLThumbnailError);

  return MEMORY[0x1F40E44D8](a1, a2, v4);
}

uint64_t sub_1B284AEEC()
{
  return sub_1B2853B80();
}

void *sub_1B284AF4C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1B284AF5C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1B284AF68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1B2853990();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B284AFB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B28539C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1B284AFDC(uint64_t a1)
{
  uint64_t v2 = sub_1B284EC6C(&qword_1E9C2F5D0, type metadata accessor for QLFileThumbnailRequestOptions);
  uint64_t v3 = sub_1B284EC6C(&qword_1E9C2FC10, type metadata accessor for QLFileThumbnailRequestOptions);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1B284B098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1B284EC6C(&qword_1E9C2FBA0, type metadata accessor for QLThumbnailError);

  return MEMORY[0x1F40E44B8](a1, a2, a3, v6);
}

BOOL sub_1B284B11C(void *a1, void *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1B284B130(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2FB90);
  uint64_t v2 = sub_1B2853AE0();
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
    sub_1B284F368(v6, (uint64_t)&v15, &qword_1E9C2FB98);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1B284D168(v15, v16, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1B284B27C);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1B284F354(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1B284B27C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1B2853B20() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1B2853B20() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_1B2853B20()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_1B284B3C4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1B284B4A0;
  return v6(a1);
}

uint64_t sub_1B284B4A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1B284B598(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    BOOL v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2F5D8);
  uint64_t v10 = *(void *)(sub_1B2853900() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  BOOL v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1B2853AC0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1B2853900() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1B284EDAC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1B284B800(uint64_t a1)
{
  uint64_t v4 = sub_1B2853900();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v86 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2F5C0);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v87 = (uint64_t)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  MEMORY[0x1F4188790](v10);
  uint64_t v16 = (char *)&v70 - v15;
  uint64_t v17 = *(void *)(a1 + 16);
  int64_t v18 = *v1;
  int64_t v19 = *(void *)(*v1 + 16);
  int64_t v20 = v19 + v17;
  if (__OFADD__(v19, v17))
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v85 = v11;
  uint64_t v2 = v5;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t *v1 = v18;
  if (!isUniquelyReferenced_nonNull_native || (int64_t v22 = *(void *)(v18 + 24) >> 1, v22 < v20))
  {
    if (v19 <= v20) {
      int64_t v23 = v19 + v17;
    }
    else {
      int64_t v23 = v19;
    }
    int64_t v18 = sub_1B284B598(isUniquelyReferenced_nonNull_native, v23, 1, v18);
    unint64_t *v1 = v18;
    int64_t v22 = *(void *)(v18 + 24) >> 1;
  }
  uint64_t v24 = *(void *)(v18 + 16);
  int64_t v19 = *(void *)(v5 + 72);
  int64_t v25 = v22 - v24;
  unint64_t v84 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v26 = sub_1B284D5D8(&v88, v18 + v84 + v19 * v24, v22 - v24, a1);
  if (v26 < v17) {
    goto LABEL_17;
  }
  if (v26)
  {
    uint64_t v29 = *(void *)(v18 + 16);
    BOOL v30 = __OFADD__(v29, v26);
    uint64_t v31 = v29 + v26;
    if (v30)
    {
      __break(1u);
      goto LABEL_22;
    }
    *(void *)(v18 + 16) = v31;
  }
  if (v26 == v25)
  {
LABEL_18:
    int64_t v18 = *(void *)(v18 + 16);
    uint64_t v17 = v88;
    uint64_t v28 = v89;
    int64_t v27 = v90;
    int64_t v25 = v91;
    int64_t v79 = v90;
    int64_t v83 = v89;
    if (v92)
    {
      unint64_t v33 = (v92 - 1) & v92;
      unint64_t v34 = __clz(__rbit64(v92)) | (v91 << 6);
LABEL_20:
      (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v16, *(void *)(v17 + 48) + v34 * v19, v4);
      v74 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
      v74(v16, 0, 1, v4);
      unint64_t v35 = v33;
LABEL_43:
      unint64_t v81 = v35;
      int64_t v82 = v25;
      unint64_t v88 = v17;
      int64_t v89 = v83;
      int64_t v90 = v79;
      int64_t v91 = v25;
      unint64_t v92 = v35;
      uint64_t v41 = v85;
      sub_1B284F368((uint64_t)v16, v85, &qword_1E9C2F5C0);
      v80 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
      int v42 = v80(v41, 1, v4);
      uint64_t v43 = v87;
      if (v42 == 1)
      {
LABEL_81:
        sub_1B284F440((uint64_t)v16, &qword_1E9C2F5C0);
        sub_1B284F438();
        return sub_1B284F440(v85, &qword_1E9C2F5C0);
      }
      v78 = (void (**)(void, void, void))(v5 + 32);
      v72 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v73 = v5 + 56;
      v71 = (void (**)(char *, uint64_t))(v5 + 8);
      uint64_t v44 = v85;
      v45 = v86;
      v75 = v16;
      while (1)
      {
        sub_1B284F440(v44, &qword_1E9C2F5C0);
        uint64_t v47 = *v1;
        unint64_t v48 = *(void *)(*v1 + 24);
        int64_t v49 = v48 >> 1;
        if ((uint64_t)(v48 >> 1) < v18 + 1)
        {
          uint64_t v47 = sub_1B284B598(v48 > 1, v18 + 1, 1, *v1);
          unint64_t *v1 = v47;
          int64_t v49 = *(void *)(v47 + 24) >> 1;
        }
        sub_1B284F368((uint64_t)v16, v43, &qword_1E9C2F5C0);
        if (v80(v43, 1, v4) != 1) {
          break;
        }
LABEL_50:
        sub_1B284F440(v43, &qword_1E9C2F5C0);
        int64_t v46 = v18;
LABEL_46:
        *(void *)(*v1 + 16) = v46;
        uint64_t v44 = v85;
        sub_1B284F368((uint64_t)v16, v85, &qword_1E9C2F5C0);
        if (v80(v44, 1, v4) == 1)
        {
          int64_t v82 = v91;
          int64_t v83 = v89;
          unint64_t v81 = v92;
          goto LABEL_81;
        }
      }
      unint64_t v77 = v47 + v84;
      v50 = *v78;
      if (v18 <= v49) {
        int64_t v51 = v49;
      }
      else {
        int64_t v51 = v18;
      }
      int64_t v79 = v51;
      v76 = v50;
      while (1)
      {
        v55 = v45;
        uint64_t v56 = v43;
        uint64_t v57 = v43;
        v58 = v45;
        v59 = (uint64_t (*)(unint64_t, char *, uint64_t))v50;
        v50(v55, v56, v4);
        if (v18 == v79)
        {
          (*v71)(v58, v4);
          int64_t v46 = v79;
          int64_t v18 = v79;
          v45 = v58;
          uint64_t v43 = v57;
          uint64_t v16 = v75;
          goto LABEL_46;
        }
        uint64_t v16 = v75;
        sub_1B284F440((uint64_t)v75, &qword_1E9C2F5C0);
        int64_t v60 = v18;
        uint64_t result = v59(v77 + v18 * v19, v58, v4);
        uint64_t v61 = v89;
        int64_t v62 = v91;
        int64_t v83 = v60;
        unint64_t v81 = v88;
        int64_t v82 = v90;
        if (v92) {
          break;
        }
        int64_t v65 = v91 + 1;
        if (__OFADD__(v91, 1))
        {
          __break(1u);
          return result;
        }
        int64_t v66 = (unint64_t)(v90 + 64) >> 6;
        int64_t v64 = v91;
        if (v65 < v66)
        {
          unint64_t v67 = *(void *)(v89 + 8 * v65);
          if (v67) {
            goto LABEL_65;
          }
          int64_t v68 = v91 + 2;
          int64_t v64 = v91 + 1;
          if (v91 + 2 < v66)
          {
            unint64_t v67 = *(void *)(v89 + 8 * v68);
            if (v67) {
              goto LABEL_68;
            }
            int64_t v64 = v91 + 2;
            if (v91 + 3 < v66)
            {
              unint64_t v67 = *(void *)(v89 + 8 * (v91 + 3));
              if (v67)
              {
                int64_t v65 = v91 + 3;
                goto LABEL_65;
              }
              int64_t v68 = v91 + 4;
              int64_t v64 = v91 + 3;
              if (v91 + 4 < v66)
              {
                unint64_t v67 = *(void *)(v89 + 8 * v68);
                if (v67)
                {
LABEL_68:
                  int64_t v65 = v68;
                  goto LABEL_65;
                }
                int64_t v65 = v91 + 5;
                int64_t v64 = v91 + 4;
                if (v91 + 5 < v66)
                {
                  unint64_t v67 = *(void *)(v89 + 8 * v65);
                  if (!v67)
                  {
                    int64_t v64 = v66 - 1;
                    int64_t v69 = v91 + 6;
                    do
                    {
                      if (v66 == v69)
                      {
                        uint64_t v16 = v75;
                        goto LABEL_56;
                      }
                      unint64_t v67 = *(void *)(v89 + 8 * v69++);
                    }
                    while (!v67);
                    int64_t v65 = v69 - 1;
                    uint64_t v16 = v75;
                  }
LABEL_65:
                  unint64_t v52 = (v67 - 1) & v67;
                  unint64_t v63 = __clz(__rbit64(v67)) + (v65 << 6);
                  int64_t v62 = v65;
LABEL_61:
                  unint64_t v53 = v81;
                  (*v72)(v16, *(void *)(v81 + 48) + v63 * v19, v4);
                  v74(v16, 0, 1, v4);
                  int64_t v64 = v62;
                  goto LABEL_57;
                }
              }
            }
          }
        }
LABEL_56:
        v74(v16, 1, 1, v4);
        unint64_t v52 = 0;
        unint64_t v53 = v81;
LABEL_57:
        unint64_t v88 = v53;
        int64_t v89 = v61;
        int64_t v18 = v83 + 1;
        int64_t v90 = v82;
        int64_t v91 = v64;
        unint64_t v92 = v52;
        uint64_t v43 = v87;
        sub_1B284F368((uint64_t)v16, v87, &qword_1E9C2F5C0);
        int v54 = v80(v43, 1, v4);
        v45 = v86;
        v50 = v76;
        if (v54 == 1) {
          goto LABEL_50;
        }
      }
      unint64_t v52 = (v92 - 1) & v92;
      unint64_t v63 = __clz(__rbit64(v92)) | (v91 << 6);
      goto LABEL_61;
    }
LABEL_22:
    int64_t v36 = v25 + 1;
    if (__OFADD__(v25, 1))
    {
      __break(1u);
LABEL_41:
      uint64_t v17 = v11;
      int64_t v18 = v12;
      uint64_t v4 = v13;
      uint64_t v16 = v14;
    }
    else
    {
      int64_t v37 = (unint64_t)(v27 + 64) >> 6;
      int64_t v82 = v25;
      if (v36 < v37)
      {
        unint64_t v38 = *(void *)(v28 + 8 * v36);
        if (v38)
        {
LABEL_25:
          unint64_t v33 = (v38 - 1) & v38;
          unint64_t v34 = __clz(__rbit64(v38)) + (v36 << 6);
          int64_t v25 = v36;
          goto LABEL_20;
        }
        int64_t v39 = v25 + 2;
        int64_t v82 = v25 + 1;
        if (v25 + 2 < v37)
        {
          size_t v14 = v16;
          uint64_t v13 = v4;
          int64_t v12 = v18;
          uint64_t v11 = v17;
          unint64_t v38 = *(void *)(v28 + 8 * v39);
          if (v38)
          {
LABEL_28:
            int64_t v36 = v39;
            goto LABEL_25;
          }
          int64_t v82 = v25 + 2;
          if (v25 + 3 < v37)
          {
            unint64_t v38 = *(void *)(v83 + 8 * (v25 + 3));
            if (v38)
            {
              int64_t v36 = v25 + 3;
              goto LABEL_25;
            }
            int64_t v39 = v25 + 4;
            int64_t v82 = v25 + 3;
            if (v25 + 4 < v37)
            {
              unint64_t v38 = *(void *)(v83 + 8 * v39);
              if (v38) {
                goto LABEL_28;
              }
              int64_t v36 = v25 + 5;
              int64_t v82 = v25 + 4;
              if (v25 + 5 < v37)
              {
                unint64_t v38 = *(void *)(v83 + 8 * v36);
                if (!v38)
                {
                  int64_t v82 = v37 - 1;
                  int64_t v40 = v25 + 6;
                  do
                  {
                    if (v37 == v40) {
                      goto LABEL_41;
                    }
                    unint64_t v38 = *(void *)(v83 + 8 * v40++);
                  }
                  while (!v38);
                  int64_t v36 = v40 - 1;
                }
                goto LABEL_25;
              }
            }
          }
        }
      }
    }
    v74 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    v74(v16, 1, 1, v4);
    unint64_t v35 = 0;
    int64_t v25 = v82;
    goto LABEL_43;
  }

  return sub_1B284F438();
}

uint64_t sub_1B284C0C0(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1B2853900();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_1B284EC6C(&qword_1E9C2F5B0, MEMORY[0x1E4FBCEA8]);
  swift_bridgeObjectRetain();
  unint64_t v33 = a2;
  uint64_t v11 = sub_1B2853960();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    size_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      int64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_1B284EC6C(&qword_1E9C2F5B8, MEMORY[0x1E4FBCEA8]);
      char v21 = sub_1B2853980();
      int64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      size_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    size_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1B284C7E0((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_1B284C3E4()
{
  id v1 = v0;
  uint64_t v42 = sub_1B2853900();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2FBA8);
  uint64_t v5 = sub_1B2853AA0();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    int64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    unint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    size_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                id v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_1B284EC6C(&qword_1E9C2F5B0, MEMORY[0x1E4FBCEA8]);
      uint64_t result = sub_1B2853960();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_1B284C7E0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_1B2853900();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_1B284C3E4();
  }
  else
  {
    if (v11 > v10)
    {
      sub_1B284CA80();
      goto LABEL_12;
    }
    sub_1B284CD24();
  }
  uint64_t v12 = *v3;
  sub_1B284EC6C(&qword_1E9C2F5B0, MEMORY[0x1E4FBCEA8]);
  uint64_t v13 = sub_1B2853960();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_1B284EC6C(&qword_1E9C2F5B8, MEMORY[0x1E4FBCEA8]);
      char v21 = sub_1B2853980();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_1B2853B30();
  __break(1u);
  return result;
}

void *sub_1B284CA80()
{
  id v1 = v0;
  uint64_t v2 = sub_1B2853900();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2FBA8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_1B2853A90();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    id v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1B284CD24()
{
  id v1 = v0;
  uint64_t v2 = sub_1B2853900();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2FBA8);
  uint64_t v7 = sub_1B2853AA0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_1B284EC6C(&qword_1E9C2F5B0, MEMORY[0x1E4FBCEA8]);
    uint64_t result = sub_1B2853960();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    id v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1B284D0D4(uint64_t a1)
{
  sub_1B28539C0();
  sub_1B2853B70();
  sub_1B28539D0();
  uint64_t v2 = sub_1B2853B80();
  swift_bridgeObjectRelease();

  return sub_1B284D1EC(a1, v2);
}

uint64_t sub_1B284D168(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  sub_1B2853B70();
  sub_1B28539D0();
  uint64_t v5 = sub_1B2853B80();

  return a3(a1, a2, v5);
}

unint64_t sub_1B284D1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_1B28539C0();
    uint64_t v8 = v7;
    if (v6 == sub_1B28539C0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1B2853B20();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_1B28539C0();
          uint64_t v15 = v14;
          if (v13 == sub_1B28539C0() && v15 == v16) {
            break;
          }
          char v18 = sub_1B2853B20();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_1B284D364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1B2853B20() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1B2853B20() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1B284D448(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B284D468(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1B284D468(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9C2FB88);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1B2853AF0();
  __break(1u);
  return result;
}

uint64_t sub_1B284D5D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1B2853900();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v42 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v10);
  uint64_t v41 = (char *)&v32 - v13;
  uint64_t v43 = a4;
  uint64_t v16 = *(void *)(a4 + 56);
  uint64_t v15 = a4 + 56;
  uint64_t v14 = v16;
  uint64_t v37 = v15;
  uint64_t v17 = -1 << *(unsigned char *)(v15 - 24);
  if (-v17 < 64) {
    uint64_t v18 = ~(-1 << -(char)v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v14;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_38:
    uint64_t v31 = v37;
    *a1 = v43;
    a1[1] = v31;
    a1[2] = ~v17;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v34 = -1 << *(unsigned char *)(v15 - 24);
  uint64_t v35 = a1;
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v38 = v9 + 32;
  uint64_t v39 = v9 + 16;
  int64_t v36 = (unint64_t)(63 - v17) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v40 = a3;
  int64_t v22 = v41;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v23 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v24 = v23 | (v20 << 6);
  while (1)
  {
    ++v21;
    unint64_t v28 = v42;
    uint64_t v29 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v42, *(void *)(v43 + 48) + v29 * v24, v8);
    unint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v22, v28, v8);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v22, v8);
    a3 = v40;
    if (v21 == v40) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v25 >= v36) {
      goto LABEL_32;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    if (!v26) {
      break;
    }
LABEL_18:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v20 = v25;
  }
  v20 += 2;
  if (v25 + 1 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_14;
  }
  int64_t v27 = v25 + 2;
  if (v25 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26) {
    goto LABEL_17;
  }
  int64_t v20 = v25 + 3;
  if (v25 + 3 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25 + 2;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26)
  {
LABEL_14:
    int64_t v25 = v20;
    goto LABEL_18;
  }
  int64_t v27 = v25 + 4;
  if (v25 + 4 >= v36)
  {
LABEL_32:
    unint64_t v19 = 0;
LABEL_36:
    a3 = v21;
LABEL_37:
    uint64_t v17 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26)
  {
LABEL_17:
    int64_t v25 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v25 >= v36)
    {
      unint64_t v19 = 0;
      int64_t v20 = v33;
      goto LABEL_36;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    ++v27;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1B284D920(uint64_t a1)
{
  uint64_t v2 = sub_1B2853900();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  unint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_1B284EC6C(&qword_1E9C2F5B0, MEMORY[0x1E4FBCEA8]);
  uint64_t result = sub_1B2853A40();
  uint64_t v17 = result;
  if (v9)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v14, v2);
      sub_1B284C0C0((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

uint64_t sub_1B284DABC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1B284DAF4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *(void *)uint64_t v7 = v3;
  *(void *)(v7 + 8) = sub_1B284F8E0;
  *(void *)(v7 + 176) = a1;
  *(void *)(v7 + 184) = v6;
  *(void *)(v7 + 80) = *(void *)(a2 + 64);
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v7 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v7 + 64) = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v7 + 32) = v9;
  return MEMORY[0x1F4188298](sub_1B284947C, 0, 0);
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

uint64_t sub_1B284DC0C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
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

uint64_t sub_1B284DC80()
{
  (*(void (**)(void))(v0 + 16))();
  return 1;
}

uint64_t sub_1B284DCD0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

unint64_t sub_1B284DD28()
{
  unint64_t result = qword_1E9C2FB08;
  if (!qword_1E9C2FB08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1E9C2FB08);
  }
  return result;
}

uint64_t sub_1B284DD68()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B284DDA0(CGContext *a1)
{
  CGContextScaleCTM(a1, *(CGFloat *)(v1 + 16), *(CGFloat *)(v1 + 16));
  return sub_1B2853A50();
}

uint64_t sub_1B284DE0C()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B284DE44()
{
  (*(void (**)(void))(v0 + 16))();
  return 1;
}

uint64_t sub_1B284DE94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(id (*)(), void *))(v2 + 16);
  v5[2] = a1;
  v5[3] = a2;
  return v3(sub_1B284F318, v5);
}

uint64_t sub_1B284DEE0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1B284DF18(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  void *v10 = v3;
  v10[1] = sub_1B284F8E0;
  return sub_1B28486C4(a1, a2, v9, v8, v6, v7);
}

uint64_t sub_1B284DFE0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1B284E094;
  return sub_1B28491D4(a1, a2, v6);
}

uint64_t sub_1B284E094()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of ThumbnailExtension.provider.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for ThumbnailProviderBuilder()
{
  return &type metadata for ThumbnailProviderBuilder;
}

void destroy for ThumbnailRequest(uint64_t a1)
{
}

uint64_t initializeWithCopy for ThumbnailRequest(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  uint64_t v4 = *(void **)(a2 + 64);
  *(void *)(a1 + 64) = v4;
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for ThumbnailRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  long long v3 = *(void **)(a2 + 64);
  uint64_t v4 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = v3;
  id v5 = v3;

  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ThumbnailRequest(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 44) = *(void *)(a2 + 44);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  long long v4 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);

  return a1;
}

uint64_t getEnumTagSinglePayload for ThumbnailRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 64) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailRequest()
{
  return &type metadata for ThumbnailRequest;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ThumbnailRequest.Options(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailRequest.Options(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailRequest.Options()
{
  return &type metadata for ThumbnailRequest.Options;
}

uint64_t initializeBufferWithCopyOfBuffer for ThumbnailReply(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ThumbnailReply(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ThumbnailReply(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  BOOL v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 20) = *(void *)(a2 + 20);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  id v5 = v3;
  id v6 = v4;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ThumbnailReply(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ThumbnailReply(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 20) = *(void *)(a2 + 20);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ThumbnailReply(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailReply(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailReply()
{
  return &type metadata for ThumbnailReply;
}

uint64_t destroy for ThumbnailProvider()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t _s21QuickLookThumbnailing17ThumbnailProviderVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ThumbnailProvider(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ThumbnailProvider(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ThumbnailProvider(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailProvider()
{
  return &type metadata for ThumbnailProvider;
}

uint64_t sub_1B284E8F0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1B284E990()
{
  type metadata accessor for ThumbnailExtensionConfiguration();

  return swift_getWitnessTable();
}

void type metadata accessor for QLInlinePreviewMode(uint64_t a1)
{
}

void type metadata accessor for CGColorSpace(uint64_t a1)
{
}

void type metadata accessor for CGInterpolationQuality(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1B284EA20(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B284EA40(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

void type metadata accessor for CGContext(uint64_t a1)
{
}

uint64_t sub_1B284EAA4()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1B284EAF4()
{
  uint64_t v2 = v0[4];
  char v3 = (void *)v0[5];
  uint64_t v5 = v0[6];
  uint64_t v4 = v0[7];
  id v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *id v6 = v1;
  v6[1] = sub_1B284E094;
  return sub_1B2849A7C((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_1B284EBA0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1B284F8E0;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9C2FB70 + dword_1E9C2FB70);
  return v6(a1, v4);
}

void type metadata accessor for QLFileThumbnailRequestOptions(uint64_t a1)
{
}

uint64_t sub_1B284EC6C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_1B284ED50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1B284EDAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_1B2853900() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_1B2853AF0();
  __break(1u);
  return result;
}

uint64_t sub_1B284EF04(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = a2;
  uint64_t v3 = sub_1B2853900();
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  uint64_t v38 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v36 - v7;
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  unint64_t v11 = (char *)&v36 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v41 = (char *)&v36 - v13;
  uint64_t v42 = v12;
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v37 = a1 + 56;
  uint64_t v15 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & v14;
  int64_t v39 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v40 = v12 + 16;
  uint64_t v43 = a1;
  uint64_t v44 = v12 + 32;
  uint64_t v18 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v20 = 0;
  while (v17)
  {
    unint64_t v23 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    unint64_t v24 = v23 | (v20 << 6);
LABEL_24:
    uint64_t v28 = v42;
    uint64_t v29 = v41;
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + 16))(v41, *(void *)(v43 + 48) + *(void *)(v42 + 72) * v24, v3);
    unint64_t v30 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    v30(v11, v29, v3);
    uint64_t v31 = *(void **)(v45 + 64);
    sub_1B284F3CC(v45);
    id v32 = objc_msgSend(v31, sel_contentType);
    if (v32)
    {
      int64_t v33 = v32;
      uint64_t v34 = v38;
      sub_1B28538D0();

      v30(v8, v34, v3);
    }
    else
    {
      sub_1B28538E0();
    }
    sub_1B284F3F8(v45);
    char v21 = sub_1B28538F0();
    int64_t v22 = *v18;
    (*v18)(v8, v3);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v22)(v11, v3);
    if (v21)
    {
      uint64_t v35 = 1;
LABEL_28:
      swift_release();
      return v35;
    }
  }
  int64_t v25 = v20 + 1;
  if (__OFADD__(v20, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v25 >= v39) {
    goto LABEL_27;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v25);
  ++v20;
  if (v26) {
    goto LABEL_23;
  }
  int64_t v20 = v25 + 1;
  if (v25 + 1 >= v39) {
    goto LABEL_27;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_23;
  }
  int64_t v20 = v25 + 2;
  if (v25 + 2 >= v39) {
    goto LABEL_27;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_23;
  }
  int64_t v20 = v25 + 3;
  if (v25 + 3 >= v39) {
    goto LABEL_27;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26)
  {
LABEL_23:
    unint64_t v17 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v20 << 6);
    goto LABEL_24;
  }
  int64_t v27 = v25 + 4;
  if (v27 >= v39)
  {
LABEL_27:
    uint64_t v35 = 0;
    goto LABEL_28;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26)
  {
    int64_t v20 = v27;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v20 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v20 >= v39) {
      goto LABEL_27;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v20);
    ++v27;
    if (v26) {
      goto LABEL_23;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void sub_1B284F298()
{
}

uint64_t sub_1B284F2C8()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B284F300(uint64_t a1, uint64_t a2)
{
  sub_1B284A688(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1B284F308()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

id sub_1B284F318()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 16))();

  return v1;
}

_OWORD *sub_1B284F354(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B284F368(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B284F3CC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 64);
  return a1;
}

uint64_t sub_1B284F3F8(uint64_t a1)
{
  return a1;
}

void type metadata accessor for QLThumbnailError(uint64_t a1)
{
}

uint64_t sub_1B284F438()
{
  return swift_release();
}

uint64_t sub_1B284F440(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1B284F4CC()
{
  return sub_1B284EC6C(&qword_1E9C2FBB8, type metadata accessor for QLFileThumbnailRequestOptions);
}

uint64_t sub_1B284F514()
{
  return sub_1B284EC6C(&qword_1E9C2FBC0, type metadata accessor for QLFileThumbnailRequestOptions);
}

uint64_t sub_1B284F55C()
{
  return sub_1B284EC6C(&qword_1E9C2FBC8, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1B284F5A4()
{
  return sub_1B284EC6C(&qword_1E9C2FBD0, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1B284F5EC()
{
  return sub_1B284EC6C(&qword_1E9C2FBD8, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1B284F634()
{
  return sub_1B284EC6C(&qword_1E9C2FBE0, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1B284F67C()
{
  return sub_1B284EC6C(&qword_1E9C2FBE8, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1B284F6C4()
{
  return sub_1B284EC6C(&qword_1E9C2FBF0, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_1B284F720(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1B284F768()
{
  return sub_1B284EC6C(&qword_1E9C2FBF8, type metadata accessor for Code);
}

unint64_t sub_1B284F7B4()
{
  unint64_t result = qword_1E9C2FC00;
  if (!qword_1E9C2FC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9C2FC00);
  }
  return result;
}

uint64_t sub_1B284F808()
{
  return sub_1B284EC6C(&qword_1E9C2FC08, type metadata accessor for Code);
}

uint64_t sub_1B284F850()
{
  return sub_1B284EC6C(&qword_1E9C2FBA0, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1B284F898()
{
  return sub_1B284EC6C(&qword_1EB5E7A60, type metadata accessor for QLFileThumbnailRequestOptions);
}

void __getFPItemIDClass_block_invoke_cold_1()
{
}

void __getFPItemClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[QLThumbnailGenerator generateBestRepresentationForRequest:completionHandler:](v0);
}

void _QLCopyResourcePropertyForKey_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Hit error %@ retrieving the thumbnails property for %@");
}

void QLGetRealPath_cold_1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1B281E000, v1, v2, "failed to open path %s: %s", v3, v4, v5, v6, v7);
}

void QLGetRealPath_cold_2()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1B281E000, v1, v2, "failed to get real path for %s: %s", v3, v4, v5, v6, v7);
}

void QLTCreateCGContextWithSize_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_1B281E000, log, OS_LOG_TYPE_ERROR, "Did not create CGContext because of incorrect image size in pixels (width: %d, height: %d)", (uint8_t *)v3, 0xEu);
}

void QLTRunInMainThreadAsync_cold_1()
{
  __assert_rtn("QLTRunInMainThreadAsync", "QLTUtilities.m", 333, "block != nil");
}

void QLTRunInMainThreadSync_cold_1()
{
  __assert_rtn("QLTRunInMainThreadSync", "QLTUtilities.m", 343, "block != nil");
}

uint64_t __getUIImageClass_block_invoke_cold_1()
{
  return __getFPSandboxingURLWrapperClass_block_invoke_cold_1();
}

uint64_t __getFPSandboxingURLWrapperClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[NSFileManager(_QLTUtilities) _QLTRemoveTemporaryDirectoryAtURL:](v0);
}

void QLCreateCGImageWithData_cold_1(int *a1, int *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_1B281E000, log, OS_LOG_TYPE_ERROR, "Did not create CGContext for thumbail extension because of incorrect image size in pixels (width: %d, height: %d)", (uint8_t *)v5, 0xEu);
}

uint64_t sub_1B2853790()
{
  return MEMORY[0x1F40E2D28]();
}

uint64_t sub_1B28537A0()
{
  return MEMORY[0x1F40E2DA0]();
}

uint64_t sub_1B28537B0()
{
  return MEMORY[0x1F40E2DF0]();
}

uint64_t sub_1B28537C0()
{
  return MEMORY[0x1F40E2E08]();
}

uint64_t sub_1B2853830()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1B2853840()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B2853850()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1B2853860()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1B2853870()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1B2853880()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B2853890()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B28538A0()
{
  return MEMORY[0x1F40DFA08]();
}

uint64_t sub_1B28538C0()
{
  return MEMORY[0x1F41878C8]();
}

uint64_t sub_1B28538D0()
{
  return MEMORY[0x1F41878F8]();
}

uint64_t sub_1B28538E0()
{
  return MEMORY[0x1F4187960]();
}

uint64_t sub_1B28538F0()
{
  return MEMORY[0x1F41879E0]();
}

uint64_t sub_1B2853900()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1B2853910()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1B2853920()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1B2853930()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1B2853940()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1B2853950()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1B2853960()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1B2853970()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1B2853980()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1B2853990()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B28539A0()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1B28539B0()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1B28539C0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B28539D0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B28539E0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B28539F0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1B2853A00()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1B2853A10()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1B2853A20()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1B2853A30()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1B2853A40()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1B2853A50()
{
  return MEMORY[0x1F40D9688]();
}

uint64_t sub_1B2853A60()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1B2853A70()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1B2853A80()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B2853A90()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B2853AA0()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B2853AB0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B2853AC0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B2853AD0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B2853AE0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B2853AF0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B2853B10()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1B2853B20()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B2853B30()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B2853B60()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B2853B70()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B2853B80()
{
  return MEMORY[0x1F4185EF8]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x1F40D9840](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x1F40D9848](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x1F40D9850](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9860](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1F40D9890]();
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B70](plist);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1F40D9C08]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C40](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C58](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C60](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C68](a1);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
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

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSRect NSRectFromString(NSString *aString)
{
  MEMORY[0x1F40E7220](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
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

uint64_t _CFURLCopyLogicalURLOfPromiseAtURL()
{
  return MEMORY[0x1F40D9260]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x1F40D9350]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1F40D9368]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x1F40D9380]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
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

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC108](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1F40CC180](a1);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1F40CC240](*(void *)&fd, name, *(void *)&options);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC2A8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1F40CCE18](a1, *(void *)&a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
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

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1F40CE6B8](*(void *)&target_task, source_address, size, dest_address);
}

char *__cdecl xattr_name_with_flags(const char *a1, xattr_flags_t a2)
{
  return (char *)MEMORY[0x1F40CE950](a1, a2);
}