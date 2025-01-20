@interface CHWorkoutDetailSummaryTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation CHWorkoutDetailSummaryTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHWorkoutDetailSummaryTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CHWorkoutDetailSummaryTableViewCellAccessibility;
  return UIAccessibilityTraitButton | [(CHWorkoutDetailSummaryTableViewCellAccessibility *)&v3 accessibilityTraits];
}

@end