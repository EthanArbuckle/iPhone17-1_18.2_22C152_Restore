void sub_21FBF44EC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x263EF8340];
  v3 = a2;
  v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v3;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "Results %@", (uint8_t *)&v21, 0xCu);
  }

  v7 = objc_msgSend_objectForKeyedSubscript_(v3, v5, @"statusCode", v6);

  if (v7)
  {
    v7 = objc_msgSend_objectForKeyedSubscript_(v3, v8, @"statusCode", v9);
  }
  v10 = objc_msgSend_objectForKeyedSubscript_(v3, v8, @"data", v9);

  if (!v10)
  {
    v15 = 0;
    goto LABEL_9;
  }
  v10 = objc_msgSend_objectForKeyedSubscript_(v3, v11, @"data", v12);
  v15 = objc_msgSend_objectForKeyedSubscript_(v10, v13, @"fdrErrorDescription", v14);

  if (!v15)
  {
LABEL_9:
    objc_msgSend_replyWithMessage_status_results_reply_(*(void **)(a1 + 32), v11, (uint64_t)v15, (uint64_t)v7, v10, *(void *)(a1 + 48));
    goto LABEL_10;
  }
  v15 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"fdrErrorDescription", v16);
  objc_msgSend_replyWithMessage_status_results_reply_(*(void **)(a1 + 32), v17, (uint64_t)v15, (uint64_t)v7, v10, *(void *)(a1 + 48));
LABEL_10:
  objc_msgSend_invalidate(*(void **)(a1 + 40), v18, v19, v20);
}

void sub_21FBF55D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21FBF5A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21FBF6618(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = a1;
    __int16 v7 = 2080;
    uint64_t v8 = a2;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "%s: %s", (uint8_t *)&v5, 0x16u);
  }
}

CFTypeRef sub_21FBF66D8(const __CFString *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CFDictionaryRef v2 = IOServiceNameMatching("AppleH16CamIn");
  if (!v2)
  {
    __int16 v7 = handleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C09C();
    }
    goto LABEL_10;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v2);
  if (!MatchingService)
  {
    __int16 v7 = handleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C0D0();
    }
LABEL_10:

    goto LABEL_11;
  }
  io_object_t v4 = MatchingService;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, a1, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  IOObjectRelease(v4);
  if (CFProperty)
  {
    uint64_t v6 = handleForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      CFStringRef v10 = a1;
      __int16 v11 = 2112;
      CFTypeRef v12 = CFProperty;
      _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "property %@ found: %@", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v6 = handleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    CFStringRef v10 = a1;
    _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "No %@ property found", (uint8_t *)&v9, 0xCu);
  }
  CFTypeRef CFProperty = 0;
LABEL_14:

  return CFProperty;
}

uint64_t sub_21FBF6894(char *a1, unsigned int a2, void *a3, _DWORD *a4)
{
  uint64_t v8 = DEREncoderCreate();
  if (!v8)
  {
    v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C17C();
    }
    goto LABEL_52;
  }
  uint64_t v9 = DEREncoderCreate();
  if (!v9)
  {
    v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C1B0();
    }
LABEL_52:
    uint64_t v32 = 0;
    v22 = 0;
    v31 = 0;
    goto LABEL_61;
  }
  uint64_t v44 = v9;
  unint64_t v10 = (unint64_t)a2 >> 1;
  __int16 v11 = (char *)malloc_type_malloc((v10 + 1), 0x100004077774924uLL);
  CFTypeRef v12 = (char *)malloc_type_malloc((v10 + 1), 0x100004077774924uLL);
  bzero(v12, (v10 + 1));
  bzero(v11, (v10 + 1));
  if (*a1 < 0)
  {
    if (a2 >= 2)
    {
      if (v10 <= 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v10;
      }
      uint64_t v18 = v11 + 1;
      uint64_t v19 = a1;
      do
      {
        char v20 = *v19++;
        *v18++ = v20;
        --v17;
      }
      while (v17);
    }
  }
  else if (a2 >= 2)
  {
    if (v10 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v10;
    }
    uint64_t v14 = a1;
    uint64_t v15 = v11;
    do
    {
      char v16 = *v14++;
      *v15++ = v16;
      --v13;
    }
    while (v13);
  }
  if (a1[v10] < 0)
  {
    BOOL v21 = a2 >= 2;
    v22 = v12;
    if (v21)
    {
      if (v10 <= 1) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = v10;
      }
      v28 = &a1[v10];
      v29 = v12 + 1;
      do
      {
        char v30 = *v28++;
        *v29++ = v30;
        --v27;
      }
      while (v27);
    }
  }
  else
  {
    BOOL v21 = a2 >= 2;
    v22 = v12;
    if (v21)
    {
      if (v10 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v10;
      }
      v24 = &a1[v10];
      v25 = v12;
      do
      {
        char v26 = *v24++;
        *v25++ = v26;
        --v23;
      }
      while (v23);
    }
  }
  v31 = v11;
  if (DEREncoderAddData())
  {
    v35 = handleForCategory(0);
    uint64_t v32 = v44;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_61;
    }
    goto LABEL_54;
  }
  uint64_t v32 = v44;
  if (DEREncoderAddData())
  {
    v35 = handleForCategory(0);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
LABEL_61:

      v36 = handleForCategory(0);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_21FC5C104(v36, v37, v38, v39, v40, v41, v42, v43);
      }
      goto LABEL_63;
    }
LABEL_54:
    sub_21FC5C2B4();
    goto LABEL_61;
  }
  if (DEREncoderAddSequenceFromEncoder())
  {
    v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C280();
    }
    goto LABEL_61;
  }
  if (DEREncoderCreateEncodedBuffer())
  {
    v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C24C();
    }
    goto LABEL_61;
  }
  if (*a3)
  {
    if (*a4)
    {
      uint64_t v33 = 0;
LABEL_40:
      DEREncoderDestroy();
      goto LABEL_41;
    }
    v36 = handleForCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C218();
    }
  }
  else
  {
    v36 = handleForCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C1E4();
    }
  }
LABEL_63:

  uint64_t v33 = 3;
  if (v8) {
    goto LABEL_40;
  }
LABEL_41:
  if (v32) {
    DEREncoderDestroy();
  }
  if (v31) {
    free(v31);
  }
  if (v22) {
    free(v22);
  }
  return v33;
}

void sub_21FBF6C68(void *a1, CFDataRef *a2, void *a3, _DWORD *a4, uint64_t a5)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  int v66 = -1;
  memset(length, 0, sizeof(length));
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = sub_21FBF7244;
  v60 = sub_21FBF7254;
  dispatch_semaphore_t v61 = dispatch_semaphore_create(0);
  if (!a2)
  {
    char v20 = handleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21FC5B9D0();
    }
    uint64_t v14 = 0;
    BOOL v21 = 0;
    id v13 = 0;
    goto LABEL_13;
  }
  id v13 = (id)objc_msgSend_mutableCopy(a1, v10, v11, v12);
  if (a3)
  {
    uint64_t v14 = malloc_type_malloc(0x20uLL, 0x94608AD0uLL);
    if (!v14)
    {
      uint64_t v18 = handleForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_21FC5C394();
      }
      goto LABEL_10;
    }
    uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, void *))ccrng();
    uint64_t v16 = ccrng();
    if (v15(v16, 32, v14))
    {
      uint64_t v18 = handleForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_21FC5C3C8();
      }
LABEL_10:

      char v20 = handleForCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_21FC5C360();
      }
      BOOL v21 = 0;
LABEL_13:
      uint64_t v19 = 0;
LABEL_14:

      goto LABEL_32;
    }
    uint64_t v19 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v17, (uint64_t)v14, 32);
    objc_msgSend_appendData_(v13, v22, (uint64_t)v19, v23);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v19 = 0;
  }
  id v13 = v13;
  uint64_t v27 = (const void *)objc_msgSend_bytes(v13, v24, v25, v26);
  CC_LONG v31 = objc_msgSend_length(v13, v28, v29, v30);

  if (CC_SHA256(v27, v31, md))
  {
    BOOL v21 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v32, (uint64_t)md, 32);
  }
  else
  {
    BOOL v21 = 0;
  }
  objc_msgSend_sharedManager(MEMORY[0x263F340C8], v32, v33, v34);
  if (a5) {
    v35 = {;
  }
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = sub_21FBF72D0;
    v54[3] = &unk_26452A548;
    v54[4] = &v63;
    v54[5] = &v67;
    v54[6] = &v56;
    objc_msgSend_authenticateTouchControllerWithChallenge_completionHandler_(v35, v36, (uint64_t)v21, (uint64_t)v54);
  }
  else {
    v35 = {;
  }
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = sub_21FBF725C;
    v55[3] = &unk_26452A548;
    v55[4] = &v63;
    v55[5] = &v67;
    v55[6] = &v56;
    objc_msgSend_authenticateBatteryWithChallenge_completionHandler_(v35, v37, (uint64_t)v21, (uint64_t)v55);
  }

  uint64_t v38 = v57[5];
  dispatch_time_t v39 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v38, v39))
  {
    char v20 = handleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BB80();
    }
    goto LABEL_14;
  }
  uint64_t v40 = v64;
  if (a4) {
    *a4 = *((_DWORD *)v64 + 6);
  }
  if (*((_DWORD *)v40 + 6))
  {
    char v20 = handleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BB4C();
    }
    goto LABEL_14;
  }
  CFDataRef v41 = (const __CFData *)v68[3];
  if (!v41)
  {
    char v20 = handleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21FC5B9D0();
    }
    goto LABEL_14;
  }
  BytePtr = (char *)CFDataGetBytePtr(v41);
  unsigned int v43 = CFDataGetLength((CFDataRef)v68[3]);
  if (sub_21FBF6894(BytePtr, v43, &length[1], length))
  {
    char v20 = handleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C2E8(v20, v47, v48, v49, v50, v51, v52, v53);
    }
    goto LABEL_14;
  }
  CFDataRef v44 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)&length[1], length[0], (CFAllocatorRef)*MEMORY[0x263EFFB18]);
  *a2 = v44;
  if (!v44)
  {
    char v20 = handleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21FC5BA6C();
    }
    goto LABEL_14;
  }
  *(void *)&length[1] = 0;
  if (a3)
  {
    id v45 = v19;
    *a3 = v45;
    if (!v45)
    {
      char v20 = handleForCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_21FC5BAA0();
      }
      goto LABEL_13;
    }
    uint64_t v19 = v45;
  }
LABEL_32:
  v46 = (const void *)v68[3];
  if (v46) {
    CFRelease(v46);
  }
  if (v14) {
    free(v14);
  }
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
}

void sub_21FBF71EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21FBF7244(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21FBF7254(uint64_t a1)
{
}

void sub_21FBF725C(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, int a6)
{
  id v8 = a4;
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = a6;
  id v9 = v8;
  *(void *)(*(void *)(a1[5] + 8) + 24) = v9;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

void sub_21FBF72D0(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, int a6)
{
  id v8 = a4;
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = a6;
  id v9 = v8;
  *(void *)(*(void *)(a1[5] + 8) + 24) = v9;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

void sub_21FBF7344(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = a4;
  if (v7)
  {
    if (v8)
    {
      *(void *)(*(void *)(a1[5] + 8) + 24) = v7;
      *(void *)(*(void *)(a1[6] + 8) + 24) = v9;
      unint64_t v10 = handleForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        CFIndex Length = CFDataGetLength(*(CFDataRef *)(*(void *)(a1[6] + 8) + 24));
        v12[0] = 67109376;
        v12[1] = a4;
        __int16 v13 = 2048;
        CFIndex v14 = Length;
        _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, "C API: Received response from ACCHWComponentAuth, authError is %x:Size:%ld", (uint8_t *)v12, 0x12u);
      }
    }
    else
    {
      unint64_t v10 = handleForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_21FC5C430();
      }
    }
  }
  else
  {
    unint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C3FC();
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[7] + 8) + 40));
}

void sub_21FBF74D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21FBF7500(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_21FBF8D60(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21FBFB0DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_21FBFD2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t sub_21FBFD358(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21FBFD368(uint64_t a1)
{
}

void sub_21FBFD370(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    id v9 = a3;
    uint64_t v13 = objc_msgSend_allHeaderFields(v9, v10, v11, v12);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    int v19 = objc_msgSend_statusCode(v9, v16, v17, v18);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19;
  }
  uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v7;
  id v25 = v7;

  uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v8;
  id v24 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_21FBFD628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FBFD644(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_rangeAtIndex_(a2, (const char *)a2, 1, a4);
  objc_msgSend_substringWithRange_(*(void **)(a1 + 32), v6, v5, (uint64_t)v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v11 = objc_msgSend_initWithBase64EncodedString_options_(v7, v8, (uint64_t)v12, 1);
  if (v11) {
    objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v9, (uint64_t)v11, v10);
  }
}

void sub_21FBFF568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21FBFF598(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21FBFF5A8(uint64_t a1)
{
}

void sub_21FBFF5B0(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a4;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  uint64_t v11 = objc_msgSend_mutableCopy(a3, v8, v9, v10);
  uint64_t v12 = *(void *)(a1[5] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = *(void *)(a1[6] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v7;
}

void sub_21FBFF630(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a4;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  uint64_t v11 = objc_msgSend_mutableCopy(a3, v8, v9, v10);
  uint64_t v12 = *(void *)(a1[5] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = *(void *)(a1[6] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v7;
}

void sub_21FBFF844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FBFF85C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_21FC5D3D8();
  }
}

void sub_21FBFF8B4(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  io_object_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "result: %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  objc_msgSend_invalidate(*(void **)(*(void *)(a1 + 32) + 16), v8, v9, v10);
}

void sub_21FBFFB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FBFFB1C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_21FC5D440();
  }
}

uint64_t sub_21FBFFB74(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  io_object_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "success: %d", (uint8_t *)v9, 8u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return objc_msgSend_invalidate(*(void **)(*(void *)(a1 + 32) + 16), v5, v6, v7);
}

void sub_21FC009E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21FC00A14(uint64_t a1, void *a2)
{
  id v3 = a2;
  io_object_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_21FC5D694();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_21FC00A88(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = handleForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 67109120;
    LODWORD(v21) = a2;
    _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "queryRepairDelta success: %d", (uint8_t *)&v20, 8u);
  }

  uint64_t v10 = handleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v7;
    _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, "queryRepairDelta results: %@", (uint8_t *)&v20, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v7;
  id v13 = v7;

  uint64_t v14 = *(void *)(a1[7] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v8;
  id v16 = v8;

  objc_msgSend_invalidate(*(void **)(a1[4] + 16), v17, v18, v19);
}

void sub_21FC00F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21FC00FB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  io_object_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_21FC5D694();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_21FC0102C(void *a1, char a2, void *a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = handleForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    id v27 = v9;
    _os_log_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_DEFAULT, "issueRepairCert key: %@", (uint8_t *)&v26, 0xCu);
  }

  id v13 = handleForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    id v27 = v10;
    _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "issueRepairCert certs: %@", (uint8_t *)&v26, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v14 = *(void *)(a1[6] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v9;
  id v16 = v9;

  uint64_t v17 = *(void *)(a1[7] + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v10;
  id v19 = v10;

  uint64_t v20 = *(void *)(a1[8] + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v11;
  id v22 = v11;

  objc_msgSend_invalidate(*(void **)(a1[4] + 16), v23, v24, v25);
}

void sub_21FC01520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21FC01554(uint64_t a1, void *a2)
{
  id v3 = a2;
  io_object_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_21FC5D694();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_21FC015C8(void *a1, char a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  id v10 = handleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(*(void *)(a1[7] + 8) + 40);
    int v15 = 138412290;
    uint64_t v16 = v11;
    _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, "Challenge components response: %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1[4] + 16), v12, v13, v14);
}

void sub_21FC02430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_21FC02500(void *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  if (v10)
  {
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DAA0();
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  if (v8)
  {
    if (v9)
    {
LABEL_7:
      id v12 = v9;
      uint64_t v16 = objc_msgSend_allHeaderFields(v12, v13, v14, v15);
      uint64_t v17 = *(void *)(a1[7] + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      int v22 = objc_msgSend_statusCode(v12, v19, v20, v21);
      *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = v22;
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v23 = handleForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DA6C();
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    if (v9) {
      goto LABEL_7;
    }
  }
  uint64_t v24 = handleForCategory(0);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_21FC5DA38();
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
LABEL_14:
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[9] + 8) + 40));
}

uint64_t sub_21FC02698(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return objc_msgSend_resume(v5, v2, v3, v4);
}

uint64_t sub_21FC02C14(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_21FC02C40(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_21FC02C60(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void sub_21FC02C94(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21FC02CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315138;
    uint64_t v24 = a2;
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v23, 0xCu);
  }

  uint64_t v6 = objc_msgSend_stringWithUTF8String_(NSString, v4, a2, v5);
  id v7 = objc_alloc(MEMORY[0x263F08AE8]);
  id v9 = objc_msgSend_initWithPattern_options_error_(v7, v8, @"x-fdr-jmet-keys:.*?(seal:sik-[a-zA-Z0-9-]*)", 0, 0);
  uint64_t v13 = objc_msgSend_length(v6, v10, v11, v12);
  uint64_t v15 = objc_msgSend_firstMatchInString_options_range_(v9, v14, (uint64_t)v6, 0, 0, v13);
  uint64_t v18 = v15;
  if (v15)
  {
    uint64_t v19 = objc_msgSend_rangeAtIndex_(v15, v16, 1, v17);
    uint64_t v21 = objc_msgSend_substringWithRange_(v6, v20, v19, (uint64_t)v20);
    if (v21)
    {
      int v22 = handleForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        uint64_t v24 = (uint64_t)v21;
        _os_log_impl(&dword_21FBF2000, v22, OS_LOG_TYPE_DEFAULT, "FOUND SealHeader [%@]", (uint8_t *)&v23, 0xCu);
      }

      objc_storeStrong((id *)&qword_267EF81A8, v21);
    }
  }
}

id sub_21FC02E70(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  unint64_t v6 = a3;
  uint64_t v10 = (void *)v6;
  if (a1)
  {
    if (v5 | v6)
    {
      uint64_t v12 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v7, v8, v9);
      if (v5)
      {
        uint64_t v13 = handleForCategory(0);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_21FC5DBF0(v5, v13);
        }

        objc_msgSend_setObject_forKeyedSubscript_(v12, v14, v5, *MEMORY[0x263F08320]);
      }
      if (v10) {
        objc_msgSend_setObject_forKeyedSubscript_(v12, v11, (uint64_t)v10, *MEMORY[0x263F08608]);
      }
      a1 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v11, @"com.apple.corerepair", (uint64_t)a1, v12);
    }
    else
    {
      a1 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, @"com.apple.corerepair", (uint64_t)a1, 0);
    }
  }

  return a1;
}

uint64_t sub_21FC031D0()
{
  qword_267EF81C0 = objc_alloc_init(CRSysConfig);
  return MEMORY[0x270F9A758]();
}

void sub_21FC03BB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21FC054EC(uint64_t a1, const char *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v2 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163428, a2, (uint64_t)&v20, (uint64_t)v26, 16);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    mach_port_t v5 = *MEMORY[0x263F0EC88];
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(&unk_26D163428);
        }
        id v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v8 = handleForCategory(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v7;
          _os_log_impl(&dword_21FBF2000, v8, OS_LOG_TYPE_DEFAULT, "Matching service %@", buf, 0xCu);
        }

        id v9 = v7;
        uint64_t v13 = (const char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
        CFDictionaryRef v14 = IOServiceMatching(v13);
        uint64_t MatchingService = IOServiceGetMatchingService(v5, v14);
        if (MatchingService)
        {
          uint64_t v17 = MatchingService;
          uint64_t v18 = handleForCategory(0);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v9;
            _os_log_impl(&dword_21FBF2000, v18, OS_LOG_TYPE_DEFAULT, "Found service %@", buf, 0xCu);
          }

          return v17;
        }
      }
      uint64_t v3 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163428, v16, (uint64_t)&v20, (uint64_t)v26, 16);
      if (v3) {
        continue;
      }
      break;
    }
  }
  return 0;
}

void sub_21FC05A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21FC05C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21FC05C6C(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    unsigned int v2 = 0;
    do
    {
      uint64_t v3 = handleForCategory(0);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v9 = v2;
        _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "Retry Count:%d", buf, 8u);
      }

      sleep(0xAu);
      result = objc_msgSend_copyComponentStatus(*(void **)(v1 + 32), v4, v5, v6);
      *(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
      if (*(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 24)) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v2 >= 9;
      }
      ++v2;
    }
    while (!v7);
  }
  return result;
}

void sub_21FC061AC()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(0);
  id v1 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v3 = objc_msgSend_initWithMachServiceName_options_(v1, v2, @"com.apple.corerepair.preflightControl", 0);
  uint64_t v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v4, (uint64_t)&unk_26D168410, v5);
  objc_msgSend_setRemoteObjectInterface_(v3, v7, (uint64_t)v6, v8);

  objc_msgSend_resume(v3, v9, v10, v11);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_21FC06378;
  v25[3] = &unk_26452A790;
  uint64_t v12 = v0;
  int v26 = v12;
  uint64_t v15 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v3, v13, (uint64_t)v25, v14);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_21FC063E4;
  v22[3] = &unk_26452A7B8;
  id v23 = v3;
  uint64_t v16 = v12;
  uint64_t v24 = v16;
  id v17 = v3;
  objc_msgSend_queryRepairDeltaWithReply_(v15, v18, (uint64_t)v22, v19);

  dispatch_time_t v20 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v16, v20))
  {
    long long v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E224();
    }
  }
}

void sub_21FC06378(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_21FC5E258((uint64_t)v3, v4);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_21FC063E4(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v12 = v8;
  if (v7 && !v8 && (a2 & 1) != 0)
  {
    uint64_t v52 = a1;
    uint64_t v13 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v9, v10, v11);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v53 = v7;
    id obj = v7;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v55, (uint64_t)v61, 16);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v56 != v19) {
            objc_enumerationMutation(obj);
          }
          long long v21 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          long long v22 = objc_msgSend_objectForKeyedSubscript_(v21, v16, @"key", v17);
          uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v21, v23, @"identifier", v24);
          uint64_t v28 = (void *)v25;
          if (v22) {
            BOOL v29 = v25 == 0;
          }
          else {
            BOOL v29 = 1;
          }
          if (!v29)
          {
            uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v13, v26, (uint64_t)v22, v27);

            if (!v30)
            {
              uint64_t v34 = objc_msgSend_array(MEMORY[0x263EFF980], v31, v32, v33);
              objc_msgSend_setObject_forKeyedSubscript_(v13, v35, (uint64_t)v34, (uint64_t)v22);
            }
            id v36 = [NSString alloc];
            id v37 = objc_alloc(MEMORY[0x263EFF8F8]);
            dispatch_time_t v39 = objc_msgSend_initWithBase64EncodedString_options_(v37, v38, (uint64_t)v28, 0);
            CFDataRef v41 = objc_msgSend_initWithData_encoding_(v36, v40, (uint64_t)v39, 4);

            CFDataRef v44 = objc_msgSend_objectForKeyedSubscript_(v13, v42, (uint64_t)v22, v43);
            objc_msgSend_addObject_(v44, v45, (uint64_t)v41, v46);
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v55, (uint64_t)v61, 16);
      }
      while (v18);
    }

    uint64_t v47 = handleForCategory(0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v13;
      _os_log_impl(&dword_21FBF2000, v47, OS_LOG_TYPE_DEFAULT, "delta components: %@", buf, 0xCu);
    }

    uint64_t v48 = qword_267EF81D0;
    qword_267EF81D0 = (uint64_t)v13;
    a1 = v52;
    id v7 = v53;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v48 = handleForCategory(0);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E2D0(a2, (uint64_t)v12, v48);
    }
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v49, v50, v51);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_21FC06C98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FC07090(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FC0C1C4(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x370], 8);
  _Block_object_dispose(&STACK[0x3A0], 8);
  _Block_object_dispose(&STACK[0x3C0], 8);
  _Block_object_dispose(&STACK[0x3F0], 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21FC0C2A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21FC0C2B4(uint64_t a1)
{
}

void sub_21FC0C2BC(void *a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1[4] + 8) + 40));
  uint64_t v2 = *MEMORY[0x263F399B0];
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1[5] + 8) + 40), v3, *MEMORY[0x263F399B0], v4);
  if (objc_msgSend_containsObject_(v5, v6, *MEMORY[0x263F39968], v7))
  {
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1[5] + 8) + 40), v8, v2, v9);
    char v13 = objc_msgSend_containsObject_(v10, v11, *MEMORY[0x263F39970], v12);

    if (v13)
    {
      DeviceIdentityIssueClientCertificateWithCompletion();
      return;
    }
  }
  else
  {
  }
  uint64_t v14 = handleForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_21FC5EA14();
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  uint64_t v15 = (void *)MEMORY[0x263F087E8];
  uint64_t v22 = *MEMORY[0x263F08320];
  v23[0] = @"Missing mandatory OIDS in kMAOptionsBAAOIDSToInclude";
  uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)v23, (uint64_t)&v22, 1);
  uint64_t v19 = objc_msgSend_errorWithDomain_code_userInfo_(v15, v18, @"com.apple.corerepair", -2, v17);
  uint64_t v20 = *(void *)(a1[7] + 8);
  long long v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

void sub_21FC0C4D4(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = handleForCategory(0);
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC5EA7C();
    }

    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = a2;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl(&dword_21FBF2000, v11, OS_LOG_TYPE_DEFAULT, "BIK:%@::Certs:%@", buf, 0x16u);
    }

    if (v8 && (uint64_t v15 = objc_msgSend_count(v8, v12, v13, v14), a2) && v15 == 2)
    {
      uint64_t v16 = handleForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v16, OS_LOG_TYPE_DEFAULT, "BIK and BAA issues success", buf, 2u);
      }

      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
      *(void *)(*(void *)(a1[7] + 8) + 24) = a2;
    }
    else
    {
      uint64_t v17 = handleForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_21FC5EA48();
      }

      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
      uint64_t v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F08320];
      int v26 = @"Invalid Certs or BIK";
      uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)&v26, (uint64_t)&v25, 1);
      uint64_t v22 = objc_msgSend_errorWithDomain_code_userInfo_(v18, v21, @"com.apple.corerepair", -1, v20);
      uint64_t v23 = *(void *)(a1[5] + 8);
      uint64_t v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[8] + 8) + 40));
}

void sub_21FC0C754(void *a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1[5] + 8) + 40));
  uint64_t v2 = *(void *)(a1[7] + 8);
  id v3 = *(void **)(v2 + 40);
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id v8 = *(id *)(v5 + 40);
  id obj = v3;
  char StrongComponentsWithError_resultobtained = objc_msgSend_getStrongComponentsWithError_resultobtained_(v4, v6, (uint64_t)&obj, (uint64_t)&v8);
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v5 + 40), v8);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = StrongComponentsWithError_resultobtained;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[5] + 8) + 40));
}

uint64_t sub_21FC0C7F4(void *a1)
{
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24), a1[4], *(void *)(*(void *)(a1[7] + 8) + 40));
  }
  return result;
}

id sub_21FC0C828(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v50[7] = *MEMORY[0x263EF8340];
  v49[0] = @"EventType";
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = objc_msgSend_null(MEMORY[0x263EFF9D0], a2, a3, a4);
  }
  v50[0] = v6;
  v49[1] = @"Client";
  CFDataRef v44 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], a2, a3, a4, v6);
  uint64_t v13 = objc_msgSend_processName(v44, v7, v8, v9);
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v10, v11, v12);
  }
  v50[1] = v14;
  v49[2] = @"BAAIssueTime";
  uint64_t v15 = objc_msgSend_numberWithDouble_(NSNumber, v10, v11, v12, *(double *)(a1 + 48));
  v50[2] = v15;
  v49[3] = @"ComponentChallengeTime";
  uint64_t v19 = objc_msgSend_numberWithDouble_(NSNumber, v16, v17, v18, *(double *)(a1 + 56));
  v50[3] = v19;
  v49[4] = @"CAACertIssueTime";
  uint64_t v23 = objc_msgSend_numberWithDouble_(NSNumber, v20, v21, v22, *(double *)(a1 + 64));
  v50[4] = v23;
  v49[5] = @"FailureCode";
  uint64_t v24 = NSNumber;
  uint64_t v28 = objc_msgSend_code(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v25, v26, v27);
  uint64_t v31 = objc_msgSend_numberWithInteger_(v24, v29, v28, v30);
  v50[5] = v31;
  v49[6] = @"FailureDomain";
  uint64_t v38 = objc_msgSend_domain(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v32, v33, v34);
  dispatch_time_t v39 = v38;
  if (!v38)
  {
    dispatch_time_t v39 = objc_msgSend_null(MEMORY[0x263EFF9D0], v35, v36, v37);
  }
  v50[6] = v39;
  uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v50, (uint64_t)v49, 7);
  if (!v38) {

  }
  if (!v13) {
  if (!v5)
  }

  CFDataRef v41 = handleForCategory(0);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v46 = "-[CRCAttestationManager issueClientCertificateWithCompletionOnQueue:withOptions:completion:]_block_invoke_2";
    __int16 v47 = 2112;
    uint64_t v48 = v40;
    _os_log_impl(&dword_21FBF2000, v41, OS_LOG_TYPE_DEFAULT, "[%s] send event: %@", buf, 0x16u);
  }

  return v40;
}

void sub_21FC0CE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21FC0CE88(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_21FC5D440();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_21FC0CEFC(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = handleForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 67109120;
    LODWORD(v22) = a2;
    _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "success %d", (uint8_t *)&v21, 8u);
  }

  uint64_t v10 = handleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v7;
    _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, "components %@", (uint8_t *)&v21, 0xCu);
  }

  uint64_t v11 = handleForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v8;
    _os_log_impl(&dword_21FBF2000, v11, OS_LOG_TYPE_DEFAULT, "error %@", (uint8_t *)&v21, 0xCu);
  }

  uint64_t v12 = *(void *)(a1[4] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v15 = *(void *)(a1[6] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v7;
  id v17 = v7;

  objc_msgSend_invalidate(*(void **)(*(void *)(a1[7] + 8) + 40), v18, v19, v20);
}

void sub_21FC0D6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_21FC0D730(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_21FC5EAE4();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_21FC0D7A4(void *a1, char a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  uint64_t v10 = handleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v15 = 138412290;
    uint64_t v16 = v11;
    _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, "CAA request2 components %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(*(void *)(a1[7] + 8) + 40), v12, v13, v14);
}

void sub_21FC0DEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21FC0DF08(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  if (v10)
  {
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC5EBB4();
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  if (!v8)
  {
    uint64_t v12 = handleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_21FC5EB80();
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  uint64_t v13 = handleForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = v8;
    _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "Data:%@", buf, 0xCu);
  }

  if (v9)
  {
    id v37 = v10;
    id v38 = v9;
    dispatch_time_t v39 = a1;
    id v40 = v8;
    id v14 = v9;
    int v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v14;
      _os_log_impl(&dword_21FBF2000, v15, OS_LOG_TYPE_DEFAULT, "Body:%@", buf, 0xCu);
    }

    uint64_t v36 = v14;
    uint64_t v19 = objc_msgSend_allHeaderFields(v14, v16, v17, v18);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v23 = objc_msgSend_allKeys(v19, v20, v21, v22);
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v42 != v27) {
            objc_enumerationMutation(v23);
          }
          uint64_t v29 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v30 = handleForCategory(0);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = objc_msgSend_valueForKey_(v19, v31, v29, v32);
            *(_DWORD *)buf = 138412290;
            id v47 = v33;
            _os_log_impl(&dword_21FBF2000, v30, OS_LOG_TYPE_DEFAULT, "value:%@", buf, 0xCu);
          }
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v34, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v26);
    }

    a1 = v39;
    id v8 = v40;
    id v10 = v37;
    id v9 = v38;
  }
  else
  {
    uint64_t v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21FC5EB4C();
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[7] + 8) + 40));
}

uint64_t sub_21FC0E280(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return objc_msgSend_resume(v5, v2, v3, v4);
}

void sub_21FC0EC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21FC0ECAC(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a4);
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  if (v10)
  {
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC5EBB4();
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  if (!v8)
  {
    uint64_t v12 = handleForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_21FC5EB80();
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  uint64_t v13 = handleForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = v8;
    _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "Data:%@", buf, 0xCu);
  }

  if (v9)
  {
    id v37 = v10;
    id v38 = v9;
    dispatch_time_t v39 = a1;
    id v40 = v8;
    id v14 = v9;
    int v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v14;
      _os_log_impl(&dword_21FBF2000, v15, OS_LOG_TYPE_DEFAULT, "Body:%@", buf, 0xCu);
    }

    uint64_t v36 = v14;
    uint64_t v19 = objc_msgSend_allHeaderFields(v14, v16, v17, v18);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v23 = objc_msgSend_allKeys(v19, v20, v21, v22);
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v42 != v27) {
            objc_enumerationMutation(v23);
          }
          uint64_t v29 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v30 = handleForCategory(0);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = objc_msgSend_valueForKey_(v19, v31, v29, v32);
            *(_DWORD *)buf = 138412290;
            id v47 = v33;
            _os_log_impl(&dword_21FBF2000, v30, OS_LOG_TYPE_DEFAULT, "value:%@", buf, 0xCu);
          }
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v34, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v26);
    }

    a1 = v39;
    id v8 = v40;
    id v10 = v37;
    id v9 = v38;
  }
  else
  {
    uint64_t v35 = handleForCategory(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_21FC5EB4C();
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[7] + 8) + 40));
}

uint64_t sub_21FC0F024(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return objc_msgSend_resume(v5, v2, v3, v4);
}

void sub_21FC11354(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_21FC11B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_21FC11BB4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((objc_msgSend__writeDataToEAN_withKey_(*(void **)(a1 + 32), v8, a3, (uint64_t)v7) & 1) == 0)
  {
    id v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21FC5F314();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void sub_21FC15A14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_21FC15AF8(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v6 = handleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = (id)objc_opt_class();
    id v7 = v18;
    _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "Inspecting Class: %@", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v8 = MGGetProductType();
  uint64_t v11 = objc_msgSend_getDeviceHandlerForProductType_(a2, v9, v8, v10);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v11;

  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    id v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = objc_opt_class();
      int v17 = 138412290;
      id v18 = v15;
      id v16 = v15;
      _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, "Chosen Class: %@", (uint8_t *)&v17, 0xCu);
    }
    *a3 = 1;
  }
}

uint64_t sub_21FC15E18(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  qword_26AC13428 = objc_msgSend__init(v1, v2, v3, v4);
  return MEMORY[0x270F9A758]();
}

void sub_21FC16194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21FC161D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21FC161E4(uint64_t a1)
{
}

id sub_21FC161EC(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_21FC5DBF0((uint64_t)v3, v4);
  }

  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = v3;
  id v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)v12, (uint64_t)&v11, 1);
  uint64_t v9 = objc_msgSend_errorWithDomain_code_userInfo_(v5, v8, @"com.apple.corerepair", a1, v7);

  return v9;
}

intptr_t sub_21FC16304(void *a1, int a2, id obj)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  uint64_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 40);
    int v7 = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "The read out DOFU is %@", (uint8_t *)&v7, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

id sub_21FC1A57C(int a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = (objc_class *)MEMORY[0x263F089D8];
  id v11 = a3;
  id v12 = [v10 alloc];
  uint64_t v14 = objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v11, (uint64_t)&a9);

  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v17 = v15;
  if (v14) {
    objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v14, *MEMORY[0x263F08320]);
  }
  id v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v16, @"com.apple.corerepair", a1, v17);

  return v18;
}

id sub_21FC1A650(void *a1, int a2, void *a3)
{
  id v11 = a1;
  if (!v11)
  {
    uint64_t v22 = sub_21FC1A57C(-39, v5, @"Invalid input.", v6, v7, v8, v9, v10, v27);
    id v23 = 0;
    goto LABEL_14;
  }
  id v12 = (const void *)SecCertificateCreateWithPEM();
  if (a2)
  {
    SecCertificateNotValidAfter();
    if (v20 == 0.0)
    {
      uint64_t v21 = @"Failed to obtain 'not valid after' date.";
      goto LABEL_12;
    }
LABEL_8:
    uint64_t v25 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x263EFF910], v13, v14, v15);
    if (v25)
    {
      id v23 = v25;
      uint64_t v22 = 0;
      if (!v12) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    uint64_t v21 = @"Failed to convert validity date.";
    goto LABEL_12;
  }
  SecCertificateNotValidBefore();
  if (v24 != 0.0) {
    goto LABEL_8;
  }
  uint64_t v21 = @"Failed to obtain 'not valid before' date.";
LABEL_12:
  uint64_t v22 = sub_21FC1A57C(-42, (uint64_t)v13, v21, v15, v16, v17, v18, v19, v27);
  id v23 = 0;
  if (v12) {
LABEL_13:
  }
    CFRelease(v12);
LABEL_14:
  if (a3 && !v23) {
    *a3 = v22;
  }

  return v23;
}

void _logHandler(unsigned int a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1 < 4)
  {
    id v3 = handleForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_21FC60FC4(a2, v3);
    }
  }
  else
  {
    if (a1 - 4 >= 3)
    {
      if (a1 == 7)
      {
        id v3 = handleForCategory(0);
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        int v6 = 136315138;
        uint64_t v7 = a2;
      }
      else
      {
        id v3 = handleForCategory(0);
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        int v6 = 136315138;
        uint64_t v7 = a2;
      }
      uint64_t v4 = v3;
      os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_13;
    }
    id v3 = handleForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      uint64_t v7 = a2;
      uint64_t v4 = v3;
      os_log_type_t v5 = OS_LOG_TYPE_INFO;
LABEL_13:
      _os_log_impl(&dword_21FBF2000, v4, v5, "%s\n", (uint8_t *)&v6, 0xCu);
    }
  }
LABEL_14:
}

id handleForCategory(unint64_t a1)
{
  if (qword_26AC13470 != -1) {
    dispatch_once(&qword_26AC13470, &unk_26D157848);
  }
  id v2 = (id)MEMORY[0x263EF8440];
  id v3 = MEMORY[0x263EF8440];
  if (a1 <= 1)
  {
    id v2 = (id)qword_26AC13478[a1];
  }
  return v2;
}

uint64_t sub_21FC1BFA0()
{
  os_log_t v0 = os_log_create("com.apple.corerepair", "device");
  id v1 = (void *)qword_26AC13478[0];
  qword_26AC13478[0] = (uint64_t)v0;

  qword_26AC13480 = (uint64_t)os_log_create("com.apple.corerepair", "device-error");
  return MEMORY[0x270F9A758]();
}

id sub_21FC1C010()
{
  id v0 = objc_alloc(MEMORY[0x263F08D68]);
  id v3 = objc_msgSend_initWithServiceName_(v0, v1, @"com.apple.CoreRepairCoreXPCService", v2);
  int v6 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v4, (uint64_t)&unk_26D16D160, v5);
  objc_msgSend_setRemoteObjectInterface_(v3, v7, (uint64_t)v6, v8);

  return v3;
}

id sub_21FC1C088(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = sub_21FC1C32C;
  id v38 = sub_21FC1C33C;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_21FC1C32C;
  uint64_t v32 = sub_21FC1C33C;
  id v33 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = sub_21FC1C010();
  objc_msgSend_resume(v5, v6, v7, v8);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_21FC1C344;
  v25[3] = &unk_26452A998;
  uint64_t v27 = &v28;
  uint64_t v9 = v4;
  uint64_t v26 = v9;
  id v12 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v5, v10, (uint64_t)v25, v11);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_21FC1C3A4;
  v21[3] = &unk_26452A9C0;
  double v24 = &v34;
  uint64_t v13 = v9;
  uint64_t v22 = v13;
  id v14 = v5;
  id v23 = v14;
  objc_msgSend_generateRepairReport_withReply_(v12, v15, (uint64_t)v3, (uint64_t)v21);

  dispatch_time_t v16 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v13, v16))
  {
    uint64_t v17 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFD6, @"XPC call timeout", 0);
    uint64_t v18 = (void *)v29[5];
    v29[5] = v17;
  }
  if (a2) {
    *a2 = (id) v29[5];
  }
  id v19 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

