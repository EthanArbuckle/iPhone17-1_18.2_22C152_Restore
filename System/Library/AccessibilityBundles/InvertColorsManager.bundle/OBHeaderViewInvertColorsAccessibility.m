@interface OBHeaderViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation OBHeaderViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  v3 = [(OBHeaderViewInvertColorsAccessibility *)self safeValueForKey:@"imageView"];
  [v3 setAccessibilityIgnoresInvertColors:1];

  id v4 = [(OBHeaderViewInvertColorsAccessibility *)self safeValueForKey:@"animationView"];
  [v4 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)OBHeaderViewInvertColorsAccessibility;
  [(OBHeaderViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(OBHeaderViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end