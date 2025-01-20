@interface SBDynamicFlashlightActivityElementViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityContainerView;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (void)_transitionToCollapsedState;
- (void)_transitionToExpandedStateWithIntensity:(double)a3 width:(double)a4;
@end

@implementation SBDynamicFlashlightActivityElementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDynamicFlashlightActivityElementView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  [v3 validateClass:@"SBDynamicFlashlightActivityElementViewController" hasInstanceVariable:@"_torchState" withType:__ax_verbose_encode_with_type_encoding_group_class()];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDynamicFlashlightActivityElementViewController", @"currentIntensity", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDynamicFlashlightActivityElementViewController", @"currentWidth", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDynamicFlashlightActivityElementViewController", @"_accessibilitySetTorchState:", "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDynamicFlashlightActivityElementView", @"_transitionToExpandedStateWithIntensity:width:", "v", "d", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDynamicFlashlightActivityElementView", @"_transitionToCollapsedState", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"flashlight");
}

- (id)accessibilityCustomActions
{
  v34[4] = *MEMORY[0x263EF8340];
  v2 = [(SBDynamicFlashlightActivityElementViewAccessibility *)self _accessibilityViewController];
  [v2 safeCGPointForKey:@"_torchState"];
  v4 = v3;
  v6 = v5;
  [v2 safeCGFloatForKey:@"currentIntensity"];
  v8 = v7;
  [v2 safeCGFloatForKey:@"currentWidth"];
  v10 = v9;
  objc_initWeak(&location, v2);
  id v11 = objc_alloc(MEMORY[0x263F1C390]);
  v12 = accessibilityLocalizedString(@"increase.flashlight.intensity");
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke;
  v31[3] = &unk_265153C38;
  v32[1] = v8;
  objc_copyWeak(v32, &location);
  v32[2] = v4;
  v32[3] = v6;
  v13 = (void *)[v11 initWithName:v12 actionHandler:v31];

  id v14 = objc_alloc(MEMORY[0x263F1C390]);
  v15 = accessibilityLocalizedString(@"decrease.flashlight.intensity");
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_3;
  v29[3] = &unk_265153C38;
  v30[1] = v8;
  objc_copyWeak(v30, &location);
  v30[2] = v4;
  v30[3] = v6;
  v16 = (void *)[v14 initWithName:v15 actionHandler:v29];

  id v17 = objc_alloc(MEMORY[0x263F1C390]);
  v18 = accessibilityLocalizedString(@"increase.flashlight.beamwidth");
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_5;
  v27[3] = &unk_265153C38;
  v28[1] = v10;
  objc_copyWeak(v28, &location);
  v28[2] = v4;
  v28[3] = v6;
  v19 = (void *)[v17 initWithName:v18 actionHandler:v27];

  id v20 = objc_alloc(MEMORY[0x263F1C390]);
  v21 = accessibilityLocalizedString(@"decrease.flashlight.beamwidth");
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_7;
  v25[3] = &unk_265153C38;
  v26[1] = v10;
  objc_copyWeak(v26, &location);
  v26[2] = v4;
  v26[3] = v6;
  v22 = (void *)[v20 initWithName:v21 actionHandler:v25];

  v34[0] = v13;
  v34[1] = v16;
  v34[2] = v19;
  v34[3] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];

  objc_destroyWeak(v26);
  objc_destroyWeak(v28);

  objc_destroyWeak(v30);
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);

  return v23;
}

uint64_t __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = fmin(*(double *)(a1 + 40) + 0.25, 1.0);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  long long v7 = *(_OWORD *)(a1 + 48);
  double v8 = v4;
  AXPerformSafeBlock();
  objc_destroyWeak(&v6);

  return 1;
}

void __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilitySetTorchState:", *(double *)(a1 + 40), *(double *)(a1 + 56));
}

uint64_t __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = fmax(*(double *)(a1 + 40) + -0.25, 0.0);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  long long v7 = *(_OWORD *)(a1 + 48);
  double v8 = v4;
  AXPerformSafeBlock();
  objc_destroyWeak(&v6);

  return 1;
}

void __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilitySetTorchState:", *(double *)(a1 + 40), *(double *)(a1 + 56));
}

uint64_t __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = fmin(*(double *)(a1 + 40) + 0.25, 1.0);
  objc_copyWeak(v6, (id *)(a1 + 32));
  v6[1] = *(id *)&v4;
  long long v7 = *(_OWORD *)(a1 + 48);
  AXPerformSafeBlock();
  objc_destroyWeak(v6);

  return 1;
}

void __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilitySetTorchState:", *(double *)(a1 + 40), *(double *)(a1 + 56));
}

uint64_t __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = fmax(*(double *)(a1 + 40) + -0.25, 0.0);
  objc_copyWeak(v6, (id *)(a1 + 32));
  v6[1] = *(id *)&v4;
  long long v7 = *(_OWORD *)(a1 + 48);
  AXPerformSafeBlock();
  objc_destroyWeak(v6);

  return 1;
}

void __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilitySetTorchState:", *(double *)(a1 + 40), *(double *)(a1 + 56));
}

- (id)accessibilityPath
{
  id v3 = [(SBDynamicFlashlightActivityElementViewAccessibility *)self _accessibilityContainerView];
  double v4 = v3;
  if (v3)
  {
    [v3 accessibilityFrame];
    CGFloat x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
    CGRect v27 = CGRectInset(v26, -5.0, -5.0);
    double v21 = v27.size.height;
    CGFloat v9 = v27.origin.x;
    double v23 = v27.origin.x;
    double v10 = v27.origin.y;
    double v11 = v27.size.width;
    double v12 = CGRectGetWidth(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double v22 = v12 / CGRectGetWidth(v28);
    v29.origin.CGFloat x = v9;
    v29.origin.CGFloat y = v10;
    v29.size.CGFloat width = v11;
    v29.size.CGFloat height = v21;
    double v13 = CGRectGetHeight(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double v14 = v13 / CGRectGetHeight(v30);
    v15 = [v4 layer];
    [v15 cornerRadius];
    double v17 = fmax(v22, v14) * v16;

    uint64_t v18 = objc_msgSend(MEMORY[0x263F1C478], "_bezierPathWithArcRoundedRect:cornerRadius:", v23, v10, v11, v21, v17);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBDynamicFlashlightActivityElementViewAccessibility;
    uint64_t v18 = [(SBDynamicFlashlightActivityElementViewAccessibility *)&v24 accessibilityPath];
  }
  v19 = (void *)v18;

  return v19;
}

- (id)_accessibilityContainerView
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  id v3 = [v2 safeValueForKey:@"systemApertureControllerForMainDisplay"];

  double v4 = [v3 safeValueForKey:@"_systemApertureViewController"];
  v5 = [v4 safeArrayForKey:@"_orderedContainerViews"];
  if ([v5 count])
  {
    id v6 = [v5 firstObject];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_transitionToExpandedStateWithIntensity:(double)a3 width:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBDynamicFlashlightActivityElementViewAccessibility;
  [(SBDynamicFlashlightActivityElementViewAccessibility *)&v5 _transitionToExpandedStateWithIntensity:a3 width:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
}

- (void)_transitionToCollapsedState
{
  v2.receiver = self;
  v2.super_class = (Class)SBDynamicFlashlightActivityElementViewAccessibility;
  [(SBDynamicFlashlightActivityElementViewAccessibility *)&v2 _transitionToCollapsedState];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end