@interface SBIconBadgeViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SBIconBadgeViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBIconBadgeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBIconBadgeViewInvertColorsAccessibility;
  [(SBIconBadgeViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SBIconBadgeViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 setAccessibilityIgnoresInvertColors:_AXSInvertColorsEnabledGlobalCached() != 0];
}

@end