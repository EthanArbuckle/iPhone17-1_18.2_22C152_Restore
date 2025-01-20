@interface SAUIElementViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityIsJindo;
- (BOOL)_axRemoteContentIsGettingElements;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityContainerView;
- (id)_accessibilityRemoteElementDescendant;
- (id)_axGetRemoteContentLabel;
- (id)_viewToAddFocusLayer;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)automationElements;
- (int64_t)_accessibilitySortPriority;
- (void)_accessibilityPrefetchPropertiesIfNecessary;
- (void)_axSetRemoteContentIsGettingElements:(BOOL)a3;
- (void)_axSetRemoteContentLabel:(id)a3;
@end

@implementation SAUIElementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SAUIElementView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUIElementView", @"elementViewProvider", "@", 0);
  [v3 validateProtocol:@"SAUIElementViewProviding" hasRequiredInstanceMethod:@"leadingView"];
  [v3 validateProtocol:@"SAUIElementViewProviding" hasRequiredInstanceMethod:@"trailingView"];
  [v3 validateProtocol:@"SAUIElementViewProviding" hasRequiredInstanceMethod:@"minimalView"];
  [v3 validateClass:@"SAUIElementView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"UIView" conformsToProtocol:@"_UIFocusItemInternal"];
  [v3 validateProtocol:@"_UIFocusItemInternal" hasOptionalInstanceMethod:@"_viewToAddFocusLayer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUILayoutSpecifyingElementViewController", @"_expandToCustomLayoutModeFromUserActionIfPossible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUILayoutSpecifyingElementViewController", @"_axCollapseIfExpandedByUserInteraction", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUILayoutSpecifyingElementViewController", @"_containerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SAUILayoutSpecifyingElementViewController", @"layoutMode", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(SAUIElementViewAccessibility *)self safeUIViewForKey:@"superview"];
  id v3 = [v2 _accessibilityViewController];

  BOOL v4 = [v3 safeIntForKey:@"layoutMode"] == 1
    || [v3 safeIntForKey:@"layoutMode"] == 2;

  return v4;
}

- (id)_accessibilityRemoteElementDescendant
{
  return (id)[(SAUIElementViewAccessibility *)self _accessibilityFindDescendant:&__block_literal_global];
}

uint64_t __69__SAUIElementViewAccessibility__accessibilityRemoteElementDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 onClientSide];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_accessibilityPrefetchPropertiesIfNecessary
{
  uint64_t v3 = [(SAUIElementViewAccessibility *)self _accessibilityRemoteElementDescendant];
  if (v3
    && ![(SAUIElementViewAccessibility *)self _axRemoteContentIsGettingElements])
  {
    [(SAUIElementViewAccessibility *)self _axSetRemoteContentIsGettingElements:1];
    _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
    BOOL v4 = dispatch_get_global_queue(21, 0);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke;
    v5[3] = &unk_26515C1A8;
    id v6 = v3;
    v7 = self;
    dispatch_async(v4, v5);
  }
}

uint64_t __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke_2;
  v3[3] = &unk_26515C1D0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 getLeafElementsFromRemoteSide:v3];
}

void __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  BOOL v4 = objc_msgSend(v3, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_323);

  v5 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v4];
  id v6 = [v5 array];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke_4;
  v8[3] = &unk_26515C1A8;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 stringWithAXAttribute:2001];
}

uint64_t __75__SAUIElementViewAccessibility__accessibilityPrefetchPropertiesIfNecessary__block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = MEMORY[0x2456658D0](*(void *)(a1 + 40));
  [v2 _axSetRemoteContentLabel:v3];

  BOOL v4 = *(void **)(a1 + 32);

  return [v4 _axSetRemoteContentIsGettingElements:0];
}

- (BOOL)_axRemoteContentIsGettingElements
{
  return MEMORY[0x270F0A438](self, &__SAUIElementViewAccessibility___axRemoteContentIsGettingElements);
}

- (void)_axSetRemoteContentIsGettingElements:(BOOL)a3
{
}

- (id)_axGetRemoteContentLabel
{
}

- (void)_axSetRemoteContentLabel:(id)a3
{
}

