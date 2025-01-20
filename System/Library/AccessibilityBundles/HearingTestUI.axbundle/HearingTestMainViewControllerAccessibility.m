@interface HearingTestMainViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HearingTestMainViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HearingTestUI.HearingTestMainViewController";
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
  v7.super_class = (Class)HearingTestMainViewControllerAccessibility;
  [(HearingTestMainViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  v3 = [v2 navigationItem];
  v4 = [v3 rightBarButtonItems];

  if ([v4 count] == 3)
  {
    v5 = [v4 objectAtIndexedSubscript:2];
    v6 = accessibilityLocalizedString(@"HEARING_TEST_DEBUG_BUTTON");
    [v5 setAccessibilityLabel:v6];
  }
}

@end