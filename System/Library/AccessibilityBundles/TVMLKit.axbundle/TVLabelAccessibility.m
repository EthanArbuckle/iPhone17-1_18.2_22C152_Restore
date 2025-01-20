@interface TVLabelAccessibility
@end

@implementation TVLabelAccessibility

BOOL __44___TVLabelAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Tvshelfviewhea.isa);
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v4 = [v2 accessibilityTraits];
    BOOL v3 = (*MEMORY[0x263F1CEF8] & ~v4) == 0;
  }

  return v3;
}

@end