@interface UIKeyShortcutHUDWindowAccessibility
@end

@implementation UIKeyShortcutHUDWindowAccessibility

void __57___UIKeyShortcutHUDWindowAccessibility_makeKeyAndVisible__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CE68];
  id v2 = (id)[*(id *)(a1 + 32) _accessibilityFirstDescendant];
  UIAccessibilityPostNotification(notification, v2);
}

@end