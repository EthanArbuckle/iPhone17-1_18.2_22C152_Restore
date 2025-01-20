@interface LACDTORatchetManager
- (BOOL)isFeatureAvailable;
- (BOOL)isFeatureEnabled;
- (BOOL)isFeatureStrictModeEnabled;
- (BOOL)isFeatureSupported;
- (BOOL)isSensorTrusted;
- (LACDTORatchetManager)initWithContextProvider:(id)a3;
- (LACDTORatchetState)ratchetState;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (int64_t)_armPolicy;
- (void)_performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6;
- (void)addObserver:(id)a3;
- (void)cancelArmRequestWithIdentifier:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)checkCanEnableFeatureWithCompletion:(id)a3;
- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4;
- (void)disableFeatureWithContext:(id)a3 completion:(id)a4;
- (void)enableFeatureActivatingGracePeriodWithReply:(id)a3;
- (void)enableFeatureStrictModeWithCompletion:(id)a3;
- (void)enableFeatureWithReply:(id)a3;
- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4;
- (void)performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6;
- (void)removeObserver:(id)a3;
- (void)reset;
- (void)stateCompositeInContext:(id)a3 completion:(id)a4;
- (void)stateCompositeWithCompletion:(id)a3;
- (void)stateInContext:(id)a3 completion:(id)a4;
- (void)stateWithCompletion:(id)a3;
@end

@implementation LACDTORatchetManager

- (LACDTORatchetManager)initWithContextProvider:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)LACDTORatchetManager;
  v5 = [(LACDTORatchetManager *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    uint64_t v8 = +[LACDarwinNotificationCenter sharedInstance];
    notificationCenter = v5->_notificationCenter;
    v5->_notificationCenter = (LACDarwinNotificationCenter *)v8;

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __48__LACDTORatchetManager_initWithContextProvider___block_invoke;
    v13[3] = &unk_2653B57F0;
    id v14 = v4;
    uint64_t v10 = __48__LACDTORatchetManager_initWithContextProvider___block_invoke((uint64_t)v13);
    remoteObjectProxy = v5->_remoteObjectProxy;
    v5->_remoteObjectProxy = (LACDTOServiceXPCClient *)v10;
  }
  return v5;
}

LACDTOServiceXPCClient *__48__LACDTORatchetManager_initWithContextProvider___block_invoke(uint64_t a1)
{
  if (objc_opt_class())
  {
    v2 = [[LACDTORatchetEndpointProvider alloc] initWithContextProvider:*(void *)(a1 + 32)];
    v3 = [[LACDTOServiceXPCClient alloc] initWithEndpointProvider:v2];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isFeatureEnabled
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = LACLogDTOClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureEnabled]";
    _os_log_impl(&dword_254F14000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:&__block_literal_global_1];
  int v5 = [v4 isFeatureEnabled];

  uint64_t v6 = LACLogDTOClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5) {
      v7 = "YES";
    }
    int v9 = 136315138;
    uint64_t v10 = v7;
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled returned %s", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (BOOL)isFeatureSupported
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = LACLogDTOClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureSupported]";
    _os_log_impl(&dword_254F14000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:&__block_literal_global_8];
  int v5 = [v4 isFeatureSupported];

  uint64_t v6 = LACLogDTOClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5) {
      v7 = "YES";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureSupported]";
    __int16 v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)isFeatureAvailable
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = LACLogDTOClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureAvailable]";
    _os_log_impl(&dword_254F14000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:&__block_literal_global_10];
  int v5 = [v4 isFeatureAvailable];

  uint64_t v6 = LACLogDTOClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5) {
      v7 = "YES";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureAvailable]";
    __int16 v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)isFeatureStrictModeEnabled
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = LACLogDTOClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureStrictModeEnabled]";
    _os_log_impl(&dword_254F14000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:&__block_literal_global_12];
  int v5 = [v4 isFeatureStrictModeEnabled];

  uint64_t v6 = LACLogDTOClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5) {
      v7 = "YES";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[LACDTORatchetManager isFeatureStrictModeEnabled]";
    __int16 v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)isSensorTrusted
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = LACLogDTOClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[LACDTORatchetManager isSensorTrusted]";
    _os_log_impl(&dword_254F14000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:&__block_literal_global_14];
  int v5 = [v4 isSensorTrusted];

  uint64_t v6 = LACLogDTOClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5) {
      v7 = "YES";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[LACDTORatchetManager isSensorTrusted]";
    __int16 v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (LACDTORatchetState)ratchetState
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = LACLogDTOClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[LACDTORatchetManager ratchetState]";
    _os_log_impl(&dword_254F14000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:&__block_literal_global_16];
  int v5 = [v4 ratchetState];

  uint64_t v6 = LACLogDTOClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[LACDTORatchetManager ratchetState]";
    __int16 v10 = 2114;
    __int16 v11 = v5;
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %{public}@", (uint8_t *)&v8, 0x16u);
  }

  return (LACDTORatchetState *)v5;
}

