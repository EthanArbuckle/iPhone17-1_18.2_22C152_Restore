@interface HUQuickControlRingSliderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (double)_axAdjustmentDelta;
- (id)_axInteractionDelegate;
- (id)_axLocalizedStringForAXControlValueType:(unint64_t)a3;
- (id)_axViewController;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAdjustValueOfUpperBound:(BOOL)a3 increment:(BOOL)a4;
@end

@implementation HUQuickControlRingSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlRingSliderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUQuickControlRingSliderView" hasInstanceVariable:@"_profile" withType:"HUQuickControlRingSliderViewProfile"];
  [v3 validateClass:@"HUQuickControlRingSliderView" hasInstanceVariable:@"_primaryHandleView" withType:"HUQuickControlRingSliderHandleView"];
  [v3 validateClass:@"HUQuickControlRingSliderView" hasInstanceVariable:@"_secondaryHandleView" withType:"HUQuickControlRingSliderHandleView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlRingSliderView", @"supplementaryValueMarkingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlRingSliderView", @"primaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlRingSliderView", @"supplementaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlRingSliderView", @"showOffState", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlRingSliderView", @"setUserInteractionActive:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlRingSliderViewProfile", @"shouldShowSupplementaryValue", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlRingSliderViewProfile", @"gradationMarkingValues", "@", 0);
  [v3 validateClass:@"HUQuickControlRingSliderView" conformsToProtocol:@"HUQuickControlInteractiveView"];
  [v3 validateProtocol:@"HUQuickControlInteractiveView" hasMethod:@"interactionDelegate" isInstanceMethod:1 isRequired:1];
  [v3 validateProtocol:@"HUQuickControlInteractiveView" conformsToProtocol:@"HUQuickControlControllableView"];
  [v3 validateProtocol:@"HUQuickControlControllableView" hasMethod:@"value" isInstanceMethod:1 isRequired:1];
  [v3 validateProtocol:@"HUQuickControlControllableView" hasMethod:@"setValue:" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"HUQuickControlRingSliderHandleView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"HUQuickControlRingSliderInteractionCoordinator" conformsToProtocol:@"HUQuickControlViewInteractionDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlRingSliderInteractionCoordinator", @"value", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlRingSliderInteractionCoordinator", @"setUserInteractionActive:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlRingSliderInteractionCoordinator", @"setFirstTouchDown:", "v", "B", 0);
  [v3 validateClass:@"HUQuickControlRingSliderInteractionCoordinator" hasInstanceVariable:@"_delegate" withType:"<HUQuickControlInteractionCoordinatorDelegate>"];
  [v3 validateClass:@"HUQuickControlRingSliderInteractionCoordinator" isKindOfClass:@"HUQuickControlInteractionCoordinator"];
  [v3 validateClass:@"HUQuickControlRingSliderRangeViewController" conformsToProtocol:@"HUQuickControlRingSliderInteractionCoordinatorDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlRingSliderRangeViewController", @"modelValueDidChange", "v", 0);
  [v3 validateClass:@"HUQuickControlRingSliderRangeViewController" isKindOfClass:@"HUQuickControlSingleControlViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSingleControlViewController", @"modelValue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlSingleControlViewController", @"controlItem", "@", 0);
  [v3 validateProtocol:@"HUQuickControlRingSliderInteractionCoordinatorDelegate" conformsToProtocol:@"HUQuickControlInteractionCoordinatorDelegate"];
  [v3 validateProtocol:@"HUQuickControlInteractionCoordinatorDelegate" hasMethod:@"interactionCoordinator:viewValueDidChange:" isInstanceMethod:1 isRequired:1];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFNumberRange", @"setMaxValue:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFNumberRange", @"setMinValue:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFNumberRange", @"setMidValue:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v33.receiver = self;
  v33.super_class = (Class)HUQuickControlRingSliderViewAccessibility;
  [(HUQuickControlRingSliderViewAccessibility *)&v33 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F81380];
  v4 = [(HUQuickControlRingSliderViewAccessibility *)self safeValueForKey:@"_primaryHandleView"];
  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v30[3] = &unk_265128308;
  objc_copyWeak(&v31, &location);
  [v4 _setIsAccessibilityElementBlock:v30];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v28[3] = &unk_265128018;
  objc_copyWeak(&v29, &location);
  [v4 _setAccessibilityLabelBlock:v28];
  uint64_t v5 = *MEMORY[0x263F1CF68] | *MEMORY[0x263F1CED8] | v3;
  [v4 setAccessibilityTraits:v5];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v26[3] = &unk_265128018;
  objc_copyWeak(&v27, &location);
  [v4 _setAccessibilityValueBlock:v26];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v24[3] = &unk_265128330;
  objc_copyWeak(&v25, &location);
  [v4 _setAccessibilityIncrementBlock:v24];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v22[3] = &unk_265128330;
  objc_copyWeak(&v23, &location);
  [v4 _setAccessibilityDecrementBlock:v22];
  v6 = [(HUQuickControlRingSliderViewAccessibility *)self safeValueForKey:@"_secondaryHandleView"];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v20[3] = &unk_265128308;
  objc_copyWeak(&v21, &location);
  [v6 _setIsAccessibilityElementBlock:v20];
  v7 = accessibilityHomeUILocalizedString(@"ring.slider.lower.limit");
  [v6 setAccessibilityLabel:v7];

  [v6 setAccessibilityTraits:v5];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v18[3] = &unk_265128018;
  objc_copyWeak(&v19, &location);
  [v6 _setAccessibilityValueBlock:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
  v16[3] = &unk_265128330;
  objc_copyWeak(&v17, &location);
  [v6 _setAccessibilityIncrementBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9;
  v14[3] = &unk_265128330;
  objc_copyWeak(&v15, &location);
  [v6 _setAccessibilityDecrementBlock:v14];
  v8 = [(HUQuickControlRingSliderViewAccessibility *)self safeValueForKey:@"supplementaryValueMarkingView"];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_10;
  v12[3] = &unk_265128308;
  objc_copyWeak(&v13, &location);
  [v8 _setIsAccessibilityElementBlock:v12];
  v9 = accessibilityHomeUILocalizedString(@"ring.slider.current.value.indicator");
  [v8 setAccessibilityLabel:v9];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_11;
  v10[3] = &unk_265128018;
  objc_copyWeak(&v11, &location);
  [v8 _setAccessibilityValueBlock:v10];
  objc_destroyWeak(&v11);
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
  objc_destroyWeak(&location);
}

uint64_t __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeUIViewForKey:@"_primaryHandleView"];
  uint64_t v3 = [v2 isHidden] ^ 1;

  return v3;
}

