@interface IFConcurrentArrayTransform
@end

@implementation IFConcurrentArrayTransform

id ___IFConcurrentArrayTransform_block_invoke(uint64_t a1, uint64_t a2)
{
  id result = (id)(*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) objectAtIndex:a2], a2);
  if (result) {
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 8 * a2) = result;
  }
  return result;
}

@end