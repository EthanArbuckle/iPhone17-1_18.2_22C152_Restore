void sub_1B8E4CFEC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

unint64_t CHHash(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10)
{
  if (result)
  {
    unint64_t v10 = result;
    v13 = &a10;
    result = a9;
    if (v10 != 1)
    {
      for (unint64_t i = 2; i <= v10; ++i)
      {
        v12 = v13++;
        result ^= __ROR8__(*v12, -(0x40 / i));
      }
    }
  }
  return result;
}

void sub_1B8E5491C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t __CHGetRootVersionString_block_invoke()
{
  CHGetRootVersionString_version = objc_msgSend(NSString, "stringWithFormat:", @"%s%s", "CallHistory-", "55.300.181.2.10");
  return MEMORY[0x1F41817F8]();
}

void sub_1B8E54DC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B8E55114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E55344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E554C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E555E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E55760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E5592C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B8E55B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B8E55EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_1B8E56188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getMobileUserLibraryDirectoryPath()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/var/mobile" isDirectory:1];
  uint64_t v1 = [v0 URLByAppendingPathComponent:@"Library"];

  return v1;
}

uint64_t getDBDirCreateOptions()
{
  return objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F28378], *MEMORY[0x1E4F28370], 0);
}

uint64_t createDirectoryAtPath(void *a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = *MEMORY[0x1E4F1C628];
  v20[0] = *MEMORY[0x1E4F1C628];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v19 = 0;
  v7 = [v3 resourceValuesForKeys:v6 error:&v19];
  id v8 = v19;

  if (v7)
  {
    v9 = [v7 objectForKeyedSubscript:v5];
    char v10 = [v9 BOOLValue];

    if (v10)
    {
      uint64_t v11 = 1;
      goto LABEL_11;
    }
    v16 = +[CHLogServer sharedInstance];
    v15 = [v16 logHandleForDomain:"SharedUtilities"];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      createDirectoryAtPath_cold_2((uint64_t)v3, v15);
    }
LABEL_10:

    uint64_t v11 = 0;
    goto LABEL_11;
  }
  if ([v8 code] != 260) {
    goto LABEL_6;
  }

  v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v18 = 0;
  uint64_t v11 = 1;
  char v13 = [v12 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:v4 error:&v18];
  id v8 = v18;

  if ((v13 & 1) == 0)
  {
LABEL_6:
    v14 = +[CHLogServer sharedInstance];
    v15 = [v14 logHandleForDomain:"SharedUtilities"];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      createDirectoryAtPath_cold_1((uint64_t)v3, (uint64_t)v8, v15);
    }
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

void sub_1B8E5784C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *getBoolAsString(int a1)
{
  if (a1) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

void sub_1B8E57B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void maybeLogVersionInfo()
{
  if (maybeLogVersionInfo_sLogVersion != -1) {
    dispatch_once(&maybeLogVersionInfo_sLogVersion, &__block_literal_global_13);
  }
}

void sub_1B8E591F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1B8E59CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void __maybeLogVersionInfo_block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = +[CHLogServer sharedInstance];
  uint64_t v1 = [v0 logHandleForDomain:"SharedUtilities"];

  uint64_t v2 = v1;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    char v13 = (char *)MGCopyAnswer();
    id v3 = v13;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "OS version:     %{public}@", (uint8_t *)&v12, 0xCu);
  }
  id v4 = +[CHLogServer sharedInstance];
  uint64_t v5 = [v4 logHandleForDomain:"SharedUtilities"];

  v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CHGetRootVersionString();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    int v12 = 138543362;
    char v13 = v7;
    _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "Version:        %{public}@", (uint8_t *)&v12, 0xCu);
  }
  id v8 = +[CHLogServer sharedInstance];
  v9 = [v8 logHandleForDomain:"SharedUtilities"];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446210;
    char v13 = "55.300.181.2.10~12";
    _os_log_impl(&dword_1B8E4A000, v9, OS_LOG_TYPE_DEFAULT, "Build revision: %{public}s", (uint8_t *)&v12, 0xCu);
  }

  char v10 = +[CHLogServer sharedInstance];
  uint64_t v11 = [v10 logHandleForDomain:"SharedUtilities"];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446210;
    char v13 = "stock";
    _os_log_impl(&dword_1B8E4A000, v11, OS_LOG_TYPE_DEFAULT, "Build reason:   %{public}s", (uint8_t *)&v12, 0xCu);
  }
}

