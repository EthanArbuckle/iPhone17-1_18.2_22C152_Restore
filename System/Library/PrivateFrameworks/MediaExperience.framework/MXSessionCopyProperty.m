@interface MXSessionCopyProperty
@end

@implementation MXSessionCopyProperty

uint64_t ___MXSessionCopyProperty_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) copyPropertyForKey:*(void *)(a1 + 48) valueOut:*(void *)(a1 + 56)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end