void sub_21FC1C308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21FC1C32C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21FC1C33C(uint64_t a1)
{
}

intptr_t sub_21FC1C344(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFD6, @"XPC call failed", a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  int v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

void sub_21FC1C3A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "Got report", v11, 2u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend_invalidate(*(void **)(a1 + 40), v8, v9, v10);
}

BOOL CRGenerateRepairReport(void *a1, uint64_t *a2, void *a3)
{
  if (!a2) {
    return 0;
  }
  id v10 = 0;
  uint64_t v5 = sub_21FC1C088(a1, &v10);
  id v6 = v10;
  id v7 = v6;
  *a2 = v5;
  if (a3) {
    *a3 = v6;
  }
  BOOL v8 = v7 == 0;

  return v8;
}

uint64_t sub_21FC1C4D4(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a1;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "Get state of component %d", buf, 8u);
  }

  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  int v33 = 0;
  *(void *)buf = 0;
  uint64_t v35 = buf;
  uint64_t v36 = 0x3032000000;
  id v37 = sub_21FC1C32C;
  id v38 = sub_21FC1C33C;
  id v39 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = sub_21FC1C010();
  objc_msgSend_resume(v6, v7, v8, v9);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_21FC1C7C4;
  v27[3] = &unk_26452A998;
  uint64_t v29 = buf;
  id v10 = v5;
  uint64_t v28 = v10;
  uint64_t v13 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v11, (uint64_t)v27, v12);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_21FC1C824;
  v22[3] = &unk_26452A9E8;
  uint64_t v25 = &v30;
  uint64_t v26 = buf;
  id v14 = v10;
  id v23 = v14;
  id v15 = v6;
  id v24 = v15;
  objc_msgSend_getComponentState_withReply_(v13, v16, a1, (uint64_t)v22);

  dispatch_time_t v17 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v14, v17))
  {
    uint64_t v18 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFD6, @"XPC call timeout", 0);
    id v19 = (void *)*((void *)v35 + 5);
    *((void *)v35 + 5) = v18;
  }
  if (a2) {
    *a2 = *((id *)v35 + 5);
  }
  uint64_t v20 = *((unsigned int *)v31 + 6);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v30, 8);
  return v20;
}

void sub_21FC1C798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

intptr_t sub_21FC1C7C4(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFD6, @"XPC call failed", a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

void sub_21FC1C824(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = handleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = a2;
    _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "Got state: %d", (uint8_t *)v13, 8u);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend_invalidate(*(void **)(a1 + 40), v10, v11, v12);
}

uint64_t CRGetComponentState(uint64_t a1, void *a2)
{
  id v7 = 0;
  uint64_t v3 = sub_21FC1C4D4(a1, &v7);
  id v4 = v7;
  id v5 = v4;
  if (a2) {
    *a2 = v4;
  }

  return v3;
}

uint64_t CRCopySupportedComponents(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t CRIsSelfRepairedComponent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](CRRepairReport, sel_isSelfRepairedComponent_, a1, a4);
}

uint64_t sub_21FC1CA88(uint64_t a1)
{
  qword_26AC13430 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

id sub_21FC1D034(void *a1)
{
  id v1 = a1;
  id v5 = (unsigned __int8 *)objc_msgSend_bytes(v1, v2, v3, v4);
  uint64_t v9 = objc_msgSend_length(v1, v6, v7, v8);
  for (id i = objc_alloc_init(MEMORY[0x263F089D8]); v9; --v9)
  {
    unsigned int v13 = *v5++;
    objc_msgSend_appendFormat_(i, v10, @"%02X", v11, v13);
  }
  uint64_t v14 = objc_msgSend_stringWithString_(NSString, v10, (uint64_t)i, v11);

  return v14;
}

id sub_21FC1D0E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v7 = v3;
  __int16 v22 = 0;
  if (v3)
  {
    uint64_t v8 = objc_msgSend_lowercaseString(v3, v4, v5, v6);

    uint64_t v7 = objc_opt_new();
    int v12 = objc_msgSend_length(v8, v9, v10, v11);
    if (v12 >= 2)
    {
      int v15 = 0;
      int v16 = v12 - 1;
      do
      {
        int v17 = v15 + 1;
        unsigned __int8 v18 = objc_msgSend_characterAtIndex_(v8, v13, v15, v14);
        if ((char)v18 >= 48 && v18 <= 0x66u && v18 - 58 >= 0x27)
        {
          __str[0] = v18;
          __str[1] = objc_msgSend_characterAtIndex_(v8, v13, v17, v14);
          HIBYTE(v22) = strtol(__str, 0, 16);
          objc_msgSend_appendBytes_length_(v7, v19, (uint64_t)&v22 + 1, 1);
          int v17 = v15 + 2;
        }
        int v15 = v17;
      }
      while (v17 < v16);
    }
  }
  else
  {
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_21FC611F8(v8);
      uint64_t v7 = 0;
    }
  }

  return v7;
}

uint64_t sub_21FC1D534(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  qword_26AC13438 = objc_msgSend__init(v1, v2, v3, v4);
  return MEMORY[0x270F9A758]();
}

void sub_21FC1D948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21FC1D978(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21FC1D988(uint64_t a1)
{
}

void sub_21FC1D990(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void sub_21FC1DCF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21FC1DD40(void *a1, int a2, int a3, id obj, uint64_t a5, int a6)
{
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = a6;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  id v8 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

id sub_21FC1DDF0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1)
  {
    *(_OWORD *)md = 0u;
    long long v17 = 0u;
    id v4 = a1;
    uint64_t v7 = objc_msgSend_cStringUsingEncoding_(v4, v5, 4, v6);
    CC_LONG v10 = objc_msgSend_lengthOfBytesUsingEncoding_(v4, v8, 4, v9);
    if (v7)
    {
      CC_SHA256(v7, v10, md);
      uint64_t v7 = objc_msgSend_stringWithCapacity_(MEMORY[0x263F089D8], v11, 64, v12);
      for (uint64_t i = 0; i != 32; ++i)
        objc_msgSend_appendFormat_(v7, a2, @"%02X", a4, md[i]);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v14 = objc_msgSend_copy(v7, a2, a3, a4);

  return v14;
}

id sub_21FC1DEFC(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v1 = a1;
    id v4 = (const void *)objc_msgSend_cStringUsingEncoding_(v1, v2, 4, v3, (unsigned __int128)0, (unsigned __int128)0);
    CC_LONG v7 = objc_msgSend_lengthOfBytesUsingEncoding_(v1, v5, 4, v6);
    if (v4) {
      CC_SHA256(v4, v7, (unsigned __int8 *)&v10);
    }
    a1 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v8, (uint64_t)&v10, 32);
  }
  return a1;
}

uint64_t sub_21FC1E374(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  qword_26AC13440 = objc_msgSend__init(v1, v2, v3, v4);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_21FC20EA4(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  qword_26AC13448 = objc_msgSend__init(v1, v2, v3, v4);
  return MEMORY[0x270F9A758]();
}

void sub_21FC22AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t sub_21FC22B38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21FC22B48(uint64_t a1)
{
}

void sub_21FC22B50(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ((objc_msgSend_containsString_(v7, v3, @"trustobject-", v4) & 1) == 0) {
    objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5, (uint64_t)v7, v6);
  }
}

void sub_21FC22BB8(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ((objc_msgSend_containsString_(v7, v3, @"trustobject-", v4) & 1) == 0) {
    objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5, (uint64_t)v7, v6);
  }
}

void sub_21FC25490(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_msgSend_objectForKey_(*(void **)(a1 + 32), v6, (uint64_t)v16, v7);

    uint64_t v11 = *(void **)(a1 + 32);
    if (v8)
    {
      uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v11, v9, (uint64_t)v16, v10);
      objc_msgSend_addEntriesFromDictionary_(v12, v13, (uint64_t)v5, v14);
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v15, (uint64_t)v12, (uint64_t)v16);
    }
    else
    {
      objc_msgSend_setObject_forKeyedSubscript_(v11, v9, (uint64_t)v5, (uint64_t)v16);
    }
  }
}

void sub_21FC25610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = (id)objc_opt_new();
  objc_msgSend_vcrtSign_outSignature_outDeviceNonce_outError_(v9, v8, a1, a2, a3, a4);
}

void sub_21FC25684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = (id)objc_opt_new();
  objc_msgSend_bcrtSign_outSignature_outDeviceNonce_outError_(v9, v8, a1, a2, a3, a4);
}

void sub_21FC256F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = (id)objc_opt_new();
  objc_msgSend_tcrtSign_outSignature_outDeviceNonce_outError_(v9, v8, a1, a2, a3, a4);
}

void sub_21FC2576C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = (id)objc_opt_new();
  objc_msgSend_prpcSign_outSignature_outDeviceNonce_outError_(v9, v8, a1, a2, a3, a4);
}

uint64_t sub_21FC25874()
{
  qword_267EF81E0 = objc_alloc_init(CoreRepairHelper);
  return MEMORY[0x270F9A758]();
}

void sub_21FC26380(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FC27074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21FC2709C(uint64_t a1, int a2, xpc_object_t xint)
{
  int64_t value = xpc_int64_get_value(xint);
  if (value == 37 || value == 17)
  {
    id v5 = handleForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_21FC623DC();
    }
  }
  else if (value)
  {
    uint64_t v6 = handleForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_21FC62368();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return 1;
}

void *sub_21FC27220()
{
  uint64_t result = dlopen("/usr/lib/system/libxpc.dylib", 2);
  qword_267EF81F8 = (uint64_t)result;
  return result;
}

void sub_21FC2ACB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FC2C220(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FC2C6BC()
{
  v69[5] = *MEMORY[0x263EF8340];
  id v0 = [CRDeviceComponent alloc];
  uint64_t v2 = objc_msgSend_initWithType_name_spc_fdrKeys_(v0, v1, 1024, @"Battery", @"IPHONE COMP BATTERY", &unk_26D163770);
  uint64_t v3 = [CRDeviceComponent alloc];
  uint64_t v63 = objc_msgSend_initWithType_name_spc_fdrKeys_(v3, v4, 1025, @"Display", @"IPHONE COMP DISPLAY", &unk_26D163788);
  id v5 = [CRDeviceComponent alloc];
  dispatch_semaphore_t v61 = objc_msgSend_initWithType_name_spc_fdrKeys_(v5, v6, 1026, @"Camera", @"IPHONE COMP CAMERA", &unk_26D1637A0);
  uint64_t v7 = [CRDeviceComponent alloc];
  long long v57 = objc_msgSend_initWithType_name_spc_fdrKeys_(v7, v8, 1029, @"RearSystem", @"IPHONE REAR ASSEMBLY", &unk_26D1637B8);
  id v9 = [CRDeviceComponent alloc];
  v60 = objc_msgSend_initWithType_name_spc_fdrKeys_(v9, v10, 1029, @"RearSystem", @"IPHONE MID ASSEMBLY", &unk_26D1637D0);
  uint64_t v11 = [CRDeviceComponent alloc];
  uint64_t v62 = objc_msgSend_initWithType_name_spc_fdrKeys_(v11, v12, 1030, @"BackGlass", @"IPHONE BACK GLASS", &unk_26D1637E8);
  uint64_t v13 = [CRDeviceComponent alloc];
  uint64_t v15 = objc_msgSend_initWithType_name_spc_fdrKeys_(v13, v14, 1027, @"FaceID", @"IPHONE COMP FACEID", &unk_26D163800);
  id v16 = [CRDeviceComponent alloc];
  v59 = objc_msgSend_initWithType_name_spc_fdrKeys_(v16, v17, 1032, @"MidEnclosure", @"IPHONE COMP ENCL", &unk_26D163818);
  uint64_t v18 = [CRDeviceComponent alloc];
  long long v58 = objc_msgSend_initWithType_name_spc_fdrKeys_(v18, v19, 1026, @"Camera", @"IPHONE COMP RCAM", &unk_26D163830);
  uint64_t v20 = [CRDeviceComponent alloc];
  __int16 v22 = objc_msgSend_initWithType_name_spc_fdrKeys_(v20, v21, 1029, @"RearSystem", @"IPHONE MCTUB", &unk_26D163848);
  id v23 = [CRDeviceComponent alloc];
  uint64_t v25 = objc_msgSend_initWithType_name_(v23, v24, 1031, @"MainMicrophone");
  uint64_t v26 = [CRDeviceComponent alloc];
  uint64_t v28 = objc_msgSend_initWithType_name_spc_fdrKeys_(v26, v27, 1025, @"Display", @"IPAD COMP DISPLAY", &unk_26D163860);
  uint64_t v29 = [CRDeviceComponent alloc];
  uint64_t v31 = objc_msgSend_initWithType_name_spc_fdrKeys_(v29, v30, 1027, @"FaceID", @"IPAD FRONT CAMERA", &unk_26D163878);
  uint64_t v32 = [CRDeviceComponent alloc];
  uint64_t v34 = objc_msgSend_initWithType_name_spc_fdrKeys_(v32, v33, 1026, @"Camera", @"IPAD REAR CAMERA", &unk_26D163890);
  uint64_t v35 = [CRDeviceComponent alloc];
  id v37 = objc_msgSend_initWithType_name_spc_fdrKeys_(v35, v36, 1028, @"TouchID", @"IPAD TOUCH ID", &unk_26D1638A8);
  uint64_t v38 = MGGetProductType();
  if (v38 <= 2622433983)
  {
    if (v38 > 851437780)
    {
      if (v38 <= 2487868871)
      {
        if (v38 != 851437781)
        {
          if (v38 != 1434404433)
          {
            uint64_t v39 = 2021146989;
            goto LABEL_28;
          }
LABEL_35:
          long long v43 = [CRDevice alloc];
          long long v42 = v2;
          v68[0] = v2;
          v68[1] = v63;
          v68[2] = v61;
          v68[3] = v60;
          v68[4] = v62;
          v68[5] = v15;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v46, (uint64_t)v68, 6, v57);
          goto LABEL_43;
        }
        goto LABEL_34;
      }
      if (v38 != 2487868872)
      {
        if (v38 != 2566016329)
        {
          if (v38 != 2619317134) {
            goto LABEL_44;
          }
          goto LABEL_30;
        }
        goto LABEL_41;
      }
LABEL_30:
      long long v42 = v2;
      long long v43 = [CRDevice alloc];
      v65[0] = v28;
      v65[1] = v31;
      v65[2] = v34;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v44, (uint64_t)v65, 3, v57);
      uint64_t v52 = LABEL_43:;
      uint64_t v55 = objc_msgSend_initWithComponents_(v43, v53, (uint64_t)v52, v54);
      long long v56 = (void *)qword_26AC133D0;
      qword_26AC133D0 = v55;

      uint64_t v2 = v42;
      goto LABEL_44;
    }
    if (v38 > 555503453)
    {
      if (v38 == 555503454) {
        goto LABEL_30;
      }
      if (v38 != 574536383)
      {
        uint64_t v40 = 810906663;
        goto LABEL_38;
      }
LABEL_34:
      long long v43 = [CRDevice alloc];
      long long v42 = v2;
      v67[0] = v2;
      v67[1] = v63;
      v67[2] = v62;
      v67[3] = v15;
      v67[4] = v59;
      v67[5] = v58;
      v67[6] = v22;
      v67[7] = v25;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v45, (uint64_t)v67, 8, v57);
      goto LABEL_43;
    }
    if (v38 == 133314240) {
      goto LABEL_35;
    }
    uint64_t v41 = 330877086;
LABEL_33:
    if (v38 != v41) {
      goto LABEL_44;
    }
    goto LABEL_34;
  }
  if (v38 > 2940697644)
  {
    if (v38 <= 3241053351)
    {
      if (v38 != 2940697645)
      {
        if (v38 == 2941181571) {
          goto LABEL_35;
        }
        if (v38 != 2959111092) {
          goto LABEL_44;
        }
LABEL_41:
        long long v42 = v2;
        long long v43 = [CRDevice alloc];
        v64[0] = v28;
        v64[1] = v37;
        uint64_t v49 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v50 = v64;
        uint64_t v51 = 2;
        goto LABEL_42;
      }
      goto LABEL_40;
    }
    if (v38 == 3241053352) {
      goto LABEL_30;
    }
    if (v38 != 3677894691)
    {
      uint64_t v39 = 3825599860;
LABEL_28:
      if (v38 != v39) {
        goto LABEL_44;
      }
      goto LABEL_35;
    }
    goto LABEL_39;
  }
  if (v38 > 2688879998)
  {
    if (v38 != 2688879999)
    {
      if (v38 == 2793418701) {
        goto LABEL_35;
      }
      uint64_t v41 = 2795618603;
      goto LABEL_33;
    }
LABEL_40:
    long long v43 = [CRDevice alloc];
    long long v42 = v2;
    v69[0] = v2;
    v69[1] = v63;
    v69[2] = v61;
    v69[3] = v57;
    v69[4] = v15;
    uint64_t v49 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v50 = v69;
    uint64_t v51 = 5;
LABEL_42:
    objc_msgSend_arrayWithObjects_count_(v49, v48, (uint64_t)v50, v51, v57);
    goto LABEL_43;
  }
  if (v38 == 2622433984)
  {
LABEL_39:
    long long v42 = v2;
    long long v43 = [CRDevice alloc];
    int v66 = v28;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v47, (uint64_t)&v66, 1, v57);
    goto LABEL_43;
  }
  uint64_t v40 = 2634105757;
LABEL_38:
  if (v38 == v40) {
    goto LABEL_39;
  }
LABEL_44:
}

void sub_21FC2CDF8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_array(MEMORY[0x263EFF980], a2, a3, a4);
  id v9 = objc_msgSend_currentDevice(*(void **)(a1 + 32), v6, v7, v8);
  uint64_t v13 = v9;
  if (v9)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v14 = objc_msgSend_components(v9, v10, v11, v12, 0);
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v30, (uint64_t)v34, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = *(void *)v31;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v14);
          }
          id v23 = NSNumber;
          uint64_t v24 = objc_msgSend_type(*(void **)(*((void *)&v30 + 1) + 8 * v22), v17, v18, v19);
          uint64_t v27 = objc_msgSend_numberWithUnsignedInt_(v23, v25, v24, v26);
          objc_msgSend_addObject_(v5, v28, (uint64_t)v27, v29);

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v30, (uint64_t)v34, 16);
      }
      while (v20);
    }

    objc_storeStrong((id *)&qword_26AC133E8, v5);
  }
}

void sub_21FC2E080(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_21FC2E304(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  qword_26AC13450 = objc_msgSend__init(v1, v2, v3, v4);
  return MEMORY[0x270F9A758]();
}

void sub_21FC2E7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21FC2E7E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21FC2E7F0(uint64_t a1)
{
}

void sub_21FC2E7F8(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

void sub_21FC2EC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21FC2EC80(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = a4;
  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[7] + 8) + 40));
}

void sub_21FC2F604(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend__getDataClassesFromSealingMap(*(void **)(a1 + 32), a2, a3, a4);
  id v10 = v4;
  if (v4)
  {
    id v8 = v4;
  }
  else
  {
    objc_msgSend_set(MEMORY[0x263EFFA08], v5, v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = (void *)qword_26AC13468;
  qword_26AC13468 = (uint64_t)v8;
}

void sub_21FC330D4(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = a1;
    __int16 v7 = 2080;
    uint64_t v8 = a2;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "%s: %s", (uint8_t *)&v5, 0x16u);
  }
}

id sub_21FC3465C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_SHA256DigestData(a1, a2, a3, a4);
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = objc_msgSend_convertToHexString(v4, v5, v6, v7);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id sub_21FC346B8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  memset(&v31, 0, sizeof(v31));
  *(_OWORD *)md = 0u;
  long long v33 = 0u;
  if (!a1)
  {
    uint64_t v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC64184();
    }
    goto LABEL_10;
  }
  uint64_t v4 = (void *)MEMORY[0x263F08840];
  int v5 = objc_msgSend_path(a1, a2, a3, a4, *(_OWORD *)v31.count, *(_OWORD *)&v31.hash[2], *(_OWORD *)&v31.hash[6], *(_OWORD *)&v31.wbuf[2], *(_OWORD *)&v31.wbuf[6], *(_OWORD *)&v31.wbuf[10], *(void *)&v31.wbuf[14]);
  uint64_t v8 = objc_msgSend_fileHandleForReadingAtPath_(v4, v6, (uint64_t)v5, v7);

  if (!v8)
  {
    uint64_t v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC641B8();
    }
LABEL_10:

    uint64_t v8 = 0;
    uint64_t v28 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = CC_SHA256_Init(&v31);
  do
  {
    id v10 = (void *)MEMORY[0x223C5C2A0](v9);
    objc_msgSend_readDataOfLength_(v8, v11, 1024, v12);
    id v13 = objc_claimAutoreleasedReturnValue();
    uint64_t v17 = (const void *)objc_msgSend_bytes(v13, v14, v15, v16);
    CC_LONG v21 = objc_msgSend_length(v13, v18, v19, v20);
    CC_SHA256_Update(&v31, v17, v21);
    uint64_t v25 = objc_msgSend_length(v13, v22, v23, v24);
  }
  while (v25);
  CC_SHA256_Final(md, &v31);
  id v26 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v28 = objc_msgSend_initWithBytes_length_(v26, v27, (uint64_t)md, 32);
LABEL_11:

  return v28;
}

id sub_21FC3485C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  memset(&v31, 0, sizeof(v31));
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)md = 0u;
  if (!a1)
  {
    uint64_t v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC64184();
    }
    goto LABEL_10;
  }
  uint64_t v4 = (void *)MEMORY[0x263F08840];
  objc_msgSend_path(a1, a2, a3, a4, *(_OWORD *)v31.count, *(_OWORD *)v31.hash, *(_OWORD *)&v31.hash[2], *(_OWORD *)&v31.hash[4], *(_OWORD *)&v31.hash[6], *(_OWORD *)v31.wbuf, *(_OWORD *)&v31.wbuf[2], *(_OWORD *)&v31.wbuf[4], *(_OWORD *)&v31.wbuf[6], *(_OWORD *)&v31.wbuf[8], *(_OWORD *)&v31.wbuf[10], *(_OWORD *)&v31.wbuf[12], *(_OWORD *)&v31.wbuf[14], *(void *)md, *(void *)&md[8],
    v33,
  int v5 = v34);
  uint64_t v8 = objc_msgSend_fileHandleForReadingAtPath_(v4, v6, (uint64_t)v5, v7);

  if (!v8)
  {
    uint64_t v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC641B8();
    }
LABEL_10:

    uint64_t v8 = 0;
    uint64_t v28 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = CC_SHA384_Init(&v31);
  do
  {
    id v10 = (void *)MEMORY[0x223C5C2A0](v9);
    objc_msgSend_readDataOfLength_(v8, v11, 1024, v12);
    id v13 = objc_claimAutoreleasedReturnValue();
    uint64_t v17 = (const void *)objc_msgSend_bytes(v13, v14, v15, v16);
    CC_LONG v21 = objc_msgSend_length(v13, v18, v19, v20);
    CC_SHA384_Update(&v31, v17, v21);
    uint64_t v25 = objc_msgSend_length(v13, v22, v23, v24);
  }
  while (v25);
  CC_SHA384_Final(md, &v31);
  id v26 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v28 = objc_msgSend_initWithBytes_length_(v26, v27, (uint64_t)md, 48);
LABEL_11:

  return v28;
}

id sub_21FC36CAC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_SHA256DigestData(a1, a2, a3, a4);
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = objc_msgSend_convertToHexString(v4, v5, v6, v7);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id sub_21FC36D08(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  if (a1)
  {
    id v1 = a1;
    int v5 = (const void *)objc_msgSend_bytes(v1, v2, v3, v4, v15, v16);
    CC_LONG v9 = objc_msgSend_length(v1, v6, v7, v8);
    CC_SHA256(v5, v9, (unsigned __int8 *)&v15);
    id v10 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v12 = objc_msgSend_initWithBytes_length_(v10, v11, (uint64_t)&v15, 32);
  }
  else
  {
    id v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC643B4(v13);
    }

    uint64_t v12 = 0;
  }
  return v12;
}

id sub_21FC36DE4(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  if (a1)
  {
    id v1 = a1;
    int v5 = (const void *)objc_msgSend_bytes(v1, v2, v3, v4, v15, v16, v17);
    CC_LONG v9 = objc_msgSend_length(v1, v6, v7, v8);
    CC_SHA384(v5, v9, (unsigned __int8 *)&v15);
    id v10 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v12 = objc_msgSend_initWithBytes_length_(v10, v11, (uint64_t)&v15, 48);
  }
  else
  {
    id v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC643B4(v13);
    }

    uint64_t v12 = 0;
  }
  return v12;
}

id sub_21FC36EC4(void *a1, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  id v8 = a4;
  uint64_t v11 = objc_msgSend_objectForKey_(a1, v9, a3, v10);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
    }
    else
    {
      id v13 = v8;

      if (a5) {
        *a5 = 1;
      }
    }
  }
  else
  {
    id v13 = v8;
  }

  return v13;
}

id sub_21FC36F74(void *a1, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  id v8 = a4;
  uint64_t v11 = objc_msgSend_objectForKey_(a1, v9, a3, v10);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
    }
    else
    {
      id v13 = v8;

      if (a5) {
        *a5 = 1;
      }
    }
  }
  else
  {
    id v13 = v8;
  }

  return v13;
}

id sub_21FC37024(void *a1, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  id v8 = a4;
  uint64_t v11 = objc_msgSend_objectForKey_(a1, v9, a3, v10);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
    }
    else
    {
      id v13 = v8;

      if (a5) {
        *a5 = 1;
      }
    }
  }
  else
  {
    id v13 = v8;
  }

  return v13;
}

id sub_21FC370D4(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, unsigned char *a6)
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v13 = objc_msgSend_NSStringFromKey_defaultValue_failed_(a1, v12, a3, (uint64_t)v11, a6);
  if (v13)
  {
    long long v16 = (void *)v13;
    if (objc_msgSend_containsObject_(v10, v14, v13, v15))
    {
      id v17 = v16;
    }
    else
    {
      id v17 = v11;

      if (a6) {
        *a6 = 1;
      }
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

id sub_21FC37194(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, unsigned char *a7)
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a3;
  NSLog(&cfstr_UtilityCalled.isa);
  uint64_t v18 = objc_msgSend_objectForKey_(a1, v16, (uint64_t)v15, v17);

  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (uint64_t v21 = objc_msgSend_compare_(v18, v19, (uint64_t)v13, v20),
          (unint64_t)objc_msgSend_compare_(v18, v22, (uint64_t)v12, v23) <= 1)
      && (unint64_t)(v21 + 1) < 2)
    {
      id v24 = v18;
    }
    else
    {
      id v24 = v14;

      if (a7) {
        *a7 = 1;
      }
    }
  }
  else
  {
    id v24 = v14;
  }

  return v24;
}

uint64_t sub_21FC372BC(void *a1, const char *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v6 = a4;
  uint64_t v7 = objc_msgSend_objectForKey_(a1, a2, a3, a4);
  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = objc_msgSend_BOOLValue(v7, v8, v9, v10);
    }
    else if (a5)
    {
      *a5 = 1;
    }
  }

  return v6;
}

id sub_21FC37330(void *a1, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  id v8 = a4;
  uint64_t v11 = objc_msgSend_objectForKey_(a1, v9, a3, v10);
  if (v11)
  {
    id v12 = (void *)v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
    }
    else
    {
      id v13 = v8;

      if (a5) {
        *a5 = 1;
      }
    }
  }
  else
  {
    id v13 = v8;
  }

  return v13;
}

id sub_21FC373E0(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v10 = a4;
  id v12 = objc_msgSend_NSDictionaryFromKey_defaultValue_failed_(a1, v11, a3, a5, a6);
  long long v16 = v12;
  if (v12)
  {
    uint64_t v17 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v18 = objc_msgSend_allKeys(v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_setWithArray_(v17, v19, (uint64_t)v18, v20);

    objc_msgSend_intersectSet_(v21, v22, (uint64_t)v10, v23);
    uint64_t v27 = objc_msgSend_allObjects(v21, v24, v25, v26);
    long long v30 = objc_msgSend_dictionaryWithValuesForKeys_(v16, v28, (uint64_t)v27, v29);
  }
  else
  {
    long long v30 = 0;
  }

  return v30;
}

uint64_t sub_21FC374D0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_validator_(a1, a2, a3, a4, a5, a6, a7, &unk_26D1578C8);
}

uint64_t sub_21FC374DC()
{
  return 1;
}

id sub_21FC374E4(void *a1, uint64_t a2, uint64_t a3, void *a4, unint64_t a5, void *a6, unsigned char *a7, void *a8)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a6;
  long long v16 = a8;
  uint64_t v19 = objc_msgSend_objectForKey_(a1, v17, a3, v18);
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_count(v20, v21, v22, v23) <= a5)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v24 = v20;
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v38, (uint64_t)v42, 16);
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v39;
        uint64_t v37 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v39 != v28) {
              objc_enumerationMutation(v24);
            }
            uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            uint64_t v31 = objc_opt_class();
            if (!v31) {
              goto LABEL_19;
            }
            Superclass = (objc_class *)v31;
            while ((objc_msgSend_containsObject_(v14, v32, (uint64_t)Superclass, v33, v37) & 1) == 0)
            {
              Superclass = class_getSuperclass(Superclass);
              if (!Superclass) {
                goto LABEL_19;
              }
            }
            if (!v16[2](v16, v30))
            {
LABEL_19:

              goto LABEL_20;
            }
            uint64_t v28 = v37;
          }
          uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v35, (uint64_t)&v38, (uint64_t)v42, 16);
          if (v27) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
LABEL_20:
      id v24 = v15;

      if (a7) {
        *a7 = 1;
      }
    }
  }
  else
  {
    id v24 = v15;
  }

  return v24;
}

id sub_21FC376F0(void *a1, uint64_t a2, uint64_t a3, void *a4, unint64_t a5, void *a6, unsigned char *a7)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a6;
  uint64_t v16 = objc_msgSend_objectForKey_(a1, v14, a3, v15);
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_count(v17, v18, v19, v20) <= a5)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v21 = v17;
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v30, (uint64_t)v34, 16);
      if (v23)
      {
        uint64_t v26 = v23;
        uint64_t v27 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v31 != v27) {
              objc_enumerationMutation(v21);
            }
            if (!objc_msgSend_containsObject_(v12, v24, *(void *)(*((void *)&v30 + 1) + 8 * i), v25, (void)v30))
            {

              goto LABEL_15;
            }
          }
          uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v30, (uint64_t)v34, 16);
          if (v26) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
LABEL_15:
      id v21 = v13;

      if (a7) {
        *a7 = 1;
      }
    }
  }
  else
  {
    id v21 = v13;
  }

  return v21;
}

__CFString *sub_21FC378A0(void *a1, const char *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  objc_msgSend_NSStringFromKey_defaultValue_failed_(a1, a2, a3, 0);
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (a5) {
      *a5 = 1;
    }
    uint64_t v6 = &stru_26D158688;
  }
  return v6;
}

id sub_21FC378F4(void *a1, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  id v8 = a4;
  id v13 = objc_msgSend_NSStringFromKey_inSet_defaultValue_failed_(a1, v9, a3, (uint64_t)v8, 0, a5);
  if (!v13)
  {
    id v13 = objc_msgSend_anyObject(v8, v10, v11, v12);
    if (a5) {
      *a5 = 1;
    }
  }

  return v13;
}

id sub_21FC37984(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unsigned char *a6)
{
  id v10 = a4;
  objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(a1, v11, a3, (uint64_t)v10, a5, 0, a6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    id v12 = v10;
    if (a6) {
      *a6 = 1;
    }
  }

  return v12;
}

uint64_t sub_21FC37A1C(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v10 = objc_msgSend_objectForKey_(a1, v7, (uint64_t)v6, v8);
  if (v10)
  {
    uint64_t v11 = objc_msgSend_BOOLFromKey_defaultValue_failed_(a1, v9, (uint64_t)v6, 0, a4);
  }
  else
  {
    uint64_t v11 = 0;
    if (a4) {
      *a4 = 1;
    }
  }

  return v11;
}

id sub_21FC37AA0(void *a1, const char *a2, uint64_t a3, unsigned char *a4)
{
  int v5 = objc_msgSend_NSDictionaryFromKey_defaultValue_failed_(a1, a2, a3, 0, a4);
  if (!v5)
  {
    if (a4) {
      *a4 = 1;
    }
    int v5 = (void *)MEMORY[0x263EFFA78];
  }
  return v5;
}

id sub_21FC37AF8(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a4;
  id v10 = objc_msgSend_NSDictionaryFromRequiredKey_failed_(a1, v9, a3, a5);
  id v14 = v10;
  if (v10)
  {
    uint64_t v15 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v16 = objc_msgSend_allKeys(v10, v11, v12, v13);
    uint64_t v19 = objc_msgSend_setWithArray_(v15, v17, (uint64_t)v16, v18);

    objc_msgSend_intersectSet_(v19, v20, (uint64_t)v8, v21);
    uint64_t v25 = objc_msgSend_allObjects(v19, v22, v23, v24);
    uint64_t v28 = objc_msgSend_dictionaryWithValuesForKeys_(v14, v26, (uint64_t)v25, v27);
  }
  else
  {
    uint64_t v28 = (void *)MEMORY[0x263EFFA78];
  }

  return v28;
}

id sub_21FC37BE4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v7 = objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_(a1, a2, a3, a4, a5, 0, a6);
  if (!v7)
  {
    if (a6) {
      *a6 = 1;
    }
    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }
  return v7;
}

id sub_21FC37C3C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6, uint64_t a7)
{
  id v8 = objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_validator_(a1, a2, a3, a4, a5, 0, a6, a7);
  if (!v8)
  {
    if (a6) {
      *a6 = 1;
    }
    id v8 = (void *)MEMORY[0x263EFFA68];
  }
  return v8;
}

id sub_21FC37C98(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v7 = objc_msgSend_NSArrayFromKey_inSet_maxLength_defaultValue_failed_(a1, a2, a3, a4, a5, 0, a6);
  if (!v7)
  {
    if (a6) {
      *a6 = 1;
    }
    uint64_t v7 = (void *)MEMORY[0x263EFFA68];
  }
  return v7;
}

CFDataRef sub_21FC39D24(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = a2;
  int v5 = v2;
  uint64_t v24 = 0;
  memset(v23, 0, sizeof(v23));
  CFIndex v21 = 0;
  uint64_t v22 = 0;
  if (!v2)
  {
    uint64_t v20 = handleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C50();
    }
    goto LABEL_14;
  }
  id v6 = objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x263F8BF18], v4);
  if (!v6)
  {
    uint64_t v20 = handleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C84();
    }
LABEL_14:
    id v7 = 0;
    goto LABEL_21;
  }
  id v7 = v6;
  uint64_t v11 = objc_msgSend_bytes(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_length(v7, v12, v13, v14);
  if (sub_21FC53204(v11, v15, (uint64_t)v23))
  {
    uint64_t v20 = handleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21FC64D20();
    }
  }
  else
  {
    sub_21FC52FC8((uint64_t)v23, 1718903152, 1145525076, &v22, &v21);
    if (v16)
    {
      uint64_t v20 = handleForCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_21FC64CEC();
      }
    }
    else
    {
      CFDataRef v17 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v22, v21);
      if (v17)
      {
        CFDataRef v18 = v17;
        goto LABEL_7;
      }
      uint64_t v20 = handleForCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_21FC64CB8();
      }
    }
  }
LABEL_21:

  CFDataRef v18 = 0;
LABEL_7:

  return v18;
}

id sub_21FC39F40(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = (void *)MGCopyAnswer();
  id v7 = (void *)MGCopyAnswer();
  v26[0] = 0;
  v26[1] = 0;
  int v27 = 0;
  v24[0] = *MEMORY[0x263F8BFC8];
  id v8 = v2;
  if (!v2) {
    id v8 = objc_opt_new();
  }
  uint64_t v9 = *MEMORY[0x263F8BFF0];
  v25[0] = v8;
  v25[1] = MEMORY[0x263EFFA88];
  uint64_t v10 = *MEMORY[0x263F8BFD0];
  v24[1] = v9;
  v24[2] = v10;
  uint64_t v11 = v7;
  if (!v7)
  {
    uint64_t v11 = objc_msgSend_null(MEMORY[0x263EFF9D0], v4, v5, v6);
  }
  v25[2] = v11;
  v24[3] = *MEMORY[0x263F8BFD8];
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = objc_msgSend_null(MEMORY[0x263EFF9D0], v4, v5, v6);
  }
  v25[3] = v12;
  uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v4, (uint64_t)v25, (uint64_t)v24, 4);
  if (v3)
  {
    if (v7) {
      goto LABEL_9;
    }
  }
  else
  {

    if (v7)
    {
LABEL_9:
      if (v2) {
        goto LABEL_10;
      }
LABEL_20:

      if (v14) {
        goto LABEL_11;
      }
      goto LABEL_21;
    }
  }

  if (!v2) {
    goto LABEL_20;
  }
LABEL_10:
  if (v14)
  {
LABEL_11:
    CFDataRef v18 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v13, (uint64_t)v26, 20, *MEMORY[0x263F8BED8], *MEMORY[0x263F8BF50], v14);
    uint64_t v19 = v18;
    if (!v18)
    {
      uint64_t v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v15, v16, v17);
    }
    v23[1] = v19;
    uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v23, (uint64_t)&v22, 2);
    if (!v18) {

    }
    goto LABEL_15;
  }
LABEL_21:
  CFDataRef v18 = handleForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_21FC64D54();
  }
  uint64_t v20 = 0;
LABEL_15:

  return v20;
}

id sub_21FC3A1A4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v5 = v2;
  if (v2)
  {
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x263F8BF18], v4);
    if (v6) {
      goto LABEL_3;
    }
    id v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C84();
    }
  }
  else
  {
    id v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C50();
    }
  }

  uint64_t v6 = 0;
LABEL_3:

  return v6;
}

id sub_21FC3A258()
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v0 = (void *)MGCopyAnswer();
  id v1 = (void *)MGCopyAnswer();
  v71[0] = 0;
  v71[1] = 0;
  int v72 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v70 = 0;
  memset(v69, 0, sizeof(v69));
  id v2 = objc_opt_new();
  id v58 = 0;
  uint64_t v5 = objc_msgSend_getPathForApTicketWithError_(v2, v3, (uint64_t)&v58, v4);
  id v6 = v58;

  if (!v5 || v6)
  {
    uint64_t v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC64D88();
    }
    goto LABEL_13;
  }
  uint64_t v9 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v7, (uint64_t)v5, v8);
  uint64_t v13 = v9;
  if (!v9 || !objc_msgSend_length(v9, v10, v11, v12))
  {
    uint64_t v22 = handleForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_21FC64DBC();
    }
    goto LABEL_12;
  }
  uint64_t v13 = v13;
  uint64_t v17 = objc_msgSend_bytes(v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_length(v13, v18, v19, v20);
  if (sub_21FC53204(v17, v21, (uint64_t)v69))
  {
    uint64_t v22 = handleForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_21FC64F28();
    }
    goto LABEL_12;
  }
  sub_21FC52FC8((uint64_t)v69, 1296125520, 1819244133, &v62, &v61);
  if (v27)
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21FC64EC0();
    }

    goto LABEL_13;
  }
  uint64_t v29 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v26, v62, v61);
  if (!v29)
  {
    uint64_t v22 = handleForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_21FC64DF0();
    }
    goto LABEL_12;
  }
  uint64_t v22 = v29;
  id v30 = [NSString alloc];
  long long v32 = objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v22, 4);
  long long v33 = handleForCategory(0);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v32;
    _os_log_impl(&dword_21FBF2000, v33, OS_LOG_TYPE_DEFAULT, "OS version String:%@", buf, 0xCu);
  }

  sub_21FC52FC8((uint64_t)v69, 1936027753, 1145525076, &v60, &v59);
  if (v35)
  {
    uint64_t v36 = handleForCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_21FC64E58();
    }

