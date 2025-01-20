@interface HUAnnounceRecordingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformMagicTap;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)beginRecording:(id)a3;
- (void)stopRecordAndSend:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUAnnounceRecordingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUAnnounceRecordingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUAnnounceRecordingViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"HURecordingButton" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAnnounceRecordingViewController", @"beginRecording:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAnnounceRecordingViewController", @"stopRecordAndSend:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAnnounceRecordingViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAnnounceRecordingViewController", @"largeTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUAnnounceRecordingViewController", @"recordButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  [(HUAnnounceRecordingViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CEF8];
  v4 = [(HUAnnounceRecordingViewControllerAccessibility *)self safeUIViewForKey:@"largeTitleLabel"];
  [v4 setAccessibilityTraits:v3];
}

- (BOOL)accessibilityPerformMagicTap
{
  return 1;
}

void __78__HUAnnounceRecordingViewControllerAccessibility_accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safeValueForKey:@"recordButton"];
  [v1 sendActionsForControlEvents:64];
}

- (void)beginRecording:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  [(HUAnnounceRecordingViewControllerAccessibility *)&v6 beginRecording:a3];
  [(id)*MEMORY[0x263F1D020] _accessibilitySetIsDictationListeningOverride:MEMORY[0x263EFFA88]];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F1CE18];
  objc_super v5 = [(HUAnnounceRecordingViewControllerAccessibility *)self safeValueForKey:@"recordButton"];
  UIAccessibilityPostNotification(v4, v5);
}

- (void)stopRecordAndSend:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  [(HUAnnounceRecordingViewControllerAccessibility *)&v3 stopRecordAndSend:a3];
  [(id)*MEMORY[0x263F1D020] _accessibilitySetIsDictationListeningOverride:0];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  [(HUAnnounceRecordingViewControllerAccessibility *)&v3 viewDidLoad];
  [(HUAnnounceRecordingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  [(HUAnnounceRecordingViewControllerAccessibility *)&v3 viewDidAppear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE38], (id)*MEMORY[0x263F1CE20]);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HUAnnounceRecordingViewControllerAccessibility;
  [(HUAnnounceRecordingViewControllerAccessibility *)&v3 viewWillDisappear:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE60], (id)*MEMORY[0x263F1CE20]);
}

@end