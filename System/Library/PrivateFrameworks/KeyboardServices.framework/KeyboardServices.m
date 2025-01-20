void sub_22B2BD9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2BEAA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22B2BEF84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_22B2BF598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_22B2BF924(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

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

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
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

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

id KSCategory()
{
  if (KSCategory_onceToken != -1) {
    dispatch_once(&KSCategory_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)KSCategory_logFacility;
  return v0;
}

void sub_22B2C2D18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_22B2C50A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2C800C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (a2 == 1)
  {
    id v25 = objc_begin_catch(exception_object);
    v26 = KSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = [v25 reason];
      [v25 userInfo];
      objc_claimAutoreleasedReturnValue();
      -[_KSCloudKitManager copyFieldsFromRecord:toRecord:]();
    }

    objc_end_catch();
    JUMPOUT(0x22B2C7FC8);
  }
  _Unwind_Resume(exception_object);
}

void sub_22B2C86D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_22B2C97C4(_Unwind_Exception *a1)
{
}

id initCloudSettingsManager()
{
  if (CloudSettingsLibrary_frameworkLibrary
    || (CloudSettingsLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CloudSettings.framework/CloudSettings", 2)) != 0|| (NSLog(&cfstr_FailedToOpenFr.isa), CloudSettingsLibrary_frameworkLibrary))
  {
    classCloudSettingsManager = (uint64_t)objc_getClass("CloudSettingsManager");
    getCloudSettingsManagerClass = (uint64_t (*)())CloudSettingsManagerFunction;
    id v0 = (id)classCloudSettingsManager;
  }
  else
  {
    id v0 = 0;
  }
  return v0;
}

id CloudSettingsManagerFunction()
{
  return (id)classCloudSettingsManager;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x20u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void _handleKeyBagNotification(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 handleKeyBagLockNotification];
  }
}

void *initMKBDeviceUnlockedSinceBoot()
{
  result = MobileKeyBagLibrary();
  if (result)
  {
    uint64_t v1 = MobileKeyBagLibrary();
    id v2 = (uint64_t (*)())dlsym(v1, "MKBDeviceUnlockedSinceBoot");
    softLinkMKBDeviceUnlockedSinceBoot = v2;
    if (!v2)
    {
      NSLog(&cfstr_FailedToSoftli.isa);
      id v2 = softLinkMKBDeviceUnlockedSinceBoot;
    }
    return (void *)v2();
  }
  return result;
}

void *MobileKeyBagLibrary()
{
  result = (void *)MobileKeyBagLibrary_frameworkLibrary;
  if (!MobileKeyBagLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 2);
    MobileKeyBagLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
    {
      NSLog(&cfstr_FailedToOpenFr_0.isa);
      return (void *)MobileKeyBagLibrary_frameworkLibrary;
    }
  }
  return result;
}

