@interface ActionBrickRowCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ActionBrickRowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.ActionBrickRowCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [MEMORY[0x263EFF8C0] axArrayByIgnoringNilElementsWithCount:1, MEMORY[0x245660210](@"SeymourUI.DownloadButton", a2)];
  v4 = [(ActionBrickRowCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:1 exclusions:0 classExclusions:v3];
  v6 = _accessibilityReplaceStylsticBulletsForSpeaking(v4, v5);

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return AXDoesRequestingClientDeserveAutomation() == 0;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ActionBrickRowCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ActionBrickRowCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilityCustomActions
{
  v10[1] = *MEMORY[0x263EF8340];
  v2 = [(ActionBrickRowCellAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x245660210](@"SeymourUI.DownloadButton", a2)];
  objc_super v3 = [v2 accessibilityLabel];
  if ([v3 length])
  {
    id v4 = objc_alloc(MEMORY[0x263F1C390]);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__ActionBrickRowCellAccessibility__accessibilityCustomActions__block_invoke;
    v8[3] = &unk_26514EEA0;
    id v9 = v2;
    v5 = (void *)[v4 initWithName:v3 actionHandler:v8];
    v10[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __62__ActionBrickRowCellAccessibility__accessibilityCustomActions__block_invoke(uint64_t a1)
{
  return 1;
}

@end