LABEL_28:
LABEL_12:

LABEL_13:
    uint64_t v23 = 0;
    id v24 = 0;
    goto LABEL_14;
  }
  uint64_t v37 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v34, v60, v59);
  if (!v37)
  {
    id v53 = handleForCategory(0);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_21FC64E24();
    }

    goto LABEL_28;
  }
  uint64_t v41 = *MEMORY[0x263F8BFF0];
  v65[0] = *MEMORY[0x263F8BFC8];
  v65[1] = v41;
  long long v56 = (void *)v37;
  v66[0] = v37;
  v66[1] = MEMORY[0x263EFFA88];
  v65[2] = *MEMORY[0x263F8BFD0];
  long long v42 = v1;
  if (!v1)
  {
    long long v42 = objc_msgSend_null(MEMORY[0x263EFF9D0], v38, v39, v40);
  }
  long long v57 = v32;
  v66[2] = v42;
  void v65[3] = *MEMORY[0x263F8BFD8];
  uint64_t v43 = v0;
  if (!v0)
  {
    uint64_t v43 = objc_msgSend_null(MEMORY[0x263EFF9D0], v38, v39, v40);
  }
  v66[3] = v43;
  uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)v66, (uint64_t)v65, 4);
  if (!v0) {

  }
  if (!v1) {
  uint64_t v45 = *MEMORY[0x263F8BEE8];
  }
  v64[0] = v23;
  uint64_t v46 = *MEMORY[0x263F8BF50];
  v63[0] = v45;
  v63[1] = v46;
  uint64_t v47 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v44, (uint64_t)v71, 20);
  uint64_t v51 = (void *)v47;
  if (!v47)
  {
    uint64_t v47 = objc_msgSend_null(MEMORY[0x263EFF9D0], v48, v49, v50);
  }
  uint64_t v54 = (void *)v47;
  v64[1] = v47;
  v63[2] = *MEMORY[0x263F8BF28];
  uint64_t v52 = v57;
  if (!v57)
  {
    uint64_t v52 = objc_msgSend_null(MEMORY[0x263EFF9D0], v48, v49, v50);
  }
  v63[3] = @"Ap,Timestamp";
  void v64[2] = v52;
  v64[3] = &unk_26D163338;
  uint64_t v55 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v48, (uint64_t)v64, (uint64_t)v63, 4);
  if (!v57) {

  }
  if (!v51) {
  id v24 = v55;
  }

LABEL_14:
  return v24;
}

id sub_21FC3A7EC(uint64_t a1, void *a2)
{
  v31[5] = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)MGCopyAnswer();
  uint64_t v5 = (void *)MGCopyAnswer();
  uint64_t v6 = MGCopyAnswer();
  uint64_t v9 = (void *)v6;
  if (!v2)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC64F5C();
    }
    goto LABEL_16;
  }
  if (!v6)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC64F90();
    }
    goto LABEL_16;
  }
  uint64_t v10 = objc_msgSend_fileURLWithPath_(NSURL, v7, (uint64_t)v2, v8);
  uint64_t v14 = objc_msgSend_SHA384DigestData(v10, v11, v12, v13);

  if (v14 && objc_msgSend_length(v14, v15, v16, v17))
  {
    uint64_t v21 = *MEMORY[0x263F8BFF0];
    v30[0] = *MEMORY[0x263F8BFC8];
    v30[1] = v21;
    v31[0] = v14;
    v31[1] = MEMORY[0x263EFFA88];
    v30[2] = *MEMORY[0x263F8BFD0];
    uint64_t v22 = v5;
    if (!v5)
    {
      uint64_t v22 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v19, v20);
    }
    v31[2] = v22;
    v30[3] = *MEMORY[0x263F8BFD8];
    uint64_t v23 = v4;
    if (!v4)
    {
      uint64_t v23 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v19, v20);
    }
    v30[4] = @"Name";
    v31[3] = v23;
    v31[4] = @"FactoryDiskImage";
    uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v31, (uint64_t)v30, 5);
    if (v4)
    {
      if (v5)
      {
LABEL_11:
        objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v9, *MEMORY[0x263F8BF50]);
        if (v25)
        {
          objc_msgSend_setObject_forKeyedSubscript_(v3, v26, v25, @"PersonalizedDMG");
          id v27 = v3;

          uint64_t v14 = v25;
          goto LABEL_17;
        }
        uint64_t v28 = handleForCategory(0);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_21FC64FF8();
        }
        goto LABEL_15;
      }
    }
    else
    {

      if (v5) {
        goto LABEL_11;
      }
    }

    goto LABEL_11;
  }
  uint64_t v28 = handleForCategory(0);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_21FC64FC4();
  }
LABEL_15:

LABEL_16:
  id v27 = 0;
LABEL_17:

  return v27;
}

id sub_21FC3AADC(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v5 = v2;
  if (v2)
  {
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x263F8BF18], v4);
    if (v6) {
      goto LABEL_3;
    }
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C84();
    }
  }
  else
  {
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C50();
    }
  }

  uint64_t v6 = 0;
LABEL_3:

  return v6;
}

NSObject *sub_21FC3AB90(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  if (!v3)
  {
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC6502C();
    }
    goto LABEL_18;
  }
  uint64_t v27 = qword_267EF7F58;
  uint64_t v23 = qword_267EF7F68;
  id v24 = @"FirmwareMap.plist";
  uint64_t v25 = qword_267EF7F60;
  uint64_t v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v2, (uint64_t)&v24, (uint64_t)&v23, 1);
  uint64_t v26 = v4;
  uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)&v26, (uint64_t)&v25, 1);
  v28[0] = v6;
  uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v28, (uint64_t)&v27, 1);

  uint64_t v9 = handleForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v8;
    _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "buildIdentityDict is %@", buf, 0xCu);
  }

  if (!v8)
  {
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC65060();
    }
    goto LABEL_18;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v8, @"BuildIdentity");
  uint64_t v11 = handleForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v11, OS_LOG_TYPE_DEFAULT, "Creating Firmware Digest", buf, 2u);
  }

  if (!MEMORY[0x263F904F8])
  {
    uint64_t v13 = 0;
    goto LABEL_15;
  }
  uint64_t v13 = (void *)T200UpdaterCopyFirmwareWithLogging();
  if (!v13)
  {
LABEL_15:
    CFDataRef v18 = handleForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_21FC65094();
    }

LABEL_18:
    uint64_t v17 = 0;
    goto LABEL_23;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v13, @"FirmwareData");
  uint64_t v14 = handleForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v3;
    _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, "Input Dictionary: %@", buf, 0xCu);
  }

  if (MEMORY[0x263F90500])
  {
    RequestWithLogging = T200UpdaterCreateRequestWithLogging();
    uint64_t v16 = RequestWithLogging;
    if (RequestWithLogging)
    {
      uint64_t v17 = RequestWithLogging;

      uint64_t v8 = v17;
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v19 = handleForCategory(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_21FC65108();
  }

  uint64_t v17 = 0;
  uint64_t v8 = v16;
LABEL_23:

  return v17;
}

void sub_21FC3AF34(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = a1;
    __int16 v7 = 2080;
    uint64_t v8 = a2;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "%s : %s", (uint8_t *)&v5, 0x16u);
  }
}

id sub_21FC3AFF4(uint64_t a1, void *a2)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v63 = 0;
  uint64_t v79 = 0;
  memset(v78, 0, sizeof(v78));
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  uint64_t v3 = objc_opt_new();
  uint64_t v6 = v3;
  if (!v2)
  {
    __int16 v7 = handleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_21FC6502C();
    }
    goto LABEL_15;
  }
  id v60 = 0;
  __int16 v7 = objc_msgSend_getPathForApTicketWithError_(v3, v4, (uint64_t)&v60, v5);
  id v8 = v60;
  id v11 = v8;
  if (!v7 || v8)
  {
    id v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC64D88();
    }
    goto LABEL_13;
  }
  uint64_t v12 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v9, (uint64_t)v7, v10);
  id v11 = v12;
  if (!v12 || !objc_msgSend_length(v12, v13, v14, v15))
  {
    id v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC64DBC();
    }
    goto LABEL_13;
  }
  id v11 = v11;
  uint64_t v19 = objc_msgSend_bytes(v11, v16, v17, v18);
  uint64_t v23 = objc_msgSend_length(v11, v20, v21, v22);
  if (sub_21FC53204(v19, v23, (uint64_t)v78))
  {
    id v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC64F28();
    }
LABEL_13:

LABEL_14:
LABEL_15:
    uint64_t v25 = 0;
    goto LABEL_16;
  }
  sub_21FC52FC8((uint64_t)v78, 1936027753, 1145525076, &v62, &v61);
  if (v28)
  {
    uint64_t v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC64E58();
    }

    goto LABEL_14;
  }
  uint64_t v30 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v27, v62, v61);
  if (!v30)
  {
    id v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC6517C();
    }
    goto LABEL_13;
  }
  uint64_t v59 = (void *)v30;
  v76[0] = @"Savage,BA-Prod-Patch";
  uint64_t v72 = qword_267EF7F68;
  uint64_t v73 = @"Savage.fw";
  uint64_t v74 = qword_267EF7F60;
  long long v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v31, (uint64_t)&v73, (uint64_t)&v72, 1);
  v75 = v32;
  long long v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v33, (uint64_t)&v75, (uint64_t)&v74, 1);
  v77[0] = v34;
  v76[1] = @"Savage,BE-Prod-Patch";
  uint64_t v69 = @"Savage.fw";
  uint64_t v70 = qword_267EF7F60;
  uint64_t v68 = qword_267EF7F68;
  uint64_t v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)&v69, (uint64_t)&v68, 1);
  v71 = v36;
  long long v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v37, (uint64_t)&v71, (uint64_t)&v70, 1);
  uint64_t v39 = *MEMORY[0x263F90370];
  v77[1] = v38;
  v77[2] = @"0x01";
  uint64_t v40 = *MEMORY[0x263F903F8];
  v76[2] = v39;
  v76[3] = v40;
  v77[3] = @"0x00";
  long long v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v41, (uint64_t)v77, (uint64_t)v76, 4);

  if (!v42)
  {
    long long v56 = handleForCategory(0);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_21FC65060();
    }

    goto LABEL_14;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v2, v43, (uint64_t)v42, @"BuildIdentity");
  long long v44 = handleForCategory(0);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v44, OS_LOG_TYPE_DEFAULT, "Creating Firmware Digest", buf, 2u);
  }

  uint64_t v46 = SavageUpdaterCopyFirmwareWithLogging();
  if (!v46 || v63)
  {
    long long v57 = handleForCategory(0);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_21FC65094();
    }

    uint64_t v25 = 0;
    __int16 v7 = v46;
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v2, v45, (uint64_t)v46, @"FirmwareData");
    uint64_t v47 = handleForCategory(0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v2;
      _os_log_impl(&dword_21FBF2000, v47, OS_LOG_TYPE_DEFAULT, "Input Dictionary: %@", buf, 0xCu);
    }

    RequestWithLogging = SavageUpdaterCreateRequestWithLogging();
    uint64_t v52 = RequestWithLogging;
    if (!RequestWithLogging || v63)
    {
      id v58 = handleForCategory(0);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        sub_21FC65108();
      }

      uint64_t v25 = 0;
    }
    else
    {
      uint64_t v25 = objc_msgSend_mutableCopy(RequestWithLogging, v49, v50, v51);
      uint64_t v64 = qword_267EF7F78;
      uint64_t v65 = v59;
      uint64_t v54 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v53, (uint64_t)&v65, (uint64_t)&v64, 1);
      objc_msgSend_setObject_forKeyedSubscript_(v25, v55, (uint64_t)v54, qword_267EF7F70);
    }
    __int16 v7 = v52;
  }
LABEL_16:

  return v25;
}

id sub_21FC3B650(uint64_t a1, void *a2)
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v117 = 0;
  uint64_t v118 = 0;
  uint64_t v116 = 0;
  v107 = objc_opt_new();
  uint64_t v129 = 0;
  memset(v128, 0, sizeof(v128));
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)MGCopyAnswer();
  int v8 = objc_msgSend_intValue(v4, v5, v6, v7);

  v105 = v2;
  if (!v2)
  {
    v106 = handleForCategory(0);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
      sub_21FC6502C();
    }
    uint64_t v69 = 0;
    uint64_t v15 = 0;
    v104 = 0;
    v84 = 0;
    uint64_t v22 = 0;
    id v11 = 0;
    goto LABEL_55;
  }
  id v115 = 0;
  id v11 = objc_msgSend_getPathForApTicketWithError_(v3, v9, (uint64_t)&v115, v10);
  id v12 = v115;
  uint64_t v15 = v12;
  if (!v11 || v12)
  {
    v106 = handleForCategory(0);
    if (!os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      uint64_t v69 = 0;
      v104 = 0;
      v84 = 0;
      uint64_t v22 = 0;
LABEL_55:
      v102 = 0;
      v103 = 0;
      id v65 = 0;
      v76 = 0;
      id RequestWithLogging = 0;
      v83 = 0;
      goto LABEL_44;
    }
    sub_21FC64D88();
LABEL_59:
    uint64_t v69 = 0;
    v104 = 0;
    v84 = 0;
    uint64_t v22 = 0;
    goto LABEL_55;
  }
  if (v8 == 3)
  {
    uint64_t v114 = 0;
    uint64_t v16 = (id *)&v114;
    uint64_t v17 = objc_msgSend_getPathForBorsFirmwareWithError_(v3, v13, (uint64_t)&v114, v14);
  }
  else
  {
    uint64_t v113 = 0;
    uint64_t v16 = (id *)&v113;
    uint64_t v17 = objc_msgSend_getPathForSavageFirmwareWithError_(v3, v13, (uint64_t)&v113, v14);
  }
  uint64_t v18 = v17;
  id v19 = *v16;
  uint64_t v15 = v19;
  v106 = v18;
  if (!v18 || v19)
  {
    v93 = handleForCategory(0);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      sub_21FC651B0();
    }

    goto LABEL_59;
  }
  uint64_t v22 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v20, (uint64_t)v11, v21);
  if (!objc_msgSend_length(v22, v23, v24, v25))
  {
    v94 = handleForCategory(0);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
      sub_21FC64DBC();
    }

LABEL_68:
    uint64_t v69 = 0;
    uint64_t v15 = 0;
    v104 = 0;
    v84 = 0;
    goto LABEL_55;
  }
  id v26 = v22;
  uint64_t v30 = objc_msgSend_bytes(v26, v27, v28, v29);
  id v101 = v26;
  uint64_t v34 = objc_msgSend_length(v26, v31, v32, v33);
  if (!sub_21FC53204(v30, v34, (uint64_t)v128))
  {
    sub_21FC52FC8((uint64_t)v128, 1936027753, 1145525076, &v118, &v116);
    if (!v36)
    {
      uint64_t v37 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v35, v118, v116);
      if (v37)
      {
        uint64_t v39 = (void *)v37;
        v100 = v11;
        uint64_t v125 = v37;
        v126 = @"SEP";
        v124 = @"Digest";
        uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)&v125, (uint64_t)&v124, 1);
        v127 = v40;
        uint64_t v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v41, (uint64_t)&v127, (uint64_t)&v126, 1);

        v99 = (void *)v42;
        objc_msgSend_setObject_forKeyedSubscript_(v2, v43, v42, @"ReceiptManifest");
        uint64_t v44 = *MEMORY[0x263F903F8];
        v122[0] = *MEMORY[0x263F90370];
        v122[1] = v44;
        v123[0] = @"0x01";
        v123[1] = @"0x00";
        uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v45, (uint64_t)v123, (uint64_t)v122, 2);
        objc_msgSend_setObject_forKeyedSubscript_(v2, v47, v46, @"BuildIdentity");
        Tags = (void *)SavageUpdaterGetTags();
        uint64_t v49 = v117;
        uint64_t v50 = handleForCategory(0);
        uint64_t v51 = v50;
        v103 = (void *)v46;
        v104 = v39;
        v102 = Tags;
        if (!Tags || v49)
        {
          id v11 = v100;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            sub_21FC65218();
          }

          uint64_t v69 = 0;
          uint64_t v15 = 0;
          id v65 = 0;
          v76 = 0;
          id RequestWithLogging = 0;
          v83 = 0;
          goto LABEL_43;
        }
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v121 = Tags;
          _os_log_impl(&dword_21FBF2000, v51, OS_LOG_TYPE_DEFAULT, "Savage updater tags: %@", buf, 0xCu);
        }
        v98 = v3;

        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        objc_msgSend_objectForKeyedSubscript_(Tags, v52, @"BuildIdentityTags", v53);
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v109, (uint64_t)v119, 16);
        if (v55)
        {
          uint64_t v58 = v55;
          uint64_t v59 = 0;
          id v60 = 0;
          uint64_t v61 = 0;
          uint64_t v62 = *(void *)v110;
          while (2)
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              if (*(void *)v110 != v62) {
                objc_enumerationMutation(obj);
              }
              uint64_t v64 = *(void **)(*((void *)&v109 + 1) + 8 * i);
              if (objc_msgSend_containsString_(v64, v56, @"-Patch", v57, v98))
              {
                id v65 = v64;

                int v66 = handleForCategory(0);
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v121 = v65;
                  _os_log_impl(&dword_21FBF2000, v66, OS_LOG_TYPE_DEFAULT, "patch tag name: %@", buf, 0xCu);
                }

                uint64_t v69 = objc_msgSend_stringByAppendingString_(v106, v67, (uint64_t)v65, v68);

                uint64_t v72 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v70, (uint64_t)v69, v71);

                if (!v72)
                {
                  v86 = handleForCategory(0);
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
                    sub_21FC65374((uint64_t)v69, v86, v87, v88, v89, v90, v91, v92);
                  }

                  uint64_t v15 = 0;
                  v76 = 0;
                  id RequestWithLogging = 0;
                  v83 = 0;
                  uint64_t v3 = v98;
                  goto LABEL_42;
                }
                objc_msgSend_setObject_forKeyedSubscript_(v107, v73, v72, (uint64_t)v65);
                uint64_t v59 = v69;
                id v60 = v65;
                uint64_t v61 = (void *)v72;
              }
            }
            uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v109, (uint64_t)v119, 16);
            if (v58) {
              continue;
            }
            break;
          }
        }
        else
        {
          uint64_t v59 = 0;
          id v60 = 0;
          uint64_t v61 = 0;
        }

        objc_msgSend_setObject_forKeyedSubscript_(v105, v74, (uint64_t)v107, @"BundleDataDict");
        v75 = handleForCategory(0);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21FBF2000, v75, OS_LOG_TYPE_DEFAULT, "Copying Savage Firmware ...", buf, 2u);
        }

        v76 = (void *)SavageUpdaterCopyFirmwareWithLogging();
        if (!v76 || v117)
        {
          v97 = handleForCategory(0);
          uint64_t v3 = v98;
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
            sub_21FC6528C();
          }

          uint64_t v15 = 0;
          id RequestWithLogging = 0;
        }
        else
        {
          objc_msgSend_setObject_forKeyedSubscript_(v105, v77, (uint64_t)v76, @"FirmwareData");
          v78 = handleForCategory(0);
          uint64_t v3 = v98;
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v121 = v105;
            _os_log_impl(&dword_21FBF2000, v78, OS_LOG_TYPE_DEFAULT, "Final Savage options: %@", buf, 0xCu);
          }

          id RequestWithLogging = (id)SavageUpdaterCreateRequestWithLogging();
          uint64_t v80 = v117;
          v81 = handleForCategory(0);
          v82 = v81;
          if (RequestWithLogging && !v80)
          {
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v121 = RequestWithLogging;
              _os_log_impl(&dword_21FBF2000, v82, OS_LOG_TYPE_DEFAULT, "TSS request: %@", buf, 0xCu);
            }

            id RequestWithLogging = RequestWithLogging;
            uint64_t v15 = 0;
            uint64_t v69 = v59;
            id v65 = v60;
            v83 = RequestWithLogging;
            goto LABEL_42;
          }
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
            sub_21FC65300();
          }

          uint64_t v15 = 0;
        }
        v83 = 0;
        uint64_t v69 = v59;
        id v65 = v60;
LABEL_42:
        id v11 = v100;
LABEL_43:
        uint64_t v22 = v101;
        v84 = v99;
        goto LABEL_44;
      }
      v95 = handleForCategory(0);
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
        sub_21FC651E4();
      }
      goto LABEL_71;
    }
    v96 = handleForCategory(0);
    uint64_t v22 = v26;
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
      sub_21FC653E0();
    }

    goto LABEL_68;
  }
  v95 = handleForCategory(0);
  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
    sub_21FC65448();
  }
LABEL_71:

  uint64_t v69 = 0;
  uint64_t v15 = 0;
  v103 = 0;
  v104 = 0;
  v84 = 0;
  id v65 = 0;
  v102 = 0;
  v76 = 0;
  id RequestWithLogging = 0;
  v83 = 0;
  uint64_t v22 = v101;
LABEL_44:

  return v83;
}

id sub_21FC3C080(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v5 = v2;
  if (v2)
  {
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v2, v3, qword_267EF7F38, v4);
    if (v6) {
      goto LABEL_3;
    }
    int v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C84();
    }
  }
  else
  {
    int v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C50();
    }
  }

  uint64_t v6 = 0;
LABEL_3:

  return v6;
}

id sub_21FC3C130(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v5 = v2;
  if (v2)
  {
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v2, v3, qword_267EF7F40, v4);
    if (v6) {
      goto LABEL_3;
    }
    int v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC6547C();
    }
  }
  else
  {
    int v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C50();
    }
  }

  uint64_t v6 = 0;
LABEL_3:

  return v6;
}

id sub_21FC3C1E0(uint64_t a1, void *a2)
{
  uint64_t v148 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v134 = 0;
  uint64_t v147 = 0;
  memset(v146, 0, sizeof(v146));
  uint64_t v132 = 0;
  uint64_t v133 = 0;
  uint64_t v5 = objc_opt_new();
  if (!v2)
  {
    uint64_t v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21FC6502C();
    }
    goto LABEL_18;
  }
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x263F8C000], v4);
  uint64_t v9 = v6;
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"YonkersDeviceInfo", v8);
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v13 = (void *)v10;
  v126 = v5;
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v9, v11, @"YonkersDeviceInfo", v12);
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, qword_267EF7F80, v16);
  if (!v17)
  {

    goto LABEL_15;
  }
  uint64_t v20 = (void *)v17;
  uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v9, v18, @"YonkersDeviceInfo", v19);
  uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v21, v22, qword_267EF7F88, v23);

  uint64_t v5 = v126;
  if (!v24)
  {
LABEL_15:
    uint64_t v63 = handleForCategory(0);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      sub_21FC654B0();
    }

LABEL_18:
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    id v60 = 0;
    uint64_t v61 = 0;
    id v62 = 0;
    goto LABEL_19;
  }
  uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v9, v25, @"YonkersDeviceInfo", v26);
  uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v27, v28, qword_267EF7F80, v29);

  uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v9, v31, @"YonkersDeviceInfo", v32);
  int v36 = objc_msgSend_objectForKeyedSubscript_(v33, v34, qword_267EF7F88, v35);

  id v131 = 0;
  uint64_t v39 = objc_msgSend_getPathForApTicketWithError_(v126, v37, (uint64_t)&v131, v38);
  id v40 = v131;
  uint64_t v43 = v40;
  if (!v39 || v40)
  {
    id v121 = v39;
    id v65 = handleForCategory(0);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_21FC64D88();
    }
    goto LABEL_26;
  }
  uint64_t v44 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v41, v39, v42);
  uint64_t v43 = v44;
  if (!v44 || !objc_msgSend_length(v44, v45, v46, v47))
  {
    id v121 = v39;
    id v65 = handleForCategory(0);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_21FC64DBC();
    }
LABEL_26:

LABEL_27:
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    id v60 = 0;
    uint64_t v61 = 0;
    id v62 = 0;
    uint64_t v9 = v121;
    goto LABEL_19;
  }
  id v48 = v43;
  uint64_t v52 = objc_msgSend_bytes(v48, v49, v50, v51);
  uint64_t v56 = objc_msgSend_length(v48, v53, v54, v55);
  if (sub_21FC53204(v52, v56, (uint64_t)v146))
  {
    uint64_t v57 = handleForCategory(0);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_21FC64F28();
    }
LABEL_13:

    uint64_t v58 = 0;
    uint64_t v59 = 0;
    id v60 = 0;
    uint64_t v61 = 0;
    id v62 = 0;
    uint64_t v9 = v39;
    goto LABEL_19;
  }
  sub_21FC52FC8((uint64_t)v146, 1936027753, 1145525076, &v133, &v132);
  if (v67)
  {
    id v121 = v39;
    uint64_t v68 = handleForCategory(0);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      sub_21FC64E58();
    }

    goto LABEL_27;
  }
  uint64_t v69 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v66, v133, v132);
  if (!v69)
  {
    uint64_t v57 = handleForCategory(0);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_21FC6517C();
    }
    goto LABEL_13;
  }
  v120 = (void *)v69;
  Tags = (void *)SavageUpdaterGetTags();
  uint64_t v59 = Tags;
  uint64_t v118 = v48;
  v119 = v30;
  v122 = v39;
  if (!Tags || v134)
  {
    id obj = handleForCategory(0);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_21FC654E4((uint64_t)&v134, obj, v83, v84, v85, v86, v87, v88);
    }
    goto LABEL_51;
  }
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id obj = objc_msgSend_objectForKeyedSubscript_(Tags, v71, @"BuildIdentityTags", v72);
  uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v73, (uint64_t)&v127, (uint64_t)v145, 16);
  if (!v74)
  {
LABEL_51:
    uint64_t v58 = 0;
    goto LABEL_52;
  }
  uint64_t v77 = v74;
  uint64_t v117 = v36;
  uint64_t v58 = 0;
  uint64_t v78 = *(void *)v128;
  do
  {
    for (uint64_t i = 0; i != v77; ++i)
    {
      if (*(void *)v128 != v78) {
        objc_enumerationMutation(obj);
      }
      uint64_t v80 = *(void **)(*((void *)&v127 + 1) + 8 * i);
      if (objc_msgSend_containsString_(v80, v75, @"SysTopPatch", v76, v117, v118))
      {
        id v81 = v80;

        v82 = handleForCategory(0);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v144 = v81;
          _os_log_impl(&dword_21FBF2000, v82, OS_LOG_TYPE_DEFAULT, "patch tag name:%@", buf, 0xCu);
        }

        uint64_t v58 = v81;
      }
    }
    uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v75, (uint64_t)&v127, (uint64_t)v145, 16);
  }
  while (v77);
  int v36 = v117;
LABEL_52:

  v141[0] = v58;
  v139[0] = qword_267EF7F60;
  v137[0] = qword_267EF7F68;
  v137[1] = @"Personalize";
  v138[0] = @"Yonkers.fw";
  v138[1] = &unk_26D163350;
  v137[2] = @"IsiBootNonEssentialFirmware";
  v137[3] = @"IsiBootEANFirmware";
  v138[2] = &unk_26D163338;
  v138[3] = &unk_26D163338;
  v137[4] = @"IsLoadedByiBootStage1";
  v137[5] = @"IsLoadedByiBoot";
  v138[4] = &unk_26D163338;
  v138[5] = &unk_26D163338;
  v137[6] = @"IsFTAB";
  v138[6] = &unk_26D163338;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v89, (uint64_t)v138, (uint64_t)v137, 7);
  id obja = (id)objc_claimAutoreleasedReturnValue();
  v140[0] = obja;
  v139[1] = @"EPRO";
  v95 = objc_msgSend_numberWithBool_(NSNumber, v90, v36 != 0, v91);
  v140[1] = v95;
  v139[2] = @"FabRevision";
  v96 = v30;
  if (!v30)
  {
    v96 = objc_msgSend_null(MEMORY[0x263EFF9D0], v92, v93, v94);
  }
  v140[2] = v96;
  v97 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v92, (uint64_t)v140, (uint64_t)v139, 3);
  uint64_t v98 = *MEMORY[0x263F90488];
  v142[0] = v97;
  v142[1] = &unk_26D163338;
  uint64_t v99 = *MEMORY[0x263F904B8];
  v141[1] = v98;
  v141[2] = v99;
  v142[2] = &unk_26D163338;
  uint64_t v101 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v100, (uint64_t)v142, (uint64_t)v141, 3);

  if (!v30) {
  if (v101)
  }
  {
    objb = v101;
    objc_msgSend_setObject_forKeyedSubscript_(v2, v102, v101, @"BuildIdentity");
    v103 = handleForCategory(0);
    uint64_t v5 = v126;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v103, OS_LOG_TYPE_DEFAULT, "Creating Firmware Digest", buf, 2u);
    }

    id v60 = (void *)SavageUpdaterCopyFirmwareWithLogging();
    if (!v60 || v134)
    {
      id v115 = handleForCategory(0);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
        sub_21FC65094();
      }

      uint64_t v61 = 0;
    }
    else
    {
      objc_msgSend_setObject_forKeyedSubscript_(v2, v104, (uint64_t)v60, @"FirmwareData");
      v105 = handleForCategory(0);
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v144 = v2;
        _os_log_impl(&dword_21FBF2000, v105, OS_LOG_TYPE_DEFAULT, "Input Dictionary: %@", buf, 0xCu);
      }

      id RequestWithLogging = (void *)SavageUpdaterCreateRequestWithLogging();
      uint64_t v61 = RequestWithLogging;
      if (RequestWithLogging && !v134)
      {
        long long v110 = objc_msgSend_mutableCopy(RequestWithLogging, v107, v108, v109);
        uint64_t v135 = qword_267EF7F78;
        v136 = v120;
        long long v112 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v111, (uint64_t)&v136, (uint64_t)&v135, 1);
        objc_msgSend_setObject_forKeyedSubscript_(v110, v113, (uint64_t)v112, qword_267EF7F70);

        id v62 = v110;
        uint64_t v9 = objb;
        goto LABEL_19;
      }
      uint64_t v116 = handleForCategory(0);
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
        sub_21FC65108();
      }
    }
    id v62 = 0;
    uint64_t v9 = objb;
    uint64_t v5 = v126;
  }
  else
  {
    uint64_t v114 = handleForCategory(0);
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
      sub_21FC65060();
    }

    id v60 = 0;
    uint64_t v61 = 0;
    id v62 = 0;
    uint64_t v9 = v122;
    uint64_t v5 = v126;
  }
LABEL_19:

  return v62;
}

id sub_21FC3CC54(uint64_t a1, void *a2)
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v106 = 0;
  uint64_t v107 = 0;
  uint64_t v105 = 0;
  v97 = objc_opt_new();
  uint64_t v118 = 0;
  memset(v117, 0, sizeof(v117));
  uint64_t v3 = objc_opt_new();
  uint64_t v6 = v3;
  v95 = v2;
  if (!v3)
  {
    v96 = handleForCategory(0);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
      sub_21FC65554();
    }
    goto LABEL_55;
  }
  if (!v2)
  {
    v96 = handleForCategory(0);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
      sub_21FC6502C();
    }
LABEL_55:
    uint64_t v61 = 0;
    id v11 = 0;
    uint64_t v93 = 0;
    uint64_t v94 = 0;
    id v20 = 0;
    uint64_t v7 = 0;
    goto LABEL_58;
  }
  id v104 = 0;
  uint64_t v7 = objc_msgSend_getPathForApTicketWithError_(v3, v4, (uint64_t)&v104, v5);
  id v8 = v104;
  id v11 = v8;
  if (v7 && !v8)
  {
    id v103 = 0;
    uint64_t v12 = objc_msgSend_getPathForYonkersFirmwareWithError_(v6, v9, (uint64_t)&v103, v10);
    id v13 = v103;
    id v11 = v13;
    v96 = v12;
    if (v12 && !v13)
    {
      uint64_t v16 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v14, (uint64_t)v7, v15);
      id v20 = v16;
      if (v16 && objc_msgSend_length(v16, v17, v18, v19))
      {
        id v20 = v20;
        uint64_t v24 = objc_msgSend_bytes(v20, v21, v22, v23);
        uint64_t v28 = objc_msgSend_length(v20, v25, v26, v27);
        if (sub_21FC53204(v24, v28, (uint64_t)v117))
        {
          uint64_t v84 = handleForCategory(0);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            sub_21FC65448();
          }
        }
        else
        {
          sub_21FC52FC8((uint64_t)v117, 1936027753, 1145525076, &v107, &v105);
          if (v30)
          {
            uint64_t v86 = handleForCategory(0);
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
              sub_21FC653E0();
            }

            goto LABEL_71;
          }
          uint64_t v31 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v29, v107, v105);
          if (v31)
          {
            id v90 = v20;
            uint64_t v114 = v31;
            id v115 = @"SEP";
            uint64_t v113 = @"Digest";
            uint64_t v94 = (void *)v31;
            uint64_t v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v32, (uint64_t)&v114, (uint64_t)&v113, 1);
            uint64_t v116 = v33;
            uint64_t v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v34, (uint64_t)&v116, (uint64_t)&v115, 1);

            uint64_t v93 = (void *)v35;
            objc_msgSend_setObject_forKeyedSubscript_(v2, v36, v35, @"ReceiptManifest");
            uint64_t v37 = *MEMORY[0x263F904B8];
            v111[0] = *MEMORY[0x263F90488];
            v111[1] = v37;
            v112[0] = &unk_26D163338;
            v112[1] = &unk_26D163338;
            uint64_t v92 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v38, (uint64_t)v112, (uint64_t)v111, 2);
            objc_msgSend_setObject_forKeyedSubscript_(v2, v39, (uint64_t)v92, @"BuildIdentity");
            Tags = (void *)SavageUpdaterGetTags();
            uint64_t v41 = v106;
            uint64_t v42 = handleForCategory(0);
            uint64_t v43 = v42;
            uint64_t v91 = Tags;
            if (!Tags || v41)
            {
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                sub_21FC65218();
              }

              uint64_t v61 = 0;
              id v11 = 0;
              id v57 = 0;
              uint64_t v68 = 0;
              id RequestWithLogging = 0;
              v75 = 0;
              goto LABEL_42;
            }
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v110 = Tags;
              _os_log_impl(&dword_21FBF2000, v43, OS_LOG_TYPE_DEFAULT, "Yonkers updater tags: %@", buf, 0xCu);
            }
            uint64_t v88 = v7;
            uint64_t v89 = v6;

            long long v101 = 0u;
            long long v102 = 0u;
            long long v99 = 0u;
            long long v100 = 0u;
            objc_msgSend_objectForKeyedSubscript_(Tags, v44, @"BuildIdentityTags", v45);
            id obj = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v46, (uint64_t)&v99, (uint64_t)v108, 16);
            if (v47)
            {
              uint64_t v50 = v47;
              uint64_t v51 = 0;
              uint64_t v52 = 0;
              uint64_t v53 = 0;
              uint64_t v54 = *(void *)v100;
              while (2)
              {
                for (uint64_t i = 0; i != v50; ++i)
                {
                  if (*(void *)v100 != v54) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v56 = *(void **)(*((void *)&v99 + 1) + 8 * i);
                  if (objc_msgSend_containsString_(v56, v48, @"SysTopPatch", v49, v88))
                  {
                    id v57 = v56;

                    uint64_t v58 = handleForCategory(0);
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v110 = v57;
                      _os_log_impl(&dword_21FBF2000, v58, OS_LOG_TYPE_DEFAULT, "patch tag name: %@", buf, 0xCu);
                    }

                    uint64_t v61 = objc_msgSend_stringByAppendingString_(v96, v59, (uint64_t)v57, v60);

                    uint64_t v64 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v62, (uint64_t)v61, v63);

                    if (!v64)
                    {
                      uint64_t v77 = handleForCategory(0);
                      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
                        sub_21FC65374((uint64_t)v61, v77, v78, v79, v80, v81, v82, v83);
                      }

                      id v11 = 0;
                      uint64_t v68 = 0;
                      id RequestWithLogging = 0;
                      v75 = 0;
                      uint64_t v7 = v88;
                      uint64_t v6 = v89;
                      goto LABEL_42;
                    }
                    objc_msgSend_setObject_forKeyedSubscript_(v97, v65, v64, (uint64_t)v57);
                    uint64_t v51 = v61;
                    uint64_t v52 = v57;
                    uint64_t v53 = (void *)v64;
                  }
                }
                uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v99, (uint64_t)v108, 16);
                if (v50) {
                  continue;
                }
                break;
              }
            }
            else
            {
              uint64_t v51 = 0;
              uint64_t v52 = 0;
              uint64_t v53 = 0;
            }

            objc_msgSend_setObject_forKeyedSubscript_(v95, v66, (uint64_t)v97, @"BundleDataDict");
            int v67 = handleForCategory(0);
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21FBF2000, v67, OS_LOG_TYPE_DEFAULT, "Copying Yonkers Firmware ...", buf, 2u);
            }

            uint64_t v68 = (void *)SavageUpdaterCopyFirmwareWithLogging();
            if (!v68 || v106)
            {
              uint64_t v87 = handleForCategory(0);
              uint64_t v7 = v88;
              if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
                sub_21FC6528C();
              }

              id v11 = 0;
              id RequestWithLogging = 0;
            }
            else
            {
              objc_msgSend_setObject_forKeyedSubscript_(v95, v69, (uint64_t)v68, @"FirmwareData");
              uint64_t v70 = handleForCategory(0);
              uint64_t v7 = v88;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v110 = v95;
                _os_log_impl(&dword_21FBF2000, v70, OS_LOG_TYPE_DEFAULT, "Final Yonkers options: %@", buf, 0xCu);
              }

              id RequestWithLogging = (id)SavageUpdaterCreateRequestWithLogging();
              uint64_t v72 = v106;
              uint64_t v73 = handleForCategory(0);
              uint64_t v74 = v73;
              if (RequestWithLogging && !v72)
              {
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v110 = RequestWithLogging;
                  _os_log_impl(&dword_21FBF2000, v74, OS_LOG_TYPE_DEFAULT, "TSS request: %@", buf, 0xCu);
                }

                id RequestWithLogging = RequestWithLogging;
                id v11 = 0;
                uint64_t v61 = v51;
                id v57 = v52;
                v75 = RequestWithLogging;
                goto LABEL_41;
              }
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                sub_21FC65300();
              }

              id v11 = 0;
            }
            v75 = 0;
            uint64_t v61 = v51;
            id v57 = v52;
LABEL_41:
            uint64_t v6 = v89;
LABEL_42:
            id v20 = v90;
            goto LABEL_43;
          }
          uint64_t v84 = handleForCategory(0);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
            sub_21FC651E4();
          }
        }
      }
      else
      {
        uint64_t v84 = handleForCategory(0);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
          sub_21FC64DBC();
        }
      }

