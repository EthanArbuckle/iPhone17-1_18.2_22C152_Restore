@interface SBMainDisplaySceneLayoutStatusBarViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_layoutStatusBarForOrientation:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBMainDisplaySceneLayoutStatusBarViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBMainDisplaySceneLayoutStatusBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySceneLayoutStatusBarViewInvertColorsAccessibility;
  [(SBMainDisplaySceneLayoutStatusBarViewInvertColorsAccessibility *)&v4 traitCollectionDidChange:a3];
  [(SBMainDisplaySceneLayoutStatusBarViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_layoutStatusBarForOrientation:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplaySceneLayoutStatusBarViewInvertColorsAccessibility;
  [(SBMainDisplaySceneLayoutStatusBarViewInvertColorsAccessibility *)&v4 _layoutStatusBarForOrientation:a3];
  [(SBMainDisplaySceneLayoutStatusBarViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  v9 = self;
  v2 = [(SBMainDisplaySceneLayoutStatusBarViewInvertColorsAccessibility *)v9 window];
  v3 = [v2 traitCollection];
  objc_super v4 = (char *)[v3 userInterfaceStyle];

  v5 = v9;
  if (v4 != (unsigned char *)&dword_0 + 2)
  {
    v6 = [(SBMainDisplaySceneLayoutStatusBarViewInvertColorsAccessibility *)v9 safeUIViewForKey:@"_statusBar"];
    unsigned int v7 = [v6 _accessibilityAppliesInvertColors];
    v8 = [v6 layer];
    if (v7) {
      +[AXInvertColorsAppHelper applyInvertFilterToLayer:v8];
    }
    else {
      +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v8];
    }

    v5 = v9;
  }
}

@end