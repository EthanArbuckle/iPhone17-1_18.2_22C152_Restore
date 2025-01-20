@interface PREditorRootViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetAccessibilityElements;
- (void)_axSetDepthEffectButton;
- (void)_axSetPageControlValue;
- (void)_updateMenuElements;
- (void)updatePageControlCurrentPage;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PREditorRootViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditorRootViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PREditorRootViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"PRComplicationSceneHostViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"viewDidAppear:", "v", "B", 0);
  [v3 validateClass:@"PREditorRootViewController" hasProperty:@"pageControl" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"updatePageControlCurrentPage", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"currentLook", "@", 0);
  [v3 validateClass:@"PREditingLook" hasProperty:@"displayName" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"inlineComplicationReticleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"titleReticleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"complicationRowReticleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"complicationSidebarReticleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"reticleVibrancyView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"cancelButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"editor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditor", @"posterRole", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"isDepthEffectDisabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"leadingMenuElementViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"_updateMenuElements", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"quickActionsHostViewController", "@", 0);
  [v3 validateClass:@"PRQuickActionsSceneHostViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PREditorRootViewControllerAccessibility;
  [(PREditorRootViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PREditorRootViewControllerAccessibility *)self _axSetPageControlValue];
  [(PREditorRootViewControllerAccessibility *)self _axSetAccessibilityElements];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PREditorRootViewControllerAccessibility;
  [(PREditorRootViewControllerAccessibility *)&v6 viewDidAppear:a3];
  [(PREditorRootViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
  v5 = [(PREditorRootViewControllerAccessibility *)self safeValueForKey:@"cancelButton"];
  UIAccessibilityPostNotification(v4, v5);
}

- (void)updatePageControlCurrentPage
{
  v3.receiver = self;
  v3.super_class = (Class)PREditorRootViewControllerAccessibility;
  [(PREditorRootViewControllerAccessibility *)&v3 updatePageControlCurrentPage];
  [(PREditorRootViewControllerAccessibility *)self _axSetPageControlValue];
}

- (void)_updateMenuElements
{
  v3.receiver = self;
  v3.super_class = (Class)PREditorRootViewControllerAccessibility;
  [(PREditorRootViewControllerAccessibility *)&v3 _updateMenuElements];
  [(PREditorRootViewControllerAccessibility *)self _axSetDepthEffectButton];
}

- (void)_axSetPageControlValue
{
  objc_opt_class();
  objc_super v3 = [(PREditorRootViewControllerAccessibility *)self safeValueForKey:@"pageControl"];
  UIAccessibilityNotifications v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(PREditorRootViewControllerAccessibility *)self safeValueForKeyPath:@"currentLook.displayName"];
  objc_super v6 = __UIAccessibilityCastAsClass();

  [v4 currentPage];
  [v4 numberOfPages];
  v7 = accessibilityLocalizedString(@"page.control.format.text");
  v8 = AXCFormattedString();

  v9 = __UIAXStringForVariables();
  objc_msgSend(v4, "setAccessibilityValue:", v9, v8, @"__AXStringForVariablesSentinel");
}

- (void)_axSetAccessibilityElements
{
  objc_opt_class();
  objc_super v3 = __UIAccessibilityCastAsClass();
  UIAccessibilityNotifications v4 = [(PREditorRootViewControllerAccessibility *)self safeValueForKey:@"inlineComplicationReticleView"];
  v5 = [(PREditorRootViewControllerAccessibility *)self safeValueForKey:@"titleReticleView"];
  objc_super v6 = [(PREditorRootViewControllerAccessibility *)self valueForKey:@"editor"];
  v7 = [v6 safeStringForKey:@"posterRole"];

  objc_opt_class();
  v8 = [(PREditorRootViewControllerAccessibility *)self safeValueForKey:@"complicationRowReticleView"];
  v9 = __UIAccessibilityCastAsSafeCategory();

  LOBYTE(location) = 0;
  objc_opt_class();
  v10 = [(PREditorRootViewControllerAccessibility *)self safeValueForKey:@"complicationSidebarReticleView"];
  v11 = __UIAccessibilityCastAsSafeCategory();

  [v4 setAccessibilityIdentifier:@"inline-widget-reticle-view"];
  if ([v7 isEqualToString:@"PRPosterRoleLockScreen"])
  {
    v12 = AXClockReticleViewID;
LABEL_5:
    [v5 setAccessibilityIdentifier:*v12];
    goto LABEL_6;
  }
  if ([v7 isEqualToString:@"PRPosterRoleIncomingCall"])
  {
    v12 = AXContactReticleViewID;
    goto LABEL_5;
  }
LABEL_6:
  [v9 setAccessibilityIdentifier:@"grouped-widgets-reticle-view"];
  [v11 setAccessibilityIdentifier:@"grouped-widgets-reticle-sidebar-view"];
  [v9 _axSetPosterEditorViewController:v3];
  [v11 _axSetPosterEditorViewController:v3];
  v13 = [(PREditorRootViewControllerAccessibility *)self safeValueForKey:@"reticleVibrancyView"];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __70__PREditorRootViewControllerAccessibility__axSetAccessibilityElements__block_invoke;
  v27[3] = &unk_265145FD0;
  id v14 = v4;
  id v28 = v14;
  id v15 = v5;
  id v29 = v15;
  id v16 = v9;
  id v30 = v16;
  [v13 setAccessibilityFrameBlock:v27];

  [(PREditorRootViewControllerAccessibility *)self _axSetDepthEffectButton];
  v21 = v3;
  v17 = [v3 view];
  objc_initWeak(&location, v17);
  objc_initWeak(&from, self);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__PREditorRootViewControllerAccessibility__axSetAccessibilityElements__block_invoke_2;
  v22[3] = &unk_265145FF8;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, &from);
  [v17 setAccessibilityElementsBlock:v22];
  objc_opt_class();
  v18 = [(PREditorRootViewControllerAccessibility *)self safeValueForKey:@"quickActionsHostViewController"];
  v19 = __UIAccessibilityCastAsClass();

  v20 = [v19 view];

  [v20 _accessibilitySetSortPriority:-100];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

double __70__PREditorRootViewControllerAccessibility__axSetAccessibilityElements__block_invoke(id *a1)
{
  [a1[4] accessibilityFrame];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [a1[5] accessibilityFrame];
  v34.origin.CGFloat x = v10;
  v34.origin.CGFloat y = v11;
  v34.size.CGFloat width = v12;
  v34.size.CGFloat height = v13;
  v32.origin.CGFloat x = v3;
  v32.origin.CGFloat y = v5;
  v32.size.CGFloat width = v7;
  v32.size.CGFloat height = v9;
  CGRect v33 = CGRectUnion(v32, v34);
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  CGFloat width = v33.size.width;
  CGFloat height = v33.size.height;
  [a1[6] accessibilityFrame];
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  CGFloat v26 = x;
  CGFloat v27 = y;
  CGFloat v28 = width;
  CGFloat v29 = height;

  *(void *)&double result = (unint64_t)CGRectUnion(*(CGRect *)&v26, *(CGRect *)&v19);
  return result;
}

id __70__PREditorRootViewControllerAccessibility__axSetAccessibilityElements__block_invoke_2(id *a1)
{
  v1 = a1;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  CGFloat v3 = [WeakRetained _accessibilitySubviews];
  double v4 = (void *)[v3 mutableCopy];

  v1 += 5;
  id v5 = objc_loadWeakRetained(v1);
  double v6 = [v5 safeValueForKey:@"scrollView"];
  [v4 removeObject:v6];

  id v7 = objc_loadWeakRetained(v1);
  double v8 = [v7 safeValueForKey:@"reticleVibrancyView"];

  if (v8 && ([v4 containsObject:v8] & 1) == 0) {
    [v4 axSafelyAddObject:v8];
  }
  CGFloat v9 = [v4 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];

  return v9;
}

- (void)_axSetDepthEffectButton
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [(PREditorRootViewControllerAccessibility *)self safeArrayForKey:@"leadingMenuElementViews"];
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v7 = [v6 accessibilityLabel];
        if (([v7 isEqualToString:@"square.2.stack.3d"] & 1) != 0
          || ([v7 isEqualToString:@"square.2.layers.3d"] & 1) != 0
          || [v7 isEqualToString:@"square.2.layers.3d.fill"])
        {
          double v8 = accessibilityLocalizedString(@"primary.action.button.depth.effect.label");
          [v6 setAccessibilityLabel:v8];

          objc_initWeak(&location, self);
          v10[0] = MEMORY[0x263EF8330];
          v10[1] = 3221225472;
          v10[2] = __66__PREditorRootViewControllerAccessibility__axSetDepthEffectButton__block_invoke;
          v10[3] = &unk_265145DF0;
          objc_copyWeak(&v11, &location);
          [v6 setAccessibilityValueBlock:v10];
          objc_destroyWeak(&v11);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

id __66__PREditorRootViewControllerAccessibility__axSetDepthEffectButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained safeBoolForKey:@"isDepthEffectDisabled"];

  if (v2) {
    uint64_t v3 = @"depth.effect.disabled";
  }
  else {
    uint64_t v3 = @"depth.effect.enabled";
  }
  uint64_t v4 = accessibilityLocalizedString(v3);

  return v4;
}

@end