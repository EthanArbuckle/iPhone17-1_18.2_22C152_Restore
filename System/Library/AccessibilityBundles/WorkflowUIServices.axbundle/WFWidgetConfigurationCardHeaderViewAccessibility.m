@interface WFWidgetConfigurationCardHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation WFWidgetConfigurationCardHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFWidgetConfigurationCardHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFWidgetConfigurationCardHeaderView", @"labelsStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFWidgetConfigurationCardHeaderView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFWidgetConfigurationCardHeaderView", @"subtitleLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)WFWidgetConfigurationCardHeaderViewAccessibility;
  [(WFWidgetConfigurationCardHeaderViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(WFWidgetConfigurationCardHeaderViewAccessibility *)self safeValueForKey:@"labelsStackView"];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  v4 = [(WFWidgetConfigurationCardHeaderViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v5 = [(WFWidgetConfigurationCardHeaderViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v6 = __UIAXStringForVariables();
  objc_msgSend(v3, "setAccessibilityLabel:", v6, v5, @"__AXStringForVariablesSentinel");
}

@end