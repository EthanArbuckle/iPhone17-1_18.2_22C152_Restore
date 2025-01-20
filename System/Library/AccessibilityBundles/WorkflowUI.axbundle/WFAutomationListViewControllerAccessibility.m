@interface WFAutomationListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation WFAutomationListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFAutomationListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)WFAutomationListViewControllerAccessibility;
  [(WFAutomationListViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 navigationItem];
  v4 = [v3 rightBarButtonItem];
  v5 = accessibilityLocalizedString(@"create.automation");
  [v4 setAccessibilityLabel:v5];
}

@end