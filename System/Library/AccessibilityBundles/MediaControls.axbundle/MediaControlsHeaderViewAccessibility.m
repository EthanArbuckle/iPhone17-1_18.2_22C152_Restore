@interface MediaControlsHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (id)_accessibilityCombinedTitleElement;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation MediaControlsHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"routingButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"doneButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"routeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"primaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"secondaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"primaryMarqueeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"secondaryMarqueeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"style", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"launchNowPlayingAppButton", "@", 0);
  [v3 validateClass:@"MediaControlsPanelViewController"];
  [v3 validateClass:@"MPRouteLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPRouteLabel", @"titleLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v32.receiver = self;
  v32.super_class = (Class)MediaControlsHeaderViewAccessibility;
  [(MediaControlsHeaderViewAccessibility *)&v32 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MediaControlsHeaderViewAccessibility *)self safeValueForKey:@"doneButton"];
  v4 = accessibilityLocalizedString(@"done.button.label");
  [v3 setAccessibilityLabel:v4];

  objc_opt_class();
  v5 = [(MediaControlsHeaderViewAccessibility *)self safeValueForKey:@"primaryLabel"];
  v6 = __UIAccessibilityCastAsClass();

  LOBYTE(location) = 0;
  objc_opt_class();
  v7 = [(MediaControlsHeaderViewAccessibility *)self safeValueForKey:@"secondaryLabel"];
  v8 = __UIAccessibilityCastAsClass();

  v9 = [(MediaControlsHeaderViewAccessibility *)self safeUIViewForKey:@"primaryMarqueeView"];
  v10 = [(MediaControlsHeaderViewAccessibility *)self safeUIViewForKey:@"secondaryMarqueeView"];
  v11 = [(MediaControlsHeaderViewAccessibility *)self safeValueForKey:@"routeLabel"];
  v12 = [v11 safeValueForKey:@"titleLabel"];
  [v6 setIsAccessibilityElement:0];
  [v8 setIsAccessibilityElement:0];
  [v11 setIsAccessibilityElement:0];
  [v12 setIsAccessibilityElement:0];
  [v9 setAccessibilityElementsHidden:1];
  [v10 setAccessibilityElementsHidden:1];
  v13 = [(MediaControlsHeaderViewAccessibility *)self safeValueForKey:@"launchNowPlayingAppButton"];
  [v13 setIsAccessibilityElement:0];

  objc_initWeak(&location, self);
  Class v14 = NSClassFromString(&cfstr_Mediacontrolsp_0.isa);
  if (v14)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v29[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v29[4] = v14;
    v15 = [(MediaControlsHeaderViewAccessibility *)self _accessibilityFindAncestor:v29 startWithSelf:0];
    objc_initWeak(&v30, v15);

    id v16 = objc_loadWeakRetained(&v30);
    [v16 setAccessibilityContainerType:4];

    id v17 = objc_loadWeakRetained(&v30);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v27[3] = &unk_265130468;
    objc_copyWeak(&v28, &location);
    [v17 _setAccessibilityLabelBlock:v27];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
  }
  v18 = [(MediaControlsHeaderViewAccessibility *)self safeUIViewForKey:@"routingButton"];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v25 = &unk_265130490;
  id v19 = v18;
  id v26 = v19;
  v20 = (void *)MEMORY[0x245654070](&v22);
  v21 = objc_msgSend(v20, "copy", v22, v23, v24, v25);
  [v19 _setAccessibilityPathBlock:v21];

  objc_destroyWeak(&location);
}

uint64_t __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"primaryMarqueeView"];
  [v2 alpha];
  if (v3 >= 0.1)
  {
    objc_opt_class();
    v5 = [WeakRetained safeValueForKey:@"routeLabel"];
    v6 = __UIAccessibilityCastAsClass();

    v4 = [v6 accessibilityLabel];
    if ([WeakRetained safeIntegerForKey:@"style"] != 2)
    {
      v9 = accessibilityLocalizedString(@"wha.panel.active");
      uint64_t v7 = __UIAXStringForVariables();

      v4 = (void *)v7;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) accessibilityFrame];
  v1 = (void *)MEMORY[0x263F1C478];

  return objc_msgSend(v1, "bezierPathWithRoundedRect:cornerRadius:");
}

