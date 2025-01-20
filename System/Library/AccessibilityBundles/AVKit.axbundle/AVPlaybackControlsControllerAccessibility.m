@interface AVPlaybackControlsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsMuted;
- (BOOL)_axShouldShowRegularControlsBecauseOfAccessibility;
- (BOOL)_axToggleAudioControls:(id)a3;
- (void)_accessibilityHandlePlayerLayerViewFocused:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityPlayerLayerViewAccessibilityFocusedChanged:(id)a3;
- (void)_autoHideControlsAfterDelay:(double)a3;
- (void)_axAnnounceAudioControlStateDidChange;
- (void)_axLoadVolumeButtonAccessibilityInformation:(id)a3;
- (void)_axSetShouldShowRegularControlsBecauseOfAccessibility:(BOOL)a3;
- (void)dealloc;
- (void)playbackControlsViewDidLoad:(id)a3;
@end

@implementation AVPlaybackControlsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVPlaybackControlsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsController", @"_prefersVolumeSliderExpandedAutomatically", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsController", @"_updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsController", @"_autoHideControlsAfterDelay:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsController", @"showPlaybackControls:immediately:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsController", @"beginUserInteraction", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsController", @"endUserInteraction", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsController", @"prefersMuted", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsController", @"volumeControlsCanShowSlider", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsController", @"playbackControlsViewDidLoad:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsController", @"playbackControlsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsView", @"volumeButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)AVPlaybackControlsControllerAccessibility;
  [(AVPlaybackControlsControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AVPlaybackControlsControllerAccessibility *)self safeValueForKeyPath:@"playbackControlsView.volumeButton"];
  [(AVPlaybackControlsControllerAccessibility *)self _axLoadVolumeButtonAccessibilityInformation:v3];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v5 = *MEMORY[0x263F1D1B0];
  [v4 removeObserver:self name:*MEMORY[0x263F1D1B0] object:0];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__axAnnounceAudioControlStateDidChange name:v5 object:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D1B0] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:AXVisibilityItemHiddenChangedNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)AVPlaybackControlsControllerAccessibility;
  [(AVPlaybackControlsControllerAccessibility *)&v5 dealloc];
}

- (void)playbackControlsViewDidLoad:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackControlsControllerAccessibility;
  [(AVPlaybackControlsControllerAccessibility *)&v4 playbackControlsViewDidLoad:a3];
  [(AVPlaybackControlsControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axLoadVolumeButtonAccessibilityInformation:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __89__AVPlaybackControlsControllerAccessibility__axLoadVolumeButtonAccessibilityInformation___block_invoke;
  v12 = &unk_265101948;
  objc_copyWeak(&v13, &location);
  [v4 _setAccessibilityValueBlock:&v9];
  if ([(AVPlaybackControlsControllerAccessibility *)self safeBoolForKey:@"volumeControlsCanShowSlider", v9, v10, v11, v12])
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    v6 = accessibilityLocalizedString(@"toggle.audio.controls");
    objc_super v7 = (void *)[v5 initWithName:v6 target:self selector:sel__axToggleAudioControls_];

    v15[0] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [v4 setAccessibilityCustomActions:v8];
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

id __89__AVPlaybackControlsControllerAccessibility__axLoadVolumeButtonAccessibilityInformation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _axIsMuted])
  {
    v2 = accessibilityLocalizedString(@"volume.button.muted");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)_axIsMuted
{
  return [(AVPlaybackControlsControllerAccessibility *)self safeBoolForKey:@"prefersMuted"];
}

- (BOOL)_axToggleAudioControls:(id)a3
{
  AXPerformSafeBlock();
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
  id v5 = [(AVPlaybackControlsControllerAccessibility *)self safeValueForKeyPath:@"playbackControlsView.volumeButton"];
  UIAccessibilityPostNotification(v4, v5);

  return 1;
}

