@interface FigEndpointRemoteControlSessionRemoteXPC
@end

@implementation FigEndpointRemoteControlSessionRemoteXPC

uint64_t __FigEndpointRemoteControlSessionRemoteXPC_runAllCallbacks_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(result + 40) + 24);
  *(void *)(*(void *)(result + 40) + 24) = 0;
  return result;
}

id __FigEndpointRemoteControlSessionRemoteXPC_postInvalidated_block_invoke(void *a1)
{
  id result = FigCFWeakReferenceLoadAndRetain((id *)(a1[6] + 40));
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[6] + 32);
  return result;
}

void __FigEndpointRemoteControlSessionRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke(void *a1)
{
  v2 = (atomic_uint *)(CMBaseObjectGetDerivedStorage(a1[5]) + 48);
  uint64_t v3 = *(void *)v2;
  FigAtomicIncrement32(v2);
  if (!*(void *)v2) {
    FigAtomicIncrement32(v2);
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = v3;
  v4 = *(__CFDictionary **)(a1[6] + 24);
  if (v4)
  {
    v5 = *(const void **)(*(void *)(a1[4] + 8) + 24);
    v6 = (const void *)a1[7];
    CFDictionarySetValue(v4, v5, v6);
  }
}

void __FigEndpointRemoteControlSessionRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke_2(void *a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1[6] + 24);
  if (v2)
  {
    if (CFDictionaryGetValueIfPresent(v2, *(const void **)(*(void *)(a1[4] + 8) + 24), 0)) {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
    uint64_t v3 = *(__CFDictionary **)(a1[6] + 24);
    v4 = *(const void **)(*(void *)(a1[4] + 8) + 24);
    CFDictionaryRemoveValue(v3, v4);
  }
}

void __FigEndpointRemoteControlSessionRemoteXPC_SetEventHandler_block_invoke(void *a1)
{
  FigCFWeakReferenceDestroy((id *)(a1[4] + 40));
  *(void *)(a1[4] + 40) = 0;
  uint64_t v2 = a1[5];
  if (v2 && a1[6])
  {
    *(void *)(a1[4] + 32) = v2;
    uint64_t v3 = (id *)(a1[4] + 40);
    v4 = (void *)a1[6];
    FigCFWeakReferenceStore(v3, v4);
  }
  else
  {
    *(void *)(a1[4] + 32) = 0;
  }
}

@end