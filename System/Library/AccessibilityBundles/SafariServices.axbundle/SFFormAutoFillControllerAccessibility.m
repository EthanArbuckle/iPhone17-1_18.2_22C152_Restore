@interface SFFormAutoFillControllerAccessibility
@end

@implementation SFFormAutoFillControllerAccessibility

void __73___SFFormAutoFillControllerAccessibility_fieldWillFocusWithInputSession___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) safeUIViewForKey:@"_autoFillInputView"];
  id argument = [v1 _accessibilityFindDescendant:&__block_literal_global_1];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
}

uint64_t __73___SFFormAutoFillControllerAccessibility_fieldWillFocusWithInputSession___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

@end