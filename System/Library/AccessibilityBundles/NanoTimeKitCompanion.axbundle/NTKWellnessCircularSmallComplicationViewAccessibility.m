@interface NTKWellnessCircularSmallComplicationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation NTKWellnessCircularSmallComplicationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKWellnessCircularSmallComplicationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(NTKWellnessCircularSmallComplicationViewAccessibility *)self safeValueForKey:@"_ringsView"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityHint
{
  return (id)accessibilityLocalizedString(@"complication.hint.activity", a2);
}

@end