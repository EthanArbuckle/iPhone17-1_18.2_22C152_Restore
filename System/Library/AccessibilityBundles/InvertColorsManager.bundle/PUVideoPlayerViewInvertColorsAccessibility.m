@interface PUVideoPlayerViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityForceInvertColorsUpdateFlagForSuperview:(id)a3;
- (void)_setAncestorIgnoresInvertColors:(BOOL)a3;
- (void)layoutSubviews;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PUVideoPlayerViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUVideoPlayerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)_setAncestorIgnoresInvertColors:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUVideoPlayerViewInvertColorsAccessibility;
  [(PUVideoPlayerViewInvertColorsAccessibility *)&v3 _setAncestorIgnoresInvertColors:a3];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PUVideoPlayerViewInvertColorsAccessibility;
  [(PUVideoPlayerViewInvertColorsAccessibility *)&v5 layoutSubviews];
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 superview];
  [(PUVideoPlayerViewInvertColorsAccessibility *)self _accessibilityForceInvertColorsUpdateFlagForSuperview:v4];
}

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUVideoPlayerViewInvertColorsAccessibility;
  id v4 = a3;
  [(PUVideoPlayerViewInvertColorsAccessibility *)&v5 willMoveToSuperview:v4];
  -[PUVideoPlayerViewInvertColorsAccessibility _accessibilityForceInvertColorsUpdateFlagForSuperview:](self, "_accessibilityForceInvertColorsUpdateFlagForSuperview:", v4, v5.receiver, v5.super_class);
}

- (void)_accessibilityForceInvertColorsUpdateFlagForSuperview:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = v4;
    do
    {
      id v6 = [v5 accessibilityIgnoresInvertColors];
      if (v6) {
        break;
      }
      uint64_t v7 = [v5 superview];

      objc_super v5 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    id v6 = 0;
  }
  [(PUVideoPlayerViewInvertColorsAccessibility *)self _setAncestorIgnoresInvertColors:v6];

  +[AXInvertColorsAppHelper toggleInvertColors:self];
}

@end