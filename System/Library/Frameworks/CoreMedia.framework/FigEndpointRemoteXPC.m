@interface FigEndpointRemoteXPC
@end

@implementation FigEndpointRemoteXPC

void __FigEndpointRemoteXPC_runAllCallbacks_block_invoke(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = __FigEndpointRemoteXPC_runAllCallbacks_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_6_7;
  v4[4] = *(void *)(a1 + 40);
  int v5 = *(_DWORD *)(a1 + 48);
  FigCFDictionaryApplyBlock(v2, v4);
  v3 = *(const void **)(a1 + 32);
  if (v3) {
    CFRelease(v3);
  }
}

void *__FigEndpointRemoteXPC_runAllCallbacks_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return remoteXPCEndpointClient_runCallback(a3, *(void *)(a1 + 32), 0, 0, *(unsigned int *)(a1 + 40));
}

void __FigEndpointRemoteXPC_ActivateWithCompletionCallback_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), 0, 0, *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __FigEndpointRemoteXPC_sendMessageSynchronouslyExpectingCompletionCallback_block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  remoteXPCEndpointClient_runCallback((void *)(a1 + 32), *(void *)(a1 + 104), 0, 0, *(unsigned int *)(a1 + 112));

  remoteXPCEndpointClient_releaseCompletionCallbackEntryFields(v1);
}

void __FigEndpointRemoteXPC_DeactivateWithCompletionCallback_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), 0, *(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 56));
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __FigEndpointRemoteXPC_SendCommand_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), 0, *(void *)(a1 + 48));
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __FigEndpointRemoteXPC_SendData_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned int *)(a1 + 64), *(void *)(a1 + 56));
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
  }
}

void __FigEndpointRemoteXPC_EndpointAggregateOperationWithCompletionCallback_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48), 0, *(void *)(a1 + 56), *(unsigned int *)(a1 + 72), *(void *)(a1 + 64));
  CFDictionaryRef v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
  }
}

@end