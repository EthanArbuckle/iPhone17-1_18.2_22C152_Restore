@interface WKSelectSinglePickerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)controlBeginEditing;
@end

@implementation WKSelectSinglePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WKSelectSinglePicker";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)controlBeginEditing
{
  v2.receiver = self;
  v2.super_class = (Class)WKSelectSinglePickerAccessibility;
  [(WKSelectSinglePickerAccessibility *)&v2 controlBeginEditing];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __56__WKSelectSinglePickerAccessibility_controlBeginEditing__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _accessibilityFindDescendant:&__block_literal_global_1];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v1);
}

uint64_t __56__WKSelectSinglePickerAccessibility_controlBeginEditing__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

@end