- (void)stateWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = LACLogDTOClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v15 = "-[LACDTORatchetManager stateWithCompletion:]";
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__LACDTORatchetManager_stateWithCompletion___block_invoke;
  v12[3] = &unk_2653B5838;
  id v6 = v4;
  id v13 = v6;
  v7 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__LACDTORatchetManager_stateWithCompletion___block_invoke_17;
  v9[3] = &unk_2653B5860;
  objc_copyWeak(&v11, (id *)buf);
  id v8 = v6;
  id v10 = v8;
  [v7 ratchetStateWithCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __44__LACDTORatchetManager_stateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LACLogDTOClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44__LACDTORatchetManager_stateWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44__LACDTORatchetManager_stateWithCompletion___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = LACLogDTOClient();
    int v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __44__LACDTORatchetManager_stateWithCompletion___block_invoke_cold_1();
      }

      id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315394;
        uint64_t v12 = "-[LACDTORatchetManager stateWithCompletion:]_block_invoke";
        __int16 v13 = 2114;
        id v14 = v5;
        _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "%s finished with state: %{public}@", (uint8_t *)&v11, 0x16u);
      }

      id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v10();
  }
}

- (void)stateCompositeWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LACLogDTOClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[LACDTORatchetManager stateCompositeWithCompletion:]";
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke;
  v12[3] = &unk_2653B5838;
  id v6 = v4;
  id v13 = v6;
  v7 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:v12];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_19;
  v9[3] = &unk_2653B5888;
  objc_copyWeak(&v11, (id *)buf);
  id v8 = v6;
  id v10 = v8;
  [v7 ratchetStateCompositeWithCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LACLogDTOClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = LACLogDTOClient();
    int v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_cold_1();
      }

      id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315394;
        uint64_t v12 = "-[LACDTORatchetManager stateCompositeWithCompletion:]_block_invoke";
        __int16 v13 = 2114;
        id v14 = v5;
        _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "%s finished with state: %{public}@", (uint8_t *)&v11, 0x16u);
      }

      id v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v10();
  }
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LACLogDTOClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[LACDTORatchetManager checkCanEnableFeatureWithCompletion:]";
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke;
  v11[3] = &unk_2653B5838;
  id v6 = v4;
  id v12 = v6;
  v7 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_21;
  v9[3] = &unk_2653B58B0;
  id v10 = v6;
  id v8 = v6;
  [v7 checkCanEnableFeatureWithCompletion:v9];
}

void __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LACLogDTOClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = LACLogDTOClient();
  os_log_type_t v8 = 16 * (v6 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    id v10 = "-[LACDTORatchetManager checkCanEnableFeatureWithCompletion:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_254F14000, v7, v8, "%s finished with result: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableFeatureWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LACLogDTOClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[LACDTORatchetManager enableFeatureWithReply:]";
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke;
  v11[3] = &unk_2653B5838;
  id v6 = v4;
  id v12 = v6;
  v7 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_23;
  v9[3] = &unk_2653B58B0;
  id v10 = v6;
  id v8 = v6;
  [v7 enableFeatureWithCompletion:v9];
}