uint64_t initMGCopyAnswer(uint64_t a1, uint64_t a2)
{
  if (MobileGestaltLibrary_sOnce != -1) {
    dispatch_once(&MobileGestaltLibrary_sOnce, &__block_literal_global_45);
  }
  if (!MobileGestaltLibrary_sLib) {
    return 0;
  }
  uint64_t v4 = (uint64_t (*)())dlsym((void *)MobileGestaltLibrary_sLib, "MGCopyAnswer");
  softLinkMGCopyAnswer = v4;
  if (!v4)
  {
    NSLog(&cfstr_FailedToSoftli_0.isa);
    uint64_t v4 = softLinkMGCopyAnswer;
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

void __MobileGestaltLibrary_block_invoke()
{
  MobileGestaltLibrary_sLib = (uint64_t)dlopen("/usr/lib//libMobileGestalt.dylib", 2);
  if (!MobileGestaltLibrary_sLib) {
    NSLog(&cfstr_FailedToSoftli_1.isa);
  }
}

uint64_t initMGGetBoolAnswer(uint64_t a1)
{
  if (MobileGestaltLibrary_sOnce != -1) {
    dispatch_once(&MobileGestaltLibrary_sOnce, &__block_literal_global_45);
  }
  if (!MobileGestaltLibrary_sLib) {
    return 0;
  }
  id v2 = (uint64_t (*)())dlsym((void *)MobileGestaltLibrary_sLib, "MGGetBoolAnswer");
  softLinkMGGetBoolAnswer = v2;
  if (!v2)
  {
    NSLog(&cfstr_FailedToSoftli_2.isa);
    id v2 = softLinkMGGetBoolAnswer;
  }
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void __KSCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.KeyboardServices", "KeyboardServices");
  uint64_t v1 = (void *)KSCategory_logFacility;
  KSCategory_logFacility = (uint64_t)v0;
}

id _homeDirectory()
{
  if (_homeDirectory_once_token != -1) {
    dispatch_once(&_homeDirectory_once_token, &__block_literal_global_65);
  }
  os_log_t v0 = (void *)_homeDirectory_directory;
  return v0;
}

void ___homeDirectory_block_invoke()
{
  uint64_t v0 = softLinkCPSharedResourcesDirectory();
  uint64_t v1 = (void *)_homeDirectory_directory;
  _homeDirectory_directory = v0;
}

void *initCPSharedResourcesDirectory()
{
  result = AppSupportLibrary();
  if (result)
  {
    uint64_t v1 = AppSupportLibrary();
    id v2 = (uint64_t (*)())dlsym(v1, "CPSharedResourcesDirectory");
    softLinkCPSharedResourcesDirectory = v2;
    if (!v2)
    {
      NSLog(&cfstr_FailedToSoftli_3.isa);
      id v2 = softLinkCPSharedResourcesDirectory;
    }
    return (void *)v2();
  }
  return result;
}

void *AppSupportLibrary()
{
  result = (void *)AppSupportLibrary_frameworkLibrary;
  if (!AppSupportLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/PrivateFrameworks/AppSupport.framework/AppSupport", 2);
    AppSupportLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
    {
      NSLog(&cfstr_FailedToOpenFr_1.isa);
      return (void *)AppSupportLibrary_frameworkLibrary;
    }
  }
  return result;
}

void sub_22B2CB76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2CC850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_22B2CD3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2CD9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2CDB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2CE398(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22B2CEA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _KSGetSetting(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  +[_KSTextReplacementHelper fetchConfigurationPlistIfNeeded];
  id v5 = objc_alloc(MEMORY[0x263EFFA40]);
  v6 = +[_KSUtilities userDefaultsSuiteName];
  v7 = (void *)[v5 initWithSuiteName:v6];
  v8 = [v7 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v3;
  }
  id v10 = v9;

  return v10;
}

ssize_t WritePadding(ssize_t __fd, uint64_t a2)
{
  __buf[2] = *MEMORY[0x263EF8340];
  unint64_t v2 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v3 = v2 - a2;
  if (v2 != a2)
  {
    int v4 = __fd;
    __buf[0] = 0;
    __buf[1] = 0;
    do
    {
      if (v3 >= 0x10) {
        size_t v5 = 16;
      }
      else {
        size_t v5 = v3;
      }
      __fd = write(v4, __buf, v5);
      v3 -= v5;
    }
    while (v3);
  }
  return __fd;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_22B2D2148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2D2350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  objc_destroyWeak(v18);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak((id *)(v19 - 40));
  _Unwind_Resume(a1);
}

void sub_22B2D2E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B2D325C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_22B2D3544(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22B2D390C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_22B2D3C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2D3F90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_22B2D47CC(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v4 = objc_begin_catch(exception_object);
    size_t v5 = KSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[_KSUserWordsInfo filesForLanguage:v5];
    }

    objc_end_catch();
    JUMPOUT(0x22B2D477CLL);
  }
  _Unwind_Resume(exception_object);
}

id FindEntry(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  size_t v5 = [v3 name];
  int v6 = [v5 hasSuffix:v4];

  if (v6)
  {
    id v7 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __FindEntry_block_invoke;
      v9[3] = &unk_264891668;
      id v10 = v4;
      id v7 = [v3 findEntryWithComparison:v9 recursively:0];
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

uint64_t __FindEntry_block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasSuffix:*(void *)(a1 + 32)];
}

id _KSTextReplacementServerInterface()
{
  v4[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DE95EB0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  uint64_t v2 = [MEMORY[0x263EFFA08] setWithArray:v1];
  [v0 setClasses:v2 forSelector:sel_addEntries_removeEntries_withReply_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v2 forSelector:sel_addEntries_removeEntries_withReply_ argumentIndex:1 ofReply:0];
  [v0 setClasses:v2 forSelector:sel_addEntries_removeEntries_withReply_ argumentIndex:1 ofReply:1];
  [v0 setClasses:v2 forSelector:sel_cancelPendingUpdatesWithReply_ argumentIndex:1 ofReply:1];
  [v0 setClasses:v2 forSelector:sel_queryTextReplacementEntriesWithReply_ argumentIndex:0 ofReply:1];
  [v0 setClasses:v2 forSelector:sel_queryTextReplacementsWithPredicate_reply_ argumentIndex:0 ofReply:0];
  [v0 setClasses:v2 forSelector:sel_queryTextReplacementsWithPredicate_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_22B2D5C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_22B2D6E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2D7C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B2D80D0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_22B2D8A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2D8DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2D9F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2DA1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2DAAF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  objc_destroyWeak(v31);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v32 - 240), 8);
  _Block_object_dispose((const void *)(v32 - 192), 8);
  objc_destroyWeak((id *)(v32 - 144));
  _Unwind_Resume(a1);
}

void sub_22B2DAE10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22B2DCB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v33);
  _Block_object_dispose(&a20, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v34 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_22B2DDEEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22B2DE230(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *initBRDaemonConnectionInvalidate()
{
  result = CloudDocsLibrary();
  if (result)
  {
    uint64_t v1 = CloudDocsLibrary();
    uint64_t v2 = (uint64_t (*)())dlsym(v1, "BRDaemonConnectionInvalidate");
    softLinkBRDaemonConnectionInvalidate = v2;
    if (!v2)
    {
      NSLog(&cfstr_FailedToSoftli_4.isa);
      uint64_t v2 = softLinkBRDaemonConnectionInvalidate;
    }
    return (void *)v2();
  }
  return result;
}

void *CloudDocsLibrary()
{
  result = (void *)CloudDocsLibrary_frameworkLibrary;
  if (!CloudDocsLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 2);
    CloudDocsLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
    {
      NSLog(&cfstr_FailedToOpenFr_2.isa);
      return (void *)CloudDocsLibrary_frameworkLibrary;
    }
  }
  return result;
}

void bySetupAssistantExited(__CFNotificationCenter *a1, void *a2, const __CFString *a3)
{
  id v5 = a2;
  CFNotificationCenterRemoveObserver(a1, v5, a3, 0);
  [v5 buddySetupDidFinish];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"_KSTIBuddySetupDidFinishNotification_Private" object:0];
}

void sub_22B2E0854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B2E127C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22B2E14D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id initBYSetupAssistantExitedDarwinNotification()
{
  id v0 = SetupAssistantLibrary();
  if (v0)
  {
    uint64_t v1 = SetupAssistantLibrary();
    uint64_t v2 = (id *)dlsym(v1, "BYSetupAssistantExitedDarwinNotification");
    objc_storeStrong((id *)&constantBYSetupAssistantExitedDarwinNotification, *v2);
    getBYSetupAssistantExitedDarwinNotification = (uint64_t (*)())BYSetupAssistantExitedDarwinNotificationFunction;
    id v0 = (id)constantBYSetupAssistantExitedDarwinNotification;
  }
  return v0;
}

void *SetupAssistantLibrary()
{
  result = (void *)SetupAssistantLibrary_frameworkLibrary;
  if (!SetupAssistantLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant", 2);
    SetupAssistantLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
    {
      NSLog(&cfstr_FailedToOpenFr_3.isa);
      return (void *)SetupAssistantLibrary_frameworkLibrary;
    }
  }
  return result;
}

id BYSetupAssistantExitedDarwinNotificationFunction()
{
  return (id)constantBYSetupAssistantExitedDarwinNotification;
}

void *initBYSetupAssistantNeedsToRun()
{
  result = SetupAssistantLibrary();
  if (result)
  {
    uint64_t v1 = SetupAssistantLibrary();
    uint64_t v2 = (uint64_t (*)())dlsym(v1, "BYSetupAssistantNeedsToRun");
    softLinkBYSetupAssistantNeedsToRun = v2;
    if (!v2)
    {
      NSLog(&cfstr_FailedToSoftli_5.isa);
      uint64_t v2 = softLinkBYSetupAssistantNeedsToRun;
    }
    return (void *)v2();
  }
  return result;
}

uint64_t _IsEnabled()
{
  id v0 = _KSGetSetting(ksDefaultEnabled, MEMORY[0x263EFFA88]);
  uint64_t v1 = [v0 BOOLValue];

  return v1;
}

void sub_22B2E4F14(_Unwind_Exception *a1)
{
}

void sub_22B2E52AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t initMGCopyAnswer_0(uint64_t a1, uint64_t a2)
{
  if (MobileGestaltLibrary_sOnce_0 != -1) {
    dispatch_once(&MobileGestaltLibrary_sOnce_0, &__block_literal_global_269);
  }
  if (!MobileGestaltLibrary_sLib_0) {
    return 0;
  }
  id v4 = (uint64_t (*)())dlsym((void *)MobileGestaltLibrary_sLib_0, "MGCopyAnswer");
  softLinkMGCopyAnswer_0 = v4;
  if (!v4)
  {
    NSLog(&cfstr_FailedToSoftli_0.isa);
    id v4 = softLinkMGCopyAnswer_0;
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

void __MobileGestaltLibrary_block_invoke_0()
{
  MobileGestaltLibrary_sLib_0 = (uint64_t)dlopen("/usr/lib//libMobileGestalt.dylib", 2);
  if (!MobileGestaltLibrary_sLib_0) {
    NSLog(&cfstr_FailedToSoftli_1.isa);
  }
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x270F18C60]();
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x270F4AE00]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_suspend(dispatch_object_t object)
{
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

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x270EDA080](path, namebuff, size, *(void *)&options);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
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

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x270EDADB0]();
}

uint64_t proc_set_cpumon_params()
{
  return MEMORY[0x270EDADB8]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x270F99970]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x270F99990]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x270EDBDD8](value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}