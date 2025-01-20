@interface CSModalButtonInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation CSModalButtonInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSModalButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSModalButtonInvertColorsAccessibility;
  [(CSModalButtonInvertColorsAccessibility *)&v3 layoutSubviews];
  [(CSModalButtonInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  objc_super v3 = [v2 layer];
  +[AXInvertColorsAppHelper toggleInvertColors:v3];

  v4 = [v2 titleLabel];
  v5 = [v4 layer];
  +[AXInvertColorsAppHelper toggleInvertColors:v5];
}

@end