id CHGetRootVersionString()
{
  if (CHGetRootVersionString_sOnce != -1) {
    dispatch_once(&CHGetRootVersionString_sOnce, &__block_literal_global_7);
  }
  v0 = (void *)CHGetRootVersionString_version;
  return v0;
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

void sub_1B8E5B9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1B8E61A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getNPSManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __NanoPreferencesSyncLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E61C75D8;
    uint64_t v6 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("NPSManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getNPSManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNPSManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *getBootUpResultAsString(unsigned int a1)
{
  if (a1 > 2) {
    return @"Undefined";
  }
  else {
    return off_1E61C75F0[(char)a1];
  }
}

void sub_1B8E6285C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1B8E62940(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B8E62A04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B8E62FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B8E63224(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id ch_allEmails_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 emailAddresses];
  uint64_t v3 = [v2 arrayByApplyingSelector:sel_value];

  return v3;
}

id ch_allPhoneNumbers_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 phoneNumbers];
  uint64_t v3 = [v2 arrayByApplyingSelector:sel_value];
  id v4 = [v3 arrayByApplyingSelector:sel_stringValue];

  return v4;
}

id ch_allPhoneNumberLastFourDigits_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 phoneNumbers];
  uint64_t v3 = [v2 arrayByApplyingSelector:sel_value];
  id v4 = [v3 arrayByApplyingSelector:sel_lastFourDigits];

  return v4;
}

__CFString *getCHNotifyDataStoreChangeReasonAsString(unsigned int a1)
{
  if (a1 > 3) {
    return @"Undefined";
  }
  else {
    return off_1E61C76C0[(char)a1];
  }
}

void sub_1B8E63964(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t ch_framework_log()
{
  if (ch_framework_log_onceToken != -1) {
    dispatch_once(&ch_framework_log_onceToken, &__block_literal_global_6);
  }
  return ch_framework_log_sLog;
}

os_log_t __ch_framework_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.callhistory", "CallHistory.framework");
  ch_framework_log_sLog = (uint64_t)result;
  return result;
}

uint64_t ch_security_log()
{
  if (ch_security_log_onceToken != -1) {
    dispatch_once(&ch_security_log_onceToken, &__block_literal_global_5);
  }
  return ch_security_log_sLog;
}

os_log_t __ch_security_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.callhistory", "Security");
  ch_security_log_sLog = (uint64_t)result;
  return result;
}

void sub_1B8E647A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CoreDuetLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!CoreDuetLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __CoreDuetLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E61C7720;
    uint64_t v3 = 0;
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!CoreDuetLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CoreDuetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreDuetLibraryCore_frameworkLibrary = result;
  return result;
}

id CHPhoneNumberNormalizedPhoneNumberString(uint64_t a1, void *a2)
{
  id v2 = a2;
  CFStringRef v3 = (const __CFString *)_PNCopyStrippedNumberWithoutPauses();
  if (v3)
  {
    CFStringRef v4 = v3;
    if (CFStringGetLength(v3) < 1)
    {
      String = 0;
    }
    else
    {
      uint64_t v5 = CFPhoneNumberCreate();
      if (!v5 || (uint64_t v6 = (const void *)v5, String = (void *)CFPhoneNumberCreateString(), CFRelease(v6), !String))
      {
        CFRetain(v4);
        String = (void *)v4;
      }
    }
    CFRelease(v4);
  }
  else
  {
    String = 0;
  }

  return String;
}

