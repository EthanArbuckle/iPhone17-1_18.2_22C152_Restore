@interface FigRouteDiscoveryManagerCopyRoutePresentForType
@end

@implementation FigRouteDiscoveryManagerCopyRoutePresentForType

CFArrayRef __FigRouteDiscoveryManagerCopyRoutePresentForType_block_invoke(void *a1)
{
  CFIndex v2 = 0;
  uint64_t v3 = *MEMORY[0x1E4F20610];
  uint64_t v4 = *MEMORY[0x1E4F1CF80];
  uint64_t v5 = *MEMORY[0x1E4F1CFD0];
  while (1)
  {
    CFArrayRef result = *(const __CFArray **)(a1[5] + 240);
    if (result) {
      CFArrayRef result = (const __CFArray *)CFArrayGetCount(result);
    }
    if (v2 >= (uint64_t)result) {
      break;
    }
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[5] + 240), v2);
    CFDictionaryGetValue(ValueAtIndex, @"EndpointManager_SupportedEndpointFeaturesKey");
    if ((a1[6] & FigCFNumberGetUInt64()) != 0)
    {
      if (CFDictionaryGetValue(ValueAtIndex, @"EndpointManager_RefKey"))
      {
        uint64_t v8 = *(void *)(a1[4] + 8);
        uint64_t CMBaseObject = FigEndpointManagerGetCMBaseObject();
        uint64_t VTable = CMBaseObjectGetVTable();
        uint64_t v12 = *(void *)(VTable + 8);
        CFArrayRef result = (const __CFArray *)(VTable + 8);
        uint64_t v11 = v12;
        uint64_t v13 = v12 ? v11 : 0;
        v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 48);
        if (v14) {
          CFArrayRef result = (const __CFArray *)v14(CMBaseObject, v3, v4, v8 + 24);
        }
        if (*(void *)(*(void *)(a1[4] + 8) + 24) == v5) {
          break;
        }
      }
    }
    ++v2;
  }
  return result;
}

@end