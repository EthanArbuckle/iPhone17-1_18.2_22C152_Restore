@interface SBHWidgetStackViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_createBackgroundViewIfNecessary:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SBHWidgetStackViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHWidgetStackViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v6 = [(SBHWidgetStackViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"backgroundView"];
  [v6 setAccessibilityMaterialViewMimicsReduceTransparency:1];
  v3 = [(SBHWidgetStackViewControllerInvertColorsAccessibility *)self safeValueForKey:@"delegate"];
  v4 = [v3 safeValueForKey:@"delegate"];

  if (UIAccessibilityIsInvertColorsEnabled() && (AXSafeClassFromString(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = +[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
    [v6 setBackgroundColor:v5];
  }
  else
  {
    [v6 setBackgroundColor:0];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHWidgetStackViewControllerInvertColorsAccessibility;
  [(SBHWidgetStackViewControllerInvertColorsAccessibility *)&v3 viewWillLayoutSubviews];
  [(SBHWidgetStackViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_createBackgroundViewIfNecessary:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHWidgetStackViewControllerInvertColorsAccessibility;
  [(SBHWidgetStackViewControllerInvertColorsAccessibility *)&v4 _createBackgroundViewIfNecessary:a3];
  [(SBHWidgetStackViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end