void __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LACLogDTOClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = LACLogDTOClient();
  os_log_type_t v8 = 16 * (v6 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    id v10 = "-[LACDTORatchetManager enableFeatureWithReply:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_254F14000, v7, v8, "%s finished with result: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableFeatureActivatingGracePeriodWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LACLogDTOClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[LACDTORatchetManager enableFeatureActivatingGracePeriodWithReply:]";
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke;
  v11[3] = &unk_2653B5838;
  id v6 = v4;
  id v12 = v6;
  v7 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke_24;
  v9[3] = &unk_2653B58B0;
  id v10 = v6;
  id v8 = v6;
  [v7 enableFeatureActivatingGracePeriodWithCompletion:v9];
}

void __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LACLogDTOClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = LACLogDTOClient();
  os_log_type_t v8 = 16 * (v6 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    id v10 = "-[LACDTORatchetManager enableFeatureActivatingGracePeriodWithReply:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_254F14000, v7, v8, "%s finished with result: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  os_log_type_t v8 = LACLogDTOClient();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[LACDTORatchetManager disableFeatureWithContext:completion:]";
    _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke;
  v15[3] = &unk_2653B5838;
  id v9 = v6;
  id v16 = v9;
  id v10 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:v15];
  __int16 v11 = [v7 uuid];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_25;
  v13[3] = &unk_2653B5838;
  id v14 = v9;
  id v12 = v9;
  [v10 disableFeatureWithContext:v11 completion:v13];
}

void __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LACLogDTOClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = LACLogDTOClient();
  os_log_type_t v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    id v7 = "-[LACDTORatchetManager disableFeatureWithContext:completion:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_254F14000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = LACLogDTOClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[LACDTORatchetManager enableFeatureStrictModeWithCompletion:]";
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke;
  v11[3] = &unk_2653B5838;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_26;
  v9[3] = &unk_2653B5838;
  id v10 = v6;
  id v8 = v6;
  [v7 enableFeatureStrictModeWithCompletion:v9];
}

void __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LACLogDTOClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = LACLogDTOClient();
  os_log_type_t v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    id v7 = "-[LACDTORatchetManager enableFeatureStrictModeWithCompletion:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_254F14000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = LACLogDTOClient();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[LACDTORatchetManager disableFeatureStrictModeWithContext:completion:]";
    _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke;
  v15[3] = &unk_2653B5838;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:v15];
  __int16 v11 = [v7 uuid];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_27;
  v13[3] = &unk_2653B5838;
  id v14 = v9;
  id v12 = v9;
  [v10 disableFeatureStrictModeWithContext:v11 completion:v13];
}

void __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LACLogDTOClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = LACLogDTOClient();
  os_log_type_t v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    id v7 = "-[LACDTORatchetManager disableFeatureStrictModeWithContext:completion:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_254F14000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = LACLogDTOClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[LACDTORatchetManager addObserver:]";
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(NSHashTable *)self->_observers addObject:v4];
  if (![(LACDarwinNotificationCenter *)self->_notificationCenter hasObserver:self]) {
    [(LACDarwinNotificationCenter *)self->_notificationCenter addObserver:self notification:@"com.apple.LocalAuthentication.ratchet.StateDidChange"];
  }
}

- (void)removeObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_log_type_t v5 = LACLogDTOClient();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[LACDTORatchetManager removeObserver:]";
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(NSHashTable *)self->_observers removeObject:v4];
  if (![(NSHashTable *)self->_observers count]) {
    [(LACDarwinNotificationCenter *)self->_notificationCenter removeObserver:self];
  }
}

- (void)reset
{
  [(NSHashTable *)self->_observers removeAllObjects];
  notificationCenter = self->_notificationCenter;
  [(LACDarwinNotificationCenter *)notificationCenter removeObserver:self];
}

