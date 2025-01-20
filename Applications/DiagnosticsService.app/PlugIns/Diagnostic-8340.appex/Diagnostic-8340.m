void sub_1000061CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  char a66;
  char a70;
  uint64_t v70;

  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose((const void *)(v70 - 176), 8);
  _Block_object_dispose(&STACK[0x228], 8);
  _Block_object_dispose(&STACK[0x248], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000062C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000062D0(uint64_t a1)
{
}

uint64_t sub_1000062D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  uint64_t v9 = +[NSData dataWithBytes:a2 length:a3];
  uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  v12 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (!v12 || ![v12 length])
  {
    v40 = handleForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10000F424();
    }
    goto LABEL_59;
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  v14 = handleForCategory();
  v15 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000F458();
    }
    goto LABEL_54;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v51 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Create UpdaterOptions successfully, value of ticket is: %@", buf, 0xCu);
  }

  CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), @"Savage,Ticket", *(const void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 128), @"SeaCookiePairingOption", kCFBooleanTrue);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 128), @"PersonalizedFirmwareRootPath", @"/private/var/tmp/usr/standalone/firmware/Savage/");
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 128), @"RestoreInternal", kCFBooleanTrue);
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), @"Options", *(const void **)(a1 + 128));
  v17 = handleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Creating savage updater ...", buf, 2u);
  }

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = SavageUpdaterCreate();
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) || v18)
  {
    uint64_t v41 = *(void *)(*(void *)(a1 + 72) + 8);
    v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v18;

    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = -4;
    v40 = handleForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10000F5D0();
    }
    goto LABEL_59;
  }
  if (SavageUpdaterIsDone()) {
    goto LABEL_28;
  }
  uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  if (v19)
  {
    uint64_t v47 = *(void *)(*(void *)(a1 + 72) + 8);
    v48 = *(void **)(v47 + 40);
    *(void *)(v47 + 40) = v19;

    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = -5;
    v40 = handleForCategory();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    goto LABEL_49;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = SavageUpdaterExecCommand() != 0;
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) || v20)
  {
    uint64_t v43 = *(void *)(*(void *)(a1 + 72) + 8);
    v44 = *(void **)(v43 + 40);
    *(void *)(v43 + 40) = v20;

    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = -5;
    v40 = handleForCategory();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
LABEL_59:

      goto LABEL_28;
    }
LABEL_49:
    sub_10000F568();
    goto LABEL_59;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = -5;
    v40 = handleForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10000F48C();
    }
    goto LABEL_59;
  }
  v21 = handleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    *(_DWORD *)buf = 138412290;
    uint64_t v51 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Device info dict is %@", buf, 0xCu);
  }

  uint64_t v23 = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), @"Digest");
  uint64_t v24 = *(void *)(*(void *)(a1 + 112) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  v26 = handleForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v51 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Extracted patch digest: %@", buf, 0xCu);
  }

  uint64_t v28 = [*(id *)(a1 + 32) getPatchDataWithDigest:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
  uint64_t v29 = *(void *)(*(void *)(a1 + 120) + 8);
  v30 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v28;

  v31 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
  if (!v31 || ![v31 length])
  {
    v40 = handleForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10000F4C0();
    }
    goto LABEL_59;
  }
  v32 = handleForCategory();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Found patch files successfully", buf, 2u);
  }

  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), @"FirmwareData", *(const void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = SavageUpdaterExecCommand() != 0;
  uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) || v33)
  {
    uint64_t v45 = *(void *)(*(void *)(a1 + 72) + 8);
    v46 = *(void **)(v45 + 40);
    *(void *)(v45 + 40) = v33;

    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = -5;
    v15 = handleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000F4F4();
    }
LABEL_54:

    goto LABEL_28;
  }
  v34 = handleForCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Update savage firmware successfully", buf, 2u);
  }

  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
LABEL_28:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    v35 = handleForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10000F3BC();
    }
LABEL_31:

    return 0xFFFFFFFFLL;
  }
  id v37 = [*(id *)(a1 + 32) detectCamera];
  if (v37 == (id)1)
  {
    v35 = handleForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10000F388();
    }
    goto LABEL_31;
  }
  if (!v37)
  {
    v35 = handleForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10000F354();
    }
    goto LABEL_31;
  }
  uint64_t v38 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v38 + 40);
  unsigned __int8 v39 = +[CRUtils powerCycleSensor:&obj];
  objc_storeStrong((id *)(v38 + 40), obj);
  if ((v39 & 1) == 0)
  {
    v35 = handleForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10000F2EC();
    }
    goto LABEL_31;
  }
  return 0;
}

void sub_100006C10(uint64_t a1, uint64_t a2)
{
  v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = a1;
    __int16 v7 = 2080;
    uint64_t v8 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s", (uint8_t *)&v5, 0x16u);
  }
}

uint64_t sub_100006CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = +[NSData dataWithBytes:a2 length:a3];
  int v5 = objc_opt_new();
  uint64_t v6 = [v5 sign:v4 keyBlob:*(void *)(a1 + 32)];

  if (v6)
  {
    uint64_t v7 = [v6 base64EncodedStringWithOptions:0];
  }
  else
  {
    uint64_t v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000F644();
    }

    uint64_t v7 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -16;
  }

  return v7;
}

void sub_100008274(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100008290(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000082B8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1000082CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100008318(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100008338(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t verifyFDRData(const char *a1, size_t a2)
{
  if (qword_100018CB8 != -1) {
    dispatch_once(&qword_100018CB8, &stru_1000145F8);
  }
  if (__osLogPearlLibTrace) {
    uint64_t v4 = __osLogPearlLibTrace;
  }
  else {
    uint64_t v4 = &_os_log_default;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v18 = a1;
    __int16 v19 = 2048;
    size_t v20 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "verifyFDRData %p %zu\n", buf, 0x16u);
  }
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 179);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    if (__osLogPearlLib) {
      v12 = __osLogPearlLib;
    }
    else {
      v12 = &_os_log_default;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "data";
    __int16 v19 = 2048;
    size_t v20 = 0;
    __int16 v21 = 2080;
    uint64_t v22 = &unk_10001123B;
    __int16 v23 = 2080;
    uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 179;
    goto LABEL_45;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 180);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    if (__osLogPearlLib) {
      v12 = __osLogPearlLib;
    }
    else {
      v12 = &_os_log_default;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v18 = "dataLength > 0";
    __int16 v19 = 2048;
    size_t v20 = 0;
    __int16 v21 = 2080;
    uint64_t v22 = &unk_10001123B;
    __int16 v23 = 2080;
    uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    __int16 v25 = 1024;
    int v26 = 180;
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_46:
    uint64_t v5 = 258;
    goto LABEL_12;
  }
  uint64_t v5 = sub_10000892C();
  if (v5)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 183);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    if (__osLogPearlLib) {
      uint64_t v13 = __osLogPearlLib;
    }
    else {
      uint64_t v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "err == 0 ";
      __int16 v19 = 2048;
      size_t v20 = (int)v5;
      __int16 v21 = 2080;
      uint64_t v22 = &unk_10001123B;
      __int16 v23 = 2080;
      uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v25 = 1024;
      int v26 = 183;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v6 = sub_100008BEC(dword_100018CB0, 10, 0, a1, a2, 0, 0);
    if (v6)
    {
      uint64_t v14 = v6;
      size_t v15 = (int)v6;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 186);
      if (qword_100018CB8 != -1) {
        dispatch_once(&qword_100018CB8, &stru_1000145F8);
      }
      if (__osLogPearlLib) {
        uint64_t v16 = __osLogPearlLib;
      }
      else {
        uint64_t v16 = &_os_log_default;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = "err == 0 ";
        __int16 v19 = 2048;
        size_t v20 = v15;
        __int16 v21 = 2080;
        uint64_t v22 = &unk_10001123B;
        __int16 v23 = 2080;
        uint64_t v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v25 = 1024;
        int v26 = 186;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v5 = v14;
    }
  }
LABEL_12:
  if (dword_100018CB0)
  {
    IOServiceClose(dword_100018CB0);
    dword_100018CB0 = 0;
  }
  if (v5)
  {
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v7 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v7 = &_os_log_default;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v5;
      uint64_t v8 = v7;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "verifyFDRData -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    if (__osLogPearlLibTrace) {
      uint64_t v10 = __osLogPearlLibTrace;
    }
    else {
      uint64_t v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      uint64_t v8 = v10;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_29;
    }
  }
  return v5;
}

uint64_t sub_10000892C()
{
  CFDictionaryRef v0 = IOServiceMatching("ApplePearlSEPDriver");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (MatchingService)
  {
    io_object_t v2 = MatchingService;
    uint64_t v3 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_100018CB0);
    if (v3)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 129);
      if (qword_100018CB8 != -1) {
        dispatch_once(&qword_100018CB8, &stru_1000145F8);
      }
      if (__osLogPearlLib) {
        uint64_t v6 = __osLogPearlLib;
      }
      else {
        uint64_t v6 = &_os_log_default;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v8 = "err == 0 ";
        __int16 v9 = 2048;
        uint64_t v10 = (int)v3;
        __int16 v11 = 2080;
        v12 = &unk_10001123B;
        __int16 v13 = 2080;
        uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        __int16 v15 = 1024;
        int v16 = 129;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    IOObjectRelease(v2);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "service", 0, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 126);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    uint64_t v3 = 3758097084;
    if (__osLogPearlLib) {
      uint64_t v5 = __osLogPearlLib;
    }
    else {
      uint64_t v5 = &_os_log_default;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v8 = "service";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      v12 = &unk_10001123B;
      __int16 v13 = 2080;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v15 = 1024;
      int v16 = 126;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v3;
}

uint64_t sub_100008BEC(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, void *a7)
{
  size_t v14 = a5 + 8;
  __int16 v15 = calloc(a5 + 8, 1uLL);
  if (v15)
  {
    int v16 = v15;
    _WORD *v15 = 21072;
    v15[1] = a2;
    v15[2] = 1;
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
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "cmd", 0, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 99);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    if (__osLogPearlLib) {
      __int16 v19 = __osLogPearlLib;
    }
    else {
      __int16 v19 = &_os_log_default;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136316162;
      *(void *)&outputStructCnt[4] = "cmd";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      uint64_t v24 = &unk_10001123B;
      __int16 v25 = 2080;
      int v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      __int16 v27 = 1024;
      int v28 = 99;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", outputStructCnt, 0x30u);
    }
    return 260;
  }
  return v17;
}

