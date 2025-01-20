@interface CSPasscodeViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CSPasscodeViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSPasscodeViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSPasscodeViewControllerInvertColorsAccessibility;
  [(CSPasscodeViewControllerInvertColorsAccessibility *)&v4 viewWillAppear:a3];
  [(CSPasscodeViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  id v6 = [(CSPasscodeViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  if (IsInvertColorsEnabled)
  {
    objc_super v4 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    id v5 = +[AXInvertColorsAppHelper insertBackgroundView:v6 color:v4];
  }
  else
  {
    +[AXInvertColorsAppHelper removeBackgroundView:v6];
  }
}

@end