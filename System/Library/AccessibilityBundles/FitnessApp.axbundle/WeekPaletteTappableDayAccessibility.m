@interface WeekPaletteTappableDayAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityPath;
- (unint64_t)accessibilityTraits;
@end

@implementation WeekPaletteTappableDayAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WeekPaletteTappableDay";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WeekPaletteTappableDay" isKindOfClass:@"ActivityTappableDay"];
  [v3 validateClass:@"WeekPaletteTappableDay" hasInstanceVariable:@"_circle" withType:"UIView"];
}

- (unint64_t)accessibilityTraits
{
  v9.receiver = self;
  v9.super_class = (Class)WeekPaletteTappableDayAccessibility;
  unint64_t v3 = [(WeekPaletteTappableDayAccessibility *)&v9 accessibilityTraits];
  v4 = [(WeekPaletteTappableDayAccessibility *)self safeValueForKey:@"_circle"];
  [v4 safeDoubleForKey:@"alpha"];
  double v6 = v5;

  UIAccessibilityTraits v7 = UIAccessibilityTraitSelected;
  if (v6 != 1.0) {
    UIAccessibilityTraits v7 = 0;
  }
  return v7 | v3;
}

- (id)accessibilityPath
{
  return 0;
}

@end