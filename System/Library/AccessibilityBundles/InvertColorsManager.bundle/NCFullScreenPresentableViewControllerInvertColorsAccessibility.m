@interface NCFullScreenPresentableViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLoad;
@end

@implementation NCFullScreenPresentableViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCFullScreenPresentableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(NCFullScreenPresentableViewControllerInvertColorsAccessibility *)self safeValueForKey:@"view"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NCFullScreenPresentableViewControllerInvertColorsAccessibility;
  [(NCFullScreenPresentableViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(NCFullScreenPresentableViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end