@interface CFXCaptureViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CFXCaptureViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CFXCaptureViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(CFXCaptureViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CFXCaptureViewControllerInvertColorsAccessibility;
  [(CFXCaptureViewControllerInvertColorsAccessibility *)&v4 viewWillAppear:a3];
  [(CFXCaptureViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end