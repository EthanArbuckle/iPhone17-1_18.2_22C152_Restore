@interface CHWorkoutDetailAwardTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CHWorkoutDetailAwardTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHWorkoutDetailAwardTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return [(CHWorkoutDetailAwardTableViewCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CHWorkoutDetailAwardTableViewCellAccessibility;
  return UIAccessibilityTraitButton | [(CHWorkoutDetailAwardTableViewCellAccessibility *)&v3 accessibilityTraits];
}

@end