uint64_t pearlSeaCookieHandleMessage(int a1, const void *a2, size_t a3, void *a4, void *a5, id a6)
{
  id v41 = a6;
  if (qword_100018CB8 != -1) {
    dispatch_once(&qword_100018CB8, &stru_1000145F8);
  }
  __int16 v11 = &OBJC_INSTANCE_METHODS_NSObject;
  if (__osLogPearlLibTrace) {
    v12 = __osLogPearlLibTrace;
  }
  else {
    v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)uint64_t v43 = a1;
    *(_WORD *)&v43[4] = 2048;
    *(void *)&v43[6] = a2;
    *(_WORD *)&v43[14] = 2048;
    *(void *)&v43[16] = a3;
    *(_WORD *)&v43[24] = 2048;
    *(void *)&v43[26] = a4;
    *(_WORD *)&v43[34] = 2048;
    *(void *)&v43[36] = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage %d %p %zu %p %p\n", buf, 0x30u);
  }
  if (a1 && a1 != 7)
  {
    if (!a2)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message", 0, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 776);
      if (qword_100018CB8 != -1) {
        dispatch_once(&qword_100018CB8, &stru_1000145F8);
      }
      uint64_t v18 = &OBJC_INSTANCE_METHODS_NSObject;
      size_t v20 = v41;
      if (__osLogPearlLib) {
        uint64_t v29 = __osLogPearlLib;
      }
      else {
        uint64_t v29 = &_os_log_default;
      }
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_110;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v43 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message";
      *(_WORD *)&v43[8] = 2048;
      *(void *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = &unk_10001123B;
      *(_WORD *)&v43[28] = 2080;
      *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 776;
      goto LABEL_109;
    }
    if (!a3)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize", 0, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 777);
      if (qword_100018CB8 != -1) {
        dispatch_once(&qword_100018CB8, &stru_1000145F8);
      }
      if (__osLogPearlLib) {
        v40 = __osLogPearlLib;
      }
      else {
        v40 = &_os_log_default;
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)uint64_t v43 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize";
        *(_WORD *)&v43[8] = 2048;
        *(void *)&v43[10] = 0;
        *(_WORD *)&v43[18] = 2080;
        *(void *)&v43[20] = &unk_10001123B;
        *(_WORD *)&v43[28] = 2080;
        *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v43[38] = 1024;
        *(_DWORD *)&v43[40] = 777;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      uint64_t v17 = 0;
      uint64_t v26 = 258;
      goto LABEL_71;
    }
  }
  if (a1 != 8 && !a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply", 0, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 778);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    uint64_t v18 = &OBJC_INSTANCE_METHODS_NSObject;
    size_t v20 = v41;
    if (__osLogPearlLib) {
      uint64_t v29 = __osLogPearlLib;
    }
    else {
      uint64_t v29 = &_os_log_default;
    }
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)uint64_t v43 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply";
    *(_WORD *)&v43[8] = 2048;
    *(void *)&v43[10] = 0;
    *(_WORD *)&v43[18] = 2080;
    *(void *)&v43[20] = &unk_10001123B;
    *(_WORD *)&v43[28] = 2080;
    *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 778;
    goto LABEL_109;
  }
  if (a1 != 8 && !a5)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize", 0, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 779);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    uint64_t v18 = &OBJC_INSTANCE_METHODS_NSObject;
    size_t v20 = v41;
    if (__osLogPearlLib) {
      uint64_t v29 = __osLogPearlLib;
    }
    else {
      uint64_t v29 = &_os_log_default;
    }
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_110;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)uint64_t v43 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize";
    *(_WORD *)&v43[8] = 2048;
    *(void *)&v43[10] = 0;
    *(_WORD *)&v43[18] = 2080;
    *(void *)&v43[20] = &unk_10001123B;
    *(_WORD *)&v43[28] = 2080;
    *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 779;
LABEL_109:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_110:
    uint64_t v17 = 0;
    uint64_t v26 = 258;
    goto LABEL_129;
  }
  if (a5) {
    uint64_t v13 = *a5;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = sub_10000892C();
  if (v14)
  {
    uint64_t v26 = v14;
    uint64_t v30 = (int)v14;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v14, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 786);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    if (__osLogPearlLib) {
      v31 = __osLogPearlLib;
    }
    else {
      v31 = &_os_log_default;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v43 = "err == 0 ";
      *(_WORD *)&v43[8] = 2048;
      *(void *)&v43[10] = v30;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = &unk_10001123B;
      *(_WORD *)&v43[28] = 2080;
      *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 786;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v17 = 0;
LABEL_71:
    uint64_t v18 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_119:
    size_t v20 = v41;
    goto LABEL_129;
  }
  size_t v15 = a3 + 13;
  if (a3 >= 0xFFFFFFFFFFFFFFF3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", a3 >= 0xFFFFFFFFFFFFFFF3, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 789);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    uint64_t v18 = &OBJC_INSTANCE_METHODS_NSObject;
    __int16 v11 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      v32 = __osLogPearlLib;
    }
    else {
      v32 = &_os_log_default;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v43 = "err == 0 ";
      *(_WORD *)&v43[8] = 2048;
      *(void *)&v43[10] = a3 >= 0xFFFFFFFFFFFFFFF3;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = &unk_10001123B;
      *(_WORD *)&v43[28] = 2080;
      *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 789;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v17 = 0;
    uint64_t v26 = 1;
    goto LABEL_119;
  }
  int v16 = (char *)malloc(a3 + 13);
  if (!v16)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "inData", 0, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 792);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    uint64_t v18 = &OBJC_INSTANCE_METHODS_NSObject;
    __int16 v11 = &OBJC_INSTANCE_METHODS_NSObject;
    uint64_t v26 = 3758097085;
    if (__osLogPearlLib) {
      uint64_t v33 = __osLogPearlLib;
    }
    else {
      uint64_t v33 = &_os_log_default;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v43 = "inData";
      *(_WORD *)&v43[8] = 2048;
      *(void *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = &unk_10001123B;
      *(_WORD *)&v43[28] = 2080;
      *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 792;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v17 = 0;
    goto LABEL_119;
  }
  uint64_t v17 = v16;
  *(_DWORD *)int v16 = a1;
  v16[4] = 1;
  *(void *)(v16 + 5) = a3;
  memcpy(v16 + 13, a2, a3);
  uint64_t v18 = &OBJC_INSTANCE_METHODS_NSObject;
  uint64_t v19 = sub_100008BEC(dword_100018CB0, 70, 0, v17, a3 + 13, a4, a5);
  if (v19)
  {
    uint64_t v26 = v19;
    uint64_t v34 = (int)v19;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v19, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 800);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    if (__osLogPearlLib) {
      v35 = __osLogPearlLib;
    }
    else {
      v35 = &_os_log_default;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)uint64_t v43 = "err == 0 ";
    *(_WORD *)&v43[8] = 2048;
    *(void *)&v43[10] = v34;
    *(_WORD *)&v43[18] = 2080;
    *(void *)&v43[20] = &unk_10001123B;
    *(_WORD *)&v43[28] = 2080;
    *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 800;
    goto LABEL_127;
  }
  size_t v20 = v41;
  if (a1 == 2) {
    goto LABEL_27;
  }
  if (a1 != 5) {
    goto LABEL_28;
  }
  if (!v41)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "callback", 0, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 804);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    __int16 v11 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib) {
      id v37 = __osLogPearlLib;
    }
    else {
      id v37 = &_os_log_default;
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)uint64_t v43 = "callback";
      *(_WORD *)&v43[8] = 2048;
      *(void *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(void *)&v43[20] = &unk_10001123B;
      *(_WORD *)&v43[28] = 2080;
      *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 804;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v26 = 258;
    goto LABEL_119;
  }
  uint64_t v21 = (*((uint64_t (**)(id, void, void *, void))v41 + 2))(v41, 0, a4, *a5);
  if (!v21)
  {
LABEL_27:
    v17[4] = 0;
    *a5 = v13;
    uint64_t v22 = sub_100008BEC(dword_100018CB0, 70, 0, v17, v15, a4, a5);
    if (!v22)
    {
LABEL_28:
      if (a4 && a5)
      {
        if (qword_100018CB8 != -1) {
          dispatch_once(&qword_100018CB8, &stru_1000145F8);
        }
        if (__osLogPearlLib) {
          __int16 v23 = __osLogPearlLib;
        }
        else {
          __int16 v23 = &_os_log_default;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = *a5;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)uint64_t v43 = a1;
          *(_WORD *)&v43[4] = 2048;
          *(void *)&v43[6] = v24;
          *(_WORD *)&v43[14] = 1040;
          *(_DWORD *)&v43[16] = v24;
          *(_WORD *)&v43[20] = 2096;
          *(void *)&v43[22] = a4;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d reply[%zu] %.*P\n", buf, 0x22u);
        }
      }
      if (qword_100018CB8 != -1) {
        dispatch_once(&qword_100018CB8, &stru_1000145F8);
      }
      if (__osLogPearlLibTrace) {
        __int16 v25 = __osLogPearlLibTrace;
      }
      else {
        __int16 v25 = &_os_log_default;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v43 = a1;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
      }
      uint64_t v26 = 0;
LABEL_45:
      free(v17);
      goto LABEL_46;
    }
    uint64_t v26 = v22;
    uint64_t v36 = (int)v22;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v22, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 814);
    if (qword_100018CB8 != -1) {
      dispatch_once(&qword_100018CB8, &stru_1000145F8);
    }
    if (__osLogPearlLib) {
      v35 = __osLogPearlLib;
    }
    else {
      v35 = &_os_log_default;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_128;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)uint64_t v43 = "err == 0 ";
    *(_WORD *)&v43[8] = 2048;
    *(void *)&v43[10] = v36;
    *(_WORD *)&v43[18] = 2080;
    *(void *)&v43[20] = &unk_10001123B;
    *(_WORD *)&v43[28] = 2080;
    *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 814;
    goto LABEL_127;
  }
  uint64_t v26 = v21;
  uint64_t v38 = (int)v21;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v21, (const char *)&unk_10001123B, "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 807);
  if (qword_100018CB8 != -1) {
    dispatch_once(&qword_100018CB8, &stru_1000145F8);
  }
  if (__osLogPearlLib) {
    v35 = __osLogPearlLib;
  }
  else {
    v35 = &_os_log_default;
  }
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_128;
  }
  *(_DWORD *)buf = 136316162;
  *(void *)uint64_t v43 = "err == 0 ";
  *(_WORD *)&v43[8] = 2048;
  *(void *)&v43[10] = v38;
  *(_WORD *)&v43[18] = 2080;
  *(void *)&v43[20] = &unk_10001123B;
  *(_WORD *)&v43[28] = 2080;
  *(void *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
  *(_WORD *)&v43[38] = 1024;
  *(_DWORD *)&v43[40] = 807;
LABEL_127:
  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_128:
  uint64_t v18 = &OBJC_INSTANCE_METHODS_NSObject;
  size_t v20 = v41;
  __int16 v11 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_129:
  if (qword_100018CB8 != -1) {
    dispatch_once(&qword_100018CB8, &stru_1000145F8);
  }
  if (v11[401]) {
    unsigned __int8 v39 = v11[401];
  }
  else {
    unsigned __int8 v39 = &_os_log_default;
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v43 = a1;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v26;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
  }
  if (v17) {
    goto LABEL_45;
  }
LABEL_46:
  io_connect_t entrysize = v18[406].entrysize;
  if (entrysize)
  {
    IOServiceClose(entrysize);
    v18[406].io_connect_t entrysize = 0;
  }

  return v26;
}

void sub_100009CE4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.BiometricKit", "Library-PearlFactory");
  io_object_t v2 = (void *)__osLogPearlLib;
  __osLogPearlLib = (uint64_t)v1;

  uint64_t v3 = (void *)__osLogPearlLib;
  if (!__osLogPearlLib)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100009D68();
    }
    uint64_t v3 = (void *)__osLogPearlLib;
  }

  objc_storeStrong((id *)&__osLogPearlLibTrace, v3);
}

void sub_100009D68()
{
  *(_WORD *)CFDictionaryRef v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-PearlFactory'!\n", v0, 2u);
}

