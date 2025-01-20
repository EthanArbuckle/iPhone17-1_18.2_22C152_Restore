@interface GETTER
@end

@implementation GETTER

id __GETTER_IMPL_block_invoke(uint64_t a1, void *a2)
{
  id result = (id)[a2 objectForKey:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end