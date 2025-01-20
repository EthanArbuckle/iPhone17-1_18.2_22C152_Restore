@interface MXSessionSetProperty
@end

@implementation MXSessionSetProperty

uint64_t ___MXSessionSetProperty_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) setPropertyForKey:*(void *)(a1 + 48) value:*(void *)(a1 + 56)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end