id __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained _axInteractionDelegate];
  v4 = [v3 safeValueForKey:@"value"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  if ([v5 type] == 1) {
    v6 = @"ring.slider.upper.limit";
  }
  else {
    v6 = @"ring.slider.target.value";
  }
  v7 = accessibilityHomeUILocalizedString(v6);

  return v7;
}

id __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(id *a1)
{
  objc_opt_class();
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  uint64_t v3 = [WeakRetained _axInteractionDelegate];
  v4 = [v3 safeValueForKey:@"value"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  uint64_t v6 = [v5 type];
  id v7 = objc_loadWeakRetained(a1);
  v8 = v7;
  if (v6 == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 3;
  }
  v10 = [v7 _axLocalizedStringForAXControlValueType:v9];

  return v10;
}

void __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axAdjustValueOfUpperBound:1 increment:1];
}

void __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axAdjustValueOfUpperBound:1 increment:0];
}

uint64_t __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeUIViewForKey:@"_secondaryHandleView"];
  uint64_t v3 = [v2 isHidden] ^ 1;

  return v3;
}

id __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _axLocalizedStringForAXControlValueType:2];

  return v2;
}

void __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axAdjustValueOfUpperBound:0 increment:1];
}

void __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axAdjustValueOfUpperBound:0 increment:0];
}

