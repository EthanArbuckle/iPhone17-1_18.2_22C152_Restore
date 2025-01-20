@interface LACDTOSensorTrustStateProvider
- (LACDTOSensorTrustStateProvider)initWithStore:(id)a3;
- (void)checkIsSensorTrustedWithCompletion:(id)a3;
- (void)fetchSensorTrustStateWithCompletion:(id)a3;
@end

@implementation LACDTOSensorTrustStateProvider

- (LACDTOSensorTrustStateProvider)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOSensorTrustStateProvider;
  v6 = [(LACDTOSensorTrustStateProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (void)checkIsSensorTrustedWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__LACDTOSensorTrustStateProvider_checkIsSensorTrustedWithCompletion___block_invoke;
  v6[3] = &unk_2653B6420;
  id v7 = v4;
  id v5 = v4;
  [(LACDTOSensorTrustStateProvider *)self fetchSensorTrustStateWithCompletion:v6];
}

void __69__LACDTOSensorTrustStateProvider_checkIsSensorTrustedWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v6 = [a2 isDisapproved] ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
}

- (void)fetchSensorTrustStateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  store = self->_store;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__LACDTOSensorTrustStateProvider_fetchSensorTrustStateWithCompletion___block_invoke;
  v7[3] = &unk_2653B57C8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(LACDTOKVStore *)store valueForKey:5 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__LACDTOSensorTrustStateProvider_fetchSensorTrustStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v9 = (void *)*((void *)WeakRetained + 1);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __70__LACDTOSensorTrustStateProvider_fetchSensorTrustStateWithCompletion___block_invoke_2;
      v10[3] = &unk_2653B6448;
      objc_copyWeak(&v13, (id *)(a1 + 40));
      id v12 = *(id *)(a1 + 32);
      id v11 = v5;
      [v9 valueForKey:6 completion:v10];

      objc_destroyWeak(&v13);
    }
  }
}

void __70__LACDTOSensorTrustStateProvider_fetchSensorTrustStateWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v7 = objc_alloc_init(LACDTOMutableSensorTrustState);
      id v8 = [*(id *)(a1 + 32) data];
      [(LACDTOMutableSensorTrustState *)v7 setInstalledSensorID:v8];

      id v9 = [v10 data];
      [(LACDTOMutableSensorTrustState *)v7 setTrustedSensorID:v9];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void).cxx_destruct
{
}

@end