@interface SBHAddWidgetSheetAppCollectionViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SBHAddWidgetSheetAppCollectionViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHAddWidgetSheetAppCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCellInvertColorsAccessibility;
  [(SBHAddWidgetSheetAppCollectionViewCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SBHAddWidgetSheetAppCollectionViewCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  BOOL v3 = _AXSInvertColorsEnabledGlobalCached() != 0;
  id v4 = [(SBHAddWidgetSheetAppCollectionViewCellInvertColorsAccessibility *)self safeUIViewForKey:@"_imageView"];
  [v4 setAccessibilityIgnoresInvertColors:v3];
}

@end