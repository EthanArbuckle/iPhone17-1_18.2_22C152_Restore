@interface AVMobileChromelessControlsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateControlsVisibilityStateIfNeededAnimated:(id)a3;
- (void)flashControlsWithDuration:(double)a3;
- (void)toggleVisibility:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation AVMobileChromelessControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVMobileChromelessControlsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessControlsViewController", @"toggleVisibility:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessControlsViewController", @"flashControlsWithDuration:", "v", "d", 0);
  [v3 validateClass:@"AVMobileChromelessControlsViewController" hasInstanceVariable:@"_temporarilyVisibile" withType:"B"];
  [v3 validateClass:@"AVMobileChromelessControlsViewController" hasInstanceVariable:@"_view" withType:"AVMobileChromelessControlsView"];
  [v3 validateClass:@"AVMobileChromelessControlsViewController" hasInstanceVariable:@"_needsControlsVisibilityStateUpdate" withType:"B"];
  [v3 validateClass:@"AVMobileChromelessControlsView" hasInstanceVariable:@"_playbackControlsView" withType:"AVMobileChromelessPlaybackControlsView"];
  [v3 validateClass:@"AVMobileChromelessPlaybackControlsView" hasInstanceVariable:@"_playPauseButton" withType:"AVMobileChromelessPlaybackControlButton"];
  [v3 validateClass:@"AVMobileChromelessControlsViewController" hasInstanceVariable:@"_visibilityTimer" withType:"NSTimer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerController", @"isPlaying", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessControlsViewController", @"_updateControlsVisibilityStateIfNeededAnimated:", "v", "@", 0);
  [v3 validateClass:@"AVMobileChromelessControlsViewController" hasProperty:@"playerController" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessPlaybackControlsView", @"playPauseButtonShowsPlayIcon", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessControlsViewControllerAccessibility;
  [(AVMobileChromelessControlsViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AVMobileChromelessControlsViewControllerAccessibility *)self safeValueForKeyPath:@"_view._playbackControlsView._playPauseButton"];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __99__AVMobileChromelessControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265101948;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityLabelBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __99__AVMobileChromelessControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_view"];
  id v3 = [v2 safeValueForKey:@"_playbackControlsView"];
  int v4 = [v3 safeBoolForKey:@"playPauseButtonShowsPlayIcon"];

  if (v4) {
    id v5 = @"play.button";
  }
  else {
    id v5 = @"pause.button";
  }
  v6 = accessibilityLocalizedString(v5);

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromelessControlsViewControllerAccessibility;
  [(AVMobileChromelessControlsViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(AVMobileChromelessControlsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)toggleVisibility:(id)a3
{
  id v4 = a3;
  int v5 = [(AVMobileChromelessControlsViewControllerAccessibility *)self safeBoolForKey:@"_temporarilyVisibile"];
  v15.receiver = self;
  v15.super_class = (Class)AVMobileChromelessControlsViewControllerAccessibility;
  [(AVMobileChromelessControlsViewControllerAccessibility *)&v15 toggleVisibility:v4];

  int v6 = [(AVMobileChromelessControlsViewControllerAccessibility *)self safeBoolForKey:@"_temporarilyVisibile"];
  if (v5 != v6)
  {
    int v7 = v6;
    v8 = [(AVMobileChromelessControlsViewControllerAccessibility *)self safeValueForKey:@"playerController"];
    int v9 = [v8 safeBoolForKey:@"isPlaying"];

    if (((v9 | v7) & 1) == 0)
    {
      v10 = accessibilityLocalizedString(@"hiding.media.controls.announcement");
      UIAccessibilitySpeakOrQueueIfNeeded();
    }
    v11 = [(AVMobileChromelessControlsViewControllerAccessibility *)self safeValueForKey:@"_view"];
    v12 = [v11 safeValueForKey:@"_playbackControlsView"];

    v13 = [v12 safeValueForKey:@"_playPauseButton"];
    if (v7) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v14);
  }
}

- (void)flashControlsWithDuration:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessControlsViewControllerAccessibility;
  [(AVMobileChromelessControlsViewControllerAccessibility *)&v6 flashControlsWithDuration:a3];
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _UIAccessibilityFullKeyboardAccessEnabled())
  {
    id v4 = [(AVMobileChromelessControlsViewControllerAccessibility *)self safeValueForKey:@"_visibilityTimer"];
    int v5 = __UIAccessibilitySafeClass();

    [v5 invalidate];
  }
}

- (void)_updateControlsVisibilityStateIfNeededAnimated:(id)a3
{
  id v4 = a3;
  int v5 = [(AVMobileChromelessControlsViewControllerAccessibility *)self safeBoolForKey:@"_needsControlsVisibilityStateUpdate"];
  char v6 = [(AVMobileChromelessControlsViewControllerAccessibility *)self safeBoolForKey:@"_temporarilyVisibile"];
  if (v5 && (v6 & 1) == 0)
  {
    UIAccessibilityNotifications v7 = *MEMORY[0x263F1CE18];
    v8 = [(AVMobileChromelessControlsViewControllerAccessibility *)self safeValueForKey:@"playerController"];
    UIAccessibilityPostNotification(v7, v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)AVMobileChromelessControlsViewControllerAccessibility;
  [(AVMobileChromelessControlsViewControllerAccessibility *)&v9 _updateControlsVisibilityStateIfNeededAnimated:v4];
}

@end