@interface SelectRouteDescriptors
@end

@implementation SelectRouteDescriptors

uint64_t __routingContextResilientRemote_SelectRouteDescriptors_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7) {
    return 4294954514;
  }
  return v7(a2, v3, v4);
}

void __routingContext_SelectRouteDescriptors_block_invoke(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)FigEndpointDescriptorUtility_CopyEndpointArrayFromDescriptors(*(void **)(a1 + 32), 0);
  if (v2)
  {
    CFArrayRef v3 = v2;
    if (CFArrayGetCount(v2)) {
      FigRoutingManagerCreateAggregateForContextIfNecessary(*(const void **)(*(void *)(a1 + 40) + 8), (CFIndex)v3);
    }
    CFRelease(v3);
  }
  FigPredictedRouting_ResetSelectedRouteDescriptor(*(void *)(*(void *)(a1 + 40) + 8), 3);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"RouteChangeOptionKey_UserPickedRoute", (const void *)*MEMORY[0x1E4F1CFD0]);
  FigRoutingManagerPickRouteDescriptorsForContext(*(const void **)(*(void *)(a1 + 40) + 8), *(const __CFArray **)(a1 + 32), *(const __CFDictionary **)(a1 + 48), Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t v5 = *(const void **)(a1 + 56);
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = *(const void **)(a1 + 32);
  if (v6) {
    CFRelease(v6);
  }
  v7 = *(const void **)(a1 + 48);
  if (v7)
  {
    CFRelease(v7);
  }
}

@end