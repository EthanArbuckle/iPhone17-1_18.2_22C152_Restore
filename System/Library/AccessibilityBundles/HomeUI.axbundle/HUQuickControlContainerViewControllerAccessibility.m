@interface HUQuickControlContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation HUQuickControlContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlContainerViewController";
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
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlContainerViewControllerAccessibility;
  [(HUQuickControlContainerViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(HUQuickControlContainerViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 _accessibilitySetOverridesInvalidFrames:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlContainerViewControllerAccessibility;
  [(HUQuickControlContainerViewControllerAccessibility *)&v3 viewDidLoad];
  [(HUQuickControlContainerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end