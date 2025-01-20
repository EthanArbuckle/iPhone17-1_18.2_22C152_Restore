@interface GutterizedEventTrailingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation GutterizedEventTrailingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UpNext.GutterizedEventTrailingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UpNext.VibrantLabel"];
  [v3 validateClass:@"UpNext.GutterizedEventTrailingView" isKindOfClass:@"UIView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = accessibilityLabelFromSortedLabelsInsideView(v2);

  return v3;
}

@end