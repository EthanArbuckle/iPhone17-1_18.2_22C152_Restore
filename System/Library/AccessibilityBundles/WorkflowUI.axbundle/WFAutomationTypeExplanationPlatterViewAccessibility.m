@interface WFAutomationTypeExplanationPlatterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation WFAutomationTypeExplanationPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFAutomationTypeExplanationPlatterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFAutomationTypeExplanationPlatterView", @"button", "@", 0);
  [v3 validateClass:@"WFAutomationTypeExplanationPlatterView" hasInstanceVariable:@"_explanationTextLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(WFAutomationTypeExplanationPlatterViewAccessibility *)self safeValueForKey:@"button"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  double v3 = [(WFAutomationTypeExplanationPlatterViewAccessibility *)self safeValueForKeyPath:@"button.configuration.title"];
  double v6 = [(WFAutomationTypeExplanationPlatterViewAccessibility *)self safeValueForKeyPath:@"_explanationTextLabel.text"];
  double v4 = __AXStringForVariables();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end