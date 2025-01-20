@interface PHAudioCallViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityDidAnnounceIncomingCall;
- (BOOL)_accessibilityHasSubscribedForBottomBarNotifications;
- (BOOL)_accessibilityWantsToShowKeypad;
- (int64_t)_accessibilityMiddleViewStateDepth;
- (void)_accessibilityAnnounceIncomingCall;
- (void)_accessibilityBottomBarStoppedAnimating:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetDidAnnounceIncomingCall:(BOOL)a3;
- (void)_accessibilitySetHasSubscribedToBottomBarNotifications:(BOOL)a3;
- (void)_accessibilitySetMiddleViewStateDepth:(int64_t)a3;
- (void)_accessibilitySetWantsToShowKeypad:(BOOL)a3;
- (void)_accessibilitySubscribeForBottomBarNotificationsIfNecessary;
- (void)_axSetPhoneToMiddleState:(unsigned __int16)a3 totalTimeTried:(double)a4;
- (void)dealloc;
- (void)setCurrentState:(unsigned __int16)a3 animated:(BOOL)a4;
- (void)setMiddleViewState:(unsigned __int16)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PHAudioCallViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHAudioCallViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilityMiddleViewStateDepth
{
  return MEMORY[0x270F0A458](self, &__PHAudioCallViewController___accessibilityMiddleViewStateDepth);
}

- (void)_accessibilitySetMiddleViewStateDepth:(int64_t)a3
{
}

- (BOOL)_accessibilityWantsToShowKeypad
{
  return MEMORY[0x270F0A438](self, &__PHAudioCallViewController___accessibilityWantsToShowKeypad);
}

- (void)_accessibilitySetWantsToShowKeypad:(BOOL)a3
{
}

- (BOOL)_accessibilityHasSubscribedForBottomBarNotifications
{
  return MEMORY[0x270F0A438](self, &__PHAudioCallViewController___accessibilityHasSubscribedForBottomBarNotifications);
}

- (void)_accessibilitySetHasSubscribedToBottomBarNotifications:(BOOL)a3
{
}

- (BOOL)_accessibilityDidAnnounceIncomingCall
{
  return MEMORY[0x270F0A438](self, &__PHAudioCallViewController___accessibilityDidAnnounceIncomingCall);
}

- (void)_accessibilitySetDidAnnounceIncomingCall:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PHAudioCallViewController" isKindOfClass:@"PHCallViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCallViewController", @"bottomBar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioCallViewController", @"viewDidAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioCallViewController", @"setMiddleViewState:", "v", "S", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioCallViewController", @"setCurrentState: animated:", "v", "S", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHCallViewController", @"currentState", "S", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioCallViewController", @"middleViewState", "S", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBottomBar", @"slidingButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBottomBar", @"mainRightButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHBottomBar", @"animating", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioCallViewController", @"callForBackgroundImage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUCall", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioCallViewController", @"setMiddleViewState: animated: completion:", "v", "S", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAudioCallViewController", @"callParticipantsViewController", "@", 0);
}