uint64_t __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_10(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained safeValueForKey:@"_profile"];
  if ([v3 safeBoolForKey:@"shouldShowSupplementaryValue"])
  {
    id v4 = objc_loadWeakRetained(v1);
    uint64_t v5 = [v4 safeBoolForKey:@"showOffState"] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id __87__HUQuickControlRingSliderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _axLocalizedStringForAXControlValueType:0];

  return v2;
}

- (id)accessibilityElements
{
  [(HUQuickControlRingSliderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = [(HUQuickControlRingSliderViewAccessibility *)self safeValueForKeyPath:@"supplementaryLabel"];
  uint64_t v5 = [(HUQuickControlRingSliderViewAccessibility *)self safeValueForKeyPath:@"primaryLabel"];
  uint64_t v6 = [(HUQuickControlRingSliderViewAccessibility *)self safeValueForKey:@"_primaryHandleView"];
  id v7 = [(HUQuickControlRingSliderViewAccessibility *)self safeValueForKey:@"_secondaryHandleView"];
  v8 = [(HUQuickControlRingSliderViewAccessibility *)self safeValueForKey:@"supplementaryValueMarkingView"];
  uint64_t v9 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 5, v4, v5, v6, v7, v8);

  return v9;
}

- (id)_axLocalizedStringForAXControlValueType:(unint64_t)a3
{
  id v4 = [(HUQuickControlRingSliderViewAccessibility *)self _axViewController];
  if (a3)
  {
    objc_opt_class();
    uint64_t v5 = [v4 safeValueForKey:@"modelValue"];
    uint64_t v6 = __UIAccessibilityCastAsClass();

    switch(a3)
    {
      case 3uLL:
        uint64_t v7 = [v6 targetValue];
        break;
      case 2uLL:
        uint64_t v7 = [v6 minimumValue];
        break;
      case 1uLL:
        uint64_t v7 = [v6 maximumValue];
        break;
      default:
        id v11 = 0;
        goto LABEL_12;
    }
  }
  else
  {
    objc_opt_class();
    v8 = [v4 safeValueForKey:@"controlItem"];
    uint64_t v9 = __UIAccessibilityCastAsClass();

    v10 = [v9 latestResults];
    uint64_t v6 = [v10 objectForKey:*MEMORY[0x263F47928]];

    uint64_t v7 = [v6 objectForKey:*MEMORY[0x263F0C110]];
  }
  id v11 = (void *)v7;
  if (v7)
  {
    v12 = [MEMORY[0x263F47B50] sharedInstance];
    id v13 = [v12 temperatureFormatter];

    v14 = [v13 stringForObjectValue:v11];

    goto LABEL_13;
  }
LABEL_12:
  v14 = 0;
LABEL_13:

  return v14;
}

- (void)_axAdjustValueOfUpperBound:(BOOL)a3 increment:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(HUQuickControlRingSliderViewAccessibility *)self _axAdjustmentDelta];
  if (v4) {
    double v8 = v7;
  }
  else {
    double v8 = -v7;
  }
  uint64_t v9 = [(HUQuickControlRingSliderViewAccessibility *)self _axInteractionDelegate];
  uint64_t v42 = MEMORY[0x263EF8330];
  uint64_t v43 = 3221225472;
  v44 = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke;
  v45 = &unk_265128358;
  v46 = self;
  id v10 = v9;
  id v47 = v10;
  AXPerformSafeBlock();
  id v11 = [v10 safeValueForKey:@"value"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v41 = 0;
    objc_opt_class();
    id v13 = [v10 safeValueForKey:@"value"];
    v14 = __UIAccessibilityCastAsClass();

    if ([v14 type] == 1)
    {
      if (v5)
      {
        id v15 = [v14 maxValue];
        [v15 doubleValue];
        double v17 = v8 + v16;

        double v18 = fmax(fmin(v17, 1.0), 0.0);
        id v19 = (double *)v40;
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v20 = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_2;
      }
      else
      {
        id v31 = [v14 minValue];
        [v31 doubleValue];
        double v33 = v8 + v32;

        double v18 = fmax(fmin(v33, 1.0), 0.0);
        id v19 = (double *)v39;
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v20 = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_3;
      }
    }
    else
    {
      v28 = [v14 midValue];
      [v28 doubleValue];
      double v30 = v8 + v29;

      double v18 = fmax(fmin(v30, 1.0), 0.0);
      id v19 = (double *)v38;
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v20 = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_4;
    }
    *((void *)v19 + 2) = v20;
    *((void *)v19 + 3) = &unk_265128380;
    id v26 = v14;
    *((void *)v19 + 4) = v26;
    v19[5] = v18;
    AXPerformSafeBlock();

    id v27 = v37;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_5;
    v37[3] = &unk_2651283A8;
    v37[4] = v10;
    v37[5] = v26;
    goto LABEL_13;
  }
  id v21 = [v10 safeValueForKey:@"value"];
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  if (v22)
  {
    char v41 = 0;
    objc_opt_class();
    id v23 = [v10 safeValueForKey:@"value"];
    v24 = __UIAccessibilityCastAsClass();

    [v24 doubleValue];
    objc_msgSend(NSNumber, "numberWithDouble:", fmax(fmin(v8 + v25, 1.0), 0.0));
    id v26 = (id)objc_claimAutoreleasedReturnValue();

    id v27 = v36;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_6;
    v36[3] = &unk_2651283A8;
    v36[4] = v10;
    v36[5] = v26;
LABEL_13:
    v27[6] = self;
    id v34 = v26;
    AXPerformSafeBlock();
  }
  id v35 = v10;
  AXPerformSafeBlock();
}

