@interface BKUIPearlEnrollViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)forceDarkBackground:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation BKUIPearlEnrollViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIPearlEnrollViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v3 = [(BKUIPearlEnrollViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  objc_msgSend(v3, "setAccessibilityIgnoresInvertColors:", -[BKUIPearlEnrollViewControllerInvertColorsAccessibility safeBoolForKey:](self, "safeBoolForKey:", @"_darkBackground"));

  id v4 = [(BKUIPearlEnrollViewControllerInvertColorsAccessibility *)self safeValueForKeyPath:@"parentViewController.navigationController.navigationBar"];
  objc_msgSend(v4, "setAccessibilityIgnoresInvertColors:", -[BKUIPearlEnrollViewControllerInvertColorsAccessibility safeBoolForKey:](self, "safeBoolForKey:", @"_darkBackground"));
}

- (void)forceDarkBackground:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollViewControllerInvertColorsAccessibility;
  [(BKUIPearlEnrollViewControllerInvertColorsAccessibility *)&v5 forceDarkBackground:a3 animated:a4];
  [(BKUIPearlEnrollViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end