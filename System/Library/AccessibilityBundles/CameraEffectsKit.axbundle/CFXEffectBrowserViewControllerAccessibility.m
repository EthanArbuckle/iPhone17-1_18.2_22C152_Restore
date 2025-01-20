@interface CFXEffectBrowserViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axHideAppropriateElements:(BOOL)a3;
- (void)didSelectAppWithBundleIdentifier:(id)a3;
@end

@implementation CFXEffectBrowserViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CFXEffectBrowserViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectBrowserViewController", @"didSelectAppWithBundleIdentifier:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXEffectBrowserViewController", @"selectedAppIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXCameraViewController", @"cameraControlsViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CFXPreviewViewController", @"bottomControlsDrawer", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CFXEffectBrowserViewControllerAccessibility;
  [(CFXEffectBrowserViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CFXEffectBrowserViewControllerAccessibility *)self safeValueForKey:@"selectedAppIdentifier"];
  BOOL v4 = v3 != 0;

  [(CFXEffectBrowserViewControllerAccessibility *)self _axHideAppropriateElements:v4];
}

- (void)didSelectAppWithBundleIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CFXEffectBrowserViewControllerAccessibility;
  -[CFXEffectBrowserViewControllerAccessibility didSelectAppWithBundleIdentifier:](&v5, sel_didSelectAppWithBundleIdentifier_);
  [(CFXEffectBrowserViewControllerAccessibility *)self _axHideAppropriateElements:a3 != 0];
}

- (void)_axHideAppropriateElements:(BOOL)a3
{
  BOOL v3 = a3;
  LOBYTE(location) = 0;
  objc_opt_class();
  objc_super v5 = [(CFXEffectBrowserViewControllerAccessibility *)self safeValueForKey:@"parentViewController"];
  v6 = __UIAccessibilityCastAsClass();

  MEMORY[0x245646100](@"CNKFaceTimeInCallControlsViewController");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (AXDeviceIsPad()) {
      goto LABEL_13;
    }
    v8 = [(CFXEffectBrowserViewControllerAccessibility *)self safeUIViewForKey:@"view"];
    v9 = [v8 _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];
    v10 = [v9 _accessibilityViewController];

    v11 = [v8 _accessibilityFindSubviewDescendant:&__block_literal_global_310];
    [v11 setAccessibilityElementsHidden:v3];
    if (v10)
    {
      MEMORY[0x245646100](@"CFXCameraViewController");
      if (objc_opt_isKindOfClass())
      {
        v12 = [v10 safeValueForKeyPath:@"cameraControlsViewController.view"];
LABEL_11:
        v15 = v12;
        [v12 setAccessibilityElementsHidden:v3];

        goto LABEL_12;
      }
      MEMORY[0x245646100](@"CFXPreviewViewController");
      if (objc_opt_isKindOfClass())
      {
        v12 = [v10 safeValueForKey:@"bottomControlsDrawer"];
        goto LABEL_11;
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v3)
  {
    objc_initWeak(&location, v6);
    v7 = [v6 view];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __74__CFXEffectBrowserViewControllerAccessibility__axHideAppropriateElements___block_invoke;
    v16[3] = &unk_265111358;
    objc_copyWeak(&v17, &location);
    [v7 _setAccessibilityElementsHiddenBlock:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = [v6 view];
    [v13 _setAccessibilityElementsHiddenBlock:0];

    v14 = [v6 view];
    [v14 setAccessibilityElementsHidden:0];
  }
LABEL_13:
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

uint64_t __74__CFXEffectBrowserViewControllerAccessibility__axHideAppropriateElements___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"isExpanded"] ^ 1;

  return v2;
}

uint64_t __74__CFXEffectBrowserViewControllerAccessibility__axHideAppropriateElements___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 _accessibilityViewController];
  MEMORY[0x245646100](@"CFXCameraViewController");
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_super v5 = [v2 _accessibilityViewController];
    MEMORY[0x245646100](@"CFXPreviewViewController");
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

uint64_t __74__CFXEffectBrowserViewControllerAccessibility__axHideAppropriateElements___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245646100](@"CKBrowserSwitcherFooterView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end