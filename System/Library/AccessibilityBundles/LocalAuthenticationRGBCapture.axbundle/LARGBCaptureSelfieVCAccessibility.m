@interface LARGBCaptureSelfieVCAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axAnnounceSuccess;
- (void)_dispatchSkipButtonTimers;
- (void)_restartSelfieCapture:(id)a3;
- (void)_toggleFlash:(id)a3;
- (void)captureSelfieDidFinishGestureMonitoring;
- (void)captureSelfieWillMonitorGesture:(int64_t)a3;
@end

@implementation LARGBCaptureSelfieVCAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LARGBCaptureSelfieVC";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LARGBCaptureSelfieVC", @"captureSelfieWillMonitorGesture:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LARGBCaptureSelfieVC", @"_dispatchSkipButtonTimers", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LARGBCaptureSelfieVC", @"_toggleFlash:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LARGBCaptureSelfieVC", @"captureSelfieDidFinishGestureMonitoring", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LARGBCaptureSelfieVC", @"_restartSelfieCapture:", "v", "@", 0);
  [v3 validateClass:@"LARGBCaptureSelfieVC" hasInstanceVariable:@"_gesturePrompt" withType:"UILabel"];
  [v3 validateClass:@"LARGBCaptureSelfieVC" hasInstanceVariable:@"_cameraFeed" withType:"LARGBCameraPreview"];
  [v3 validateClass:@"LARGBCaptureSelfieVC" hasInstanceVariable:@"_didSkipLastGesture" withType:"B"];
  [v3 validateClass:@"LARGBCaptureSelfieVC" hasInstanceVariable:@"_hasPresentedFirstGesture" withType:"B"];
  [v3 validateClass:@"LARGBCaptureSelfieVC" hasInstanceVariable:@"_flashButton" withType:"UIBarButtonItem"];
}

- (void)_toggleFlash:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
  [(LARGBCaptureSelfieVCAccessibility *)&v9 _toggleFlash:a3];
  uint64_t v4 = *MEMORY[0x263F1CEE8];
  int v5 = [(LARGBCaptureSelfieVCAccessibility *)self safeBoolForKey:@"_useFlash"];
  uint64_t v6 = *MEMORY[0x263F1CF38];
  if (!v5) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v6 | v4;
  v8 = [(LARGBCaptureSelfieVCAccessibility *)self safeValueForKey:@"_flashButton"];
  [v8 setAccessibilityTraits:v7];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_restartSelfieCapture:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
  [(LARGBCaptureSelfieVCAccessibility *)&v3 _restartSelfieCapture:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_axAnnounceSuccess
{
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  accessibilityLocalizedString(@"selfie.success");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(LARGBCaptureSelfieVCAccessibility *)self safeUIViewForKey:@"_gesturePrompt"];
  uint64_t v6 = [v4 accessibilityLabel];
  int v5 = __AXStringForVariables();
  UIAccessibilityPostNotification(v3, v5);
}

- (void)captureSelfieWillMonitorGesture:(int64_t)a3
{
  if ([(LARGBCaptureSelfieVCAccessibility *)self safeBoolForKey:@"_hasPresentedFirstGesture"])
  {
    char v5 = [(LARGBCaptureSelfieVCAccessibility *)self safeBoolForKey:@"_didSkipLastGesture"];
    v6.receiver = self;
    v6.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
    [(LARGBCaptureSelfieVCAccessibility *)&v6 captureSelfieWillMonitorGesture:a3];
    if ((v5 & 1) == 0) {
      [(LARGBCaptureSelfieVCAccessibility *)self _axAnnounceSuccess];
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
    [(LARGBCaptureSelfieVCAccessibility *)&v6 captureSelfieWillMonitorGesture:a3];
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)captureSelfieDidFinishGestureMonitoring
{
  char v3 = [(LARGBCaptureSelfieVCAccessibility *)self safeBoolForKey:@"_didSkipLastGesture"];
  v4.receiver = self;
  v4.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
  [(LARGBCaptureSelfieVCAccessibility *)&v4 captureSelfieDidFinishGestureMonitoring];
  if ((v3 & 1) == 0) {
    [(LARGBCaptureSelfieVCAccessibility *)self _axAnnounceSuccess];
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_dispatchSkipButtonTimers
{
  v6.receiver = self;
  v6.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
  [(LARGBCaptureSelfieVCAccessibility *)&v6 _dispatchSkipButtonTimers];
  char v3 = [(LARGBCaptureSelfieVCAccessibility *)self safeUIViewForKey:@"_gesturePrompt"];
  objc_super v4 = [v3 accessibilityLabel];

  char v5 = [(LARGBCaptureSelfieVCAccessibility *)self safeUIViewForKey:@"_cameraFeed"];
  [v5 setAccessibilityHint:v4];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v4);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end