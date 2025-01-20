@interface _UIActivityGroupActivityCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (_UIActivityGroupActivityCellInvertColorsAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadInvertColors;
- (void)setHighlightedImageView:(id)a3;
@end

@implementation _UIActivityGroupActivityCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIActivityGroupActivityCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v3 = [(_UIActivityGroupActivityCellInvertColorsAccessibility *)self safeValueForKey:@"imageView"];
  [v3 setAccessibilityIgnoresInvertColors:1];

  id v4 = [(_UIActivityGroupActivityCellInvertColorsAccessibility *)self safeValueForKey:@"highlightedImageView"];
  [v4 setAccessibilityIgnoresInvertColors:1];
}

- (void)setHighlightedImageView:(id)a3
{
  id v4 = a3;
  [v4 setAccessibilityIgnoresInvertColors:1];
  v5.receiver = self;
  v5.super_class = (Class)_UIActivityGroupActivityCellInvertColorsAccessibility;
  [(_UIActivityGroupActivityCellInvertColorsAccessibility *)&v5 setHighlightedImageView:v4];
}

- (_UIActivityGroupActivityCellInvertColorsAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIActivityGroupActivityCellInvertColorsAccessibility;
  v3 = -[_UIActivityGroupActivityCellInvertColorsAccessibility initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIActivityGroupActivityCellInvertColorsAccessibility *)v3 _accessibilityLoadInvertColors];

  return v3;
}

@end