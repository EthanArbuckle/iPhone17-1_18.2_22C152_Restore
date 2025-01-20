@interface BuddyProximitySetupControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation BuddyProximitySetupControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BuddyProximitySetupController";
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
  v6.super_class = (Class)BuddyProximitySetupControllerAccessibility;
  [(BuddyProximitySetupControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v2 = accessibilityLocalizedString(@"accessibility.button");
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 navigationItem];
  v5 = [v4 rightBarButtonItem];
  [v5 setAccessibilityLabel:v2];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)BuddyProximitySetupControllerAccessibility;
  [(BuddyProximitySetupControllerAccessibility *)&v3 loadView];
  [(BuddyProximitySetupControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end