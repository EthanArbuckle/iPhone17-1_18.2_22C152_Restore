@interface PRQuickActionEditingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHasLeadingAction;
- (BOOL)_accessibilityHasTrailingAction;
- (id)_accessibilityProminentButtonsView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMarkupButtons;
- (void)_updateButtonsVisibility;
@end

@implementation PRQuickActionEditingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRQuickActionEditingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRQuickActionEditingViewController", @"prominentButtonsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRQuickActionEditingViewController", @"leadingControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRQuickActionEditingViewController", @"trailingControl", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRQuickActionEditingViewController", @"_updateButtonsVisibility", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRQuickActionEditingViewController", @"_leadingActionDidFire", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRQuickActionEditingViewController", @"_trailingActionDidFire", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRQuickActionEditingViewController", @"_presentWidgetIntentConfigurationForControlWithPosition:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRQuickActionEditingViewController", @"_handleRemoveButtonActionForQuickActionPosition:", "v", "q", 0);
  [v3 validateClass:@"PRQuickActionsEditingReticleView" hasInstanceVariable:@"_reticleView" withType:"PREditingReticleView"];
  [v3 validateClass:@"PRQuickActionControlView" hasInstanceVariable:@"_controlInstance" withType:"CHUISControlInstance"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PRQuickActionEditingViewControllerAccessibility;
  [(PRQuickActionEditingViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PRQuickActionEditingViewControllerAccessibility *)self _accessibilityMarkupButtons];
}

- (void)_updateButtonsVisibility
{
  v3.receiver = self;
  v3.super_class = (Class)PRQuickActionEditingViewControllerAccessibility;
  [(PRQuickActionEditingViewControllerAccessibility *)&v3 _updateButtonsVisibility];
  [(PRQuickActionEditingViewControllerAccessibility *)self _accessibilityMarkupButtons];
}

