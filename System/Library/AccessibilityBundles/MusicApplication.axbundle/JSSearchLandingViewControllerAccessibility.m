@interface JSSearchLandingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation JSSearchLandingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.JSSearchLandingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)JSSearchLandingViewControllerAccessibility;
  [(JSSearchLandingViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(JSSearchLandingViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];

  v4 = [(JSSearchLandingViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
  [v4 _accessibilitySetSortPriority:1];
}

@end