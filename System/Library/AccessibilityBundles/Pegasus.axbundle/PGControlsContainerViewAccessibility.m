@interface PGControlsContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_controlsShouldAutoHide;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setControlsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_setPrefersControlsHidden:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation PGControlsContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PGControlsContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGControlsContainerView", @"_setPrefersControlsHidden:animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGControlsContainerView", @"_setControlsHidden:animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGControlsContainerView", @"_controlsShouldAutoHide", "B", 0);
  [v3 validateClass:@"PGControlsView"];
  [v3 validateClass:@"PGControlsContainerView" hasInstanceVariable:@"_controlsView" withType:"PGControlsView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGControlsView", @"prefersControlsHidden", "B", 0);
  [v3 validateClass:@"PGControlsViewModel"];
  [v3 validateClass:@"PGControlsContainerView" hasInstanceVariable:@"_viewModel" withType:"PGControlsViewModel"];
  [v3 validateClass:@"PGControlsViewModelValues"];
  [v3 validateClass:@"PGControlsViewModel" hasInstanceVariable:@"_values" withType:"PGControlsViewModelValues"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGControlsViewModelValues", @"restoreButtonAccessibilityIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGControlsViewModelValues", @"cancelButtonAccessibilityIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGControlsViewModelValues", @"actionButtonAccessibilityIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGControlsViewModelValues", @"skipBackButtonAccessibilityIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGControlsViewModelValues", @"skipForwardButtonAccessibilityIdentifier", "@", 0);
  [v3 validateClass:@"PGButtonView"];
  [v3 validateClass:@"PGControlsView" hasInstanceVariable:@"_restoreButton" withType:"PGButtonView"];
  [v3 validateClass:@"PGControlsView" hasInstanceVariable:@"_cancelButton" withType:"PGButtonView"];
  [v3 validateClass:@"PGControlsView" hasInstanceVariable:@"_skipBackButton" withType:"PGButtonView"];
  [v3 validateClass:@"PGControlsView" hasInstanceVariable:@"_actionButton" withType:"PGButtonView"];
  [v3 validateClass:@"PGControlsView" hasInstanceVariable:@"_skipForwardButton" withType:"PGButtonView"];
  [v3 validateClass:@"PGControlsView" hasInstanceVariable:@"_liveIndicatorBadgeButton" withType:"PGButtonView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v38.receiver = self;
  v38.super_class = (Class)PGControlsContainerViewAccessibility;
  [(PGControlsContainerViewAccessibility *)&v38 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PGControlsContainerViewAccessibility *)self safeValueForKey:@"_controlsView"];
  objc_initWeak(&location, self);
  v4 = [v3 safeValueForKey:@"_cancelButton"];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v35[3] = &unk_265142B30;
  objc_copyWeak(&v36, &location);
  [v4 _setAccessibilityLabelBlock:v35];

  v5 = [v3 safeValueForKey:@"_skipBackButton"];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v33[3] = &unk_265142B30;
  objc_copyWeak(&v34, &location);
  [v5 _setAccessibilityLabelBlock:v33];

  v6 = [v3 safeValueForKey:@"_skipForwardButton"];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v31[3] = &unk_265142B30;
  objc_copyWeak(&v32, &location);
  [v6 _setAccessibilityLabelBlock:v31];

  v7 = [v3 safeValueForKey:@"_restoreButton"];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v29[3] = &unk_265142B30;
  objc_copyWeak(&v30, &location);
  [v7 _setAccessibilityLabelBlock:v29];

  v8 = [v3 safeValueForKey:@"_actionButton"];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v27[3] = &unk_265142B30;
  objc_copyWeak(&v28, &location);
  [v8 _setAccessibilityLabelBlock:v27];

  v9 = [v3 safeValueForKey:@"_liveIndicatorBadgeButton"];
  v10 = accessibilityLocalizedString(@"pip.live");
  [v9 setAccessibilityLabel:v10];

  v11 = (void *)MEMORY[0x263EFF8C0];
  v12 = [v3 safeValueForKey:@"_cancelButton"];
  v13 = [v3 safeValueForKey:@"_skipBackButton"];
  v14 = [v3 safeValueForKey:@"_skipForwardButton"];
  v15 = [v3 safeValueForKey:@"_restoreButton"];
  v16 = [v3 safeValueForKey:@"_actionButton"];
  v17 = objc_msgSend(v11, "axArrayByIgnoringNilElementsWithCount:", 5, v12, v13, v14, v15, v16);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v24;
    uint64_t v21 = *MEMORY[0x263F1CEE8];
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "setAccessibilityTraits:", v21 | objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "accessibilityTraits"));
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v39 count:16];
    }
    while (v19);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

id __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_viewModel"];
  id v3 = [v2 safeValueForKey:@"_values"];
  v4 = [v3 safeStringForKey:@"cancelButtonAccessibilityIdentifier"];

  return v4;
}

id __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_viewModel"];
  id v3 = [v2 safeValueForKey:@"_values"];
  v4 = [v3 safeStringForKey:@"skipBackButtonAccessibilityIdentifier"];

  return v4;
}

id __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_viewModel"];
  id v3 = [v2 safeValueForKey:@"_values"];
  v4 = [v3 safeStringForKey:@"skipForwardButtonAccessibilityIdentifier"];

  return v4;
}

id __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_viewModel"];
  id v3 = [v2 safeValueForKey:@"_values"];
  v4 = [v3 safeStringForKey:@"restoreButtonAccessibilityIdentifier"];

  return v4;
}

id __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_viewModel"];
  id v3 = [v2 safeValueForKey:@"_values"];
  v4 = [v3 safeStringForKey:@"actionButtonAccessibilityIdentifier"];

  return v4;
}

- (void)_setPrefersControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(PGControlsContainerViewAccessibility *)self safeValueForKeyPath:@"_controlsView"];
  int v8 = [v7 safeBoolForKey:@"prefersControlsHidden"];
  v10.receiver = self;
  v10.super_class = (Class)PGControlsContainerViewAccessibility;
  [(PGControlsContainerViewAccessibility *)&v10 _setPrefersControlsHidden:v5 animated:v4];
  if (!v5 && v8)
  {
    id v9 = v7;
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __75__PGControlsContainerViewAccessibility__setPrefersControlsHidden_animated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safeValueForKey:@"_cancelButton"];
  UIAccessibilityPostNotification(*MEMORY[0x263F812F8], v1);
}

- (void)_setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = [(PGControlsContainerViewAccessibility *)self safeValueForKey:@"_controlsView"];
  [v7 safeBoolForKey:@"isHidden"];
  v9.receiver = self;
  v9.super_class = (Class)PGControlsContainerViewAccessibility;
  [(PGControlsContainerViewAccessibility *)&v9 _setControlsHidden:v5 animated:v4];
  id v8 = v7;
  AXPerformBlockOnMainThreadAfterDelay();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

void __68__PGControlsContainerViewAccessibility__setControlsHidden_animated___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) safeBoolForKey:@"isHidden"];
  if (*(unsigned __int8 *)(a1 + 40) != v2)
  {
    if (v2) {
      id v3 = @"pip.controls.hidden";
    }
    else {
      id v3 = @"pip.controls.visible";
    }
    accessibilityLocalizedString(v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v4);
  }
}

- (BOOL)_controlsShouldAutoHide
{
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || (_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PGControlsContainerViewAccessibility;
  return [(PGControlsContainerViewAccessibility *)&v4 _controlsShouldAutoHide];
}

@end