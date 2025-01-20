@interface SSSScreenshotsViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SSSScreenshotsViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SSSScreenshotsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSSScreenshotsViewControllerInvertColorsAccessibility;
  [(SSSScreenshotsViewControllerInvertColorsAccessibility *)&v4 viewWillAppear:a3];
  [(SSSScreenshotsViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v3 = [(SSSScreenshotsViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  v2 = [v3 window];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end