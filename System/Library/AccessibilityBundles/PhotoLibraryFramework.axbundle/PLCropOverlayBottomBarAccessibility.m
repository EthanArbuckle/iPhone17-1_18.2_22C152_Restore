@interface PLCropOverlayBottomBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdatePlayPauseButtonWithImage;
- (void)_updatePreviewBottomBarForPlaybackState;
- (void)_updateStyle;
@end

@implementation PLCropOverlayBottomBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLCropOverlayBottomBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLCropOverlayPreviewBottomBar", @"playbackButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLCropOverlayBottomBar", @"_updateStyle", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLCropOverlayBottomBar", @"isPlayingVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLCropOverlayBottomBar", @"setStyle: animated:", "v", "q", "B", 0);
}

- (void)_axUpdatePlayPauseButtonWithImage
{
  id v3 = [(PLCropOverlayBottomBarAccessibility *)self safeValueForKey:@"_previewBottomBar"];
  id v6 = [v3 safeValueForKey:@"playbackButton"];

  if ([(PLCropOverlayBottomBarAccessibility *)self safeBoolForKey:@"isPlayingVideo"])v4 = @"pause.button"; {
  else
  }
    v4 = @"play.button";
  v5 = accessibilityLocalizedString(v4);
  [v6 setAccessibilityLabel:v5];
}

- (void)_updatePreviewBottomBarForPlaybackState
{
  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayBottomBarAccessibility;
  [(PLCropOverlayBottomBarAccessibility *)&v3 _updatePreviewBottomBarForPlaybackState];
  [(PLCropOverlayBottomBarAccessibility *)self _axUpdatePlayPauseButtonWithImage];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PLCropOverlayBottomBarAccessibility;
  [(PLCropOverlayBottomBarAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PLCropOverlayBottomBarAccessibility *)self _axUpdatePlayPauseButtonWithImage];
}

- (void)_updateStyle
{
  v2.receiver = self;
  v2.super_class = (Class)PLCropOverlayBottomBarAccessibility;
  [(PLCropOverlayBottomBarAccessibility *)&v2 _updateStyle];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end