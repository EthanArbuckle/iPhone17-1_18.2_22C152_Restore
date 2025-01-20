@interface FBKLoginManager
- (BOOL)_errorIncludesNotAParticipant:(id)a3;
- (BOOL)_errorIncludesOutdatedVersion:(id)a3;
- (BOOL)_hasInternalDeviceToken;
- (BOOL)loggedInAsSomeoneElse;
- (FBKLoginManager)initWithAPI:(id)a3;
- (FBKLoginManagerDelegate)FBKData;
- (FBKLoginManagerDelegate)api;
- (FBKReAuthenticationHandler)reAuthHandler;
- (NSMutableArray)postLogOutTaskQueue;
- (NSMutableArray)postLoginTaskQueue;
- (id)_loginInfo;
- (id)authenticationContextForUsername:(id)a3;
- (id)pendingLoginOperation;
- (unint64_t)loginState;
- (void)_completeAuthenticationWith:(id)a3 credentialToken:(id)a4 completion:(id)a5;
- (void)_drainLogOutTaskQueue;
- (void)_drainLoginTaskQueue;
- (void)_internalLoginWithDeviceToken:(id)a3;
- (void)_loginInfo;
- (void)_loginWithUsername:(id)a3 authenticationResults:(id)a4 completion:(id)a5;
- (void)autoLoginUsingSystemAccount:(BOOL)a3 completion:(id)a4;
- (void)autoLoginWithCompletion:(id)a3;
- (void)autoLoginWithUserID:(id)a3 userName:(id)a4 deviceToken:(id)a5 usesSystemAccount:(BOOL)a6 completion:(id)a7;
- (void)backgroundStartupWithCompletion:(id)a3;
- (void)clearLoginTaskQueue;
- (void)dealloc;
- (void)didLoginWithUserInfo:(id)a3;
- (void)didLoginWithUserInfo:(id)a3 completion:(id)a4;
- (void)handleInteractiveLoginWithError:(id)a3 success:(BOOL)a4 completion:(id)a5;
- (void)interactiveStartupUsingAppleConnect:(id)a3;
- (void)interactiveStartupUsingSystemAccount:(BOOL)a3 completion:(id)a4;
- (void)interactiveStartupWithCompletion:(id)a3;
- (void)interactiveStartupWithLaunchAction:(id)a3 completion:(id)a4;
- (void)logOut;
- (void)logOutIfNeededAndRun:(id)a3;
- (void)loginAsAnonymousUserWithLaunchAction:(id)a3 completion:(id)a4;
- (void)loginAsUnauthenticatedUserWithCompletion:(id)a3;
- (void)loginWithAppleConnectToken:(id)a3 completion:(id)a4;
- (void)loginWithEphemeralDeviceToken:(id)a3 completion:(id)a4;
- (void)loginWithSystemAccountWithCompletion:(id)a3;
- (void)loginWithUsername:(id)a3 authenticationResults:(id)a4 completion:(id)a5;
- (void)runAfterLogin:(id)a3;
- (void)sessionDidBecomeInvalid:(id)a3;
- (void)setApi:(id)a3;
- (void)setFBKData:(id)a3;
- (void)setLoggedInAsSomeoneElse:(BOOL)a3;
- (void)setLoginState:(unint64_t)a3;
- (void)setPendingLoginOperation:(id)a3;
- (void)setPostLogOutTaskQueue:(id)a3;
- (void)setPostLoginTaskQueue:(id)a3;
- (void)setReAuthHandler:(id)a3;
@end

@implementation FBKLoginManager

- (FBKLoginManager)initWithAPI:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FBKLoginManager;
  v5 = [(FBKLoginManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    v5->_loggedInAsSomeoneElse = 0;
    objc_storeWeak((id *)&v5->_api, v4);
    v6->_loginState = 0;
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    postLoginTaskQueue = v6->_postLoginTaskQueue;
    v6->_postLoginTaskQueue = (NSMutableArray *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
    postLogOutTaskQueue = v6->_postLogOutTaskQueue;
    v6->_postLogOutTaskQueue = (NSMutableArray *)v9;

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v6 selector:sel_sessionDidBecomeInvalid_ name:@"FBKSessionDidBecomeInvalidNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FBKLoginManager;
  [(FBKLoginManager *)&v4 dealloc];
}

- (void)logOutIfNeededAndRun:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_super v4 = (void (**)(void))a3;
  v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [(FBKLoginManager *)self loginState];
    if (v6 - 1 > 4) {
      uint64_t v7 = "Logged Out";
    }
    else {
      uint64_t v7 = off_264874690[v6 - 1];
    }
    *(_DWORD *)buf = 136315394;
    v17 = "-[FBKLoginManager logOutIfNeededAndRun:]";
    __int16 v18 = 2082;
    v19 = v7;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "%s with state [%{public}s]", buf, 0x16u);
  }

  switch([(FBKLoginManager *)self loginState])
  {
    case 0uLL:
      v4[2](v4);
      break;
    case 1uLL:
      v10 = [(FBKLoginManager *)self postLogOutTaskQueue];
      v11 = _Block_copy(v4);
      [v10 addObject:v11];

      [(FBKLoginManager *)self logOut];
      break;
    case 2uLL:
      v12 = [(FBKLoginManager *)self postLogOutTaskQueue];
      objc_super v13 = _Block_copy(v4);
      [v12 addObject:v13];

      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      v8 = [(FBKLoginManager *)self postLogOutTaskQueue];
      uint64_t v9 = _Block_copy(v4);
      [v8 addObject:v9];

      objc_initWeak((id *)buf, self);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __40__FBKLoginManager_logOutIfNeededAndRun___block_invoke;
      v14[3] = &unk_2648741A8;
      objc_copyWeak(&v15, (id *)buf);
      [(FBKLoginManager *)self runAfterLogin:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
      break;
    default:
      break;
  }
}

void __40__FBKLoginManager_logOutIfNeededAndRun___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__FBKLoginManager_logOutIfNeededAndRun___block_invoke_2;
  block[3] = &unk_264874180;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v4);
}