uint64_t sub_100009DB0()
{
  int v0 = __chkstk_darwin();
  io_object_t v2 = v1;
  uint64_t v4 = v3;
  size_t v6 = v5;
  uint64_t v8 = v7;
  int v9 = v0;
  mach_port_t v10 = sub_10000A108();
  if (v10)
  {
    if (v8)
    {
      mach_port_t v11 = v10;
      uint64_t v12 = 3758097090;
      if (sub_10000A364((uint64_t)v8) == v6)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000;
        uint64_t input = v9;
        uint64_t v12 = IOConnectCallMethod(v11, 0x2Bu, &input, 1u, v8, v6, 0, 0, __src, &__count);
        if (!v12 && v4 && v2)
        {
          uint64_t v13 = calloc(__count, 1uLL);
          void *v4 = v13;
          if (v13)
          {
            memcpy(v13, __src, __count);
            uint64_t v12 = 0;
            *io_object_t v2 = __count;
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
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", (const char *)&unk_10001123B, (const char *)&unk_10001123B, (const char *)&unk_10001123B, "_aks_operation", ":", 457, (const char *)&unk_10001123B, 0, (const char *)&unk_10001123B, (const char *)&unk_10001123B);
    uint64_t v12 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v12;
}

uint64_t sub_100009F90(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v11 = 3758097090;
  uint64_t v12 = off_100018BD0;
  uint64_t v13 = (void **)calloc(8uLL, 1uLL);
  *uint64_t v13 = 0;
  sub_10000AB9C(v13, (uint64_t)off_100018BC8, (uint64_t)v12);
  __s = 0;
  rsize_t __n = 0;
  if ((!a3 || !sub_10000A744((uint64_t)v13))
    && !sub_10000ABAC(v13, (uint64_t)off_100018BD8, a1)
    && !sub_10000ABAC(v13, (uint64_t)off_100018BE0, a2)
    && !sub_10000A85C(v13, &__s, &__n))
  {
    uint64_t v11 = sub_100009DB0();
    if (!v11)
    {
      *a5 = 0;
      *a6 = 0;
    }
  }
  sub_10000A4A4(v13);
  memset_s(v13, 8uLL, 0, 8uLL);
  free(v13);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v11;
}

uint64_t sub_10000A108()
{
  if (qword_100018CC8 != -1) {
    dispatch_once(&qword_100018CC8, &stru_100014678);
  }
  dispatch_sync((dispatch_queue_t)qword_100018CD0, &stru_100014638);
  uint64_t result = dword_100018CC0;
  if (!dword_100018CC0)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_100018CC0;
  }
  return result;
}

void sub_10000A194(id a1)
{
  if (!dword_100018CC0) {
    dword_100018CC0 = sub_10000A200("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

void sub_10000A1D4(id a1)
{
  qword_100018CD0 = (uint64_t)dispatch_queue_create("aks-client-queue", 0);
}

uint64_t sub_10000A200(char *path, const char *a2)
{
  kern_return_t v5;
  CFDictionaryRef v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t result;
  kern_return_t v10;
  io_connect_t connect;

  connect = 0;
  io_service_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3 || (v4 = v3, size_t v5 = IOServiceOpen(v3, mach_task_self_, 0, &connect), IOObjectRelease(v4), v5))
  {
    size_t v6 = IOServiceMatching(a2);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      uint64_t v8 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      IOObjectRelease(v8);
    }
  }
  uint64_t result = connect;
  if (connect)
  {
    mach_port_t v10 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    uint64_t result = connect;
    if (v10)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

BOOL sub_10000A2F8(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5 = sub_10000A364((uint64_t)a1);
  return v5 == sub_10000A364((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t sub_10000A364(uint64_t a1)
{
  if (ccder_blob_decode_tag() && ccder_blob_decode_len()) {
    return a1 - a1;
  }
  else {
    return 0;
  }
}

uint64_t sub_10000A3CC()
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

uint64_t sub_10000A4A4(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    io_object_t v2 = *a1;
    if (!*a1) {
      break;
    }
    io_service_t v3 = (void *)*((void *)v2 + 1);
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

uint64_t sub_10000A524(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  io_object_t v2 = (void **)a1;
  uint64_t result = (uint64_t)sub_10000A5C0(a1, a2);
  if (result)
  {
    uint64_t v4 = result;
    for (i = *v2; i != (void *)result; i = (void *)*i)
      io_object_t v2 = (void **)i;
    *io_object_t v2 = *(void **)result;
    size_t v6 = *(void **)(result + 8);
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

void *sub_10000A5C0(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0;
  }
  io_object_t v2 = (void *)*a1;
  if (*a1)
  {
    do
    {
      size_t v5 = (const void *)v2[1];
      if (ccder_blob_decode_sequence_tl() && sub_10000A2F8(a2, (uint64_t)&a2[a2[1] + 2], v5)) {
        break;
      }
      io_object_t v2 = (void *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t sub_10000A644(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", &unk_10001123B, &unk_10001123B, &unk_10001123B, "der_key_validate");
    return 0;
  }
  return a1;
}

uint64_t sub_10000A744(uint64_t a1)
{
  if (a1) {
    return sub_10000A3CC() - 1;
  }
  else {
    return 4294967285;
  }
}

uint64_t sub_10000A78C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (unsigned __int8 *)sub_10000A644(a1);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    if (!sub_10000A524(a5, v8) && !sub_10000AA2C(a5, v9, a3, a3 + a4)) {
      return 1;
    }
  }
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", (const char *)&unk_10001123B, (const char *)&unk_10001123B, (const char *)&unk_10001123B, "_merge_dict_cb", ":", 647, (const char *)&unk_10001123B, 0, (const char *)&unk_10001123B, (const char *)&unk_10001123B);
  return 0;
}

uint64_t sub_10000A85C(void *a1, void *a2, size_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v7 = (void *)*a1;
        if (*a1)
        {
          unint64_t v8 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          do
          {
            v10 += v7[2];
            uint64_t v7 = (void *)*v7;
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
              size_t v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                uint64_t v14 = (void *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_10000ADC4);
            size_t v16 = ccder_sizeof();
            uint64_t v17 = (char *)calloc(v16, 1uLL);
            uint64_t v18 = v17;
            if (v17)
            {
              __int16 v25 = v17;
              uint64_t v26 = &v17[v16];
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

uint64_t sub_10000AA2C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (sub_10000A364(a3) <= (unint64_t)(a4 - a3))
    {
      size_t v6 = ccder_sizeof();
      uint64_t v7 = (char *)calloc(v6, 1uLL);
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
        uint64_t v12 = v17;
        if (!v11) {
          uint64_t v12 = 0;
        }
        if (v12 && v12 == v8)
        {
          uint64_t v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            size_t v15 = v14;
            uint64_t result = 0;
            v15[1] = v8;
            v15[2] = v6;
            void *v15 = *a1;
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

uint64_t sub_10000AB9C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10000AA2C(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t sub_10000ABAC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
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
  uint64_t v25 = 0;
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
        *((unsigned char *)&v25 + v15 - 1) = v3;
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
        *uint64_t v22 = *a1;
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

uint64_t sub_10000ADC4(const void **a1, void **a2)
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

BOOL sub_10000AEF0()
{
  *(_DWORD *)buffer = 0;
  io_registry_entry_t v0 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/chosen");
  if (!v0) {
    return 1;
  }
  io_object_t v1 = v0;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, @"development-cert", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFDataRef v3 = CFProperty;
    CFTypeID v4 = CFGetTypeID(CFProperty);
    if (v4 == CFDataGetTypeID())
    {
      CFIndex Length = CFDataGetLength(v3);
      if ((unint64_t)(Length - 1) <= 3)
      {
        v8.length = Length;
        v8.location = 0;
        CFDataGetBytes(v3, v8, buffer);
      }
    }
    CFRelease(v3);
  }
  IOObjectRelease(v1);
  return *(_DWORD *)buffer == 0;
}

uint64_t sub_10000AFC4(const void *a1, CFMutableDictionaryRef *a2, CFErrorRef *a3, int a4)
{
  uint64_t v32 = 88;
  if (!a1 || !a2)
  {
    AMSupportLogInternal();
    return 0;
  }
  uint64_t v37 = 0;
  long long v36 = 0u;
  long long v34 = 0u;
  memset(v35, 0, sizeof(v35));
  long long v33 = 0u;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  int v9 = sub_10000B904(2, 0, 0, 0, &v33, &v32, 0, 0);
  AMSupportLogInternal();
  AMSupportLogInternal();
  AMSupportLogDumpMemory();
  if (v9)
  {
    if (a3) {
      *a3 = sub_10000B818(11, @"Unable to get Pearl Information");
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0;
  }
  CFDictionarySetValue(Mutable, @"Command", a1);
  int v11 = sub_10000B810((unsigned __int8 *)&v33 + 4, 4u);
  size_t v12 = v11;
  if (v11) {
    CFNullRef v13 = (CFNullRef)v11;
  }
  else {
    CFNullRef v13 = kCFNull;
  }
  CFDictionarySetValue(Mutable, @"ApChipID", v13);
  AMSupportLogInternal();
  if (v12) {
    CFRelease(v12);
  }
  uint64_t v14 = sub_10000B810((unsigned __int8 *)&v33 + 8, 8u);
  uint64_t v15 = v14;
  if (v14) {
    CFNullRef v16 = (CFNullRef)v14;
  }
  else {
    CFNullRef v16 = kCFNull;
  }
  CFDictionarySetValue(Mutable, @"ApECID", v16);
  AMSupportLogInternal();
  if (v15) {
    CFRelease(v15);
  }
  uint64_t v17 = sub_10000B810((unsigned __int8 *)&v34, 0x10u);
  int v18 = v17;
  if (v17) {
    CFNullRef v19 = (CFNullRef)v17;
  }
  else {
    CFNullRef v19 = kCFNull;
  }
  CFDictionarySetValue(Mutable, @"SensorUID", v19);
  AMSupportLogInternal();
  if (v18) {
    CFRelease(v18);
  }
  BOOL v20 = sub_10000B810((unsigned __int8 *)v35, 0x20u);
  uint64_t v21 = v20;
  if (v20) {
    CFNullRef v22 = (CFNullRef)v20;
  }
  else {
    CFNullRef v22 = kCFNull;
  }
  CFDictionarySetValue(Mutable, @"SepNonce", v22);
  AMSupportLogInternal();
  if (v21) {
    CFRelease(v21);
  }
  char v23 = sub_10000B810((unsigned __int8 *)&v36, 4u);
  uint64_t v24 = v23;
  if (v23) {
    CFNullRef v25 = (CFNullRef)v23;
  }
  else {
    CFNullRef v25 = kCFNull;
  }
  CFDictionarySetValue(Mutable, @"SensorChipID", v25);
  AMSupportLogInternal();
  if (v24) {
    CFRelease(v24);
  }
  uint64_t v26 = sub_10000B810((unsigned __int8 *)&v36 + 4, 0x14u);
  __int16 v27 = v26;
  if (v26) {
    CFNullRef v28 = (CFNullRef)v26;
  }
  else {
    CFNullRef v28 = kCFNull;
  }
  CFDictionarySetValue(Mutable, @"SensorSNUM", v28);
  AMSupportLogInternal();
  if (v27) {
    CFRelease(v27);
  }
  if (AMFDRSealingMapGetFDRDataVersionForDevice() == 2)
  {
    CFNullRef v29 = (CFNullRef)sub_10000B5A4(kCFAllocatorDefault);
    CFNullRef v30 = v29;
    CFNullRef v31 = v29 ? v29 : kCFNull;
    CFDictionarySetValue(Mutable, @"SIK", v31);
    AMSupportLogInternal();
    if (v30) {
      CFRelease(v30);
    }
  }
  if (a4) {
    CFDictionarySetValue(Mutable, @"isSSR", kCFBooleanTrue);
  }
  if (!sub_10000AEF0()) {
    CFDictionarySetValue(Mutable, @"useProdMasterKey", kCFBooleanFalse);
  }
  *a2 = Mutable;
  return 1;
}

uint64_t sub_10000B418(int a1, const void *a2, size_t a3, void *a4, void *a5, uint64_t a6)
{
  AMSupportLogInternal();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000;
  v13[2] = sub_10000B4E0;
  v13[3] = &unk_1000146A0;
  v13[4] = a6;
  return pearlSeaCookieHandleMessage(a1, a2, a3, a4, a5, v13);
}

uint64_t sub_10000B4E0(uint64_t a1, int a2)
{
  if (a2)
  {
    AMSupportLogInternal();
    return 1;
  }
  else
  {
    AMSupportLogInternal();
    CFTypeID v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
}

uint64_t sub_10000B57C(const __CFURL *a1, const void *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5)
{
  return sub_10000C4A0(2, a1, a2, (CFComparisonResult)&unk_100018BE8, 3, a3, a5);
}

uint64_t sub_10000B5A4(const __CFAllocator *a1)
{
  CFIndex length = 0;
  bytes = 0;
  if (!sub_100009F90(1u, 1u, 0, 0, &bytes, &length) && bytes && length)
  {
    if ((unint64_t)length < 0x42)
    {
      CFDataRef v5 = CFDataCreate(a1, bytes, length);
      uint64_t v6 = AMSupportCopyHexStringFromData();
      if (!v5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    int v2 = (UInt8 *)malloc_type_calloc(1uLL, 0x30uLL, 0xC6F6CF06uLL);
    if (v2)
    {
      CFDataRef v3 = v2;
      ccsha384_di();
      ccdigest();
      CFDataRef v4 = CFDataCreateWithBytesNoCopy(a1, v3, 48, kCFAllocatorMalloc);
      if (v4)
      {
        CFDataRef v5 = v4;
        uint64_t v6 = AMSupportCopyHexStringFromData();
LABEL_9:
        CFRelease(v5);
        goto LABEL_10;
      }
      free(v3);
    }
  }
  AMSupportLogInternal();
  uint64_t v6 = 0;
LABEL_10:
  if (bytes) {
    free(bytes);
  }
  return v6;
}

__CFString *sub_10000B728(unsigned __int8 *a1, unsigned int a2, unsigned int a3)
{
  MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, @"0x");
  uint64_t result = 0;
  if (a2 && a3)
  {
    int v8 = a3 - a2;
    if (a3 > a2 && v8 >= 1)
    {
      do
      {
        CFStringAppend(MutableCopy, @"00");
        --v8;
      }
      while (v8);
    }
    uint64_t v9 = a2;
    do
    {
      unsigned int v10 = *a1++;
      CFStringRef v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%.2X", v10);
      CFStringAppend(MutableCopy, v11);
      if (v11) {
        CFRelease(v11);
      }
      --v9;
    }
    while (v9);
    return MutableCopy;
  }
  return result;
}

__CFString *sub_10000B810(unsigned __int8 *a1, unsigned int a2)
{
  return sub_10000B728(a1, a2, a2);
}

CFErrorRef sub_10000B818(int a1, const void *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  AMSupportLogInternal();
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, kCFErrorLocalizedDescriptionKey, a2);
    return CFErrorCreate(kCFAllocatorDefault, @"HorizonSeaCookieErrorDomain", a1, Mutable);
  }
  else
  {
    AMSupportLogInternal();
    return 0;
  }
}

uint64_t sub_10000B904(int a1, int a2, const void *a3, size_t a4, void *a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  if (a1 == 2)
  {
    return sub_10000B418(a2, a3, a4, a5, a6, a8);
  }
  else
  {
    if (a1 != 1)
    {
LABEL_8:
      AMSupportLogInternal();
      return 1;
    }
    if (a7)
    {
      AMSupportLogInternal();
      goto LABEL_8;
    }
    AMSupportLogInternal();
    return sub_10000E234(a2, a3, a4, a5, a6);
  }
}

CFComparisonResult sub_10000BA30(CFComparisonResult result, int a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    CFDataRef v3 = (CFStringRef *)(result + 24);
    do
    {
      if (CFEqual(*v3, @"C4")) {
        *(v3 - 2) = @"ReprovisionSensor";
      }
      if (CFEqual(*v3, @"C6")) {
        *(v3 - 2) = @"RePairingSessionKeyExchange";
      }
      uint64_t result = CFStringCompare(*v3, @"C7", 0);
      if (result == kCFCompareEqualTo) {
        *(v3 - 2) = @"ReprovisionSensor";
      }
      v3 += 5;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_10000BAF0(int a1, const void *a2, CFMutableDictionaryRef *a3, CFErrorRef *a4, int a5, int a6, _DWORD *a7, uint64_t a8)
{
  if (a1 == 2)
  {
    return sub_10000AFC4(a2, a3, a4, a6);
  }
  else
  {
    if (a1 != 1)
    {
      AMSupportLogInternal();
      if (a4)
      {
        CFErrorRef v16 = sub_10000B818(-1, @"Unknown SeaCookie type");
        uint64_t result = 0;
        *a4 = v16;
        return result;
      }
      return 0;
    }
    uint64_t v48 = 102;
    if (!a2 || !a3)
    {
      AMSupportLogInternal();
      return 0;
    }
    memset(v52, 0, 38);
    memset(v51, 0, sizeof(v51));
    long long v49 = 0u;
    long long v50 = 0u;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    int v14 = sub_10000B904(1, 0, 0, 0, &v49, &v48, a8, 0);
    AMSupportLogInternal();
    AMSupportLogInternal();
    AMSupportLogDumpMemory();
    if (v14)
    {
      if (a4) {
        *a4 = sub_10000B818(11, @"Unable to get Mesa Information");
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
      return 0;
    }
    CFDictionarySetValue(Mutable, @"Command", a2);
    uint64_t v17 = sub_10000B728((unsigned __int8 *)&v49 + 4, 4u, 4u);
    int v18 = v17;
    if (v17) {
      CFNullRef v19 = (CFNullRef)v17;
    }
    else {
      CFNullRef v19 = kCFNull;
    }
    CFDictionarySetValue(Mutable, @"ApChipID", v19);
    AMSupportLogInternal();
    if (v18) {
      CFRelease(v18);
    }
    BOOL v20 = sub_10000B728((unsigned __int8 *)&v49 + 8, 8u, 8u);
    uint64_t v21 = v20;
    if (v20) {
      CFNullRef v22 = (CFNullRef)v20;
    }
    else {
      CFNullRef v22 = kCFNull;
    }
    CFDictionarySetValue(Mutable, @"ApECID", v22);
    AMSupportLogInternal();
    if (v21) {
      CFRelease(v21);
    }
    char v23 = sub_10000B728((unsigned __int8 *)&v50, 0x10u, 0x10u);
    uint64_t v24 = v23;
    if (v23) {
      CFNullRef v25 = (CFNullRef)v23;
    }
    else {
      CFNullRef v25 = kCFNull;
    }
    CFDictionarySetValue(Mutable, @"SensorSN", v25);
    AMSupportLogInternal();
    if (v24) {
      CFRelease(v24);
    }
    uint64_t v26 = sub_10000B728((unsigned __int8 *)v51, 0x20u, 0x20u);
    __int16 v27 = v26;
    if (v26) {
      CFNullRef v28 = (CFNullRef)v26;
    }
    else {
      CFNullRef v28 = kCFNull;
    }
    CFDictionarySetValue(Mutable, @"SepNonce", v28);
    AMSupportLogInternal();
    if (v27) {
      CFRelease(v27);
    }
    int v29 = *(_DWORD *)((char *)v52 + 2);
    uint64_t v30 = bswap32(*(unsigned int *)((char *)v52 + 2));
    CFStringRef v31 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", v30, (char *)&v49 + 4);
    CFStringRef v32 = v31;
    if (v31) {
      CFNullRef v33 = (CFNullRef)v31;
    }
    else {
      CFNullRef v33 = kCFNull;
    }
    CFDictionarySetValue(Mutable, @"Version", v33);
    AMSupportLogInternal();
    if (v32) {
      CFRelease(v32);
    }
    if (v29 == 0x2000000)
    {
      long long v34 = sub_10000B728((unsigned __int8 *)v52 + 6, 0x20u, 0x20u);
      v35 = v34;
      CFNullRef v36 = v34 ? (CFNullRef)v34 : kCFNull;
      CFDictionarySetValue(Mutable, @"SensorNonce", v36);
      AMSupportLogInternal();
      if (v35) {
        CFRelease(v35);
      }
    }
    uint64_t v37 = sub_10000B728((unsigned __int8 *)v52, 2u, 4u);
    uint64_t v38 = v37;
    if (v37) {
      CFNullRef v39 = (CFNullRef)v37;
    }
    else {
      CFNullRef v39 = kCFNull;
    }
    CFDictionarySetValue(Mutable, @"SensorChipID", v39);
    AMSupportLogInternal();
    if (v38) {
      CFRelease(v38);
    }
    if (!a8 && AMFDRSealingMapGetFDRDataVersionForDevice() >= 2)
    {
      CFNullRef v40 = (CFNullRef)sub_10000B5A4(kCFAllocatorDefault);
      CFNullRef v41 = v40;
      CFNullRef v42 = v40 ? v40 : kCFNull;
      CFDictionarySetValue(Mutable, @"SIK", v42);
      AMSupportLogInternal();
      if (v41) {
        CFRelease(v41);
      }
    }
    if (a5)
    {
      uint64_t v43 = sub_10000B728((unsigned __int8 *)v52, 2u, 2u);
      v44 = v43;
      CFNullRef v45 = v43 ? (CFNullRef)v43 : kCFNull;
      CFDictionarySetValue(Mutable, @"SensorType", v45);
      AMSupportLogInternal();
      if (v44) {
        CFRelease(v44);
      }
    }
    if (a6) {
      CFDictionarySetValue(Mutable, @"isSSR", kCFBooleanTrue);
    }
    if (a7) {
      *a7 = v30;
    }
    *a3 = Mutable;
    return 1;
  }
}

uint64_t sub_10000C0D0()
{
  int v0 = __chkstk_darwin();
  if (!v1 || (CFDictionaryRef v8 = v2) == 0)
  {
    AMSupportLogInternal();
    return 0;
  }
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v5;
  size_t v12 = v4;
  CFNullRef v13 = v3;
  uint64_t v14 = v1;
  int v15 = v0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  AMSupportLogInternal();
  if (!CFDictionaryContainsKey(v8, *(const void **)(v14 + 16)))
  {
    AMSupportLogInternal();
    if (v12)
    {
      CFStringRef v24 = @"appropriate command is not present";
LABEL_16:
      CFErrorRef v25 = sub_10000B818(11, v24);
      uint64_t result = 0;
      CFErrorRef *v12 = v25;
      return result;
    }
    return 0;
  }
  uint64_t v29 = v10;
  uint64_t v30 = v13;
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v8, *(const void **)(v14 + 16));
  CFDataGetBytePtr(Value);
  CFDataGetLength(Value);
  AMSupportLogDumpMemory();
  size_t v18 = CFDataGetLength(Value);
  BytePtr = CFDataGetBytePtr(Value);
  AMSupportLogInternal();
  bzero(bytes, 0x2000uLL);
  CFIndex length = 0x2000;
  if (sub_10000B904(v15, *(_DWORD *)v14, BytePtr, v18, bytes, &length, v11, v9)
    || (unint64_t)length >> 13)
  {
    AMSupportLogInternal();
    if (v12)
    {
      CFStringRef v24 = @"_HSCHandleMessage Failed";
      goto LABEL_16;
    }
    return 0;
  }
  AMSupportLogInternal();
  CFDataRef v20 = CFDataCreate(kCFAllocatorDefault, bytes, length);
  CFDictionarySetValue(Mutable, *(const void **)(v14 + 24), v20);
  AMSupportLogInternal();
  if (v29)
  {
    if (v15 == 2)
    {
      CFStringRef v21 = *(const __CFString **)(v14 + 24);
      CFStringRef v22 = @"C4";
      goto LABEL_18;
    }
    if (v15 == 1)
    {
      CFStringRef v21 = *(const __CFString **)(v14 + 24);
      CFStringRef v22 = @"C5";
LABEL_18:
      if (CFEqual(v21, v22))
      {
        CFNullRef v26 = (CFNullRef)(*(uint64_t (**)(uint64_t, UInt8 *, CFIndex))(v29 + 16))(v29, bytes, length);
        CFNullRef v27 = v26;
        CFNullRef v28 = v26 ? v26 : kCFNull;
        CFDictionarySetValue(Mutable, @"signature", v28);
        AMSupportLogInternal();
        if (v27) {
          CFRelease(v27);
        }
      }
    }
  }
  AMSupportLogInternal();
  CFDictionarySetValue(Mutable, @"Command", *(const void **)(v14 + 8));
  void *v30 = Mutable;
  if (v20) {
    CFRelease(v20);
  }
  AMSupportLogInternal();
  return 1;
}

uint64_t sub_10000C4A0(int a1, const __CFURL *a2, const void *a3, CFComparisonResult a4, int a5, CFErrorRef *a6, uint64_t a7)
{
  CFTypeRef cf = 0;
  CFTypeRef v27 = 0;
  CFStringRef v24 = 0;
  CFTypeRef v25 = 0;
  CFDataRef v22 = 0;
  CFTypeRef v23 = 0;
  int v21 = -1;
  if (sub_10000BAF0(a1, @"startPairing", (CFMutableDictionaryRef *)&v25, a6, 0, a7 != 0, &v21, 0) == 1)
  {
    CFUUIDRef v13 = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef v14 = CFUUIDCreateString(kCFAllocatorDefault, v13);
    if (sub_10000CBA0(v14, v22, v25, 1, (const __CFData **)&cf, a6) == 1
      && sub_10000CE28(a2, (const __CFData *)cf, (uint64_t)&v27, a3, a6, 1) == 1)
    {
      AMSupportLogInternal();
      if (sub_10000D4C0((CFDataRef)v27, (CFDictionaryRef *)&v23, &v22, a6) == 1)
      {
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        if (v27)
        {
          CFRelease(v27);
          CFTypeRef v27 = 0;
        }
        if (a1 == 1 && v21 == 2) {
          sub_10000BA30(a4, a5);
        }
        if (a5 < 1)
        {
          uint64_t v18 = 1;
          goto LABEL_31;
        }
        CFUUIDRef v20 = v13;
        uint64_t v15 = a5;
        while (1)
        {
          int v16 = sub_10000C0D0();
          if (v23)
          {
            CFRelease(v23);
            CFTypeRef v23 = 0;
          }
          if (!v16)
          {
            CFUUIDRef v13 = v20;
            goto LABEL_40;
          }
          uint64_t v17 = v24;
          if (sub_10000CBA0(v14, v22, v24, 0, (const __CFData **)&cf, a6) != 1) {
            break;
          }
          if (sub_10000CE28(a2, (const __CFData *)cf, (uint64_t)&v27, a3, a6, 0) != 1) {
            break;
          }
          AMSupportLogInternal();
          if (sub_10000D4C0((CFDataRef)v27, (CFDictionaryRef *)&v23, &v22, a6) != 1) {
            break;
          }
          if (v23) {
            AMSupportLogInternal();
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          if (v27)
          {
            CFRelease(v27);
            CFTypeRef v27 = 0;
          }
          if (v17)
          {
            CFRelease(v17);
            CFStringRef v24 = 0;
          }
          a4 += 40;
          if (!--v15)
          {
            uint64_t v18 = 1;
            CFUUIDRef v13 = v20;
            goto LABEL_31;
          }
        }
        CFUUIDRef v13 = v20;
      }
    }
  }
  else
  {
    CFUUIDRef v13 = 0;
    CFStringRef v14 = 0;
  }
LABEL_40:
  AMSupportLogInternal();
  uint64_t v18 = 0;
LABEL_31:
  if (v25)
  {
    CFRelease(v25);
    CFTypeRef v25 = 0;
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v13) {
    CFRelease(v13);
  }
  AMSupportLogInternal();
  return v18;
}

uint64_t HSCGetPearlNonce()
{
  uint64_t v0 = __chkstk_darwin();
  CFDictionaryRef v2 = v1;
  CFDataRef v3 = (void *)v0;
  bzero(bytes, 0x2000uLL);
  CFIndex length = 0x2000;
  if (!v3)
  {
    if (v2)
    {
      CFStringRef v4 = @"Invalid Arguments";
      int v5 = 1;
      goto LABEL_7;
    }
    return 0;
  }
  if (sub_10000B418(7, 0, 0, bytes, &length, 0))
  {
    if (v2)
    {
      CFStringRef v4 = @"Unable to get pearl nonce";
      int v5 = 11;
LABEL_7:
      CFErrorRef v6 = sub_10000B818(v5, v4);
      uint64_t result = 0;
      *CFDictionaryRef v2 = v6;
      return result;
    }
    return 0;
  }
  *CFDataRef v3 = CFDataCreate(kCFAllocatorDefault, bytes, length);
  AMSupportLogInternal();
  AMSupportLogInternal();
  return 1;
}

uint64_t HSCSecurePairPearl(const __CFURL *a1, CFDataRef theData, CFErrorRef *a3, uint64_t a4, uint64_t a5)
{
  return HSCSecurePairPearlWithProxy(a1, 0, theData, a3, a4, a5);
}

uint64_t HSCSecurePairPearlWithProxy(const __CFURL *a1, const void *a2, CFDataRef theData, CFErrorRef *a4, uint64_t a5, uint64_t a6)
{
  if (theData)
  {
    BytePtr = CFDataGetBytePtr(theData);
    size_t Length = CFDataGetLength(theData);
    if (sub_10000B418(8, BytePtr, Length, 0, 0, 0))
    {
      if (a4) {
        *a4 = sub_10000B818(11, @"Unable to validate tatsu ticket");
      }
      return 0;
    }
    AMSupportLogInternal();
  }

  return sub_10000B57C(a1, a2, a4, a5, a6);
}

CFDataRef sub_10000CAA4(const __CFData *a1)
{
  size_t Length = CFDataGetLength(a1);
  CFDataRef v3 = (UInt8 *)malloc_type_malloc(Length, 0x2A0CAA11uLL);
  size_t v4 = CFDataGetLength(a1);
  int v5 = (UInt8 *)malloc_type_malloc(v4, 0x8AD36680uLL);
  v11.CFIndex length = CFDataGetLength(a1);
  v11.location = 0;
  CFDataGetBytes(a1, v11, v5);
  if (v3 && CFDataGetLength(a1) >= 1)
  {
    CFIndex v6 = 0;
    int v7 = 0;
    do
    {
      int v8 = v5[v6];
      if ((v8 - 9) >= 2) {
        v3[v7++] = v8;
      }
      ++v6;
    }
    while (CFDataGetLength(a1) > v6);
  }
  else
  {
    int v7 = 0;
  }
  CFDataRef v9 = CFDataCreate(kCFAllocatorDefault, v3, v7);
  free(v3);
  free(v5);
  return v9;
}

uint64_t sub_10000CBA0(const void *a1, const void *a2, const void *a3, int a4, const __CFData **a5, CFErrorRef *a6)
{
  CFErrorRef error = 0;
  if (!a6) {
    return 0;
  }
  if (a3)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 0;
      *a6 = sub_10000B818(3, @"Request Dictionary Creation failed\n");
    }
    CFDictionarySetValue(Mutable, @"SpecVersion", @"1.2");
    CFDictionarySetValue(Mutable, @"UUID", a1);
    if (a4)
    {
      AMSupportLogInternal();
      CFStringRef v14 = @"Request";
    }
    else
    {
      CFDictionarySetValue(Mutable, @"Session", a2);
      CFStringRef v14 = @"Response";
    }
    CFDictionarySetValue(Mutable, v14, a3);
    AMSupportLogInternal();
    AMSupportLogInternal();
    AMSupportLogInternal();
    CFDataRef v15 = CFPropertyListCreateData(kCFAllocatorDefault, Mutable, kCFPropertyListXMLFormat_v1_0, 0, &error);
    if (v15)
    {
      CFDataRef v16 = v15;
      CFDataGetLength(v15);
      AMSupportLogInternal();
      *a5 = v16;
      if (CFDictionaryContainsKey((CFDictionaryRef)a3, @"Command"))
      {
        CFDataRef Value = CFDictionaryGetValue((CFDictionaryRef)a3, @"Command");
        CFStringRef v18 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"/tmp/%@", Value, v16);
        if (v18) {
          CFRelease(v18);
        }
      }
    }
    else
    {
      AMSupportLogInternal();
      uint64_t v13 = 0;
      *a6 = sub_10000B818(10, @"CFPropertyListCreateData failed\n");
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    uint64_t v13 = 0;
    *a6 = sub_10000B818(1, @"Input argument req_dict is empty or NULL\n");
  }
  if (error) {
    CFRelease(error);
  }
  return v13;
}

uint64_t sub_10000CE28(CFURLRef url, const __CFData *a2, uint64_t a3, const void *a4, CFErrorRef *a5, int a6)
{
  if (!a5)
  {
    AMSupportLogInternal();
    uint64_t v13 = 0;
    uint64_t v14 = 1;
    goto LABEL_41;
  }
  int v8 = a4;
  if (!a4)
  {
    int v8 = (const void *)AMSupportHttpCopyProxySettings();
    if (!v8) {
      AMSupportLogInternal();
    }
  }
  Request = CFHTTPMessageCreateRequest(kCFAllocatorDefault, @"POST", url, kCFHTTPVersion1_1);
  if (!Request)
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    *a5 = sub_10000B818(3, @"could not create httpRequest\n");
    goto LABEL_41;
  }
  size_t v12 = Request;
  CFHTTPMessageSetHeaderFieldValue(Request, @"Content-Type", @"application/xml");
  if (a6)
  {
    if (qword_100018CD8) {
      CFRelease((CFTypeRef)qword_100018CD8);
    }
    qword_100018CD8 = 0;
  }
  else if (qword_100018CD8)
  {
    CFHTTPMessageSetHeaderFieldValue(v12, @"X-Apple-SeaCookie-IP", (CFStringRef)qword_100018CD8);
  }
  CFDataRef v15 = sub_10000CAA4(a2);
  CFHTTPMessageSetBody(v12, v15);
  CFIndex Length = CFDataGetLength(v15);
  CFStringRef v17 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%lu", Length);
  if (!v17)
  {
    CFErrorRef v25 = sub_10000B818(3, @"could not create contentLengthStr\n");
    uint64_t v13 = 0;
LABEL_47:
    uint64_t v14 = 0;
    CFNumberRef v20 = 0;
    goto LABEL_51;
  }
  CFHTTPMessageSetHeaderFieldValue(v12, @"Content-Length", v17);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v13 = Mutable;
  if (!Mutable)
  {
    CFErrorRef v25 = sub_10000B818(3, @"Failed to create connection options dictionary.\n");
    goto LABEL_47;
  }
  if (v8) {
    CFDictionarySetValue(Mutable, kAMSupportHttpOptionSocksProxySettings, v8);
  }
  SetFromCFIndexArray = (const void *)AMSupportCreateSetFromCFIndexArray();
  CFDictionaryAddValue(v13, kAMSupportHttpOptionValidResponses, SetFromCFIndexArray);
  if (SetFromCFIndexArray) {
    CFRelease(SetFromCFIndexArray);
  }
  CFNumberRef v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &unk_100018C80);
  if (v20)
  {
    CFDictionaryAddValue(v13, kAMSupportHttpOptionTimeout, v20);
    CFRelease(v20);
    CFNumberRef v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &unk_100018C84);
    if (v20)
    {
      CFDictionaryAddValue(v13, kAMSupportHttpOptionMaxAttempts, v20);
      CFRelease(v20);
      AMSupportLogInternal();
      CFDictionarySetValue(v13, kAMSupportHttpOptionDisableSSLValidation, kCFBooleanTrue);
      AMSupportLogInternal();
      CFNumberRef v20 = CFHTTPMessageCopyAllHeaderFields(v12);
      if (v20)
      {
        AMSupportLogInternal();
        AMSupportLogInternal();
      }
      AMSupportLogInternal();
      uint64_t v21 = AMSupportHttpSendSync();
      if (v21)
      {
        uint64_t v22 = v21;
        AMSupportLogInternal();
        CFStringRef v23 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"HTTP send error: %d\n", v22, 0, 0);
        switch(v22)
        {
          case 0xB:
            int v24 = 13;
            break;
          case 0xC:
            int v24 = 14;
            break;
          case 0x10:
            int v24 = 12;
            break;
          default:
            int v24 = 15;
            break;
        }
      }
      else
      {
        AMSupportLogInternal();
        CFStringRef v23 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"SeaCookie server returned HTTP status: %ld\n", 0);
        int v24 = 16;
      }
      CFErrorRef v25 = sub_10000B818(v24, v23);
      uint64_t v14 = 0;
      goto LABEL_33;
    }
    CFStringRef v27 = @"Failed to create max attempts\n";
  }
  else
  {
    CFStringRef v27 = @"Failed to create timeout\n";
  }
  CFErrorRef v25 = sub_10000B818(3, v27);
  uint64_t v14 = 0;
LABEL_51:
  CFStringRef v23 = 0;
LABEL_33:
  *a5 = v25;
  if (v15) {
    CFRelease(v15);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v17) {
    CFRelease(v17);
  }
  CFRelease(v12);
  if (v20) {
    CFRelease(v20);
  }
LABEL_41:
  if (v13) {
    CFRelease(v13);
  }
  AMSupportLogInternal();
  return v14;
}

uint64_t sub_10000D4C0(CFDataRef data, CFDictionaryRef *a2, CFDataRef *a3, CFErrorRef *a4)
{
  CFErrorRef error = 0;
  if (!a4)
  {
    uint64_t v8 = 0;
    goto LABEL_42;
  }
  if (!data || !a2)
  {
    uint64_t v8 = 0;
    *a4 = sub_10000B818(1, @"DataRef or responseDict is NULL.");
    goto LABEL_40;
  }
  CFPropertyListRef v7 = CFPropertyListCreateWithData(kCFAllocatorDefault, data, 0x64uLL, 0, &error);
  uint64_t v8 = (uint64_t)v7;
  if (!v7)
  {
    AMSupportLogInternal();
    *a4 = sub_10000B818(7, @"Create xmlData failed.");
    *a2 = 0;
    goto LABEL_40;
  }
  CFTypeID v9 = CFGetTypeID(v7);
  if (v9 == CFDictionaryGetTypeID())
  {
    AMSupportLogInternal();
    int v10 = CFDictionaryContainsKey((CFDictionaryRef)v8, @"ErrorCode");
    int v11 = CFDictionaryContainsKey((CFDictionaryRef)v8, @"ErrorMessage");
    if (v10 != 1 && v11 != 1)
    {
      if (a3 && !*a3)
      {
        if (!CFDictionaryContainsKey((CFDictionaryRef)v8, @"Session"))
        {
          CFStringRef v23 = @"Server did not return session cookie";
          int v24 = 9;
LABEL_29:
          *a4 = sub_10000B818(v24, v23);
          goto LABEL_39;
        }
        CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v8, @"Session");
        *a3 = CFDataCreateCopy(kCFAllocatorDefault, Value);
      }
      CFStringRef v17 = @"Request";
      if (CFDictionaryContainsKey((CFDictionaryRef)v8, @"Request") == 1
        || (CFStringRef v17 = @"Response", CFDictionaryContainsKey((CFDictionaryRef)v8, @"Response") == 1))
      {
        CFDictionaryRef v18 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v8, v17);
        CFDictionaryRef Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, v18);
        if (Copy)
        {
          CFDictionaryRef v20 = Copy;
          AMSupportLogInternal();
          if (CFDictionaryContainsKey(v20, @"Command"))
          {
            uint64_t v21 = CFDictionaryGetValue(v20, @"Command");
            CFStringRef v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"/tmp/%@-from-server", v21);
            *a2 = CFDictionaryCreateCopy(kCFAllocatorDefault, v20);
            if (v22) {
              CFRelease(v22);
            }
          }
          else
          {
            *a2 = CFDictionaryCreateCopy(kCFAllocatorDefault, v20);
          }
          CFRelease((CFTypeRef)v8);
          CFRelease(v20);
          uint64_t v8 = 1;
          goto LABEL_40;
        }
      }
      AMSupportLogInternal();
      CFStringRef v23 = @"responseDict NULL. Unable to parse Response\n";
      int v24 = 8;
      goto LABEL_29;
    }
    int v13 = v11;
    if (v10)
    {
      CFStringRef v14 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v8, @"ErrorCode");
      if (v13)
      {
LABEL_13:
        CFStringRef v15 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v8, @"ErrorMessage");
        AMSupportLogInternal();
        goto LABEL_32;
      }
    }
    else
    {
      CFStringRef v14 = 0;
      if (v11) {
        goto LABEL_13;
      }
    }
    CFStringRef v15 = 0;
LABEL_32:
    *a2 = 0;
    CFMutableDictionaryRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 1024);
    CFStringAppend(Mutable, @"Server returned an ");
    if (v14)
    {
      CFTypeID v26 = CFGetTypeID(v14);
      if (v26 == CFStringGetTypeID())
      {
        AMSupportLogInternal();
        CFStringAppend(Mutable, @"\terrorCode: ");
        CFStringAppend(Mutable, v14);
      }
    }
    if (v15)
    {
      CFStringAppend(Mutable, @"\terrorString: ");
      CFStringAppend(Mutable, v15);
    }
    *a4 = sub_10000B818(6, Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
    goto LABEL_39;
  }
  *a4 = sub_10000B818(7, @"xmlData is not CFDictionary type.");
  *a2 = 0;
LABEL_39:
  CFRelease((CFTypeRef)v8);
  uint64_t v8 = 0;
LABEL_40:
  if (error)
  {
    CFRelease(error);
    CFErrorRef error = 0;
  }
LABEL_42:
  AMSupportLogInternal();
  return v8;
}

void sub_10000D8EC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.BiometricKit", "Library-MesaFactory");
  qword_100018C98 = (uint64_t)v1;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000ED9C(&v2);
      os_log_t v1 = v2;
    }
    else
    {
      os_log_t v1 = 0;
    }
  }
  qword_100018CA0 = (uint64_t)v1;
}

uint64_t sub_10000D958(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, void *a7)
{
  size_t v7 = a5 + 8;
  BOOL v8 = a5 >= 0xFFFFFFFFFFFFFFF8;
  if (a5 >= 0xFFFFFFFFFFFFFFF8)
  {
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (qword_100018C98) {
      CFDictionaryRef v20 = qword_100018C98;
    }
    else {
      CFDictionaryRef v20 = &_os_log_default;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CFStringRef v22 = 136316162;
      *(void *)&v22[4] = "err == 0 ";
      __int16 v23 = 2048;
      BOOL v24 = v8;
      __int16 v25 = 2080;
      CFTypeID v26 = &unk_10001123B;
      __int16 v27 = 2080;
      CFNullRef v28 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v29 = 1024;
      int v30 = 66;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v22, 0x30u);
    }
    return 1;
  }
  else
  {
    CFDataRef v16 = malloc_type_malloc(a5 + 8, 0x5F22DC4FuLL);
    if (v16)
    {
      CFStringRef v17 = v16;
      *CFDataRef v16 = 19778;
      v16[1] = a2;
      v16[2] = 1;
      v16[3] = a3;
      if (a5) {
        memmove(v16 + 4, a4, a5);
      }
      if (a7)
      {
        *(void *)CFStringRef v22 = *a7;
        uint64_t v18 = IOConnectCallStructMethod(a1, 0, v17, v7, a6, (size_t *)v22);
        *a7 = *(void *)v22;
      }
      else
      {
        *(void *)CFStringRef v22 = 0;
        uint64_t v18 = IOConnectCallStructMethod(a1, 0, v17, v7, a6, (size_t *)v22);
      }
      free(v17);
    }
    else
    {
      if (qword_100018CE0 != -1) {
        dispatch_once(&qword_100018CE0, &stru_1000146E0);
      }
      if (qword_100018C98) {
        uint64_t v21 = qword_100018C98;
      }
      else {
        uint64_t v21 = &_os_log_default;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CFStringRef v22 = 136316162;
        *(void *)&v22[4] = "cmd";
        __int16 v23 = 2048;
        BOOL v24 = 0;
        __int16 v25 = 2080;
        CFTypeID v26 = &unk_10001123B;
        __int16 v27 = 2080;
        CFNullRef v28 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
        __int16 v29 = 1024;
        int v30 = 69;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v22, 0x30u);
      }
      return 12;
    }
  }
  return v18;
}

uint64_t sub_10000DC44()
{
  int v0 = sub_10000D958(dword_100018CAC, 2, 1, 0, 0, 0, 0);
  uint64_t v1 = v0;
  if (v0)
  {
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (qword_100018C98) {
      CFDataRef v3 = qword_100018C98;
    }
    else {
      CFDataRef v3 = &_os_log_default;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136316162;
      int v5 = "err == 0 ";
      __int16 v6 = 2048;
      uint64_t v7 = v1;
      __int16 v8 = 2080;
      CFTypeID v9 = &unk_10001123B;
      __int16 v10 = 2080;
      int v11 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v12 = 1024;
      int v13 = 97;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v4, 0x30u);
    }
  }
  return v1;
}

uint64_t sub_10000DD94()
{
  unsigned int v6 = 0;
  uint64_t v5 = 4;
  int v0 = sub_10000D958(dword_100018CAC, 16, 0, 0, 0, &v6, &v5);
  if (v0)
  {
    int v2 = v0;
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (qword_100018C98) {
      CFDataRef v3 = qword_100018C98;
    }
    else {
      CFDataRef v3 = &_os_log_default;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v8 = "err == 0 ";
      __int16 v9 = 2048;
      uint64_t v10 = v2;
      __int16 v11 = 2080;
      __int16 v12 = &unk_10001123B;
      __int16 v13 = 2080;
      CFStringRef v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v15 = 1024;
      int v16 = 116;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (v5 != 4)
  {
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (qword_100018C98) {
      int v4 = qword_100018C98;
    }
    else {
      int v4 = &_os_log_default;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v8 = "size == sizeof(state)";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      __int16 v12 = &unk_10001123B;
      __int16 v13 = 2080;
      CFStringRef v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v15 = 1024;
      int v16 = 117;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    return 0;
  }
  return v6;
}

uint64_t sub_10000DFD4()
{
  if (dword_100018CAC) {
    goto LABEL_5;
  }
  CFDictionaryRef v0 = IOServiceMatching("AppleBiometricServices");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (MatchingService)
  {
    io_object_t v2 = MatchingService;
    uint64_t v3 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_100018CAC);
    if (!v3)
    {
      IOObjectRelease(v2);
LABEL_5:
      if (!sub_10000DD94()) {
        sub_10000DC44();
      }
      return 0;
    }
    uint64_t v4 = v3;
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (qword_100018C98) {
      unsigned int v6 = qword_100018C98;
    }
    else {
      unsigned int v6 = &_os_log_default;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      __int16 v8 = "err == 0 ";
      __int16 v9 = 2048;
      uint64_t v10 = (int)v4;
      __int16 v11 = 2080;
      __int16 v12 = &unk_10001123B;
      __int16 v13 = 2080;
      CFStringRef v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v15 = 1024;
      int v16 = 137;
      goto LABEL_23;
    }
  }
  else
  {
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    uint64_t v4 = 3758097084;
    if (qword_100018C98) {
      unsigned int v6 = qword_100018C98;
    }
    else {
      unsigned int v6 = &_os_log_default;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136316162;
      __int16 v8 = "service";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      __int16 v12 = &unk_10001123B;
      __int16 v13 = 2080;
      CFStringRef v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v15 = 1024;
      int v16 = 134;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
  return v4;
}

uint64_t sub_10000E234(int a1, const void *a2, size_t a3, void *a4, uint64_t *a5)
{
  uint64_t v10 = &OBJC_INSTANCE_METHODS_NSObject;
  if (qword_100018CE0 != -1) {
    dispatch_once(&qword_100018CE0, &stru_1000146E0);
  }
  __int16 v11 = &OBJC_INSTANCE_METHODS_NSObject;
  if (qword_100018CA0) {
    __int16 v12 = qword_100018CA0;
  }
  else {
    __int16 v12 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)int v30 = a1;
    *(_WORD *)&v30[4] = 2048;
    *(void *)&v30[6] = a2;
    *(_WORD *)&v30[14] = 2048;
    *(void *)&v30[16] = a3;
    *(_WORD *)&v30[24] = 2048;
    *(void *)&v30[26] = a4;
    *(_WORD *)&v30[34] = 2048;
    *(void *)&v30[36] = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "seaCookieHandleMessage %d %p %zu %p %p\n", buf, 0x30u);
  }
  size_t size = 0;
  if ((a1 & 0xFFFFFFF7) != 0 && !a2)
  {
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    uint64_t v18 = 3758097090;
    if (qword_100018C98) {
      uint64_t v21 = qword_100018C98;
    }
    else {
      uint64_t v21 = &_os_log_default;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_99;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)int v30 = "(type == kMesaFactorySeaCookieMessageS0) || (type == kMesaFactorySeaCookieGenerateNonce) || message";
    *(_WORD *)&v30[8] = 2048;
    *(void *)&v30[10] = 0;
    *(_WORD *)&v30[18] = 2080;
    *(void *)&v30[20] = &unk_10001123B;
    *(_WORD *)&v30[28] = 2080;
    *(void *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 814;
LABEL_88:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_99:
    if (*(void *)&v10[412] != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (v11[404]) {
      BOOL v24 = v11[404];
    }
    else {
      BOOL v24 = &_os_log_default;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)int v30 = a1;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = v18;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "seaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
    }
    return v18;
  }
  if ((a1 & 0xFFFFFFF7) != 0 && !a3)
  {
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    uint64_t v18 = 3758097090;
    if (qword_100018C98) {
      uint64_t v21 = qword_100018C98;
    }
    else {
      uint64_t v21 = &_os_log_default;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_99;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)int v30 = "(type == kMesaFactorySeaCookieMessageS0) || (type == kMesaFactorySeaCookieGenerateNonce) || messageLength";
    *(_WORD *)&v30[8] = 2048;
    *(void *)&v30[10] = 0;
    *(_WORD *)&v30[18] = 2080;
    *(void *)&v30[20] = &unk_10001123B;
    *(_WORD *)&v30[28] = 2080;
    *(void *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 815;
    goto LABEL_88;
  }
  if (a1 != 9 && !a4)
  {
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    uint64_t v18 = 3758097090;
    if (qword_100018C98) {
      uint64_t v21 = qword_100018C98;
    }
    else {
      uint64_t v21 = &_os_log_default;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_99;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)int v30 = "(type == kMesaFactorySeaCookieValidateTatsuTicket) || reply";
    *(_WORD *)&v30[8] = 2048;
    *(void *)&v30[10] = 0;
    *(_WORD *)&v30[18] = 2080;
    *(void *)&v30[20] = &unk_10001123B;
    *(_WORD *)&v30[28] = 2080;
    *(void *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 816;
    goto LABEL_88;
  }
  if (a1 != 9 && !a5)
  {
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    uint64_t v18 = 3758097090;
    if (qword_100018C98) {
      uint64_t v21 = qword_100018C98;
    }
    else {
      uint64_t v21 = &_os_log_default;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_99;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)int v30 = "(type == kMesaFactorySeaCookieValidateTatsuTicket) || replySize";
    *(_WORD *)&v30[8] = 2048;
    *(void *)&v30[10] = 0;
    *(_WORD *)&v30[18] = 2080;
    *(void *)&v30[20] = &unk_10001123B;
    *(_WORD *)&v30[28] = 2080;
    *(void *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 817;
    goto LABEL_88;
  }
  if (qword_100018CE0 != -1) {
    dispatch_once(&qword_100018CE0, &stru_1000146E0);
  }
  if (qword_100018C98) {
    __int16 v13 = qword_100018C98;
  }
  else {
    __int16 v13 = &_os_log_default;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)int v30 = a3;
    *(_WORD *)&v30[8] = 1040;
    *(_DWORD *)&v30[10] = a3;
    *(_WORD *)&v30[14] = 2096;
    *(void *)&v30[16] = a2;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "seaCookieHandleMessage message[%zu] %.*P\n", buf, 0x1Cu);
  }
  uint64_t v14 = sub_10000DFD4();
  if (v14)
  {
    uint64_t v18 = v14;
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (qword_100018C98) {
      uint64_t v21 = qword_100018C98;
    }
    else {
      uint64_t v21 = &_os_log_default;
    }
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_99;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)int v30 = "err == 0 ";
    *(_WORD *)&v30[8] = 2048;
    *(void *)&v30[10] = (int)v18;
    *(_WORD *)&v30[18] = 2080;
    *(void *)&v30[20] = &unk_10001123B;
    *(_WORD *)&v30[28] = 2080;
    *(void *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 822;
    goto LABEL_88;
  }
  if (a3 >= 0xFFFFFFFFFFFFFFF4)
  {
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (qword_100018C98) {
      CFStringRef v22 = qword_100018C98;
    }
    else {
      CFStringRef v22 = &_os_log_default;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)int v30 = "err == 0 ";
      *(_WORD *)&v30[8] = 2048;
      *(void *)&v30[10] = a3 >= 0xFFFFFFFFFFFFFFF4;
      *(_WORD *)&v30[18] = 2080;
      *(void *)&v30[20] = &unk_10001123B;
      *(_WORD *)&v30[28] = 2080;
      *(void *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      *(_WORD *)&v30[38] = 1024;
      *(_DWORD *)&v30[40] = 825;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v18 = 1;
    uint64_t v10 = &OBJC_INSTANCE_METHODS_NSObject;
    goto LABEL_99;
  }
  size_t size = 8200;
  __int16 v15 = (char *)malloc_type_malloc(a3 + 12, 0x66E6C453uLL);
  if (!v15)
  {
    uint64_t v10 = &OBJC_INSTANCE_METHODS_NSObject;
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (qword_100018C98) {
      uint64_t v21 = qword_100018C98;
    }
    else {
      uint64_t v21 = &_os_log_default;
    }
    uint64_t v18 = 3758097085;
    __int16 v11 = &OBJC_INSTANCE_METHODS_NSObject;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_99;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)int v30 = "inData";
    *(_WORD *)&v30[8] = 2048;
    *(void *)&v30[10] = 0;
    *(_WORD *)&v30[18] = 2080;
    *(void *)&v30[20] = &unk_10001123B;
    *(_WORD *)&v30[28] = 2080;
    *(void *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    *(_WORD *)&v30[38] = 1024;
    *(_DWORD *)&v30[40] = 831;
    goto LABEL_88;
  }
  int v16 = v15;
  CFStringRef v17 = malloc_type_malloc(size, 0xC2CD0452uLL);
  *(_DWORD *)int v16 = a1;
  *(void *)(v16 + 4) = a3;
  memcpy(v16 + 12, a2, a3);
  uint64_t v18 = sub_10000D958(dword_100018CAC, 77, 0, v16, a3 + 12, v17, &size);
  if (v18)
  {
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (qword_100018C98) {
      __int16 v23 = qword_100018C98;
    }
    else {
      __int16 v23 = &_os_log_default;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)int v30 = "err == 0 ";
      *(_WORD *)&v30[8] = 2048;
      *(void *)&v30[10] = (int)v18;
      *(_WORD *)&v30[18] = 2080;
      *(void *)&v30[20] = &unk_10001123B;
      *(_WORD *)&v30[28] = 2080;
      *(void *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      *(_WORD *)&v30[38] = 1024;
      *(_DWORD *)&v30[40] = 841;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
LABEL_96:
    free(v16);
    if (!v17) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
  if (!a4 || !a5) {
    goto LABEL_96;
  }
  if ((unint64_t)*a5 < *v17)
  {
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (qword_100018C98) {
      __int16 v27 = qword_100018C98;
    }
    else {
      __int16 v27 = &_os_log_default;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)int v30 = "*replySize >= outData->dataSize";
      *(_WORD *)&v30[8] = 2048;
      *(void *)&v30[10] = 0;
      *(_WORD *)&v30[18] = 2080;
      *(void *)&v30[20] = &unk_10001123B;
      *(_WORD *)&v30[28] = 2080;
      *(void *)&v30[30] = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      *(_WORD *)&v30[38] = 1024;
      *(_DWORD *)&v30[40] = 845;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v18 = 3758097115;
  }
  else
  {
    memcpy(a4, v17 + 1, *v17);
    *a5 = *v17;
    if (qword_100018CE0 != -1) {
      dispatch_once(&qword_100018CE0, &stru_1000146E0);
    }
    if (qword_100018C98) {
      CFNullRef v19 = qword_100018C98;
    }
    else {
      CFNullRef v19 = &_os_log_default;
    }
    uint64_t v18 = 0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *a5;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)int v30 = a1;
      *(_WORD *)&v30[4] = 2048;
      *(void *)&v30[6] = v20;
      *(_WORD *)&v30[14] = 1040;
      *(_DWORD *)&v30[16] = v20;
      *(_WORD *)&v30[20] = 2096;
      *(void *)&v30[22] = a4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "seaCookieHandleMessage, type=%d reply[%zu] %.*P\n", buf, 0x22u);
      uint64_t v18 = 0;
    }
  }
  free(v16);
LABEL_97:
  free(v17);
LABEL_98:
  __int16 v11 = &OBJC_INSTANCE_METHODS_NSObject;
  uint64_t v10 = &OBJC_INSTANCE_METHODS_NSObject;
  if (v18) {
    goto LABEL_99;
  }
  if (qword_100018CE0 != -1) {
    dispatch_once(&qword_100018CE0, &stru_1000146E0);
  }
  if (qword_100018CA0) {
    __int16 v25 = qword_100018CA0;
  }
  else {
    __int16 v25 = &_os_log_default;
  }
  uint64_t v18 = 0;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)int v30 = a1;
    *(_WORD *)&v30[4] = 1024;
    *(_DWORD *)&v30[6] = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "seaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
    return 0;
  }
  return v18;
}

void sub_10000ED9C(void *a1)
{
  *(_WORD *)io_object_t v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-MesaFactory'!\n", v2, 2u);
  *a1 = qword_100018C98;
}

void sub_10000EDFC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "URL: %@ is invalid", (uint8_t *)&v2, 0xCu);
}

void sub_10000EE74(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "URL: %@ scheme is invalid", (uint8_t *)&v2, 0xCu);
}

void sub_10000EEEC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Response Dictionary Empty", v1, 2u);
}

void sub_10000EF30()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to get Savage Serial Number", v2, v3, v4, v5, v6);
}

