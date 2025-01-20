@interface UIAirDropGroupActivityCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation UIAirDropGroupActivityCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIAirDropGroupActivityCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIAirDropGroupActivityCellInvertColorsAccessibility;
  [(UIAirDropGroupActivityCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(UIAirDropGroupActivityCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  objc_super v3 = [(UIAirDropGroupActivityCellInvertColorsAccessibility *)self safeUIViewForKey:@"imageView"];
  [v3 setAccessibilityIgnoresInvertColors:1];

  v4 = [(UIAirDropGroupActivityCellInvertColorsAccessibility *)self safeUIViewForKey:@"imageSlotView"];
  [v4 setAccessibilityIgnoresInvertColors:1];

  v5 = [(UIAirDropGroupActivityCellInvertColorsAccessibility *)self safeUIViewForKey:@"transportSlotView"];
  [v5 setAccessibilityIgnoresInvertColors:1];

  id v6 = [(UIAirDropGroupActivityCellInvertColorsAccessibility *)self safeUIViewForKey:@"transportImageView"];
  [v6 setAccessibilityIgnoresInvertColors:1];
}

@end