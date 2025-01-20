@interface HFCameraPlaybackEngineAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)clipPlayerDidPlayToEndTime:(id)a3;
- (void)updatePlaybackPositionToDate:(id)a3 usingClip:(id)a4;
@end

@implementation HFCameraPlaybackEngineAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HFCameraPlaybackEngine";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFCameraPlaybackEngine", @"updatePlaybackPositionToDate:usingClip:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HFCameraPlaybackEngine", @"clipPlayerDidPlayToEndTime:", "v", "@", 0);
}

- (void)updatePlaybackPositionToDate:(id)a3 usingClip:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HFCameraPlaybackEngineAccessibility;
  [(HFCameraPlaybackEngineAccessibility *)&v5 updatePlaybackPositionToDate:a3 usingClip:a4];
  if (UIAccessibilityIsVoiceOverRunning()) {
    [(HFCameraPlaybackEngineAccessibility *)self pause];
  }
}

- (void)clipPlayerDidPlayToEndTime:(id)a3
{
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
  id v5 = a3;
  v6 = accessibilityHomeUILocalizedString(@"camera.streaming.live.yes");
  v7 = AXAttributedStringForBetterPronuciation();
  UIAccessibilityPostNotification(v4, v7);

  v8.receiver = self;
  v8.super_class = (Class)HFCameraPlaybackEngineAccessibility;
  [(HFCameraPlaybackEngineAccessibility *)&v8 clipPlayerDidPlayToEndTime:v5];
}

@end