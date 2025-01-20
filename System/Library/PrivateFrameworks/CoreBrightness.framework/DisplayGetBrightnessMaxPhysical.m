@interface DisplayGetBrightnessMaxPhysical
@end

@implementation DisplayGetBrightnessMaxPhysical

float ___DisplayGetBrightnessMaxPhysical_block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 40) + 464);
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end