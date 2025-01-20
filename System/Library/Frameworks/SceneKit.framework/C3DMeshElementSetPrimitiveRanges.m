@interface C3DMeshElementSetPrimitiveRanges
@end

@implementation C3DMeshElementSetPrimitiveRanges

uint64_t ____C3DMeshElementSetPrimitiveRanges_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 rangeValue];
  v7 = (uint64_t *)(*(void *)(a1 + 32) + 16 * a3);
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = result;
  }
  uint64_t *v7 = v8;
  v7[1] = v6;
  return result;
}

@end