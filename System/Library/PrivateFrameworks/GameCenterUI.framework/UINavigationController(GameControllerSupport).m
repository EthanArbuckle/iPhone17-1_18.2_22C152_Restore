@interface UINavigationController(GameControllerSupport)
- (void)logOnceGameControllerUsedInGameLayer;
- (void)pressesEnded:()GameControllerSupport withEvent:;
- (void)returnToPreviousScreen;
@end

@implementation UINavigationController(GameControllerSupport)

- (void)pressesEnded:()GameControllerSupport withEvent:
{
  id v6 = a3;
  id v7 = a4;
  [a1 logOnceGameControllerUsedInGameLayer];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__UINavigationController_GameControllerSupport__pressesEnded_withEvent___block_invoke;
  v9[3] = &unk_1E5F66FF8;
  v9[4] = a1;
  v9[5] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  if (!*((unsigned char *)v11 + 24))
  {
    v8.receiver = a1;
    v8.super_class = (Class)UINavigationController_0;
    objc_msgSendSuper2(&v8, sel_pressesEnded_withEvent_, v6, v7);
  }
  _Block_object_dispose(&v10, 8);
}

- (void)logOnceGameControllerUsedInGameLayer
{
  if (logOnceGameControllerUsedInGameLayer_onceToken_252 != -1) {
    dispatch_once(&logOnceGameControllerUsedInGameLayer_onceToken_252, &__block_literal_global_254);
  }
}

- (void)returnToPreviousScreen
{
  v2 = [a1 popViewControllerAnimated:1];
  if (v2)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v3 = (id)GKOSLoggers();
    }
    v4 = *MEMORY[0x1E4F63880];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF250000, v4, OS_LOG_TYPE_INFO, "GameController: Popped to previous screen", buf, 2u);
    }
  }
  else
  {
    v5 = [a1 presentingViewController];
    id v6 = v5;
    if (v5)
    {
      [v5 dismissViewControllerAnimated:1 completion:0];
      if (!*MEMORY[0x1E4F63860]) {
        id v7 = (id)GKOSLoggers();
      }
      objc_super v8 = *MEMORY[0x1E4F63880];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1AF250000, v8, OS_LOG_TYPE_INFO, "GameController: Dismissed the modal to previous screen", v12, 2u);
      }
    }
    else
    {
      v9 = [a1 _gkExtensionViewController];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        v11 = [a1 _gkExtensionViewController];
        [v11 dismissWithGameController];
      }
    }
  }
}

@end