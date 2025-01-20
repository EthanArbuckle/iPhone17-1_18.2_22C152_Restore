@interface InCallControlsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (int64_t)_axDevicePosition;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation InCallControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.InCallControlsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ConversationKit.InCallControlsViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"ConversationKit.InCallControlsViewController" hasSwiftField:@"delegate" withSwiftType:"Optional<InCallControlsViewControllerDelegate>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsViewController", @"accessibilityHotdog", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsViewController", @"accessibilityJoinLeaveButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsViewController", @"accessibilityEffectsButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsViewController", @"accessibilityCameraButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsViewController", @"accessibilityCameraLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsViewController", @"accessibilityDisableVideoButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsViewController", @"shouldShowLeaveButton", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.InCallControlsViewController", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MultiwayViewControllerAccessibility", @"_accessibilityExpandControls", "v", 0);
}

- (BOOL)accessibilityPerformEscape
{
  if ([(InCallControlsViewControllerAccessibility *)self safeBoolForKey:@"isExpanded"]) {
    return 0;
  }
  v4 = [(InCallControlsViewControllerAccessibility *)self safeValueForKey:@"accessibilityEffectsButton"];
  uint64_t v5 = [v4 accessibilityTraits];
  if ((*MEMORY[0x263F1CF38] & ~v5) != 0) {
    char v3 = 0;
  }
  else {
    char v3 = [v4 accessibilityActivate];
  }

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v28.receiver = self;
  v28.super_class = (Class)InCallControlsViewControllerAccessibility;
  [(InCallControlsViewControllerAccessibility *)&v28 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  char v3 = [(InCallControlsViewControllerAccessibility *)self safeValueForKey:@"view"];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v25[3] = &unk_265119F78;
  objc_copyWeak(&v26, &location);
  [v3 _setAccessibilityViewIsModalBlock:v25];

  v4 = [(InCallControlsViewControllerAccessibility *)self safeValueForKey:@"accessibilityHotdog"];
  [v4 setIsAccessibilityElement:1];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  uint64_t v5 = accessibilityLocalizedString(@"controls.grabber");
  [v4 setAccessibilityLabel:v5];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v23[3] = &unk_265119FC8;
  objc_copyWeak(&v24, &location);
  [v4 _setAccessibilityValueBlock:v23];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v21[3] = &unk_265119FC8;
  objc_copyWeak(&v22, &location);
  [v4 _setAccessibilityHintBlock:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v19[3] = &unk_265119F78;
  objc_copyWeak(&v20, &location);
  [v4 _setAccessibilityActivateBlock:v19];
  v6 = [(InCallControlsViewControllerAccessibility *)self safeValueForKey:@"accessibilityJoinLeaveButton"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v17[3] = &unk_265119FC8;
  objc_copyWeak(&v18, &location);
  [v6 _setAccessibilityLabelBlock:v17];

  v7 = [(InCallControlsViewControllerAccessibility *)self safeValueForKey:@"accessibilityCameraButton"];
  objc_initWeak(&from, v7);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v13[3] = &unk_26511A018;
  objc_copyWeak(&v14, &from);
  objc_copyWeak(&v15, &location);
  [v7 _setAccessibilityLabelBlock:v13];
  v8 = [(InCallControlsViewControllerAccessibility *)self safeValueForKey:@"accessibilityDisableVideoButton"];
  objc_initWeak(&v12, v8);
  v9 = accessibilityLocalizedString(@"camera");
  [v8 setAccessibilityLabel:v9];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
  v10[3] = &unk_265119FC8;
  objc_copyWeak(&v11, &v12);
  [v8 _setAccessibilityValueBlock:v10];
  [v8 _setAccessibilityTraitsBlock:&__block_literal_global_3];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

uint64_t __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"isExpanded"];

  return v2;
}

id __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"isExpanded"]) {
    uint64_t v2 = @"grabber.expanded";
  }
  else {
    uint64_t v2 = @"grabber.minimized";
  }
  char v3 = accessibilityLocalizedString(v2);

  return v3;
}

id __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"isExpanded"]) {
    uint64_t v2 = @"controls.grabber.hide.hint";
  }
  else {
    uint64_t v2 = @"controls.grabber.expand.hint";
  }
  char v3 = accessibilityLocalizedString(v2);

  return v3;
}

uint64_t __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained safeSwiftValueForKey:@"delegate"];

  id v4 = objc_loadWeakRetained(v1);
  LODWORD(WeakRetained) = [v4 safeBoolForKey:@"isExpanded"];

  if (WeakRetained)
  {
    uint64_t v5 = [v3 accessibilityPerformEscape];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v7 = v3;
    AXPerformSafeBlock();

    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityExpandControls];
}

id __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"shouldShowLeaveButton"]) {
    uint64_t v2 = @"join.call";
  }
  else {
    uint64_t v2 = @"leave.call";
  }
  char v3 = accessibilityLocalizedString(v2);

  return v3;
}

id __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained accessibilityTraits];
  uint64_t v4 = *MEMORY[0x263F1CF20] & v3;

  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v4)
  {
    id v7 = [v5 safeValueForKey:@"accessibilityCameraLabel"];
    v8 = [v7 accessibilityLabel];
  }
  else
  {
    if ([v5 _axDevicePosition] == 2) {
      v9 = @"camera.show.back";
    }
    else {
      v9 = @"camera.show.front";
    }
    v8 = accessibilityLocalizedString(v9);
  }

  return v8;
}

id __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"isSelected"]) {
    uint64_t v2 = @"off";
  }
  else {
    uint64_t v2 = @"on";
  }
  uint64_t v3 = accessibilityLocalizedString(v2);

  return v3;
}

uint64_t __87__InCallControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9()
{
  return *MEMORY[0x263F1CEE8];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)InCallControlsViewControllerAccessibility;
  [(InCallControlsViewControllerAccessibility *)&v3 viewDidLoad];
  [(InCallControlsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (int64_t)_axDevicePosition
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __62__InCallControlsViewControllerAccessibility__axDevicePosition__block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x263F7E1A0] sharedInstance];
  int64_t v2 = [v4 videoDeviceController];
  objc_super v3 = [v2 currentInputDevice];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 position];
}

@end