- (id)accessibilityLabel
{
  id v3 = [(SAUIElementViewAccessibility *)self safeValueForKey:@"elementViewProvider"];
  BOOL v4 = [v3 safeUIViewForKey:@"leadingView"];
  v5 = [v3 safeUIViewForKey:@"trailingView"];
  id v6 = [v3 safeUIViewForKey:@"minimalView"];
  MEMORY[0x245665890](@"SBFlashlightActivityElement");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x245665890](@"SBDynamicFlashlightActivityElement"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = accessibilityLocalizedString(@"flashlight.on");
  }
  else
  {
    id v9 = [(SAUIElementViewAccessibility *)self accessibilityIdentifier];
    int v10 = [v9 isEqualToString:@"minimal.view"];

    if (v10)
    {
      id v7 = [v6 accessibilityLabel];
    }
    else
    {
      v11 = [v5 accessibilityLabel];
      if (![v11 length])
      {
        uint64_t v12 = UIAXStringForAllChildren();

        v11 = (void *)v12;
      }
      v14 = v11;
      v15 = @"__AXStringForVariablesSentinel";
      id v7 = __UIAXStringForVariables();
    }
    if (!objc_msgSend(v7, "length", v14, v15))
    {
      uint64_t v13 = [(SAUIElementViewAccessibility *)self _axGetRemoteContentLabel];

      id v7 = (void *)v13;
    }
  }

  return v7;
}

- (id)accessibilityHint
{
  id v3 = [(SAUIElementViewAccessibility *)self safeValueForKey:@"elementViewProvider"];
  MEMORY[0x245665890](@"SBLockElementViewProvider");
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = 0;
    goto LABEL_11;
  }
  MEMORY[0x245665890](@"SBFlashlightActivityElement");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [v3 safeStringForKey:@"elementIdentifier"];
    if ([v6 isEqualToString:@"systemApertureElementIdentifierUnknown"])
    {
      id v7 = [(SAUIElementViewAccessibility *)self accessibilityLabel];
      v8 = accessibilityLocalizedString(@"system.aperture.detection.label");
      char v9 = [v7 isEqualToString:v8];

      if (v9)
      {
        v5 = @"system.aperture.detection.hint";
        goto LABEL_10;
      }
    }
    else
    {
    }
    v5 = @"system.aperture.actions.hint";
    goto LABEL_10;
  }
  v5 = @"system.aperture.flashlight.hint";
LABEL_10:
  BOOL v4 = accessibilityLocalizedString(v5);
LABEL_11:

  return v4;
}

- (id)accessibilityCustomActions
{
  v30[2] = *MEMORY[0x263EF8340];
  id v3 = [(SAUIElementViewAccessibility *)self safeValueForKey:@"elementViewProvider"];
  MEMORY[0x245665890](@"SBLockElementViewProvider");
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (MEMORY[0x245665890](@"SBFlashlightActivityElement"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v4 = 0;
    goto LABEL_9;
  }
  v5 = [(SAUIElementViewAccessibility *)self safeUIViewForKey:@"superview"];
  id v6 = [v5 _accessibilityViewController];

  id v7 = objc_alloc(MEMORY[0x263F1C390]);
  v8 = accessibilityLocalizedString(@"window.expand");
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke;
  v27[3] = &unk_26515C220;
  id v9 = v6;
  id v28 = v9;
  int v10 = (void *)[v7 initWithName:v8 actionHandler:v27];

  id v11 = objc_alloc(MEMORY[0x263F1C390]);
  uint64_t v12 = accessibilityLocalizedString(@"window.diminish");
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_3;
  v25[3] = &unk_26515C220;
  id v13 = v9;
  id v26 = v13;
  v14 = (void *)[v11 initWithName:v12 actionHandler:v25];

  id v15 = objc_alloc(MEMORY[0x263F1C390]);
  v16 = accessibilityLocalizedString(@"window.dismiss");
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_6;
  v23[3] = &unk_26515C220;
  id v17 = v13;
  id v24 = v17;
  v18 = (void *)[v15 initWithName:v16 actionHandler:v23];

  if ([v17 safeIntForKey:@"layoutMode"] == 1
    || [v17 safeIntForKey:@"layoutMode"] == 2)
  {
    v30[0] = v10;
    v30[1] = v18;
    v19 = (void *)MEMORY[0x263EFF8C0];
    v20 = (void **)v30;
    uint64_t v21 = 2;
  }
  else
  {
    if ([v17 safeIntForKey:@"layoutMode"] != 3)
    {
      BOOL v4 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_8;
    }
    v29 = v14;
    v19 = (void *)MEMORY[0x263EFF8C0];
    v20 = &v29;
    uint64_t v21 = 1;
  }
  BOOL v4 = [v19 arrayWithObjects:v20 count:v21];
LABEL_8:

LABEL_9:

  return v4;
}

BOOL __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v6 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  int v4 = *((unsigned __int8 *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  if (!UIAccessibilityIsVoiceOverRunning()) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }

  return v4 != 0;
}

uint64_t __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _expandToCustomLayoutModeFromUserActionIfPossible];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v7 = *(id *)(a1 + 32);
  AXPerformSafeBlock();
  uint64_t v4 = *((unsigned __int8 *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  id v6 = *(id *)(a1 + 32);
  AXPerformBlockOnMainThreadAfterDelay();

  return v4;
}

uint64_t __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _axCollapseIfExpandedByUserInteraction];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_containerView"];
  UIAccessibilityPostNotification(v1, v2);
}

