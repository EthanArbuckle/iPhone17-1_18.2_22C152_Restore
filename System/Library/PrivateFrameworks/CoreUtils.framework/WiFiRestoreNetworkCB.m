@interface WiFiRestoreNetworkCB
@end

@implementation WiFiRestoreNetworkCB

uint64_t ___WiFiRestoreNetworkCB_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

@end