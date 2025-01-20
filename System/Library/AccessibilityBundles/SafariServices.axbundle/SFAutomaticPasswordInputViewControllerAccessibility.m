@interface SFAutomaticPasswordInputViewControllerAccessibility
@end

@implementation SFAutomaticPasswordInputViewControllerAccessibility

void __71___SFAutomaticPasswordInputViewControllerAccessibility_viewWillAppear___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) safeUIViewForKey:@"_inputView"];
  id argument = [v1 _accessibilityFindDescendant:&__block_literal_global_0];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
}

uint64_t __71___SFAutomaticPasswordInputViewControllerAccessibility_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

@end