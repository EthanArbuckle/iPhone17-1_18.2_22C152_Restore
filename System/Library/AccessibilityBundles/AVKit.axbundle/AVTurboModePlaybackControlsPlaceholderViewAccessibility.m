@interface AVTurboModePlaybackControlsPlaceholderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_makeProminentPlayButtonAndContainer;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AVTurboModePlaybackControlsPlaceholderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTurboModePlaybackControlsPlaceholderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTurboModePlaybackControlsPlaceholderView", @"prominentPlayButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTurboModePlaybackControlsPlaceholderView", @"_makeProminentPlayButtonAndContainer", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AVTurboModePlaybackControlsPlaceholderViewAccessibility;
  [(AVTurboModePlaybackControlsPlaceholderViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilityLocalizedString(@"play.button");
  v4 = [(AVTurboModePlaybackControlsPlaceholderViewAccessibility *)self safeUIViewForKey:@"prominentPlayButton"];
  [v4 setAccessibilityLabel:v3];
}

- (id)_makeProminentPlayButtonAndContainer
{
  v5.receiver = self;
  v5.super_class = (Class)AVTurboModePlaybackControlsPlaceholderViewAccessibility;
  id v3 = [(AVTurboModePlaybackControlsPlaceholderViewAccessibility *)&v5 _makeProminentPlayButtonAndContainer];
  [(AVTurboModePlaybackControlsPlaceholderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end