void sub_10000EF64()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to get Savage UID", v2, v3, v4, v5, v6);
}

void sub_10000EF98(unsigned __int8 a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to pair pearl: %i, error: %@", (uint8_t *)v3, 0x12u);
}

void sub_10000F024(uint64_t a1, NSObject *a2)
{
  v2[0] = 67109378;
  v2[1] = 0;
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to pair pearl: %i, error: %@", (uint8_t *)v2, 0x12u);
}

void sub_10000F0A8()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to get default AMAuthInstallRef", v2, v3, v4, v5, v6);
}

void sub_10000F0DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F148(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F1B4()
{
  sub_10000830C();
  sub_1000082CC((void *)&_mh_execute_header, v0, v1, "Failed to set SEP nonce with error %d", v2, v3, v4, v5, v6);
}

void sub_10000F21C()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to enable single sign on", v2, v3, v4, v5, v6);
}

void sub_10000F250()
{
  sub_10000830C();
  sub_1000082CC((void *)&_mh_execute_header, v0, v1, "Failed to set TATSU server URL with error %d", v2, v3, v4, v5, v6);
}

void sub_10000F2B8()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to encode RIK keyBlob to base64 data", v2, v3, v4, v5, v6);
}

void sub_10000F2EC()
{
  sub_1000082B8(__stack_chk_guard);
  sub_1000082E8();
  sub_100008290((void *)&_mh_execute_header, v0, v1, "Failed to power cycle sensor: %@", v2, v3, v4, v5, v6);
}

