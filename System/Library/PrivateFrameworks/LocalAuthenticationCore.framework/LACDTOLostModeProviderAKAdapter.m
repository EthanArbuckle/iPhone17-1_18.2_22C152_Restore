@interface LACDTOLostModeProviderAKAdapter
- (LACDTOLostModeProviderAKAdapter)initWithWorkQueue:(id)a3 deviceInfo:(id)a4;
- (NSString)description;
- (void)_lostModeStateWithCompletion:(id)a3;
- (void)lostModeStateWithCompletion:(id)a3;
@end

@implementation LACDTOLostModeProviderAKAdapter

- (LACDTOLostModeProviderAKAdapter)initWithWorkQueue:(id)a3 deviceInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOLostModeProviderAKAdapter;
  v9 = [(LACDTOLostModeProviderAKAdapter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_deviceInfo, a4);
  }

  return v10;
}

- (void)lostModeStateWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, LACDTOLostModeState *))a3;
  lostModeState = self->_lostModeState;
  if (lostModeState)
  {
    v6 = [MEMORY[0x263EFF910] now];
    BOOL v7 = [(LACDTOLostModeState *)lostModeState isValid:v6];

    if (v7)
    {
      id v8 = LACLogDTOLostMode();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_lostModeState;
        *(_DWORD *)buf = 138543618;
        v16 = self;
        __int16 v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will use cached value %@", buf, 0x16u);
      }

      v4[2](v4, self->_lostModeState);
      goto LABEL_11;
    }
    v10 = self->_lostModeState;
  }
  else
  {
    v10 = 0;
  }
  self->_lostModeState = 0;

  v11 = LACLogDTOLostMode();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_254F14000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke;
  v12[3] = &unk_2653B6598;
  objc_copyWeak(&v14, (id *)buf);
  v13 = v4;
  [(LACDTOLostModeProviderAKAdapter *)self _lostModeStateWithCompletion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
LABEL_11:
}

void __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2;
    v10[3] = &unk_2653B6570;
    id v11 = v6;
    objc_super v12 = v8;
    id v14 = *(id *)(a1 + 32);
    id v13 = v5;
    dispatch_async(v9, v10);
  }
}

void __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (uint64_t *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = LACLogDTOLostMode();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2_cold_1(a1, v2, v5);
    }

    uint64_t v6 = *(void *)(a1 + 56);
    BOOL v7 = +[LACDTOLostModeState nullInstance];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query with value: %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), *(id *)(a1 + 48));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_lostModeStateWithCompletion:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (getAKDeviceListRequestContextClass() && getAKAccountManagerClass() && getAKAppleIDAuthenticationControllerClass())
  {
    id v5 = [(LACDTODeviceInfoProvider *)self->_deviceInfo serialNumber];
    uint64_t v6 = v5;
    if (v5 && [v5 length])
    {
      BOOL v7 = [getAKAccountManagerClass() sharedInstance];
      uint64_t v8 = [getAKAccountManagerClass() sharedInstance];
      uint64_t v9 = [v8 primaryAuthKitAccount];
      int v10 = [v7 altDSIDForAccount:v9];

      if (v10 && [v10 length])
      {
        id v11 = objc_alloc_init((Class)getAKDeviceListRequestContextClass());
        [v11 setAltDSID:v10];
        v19[0] = v6;
        __int16 v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
        [v11 setSerialNumbers:v12];

        [v11 setFetchDeviceSafetyState:1];
        id v13 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __64__LACDTOLostModeProviderAKAdapter__lostModeStateWithCompletion___block_invoke;
        v15[3] = &unk_2653B65E8;
        id v18 = v4;
        id v16 = v6;
        id v17 = v13;
        id v14 = v13;
        [v14 deviceListWithContext:v11 completion:v15];
      }
      else
      {
        id v11 = +[LACError errorWithCode:-1000 debugDescription:@"Could not determine altDISD for account"];
        (*((void (**)(id, void, id))v4 + 2))(v4, 0, v11);
      }
    }
    else
    {
      int v10 = +[LACError errorWithCode:-1000 debugDescription:@"Could not determine device SN"];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
    }
  }
  else
  {
    uint64_t v6 = +[LACError errorWithCode:-1020 debugDescription:@"Missing AuthKit dependencies"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

void __64__LACDTOLostModeProviderAKAdapter__lostModeStateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    BOOL v7 = [v5 deviceList];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __64__LACDTOLostModeProviderAKAdapter__lostModeStateWithCompletion___block_invoke_2;
    v18[3] = &unk_2653B65C0;
    id v19 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 indexOfObjectPassingTest:v18];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = +[LACError errorWithCode:-1000 debugDescription:@"Could not determine safety state. Device not found."];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
    }
    else
    {
      id v11 = [v6 deviceList];
      int v10 = [v11 objectAtIndex:v8];

      __int16 v12 = [v10 deviceRestrictionState];
      id v13 = v12;
      if (v12)
      {
        BOOL v14 = [v12 reason] != 1;
        uint64_t v15 = *(void *)(a1 + 48);
        id v16 = [[LACDTOLostModeState alloc] initWithIsInLostMode:v14 confirmed:1];
        (*(void (**)(uint64_t, LACDTOLostModeState *, void))(v15 + 16))(v15, v16, 0);
      }
      else
      {
        uint64_t v17 = *(void *)(a1 + 48);
        id v16 = +[LACError errorWithCode:-1000 debugDescription:@"Could not determine safety state. Missing value"];
        (*(void (**)(uint64_t, void, LACDTOLostModeState *))(v17 + 16))(v17, 0, v16);
      }
    }
  }
}

uint64_t __64__LACDTOLostModeProviderAKAdapter__lostModeStateWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v6 = [a2 serialNumber];
  *a4 = [v6 isEqualToString:*(void *)(a1 + 32)];

  return *a4;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_lostModeState, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *a2;
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_254F14000, log, OS_LOG_TYPE_ERROR, "%{public}@ did finish query with error: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end