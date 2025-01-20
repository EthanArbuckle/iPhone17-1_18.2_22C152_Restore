@interface MKPlaceHoursViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_toggleShowAllHours;
@end

@implementation MKPlaceHoursViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlaceHoursViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_toggleShowAllHours
{
  v2.receiver = self;
  v2.super_class = (Class)MKPlaceHoursViewControllerAccessibility;
  [(MKPlaceHoursViewControllerAccessibility *)&v2 _toggleShowAllHours];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end