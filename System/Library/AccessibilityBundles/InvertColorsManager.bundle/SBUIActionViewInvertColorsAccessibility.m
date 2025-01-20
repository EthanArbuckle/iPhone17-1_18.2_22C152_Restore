@interface SBUIActionViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_setupSubviews;
@end

@implementation SBUIActionViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIActionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v5 = [(SBUIActionViewInvertColorsAccessibility *)self safeUIViewForKey:@"_imageView"];
  [v5 setAccessibilityIgnoresInvertColors:0];
  v3 = [(SBUIActionViewInvertColorsAccessibility *)self safeValueForKey:@"_action"];
  v4 = [v3 safeUIViewForKey:@"badgeView"];

  [v4 setAccessibilityIgnoresInvertColors:1];
}

- (void)_setupSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIActionViewInvertColorsAccessibility;
  [(SBUIActionViewInvertColorsAccessibility *)&v3 _setupSubviews];
  [(SBUIActionViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end