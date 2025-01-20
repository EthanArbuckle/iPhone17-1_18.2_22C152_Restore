@interface WFReturnToHomeScreenAction
- (id)iconName;
- (id)returnToHomeScreenError;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFReturnToHomeScreenAction

- (id)returnToHomeScreenError
{
  v14[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  v13[0] = *MEMORY[0x263F08338];
  v3 = WFLocalizedString(@"Could not go to Home Screen");
  v14[0] = v3;
  v13[1] = *MEMORY[0x263F08320];
  v4 = [MEMORY[0x263F85258] currentDevice];
  uint64_t v5 = [v4 idiom];

  switch(v5)
  {
    case 0:
      v6 = @"DEVICE_LOCKED_ERROR_PHONE";
      v7 = @"Please make sure your iPhone is unlocked.";
      goto LABEL_8;
    case 1:
      v6 = @"DEVICE_LOCKED_ERROR_PAD";
      v7 = @"Please make sure your iPad is unlocked.";
      goto LABEL_8;
    case 2:
      v6 = @"DEVICE_LOCKED_ERROR_MAC";
      v7 = @"Please make sure your Mac is unlocked.";
      goto LABEL_8;
    case 3:
      v6 = @"DEVICE_LOCKED_ERROR_WATCH";
      v7 = @"Please make sure your Apple Watch is unlocked.";
      goto LABEL_8;
    case 4:
      v6 = @"DEVICE_LOCKED_ERROR_POD";
      v7 = @"Please make sure your iPod is unlocked.";
      goto LABEL_8;
    case 5:
      uint64_t v8 = WFLocalizedString(@"There was an error presenting the Home View.");
      goto LABEL_9;
    default:
      v6 = @"DEVICE_LOCKED_ERROR_UNSPECIFIED";
      v7 = @"Please make sure your device is unlocked.";
LABEL_8:
      uint64_t v8 = WFLocalizedStringWithKey(v6, v7);
LABEL_9:
      v9 = (void *)v8;
      v14[1] = v8;
      v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
      v11 = [v2 errorWithDomain:@"WFReturnToHomeScreenActionErrorDomain" code:0 userInfo:v10];

      return v11;
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = [(WFReturnToHomeScreenAction *)self userInterface];
  if ([v4 isRunningWithSiriUI])
  {
    uint64_t v5 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
    [(WFReturnToHomeScreenAction *)self finishRunningWithError:v5];
  }
  else
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F33710]) initWithBundleIdentifier:@"com.apple.springboard" options:0 URL:0 userActivity:0];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke;
    v8[3] = &unk_264E5C218;
    v8[4] = self;
    id v9 = v6;
    id v7 = v6;
    [v7 performWithCompletionHandler:v8];
  }
}

void __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v3 = *(void **)(a1 + 32);
    id v5 = [v3 returnToHomeScreenError];
    [v3 finishRunningWithError:v5];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke_2;
    v6[3] = &unk_264E5BF28;
    v4 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    [v4 observeForAppLaunchWithTimeout:v6 completionHandler:3.0];
  }
}

void __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke_3;
  v8[3] = &unk_264E5DED8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v6;
  id v7 = v4;
  dispatch_after(v5, MEMORY[0x263EF83A0], v8);
}

void __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    id v3 = [*(id *)(a1 + 40) returnToHomeScreenError];
    [v1 finishRunningWithError:v3];
  }
  else
  {
    v2 = *(void **)(a1 + 40);
    [v2 finishRunningWithError:0];
  }
}

- (id)iconName
{
  return @"HomeScreen";
}

@end