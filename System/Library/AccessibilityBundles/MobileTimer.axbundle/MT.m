@interface MT
@end

@implementation MT

void __56__MT_UIPageControlAccessibility__axStopWatchAdjustPage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentPage:*(void *)(a1 + 40)];
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v1, 0);
}

@end