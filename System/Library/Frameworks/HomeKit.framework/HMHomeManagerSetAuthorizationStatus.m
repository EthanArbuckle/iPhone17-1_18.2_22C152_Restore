@interface HMHomeManagerSetAuthorizationStatus
@end

@implementation HMHomeManagerSetAuthorizationStatus

uint64_t ____HMHomeManagerSetAuthorizationStatus_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) didUpdateAuthorizationStatus:*(void *)(a1 + 48)];
}

@end