@interface UIStatusBarLockViewAccessibility
@end

@implementation UIStatusBarLockViewAccessibility

void __70___UIStatusBarLockViewAccessibility_animateUnlockWithCompletionBlock___block_invoke(uint64_t a1, char a2)
{
  char v2 = a2 & 1;
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  if (v2) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end