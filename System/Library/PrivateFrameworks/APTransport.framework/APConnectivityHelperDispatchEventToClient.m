@interface APConnectivityHelperDispatchEventToClient
@end

@implementation APConnectivityHelperDispatchEventToClient

void ___APConnectivityHelperDispatchEventToClient_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56));
  v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v3 = *(const void **)(a1 + 56);
  CFRelease(v3);
}

@end