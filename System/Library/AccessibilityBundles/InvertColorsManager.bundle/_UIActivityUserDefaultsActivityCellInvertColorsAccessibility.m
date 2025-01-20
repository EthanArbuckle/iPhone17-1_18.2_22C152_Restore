@interface _UIActivityUserDefaultsActivityCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation _UIActivityUserDefaultsActivityCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIActivityUserDefaultsActivityCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityUserDefaultsActivityCellInvertColorsAccessibility;
  [(_UIActivityUserDefaultsActivityCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(_UIActivityUserDefaultsActivityCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(_UIActivityUserDefaultsActivityCellInvertColorsAccessibility *)self safeUIViewForKey:@"activityImageSlotView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end