@interface LKStartupSupport
+ (BOOL)inUserSessionLoginUI;
+ (void)postStartupActions;
+ (void)postStartupTransitionActions;
@end

@implementation LKStartupSupport

+ (BOOL)inUserSessionLoginUI
{
  v2 = [MEMORY[0x263F841B0] sharedManager];
  if ([v2 isLoginSession])
  {
    v3 = [MEMORY[0x263F841B0] sharedManager];
    v4 = [v3 currentUser];
    int v5 = [v4 isLoginUser] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (void)postStartupActions
{
  v2 = [MEMORY[0x263F841B0] sharedManager];
  int v3 = [v2 isMultiUser];

  if (v3 && _vproc_set_global_on_demand())
  {
    v4 = LKLogDefault;
    if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_2221A9000, v4, OS_LOG_TYPE_DEFAULT, "_vproc_set_global_on_demand failed", v5, 2u);
    }
  }
}

+ (void)postStartupTransitionActions
{
  v2 = [MEMORY[0x263F841B0] sharedManager];
  int v3 = [v2 isMultiUser];

  if (v3)
  {
    LKRegisterLoginKitLogging();
    v4 = [MEMORY[0x263F841B0] sharedManager];
    int v5 = [v4 isLoginSession];

    if (v5)
    {
      kdebug_trace();
      v6 = LKLogDefault;
      uint64_t v7 = 0;
      if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2221A9000, v6, OS_LOG_TYPE_DEFAULT, "LoginKit: Logout ended.", buf, 2u);
        uint64_t v7 = 0;
      }
    }
    else
    {
      kdebug_trace();
      v8 = LKLogDefault;
      if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2221A9000, v8, OS_LOG_TYPE_DEFAULT, "LoginKit: Login ended.", buf, 2u);
      }
      LKAnalyticsSendLoginEvent();
      uint64_t v7 = 1;
    }
    v9 = +[LKLoginController sharedController];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__LKStartupSupport_postStartupTransitionActions__block_invoke;
    v10[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v10[4] = v7;
    [v9 checkInWithCurrentEnvironment:v7 completionHandler:v10];
  }
}

void __48__LKStartupSupport_postStartupTransitionActions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LKLogDefault;
  BOOL v5 = os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      id v9 = v3;
      v6 = "Error checking in with logind: %@";
LABEL_6:
      _os_log_impl(&dword_2221A9000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    int v8 = 134217984;
    id v9 = v7;
    v6 = "Successfully checked in with current environment: %lu";
    goto LABEL_6;
  }
}

@end