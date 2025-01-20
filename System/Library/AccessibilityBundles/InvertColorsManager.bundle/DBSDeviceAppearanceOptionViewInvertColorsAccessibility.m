@interface DBSDeviceAppearanceOptionViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_configureView;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBSDeviceAppearanceOptionViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DBSDeviceAppearanceOptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(DBSDeviceAppearanceOptionViewInvertColorsAccessibility *)self safeUIViewForKey:@"_previewImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBSDeviceAppearanceOptionViewInvertColorsAccessibility;
  [(DBSDeviceAppearanceOptionViewInvertColorsAccessibility *)&v4 traitCollectionDidChange:a3];
  [(DBSDeviceAppearanceOptionViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_configureView
{
  v3.receiver = self;
  v3.super_class = (Class)DBSDeviceAppearanceOptionViewInvertColorsAccessibility;
  [(DBSDeviceAppearanceOptionViewInvertColorsAccessibility *)&v3 _configureView];
  [(DBSDeviceAppearanceOptionViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end