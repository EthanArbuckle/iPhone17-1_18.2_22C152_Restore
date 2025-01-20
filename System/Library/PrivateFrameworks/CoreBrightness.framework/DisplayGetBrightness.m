@interface DisplayGetBrightness
@end

@implementation DisplayGetBrightness

float ___DisplayGetBrightness_block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 40) + 336);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end