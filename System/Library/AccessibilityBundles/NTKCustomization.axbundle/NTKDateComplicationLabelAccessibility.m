@interface NTKDateComplicationLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFocusRingTintColor;
- (id)accessibilityHint;
- (id)accessibilityPath;
- (int64_t)_accessibilityFocusRingStyle;
- (unint64_t)accessibilityTraits;
@end

@implementation NTKDateComplicationLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKDateComplicationLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKDateComplicationLabel" hasInstanceVariable:@"_highlightView" withType:"UIView"];
  [v3 validateClass:@"NTKDateComplicationLabel" hasInstanceVariable:@"_computedTextColor" withType:"UIColor"];
  [v3 validateClass:@"NTKDateComplicationLabel" hasInstanceVariable:@"_internalLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  id v3 = [(NTKDateComplicationLabelAccessibility *)self safeValueForKey:@"_internalLabel"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    v5 = [v4 text];
    char v6 = [v5 length] != 0;
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)NTKDateComplicationLabelAccessibility;
  return [(NTKDateComplicationLabelAccessibility *)&v3 accessibilityTraits] & ~UIAccessibilityTraitNotEnabled;
}

- (id)accessibilityHint
{
  return 0;
}

- (id)accessibilityPath
{
  v2 = [(NTKDateComplicationLabelAccessibility *)self safeValueForKey:@"_highlightView"];
  objc_super v3 = [v2 accessibilityPath];

  return v3;
}

- (int64_t)_accessibilityFocusRingStyle
{
  return 2;
}

- (id)_accessibilityFocusRingTintColor
{
  objc_opt_class();
  objc_super v3 = [(NTKDateComplicationLabelAccessibility *)self safeValueForKey:@"_computedTextColor"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

@end