@interface LACDTOFeatureController
- (LACDTOEventBus)eventBus;
- (LACDTOFeatureController)initWithKVStore:(id)a3 requirementsDataSource:(id)a4 featureFlags:(id)a5 workQueue:(id)a6;
- (void)_checkIsFeatureEnabledWithCompletion:(id)a3;
- (void)_enableFeatureActivatingGracePeriod:(BOOL)a3 completion:(id)a4;
- (void)_fetchDeviceHintsCurrentConnection:(id)a3 completion:(id)a4;
- (void)_fetchRequirementsWithCompletion:(id)a3;
- (void)_setFeatureEnablementMode:(id)a3 context:(id)a4 connection:(id)a5 completion:(id)a6;
- (void)_setFeatureStrictModeEnabled:(BOOL)a3 context:(id)a4 connection:(id)a5 completion:(id)a6;
- (void)_setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 completion:(id)a7;
- (void)checkCanEnableFeatureWithCompletion:(id)a3;
- (void)checkIsFeatureAvailableWithCompletion:(id)a3;
- (void)checkIsFeatureEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3;
- (void)checkIsFeatureSupportedWithCompletion:(id)a3;
- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4;
- (void)disableFeatureWithContext:(id)a3 completion:(id)a4;
- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3;
- (void)enableFeatureStrictModeWithCompletion:(id)a3;
- (void)enableFeatureWithCompletion:(id)a3;
- (void)fetchStateWithCompletion:(id)a3;
- (void)setEventBus:(id)a3;
@end

@implementation LACDTOFeatureController

- (LACDTOFeatureController)initWithKVStore:(id)a3 requirementsDataSource:(id)a4 featureFlags:(id)a5 workQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)LACDTOFeatureController;
  v15 = [(LACDTOFeatureController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_kvStore, a3);
    objc_storeStrong((id *)&v16->_requirementsDataSource, a4);
    objc_storeStrong((id *)&v16->_featureFlags, a5);
    v17 = objc_alloc_init(LACDTOFeatureEnablementModeCoder);
    enablementModeCoder = v16->_enablementModeCoder;
    v16->_enablementModeCoder = v17;

    objc_storeStrong((id *)&v16->_workQueue, a6);
  }

  return v16;
}

- (void)fetchStateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke;
  v6[3] = &unk_2653B7248;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(LACDTOFeatureController *)self checkIsFeatureSupportedWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_2;
    v6[3] = &unk_2653B7220;
    void v6[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    char v8 = a2;
    [v5 checkIsFeatureAvailableWithCompletion:v6];
  }
}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_3;
    v5[3] = &unk_2653B71F8;
    v5[4] = v2;
    id v6 = *(id *)(a1 + 40);
    char v7 = *(unsigned char *)(a1 + 48);
    char v8 = a2;
    [v2 checkIsFeatureEnabledWithCompletion:v5];
  }
}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_4;
    v5[3] = &unk_2653B71D0;
    v5[4] = v2;
    id v6 = *(id *)(a1 + 40);
    __int16 v7 = *(_WORD *)(a1 + 48);
    char v8 = a2;
    [v2 checkIsFeatureStrictModeEnabledWithCompletion:v5];
  }
}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_4(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_5;
    v5[3] = &unk_2653B71A8;
    v5[4] = v2;
    id v6 = *(id *)(a1 + 40);
    char v7 = *(unsigned char *)(a1 + 48);
    __int16 v8 = *(_WORD *)(a1 + 49);
    char v9 = a2;
    [v2 _fetchRequirementsWithCompletion:v5];
  }
}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_6;
    v7[3] = &unk_2653B7180;
    int v9 = *(_DWORD *)(a1 + 48);
    id v8 = v3;
    id v6 = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_6((uint64_t)v7);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

