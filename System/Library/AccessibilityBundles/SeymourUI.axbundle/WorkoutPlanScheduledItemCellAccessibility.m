@interface WorkoutPlanScheduledItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation WorkoutPlanScheduledItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.WorkoutPlanScheduledItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = [(WorkoutPlanScheduledItemCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
  v4 = _accessibilityReplaceStylsticBulletsForSpeaking(v2, v3);

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)WorkoutPlanScheduledItemCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(WorkoutPlanScheduledItemCellAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end