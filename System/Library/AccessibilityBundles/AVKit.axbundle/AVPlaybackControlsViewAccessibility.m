@interface AVPlaybackControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAllControlsAreHidden;
- (BOOL)_accessibilityViewIsVisible;
- (BOOL)accessibilityElementsHidden;
- (id)_accessibilityFullScreenViewController;
- (id)_accessibilityNextResponderOfClass:(Class)a3;
- (id)_accessibilityPlaybackControlsVisibilityController;
- (id)_accessibilityPlayerViewController;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setFullScreen:(BOOL)a3;
@end

@implementation AVPlaybackControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVPlaybackControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsView", @"volumeButton", "@", 0);
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_scrubber" withType:"AVScrubber"];
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_volumeSlider" withType:"AVVolumeSlider"];
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_skipBackButton" withType:"AVButton"];
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_skipForwardButton" withType:"AVButton"];
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_mediaSelectionButton" withType:"AVButton"];
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_fullScreenButton" withType:"AVButton"];
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_standardPlayPauseButton" withType:"AVButton"];
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_pictureInPictureButton" withType:"AVButton"];
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_prominentPlayButton" withType:"AVButton"];
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_standardPlayPauseButton" withType:"AVButton"];
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_doneButton" withType:"AVButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackControlsView", @"hasVisibleSubview", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVButton", @"imageName", "@", 0);
}

- (id)_accessibilityNextResponderOfClass:(Class)a3
{
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  if (v3)
  {
    do
    {
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v3 nextResponder];

      id v3 = (void *)v4;
    }
    while (v4);
  }

  return v3;
}

- (id)_accessibilityFullScreenViewController
{
  if (_accessibilityFullScreenViewController_onceToken != -1) {
    dispatch_once(&_accessibilityFullScreenViewController_onceToken, &__block_literal_global);
  }
  uint64_t v3 = _accessibilityFullScreenViewController_AVFullScreenViewControllerClass;

  return [(AVPlaybackControlsViewAccessibility *)self _accessibilityNextResponderOfClass:v3];
}

Class __77__AVPlaybackControlsViewAccessibility__accessibilityFullScreenViewController__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Avfullscreenvi.isa);
  _accessibilityFullScreenViewController_AVFullScreenViewControllerClass = (uint64_t)result;
  return result;
}

- (id)_accessibilityPlayerViewController
{
  if (_accessibilityPlayerViewController_onceToken != -1) {
    dispatch_once(&_accessibilityPlayerViewController_onceToken, &__block_literal_global_336);
  }
  uint64_t v3 = [(AVPlaybackControlsViewAccessibility *)self _accessibilityNextResponderOfClass:_accessibilityPlayerViewController_AVPlayerViewControllerClass];
  if (!v3)
  {
    uint64_t v4 = [(AVPlaybackControlsViewAccessibility *)self _accessibilityFullScreenViewController];
    v5 = [v4 safeValueForKey:@"delegate"];
    uint64_t v3 = __UIAccessibilitySafeClass();
  }

  return v3;
}

Class __73__AVPlaybackControlsViewAccessibility__accessibilityPlayerViewController__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Avplayerviewco.isa);
  _accessibilityPlayerViewController_AVPlayerViewControllerClass = (uint64_t)result;
  return result;
}

- (id)_accessibilityPlaybackControlsVisibilityController
{
  v2 = [(AVPlaybackControlsViewAccessibility *)self _accessibilityPlayerViewController];
  uint64_t v3 = [v2 safeValueForKey:@"_playbackControlsVisibilityController"];
  uint64_t v4 = __UIAccessibilitySafeClass();

  return v4;
}

- (BOOL)_accessibilityAllControlsAreHidden
{
  return [(AVPlaybackControlsViewAccessibility *)self safeBoolForKey:@"hasVisibleSubview"] ^ 1;
}

- (BOOL)_accessibilityViewIsVisible
{
  if ([(AVPlaybackControlsViewAccessibility *)self _accessibilityAllControlsAreHidden])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackControlsViewAccessibility;
  return [(AVPlaybackControlsViewAccessibility *)&v4 _accessibilityViewIsVisible];
}