uint64_t __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionActive:1];
  [*(id *)(a1 + 40) setUserInteractionActive:1];
  v2 = *(void **)(a1 + 40);

  return [v2 setFirstTouchDown:1];
}

void __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v1 setMaxValue:v2];
}

void __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v1 setMinValue:v2];
}

void __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v1 setMidValue:v2];
}

void __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) _axViewController];
  id v2 = (id)[v3 safeValueForKey:@"modelValueDidChange"];
  [v3 interactionCoordinator:*(void *)(a1 + 32) viewValueDidChange:*(void *)(a1 + 40)];
}

void __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) _axViewController];
  id v2 = (id)[v3 safeValueForKey:@"modelValueDidChange"];
  [v3 interactionCoordinator:*(void *)(a1 + 32) viewValueDidChange:*(void *)(a1 + 40)];
}

uint64_t __82__HUQuickControlRingSliderViewAccessibility__axAdjustValueOfUpperBound_increment___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionActive:0];
  [*(id *)(a1 + 40) setUserInteractionActive:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 setFirstTouchDown:0];
}

- (double)_axAdjustmentDelta
{
  id v2 = [(HUQuickControlRingSliderViewAccessibility *)self safeValueForKey:@"_profile"];
  id v3 = [v2 safeArrayForKey:@"gradationMarkingValues"];

  if ([v3 count]) {
    double v4 = 1.0 / (double)(unint64_t)[v3 count];
  }
  else {
    double v4 = 0.0189999994;
  }

  return v4;
}

- (id)_axInteractionDelegate
{
  id v2 = [(HUQuickControlRingSliderViewAccessibility *)self safeValueForKey:@"interactionDelegate"];
  MEMORY[0x2456509F0](@"HUQuickControlRingSliderInteractionCoordinator");
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_axViewController
{
  id v2 = [(HUQuickControlRingSliderViewAccessibility *)self _axInteractionDelegate];
  id v3 = [v2 safeValueForKey:@"_delegate"];

  double v4 = NSProtocolFromString(&cfstr_Huquickcontrol_39.isa);
  int v5 = [v3 conformsToProtocol:v4];

  if (v5) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

@end