void sub_1B8E65714(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B8E6579C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B8E65928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1B8E670D4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B8E6A36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E6A9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E6AB98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E6AD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E6B2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E6B4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E6BA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_1B8E6BDF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E6C088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E6C36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *CHGetDataStoreFileExtension()
{
  return @"storedata";
}

id CHGetUserCallHistoryDataStoreDirectoryURL()
{
  if (CHGetUserCallHistoryDataStoreDirectoryURL_onceToken != -1) {
    dispatch_once(&CHGetUserCallHistoryDataStoreDirectoryURL_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)CHGetUserCallHistoryDataStoreDirectoryURL_sDirectoryURL;
  return v0;
}

void __CHGetUserCallHistoryDataStoreDirectoryURL_block_invoke()
{
  if (__CHGetUserLibraryDirectoryURL_onceToken != -1) {
    dispatch_once(&__CHGetUserLibraryDirectoryURL_onceToken, &__block_literal_global_19);
  }
  id v2 = (id)__CHGetUserLibraryDirectoryURL_sDirectoryURL;
  uint64_t v0 = [v2 URLByAppendingPathComponent:@"CallHistoryDB" isDirectory:1];
  uint64_t v1 = (void *)CHGetUserCallHistoryDataStoreDirectoryURL_sDirectoryURL;
  CHGetUserCallHistoryDataStoreDirectoryURL_sDirectoryURL = v0;
}

id CHGetUserCallHistoryDataStoreClassCFileURL()
{
  if (CHGetUserCallHistoryDataStoreClassCFileURL_onceToken != -1) {
    dispatch_once(&CHGetUserCallHistoryDataStoreClassCFileURL_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)CHGetUserCallHistoryDataStoreClassCFileURL_sFileURL;
  return v0;
}

void __CHGetUserCallHistoryDataStoreClassCFileURL_block_invoke()
{
  CHGetUserCallHistoryDataStoreDirectoryURL();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 URLByAppendingPathComponent:@"CallHistory.storedata" isDirectory:0];
  uint64_t v1 = (void *)CHGetUserCallHistoryDataStoreClassCFileURL_sFileURL;
  CHGetUserCallHistoryDataStoreClassCFileURL_sFileURL = v0;
}

id CHGetUserCallHistoryDataStoreClassDFileURL()
{
  if (CHGetUserCallHistoryDataStoreClassDFileURL_onceToken != -1) {
    dispatch_once(&CHGetUserCallHistoryDataStoreClassDFileURL_onceToken, &__block_literal_global_17);
  }
  uint64_t v0 = (void *)CHGetUserCallHistoryDataStoreClassDFileURL_sFileURL;
  return v0;
}

void __CHGetUserCallHistoryDataStoreClassDFileURL_block_invoke()
{
  CHGetUserCallHistoryDataStoreDirectoryURL();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 URLByAppendingPathComponent:@"CallHistoryTemp.storedata" isDirectory:0];
  uint64_t v1 = (void *)CHGetUserCallHistoryDataStoreClassDFileURL_sFileURL;
  CHGetUserCallHistoryDataStoreClassDFileURL_sFileURL = v0;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

__CFString *getDBMErrorCodeAsString(unint64_t a1)
{
  if (a1 > 4) {
    return @"undefined";
  }
  else {
    return off_1E61C7C40[a1];
  }
}

void sub_1B8E73258(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
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

void sub_1B8E7348C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E73618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E73938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B8E75480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

id DeserializeTransactions(void *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v8 = [v7 record];
        uint64_t v9 = [v7 record];
        id v24 = 0;
        uint64_t v10 = +[CHRecentCall unarchivedObjectFromData:v9 error:&v24];
        id v11 = v24;

        if (v10)
        {
          unint64_t v12 = [v7 transactionType];
          char v13 = [v10 uniqueId];

          if (v13)
          {
            if (v12 <= 2)
            {
              uint64_t v14 = [[DeserializedTransaction alloc] initWithCall:v10 andType:v12];
              [v23 addObject:v14];
              goto LABEL_17;
            }
            v20 = +[CHLogServer sharedInstance];
            v21 = [v20 logHandleForDomain:"intent"];

            uint64_t v14 = v21;
            if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR)) {
              DeserializeTransactions_cold_1(v33, v12, &v34, &v14->super);
            }
          }
          else
          {
            v16 = +[CHLogServer sharedInstance];
            v17 = [v16 logHandleForDomain:"intent"];

            uint64_t v14 = v17;
            if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
            {
              id v18 = +[CHTransaction toString:v12];
              id v19 = [v10 remoteParticipantHandles];
              *(_DWORD *)buf = 138543618;
              v30 = v18;
              __int16 v31 = 2112;
              id v32 = v19;
              _os_log_impl(&dword_1B8E4A000, &v14->super, OS_LOG_TYPE_DEFAULT, "Dropping %{public}@ transaction for recent call with remote participant handles %@ since it has a nil unique ID", buf, 0x16u);
            }
          }
        }
        else
        {
          v15 = +[CHLogServer sharedInstance];
          uint64_t v14 = [v15 logHandleForDomain:"intent"];

          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v8;
            __int16 v31 = 2114;
            id v32 = v11;
            _os_log_error_impl(&dword_1B8E4A000, &v14->super, OS_LOG_TYPE_ERROR, "Failing to unarchive the specified value: %{public}@ %{public}@", buf, 0x16u);
          }
        }
LABEL_17:
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v4);
  }

  return v23;
}

void HandleInteractionsForDeserializedTransactions(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "type", (void)v15);
        if (v12 == 2)
        {
          char v13 = [v11 call];
          uint64_t v14 = [v13 uniqueId];
          [v5 addObject:v14];
        }
        else
        {
          if (v12) {
            continue;
          }
          char v13 = [v11 call];
          [v4 donateCallHistoryInteractionWithCall:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [v4 deleteInteractionWithCalls:v5];
}

void sub_1B8E7AC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getSharedGEOPhoneNumberResolver()
{
  if (getSharedGEOPhoneNumberResolver_onceToken != -1) {
    dispatch_once(&getSharedGEOPhoneNumberResolver_onceToken, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)getSharedGEOPhoneNumberResolver_instance;
  return v0;
}

uint64_t __getSharedGEOPhoneNumberResolver_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F64820]);
  uint64_t v1 = getSharedGEOPhoneNumberResolver_instance;
  getSharedGEOPhoneNumberResolver_instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1B8E7CA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
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

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1B8E7F9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1B8E7FB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void notifyClientsOfEvent(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = +[CHLogServer sharedInstance];
  id v6 = [v5 logHandleForDomain:"SharedUtilities"];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = v3;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "Firing %{public}@ notification: %{public}@", buf, 0x16u);
  }

  uint64_t v7 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __notifyClientsOfEvent_block_invoke;
  v10[3] = &unk_1E61C7568;
  id v11 = v3;
  id v12 = v4;
  id v8 = v4;
  id v9 = v3;
  dispatch_async(v7, v10);
}

