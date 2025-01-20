@interface LKLoginController
+ (id)sharedController;
- (LKLoginController)init;
- (NSXPCConnection)connection;
- (id)completionHandler;
- (id)proxy;
- (id)recentUsers;
- (void)checkInWithCurrentEnvironment:(unint64_t)a3 completionHandler:(id)a4;
- (void)chooseUserWithIdentifier:(id)a3 inClassWithID:(id)a4 password:(id)a5 withCompletionHandler:(id)a6;
- (void)interruptLocalUserSwitchTest;
- (void)isReadyToLoginWithCompletionHandler:(id)a3;
- (void)isReadyToLogoutWithCompletionHandler:(id)a3;
- (void)loginAppleID:(id)a3 password:(id)a4 localLoginOnly:(BOOL)a5 isTemporarySession:(BOOL)a6 withCompletionHandler:(id)a7;
- (void)logoutWithLogoutType:(unint64_t)a3 completionHandler:(id)a4;
- (void)saveClassConfiguration:(id)a3 withCompletionHandler:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)triggerLocalUserSwitchTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8 completionHandler:(id)a9;
- (void)updateGlobalDefaultsValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5;
@end

@implementation LKLoginController

+ (id)sharedController
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__LKLoginController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v2 = (void *)sharedController_sharedController;
  return v2;
}

void __37__LKLoginController_sharedController__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = v0;

  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.logind.client.machService" options:4096];
  [(id)sharedController_sharedController setConnection:v2];

  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D4965D8];
  v4 = [(id)sharedController_sharedController connection];
  [v4 setRemoteObjectInterface:v3];

  objc_initWeak(&location, (id)sharedController_sharedController);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__LKLoginController_sharedController__block_invoke_2;
  v10[3] = &unk_2645FC340;
  objc_copyWeak(&v11, &location);
  v5 = [(id)sharedController_sharedController connection];
  [v5 setInterruptionHandler:v10];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__LKLoginController_sharedController__block_invoke_3;
  v8[3] = &unk_2645FC340;
  objc_copyWeak(&v9, &location);
  v6 = [(id)sharedController_sharedController connection];
  [v6 setInvalidationHandler:v8];

  v7 = [(id)sharedController_sharedController connection];
  [v7 resume];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __37__LKLoginController_sharedController__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnection:0];

  id v3 = objc_loadWeakRetained(v1);
  v4 = [v3 completionHandler];

  if (v4)
  {
    id v7 = +[LKError errorWithCode:4];
    id v5 = objc_loadWeakRetained(v1);
    v6 = [v5 completionHandler];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

void __37__LKLoginController_sharedController__block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnection:0];

  id v3 = objc_loadWeakRetained(v1);
  v4 = [v3 completionHandler];

  if (v4)
  {
    id v7 = +[LKError errorWithCode:5];
    id v5 = objc_loadWeakRetained(v1);
    v6 = [v5 completionHandler];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (LKLoginController)init
{
  v6.receiver = self;
  v6.super_class = (Class)LKLoginController;
  v2 = [(LKLoginController *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    id completionHandler = v2->_completionHandler;
    v2->_id completionHandler = 0;

    LKRegisterLoginKitLogging();
  }
  return v3;
}

- (id)proxy
{
  id v3 = [(LKLoginController *)self connection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__LKLoginController_proxy__block_invoke;
  v6[3] = &unk_2645FC388;
  v6[4] = self;
  v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return v4;
}

void __26__LKLoginController_proxy__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    id v3 = [*(id *)(a1 + 32) completionHandler];

    if (v3)
    {
      v4 = [*(id *)(a1 + 32) completionHandler];
      ((void (**)(void, id))v4)[2](v4, v5);

      [*(id *)(a1 + 32) setCompletionHandler:0];
    }
  }
}

- (void)logoutWithLogoutType:(unint64_t)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v5 = objc_opt_new();
  objc_super v6 = v5;
  if (a3 == 1)
  {
    [v5 logoutToLoginSessionWithCompletionHandler:v7];
  }
  else if (!a3)
  {
    [v5 logoutToLoginUserWithCompletionHandler:v7];
  }
}

- (void)chooseUserWithIdentifier:(id)a3 inClassWithID:(id)a4 password:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (isMultiUser())
  {
    v14 = [(LKLoginController *)self completionHandler];

    if (v14)
    {
      v15 = +[LKError errorWithCode:3];
      v16 = [(LKLoginController *)self completionHandler];
      ((void (**)(void, void *))v16)[2](v16, v15);
    }
    [(LKLoginController *)self setCompletionHandler:v13];
    v17 = [(LKLoginController *)self proxy];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __91__LKLoginController_chooseUserWithIdentifier_inClassWithID_password_withCompletionHandler___block_invoke;
    v19[3] = &unk_2645FC388;
    v19[4] = self;
    [v17 chooseUserWithIdentifier:v10 inClassWithID:v11 password:v12 withCompletionHandler:v19];
  }
  else if (v13)
  {
    v18 = +[LKError errorWithCode:28];
    v13[2](v13, v18);
  }
}

void __91__LKLoginController_chooseUserWithIdentifier_inClassWithID_password_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) completionHandler];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, id))v4)[2](v4, v5);

    [*(id *)(a1 + 32) setCompletionHandler:0];
  }
}

