@interface ACSLocateAllCachingServers
@end

@implementation ACSLocateAllCachingServers

void ___ACSLocateAllCachingServers_block_invoke(uint64_t a1, uint64_t a2, CFArrayRef theArray, __CFError *Copy)
{
  CFArrayRef MutableCopy = theArray;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFArrayRef MutableCopy = CFArrayCreateMutableCopy(0, Count, MutableCopy);
  }
  if (Copy) {
    Copy = aclErrorCreateCopy(Copy);
  }
  v9 = qword_1EB6789F0;
  if (os_log_type_enabled((os_log_t)qword_1EB6789F0, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(_DWORD *)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 40);
    CFAbsoluteTime v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 67110658;
    int v19 = v10;
    __int16 v20 = 2080;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = a2;
    __int16 v24 = 2112;
    CFArrayRef v25 = MutableCopy;
    __int16 v26 = 2112;
    v27 = Copy;
    __int16 v28 = 2048;
    CFAbsoluteTime v29 = v12;
    __int16 v30 = 2048;
    uint64_t v31 = v13;
    _os_log_impl(&dword_1DD432000, v9, OS_LOG_TYPE_DEFAULT, "#%08x %s -> [%@] results %@, error %@, elapsed %.3f/%.3f", buf, 0x44u);
  }
  v14 = *(NSObject **)(a1 + 64);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 0x40000000;
  v16[2] = ___ACSLocateAllCachingServers_block_invoke_96;
  v16[3] = &unk_1E6CC3FD0;
  uint64_t v15 = *(void *)(a1 + 40);
  v16[4] = *(void *)(a1 + 32);
  v16[5] = MutableCopy;
  int v17 = *(_DWORD *)(a1 + 72);
  v16[6] = Copy;
  v16[7] = v15;
  v16[8] = v14;
  dispatch_async(v14, v16);
}

void ___ACSLocateAllCachingServers_block_invoke_96(uint64_t a1)
{
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    if (CFGetRetainCount(v2) != 1) {
      ___ACSLocateAllCachingServers_block_invoke_96_cold_2();
    }
    CFRetain(*(CFTypeRef *)(a1 + 40));
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    if (CFGetRetainCount(v3) != 1) {
      ___ACSLocateAllCachingServers_block_invoke_96_cold_1();
    }
    CFRetain(*(CFTypeRef *)(a1 + 48));
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    if (CFGetRetainCount(v4) <= 1) {
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 72), *(void *)(a1 + 56), (uint64_t)"results", *(void *)(a1 + 40));
    }
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  v5 = *(const void **)(a1 + 48);
  if (v5)
  {
    if (CFGetRetainCount(v5) <= 1) {
      _A_CALLBACK_BLOCK_RELEASED_AN_ASSETCACHESERVICES_OBJECT_IT_DID_NOT_OWN(*(_DWORD *)(a1 + 72), *(void *)(a1 + 56), (uint64_t)"error", *(void *)(a1 + 48));
    }
    CFRelease(*(CFTypeRef *)(a1 + 48));
    v6 = *(const void **)(a1 + 48);
    if (v6) {
      CFRelease(v6);
    }
  }
  v7 = *(const void **)(a1 + 40);
  if (v7) {
    CFRelease(v7);
  }
  v8 = *(NSObject **)(a1 + 64);

  dispatch_release(v8);
}

void ___ACSLocateAllCachingServers_block_invoke_96_cold_1()
{
  __assert_rtn("_ACSLocateAllCachingServers_block_invoke", "AssetCacheLocator.c", 1145, "CFGetRetainCount(error) == 1");
}

void ___ACSLocateAllCachingServers_block_invoke_96_cold_2()
{
  __assert_rtn("_ACSLocateAllCachingServers_block_invoke", "AssetCacheLocator.c", 1144, "CFGetRetainCount(results) == 1");
}

@end