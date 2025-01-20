@interface DisplayGetBrightnessMinPhysical
@end

@implementation DisplayGetBrightnessMinPhysical

float ___DisplayGetBrightnessMinPhysical_block_invoke(uint64_t a1)
{
  if (getClientOverrideState(*(void *)(a1 + 40), 1)
    && *(float *)(*(void *)(a1 + 40) + 968) == *(float *)(*(void *)(a1 + 40) + 396))
  {
    float result = *(float *)(*(void *)(a1 + 40) + 1532);
    *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  else
  {
    float result = *(float *)(*(void *)(a1 + 40) + 396);
    *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end