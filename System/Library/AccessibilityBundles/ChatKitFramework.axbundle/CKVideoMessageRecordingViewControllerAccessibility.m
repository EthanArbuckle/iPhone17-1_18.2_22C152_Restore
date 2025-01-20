@interface CKVideoMessageRecordingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)presentVideoActionMenuController;
- (void)swapCamera:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKVideoMessageRecordingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKVideoMessageRecordingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKVideoMessageRecordingViewController", @"presentVideoActionMenuController", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKVideoMessageRecordingViewController", @"videoActionMenuController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKActionMenuItem", @"view", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKActionMenuItem", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKVideoMessageRecordingViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKVideoMessageRecordingViewController", @"swapCameraButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKVideoMessageRecordingViewController", @"cameraViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKVideoMessageRecordingViewController", @"swapCamera:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)CKVideoMessageRecordingViewControllerAccessibility;
  [(CKVideoMessageRecordingViewControllerAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKVideoMessageRecordingViewControllerAccessibility *)self safeValueForKey:@"cameraViewController"];
  v4 = __UIAccessibilitySafeClass();

  uint64_t v5 = [v4 cameraDevice];
  v6 = [(CKVideoMessageRecordingViewControllerAccessibility *)self safeValueForKey:@"swapCameraButton"];
  v7 = accessibilityCameraKitLocalizedString(@"camera.chooser.button.text");
  [v6 setAccessibilityLabel:v7];

  [v6 setAccessibilityIdentifier:@"FrontBackFacingCameraChooser"];
  if (v5 == 1) {
    v8 = @"camera.chooser.front.text";
  }
  else {
    v8 = @"camera.chooser.back.text";
  }
  v9 = accessibilityCameraKitLocalizedString(v8);
  [v6 setAccessibilityValue:v9];
}

- (void)swapCamera:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKVideoMessageRecordingViewControllerAccessibility;
  [(CKVideoMessageRecordingViewControllerAccessibility *)&v4 swapCamera:a3];
  [(CKVideoMessageRecordingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CKVideoMessageRecordingViewControllerAccessibility;
  [(CKVideoMessageRecordingViewControllerAccessibility *)&v3 viewDidLoad];
  [(CKVideoMessageRecordingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)presentVideoActionMenuController
{
  v6.receiver = self;
  v6.super_class = (Class)CKVideoMessageRecordingViewControllerAccessibility;
  [(CKVideoMessageRecordingViewControllerAccessibility *)&v6 presentVideoActionMenuController];
  objc_super v3 = [(CKVideoMessageRecordingViewControllerAccessibility *)self safeValueForKey:@"videoActionMenuController"];
  objc_opt_class();
  objc_super v4 = [v3 safeValueForKey:@"actionMenuItems"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  [v5 enumerateObjectsUsingBlock:&__block_literal_global_7];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], (id)*MEMORY[0x263F21988]);
}

void __86__CKVideoMessageRecordingViewControllerAccessibility_presentVideoActionMenuController__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  objc_opt_class();
  uint64_t v5 = [v4 safeValueForKey:@"view"];
  objc_super v6 = __UIAccessibilityCastAsClass();

  [v6 setIsAccessibilityElement:1];
  uint64_t v7 = *MEMORY[0x263F1CEE8];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  objc_opt_class();
  v8 = [v4 safeValueForKey:@"label"];
  v9 = __UIAccessibilityCastAsClass();

  [v9 setIsAccessibilityElement:0];
  if (a3 == 2)
  {
    uint64_t v11 = accessibilityLocalizedString(@"cancel.button");
LABEL_9:
    v13 = (void *)v11;
    [v6 setAccessibilityLabel:v11];

    goto LABEL_10;
  }
  if (a3 == 1)
  {
    v12 = accessibilityLocalizedString(@"media.message.picture");
    [v6 setAccessibilityLabel:v12];

    goto LABEL_7;
  }
  if (a3)
  {
    uint64_t v11 = [v9 accessibilityLabel];
    goto LABEL_9;
  }
  objc_super v10 = accessibilityLocalizedString(@"media.message.video");
  [v6 setAccessibilityLabel:v10];

  [v6 setAccessibilityTraits:*MEMORY[0x263F1CF40] | v7];
LABEL_7:
  [v6 _accessibilitySetBoolValue:1 forKey:@"AXShouldBypassAXActivate"];
LABEL_10:
}

@end