void __40__FBKLoginManager_logOutIfNeededAndRun___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained logOut];
}

- (void)_drainLogOutTaskQueue
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(FBKLoginManager *)self postLogOutTaskQueue];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    uint64_t v7 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __40__FBKLoginManager__drainLogOutTaskQueue__block_invoke;
        block[3] = &unk_2648741D0;
        void block[4] = v9;
        dispatch_async(v7, block);
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v10 = [(FBKLoginManager *)self postLogOutTaskQueue];
  [v10 removeAllObjects];
}

uint64_t __40__FBKLoginManager__drainLogOutTaskQueue__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runAfterLogin:(id)a3
{
  id v4 = a3;
  if ([(FBKLoginManager *)self loginState] == 1)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__FBKLoginManager_runAfterLogin___block_invoke;
    v7[3] = &unk_2648741F8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
  else
  {
    uint64_t v5 = [(FBKLoginManager *)self postLoginTaskQueue];
    uint64_t v6 = _Block_copy(v4);
    [v5 addObject:v6];
  }
}

uint64_t __33__FBKLoginManager_runAfterLogin___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) loginState];
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (void)_drainLoginTaskQueue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = Log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_INFO, "Draining login task queue.", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(FBKLoginManager *)self postLoginTaskQueue];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    id v8 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __39__FBKLoginManager__drainLoginTaskQueue__block_invoke;
        v12[3] = &unk_2648741F8;
        v12[4] = self;
        v12[5] = v10;
        dispatch_async(v8, v12);
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }

  v11 = [(FBKLoginManager *)self postLoginTaskQueue];
  [v11 removeAllObjects];
}

uint64_t __39__FBKLoginManager__drainLoginTaskQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) loginState];
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (void)clearLoginTaskQueue
{
  v3 = Log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "Clearing login task queue.", v5, 2u);
  }

  id v4 = [(FBKLoginManager *)self postLoginTaskQueue];
  [v4 removeAllObjects];
}

- (void)sessionDidBecomeInvalid:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKLoginManager *)self FBKData];
  uint64_t v6 = [v5 pendingConsents];
  uint64_t v7 = [v6 count];

  id v8 = Log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Session did become invalid while holding pending consents.", buf, 2u);
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Session did become invalid", buf, 2u);
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke;
    v10[3] = &unk_264874270;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoginState:0];
  uint64_t v2 = [*(id *)(a1 + 40) object];
  if (v2)
  {
    v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 40) object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v6 = [*(id *)(a1 + 40) object];
      uint64_t v7 = [v6 request];
      id v8 = [v7 URL];
      BOOL v9 = [v8 pathComponents];

      if (([v9 containsObject:@"login"] & 1) != 0
        || ([v9 containsObject:@"signout"] & 1) != 0)
      {
        uint64_t v10 = Log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "Calling boxed request error handler", (uint8_t *)buf, 2u);
        }

        id v11 = [*(id *)(a1 + 40) userInfo];
        long long v12 = [v11 objectForKeyedSubscript:@"error"];

        long long v13 = [v6 errorBlock];

        if (v13)
        {
          long long v14 = [v6 errorBlock];
          ((void (**)(void, NSObject *))v14)[2](v14, v12);
        }
      }
      else
      {
        if ([v9 containsObject:@"alive.json"])
        {
          long long v15 = [*(id *)(a1 + 40) userInfo];
          long long v16 = [v15 objectForKeyedSubscript:@"error"];

          uint64_t v17 = [v6 errorBlock];

          if (v17)
          {
            __int16 v18 = [v6 errorBlock];
            ((void (**)(void, void *))v18)[2](v18, v16);
          }
        }
        else
        {
          objc_initWeak(buf, *(id *)(a1 + 32));
          uint64_t v19 = *(void **)(a1 + 32);
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_2;
          v27[3] = &unk_264874220;
          objc_copyWeak(&v29, buf);
          id v28 = v6;
          [v19 runAfterLogin:v27];

          objc_destroyWeak(&v29);
          objc_destroyWeak(buf);
        }
        uint64_t v20 = Log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_22A36D000, v20, OS_LOG_TYPE_DEFAULT, "Will try to recover after login session expired", (uint8_t *)buf, 2u);
        }

        BOOL v21 = +[FBKSharedConstants isRunningInFBA];
        v22 = Log();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          if (v23)
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_22A36D000, v22, OS_LOG_TYPE_DEFAULT, "Using FBA only re-authentication flow", (uint8_t *)buf, 2u);
          }

          v24 = *(void **)(a1 + 32);
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_37;
          v26[3] = &unk_264874248;
          v26[4] = v24;
          [v24 autoLoginWithCompletion:v26];
          goto LABEL_10;
        }
        if (v23)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_22A36D000, v22, OS_LOG_TYPE_DEFAULT, "Using FBK re-authentication flow", (uint8_t *)buf, 2u);
        }

        v25 = [*(id *)(a1 + 32) reAuthHandler];

        if (v25)
        {
          long long v12 = [*(id *)(a1 + 32) reAuthHandler];
          [v12 appNeedsReAuthentication];
        }
        else
        {
          long long v12 = Log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_cold_1();
          }
        }
      }

LABEL_10:
    }
  }
}

void __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (a2 == 1 && WeakRetained)
  {
    uint64_t v6 = Log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) request];
      id v8 = [v7 HTTPMethod];
      BOOL v9 = [*(id *)(a1 + 32) request];
      uint64_t v10 = [v9 URL];
      id v11 = [v10 path];
      int v18 = 138543618;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      BOOL v21 = v11;
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "Retrying boxed request [%{public}@ %{public}@]", (uint8_t *)&v18, 0x16u);
    }
    id v12 = objc_loadWeakRetained(v4);
    long long v13 = [v12 api];
    long long v14 = [v13 foregroundClient];
    long long v15 = [*(id *)(a1 + 32) request];
    long long v16 = [*(id *)(a1 + 32) successBlock];
    uint64_t v17 = [*(id *)(a1 + 32) errorBlock];
    [v14 dataForURLRequest:v15 success:v16 error:v17];
  }
}

