@interface ActivityTileSectionHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ActivityTileSectionHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.ActivityTileSectionHeader";
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
  v4.super_class = (Class)ActivityTileSectionHeaderAccessibility;
  [(ActivityTileSectionHeaderAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(ActivityTileSectionHeaderAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader];
}

@end