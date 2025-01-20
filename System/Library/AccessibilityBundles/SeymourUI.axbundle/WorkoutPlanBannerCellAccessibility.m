@interface WorkoutPlanBannerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation WorkoutPlanBannerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.WorkoutPlanBannerCell";
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
  v4.super_class = (Class)WorkoutPlanBannerCellAccessibility;
  [(WorkoutPlanBannerCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(WorkoutPlanBannerCellAccessibility *)self safeValueForKey:@"contentView"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

@end