@interface MXSessionCreate
@end

@implementation MXSessionCreate

MXSessionSidekick *___MXSessionCreate_block_invoke(uint64_t a1)
{
  result = [[MXSessionSidekick alloc] initWithSession:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

@end