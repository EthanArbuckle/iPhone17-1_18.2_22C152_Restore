@interface UIAlertControllerViewAccessibility
@end

@implementation UIAlertControllerViewAccessibility

uint64_t __65___UIAlertControllerViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissAnimated:triggeringAction:", 1, *(void *)(a1 + 40), a1, a1);
}

@end