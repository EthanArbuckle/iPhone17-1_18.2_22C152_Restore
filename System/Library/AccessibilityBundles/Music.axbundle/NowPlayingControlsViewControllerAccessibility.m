@interface NowPlayingControlsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)axAudioRouteNotificationRegistered;
- (BOOL)axLikedStateNotificationRegistered;
- (BOOL)axMediaCommandNotificationRegistered;
- (id)_accessibilityLeftbuttonValueString;
- (id)_accessibilityResponseForViewController;
- (id)_accessibilityResponseTracklist;
- (id)_accessibilityResponseTracklistPlayingItem;
- (id)_axLikedBannedValueForState:(int64_t)a3;
- (id)_axUpNextBadgeValue;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)axSetAudioRouteNotificationRegistered:(BOOL)a3;
- (void)axSetLikedStateNotificationRegistered:(BOOL)a3;
- (void)axSetMediaCommandNotificationRegistered:(BOOL)a3;
- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation NowPlayingControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicNowPlayingControlsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)axMediaCommandNotificationRegistered
{
  return MEMORY[0x270F0A438](self, &__NowPlayingControlsViewControllerAccessibility__axMediaCommandNotificationRegistered);
}

- (void)axSetMediaCommandNotificationRegistered:(BOOL)a3
{
}

- (BOOL)axAudioRouteNotificationRegistered
{
  return MEMORY[0x270F0A438](self, &__NowPlayingControlsViewControllerAccessibility__axAudioRouteNotificationRegistered);
}

- (void)axSetAudioRouteNotificationRegistered:(BOOL)a3
{
}

- (BOOL)axLikedStateNotificationRegistered
{
  return MEMORY[0x270F0A438](self, &__NowPlayingControlsViewControllerAccessibility__axLikedStateNotificationRegistered);
}