LACDTOMutableFeatureState *__52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_6(uint64_t a1)
{
  v2 = objc_alloc_init(LACDTOMutableFeatureState);
  [(LACDTOMutableFeatureState *)v2 setIsSupported:*(unsigned __int8 *)(a1 + 40)];
  [(LACDTOMutableFeatureState *)v2 setIsAvailable:*(unsigned __int8 *)(a1 + 41)];
  [(LACDTOMutableFeatureState *)v2 setIsEnabled:*(unsigned __int8 *)(a1 + 42)];
  [(LACDTOMutableFeatureState *)v2 setIsStrictModeEnabled:*(unsigned __int8 *)(a1 + 43)];
  [(LACDTOMutableFeatureState *)v2 setRequirements:*(void *)(a1 + 32)];
  return v2;
}

- (void)checkIsFeatureEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__LACDTOFeatureController_checkIsFeatureEnabledWithCompletion___block_invoke;
  v6[3] = &unk_2653B7270;
  id v7 = v4;
  id v5 = v4;
  [(LACDTOFeatureController *)self _checkIsFeatureEnabledWithCompletion:v6];
}

void __63__LACDTOFeatureController_checkIsFeatureEnabledWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 isEnabled], v5);
}

- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  kvStore = self->_kvStore;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke;
  v7[3] = &unk_2653B57C8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(LACDTOKVStore *)kvStore valueForKey:4 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = LACLogDTOFeature();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke_cold_1();
      }

      v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = [v5 BOOLValue];
        id v12 = "NO";
        if (v11) {
          id v12 = "YES";
        }
        int v14 = 136315138;
        v15 = v12;
        _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "isFeatureStrictModeEnabled: %s", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v13 = *(void *)(a1 + 32);
      [v5 BOOLValue];
      v10 = *(void (**)(void))(v13 + 16);
    }
    v10();
  }
}

- (void)checkIsFeatureSupportedWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  workQueue = self->_workQueue;
  id v5 = (void (**)(id, uint64_t, void))a3;
  dispatch_assert_queue_V2(workQueue);
  if ([(LACDTOFeatureRequirementsDataSource *)self->_requirementsDataSource isPhone])
  {
    id v6 = LACLogDTOFeature();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "isFeatureSupported: YES", (uint8_t *)&v10, 2u);
    }

    v5[2](v5, 1, 0);
    id v7 = v5;
  }
  else
  {
    id v8 = +[LACLocalization dtoErrorDeviceTypeNotSupported];
    id v7 = +[LACError errorWithCode:-1027 localizedDescription:v8];

    id v9 = LACLogDTOFeature();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      int v11 = v7;
      _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "isFeatureSupported: NO (%{public}@)", (uint8_t *)&v10, 0xCu);
    }

    ((void (**)(id, uint64_t, void *))v5)[2](v5, 0, v7);
  }
}

- (void)checkIsFeatureAvailableWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke;
  v6[3] = &unk_2653B7248;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(LACDTOFeatureController *)self checkIsFeatureSupportedWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_10:
      v9();
      goto LABEL_15;
    }
    if ([WeakRetained[2] hasPasscodeSetForCurrentUser])
    {
      if (([v7[2] hasBiometricEnrollmentsForCurrentUser] & 1) == 0)
      {
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke_10;
        v13[3] = &unk_2653B56B0;
        id v14 = *(id *)(a1 + 32);
        [v7 checkIsFeatureEnabledWithCompletion:v13];

        goto LABEL_15;
      }
      id v8 = LACLogDTOFeature();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "isFeatureAvailable: YES", buf, 2u);
      }

      id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_10;
    }
    int v10 = +[LACLocalization dtoErrorPasscodeNotSet];
    int v11 = +[LACError errorWithCode:-5 localizedDescription:v10];

    uint64_t v12 = LACLogDTOFeature();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v11;
      _os_log_impl(&dword_254F14000, v12, OS_LOG_TYPE_DEFAULT, "isFeatureAvailable: NO (%{public}@)", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
LABEL_15:
}