LABEL_71:
      uint64_t v61 = 0;
      id v11 = 0;
      uint64_t v93 = 0;
      uint64_t v94 = 0;
      goto LABEL_58;
    }
    uint64_t v85 = handleForCategory(0);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
      sub_21FC651B0();
    }

    goto LABEL_62;
  }
  v96 = handleForCategory(0);
  if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
  {
    sub_21FC64D88();
LABEL_62:
    uint64_t v61 = 0;
    uint64_t v93 = 0;
    uint64_t v94 = 0;
    id v20 = 0;
    goto LABEL_58;
  }
  uint64_t v61 = 0;
  uint64_t v93 = 0;
  uint64_t v94 = 0;
  id v20 = 0;
LABEL_58:
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  id v57 = 0;
  uint64_t v68 = 0;
  id RequestWithLogging = 0;
  v75 = 0;
LABEL_43:

  return v75;
}

id sub_21FC3D610(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v5 = v2;
  if (v2)
  {
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v2, v3, qword_267EF7F48, v4);
    if (v6) {
      goto LABEL_3;
    }
    id v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC65588();
    }
  }
  else
  {
    id v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C50();
    }
  }

  uint64_t v6 = 0;
LABEL_3:

  return v6;
}

id sub_21FC3D6C0(void *a1)
{
  id v1 = a1;
  uint64_t v5 = v1;
  __int16 v20 = 0;
  if (v1)
  {
    uint64_t v6 = objc_msgSend_lowercaseString(v1, v2, v3, v4);

    uint64_t v5 = objc_opt_new();
    int v10 = objc_msgSend_length(v6, v7, v8, v9);
    if (v10 >= 2)
    {
      int v13 = 0;
      int v14 = v10 - 1;
      do
      {
        int v15 = v13 + 1;
        unsigned __int8 v16 = objc_msgSend_characterAtIndex_(v6, v11, v13, v12);
        if ((char)v16 >= 48 && v16 <= 0x66u && v16 - 58 >= 0x27)
        {
          __str[0] = v16;
          __str[1] = objc_msgSend_characterAtIndex_(v6, v11, v15, v12);
          HIBYTE(v20) = strtol(__str, 0, 16);
          objc_msgSend_appendBytes_length_(v5, v17, (uint64_t)&v20 + 1, 1);
          int v15 = v13 + 2;
        }
        int v13 = v15;
      }
      while (v15 < v14);
    }
  }
  else
  {
    uint64_t v6 = handleForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_21FC64C50();
      uint64_t v5 = 0;
    }
  }

  return v5;
}

id sub_21FC3D800(uint64_t a1, void *a2)
{
  v35[5] = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = sub_21FC3D6C0(@"a41f5c0c eac3d607 f58c5a33 2a0958e0 b94f0313 990e456f ee23e279 80954e89");
  uint64_t v5 = (void *)MGCopyAnswer();
  uint64_t v6 = (void *)MGCopyAnswer();
  uint64_t v7 = MGCopyAnswer();
  int v10 = (void *)v7;
  if (v4)
  {
    if (v7)
    {
      uint64_t v11 = *MEMORY[0x263F8BFC8];
      uint64_t v32 = v4;
      if (v2
        && (objc_msgSend_objectForKeyedSubscript_(v2, v8, v11, v9),
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v12))
      {
        unsigned __int8 v16 = objc_msgSend_objectForKeyedSubscript_(v2, v8, v11, v9);
      }
      else
      {
        uint64_t v17 = objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v8, 20, v9, v4);
        unsigned __int8 v16 = objc_msgSend_copy(v17, v18, v19, v20);
      }
      id v21 = v2;
      v34[0] = v11;
      uint64_t v22 = v16;
      if (!v16)
      {
        uint64_t v22 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v14, v15);
      }
      v35[0] = v22;
      v34[1] = *MEMORY[0x263F8BFD0];
      uint64_t v23 = v5;
      if (!v5)
      {
        uint64_t v23 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v14, v15);
      }
      v35[1] = v23;
      v34[2] = *MEMORY[0x263F8BFD8];
      uint64_t v24 = v6;
      if (!v6)
      {
        uint64_t v24 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v14, v15);
      }
      v35[2] = v24;
      v35[3] = MEMORY[0x263EFFA88];
      uint64_t v25 = *MEMORY[0x263F8BFF0];
      v34[3] = @"SCAllowPairing";
      v34[4] = v25;
      v35[4] = MEMORY[0x263EFFA88];
      uint64_t v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v35, (uint64_t)v34, 5, v32);
      if (v6)
      {
        if (v5) {
          goto LABEL_15;
        }
      }
      else
      {

        if (v5)
        {
LABEL_15:
          if (v16) {
            goto LABEL_16;
          }
LABEL_23:

LABEL_16:
          id v2 = v21;
          if (v27)
          {
            objc_msgSend_setObject_forKeyedSubscript_(v3, v26, v27, *MEMORY[0x263F8BEF0]);
            uint64_t v4 = (void *)v33;
            objc_msgSend_setObject_forKeyedSubscript_(v3, v28, v33, @"SEPSeaCookieKeyIdentifier");
            objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)v10, *MEMORY[0x263F8BF50]);

            unsigned __int8 v16 = v27;
          }
          else
          {
            uint64_t v31 = handleForCategory(0);
            uint64_t v4 = (void *)v33;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              sub_21FC655F0();
            }
          }
          goto LABEL_18;
        }
      }

      if (v16) {
        goto LABEL_16;
      }
      goto LABEL_23;
    }
    unsigned __int8 v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC64F90();
    }
  }
  else
  {
    unsigned __int8 v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC655BC();
    }
  }
LABEL_18:

  return v3;
}

id sub_21FC3DB44(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v5 = v2;
  if (v2)
  {
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x263F8BF18], v4);
    if (v6) {
      goto LABEL_3;
    }
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C84();
    }
  }
  else
  {
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C50();
    }
  }

  uint64_t v6 = 0;
LABEL_3:

  return v6;
}

id sub_21FC3DBF8(uint64_t a1, void *a2)
{
  v32[4] = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)MGCopyAnswer();
  uint64_t v7 = (void *)MGCopyAnswer();
  if (v2)
  {
    uint64_t v8 = *MEMORY[0x263F8BFC8];
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v2, v5, *MEMORY[0x263F8BFC8], v6);

    if (v9)
    {
      uint64_t v12 = *MEMORY[0x263F8BF50];
      int v13 = objc_msgSend_objectForKeyedSubscript_(v2, v10, *MEMORY[0x263F8BF50], v11);

      if (v13)
      {
        v31[0] = v8;
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v2, v14, v8, v15);
        uint64_t v20 = v19;
        if (!v19)
        {
          uint64_t v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17, v18);
        }
        v32[0] = v20;
        v31[1] = *MEMORY[0x263F8BFD0];
        id v21 = v4;
        if (!v4)
        {
          id v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17, v18);
        }
        v32[1] = v21;
        v31[2] = *MEMORY[0x263F8BFD8];
        uint64_t v22 = v7;
        if (!v7)
        {
          uint64_t v22 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17, v18);
        }
        v31[3] = *MEMORY[0x263F8BFF0];
        v32[2] = v22;
        v32[3] = MEMORY[0x263EFFA88];
        uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)v32, (uint64_t)v31, 4);
        if (v7)
        {
          if (v4) {
            goto LABEL_12;
          }
        }
        else
        {

          if (v4)
          {
LABEL_12:
            if (v19) {
              goto LABEL_13;
            }
LABEL_20:

LABEL_13:
            if (v23)
            {
              objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, *MEMORY[0x263F8BEF0]);
              uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v2, v25, v12, v26);
              objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)v27, v12);

              objc_msgSend_setObject_forKeyedSubscript_(v3, v29, MEMORY[0x263EFFA88], @"LTHTransferAllowed");
            }
            else
            {
              uint64_t v23 = handleForCategory(0);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                sub_21FC655F0();
              }
            }
            goto LABEL_15;
          }
        }

        if (v19) {
          goto LABEL_13;
        }
        goto LABEL_20;
      }
      uint64_t v23 = handleForCategory(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_21FC6568C();
      }
    }
    else
    {
      uint64_t v23 = handleForCategory(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_21FC65658();
      }
    }
  }
  else
  {
    uint64_t v23 = handleForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_21FC65624();
    }
  }
LABEL_15:

  return v3;
}

id sub_21FC3DF14(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v5 = v2;
  if (v2)
  {
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x263F8BF18], v4);
    if (v6) {
      goto LABEL_3;
    }
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C84();
    }
  }
  else
  {
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C50();
    }
  }

  uint64_t v6 = 0;
LABEL_3:

  return v6;
}

id sub_21FC3DFC8(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v5 = v2;
  if (v2)
  {
    uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v2, v3, qword_267EF7F50, v4);
    if (v6) {
      goto LABEL_3;
    }
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC656C0();
    }
  }
  else
  {
    uint64_t v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC64C50();
    }
  }

  uint64_t v6 = 0;
LABEL_3:

  return v6;
}

id sub_21FC3E078(uint64_t a1, void *a2)
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v129 = 0;
  uint64_t v130 = 0;
  uint64_t v128 = 0;
  uint64_t v119 = objc_opt_new();
  uint64_t v141 = 0;
  memset(v140, 0, sizeof(v140));
  uint64_t v3 = objc_opt_new();
  uint64_t v6 = v3;
  if (v3)
  {
    if (v2)
    {
      id v127 = 0;
      uint64_t v7 = objc_msgSend_getPathForBrunorFirmwareWithError_(v3, v4, (uint64_t)&v127, v5);
      id v8 = v127;
      uint64_t v11 = v8;
      if (!v7 || v8)
      {
        uint64_t v34 = v7;
        uint64_t v106 = handleForCategory(0);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
          sub_21FC651B0();
        }

        uint64_t v37 = 0;
        id v32 = 0;
        id v121 = 0;
        goto LABEL_81;
      }
      uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v2, v9, @"updaterOptions", v10);
      if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v2, v13, @"auth", v14);
        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            TagsWithLogging = (void *)SavageUpdaterGetTagsWithLogging();
            uint64_t v17 = v130;
            uint64_t v18 = handleForCategory(0);
            uint64_t v19 = v18;
            long long v112 = TagsWithLogging;
            if (TagsWithLogging && !v17)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v139 = TagsWithLogging;
                _os_log_impl(&dword_21FBF2000, v19, OS_LOG_TYPE_DEFAULT, "Savage updater tags: %@", buf, 0xCu);
              }
              uint64_t v114 = v15;
              id v116 = v12;
              uint64_t v113 = v6;
              id v110 = v2;

              long long v125 = 0u;
              long long v126 = 0u;
              long long v123 = 0u;
              long long v124 = 0u;
              uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(TagsWithLogging, v20, @"BuildIdentityTags", v21);
              uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v123, (uint64_t)v137, 16);
              if (v24)
              {
                uint64_t v27 = v24;
                v120 = 0;
                id v121 = 0;
                uint64_t v28 = 0;
                uint64_t v29 = *(void *)v124;
                while (2)
                {
                  for (uint64_t i = 0; i != v27; ++i)
                  {
                    if (*(void *)v124 != v29) {
                      objc_enumerationMutation(v22);
                    }
                    uint64_t v31 = *(void **)(*((void *)&v123 + 1) + 8 * i);
                    if (objc_msgSend_containsString_(v31, v25, @"-Patch", v26))
                    {
                      id v32 = v31;

                      uint64_t v33 = handleForCategory(0);
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v139 = v32;
                        _os_log_impl(&dword_21FBF2000, v33, OS_LOG_TYPE_DEFAULT, "patch tag name: %@", buf, 0xCu);
                      }

                      uint64_t v34 = v7;
                      uint64_t v37 = objc_msgSend_stringByAppendingString_(v7, v35, (uint64_t)v32, v36);

                      uint64_t v40 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v38, (uint64_t)v37, v39);

                      if (!v40)
                      {
                        uint64_t v88 = handleForCategory(0);
                        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
                          sub_21FC65374((uint64_t)v37, v88, v89, v90, v91, v92, v93, v94);
                        }

                        id v121 = 0;
                        uint64_t v11 = 0;
                        long long v111 = 0;
                        int v67 = 0;
                        id v117 = 0;
                        uint64_t v118 = 0;
                        int v66 = 0;
                        uint64_t v68 = 0;
                        id RequestWithLogging = 0;
                        goto LABEL_58;
                      }
                      objc_msgSend_setObject_forKeyedSubscript_(v119, v41, v40, (uint64_t)v32);
                      v120 = v37;
                      id v121 = (void *)v40;
                      uint64_t v28 = v32;
                      uint64_t v7 = v34;
                    }
                  }
                  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v123, (uint64_t)v137, 16);
                  if (v27) {
                    continue;
                  }
                  break;
                }
              }
              else
              {
                v120 = 0;
                id v121 = 0;
                uint64_t v28 = 0;
              }
              uint64_t v42 = v28;

              uint64_t v43 = v12;
              objc_msgSend_setObject_forKeyedSubscript_(v12, v44, (uint64_t)v119, @"BundleDataDict");
              uint64_t v45 = *MEMORY[0x263F903F8];
              v135[0] = *MEMORY[0x263F90370];
              v135[1] = v45;
              v136[0] = @"0x5065";
              v136[1] = @"0x00";
              uint64_t v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v46, (uint64_t)v136, (uint64_t)v135, 2);
              objc_msgSend_setObject_forKeyedSubscript_(v12, v48, v47, @"BuildIdentity");
              uint64_t v49 = v114;
              if (objc_msgSend_BOOLValue(v114, v50, v51, v52))
              {
                objc_msgSend_setObject_forKeyedSubscript_(v12, v53, MEMORY[0x263EFFA78], @"ReceiptManifest");
                long long v111 = 0;
                id v55 = 0;
                uint64_t v56 = 0;
                uint64_t v57 = 0;
                goto LABEL_29;
              }
              id v122 = 0;
              uint64_t v56 = objc_msgSend_getPathForApTicketWithError_(v113, v53, (uint64_t)&v122, v54);
              id v69 = v122;
              uint64_t v11 = v69;
              uint64_t v118 = (void *)v56;
              if (!v56 || v69)
              {
                uint64_t v86 = handleForCategory(0);
                if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
                  sub_21FC64D88();
                }

                long long v111 = 0;
                int v67 = 0;
                int v66 = 0;
                uint64_t v68 = 0;
                id RequestWithLogging = 0;
                id v117 = 0;
                uint64_t v34 = v47;
                uint64_t v37 = v120;
                id v32 = v42;
LABEL_58:
                id v2 = v110;
                goto LABEL_65;
              }
              uint64_t v72 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v70, v56, v71);
              uint64_t v76 = v72;
              if (!v72 || !objc_msgSend_length(v72, v73, v74, v75))
              {
                id v109 = v76;
                uint64_t v87 = handleForCategory(0);
                if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
                  sub_21FC64DBC();
                }

                goto LABEL_64;
              }
              id v55 = v76;
              uint64_t v80 = objc_msgSend_bytes(v55, v77, v78, v79);
              uint64_t v84 = objc_msgSend_length(v55, v81, v82, v83);
              uint64_t v49 = v114;
              uint64_t v43 = v116;
              id v109 = v55;
              if (sub_21FC53204(v80, v84, (uint64_t)v140))
              {
                uint64_t v85 = handleForCategory(0);
                if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
                  sub_21FC64F28();
                }
              }
              else
              {
                sub_21FC52FC8((uint64_t)v140, 1936027753, 1145525076, &v129, &v128);
                if (v96)
                {
                  v97 = handleForCategory(0);
                  if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
                    sub_21FC64E58();
                  }

                  goto LABEL_63;
                }
                uint64_t v99 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v95, v129, v128);
                if (v99)
                {
                  uint64_t v132 = v99;
                  uint64_t v133 = @"SEP";
                  id v131 = @"Digest";
                  long long v111 = (void *)v99;
                  long long v101 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v100, (uint64_t)&v132, (uint64_t)&v131, 1);
                  uint64_t v134 = v101;
                  uint64_t v57 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v102, (uint64_t)&v134, (uint64_t)&v133, 1);

                  objc_msgSend_setObject_forKeyedSubscript_(v116, v103, v57, @"ReceiptManifest");
LABEL_29:
                  id v108 = v55;
                  uint64_t v58 = handleForCategory(0);
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21FBF2000, v58, OS_LOG_TYPE_DEFAULT, "Copying Firmware ...", buf, 2u);
                  }

                  uint64_t v59 = SavageUpdaterCopyFirmwareWithLogging();
                  uint64_t v118 = (void *)v56;
                  id v115 = (void *)v59;
                  if (!v59 || v130)
                  {
                    int v66 = (void *)v57;
                    uint64_t v107 = handleForCategory(0);
                    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
                      sub_21FC65094();
                    }

                    uint64_t v11 = 0;
                    id RequestWithLogging = 0;
                  }
                  else
                  {
                    objc_msgSend_setObject_forKeyedSubscript_(v43, v60, v59, @"FirmwareData");
                    uint64_t v61 = handleForCategory(0);
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v139 = v43;
                      _os_log_impl(&dword_21FBF2000, v61, OS_LOG_TYPE_DEFAULT, "Final options: %@", buf, 0xCu);
                    }

                    id RequestWithLogging = (id)SavageUpdaterCreateRequestWithLogging();
                    uint64_t v63 = v130;
                    uint64_t v64 = handleForCategory(0);
                    id v65 = v64;
                    if (RequestWithLogging && !v63)
                    {
                      int v66 = (void *)v57;
                      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v139 = RequestWithLogging;
                        _os_log_impl(&dword_21FBF2000, v65, OS_LOG_TYPE_DEFAULT, "TSS request: %@", buf, 0xCu);
                      }

                      id RequestWithLogging = RequestWithLogging;
                      uint64_t v11 = 0;
                      uint64_t v34 = v47;
                      uint64_t v37 = v120;
                      id v32 = v42;
                      id v117 = RequestWithLogging;
                      goto LABEL_40;
                    }
                    int v66 = (void *)v57;
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
                      sub_21FC65108();
                    }

                    uint64_t v11 = 0;
                  }
                  id v117 = 0;
                  uint64_t v34 = v47;
                  uint64_t v37 = v120;
                  id v32 = v42;
LABEL_40:
                  int v67 = v108;
                  id v2 = v110;
                  uint64_t v6 = v113;
                  uint64_t v68 = v115;
                  goto LABEL_66;
                }
                uint64_t v85 = handleForCategory(0);
                if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
                  sub_21FC6517C();
                }
              }

LABEL_63:
LABEL_64:

              uint64_t v11 = 0;
              long long v111 = 0;
              int v66 = 0;
              uint64_t v68 = 0;
              id RequestWithLogging = 0;
              id v117 = 0;
              uint64_t v34 = v47;
              uint64_t v37 = v120;
              id v32 = v42;
              int v67 = v109;
              id v2 = v110;
LABEL_65:
              uint64_t v6 = v113;
              goto LABEL_66;
            }
            uint64_t v34 = v7;
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_21FC65790();
            }

            uint64_t v37 = 0;
            id v32 = 0;
            id v121 = 0;
            uint64_t v11 = 0;
            long long v111 = 0;
            goto LABEL_82;
          }
        }
        uint64_t v34 = v7;
        uint64_t v105 = handleForCategory(0);
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
          sub_21FC6575C();
        }
      }
      else
      {
        uint64_t v34 = v7;
        id v104 = handleForCategory(0);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
          sub_21FC65728();
        }
      }
LABEL_80:
      uint64_t v37 = 0;
      id v32 = 0;
      id v121 = 0;
      uint64_t v11 = 0;
LABEL_81:
      long long v111 = 0;
      long long v112 = 0;
LABEL_82:
      int v67 = 0;
      uint64_t v118 = 0;
      int v66 = 0;
      uint64_t v68 = 0;
      id RequestWithLogging = 0;
      id v117 = 0;
      goto LABEL_66;
    }
    uint64_t v34 = handleForCategory(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      sub_21FC656F4();
      goto LABEL_80;
    }
  }
  else
  {
    uint64_t v34 = handleForCategory(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      sub_21FC65554();
      goto LABEL_80;
    }
  }
  uint64_t v37 = 0;
  id v32 = 0;
  id v121 = 0;
  uint64_t v11 = 0;
  long long v111 = 0;
  long long v112 = 0;
  int v67 = 0;
  id v117 = 0;
  uint64_t v118 = 0;
  int v66 = 0;
  uint64_t v68 = 0;
  id RequestWithLogging = 0;
LABEL_66:

  return v117;
}

void sub_21FC3EC74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void sub_21FC3ED38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21FC40E1C(uint64_t a1, void *a2, void *a3)
{
  id v26 = a2;
  id v5 = a3;
  id v8 = objc_msgSend_objectForKey_(*(void **)(a1 + 32), v6, (uint64_t)v26, v7);

  if (v8)
  {
    uint64_t v11 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v9, (uint64_t)v26, v10);
    uint64_t v15 = objc_msgSend_setWithArray_(v11, v13, (uint64_t)v12, v14);

    uint64_t v18 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v16, (uint64_t)v5, v17);
    objc_msgSend_unionSet_(v15, v19, (uint64_t)v18, v20);
    uint64_t v24 = objc_msgSend_allObjects(v15, v21, v22, v23);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v25, (uint64_t)v24, (uint64_t)v26);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v9, (uint64_t)v5, (uint64_t)v26);
  }
}

uint64_t sub_21FC42B04()
{
  id v0 = [CRAttestationHandler alloc];
  qword_267EF8200 = objc_msgSend__init(v0, v1, v2, v3);
  return MEMORY[0x270F9A758]();
}

void sub_21FC42C70(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v6 = handleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = (id)objc_opt_class();
    id v7 = v18;
    _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "Inspecting Class: %@", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v8 = MGGetProductType();
  uint64_t v11 = objc_msgSend_getDeviceHandlerForProductType_(a2, v9, v8, v10);
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v11;

  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      int v17 = 138412290;
      id v18 = v15;
      id v16 = v15;
      _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, "Chosen Class: %@", (uint8_t *)&v17, 0xCu);
    }
    *a3 = 1;
  }
}

void sub_21FC43F58(void **a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v9 = objc_msgSend_componentsSeparatedByString_(v5, v7, @"-", v8);
  if ((unint64_t)objc_msgSend_count(v9, v10, v11, v12) > 1)
  {
    id v16 = objc_msgSend_objectAtIndexedSubscript_(v9, v13, 0, v14);
    uint64_t v20 = objc_msgSend_length(v16, v17, v18, v19);
    uint64_t v23 = objc_msgSend_substringFromIndex_(v5, v21, v20 + 1, v22);
    objc_msgSend_addObject_(a1[4], v24, (uint64_t)v16, v25);
    objc_msgSend_addObject_(a1[5], v26, (uint64_t)v23, v27);
    objc_msgSend_addObject_(a1[6], v28, (uint64_t)v6, v29);
  }
  else
  {
    uint64_t v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21FC664FC();
    }
  }
}

void sub_21FC4A190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_21FC4A1CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21FC4A1DC(uint64_t a1)
{
}

void sub_21FC4A1E4(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v6 = v3;
  if (*(void *)(a1 + 32))
  {
    id v7 = objc_msgSend_stringWithFormat_(NSString, v4, @"%@-", v5, *(void *)(a1 + 32));
    int v10 = objc_msgSend_containsString_(v6, v8, (uint64_t)v7, v9);

    if (v10)
    {
      uint64_t v11 = handleForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v17 = v6;
LABEL_11:
        _os_log_impl(&dword_21FBF2000, v11, OS_LOG_TYPE_DEFAULT, "deleting file:%@", buf, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    int v12 = objc_msgSend_containsString_(v3, v4, @"trustobject-", v5);
    uint64_t v11 = handleForCategory(0);
    BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v12)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        int v17 = v6;
        goto LABEL_11;
      }
LABEL_12:

      objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v14, (uint64_t)v6, v15);
      goto LABEL_13;
    }
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      int v17 = v6;
      _os_log_impl(&dword_21FBF2000, v11, OS_LOG_TYPE_DEFAULT, "skipping file:%@", buf, 0xCu);
    }
  }
LABEL_13:
}

void sub_21FC4D004(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  id v5 = a3;
  unint64_t v9 = objc_msgSend_length(v5, v6, v7, v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v10, @"error : Invalid Data Type", (uint64_t)v25);
      goto LABEL_14;
    }
    BOOL v13 = NSString;
    if (v9 < 0x401)
    {
      uint64_t v14 = objc_msgSend_convertToHexString(v5, v10, v11, v12);
      objc_msgSend_stringWithFormat_(v13, v23, @"data : %@", v24, v14);
      uint64_t v20 = LABEL_11:;

      if (v20) {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v14 = objc_msgSend_SHA256DigestString(v5, v10, v11, v12);
    objc_msgSend_stringWithFormat_(v13, v15, @"digest : %@", v16, v14);
    goto LABEL_11;
  }
  BOOL v13 = NSString;
  if (v9 >= 0x401) {
    goto LABEL_6;
  }
  uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v10, @"string : %@", v12, v5);
  if (v20)
  {
LABEL_12:
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v17, (uint64_t)v20, (uint64_t)v25);
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v18, v19);
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v22, (uint64_t)v21, (uint64_t)v25);

LABEL_13:
LABEL_14:
}

void sub_21FC4D648(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unsigned char *sub_21FC4D660(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

uint64_t sub_21FC4D724(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  qword_267EF8210 = objc_msgSend_bundleWithPath_(MEMORY[0x263F086E0], a2, @"/System/Library/PrivateFrameworks/CoreRepairCore.framework", a4);
  return MEMORY[0x270F9A758]();
}

void sub_21FC4F2C0(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 8);
  id v6 = objc_msgSend_componentType(*(void **)(a1 + 48), v3, v4, v5);
  unint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v2, v7, (uint64_t)v6, v8);
  uint64_t v10 = *(void *)(a1 + 48);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = sub_21FC4F3C0;
  v12[3] = &unk_26452AC10;
  v12[4] = v10;
  id v13 = *(id *)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 32);
  objc_msgSend_challengeComponentWith_withReply_(v9, v11, v10, (uint64_t)v12);
}

void sub_21FC4F3C0(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v7 = a3;
  id v8 = a4;
  if (v7 || (a2 & 1) == 0)
  {
    uint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC683B0(a1, v7, v10, v11);
    }
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = sub_21FC4F4C8;
    v12[3] = &unk_26452ABE8;
    unint64_t v9 = *(NSObject **)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    id v14 = v8;
    dispatch_sync(v9, v12);

    uint64_t v10 = v13;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t sub_21FC4F4C8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
}

id sub_21FC51234()
{
  kern_return_t v4;
  io_connect_t v5;
  _OWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  kern_return_t v10;
  kern_return_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v17;
  NSObject *v18;
  kern_return_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  io_connect_t connect[2];
  uint8_t buf[4];
  kern_return_t v31;
  void outputStruct[2];
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  long long v37;
  long long v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t vars8;

  uint64_t v41 = *MEMORY[0x263EF8340];
  connect[0] = 0;
  CFMutableDictionaryRef v0 = IOServiceMatching("IOAESAccelerator");
  if (!v0)
  {
    int v17 = handleForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(outputStruct[0]) = 0;
      _os_log_impl(&dword_21FBF2000, v17, OS_LOG_TYPE_DEFAULT, "Could not allocate matching dict for kIOAESAcceleratorClass", (uint8_t *)outputStruct, 2u);
    }

    goto LABEL_11;
  }
  CFDictionaryRef v1 = v0;
  CFRetain(v0);
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v1);
  if (!MatchingService)
  {
    uint64_t v18 = handleForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(outputStruct[0]) = 0;
      _os_log_impl(&dword_21FBF2000, v18, OS_LOG_TYPE_DEFAULT, "Could not find kIOAESAcceleratorClass", (uint8_t *)outputStruct, 2u);
    }

    CFRelease(v1);
    goto LABEL_11;
  }
  io_object_t v3 = MatchingService;
  uint64_t v4 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, connect);
  if (v4)
  {
    uint64_t v19 = v4;
    uint64_t v20 = handleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(outputStruct[0]) = 67109120;
      HIDWORD(outputStruct[0]) = v19;
      _os_log_impl(&dword_21FBF2000, v20, OS_LOG_TYPE_DEFAULT, "Return %d trying to open kIOAESAcceleratorClass", (uint8_t *)outputStruct, 8u);
    }
  }
  CFRelease(v1);
  IOObjectRelease(v3);
  uint64_t v5 = connect[0];
  if (!connect[0])
  {
LABEL_11:
    id v13 = 0;
    goto LABEL_20;
  }
  id v6 = sub_21FC5187C();
  if (!v6)
  {
    IOServiceClose(v5);
    goto LABEL_11;
  }
  uint64_t v7 = v6;
  *id v6 = xmmword_21FC6D598;
  v6[1] = unk_21FC6D5A8;
  id v8 = sub_21FC5187C();
  unint64_t v9 = v8;
  if (v8)
  {
    uint64_t v40 = 0;
    uint64_t v35 = 0;
    uint64_t v34 = 0;
    uint64_t v37 = 0u;
    uint64_t v38 = 0u;
    *(void *)connect = 88;
    outputStruct[0] = v7;
    outputStruct[1] = v8;
    uint64_t v33 = 32;
    uint64_t v36 = 0x8000000000;
    uint64_t v39 = 2108;
    uint64_t v10 = IOConnectCallStructMethod(v5, 1u, outputStruct, 0x58uLL, outputStruct, (size_t *)connect);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = handleForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint64_t v31 = v11;
        _os_log_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_DEFAULT, "perform aes => %d", buf, 8u);
      }
    }
    else
    {
      ccsha256_di();
      id v14 = cchkdf();
      if (v14)
      {
        uint64_t v21 = v14;
        uint64_t v22 = handleForCategory(0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_21FC68B30(v21, v22, v23, v24, v25, v26, v27, v28);
        }

        goto LABEL_17;
      }
      id v13 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF990], v15, (uint64_t)outputStruct, 32, outputStruct);
      memset_s(outputStruct, 0x20uLL, 0, 0x20uLL);
      if (v13) {
        goto LABEL_18;
      }
      uint64_t v12 = handleForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_21FC68AFC();
      }
    }
  }
LABEL_17:
  id v13 = 0;
LABEL_18:
  IOServiceClose(v5);
  free(v7);
  if (v9) {
    free(v9);
  }
LABEL_20:
  return v13;
}

void *sub_21FC5187C()
{
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 0x10uLL, 0x20uLL, 0x432CC5B8uLL))
  {
    CFMutableDictionaryRef v0 = handleForCategory(0);
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      sub_21FC68C3C();
    }
  }
  else
  {
    CFDictionaryRef v1 = memptr;
    *(_OWORD *)memptr = 0u;
    v1[1] = 0u;
  }
  return memptr;
}

uint64_t sub_21FC51B68(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  qword_26AC13458 = objc_msgSend__init(v1, v2, v3, v4);
  return MEMORY[0x270F9A758]();
}

void sub_21FC51F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21FC51FAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21FC51FBC(uint64_t a1)
{
}

void sub_21FC51FC4(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void sub_21FC52328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21FC52374(void *a1, int a2, int a3, id obj, uint64_t a5, int a6)
{
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = a6;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), obj);
  id v8 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

