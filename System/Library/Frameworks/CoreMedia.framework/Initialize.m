@interface Initialize
@end

@implementation Initialize

void __brokeredPlugin_Initialize_block_invoke(uint64_t a1)
{
}

void *__figMobileAsset_Initialize_block_invoke()
{
  fig_note_initialize_category_with_default_work_cf((uint64_t)&gFigMobileAssetTrace[1], @"mobileasset_trace", @"com.apple.coremedia", (uint64_t)", (uint64_t)"com.apple.coremedia"", 0, 0, gFigMobileAssetTrace);
  fig_note_initialize_category_with_default_work_cf((uint64_t)&dword_1E9272E18, @"mobileasset_trace", @"com.apple.coremedia", (uint64_t)", (uint64_t)"com.apple.coremedia"", 0, 0, &qword_1E9272E10);
  result = dlopen("/System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset", 4);
  sMobileAssetLib = (uint64_t)result;
  if (result)
  {
    sMAAssetClass = (uint64_t)objc_getClass("MAAsset");
    sMAAssetQueryClass = (uint64_t)objc_getClass("MAAssetQuery");
    result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
    gRegisteredAssetTypes = (uint64_t)result;
  }
  return result;
}

void __plugin_Initialize_block_invoke(uint64_t a1)
{
}

uint64_t __plugin_Initialize_block_invoke_2(uint64_t a1)
{
  v2 = *(const void **)(a1 + 40);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage((uint64_t)v2);
  v4 = *(uint64_t (**)(CFAllocatorRef, unint64_t *))(DerivedStorage + 56);
  CFAllocatorRef v5 = CFGetAllocator(v2);
  v6 = (unint64_t *)(DerivedStorage + 64);
  uint64_t result = v4(v5, v6);
  if (!result)
  {
    DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener(DefaultLocalCenter, v2, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))ActivatedEndpointsChangedNotificationCallback, @"EndpointManager_ActivatedEndpointsChanged", *v6);
    uint64_t result = PeruseActivatedEndpoints(v2);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __endpointCentricPlugin_Initialize_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    *(void *)(a1[6] + 64) = v2;
  }
  v3 = (const void *)a1[7];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage((uint64_t)v3);
  CFAllocatorRef v5 = *(uint64_t (**)(CFAllocatorRef, uint64_t))(DerivedStorage + 32);
  CFAllocatorRef v6 = CFGetAllocator(v3);
  v7 = (unint64_t *)(DerivedStorage + 40);
  int v8 = v5(v6, DerivedStorage + 40);
  if (!v8)
  {
    DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener(DefaultLocalCenter, v3, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))endpointCentricPlugin_ActivatedEndpointsChangedNotificationCallback, @"EndpointManager_ActivatedEndpointsChanged", *v7);
    endpointCentricPlugin_PeruseActivatedEndpoints((uint64_t)v3);
  }
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v8;
  v10 = (const void *)a1[7];

  CFRelease(v10);
}

@end