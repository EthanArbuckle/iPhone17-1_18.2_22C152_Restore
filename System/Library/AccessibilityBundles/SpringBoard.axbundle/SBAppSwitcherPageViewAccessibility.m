@interface SBAppSwitcherPageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityElementVisibilityAffectsLayout;
- (BOOL)_accessibilityIsNotFirstElement;
- (BOOL)_accessibilityRetainsCustomRotorActionSetting;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGRect)_accessibilityVisibleFrame;
- (id)_accessibilityBundleIdentifier;
- (id)_accessibilityCustomActionGroupIdentifier;
- (id)_accessibilityNativeFocusPreferredElement;
- (id)_accessibilityPreferredScrollActions;
- (id)_accessibilityScrollStatus;
- (id)_focusFallbackScroller;
- (id)_viewToAddFocusLayer;
- (id)accessibilityPath;
- (id)accessibilityValue;
@end

@implementation SBAppSwitcherPageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppSwitcherPageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBAppSwitcherPageView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"scrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_focusFallbackScroller", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
  [v3 validateClass:@"SBAppSwitcherPageView" hasInstanceVariable:@"_hitTestBlocker" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppSwitcherPageView", @"view", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherItemContainer"];
  [v3 validateClass:@"SBFluidSwitcherContentView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherItemContainer", @"appLayout", "@", 0);
}

- (BOOL)_accessibilityIsNotFirstElement
{
  v2 = [(SBAppSwitcherPageViewAccessibility *)self _accessibilityValueForKey:@"AXBundleIdentifier"];
  char v3 = [v2 isEqualToString:*MEMORY[0x263F21318]];

  return v3;
}

- (id)_accessibilityBundleIdentifier
{
  return (id)[(SBAppSwitcherPageViewAccessibility *)self _accessibilityValueForKey:@"AXBundleIdentifier"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityValue
{
  char v3 = [(SBAppSwitcherPageViewAccessibility *)self _accessibilityValueForKey:@"AXBundleIdentifier"];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v4 = [MEMORY[0x263F22968] server];
  v5 = [v4 runningAppProcesses];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__SBAppSwitcherPageViewAccessibility_accessibilityValue__block_invoke;
  v12[3] = &unk_265153F68;
  id v6 = v3;
  id v13 = v6;
  v14 = &v15;
  [v5 enumerateObjectsUsingBlock:v12];
  v11.receiver = self;
  v11.super_class = (Class)SBAppSwitcherPageViewAccessibility;
  v7 = [(SBAppSwitcherPageViewAccessibility *)&v11 accessibilityValue];
  if (*((unsigned char *)v16 + 24) && ([v6 isEqualToString:*MEMORY[0x263F21350]] & 1) == 0)
  {
    v10 = accessibilityLocalizedString(@"app.running.status");
    uint64_t v8 = __UIAXStringForVariables();

    v7 = (void *)v8;
  }

  _Block_object_dispose(&v15, 8);

  return v7;
}

void __56__SBAppSwitcherPageViewAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 safeValueForKey:@"bundleIdentifier"];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  return 1;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)_accessibilityScrollStatus
{
  v2 = [(SBAppSwitcherPageViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbappswitcheri.isa)];
  char v3 = [v2 safeValueForKey:@"delegate"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [v4 safeValueForKey:@"currentPage"];
  [v5 unsignedIntegerValue];

  objc_opt_class();
  id v6 = [v4 safeValueForKey:@"_items"];
  int v7 = __UIAccessibilityCastAsClass();

  [v7 count];
  uint64_t v8 = NSString;
  v9 = accessibilityLocalizedString(@"app.switcher.location");
  v10 = AXFormatInteger();
  objc_super v11 = AXFormatInteger();
  v12 = objc_msgSend(v8, "stringWithFormat:", v9, v10, v11);

  return v12;
}

- (BOOL)_accessibilityScrollToVisible
{
  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherPageViewAccessibility;
  BOOL v2 = [(SBAppSwitcherPageViewAccessibility *)&v4 _accessibilityScrollToVisible];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A08]);
  return v2;
}