uint64_t __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_37(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 _drainLoginTaskQueue];
  }
  else
  {
    uint64_t v5 = Log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "Could not re-authenticate with device token, logging out", v6, 2u);
    }

    return [*(id *)(a1 + 32) logOut];
  }
}

- (void)interactiveStartupWithLaunchAction:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(FBKLoginManager *)self setLoginState:3];
  id v8 = Log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = [(FBKLoginManager *)self loginState];
    if (v9 - 1 > 4) {
      uint64_t v10 = "Logged Out";
    }
    else {
      uint64_t v10 = off_264874690[v9 - 1];
    }
    *(_DWORD *)buf = 136315394;
    v25 = "-[FBKLoginManager interactiveStartupWithLaunchAction:completion:]";
    __int16 v26 = 2082;
    v27 = v10;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "%s with state [%{public}s]", buf, 0x16u);
  }

  if (FBKIsInternalInstall(v11, v12))
  {
    long long v13 = [v6 loginToken];
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 0;
  }
  long long v15 = [v6 loginToken];
  if (v14)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke;
    v21[3] = &unk_2648742C0;
    long long v16 = &v23;
    v21[4] = self;
    id v23 = v7;
    id v22 = v6;
    id v17 = v7;
    [(FBKLoginManager *)self loginWithEphemeralDeviceToken:v15 completion:v21];
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_3;
    v19[3] = &unk_2648742E8;
    long long v16 = &v20;
    v19[4] = self;
    id v20 = v7;
    id v18 = v7;
    [(FBKLoginManager *)self loginAsAnonymousUserWithLaunchAction:v6 completion:v19];
  }
}

void __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = a2 == 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_2;
  v6[3] = &unk_264874298;
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  [v4 handleInteractiveLoginWithError:a2 success:v5 completion:v6];
}

uint64_t __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32));
}

void __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_4;
  v9[3] = &unk_264874298;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 handleInteractiveLoginWithError:a2 success:a2 == 0 completion:v9];
}

uint64_t __65__FBKLoginManager_interactiveStartupWithLaunchAction_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32));
}

- (void)interactiveStartupWithCompletion:(id)a3
{
}

- (void)interactiveStartupUsingAppleConnect:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(FBKLoginManager *)self setLoginState:5];
  id v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [(FBKLoginManager *)self loginState];
    if (v6 - 1 > 4) {
      id v7 = "Logged Out";
    }
    else {
      id v7 = off_264874690[v6 - 1];
    }
    *(_DWORD *)buf = 136315394;
    id v17 = "-[FBKLoginManager interactiveStartupUsingAppleConnect:]";
    __int16 v18 = 2082;
    uint64_t v19 = v7;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "%s with state [%{public}s]", buf, 0x16u);
  }

  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __55__FBKLoginManager_interactiveStartupUsingAppleConnect___block_invoke;
  long long v13 = &unk_264874310;
  BOOL v14 = self;
  id v15 = v4;
  id v8 = v4;
  unint64_t v9 = _Block_copy(&v10);
  -[FBKLoginManager autoLoginUsingSystemAccount:completion:](self, "autoLoginUsingSystemAccount:completion:", 0, v9, v10, v11, v12, v13, v14);
}

uint64_t __55__FBKLoginManager_interactiveStartupUsingAppleConnect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleInteractiveLoginWithError:a3 success:a2 completion:*(void *)(a1 + 40)];
}

- (void)interactiveStartupUsingSystemAccount:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = Log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = [(FBKLoginManager *)self loginState];
    if (v8 - 1 > 4) {
      unint64_t v9 = "Logged Out";
    }
    else {
      unint64_t v9 = off_264874690[v8 - 1];
    }
    *(_DWORD *)buf = 136315394;
    v24 = "-[FBKLoginManager interactiveStartupUsingSystemAccount:completion:]";
    __int16 v25 = 2082;
    __int16 v26 = v9;
    _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "%s with state [%{public}s]", buf, 0x16u);
  }

  if ([(FBKLoginManager *)self loginState] != 3
    && [(FBKLoginManager *)self loginState] != 4
    && [(FBKLoginManager *)self loginState] != 1)
  {
    [(FBKLoginManager *)self setLoginState:3];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__FBKLoginManager_interactiveStartupUsingSystemAccount_completion___block_invoke;
    aBlock[3] = &unk_264874310;
    aBlock[4] = self;
    id v11 = v6;
    id v22 = v11;
    uint64_t v12 = _Block_copy(aBlock);
    if (FBKIsInternalInstall(v12, v13))
    {
      BOOL v14 = [MEMORY[0x263F08AB0] processInfo];
      id v15 = [v14 environment];
      long long v16 = [v15 objectForKeyedSubscript:@"FBK_FIXTURES_ENABLED"];
      int v17 = [v16 isEqualToString:@"1"];

      if (v17)
      {
        __int16 v18 = objc_opt_new();
        [v18 setParticipantID:&unk_26DE1E798];
        [v18 setUsername:@"tony@starkenterprises.com"];
        [v18 setGivenName:@"Tony"];
        [v18 setFamilyName:@"Stark"];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __67__FBKLoginManager_interactiveStartupUsingSystemAccount_completion___block_invoke_60;
        v19[3] = &unk_264874038;
        v19[4] = self;
        id v20 = v11;
        [(FBKLoginManager *)self didLoginWithUserInfo:v18 completion:v19];

LABEL_19:
        goto LABEL_12;
      }
      if ([(FBKLoginManager *)self _hasInternalDeviceToken])
      {
        [(FBKLoginManager *)self _internalLoginWithDeviceToken:v12];
        goto LABEL_19;
      }
    }
    [(FBKLoginManager *)self autoLoginUsingSystemAccount:v4 completion:v12];
    goto LABEL_19;
  }
  uint64_t v10 = Log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "login API called while logged/logging in", buf, 2u);
  }

LABEL_12:
}

