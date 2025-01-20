@interface BCBatteryWidgetRowViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation BCBatteryWidgetRowViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BCBatteryWidgetRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BCBatteryWidgetRowViewInvertColorsAccessibility;
  [(BCBatteryWidgetRowViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(BCBatteryWidgetRowViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(BCBatteryWidgetRowViewInvertColorsAccessibility *)self safeUIViewForKey:@"_glyphImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

@end