- (CGRect)_accessibilityVisibleFrame
{
  [(SBAppSwitcherPageViewAccessibility *)self accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_super v11 = [(SBAppSwitcherPageViewAccessibility *)self window];
  [v11 bounds];
  v27.origin.CGFloat x = v12;
  v27.origin.CGFloat y = v13;
  v27.size.CGFloat width = v14;
  v27.size.CGFloat height = v15;
  v24.origin.CGFloat x = v4;
  v24.origin.CGFloat y = v6;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v10;
  CGRect v25 = CGRectIntersection(v24, v27);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (BOOL)_accessibilityElementVisibilityAffectsLayout
{
  return 1;
}

- (id)_accessibilityPreferredScrollActions
{
  return &unk_26F7E5EF0;
}

- (id)_focusFallbackScroller
{
  if ([(SBAppSwitcherPageViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    double v3 = [(SBAppSwitcherPageViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_3 startWithSelf:0];
    CGFloat v4 = [v3 _accessibilityViewController];
    double v5 = [v4 safeValueForKey:@"scrollView"];
    CGFloat v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)SBAppSwitcherPageViewAccessibility;
      id v7 = [(SBAppSwitcherPageViewAccessibility *)&v11 _focusFallbackScroller];
    }
    CGFloat v8 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBAppSwitcherPageViewAccessibility;
    CGFloat v8 = [(SBAppSwitcherPageViewAccessibility *)&v10 _focusFallbackScroller];
  }

  return v8;
}

uint64_t __60__SBAppSwitcherPageViewAccessibility__focusFallbackScroller__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Sbfluidswitche.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  v9.receiver = self;
  v9.super_class = (Class)SBAppSwitcherPageViewAccessibility;
  unsigned __int8 v3 = [(SBAppSwitcherPageViewAccessibility *)&v9 canBecomeFocused];
  if ([(SBAppSwitcherPageViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    objc_opt_class();
    CGFloat v4 = __UIAccessibilityCastAsClass();
    double v5 = [v4 window];
    NSClassFromString(&cfstr_Sbmainswitcher_2.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = [MEMORY[0x263F22968] server];
      unsigned __int8 v3 = [v7 isAppSwitcherVisible];
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (id)_viewToAddFocusLayer
{
  objc_opt_class();
  unsigned __int8 v3 = [(SBAppSwitcherPageViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbfluidswitche_6.isa)];
  CGFloat v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityIdentifier:@"ax-focusLayerView"];

  return v4;
}

- (id)accessibilityPath
{
  unsigned __int8 v3 = [(SBAppSwitcherPageViewAccessibility *)self safeUIViewForKey:@"view"];
  CGFloat v4 = [v3 layer];
  [(SBAppSwitcherPageViewAccessibility *)self accessibilityFrame];
  UIRectInsetEdges();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  CGFloat v13 = (void *)MEMORY[0x263F1C478];
  [v4 cornerRadius];
  double v15 = v14;
  v16 = [(SBAppSwitcherPageViewAccessibility *)self _viewToAddFocusLayer];
  [v16 _axScaleTransformForFocusLayerLineWidth];
  char v18 = objc_msgSend(v13, "_bezierPathWithArcRoundedRect:cornerRadius:", v6, v8, v10, v12, v15 / v17);

  return v18;
}

- (id)_accessibilityNativeFocusPreferredElement
{
  unsigned __int8 v3 = [(SBAppSwitcherPageViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbfluidswitche_6.isa)];
  objc_opt_class();
  CGFloat v4 = [(SBAppSwitcherPageViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbfluidswitche_7.isa)];
  double v5 = __UIAccessibilityCastAsSafeCategory();

  double v6 = [v3 safeValueForKey:@"appLayout"];
  double v7 = [v5 _axElementForAppLayout:v6];

  return v7;
}

@end