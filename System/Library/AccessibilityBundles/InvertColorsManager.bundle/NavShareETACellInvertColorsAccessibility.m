@interface NavShareETACellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation NavShareETACellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavShareETACell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(NavShareETACellInvertColorsAccessibility *)self safeUIViewForKey:@"_badgeImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NavShareETACellInvertColorsAccessibility;
  [(NavShareETACellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(NavShareETACellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end