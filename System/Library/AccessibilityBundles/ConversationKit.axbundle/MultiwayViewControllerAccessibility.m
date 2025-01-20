@interface MultiwayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axGetDidExpandControls;
- (BOOL)accessibilityPerformEscape;
- (BOOL)axShouldDisableAutoHidingControls;
- (id)_axParticipantShutters;
- (int64_t)_axGetExpectedExpandedState;
- (void)_accessibilityExpandControls;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetDidExpandControls:(BOOL)a3;
- (void)_axSetExpectedExpandedState:(int64_t)a3;
- (void)setControlsState:(int64_t)a3 animated:(BOOL)a4;
- (void)setDeviceOrientation:(int64_t)a3;
@end

@implementation MultiwayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.MultiwayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ConversationKit.MultiwayViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"ConversationKit.MultiwayViewController" hasProperty:@"isShowingReactions" withType:"B"];
  [v3 validateClass:@"ConversationKit.MultiwayViewController" hasProperty:@"localParticipantView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"setControlsState:animated:", "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"axShouldDisableAutoHidingControls", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"accessibilityConstraintController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"isPipped", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNKFaceTimeConstraintsController", @"inCallControlsState", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"isOnScreen", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"isDisplayedInBanner", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"setDeviceOrientation:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"call", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  [(MultiwayViewControllerAccessibility *)self _axSetDidExpandControls:0];
  if ([(MultiwayViewControllerAccessibility *)self safeBoolForKey:@"isShowingReactions"])
  {
    id v3 = [(MultiwayViewControllerAccessibility *)self safeValueForKey:@"localParticipantView"];
    char v4 = [v3 accessibilityActivate];

    return v4;
  }
  else
  {
    v6 = [(MultiwayViewControllerAccessibility *)self safeValueForKey:@"accessibilityConstraintController"];
    uint64_t v7 = [v6 safeIntegerForKey:@"inCallControlsState"];

    uint64_t v8 = 0;
    BOOL result = 0;
    switch(v7)
    {
      case 0:
        return result;
      case 1:
      case 2:
      case 3:
        goto LABEL_6;
      case 4:
        uint64_t v8 = 1;
        goto LABEL_6;
      case 5:
        uint64_t v8 = 2;
LABEL_6:
        [(MultiwayViewControllerAccessibility *)self setControlsState:v8 animated:1];
        break;
      default:
        return 1;
    }
    return 1;
  }
}

- (BOOL)_axGetDidExpandControls
{
  return MEMORY[0x270F0A438](self, &__MultiwayViewControllerAccessibility___axGetDidExpandControls);
}

- (void)_axSetDidExpandControls:(BOOL)a3
{
}

- (int64_t)_axGetExpectedExpandedState
{
  return MEMORY[0x270F0A458](self, &__MultiwayViewControllerAccessibility___axGetExpectedExpandedState);
}

- (void)_axSetExpectedExpandedState:(int64_t)a3
{
}

- (void)_accessibilityExpandControls
{
  [(MultiwayViewControllerAccessibility *)self _axSetDidExpandControls:1];
  id v3 = [(MultiwayViewControllerAccessibility *)self safeValueForKey:@"accessibilityConstraintController"];
  uint64_t v4 = [v3 safeIntegerForKey:@"inCallControlsState"];

  uint64_t v5 = 4;
  if (v4 == 3) {
    uint64_t v5 = 6;
  }
  if (v4 == 2) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = v5;
  }
  [(MultiwayViewControllerAccessibility *)self _axSetExpectedExpandedState:v6];
  [(MultiwayViewControllerAccessibility *)self setControlsState:v6 animated:1];
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __67__MultiwayViewControllerAccessibility__accessibilityExpandControls__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axSetDidExpandControls:0];
}

