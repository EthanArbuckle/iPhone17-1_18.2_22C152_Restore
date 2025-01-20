@interface LACDTOLocationProviderKVSAdapter
- (LACDTOLocationProviderKVSAdapter)initWithKVStore:(id)a3;
- (NSString)description;
- (void)checkIsInFamiliarLocationWithCompletion:(id)a3;
@end

@implementation LACDTOLocationProviderKVSAdapter

- (LACDTOLocationProviderKVSAdapter)initWithKVStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOLocationProviderKVSAdapter;
  v6 = [(LACDTOLocationProviderKVSAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_kvStore, a3);
  }

  return v7;
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = LACLogDTOLostMode();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  kvStore = self->_kvStore;
  v7 = __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2;
  v9[3] = &unk_2653B57C8;
  objc_copyWeak(&v11, (id *)buf);
  id v8 = v4;
  id v10 = v8;
  [(LACDTOKVStore *)kvStore processReadRequest:v7 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

LACDTOMutableKVStoreReadRequest *__76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke()
{
  v0 = [[LACDTOMutableKVStoreReadRequest alloc] initWithKey:1];
  [(LACDTOMutableKVStoreReadRequest *)v0 setBypassEntitlements:1];
  return v0;
}

void __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = LACLogDTOLocation();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2_cold_1((uint64_t)WeakRetained, (uint64_t)v6, v8);
      }

      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = +[LACDTOLocationState nullInstance];
      (*(void (**)(uint64_t, LACDTOLocationState *))(v9 + 16))(v9, v10);
    }
    else
    {
      id v11 = LACLogDTOLostMode();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = WeakRetained;
        _os_log_impl(&dword_254F14000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v12 = [v5 BOOLValue];
      uint64_t v13 = *(void *)(a1 + 32);
      id v10 = [[LACDTOLocationState alloc] initWithRawValue:v12 confirmed:0];
      (*(void (**)(uint64_t, LACDTOLocationState *))(v13 + 16))(v13, v10);
    }
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self];
}

- (void).cxx_destruct
{
}

void __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_254F14000, log, OS_LOG_TYPE_ERROR, "%{public}@ did finish query with error: (%{public}@)", (uint8_t *)&v3, 0x16u);
}

@end