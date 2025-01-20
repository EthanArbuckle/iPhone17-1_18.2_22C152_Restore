@interface SPUIBoxViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAppliesInvertColors;
- (BOOL)_accessibilityFirstLayerInvertColors;
@end

@implementation SPUIBoxViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SPUIBoxView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAppliesInvertColors
{
  return [(SPUIBoxViewInvertColorsAccessibility *)self _accessibilityFirstLayerInvertColors];
}

- (BOOL)_accessibilityFirstLayerInvertColors
{
  int v2 = _AXSInvertColorsEnabled();
  if (v2) {
    LOBYTE(v2) = _AXSInvertColorsEnabledGlobalCached() == 0;
  }
  return v2;
}

@end