@interface FigEndpointPlaybackSessionRemoteXPC
@end

@implementation FigEndpointPlaybackSessionRemoteXPC

uint64_t __FigEndpointPlaybackSessionRemoteXPC_runAllCallbacks_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(result + 40) + 24);
  *(void *)(*(void *)(result + 40) + 24) = 0;
  return result;
}

void __FigEndpointPlaybackSessionRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke(void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1[5]);
  uint64_t v3 = *(void *)(DerivedStorage + 56);
  uint64_t v4 = 1;
  if ((unint64_t)(v3 + 1) > 1) {
    uint64_t v4 = v3 + 1;
  }
  *(void *)(DerivedStorage + 56) = v4;
  *(void *)(*(void *)(a1[4] + 8) + 24) = v3;
  v5 = *(__CFDictionary **)(a1[6] + 24);
  if (v5)
  {
    v6 = *(const void **)(*(void *)(a1[4] + 8) + 24);
    v7 = (const void *)a1[7];
    CFDictionarySetValue(v5, v6, v7);
  }
}

void __FigEndpointPlaybackSessionRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke_2(void *a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1[6] + 24);
  if (v2)
  {
    if (CFDictionaryGetValueIfPresent(v2, *(const void **)(*(void *)(a1[4] + 8) + 24), 0)) {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
    uint64_t v3 = *(__CFDictionary **)(a1[6] + 24);
    uint64_t v4 = *(const void **)(*(void *)(a1[4] + 8) + 24);
    CFDictionaryRemoveValue(v3, v4);
  }
}

void __FigEndpointPlaybackSessionRemoteXPC_SetEventHandler_block_invoke(void *a1)
{
  *(void *)(a1[4] + 40) = a1[5];
  *(void *)(a1[4] + 32) = a1[6];
  uint64_t v1 = a1[4];
  CFDictionaryRef v2 = *(const void **)(v1 + 48);
  uint64_t v3 = (const void *)a1[7];
  *(void *)(v1 + 48) = v3;
  if (v3) {
    CFRetain(v3);
  }
  if (v2)
  {
    CFRelease(v2);
  }
}

@end