- (void)axSetLikedStateNotificationRegistered:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"contextButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"leftButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"playPauseStopButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"rightButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"subtitleButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"dismissButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseItem", @"likeCommand", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseItem", @"dislikeCommand", "@", 0);
  [v3 validateProtocol:@"MPCPlayerFeedbackCommand" hasRequiredInstanceMethod:@"value"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"accessibilityNowPlayingResponse", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"setControlsHidden:animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"tracklist", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"state", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"accessibilityLyricsButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"accessibilityQueueButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseTracklist", @"shuffleType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseTracklist", @"repeatType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseTracklist", @"playingItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseItem", @"isAutoPlay", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseTracklist", @"actionAtQueueEnd", "q", 0);
  [v3 validateClass:@"MusicNowPlayingControlsViewController" hasSwiftField:@"areControlsHidden" withSwiftType:"Bool"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"accessibilityPlayingItemAudioTraitButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_opt_class();
  id v3 = [(NowPlayingControlsViewControllerAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityIdentifier:@"AXNowPlayingTitleLabel"];
  LOBYTE(location[0]) = 0;
  objc_opt_class();
  v5 = [(NowPlayingControlsViewControllerAccessibility *)self safeValueForKey:@"subtitleButton"];
  v6 = __UIAccessibilityCastAsClass();

  [v6 setAccessibilityIdentifier:@"AXNowPlayingSubtitleButton"];
  v7 = [(NowPlayingControlsViewControllerAccessibility *)self safeValueForKey:@"dismissButton"];
  v8 = accessibilityMusicLocalizedString(@"dismiss.now.playing.button");
  [v7 setAccessibilityLabel:v8];

  [v7 setAccessibilityIdentifier:@"NowPlayingDismissButton"];
  v9 = [(NowPlayingControlsViewControllerAccessibility *)self safeValueForKey:@"contextButton"];
  [v9 setIsAccessibilityElement:1];
  v10 = accessibilityMusicLocalizedString(@"more.button");
  [v9 setAccessibilityLabel:v10];

  [v9 setAccessibilityIdentifier:@"NowPlayingMoreButton"];
  v11 = [(NowPlayingControlsViewControllerAccessibility *)self safeValueForKey:@"leftButton"];
  objc_initWeak(location, self);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v28[3] = &unk_26513BCD0;
  objc_copyWeak(&v29, location);
  [v11 _setAccessibilityLabelBlock:v28];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v26[3] = &unk_26513BCD0;
  v18 = v7;
  objc_copyWeak(&v27, location);
  [v11 _setAccessibilityValueBlock:v26];
  uint64_t v12 = *MEMORY[0x263F1CEE8];
  [v11 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v11 setAccessibilityIdentifier:@"NowPlayingLeftButton"];
  v17 = v4;
  v13 = [(NowPlayingControlsViewControllerAccessibility *)self safeValueForKey:@"playPauseStopButton"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v24[3] = &unk_26513BCD0;
  objc_copyWeak(&v25, location);
  [v13 _setAccessibilityLabelBlock:v24];
  [v13 setAccessibilityIdentifier:@"NowPlayingPlayPauseStopButton"];
  v14 = [(NowPlayingControlsViewControllerAccessibility *)self safeValueForKey:@"rightButton"];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v22[3] = &unk_26513BCD0;
  objc_copyWeak(&v23, location);
  [v14 _setAccessibilityLabelBlock:v22];
  [v14 setAccessibilityTraits:v12];
  [v14 setAccessibilityIdentifier:@"NowPlayingRightButton"];
  v15 = [(NowPlayingControlsViewControllerAccessibility *)self safeValueForKey:@"accessibilityLyricsButton"];
  [v15 _setAccessibilityLabelBlock:&__block_literal_global_1];
  [v15 setAccessibilityIdentifier:@"NowPlayingLyricsButton"];
  v16 = [(NowPlayingControlsViewControllerAccessibility *)self safeValueForKey:@"accessibilityQueueButton"];
  [v16 _setAccessibilityLabelBlock:&__block_literal_global_401];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v20[3] = &unk_26513BCD0;
  objc_copyWeak(&v21, location);
  [v16 _setAccessibilityValueBlock:v20];
  [v16 setAccessibilityIdentifier:@"NowPlayingUpNextButton"];
  [(NowPlayingControlsViewControllerAccessibility *)self setControlsHidden:[(NowPlayingControlsViewControllerAccessibility *)self safeSwiftBoolForKey:@"areControlsHidden"] animated:1];
  v19.receiver = self;
  v19.super_class = (Class)NowPlayingControlsViewControllerAccessibility;
  [(NowPlayingControlsViewControllerAccessibility *)&v19 _accessibilityLoadAccessibilityInformation];
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(location);
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityResponseForViewController];

  if ([MEMORY[0x263F8C6D0] accessibilityIsSeekEnabledInDirection:2 forResponse:v2]) {
    [MEMORY[0x263F8C6D0] accessibilitySeekButtonStringInDirection:2 response:v2];
  }
  else {
  id v3 = accessibilityMusicLocalizedString(@"button.prev.text");
  }

  return v3;
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityLeftbuttonValueString];

  return v2;
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityResponseForViewController];

  id v3 = [MEMORY[0x263F8C6D0] accessibilityPlayPauseStopButtonString:v2];

  return v3;
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityResponseForViewController];

  if ([MEMORY[0x263F8C6D0] accessibilityIsSeekEnabledInDirection:1 forResponse:v2]) {
    [MEMORY[0x263F8C6D0] accessibilitySeekButtonStringInDirection:1 response:v2];
  }
  else {
  id v3 = accessibilityMusicLocalizedString(@"button.next.text");
  }

  return v3;
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5()
{
  return accessibilityMusicLocalizedString(@"lyrics.button");
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6()
{
  return accessibilityMusicLocalizedString(@"upnext.button");
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _axUpNextBadgeValue];

  return v2;
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

uint64_t __75__NowPlayingControlsViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (id)_axLikedBannedValueForState:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityMusicLocalizedString(off_26513BD10[a3]);
  }
  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NowPlayingControlsViewControllerAccessibility;
  [(NowPlayingControlsViewControllerAccessibility *)&v3 viewDidLoad];
  [(NowPlayingControlsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_accessibilityLeftbuttonValueString
{
  objc_super v3 = [(NowPlayingControlsViewControllerAccessibility *)self _accessibilityResponseTracklistPlayingItem];
  uint64_t v4 = [v3 safeValueForKey:@"likeCommand"];

  v5 = [(NowPlayingControlsViewControllerAccessibility *)self _accessibilityResponseTracklistPlayingItem];
  uint64_t v6 = [v5 safeValueForKey:@"dislikeCommand"];

  if (v4 | v6)
  {
    int v7 = [(id)v4 safeBoolForKey:@"value"];
    int v8 = [(id)v6 safeBoolForKey:@"value"];
    v9 = @"favorite.not.set";
    if (v8) {
      v9 = @"favorite.off";
    }
    if (v7) {
      v10 = @"favorite.on";
    }
    else {
      v10 = v9;
    }
    v11 = accessibilityMusicLocalizedString(v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_axUpNextBadgeValue
{
  objc_super v3 = [NSString string];
  uint64_t v4 = [(NowPlayingControlsViewControllerAccessibility *)self _accessibilityResponseTracklist];
  uint64_t v5 = [v4 safeIntegerForKey:@"repeatType"];
  if (v5 == 2)
  {
    uint64_t v6 = @"repeat.all";
  }
  else
  {
    if (v5 != 1) {
      goto LABEL_7;
    }
    uint64_t v6 = @"repeat.one";
  }
  uint64_t v7 = accessibilityMusicLocalizedString(v6);
  if (v7)
  {
    int v8 = (void *)v7;
    accessibilityMusicLocalizedString(@"repeat.button");
    v20 = v8;
    v18 = id v23 = @"__AXStringForVariablesSentinel";
    uint64_t v9 = __UIAXStringForVariables();

    objc_super v3 = (void *)v9;
  }
LABEL_7:
  if ((unint64_t)(objc_msgSend(v4, "safeIntegerForKey:", @"shuffleType", v18, v20, v23) - 1) <= 1)
  {
    uint64_t v10 = accessibilityMusicLocalizedString(@"shuffle.on");
    if (v10)
    {
      v11 = (void *)v10;
      accessibilityMusicLocalizedString(@"shuffle.button");
      id v21 = v11;
      objc_super v19 = v24 = @"__AXStringForVariablesSentinel";
      uint64_t v12 = __UIAXStringForVariables();

      objc_super v3 = (void *)v12;
    }
  }
  v13 = [(NowPlayingControlsViewControllerAccessibility *)self _accessibilityResponseTracklistPlayingItem];
  v14 = [v13 safeValueForKey:@"isAutoPlay"];

  if (v14 && [v4 safeIntegerForKey:@"actionAtQueueEnd"] == 3)
  {
    v15 = accessibilityMusicLocalizedString(@"autoplay.button");
    v22 = accessibilityMusicLocalizedString(@"autoplay.on");
    uint64_t v16 = __UIAXStringForVariables();

    objc_super v3 = (void *)v16;
  }

  return v3;
}

- (id)_accessibilityResponseForViewController
{
  return (id)[(NowPlayingControlsViewControllerAccessibility *)self safeValueForKey:@"accessibilityNowPlayingResponse"];
}

- (id)_accessibilityResponseTracklist
{
  v2 = [(NowPlayingControlsViewControllerAccessibility *)self _accessibilityResponseForViewController];
  objc_super v3 = [v2 safeValueForKey:@"tracklist"];

  return v3;
}

- (id)_accessibilityResponseTracklistPlayingItem
{
  v2 = [(NowPlayingControlsViewControllerAccessibility *)self _accessibilityResponseTracklist];
  objc_super v3 = [v2 safeValueForKey:@"playingItem"];

  return v3;
}

- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning()) {
    BOOL v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)NowPlayingControlsViewControllerAccessibility;
  [(NowPlayingControlsViewControllerAccessibility *)&v7 setControlsHidden:v5 animated:v4];
}

@end