void __notifyClientsOfEvent_block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:0 userInfo:*(void *)(a1 + 40)];
}

id getLoggedInUserName()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  size_t v0 = sysconf(71);
  uint64_t v1 = (char *)&v7 - ((MEMORY[0x1F4188790]() + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(&v9, 0, sizeof(v9));
  id v8 = 0;
  uid_t v2 = getuid();
  int v3 = getpwuid_r(v2, &v9, v1, v0, &v8);
  id v4 = 0;
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v8 == 0;
  }
  if (!v5)
  {
    id v4 = [NSString stringWithUTF8String:v9.pw_name];
  }
  return v4;
}

__CFString *getDBLErrorCodeAsString(unsigned int a1)
{
  if (a1 > 2) {
    return @"undefined";
  }
  else {
    return off_1E61C8208[(char)a1];
  }
}

uint64_t getOperatingSystemVersion()
{
  return MGCopyAnswer();
}

id maybeAppendStringWithSeparator(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length])
  {
    BOOL v5 = [v3 stringByAppendingString:@", "];

    id v6 = [v5 stringByAppendingString:v4];

    id v3 = v6;
  }
  else
  {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

id getMobileUserDirectoryPath()
{
  size_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/var/mobile" isDirectory:1];
  return v0;
}

uint64_t isInternalBuild()
{
  if (_QueryBuildInformation_once != -1) {
    dispatch_once(&_QueryBuildInformation_once, &__block_literal_global_73);
  }
  return _IsInternalBuildCached;
}

uint64_t isCarrierBuild()
{
  if (_QueryBuildInformation_once != -1) {
    dispatch_once(&_QueryBuildInformation_once, &__block_literal_global_73);
  }
  return _IsCarrierBuildCached;
}

uint64_t createBackgroundTaskAssertion()
{
  uint64_t v0 = getpid();
  return MEMORY[0x1F415C3B8](0, v0, 1, 4, @"com.apple.callhistory.save");
}

uint64_t CHSchemaGetCurrentVersion()
{
  return 37;
}

__CFString *CHCallerIdAvailabilityAsString(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E61C83E8[a1];
  }
}

void sub_1B8E82550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __getCNContactFetchRequestClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CNContactFetchRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNContactFetchRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNContactFetchRequestClass_block_invoke_cold_1();
    ContactsLibrary();
  }
}

void ContactsLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __ContactsLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E61C8478;
    uint64_t v3 = 0;
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ContactsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContactsLibraryCore_frameworkLibrary = result;
  return result;
}

WatchDogTimer *__getCNContactClass_block_invoke(uint64_t a1)
{
  ContactsLibrary();
  uint64_t result = (WatchDogTimer *)objc_getClass("CNContact");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCNContactClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (WatchDogTimer *)__getCNContactClass_block_invoke_cold_1();
    return [(WatchDogTimer *)v3 initWithQueue:v5 withName:v6 withTimeout:v8 withCallback:v7];
  }
  return result;
}

void sub_1B8E83178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
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

void sub_1B8E8353C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void __getNPSManagerClass_block_invoke_cold_1()
{
}

void DeserializeTransactions_cold_1(uint8_t *a1, uint64_t a2, void *a3, NSObject *a4)
{
  id v7 = +[CHTransaction toString:a2];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1B8E4A000, a4, OS_LOG_TYPE_ERROR, "Transaction type %{public}@ not supported (yet)", a1, 0xCu);
}

void createDirectoryAtPath_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_ERROR, "CallHistory: Directory creation failed at location %{public}@ error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void createDirectoryAtPath_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B8E4A000, a2, OS_LOG_TYPE_ERROR, "CallHistory: Expected a directory at location %{public}@ but found a file", (uint8_t *)&v2, 0xCu);
}

uint64_t __getCNContactFetchRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCNContactClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[EncryptionTransformer transformedValue:](v0);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1F40D77B8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1F4114220]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1F4114228]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x1F417CDF8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return MEMORY[0x1F4114238]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _PNCopyStrippedNumberWithoutPauses()
{
  return MEMORY[0x1F4114298]();
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
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint64_t ct_green_tea_logger_create_static()
{
  return MEMORY[0x1F417A380]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
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
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1F417A398]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CC4F0](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
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

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}