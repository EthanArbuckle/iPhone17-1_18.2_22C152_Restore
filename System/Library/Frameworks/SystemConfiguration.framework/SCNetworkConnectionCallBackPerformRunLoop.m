@interface SCNetworkConnectionCallBackPerformRunLoop
@end

@implementation SCNetworkConnectionCallBackPerformRunLoop

void ____SCNetworkConnectionCallBackPerformRunLoop_block_invoke(uint64_t a1)
{
  __SCNetworkConnectionNotify(*(void *)(a1 + 32), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 40), *(unsigned int *)(a1 + 64), *(uint64_t (**)(uint64_t))(a1 + 48), *(void *)(a1 + 56));
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

@end