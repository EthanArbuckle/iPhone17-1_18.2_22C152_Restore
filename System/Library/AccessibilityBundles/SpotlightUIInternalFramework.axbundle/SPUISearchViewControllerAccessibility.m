@interface SPUISearchViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)cancelButtonPressed;
@end

@implementation SPUISearchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SPUISearchViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

uint64_t __67__SPUISearchViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelButtonPressed];
}

- (void)cancelButtonPressed
{
  v2.receiver = self;
  v2.super_class = (Class)SPUISearchViewControllerAccessibility;
  [(SPUISearchViewControllerAccessibility *)&v2 cancelButtonPressed];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end