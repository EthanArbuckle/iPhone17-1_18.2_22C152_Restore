@interface SeymourUI_StandardBrickItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SeymourUI_StandardBrickItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.StandardBrickItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = [(SeymourUI_StandardBrickItemCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0];
  v4 = _accessibilityReplaceStylsticBulletsForSpeaking(v2, v3);

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return AXDoesRequestingClientDeserveAutomation() == 0;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SeymourUI_StandardBrickItemCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SeymourUI_StandardBrickItemCellAccessibility *)&v3 accessibilityTraits];
}

@end