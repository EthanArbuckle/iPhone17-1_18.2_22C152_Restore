@interface CCUIModularControlCenterOverlayViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation CCUIModularControlCenterOverlayViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIModularControlCenterOverlayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  BOOL v3 = _AXSInvertColorsEnabledGlobalCached() != 0;
  v4 = [(CCUIModularControlCenterOverlayViewControllerInvertColorsAccessibility *)self safeValueForKey:@"_scrollView"];
  [v4 setAccessibilityIgnoresInvertColors:v3];

  id v5 = [(CCUIModularControlCenterOverlayViewControllerInvertColorsAccessibility *)self safeValueForKey:@"_headerPocketView"];
  [v5 setAccessibilityIgnoresInvertColors:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIModularControlCenterOverlayViewControllerInvertColorsAccessibility;
  [(CCUIModularControlCenterOverlayViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(CCUIModularControlCenterOverlayViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end