@interface SUNavigationControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewWillLayoutSubviews;
@end

@implementation SUNavigationControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUNavigationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v9 = [(SUNavigationControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  v3 = [v9 backgroundColor];
  if (v3)
  {
    AXColorGetLuma();
    if (v4 >= 0.5)
    {
      [v9 setAccessibilityIgnoresInvertColors:0];
      v5 = [(SUNavigationControllerInvertColorsAccessibility *)self parentViewController];
      v6 = [v5 safeUIViewForKey:@"tabBar"];
      v7 = v6;
      uint64_t v8 = 0;
    }
    else
    {
      [v9 setAccessibilityIgnoresInvertColors:1];
      v5 = [(SUNavigationControllerInvertColorsAccessibility *)self parentViewController];
      v6 = [v5 safeUIViewForKey:@"tabBar"];
      v7 = v6;
      uint64_t v8 = 1;
    }
    [v6 setAccessibilityIgnoresInvertColors:v8];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUNavigationControllerInvertColorsAccessibility;
  [(SUNavigationControllerInvertColorsAccessibility *)&v3 viewWillLayoutSubviews];
  [(SUNavigationControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end