void sub_10000F354()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Unknown camera type", v2, v3, v4, v5, v6);
}

void sub_10000F388()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "CameraH10 devices not supported", v2, v3, v4, v5, v6);
}

void sub_10000F3BC()
{
  sub_1000082B8(__stack_chk_guard);
  sub_1000082E8();
  sub_100008290((void *)&_mh_execute_header, v0, v1, "Failed to load savage patch. Error: %@", v2, v3, v4, v5, v6);
}

void sub_10000F424()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to get manifest ticket", v2, v3, v4, v5, v6);
}

void sub_10000F458()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to allocate UpdaterOptions.", v2, v3, v4, v5, v6);
}

void sub_10000F48C()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Empty deviceInfoDict", v2, v3, v4, v5, v6);
}

void sub_10000F4C0()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to find patch files", v2, v3, v4, v5, v6);
}

void sub_10000F4F4()
{
  sub_1000082B8(__stack_chk_guard);
  sub_1000082F4();
  sub_100008318((void *)&_mh_execute_header, v0, v1, "Failed to exec SavageUpdater Command: %@:%@");
}

void sub_10000F568()
{
  sub_1000082B8(__stack_chk_guard);
  sub_1000082E8();
  sub_100008290((void *)&_mh_execute_header, v0, v1, "Failed to exec Savage Updater command: %@", v2, v3, v4, v5, v6);
}