double sub_21FC52424(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0;
  long long v8 = 0uLL;
  while (!sub_21FC536A4(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

uint64_t sub_21FC52488(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1;
  }
  unsigned int v5 = 0;
  if (sub_21FC5358C((char **)a1, &v5)) {
    return 4294967294;
  }
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t sub_21FC52500(void *a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t result = sub_21FC53358((uint64_t)a1, &v6);
      if (!result)
      {
        if (v6 == 0x2000000000000010)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = sub_21FC53830(&v7, 4u, (uint64_t)&unk_21FC6D5B8, a2, 0x40uLL, 0);
            if (!result) {
              return 2 * (sub_21FC52488(a2, 0x494D4734u) != 0);
            }
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t sub_21FC525E4(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = sub_21FC53830(a1, 2u, (uint64_t)&unk_21FC6D8D0, (unint64_t)a2, 0x20uLL, 0);
      if (!result)
      {
        uint64_t result = sub_21FC5358C(a2, &v5);
        if (!result)
        {
          if (v5 <= 1) {
            return 0;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_21FC52668(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = sub_21FC53764(a1, 7u, (uint64_t)&unk_21FC6D6A8, a2, 0xA0uLL, 0);
      if (!result)
      {
        if (sub_21FC52488(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(void *)(a2 + 80) {
               || (long long v7 = 0u, v8 = 0u,
        }
                            uint64_t result = sub_21FC525E4((unint64_t *)(a2 + 80), (char **)&v7),
                            !result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0;
          }
          long long v7 = 0u;
          long long v8 = 0u;
          uint64_t result = sub_21FC52728(v5, (unint64_t)&v7);
          if (!result) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_21FC52728(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = sub_21FC53764(result, 2u, (uint64_t)&unk_21FC6D8A0, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (sub_21FC52488(a2, 0x50415950u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_21FC527AC(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t result = 6;
  if (a1 && a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t result = sub_21FC52668(a1, (unint64_t)&v11);
    if (result)
    {
      uint64_t result = sub_21FC53764(a1, 6u, (uint64_t)&unk_21FC6D618, a2, 0x90uLL, 0);
      if (!result)
      {
        if (sub_21FC52488(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = sub_21FC525E4(v5, (char **)v10);
          if (!result) {
            return 0;
          }
        }
      }
    }
    else
    {
      long long v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      long long v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      long long v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t sub_21FC528B8(void *a1, unint64_t a2)
{
  return sub_21FC528D4(a1, 5uLL, (uint64_t)&unk_21FC6D750, a2, 0x494D344Du);
}

uint64_t sub_21FC528D4(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    uint64_t result = sub_21FC53764((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!result)
    {
      if (sub_21FC52488(a4, a5)) {
        return 2;
      }
      unsigned int v9 = 0;
      uint64_t result = sub_21FC5358C((char **)(a4 + 16), &v9);
      if (result) {
        return result;
      }
      if (v9 > 2) {
        return 2;
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_21FC52984(void *a1, unint64_t a2)
{
  return sub_21FC528D4(a1, 3uLL, (uint64_t)&unk_21FC6D828, a2, 0x494D344Du);
}

uint64_t sub_21FC529A0(void *a1, unint64_t a2)
{
  return sub_21FC528D4(a1, 4uLL, (uint64_t)&unk_21FC6D7C8, a2, 0x494D3443u);
}

uint64_t sub_21FC529BC(void *a1, unint64_t a2)
{
  return sub_21FC528D4(a1, 3uLL, (uint64_t)&unk_21FC6D828, a2, 0x494D3443u);
}

uint64_t sub_21FC529D8(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = sub_21FC53764(result, 2u, (uint64_t)&unk_21FC6D870, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (sub_21FC52488(a2, 0x494D3452u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_21FC52A5C(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int v8 = 0;
  v9[0] = 0;
  _DWORD v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  long long v10 = a3;
  uint64_t result = sub_21FC53764(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!result)
  {
    uint64_t result = sub_21FC5358C((char **)a4, &v8);
    if (!result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        uint64_t result = 0;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000;
        *(void *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void sub_21FC52B30(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  long long v8 = 0uLL;
  sub_21FC52424(a1, a2, &v8);
  if (!v7) {
    sub_21FC52A5C((uint64_t)&v8, a2, a3, a4);
  }
}

void sub_21FC52B8C(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0;
  v7[1] = 0;
  if (!sub_21FC53678(a1, v7)) {
    sub_21FC52B30(v7, a2, a3, a4);
  }
}

void sub_21FC52BE8(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void sub_21FC52BF4(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!sub_21FC53358(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !sub_21FC5358C((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        sub_21FC52B8C(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          sub_21FC52B8C((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }
}

uint64_t sub_21FC52D24(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t sub_21FC52D5C(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = sub_21FC52D24(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t sub_21FC52DCC(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }
    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t sub_21FC52E2C(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1)
  {
    if (a4)
    {
      sub_21FC53044(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      uint64_t v4 = v6;
      if (!v6) {
        return sub_21FC53550((unsigned __int8 **)&v8[1] + 1, a4);
      }
    }
  }
  return v4;
}

void sub_21FC52E9C(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      sub_21FC53044(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (sub_21FC5358C((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

double sub_21FC52F14(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  v14[0] = 0;
  v14[1] = 0;
  double result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      sub_21FC52BE8(a1, (unint64_t)v14, 0);
      if (v10
        || (sub_21FC52B8C(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (sub_21FC52B8C((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        double result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

void sub_21FC52FC8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    sub_21FC52F14(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

double sub_21FC53044(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)long long v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!sub_21FC52DCC((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)long long v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      sub_21FC52BE8(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        sub_21FC52B8C(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }
    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

double sub_21FC53114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      long long v7 = 0u;
      long long v8 = 0u;
      long long v5 = 0u;
      long long v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 448) = 0;
      if (!sub_21FC52500(v9, (unint64_t)&v5)
        && !sub_21FC527AC((uint64_t)&v6, a3 + 88)
        && !sub_21FC528B8(&v7, a3 + 232)
        && !sub_21FC529D8((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

uint64_t sub_21FC53204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21FC53218(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_21FC53218(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = sub_21FC529A0(&v15, v10);
      }
      else {
        uint64_t result = sub_21FC529BC(&v15, v10);
      }
    }
    else
    {
      if (a5 != 1229796429) {
        return 2;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = sub_21FC528B8(&v15, v9);
      }
      else {
        uint64_t result = sub_21FC52984(&v15, v9);
      }
    }
    if (!result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = sub_21FC53360((uint64_t)&v15, &v12, 0);
        if (!result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0;
            }
            else {
              return 7;
            }
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t sub_21FC53358(uint64_t a1, unint64_t *a2)
{
  return sub_21FC53360(a1, a2, 0);
}

uint64_t sub_21FC53360(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  long long v5 = &v4[v3];
  long long v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    unint64_t v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    unint64_t v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t sub_21FC53550(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t sub_21FC5358C(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = sub_21FC53610(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t sub_21FC53610(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unint64_t v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

unint64_t *sub_21FC53678(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t sub_21FC536A4(unint64_t *a1, unint64_t *a2)
{
  _OWORD v10[2] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = sub_21FC53360((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t sub_21FC53764(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  _OWORD v12[3] = *MEMORY[0x263EF8340];
  memset(v12, 170, 24);
  uint64_t result = sub_21FC53360(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return sub_21FC53830(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t sub_21FC53830(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = sub_21FC536A4(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

void *sub_21FC53B04(uint64_t a1)
{
  unint64_t v2 = calloc(8uLL, 1uLL);
  unint64_t v3 = v2;
  if (v2)
  {
    *unint64_t v2 = 0;
    if (a1)
    {
      if (sub_21FC55504((uint64_t)v2))
      {
        memset_s(v3, 8uLL, 0, 8uLL);
        free(v3);
        return 0;
      }
    }
  }
  return v3;
}

void *sub_21FC53B88(int a1, int a2)
{
  switch(a1)
  {
    case 1:
      unint64_t v2 = (void **)&off_267EF80C0;
      goto LABEL_28;
    case 2:
      unint64_t v2 = (void **)&off_267EF80B0;
      goto LABEL_28;
    case 3:
      unint64_t v2 = (void **)&off_267EF80B8;
      goto LABEL_28;
    case 4:
      unint64_t v2 = (void **)&off_267EF80C8;
      goto LABEL_28;
    case 5:
      unint64_t v2 = (void **)&off_267EF80A0;
      goto LABEL_28;
    case 6:
      unint64_t v2 = (void **)&off_267EF8148;
      goto LABEL_28;
    case 7:
      unint64_t v2 = (void **)&off_267EF8140;
      goto LABEL_28;
    case 8:
      unint64_t v4 = (void **)&off_267EF8158;
      goto LABEL_30;
    case 9:
      unint64_t v4 = (void **)&off_267EF8160;
      goto LABEL_30;
    case 10:
      unint64_t v2 = (void **)&off_267EF8170;
      goto LABEL_28;
    case 11:
      unint64_t v2 = (void **)&off_267EF8178;
      goto LABEL_28;
    case 12:
      unint64_t v2 = (void **)&off_267EF8180;
      goto LABEL_28;
    case 13:
      unint64_t v2 = (void **)&off_267EF8188;
      goto LABEL_28;
    case 14:
      unint64_t v2 = (void **)&off_267EF8190;
      goto LABEL_28;
    case 15:
      unint64_t v2 = (void **)&off_267EF8150;
      goto LABEL_28;
    case 16:
      unint64_t v4 = (void **)&off_267EF8100;
      goto LABEL_30;
    case 17:
      unint64_t v2 = (void **)&off_267EF8110;
      goto LABEL_28;
    case 18:
      unint64_t v4 = (void **)&off_267EF8118;
      goto LABEL_30;
    case 19:
      unint64_t v5 = off_267EF8128;
      BOOL v6 = a2 == 3;
      goto LABEL_31;
    case 20:
      unint64_t v4 = (void **)&off_267EF8130;
      goto LABEL_30;
    case 21:
      unint64_t v2 = (void **)&off_267EF8138;
      goto LABEL_28;
    case 22:
      unint64_t v4 = (void **)&off_267EF8120;
      goto LABEL_30;
    case 23:
      unint64_t v4 = (void **)&off_267EF8108;
      goto LABEL_30;
    case 24:
      unint64_t v2 = (void **)&off_267EF8198;
      goto LABEL_28;
    case 25:
      unint64_t v2 = (void **)&off_267EF81A0;
LABEL_28:
      unint64_t v5 = *v2;
      BOOL v6 = a2 == 2;
      goto LABEL_31;
    case 26:
      unint64_t v4 = (void **)&off_267EF8168;
LABEL_30:
      unint64_t v5 = *v4;
      BOOL v6 = a2 == 1;
LABEL_31:
      if (v6) {
        uint64_t result = v5;
      }
      else {
        uint64_t result = 0;
      }
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_21FC53D78(void *a1, int a2, uint64_t *a3)
{
  uint64_t v5 = 3758097090;
  BOOL v6 = (unsigned __int8 *)sub_21FC53B88(a2, 1);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    if (!sub_21FC552E4(a1, v6) && (!a3 || !sub_21FC55ADC(a1, v7, *a3))) {
      return 0;
    }
  }
  return v5;
}

uint64_t sub_21FC53DF4(void ***a1)
{
  uint64_t result = 3758097090;
  if (a1)
  {
    unint64_t v3 = *a1;
    if (*a1)
    {
      *a1 = 0;
      sub_21FC55264(v3);
      memset_s(v3, 8uLL, 0, 8uLL);
      free(v3);
      return 0;
    }
  }
  return result;
}

uint64_t sub_21FC53E58(int a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, void ***a6)
{
  uint64_t v11 = 3758097090;
  unint64_t v12 = off_267EF80E8;
  unsigned __int16 v13 = (void **)calloc(8uLL, 1uLL);
  *unsigned __int16 v13 = 0;
  sub_21FC5595C(v13, (uint64_t)off_267EF8090, (uint64_t)v12);
  BOOL v25 = 0;
  size_t v26 = 0;
  uint64_t v23 = 0;
  rsize_t v24 = 0;
  if (!a6) {
    goto LABEL_14;
  }
  unint64_t v14 = calloc(0x50uLL, 1uLL);
  unint64_t v22 = v14;
  if (!v14)
  {
    uint64_t v11 = 3758604298;
    goto LABEL_14;
  }
  unint64_t v15 = (void **)v14;
  memset_s(v14, 0x50uLL, 0, 0x50uLL);
  if (a4 && sub_21FC55504((uint64_t)v13)
    || sub_21FC55ADC(v13, (uint64_t)off_267EF8098, a2)
    || sub_21FC55ADC(v13, (uint64_t)off_267EF80D8, a3)
    || sub_21FC5561C(v13, &v25, &v26))
  {
LABEL_17:
    sub_21FC54088((uint64_t *)&v22);
    goto LABEL_14;
  }
  uint64_t v16 = sub_21FC54204();
  if (v16)
  {
    uint64_t v11 = v16;
    goto LABEL_17;
  }
  unsigned __int16 v17 = (char *)v23;
  rsize_t v18 = v24;
  *unint64_t v15 = v23;
  v15[1] = (void *)v18;
  *((_DWORD *)v15 + 10) = a1;
  unint64_t v15[2] = &v17[v18];
  long long v20 = 0;
  uint64_t v21 = 0;
  if (sub_21FC550AC((uint64_t)off_267EF80E0, &v20, &v21)) {
    v15[4] = v20;
  }
  if (sub_21FC550AC((uint64_t)off_267EF80B0, &v20, &v21)) {
    v15[3] = v20;
  }
  uint64_t v11 = 0;
  *a6 = v15;
  uint64_t v23 = 0;
  rsize_t v24 = 0;
LABEL_14:
  sub_21FC55264(v13);
  memset_s(v13, 8uLL, 0, 8uLL);
  free(v13);
  memset_s(v25, v26, 0, v26);
  free(v25);
  memset_s(v23, v24, 0, v24);
  free(v23);
  return v11;
}

uint64_t sub_21FC54088(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (!*a1) {
    return 3758097090;
  }
  *a1 = 0;
  if (*(void *)v1)
  {
    memset_s(*(void **)v1, *(void *)(v1 + 8), 0, *(void *)(v1 + 8));
    free(*(void **)v1);
  }
  unint64_t v2 = *(void **)(v1 + 48);
  if (v2)
  {
    memset_s(v2, *(void *)(v1 + 56), 0, *(void *)(v1 + 56));
    free(*(void **)(v1 + 48));
  }
  unint64_t v3 = *(void **)(v1 + 64);
  if (v3)
  {
    memset_s(v3, *(void *)(v1 + 72), 0, *(void *)(v1 + 72));
    free(*(void **)(v1 + 64));
  }
  memset_s((void *)v1, 0x50uLL, 0, 0x50uLL);
  free((void *)v1);
  return 0;
}

uint64_t sub_21FC5413C(int a1, const void *a2, size_t a3, uint64_t *a4)
{
  uint64_t v4 = 3758097090;
  if (a2)
  {
    if (a3)
    {
      if (sub_21FC54F6C((uint64_t)a2) == a3)
      {
        uint64_t v4 = 3758604298;
        unint64_t v9 = calloc(0x50uLL, 1uLL);
        unint64_t v12 = v9;
        if (v9)
        {
          uint64_t v10 = (uint64_t)v9;
          memset_s(v9, 0x50uLL, 0, 0x50uLL);
          *(_DWORD *)(v10 + 40) = a1;
          if (sub_21FC543E4(v10, a2, a3))
          {
            sub_21FC54088((uint64_t *)&v12);
          }
          else
          {
            uint64_t v4 = 0;
            *a4 = v10;
          }
        }
      }
    }
  }
  return v4;
}

uint64_t sub_21FC54204()
{
  int v0 = MEMORY[0x270FA5388]();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  size_t v6 = v5;
  unint64_t v8 = v7;
  int v9 = v0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  mach_port_t v10 = sub_21FC54CEC();
  if (v10)
  {
    if (v8)
    {
      mach_port_t v11 = v10;
      uint64_t v12 = 3758097090;
      if (sub_21FC54F6C((uint64_t)v8) == v6)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000;
        uint64_t input = v9;
        uint64_t v12 = IOConnectCallMethod(v11, 0x2Bu, &input, 1u, v8, v6, 0, 0, __src, &__count);
        if (!v12 && v4 && v2)
        {
          unsigned __int16 v13 = calloc(__count, 1uLL);
          void *v4 = v13;
          if (v13)
          {
            memcpy(v13, __src, __count);
            uint64_t v12 = 0;
            *unint64_t v2 = __count;
          }
          else
          {
            uint64_t v12 = 3758097085;
          }
        }
      }
    }
    else
    {
      uint64_t v12 = 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_operation", ":", 457, "", 0, "", "");
    uint64_t v12 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v12;
}

uint64_t sub_21FC543E4(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (!sub_21FC550AC((uint64_t)off_267EF80E0, &v8, &v9)) {
    return 3758097090;
  }
  if (*(void *)a1)
  {
    memset_s(*(void **)a1, *(void *)(a1 + 8), 0, *(void *)(a1 + 8));
    free(*(void **)a1);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
  size_t v6 = calloc(a3, 1uLL);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = a3;
  if (!v6) {
    return 3758604298;
  }
  memcpy(v6, a2, a3);
  *(void *)(a1 + 16) = *(void *)a1 + *(void *)(a1 + 8);
  if (sub_21FC550AC((uint64_t)off_267EF80E0, &v8, &v9)) {
    *(void *)(a1 + 32) = v8;
  }
  if ((sub_21FC550AC((uint64_t)off_267EF80B0, &v8, &v9) & 1) != 0
    || (uint64_t result = sub_21FC550AC((uint64_t)off_267EF80A8, &v8, &v9), result))
  {
    uint64_t result = 0;
    *(void *)(a1 + 24) = v8;
  }
  return result;
}

uint64_t sub_21FC5451C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = 3758604298;
  if (a1
    && (!*(void *)(a1 + 48) || !sub_21FC55504((uint64_t)a2))
    && (!a3 || !sub_21FC55504((uint64_t)a2)))
  {
    sub_21FC552E4(a2, (unsigned __int8 *)off_267EF80B0);
    return 0;
  }
  return v3;
}

uint64_t sub_21FC545A8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = 3758097090;
  uint64_t v8 = off_267EF80F0;
  uint64_t v9 = (void **)calloc(8uLL, 1uLL);
  *uint64_t v9 = 0;
  sub_21FC5595C(v9, (uint64_t)off_267EF8090, (uint64_t)v8);
  __s = 0;
  rsize_t __n = 0;
  if (!sub_21FC5451C((uint64_t)a1, v9, a2))
  {
    sub_21FC552E4(v9, (unsigned __int8 *)off_267EF80A0);
    sub_21FC552E4(v9, (unsigned __int8 *)off_267EF80E0);
    if (!sub_21FC5596C(v9, (uint64_t)off_267EF80A0, a4)
      && !sub_21FC557EC(v9, (uint64_t)off_267EF80E0, *a1, a1[2])
      && !sub_21FC5561C(v9, &__s, &__n))
    {
      uint64_t v7 = sub_21FC54204();
    }
  }
  sub_21FC55264(v9);
  memset_s(v9, 8uLL, 0, 8uLL);
  free(v9);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v7;
}

uint64_t sub_21FC5472C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7 = a7;
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)&long long v23 = a6;
  *((void *)&v23 + 1) = a6 + a7;
  int v22 = 0;
  uint64_t v21 = 0;
  sub_21FC551F4(&v23, 4, &v22, &v21);
  if ((v10 & 1) == 0)
  {
    uint64_t v21 = a6;
    int v22 = v7;
  }
  uint64_t v11 = 3758097090;
  int v12 = sub_21FC5493C((uint64_t)a1);
  if ((v12 - 4) < 2)
  {
    char v19 = 0;
    goto LABEL_8;
  }
  if ((v12 - 7) < 2)
  {
    uint64_t v13 = MEMORY[0x223C5BFA0]();
    char v19 = 0;
    if (v13)
    {
LABEL_9:
      MEMORY[0x270FA5388]();
      unint64_t v15 = &v18[-v14];
      bzero(&v18[-v14], v14);
      uint64_t v20 = 0;
      uint64_t v16 = sub_21FC5499C(a1, &v20);
      if (v16 && !MEMORY[0x223C5BFC0](v13, v20, v16, v15) && !ccec_verify())
      {
        if (!v19) {
          return 3758604294;
        }
        return 0;
      }
      return v11;
    }
LABEL_8:
    uint64_t v13 = MEMORY[0x223C5BF90]();
    goto LABEL_9;
  }
  if (v12 == 3)
  {
    uint64_t v20 = 0;
    if (sub_21FC5499C(a1, &v20))
    {
      if (v20 == 32 && v21 && v22 == 64)
      {
        ccsha512_di();
        if (cced25519_verify()) {
          return 3758604294;
        }
        return 0;
      }
    }
  }
  return v11;
}

uint64_t sub_21FC5493C(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  uint64_t result = sub_21FC550AC((uint64_t)off_267EF80D8, &v2, &v3);
  if (result) {
    return sub_21FC55188();
  }
  return result;
}

uint64_t sub_21FC5499C(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unsigned int v16 = 0;
  uint64_t v15 = 0;
  if (!a1[4]) {
    return 0;
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (sub_21FC550AC((uint64_t)off_267EF80D0, &v13, &v14))
  {
    *(void *)&long long v12 = v13;
    *((void *)&v12 + 1) = v13 + v14;
    sub_21FC551F4(&v12, 4, &v16, &v15);
  }
  int v4 = sub_21FC5493C((uint64_t)a1);
  if ((v4 - 7) < 2)
  {
    uint64_t v5 = MEMORY[0x223C5BFA0]();
    goto LABEL_9;
  }
  if ((v4 - 4) <= 1)
  {
    uint64_t v5 = MEMORY[0x223C5BF90]();
LABEL_9:
    if (v5 && v16 == (unint64_t)(j__cczp_bitlen() + 7) >> 3)
    {
      if (v15 && !a1[8])
      {
        MEMORY[0x270FA5388]();
        bzero((char *)&v11 - v7, v7);
        ccec_compact_import_pub();
        size_t v8 = (2 * sub_21FC54EDC()) | 1;
        uint64_t v9 = calloc(v8, 1uLL);
        a1[8] = v9;
        a1[9] = v8;
        if (v9) {
          ccec_export_pub();
        }
        cc_clear();
      }
      uint64_t v10 = a1[9];
      uint64_t v15 = a1[8];
      unsigned int v16 = v10;
    }
  }
  *a2 = v16;
  return v15;
}

uint64_t sub_21FC54B74(uint64_t *a1, void *a2)
{
  uint64_t result = *a1;
  *a2 = a1[1];
  return result;
}

uint64_t sub_21FC54B80(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21FC54BA0(a1, (uint64_t)off_267EF80F8, a2, a3, a4, a5);
}

uint64_t sub_21FC54BA0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = 3758097090;
  long long v12 = (void **)calloc(8uLL, 1uLL);
  *long long v12 = 0;
  sub_21FC5595C(v12, (uint64_t)off_267EF8090, a2);
  __s = 0;
  rsize_t __n = 0;
  if (a1)
  {
    if (a5)
    {
      if (a6)
      {
        if (!sub_21FC5451C((uint64_t)a1, v12, a3))
        {
          sub_21FC552E4(v12, (unsigned __int8 *)off_267EF80E0);
          if (!sub_21FC557EC(v12, (uint64_t)off_267EF80E0, *a1, a1[2])
            && !sub_21FC5561C(v12, &__s, &__n))
          {
            uint64_t v11 = sub_21FC54204();
          }
        }
      }
    }
  }
  sub_21FC55264(v12);
  memset_s(v12, 8uLL, 0, 8uLL);
  free(v12);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v11;
}

uint64_t sub_21FC54CEC()
{
  if (qword_267EF8228 != -1) {
    dispatch_once(&qword_267EF8228, &unk_26D157BC8);
  }
  dispatch_sync((dispatch_queue_t)qword_267EF8230, &unk_26D157BA8);
  uint64_t result = dword_267EF8220;
  if (!dword_267EF8220)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_267EF8220;
  }
  return result;
}

void sub_21FC54D78()
{
  if (!dword_267EF8220) {
    dword_267EF8220 = sub_21FC54DE4("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

dispatch_queue_t sub_21FC54DB8()
{
  dispatch_queue_t result = dispatch_queue_create("aks-client-queue", 0);
  qword_267EF8230 = (uint64_t)result;
  return result;
}

uint64_t sub_21FC54DE4(char *path, const char *a2)
{
  kern_return_t v7;
  CFDictionaryRef v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  mach_port_t v3 = *MEMORY[0x263F0EC90];
  io_service_t v4 = IORegistryEntryFromPath(*MEMORY[0x263F0EC90], path);
  uint64_t v5 = (task_port_t *)MEMORY[0x263EF8960];
  if (!v4 || (io_object_t v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x263EF8960], 0, &connect), IOObjectRelease(v6), v7))
  {
    size_t v8 = IOServiceMatching(a2);
    io_service_t MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      uint64_t v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  dispatch_queue_t result = connect;
  if (connect)
  {
    long long v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    dispatch_queue_t result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

unint64_t sub_21FC54EDC()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

BOOL sub_21FC54F00(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5 = sub_21FC54F6C((uint64_t)a1);
  return v5 == sub_21FC54F6C((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t sub_21FC54F6C(uint64_t a1)
{
  if (ccder_blob_decode_tag() && ccder_blob_decode_len()) {
    return a1 - a1;
  }
  else {
    return 0;
  }
}

uint64_t sub_21FC54FD4()
{
  uint64_t result = ccder_blob_decode_range();
  if (result)
  {
    if (ccder_blob_decode_sequence_tl())
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result) {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_21FC550AC(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    sub_21FC54FD4();
    if (a2)
    {
      if (a3)
      {
        *a2 = 0;
        *a3 = 0;
      }
    }
  }
  return 0;
}

BOOL sub_21FC55124(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v8 = sub_21FC54F00(*(const void **)a5, *(void *)a5 + *(unsigned __int8 *)(*(void *)a5 + 1) + 2, a1);
  if (v8)
  {
    *(unsigned char *)(a5 + 24) = 1;
    *(void *)(a5 + 8) = a3;
    *(void *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t sub_21FC55188()
{
  return 0;
}

double sub_21FC551F4(long long *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  long long v8 = *a1;
  if (ccder_blob_decode_range())
  {
    *a4 = 0;
    *a3 = 0;
    double result = *(double *)&v8;
    *a1 = v8;
  }
  return result;
}

uint64_t sub_21FC55264(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    uint64_t v2 = *a1;
    if (!*a1) {
      break;
    }
    mach_port_t v3 = (void *)*((void *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((void *)v2 + 2), 0, *((void *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t sub_21FC552E4(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = (void **)a1;
  uint64_t result = (uint64_t)sub_21FC55380(a1, a2);
  if (result)
  {
    uint64_t v4 = result;
    for (uint64_t i = *v2; i != (void *)result; uint64_t i = (void *)*i)
      uint64_t v2 = (void **)i;
    *uint64_t v2 = *(void **)result;
    io_object_t v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(void *)(v4 + 16), 0, *(void *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

void *sub_21FC55380(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (void *)*a1;
  if (*a1)
  {
    do
    {
      size_t v5 = (const void *)v2[1];
      if (ccder_blob_decode_sequence_tl() && sub_21FC54F00(a2, (uint64_t)&a2[a2[1] + 2], v5)) {
        break;
      }
      uint64_t v2 = (void *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t sub_21FC55404(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  return a1;
}

uint64_t sub_21FC55504(uint64_t a1)
{
  if (a1) {
    return sub_21FC54FD4() - 1;
  }
  else {
    return 4294967285;
  }
}

uint64_t sub_21FC5554C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  long long v8 = (unsigned __int8 *)sub_21FC55404(a1);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    if (!sub_21FC552E4(a5, v8) && !sub_21FC557EC(a5, v9, a3, a3 + a4)) {
      return 1;
    }
  }
  fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0;
}

uint64_t sub_21FC5561C(void *a1, void *a2, size_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        size_t v7 = (void *)*a1;
        if (*a1)
        {
          unint64_t v8 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          do
          {
            v10 += v7[2];
            size_t v7 = (void *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (rsize_t v11 = -v9, (v12 = calloc(-v9, 1uLL)) != 0))
          {
            uint64_t v13 = v12;
            uint64_t v14 = (void *)*a1;
            if (*a1)
            {
              uint64_t v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                uint64_t v14 = (void *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_21FC55CF4);
            size_t v16 = ccder_sizeof();
            uint64_t v17 = (char *)calloc(v16, 1uLL);
            uint64_t v18 = v17;
            if (v17)
            {
              BOOL v25 = v17;
              size_t v26 = &v17[v16];
              unint64_t v19 = v8 - 1;
              uint64_t v20 = (uint64_t)v13 - v9 - 8;
              while (!__CFADD__(v19++, 1))
              {
                uint64_t v22 = v20 - 16;
                char v23 = ccder_blob_encode_body();
                uint64_t v20 = v22;
                if ((v23 & 1) == 0) {
                  goto LABEL_16;
                }
              }
              if (!ccder_blob_encode_tl() || v25 != v26)
              {
LABEL_16:
                uint64_t v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              uint64_t v3 = 0;
              *a2 = v18;
              *a3 = v16;
              uint64_t v18 = 0;
            }
            else
            {
              uint64_t v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_21FC557EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (sub_21FC54F6C(a3) <= (unint64_t)(a4 - a3))
    {
      size_t v6 = ccder_sizeof();
      size_t v7 = (char *)calloc(v6, 1uLL);
      if (!v7) {
        return 4294967279;
      }
      unint64_t v8 = v7;
      size_t v16 = &v7[v6];
      if (ccder_blob_encode_body())
      {
        int v9 = ccder_blob_encode_body();
        uint64_t v10 = v16;
        if (!v9) {
          uint64_t v10 = 0;
        }
        uint64_t v17 = v10;
        int v11 = ccder_blob_encode_tl();
        long long v12 = v17;
        if (!v11) {
          long long v12 = 0;
        }
        if (v12 && v12 == v8)
        {
          uint64_t v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t result = 0;
            v15[1] = v8;
            unint64_t v15[2] = v6;
            *uint64_t v15 = *a1;
            *a1 = v15;
            return result;
          }
        }
      }
      memset_s(v8, v6, 0, v6);
      free(v8);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_21FC5595C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_21FC557EC(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t sub_21FC5596C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    ccder_sizeof();
    size_t v5 = ccder_sizeof();
    size_t v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      size_t v7 = v6;
      uint64_t v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl()) {
        goto LABEL_19;
      }
      int v8 = ccder_blob_encode_body();
      int v9 = v15;
      if (!v8) {
        int v9 = 0;
      }
      size_t v16 = v9;
      int v10 = ccder_blob_encode_tl();
      int v11 = v16;
      if (!v10) {
        int v11 = 0;
      }
      BOOL v12 = v11 && v11 == v7;
      if (v12 && (uint64_t v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        uint64_t v14 = v13;
        uint64_t result = 0;
        v14[1] = v7;
        unint64_t v14[2] = v5;
        *uint64_t v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_21FC55ADC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  v25[1] = *MEMORY[0x263EF8340];
  unint64_t v5 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    uint64_t v10 = 8;
  }
  else
  {
    uint64_t v6 = 9;
    uint64_t v7 = 48;
    uint64_t v8 = 1;
    while ((unint64_t)(v6 - 2) >= 2)
    {
      uint64_t v9 = a3 >> v7;
      --v6;
      v7 -= 8;
      if (v5 != v9)
      {
        uint64_t v8 = v6 - 1;
        goto LABEL_8;
      }
    }
    uint64_t v6 = 2;
LABEL_8:
    if ((((a3 >> (8 * v8 - 8)) ^ v5) & 0x80) != 0) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = v8;
    }
  }
  v25[0] = 0;
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    size_t v12 = ccder_sizeof();
    uint64_t v13 = (char *)calloc(v12, 1uLL);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = v10;
      do
      {
        *((unsigned char *)v25 + v15 - 1) = v3;
        v3 >>= 8;
        --v15;
      }
      while (v15);
      char v23 = &v13[v12];
      if ((ccder_blob_encode_body() & 1) == 0 || !ccder_blob_encode_tl()) {
        goto LABEL_30;
      }
      int v16 = ccder_blob_encode_body();
      uint64_t v17 = v23;
      if (!v16) {
        uint64_t v17 = 0;
      }
      uint64_t v24 = v17;
      int v18 = ccder_blob_encode_tl();
      unint64_t v19 = v24;
      if (!v18) {
        unint64_t v19 = 0;
      }
      BOOL v20 = v19 && v19 == v14;
      if (v20 && (uint64_t v21 = calloc(0x18uLL, 1uLL)) != 0)
      {
        uint64_t v22 = v21;
        uint64_t result = 0;
        v22[1] = v14;
        v22[2] = v12;
        void *v22 = *a1;
        *a1 = v22;
      }
      else
      {
LABEL_30:
        memset_s(v14, v12, 0, v12);
        free(v14);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_21FC55CF4(const void **a1, void **a2)
{
  unint64_t v5 = *a1;
  __s2 = *a2;
  if (!ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !v5
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !__s2)
  {
    return 4294967293;
  }
  int v2 = memcmp(v5, __s2, 0);
  if (v2 > 0) {
    return 1;
  }
  else {
    return ((v2 < 0) << 31 >> 31);
  }
}

uint64_t sub_21FC55E20(__CFArray **a1)
{
  kern_return_t RegistryEntryID;
  CFNumberRef v12;
  CFNumberRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  __CFString *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  __CFDictionary *v23;
  __CFArray **v25;
  __CFArray *theArray;
  CFAllocatorRef v27;
  CFBooleanRef cf;
  io_iterator_t existing;
  uint64_t entryID;
  int valuePtr;

  uint64_t v1 = 3758097090;
  if (a1)
  {
    existing = 0;
    uint64_t v3 = IOServiceMatching("AppleAuthCP");
    CFDictionarySetValue(v3, @"InternalComponent", (const void *)*MEMORY[0x263EFFB40]);
    uint64_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], v3, &existing);
    if (MatchingServices)
    {
      return MatchingServices;
    }
    else
    {
      BOOL v25 = a1;
      CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      io_object_t v6 = IOIteratorNext(existing);
      if (v6)
      {
        io_registry_entry_t v7 = v6;
        __int16 v27 = v5;
        do
        {
          CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, @"InternalComponent", v5, 0);
          if (!CFProperty)
          {
            char v23 = 0;
LABEL_38:
            int v16 = -536870206;
            goto LABEL_40;
          }
          CFBooleanRef v9 = CFProperty;
          valuePtr = 0;
          entryID = 0;
          if (!CFBooleanGetValue(CFProperty))
          {
            char v23 = 0;
            Mutable = 0;
            uint64_t v22 = v9;
            int v16 = -536870206;
            goto LABEL_34;
          }
          Mutable = CFDictionaryCreateMutable(v5, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          if (!Mutable) {
            goto LABEL_45;
          }
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          if (RegistryEntryID)
          {
            int v16 = RegistryEntryID;
            char v23 = 0;
LABEL_49:
            uint64_t v22 = v9;
LABEL_34:
            CFRelease(v22);
            goto LABEL_35;
          }
          size_t v12 = CFNumberCreate(v5, kCFNumberSInt64Type, &entryID);
          if (!v12)
          {
LABEL_45:
            char v23 = 0;
            int v16 = -536870181;
            goto LABEL_49;
          }
          uint64_t v13 = v12;
          CFDictionaryAddValue(Mutable, @"IORegistryEntryID", v12);
          uint64_t v14 = IORegistryEntryCreateCFProperty(v7, @"flags", v5, 0);
          if (v14) {
            CFDictionaryAddValue(Mutable, @"flags", v14);
          }
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &valuePtr);
          uint64_t v15 = BYTE2(valuePtr) << 16;
          int v16 = -536870201;
          cf = v9;
          if (v15 == 0x10000)
          {
            uint64_t v17 = @"Battery";
          }
          else
          {
            if (v15 != 196608)
            {
              char v23 = 0;
              unint64_t v19 = 0;
              uint64_t v21 = 0;
              uint64_t v22 = 0;
              int v18 = 0;
              goto LABEL_25;
            }
            uint64_t v17 = @"TouchController";
          }
          CFDictionaryAddValue(Mutable, @"ComponentName", v17);
          int v18 = IORegistryEntryCreateCFProperty(v7, @"authErrorDescription", v5, 0);
          if (v18)
          {
            CFDictionaryAddValue(Mutable, @"authErrorDescription", v18);
            unint64_t v19 = IORegistryEntryCreateCFProperty(v7, @"AuthPassed", v5, 0);
            if (v19) {
              CFDictionaryAddValue(Mutable, @"AuthPassed", v19);
            }
            BOOL v20 = IORegistryEntryCreateCFProperty(v7, @"isTrusted", v5, 0);
            uint64_t v21 = v20;
            if (v20) {
              CFDictionaryAddValue(Mutable, @"isTrusted", v20);
            }
            uint64_t v22 = IORegistryEntryCreateCFProperty(v7, @"isTrustedForUI", v5, 0);
            if (v22) {
              CFDictionaryAddValue(Mutable, @"isTrustedForUI", v22);
            }
            int v16 = 0;
            char v23 = Mutable;
          }
          else
          {
            char v23 = 0;
            unint64_t v19 = 0;
            uint64_t v21 = 0;
            uint64_t v22 = 0;
          }
LABEL_25:
          CFRelease(cf);
          CFRelease(v13);
          if (v14) {
            CFRelease(v14);
          }
          if (v18) {
            CFRelease(v18);
          }
          if (v19) {
            CFRelease(v19);
          }
          if (v21) {
            CFRelease(v21);
          }
          if (v22) {
            goto LABEL_34;
          }
LABEL_35:
          if (Mutable)
          {
            CFAllocatorRef v5 = v27;
            if (!v16) {
              goto LABEL_40;
            }
            CFRelease(Mutable);
            goto LABEL_38;
          }
          CFAllocatorRef v5 = v27;
LABEL_40:
          IOObjectRelease(v7);
          if (v23 && !v16)
          {
            CFArrayAppendValue(theArray, v23);
            CFRelease(v23);
          }
          io_registry_entry_t v7 = IOIteratorNext(existing);
        }
        while (v7);
      }
      IOObjectRelease(existing);
      uint64_t v1 = 0;
      char *v25 = theArray;
    }
  }
  return v1;
}

uint64_t sub_21FC56228(uint64_t a1)
{
  uint64_t result = sub_21FC56268(a1 + 88, (uint64_t)&off_26452AC98);
  if (!result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

uint64_t sub_21FC56268(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t sub_21FC56290(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t sub_21FC562B0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 > a1[1]) {
      goto LABEL_20;
    }
    unint64_t v5 = *a1;
    unint64_t v6 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (a2)
    {
      if (v6 < v5) {
        goto LABEL_20;
      }
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (!result) {
        return result;
      }
      if (v5 != v6) {
        return 0;
      }
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_21FC56444()
{
  return ccder_blob_decode_tl();
}

uint64_t sub_21FC564A8(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 - 1;
    uint64_t v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = sub_21FC581F8((unint64_t *)v17, &v15);
      if (result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3) {
        __break(0x5519u);
      }
      *uint64_t v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    uint64_t result = 0;
    if (a5) {
      *a5 = v6;
    }
  }
  return result;
}

uint64_t sub_21FC565C8(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  unint64_t v68 = 0;
  uint64_t v69 = 0;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915;
  unint64_t v66 = *a2;
  unint64_t v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return v10;
  }
  uint64_t v12 = v69;
  unint64_t v13 = v66;
  unint64_t v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v67) {
    goto LABEL_186;
  }
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  unint64_t v62 = v13;
  unint64_t v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68)) {
      goto LABEL_187;
    }
    uint64_t v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v64 = v62 + v68;
      unint64_t v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl()) {
    return 720917;
  }
  unint64_t v18 = v64;
  unint64_t v17 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v19 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v64;
  *(void *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19)) {
    goto LABEL_187;
  }
  unint64_t v20 = v18 + v19;
  if (v18 > v20 || v20 > v17) {
    goto LABEL_186;
  }
  unint64_t v64 = v20;
  if (!sub_21FC562B0(&v64, (unint64_t *)(a1 + 152))) {
    return 720918;
  }
  if (!ccder_blob_decode_tl()) {
    return 720919;
  }
  unint64_t v22 = v64;
  unint64_t v21 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v23 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v64;
  *(void *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23)) {
    goto LABEL_187;
  }
  unint64_t v24 = v22 + v23;
  if (v22 > v24 || v24 > v21) {
    goto LABEL_186;
  }
  unint64_t v64 = v24;
  if (!ccder_blob_decode_tl()) {
    return 720920;
  }
  unint64_t v26 = v64;
  unint64_t v25 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v27 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v64;
  *(void *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27)) {
    goto LABEL_187;
  }
  unint64_t v28 = v26 + v27;
  if (v26 > v28 || v28 > v25) {
    goto LABEL_186;
  }
  unint64_t v64 = v28;
  if (!ccder_blob_decode_tl()) {
    return 720921;
  }
  unint64_t v29 = v64;
  unint64_t v30 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v31 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v64;
  *(void *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31)) {
    goto LABEL_187;
  }
  unint64_t v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30) {
    goto LABEL_186;
  }
  unint64_t v64 = v29 + v31;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return 720922;
  }
  unint64_t v33 = v64;
  unint64_t v34 = v68;
  unint64_t v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32) {
      goto LABEL_186;
    }
    *(void *)(a1 + 88) = v32;
    *(void *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34)) {
      goto LABEL_187;
    }
    unint64_t v36 = v33 + v34;
    if (v33 > v36 || v36 > v65) {
      goto LABEL_186;
    }
    unint64_t v63 = v65;
    unint64_t v64 = v36;
    unint64_t v62 = v36;
    if (ccder_blob_decode_tl()) {
      return 720923;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl()) {
      return 720924;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl())
    {
      unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68)) {
        goto LABEL_187;
      }
      if (v62 > v62 + v68 || v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v60 = v62;
      unint64_t v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68) {
        return 720925;
      }
      unint64_t v37 = v60;
      if (__CFADD__(v60, v68)) {
LABEL_187:
      }
        __break(0x5513u);
      unint64_t v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61) {
        goto LABEL_186;
      }
      unint64_t v61 = v60 + v68;
      *(unsigned char *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3) {
        BOOL v39 = a4 == 0;
      }
      else {
        BOOL v39 = 1;
      }
      int v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        unsigned __int8 v53 = 0;
        int v41 = 0;
        do
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
          char v57 = 0;
          uint64_t v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0) {
            return 720926;
          }
          unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          if (v60 > v60 + v56 || v60 + v56 > v61) {
            goto LABEL_186;
          }
          unint64_t v54 = v60;
          unint64_t v55 = v60 + v56;
          if (!ccder_blob_decode_tl()) {
            return 720927;
          }
          if (v55 < v54 || v68 > v55 - v54) {
            goto LABEL_186;
          }
          unint64_t v58 = v54;
          unint64_t v59 = v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (!sub_21FC56F84(&v54, 1, &v57)) {
            return 720928;
          }
          if (!ccder_blob_decode_tl()) {
            return 720929;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v55 != v54 + v68) {
            return 720929;
          }
          if (v40 && !sub_21FC56290((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54) {
              goto LABEL_186;
            }
            unint64_t v43 = v68;
            if (v68 > v55 - v54) {
              goto LABEL_186;
            }
            *(void *)(a1 + 248) = v54;
            *(void *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 15)
            {
              uint64_t v16 = 720930;
              if ((v41 & 1) != 0 || (sub_21FC5709C() & 1) == 0) {
                return v16;
              }
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 19)
            {
              uint64_t v16 = 720931;
              if ((v41 & 2) != 0 || (sub_21FC5716C(&v54, (void *)(a1 + 200), (unsigned char *)(a1 + 265)) & 1) == 0) {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 35)
            {
              uint64_t v16 = 720932;
              if ((v41 & 4) != 0
                || (sub_21FC5723C(&v54, (unint64_t *)(a1 + 168), (void *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 14)
            {
              uint64_t v16 = 720933;
              if ((v41 & 8) != 0
                || (sub_21FC57364(&v54, (unint64_t *)(a1 + 184), (void *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 37)
            {
              uint64_t v16 = 720934;
              if ((v41 & 0x10) != 0
                || (sub_21FC57428(&v54, (unint64_t *)(a1 + 208), (void *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 17)
            {
              uint64_t v16 = 720935;
              if ((v41 & 0x20) != 0
                || (sub_21FC57538(&v54, (unint64_t *)(a1 + 224), (void *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            uint64_t v16 = 720936;
            if (!sub_21FC5760C((uint64_t)&v58, (uint64_t)v70, v53)) {
              return v16;
            }
            uint64_t result = sub_21FC57698((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!result) {
              return v16;
            }
            if (v53 == 0xFF) {
              goto LABEL_189;
            }
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (v57) {
            *(unsigned char *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v54 != v55) {
            return 720926;
          }
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          unint64_t v37 = v60 + v56;
          if (v60 > v60 + v56) {
            goto LABEL_186;
          }
          unint64_t v38 = v61;
          if (v37 > v61) {
            goto LABEL_186;
          }
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38) {
        return 720925;
      }
      if (v37 > v65 || v64 > v37) {
        goto LABEL_186;
      }
      unint64_t v64 = v37;
    }
    if (*(void *)(a1 + 32) < 3uLL)
    {
      uint64_t v16 = 720915;
      if (v64 != v65) {
        return v16;
      }
LABEL_170:
      if (__CFADD__(v66, v69)) {
        goto LABEL_187;
      }
      if (v66 > v66 + v69 || v66 + v69 > v67) {
        goto LABEL_186;
      }
      v66 += v69;
      if (!sub_21FC562B0(&v66, (unint64_t *)(a1 + 40))) {
        return 720937;
      }
      *(void *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v60 = 0;
      uint64_t result = ccder_blob_decode_bitstring();
      if (!result) {
        return 720938;
      }
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((void *)&v70[0] + 1) >= *(void *)&v70[0])
        {
          unint64_t v51 = (v60 + 7) >> 3;
          if (v51 <= *((void *)&v70[0] + 1) - *(void *)&v70[0])
          {
            *(void *)(a1 + 56) = *(void *)&v70[0];
            *(void *)(a1 + 64) = v51;
            unint64_t v52 = v67;
            if (v66 <= v67)
            {
              uint64_t v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t sub_21FC56F84(void *a1, int a2, unsigned char *a3)
{
  if (*a1 > a1[1]) {
    __break(0x5519u);
  }
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2) {
    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

uint64_t sub_21FC5709C()
{
  uint64_t result = ccder_blob_decode_bitstring();
  if (result) {
    return 0;
  }
  return result;
}

uint64_t sub_21FC5716C(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    uint64_t result = sub_21FC56F84(a1, 1, a3);
    if (result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3) {
          return 0;
        }
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t sub_21FC5723C(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_15;
    }
    if (v7 - 0x5555555555555556 != a1[1]) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_16;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_16;
      }
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      unint64_t v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_21FC57364(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t sub_21FC57428(unint64_t *a1, unint64_t *a2, void *a3)
{
  int v6 = ccder_blob_decode_tl();
  uint64_t result = 0;
  if (v6)
  {
    if (*a1 > a1[1]) {
      goto LABEL_11;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_11;
    }
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1]) {
LABEL_11:
    }
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t sub_21FC57538(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result == 1)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t sub_21FC5760C(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    uint64_t result = sub_21FC56268((uint64_t)v5, a2 + 16 * v6);
    if (!result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16 * a3);
      *unint64_t v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_21FC57698(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (a6) {
    a5 = 0;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_275;
    }
LABEL_159:
    int v44 = 0;
LABEL_160:
    if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 27)
    {
      return sub_21FC58834(result, a2, a3, a4, a5);
    }
    if (v44)
    {
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
      {
        uint64_t result = sub_21FC56444();
        if (!result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x400000;
        goto LABEL_275;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
      {
        uint64_t result = sub_21FC56444();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 37748736;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4354)
      {
        uint64_t result = sub_21FC56444();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 0x8004000000;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
      {
        return (uint64_t)sub_21FC58A58((unint64_t *)result, a4, a5);
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
      {
        unint64_t v52 = *(void *)result;
        unint64_t v51 = *(void *)(result + 8);
        if (a5)
        {
          if (v52 > v51) {
            goto LABEL_281;
          }
          *a5 = v52;
          a5[1] = v51 - v52;
        }
        *a4 |= 0x80000000uLL;
LABEL_243:
        if (v52 <= v51)
        {
          *(void *)uint64_t result = v51;
          return 1;
        }
LABEL_281:
        __break(0x5519u);
        return result;
      }
    }
LABEL_242:
    unint64_t v52 = *(void *)result;
    unint64_t v51 = *(void *)(result + 8);
    goto LABEL_243;
  }
  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0;
LABEL_205:
      uint64_t v24 = v54 | v55;
LABEL_275:
      *a4 = v24;
      return 1;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_209;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_209:
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
    {
      return sub_21FC585C4((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = sub_21FC56444();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
    {
      return sub_21FC586A8();
    }
    int v44 = 1;
    goto LABEL_160;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_242;
    }
    goto LABEL_159;
  }
  if (*(void *)a2 == 0xB6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    return sub_21FC58204((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 49)
  {
    char v56 = 0;
    uint64_t result = sub_21FC56F84((void *)result, 0, &v56);
    if (result)
    {
      uint64_t v53 = 0x10000080002;
      if (!v56) {
        uint64_t v53 = 0x20000040001;
      }
      *a4 |= v53;
    }
    return result;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 44)
  {
    return sub_21FC58340((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 36)
  {
    return sub_21FC584D8((unint64_t *)result);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 22)
  {
    uint64_t result = sub_21FC56444();
    if (!result) {
      return result;
    }
    uint64_t v54 = *a4;
    uint64_t v55 = 1048584;
    goto LABEL_205;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 19)
  {
    uint64_t result = sub_21FC56444();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x8000000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xA6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    *a4 |= 0x1000000uLL;
    goto LABEL_242;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 29)
  {
    uint64_t result = sub_21FC56444();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x2000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 14)
  {
    uint64_t result = sub_21FC56444();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x4000000;
    goto LABEL_275;
  }
  if (*(void *)a2 != 0x86463F78648862ALL || *(unsigned char *)(a2 + 8) != 3) {
    goto LABEL_242;
  }
  return sub_21FC58904((unint64_t *)result, a4, a5);
}

uint64_t sub_21FC580D4(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  if (!ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = *a2;
  uint64_t result = sub_21FC565C8((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if (result) {
    return v8;
  }
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  uint64_t v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556) {
    return v8;
  }
  unint64_t v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    sub_21FC56228((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t sub_21FC581F8(unint64_t *a1, unint64_t *a2)
{
  return sub_21FC580D4(a1, a2, 0, 0);
}

BOOL sub_21FC58204(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  unint64_t v11 = v3 - *a1;
  if (ccder_blob_decode_tl()) {
    goto LABEL_5;
  }
  if (*a1 > a1[1]) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    unint64_t v8 = v12;
    unint64_t v7 = v13;
    if (v12 > v13) {
      goto LABEL_19;
    }
    *a1 = v12;
    a1[1] = v13;
    unint64_t v9 = v11;
  }
  else
  {
    unint64_t v8 = *a1;
    unint64_t v7 = a1[1];
    unint64_t v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9)) {
    goto LABEL_20;
  }
  if (v7 == v8 + v9)
  {
    if (!v9) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t sub_21FC58340(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    unint64_t v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8) {
        goto LABEL_12;
      }
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_21FC584D8(unint64_t *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556) {
        return 0;
      }
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_21FC585C4(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556) {
        return 0;
      }
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL) {
          goto LABEL_13;
        }
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_21FC586A8()
{
  return 0;
}

uint64_t sub_21FC58834(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = sub_21FC56444();
  if (result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    unint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if ((unint64_t)v12 >= v10 - 1) {
        break;
      }
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0;
      }
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t sub_21FC58904(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_17;
    }
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_18;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
            goto LABEL_18;
          }
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        unint64_t v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          unint64_t v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *sub_21FC58A58(unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

uint64_t sub_21FC58AB8(const char *a1, size_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (qword_267EF8240 != -1) {
    dispatch_once(&qword_267EF8240, &unk_26D157BE8);
  }
  unint64_t v4 = &_os_log_internal;
  if (qword_267EF81B0) {
    unint64_t v5 = qword_267EF81B0;
  }
  else {
    unint64_t v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v19 = a1;
    __int16 v20 = 2048;
    size_t v21 = a2;
    _os_log_impl(&dword_21FBF2000, v5, OS_LOG_TYPE_DEFAULT, "verifyFDRData %p %zu\n", buf, 0x16u);
  }
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 179);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      BOOL v13 = qword_267EF81B8;
    }
    else {
      BOOL v13 = v4;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    unint64_t v19 = "data";
    __int16 v20 = 2048;
    size_t v21 = 0;
    __int16 v22 = 2080;
    unint64_t v23 = "";
    __int16 v24 = 2080;
    unint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v26 = 1024;
    int v27 = 179;
    goto LABEL_45;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 180);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      BOOL v13 = qword_267EF81B8;
    }
    else {
      BOOL v13 = v4;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    unint64_t v19 = "dataLength > 0";
    __int16 v20 = 2048;
    size_t v21 = 0;
    __int16 v22 = 2080;
    unint64_t v23 = "";
    __int16 v24 = 2080;
    unint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v26 = 1024;
    int v27 = 180;
LABEL_45:
    _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_46:
    uint64_t v6 = 258;
    goto LABEL_12;
  }
  uint64_t v6 = sub_21FC590A0();
  if (v6)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 183);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      BOOL v14 = qword_267EF81B8;
    }
    else {
      BOOL v14 = v4;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      unint64_t v19 = "err == 0 ";
      __int16 v20 = 2048;
      size_t v21 = (int)v6;
      __int16 v22 = 2080;
      unint64_t v23 = "";
      __int16 v24 = 2080;
      unint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v26 = 1024;
      int v27 = 183;
      _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v7 = sub_21FC59360(dword_267EF8238, 10, 0, a1, a2, 0, 0);
    if (v7)
    {
      uint64_t v15 = v7;
      size_t v16 = (int)v7;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v7, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 186);
      if (qword_267EF8240 != -1) {
        dispatch_once(&qword_267EF8240, &unk_26D157BE8);
      }
      if (qword_267EF81B8) {
        unint64_t v17 = qword_267EF81B8;
      }
      else {
        unint64_t v17 = v4;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        unint64_t v19 = "err == 0 ";
        __int16 v20 = 2048;
        size_t v21 = v16;
        __int16 v22 = 2080;
        unint64_t v23 = "";
        __int16 v24 = 2080;
        unint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v26 = 1024;
        int v27 = 186;
        _os_log_impl(&dword_21FBF2000, v17, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v6 = v15;
    }
  }
LABEL_12:
  if (dword_267EF8238)
  {
    IOServiceClose(dword_267EF8238);
    dword_267EF8238 = 0;
  }
  if (v6)
  {
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B0) {
      unint64_t v8 = qword_267EF81B0;
    }
    else {
      unint64_t v8 = v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v6;
      unint64_t v9 = v8;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_29:
      _os_log_impl(&dword_21FBF2000, v9, v10, "verifyFDRData -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B0) {
      unint64_t v11 = qword_267EF81B0;
    }
    else {
      unint64_t v11 = v4;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = 0;
      unint64_t v9 = v11;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_29;
    }
  }
  return v6;
}

uint64_t sub_21FC590A0()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  mach_port_t v0 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v1 = IOServiceMatching("ApplePearlSEPDriver");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    uint64_t v4 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)&dword_267EF8238);
    if (v4)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 129);
      if (qword_267EF8240 != -1) {
        dispatch_once(&qword_267EF8240, &unk_26D157BE8);
      }
      if (qword_267EF81B8) {
        uint64_t v7 = qword_267EF81B8;
      }
      else {
        uint64_t v7 = &_os_log_internal;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        unint64_t v9 = "err == 0 ";
        __int16 v10 = 2048;
        uint64_t v11 = (int)v4;
        __int16 v12 = 2080;
        BOOL v13 = "";
        __int16 v14 = 2080;
        uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v16 = 1024;
        int v17 = 129;
        _os_log_impl(&dword_21FBF2000, v7, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    IOObjectRelease(v3);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "service", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 126);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    uint64_t v4 = 3758097084;
    if (qword_267EF81B8) {
      uint64_t v6 = qword_267EF81B8;
    }
    else {
      uint64_t v6 = &_os_log_internal;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      unint64_t v9 = "service";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      BOOL v13 = "";
      __int16 v14 = 2080;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v16 = 1024;
      int v17 = 126;
      _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

uint64_t sub_21FC59360(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, void *a7)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  size_t v14 = a5 + 8;
  uint64_t v15 = calloc(a5 + 8, 1uLL);
  if (v15)
  {
    __int16 v16 = v15;
    *uint64_t v15 = 21072;
    v15[1] = a2;
    unint64_t v15[2] = 1;
    v15[3] = a3;
    if (a5) {
      memmove(v15 + 4, a4, a5);
    }
    if (a7)
    {
      *(void *)outputStructCnt = *a7;
      uint64_t v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
      *a7 = *(void *)outputStructCnt;
    }
    else
    {
      *(void *)outputStructCnt = 0;
      uint64_t v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
    }
    free(v16);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "cmd", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 99);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      unint64_t v19 = qword_267EF81B8;
    }
    else {
      unint64_t v19 = &_os_log_internal;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136316162;
      *(void *)&outputStructCnt[4] = "cmd";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      __int16 v24 = "";
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v27 = 1024;
      int v28 = 99;
      _os_log_impl(&dword_21FBF2000, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", outputStructCnt, 0x30u);
    }
    return 260;
  }
  return v17;
}

uint64_t sub_21FC59594(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v188 = *MEMORY[0x263EF8340];
  size_t v179 = 0;
  *(_OWORD *)__str = 0u;
  long long v187 = 0u;
  if (!a1 || !a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "prf1Class && (prf1ClassSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 309);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      v155 = qword_267EF81B8;
    }
    else {
      v155 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_191;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v183 = "prf1Class && (prf1ClassSize > 0)";
    *(_WORD *)&v183[8] = 2048;
    uint64_t v184 = 0;
    *(_WORD *)v185 = 2080;
    *(void *)&v185[2] = "";
    *(_WORD *)&v185[10] = 2080;
    *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v185[20] = 1024;
    *(_DWORD *)&v185[22] = 309;
    goto LABEL_190;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "systemRootPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 310);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      v155 = qword_267EF81B8;
    }
    else {
      v155 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_191;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v183 = "systemRootPath";
    *(_WORD *)&v183[8] = 2048;
    uint64_t v184 = 0;
    *(_WORD *)v185 = 2080;
    *(void *)&v185[2] = "";
    *(_WORD *)&v185[10] = 2080;
    *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v185[20] = 1024;
    *(_DWORD *)&v185[22] = 310;
LABEL_190:
    _os_log_impl(&dword_21FBF2000, v155, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_191:
    uint64_t v12 = 258;
LABEL_263:
    unint64_t v61 = &off_267EF8000;
    goto LABEL_124;
  }
  uint64_t v6 = sub_21FC590A0();
  if (v6)
  {
    uint64_t v12 = v6;
    uint64_t v156 = (int)v6;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 313);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      v157 = qword_267EF81B8;
    }
    else {
      v157 = &_os_log_internal;
    }
    if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v183 = "err == 0 ";
      *(_WORD *)&v183[8] = 2048;
      uint64_t v184 = v156;
      *(_WORD *)v185 = 2080;
      *(void *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 313;
      _os_log_impl(&dword_21FBF2000, v157, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_263;
  }
  uint64_t v7 = (char *)calloc(a2 + 9, 1uLL);
  if (!v7)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 317);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      v158 = qword_267EF81B8;
    }
    else {
      v158 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_222;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v183 = "fdrInput";
    *(_WORD *)&v183[8] = 2048;
    uint64_t v184 = 0;
    *(_WORD *)v185 = 2080;
    *(void *)&v185[2] = "";
    *(_WORD *)&v185[10] = 2080;
    *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v185[20] = 1024;
    *(_DWORD *)&v185[22] = 317;
    goto LABEL_221;
  }
  unint64_t v8 = v7;
  *(_DWORD *)uint64_t v7 = 589827;
  v7[4] = 0;
  *(_DWORD *)(v7 + 5) = a2;
  memcpy(v7 + 9, a1, a2);
  uint64_t v9 = sub_21FC59360(dword_267EF8238, 36, 0, v8, a2 + 9, 0, 0);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v159 = (int)v9;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 327);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      v160 = qword_267EF81B8;
    }
    else {
      v160 = &_os_log_internal;
    }
    if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v183 = "err == 0 ";
      *(_WORD *)&v183[8] = 2048;
      uint64_t v184 = v159;
      *(_WORD *)v185 = 2080;
      *(void *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 327;
      _os_log_impl(&dword_21FBF2000, v160, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v8);
    goto LABEL_263;
  }
  free(v8);
  size_t v179 = 52;
  __int16 v10 = calloc(0x34uLL, 1uLL);
  if (!v10)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 334);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      v158 = qword_267EF81B8;
    }
    else {
      v158 = &_os_log_internal;
    }
    if (!os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_222;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)v183 = "dataInfo";
    *(_WORD *)&v183[8] = 2048;
    uint64_t v184 = 0;
    *(_WORD *)v185 = 2080;
    *(void *)&v185[2] = "";
    *(_WORD *)&v185[10] = 2080;
    *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v185[20] = 1024;
    *(_DWORD *)&v185[22] = 334;
LABEL_221:
    _os_log_impl(&dword_21FBF2000, v158, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_222:
    uint64_t v12 = 260;
    goto LABEL_263;
  }
  uint64_t v11 = v10;
  uint64_t v12 = sub_21FC59360(dword_267EF8238, 45, 0, 0, 0, v10, &v179);
  BOOL v13 = (FILE *)*MEMORY[0x263EF8348];
  if (v12)
  {
    fprintf(v13, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 338);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      v161 = qword_267EF81B8;
    }
    else {
      v161 = &_os_log_internal;
    }
    if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v183 = "err == 0 ";
      *(_WORD *)&v183[8] = 2048;
      uint64_t v184 = (int)v12;
      *(_WORD *)v185 = 2080;
      *(void *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 338;
      _os_log_impl(&dword_21FBF2000, v161, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_262;
  }
  fprintf(v13, "ReferenceFramesInfo setCount: %d\n", *v11);
  if (qword_267EF8240 != -1) {
    dispatch_once(&qword_267EF8240, &unk_26D157BE8);
  }
  if (qword_267EF81B8) {
    size_t v14 = qword_267EF81B8;
  }
  else {
    size_t v14 = &_os_log_internal;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = *v11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v183 = v17;
    _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, "ReferenceFramesInfo setCount: %d\n", buf, 8u);
  }
  if (!*v11)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo->setCount > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 342);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      v162 = qword_267EF81B8;
    }
    else {
      v162 = &_os_log_internal;
    }
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v183 = "dataInfo->setCount > 0";
      *(_WORD *)&v183[8] = 2048;
      uint64_t v184 = 0;
      *(_WORD *)v185 = 2080;
      *(void *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 342;
      _os_log_impl(&dword_21FBF2000, v162, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v12 = 259;
    goto LABEL_262;
  }
  id v18 = (id)objc_msgSend_stringWithFormat_(NSString, v15, @"%s%s", v16, a3, "/System/Library/Pearl/ReferenceFrames");
  unint64_t v19 = (FILE *)*MEMORY[0x263EF8348];
  if (!v18)
  {
    fprintf(v19, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "path", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 345);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      v163 = qword_267EF81B8;
    }
    else {
      v163 = &_os_log_internal;
    }
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v183 = "path";
      *(_WORD *)&v183[8] = 2048;
      uint64_t v184 = 0;
      *(_WORD *)v185 = 2080;
      *(void *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 345;
      _os_log_impl(&dword_21FBF2000, v163, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v12 = 261;
    goto LABEL_262;
  }
  id v20 = v18;
  __int16 v24 = (const char *)objc_msgSend_UTF8String(v20, v21, v22, v23);
  fprintf(v19, "ReferenceFramesPath: %s\n", v24);
  if (qword_267EF8240 != -1) {
    dispatch_once(&qword_267EF8240, &unk_26D157BE8);
  }
  if (qword_267EF81B8) {
    __int16 v25 = qword_267EF81B8;
  }
  else {
    __int16 v25 = &_os_log_internal;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = v20;
    unint64_t v30 = v25;
    uint64_t v34 = objc_msgSend_UTF8String(v29, v31, v32, v33);
    *(_DWORD *)buf = 136315138;
    *(void *)v183 = v34;
    _os_log_impl(&dword_21FBF2000, v30, OS_LOG_TYPE_DEFAULT, "ReferenceFramesPath: %s\n", buf, 0xCu);
  }
  id v35 = (id)objc_msgSend_defaultManager(MEMORY[0x263F08850], v26, v27, v28);
  int v38 = objc_msgSend_fileExistsAtPath_(v35, v36, (uint64_t)v20, v37);

  if (v38)
  {
    id v42 = (id)objc_msgSend_defaultManager(MEMORY[0x263F08850], v39, v40, v41);
    int v44 = objc_msgSend_removeItemAtPath_error_(v42, v43, (uint64_t)v20, 0);

    if ((v44 & 1) == 0)
    {
      uint64_t v12 = v44 ^ 1u;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 353);
      if (qword_267EF8240 != -1) {
        dispatch_once(&qword_267EF8240, &unk_26D157BE8);
      }
      if (qword_267EF81B8) {
        v164 = qword_267EF81B8;
      }
      else {
        v164 = &_os_log_internal;
      }
      if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)v183 = "err == 0 ";
        *(_WORD *)&v183[8] = 2048;
        uint64_t v184 = v12;
        *(_WORD *)v185 = 2080;
        *(void *)&v185[2] = "";
        *(_WORD *)&v185[10] = 2080;
        *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v185[20] = 1024;
        *(_DWORD *)&v185[22] = 353;
        _os_log_impl(&dword_21FBF2000, v164, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_261;
    }
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      uint64_t v45 = qword_267EF81B8;
    }
    else {
      uint64_t v45 = &_os_log_internal;
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v183 = v20;
      _os_log_impl(&dword_21FBF2000, v45, OS_LOG_TYPE_DEFAULT, "Removed %@\n", buf, 0xCu);
    }
  }
  id v46 = (id)objc_msgSend_defaultManager(MEMORY[0x263F08850], v39, v40, v41);
  char v49 = objc_msgSend_fileExistsAtPath_(v46, v47, (uint64_t)v20, v48);

  if (v49) {
    goto LABEL_37;
  }
  uint64_t v180 = *MEMORY[0x263F08078];
  v181 = &unk_26D1633B0;
  id v51 = (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v50, (uint64_t)&v181, (uint64_t)&v180, 1);
  id v55 = (id)objc_msgSend_defaultManager(MEMORY[0x263F08850], v52, v53, v54);
  uint64_t v12 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v55, v56, (uint64_t)v20, 1, v51, 0) ^ 1;

  if (v12)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 362);
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      v165 = qword_267EF81B8;
    }
    else {
      v165 = &_os_log_internal;
    }
    if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v183 = "err == 0 ";
      *(_WORD *)&v183[8] = 2048;
      uint64_t v184 = v12;
      *(_WORD *)v185 = 2080;
      *(void *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 362;
      _os_log_impl(&dword_21FBF2000, v165, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_261:
LABEL_262:
    free(v11);
    goto LABEL_263;
  }

LABEL_37:
  if (*v11)
  {
    uint64_t v57 = 0;
    id v175 = 0;
    id v176 = 0;
    v170 = 0;
    unint64_t v58 = 0;
    id v59 = 0;
    id v172 = 0;
    unint64_t v60 = 0;
    unint64_t v61 = &off_267EF8000;
    v166 = v11;
    while (1)
    {
      unint64_t v62 = &v11[3 * v57];
      int v63 = v62[1];
      v171 = (unsigned int *)(++v62 + 1);
      v173 = v62;
      v169 = (unsigned int *)(v62 + 2);
      fprintf((FILE *)*MEMORY[0x263EF8348], "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", v57, v63, v62[1], v62[2]);
      if (qword_267EF8240 != -1) {
        dispatch_once(&qword_267EF8240, &unk_26D157BE8);
      }
      int v177 = v57;
      if (qword_267EF81B8) {
        unint64_t v64 = qword_267EF81B8;
      }
      else {
        unint64_t v64 = &_os_log_internal;
      }
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        int v68 = *v173;
        unsigned int v69 = *v171;
        int v70 = *v169;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v183 = v57;
        *(_WORD *)&v183[4] = 1024;
        *(_DWORD *)&v183[6] = v68;
        LOWORD(v184) = 1024;
        *(_DWORD *)((char *)&v184 + 2) = v69;
        HIWORD(v184) = 1024;
        *(_DWORD *)v185 = v70;
        _os_log_impl(&dword_21FBF2000, v64, OS_LOG_TYPE_DEFAULT, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", buf, 0x1Au);
      }
      uint64_t v71 = *v173;
      if (v71 <= 3) {
        v170 = off_26452ACA8[v71];
      }
      id v72 = (id)objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v65, v66, v67);

      if (!v72)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "setDictionary", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 383);
        v149 = v58;
        if (qword_267EF8240 != -1) {
          dispatch_once(&qword_267EF8240, &unk_26D157BE8);
        }
        if (qword_267EF81B8) {
          v150 = qword_267EF81B8;
        }
        else {
          v150 = &_os_log_internal;
        }
        if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v183 = "setDictionary";
          *(_WORD *)&v183[8] = 2048;
          uint64_t v184 = 0;
          *(_WORD *)v185 = 2080;
          *(void *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 383;
          _os_log_impl(&dword_21FBF2000, v150, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
        uint64_t v11 = v166;
        id v133 = v175;
        unint64_t v58 = v149;
        uint64_t v132 = v59;
        goto LABEL_79;
      }
      uint64_t v167 = v57;
      id v172 = v72;
      objc_msgSend_setObject_forKeyedSubscript_(v72, v73, (uint64_t)&unk_26D1633C8, @"FormatDR");
      id v76 = (id)objc_msgSend_stringWithFormat_(NSString, v74, @"%@/reference-%@.plist", v75, v20, v170);

      if (!v76)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "dictFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 388);
        id v133 = v175;
        v151 = v58;
        if (qword_267EF8240 != -1) {
          dispatch_once(&qword_267EF8240, &unk_26D157BE8);
        }
        if (qword_267EF81B8) {
          v152 = qword_267EF81B8;
        }
        else {
          v152 = &_os_log_internal;
        }
        if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v183 = "dictFileName";
          *(_WORD *)&v183[8] = 2048;
          uint64_t v184 = 0;
          *(_WORD *)v185 = 2080;
          *(void *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 388;
          _os_log_impl(&dword_21FBF2000, v152, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
        uint64_t v132 = v72;
        uint64_t v11 = v166;
        unint64_t v58 = v151;
        goto LABEL_79;
      }
      id v168 = v76;
      if (*v171) {
        break;
      }
LABEL_68:
      char v118 = objc_msgSend_writeToFile_atomically_(v172, v77, (uint64_t)v168, 0);
      uint64_t v119 = (FILE *)*MEMORY[0x263EF8348];
      if ((v118 & 1) == 0)
      {
        fprintf(v119, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 438);
        v153 = v58;
        if (qword_267EF8240 != -1) {
          dispatch_once(&qword_267EF8240, &unk_26D157BE8);
        }
        id v133 = v175;
        if (qword_267EF81B8) {
          v154 = qword_267EF81B8;
        }
        else {
          v154 = &_os_log_internal;
        }
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v183 = "err == 0 ";
          *(_WORD *)&v183[8] = 2048;
          uint64_t v184 = 1;
          *(_WORD *)v185 = 2080;
          *(void *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 438;
          _os_log_impl(&dword_21FBF2000, v154, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        uint64_t v12 = 1;
        uint64_t v11 = v166;
        unint64_t v58 = v153;
        uint64_t v132 = v168;
        goto LABEL_79;
      }
      id v59 = v168;
      long long v123 = (const char *)objc_msgSend_UTF8String(v59, v120, v121, v122);
      fprintf(v119, "Reference set dictionary written to %s\n", v123);
      if (qword_267EF8240 != -1) {
        dispatch_once(&qword_267EF8240, &unk_26D157BE8);
      }
      uint64_t v11 = v166;
      if (qword_267EF81B8) {
        long long v124 = qword_267EF81B8;
      }
      else {
        long long v124 = &_os_log_internal;
      }
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        id v125 = v59;
        long long v126 = v124;
        uint64_t v130 = objc_msgSend_UTF8String(v125, v127, v128, v129);
        *(_DWORD *)buf = 136315138;
        *(void *)v183 = v130;
        _os_log_impl(&dword_21FBF2000, v126, OS_LOG_TYPE_DEFAULT, "Reference set dictionary written to %s\n", buf, 0xCu);
      }
      uint64_t v57 = v167 + 1;
      if (v167 + 1 >= (unint64_t)*v166)
      {

        uint64_t v12 = 0;
        uint64_t v132 = v59;
        id v133 = v175;
LABEL_79:

        id v131 = v176;
        goto LABEL_80;
      }
    }
    unsigned int v78 = 0;
    while (1)
    {
      v178[0] = v177;
      v178[1] = v78;
      size_t v179 = *v169 + 524;
      uint64_t v79 = (unsigned int *)calloc(v179, 1uLL);
      if (!v79) {
        break;
      }
      uint64_t v80 = v79;
      uint64_t v81 = sub_21FC59360(*((_DWORD *)v61 + 142), 46, 0, v178, 8uLL, v79, &v179);
      if (v81)
      {
        uint64_t v12 = v81;
        v137 = v60;
        uint64_t v138 = (int)v81;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v81, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 403);
        id v174 = v58;
        if (qword_267EF8240 != -1) {
          dispatch_once(&qword_267EF8240, &unk_26D157BE8);
        }
        if (qword_267EF81B8) {
          id v139 = qword_267EF81B8;
        }
        else {
          id v139 = &_os_log_internal;
        }
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v183 = "err == 0 ";
          *(_WORD *)&v183[8] = 2048;
          uint64_t v184 = v138;
          *(_WORD *)v185 = 2080;
          *(void *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 403;
          _os_log_impl(&dword_21FBF2000, v139, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_104;
      }
      if ((snprintf(__str, 0x20uLL, "%.6f", *(double *)v80) - 32) <= 0xFFFFFFE0)
      {
        v137 = v60;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "ret > 0 && ret < sizeof(tempChar)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 406);
        id v174 = v58;
        if (qword_267EF8240 != -1) {
          dispatch_once(&qword_267EF8240, &unk_26D157BE8);
        }
        if (qword_267EF81B8) {
          v140 = qword_267EF81B8;
        }
        else {
          v140 = &_os_log_internal;
        }
        if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v183 = "ret > 0 && ret < sizeof(tempChar)";
          *(_WORD *)&v183[8] = 2048;
          uint64_t v184 = 0;
          *(_WORD *)v185 = 2080;
          *(void *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 406;
          _os_log_impl(&dword_21FBF2000, v140, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v12 = 261;
LABEL_104:
        uint64_t v141 = v166;
        uint64_t v87 = v137;
LABEL_121:
        id v92 = v176;
LABEL_122:
        free(v141);
        free(v80);

        uint64_t v134 = v175;
        goto LABEL_123;
      }
      id v84 = (id)objc_msgSend_stringWithUTF8String_(NSString, v82, (uint64_t)__str, v83);

      if (!v84)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "tempString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 409);
        id v174 = v58;
        if (qword_267EF8240 != -1) {
          dispatch_once(&qword_267EF8240, &unk_26D157BE8);
        }
        uint64_t v141 = v166;
        if (qword_267EF81B8) {
          uint64_t v142 = qword_267EF81B8;
        }
        else {
          uint64_t v142 = &_os_log_internal;
        }
        if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v183 = "tempString";
          *(_WORD *)&v183[8] = 2048;
          uint64_t v184 = 0;
          *(_WORD *)v185 = 2080;
          *(void *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 409;
          _os_log_impl(&dword_21FBF2000, v142, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        uint64_t v87 = 0;
        uint64_t v12 = 261;
        unint64_t v61 = &off_267EF8000;
        goto LABEL_121;
      }
      uint64_t v87 = v84;
      id v88 = (id)objc_msgSend_stringWithFormat_(NSString, v85, @"reference-%@__T_%@.bin", v86, v170, v84);

      if (!v88)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "refFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 412);
        if (qword_267EF8240 != -1) {
          dispatch_once(&qword_267EF8240, &unk_26D157BE8);
        }
        uint64_t v141 = v166;
        if (qword_267EF81B8) {
          v143 = qword_267EF81B8;
        }
        else {
          v143 = &_os_log_internal;
        }
        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v183 = "refFileName";
          *(_WORD *)&v183[8] = 2048;
          uint64_t v184 = 0;
          *(_WORD *)v185 = 2080;
          *(void *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 412;
          _os_log_impl(&dword_21FBF2000, v143, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        id v174 = 0;
        uint64_t v12 = 261;
        goto LABEL_121;
      }
      uint64_t v91 = (uint64_t)v88;
      id v92 = (id)objc_msgSend_stringWithFormat_(NSString, v89, @"%@/%@", v90, v20, v88);

      id v174 = (id)v91;
      if (!v92)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "refPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 415);
        if (qword_267EF8240 != -1) {
          dispatch_once(&qword_267EF8240, &unk_26D157BE8);
        }
        if (qword_267EF81B8) {
          v146 = qword_267EF81B8;
        }
        else {
          v146 = &_os_log_internal;
        }
        if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v183 = "refPath";
          *(_WORD *)&v183[8] = 2048;
          uint64_t v184 = 0;
          *(_WORD *)v185 = 2080;
          *(void *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 415;
          _os_log_impl(&dword_21FBF2000, v146, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        id v92 = 0;
        uint64_t v12 = 261;
        uint64_t v141 = v166;
        goto LABEL_122;
      }
      id v94 = v20;
      objc_msgSend_setObject_forKeyedSubscript_(v172, v93, v91, (uint64_t)v87);
      id v96 = (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v95, (uint64_t)(v80 + 3), v80[2], 0);

      if (!v96)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "refFrameData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 423);
        if (qword_267EF8240 != -1) {
          dispatch_once(&qword_267EF8240, &unk_26D157BE8);
        }
        id v20 = v94;
        if (qword_267EF81B8) {
          uint64_t v147 = qword_267EF81B8;
        }
        else {
          uint64_t v147 = &_os_log_internal;
        }
        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v183 = "refFrameData";
          *(_WORD *)&v183[8] = 2048;
          uint64_t v184 = 0;
          *(_WORD *)v185 = 2080;
          *(void *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 423;
          _os_log_impl(&dword_21FBF2000, v147, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        id v175 = 0;
        uint64_t v12 = 261;
        uint64_t v141 = v166;
        goto LABEL_122;
      }
      uint64_t v98 = v87;
      id v175 = v96;
      char v99 = objc_msgSend_writeToFile_atomically_(v96, v97, (uint64_t)v92, 0);
      long long v100 = (FILE *)*MEMORY[0x263EF8348];
      if ((v99 & 1) == 0)
      {
        fprintf(v100, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 426);
        if (qword_267EF8240 != -1) {
          dispatch_once(&qword_267EF8240, &unk_26D157BE8);
        }
        id v20 = v94;
        if (qword_267EF81B8) {
          uint64_t v148 = qword_267EF81B8;
        }
        else {
          uint64_t v148 = &_os_log_internal;
        }
        if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)v183 = "err == 0 ";
          *(_WORD *)&v183[8] = 2048;
          uint64_t v12 = 1;
          uint64_t v184 = 1;
          *(_WORD *)v185 = 2080;
          *(void *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 426;
          _os_log_impl(&dword_21FBF2000, v148, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        else
        {
          uint64_t v12 = 1;
        }
        uint64_t v141 = v166;
        goto LABEL_122;
      }
      double v101 = *(double *)v80;
      unsigned int v102 = v80[2];
      int v103 = *v173;
      id v176 = v92;
      uint64_t v107 = (const char *)objc_msgSend_UTF8String(v176, v104, v105, v106);
      fprintf(v100, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", v177, v78, v102, v103, v101, v107);
      if (qword_267EF8240 != -1) {
        dispatch_once(&qword_267EF8240, &unk_26D157BE8);
      }
      if (qword_267EF81B8) {
        id v108 = qword_267EF81B8;
      }
      else {
        id v108 = &_os_log_internal;
      }
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v109 = v80[2];
        int v110 = *v173;
        double v111 = *(double *)v80;
        id v112 = v176;
        uint64_t v113 = v108;
        uint64_t v117 = objc_msgSend_UTF8String(v112, v114, v115, v116);
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v183 = v177;
        *(_WORD *)&v183[4] = 1024;
        *(_DWORD *)&v183[6] = v78;
        LOWORD(v184) = 1024;
        *(_DWORD *)((char *)&v184 + 2) = v109;
        HIWORD(v184) = 1024;
        *(_DWORD *)v185 = v110;
        *(_WORD *)&v185[4] = 2048;
        *(double *)&v185[6] = v111;
        unint64_t v61 = &off_267EF8000;
        *(_WORD *)&v185[14] = 2080;
        *(void *)&v185[16] = v117;
        _os_log_impl(&dword_21FBF2000, v113, OS_LOG_TYPE_DEFAULT, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", buf, 0x2Eu);
      }
      free(v80);
      ++v78;
      id v20 = v94;
      unint64_t v60 = v98;
      unint64_t v58 = v174;
      if (v78 >= *v171) {
        goto LABEL_68;
      }
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", "refFrame", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 400);
    uint64_t v135 = v58;
    if (qword_267EF8240 != -1) {
      dispatch_once(&qword_267EF8240, &unk_26D157BE8);
    }
    if (qword_267EF81B8) {
      v136 = qword_267EF81B8;
    }
    else {
      v136 = &_os_log_internal;
    }
    if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v183 = "refFrame";
      *(_WORD *)&v183[8] = 2048;
      uint64_t v184 = 0;
      *(_WORD *)v185 = 2080;
      *(void *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(void *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 400;
      _os_log_impl(&dword_21FBF2000, v136, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (int64_t value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v166);

    uint64_t v12 = 260;
  }
  else
  {
    id v131 = 0;
    unint64_t v58 = 0;
    unint64_t v60 = 0;
    id v133 = 0;
    uint64_t v12 = 0;
    unint64_t v61 = &off_267EF8000;
LABEL_80:
    free(v11);

    uint64_t v134 = v133;
LABEL_123:
  }
LABEL_124:
  io_connect_t v144 = *((_DWORD *)v61 + 142);
  if (v144)
  {
    IOServiceClose(v144);
    *((_DWORD *)v61 + 142) = 0;
  }
  return v12;
}

void sub_21FC5B768()
{
  os_log_t v0 = os_log_create("com.apple.BiometricKit", "Library-PearlFactory");
  CFDictionaryRef v1 = (void *)qword_267EF81B8;
  qword_267EF81B8 = (uint64_t)v0;

  size_t v2 = (void *)qword_267EF81B8;
  if (!qword_267EF81B8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_21FC5B7EC();
    }
    size_t v2 = (void *)qword_267EF81B8;
  }
  objc_storeStrong((id *)&qword_267EF81B0, v2);
}

void sub_21FC5B7EC()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_21FBF2000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-PearlFactory'!\n", v0, 2u);
}

void sub_21FC5B834(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Failed to parse override dict: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC5B8AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5B8E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5B91C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5B954(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "AMFDRDataDictCopy failed, error: %@", (uint8_t *)&v3, 0xCu);
}

void sub_21FC5B9D0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "outSignature is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5BA04()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "outDeviceNonce is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5BA38()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "deviceNonce is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5BA6C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "*outSignature is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5BAA0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "*outDeviceNonce is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5BAD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5BB4C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "errorCode detected", v2, v3, v4, v5, v6);
}

void sub_21FC5BB80()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "signing timed out", v2, v3, v4, v5, v6);
}

void sub_21FC5BBB4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "challenge is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5BBE8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Get osBootHash failed", v2, v3, v4, v5, v6);
}

void sub_21FC5BC1C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Get prebootPath failed", v2, v3, v4, v5, v6);
}

void sub_21FC5BC50()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Get customAMAuthInstallRef failed", v2, v3, v4, v5, v6);
}

void sub_21FC5BC84()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Create optionsDict failed", v2, v3, v4, v5, v6);
}

void sub_21FC5BCB8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Create optionsYonkersDict failed", v2, v3, v4, v5, v6);
}

void sub_21FC5BCEC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Create updaterOptions failed", v2, v3, v4, v5, v6);
}

void sub_21FC5BD20()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to create SavageUpdater: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5BD88()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "SavageUpdaterExecCommand failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5BDF0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Create customObj failed", v2, v3, v4, v5, v6);
}

void sub_21FC5BE24()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Get ticket failed", v2, v3, v4, v5, v6);
}

void sub_21FC5BE58()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "signature is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5BE8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5BF04()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "SavageUpdater failed with error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5BF6C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to enable SSO", v2, v3, v4, v5, v6);
}

void sub_21FC5BFA0(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_DEBUG, "challenge: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC5C018(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "-[CRComponentSigning prpcSign:outSignature:outDeviceNonce:outError:]";
  _os_log_debug_impl(&dword_21FBF2000, log, OS_LOG_TYPE_DEBUG, "entering %s ...", (uint8_t *)&v1, 0xCu);
}

void sub_21FC5C09C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "matchingDict is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5C0D0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "service is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5C104(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5C17C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to allocate encoder", v2, v3, v4, v5, v6);
}

void sub_21FC5C1B0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to allocate dstEncoder", v2, v3, v4, v5, v6);
}

void sub_21FC5C1E4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "*outDerData is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5C218()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "*outDerDataLength is 0", v2, v3, v4, v5, v6);
}

void sub_21FC5C24C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "DEREncoderCreateEncodedBuffer failed", v2, v3, v4, v5, v6);
}

void sub_21FC5C280()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "DEREncoderAddSequenceFromEncoder failed", v2, v3, v4, v5, v6);
}

void sub_21FC5C2B4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "DEREncoderAddData failed", v2, v3, v4, v5, v6);
}

void sub_21FC5C2E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5C360()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "ccrngNonce is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5C394()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to allocate memmory for nonce", v2, v3, v4, v5, v6);
}

void sub_21FC5C3C8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to generate random nonce\n", v2, v3, v4, v5, v6);
}

void sub_21FC5C3FC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "signatureData is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5C430()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "deviceNonceData is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC5C464()
{
  sub_21FBF8D7C();
  sub_21FBF8D60(&dword_21FBF2000, v0, v1, "denied spc: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5C4CC()
{
  sub_21FBF8D7C();
  sub_21FBF8D60(&dword_21FBF2000, v0, v1, "lost spc: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5C534()
{
  sub_21FBF8D7C();
  sub_21FBF8D60(&dword_21FBF2000, v0, v1, "unauth spc: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5C59C()
{
  sub_21FBF8D7C();
  sub_21FBF8D60(&dword_21FBF2000, v0, v1, "lock spc: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5C604()
{
  sub_21FBF8D7C();
  sub_21FBF8D60(&dword_21FBF2000, v0, v1, "fail spc: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5C66C()
{
  sub_21FBF8D7C();
  sub_21FBF8D60(&dword_21FBF2000, v0, v1, "sealed spc: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5C6D4()
{
  sub_21FBF8D7C();
  sub_21FBF8D60(&dword_21FBF2000, v0, v1, "pass spc: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5C73C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No preflight1 response", v2, v3, v4, v5, v6);
}

void sub_21FC5C770()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No challenges in preflight1 response", v2, v3, v4, v5, v6);
}

void sub_21FC5C7A4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No device handler", v2, v3, v4, v5, v6);
}

void sub_21FC5C7D8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Failed to parse challenge object", buf, 2u);
}

void sub_21FC5C818()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Missing type in challenge object", v2, v3, v4, v5, v6);
}

void sub_21FC5C84C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Missing status in challenge object", v2, v3, v4, v5, v6);
}

void sub_21FC5C880()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21FBF8D7C();
  _os_log_error_impl(&dword_21FBF2000, v0, OS_LOG_TYPE_ERROR, "Failed to get SPC for component: %@", v1, 0xCu);
}

void sub_21FC5C8F4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Create payload failed with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC5C96C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Failed to read defaults: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC5C9E4()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "aks_sik_attest failed: %d", v2, v3, v4, v5, v6);
}

void sub_21FC5CA4C()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "aks_ref_key_sign failed: %d", v2, v3, v4, v5, v6);
}

void sub_21FC5CAB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5CAEC()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "aks_ref_key_verify_sig failed: %d", v2, v3, v4, v5, v6);
}

void sub_21FC5CB54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5CB8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5CBC4()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "aks_ref_key_create failed: %d", v2, v3, v4, v5, v6);
}

void sub_21FC5CC2C()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "aks_params_get_der failed: %d", v2, v3, v4, v5, v6);
}

void sub_21FC5CC94()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "aks_params_set_number failed: %d", v2, v3, v4, v5, v6);
}

void sub_21FC5CCFC()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "aks_ref_key_create_with_blob failed: %d", v2, v3, v4, v5, v6);
}

void sub_21FC5CD64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5CDD0(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Unsupported strong component", buf, 2u);
}

void sub_21FC5CE10()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Missing key blob", v2, v3, v4, v5, v6);
}

void sub_21FC5CE44()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Empty payload", v2, v3, v4, v5, v6);
}

void sub_21FC5CE78()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Create RIK failed", v2, v3, v4, v5, v6);
}

void sub_21FC5CEAC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Get digest failed", v2, v3, v4, v5, v6);
}

void sub_21FC5CEE0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Missing RIK", v2, v3, v4, v5, v6);
}

void sub_21FC5CF14()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get attestation", v2, v3, v4, v5, v6);
}

void sub_21FC5CF48()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get pub key", v2, v3, v4, v5, v6);
}

void sub_21FC5CF7C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5CFE8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Empty request", v2, v3, v4, v5, v6);
}

void sub_21FC5D01C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Empty configuration", v2, v3, v4, v5, v6);
}

void sub_21FC5D050()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Empty session", v2, v3, v4, v5, v6);
}

void sub_21FC5D084()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No baa certs found", v2, v3, v4, v5, v6);
}

void sub_21FC5D0B8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No User-Agent", v2, v3, v4, v5, v6);
}

void sub_21FC5D0EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5D158()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to find version info", v2, v3, v4, v5, v6);
}

void sub_21FC5D18C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get delta components", v2, v3, v4, v5, v6);
}

void sub_21FC5D1C0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_phase(a1, a2, a3, a4);
  sub_21FBF8D7C();
  sub_21FC02C94(&dword_21FBF2000, v5, v6, "%@: Error response", v7, v8, v9, v10, v11);
}

void sub_21FC5D244(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_phase(a1, a2, a3, a4);
  sub_21FC02C7C();
  sub_21FC02C40(&dword_21FBF2000, v5, v6, "%@: Send request failed: %@", v7, v8, v9, v10, v11);
}

void sub_21FC5D2D4()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to get repair BAA cert: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5D33C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Missing required parameters", v2, v3, v4, v5, v6);
}

void sub_21FC5D370()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "challengeComponents failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5D3D8()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5D440()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Error:%@", v2, v3, v4, v5, v6);
}

void sub_21FC5D4A8()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "details item in response has unknown type: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5D510()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "details in response malformed", v2, v3, v4, v5, v6);
}

void sub_21FC5D544()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21FBF8D7C();
  _os_log_debug_impl(&dword_21FBF2000, v0, OS_LOG_TYPE_DEBUG, "components: %@", v1, 0xCu);
}

void sub_21FC5D5B8()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21FBF8D7C();
  _os_log_debug_impl(&dword_21FBF2000, v0, OS_LOG_TYPE_DEBUG, "returnStrongComponents: %@", v1, 0xCu);
}

void sub_21FC5D62C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "queryRepairDelta failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5D694()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Connection error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5D6FC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No request", v2, v3, v4, v5, v6);
}

void sub_21FC5D730()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No server URL", v2, v3, v4, v5, v6);
}

void sub_21FC5D764()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No request payload", v2, v3, v4, v5, v6);
}

void sub_21FC5D798()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to create return response: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5D800()
{
  sub_21FC02C2C();
  sub_21FC02C14(v2, v3, v4, 5.778e-34);
  sub_21FC02C60(&dword_21FBF2000, "CRPreflightResponse_%@: %@", v5, v6);
}

void sub_21FC5D848()
{
  sub_21FC02C2C();
  sub_21FC02C14(v2, v3, v4, 5.778e-34);
  sub_21FC02C60(&dword_21FBF2000, "response_%@: %@", v5, v6);
}

void sub_21FC5D890()
{
  sub_21FC02C2C();
  sub_21FC02C14(v2, v3, v4, 5.778e-34);
  sub_21FC02C60(&dword_21FBF2000, "request_%@: %@", v5, v6);
}

void sub_21FC5D8D8()
{
  sub_21FC02C2C();
  sub_21FC02C14(v2, v3, v4, 5.778e-34);
  sub_21FC02C60(&dword_21FBF2000, "CRPreflightRequest_%@: %@", v5, v6);
}

void sub_21FC5D920(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_21FBF2000, log, OS_LOG_TYPE_DEBUG, "Content-Length: %ld", buf, 0xCu);
}

void sub_21FC5D968()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to sign request", v2, v3, v4, v5, v6);
}

void sub_21FC5D99C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to encode request signature", v2, v3, v4, v5, v6);
}

void sub_21FC5D9D0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to sign server nonce", v2, v3, v4, v5, v6);
}

void sub_21FC5DA04()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to encode server nonce signature", v2, v3, v4, v5, v6);
}

void sub_21FC5DA38()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Empty Server Response", v2, v3, v4, v5, v6);
}

void sub_21FC5DA6C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Empty Server Response Data", v2, v3, v4, v5, v6);
}

void sub_21FC5DAA0()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "dataTaskWithRequest error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5DB08()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No Response", v2, v3, v4, v5, v6);
}

void sub_21FC5DB3C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_errorCode(a1, a2, a3, a4);
  uint64_t v15 = objc_msgSend_errorMessage(a1, v6, v7, v8);
  sub_21FC02C40(&dword_21FBF2000, v9, v10, "Server response with error: %@, %@", v11, v12, v13, v14, 2u);
}

void sub_21FC5DBF0(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC5DC68(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "writeSystemConfig: IORegistryEntrySetCFProperties failed with: %x", (uint8_t *)v2, 8u);
}

void sub_21FC5DCE0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "writeSystemConfig: readSystemConfigArea failed", v2, v3, v4, v5, v6);
}

void sub_21FC5DD14()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "writeSystemConfig: Syscfg update failed", v2, v3, v4, v5, v6);
}

void sub_21FC5DD48()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "writeSystemConfig: findSyscfgAccess failed", v2, v3, v4, v5, v6);
}

void sub_21FC5DD7C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid input", v2, v3, v4, v5, v6);
}

void sub_21FC5DDB0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "readSystemConfigAll: readSystemConfigArea failed.", v2, v3, v4, v5, v6);
}

void sub_21FC5DDE4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 24;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "readSystemConfigAll: syscfg length %lu is too small, header size %lu\n", (uint8_t *)&v2, 0x16u);
}

void sub_21FC5DE6C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "readSystemConfigAll: syscfg is not initialized!", v2, v3, v4, v5, v6);
}

void sub_21FC5DEA0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No sysconfig access found.", v2, v3, v4, v5, v6);
}

void sub_21FC5DED4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Length incorrect", v2, v3, v4, v5, v6);
}

void sub_21FC5DF08()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Key not found", v2, v3, v4, v5, v6);
}

void sub_21FC5DF3C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Sysconfig entry doesn't exist", v2, v3, v4, v5, v6);
}

void sub_21FC5DF70()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Sysconfig data not valid", v2, v3, v4, v5, v6);
}

void sub_21FC5DFA4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Cannot get any syscfg data", v2, v3, v4, v5, v6);
}

void sub_21FC5DFD8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Syscfg data is not CFData", v2, v3, v4, v5, v6);
}

void sub_21FC5E00C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Cannot find syscfg access", v2, v3, v4, v5, v6);
}

void sub_21FC5E040()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get instance from sealing map", v2, v3, v4, v5, v6);
}

void sub_21FC5E074()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get FDR blob", v2, v3, v4, v5, v6);
}

void sub_21FC5E0A8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to fetch live instance", v2, v3, v4, v5, v6);
}

void sub_21FC5E0DC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to get chmf blob", v2, v3, v4, v5, v6);
}

void sub_21FC5E110()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to challenge response", v2, v3, v4, v5, v6);
}

void sub_21FC5E144(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch Internal Component Auth Status:%d", (uint8_t *)v2, 8u);
}

void sub_21FC5E1BC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "IOREG Auth Component Timeout", v2, v3, v4, v5, v6);
}

void sub_21FC5E1F0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "IOREG Auth Component Not Populated", v2, v3, v4, v5, v6);
}

void sub_21FC5E224()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "queryRepairDelta timeout", v2, v3, v4, v5, v6);
}

void sub_21FC5E258(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Connection error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC5E2D0(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "queryRepairDelta failed: %d. %@", (uint8_t *)v3, 0x12u);
}

void sub_21FC5E35C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Cannot find camera service", v2, v3, v4, v5, v6);
}

void sub_21FC5E390()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Audio failed with Speaker issue.", v2, v3, v4, v5, v6);
}

void sub_21FC5E3C4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Audio failed with Codec issue.", v2, v3, v4, v5, v6);
}

void sub_21FC5E3F8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Cannot find matched camera service", v2, v3, v4, v5, v6);
}

void sub_21FC5E42C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5E498(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Faild to read OS Boot Hash from %@; error: %@",
    (uint8_t *)&v3,
    0x16u);
}

void sub_21FC5E520(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5E590(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  int v3 = @"diagnostic-boot-intent";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "readNVRAMValueForKey %@ failed: %@", (uint8_t *)&v2, 0x16u);
}

void sub_21FC5E61C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5E688()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get boot intent purpose", v2, v3, v4, v5, v6);
}

void sub_21FC5E6BC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "SSR boot intent not found", v2, v3, v4, v5, v6);
}

void sub_21FC5E6F0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unexpected SSR boot intent purpose format", v2, v3, v4, v5, v6);
}

void sub_21FC5E724()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unexpected SSR boot intent format", v2, v3, v4, v5, v6);
}

void sub_21FC5E758()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Invalid ChallengeResponse:%@", v2, v3, v4, v5, v6);
}

void sub_21FC5E7C0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "challengeRequest creation failed", v2, v3, v4, v5, v6);
}

void sub_21FC5E7F4()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Create Request Failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC5E85C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Server response missing Challenge", v2, v3, v4, v5, v6);
}

void sub_21FC5E890()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Attestation request creation failed", v2, v3, v4, v5, v6);
}

void sub_21FC5E8C4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5E938()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Request to parse Server response:%@", v2, v3, v4, v5, v6);
}

void sub_21FC5E9A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5EA14()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Missing mandatory OIDS in kMAOptionsBAAOIDSToInclude", v2, v3, v4, v5, v6);
}

void sub_21FC5EA48()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid Certs or BIK", v2, v3, v4, v5, v6);
}

void sub_21FC5EA7C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Error getting BAA certs:%@", v2, v3, v4, v5, v6);
}

void sub_21FC5EAE4()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Connection error:%@", v2, v3, v4, v5, v6);
}

void sub_21FC5EB4C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Empty Server Response", v2, v3, v4, v5, v6);
}