uint64_t __67__FBKLoginManager_interactiveStartupUsingSystemAccount_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleInteractiveLoginWithError:a3 success:a2 completion:*(void *)(a1 + 40)];
}

uint64_t __67__FBKLoginManager_interactiveStartupUsingSystemAccount_completion___block_invoke_60(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInteractiveLoginWithError:0 success:1 completion:*(void *)(a1 + 40)];
}

- (void)handleInteractiveLoginWithError:(id)a3 success:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unint64_t v9 = (void (**)(id, uint64_t, uint64_t))a5;
  if (v6)
  {
    [(FBKLoginManager *)self setLoginState:1];
    [(FBKLoginManager *)self _drainLoginTaskQueue];
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    if (v8)
    {
      uint64_t v12 = Log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[FBKLoginManager handleInteractiveLoginWithError:success:completion:](v8);
      }

      uint64_t v13 = [v8 domain];
      int v14 = [v13 isEqualToString:*MEMORY[0x263F08570]];

      if (v14 && (unint64_t v15 = [v8 code] + 1009, v15 <= 8)) {
        uint64_t v16 = qword_22A4BEAF0[v15];
      }
      else {
        uint64_t v16 = 0;
      }
      if ([(FBKLoginManager *)self _errorIncludesOutdatedVersion:v8]) {
        v16 |= 2uLL;
      }
      if ([(FBKLoginManager *)self _errorIncludesNotAParticipant:v8]) {
        uint64_t v11 = v16 | 4;
      }
      else {
        uint64_t v11 = v16;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v10 = 4;
  }
  if (+[FBKSharedConstants isRunningInFBA])
  {
    int v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v18 = [v17 integerForKey:@"AgreedLegalVersion"];

    if (v18 < +[FBKSharedConstants currentLegalVersion])
    {
      v10 |= 2uLL;
      uint64_t v19 = +[FBKSharedConstants sharedUserDefaults];
      [v19 setBool:0 forKey:@"FBKSuppressPrivacyNotice"];
    }
  }
  if (v9) {
    v9[2](v9, v11, v10);
  }
}

- (void)backgroundStartupWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__FBKLoginManager_backgroundStartupWithCompletion___block_invoke;
  v6[3] = &unk_264874310;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FBKLoginManager *)self autoLoginWithCompletion:v6];
}

uint64_t __51__FBKLoginManager_backgroundStartupWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _drainLoginTaskQueue];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)logOut
{
  v3 = Log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "Logging out", buf, 2u);
  }

  [(FBKLoginManager *)self setLoginState:2];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"FBKUserIsLogginOut" object:self];

  dispatch_time_t v5 = dispatch_time(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__FBKLoginManager_logOut__block_invoke;
  block[3] = &unk_264873FE8;
  void block[4] = self;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

void __25__FBKLoginManager_logOut__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) FBKData];
  v3 = [v2 currentUser];

  id v4 = [v3 ID];

  dispatch_time_t v5 = (void *)MEMORY[0x263F3C678];
  if (v4)
  {
    BOOL v6 = [v3 ID];
    [v5 clearDeviceTokenForParticipantID:v6];
  }
  else
  {
    [MEMORY[0x263F3C678] clearAllDeviceTokens];
  }
  id v7 = [*(id *)(a1 + 32) api];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __25__FBKLoginManager_logOut__block_invoke_2;
  v8[3] = &unk_264873FE8;
  v8[4] = *(void *)(a1 + 32);
  [v7 logOutServerSideWithCompletion:v8];
}

void __25__FBKLoginManager_logOut__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) api];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __25__FBKLoginManager_logOut__block_invoke_3;
  v3[3] = &unk_264873FE8;
  v3[4] = *(void *)(a1 + 32);
  [v2 didLogOutWithCompletion:v3];
}

void __25__FBKLoginManager_logOut__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) FBKData];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __25__FBKLoginManager_logOut__block_invoke_4;
  v3[3] = &unk_264873FE8;
  v3[4] = *(void *)(a1 + 32);
  [v2 didLogOutWithCompletion:v3];
}

uint64_t __25__FBKLoginManager_logOut__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoginState:0];
  [*(id *)(a1 + 32) setLoggedInAsSomeoneElse:0];
  uint64_t v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEFAULT, "Did log out", v7, 2u);
  }

  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"FBKUserDidLogOut" object:*(void *)(a1 + 32)];

  id v4 = [*(id *)(a1 + 32) pendingLoginOperation];

  if (v4)
  {
    dispatch_time_t v5 = [*(id *)(a1 + 32) pendingLoginOperation];
    v5[2]();

    [*(id *)(a1 + 32) setPendingLoginOperation:0];
  }
  [*(id *)(a1 + 32) _drainLogOutTaskQueue];
  return +[FBKTargetedSurvey clearCachedUserSession];
}

- (void)didLoginWithUserInfo:(id)a3
{
}

- (void)didLoginWithUserInfo:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = Log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = [v6 participantID];
    uint64_t v10 = [v6 username];
    *(_DWORD *)buf = 138543618;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "did login with user ID [%{public}@] username [%@]", buf, 0x16u);
  }
  BOOL v11 = [(FBKLoginManager *)self loginState] == 5;
  [(FBKLoginManager *)self setLoginState:1];
  uint64_t v12 = [(FBKLoginManager *)self FBKData];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke;
  v15[3] = &unk_264874360;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  BOOL v18 = v11;
  id v13 = v7;
  id v14 = v6;
  [v12 didLogInWithLoginUserInfo:v14 completion:v15];
}

void __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) api];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke_2;
  v4[3] = &unk_264874338;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  char v6 = *(unsigned char *)(a1 + 56);
  [v2 didLogInWithLoginUserInfo:v3 completion:v4];
}

void __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _drainLoginTaskQueue];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"FBKUserDidLogIn" object:*(void *)(a1 + 32)];

  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = Log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke_2_cold_1();
    }
  }
  else
  {
    +[FBKTargetedSurvey clearCachedUserSession];
  }
}

- (void)loginWithEphemeralDeviceToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(FBKLoginManager *)self api];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke;
    v12[3] = &unk_2648743B0;
    v12[4] = self;
    id v13 = v7;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_65;
    v10[3] = &unk_2648743D8;
    id v11 = v13;
    [v8 seedPortalLoginWithDeviceToken:v6 success:v12 error:v10];
  }
  else
  {
    unint64_t v9 = FBKErrorOfType(-1020);
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
}

void __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_2;
  block[3] = &unk_264874388;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_INFO, "did login with device token", v4, 2u);
  }

  [*(id *)(a1 + 32) didLoginWithUserInfo:*(void *)(a1 + 40)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_65(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_2_66;
  v6[3] = &unk_2648741F8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __60__FBKLoginManager_loginWithEphemeralDeviceToken_completion___block_invoke_2_66(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)loginAsAnonymousUserWithLaunchAction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKLoginManager *)self api];
  unint64_t v9 = [v6 configurationToken];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke;
  v15[3] = &unk_264874428;
  id v16 = v6;
  id v17 = self;
  id v18 = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_67;
  v12[3] = &unk_264874478;
  id v13 = v16;
  id v14 = v18;
  id v10 = v16;
  id v11 = v18;
  [v8 seedPortalLoginAsAnonymousUserWithConfigurationToken:v9 success:v15 error:v12];
}

void __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_2;
  v6[3] = &unk_264874400;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v4 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_INFO, "did login with configuration", v6, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) behavior];
  [v3 addCustomBehavior:v4];

  [*(id *)(a1 + 48) didLoginWithUserInfo:*(void *)(a1 + 40)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_2_68;
  block[3] = &unk_264874450;
  id v8 = *(id *)(a1 + 40);
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __67__FBKLoginManager_loginAsAnonymousUserWithLaunchAction_completion___block_invoke_2_68(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)autoLoginWithCompletion:(id)a3
{
}

- (void)autoLoginUsingSystemAccount:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &__block_literal_global_7;
  }
  id v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v9 = [v8 stringForKey:*MEMORY[0x263F3C630]];

  if (v9 || v4)
  {
    id v11 = [(FBKLoginManager *)self FBKData];
    uint64_t v12 = [v11 userForUsername:v9];

    if (v12)
    {
      [v12 ID];
    }
    else
    {
      id v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
      uint64_t v14 = [v13 integerForKey:*MEMORY[0x263F3C628]];

      [NSNumber numberWithInteger:v14];
    unint64_t v15 = };
    if (v15)
    {
      id v16 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__FBKLoginManager_autoLoginUsingSystemAccount_completion___block_invoke_70;
      block[3] = &unk_2648744E8;
      id v19 = v15;
      id v20 = self;
      id v21 = v9;
      BOOL v23 = v4;
      id v22 = v7;
      dispatch_async(v16, block);
    }
    else
    {
      id v17 = Log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_DEFAULT, "No userID. Cannot auto-login.", buf, 2u);
      }

      if (v4)
      {
        [(FBKLoginManager *)self loginWithSystemAccountWithCompletion:v7];
      }
      else
      {
        [(FBKLoginManager *)self setLoginState:0];
        (*((void (**)(void *, void, void))v7 + 2))(v7, 0, 0);
      }
    }
  }
  else
  {
    id v10 = Log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "No username. Cannot auto-login", buf, 2u);
    }

    [(FBKLoginManager *)self setLoginState:0];
    (*((void (**)(void *, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __58__FBKLoginManager_autoLoginUsingSystemAccount_completion___block_invoke_70(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F3C678] fetchDeviceTokenForParticipantID:*(void *)(a1 + 32)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__FBKLoginManager_autoLoginUsingSystemAccount_completion___block_invoke_2;
  block[3] = &unk_2648744C0;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  id v8 = *(id *)(a1 + 48);
  id v9 = v2;
  char v11 = *(unsigned char *)(a1 + 64);
  id v10 = *(id *)(a1 + 56);
  id v4 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __58__FBKLoginManager_autoLoginUsingSystemAccount_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) autoLoginWithUserID:*(void *)(a1 + 40) userName:*(void *)(a1 + 48) deviceToken:*(void *)(a1 + 56) usesSystemAccount:*(unsigned __int8 *)(a1 + 72) completion:*(void *)(a1 + 64)];
}

- (void)loginWithSystemAccountWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int8x16_t v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "Performing system account login.", buf, 2u);
  }

  [(FBKLoginManager *)self setLoginState:4];
  id v6 = [MEMORY[0x263EFB210] defaultStore];
  int8x16_t v7 = [v6 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAE68]];
  id v8 = [v6 accountsWithAccountType:v7];
  id v9 = objc_msgSend(v6, "aa_primaryAppleAccount");
  if (v9 && [v8 count])
  {
    v24 = self;
    __int16 v25 = v8;
    __int16 v26 = v7;
    uint64_t v27 = v4;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
LABEL_7:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
        id v16 = [v15 username];
        id v17 = [v9 username];
        int v18 = [v16 isEqualToString:v17];

        if (v18) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v12) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      id v20 = Log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22A36D000, v20, OS_LOG_TYPE_INFO, "Found Apple ID Authentication account matching Apple Account.", buf, 2u);
      }

      id v21 = v15;
      int8x16_t v7 = v26;
      id v4 = v27;
      if (v21)
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke;
        v28[3] = &unk_264874560;
        v28[4] = v24;
        id v29 = v21;
        id v30 = v27;
        id v22 = v21;
        objc_msgSend(v22, "aida_tokenForService:completionHandler:", @"com.apple.gs.beta.auth", v28);

        goto LABEL_24;
      }
    }
    else
    {
LABEL_13:

      int8x16_t v7 = v26;
      id v4 = v27;
    }
    BOOL v23 = Log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[FBKLoginManager loginWithSystemAccountWithCompletion:]();
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
LABEL_24:
    id v8 = v25;
  }
  else
  {
    id v19 = Log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_DEFAULT, "No system accounts exist.", buf, 2u);
    }

    [(FBKLoginManager *)self setLoginState:0];
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int8x16_t v7 = Log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_cold_2(v6);
    }

    id v8 = Log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_cold_1();
    }
  }
  if (v5)
  {
    [a1[4] _completeAuthenticationWith:a1[5] credentialToken:v5 completion:a1[6]];
  }
  else
  {
    id v9 = Log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "Nil credential token for FBK IDMS Service. Will renew", buf, 2u);
    }

    id v10 = [a1[5] accountStore];
    id v11 = a1[5];
    v19[0] = @"com.apple.gs.beta.auth";
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_73;
    v14[3] = &unk_264874538;
    id v15 = a1[5];
    id v13 = a1[6];
    id v16 = a1[4];
    id v17 = v13;
    objc_msgSend(v10, "aida_renewCredentialsForAccount:services:completion:", v11, v12, v14);
  }
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_73(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  switch(a2)
  {
    case 2:
      id v6 = Log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      int8x16_t v7 = "renewal result: failed";
      goto LABEL_10;
    case 1:
      id v6 = Log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      int8x16_t v7 = "renewal result: rejected";
      goto LABEL_10;
    case 0:
      id v6 = Log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      int8x16_t v7 = "renewal result: renewed";
LABEL_10:
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_13;
  }
  id v6 = Log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_73_cold_2();
  }