- (void)performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = LACLogDTOClient();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = "-[LACDTORatchetManager performArmRequestWithIdentifier:context:options:completion:]";
    __int16 v20 = 2114;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v12;
    _os_log_impl(&dword_254F14000, v14, OS_LOG_TYPE_DEFAULT, "%s context:%{public}@ identifier:%{public}@ options:%{public}@", buf, 0x2Au);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__LACDTORatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke;
  v16[3] = &unk_2653B58B0;
  id v17 = v13;
  id v15 = v13;
  [(LACDTORatchetManager *)self _performArmRequestWithIdentifier:v10 context:v11 options:v12 completion:v16];
}

void __83__LACDTORatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LACLogDTOClient();
  os_log_type_t v8 = 16 * (v6 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    id v10 = "-[LACDTORatchetManager performArmRequestWithIdentifier:context:options:completion:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_254F14000, v7, v8, "%s finished with result: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stateInContext:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = LACLogDTOClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v11 = "-[LACDTORatchetManager stateInContext:completion:]";
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__LACDTORatchetManager_stateInContext_completion___block_invoke;
  v8[3] = &unk_2653B58D8;
  id v9 = v5;
  id v7 = v5;
  [(LACDTORatchetManager *)self stateWithCompletion:v8];
}

void __50__LACDTORatchetManager_stateInContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LACLogDTOClient();
  os_log_type_t v8 = 16 * (v6 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    id v10 = "-[LACDTORatchetManager stateInContext:completion:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_254F14000, v7, v8, "%s finished with result: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stateCompositeInContext:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = LACLogDTOClient();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v11 = "-[LACDTORatchetManager stateCompositeInContext:completion:]";
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__LACDTORatchetManager_stateCompositeInContext_completion___block_invoke;
  v8[3] = &unk_2653B5900;
  id v9 = v5;
  id v7 = v5;
  [(LACDTORatchetManager *)self stateCompositeWithCompletion:v8];
}

void __59__LACDTORatchetManager_stateCompositeInContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LACLogDTOClient();
  os_log_type_t v8 = 16 * (v6 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 136315650;
    id v10 = "-[LACDTORatchetManager stateCompositeInContext:completion:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_254F14000, v7, v8, "%s finished with result: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelArmRequestWithIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = LACLogDTOClient();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v20 = "-[LACDTORatchetManager cancelArmRequestWithIdentifier:reason:completion:]";
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 2114;
    id v24 = v9;
    _os_log_impl(&dword_254F14000, v11, OS_LOG_TYPE_DEFAULT, "%s identifier:%{public}@, reason:%{public}@", buf, 0x20u);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke;
  v17[3] = &unk_2653B5838;
  id v12 = v10;
  id v18 = v12;
  __int16 v13 = [(LACDTORatchetManager *)self _remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_28;
  v15[3] = &unk_2653B5838;
  id v16 = v12;
  id v14 = v12;
  [v13 cancelPendingEvaluationWithRatchetIdentifier:v8 reason:v9 completion:v15];
}

void __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = LACLogDTOClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = LACLogDTOClient();
  os_log_type_t v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    id v7 = "-[LACDTORatchetManager cancelArmRequestWithIdentifier:reason:completion:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_254F14000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  int64_t v14 = [(LACDTORatchetManager *)self _armPolicy];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke;
  v24[3] = &unk_2653B5928;
  id v15 = v12;
  id v25 = v15;
  id v16 = v10;
  id v26 = v16;
  id v17 = __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke((uint64_t)v24);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_2;
  v20[3] = &unk_2653B5978;
  objc_copyWeak(&v23, &location);
  id v18 = v11;
  id v21 = v18;
  id v19 = v13;
  id v22 = v19;
  [v18 evaluateCorePolicy:v14 options:v17 reply:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

id __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  os_log_type_t v5 = v4;

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [NSNumber numberWithInteger:1066];
  [v5 setObject:v6 forKeyedSubscript:v7];

  return v5;
}

void __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v8 = a1[4];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_3;
    v9[3] = &unk_2653B5950;
    objc_copyWeak(&v14, a1 + 6);
    id v13 = a1[5];
    id v10 = v6;
    id v11 = a1[4];
    id v12 = v5;
    [WeakRetained stateCompositeInContext:v8 completion:v9];

    objc_destroyWeak(&v14);
  }
}