- (void)loginAppleID:(id)a3 password:(id)a4 localLoginOnly:(BOOL)a5 isTemporarySession:(BOOL)a6 withCompletionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  v14 = (void (**)(id, void *))a7;
  v15 = LKLogDefault;
  if (os_log_type_enabled((os_log_t)LKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2221A9000, v15, OS_LOG_TYPE_DEFAULT, "LoginKit: Login is initiated.", buf, 2u);
  }
  if (isMultiUser())
  {
    v16 = [(LKLoginController *)self completionHandler];

    if (v16)
    {
      v17 = +[LKError errorWithCode:3];
      v18 = [(LKLoginController *)self completionHandler];
      ((void (**)(void, void *))v18)[2](v18, v17);
    }
    [(LKLoginController *)self setCompletionHandler:v14];
    v19 = [(LKLoginController *)self proxy];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __99__LKLoginController_loginAppleID_password_localLoginOnly_isTemporarySession_withCompletionHandler___block_invoke;
    v21[3] = &unk_2645FC388;
    v21[4] = self;
    [v19 loginAppleID:v12 password:v13 localLoginOnly:v9 isTemporarySession:v8 withCompletionHandler:v21];
  }
  else if (v14)
  {
    v20 = +[LKError errorWithCode:28];
    v14[2](v14, v20);
  }
}

void __99__LKLoginController_loginAppleID_password_localLoginOnly_isTemporarySession_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) completionHandler];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, id))v4)[2](v4, v5);

    [*(id *)(a1 + 32) setCompletionHandler:0];
  }
}

- (void)saveClassConfiguration:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (isMultiUser())
  {
    [(LKLoginController *)self setCompletionHandler:v7];
    BOOL v8 = [(LKLoginController *)self proxy];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__LKLoginController_saveClassConfiguration_withCompletionHandler___block_invoke;
    v10[3] = &unk_2645FC388;
    void v10[4] = self;
    [v8 saveClassConfiguration:v6 withCompletionHandler:v10];
  }
  else if (v7)
  {
    BOOL v9 = +[LKError errorWithCode:28];
    v7[2](v7, v9);
  }
}

void __66__LKLoginController_saveClassConfiguration_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) completionHandler];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, id))v4)[2](v4, v5);

    [*(id *)(a1 + 32) setCompletionHandler:0];
  }
}

- (void)isReadyToLoginWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (isMultiUser())
  {
    [(LKLoginController *)self setCompletionHandler:v4];
    id v5 = [(LKLoginController *)self proxy];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__LKLoginController_isReadyToLoginWithCompletionHandler___block_invoke;
    v7[3] = &unk_2645FC388;
    v7[4] = self;
    [v5 isReadyToLoginWithCompletionHandler:v7];
  }
  else if (v4)
  {
    id v6 = +[LKError errorWithCode:28];
    v4[2](v4, v6);
  }
}

void __57__LKLoginController_isReadyToLoginWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) completionHandler];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, id))v4)[2](v4, v5);

    [*(id *)(a1 + 32) setCompletionHandler:0];
  }
}

- (void)isReadyToLogoutWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (isMultiUser())
  {
    [(LKLoginController *)self setCompletionHandler:v4];
    id v5 = [(LKLoginController *)self proxy];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__LKLoginController_isReadyToLogoutWithCompletionHandler___block_invoke;
    v7[3] = &unk_2645FC388;
    v7[4] = self;
    [v5 isReadyToLogoutWithCompletionHandler:v7];
  }
  else if (v4)
  {
    id v6 = +[LKError errorWithCode:28];
    v4[2](v4, v6);
  }
}

void __58__LKLoginController_isReadyToLogoutWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) completionHandler];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, id))v4)[2](v4, v5);

    [*(id *)(a1 + 32) setCompletionHandler:0];
  }
}

- (void)checkInWithCurrentEnvironment:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  if (isMultiUser())
  {
    [(LKLoginController *)self setCompletionHandler:v6];
    id v7 = [(LKLoginController *)self proxy];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__LKLoginController_checkInWithCurrentEnvironment_completionHandler___block_invoke;
    v9[3] = &unk_2645FC388;
    v9[4] = self;
    [v7 checkInWithCurrentEnvironment:a3 completionHandler:v9];
  }
  else if (v6)
  {
    BOOL v8 = +[LKError errorWithCode:28];
    v6[2](v6, v8);
  }
}

void __69__LKLoginController_checkInWithCurrentEnvironment_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) completionHandler];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, id))v4)[2](v4, v5);

    [*(id *)(a1 + 32) setCompletionHandler:0];
  }
}

- (id)recentUsers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F841B0] sharedManager];
  id v3 = [v2 allUsers];

  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[LKUser userFromUMUser:](LKUser, "userFromUMUser:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)updateGlobalDefaultsValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(LKLoginController *)self proxy];
  [v11 updateGlobalDefaultsValue:v10 forKey:v9 completionHandler:v8];
}

- (void)triggerLocalUserSwitchTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8 completionHandler:(id)a9
{
  id v16 = a9;
  id v17 = a6;
  id v18 = a5;
  id v19 = [(LKLoginController *)self proxy];
  [v19 triggerLocalUserSwitchTestForType:a3 count:a4 username:v18 password:v17 loginDelay:a7 logoutDelay:a8 completionHandler:v16];
}

- (void)interruptLocalUserSwitchTest
{
  id v2 = [(LKLoginController *)self proxy];
  [v2 interruptLocalUserSwitchTest];
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end