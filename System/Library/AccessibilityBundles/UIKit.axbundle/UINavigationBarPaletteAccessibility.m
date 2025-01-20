@interface UINavigationBarPaletteAccessibility
@end

@implementation UINavigationBarPaletteAccessibility

uint64_t __82___UINavigationBarPaletteAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 minimumHeight];
  return objc_msgSend(v2, "setMinimumHeight:");
}

@end