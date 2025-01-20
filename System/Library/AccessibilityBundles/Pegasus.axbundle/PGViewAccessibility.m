@interface PGViewAccessibility
@end

@implementation PGViewAccessibility

uint64_t __63____PGViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x24565A9F0](@"PGButtonView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end