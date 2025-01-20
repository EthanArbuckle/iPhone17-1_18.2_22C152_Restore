@interface FEFocusEnvironmentResolvedRotaryFocusMovementAxis
@end

@implementation FEFocusEnvironmentResolvedRotaryFocusMovementAxis

void ___FEFocusEnvironmentResolvedRotaryFocusMovementAxis_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  uint64_t v6 = _FEFocusEnvironmentRotaryFocusMovementAxis(v7);
  if (v6 != -1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

@end