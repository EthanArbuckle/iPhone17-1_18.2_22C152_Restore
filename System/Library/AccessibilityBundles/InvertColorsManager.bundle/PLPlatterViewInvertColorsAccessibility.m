@interface PLPlatterViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityLoadInvertColors;
- (void)layoutSubviews;
@end

@implementation PLPlatterViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLPlatterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return [(PLPlatterViewInvertColorsAccessibility *)self safeIntegerForKey:@"materialRecipe"] == (char *)&stru_20.flags + 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PLPlatterViewInvertColorsAccessibility;
  [(PLPlatterViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(PLPlatterViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_accessibilityLoadInvertColors
{
  if ([(PLPlatterViewInvertColorsAccessibility *)self accessibilityIgnoresInvertColors])
  {
    objc_super v3 = [(PLPlatterViewInvertColorsAccessibility *)self safeValueForKey:@"backgroundMaterialView"];
    objc_opt_class();
    v4 = [v3 safeValueForKey:@"_materialLayer"];
    v5 = __UIAccessibilityCastAsClass();

    if (v5) {
      +[AXInvertColorsAppHelper toggleInvertColors:v5 moveFilterToFront:1];
    }
  }
}

@end