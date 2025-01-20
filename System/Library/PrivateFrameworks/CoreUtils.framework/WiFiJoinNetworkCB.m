@interface WiFiJoinNetworkCB
@end

@implementation WiFiJoinNetworkCB

void ___WiFiJoinNetworkCB_block_invoke(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  v2 = (const void *)a1[5];
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[6];
  if (v3)
  {
    CFRelease(v3);
  }
}

uint64_t ___WiFiJoinNetworkCB_block_invoke_182(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
}

@end