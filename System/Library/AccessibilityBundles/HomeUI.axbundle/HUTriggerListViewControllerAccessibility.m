@interface HUTriggerListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HUTriggerListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUTriggerListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUTriggerListViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"HUTriggerListViewController" isKindOfClass:@"UITableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUTriggerListViewController", @"navigationAddButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HUTriggerListViewControllerAccessibility;
  [(HUTriggerListViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HUTriggerListViewControllerAccessibility *)self safeValueForKey:@"navigationAddButton"];
  v4 = accessibilityHomeLocalizedString(@"navBar.plus");
  [v3 setAccessibilityLabel:v4];
}

@end