uint64_t __68__AVPlaybackControlsControllerAccessibility__axToggleAudioControls___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) safeBoolForKey:@"_prefersVolumeSliderExpandedAutomatically"] ^ 1;
  [*(id *)(a1 + 32) _updateVolumeButtonInclusionAndPrefersVolumeSliderExpandedWithPreferredExpansion:v2];
  id v3 = *(void **)(a1 + 32);

  return [v3 _accessibilitySetBoolValue:v2 forKey:@"AXAudioControlIsExpanded"];
}

- (void)_axAnnounceAudioControlStateDidChange
{
  if ([(AVPlaybackControlsControllerAccessibility *)self safeBoolForKey:@"volumeControlsCanShowSlider"]&& [(AVPlaybackControlsControllerAccessibility *)self _accessibilityBoolValueForKey:@"AXAudioControlIsExpanded"])
  {
    id v3 = (void *)MEMORY[0x263F21660];
    UIAccessibilityNotifications v4 = accessibilityLocalizedString(@"audio.controls.updated");
    id v5 = [v3 stringWithString:v4];

    [v5 setAttribute:&unk_26F5FB280 forKey:*MEMORY[0x263F216D8]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
  }

  [(AVPlaybackControlsControllerAccessibility *)self _accessibilitySetBoolValue:0 forKey:@"AXAudioControlIsExpanded"];
}

- (void)_accessibilityPlayerLayerViewAccessibilityFocusedChanged:(id)a3
{
  UIAccessibilityNotifications v4 = [a3 object];
  if ([v4 BOOLValue])
  {
    [(AVPlaybackControlsControllerAccessibility *)self performSelector:sel__accessibilityHandlePlayerLayerViewFocused_ withObject:v4 afterDelay:0.0];
    AXPerformSafeBlock();
  }
  else
  {
    [(AVPlaybackControlsControllerAccessibility *)self performSelector:sel__accessibilityHandlePlayerLayerViewFocused_ withObject:v4 afterDelay:5.0];
  }
}

void __102__AVPlaybackControlsControllerAccessibility__accessibilityPlayerLayerViewAccessibilityFocusedChanged___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = [*(id *)(a1 + 32) safeValueForKey:@"playbackControlsVisibilityTimer"];
  id v3 = __UIAccessibilityCastAsClass();

  [v3 invalidate];
  [*(id *)(a1 + 32) showPlaybackControls:1 immediately:1];
}

- (BOOL)_axShouldShowRegularControlsBecauseOfAccessibility
{
  return MEMORY[0x270F09620](self, &__AVPlaybackControlsVisibilityControllerAccessibility___axShouldShowRegularControlsBecauseOfAccessibility);
}

- (void)_axSetShouldShowRegularControlsBecauseOfAccessibility:(BOOL)a3
{
}

- (void)_accessibilityHandlePlayerLayerViewFocused:(id)a3
{
  UIAccessibilityNotifications v4 = (void *)MEMORY[0x263F8C6D0];
  id v5 = a3;
  [v4 cancelPreviousPerformRequestsWithTarget:self selector:sel__accessibilityHandlePlayerLayerViewFocused_ object:MEMORY[0x263EFFA88]];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__accessibilityHandlePlayerLayerViewFocused_ object:MEMORY[0x263EFFA80]];
  -[AVPlaybackControlsControllerAccessibility _axSetShouldShowRegularControlsBecauseOfAccessibility:](self, "_axSetShouldShowRegularControlsBecauseOfAccessibility:", [v5 BOOLValue]);
  LOBYTE(v4) = [v5 BOOLValue];

  if ((v4 & 1) == 0) {
    AXPerformSafeBlock();
  }
}

uint64_t __88__AVPlaybackControlsControllerAccessibility__accessibilityHandlePlayerLayerViewFocused___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginUserInteraction];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 endUserInteraction];
}

- (void)_autoHideControlsAfterDelay:(double)a3
{
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)AVPlaybackControlsControllerAccessibility;
    [(AVPlaybackControlsControllerAccessibility *)&v5 _autoHideControlsAfterDelay:a3];
  }
}

@end