@interface HighestOrderUnit
@end

@implementation HighestOrderUnit

uint64_t ___HighestOrderUnit_block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *a3 = 1;
  return result;
}

@end