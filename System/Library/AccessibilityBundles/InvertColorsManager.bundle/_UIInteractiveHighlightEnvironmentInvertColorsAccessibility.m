@interface _UIInteractiveHighlightEnvironmentInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)newViewRecordForView:(id)a3 options:(unint64_t)a4;
@end

@implementation _UIInteractiveHighlightEnvironmentInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIInteractiveHighlightEnvironment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)newViewRecordForView:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIInteractiveHighlightEnvironmentInvertColorsAccessibility;
  id v7 = [(_UIInteractiveHighlightEnvironmentInvertColorsAccessibility *)&v12 newViewRecordForView:v6 options:a4];
  if (_AXSInvertColorsEnabled())
  {
    objc_opt_class();
    v8 = __UIAccessibilityCastAsClass();
    unsigned int v9 = [v8 accessibilityIgnoresInvertColors];

    if (v9)
    {
      v10 = [v7 safeUIViewForKey:@"_effectView"];
      [v10 setAccessibilityIgnoresInvertColors:1];
    }
  }

  return v7;
}

@end