void __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke_10(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3 || !a2)
  {
    id v5 = +[LACLocalization dtoErrorBiometryNotEnrolled];
    id v6 = +[LACError errorWithCode:-7 localizedDescription:v5];

    id v7 = LACLogDTOFeature();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "isFeatureAvailable: NO (%{public}@)", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = LACLogDTOFeature();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_254F14000, v4, OS_LOG_TYPE_DEFAULT, "isFeatureAvailable = isFeatureEnabled = YES", (uint8_t *)&v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = [MEMORY[0x263F08D68] currentConnection];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke;
  v8[3] = &unk_2653B7298;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = v5;
  id v9 = v7;
  [(LACDTOFeatureController *)self checkIsFeatureAvailableWithCompletion:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 && (a2 & 1) == 0) {
      __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke_cold_1();
    }
    if (v5)
    {
      int v8 = LACLogDTOFeature();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v5;
        _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled: NO (%{public}@)", (uint8_t *)&v9, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      [WeakRetained _fetchDeviceHintsCurrentConnection:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    }
  }
}

- (void)enableFeatureWithCompletion:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  [(LACDTOFeatureController *)self _enableFeatureActivatingGracePeriod:0 completion:v5];
}

- (void)enableFeatureActivatingGracePeriodWithCompletion:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  [(LACDTOFeatureController *)self _enableFeatureActivatingGracePeriod:[(LACFeatureFlagsProviderDTO *)self->_featureFlags featureFlagDimpleKeyGracePeriodEnabled] completion:v5];
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  workQueue = self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v10 = +[LACDTOFeatureEnablementMode disabled];
  int v9 = [MEMORY[0x263F08D68] currentConnection];
  [(LACDTOFeatureController *)self _setFeatureEnablementMode:v10 context:v8 connection:v9 completion:v7];
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v6 = [MEMORY[0x263F08D68] currentConnection];
  [(LACDTOFeatureController *)self _setFeatureStrictModeEnabled:1 context:0 connection:v6 completion:v5];
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  workQueue = self->_workQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v9 = [MEMORY[0x263F08D68] currentConnection];
  [(LACDTOFeatureController *)self _setFeatureStrictModeEnabled:0 context:v8 connection:v9 completion:v7];
}

- (void)_checkIsFeatureEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  kvStore = self->_kvStore;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__LACDTOFeatureController__checkIsFeatureEnabledWithCompletion___block_invoke;
  v7[3] = &unk_2653B57C8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(LACDTOKVStore *)kvStore valueForKey:0 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__LACDTOFeatureController__checkIsFeatureEnabledWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      id v9 = LACLogDTOFeature();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __64__LACDTOFeatureController__checkIsFeatureEnabledWithCompletion___block_invoke_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v10 = [WeakRetained[4] decode:v5];
      uint64_t v11 = LACLogDTOFeature();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        uint64_t v13 = v10;
        _os_log_impl(&dword_254F14000, v11, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled: %@", (uint8_t *)&v12, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)_enableFeatureActivatingGracePeriod:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v7 = [MEMORY[0x263F08D68] currentConnection];
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke;
  v10[3] = &unk_2653B72C0;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v12 = v8;
  BOOL v14 = a3;
  id v9 = v7;
  id v11 = v9;
  [(LACDTOFeatureController *)self checkCanEnableFeatureWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = LACLogDTOFeature();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v6;
        _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled: NO (%{public}@)", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      if (*(unsigned char *)(a1 + 56)) {
        +[LACDTOFeatureEnablementMode enabledWithGracePeriod];
      }
      else {
      id v9 = +[LACDTOFeatureEnablementMode enabled];
      }
      uint64_t v10 = *(void *)(a1 + 32);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke_15;
      v11[3] = &unk_2653B5F60;
      objc_copyWeak(&v14, (id *)(a1 + 48));
      id v13 = *(id *)(a1 + 40);
      id v12 = v5;
      [WeakRetained _setFeatureEnablementMode:v9 context:0 connection:v10 completion:v11];

      objc_destroyWeak(&v14);
    }
  }
}

