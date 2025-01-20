@interface PHHandsetDialerNumberPadButtonInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation PHHandsetDialerNumberPadButtonInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHHandsetDialerNumberPadButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PHHandsetDialerNumberPadButtonInvertColorsAccessibility;
  [(PHHandsetDialerNumberPadButtonInvertColorsAccessibility *)&v3 layoutSubviews];
  [(PHHandsetDialerNumberPadButtonInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  objc_super v3 = [v2 layer];
  +[AXInvertColorsAppHelper toggleInvertColors:v3];
}

@end