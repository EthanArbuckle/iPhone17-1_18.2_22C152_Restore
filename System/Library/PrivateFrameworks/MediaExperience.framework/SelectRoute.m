@interface SelectRoute
@end

@implementation SelectRoute

uint64_t __routingContextResilientRemote_SelectRoute_block_invoke(uint64_t a1, uint64_t a2)
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
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 8);
  if (!v7) {
    return 4294954514;
  }
  return v7(a2, v3, v4);
}

void __routingContext_SelectRoute_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", *(void *)(a1 + 40), 0);
    FigRoutingManagerCreateAggregateForContextIfNecessary(*(const void **)(DerivedStorage + 8), (CFIndex)v3);
  }
  if (*(_DWORD *)DerivedStorage == 2)
  {
    int IsTestCodeEnabled = MXSystemMirroring_IsTestCodeEnabled();
    uint64_t v5 = *(const void **)(a1 + 40);
    if (IsTestCodeEnabled)
    {
      MXSystemMirroring_PickEndpoint(*(const void **)(DerivedStorage + 8), v5, *(CFDictionaryRef *)(a1 + 48), 0);
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = *(const void **)(a1 + 40);
  }
  FigRoutingManagerPickEndpointForContext(*(const void **)(DerivedStorage + 8), v5, *(const __CFDictionary **)(a1 + 48), 0);
LABEL_8:
  uint64_t v6 = *(const void **)(a1 + 32);
  if (v6) {
    CFRelease(v6);
  }
  v7 = *(const void **)(a1 + 40);
  if (v7) {
    CFRelease(v7);
  }
  v8 = *(const void **)(a1 + 48);
  if (v8)
  {
    CFRelease(v8);
  }
}

@end