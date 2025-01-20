@interface SBAppSwitcherPageViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SBAppSwitcherPageViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppSwitcherPageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v8 = [(SBAppSwitcherPageViewInvertColorsAccessibility *)self safeUIViewForKey:@"_shadowView"];
  v3 = [(SBAppSwitcherPageViewInvertColorsAccessibility *)self safeUIViewForKey:@"_dimmingView"];
  if (!UIAccessibilityIsInvertColorsEnabled())
  {
    if (!v8) {
      goto LABEL_9;
    }
    v4 = +[UIColor blackColor];
    goto LABEL_8;
  }
  if (v3) {
    [v3 setAccessibilityIgnoresInvertColors:1];
  }
  if (v8)
  {
    v4 = +[UIColor whiteColor];
LABEL_8:
    id v5 = v4;
    id v6 = [v5 CGColor];
    v7 = [v8 layer];
    [v7 setShadowColor:v6];
  }
LABEL_9:
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBAppSwitcherPageViewInvertColorsAccessibility;
  [(SBAppSwitcherPageViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SBAppSwitcherPageViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end