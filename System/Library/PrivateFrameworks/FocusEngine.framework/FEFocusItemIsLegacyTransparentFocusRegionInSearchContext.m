@interface FEFocusItemIsLegacyTransparentFocusRegionInSearchContext
@end

@implementation FEFocusItemIsLegacyTransparentFocusRegionInSearchContext

uint64_t ___FEFocusItemIsLegacyTransparentFocusRegionInSearchContext_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v5 = _FEFocusItemSafeCast(a2);
  if (v5)
  {
    v7 = v5;
    if (_FEFocusItemIsViewOrRespondsToSelector(v5))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 _isTransparentFocusRegion];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
  return MEMORY[0x270F9A790]();
}

@end