- (void)setControlsState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(MultiwayViewControllerAccessibility *)self _axGetDidExpandControls]
    && [(MultiwayViewControllerAccessibility *)self _axGetExpectedExpandedState] != a3)
  {
    [(MultiwayViewControllerAccessibility *)self _axSetDidExpandControls:0];
  }
  else
  {
    uint64_t v7 = [(MultiwayViewControllerAccessibility *)self safeValueForKey:@"accessibilityConstraintController"];
    uint64_t v8 = [v7 safeIntegerForKey:@"inCallControlsState"];

    v12.receiver = self;
    v12.super_class = (Class)MultiwayViewControllerAccessibility;
    [(MultiwayViewControllerAccessibility *)&v12 setControlsState:a3 animated:v4];
    BOOL v10 = a3 != 4 && v8 != 4;
    if (v8 == a3 || v10) {
      v11 = (UIAccessibilityNotifications *)MEMORY[0x263F1CE18];
    }
    else {
      v11 = (UIAccessibilityNotifications *)MEMORY[0x263F1CE68];
    }
    UIAccessibilityPostNotification(*v11, 0);
  }
}

- (BOOL)axShouldDisableAutoHidingControls
{
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning()) {
    return 1;
  }

  return MEMORY[0x270F062D8]();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)MultiwayViewControllerAccessibility;
  [(MultiwayViewControllerAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  [(MultiwayViewControllerAccessibility *)self _axParticipantShutters];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = accessibilityLocalizedString(@"take.live.photo");
        [v7 setAccessibilityLabel:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v4);
  }

  v9 = [(MultiwayViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__MultiwayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_265119F78;
  objc_copyWeak(&v11, &location);
  [v9 _setAccessibilityElementsHiddenBlock:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __81__MultiwayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeSwiftBoolForKey:@"isInVideoMessageFlow"])
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = objc_loadWeakRetained(v1);
    if ([v4 safeBoolForKey:@"isPipped"])
    {
      uint64_t v3 = 1;
    }
    else
    {
      id v5 = objc_loadWeakRetained(v1);
      if ([v5 safeBoolForKey:@"isOnScreen"])
      {
        uint64_t v3 = 0;
      }
      else
      {
        id v6 = objc_loadWeakRetained(v1);
        uint64_t v3 = [v6 safeBoolForKey:@"isDisplayedInBanner"] ^ 1;
      }
    }
  }
  return v3;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MultiwayViewControllerAccessibility;
  -[MultiwayViewControllerAccessibility setDeviceOrientation:](&v14, sel_setDeviceOrientation_);
  if ((AXDeviceIsPad() & 1) == 0)
  {
    objc_opt_class();
    id v5 = [(MultiwayViewControllerAccessibility *)self safeValueForKey:@"call"];
    id v6 = __UIAccessibilityCastAsClass();

    if ([v6 service] == 3)
    {
      switch(a3)
      {
        case 0:
          char v7 = 0;
          uint64_t v8 = @"rotate.landscape";
          uint64_t v9 = 3;
          break;
        case 1:
          char v7 = 0;
          uint64_t v8 = @"rotate.portrait";
          uint64_t v9 = 1;
          break;
        case 2:
          char v7 = 0;
          uint64_t v8 = @"rotate.landscape";
          uint64_t v9 = 4;
          break;
        case 3:
          char v7 = 0;
          uint64_t v8 = @"rotate.portrait.upsidedown";
          uint64_t v9 = 2;
          break;
        default:
          uint64_t v8 = 0;
          uint64_t v9 = 1;
          char v7 = 1;
          break;
      }
      BOOL v10 = [MEMORY[0x263F1C408] sharedApplication];
      if ([v10 _accessibilityApplicationOrientation] != v9)
      {
        [v10 _accessibilitySetApplicationOrientation:v9];
        int v11 = [(MultiwayViewControllerAccessibility *)self safeBoolForKey:@"isOnScreen"];
        char v12 = [(MultiwayViewControllerAccessibility *)self safeBoolForKey:@"isPipped"];
        if (v11)
        {
          if ((v12 & 1) == 0)
          {
            if ((v7 & 1) == 0)
            {
              long long v13 = accessibilityLocalizedString(v8);
              UIAccessibilitySpeakAndDoNotBeInterrupted();
            }
            UIAccessibilityPostNotification(0x3E8u, 0);
          }
        }
      }
    }
  }
}

- (id)_axParticipantShutters
{
  v2 = [(MultiwayViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  uint64_t v3 = [v2 _accessibilityFindUnsortedSubviewDescendantsPassingTest:&__block_literal_global_4];

  return v3;
}

uint64_t __61__MultiwayViewControllerAccessibility__axParticipantShutters__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 accessibilityIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"participant-shutter"];

  return v3;
}

@end