LABEL_13:

  if (v5)
  {
    id v8 = Log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_73_cold_1();
    }
  }
  id v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_74;
  v12[3] = &unk_264874510;
  id v14 = *(id *)(a1 + 48);
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v10 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  objc_msgSend(v9, "aida_tokenForService:completionHandler:", @"com.apple.gs.beta.auth", v12);
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int8x16_t v7 = Log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_74_cold_3(v6);
    }

    id v8 = Log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_cold_1();
    }
  }
  if (v5)
  {
    [*(id *)(a1 + 32) _completeAuthenticationWith:*(void *)(a1 + 40) credentialToken:v5 completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v9 = Log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_74_cold_1();
    }

    id v10 = FBKErrorOfType(16);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_75;
    v13[3] = &unk_2648741F8;
    id v11 = *(id *)(a1 + 48);
    id v14 = v10;
    id v15 = v11;
    id v12 = v10;
    dispatch_async(MEMORY[0x263EF83A0], v13);
  }
}

uint64_t __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_75(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)_completeAuthenticationWith:(id)a3 credentialToken:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(v8, "aida_alternateDSID");
  id v12 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:@"com.apple.gs.beta.auth"];
  int8x16_t v13 = [MEMORY[0x263F291C0] currentDevice];
  id v14 = Log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478339;
    id v22 = v8;
    __int16 v23 = 2113;
    v24 = v11;
    __int16 v25 = 1024;
    BOOL v26 = v9 != 0;
    _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_INFO, "Performing authentication with account [%{private}@] alternate DSID [%{private}@] has credential token? [%i]", buf, 0x1Cu);
  }

  id v15 = [(FBKLoginManager *)self api];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke;
  v19[3] = &unk_2648743B0;
  v19[4] = self;
  id v20 = v10;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_2_81;
  v17[3] = &unk_2648745B0;
  v17[4] = self;
  id v18 = v20;
  id v16 = v20;
  [v15 seedPortalLoginWithAuthKitSession:v12 device:v13 idmsToken:v9 alternateDSID:v11 success:v19 error:v17];
}

void __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_2;
  block[3] = &unk_264874388;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_INFO, "Did log in with system account. %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) setIsSystemAccount:1];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_80;
  v6[3] = &unk_2648741D0;
  id v7 = *(id *)(a1 + 48);
  [v4 didLoginWithUserInfo:v5 completion:v6];
}

uint64_t __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_2_81(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_3;
  block[3] = &unk_264874588;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __74__FBKLoginManager__completeAuthenticationWith_credentialToken_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoginState:0];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)autoLoginWithUserID:(id)a3 userName:(id)a4 deviceToken:(id)a5 usesSystemAccount:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = a7;
  if (v10)
  {
    [(FBKLoginManager *)self setLoginState:3];
    id v12 = [(FBKLoginManager *)self api];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke;
    v18[3] = &unk_2648743B0;
    v18[4] = self;
    id v19 = v11;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_2_83;
    v15[3] = &unk_2648745D8;
    BOOL v17 = v8;
    void v15[4] = self;
    id v16 = v19;
    [v12 seedPortalLoginWithDeviceToken:v10 success:v18 error:v15];
  }
  else
  {
    int8x16_t v13 = Log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_DEFAULT, "No token. Cannot auto-login.", v14, 2u);
    }

    if (v8)
    {
      [(FBKLoginManager *)self loginWithSystemAccountWithCompletion:v11];
    }
    else
    {
      [(FBKLoginManager *)self setLoginState:0];
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    }
  }
}

void __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_2;
  block[3] = &unk_264874388;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138477827;
    uint64_t v9 = v3;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_INFO, "Did login with device token for [%{private}@]", buf, 0xCu);
  }

  [*(id *)(a1 + 32) saveDeviceTokenLookupInformation];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_82;
  v6[3] = &unk_2648741D0;
  id v7 = *(id *)(a1 + 48);
  [v4 didLoginWithUserInfo:v5 completion:v6];
}

uint64_t __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_2_83(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_3;
  v7[3] = &unk_264874360;
  char v11 = *(unsigned char *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_3_cold_1(a1);
  }

  id v3 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 56)) {
    return [v3 loginWithSystemAccountWithCompletion:*(void *)(a1 + 48)];
  }
  [v3 setLoginState:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)loginAsUnauthenticatedUserWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKLoginManager *)self api];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke;
  v9[3] = &unk_2648743B0;
  void v9[4] = self;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_4;
  v7[3] = &unk_2648743D8;
  id v8 = v10;
  id v6 = v10;
  [v5 seedPortalLoginAsUnauthenticatedUserWithSuccessHandler:v9 error:v7];
}