uint64_t __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

void __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) _axRequestDiminishment];
  id v2 = *(id *)(a1 + 32);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __58__SAUIElementViewAccessibility_accessibilityCustomActions__block_invoke_8(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_containerView"];
  UIAccessibilityPostNotification(v1, v2);
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = [(SAUIElementViewAccessibility *)self safeUIViewForKey:@"superview"];
  uint64_t v4 = [v3 _accessibilityViewController];

  if ([v4 safeIntForKey:@"layoutMode"] == 3)
  {
    v5 = [(SAUIElementViewAccessibility *)self safeUIViewForKey:@"superview"];
    id v6 = [v5 _accessibilityViewController];

    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v10 = v6;
    AXPerformSafeBlock();
    BOOL v7 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
    id v8 = v10;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __58__SAUIElementViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _axCollapseIfExpandedByUserInteraction];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __58__SAUIElementViewAccessibility_accessibilityPerformEscape__block_invoke_2(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_containerView"];
  UIAccessibilityPostNotification(v1, v2);
}

- (id)accessibilityPath
{
  id v3 = [(SAUIElementViewAccessibility *)self _accessibilityContainerView];
  uint64_t v4 = v3;
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
    id v15 = [v4 layer];
    [v15 cornerRadius];
    double v17 = fmax(v22, v14) * v16;

    uint64_t v18 = objc_msgSend(MEMORY[0x263F1C478], "_bezierPathWithArcRoundedRect:cornerRadius:", v23, v10, v11, v21, v17);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SAUIElementViewAccessibility;
    uint64_t v18 = [(SAUIElementViewAccessibility *)&v24 accessibilityPath];
  }
  v19 = (void *)v18;

  return v19;
}

- (id)_viewToAddFocusLayer
{
  id v2 = [(SAUIElementViewAccessibility *)self _accessibilityContainerView];
  id v3 = [v2 superview];

  return v3;
}

- (id)_accessibilityContainerView
{
  uint64_t v3 = MEMORY[0x245665890](@"SBSystemApertureContainerView", a2);

  return (id)[(SAUIElementViewAccessibility *)self _accessibilityViewAncestorIsKindOf:v3];
}

- (id)automationElements
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  uint64_t v3 = [v2 subviews];

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  if (UIAccessibilityIsSwitchControlRunning()) {
    return 1000;
  }
  v4.receiver = self;
  v4.super_class = (Class)SAUIElementViewAccessibility;
  return [(SAUIElementViewAccessibility *)&v4 _accessibilitySortPriority];
}

- (BOOL)accessibilityActivate
{
  id v2 = [(SAUIElementViewAccessibility *)self safeValueForKey:@"elementViewProvider"];
  MEMORY[0x245665890](@"SBFlashlightActivityElement");
  if (objc_opt_isKindOfClass()) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }

  return 1;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)_accessibilityIsJindo
{
  return 1;
}

@end