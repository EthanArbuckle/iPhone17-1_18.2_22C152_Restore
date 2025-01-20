@interface CircleListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CircleListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.CircleListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ShelfKitCollectionViews.CircleListCell" hasSwiftField:@"ordinalLabel" withSwiftType:"DynamicTypeLabel"];
  [v3 validateClass:@"ShelfKitCollectionViews.CircleListCell" hasSwiftField:@"titleLabel" withSwiftType:"DynamicTypeLabel"];
  [v3 validateClass:@"ShelfKitCollectionViews.CircleListCell" hasSwiftField:@"subtitleLabel" withSwiftType:"DynamicTypeLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CircleListCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CircleListCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(CircleListCellAccessibility *)self safeSwiftValueForKey:@"ordinalLabel"];
  v4 = [(CircleListCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v7 = [(CircleListCellAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  v5 = __UIAXStringForVariables();

  return v5;
}

@end