void sub_10000F5D0()
{
  sub_100008338(__stack_chk_guard);
  sub_1000082F4();
  sub_100008318((void *)&_mh_execute_header, v0, v1, "Failed to create %s obj::error: %@");
}

void sub_10000F644()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to sign payload data", v2, v3, v4, v5, v6);
}

void sub_10000F678(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008290((void *)&_mh_execute_header, a2, a3, "Failed to match server return error: %@", a5, a6, a7, a8, 2u);
}

void sub_10000F6E4()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to parse SeaCookie server error.", v2, v3, v4, v5, v6);
}

void sub_10000F718()
{
  sub_100008338(__stack_chk_guard);
  sub_1000082E8();
  sub_100008290((void *)&_mh_execute_header, v0, v1, "Failed to get PSD2 instance, error: %@", v2, v3, v4, v5, v6);
}

void sub_10000F780()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to create AMFDRRemote object", v2, v3, v4, v5, v6);
}

void sub_10000F7B4()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Unable to Create Persmission String for getting remote PSD2", v2, v3, v4, v5, v6);
}

void sub_10000F7E8()
{
  sub_100008338(__stack_chk_guard);
  sub_1000082E8();
  sub_100008290((void *)&_mh_execute_header, v0, v1, "Failed to get remote PSD2 data class, error: %@", v2, v3, v4, v5, v6);
}

