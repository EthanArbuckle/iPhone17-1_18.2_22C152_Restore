@interface AVPlayerViewControllerContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation AVPlayerViewControllerContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVPlayerViewControllerContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerViewControllerContentView", @"playbackControlsView", "@", 0);
  [v3 validateClass:@"AVPlaybackControlsView"];
  [v3 validateClass:@"AVPlaybackControlsView" hasInstanceVariable:@"_doneButton" withType:"AVButton"];
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(AVPlayerViewControllerContentViewAccessibility *)self safeValueForKey:@"playbackControlsView"];
  id v3 = [v2 safeValueForKey:@"_doneButton"];
  char v4 = [v3 accessibilityActivate];

  return v4;
}

@end