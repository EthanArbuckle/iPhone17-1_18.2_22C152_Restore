@interface SBUIBackgroundViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_backgroundColorForDarkenAlpha:(double)a3 andProgress:(double)a4;
- (void)_updateAppearanceForBackgroundStyle:(int64_t)a3 transitionToSettings:(BOOL)a4;
- (void)beginTransitionToBackgroundStyle:(int64_t)a3;
@end

@implementation SBUIBackgroundViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIBackgroundView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_backgroundColorForDarkenAlpha:(double)a3 andProgress:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIBackgroundViewInvertColorsAccessibility;
  v4 = [(SBUIBackgroundViewInvertColorsAccessibility *)&v7 _backgroundColorForDarkenAlpha:a3 andProgress:a4];
  if (_AXSInvertColorsEnabled())
  {
    uint64_t v5 = AXInvertColorForColorPreservingAlpha();

    v4 = (void *)v5;
  }

  return v4;
}

- (void)beginTransitionToBackgroundStyle:(int64_t)a3
{
  if (a3 == 8)
  {
    if (_AXSInvertColorsEnabled()) {
      a3 = 4;
    }
    else {
      a3 = 8;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)SBUIBackgroundViewInvertColorsAccessibility;
  [(SBUIBackgroundViewInvertColorsAccessibility *)&v4 beginTransitionToBackgroundStyle:a3];
}

- (void)_updateAppearanceForBackgroundStyle:(int64_t)a3 transitionToSettings:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 8)
  {
    if (_AXSInvertColorsEnabled()) {
      a3 = 4;
    }
    else {
      a3 = 8;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SBUIBackgroundViewInvertColorsAccessibility;
  [(SBUIBackgroundViewInvertColorsAccessibility *)&v6 _updateAppearanceForBackgroundStyle:a3 transitionToSettings:v4];
}

@end