void sub_10000F850()
{
  sub_10000830C();
  sub_1000082CC((void *)&_mh_execute_header, v0, v1, "Failed to verify remote PSD2 data class, pearlStatus: %d", v2, v3, v4, v5, v6);
}

void sub_10000F8B8()
{
  sub_10000830C();
  sub_1000082CC((void *)&_mh_execute_header, v0, v1, "Failed to decode PSD2: %d", v2, v3, v4, v5, v6);
}

void sub_10000F920()
{
  sub_100008338(__stack_chk_guard);
  sub_1000082E8();
  sub_100008290((void *)&_mh_execute_header, v0, v1, "Failed to request FDR Permissions: %@", v2, v3, v4, v5, v6);
}

void sub_10000F988()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to get savage firmware path", v2, v3, v4, v5, v6);
}

void sub_10000F9BC()
{
  sub_1000082AC();
  sub_100008274((void *)&_mh_execute_header, v0, v1, "Failed to get patch files", v2, v3, v4, v5, v6);
}

uint64_t AMAuthInstallApImg4SetSepNonce()
{
  return _AMAuthInstallApImg4SetSepNonce();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return _AMAuthInstallSetSigningServerURL();
}

uint64_t AMFDRCreateTypeWithOptions()
{
  return _AMFDRCreateTypeWithOptions();
}

