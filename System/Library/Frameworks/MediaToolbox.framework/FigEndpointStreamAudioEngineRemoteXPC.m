@interface FigEndpointStreamAudioEngineRemoteXPC
@end

@implementation FigEndpointStreamAudioEngineRemoteXPC

void __FigEndpointStreamAudioEngineRemoteXPC_ensureClientEstablished_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"EndpointStreamAudioEngine_ServerConnectionDied");
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22098], (const void *)*MEMORY[0x1E4F1CFD0]);
  FigCFDictionarySetInt32();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

void __FigEndpointStreamAudioEngineRemoteXPC_runAllCallbacks_block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *(CFDictionaryRef *)(a1[6] + 24));
  if (*(void *)(*(void *)(a1[4] + 8) + 24))
  {
    v2 = *(__CFDictionary **)(a1[6] + 24);
    CFDictionaryRemoveAllValues(v2);
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = -15480;
  }
}

uint64_t __FigEndpointStreamAudioEngineRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v3 = *(void *)(DerivedStorage + 32);
  uint64_t v4 = 1;
  if ((unint64_t)(v3 + 1) > 1) {
    uint64_t v4 = v3 + 1;
  }
  *(void *)(DerivedStorage + 32) = v4;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;

  return FigCFDictionarySetValue();
}

void __FigEndpointStreamAudioEngineRemoteXPC_tryRemoveCallback_block_invoke(uint64_t a1)
{
  if (CFDictionaryContainsKey(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 24), *(const void **)(a1 + 48)))
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 40) + 24), *(const void **)(a1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

@end