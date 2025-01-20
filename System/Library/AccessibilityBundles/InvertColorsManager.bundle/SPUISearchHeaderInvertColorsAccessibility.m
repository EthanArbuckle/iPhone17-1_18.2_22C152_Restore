@interface SPUISearchHeaderInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation SPUISearchHeaderInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SPUISearchHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return _AXSInvertColorsEnabledGlobalCached() != 0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SPUISearchHeaderInvertColorsAccessibility;
  [(SPUISearchHeaderInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SPUISearchHeaderInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  if (_AXSInvertColorsEnabledGlobalCached())
  {
    objc_opt_class();
    objc_super v3 = [(SPUISearchHeaderInvertColorsAccessibility *)self safeValueForKey:@"cancelButton"];
    v4 = __UIAccessibilityCastAsClass();

    v5 = +[UIColor whiteColor];
    v6 = [v4 titleLabel];
    [v6 setTextColor:v5];
  }
  else
  {
    AXPerformSafeBlock();
  }
}

@end