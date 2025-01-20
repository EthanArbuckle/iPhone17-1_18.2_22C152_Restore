@interface SUUIBannerViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SUUIBannerViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(SUUIBannerViewInvertColorsAccessibility *)self safeUIViewForKey:@"_iconImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIBannerViewInvertColorsAccessibility;
  [(SUUIBannerViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SUUIBannerViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end