@interface UIStatusBarCellularItemAccessibility
@end

@implementation UIStatusBarCellularItemAccessibility

void __83___UIStatusBarCellularItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) entryForDisplayItemWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

@end