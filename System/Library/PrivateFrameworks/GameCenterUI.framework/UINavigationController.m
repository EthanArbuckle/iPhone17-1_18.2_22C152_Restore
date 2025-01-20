@interface UINavigationController
@end

@implementation UINavigationController

void __72__UINavigationController_GameControllerSupport__pressesEnded_withEvent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if ([a2 type] == 5)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v5 = (id)GKOSLoggers();
    }
    v6 = *MEMORY[0x1E4F63880];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AF250000, v6, OS_LOG_TYPE_INFO, "GameController: UIPressTypeMenu is pressed -> return to previous screen", v8, 2u);
    }
    v7 = [*(id *)(a1 + 32) _gkExtensionViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 logOnceGameControllerUsedInGameLayer];
    }
    [*(id *)(a1 + 32) returnToPreviousScreen];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __85__UINavigationController_GameControllerSupport__logOnceGameControllerUsedInGameLayer__block_invoke()
{
  id v4 = [MEMORY[0x1E4F637F8] reporter];
  uint64_t v0 = *MEMORY[0x1E4F63520];
  uint64_t v1 = *MEMORY[0x1E4F63588];
  v2 = [MEMORY[0x1E4F636F0] currentGame];
  v3 = [v2 bundleIdentifier];
  [v4 reportEvent:v0 type:v1 bundleID:v3];
}

@end