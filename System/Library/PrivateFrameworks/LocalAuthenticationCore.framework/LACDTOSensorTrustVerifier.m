@interface LACDTOSensorTrustVerifier
- (LACDTOSensorTrustVerifier)initWithTrustStateProvider:(id)a3 featureStateProvider:(id)a4 repairStateProvider:(id)a5;
- (void)verifySensorTrustWithCompletion:(id)a3;
@end

@implementation LACDTOSensorTrustVerifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairStateProvider, 0);
  objc_storeStrong((id *)&self->_featureStateProvider, 0);
  objc_storeStrong((id *)&self->_trustStateProvider, 0);
}

- (LACDTOSensorTrustVerifier)initWithTrustStateProvider:(id)a3 featureStateProvider:(id)a4 repairStateProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOSensorTrustVerifier;
  v12 = [(LACDTOSensorTrustVerifier *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_trustStateProvider, a3);
    objc_storeStrong((id *)&v13->_featureStateProvider, a4);
    objc_storeStrong((id *)&v13->_repairStateProvider, a5);
  }

  return v13;
}

- (void)verifySensorTrustWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(LACDTOSensorTrustVerifyService);
  featureStateProvider = self->_featureStateProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke;
  v9[3] = &unk_2653B60C0;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  v8 = v5;
  id v10 = v8;
  [(LACDTOFeatureStateProviding *)featureStateProvider fetchStateWithCompletion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((void *)WeakRetained + 1);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_2;
    v7[3] = &unk_2653B6098;
    objc_copyWeak(&v11, a1 + 6);
    id v10 = a1[5];
    id v8 = a1[4];
    id v9 = v3;
    [v6 fetchSensorTrustStateWithCompletion:v7];

    objc_destroyWeak(&v11);
  }
}

void __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = (void (*)(void))*((void *)a1[6] + 2);
LABEL_9:
      v8();
      goto LABEL_10;
    }
    if (([a1[4] shouldVerifySensorTrustWithFeatureState:a1[5] trustState:v5] & 1) == 0)
    {
      id v10 = LACLogDTOSensor();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_254F14000, v10, OS_LOG_TYPE_DEFAULT, "Skipping redundant repair checks", buf, 2u);
      }

      id v8 = (void (*)(void))*((void *)a1[6] + 2);
      goto LABEL_9;
    }
    id v9 = (void *)WeakRetained[3];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_1;
    v11[3] = &unk_2653B6070;
    objc_copyWeak(&v16, a1 + 7);
    id v15 = a1[6];
    id v12 = a1[4];
    id v13 = a1[5];
    id v14 = v5;
    [v9 fetchRepairStateWithCompletion:v11];

    objc_destroyWeak(&v16);
  }
LABEL_10:
}

void __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_1(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v12 = *MEMORY[0x263F08608];
      v13[0] = v6;
      id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v9 = +[LACError errorWithCode:-1 subcode:31 userInfo:v8];

      id v10 = LACLogDTOSensor();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_1_cold_1((uint64_t)v6, (uint64_t)v9, v10);
      }

      id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      id v9 = [*(id *)(a1 + 32) verifySensorTrustWithFeatureState:*(void *)(a1 + 40) trustState:*(void *)(a1 + 48) repairState:v5];
      id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v11();
  }
}

void __61__LACDTOSensorTrustVerifier_verifySensorTrustWithCompletion___block_invoke_1_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_254F14000, log, OS_LOG_TYPE_ERROR, "Mapping %{public}@ into %{public}@", (uint8_t *)&v3, 0x16u);
}

@end