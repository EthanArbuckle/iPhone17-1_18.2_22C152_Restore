@interface RGBLivenessCaptureSelfieVCAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axHandleCoachingAnnouncement;
- (void)performClosuresAwaitingImageQualityVerification;
- (void)presentCoachingSuccess:(id)a3;
- (void)presentSkipGestureAlert;
- (void)restartSelfieCapture;
- (void)showAXOptions;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RGBLivenessCaptureSelfieVCAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC", @"viewWillAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC", @"presentCoachingSuccess:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC", @"showAXOptions", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC", @"presentSkipGestureAlert", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC", @"restartSelfieCapture", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC", @"performClosuresAwaitingImageQualityVerification", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CoreIDVRGBLiveness.RGBLivenessCaptureSelfieVC", @"captureSelfieView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CoreIDVRGBLiveness.CaptureSelfieView", @"coachingPrompt", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CoreIDVRGBLiveness.CaptureSelfieView", @"nagPrompt", "@", 0);
}

- (void)_axHandleCoachingAnnouncement
{
  v2 = [(RGBLivenessCaptureSelfieVCAccessibility *)self safeUIViewForKey:@"captureSelfieView"];
  [v2 safeUIViewForKey:@"_coachingPrompt"];
  v6 = v5 = v2;
  id v3 = v6;
  id v4 = v2;
  AXPerformSafeBlock();
}

uint64_t __72__RGBLivenessCaptureSelfieVCAccessibility__axHandleCoachingAnnouncement__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axHandleAnnouncementMachine:*(void *)(a1 + 40) polite:1 moveToView:1];
}

- (void)performClosuresAwaitingImageQualityVerification
{
  v2.receiver = self;
  v2.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  [(RGBLivenessCaptureSelfieVCAccessibility *)&v2 performClosuresAwaitingImageQualityVerification];
  AXPerformSafeBlock();
}

void __90__RGBLivenessCaptureSelfieVCAccessibility_performClosuresAwaitingImageQualityVerification__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"captureSelfieView"];
  objc_super v2 = [*(id *)(a1 + 32) safeUIViewForKey:@"nagPrompt"];
  [v3 _axHandleAnnouncementMachine:v2 polite:1 moveToView:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  [(RGBLivenessCaptureSelfieVCAccessibility *)&v3 viewWillAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)showAXOptions
{
  v2.receiver = self;
  v2.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  [(RGBLivenessCaptureSelfieVCAccessibility *)&v2 showAXOptions];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)restartSelfieCapture
{
  v2.receiver = self;
  v2.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  [(RGBLivenessCaptureSelfieVCAccessibility *)&v2 restartSelfieCapture];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)presentSkipGestureAlert
{
  v3.receiver = self;
  v3.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  [(RGBLivenessCaptureSelfieVCAccessibility *)&v3 presentSkipGestureAlert];
  [(RGBLivenessCaptureSelfieVCAccessibility *)self _axHandleCoachingAnnouncement];
}

- (void)presentCoachingSuccess:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RGBLivenessCaptureSelfieVCAccessibility;
  [(RGBLivenessCaptureSelfieVCAccessibility *)&v3 presentCoachingSuccess:a3];
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

void __66__RGBLivenessCaptureSelfieVCAccessibility_presentCoachingSuccess___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"captureSelfieView"];
  id v1 = (id)[v2 safeValueForKey:@"_axHandleNonInterruptableCoachingAnnouncement"];
}

@end