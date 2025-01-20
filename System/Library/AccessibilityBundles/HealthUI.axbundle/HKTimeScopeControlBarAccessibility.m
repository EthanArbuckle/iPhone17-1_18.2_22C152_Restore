@interface HKTimeScopeControlBarAccessibility
@end

@implementation HKTimeScopeControlBarAccessibility

void __81___HKTimeScopeControlBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 48)];
  v2 = AXLocalizedStringFromTimeScope([*(id *)(a1 + 40) _timeScopeForIndex:*(void *)(a1 + 48)]);
  [v3 setAccessibilityLabel:v2];
}

@end