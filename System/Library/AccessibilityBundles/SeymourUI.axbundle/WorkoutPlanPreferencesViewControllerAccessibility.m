@interface WorkoutPlanPreferencesViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation WorkoutPlanPreferencesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.WorkoutPlanPreferencesViewController";
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
  v7.receiver = self;
  v7.super_class = (Class)WorkoutPlanPreferencesViewControllerAccessibility;
  [(WorkoutPlanPreferencesViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 navigationItem];

  v4 = [v3 titleView];
  v5 = v4;
  if (v4)
  {
    [v4 setIsAccessibilityElement:1];
    v6 = UIAXStringForAllChildren();
    [v5 setAccessibilityLabel:v6];

    [v5 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WorkoutPlanPreferencesViewControllerAccessibility;
  [(WorkoutPlanPreferencesViewControllerAccessibility *)&v3 viewDidLoad];
  [(WorkoutPlanPreferencesViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end