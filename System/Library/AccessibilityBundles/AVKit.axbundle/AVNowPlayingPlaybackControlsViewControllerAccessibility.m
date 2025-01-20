@interface AVNowPlayingPlaybackControlsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axAnnounceCurrentScrubPosition;
- (void)_axUpdateAccessibilityCustomActions;
- (void)_setControlsContainerSubviewsVisible:(BOOL)a3 animated:(BOOL)a4 withCoordinators:(id)a5;
- (void)_setPlaybackControlsState:(int64_t)a3 animated:(BOOL)a4;
- (void)_timerFiredForHidingPlaybackControls:(id)a3;
- (void)didPressLeftArrowB39;
- (void)didPressRightArrowB39;
@end

@implementation AVNowPlayingPlaybackControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVNowPlayingPlaybackControlsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"_setControlsContainerSubviewsVisible:animated:withCoordinators:", "v", "B", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"timeControlStatus", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"didPressLeftArrowB39", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"didPressRightArrowB39", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"scanForwardNext", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"scanBackwardNext", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsViewController", @"playbackRate", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"_timerFiredForHidingPlaybackControls:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"_playbackMetadataViewController", "@", 0);
  [v3 validateClass:@"AVNowPlayingPlaybackControlsViewController" hasInstanceVariable:@"_transportBar" withType:"UIView<AVTransportControlsProviding>"];
  [v3 validateClass:@"AVNowPlayingTransportBar" hasInstanceVariable:@"_scrubNeedleTimeLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"overlayViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVxOverlayViewController", @"collectionViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVxCollectionViewController", @"leftItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVxCollectionViewController", @"centerItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVxCollectionViewController", @"rightItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVControlItem", @"_sendActionWithSender:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVNowPlayingPlaybackControlsViewController", @"_setPlaybackControlsState:animated:", "v", "q", "B", 0);
}

- (void)_axUpdateAccessibilityCustomActions
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v26 = [MEMORY[0x263EFF980] array];
  v2 = [MEMORY[0x263EFF980] array];
  v23 = [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)self safeValueForKeyPath:@"overlayViewController.collectionViewController"];
  id v3 = [v23 safeArrayForKey:@"leftItems"];
  [v2 axSafelyAddObjectsFromArray:v3];

  v4 = [v23 safeArrayForKey:@"centerItems"];
  [v2 axSafelyAddObjectsFromArray:v4];

  v5 = [v23 safeArrayForKey:@"rightItems"];
  [v2 axSafelyAddObjectsFromArray:v5];

  objc_initWeak(&location, self);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v2;
  uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v10 = [v9 accessibilityLabel];
        if ([v10 length])
        {
          objc_initWeak(&from, v9);
          id v11 = objc_alloc(MEMORY[0x263F1C390]);
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke;
          v31[3] = &unk_2651018A8;
          objc_copyWeak(&v32, &from);
          objc_copyWeak(&v33, &location);
          v12 = (void *)[v11 initWithName:v10 actionHandler:v31];
          [v26 addObject:v12];

          objc_destroyWeak(&v33);
          objc_destroyWeak(&v32);
          objc_destroyWeak(&from);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v6);
  }

  [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)self setAccessibilityCustomActions:v26];
  v13 = [MEMORY[0x263EFF980] array];
  [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)self safeFloatForKey:@"playbackRate"];
  float v15 = v14;
  if (v14 <= 0.0)
  {
    id v16 = objc_alloc(MEMORY[0x263F1C390]);
    v17 = accessibilityLocalizedString(@"tv.player.fastforward");
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_3;
    v29[3] = &unk_2651018F8;
    objc_copyWeak(&v30, &location);
    v18 = (void *)[v16 initWithName:v17 actionHandler:v29];

    [v13 addObject:v18];
    objc_destroyWeak(&v30);
  }
  if (v15 >= 0.0)
  {
    id v19 = objc_alloc(MEMORY[0x263F1C390]);
    v20 = accessibilityLocalizedString(@"tv.player.rewind");
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_5;
    v27[3] = &unk_2651018F8;
    objc_copyWeak(&v28, &location);
    v21 = (void *)[v19 initWithName:v20 actionHandler:v27];

    [v13 addObject:v21];
    objc_destroyWeak(&v28);
  }
  v22 = [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)self safeValueForKey:@"_transportBar"];
  [v22 setAccessibilityCustomActions:v13];

  objc_destroyWeak(&location);
}

