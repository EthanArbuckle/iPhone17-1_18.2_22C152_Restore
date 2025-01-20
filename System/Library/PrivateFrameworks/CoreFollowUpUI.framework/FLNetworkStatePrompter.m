@interface FLNetworkStatePrompter
- (FLNetworkStatePrompter)initWithPresenter:(id)a3;
- (id)_cancelActionWithCompletionHandler:(id)a3;
- (id)_disableAirplaneActionWithCompletionHandler:(id)a3;
- (void)_mainQueue_promptToDisableAirplaneModeWithCompletionHandler:(id)a3;
- (void)_mainQueue_verificationFailedAlert;
- (void)dealloc;
- (void)preflightNetworkStateWithCompletionHandler:(id)a3;
@end

@implementation FLNetworkStatePrompter

- (FLNetworkStatePrompter)initWithPresenter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FLNetworkStatePrompter;
  v6 = [(FLNetworkStatePrompter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_presenter, a3);
  }

  return v7;
}

- (void)preflightNetworkStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DA3000, v5, OS_LOG_TYPE_DEFAULT, "Starting to preflight network state...", buf, 2u);
  }

  v6 = dispatch_get_global_queue(33, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke;
  v8[3] = &unk_2645F23F8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = +[FLNetworkObserver sharedNetworkObserver];
  int v3 = [v2 isNetworkReachable];

  if (v3)
  {
    id v4 = _FLLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221DA3000, v4, OS_LOG_TYPE_DEFAULT, "Network is reachable, moving on...", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke_1;
    block[3] = &unk_2645F23A8;
    id v14 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
    id v5 = v14;
  }
  else
  {
    v6 = +[FLNetworkObserver sharedNetworkObserver];
    int v7 = [v6 isAirplaneModeActiveWithoutWiFi];

    v8 = _FLLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = v7;
      _os_log_impl(&dword_221DA3000, v8, OS_LOG_TYPE_DEFAULT, "Network is unreachable and airplane mode state is: %d", buf, 8u);
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_2645F23D0;
    char v12 = v7;
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v10);
    id v5 = v11;
  }
}

uint64_t __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __69__FLNetworkStatePrompter_preflightNetworkStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  int v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    return objc_msgSend(v3, "_mainQueue_promptToDisableAirplaneModeWithCompletionHandler:", v4);
  }
  else
  {
    objc_msgSend(v3, "_mainQueue_verificationFailedAlert");
    v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v6();
  }
}

- (void)_mainQueue_promptToDisableAirplaneModeWithCompletionHandler:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DA3000, v5, OS_LOG_TYPE_DEFAULT, "Prompting to disable airplane mode...", buf, 2u);
  }

  v6 = [(FLNetworkStatePrompter *)self _disableAirplaneActionWithCompletionHandler:v4];
  v14[0] = v6;
  int v7 = [(FLNetworkStatePrompter *)self _cancelActionWithCompletionHandler:v4];

  v14[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  int v9 = MGGetBoolAnswer();
  v10 = @"WIFI";
  if (v9) {
    v10 = @"WLAN";
  }
  id v11 = [NSString stringWithFormat:@"AIRPLANE_MODE_DISABLE_TITLE_%@", v10];
  char v12 = FLLoc();

  +[FLAlertControllerHelper presentAlertWithTitle:v12 message:0 actions:v8 presentingController:self->_presenter];
}

- (id)_disableAirplaneActionWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = FLLoc();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke;
  v8[3] = &unk_2645F2470;
  id v9 = v3;
  id v5 = v3;
  v6 = +[FLAlertControllerAction actionWithTitle:v4 style:0 handler:v8];

  return v6;
}

void __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221DA3000, v4, OS_LOG_TYPE_DEFAULT, "Disable airplane mode action initiated...", buf, 2u);
  }

  *(void *)buf = 0;
  int v16 = buf;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  id v5 = +[FLNetworkObserver sharedNetworkObserver];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke_20;
  char v12 = &unk_2645F2448;
  id v13 = *(id *)(a1 + 32);
  id v14 = buf;
  uint64_t v6 = [v5 addNetworkReachableBlock:&v9];
  int v7 = (void *)*((void *)v16 + 5);
  *((void *)v16 + 5) = v6;

  v8 = +[FLNetworkObserver sharedNetworkObserver];
  [v8 disableAirplaneMode];

  _Block_object_dispose(buf, 8);
}

void __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke_20(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v11 = a2;
    _os_log_impl(&dword_221DA3000, v4, OS_LOG_TYPE_DEFAULT, "Finished disabling with result... %d", buf, 8u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke_21;
  v7[3] = &unk_2645F2420;
  id v8 = *(id *)(a1 + 32);
  char v9 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

uint64_t __70__FLNetworkStatePrompter__disableAirplaneActionWithCompletionHandler___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (id)_cancelActionWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = FLLoc();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__FLNetworkStatePrompter__cancelActionWithCompletionHandler___block_invoke;
  v8[3] = &unk_2645F2470;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = +[FLAlertControllerAction actionWithTitle:v4 style:1 handler:v8];

  return v6;
}

void __61__FLNetworkStatePrompter__cancelActionWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2 = _FLLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_221DA3000, v2, OS_LOG_TYPE_DEFAULT, "Dismiss action initiated, bailing...", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = FLError();
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

- (void)_mainQueue_verificationFailedAlert
{
  v10[1] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_221DA3000, v3, OS_LOG_TYPE_DEFAULT, "Showing verification failed...", v9, 2u);
  }

  id v4 = FLLoc();
  id v5 = +[FLAlertControllerAction actionWithTitle:v4 style:1 handler:0];
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];

  int v7 = FLLoc();
  id v8 = FLLoc();
  +[FLAlertControllerHelper presentAlertWithTitle:v7 message:v8 actions:v6 presentingController:self->_presenter];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_221DA3000, v3, OS_LOG_TYPE_DEFAULT, "<%@> : checking out...", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)FLNetworkStatePrompter;
  [(FLNetworkStatePrompter *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end