@interface UIKeyShortcutHUDViewControllerAccessibility
@end

@implementation UIKeyShortcutHUDViewControllerAccessibility

uint64_t __74___UIKeyShortcutHUDViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissHUD", a1, a1);
}

void __76___UIKeyShortcutHUDViewControllerAccessibility_setHidden_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  if (*(unsigned char *)(a1 + 40)) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

@end