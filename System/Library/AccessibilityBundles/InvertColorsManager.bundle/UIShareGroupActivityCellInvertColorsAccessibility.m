@interface UIShareGroupActivityCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation UIShareGroupActivityCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIShareGroupActivityCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIShareGroupActivityCellInvertColorsAccessibility;
  [(UIShareGroupActivityCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(UIShareGroupActivityCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  objc_super v3 = [(UIShareGroupActivityCellInvertColorsAccessibility *)self safeUIViewForKey:@"imageSlotView"];
  [v3 setAccessibilityIgnoresInvertColors:1];

  v4 = [(UIShareGroupActivityCellInvertColorsAccessibility *)self safeUIViewForKey:@"activityImageView"];
  [v4 setAccessibilityIgnoresInvertColors:1];

  id v5 = [(UIShareGroupActivityCellInvertColorsAccessibility *)self safeUIViewForKey:@"badgeSlotView"];
  [v5 setAccessibilityIgnoresInvertColors:1];
}

@end