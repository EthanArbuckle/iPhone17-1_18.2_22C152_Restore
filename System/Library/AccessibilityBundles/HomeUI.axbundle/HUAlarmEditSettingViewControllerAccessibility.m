@interface HUAlarmEditSettingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUAlarmEditSettingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUAlarmEditSettingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUAlarmEditSettingViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAlarmEditSettingViewController", @"tableView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)HUAlarmEditSettingViewControllerAccessibility;
  [(HUAlarmEditSettingViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUAlarmEditSettingViewControllerAccessibility;
  [(HUAlarmEditSettingViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(HUAlarmEditSettingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end