void sub_21FC5EB80()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Empty Server Response Data", v2, v3, v4, v5, v6);
}

void sub_21FC5EBB4()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "dataTaskWithRequest error:%@", v2, v3, v4, v5, v6);
}

void sub_21FC5EC1C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "CAA attestation failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC5EC84()
{
  sub_21FC1133C();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "Unable to copy current identifier for  data classes:%@ error:%@");
}

void sub_21FC5ECEC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "MLB repair pre-check failed", v2, v3, v4, v5, v6);
}

void sub_21FC5ED20()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "KBB isServicePart", v2, v3, v4, v5, v6);
}

void sub_21FC5ED54()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Fail to get KBB manifest, abort and error out", v2, v3, v4, v5, v6);
}

void sub_21FC5ED88()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "KGB isServicePart wihtout MLB SPC", v2, v3, v4, v5, v6);
}

void sub_21FC5EDBC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Claim not available for this device", v2, v3, v4, v5, v6);
}

void sub_21FC5EDF0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5EE5C()
{
  sub_21FC1133C();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "KGB MLB serial number %@ and device %@ dont match");
}

void sub_21FC5EEC4()
{
  sub_21FC1133C();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "FGSN %@ doesn't match what's on device %@");
}

void sub_21FC5EF2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5EFA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5F01C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5F094(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5F100(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5F16C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to alloc resources", v2, v3, v4, v5, v6);
}

void sub_21FC5F1A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5F210()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to find /defaults node", v2, v3, v4, v5, v6);
}

