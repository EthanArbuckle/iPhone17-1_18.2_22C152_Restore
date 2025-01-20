@interface SectionFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityInternalTextLinks;
- (id)_axFooterLabel;
- (id)accessibilityLabel;
@end

@implementation SectionFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.SectionFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.SectionFooterView", @"accessibilityLabelHasAction", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.SectionFooterView", @"accessibilityAttachmentHasAction", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.SectionFooterView", @"accessibilityFooterLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.DynamicTypeLabel", @"attributedText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SectionFooterViewAccessibility *)self _axFooterLabel];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)_axFooterLabel
{
  return (id)[(SectionFooterViewAccessibility *)self safeValueForKey:@"accessibilityFooterLabel"];
}

- (id)_accessibilityInternalTextLinks
{
  v16.receiver = self;
  v16.super_class = (Class)SectionFooterViewAccessibility;
  id v3 = [(SectionFooterViewAccessibility *)&v16 _accessibilityInternalTextLinks];
  if ([v3 count])
  {
    id v4 = v3;
  }
  else
  {
    v5 = [(SectionFooterViewAccessibility *)self _axFooterLabel];
    v6 = [v5 safeValueForKey:@"attributedText"];

    if ([v6 length])
    {
      uint64_t v7 = [v6 length];
      v8 = [(SectionFooterViewAccessibility *)self _accessibilityValueForKey:@"AXLinks"];
      v9 = v8;
      if (v8 && [v8 count])
      {
        id v4 = v9;
      }
      else
      {
        v10 = [MEMORY[0x263EFF980] array];

        [(SectionFooterViewAccessibility *)self _accessibilitySetRetainedValue:v10 forKey:@"AXLinks"];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __65__SectionFooterViewAccessibility__accessibilityInternalTextLinks__block_invoke;
        v13[3] = &unk_265122B98;
        v13[4] = self;
        id v14 = v6;
        id v11 = v10;
        id v15 = v11;
        objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0x100000, v13);
        id v4 = v11;
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

void __65__SectionFooterViewAccessibility__accessibilityInternalTextLinks__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if ([a2 count])
  {
    id v9 = (id)[objc_alloc(MEMORY[0x263F811C0]) initWithAccessibilityContainer:*(void *)(a1 + 32)];
    objc_msgSend(v9, "setRange:", a3, a4);
    uint64_t v7 = [*(id *)(a1 + 40) string];
    v8 = objc_msgSend(v7, "substringWithRange:", a3, a4);
    [v9 setAccessibilityLabel:v8];

    [*(id *)(a1 + 48) axSafelyAddObject:v9];
  }
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  if ([(SectionFooterViewAccessibility *)self safeBoolForKey:@"accessibilityAttachmentHasAction"])return 1; {

  }
  return [(SectionFooterViewAccessibility *)self safeBoolForKey:@"accessibilityLabelHasAction"];
}

@end