- (id)accessibilityElements
{
  double v3 = [(MediaControlsHeaderViewAccessibility *)self _accessibilityCombinedTitleElement];
  v4 = [(MediaControlsHeaderViewAccessibility *)self safeUIViewForKey:@"primaryMarqueeView"];
  v5 = [(MediaControlsHeaderViewAccessibility *)self safeUIViewForKey:@"secondaryMarqueeView"];
  objc_opt_class();
  v6 = [(MediaControlsHeaderViewAccessibility *)self safeValueForKey:@"subviews"];
  uint64_t v7 = __UIAccessibilityCastAsClass();

  v8 = (void *)[v7 mutableCopy];
  [v8 removeObject:v4];
  [v8 removeObject:v5];
  [v8 insertObject:v3 atIndex:0];

  return v8;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsHeaderViewAccessibility;
  [(MediaControlsHeaderViewAccessibility *)&v3 layoutSubviews];
  [(MediaControlsHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityCombinedTitleElement
{
  objc_super v3 = [(MediaControlsHeaderViewAccessibility *)self _accessibilityValueForKey:@"combinedTitleElement"];
  if (!v3)
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke;
    v11[3] = &unk_265130468;
    objc_copyWeak(&v12, &location);
    [v3 _setAccessibilityLabelBlock:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_2;
    v9[3] = &unk_2651304B8;
    objc_copyWeak(&v10, &location);
    [v3 _setAccessibilityFrameBlock:v9];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_3;
    v7[3] = &unk_2651304E0;
    objc_copyWeak(&v8, &location);
    v7[4] = self;
    [v3 _setAccessibilityHintBlock:v7];
    uint64_t v4 = [v3 accessibilityTraits];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_4;
    v6[3] = &unk_265130508;
    v6[4] = self;
    v6[5] = v4;
    [v3 _setAccessibilityTraitsBlock:v6];
    [(MediaControlsHeaderViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"combinedTitleElement"];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v3;
}

id __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained safeValueForKey:@"primaryLabel"];
  v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  id v6 = objc_loadWeakRetained(v2);
  uint64_t v7 = [v6 safeValueForKey:@"secondaryLabel"];
  id v8 = __UIAccessibilityCastAsClass();

  id v9 = objc_loadWeakRetained(v2);
  id v10 = [v9 safeValueForKey:@"routeLabel"];

  v11 = [v10 accessibilityLabel];
  id v12 = [v5 accessibilityLabel];
  v15 = [v8 accessibilityLabel];
  v13 = __UIAXStringForVariables();

  return v13;
}

double __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v3 = [WeakRetained safeUIViewForKey:@"primaryMarqueeView"];

  id v4 = objc_loadWeakRetained(v1);
  v5 = [v4 safeUIViewForKey:@"secondaryMarqueeView"];

  id v6 = objc_loadWeakRetained(v1);
  uint64_t v7 = [v6 safeUIViewForKey:@"routeLabel"];

  id v8 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 3, v3, v5, v7);
  UIAXFrameForElements();
  double v10 = v9;

  return v10;
}

id __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_3(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = [WeakRetained safeValueForKey:@"routeLabel"];
  id v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  uint64_t v5 = [*(id *)(a1 + 32) safeValueForKey:@"launchNowPlayingAppButton"];
  id v6 = __UIAccessibilityCastAsClass();

  LOBYTE(v5) = [v6 isHidden];
  uint64_t v7 = [*(id *)(a1 + 32) safeIntegerForKey:@"style"];
  if (v5)
  {
    if (v7 == 2)
    {
      id v8 = NSString;
      double v9 = accessibilityLocalizedString(@"expand.collapsed.route.hint");
      double v10 = [v4 accessibilityLabel];
      v11 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v10);
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = accessibilityLocalizedString(@"launch.now.playing.app.button.hint");
  }
  Class v14 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  id v12 = __UIAXStringForVariables();

  return v12;
}

uint64_t __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_4(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"launchNowPlayingAppButton"];
  objc_super v3 = __UIAccessibilityCastAsClass();

  LOBYTE(v2) = [v3 isHidden];
  uint64_t v4 = [*(id *)(a1 + 32) safeIntegerForKey:@"style"];
  uint64_t v5 = (void *)MEMORY[0x263F1CF18];
  if ((v2 & (v4 != 2)) == 0) {
    uint64_t v5 = (void *)MEMORY[0x263F1CEE8];
  }
  return *v5 | *(void *)(a1 + 40);
}

@end