void __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v38[5] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v8 = *(void **)(a1 + 32);
      if (v8)
      {
        id v9 = [v8 userInfo];
        id v10 = (void *)[v9 mutableCopy];
        id v11 = v10;
        if (v10) {
          id v12 = v10;
        }
        else {
          id v12 = (id)objc_opt_new();
        }
        id v26 = v12;

        v27 = [v5 ratchetState];
        [v26 setObject:v27 forKeyedSubscript:@"RatchetState"];

        [v26 setObject:v5 forKeyedSubscript:@"RatchetStateComposite"];
        id v28 = objc_alloc(MEMORY[0x263F087E8]);
        v29 = [*(id *)(a1 + 32) domain];
        v30 = objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, objc_msgSend(*(id *)(a1 + 32), "code"), v26);

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      else
      {
        uint64_t v33 = *(void *)(a1 + 56);
        v36 = [NSNumber numberWithInteger:21];
        v37[0] = v36;
        v38[0] = *(void *)(a1 + 40);
        v35 = [NSNumber numberWithInteger:22];
        v37[1] = v35;
        v34 = [v5 ratchetState];
        v38[1] = v34;
        v32 = [NSNumber numberWithInteger:23];
        v37[2] = v32;
        v38[2] = v5;
        v31 = [NSNumber numberWithInteger:1];
        v37[3] = v31;
        id v13 = *(void **)(a1 + 48);
        id v14 = [NSNumber numberWithInteger:1];
        uint64_t v15 = [v13 objectForKeyedSubscript:v14];
        id v16 = (void *)v15;
        uint64_t v17 = MEMORY[0x263EFFA80];
        if (v15) {
          uint64_t v18 = v15;
        }
        else {
          uint64_t v18 = MEMORY[0x263EFFA80];
        }
        v38[3] = v18;
        id v19 = [NSNumber numberWithInteger:3];
        v37[4] = v19;
        __int16 v20 = *(void **)(a1 + 48);
        id v21 = [NSNumber numberWithInteger:3];
        uint64_t v22 = [v20 objectForKeyedSubscript:v21];
        id v23 = (void *)v22;
        if (v22) {
          uint64_t v24 = v22;
        }
        else {
          uint64_t v24 = v17;
        }
        v38[4] = v24;
        id v25 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];
        (*(void (**)(uint64_t, void *, void))(v33 + 16))(v33, v25, 0);
      }
    }
  }
}

- (int64_t)_armPolicy
{
  return 1026;
}

- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4
{
  if (self->_notificationCenter == a3
    && LACDarwinNotificationsEqual(a4, @"com.apple.LocalAuthentication.ratchet.StateDidChange"))
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke;
    v5[3] = &unk_2653B59C8;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x263EF83A0], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke_2;
    v3[3] = &unk_2653B59A0;
    objc_copyWeak(&v4, v1);
    [WeakRetained stateWithCompletion:v3];
    objc_destroyWeak(&v4);
  }
}

void __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (!a3 && WeakRetained)
  {
    id v8 = LACLogDTOClient();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v7[1] count];
      *(_DWORD *)buf = 67109378;
      int v21 = v9;
      __int16 v22 = 2114;
      id v23 = v5;
      _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "Will notify %d observers about new state: %{public}@", buf, 0x12u);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v7[1];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "ratchetStateDidChange:", v5, (void)v15);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  remoteObjectProxy = self->_remoteObjectProxy;
  if (remoteObjectProxy)
  {
    id v4 = remoteObjectProxy;
  }
  else
  {
    id v6 = a3;
    id v7 = +[LACError errorWithCode:-1000 debugDescription:@"Platform not supported"];
    (*((void (**)(id, void *))a3 + 2))(v6, v7);
  }
  return remoteObjectProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __44__LACDTORatchetManager_stateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_254F14000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
}

void __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_254F14000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
}

void __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_254F14000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
}

void __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_254F14000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
}

void __68__LACDTORatchetManager_enableFeatureActivatingGracePeriodWithReply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_254F14000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
}

void __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_254F14000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
}

void __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_254F14000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
}

void __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_254F14000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
}

void __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_254F14000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
}

@end