- (void)_accessibilitySubscribeForBottomBarNotificationsIfNecessary
{
  if (![(PHAudioCallViewControllerAccessibility *)self _accessibilityHasSubscribedForBottomBarNotifications])
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__accessibilityBottomBarStoppedAnimating_ name:@"AXPHBottomBarStoppedAnimatingNotification" object:0];

    [(PHAudioCallViewControllerAccessibility *)self _accessibilitySetHasSubscribedToBottomBarNotifications:1];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"AXPHBottomBarStoppedAnimatingNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallViewControllerAccessibility;
  [(PHAudioCallViewControllerAccessibility *)&v4 dealloc];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallViewControllerAccessibility;
  [(PHAudioCallViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  [(PHAudioCallViewControllerAccessibility *)self _accessibilitySubscribeForBottomBarNotificationsIfNecessary];
  id v3 = [(PHAudioCallViewControllerAccessibility *)self safeValueForKey:@"view"];
  [v3 setAccessibilityIgnoresInvertColors:1];

  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __84__PHAudioCallViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityAnnounceIncomingCall];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallViewControllerAccessibility;
  [(PHAudioCallViewControllerAccessibility *)&v4 viewDidAppear:a3];
  [(PHAudioCallViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  [(PHAudioCallViewControllerAccessibility *)self _accessibilityAnnounceIncomingCall];
}

- (void)_accessibilityAnnounceIncomingCall
{
  v24[2] = *MEMORY[0x263EF8340];
  if (![(PHAudioCallViewControllerAccessibility *)self _accessibilityDidAnnounceIncomingCall])
  {
    [(PHAudioCallViewControllerAccessibility *)self _accessibilitySetDidAnnounceIncomingCall:1];
    if (UIAccessibilityIsVoiceOverRunning())
    {
      id v3 = [(PHAudioCallViewControllerAccessibility *)self safeValueForKey:@"bottomBar"];
      objc_super v4 = [v3 safeValueForKey:@"slidingButton"];
      uint64_t v5 = [v3 safeValueForKey:@"mainRightButton"];
      v6 = (void *)v5;
      if (v4) {
        v7 = v4;
      }
      else {
        v7 = (void *)v5;
      }
      id v8 = v7;
      v9 = [(PHAudioCallViewControllerAccessibility *)self safeValueForKey:@"callParticipantsViewController"];
      v10 = [v9 safeValueForKey:@"view"];
      v11 = __UIAccessibilitySafeClass();

      v12 = axStringForCallParticipantsView(v11);
      v13 = [MEMORY[0x263F7E1A0] sharedInstance];
      v14 = [v13 incomingCall];

      if (v14 && v12)
      {
        v15 = NSString;
        v16 = accessibilityLocalizedString(@"incoming.call");
        v17 = objc_msgSend(v15, "stringWithFormat:", v16, v12);

        id v18 = objc_allocWithZone(MEMORY[0x263F086A0]);
        uint64_t v19 = *MEMORY[0x263F216D8];
        v23[0] = *MEMORY[0x263F218C8];
        v23[1] = v19;
        v24[0] = MEMORY[0x263EFFA88];
        v24[1] = &unk_26F6D77C0;
        v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
        v21 = (void *)[v18 initWithString:v17 attributes:v20];

        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v21);
      }
      if ([v8 _accessibilityViewIsVisible])
      {
        id v22 = v8;
        AXPerformBlockOnMainThreadAfterDelay();
      }
    }
  }
}

uint64_t __76__PHAudioCallViewControllerAccessibility__accessibilityAnnounceIncomingCall__block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x263F812F8], *(id *)(a1 + 32));
  uint64_t v1 = *MEMORY[0x263F1CE18];

  return MEMORY[0x270F09940](v1);
}

- (void)_axSetPhoneToMiddleState:(unsigned __int16)a3 totalTimeTried:(double)a4
{
  int v5 = a3;
  [(PHAudioCallViewControllerAccessibility *)self _accessibilitySetWantsToShowKeypad:0];
  v6 = [MEMORY[0x263F7E1A0] sharedInstance];
  v7 = [v6 currentCalls];
  id v8 = [v7 firstObject];

  if (v5 == 4
    && a4 <= 4.0
    && UIAccessibilityIsVoiceOverRunning()
    && [v8 service] == 1
    && ([v8 isTTY] & 1) == 0
    && ([v8 isRTT] & 1) == 0)
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __82__PHAudioCallViewControllerAccessibility__axSetPhoneToMiddleState_totalTimeTried___block_invoke(uint64_t a1)
{
  uint64_t v7 = *(void *)(a1 + 40);
  LOBYTE(v6) = 1;
  _AXLogWithFacility();
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", @"bottomBar", v6, @"Setting middle state to keyboard: %f", v7);
  char v3 = [v2 safeBoolForKey:@"animating"];
  if ([*(id *)(a1 + 32) _accessibilityMiddleViewStateDepth] > 0) {
    char v4 = 1;
  }
  else {
    char v4 = v3;
  }
  int v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [*(id *)(a1 + 32) _accessibilitySetWantsToShowKeypad:1];
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __82__PHAudioCallViewControllerAccessibility__axSetPhoneToMiddleState_totalTimeTried___block_invoke_2;
    v8[3] = &unk_265129FE8;
    objc_copyWeak(v9, &location);
    v9[1] = *(id *)(a1 + 40);
    [v5 setMiddleViewState:2 animated:1 completion:v8];
    objc_destroyWeak(v9);
  }

  objc_destroyWeak(&location);
}

