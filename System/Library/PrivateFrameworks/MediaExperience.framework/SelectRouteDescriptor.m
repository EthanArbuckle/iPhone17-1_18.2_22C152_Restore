@interface SelectRouteDescriptor
@end

@implementation SelectRouteDescriptor

uint64_t __routingContextResilientRemote_SelectRouteDescriptor_block_invoke(uint64_t a1, uint64_t a2)
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
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  if (!v7) {
    return 4294954514;
  }
  return v7(a2, v3, v4);
}

void __routingContext_SelectRouteDescriptor_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = FigEndpointDescriptorUtility_CopyEndpointFromDescriptor(*(void *)(a1 + 40), 0);
  if (v3)
  {
    uint64_t v4 = (const void *)v3;
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v3, 0);
    FigRoutingManagerCreateAggregateForContextIfNecessary(*(const void **)(DerivedStorage + 8), (CFIndex)v5);

    CFRelease(v4);
  }
  FigPredictedRouting_ResetSelectedRouteDescriptor(*(void *)(DerivedStorage + 8), 2);
  if (FigRoutingManagerContextUtilities_GetContextType(*(void *)(DerivedStorage + 8)) == 2
    && MXSystemMirroring_IsTestCodeEnabled())
  {
    MXSystemMirroring_PickRouteDescriptor(*(const void **)(DerivedStorage + 8), *(CFDictionaryRef *)(a1 + 40), *(const __CFDictionary **)(a1 + 48), 0);
  }
  else
  {
    int IsMirroringScreenAudioSeperateFunctionalityAllowed = MXSystemMirroring_IsMirroringScreenAudioSeperateFunctionalityAllowed();
    v7 = *(const void **)(DerivedStorage + 8);
    CFDictionaryRef v8 = *(const __CFDictionary **)(a1 + 40);
    CFDictionaryRef v9 = *(const __CFDictionary **)(a1 + 48);
    if (IsMirroringScreenAudioSeperateFunctionalityAllowed) {
      MXSystemAudio_PickRouteDescriptor(v7, v8, v9, 0);
    }
    else {
      FigRoutingManagerPickRouteDescriptorForContext(v7, v8, v9, 0);
    }
  }
  v10 = *(const void **)(a1 + 32);
  if (v10) {
    CFRelease(v10);
  }
  v11 = *(const void **)(a1 + 40);
  if (v11) {
    CFRelease(v11);
  }
  v12 = *(const void **)(a1 + 48);
  if (v12)
  {
    CFRelease(v12);
  }
}

@end