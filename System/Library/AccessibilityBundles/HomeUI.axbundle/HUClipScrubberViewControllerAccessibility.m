@interface HUClipScrubberViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsEditingClips;
- (BOOL)_axIsStreamingLive;
- (id)_axPlaybackEngine;
- (id)selectionButton;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axToggleClipTimescale:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUClipScrubberViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUClipScrubberViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUClipScrubberViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"HUClipScrubberViewController" hasInstanceVariable:@"_scrubberUpdateDisplayLink" withType:"CADisplayLink"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUClipScrubberViewController", @"didDoubleTap:", "v", "@", 0);
  [v3 validateClass:@"HUClipScrubberViewController" hasInstanceVariable:@"_playbackEngine" withType:"HFCameraPlaybackEngine"];
  [v3 validateClass:@"HUClipScrubberViewController" hasInstanceVariable:@"_scrubberView" withType:"HUClipScrubberView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUClipScrubberView", @"rightActionButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUClipScrubberViewController", @"nearbyAccessoriesButton", "@", 0);
  [v3 validateClass:@"HUClipScrubberView" hasInstanceVariable:@"_displayMode" withType:"NSUInteger"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v21.receiver = self;
  v21.super_class = (Class)HUClipScrubberViewControllerAccessibility;
  [(HUClipScrubberViewControllerAccessibility *)&v21 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HUClipScrubberViewControllerAccessibility *)self safeValueForKeyPath:@"_scrubberView.rightActionButton"];
  v4 = [(HUClipScrubberViewControllerAccessibility *)self safeValueForKey:@"nearbyAccessoriesButton"];
  v5 = accessibilityHomeUILocalizedString(@"camera.nearby.accessories");
  [v4 setAccessibilityLabel:v5];

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v18[3] = &unk_265128018;
  objc_copyWeak(&v19, &location);
  [v3 _setAccessibilityLabelBlock:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v16[3] = &unk_2651280F8;
  v16[4] = self;
  objc_copyWeak(&v17, &location);
  [v3 _setAccessibilityTraitsBlock:v16];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v13 = &unk_265128120;
  v14 = self;
  objc_copyWeak(&v15, &location);
  [v3 _setAccessibilityHintBlock:&v10];
  v6 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v10, v11, v12, v13, v14);
  [v6 removeObserver:self name:AXToggleClipTimescaleNotification object:0];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__axToggleClipTimescale_ name:AXToggleClipTimescaleNotification object:0];

  if (AXIsInternalInstall())
  {
    v8 = [(HUClipScrubberViewControllerAccessibility *)self safeValueForKey:@"feedbackButton"];
    v9 = accessibilityHomeUILocalizedString(@"internal.clipfeedback.button");
    [v8 setAccessibilityLabel:v9];
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

id __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained _axIsEditingClips];
  id v3 = @"camera.live.button";
  if (v2) {
    id v3 = @"camera.trash.button";
  }
  v4 = v3;

  v5 = accessibilityHomeUILocalizedString(v4);

  v6 = AXAttributedStringForBetterPronuciation();

  return v6;
}

uint64_t __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _axIsEditingClips];
  uint64_t v3 = *MEMORY[0x263F1CEE8];
  if ((v2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v5 = [WeakRetained _axIsStreamingLive];
    v6 = (void *)MEMORY[0x263F1CF38];
    if (!v5) {
      v6 = (void *)MEMORY[0x263F1CF20];
    }
    v3 |= *v6;
  }
  return v3;
}

id __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _axIsEditingClips])
  {
    char v2 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v4 = [WeakRetained _axIsStreamingLive];
    int v5 = @"camera.streaming.live.no";
    if (v4) {
      int v5 = @"camera.streaming.live.yes";
    }
    v6 = v5;

    v7 = accessibilityHomeUILocalizedString(v6);

    char v2 = AXAttributedStringForBetterPronuciation();
  }

  return v2;
}

- (void)_axToggleClipTimescale:(id)a3
{
  AXPerformSafeBlock();
  int v4 = [(HUClipScrubberViewControllerAccessibility *)self safeValueForKeyPath:@"dataSource.timeController"];
  int v5 = [v4 safeBoolForKey:@"isAtMinimumZoom"];

  if (v5) {
    v6 = @"scrubber.timescale.shrunk";
  }
  else {
    v6 = @"scrubber.timescale.expanded";
  }
  v7 = accessibilityHomeUILocalizedString(v6);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v7);
}

uint64_t __68__HUClipScrubberViewControllerAccessibility__axToggleClipTimescale___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didDoubleTap:0];
}

- (BOOL)_axIsEditingClips
{
  char v2 = [(HUClipScrubberViewControllerAccessibility *)self safeValueForKey:@"_scrubberView"];
  BOOL v3 = [v2 safeUnsignedIntegerForKey:@"_displayMode"] == 1;

  return v3;
}

- (BOOL)_axIsStreamingLive
{
  BOOL v3 = [(HUClipScrubberViewControllerAccessibility *)self _axPlaybackEngine];
  if ([v3 engineMode])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    objc_opt_class();
    int v5 = [(HUClipScrubberViewControllerAccessibility *)self safeValueForKey:@"_scrubberUpdateDisplayLink"];
    v6 = __UIAccessibilityCastAsClass();

    int v4 = [v6 isPaused] ^ 1;
  }

  return v4;
}

- (id)_axPlaybackEngine
{
  objc_opt_class();
  BOOL v3 = [(HUClipScrubberViewControllerAccessibility *)self safeValueForKey:@"playbackEngine"];
  int v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUClipScrubberViewControllerAccessibility;
  [(HUClipScrubberViewControllerAccessibility *)&v3 viewDidLoad];
  [(HUClipScrubberViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)selectionButton
{
  v5.receiver = self;
  v5.super_class = (Class)HUClipScrubberViewControllerAccessibility;
  char v2 = [(HUClipScrubberViewControllerAccessibility *)&v5 selectionButton];
  objc_super v3 = accessibilityHomeUILocalizedString(@"camera.clip.share.and.edit.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

@end