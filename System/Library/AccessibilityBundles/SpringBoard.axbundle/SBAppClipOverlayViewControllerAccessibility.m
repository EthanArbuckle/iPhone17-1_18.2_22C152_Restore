@interface SBAppClipOverlayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setSceneActivationState:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation SBAppClipOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppClipOverlayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBAppClipOverlayViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppClipOverlayViewController", @"overlayViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppClipOverlayViewController", @"setSceneActivationState:animated:", "v", "q", "B", 0);
  [v3 validateClass:@"CPSClipOverlayViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CPSClipOverlayViewController" hasInstanceVariable:@"_banner" withType:"CPSAppAttributionBanner"];
  [v3 validateClass:@"CPSAppAttributionBanner" hasInstanceVariable:@"_titleLabel" withType:"CPSLabelWithPlaceholder"];
  [v3 validateClass:@"CPSAppAttributionBanner" hasInstanceVariable:@"_subtitleLabel" withType:"CPSLabelWithPlaceholder"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CPSAppAttributionBanner", @"tapAction", "@?", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v20.receiver = self;
  v20.super_class = (Class)SBAppClipOverlayViewControllerAccessibility;
  [(SBAppClipOverlayViewControllerAccessibility *)&v20 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 view];

  LOBYTE(location) = 0;
  objc_opt_class();
  v5 = [(SBAppClipOverlayViewControllerAccessibility *)self safeValueForKey:@"overlayViewController"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 safeValueForKey:@"_banner"];
  v8 = [v7 safeValueForKey:@"_titleLabel"];
  v9 = [v8 accessibilityLabel];

  v10 = [v7 safeValueForKey:@"_subtitleLabel"];
  v11 = [v10 accessibilityLabel];

  [v4 setIsAccessibilityElement:1];
  v12 = NSString;
  v13 = accessibilityLocalizedString(@"appClip.poweredBy.banner.label");
  v14 = objc_msgSend(v12, "stringWithFormat:", v13, v9);
  v15 = accessibilityLocalizedString(@"appClip.appStore.button.label");
  v16 = __UIAXStringForVariables();
  objc_msgSend(v4, "setAccessibilityLabel:", v16, v11, v15, @"__AXStringForVariablesSentinel");

  objc_initWeak(&location, v7);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__SBAppClipOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v17[3] = &unk_265154270;
  objc_copyWeak(&v18, &location);
  [v4 _setAccessibilityActivateBlock:v17];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

uint64_t __89__SBAppClipOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"tapAction"];

  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v2;
    AXPerformSafeBlock();

    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __89__SBAppClipOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSceneActivationState:(int64_t)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBAppClipOverlayViewControllerAccessibility;
  [(SBAppClipOverlayViewControllerAccessibility *)&v5 setSceneActivationState:a3 animated:a4];
  [(SBAppClipOverlayViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end