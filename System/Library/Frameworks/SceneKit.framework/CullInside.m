@interface CullInside
@end

@implementation CullInside

uint64_t ____CullInside_block_invoke(uint64_t a1, uint64_t a2)
{
  return __CullInside(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

@end