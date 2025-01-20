@interface AXSB
@end

@implementation AXSB

double __85__AXSB_UIAlertControllerSafeCategory__applyAccessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  double v3 = v2;

  return v3;
}

void __71__AXSB_SBRestartManagerSafeCategory_initializeAndRunStartupTransition___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
    id v5 = v7;
  }
  [v5 addTransactionDidCompleteBlock:&__block_literal_global_2808];
}

uint64_t __71__AXSB_SBRestartManagerSafeCategory_initializeAndRunStartupTransition___block_invoke_2()
{
  return [(id)*MEMORY[0x263F83300] _performBlockAfterCATransactionCommits:&__block_literal_global_2810];
}

uint64_t __71__AXSB_SBRestartManagerSafeCategory_initializeAndRunStartupTransition___block_invoke_3()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __71__AXSB_SBRestartManagerSafeCategory_initializeAndRunStartupTransition___block_invoke_4()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v1 = (const __CFString *)*MEMORY[0x263F22740];
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v1, 0, 0, 1u);
}

uint64_t __73__AXSB_SBAssistantControllerSafeCategory__axDismissSiriForAssistiveTouch__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _axSetSiriDismissalIsForAssistiveTouch:1];
  double v2 = *(void **)(a1 + 32);
  double v3 = [v2 _axSiriDismissalOptions];
  v4 = [*(id *)(a1 + 32) view];
  id v5 = [v4 window];
  uint64_t v6 = [v5 windowScene];
  [v2 _dismissAssistantViewIfNecessaryWithAnimation:1 factory:0 dismissalOptions:v3 windowScene:v6 completion:0];

  id v7 = *(void **)(a1 + 32);
  return [v7 _axSetSiriDismissalIsForAssistiveTouch:0];
}

@end