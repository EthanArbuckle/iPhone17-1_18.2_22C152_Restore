@interface CNActionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCustomActions;
- (id)_axActionItem;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLongPressActionView:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CNActionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNActionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNActionView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNActionView", @"platterBoxView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNActionView", @"disabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNActionView", @"type", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNActionView", @"setTitle:", "v", "@", 0);
  [v3 validateClass:@"CNActionView" hasProperty:@"style" withType:"q"];
  [v3 validateClass:@"CNActionsView"];
  [v3 validateClass:@"CNFaceTimeCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNActionView", @"actionDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNActionsView", @"actionsDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactInlineActionsViewController", @"defaultActionPerType", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNActionsView", @"didPressActionView: longPress:", "v", "@", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axActionItem
{
  id v3 = [(CNActionViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2456487F0](@"CNActionsView", a2)];
  v4 = [v3 safeValueForKey:@"actionsDelegate"];
  objc_opt_class();
  v5 = [v4 safeValueForKey:@"defaultActionPerType"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [(CNActionViewAccessibility *)self safeValueForKey:@"type"];
  v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (id)accessibilityLabel
{
  id v3 = [(CNActionViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2456487F0](@"CNFaceTimeCell", a2)];

  objc_opt_class();
  v4 = [(CNActionViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [(CNActionViewAccessibility *)self safeValueForKey:@"type"];
  v7 = labelForActionType(v6, v3 != 0);

  v8 = [v5 accessibilityLabel];
  if (!v5 || ![v5 _accessibilityViewIsVisible])
  {
    v13 = [(CNActionViewAccessibility *)self safeValueForKey:@"type"];
    labelForActionType(v13, v3 != 0);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v9 = [(CNActionViewAccessibility *)self _axActionItem];
  if (v9)
  {
    v10 = (void *)v9;
    uint64_t v11 = [v8 localizedCaseInsensitiveCompare:v7];

    if (v11)
    {
      v12 = [(CNActionViewAccessibility *)self safeValueForKey:@"type"];
      v13 = labelForActionType(v12, v3 != 0);

      v14 = [v5 accessibilityLabel];
      v15 = v14;
      if (v13)
      {
        v16 = [v14 lowercaseString];
        v17 = [v13 lowercaseString];
        int v18 = [v16 containsString:v17];

        if (v18)
        {

          v13 = 0;
        }
      }
      __UIAXStringForVariables();
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  id v19 = v8;
LABEL_11:

  return v19;
}

- (id)accessibilityUserInputLabels
{
  char v9 = 0;
  objc_opt_class();
  id v3 = [(CNActionViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4 && [v4 _accessibilityViewIsVisible])
  {
    v5 = [v4 accessibilityLabel];
    v6 = MEMORY[0x245648820]();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNActionViewAccessibility;
    v6 = [(CNActionViewAccessibility *)&v8 accessibilityUserInputLabels];
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(CNActionViewAccessibility *)self safeBoolForKey:@"disabled"];
  uint64_t v4 = *MEMORY[0x263F1CF20];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (void)_accessibilityLongPressActionView:(id)a3
{
  uint64_t v4 = [(CNActionViewAccessibility *)self safeValueForKey:@"actionDelegate"];
  id v3 = v4;
  AXPerformSafeBlock();
}

void __63__CNActionViewAccessibility__accessibilityLongPressActionView___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 40) accessibilityFrame];
    UIRectGetCenter();
    objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) _accessibilityShowContextMenuForElement:*(void *)(a1 + 40) targetPointValue:v2];
    [*(id *)(a1 + 32) didPressActionView:*(void *)(a1 + 40) longPress:1];
  }
}

- (id)_accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(CNActionViewAccessibility *)self _axActionItem];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    v6 = accessibilityLocalizedString(@"modify.selection");
    v7 = (void *)[v5 initWithName:v6 target:self selector:sel__accessibilityLongPressActionView_];

    [v3 axSafelyAddObject:v7];
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNActionViewAccessibility;
  [(CNActionViewAccessibility *)&v3 setTitle:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end