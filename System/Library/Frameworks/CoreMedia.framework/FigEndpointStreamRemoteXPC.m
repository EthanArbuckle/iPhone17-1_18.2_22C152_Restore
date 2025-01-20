@interface FigEndpointStreamRemoteXPC
@end

@implementation FigEndpointStreamRemoteXPC

uint64_t __FigEndpointStreamRemoteXPC_runAllCallbacks_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(result + 40) + 24);
  *(void *)(*(void *)(result + 40) + 24) = 0;
  return result;
}

void __FigEndpointStreamRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke(void *a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1[5]);
  uint64_t v3 = *(void *)(DerivedStorage + 32);
  uint64_t v4 = 1;
  if ((unint64_t)(v3 + 1) > 1) {
    uint64_t v4 = v3 + 1;
  }
  *(void *)(DerivedStorage + 32) = v4;
  *(void *)(*(void *)(a1[4] + 8) + 24) = v3;
  v5 = *(__CFDictionary **)(a1[6] + 24);
  if (v5)
  {
    v6 = *(const void **)(*(void *)(a1[4] + 8) + 24);
    CFDictionarySetValue(v5, v6, a1 + 7);
  }
}

void __FigEndpointStreamRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke_2(void *a1)
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

@end