- (void)_accessibilityMarkupButtons
{
  objc_super v3 = [(PRQuickActionEditingViewControllerAccessibility *)self _accessibilityProminentButtonsView];
  v4 = [v3 leadingRemoveButton];
  v11 = [v3 trailingRemoveButton];
  v5 = [v3 leadingButton];
  [v5 setAccessibilityElementsHidden:1];
  v6 = [v3 trailingButton];
  [v6 setAccessibilityElementsHidden:1];
  objc_initWeak(location, self);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke;
  v30[3] = &unk_265145DF0;
  objc_copyWeak(&v31, location);
  [v4 setAccessibilityLabelBlock:v30];
  v7 = [v3 leadingReticle];
  [v7 setIsAccessibilityElement:1];
  uint64_t v8 = *MEMORY[0x263F1CEE8];
  [v7 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_2;
  v28[3] = &unk_265145DF0;
  objc_copyWeak(&v29, location);
  [v7 setAccessibilityHintBlock:v28];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_3;
  v26[3] = &unk_265145DF0;
  objc_copyWeak(&v27, location);
  [v7 setAccessibilityLabelBlock:v26];
  v10 = v5;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_4;
  v24[3] = &unk_265145E40;
  objc_copyWeak(&v25, location);
  [v7 setAccessibilityActivateBlock:v24];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_6;
  v22[3] = &unk_265145E90;
  objc_copyWeak(&v23, location);
  [v7 setAccessibilityCustomActionsBlock:v22];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_9;
  v20[3] = &unk_265145DF0;
  objc_copyWeak(&v21, location);
  [v11 setAccessibilityLabelBlock:v20];
  v9 = [v3 trailingReticle];
  [v9 setIsAccessibilityElement:1];
  [v9 setAccessibilityTraits:v8];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_10;
  v18[3] = &unk_265145DF0;
  objc_copyWeak(&v19, location);
  [v9 setAccessibilityHintBlock:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_11;
  v16[3] = &unk_265145DF0;
  objc_copyWeak(&v17, location);
  [v9 setAccessibilityLabelBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_12;
  v14[3] = &unk_265145E40;
  objc_copyWeak(&v15, location);
  [v9 setAccessibilityActivateBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_14;
  v12[3] = &unk_265145E90;
  objc_copyWeak(&v13, location);
  [v9 setAccessibilityCustomActionsBlock:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _accessibilityHasLeadingAction];

  if (v3)
  {
    objc_opt_class();
    id v4 = objc_loadWeakRetained(v1);
    v5 = [v4 _accessibilityProminentButtonsView];
    v6 = [v5 leadingButton];
    v7 = [v6 glyphView];
    uint64_t v8 = [v7 safeValueForKey:@"_controlInstance"];
    v9 = __UIAccessibilityCastAsClass();

    v10 = [v9 descriptor];
    v11 = [v10 displayName];

    v12 = accessibilityLocalizedString(@"editing.minus.close.box.button.label");
    id v13 = AXCFormattedString();
  }
  else
  {
    id v13 = accessibilityLocalizedString(@"quick.action.remove");
  }

  return v13;
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityProminentButtonsView];
  int v3 = [v2 leadingReticle];
  id v4 = [v3 safeValueForKey:@"_reticleView"];
  v5 = [v4 accessibilityHint];

  return v5;
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _accessibilityHasLeadingAction];

  if (v3)
  {
    objc_opt_class();
    id v4 = objc_loadWeakRetained(v1);
    v5 = [v4 _accessibilityProminentButtonsView];
    v6 = [v5 leadingButton];
    v7 = [v6 glyphView];
    uint64_t v8 = [v7 safeValueForKey:@"_controlInstance"];
    v9 = __UIAccessibilityCastAsClass();

    v10 = [v9 descriptor];
    v11 = [v10 displayName];
  }
  else
  {
    v11 = accessibilityLocalizedString(@"quick.action.add");
  }

  return v11;
}

uint64_t __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_4(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_5(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _accessibilityHasLeadingAction];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = v4;
  if (v3) {
    [v4 _presentWidgetIntentConfigurationForControlWithPosition:1];
  }
  else {
    [v4 _leadingActionDidFire];
  }
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_6(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _accessibilityHasLeadingAction];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C390]);
    id v5 = accessibilityLocalizedString(@"quick.action.remove");
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_7;
    v9[3] = &unk_265145E68;
    objc_copyWeak(&v10, v1);
    v6 = (void *)[v4 initWithName:v5 actionHandler:v9];

    v11[0] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

    objc_destroyWeak(&v10);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRemoveButtonActionForQuickActionPosition:1];
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_9(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _accessibilityHasLeadingAction];

  if (v3)
  {
    objc_opt_class();
    id v4 = objc_loadWeakRetained(v1);
    id v5 = [v4 _accessibilityProminentButtonsView];
    v6 = [v5 trailingButton];
    v7 = [v6 glyphView];
    uint64_t v8 = [v7 safeValueForKey:@"_controlInstance"];
    v9 = __UIAccessibilityCastAsClass();

    id v10 = [v9 descriptor];
    v11 = [v10 displayName];

    v12 = accessibilityLocalizedString(@"editing.minus.close.box.button.label");
    id v13 = AXCFormattedString();
  }
  else
  {
    id v13 = accessibilityLocalizedString(@"quick.action.remove");
  }

  return v13;
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _accessibilityProminentButtonsView];
  int v3 = [v2 trailingReticle];
  id v4 = [v3 safeValueForKey:@"_reticleView"];
  id v5 = [v4 accessibilityHint];

  return v5;
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_11(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _accessibilityHasTrailingAction];

  if (v3)
  {
    objc_opt_class();
    id v4 = objc_loadWeakRetained(v1);
    id v5 = [v4 _accessibilityProminentButtonsView];
    v6 = [v5 trailingButton];
    v7 = [v6 glyphView];
    uint64_t v8 = [v7 safeValueForKey:@"_controlInstance"];
    v9 = __UIAccessibilityCastAsClass();

    id v10 = [v9 descriptor];
    v11 = [v10 displayName];
  }
  else
  {
    v11 = accessibilityLocalizedString(@"quick.action.add");
  }

  return v11;
}

uint64_t __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_12(uint64_t a1)
{
  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_13(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _accessibilityHasTrailingAction];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = v4;
  if (v3) {
    [v4 _presentWidgetIntentConfigurationForControlWithPosition:2];
  }
  else {
    [v4 _trailingActionDidFire];
  }
}

id __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_14(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained _accessibilityHasTrailingAction];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C390]);
    id v5 = accessibilityLocalizedString(@"quick.action.remove");
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_15;
    v9[3] = &unk_265145E68;
    objc_copyWeak(&v10, v1);
    v6 = (void *)[v4 initWithName:v5 actionHandler:v9];

    v11[0] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

    objc_destroyWeak(&v10);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __78__PRQuickActionEditingViewControllerAccessibility__accessibilityMarkupButtons__block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRemoveButtonActionForQuickActionPosition:2];
}

- (id)_accessibilityProminentButtonsView
{
  objc_opt_class();
  id v3 = [(PRQuickActionEditingViewControllerAccessibility *)self safeValueForKey:@"prominentButtonsView"];
  id v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (BOOL)_accessibilityHasLeadingAction
{
  id v2 = [(PRQuickActionEditingViewControllerAccessibility *)self safeValueForKey:@"leadingControl"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_accessibilityHasTrailingAction
{
  id v2 = [(PRQuickActionEditingViewControllerAccessibility *)self safeValueForKey:@"trailingControl"];
  BOOL v3 = v2 != 0;

  return v3;
}

@end