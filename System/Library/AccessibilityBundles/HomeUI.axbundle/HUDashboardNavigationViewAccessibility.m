@interface HUDashboardNavigationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_rotateChevronButtonToAngle:(double)a3;
@end

@implementation HUDashboardNavigationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUDashboardNavigationView";
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

- (void)_rotateChevronButtonToAngle:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HUDashboardNavigationViewAccessibility;
  [(HUDashboardNavigationViewAccessibility *)&v3 _rotateChevronButtonToAngle:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end