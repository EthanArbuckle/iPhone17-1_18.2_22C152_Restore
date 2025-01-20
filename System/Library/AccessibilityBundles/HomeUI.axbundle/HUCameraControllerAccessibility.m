@interface HUCameraControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (id)nextControlItem;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axLoadAccessibilityInformationForDayOrTimeLabel:(id)a3;
- (void)configureClipScrubberViewController;
- (void)viewDidLoad;
@end

@implementation HUCameraControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUCameraController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUCameraController" hasInstanceVariable:@"_dayLabel" withType:"UILabel"];
  [v3 validateClass:@"HUCameraController" hasInstanceVariable:@"_timeLabel" withType:"UILabel"];
  [v3 validateClass:@"HULegibilityLabel" hasInstanceVariable:@"_lookasideLabel" withType:"UILabel"];
  [v3 validateClass:@"HUCameraController" hasInstanceVariable:@"_cameraStatusView" withType:"HUCameraStatusOverlayView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCameraStatusOverlayView", @"statusLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCameraController", @"homeHasMultipleCameraProfiles", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCameraController", @"nextControlItem", "@", 0);
  [v3 validateClass:@"HUCameraController" hasInstanceVariable:@"_nextControlItem" withType:"AVHomeLoadingButtonControlItem"];
  [v3 validateClass:@"AVHomeLoadingButtonControlItem" hasInstanceVariable:@"_loadingButtonView" withType:"AVLoadingButtonView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVLoadingButtonView", @"button", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"hu_dismissViewControllerAnimated:", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerViewController", @"customControlItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVControlItem", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCameraController", @"configureClipScrubberViewController", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)HUCameraControllerAccessibility;
  [(HUCameraControllerAccessibility *)&v28 _accessibilityLoadAccessibilityInformation];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v2 = [(HUCameraControllerAccessibility *)self safeArrayForKey:@"customControlItems"];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v25 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v7 = [v6 safeStringForKey:@"title"];
        int v8 = [v7 isEqualToString:@"Settings"];

        if (v8)
        {
          v9 = accessibilityHomeUILocalizedString(@"settings.button");
          [v6 setAccessibilityLabel:v9];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v3);
  }

  v10 = [(HUCameraControllerAccessibility *)self safeValueForKey:@"_cameraStatusView"];
  objc_initWeak(&location, v10);

  id v11 = objc_loadWeakRetained(&location);
  v12 = [v11 _accessibilityFindSubviewDescendant:&__block_literal_global_2];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v21[3] = &unk_265128018;
  objc_copyWeak(&v22, &location);
  [v12 _setAccessibilityLabelBlock:v21];
  objc_initWeak(&from, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v18[3] = &unk_265128088;
  objc_copyWeak(&v19, &from);
  [v12 _setAccessibilityTraitsBlock:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v16[3] = &unk_265128018;
  objc_copyWeak(&v17, &from);
  [v12 _setAccessibilityHintBlock:v16];
  v13 = [(HUCameraControllerAccessibility *)self safeValueForKey:@"_dayLabel"];
  [(HUCameraControllerAccessibility *)self _axLoadAccessibilityInformationForDayOrTimeLabel:v13];

  v14 = [(HUCameraControllerAccessibility *)self safeValueForKey:@"_timeLabel"];
  [(HUCameraControllerAccessibility *)self _axLoadAccessibilityInformationForDayOrTimeLabel:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

uint64_t __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained safeValueForKey:@"statusLabel"];
  uint64_t v3 = [v2 text];

  return v3;
}

uint64_t __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained safeBoolForKey:@"homeHasMultipleCameraProfiles"];
  uint64_t v3 = (uint64_t *)MEMORY[0x263F1CEE8];
  if (!v2) {
    uint64_t v3 = (uint64_t *)MEMORY[0x263F1CF18];
  }
  uint64_t v4 = *v3;

  return v4;
}

id __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"homeHasMultipleCameraProfiles"])
  {
    int v2 = accessibilityHomeUILocalizedString(@"camera.picker.button");
  }
  else
  {
    int v2 = 0;
  }

  return v2;
}

- (void)_axLoadAccessibilityInformationForDayOrTimeLabel:(id)a3
{
  id v3 = a3;
  [v3 setIsAccessibilityElement:1];
  uint64_t v4 = [v3 safeValueForKey:@"_lookasideLabel"];
  objc_initWeak(&location, v4);

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__HUCameraControllerAccessibility__axLoadAccessibilityInformationForDayOrTimeLabel___block_invoke;
  v7[3] = &unk_265128018;
  objc_copyWeak(&v8, &location);
  [v3 _setAccessibilityLabelBlock:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__HUCameraControllerAccessibility__axLoadAccessibilityInformationForDayOrTimeLabel___block_invoke_2;
  v5[3] = &unk_2651280D0;
  objc_copyWeak(&v6, &location);
  [v3 _setAccessibilityFrameBlock:v5];
  [v3 _accessibilitySetBoolValue:1 forKey:AXHomeUIUseAccessibilityFrameForHitTest];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __84__HUCameraControllerAccessibility__axLoadAccessibilityInformationForDayOrTimeLabel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained accessibilityLabel];
  id v3 = AXAttributedStringForBetterPronuciation();

  return v3;
}

double __84__HUCameraControllerAccessibility__axLoadAccessibilityInformationForDayOrTimeLabel___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  double v3 = v2;
  double v5 = v4;

  return v3 + v5 * 0.4 * 0.5;
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

void __61__HUCameraControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  id v1 = (id)objc_msgSend(v2, "hu_dismissViewControllerAnimated:", 1);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUCameraControllerAccessibility;
  [(HUCameraControllerAccessibility *)&v3 viewDidLoad];
  [(HUCameraControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)configureClipScrubberViewController
{
  v3.receiver = self;
  v3.super_class = (Class)HUCameraControllerAccessibility;
  [(HUCameraControllerAccessibility *)&v3 configureClipScrubberViewController];
  [(HUCameraControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)nextControlItem
{
  v6.receiver = self;
  v6.super_class = (Class)HUCameraControllerAccessibility;
  id v2 = [(HUCameraControllerAccessibility *)&v6 nextControlItem];
  MEMORY[0x2456509F0](@"AVHomeLoadingButtonControlItem");
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = [v2 safeValueForKeyPath:@"_loadingButtonView.button"];
    double v4 = accessibilityHomeUILocalizedString(@"camera.clip.next.button.share");
    [v3 setAccessibilityHint:v4];
  }

  return v2;
}

@end