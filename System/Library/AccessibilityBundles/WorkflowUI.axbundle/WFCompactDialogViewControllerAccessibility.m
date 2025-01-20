@interface WFCompactDialogViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)prepareForPresentationWithCompletionHandler:(id)a3;
@end

@implementation WFCompactDialogViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFCompactDialogViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)prepareForPresentationWithCompletionHandler:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFCompactDialogViewControllerAccessibility;
  [(WFCompactDialogViewControllerAccessibility *)&v3 prepareForPresentationWithCompletionHandler:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __90__WFCompactDialogViewControllerAccessibility_prepareForPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
}

@end