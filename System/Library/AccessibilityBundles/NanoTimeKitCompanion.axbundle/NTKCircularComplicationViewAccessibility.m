@interface NTKCircularComplicationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation NTKCircularComplicationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCircularComplicationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCircularComplicationViewAccessibility;
  return [(NTKCircularComplicationViewAccessibility *)&v3 accessibilityTraits] & ~UIAccessibilityTraitNotEnabled;
}

- (id)accessibilityLabel
{
  objc_super v3 = [(NTKCircularComplicationViewAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    v4 = [(NTKCircularComplicationViewAccessibility *)self accessibilityUserDefinedLabel];
  }
  else
  {
    v5 = [(NTKCircularComplicationViewAccessibility *)self safeValueForKey:@"complicationTemplate"];
    v4 = [v5 accessibilityLabel];
  }

  return v4;
}

- (id)accessibilityValue
{
  objc_super v3 = [(NTKCircularComplicationViewAccessibility *)self accessibilityUserDefinedValue];

  if (v3)
  {
    v4 = [(NTKCircularComplicationViewAccessibility *)self accessibilityUserDefinedValue];
  }
  else
  {
    v5 = [(NTKCircularComplicationViewAccessibility *)self safeValueForKey:@"complicationTemplate"];
    v4 = [v5 accessibilityValue];
  }

  return v4;
}

- (id)accessibilityPath
{
  v2 = [(NTKCircularComplicationViewAccessibility *)self _accessibilityCirclePathBasedOnBoundsWidth];
  objc_super v3 = UIAccessibilityInsetBezierPath();

  return v3;
}

@end