@interface FIUIImageForPetalColor
@end

@implementation FIUIImageForPetalColor

uint64_t ___FIUIImageForPetalColor_block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 CGContext];
  return [v2 renderInContext:v3];
}

@end