void __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = LACLogDTOFeature();
    id v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke_15_cold_1();
      }

      id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled: YES", v8, 2u);
      }

      id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v7();
  }
}

- (void)_setFeatureEnablementMode:(id)a3 context:(id)a4 connection:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__LACDTOFeatureController__setFeatureEnablementMode_context_connection_completion___block_invoke;
  v18[3] = &unk_2653B72E8;
  objc_copyWeak(&v23, &location);
  id v14 = v13;
  id v22 = v14;
  id v15 = v10;
  id v19 = v15;
  id v16 = v11;
  id v20 = v16;
  id v17 = v12;
  id v21 = v17;
  [(LACDTOFeatureController *)self _checkIsFeatureEnabledWithCompletion:v18];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __83__LACDTOFeatureController__setFeatureEnablementMode_context_connection_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_7:
      v8();
      goto LABEL_8;
    }
    int v9 = [*(id *)(a1 + 32) isEnabled];
    if (v9 == [v5 isEnabled])
    {
      id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      goto LABEL_7;
    }
    id v10 = [WeakRetained[4] encode:*(void *)(a1 + 32)];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __83__LACDTOFeatureController__setFeatureEnablementMode_context_connection_completion___block_invoke_2;
    v13[3] = &unk_2653B5F60;
    objc_copyWeak(&v16, (id *)(a1 + 64));
    id v15 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 32);
    [WeakRetained _setValue:v10 forKey:0 contextUUID:v11 connection:v12 completion:v13];

    objc_destroyWeak(&v16);
  }
LABEL_8:
}

void __83__LACDTOFeatureController__setFeatureEnablementMode_context_connection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (!v8)
    {
      id v4 = [LACDTOEvent alloc];
      id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isEnabled"));
      id v6 = [(LACDTOEvent *)v4 initWithRawValue:2 value:v5];

      id v7 = [WeakRetained eventBus];
      [v7 dispatchEvent:v6 sender:WeakRetained];
    }
  }
}

- (void)_setFeatureStrictModeEnabled:(BOOL)a3 context:(id)a4 connection:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke;
  v16[3] = &unk_2653B7338;
  objc_copyWeak(&v20, &location);
  id v13 = v12;
  id v19 = v13;
  BOOL v21 = a3;
  id v14 = v10;
  id v17 = v14;
  id v15 = v11;
  id v18 = v15;
  [(LACDTOFeatureController *)self checkIsFeatureStrictModeEnabledWithCompletion:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      if (*(unsigned __int8 *)(a1 + 64) != a2)
      {
        id v8 = [[LACDTOKVStoreValue alloc] initWithBoolValue:*(unsigned __int8 *)(a1 + 64)];
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke_2;
        v11[3] = &unk_2653B7310;
        objc_copyWeak(&v13, (id *)(a1 + 56));
        id v12 = *(id *)(a1 + 48);
        char v14 = *(unsigned char *)(a1 + 64);
        [WeakRetained _setValue:v8 forKey:4 contextUUID:v9 connection:v10 completion:v11];

        objc_destroyWeak(&v13);
        goto LABEL_7;
      }
      id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v7();
  }
LABEL_7:
}

void __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (!v8)
    {
      id v4 = [LACDTOEvent alloc];
      id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
      id v6 = [(LACDTOEvent *)v4 initWithRawValue:3 value:v5];

      id v7 = [WeakRetained eventBus];
      [v7 dispatchEvent:v6 sender:WeakRetained];
    }
  }
}

