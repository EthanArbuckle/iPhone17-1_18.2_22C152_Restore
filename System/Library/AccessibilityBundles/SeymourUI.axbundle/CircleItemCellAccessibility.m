@interface CircleItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CircleItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.CircleItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return (id)[(CircleItemCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CircleItemCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CircleItemCellAccessibility *)&v3 accessibilityTraits];
}

@end