uint64_t __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_copyWeak(&v6, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);

  return 1;
}

void __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _sendActionWithSender:v2];
}

uint64_t __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained scanForwardNext];
}

uint64_t __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained scanBackwardNext];
}

- (void)_setControlsContainerSubviewsVisible:(BOOL)a3 animated:(BOOL)a4 withCoordinators:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v9 = [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)self safeUIViewForKey:@"_transportBar"];
  int v10 = [v9 isHidden];

  v17.receiver = self;
  v17.super_class = (Class)AVNowPlayingPlaybackControlsViewControllerAccessibility;
  [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)&v17 _setControlsContainerSubviewsVisible:v6 animated:v5 withCoordinators:v8];
  uint64_t v11 = [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)self safeIntegerForKey:@"timeControlStatus"];
  if (v6)
  {
    objc_opt_class();
    v12 = [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)self safeValueForKey:@"_playbackMetadataViewController"];
    v13 = __UIAccessibilityCastAsClass();

    float v14 = [v13 accessibilityHeaderElements];
    float v15 = MEMORY[0x24563F3B0]();
    UIAccessibilitySpeakOrQueueIfNeeded();
  }
  if (v10 == v6)
  {
    if (!v11 && !v6)
    {
      id v16 = accessibilityLocalizedString(@"hiding.media.controls.announcement");
      UIAccessibilitySpeakOrQueueIfNeeded();
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (void)_setPlaybackControlsState:(int64_t)a3 animated:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVNowPlayingPlaybackControlsViewControllerAccessibility;
  [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)&v7 _setPlaybackControlsState:a3 animated:a4];
  dispatch_time_t v5 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__setPlaybackControlsState_animated___block_invoke;
  block[3] = &unk_265101920;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

uint64_t __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__setPlaybackControlsState_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axUpdateAccessibilityCustomActions];
}

- (void)_timerFiredForHidingPlaybackControls:(id)a3
{
  id v4 = a3;
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning()
    || [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)self safeIntegerForKey:@"timeControlStatus"])
  {
    v5.receiver = self;
    v5.super_class = (Class)AVNowPlayingPlaybackControlsViewControllerAccessibility;
    [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)&v5 _timerFiredForHidingPlaybackControls:v4];
  }
}

- (void)_axAnnounceCurrentScrubPosition
{
  id v4 = [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)self safeValueForKey:@"_transportBar"];
  id v2 = [v4 safeUIViewForKey:@"_scrubNeedleTimeLabel"];
  if ([v2 _accessibilityViewIsVisible])
  {
    id v3 = [v2 accessibilityLabel];
    if ([v3 length]) {
      UIAccessibilitySpeak();
    }
  }
}

- (void)didPressLeftArrowB39
{
  v3.receiver = self;
  v3.super_class = (Class)AVNowPlayingPlaybackControlsViewControllerAccessibility;
  [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)&v3 didPressLeftArrowB39];
  [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)self _axAnnounceCurrentScrubPosition];
}

- (void)didPressRightArrowB39
{
  v3.receiver = self;
  v3.super_class = (Class)AVNowPlayingPlaybackControlsViewControllerAccessibility;
  [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)&v3 didPressRightArrowB39];
  [(AVNowPlayingPlaybackControlsViewControllerAccessibility *)self _axAnnounceCurrentScrubPosition];
}

@end