- (void)_setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 completion:(id)a7
{
  kvStore = self->_kvStore;
  if (a5) {
    [(LACDTOKVStore *)kvStore setValue:a3 forKey:a4 contextUUID:a5 connection:a6 completion:a7];
  }
  else {
    [(LACDTOKVStore *)kvStore setValue:a3 forKey:a4 connection:a6 completion:a7];
  }
}

- (void)_fetchDeviceHintsCurrentConnection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__7;
  v14[4] = __Block_byref_object_dispose__7;
  id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  kvStore = self->_kvStore;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke;
  v10[3] = &unk_2653B7388;
  objc_copyWeak(&v13, &location);
  id v12 = v14;
  id v9 = v7;
  id v11 = v9;
  [(LACDTOKVStore *)kvStore valueForKey:3 connection:v6 completion:v10];

  objc_destroyWeak(&v13);
  _Block_object_dispose(v14, 8);

  objc_destroyWeak(&location);
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = LACLogDTOFeature();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_cold_1();
      }
    }
    id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = [NSNumber numberWithInteger:2];
    [v10 setObject:v9 forKeyedSubscript:v11];

    id v12 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_22;
    v15[3] = &unk_2653B7360;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    long long v14 = *(_OWORD *)(a1 + 32);
    id v13 = (id)v14;
    long long v16 = v14;
    [v12 hasLocationServicesEnabledWithCompletion:v15];

    objc_destroyWeak(&v17);
  }
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = LACLogDTOFeature();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_22_cold_1();
      }
    }
    id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = [NSNumber numberWithInteger:0];
    [v10 setObject:v9 forKeyedSubscript:v11];

    id v12 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_23;
    v15[3] = &unk_2653B7360;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    long long v14 = *(_OWORD *)(a1 + 32);
    id v13 = (id)v14;
    long long v16 = v14;
    [v12 hasHSA2AccountWithCompletion:v15];

    objc_destroyWeak(&v17);
  }
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = LACLogDTOFeature();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_23_cold_1();
      }
    }
    id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = [NSNumber numberWithInteger:1];
    [v10 setObject:v9 forKeyedSubscript:v11];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_fetchRequirementsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, LACDTOMutableFeatureRequirements *))a3;
  id v5 = objc_alloc_init(LACDTOMutableFeatureRequirements);
  [(LACDTOMutableFeatureRequirements *)v5 setHasPasscodeSet:[(LACDTOFeatureRequirementsDataSource *)self->_requirementsDataSource hasPasscodeSetForCurrentUser]];
  [(LACDTOMutableFeatureRequirements *)v5 setHasBiometricEnrollments:[(LACDTOFeatureRequirementsDataSource *)self->_requirementsDataSource hasBiometricEnrollmentsForCurrentUser]];
  v4[2](v4, v5);
}

- (LACDTOEventBus)eventBus
{
  return self->eventBus;
}

- (void)setEventBus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eventBus, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_enablementModeCoder, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_requirementsDataSource, 0);
  objc_storeStrong((id *)&self->_kvStore, 0);
}

void __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "isFeatureStrictModeEnabled: NO (%{public}@)", v2, v3, v4, v5, v6);
}

void __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke_cold_1()
{
  __assert_rtn("-[LACDTOFeatureController checkCanEnableFeatureWithCompletion:]_block_invoke", "LACDTOFeatureController.m", 185, "isAvailable || error != nil");
}

void __64__LACDTOFeatureController__checkIsFeatureEnabledWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "isFeatureEnabled: NO (%{public}@)", v2, v3, v4, v5, v6);
}

void __74__LACDTOFeatureController__enableFeatureActivatingGracePeriod_completion___block_invoke_15_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "isFeatureEnabled: NO (error: %{public}@)", v2, v3, v4, v5, v6);
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Could not fetch biometric liveness (%{public}@)", v2, v3, v4, v5, v6);
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Could not fetch LocationServices status (%{public}@)", v2, v3, v4, v5, v6);
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Could not fetch HSA2Account (%{public}@)", v2, v3, v4, v5, v6);
}

@end