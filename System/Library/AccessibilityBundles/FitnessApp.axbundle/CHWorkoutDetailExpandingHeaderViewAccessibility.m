@interface CHWorkoutDetailExpandingHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (int64_t)_accessibilityExpandedStatus;
- (unint64_t)accessibilityTraits;
@end

@implementation CHWorkoutDetailExpandingHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHWorkoutDetailExpandingHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHWorkoutDetailExpandingHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"CHWorkoutDetailExpandingHeaderView" hasInstanceVariable:@"_expandButton" withType:"UIButton"];
  [v3 validateClass:@"CHWorkoutDetailExpandingHeaderView" hasInstanceVariable:@"_expanded" withType:"B"];
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(CHWorkoutDetailExpandingHeaderViewAccessibility *)self safeUIViewForKey:@"_expandButton"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  return [(CHWorkoutDetailExpandingHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton | UIAccessibilityTraitHeader;
}

- (int64_t)_accessibilityExpandedStatus
{
  if ([(CHWorkoutDetailExpandingHeaderViewAccessibility *)self safeBoolForKey:@"_expanded"])return 1; {
  else
  }
    return 2;
}

@end