@interface PKDashboardViewControllerFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PKDashboardViewControllerFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKDashboardViewControllerFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardViewControllerFooterView", @"leadingTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardViewControllerFooterView", @"leadingDetail", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardViewControllerFooterView", @"trailingTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardViewControllerFooterView", @"trailingDetail", "@", 0);
  [v3 validateClass:@"PKDashboardViewControllerFooterView" hasInstanceVariable:@"_payButton" withType:"PKContinuousButton"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(PKDashboardViewControllerFooterViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"leadingTitle, leadingDetail"];
}

- (id)accessibilityValue
{
  return (id)[(PKDashboardViewControllerFooterViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"trailingTitle, trailingDetail"];
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(PKDashboardViewControllerFooterViewAccessibility *)self safeUIViewForKey:@"_payButton"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end