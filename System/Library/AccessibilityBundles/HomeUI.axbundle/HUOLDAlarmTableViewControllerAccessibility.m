@interface HUOLDAlarmTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUOLDAlarmTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUOLDAlarmTableViewController";
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
  v2.receiver = self;
  v2.super_class = (Class)HUOLDAlarmTableViewControllerAccessibility;
  [(HUOLDAlarmTableViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUOLDAlarmTableViewControllerAccessibility;
  [(HUOLDAlarmTableViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(HUOLDAlarmTableViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end