void __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_2;
  block[3] = &unk_264874388;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_3;
  v3[3] = &unk_2648741D0;
  id v4 = *(id *)(a1 + 48);
  [v1 didLoginWithUserInfo:v2 completion:v3];
}

uint64_t __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__FBKLoginManager_loginAsUnauthenticatedUserWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_loginWithUsername:(id)a3 authenticationResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  char v11 = Log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "Will login with AuthKit", buf, 2u);
  }

  [(FBKLoginManager *)self setLoginState:4];
  id v12 = (void *)[objc_alloc(MEMORY[0x263F29120]) initWithIdentifier:@"com.apple.gs.beta.auth"];
  int8x16_t v13 = [MEMORY[0x263F291C0] currentDevice];
  id v14 = [(FBKLoginManager *)self api];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  void v19[2] = __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke;
  v19[3] = &unk_264874428;
  id v20 = v8;
  id v21 = self;
  id v22 = v9;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_3;
  v17[3] = &unk_2648745B0;
  v17[4] = self;
  id v18 = v22;
  id v15 = v22;
  id v16 = v8;
  [v14 seedPortalLoginWithAuthKitSession:v12 device:v13 authenticationResults:v10 success:v19 error:v17];
}

void __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = Log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v18 = v3;
    _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_INFO, "Did login with username and AuthKit for [%{private}@]", buf, 0xCu);
  }

  id v5 = (void *)MEMORY[0x263F3C678];
  id v6 = [v3 deviceToken];
  id v7 = [v3 participantID];
  [v5 setDeviceToken:v6 forParticipantID:v7];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_84;
  v12[3] = &unk_264874400;
  id v13 = v3;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v10;
  id v11 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_84(uint64_t a1)
{
  [*(id *)(a1 + 32) setUsername:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) saveDeviceTokenLookupInformation];
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_2;
  v4[3] = &unk_2648741D0;
  id v3 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v3 didLoginWithUserInfo:v2 completion:v4];
}

uint64_t __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

void __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_4;
  block[3] = &unk_264874388;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __71__FBKLoginManager__loginWithUsername_authenticationResults_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoginState:0];
  [*(id *)(a1 + 32) _errorIncludesOutdatedVersion:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _errorIncludesNotAParticipant:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)loginWithUsername:(id)a3 authenticationResults:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = Log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = [(FBKLoginManager *)self loginState];
    if (v12 - 1 > 4) {
      id v13 = "Logged Out";
    }
    else {
      id v13 = off_264874690[v12 - 1];
    }
    *(_DWORD *)buf = 136315394;
    id v21 = "-[FBKLoginManager loginWithUsername:authenticationResults:completion:]";
    __int16 v22 = 2082;
    __int16 v23 = v13;
    _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_DEFAULT, "%s with state [%{public}s]", buf, 0x16u);
  }

  if ([(FBKLoginManager *)self loginState] == 2)
  {
    id v14 = Log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_DEFAULT, "Logout in progress - will proceed with login when done.", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __70__FBKLoginManager_loginWithUsername_authenticationResults_completion___block_invoke;
    v15[3] = &unk_264874600;
    objc_copyWeak(&v19, (id *)buf);
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    [(FBKLoginManager *)self setPendingLoginOperation:v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(FBKLoginManager *)self _loginWithUsername:v8 authenticationResults:v9 completion:v10];
  }
}

void __70__FBKLoginManager_loginWithUsername_authenticationResults_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _loginWithUsername:*(void *)(a1 + 32) authenticationResults:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)loginWithAppleConnectToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = Log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Will login with AppleConnect", buf, 2u);
  }

  [(FBKLoginManager *)self setLoginState:5];
  id v9 = [(FBKLoginManager *)self api];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke;
  v13[3] = &unk_2648743B0;
  void v13[4] = self;
  id v14 = v6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_3;
  v11[3] = &unk_2648745B0;
  v11[4] = self;
  id v12 = v14;
  id v10 = v14;
  [v9 seedPortalLoginWithAppleConnectSession:v7 success:v13 error:v11];
}

void __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = Log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v11 = v3;
    _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_INFO, "Did login with token and AppleConnect for [%{private}@]", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_85;
  block[3] = &unk_264874388;
  id v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_85(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_2;
  v3[3] = &unk_2648741D0;
  id v4 = *(id *)(a1 + 48);
  [v1 didLoginWithUserInfo:v2 completion:v3];
}

uint64_t __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

void __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_4;
  block[3] = &unk_264874388;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__FBKLoginManager_loginWithAppleConnectToken_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setLoginState:0];
  [*(id *)(a1 + 32) _errorIncludesOutdatedVersion:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _errorIncludesNotAParticipant:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)_errorIncludesOutdatedVersion:(id)a3
{
  return FBKSErrorContainsSP2ErrorCode();
}

- (BOOL)_errorIncludesNotAParticipant:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F3C620]])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 10)
    {
      BOOL v6 = 1;
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v7 = [v3 userInfo];
  id v8 = [v7 objectForKey:*MEMORY[0x263F3C638]];

  BOOL v6 = v8 && [v8 indexOfObjectPassingTest:&__block_literal_global_88] != 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:

  return v6;
}

BOOL __49__FBKLoginManager__errorIncludesNotAParticipant___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 code];
  if (v5 == 10) {
    *a4 = 1;
  }
  return v5 == 10;
}

- (unint64_t)loginState
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  unint64_t loginState = v2->_loginState;
  objc_sync_exit(v2);

  return loginState;
}

- (void)setLoginState:(unint64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  unint64_t loginState = v4->_loginState;
  v4->_unint64_t loginState = a3;
  objc_sync_exit(v4);

  if (loginState != a3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __33__FBKLoginManager_setLoginState___block_invoke;
    v6[3] = &unk_264874648;
    void v6[4] = v4;
    void v6[5] = a3;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __33__FBKLoginManager_setLoginState___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = *(void *)(a1 + 40) - 1;
    if (v3 > 4) {
      id v4 = "Logged Out";
    }
    else {
      id v4 = off_264874690[v3];
    }
    int v6 = 136446210;
    id v7 = v4;
    _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEFAULT, "New login state: [%{public}s]", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"FBKDidChangeLogInState" object:*(void *)(a1 + 32) userInfo:0];
}