- (BOOL)accessibilityElementsHidden
{
  if ([(AVPlaybackControlsViewAccessibility *)self _accessibilityAllControlsAreHidden])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackControlsViewAccessibility;
  return [(AVPlaybackControlsViewAccessibility *)&v4 accessibilityElementsHidden];
}

- (void)setFullScreen:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVPlaybackControlsViewAccessibility;
  -[AVPlaybackControlsViewAccessibility setFullScreen:](&v8, sel_setFullScreen_);
  v5 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"_fullScreenButton"];
  if (v3) {
    v6 = @"exitfullscreen.button";
  }
  else {
    v6 = @"fullscreen.button";
  }
  v7 = accessibilityLocalizedString(v6);
  [v5 setAccessibilityLabel:v7];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v34.receiver = self;
  v34.super_class = (Class)AVPlaybackControlsViewAccessibility;
  [(AVPlaybackControlsViewAccessibility *)&v34 _accessibilityLoadAccessibilityInformation];
  BOOL v3 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"_scrubber"];
  objc_super v4 = accessibilityLocalizedString(@"time.position.scrubber");
  [v3 setAccessibilityLabel:v4];

  v5 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"_volumeSlider"];
  v6 = accessibilityLocalizedString(@"volume.slider");
  [v5 setAccessibilityLabel:v6];

  v7 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"_skipBackButton"];
  objc_super v8 = NSString;
  v9 = accessibilityLocalizedString(@"media.skip.backwards");
  v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, 0x402E000000000000);
  [v7 setAccessibilityLabel:v10];

  v11 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"_skipForwardButton"];
  v12 = NSString;
  v13 = accessibilityLocalizedString(@"media.skip.forward");
  v14 = objc_msgSend(v12, "localizedStringWithFormat:", v13, 0x402E000000000000);
  [v11 setAccessibilityLabel:v14];

  v15 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"_mediaSelectionButton"];
  v16 = accessibilityLocalizedString(@"media.selection");
  [v15 setAccessibilityLabel:v16];

  v17 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"_pictureInPictureButton"];
  v18 = accessibilityLocalizedString(@"pictureInPicture.button");
  [v17 setAccessibilityLabel:v18];

  v19 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"_prominentPlayButton"];
  v20 = accessibilityLocalizedString(@"play.button");
  [v19 setAccessibilityLabel:v20];

  v21 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"_doneButton"];
  v22 = accessibilityLocalizedString(@"close.button");
  [v21 setAccessibilityLabel:v22];

  v23 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"volumeButton"];
  v24 = accessibilityLocalizedString(@"volume.button");
  [v23 setAccessibilityLabel:v24];

  v25 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"_standardPlayPauseButton"];
  [v25 accessibilitySetIdentification:@"axPlayPauseButton"];

  LODWORD(v25) = [(AVPlaybackControlsViewAccessibility *)self safeBoolForKey:@"isFullScreen"];
  v26 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"_fullScreenButton"];
  if (v25) {
    v27 = @"exitfullscreen.button";
  }
  else {
    v27 = @"fullscreen.button";
  }
  v28 = accessibilityLocalizedString(v27);
  [v26 setAccessibilityLabel:v28];

  v29 = [(AVPlaybackControlsViewAccessibility *)self safeValueForKey:@"videoGravityButton"];
  objc_initWeak(&location, v29);

  id v30 = objc_loadWeakRetained(&location);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __81__AVPlaybackControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v31[3] = &unk_265101948;
  objc_copyWeak(&v32, &location);
  [v30 _setAccessibilityLabelBlock:v31];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

id __81__AVPlaybackControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"imageName"];

  id v3 = v2;
  if ([v3 isEqualToString:@"rectangle.portrait.arrowtriangle.2.inward"])
  {
    objc_super v4 = @"scale.to.fit.portrait";
LABEL_8:
    v5 = accessibilityLocalizedString(v4);
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"rectangle.portrait.arrowtriangle.2.outward"])
  {
    objc_super v4 = @"scale.to.fill.portrait";
    goto LABEL_8;
  }
  if (([v3 isEqualToString:@"rectangle.arrowtriangle.2.inward"] & 1) != 0
    || [v3 isEqualToString:@"rectangle.arrowtriangle.2.outward"])
  {
    objc_super v4 = @"scale.to.fit.landscape";
    goto LABEL_8;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

@end