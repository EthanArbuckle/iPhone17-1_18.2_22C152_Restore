@interface BrowserControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_initSubviews;
@end

@implementation BrowserControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BrowserController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_initSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BrowserControllerInvertColorsAccessibility;
  [(BrowserControllerInvertColorsAccessibility *)&v3 _initSubviews];
  [(BrowserControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  objc_super v3 = [(BrowserControllerInvertColorsAccessibility *)self safeValueForKey:@"rootViewController"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 view];
  v6 = [v5 window];

  if (UIAccessibilityIsInvertColorsEnabled()) {
    id v7 = +[AXInvertColorsAppHelper insertBackgroundView:v6 alpha:1.0];
  }
  else {
    +[AXInvertColorsAppHelper removeBackgroundView:v6];
  }
}

@end