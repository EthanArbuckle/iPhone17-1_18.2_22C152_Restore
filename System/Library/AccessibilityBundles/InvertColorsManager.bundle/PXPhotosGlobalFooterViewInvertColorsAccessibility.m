@interface PXPhotosGlobalFooterViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation PXPhotosGlobalFooterViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPhotosGlobalFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v6 = self;
  if (_AXSInvertColorsEnabled()
    && ([(PXPhotosGlobalFooterViewInvertColorsAccessibility *)v6 window],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 traitCollection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (char *)[v3 userInterfaceStyle],
        v3,
        v2,
        v4 == (unsigned char *)&dword_0 + 1))
  {
    if ([(PXPhotosGlobalFooterViewInvertColorsAccessibility *)v6 accessibilityInvertColorsIsolatedTree])goto LABEL_7; {
    [(PXPhotosGlobalFooterViewInvertColorsAccessibility *)v6 setAccessibilityInvertColorsIsolatedTree:1];
    }
    v5 = [(PXPhotosGlobalFooterViewInvertColorsAccessibility *)v6 layer];
    +[AXInvertColorsAppHelper applyInvertFilterToLayer:v5];
  }
  else
  {
    [(PXPhotosGlobalFooterViewInvertColorsAccessibility *)v6 setAccessibilityInvertColorsIsolatedTree:0];
    v5 = [(PXPhotosGlobalFooterViewInvertColorsAccessibility *)v6 layer];
    +[AXInvertColorsAppHelper unapplyInvertFilterToLayer:v5];
  }

LABEL_7:
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosGlobalFooterViewInvertColorsAccessibility;
  [(PXPhotosGlobalFooterViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(PXPhotosGlobalFooterViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end