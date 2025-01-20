@interface WFWidgetConfigurationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
@end

@implementation WFWidgetConfigurationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFWidgetConfigurationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFWidgetConfigurationView", @"containerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFWidgetConfigurationContainerView", @"requestDismissal", "v", 0);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

void __68__WFWidgetConfigurationViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safeValueForKey:@"containerView"];
  [v1 requestDismissal];
}

@end