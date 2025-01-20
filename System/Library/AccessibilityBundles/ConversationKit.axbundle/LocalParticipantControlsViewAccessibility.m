@interface LocalParticipantControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (int64_t)_axDevicePosition;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation LocalParticipantControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.LocalParticipantControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.LocalParticipantControlsView", @"effectsButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.LocalParticipantControlsView", @"cameraBlurButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.LocalParticipantControlsView", @"cinematicFramingButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.LocalParticipantControlsView", @"cameraFlipButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.LocalParticipantControlsView", @"collapseButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v19.receiver = self;
  v19.super_class = (Class)LocalParticipantControlsViewAccessibility;
  [(LocalParticipantControlsViewAccessibility *)&v19 _accessibilityLoadAccessibilityInformation];
  id v3 = [(LocalParticipantControlsViewAccessibility *)self safeValueForKey:@"effectsButton"];
  v4 = accessibilityLocalizedString(@"camera.effects");
  [v3 setAccessibilityLabel:v4];

  v5 = [(LocalParticipantControlsViewAccessibility *)self safeValueForKey:@"cameraBlurButton"];
  v6 = accessibilityLocalizedString(@"camera.blur.background");
  [v5 setAccessibilityLabel:v6];

  v7 = [(LocalParticipantControlsViewAccessibility *)self safeValueForKey:@"cinematicFramingButton"];
  v8 = accessibilityLocalizedString(@"camera.center.stage");
  [v7 setAccessibilityLabel:v8];

  objc_initWeak(&location, self);
  v9 = [(LocalParticipantControlsViewAccessibility *)self safeValueForKey:@"collapseButton"];
  v10 = accessibilityLocalizedString(@"minimize.video");
  [v9 setAccessibilityLabel:v10];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v16[3] = &unk_265119F78;
  objc_copyWeak(&v17, &location);
  [v9 _setAccessibilityActivateBlock:v16];
  v11 = [(LocalParticipantControlsViewAccessibility *)self safeValueForKey:@"cameraFlipButton"];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v14[3] = &unk_265119FC8;
  objc_copyWeak(&v15, &location);
  [v11 _setAccessibilityLabelBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v12[3] = &unk_265119F78;
  objc_copyWeak(&v13, &location);
  [v11 _setAccessibilityActivateBlock:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

uint64_t __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"collapseButton"];
  [v2 sendActionsForControlEvents:64];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return 1;
}

id __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _axDevicePosition] == 2) {
    v2 = @"camera.show.back";
  }
  else {
    v2 = @"camera.show.front";
  }
  id v3 = accessibilityLocalizedString(v2);

  return v3;
}

uint64_t __87__LocalParticipantControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"cameraFlipButton"];
  [v2 sendActionsForControlEvents:64];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return 1;
}

- (int64_t)_axDevicePosition
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __62__LocalParticipantControlsViewAccessibility__axDevicePosition__block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x263F7E1A0] sharedInstance];
  int64_t v2 = [v4 videoDeviceController];
  id v3 = [v2 currentInputDevice];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 position];
}

@end