@interface HUDashboardViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation HUDashboardViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUDashboardViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(HUDashboardViewControllerInvertColorsAccessibility *)self safeValueForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUDashboardViewControllerInvertColorsAccessibility;
  [(HUDashboardViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(HUDashboardViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end