@interface RiverTodayCardCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation RiverTodayCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.RiverTodayCardCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ProductPageExtension.RiverTodayCardCollectionViewCell" hasSwiftField:@"labelsView" withSwiftType:"TodayCardLabelsView"];
  [v3 validateClass:@"ProductPageExtension.TodayCardLabelsView" hasSwiftField:@"badgeTransitioningContainer" withSwiftType:"TodayTransitioningLabelView"];
  [v3 validateClass:@"ProductPageExtension.TodayCardLabelsView" hasSwiftField:@"titleTransitioningContainer" withSwiftType:"TodayTransitioningLabelView"];
  [v3 validateClass:@"ProductPageExtension.TodayCardLabelsView" hasSwiftField:@"descriptionTransitioningContainer" withSwiftType:"TodayTransitioningLabelView"];
  [v3 validateClass:@"ProductPageExtension.TodayTransitioningLabelView" hasSwiftField:@"label" withSwiftType:"DynamicTypeLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)RiverTodayCardCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(RiverTodayCardCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  v2 = [(RiverTodayCardCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"labelsView"];
  objc_super v3 = [v2 safeSwiftValueForKey:@"badgeTransitioningContainer"];
  v4 = [v3 safeSwiftValueForKey:@"label"];
  v5 = [v2 safeSwiftValueForKey:@"titleTransitioningContainer"];
  v6 = [v5 safeSwiftValueForKey:@"label"];
  v7 = [v2 safeSwiftValueForKey:@"descriptionTransitioningContainer"];
  v10 = [v7 safeSwiftValueForKey:@"label"];
  v8 = __UIAXStringForVariables();

  return v8;
}

@end