void __82__PHAudioCallViewControllerAccessibility__axSetPhoneToMiddleState_totalTimeTried___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = [WeakRetained safeIntForKey:@"middleViewState"];

  if (v4 != 2)
  {
    id v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "_axSetPhoneToMiddleState:totalTimeTried:", (unsigned __int16)objc_msgSend(v5, "safeIntForKey:", @"currentState"), *(double *)(a1 + 40) + 0.5);
  }
}

- (void)setCurrentState:(unsigned __int16)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  unsigned __int16 v7 = [(PHAudioCallViewControllerAccessibility *)self safeIntForKey:@"currentState"];
  v8.receiver = self;
  v8.super_class = (Class)PHAudioCallViewControllerAccessibility;
  [(PHAudioCallViewControllerAccessibility *)&v8 setCurrentState:v5 animated:v4];
  if (v5 != v7)
  {
    [(PHAudioCallViewControllerAccessibility *)self _axSetPhoneToMiddleState:v5 totalTimeTried:0.0];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

- (void)_accessibilityBottomBarStoppedAnimating:(id)a3
{
  if ([(PHAudioCallViewControllerAccessibility *)self _accessibilityWantsToShowKeypad])
  {
    uint64_t v4 = (unsigned __int16)[(PHAudioCallViewControllerAccessibility *)self safeIntForKey:@"currentState"];
    [(PHAudioCallViewControllerAccessibility *)self _axSetPhoneToMiddleState:v4 totalTimeTried:0.0];
  }
}

- (void)setMiddleViewState:(unsigned __int16)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  int64_t v9 = [(PHAudioCallViewControllerAccessibility *)self _accessibilityMiddleViewStateDepth];
  int v10 = [(PHAudioCallViewControllerAccessibility *)self safeIntForKey:@"middleViewState"];
  BOOL v11 = v10 == v6;
  if (v10 != v6) {
    [(PHAudioCallViewControllerAccessibility *)self _accessibilitySetMiddleViewStateDepth:v9 + 1];
  }
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__PHAudioCallViewControllerAccessibility_setMiddleViewState_animated_completion___block_invoke;
  v14[3] = &unk_26512A038;
  id v12 = v8;
  id v15 = v12;
  objc_copyWeak(&v16, &location);
  BOOL v17 = v11;
  v14[4] = self;
  v13.receiver = self;
  v13.super_class = (Class)PHAudioCallViewControllerAccessibility;
  [(PHAudioCallViewControllerAccessibility *)&v13 setMiddleViewState:v6 animated:v5 completion:v14];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __81__PHAudioCallViewControllerAccessibility_setMiddleViewState_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained _accessibilityMiddleViewStateDepth];
  uint64_t v4 = v3 - 1;
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 < 1;
  }
  if (!v5) {
    [WeakRetained _accessibilitySetMiddleViewStateDepth:v4];
  }
  if (!v4 && [*(id *)(a1 + 32) _accessibilityWantsToShowKeypad])
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_axSetPhoneToMiddleState:totalTimeTried:", (unsigned __int16)objc_msgSend(v6, "safeIntForKey:", @"currentState"), 0.0);
  }
}

@end