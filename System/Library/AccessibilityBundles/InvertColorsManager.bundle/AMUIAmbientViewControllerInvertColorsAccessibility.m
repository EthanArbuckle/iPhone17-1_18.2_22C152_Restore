@interface AMUIAmbientViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation AMUIAmbientViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AMUIAmbientViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v3 = [(AMUIAmbientViewControllerInvertColorsAccessibility *)self safeValueForKey:@"_posterEditingSwitcherVC"];
  BOOL v4 = v3 == 0;

  id v5 = [(AMUIAmbientViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  [v5 setAccessibilityIgnoresInvertColors:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIAmbientViewControllerInvertColorsAccessibility;
  [(AMUIAmbientViewControllerInvertColorsAccessibility *)&v3 viewDidLoad];
  [(AMUIAmbientViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIAmbientViewControllerInvertColorsAccessibility;
  [(AMUIAmbientViewControllerInvertColorsAccessibility *)&v3 viewDidLayoutSubviews];
  [(AMUIAmbientViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end