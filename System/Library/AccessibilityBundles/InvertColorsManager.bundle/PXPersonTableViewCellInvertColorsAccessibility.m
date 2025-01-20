@interface PXPersonTableViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation PXPersonTableViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPersonTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(PXPersonTableViewCellInvertColorsAccessibility *)self safeUIViewForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXPersonTableViewCellInvertColorsAccessibility;
  [(PXPersonTableViewCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(PXPersonTableViewCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end