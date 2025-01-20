@interface AVMobileChromelessVolumeControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AVMobileChromelessVolumeControlsViewAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilitySliderVolume;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AVMobileChromelessVolumeControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVMobileChromelessVolumeControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVMobileChromelessVolumeControlsView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"AVMobileChromelessVolumeControlsView" hasInstanceVariable:@"_volumeButton" withType:"AVMobileVolumeChromelessButtonControl"];
  [v3 validateClass:@"AVMobileChromelessVolumeControlsView" hasInstanceVariable:@"_volumeSlider" withType:"AVMobileChromelessSlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessVolumeControlsView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessVolumeControlsView", @"volume", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessControlsViewController", @"volumeControlsView:volumeDidChangeTo:", "v", "@", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessVolumeControlsView", @"_setVolume:forUpdateReason:", "v", "d", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessVolumeControlsView", @"isMuted", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v18.receiver = self;
  v18.super_class = (Class)AVMobileChromelessVolumeControlsViewAccessibility;
  [(AVMobileChromelessVolumeControlsViewAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(AVMobileChromelessVolumeControlsViewAccessibility *)self safeValueForKey:@"volumeButton"];
  objc_initWeak(&v16, v3);

  id v4 = objc_loadWeakRetained(&v16);
  uint64_t v5 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v5 | *MEMORY[0x263F1CED8]];

  id v6 = objc_loadWeakRetained(&v16);
  [v6 _setAccessibilityLabelBlock:&__block_literal_global_2];

  id v7 = objc_loadWeakRetained(&v16);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v14[3] = &unk_265101A88;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  [v7 _setAccessibilityValueBlock:v14];

  id v8 = objc_loadWeakRetained(&v16);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v12[3] = &unk_2651018D0;
  objc_copyWeak(&v13, &location);
  [v8 _setAccessibilityIncrementBlock:v12];

  id v9 = objc_loadWeakRetained(&v16);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v10[3] = &unk_2651018D0;
  objc_copyWeak(&v11, &location);
  [v9 _setAccessibilityDecrementBlock:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

id __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityLocalizedString(@"volume.button");
}

id __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained safeBoolForKey:@"isMuted"]) {
    accessibilityLocalizedString(@"volume.button.muted");
  }
  else {
  id v3 = [*(id *)(a1 + 32) _accessibilitySliderVolume];
  }

  return v3;
}

void __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained safeCGFloatForKey:@"volume"];
  AXPerformSafeBlock();
}

void __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _setVolume:0 forUpdateReason:*(double *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  [v2 volumeControlsView:*(void *)(a1 + 32) volumeDidChangeTo:*(double *)(a1 + 40)];
}

void __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained safeCGFloatForKey:@"volume"];
  AXPerformSafeBlock();
}

void __95__AVMobileChromelessVolumeControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _setVolume:0 forUpdateReason:*(double *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  [v2 volumeControlsView:*(void *)(a1 + 32) volumeDidChangeTo:*(double *)(a1 + 40)];
}

- (id)_accessibilitySliderVolume
{
  id v3 = [(AVMobileChromelessVolumeControlsViewAccessibility *)self safeValueForKey:@"volumeSlider"];
  id v4 = [v3 accessibilityUserDefinedValue];

  if (v4)
  {
    [v3 accessibilityUserDefinedValue];
  }
  else
  {
    [(AVMobileChromelessVolumeControlsViewAccessibility *)self safeFloatForKey:@"volume"];
    AXFormatFloatWithPercentage();
  uint64_t v5 = };

  return v5;
}

- (AVMobileChromelessVolumeControlsViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessVolumeControlsViewAccessibility;
  id v3 = -[AVMobileChromelessVolumeControlsViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AVMobileChromelessVolumeControlsViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end