void sub_21FC5F244()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to retrieve data classes to write to EAN", v2, v3, v4, v5, v6);
}

void sub_21FC5F278()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "EAN Verify failed", v2, v3, v4, v5, v6);
}

void sub_21FC5F2AC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to delete FDR data instance for: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5F314()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to write FDR data instance for: %@", v2, v3, v4, v5, v6);
}

void sub_21FC5F37C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Cannot allocate buffer for data padding", v2, v3, v4, v5, v6);
}

void sub_21FC5F3B0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Could not get queryKey", v2, v3, v4, v5, v6);
}

void sub_21FC5F3E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5F45C()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "Failed to write to EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
}

void sub_21FC5F4C4()
{
  sub_21FC15A00();
  sub_21FC15A14(&dword_21FBF2000, v0, v1, "IOServiceOpen on %s failed, kernResult = 0x%x", v2, v3, v4, v5, 2u);
}

void sub_21FC5F538(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5F5AC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Final size of padded data isn't inputSize+paddingSize", v2, v3, v4, v5, v6);
}

void sub_21FC5F5E0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get chosen info", v2, v3, v4, v5, v6);
}

void sub_21FC5F614()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get syscfg-erly-kbgs-data-class", v2, v3, v4, v5, v6);
}

void sub_21FC5F648()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to allocate memory for byte reversal", v2, v3, v4, v5, v6);
}

void sub_21FC5F67C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid args", v2, v3, v4, v5, v6);
}

void sub_21FC5F6B0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unexpected der length", v2, v3, v4, v5, v6);
}

void sub_21FC5F6E4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get true size of der object", v2, v3, v4, v5, v6);
}

void sub_21FC5F718()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "Failed to read EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
}

void sub_21FC5F780()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "Could not get size of data context IOConnectCallScalarMethod kAppleNVMeEANGetSize:%d", v2, v3, v4, v5, v6);
}

void sub_21FC5F7E8(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_msgSend_length(a1, a2, a3, a4);
  sub_21FBF8D7C();
  _os_log_error_impl(&dword_21FBF2000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "key is not 4 bytes (%lu)", v5, 0xCu);
}

void sub_21FC5F870()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "Failed to delete EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
}

void sub_21FC5F8D8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Verify FDR data from EAN using cache, but missing cached data.", v2, v3, v4, v5, v6);
}

void sub_21FC5F90C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Data class (%@) mismatch from previous data.", v2, v3, v4, v5, v6);
}

void sub_21FC5F974()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to read data class from EAN", v2, v3, v4, v5, v6);
}

void sub_21FC5F9A8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get EAN data classes to verify", v2, v3, v4, v5, v6);
}

void sub_21FC5F9DC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Data class (%@) mismatch from FDR local data.", v2, v3, v4, v5, v6);
}

void sub_21FC5FA44()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "syscfg_fdr: could not determine actual size of DER encoded object (derstat = %d)", v2, v3, v4, v5, v6);
}

void sub_21FC5FAAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5FB24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5FB9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5FC14()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get ap_ticket.", v2, v3, v4, v5, v6);
}

void sub_21FC5FC48()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "fdrOptions failed allocation", v2, v3, v4, v5, v6);
}

void sub_21FC5FC7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC5FCEC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to create FDR local store", v2, v3, v4, v5, v6);
}

void sub_21FC5FD20()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to read trust object digest from apticket.", v2, v3, v4, v5, v6);
}

void sub_21FC5FD54()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to load seal instance array.", v2, v3, v4, v5, v6);
}

void sub_21FC5FD88()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to load seal data.", v2, v3, v4, v5, v6);
}

void sub_21FC5FDBC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to read FDR Trust object.", v2, v3, v4, v5, v6);
}

void sub_21FC5FDF0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "key is NULL.", v2, v3, v4, v5, v6);
}

void sub_21FC5FE24()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "payloadType is invalid.", v2, v3, v4, v5, v6);
}

void sub_21FC5FE58()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "IOServiceGetMatchingService failed to find kNVMeEANServiceMatchName.", v2, v3, v4, v5, v6);
}

void sub_21FC5FE8C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "IOServiceOpen returned IO_OBJECT_NULL.", v2, v3, v4, v5, v6);
}

void sub_21FC5FEC0()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "getSize failed, kernResult = 0x%x.", v2, v3, v4, v5, v6);
}

void sub_21FC5FF28()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "IOServiceOpen returned result=0x%04x.", v2, v3, v4, v5, v6);
}

void sub_21FC5FF90()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Hash is inside header.", v2, v3, v4, v5, v6);
}

void sub_21FC5FFC4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Hash size is zero.", v2, v3, v4, v5, v6);
}

void sub_21FC5FFF8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "FDR info payload is empty.", v2, v3, v4, v5, v6);
}

void sub_21FC6002C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Hash is extends outside payload.", v2, v3, v4, v5, v6);
}

void sub_21FC60060()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Generation count is invalid.", v2, v3, v4, v5, v6);
}

void sub_21FC60094()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109376;
  sub_21FC15A30();
  _os_log_error_impl(&dword_21FBF2000, v0, OS_LOG_TYPE_ERROR, "Bad fdr info header version.\tExpect: %d\tFound: %d", (uint8_t *)v1, 0xEu);
}

void sub_21FC60114()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109376;
  sub_21FC15A30();
  _os_log_error_impl(&dword_21FBF2000, v0, OS_LOG_TYPE_ERROR, "Bad fdr info header magic.\tExpect: %d\tFound: %d", (uint8_t *)v1, 0xEu);
}

void sub_21FC60198()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "FDR parts array is NULL.", v2, v3, v4, v5, v6);
}

void sub_21FC601CC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "FDR parts array is empty.", v2, v3, v4, v5, v6);
}

void sub_21FC60200()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to load APTK key.", v2, v3, v4, v5, v6);
}

void sub_21FC60234()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "ean_dictionary is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC60268()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "IOServiceGetMatchingService failed to find kNVMeEANServiceMatchName", v2, v3, v4, v5, v6);
}

void sub_21FC6029C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "IOServiceOpen returned IO_OBJECT_NULL", v2, v3, v4, v5, v6);
}

void sub_21FC602D0()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "IOServiceOpen returned result=0x%04x", v2, v3, v4, v5, v6);
}

void sub_21FC60338()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  sub_21FBF8D7C();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21FBF2000, v1, OS_LOG_TYPE_ERROR, "Failed to copy staged FDR EAN data:%@:%@", v2, 0x16u);
}

void sub_21FC603BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC60434()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "key1 is NULL.", v2, v3, v4, v5, v6);
}

void sub_21FC60468()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "key2 is NULL.", v2, v3, v4, v5, v6);
}

void sub_21FC6049C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "payloadType1 is invalid.", v2, v3, v4, v5, v6);
}

void sub_21FC604D0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "payloadType2 is invalid.", v2, v3, v4, v5, v6);
}

void sub_21FC60504()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "IOServiceOpen returned IO_OBJECT_NULL.", v2, v3, v4, v5, v6);
}

void sub_21FC60538()
{
  sub_21FBFB0F8();
  sub_21FBFB0DC(&dword_21FBF2000, v0, v1, "swapImage failed, kernResult = 0x%x.", v2, v3, v4, v5, v6);
}

void sub_21FC605A0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Versioned FDR corrupted", v2, v3, v4, v5, v6);
}

void sub_21FC605D4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to commit fdr2->fdr1", v2, v3, v4, v5, v6);
}

void sub_21FC60608()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "unable to find chosen node", v2, v3, v4, v5, v6);
}

void sub_21FC6063C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "unable to create NSData of ticket hash", v2, v3, v4, v5, v6);
}

void sub_21FC60670()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "img4CryptoHashMethodData not recognized:%@", v2, v3, v4, v5, v6);
}

void sub_21FC606D8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "no ticket available", v2, v3, v4, v5, v6);
}

void sub_21FC6070C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to read ap ticket.", v2, v3, v4, v5, v6);
}

void sub_21FC60740()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to read ap ticket hash.", v2, v3, v4, v5, v6);
}

void sub_21FC60774()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to swap Versioned FDR", v2, v3, v4, v5, v6);
}

void sub_21FC607A8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to setupVersioned FDR", v2, v3, v4, v5, v6);
}

void sub_21FC607DC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "apTicket type mismatch", v2, v3, v4, v5, v6);
}

void sub_21FC60810(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC6087C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC608E8(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "the result of Img4 decode is %i", (uint8_t *)v2, 8u);
}

void sub_21FC60960()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to parse AP ticket as Img4 manifest", v2, v3, v4, v5, v6);
}

void sub_21FC60994()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "AP Ticket is not passed in, try to fetch it from device", v2, v3, v4, v5, v6);
}

void sub_21FC609C8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unexpected NULL value returned from SecTaskCreateFromSelf()", v2, v3, v4, v5, v6);
}

void sub_21FC609FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Unexpected value %@ for %@ entitlement", (uint8_t *)&v3, 0x16u);
}

void sub_21FC60A84(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC60AF4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  int v3 = @"/private/preboot/active";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Faild to read OS Boot Hash from %@; error: %@",
    (uint8_t *)&v2,
    0x16u);
}

void sub_21FC60B80()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "AP Ticket is not passed in.", v2, v3, v4, v5, v6);
}

void sub_21FC60BB4(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Unsupported Class:%d::Product:%ld", (uint8_t *)v3, 0x12u);
}

void sub_21FC60C3C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Device RCHL is invalid", v1, 2u);
}

void sub_21FC60C80(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Failed to create FDR type", v1, 2u);
}

void sub_21FC60CC4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Unable to getUpdateDataClasses:%@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC60D3C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Claim not available for this device", v1, 2u);
}

void sub_21FC60D80(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Failed to alloc resources", v1, 2u);
}

void sub_21FC60DC4(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "getMakeDataClassesAndInstancesWithPartSPC failed with error: %@", (uint8_t *)&v3, 0xCu);
}

void sub_21FC60E40(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC60EAC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC60F18(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Display Repair Not Available for the device", buf, 2u);
}

void sub_21FC60F58(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC60FC4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "%s\n", (uint8_t *)&v2, 0xCu);
}

void sub_21FC6103C(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "-[CRComponentBase CRCreateECDSADerData:responseDer:]";
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "%s failed to create DER file", (uint8_t *)&v1, 0xCu);
}

void sub_21FC610C0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to allocate encoder", v2, v3, v4, v5, v6);
}

void sub_21FC610F4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to allocate dstEncoder", v2, v3, v4, v5, v6);
}

void sub_21FC61128()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "derData is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC6115C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "derDataLength is 0", v2, v3, v4, v5, v6);
}

void sub_21FC61190()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "DEREncoderCreateEncodedBuffer failed", v2, v3, v4, v5, v6);
}

void sub_21FC611C4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "DEREncoderAddSequenceFromEncoder failed", v2, v3, v4, v5, v6);
}

void sub_21FC611F8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Response Dictionary Empty", v1, 2u);
}

void sub_21FC6123C(void **a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Unable to read Roswell identifier:%@", (uint8_t *)&v3, 0xCu);
}

void sub_21FC612C4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid Params and Nonce", v2, v3, v4, v5, v6);
}

void sub_21FC612F8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to create sha256hash of nonce", v2, v3, v4, v5, v6);
}

void sub_21FC6132C(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_21FBF74D8(&dword_21FBF2000, a2, a3, "Unable to read tsid:%@", a5, a6, a7, a8, 2u);
}

void sub_21FC613A8(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_21FBF74D8(&dword_21FBF2000, a2, a3, "properties fetch failed:%@", a5, a6, a7, a8, 2u);
}

void sub_21FC61424(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "failed to create FDR object", v1, 2u);
}

void sub_21FC61468(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Invalid Params and Nonce", v1, 2u);
}

void sub_21FC614AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC61518(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC61584(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "could not find IOAccessoryManager service for port %d\n", (uint8_t *)v1, 8u);
}

void sub_21FC61604(mach_error_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = mach_error_string(a1);
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "could not open IOAccessoryManager service: %s\n", (uint8_t *)&v3, 0xCu);
}

void sub_21FC61690(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC616FC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Unable to getUpdateDataClasses:%@", v2, v3, v4, v5, v6);
}

void sub_21FC61764()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Unable to getClaimDataClasses:%@", v2, v3, v4, v5, v6);
}

void sub_21FC617CC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "KBB sealing manifest not found", v2, v3, v4, v5, v6);
}

void sub_21FC61800()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to set minimal sealing meta", v2, v3, v4, v5, v6);
}

void sub_21FC61834()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealingMapCopyMinimalManifestClassesAndInstances failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC6189C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealingManifestCopyMinimalManifestClassesAndInstances failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC61904()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Decode KBB sealing manifest failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC6196C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to create multiSealingMetadata", v2, v3, v4, v5, v6);
}

void sub_21FC619A0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to create metaDataDict", v2, v3, v4, v5, v6);
}

void sub_21FC619D4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "sikStr is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC61A08()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "fullStr is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC61A3C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "innerHeaderKey failed to create", v2, v3, v4, v5, v6);
}

void sub_21FC61A70()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FC22C88();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "Failed to delete %@, error: %@");
}

void sub_21FC61AD8()
{
  sub_21FC22CA0();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "Failed to sync %@ to %@");
}

void sub_21FC61B48()
{
  sub_21FC1133C();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "Failed to create directory at %@, error: %@");
}

void sub_21FC61BB0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Failed to setup FileSystem for repair", v1, 2u);
}

void sub_21FC61BF4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Can't read fdr factory data path; error: %@",
    (uint8_t *)&v2,
    0xCu);
}

void sub_21FC61C6C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Missing FDR data path", v1, 2u);
}

void sub_21FC61CB0()
{
  sub_21FC1133C();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "Failed to delete %@, error: %@");
}

void sub_21FC61D18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC61D90()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Unable to getMakeDataClasses:%@", v2, v3, v4, v5, v6);
}

void sub_21FC61DF8()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Unable to fetch drp#:%@", v2, v3, v4, v5, v6);
}

void sub_21FC61E60(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Fail to get KBB seal manifest", v1, 2u);
}

void sub_21FC61EA4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Failed to serialize patchItemDict, error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC61F1C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Invalid patch info, failed to decode patch info data", v1, 2u);
}

void sub_21FC61F60(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Unable to setup FS for repair", v1, 2u);
}

void sub_21FC61FA4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC62010(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC6207C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC620E8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Failed to setup alternative FDR path", v1, 2u);
}

void sub_21FC6212C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid action", v2, v3, v4, v5, v6);
}

void sub_21FC62160()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid daemon label", v2, v3, v4, v5, v6);
}

void sub_21FC62194()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Missing entitlement for controlling daemon %@", v2, v3, v4, v5, v6);
}

void sub_21FC621FC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid domain name", v2, v3, v4, v5, v6);
}

void sub_21FC62230()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid preference key", v2, v3, v4, v5, v6);
}

void sub_21FC62264()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid preference value", v2, v3, v4, v5, v6);
}

void sub_21FC62298()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Missing entitlement for accessing defaults of domain %@", v2, v3, v4, v5, v6);
}

void sub_21FC62300()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to find libxpc API", v2, v3, v4, v5, v6);
}

void sub_21FC62334()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unsupported action", v2, v3, v4, v5, v6);
}

void sub_21FC62368()
{
  sub_21FBF8D7C();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_21FC11354(&dword_21FBF2000, v0, v1, "%s: error %lld", v2, v3);
}

void sub_21FC623DC()
{
  sub_21FBF8D7C();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_21FC11354(&dword_21FBF2000, v1, v2, "%s service already %s", v3, v4);
}

void sub_21FC6246C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "dlopen failed", v2, v3, v4, v5, v6);
}

void sub_21FC624A0()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "dlsym(%s) failed", v2, v3, v4, v5, v6);
}

void sub_21FC62508()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid parameters", v2, v3, v4, v5, v6);
}

void sub_21FC6253C(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Failed to parse cert chain; stat: %d", (uint8_t *)v2, 8u);
}

void sub_21FC625B4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "CTParseCertificateSet parse failed", v2, v3, v4, v5, v6);
}

void sub_21FC625E8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to create certificatePEM", v2, v3, v4, v5, v6);
}

void sub_21FC6261C(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = @"RCSn";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Unable to get property %@: %@", (uint8_t *)&v2, 0x16u);
}

void sub_21FC626A8()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to copy sealed dataclasses and instances: %@", v2, v3, v4, v5, v6);
}

void sub_21FC62710()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid AMAI object", v2, v3, v4, v5, v6);
}

void sub_21FC62744()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to allocate Personalization IDs", v2, v3, v4, v5, v6);
}

void sub_21FC62778()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid CRPersonalizationElementIds", v2, v3, v4, v5, v6);
}

void sub_21FC627AC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Empty measurementDict", v2, v3, v4, v5, v6);
}

void sub_21FC627E0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to create response dict", v2, v3, v4, v5, v6);
}

void sub_21FC62814()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to create request dict", v2, v3, v4, v5, v6);
}

void sub_21FC62848()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid inputs", v2, v3, v4, v5, v6);
}

void sub_21FC6287C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Can't allocate CFURL", v2, v3, v4, v5, v6);
}

void sub_21FC628B0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "unable to fetch PDI domain nonce", v2, v3, v4, v5, v6);
}

void sub_21FC628E4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "bad AP img4 parameters", v2, v3, v4, v5, v6);
}

void sub_21FC62918(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "failed to copy nonce: error %d", (uint8_t *)v2, 8u);
}

void sub_21FC62990(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "failed to set signing server URL to \"%@\"", (uint8_t *)&v2, 0xCu);
}

void sub_21FC62A08()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Parameters Invalid", v2, v3, v4, v5, v6);
}

void sub_21FC62A3C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Process is not entitled to perform addCustomPersonalizationElementWithId", v2, v3, v4, v5, v6);
}

void sub_21FC62A70()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to set SSO token", v2, v3, v4, v5, v6);
}

void sub_21FC62AA4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to enable single sign on", v2, v3, v4, v5, v6);
}

void sub_21FC62AD8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed load SSOClient.framework", v2, v3, v4, v5, v6);
}

void sub_21FC62B0C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "SSO not available", v2, v3, v4, v5, v6);
}

void sub_21FC62B40(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Invalid time parameters", v1, 2u);
}

void sub_21FC62B84(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Cannot serialize boot intent dictionary, abort", v1, 2u);
}

void sub_21FC62BC8(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "JSON serialization got an error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC62C40(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Reboot failed with error:%d", (uint8_t *)v2, 8u);
}

void sub_21FC62CB8()
{
  sub_21FC2E06C();
  sub_21FC2E080(&dword_21FBF2000, v0, v1, "Set %@ failed with error %@", v2, v3, v4, v5, 2u);
}

void sub_21FC62D2C()
{
  sub_21FC2E06C();
  sub_21FC2E080(&dword_21FBF2000, v0, v1, "Set %@ failed with error %@", v2, v3, v4, v5, 2u);
}

void sub_21FC62DA0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Failed to enable SSO", v1, 2u);
}

void sub_21FC62DE4()
{
  sub_21FC2E06C();
  sub_21FC2E080(&dword_21FBF2000, v0, v1, "Clear %@ failed:%@", v2, v3, v4, v5, 2u);
}

void sub_21FC62E58()
{
  sub_21FC2E06C();
  sub_21FC2E080(&dword_21FBF2000, v0, v1, "Clear %@ failed:%@", v2, v3, v4, v5, 2u);
}

void sub_21FC62ECC(void **a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Unable to read Roswel identifier:%@", (uint8_t *)&v3, 0xCu);
}

void sub_21FC62F54()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid Params and Nonce", v2, v3, v4, v5, v6);
}

void sub_21FC62F88()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to create sha256hash of nonce", v2, v3, v4, v5, v6);
}

void sub_21FC62FBC()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Local sealing manifest populate failed, error = %@", v2, v3, v4, v5, v6);
}

void sub_21FC63024()
{
  sub_21FC32218();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "Failed to verify local %@ data; error: %@");
}

void sub_21FC63090()
{
  sub_21FC32218();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "Failed to read local %@ data; error: %@");
}

void sub_21FC630FC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Cannot copy %@ data from device", v2, v3, v4, v5, v6);
}

void sub_21FC63164(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Failed to get payload; stat: %d", (uint8_t *)v2, 8u);
}

void sub_21FC631DC(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Failed to parse cert as img4; stat: %d",
    (uint8_t *)v2,
    8u);
}

void sub_21FC63254()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get local sealing manifest", v2, v3, v4, v5, v6);
}

void sub_21FC63288()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Classes is not an array", v2, v3, v4, v5, v6);
}

void sub_21FC632BC(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_21FBF74D8(&dword_21FBF2000, a2, a3, "Failed to decode sealing manifest: %@", a5, a6, a7, a8, 2u);
}

void sub_21FC63338(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_21FBF74D8(&dword_21FBF2000, a2, a3, "Failed to decode sealing map: %@", a5, a6, a7, a8, 2u);
}

void sub_21FC633B4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Data class is nil", v2, v3, v4, v5, v6);
}

void sub_21FC633E8()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to get DataInstance:%@", v2, v3, v4, v5, v6);
}

void sub_21FC63450()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Copy manifest data failed, error = %@", v2, v3, v4, v5, v6);
}

void sub_21FC634B8()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_21FC63520()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Local Sealing manifest fetch failed", v2, v3, v4, v5, v6);
}

void sub_21FC63554()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "DataInstances and Classes count mismatch", v2, v3, v4, v5, v6);
}

void sub_21FC63588()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to read EAN", v2, v3, v4, v5, v6);
}

void sub_21FC635BC(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_localizedDescription(a1, a2, a3, a4);
  sub_21FBF8D7C();
  _os_log_error_impl(&dword_21FBF2000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%@", v6, 0xCu);
}

void sub_21FC63650(void *a1, char *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v9 = 134218240;
  uint64_t v10 = objc_msgSend_count(a1, a2, (uint64_t)a3, a4);
  __int16 v11 = 2048;
  uint64_t v12 = objc_msgSend_count(a2, v6, v7, v8);
  _os_log_error_impl(&dword_21FBF2000, a3, OS_LOG_TYPE_ERROR, "Live classes: %lu. Live instances: %lu", (uint8_t *)&v9, 0x16u);
}

void sub_21FC63700()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Missing live data: %@", v2, v3, v4, v5, v6);
}

void sub_21FC63768()
{
  sub_21FC3220C();
  v3[0] = 67109378;
  v3[1] = v1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  _os_log_error_impl(&dword_21FBF2000, v2, OS_LOG_TYPE_ERROR, "Read live data: %d. %@", (uint8_t *)v3, 0x12u);
}

void sub_21FC63800()
{
  sub_21FC3220C();
  sub_21FC321F4();
  sub_21FC11354(&dword_21FBF2000, v1, v2, "Failed to read sealed property of %@: %@");
}

void sub_21FC63874()
{
  sub_21FC3220C();
  sub_21FC321F4();
  sub_21FC11354(&dword_21FBF2000, v1, v2, "Failed to read live property of %@: %@");
}

void sub_21FC638E8()
{
  sub_21FC3220C();
  sub_21FC321F4();
  sub_21FC11354(&dword_21FBF2000, v1, v2, "Failed to read sealed instances of %@: %@");
}

void sub_21FC6395C()
{
  sub_21FC3220C();
  sub_21FC321F4();
  sub_21FC11354(&dword_21FBF2000, v1, v2, "Failed to read live instances of %@: %@");
}

void sub_21FC639D0(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *a1;
  sub_21FBF74D8(&dword_21FBF2000, a2, a3, "Failed to read live sensor number, error: %@", a5, a6, a7, a8, 2u);
}

void sub_21FC63A4C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to create amfdr", v2, v3, v4, v5, v6);
}

void sub_21FC63A80()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to create property value string", v2, v3, v4, v5, v6);
}

void sub_21FC63AB4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get 'SrvT' property", v2, v3, v4, v5, v6);
}

void sub_21FC63AE8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to read seal data", v2, v3, v4, v5, v6);
}

void sub_21FC63B1C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No EAN support.", v2, v3, v4, v5, v6);
}

void sub_21FC63B50()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to create fdrLocal", v2, v3, v4, v5, v6);
}

void sub_21FC63B84()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to get local manifest properties, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC63BEC(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = @"/var/hardware/Pearl";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Failed to delete directory %@, error: %@", (uint8_t *)&v2, 0x16u);
}

void sub_21FC63C78(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC63CE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC63D50()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Get osBootHash failed", v2, v3, v4, v5, v6);
}

void sub_21FC63D84()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Get prebootPath failed", v2, v3, v4, v5, v6);
}

void sub_21FC63DB8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Get customAMAuthInstallRef failed", v2, v3, v4, v5, v6);
}

void sub_21FC63DEC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Create optionsDict failed", v2, v3, v4, v5, v6);
}

void sub_21FC63E20()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Create updaterOptions failed", v2, v3, v4, v5, v6);
}

void sub_21FC63E54()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Get Brunor ticket failed", v2, v3, v4, v5, v6);
}

void sub_21FC63E88(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC63EF4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Get Yonkers ticket failed", v2, v3, v4, v5, v6);
}

void sub_21FC63F28()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to enable SSO", v2, v3, v4, v5, v6);
}

void sub_21FC63F5C()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to get local psd3, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC63FC4(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Failed to verify psd3, pearlStatus: %d", (uint8_t *)v2, 8u);
}

void sub_21FC6403C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Can not archive the data", v2, v3, v4, v5, v6);
}

void sub_21FC64070()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to encrypt data", v2, v3, v4, v5, v6);
}

void sub_21FC640A4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid input encrypted credentials string", v2, v3, v4, v5, v6);
}

void sub_21FC640D8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to decrypt data", v2, v3, v4, v5, v6);
}

void sub_21FC6410C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_DEBUG, "The WiFi info decoded from encrypted credentials: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC64184()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid Inputs", v2, v3, v4, v5, v6);
}

void sub_21FC641B8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get file handle", v2, v3, v4, v5, v6);
}

void sub_21FC641EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC64258(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC642C4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Failed to get component state: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC6433C(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Failed to get component for %d", (uint8_t *)v2, 8u);
}

void sub_21FC643B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Invalid Inputs", v1, 2u);
}

void sub_21FC643F8()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "prefetchPermissions failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC64460()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Staged Claim failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC644C8()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Local patch failed, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC64530()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Sealing failed, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC64598()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Post Sealing Stage Failed.", v2, v3, v4, v5, v6);
}

