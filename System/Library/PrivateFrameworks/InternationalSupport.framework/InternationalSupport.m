void sub_1E4211070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void wifidDidBecomeAlive(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __wifidDidBecomeAlive_block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a3;
  v3[5] = a2;
  if (wifidDidBecomeAlive_onceToken != -1) {
    dispatch_once(&wifidDidBecomeAlive_onceToken, v3);
  }
}

void sub_1E4211314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E421157C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t scanComplete(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  return [a4 _scanComplete:a2 error:a3 != 0];
}

void sub_1E4211A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_1E4211B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getWiFiManagerClientCreateSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MobileWiFiLibrary();
  result = dlsym(v2, "WiFiManagerClientCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileWiFiLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MobileWiFiLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MobileWiFiLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6E3C320;
    uint64_t v5 = 0;
    MobileWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MobileWiFiLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!MobileWiFiLibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __MobileWiFiLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileWiFiLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getWiFiManagerClientScheduleWithRunLoopSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiManagerClientScheduleWithRunLoop");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientScheduleWithRunLoopSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getWiFiManagerClientRegisterDeviceAttachmentCallbackSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiManagerClientRegisterDeviceAttachmentCallback");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientRegisterDeviceAttachmentCallbackSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                               + 8)
                                                                                   + 24);
  return result;
}

uint64_t __wifidDidBecomeAlive_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scanWifiListWithDevice:*(void *)(a1 + 40)];
}

void *__getWiFiManagerClientCopyDevicesSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiManagerClientCopyDevices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientCopyDevicesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getWiFiDeviceClientGetTypeIDSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiDeviceClientGetTypeID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiDeviceClientGetTypeIDSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getWiFiDeviceClientScanAsyncSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiDeviceClientScanAsync");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiDeviceClientScanAsyncSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getWiFiNetworkGet11dCountryCodeFromIeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiNetworkGet11dCountryCodeFromIe");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiNetworkGet11dCountryCodeFromIeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MobileWiFiLibrary();
  uint64_t result = dlsym(v2, "WiFiManagerClientUnscheduleFromRunLoop");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWiFiManagerClientUnscheduleFromRunLoopSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ISEnumerateKnownUrduSequencesInString(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (_knownUrduWords___onceToken != -1) {
    dispatch_once(&_knownUrduWords___onceToken, &__block_literal_global_0);
  }
  id v8 = (id)_knownUrduWords___knownWords;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __ISEnumerateKnownUrduSequencesInString_block_invoke;
  v11[3] = &unk_1E6E3C3F8;
  id v12 = v8;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", a2, a3, 3, v11);
}

uint64_t __ISEnumerateKnownUrduSequencesInString_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    long long v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  return result;
}

uint64_t ___knownUrduWords_block_invoke()
{
  _knownUrduWords___knownWords = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3FC55D8];

  return MEMORY[0x1F41817F8]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1F40CD2B0]();
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

uint64_t ualoc_getAppleParent()
{
  return MEMORY[0x1F417F8F8]();
}

uint64_t ualoc_getLanguagesForRegion()
{
  return MEMORY[0x1F417F900]();
}

uint64_t ualoc_getRegionsForLanguage()
{
  return MEMORY[0x1F417F908]();
}

uint64_t uenum_close()
{
  return MEMORY[0x1F417FFD8]();
}

uint64_t uenum_next()
{
  return MEMORY[0x1F417FFE8]();
}

void uidna_close(UIDNA *idna)
{
}

int32_t uidna_labelToASCII(const UIDNA *idna, const UChar *label, int32_t length, UChar *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1F4180040](idna, label, *(void *)&length, dest, *(void *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x1F4180068](*(void *)&options, pErrorCode);
}

uint64_t uldn_close()
{
  return MEMORY[0x1F4180088]();
}

uint64_t uldn_localeDisplayName()
{
  return MEMORY[0x1F41800A0]();
}

uint64_t uldn_openForContext()
{
  return MEMORY[0x1F41800B0]();
}

uint64_t uldn_regionDisplayName()
{
  return MEMORY[0x1F41800B8]();
}

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x1F4180108]();
}

uint64_t uloc_minimizeSubtags()
{
  return MEMORY[0x1F41801B8]();
}

uint64_t unumsys_close()
{
  return MEMORY[0x1F41803D0]();
}

uint64_t unumsys_getName()
{
  return MEMORY[0x1F41803E0]();
}

uint64_t unumsys_getRadix()
{
  return MEMORY[0x1F41803E8]();
}

uint64_t unumsys_isAlgorithmic()
{
  return MEMORY[0x1F41803F0]();
}

uint64_t unumsys_open()
{
  return MEMORY[0x1F41803F8]();
}

uint64_t uregion_getAvailable()
{
  return MEMORY[0x1F4180530]();
}

uint64_t uregion_getContainingRegion()
{
  return MEMORY[0x1F4180540]();
}

uint64_t uregion_getContainingRegionOfType()
{
  return MEMORY[0x1F4180548]();
}

uint64_t uregion_getRegionCode()
{
  return MEMORY[0x1F4180550]();
}

uint64_t uregion_getRegionFromCode()
{
  return MEMORY[0x1F4180558]();
}