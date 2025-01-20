@interface SeymourUI_ProgramBrickItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SeymourUI_ProgramBrickItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.ProgramBrickItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return (id)[(SeymourUI_ProgramBrickItemCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SeymourUI_ProgramBrickItemCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SeymourUI_ProgramBrickItemCellAccessibility *)&v3 accessibilityTraits];
}

@end