- (void)_internalLoginWithDeviceToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_DEFAULT, "Using loginInfo file", buf, 2u);
  }

  int v6 = [(FBKLoginManager *)self _loginInfo];
  id v7 = [v6 objectForKeyedSubscript:@"id"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"username"];
  id v9 = [v6 objectForKeyedSubscript:@"token"];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__FBKLoginManager__internalLoginWithDeviceToken___block_invoke;
  v12[3] = &unk_264874670;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v4;
  id v10 = v4;
  id v11 = v6;
  [(FBKLoginManager *)self autoLoginWithUserID:v7 userName:v8 deviceToken:v9 usesSystemAccount:0 completion:v12];
}

void __49__FBKLoginManager__internalLoginWithDeviceToken___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setLoggedInAsSomeoneElse:a2];
  id v7 = Log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "DEV: saving loginInfo.json token to keychain", v11, 2u);
  }

  uint64_t v8 = (void *)MEMORY[0x263F3C678];
  id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"token"];
  id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"id"];
  [v8 setDeviceToken:v9 forParticipantID:v10];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)_hasInternalDeviceToken
{
  uint64_t v2 = [(FBKLoginManager *)self _loginInfo];
  unint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:@"username"];
    if (v4)
    {
      uint64_t v5 = [v3 objectForKeyedSubscript:@"token"];
      if (v5)
      {
        id v6 = [v3 objectForKeyedSubscript:@"id"];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_loginInfo
{
  uint64_t v2 = +[FBKFileManager applicationSupportDirectory];
  unint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 URLByAppendingPathComponent:@"loginInfo.json"];
    uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [v4 path];
    int v7 = [v5 fileExistsAtPath:v6];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
      if (v8)
      {
        id v13 = 0;
        id v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v13];
        id v10 = v13;
        if (v10)
        {
          id v11 = Log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[FBKLoginManager _loginInfo]();
          }
        }
        if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          id v9 = 0;
        }
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)authenticationContextForUsername:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F292A8]);
  [v4 setAuthenticationType:2];
  if (v3) {
    [v4 setUsername:v3];
  }
  [v4 setServiceIdentifier:@"com.apple.gs.beta.auth"];
  [v4 setIsEphemeral:1];

  return v4;
}

- (FBKReAuthenticationHandler)reAuthHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reAuthHandler);

  return (FBKReAuthenticationHandler *)WeakRetained;
}

- (void)setReAuthHandler:(id)a3
{
}

- (FBKLoginManagerDelegate)api
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_api);

  return (FBKLoginManagerDelegate *)WeakRetained;
}

- (void)setApi:(id)a3
{
}

- (FBKLoginManagerDelegate)FBKData
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_FBKData);

  return (FBKLoginManagerDelegate *)WeakRetained;
}

- (void)setFBKData:(id)a3
{
}

- (BOOL)loggedInAsSomeoneElse
{
  return self->_loggedInAsSomeoneElse;
}

- (void)setLoggedInAsSomeoneElse:(BOOL)a3
{
  self->_loggedInAsSomeoneElse = a3;
}

- (NSMutableArray)postLoginTaskQueue
{
  return self->_postLoginTaskQueue;
}

- (void)setPostLoginTaskQueue:(id)a3
{
}

- (NSMutableArray)postLogOutTaskQueue
{
  return self->_postLogOutTaskQueue;
}

- (void)setPostLogOutTaskQueue:(id)a3
{
}

- (id)pendingLoginOperation
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setPendingLoginOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingLoginOperation, 0);
  objc_storeStrong((id *)&self->_postLogOutTaskQueue, 0);
  objc_storeStrong((id *)&self->_postLoginTaskQueue, 0);
  objc_destroyWeak((id *)&self->_FBKData);
  objc_destroyWeak((id *)&self->_api);

  objc_destroyWeak((id *)&self->_reAuthHandler);
}

void __43__FBKLoginManager_sessionDidBecomeInvalid___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_22A36D000, v0, OS_LOG_TYPE_FAULT, "Re-authentication delegate is nil. Cannot recover from invalid session", v1, 2u);
}

- (void)handleInteractiveLoginWithError:(void *)a1 success:completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22A36D000, v2, v3, "Failed to log in with error: %{public}@", v4, v5, v6, v7, v8);
}

void __51__FBKLoginManager_didLoginWithUserInfo_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_22A36D000, v0, OS_LOG_TYPE_DEBUG, "Not clearing out User in feedbackd on internal AppleConnect flow", v1, 2u);
}

- (void)loginWithSystemAccountWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Found no Apple ID Authentication account matching the current Apple Account.", v2, v3, v4, v5, v6);
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_22A36D000, v0, OS_LOG_TYPE_DEBUG, "Error details: %@", v1, 0xCu);
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22A36D000, v2, v3, "Failed to get token for FBK IDMS Service: %{public}@", v4, v5, v6, v7, v8);
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_73_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_22A36D000, v0, OS_LOG_TYPE_ERROR, "Credential renewal failed with [%{public}@]", v1, 0xCu);
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_73_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "renewal result: unhandled case", v2, v3, v4, v5, v6);
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_74_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "Credential token for FBK IDMS is nil after renewing credential", v2, v3, v4, v5, v6);
}

void __56__FBKLoginManager_loginWithSystemAccountWithCompletion___block_invoke_74_cold_3(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22A36D000, v2, v3, "Failed to get token after renewal: %{public}@", v4, v5, v6, v7, v8);
}

void __89__FBKLoginManager_autoLoginWithUserID_userName_deviceToken_usesSystemAccount_completion___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) description];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22A36D000, v2, v3, "Failed to auto-login with token: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_loginInfo
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_22A36D000, v0, OS_LOG_TYPE_ERROR, "error reading loginInfo.json: %{public}@", v1, 0xCu);
}

@end