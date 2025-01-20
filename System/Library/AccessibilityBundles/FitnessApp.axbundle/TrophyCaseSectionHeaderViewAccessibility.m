@interface TrophyCaseSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TrophyCaseSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.TrophyCaseSectionHeaderView";
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
  v4.super_class = (Class)TrophyCaseSectionHeaderViewAccessibility;
  [(TrophyCaseSectionHeaderViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(TrophyCaseSectionHeaderViewAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader];
}

@end