void sub_21FC645CC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Get all local patch data failed, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC64634()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Remote Recover failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC6469C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Staged Make failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC64704()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Additional UPDATE properties is not allowed when transit between real and staged sealing", v2, v3, v4, v5, v6);
}

void sub_21FC64738()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Additional PATCH is not allowed when transit between real and staged sealing", v2, v3, v4, v5, v6);
}

void sub_21FC6476C(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[CRFDRSeal(StagedSealing) performRealToStagedRepair:fdrLocal:fdrRemote:]";
  _os_log_debug_impl(&dword_21FBF2000, log, OS_LOG_TYPE_DEBUG, "entering %s ...", (uint8_t *)&v1, 0xCu);
}

void sub_21FC647F0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Local FDR data not verified, staged data might be corrupted", v2, v3, v4, v5, v6);
}

void sub_21FC64824(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[CRFDRSeal(StagedSealing) performStagedToStagedRepair:fdrLocal:fdrRemote:]";
  _os_log_debug_impl(&dword_21FBF2000, log, OS_LOG_TYPE_DEBUG, "entering %s ...", (uint8_t *)&v1, 0xCu);
}

void sub_21FC648A8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "amfdr options is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC648DC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDR Get 1.0 Failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC64944()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Stage data commit failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC649AC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to create LocalAndRemotePermission for Sealing", v2, v3, v4, v5, v6);
}

void sub_21FC649E0()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRMigrateCredentials for Sealing error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC64A48()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRPermisisonRequest for Sealing error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC64AB0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "AMFDRDataAppendPermissionsString Patch failed", v2, v3, v4, v5, v6);
}

void sub_21FC64AE4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "AMFDRDataAppendPermissionsString GET 1.0 failed", v2, v3, v4, v5, v6);
}

void sub_21FC64B18()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Perform staged CLAIM failed.", v2, v3, v4, v5, v6);
}

void sub_21FC64B4C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Perform staged MAKE failed.", v2, v3, v4, v5, v6);
}

void sub_21FC64B80()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "make classes and instances count mismatched", v2, v3, v4, v5, v6);
}

void sub_21FC64BB4()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Partial Sealing Failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC64C1C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Staged seal failed", v2, v3, v4, v5, v6);
}

void sub_21FC64C50()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Response Dictionary Empty", v2, v3, v4, v5, v6);
}

void sub_21FC64C84()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Ap ticket not found in response", v2, v3, v4, v5, v6);
}

void sub_21FC64CB8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to create CFDataRef of the digest", v2, v3, v4, v5, v6);
}

void sub_21FC64CEC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Fail to get property in AP ticket", v2, v3, v4, v5, v6);
}

void sub_21FC64D20()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Fail parsing AP ticket", v2, v3, v4, v5, v6);
}

void sub_21FC64D54()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "ImageProperties creation failed", v2, v3, v4, v5, v6);
}

void sub_21FC64D88()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to read apTicketPath", v2, v3, v4, v5, v6);
}

void sub_21FC64DBC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to read apTicketdata", v2, v3, v4, v5, v6);
}

void sub_21FC64DF0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to parse OS version Data\n", v2, v3, v4, v5, v6);
}

void sub_21FC64E24()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to parse sepi digest\n", v2, v3, v4, v5, v6);
}

void sub_21FC64E58()
{
  sub_21FC3EC44();
  sub_21FC3EC74(&dword_21FBF2000, v0, v1, "Img4DecodeGetObjectPropertyData failed get sepi digest with code %d (0x%X)", v2, v3, v4, v5, v6);
}

void sub_21FC64EC0()
{
  sub_21FC3EC44();
  sub_21FC3EC74(&dword_21FBF2000, v0, v1, "Img4DecodeInitManifest failed get LOVE with code %d (0x%X)", v2, v3, v4, v5, v6);
}

void sub_21FC64F28()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to parse AP ticket as Img4 manifest\n", v2, v3, v4, v5, v6);
}

void sub_21FC64F5C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Input PDI path nil", v2, v3, v4, v5, v6);
}

void sub_21FC64F90()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Fail to generate SEP Nonce", v2, v3, v4, v5, v6);
}

void sub_21FC64FC4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to generate digest", v2, v3, v4, v5, v6);
}

void sub_21FC64FF8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to create Image Properties", v2, v3, v4, v5, v6);
}

void sub_21FC6502C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "UpdaterOptions Empty", v2, v3, v4, v5, v6);
}

void sub_21FC65060()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Error creating build identity dictionary:", v2, v3, v4, v5, v6);
}

void sub_21FC65094()
{
  sub_21FC3EC68();
  sub_21FC3EC5C();
  sub_21FBF74D8(&dword_21FBF2000, v1, v2, "Error copying firmware: %@", v3, v4, v5, v6, v7);
}

void sub_21FC65108()
{
  sub_21FC3EC68();
  sub_21FC3EC5C();
  sub_21FBF74D8(&dword_21FBF2000, v1, v2, "Error creating measurement Dictionary: %@", v3, v4, v5, v6, v7);
}

void sub_21FC6517C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to parse sepi DGST\n", v2, v3, v4, v5, v6);
}

void sub_21FC651B0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to read firmware path", v2, v3, v4, v5, v6);
}

void sub_21FC651E4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to parse sepi DGST", v2, v3, v4, v5, v6);
}

void sub_21FC65218()
{
  sub_21FC3EC68();
  sub_21FC3EC5C();
  sub_21FBF74D8(&dword_21FBF2000, v1, v2, "Failed to get tags, error: %@", v3, v4, v5, v6, v7);
}

void sub_21FC6528C()
{
  sub_21FC3EC68();
  sub_21FC3EC5C();
  sub_21FBF74D8(&dword_21FBF2000, v1, v2, "Failed to copy firmware: %@", v3, v4, v5, v6, v7);
}

void sub_21FC65300()
{
  sub_21FC3EC68();
  sub_21FC3EC5C();
  sub_21FBF74D8(&dword_21FBF2000, v1, v2, "Failed to create measurement dictionary: %@", v3, v4, v5, v6, v7);
}

void sub_21FC65374(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC653E0()
{
  sub_21FC3EC44();
  sub_21FC3EC74(&dword_21FBF2000, v0, v1, "Img4DecodeInitManifest failed get trust object digest with code %d (0x%X)", v2, v3, v4, v5, v6);
}

void sub_21FC65448()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to parse AP ticket as Img4 manifest", v2, v3, v4, v5, v6);
}

void sub_21FC6547C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Savage ticket not found in response", v2, v3, v4, v5, v6);
}

void sub_21FC654B0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to read deviceInfo, fabRevision and productionMode", v2, v3, v4, v5, v6);
}

void sub_21FC654E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC65554()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Create CRUtils failed", v2, v3, v4, v5, v6);
}

void sub_21FC65588()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Yonkers ticket not found in response", v2, v3, v4, v5, v6);
}

void sub_21FC655BC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to generate SeaCookieKeyIdentifier", v2, v3, v4, v5, v6);
}

void sub_21FC655F0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to populate restoreSEPProperties", v2, v3, v4, v5, v6);
}

void sub_21FC65624()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "override options was not found", v2, v3, v4, v5, v6);
}

void sub_21FC65658()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "SEP digest not found from override options", v2, v3, v4, v5, v6);
}

void sub_21FC6568C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "SEP nonce not found from override options", v2, v3, v4, v5, v6);
}

void sub_21FC656C0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Brunor ticket not found in response", v2, v3, v4, v5, v6);
}

void sub_21FC656F4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "options Empty", v2, v3, v4, v5, v6);
}

void sub_21FC65728()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "updaterOptions missing", v2, v3, v4, v5, v6);
}

void sub_21FC6575C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "auth missing", v2, v3, v4, v5, v6);
}

void sub_21FC65790()
{
  sub_21FC3EC68();
  sub_21FC3EC5C();
  sub_21FBF74D8(&dword_21FBF2000, v1, v2, "Error get updater tags: %@", v3, v4, v5, v6, v7);
}

void sub_21FC65804()
{
  sub_21FBF8D7C();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "Failed to fetch dataInstance:%@:%@");
}

void sub_21FC6587C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealingMapCopyMultiInstanceForClass failed, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC658E4(uint64_t a1, void **a2, NSObject *a3)
{
  uint64_t v3 = *a2;
  *(_DWORD *)uint64_t v4 = 138412546;
  *(void *)&v4[4] = a1;
  *(_WORD *)&v4[12] = 2112;
  *(void *)&v4[14] = *a2;
  sub_21FC11354(&dword_21FBF2000, (uint64_t)a2, a3, "Failed to fetch dataInstance:%@:%@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16]);
}

void sub_21FC6596C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "can't get DataClass using componentName:%@", v2, v3, v4, v5, v6);
}

void sub_21FC659D4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC65A44()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "sealingMap is invalid", v2, v3, v4, v5, v6);
}

void sub_21FC65A78()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get product type", v2, v3, v4, v5, v6);
}

void sub_21FC65AAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC65B1C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Could not get Sealed Data Instance:%@", v2, v3, v4, v5, v6);
}

void sub_21FC65B84()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Sealing manifest parse failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC65BEC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC65C5C()
{
  sub_21FC1133C();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "Invalid patch data %@-%@ for this device");
}

void sub_21FC65CC4()
{
  sub_21FC1133C();
  sub_21FC11354(&dword_21FBF2000, v0, v1, "Invalid patch 4cc %@ for patch class %@");
}

void sub_21FC65D2C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Invalid patch data class %@", v2, v3, v4, v5, v6);
}

void sub_21FC65D94()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21FBF8D7C();
  _os_log_debug_impl(&dword_21FBF2000, v0, OS_LOG_TYPE_DEBUG, "Expected Patch Info: %@", v1, 0xCu);
}

void sub_21FC65E08()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid patch values count", v2, v3, v4, v5, v6);
}

void sub_21FC65E3C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid patch data instances count", v2, v3, v4, v5, v6);
}

void sub_21FC65E70()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Missing required patch info", v2, v3, v4, v5, v6);
}

void sub_21FC65EA4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Patch not supported.", v2, v3, v4, v5, v6);
}

void sub_21FC65ED8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Missing valid data/instance", v2, v3, v4, v5, v6);
}

void sub_21FC65F0C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Failed to alloc resources", buf, 2u);
}

void sub_21FC65F4C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to alloc resources", v2, v3, v4, v5, v6);
}

void sub_21FC65F80()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "SN are same and last sealing date is %ld days ago.", v2, v3, v4, v5, v6);
}

void sub_21FC65FE8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "decode time tag error", v2, v3, v4, v5, v6);
}

void sub_21FC6601C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "time data in sealing manifest corrupted", v2, v3, v4, v5, v6);
}

void sub_21FC66050()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "no time tag found", v2, v3, v4, v5, v6);
}

void sub_21FC66084()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to decode sealing manifest data", v2, v3, v4, v5, v6);
}

void sub_21FC660B8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "failed to decode sealing manifest", v2, v3, v4, v5, v6);
}

void sub_21FC660EC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Could not create URL for FDR recovery data storage", v2, v3, v4, v5, v6);
}

void sub_21FC66120()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to get handler for device", v2, v3, v4, v5, v6);
}

void sub_21FC66154()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Unable to copy the APTicket path. %@", v2, v3, v4, v5, v6);
}

void sub_21FC661BC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Unable to read APTicket:%@", v2, v3, v4, v5, v6);
}

void sub_21FC66224()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "updateProperties validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC66258()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to decode patchItems dict", v2, v3, v4, v5, v6);
}

void sub_21FC6628C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid patchItems format", v2, v3, v4, v5, v6);
}

void sub_21FC662C0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "patchItems validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC662F4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "patchValues validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC66328()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "patchDataInstances validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC6635C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "patchDataClasses validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC66390()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "allowSelfService validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC663C4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "allowUsedPart validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC663F8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "skipStageEAN validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC6642C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "ignoreStagedData validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC66460()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "enableStagedSeal validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC66494()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "enableProxy validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC664C8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "KeyBlob validation failed.", v2, v3, v4, v5, v6);
}

void sub_21FC664FC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Invalid key: %@", v2, v3, v4, v5, v6);
}

void sub_21FC66564()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to map %@ to FDR data class", v2, v3, v4, v5, v6);
}

void sub_21FC665CC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Unable to get ClaimDataClasses:%@", v2, v3, v4, v5, v6);
}

void sub_21FC66634()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Could not create AMFDR options local", v2, v3, v4, v5, v6);
}

void sub_21FC66668()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Could not create AMFDR options remote", v2, v3, v4, v5, v6);
}

void sub_21FC6669C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Could not create AMFDR local", v2, v3, v4, v5, v6);
}

void sub_21FC666D0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Could not create AMFDR remote", v2, v3, v4, v5, v6);
}

void sub_21FC66704()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Set local and remote trust object failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC6676C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "getCurrentManifestDataClassesAndInstancesWithPartSPC failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC667D4()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Verification failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC6683C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "queryDeviceStagedSealedFromEAN failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC668A4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Patch validation failed", v2, v3, v4, v5, v6);
}

void sub_21FC668D8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get final merged data", v2, v3, v4, v5, v6);
}

void sub_21FC6690C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "getMinimalManifestsClassesAndInstancesWithPartSPC failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC66974()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "getMakeDataClassesAndInstancesWithPartSPC failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC669DC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "getUpdateDataClassesAndInstancesWithPartSPC failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC66A44()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Serial number validation failed", v2, v3, v4, v5, v6);
}

void sub_21FC66A78()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "can't allocation options dictionary", v2, v3, v4, v5, v6);
}

void sub_21FC66AAC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "can't get ecid", v2, v3, v4, v5, v6);
}

void sub_21FC66AE0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unexpected NULL value returned from SecTaskCreateFromSelf()", v2, v3, v4, v5, v6);
}

void sub_21FC66B14()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "AMFDRDataCreatePermissionsString failed", v2, v3, v4, v5, v6);
}

void sub_21FC66B48()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRPermisisonRequest error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC66BB0()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Could not query MobileGestalt for data class: %@", v2, v3, v4, v5, v6);
}

void sub_21FC66C18()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "ClaimedData PUT Failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC66C80()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "HTTP Challenge Claim Failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC66CE8()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to get date from cert with %@", v2, v3, v4, v5, v6);
}

void sub_21FC66D50(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_msgSend_timeIntervalSinceReferenceDate(a1, a2, a3, a4);
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = (int)v6;
  _os_log_debug_impl(&dword_21FBF2000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "dateToWrite is %@ (%d) ", (uint8_t *)&v7, 0x12u);
}

void sub_21FC66DF0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to personalize with empty trust object digest", v2, v3, v4, v5, v6);
}

void sub_21FC66E24()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Remote trust object not found", v2, v3, v4, v5, v6);
}

void sub_21FC66E58()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to get digest of remote trust object", v2, v3, v4, v5, v6);
}

void sub_21FC66E8C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "apTrustObjectDigest from apTicket is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC66EC0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to fetch remote trust object", v2, v3, v4, v5, v6);
}

void sub_21FC66EF4()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "No SSL Root found in trust object :%@", v2, v3, v4, v5, v6);
}

void sub_21FC66F5C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "permisisons is NULL", v2, v3, v4, v5, v6);
}

void sub_21FC66F90()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  v1[0] = 138412802;
  sub_21FC4D670();
  int v1[6] = 5;
  _os_log_error_impl(&dword_21FBF2000, v0, OS_LOG_TYPE_ERROR, "Failed to append permissions string with data class '%@', data instance '%@', action '%d'", (uint8_t *)v1, 0x1Cu);
}

void sub_21FC67018()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  v1[0] = 138412802;
  sub_21FC4D670();
  int v1[6] = 0;
  _os_log_error_impl(&dword_21FBF2000, v0, OS_LOG_TYPE_ERROR, "Failed to append permissions string with data class '%@', data instance '%@', action '%d'", (uint8_t *)v1, 0x1Cu);
}

void sub_21FC6709C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "No patch info, skipping.", v2, v3, v4, v5, v6);
}

void sub_21FC670D0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Missing patch options", v2, v3, v4, v5, v6);
}

void sub_21FC67104()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Could not create AMFDR local", v2, v3, v4, v5, v6);
}

void sub_21FC67138()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to copy local data, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC671A0()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRDataMultiPatch failed, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC67208()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Could not create AMFDR remote", v2, v3, v4, v5, v6);
}

void sub_21FC6723C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRDataMultiCommitPatch failed, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC672A4(unsigned char *a1, unsigned char *a2)
{
  sub_21FC4D660(a1, a2);
  sub_21FC4D648(&dword_21FBF2000, v2, (uint64_t)v2, "Failed to get data from patched data", v3);
}

void sub_21FC672D4(unsigned char *a1, unsigned char *a2)
{
  sub_21FC4D660(a1, a2);
  sub_21FC4D648(&dword_21FBF2000, v2, (uint64_t)v2, "Failed to commit patched data to local", v3);
}

void sub_21FC67304(unsigned char *a1, unsigned char *a2)
{
  sub_21FC4D660(a1, a2);
  sub_21FC4D648(&dword_21FBF2000, v2, (uint64_t)v2, "Failed to delete old data", v3);
}

void sub_21FC67334()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to migrate credentials to remote patch amfdr, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC6739C(unsigned char *a1, unsigned char *a2)
{
  sub_21FC4D660(a1, a2);
  sub_21FC4D648(&dword_21FBF2000, v2, (uint64_t)v2, "Failed to get data from copied data", v3);
}

void sub_21FC673CC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid patch data count", v2, v3, v4, v5, v6);
}

void sub_21FC67400()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Failed to migrate credentials to local patch amfdr, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC67468()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid patch values count", v2, v3, v4, v5, v6);
}

void sub_21FC6749C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid patch data instances count", v2, v3, v4, v5, v6);
}

void sub_21FC674D0()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Unable to get SealingManifest:%@", v2, v3, v4, v5, v6);
}

void sub_21FC67538()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Can't read fdr factory data path; error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC675A0(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = @"40A0DDD2-77F8-4392-B4A3-1E7304206516:IsServicePart";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Fail to delete key: %@. Error: %@", (uint8_t *)&v2, 0x16u);
}

void sub_21FC6762C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to sync alternative FDR path", v2, v3, v4, v5, v6);
}

void sub_21FC67660()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to commit data to FS", v2, v3, v4, v5, v6);
}

void sub_21FC67694()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "stageFDREANWithApTicket failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC676FC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "setupVersionedFDRWithApTicket failed", v2, v3, v4, v5, v6);
}

void sub_21FC67730()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "AMFDRSealedDataRestoreOptions failed", v2, v3, v4, v5, v6);
}

void sub_21FC67764()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealedDataCommit with amfdrLocal failed. Data Recovery failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC677CC()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Local sealingManifestData is NULL:%@", v2, v3, v4, v5, v6);
}

void sub_21FC67834()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Local data verification failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC6789C()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Post SealingManifest parse failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC67904()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Local SealingManifest populate failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC6796C()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "FDR Data Populated failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC679D4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "sealedData->sealingRequest is NULL. Sealing failed.", v2, v3, v4, v5, v6);
}

void sub_21FC67A08()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Signing failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC67A70()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "sealedData->sealingManifest is NULL. Sealing failed.", v2, v3, v4, v5, v6);
}

void sub_21FC67AA4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Commit Sealeddata Failed", v2, v3, v4, v5, v6);
}

void sub_21FC67AD8()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "SealedDataClearSealingManifests failed", v2, v3, v4, v5, v6);
}

void sub_21FC67B0C()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealedDataCreateSealingRequest failed. Sealing failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC67B74()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Unable to put data locally: %@", v2, v3, v4, v5, v6);
}

void sub_21FC67BDC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to create dataClassesforPut & dataInstancesforPut", v2, v3, v4, v5, v6);
}

void sub_21FC67C10(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7 = objc_msgSend_numberOfRanges(a2, (const char *)a2, (uint64_t)a3, (uint64_t)a4);
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl(&dword_21FBF2000, a4, OS_LOG_TYPE_DEBUG, "number of ranges:%ld", a1, 0xCu);
}

void sub_21FC67C7C()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21FBF8D7C();
  _os_log_debug_impl(&dword_21FBF2000, v0, OS_LOG_TYPE_DEBUG, "Commit data: %@", v1, 0xCu);
}

void sub_21FC67CF0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to create sealedData. Data Recovery failed.", v2, v3, v4, v5, v6);
}

void sub_21FC67D24()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Local property verification failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC67D8C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to versioned FDRData commit", v2, v3, v4, v5, v6);
}

void sub_21FC67DC0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to write to EAN", v2, v3, v4, v5, v6);
}

void sub_21FC67DF4()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealedDataPopulate failed with fatal error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC67E5C()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealedDataPopulate with local failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC67EC4()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealedDataSetMinimalManifestClassInstance failed with error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC67F2C()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealedDataSetDataClassInstance failed with error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC67F94()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealedDataConfigureOptionsForRecover failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC67FFC()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealingMapConfigSealedData failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC68064()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "AMFDRSealedDataConfigureOptionsForRecover failed.", v2, v3, v4, v5, v6);
}

void sub_21FC68098()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealedDataCommit with amfdrLocal failed. Data Recovery failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC68100()
{
  sub_21FBF7500(*MEMORY[0x263EF8340]);
  sub_21FBF74F4();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDRSealedDataPopulateWithExistingData failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC68168()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Could not get options entry from the device tree", v2, v3, v4, v5, v6);
}

void sub_21FC6819C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Could not read value", v2, v3, v4, v5, v6);
}

void sub_21FC681D0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Could not get main port", v2, v3, v4, v5, v6);
}

void sub_21FC68204(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Could not save value:%08x\n", (uint8_t *)v2, 8u);
}

void sub_21FC6827C(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Could not delete value:%08x\n", (uint8_t *)v2, 8u);
}

void sub_21FC682F4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21FBF2000, log, OS_LOG_TYPE_ERROR, "Failed to create FDR object", v1, 2u);
}

void sub_21FC68338(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Properties fetch failed:%@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC683B0(uint64_t a1, const char *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint8_t v6 = objc_msgSend_componentType(*(void **)(a1 + 32), a2, (uint64_t)a3, a4);
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  int v10 = a2;
  _os_log_error_impl(&dword_21FBF2000, a3, OS_LOG_TYPE_ERROR, "Challenge Failed:%@:%@", (uint8_t *)&v7, 0x16u);
}

void sub_21FC68464(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FBF2000, a2, OS_LOG_TYPE_ERROR, "Unable to get Identifier:%@", (uint8_t *)&v2, 0xCu);
}

void sub_21FC684DC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "HTTP Challenge Claim failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC68544()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Remote patch failed, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC685AC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Remote Recover failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC68614()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Remote Make failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC6867C(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[CRFDRSeal(RealSealing) performRealToRealRepair:fdrLocal:fdrRemote:]";
  _os_log_debug_impl(&dword_21FBF2000, log, OS_LOG_TYPE_DEBUG, "entering %s ...", (uint8_t *)&v1, 0xCu);
}

void sub_21FC68700()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Local FDR data not verified, staged data might be corrupted", v2, v3, v4, v5, v6);
}

void sub_21FC68734()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Local data not verified anymore after make and remote patch", v2, v3, v4, v5, v6);
}

void sub_21FC68768()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Get all local patch data failed, error: %@", v2, v3, v4, v5, v6);
}

void sub_21FC687D0()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Additional UPDATE properties is not allowed when transit between real and staged sealing", v2, v3, v4, v5, v6);
}

void sub_21FC68804()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Additional PATCH is not allowed when transit between real and staged sealing", v2, v3, v4, v5, v6);
}

void sub_21FC68838(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[CRFDRSeal(RealSealing) performStagedToRealRepair:fdrLocal:fdrRemote:]";
  _os_log_debug_impl(&dword_21FBF2000, log, OS_LOG_TYPE_DEBUG, "entering %s ...", (uint8_t *)&v1, 0xCu);
}

void sub_21FC688BC()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "AMFDR make Failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC68924()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Make data commit failed: %@", v2, v3, v4, v5, v6);
}

void sub_21FC6898C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "make classes and instances count mismatched", v2, v3, v4, v5, v6);
}

void sub_21FC689C0()
{
  sub_21FBF8D7C();
  sub_21FBF74D8(&dword_21FBF2000, v0, v1, "Partial Sealing Failed:%@", v2, v3, v4, v5, v6);
}

void sub_21FC68A28()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Generated initialization vector is nil", v2, v3, v4, v5, v6);
}

void sub_21FC68A5C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Generated encryption key is nil", v2, v3, v4, v5, v6);
}

void sub_21FC68A90(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC68AFC()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to allocate return crypto CFData", v2, v3, v4, v5, v6);
}

void sub_21FC68B30(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC68B9C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "The length of encrypted data is too short", v2, v3, v4, v5, v6);
}

void sub_21FC68BD0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21FC68C3C()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Failed to allocate aligned crypto buffer\n", v2, v3, v4, v5, v6);
}

void sub_21FC68C70()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Invalid Params and Nonce", v2, v3, v4, v5, v6);
}

void sub_21FC68CA4()
{
  sub_21FBF74CC();
  sub_21FBF55D8(&dword_21FBF2000, v0, v1, "Unable to create sha256hash of nonce", v2, v3, v4, v5, v6);
}

uint64_t AMAuthInstallApCreatePersonalizedResponse()
{
  return MEMORY[0x270F980B0]();
}

uint64_t AMAuthInstallApImg4ForceServerSigning()
{
  return MEMORY[0x270F980C0]();
}

uint64_t AMAuthInstallApImg4ServerRequestAddRequiredTags()
{
  return MEMORY[0x270F980D8]();
}

uint64_t AMAuthInstallApSetParameters()
{
  return MEMORY[0x270F980E0]();
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x270F980F0]();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return MEMORY[0x270F980F8]();
}

uint64_t AMAuthInstallSetSOCKSProxyInformation()
{
  return MEMORY[0x270F98110]();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return MEMORY[0x270F98118]();
}

uint64_t AMAuthInstallSsoEnable()
{
  return MEMORY[0x270F98120]();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return MEMORY[0x270F98128]();
}

uint64_t AMAuthInstallSsoSetToken()
{
  return MEMORY[0x270F98130]();
}

uint64_t AMAuthInstallSupportGetLibraryVersionString()
{
  return MEMORY[0x270F98148]();
}

uint64_t AMFDRAppendPermissionsString()
{
  return MEMORY[0x270F91D78]();
}

uint64_t AMFDRCreatePermissionsString()
{
  return MEMORY[0x270F91D90]();
}

uint64_t AMFDRCreateTypeWithOptions()
{
  return MEMORY[0x270F91D98]();
}

uint64_t AMFDRCreateWithOptions()
{
  return MEMORY[0x270F91DA0]();
}

uint64_t AMFDRDataApTicketCopyObjectProperty()
{
  return MEMORY[0x270F91DA8]();
}

uint64_t AMFDRDataAppendPermissionsString()
{
  return MEMORY[0x270F91DB8]();
}

uint64_t AMFDRDataCopy()
{
  return MEMORY[0x270F91DC0]();
}

uint64_t AMFDRDataCopyManifest()
{
  return MEMORY[0x270F91DC8]();
}

uint64_t AMFDRDataCopySealingManifestProperty()
{
  return MEMORY[0x270F91DD0]();
}

uint64_t AMFDRDataCopySslRoots()
{
  return MEMORY[0x270F91DD8]();
}

uint64_t AMFDRDataCopyTrustObject()
{
  return MEMORY[0x270F91DE0]();
}

uint64_t AMFDRDataCreatePermissionsString()
{
  return MEMORY[0x270F91DE8]();
}

uint64_t AMFDRDataCreateSikInstanceString()
{
  return MEMORY[0x270F91DF0]();
}

uint64_t AMFDRDataDecodeAndSetSealingManifest()
{
  return MEMORY[0x270F91DF8]();
}

uint64_t AMFDRDataDelete()
{
  return MEMORY[0x270F91E00]();
}

uint64_t AMFDRDataDictCopy()
{
  return MEMORY[0x270F91E08]();
}

uint64_t AMFDRDataHTTPChallengeClaim()
{
  return MEMORY[0x270F91E10]();
}

uint64_t AMFDRDataLocalCreateFullKey()
{
  return MEMORY[0x270F91E18]();
}

uint64_t AMFDRDataMultiCommitPatch()
{
  return MEMORY[0x270F91E20]();
}

uint64_t AMFDRDataMultiCopy()
{
  return MEMORY[0x270F91E28]();
}

uint64_t AMFDRDataMultiMake()
{
  return MEMORY[0x270F91E30]();
}

uint64_t AMFDRDataMultiPatch()
{
  return MEMORY[0x270F91E38]();
}

uint64_t AMFDRDataMultiPut()
{
  return MEMORY[0x270F91E40]();
}

uint64_t AMFDRDataPut()
{
  return MEMORY[0x270F91E48]();
}

uint64_t AMFDRDataPutWithOptions()
{
  return MEMORY[0x270F91E58]();
}

uint64_t AMFDRGetCert()
{
  return MEMORY[0x270F91E60]();
}

uint64_t AMFDRGetOptions()
{
  return MEMORY[0x270F91E68]();
}

uint64_t AMFDRLogSetHandler()
{
  return MEMORY[0x270F91E80]();
}

uint64_t AMFDRMigrateCredentials()
{
  return MEMORY[0x270F91E88]();
}

uint64_t AMFDRPermissionsRequest()
{
  return MEMORY[0x270F91E98]();
}

uint64_t AMFDRRegisterModuleChallengeCallback()
{
  return MEMORY[0x270F91EA0]();
}

uint64_t AMFDRSealedDataClearSealingManifest()
{
  return MEMORY[0x270F91EA8]();
}

uint64_t AMFDRSealedDataCommit()
{
  return MEMORY[0x270F91EB0]();
}

uint64_t AMFDRSealedDataConfigureOptionsForRecover()
{
  return MEMORY[0x270F91EB8]();
}

uint64_t AMFDRSealedDataCreateSealingRequest()
{
  return MEMORY[0x270F91EC0]();
}

uint64_t AMFDRSealedDataGetSealingManifest()
{
  return MEMORY[0x270F91EC8]();
}

uint64_t AMFDRSealedDataGetSealingRequest()
{
  return MEMORY[0x270F91ED0]();
}

uint64_t AMFDRSealedDataHTTPSign()
{
  return MEMORY[0x270F91ED8]();
}

uint64_t AMFDRSealedDataPopulate()
{
  return MEMORY[0x270F91EE0]();
}

uint64_t AMFDRSealedDataPopulateWithExistingData()
{
  return MEMORY[0x270F91EE8]();
}

uint64_t AMFDRSealedDataRestoreOptions()
{
  return MEMORY[0x270F91EF0]();
}

uint64_t AMFDRSealedDataSetDataClassInstance()
{
  return MEMORY[0x270F91EF8]();
}

uint64_t AMFDRSealedDataSetMinimalManifestClassInstance()
{
  return MEMORY[0x270F91F00]();
}

uint64_t AMFDRSealedDataVerificationErrorIsBenign()
{
  return MEMORY[0x270F91F08]();
}

uint64_t AMFDRSealedDataVerify()
{
  return MEMORY[0x270F91F10]();
}

uint64_t AMFDRSealingManifestCopyDataClassesInstancesAndProperties()
{
  return MEMORY[0x270F91F18]();
}

uint64_t AMFDRSealingManifestCopyInstanceForClass()
{
  return MEMORY[0x270F91F20]();
}

uint64_t AMFDRSealingManifestCopyLocalDataForClass()
{
  return MEMORY[0x270F91F28]();
}

uint64_t AMFDRSealingManifestCopyMinimalManifestClassesAndInstances()
{
  return MEMORY[0x270F91F30]();
}

uint64_t AMFDRSealingManifestCopyMultiInstanceForClass()
{
  return MEMORY[0x270F91F38]();
}

uint64_t AMFDRSealingManifestCreateSealedData()
{
  return MEMORY[0x270F91F40]();
}

uint64_t AMFDRSealingMapCallMGCopyAnswer()
{
  return MEMORY[0x270F91F48]();
}

uint64_t AMFDRSealingMapConfigSealedData()
{
  return MEMORY[0x270F91F50]();
}

uint64_t AMFDRSealingMapCopyAssemblyIdentifierForClass()
{
  return MEMORY[0x270F91F58]();
}

uint64_t AMFDRSealingMapCopyDataClassesAndInstancesWithAttribute()
{
  return MEMORY[0x270F91F60]();
}

uint64_t AMFDRSealingMapCopyDataClassesWithAttribute()
{
  return MEMORY[0x270F91F68]();
}

uint64_t AMFDRSealingMapCopyInstanceForClass()
{
  return MEMORY[0x270F91F70]();
}

uint64_t AMFDRSealingMapCopyLocalData()
{
  return MEMORY[0x270F91F78]();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return MEMORY[0x270F91F80]();
}

uint64_t AMFDRSealingMapCopyLocalDict()
{
  return MEMORY[0x270F91F88]();
}

uint64_t AMFDRSealingMapCopyManifestProperties()
{
  return MEMORY[0x270F91FA0]();
}

uint64_t AMFDRSealingMapCopyManifestPropertiesForDevice()
{
  return MEMORY[0x270F91FA8]();
}

uint64_t AMFDRSealingMapCopyMinimalManifestClassesAndInstances()
{
  return MEMORY[0x270F91FB0]();
}

uint64_t AMFDRSealingMapCopyMultiInstanceForClass()
{
  return MEMORY[0x270F91FB8]();
}

uint64_t AMFDRSealingMapCopyPropertyWithTag()
{
  return MEMORY[0x270F91FC0]();
}

uint64_t AMFDRSealingMapCreateLocalMultiDataBlobForClass()
{
  return MEMORY[0x270F91FC8]();
}

uint64_t AMFDRSealingMapEntryHasAttribute()
{
  return MEMORY[0x270F91FD0]();
}

uint64_t AMFDRSealingMapGetEntriesForDevice()
{
  return MEMORY[0x270F91FD8]();
}

uint64_t AMFDRSealingMapGetFDRDataVersionForDevice()
{
  return MEMORY[0x270F91FE8]();
}

uint64_t AMFDRSealingMapPopulateSealingManifest()
{
  return MEMORY[0x270F91FF0]();
}

uint64_t AMFDRSetAssemblyIdentifierToVerify()
{
  return MEMORY[0x270F92000]();
}

uint64_t AMFDRSetOption()
{
  return MEMORY[0x270F92008]();
}

uint64_t AMSupportBase64Encode()
{
  return MEMORY[0x270F97998]();
}

uint64_t AMSupportLogSetHandler()
{
  return MEMORY[0x270F97AC8]();
}

uint64_t AMSupportSafeFree()
{
  return MEMORY[0x270F97B38]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x270F97B40]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A50]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x270ED7910]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x270ED7918]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B48](data, *(void *)&len, md);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B50](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B58](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B60](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x270EE49B8](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

uint64_t DEREncoderAddData()
{
  return MEMORY[0x270F97B70]();
}

uint64_t DEREncoderAddSequenceFromEncoder()
{
  return MEMORY[0x270F97B98]();
}

uint64_t DEREncoderCreate()
{
  return MEMORY[0x270F97BB8]();
}

uint64_t DEREncoderCreateEncodedBuffer()
{
  return MEMORY[0x270F97BC0]();
}

uint64_t DEREncoderDestroy()
{
  return MEMORY[0x270F97BC8]();
}

uint64_t DeviceIdentityCreateClientCertificateRequest()
{
  return MEMORY[0x270F25E50]();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x270F25E68]();
}

uint64_t DeviceIdentityValidateIdentity()
{
  return MEMORY[0x270F25E78]();
}

uint64_t IOAccessoryManagerChallengeCryptoDock()
{
  return MEMORY[0x270F92540]();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return MEMORY[0x270F92598]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

uint64_t IOPSSetBatteryDateOfFirstUse()
{
  return MEMORY[0x270EF49A0]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x270EF4A58](*(void *)&entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x270F96008]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F05608](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05618](target, flags);
}

uint64_t SavageCamInterfaceClose()
{
  return MEMORY[0x270F5CB30]();
}

uint64_t SavageCamInterfaceColdBootPowerCycle()
{
  return MEMORY[0x270F5CB38]();
}

uint64_t SavageCamInterfaceOpen()
{
  return MEMORY[0x270F5CB48]();
}

uint64_t SavageUpdaterCopyFirmwareWithLogging()
{
  return MEMORY[0x270FA2F28]();
}

uint64_t SavageUpdaterCreate()
{
  return MEMORY[0x270FA2F48]();
}

uint64_t SavageUpdaterCreateRequestWithLogging()
{
  return MEMORY[0x270FA2F30]();
}

uint64_t SavageUpdaterExecCommand()
{
  return MEMORY[0x270FA2F50]();
}

uint64_t SavageUpdaterGetTags()
{
  return MEMORY[0x270FA2F38]();
}

uint64_t SavageUpdaterGetTagsWithLogging()
{
  return MEMORY[0x270FA2F40]();
}

uint64_t SavageUpdaterIsDone()
{
  return MEMORY[0x270FA2F58]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

uint64_t SecCertificateCopyExtensionValue()
{
  return MEMORY[0x270EFD730]();
}

uint64_t SecCertificateCreateWithPEM()
{
  return MEMORY[0x270EFD7F0]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x270EFD858]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x270EFD860]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x270EFDCF8](trust);
}

uint64_t T200UpdaterCopyFirmwareWithLogging()
{
  return MEMORY[0x270FA2F60]();
}

uint64_t T200UpdaterCreateRequestWithLogging()
{
  return MEMORY[0x270FA2F68]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x270F4B420]();
}

uint64_t WiFiManagerClientCopyInterfaces()
{
  return MEMORY[0x270F4B4D8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B508]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x270F4B6C0]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x270F4B788]();
}

uint64_t ZhuGeCopyValue()
{
  return MEMORY[0x270F0D560]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x270ED87D0]();
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x270ED8888]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x270ED8890]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x270ED88A0]();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return MEMORY[0x270ED88A8]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x270ED88B0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x270ED88B8]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x270ED88C0]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x270ED88C8]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x270ED88E8]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x270ED8930]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x270ED8980]();
}

uint64_t ccec_compact_import_pub()
{
  return MEMORY[0x270ED8A68]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x270ED8A98]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x270ED8AA0]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x270ED8AB8]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x270ED8AD8]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x270ED8B00]();
}

uint64_t cced25519_verify()
{
  return MEMORY[0x270ED8B48]();
}

uint64_t cchkdf()
{
  return MEMORY[0x270ED8BA8]();
}

uint64_t ccrng()
{
  return MEMORY[0x270ED8C90]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x270ED8D88]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x270ED8E70]();
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

uint64_t copyChallengeResponse()
{
  return MEMORY[0x270F15BD8]();
}

uint64_t copyFdrBlob()
{
  return MEMORY[0x270F15BE0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

fstab *__cdecl getfsfile(const char *a1)
{
  return (fstab *)MEMORY[0x270ED9C00](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

uint64_t img4_nonce_domain_copy_nonce()
{
  return MEMORY[0x270F99AF0]();
}

uint64_t isVeridianUpdateRequired()
{
  return MEMORY[0x270FA2F70]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

int mount(const char *a1, const char *a2, int a3, void *a4)
{
  return MEMORY[0x270EDA5B8](a1, a2, *(void *)&a3, a4);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerateClasses(const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDB138](a1, a2, a3);
}

uint64_t reboot3()
{
  return MEMORY[0x270EDB180]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

void syslog(int a1, const char *a2, ...)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}