uint64_t AMFDRDataCopy()
{
  return _AMFDRDataCopy();
}

uint64_t AMFDRDataCopyTrustObject()
{
  return _AMFDRDataCopyTrustObject();
}

uint64_t AMFDRDataCreatePermissionsString()
{
  return _AMFDRDataCreatePermissionsString();
}

uint64_t AMFDRDecodeFDR2Data()
{
  return _AMFDRDecodeFDR2Data();
}

uint64_t AMFDRPermissionsRequest()
{
  return _AMFDRPermissionsRequest();
}

uint64_t AMFDRSealingMapCopyInstanceForClass()
{
  return _AMFDRSealingMapCopyInstanceForClass();
}

uint64_t AMFDRSealingMapGetFDRDataVersionForDevice()
{
  return _AMFDRSealingMapGetFDRDataVersionForDevice();
}

uint64_t AMFDRSetOption()
{
  return _AMFDRSetOption();
}

uint64_t AMSupportCopyHexStringFromData()
{
  return _AMSupportCopyHexStringFromData();
}

uint64_t AMSupportCreateSetFromCFIndexArray()
{
  return _AMSupportCreateSetFromCFIndexArray();
}

uint64_t AMSupportHttpCopyProxySettings()
{
  return _AMSupportHttpCopyProxySettings();
}

uint64_t AMSupportHttpSendSync()
{
  return _AMSupportHttpSendSync();
}

uint64_t AMSupportLogDumpMemory()
{
  return _AMSupportLogDumpMemory();
}

uint64_t AMSupportLogInternal()
{
  return _AMSupportLogInternal();
}

uint64_t AMSupportLogSetHandler()
{
  return _AMSupportLogSetHandler();
}

uint64_t AMSupportSafeRelease()
{
  return _AMSupportSafeRelease();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return _CFDataCreateCopy(allocator, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return _CFHTTPMessageCopyAllHeaderFields(message);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return _CFHTTPMessageCreateRequest(alloc, requestMethod, url, httpVersion);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t Img4DecodeInit()
{
  return _Img4DecodeInit();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SavageUpdaterCreate()
{
  return _SavageUpdaterCreate();
}

uint64_t SavageUpdaterExecCommand()
{
  return _SavageUpdaterExecCommand();
}

uint64_t SavageUpdaterIsDone()
{
  return _SavageUpdaterIsDone();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

uint64_t ccder_blob_decode_len()
{
  return _ccder_blob_decode_len();
}

uint64_t ccder_blob_decode_range()
{
  return _ccder_blob_decode_range();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return _ccder_blob_decode_sequence_tl();
}

uint64_t ccder_blob_decode_tag()
{
  return _ccder_blob_decode_tag();
}

uint64_t ccder_blob_decode_tl()
{
  return _ccder_blob_decode_tl();
}

uint64_t ccder_blob_encode_body()
{
  return _ccder_blob_encode_body();
}

uint64_t ccder_blob_encode_tl()
{
  return _ccder_blob_encode_tl();
}

uint64_t ccder_sizeof()
{
  return _ccder_sizeof();
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccsha384_di()
{
  return _ccsha384_di();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

uint64_t handleForCategory()
{
  return _handleForCategory();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

void syslog(int a1, const char *a2, ...)
{
}

id objc_msgSend_FDRCAURL(void *a1, const char *a2, ...)
{
  return [a1 FDRCAURL];
}

id objc_msgSend_FDRDSURL(void *a1, const char *a2, ...)
{
  return [a1 FDRDSURL];
}

id objc_msgSend_SCPairURL(void *a1, const char *a2, ...)
{
  return [a1 SCPairURL];
}

id objc_msgSend_SHA256DigestData(void *a1, const char *a2, ...)
{
  return [a1 SHA256DigestData];
}

id objc_msgSend__createFDROptions(void *a1, const char *a2, ...)
{
  return [a1 _createFDROptions];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_convertToHexString(void *a1, const char *a2, ...)
{
  return [a1 convertToHexString];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detectCamera(void *a1, const char *a2, ...)
{
  return [a1 detectCamera];
}

id objc_msgSend_getDefaultAMAuthInstallRef(void *a1, const char *a2, ...)
{
  return [a1 getDefaultAMAuthInstallRef];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_rikKeyBlob(void *a1, const char *a2, ...)
{
  return [a1 rikKeyBlob];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_shouldPersonalizeWithSSOByDefault(void *a1, const char *a2, ...)
{
  return [a1 shouldPersonalizeWithSSOByDefault];
}

id objc_msgSend_skipScPairingTicket(void *a1, const char *a2, ...)
{
  return [a1 skipScPairingTicket];
}

id objc_msgSend_tatsuURL(void *a1, const char *a2, ...)
{
  return [a1 tatsuURL];
}

id objc_msgSend_trustObjectURL(void *a1, const char *a2, ...)
{
  return [a1 trustObjectURL];
}

id objc_msgSend_useAppleConnect(void *a1, const char *a2, ...)
{
  return [a1 useAppleConnect];
}

id objc_msgSend_verifyPSD2(void *a1, const char *a2, ...)
{
  return [a1 verifyPSD2];
}