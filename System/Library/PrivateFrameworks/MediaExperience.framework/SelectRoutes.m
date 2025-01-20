@interface SelectRoutes
@end

@implementation SelectRoutes

uint64_t __routingContextResilientRemote_SelectRoutes_block_invoke(uint64_t a1, uint64_t a2)
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
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  if (!v7) {
    return 4294954514;
  }
  return v7(a2, v3, v4);
}

void __routingContext_SelectRoutes_block_invoke(uint64_t a1)
{
  CFArrayRef v2 = *(const __CFArray **)(a1 + 32);
  if (v2 && CFArrayGetCount(v2)) {
    FigRoutingManagerCreateAggregateForContextIfNecessary(*(const void **)(*(void *)(a1 + 40) + 8), *(void *)(a1 + 32));
  }
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v5 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionarySetValue(Mutable, @"RouteChangeOptionKey_UserPickedRoute", (const void *)*MEMORY[0x1E4F1CFD0]);
  if (FigRoutingManagerContextUtilities_DoesContextSupportWHAMultiDeviceRouting(*(void *)(*(void *)(a1 + 40) + 8))) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = (const void *)*MEMORY[0x1E4F1CFC8];
  }
  CFDictionarySetValue(Mutable, @"RouteChangeOptionKey_RoutingContextSupportsMultiDeviceRouting", v6);
  CFArrayRef v7 = *(const __CFArray **)(a1 + 32);
  if (v7) {
    CFArrayRef MutableCopy = CFArrayCreateMutableCopy(v3, 0, v7);
  }
  else {
    CFArrayRef MutableCopy = 0;
  }
  CFIndex v9 = 0;
  if (!MutableCopy) {
    goto LABEL_12;
  }
LABEL_11:
  for (CFIndex i = CFArrayGetCount(MutableCopy); v9 < i; CFIndex i = 0)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v9);
    if (FigRoutingManagerIsEndpointOfType((uint64_t)ValueAtIndex)
      && FigRoutingManagerIsEndpointWHAGroupable((uint64_t)ValueAtIndex))
    {
      CFTypeRef v12 = FigRoutingManagerCopyLocalAirPlayEndpoint();
      if (v12)
      {
        v13 = v12;
        CFArraySetValueAtIndex(MutableCopy, v9, v12);
        CFRelease(v13);
      }
    }
    ++v9;
    if (MutableCopy) {
      goto LABEL_11;
    }
LABEL_12:
    ;
  }
  FigRoutingManagerPickEndpointsForContext(*(const void **)(*(void *)(a1 + 40) + 8), MutableCopy, *(const __CFDictionary **)(a1 + 48), Mutable);
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  v14 = *(const void **)(a1 + 56);
  if (v14) {
    CFRelease(v14);
  }
  v15 = *(const void **)(a1 + 32);
  if (v15) {
    CFRelease(v15);
  }
  v16 = *(const void **)(a1 + 48);
  if (v16)
  {
    CFRelease(v16);
  }
}

@end