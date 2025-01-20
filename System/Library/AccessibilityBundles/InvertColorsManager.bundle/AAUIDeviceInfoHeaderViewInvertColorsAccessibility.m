@interface AAUIDeviceInfoHeaderViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_setupSubviews;
@end

@implementation AAUIDeviceInfoHeaderViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AAUIDeviceInfoHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(AAUIDeviceInfoHeaderViewInvertColorsAccessibility *)self safeUIViewForKey:@"_deviceImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)_setupSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AAUIDeviceInfoHeaderViewInvertColorsAccessibility;
  [(AAUIDeviceInfoHeaderViewInvertColorsAccessibility *)&v3 _setupSubviews];
  [(AAUIDeviceInfoHeaderViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end