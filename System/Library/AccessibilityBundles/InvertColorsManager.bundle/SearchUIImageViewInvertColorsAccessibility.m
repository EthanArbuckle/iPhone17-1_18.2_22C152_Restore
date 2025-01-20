@interface SearchUIImageViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SearchUIImageViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(SearchUIImageViewInvertColorsAccessibility *)self safeValueForKey:@"imageView"];
  [v2 setAccessibilityIgnoresInvertColors:_AXSInvertColorsEnabledGlobalCached() != 0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIImageViewInvertColorsAccessibility;
  [(SearchUIImageViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SearchUIImageViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end