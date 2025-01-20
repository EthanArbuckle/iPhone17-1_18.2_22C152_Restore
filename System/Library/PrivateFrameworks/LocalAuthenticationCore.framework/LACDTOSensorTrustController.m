@interface LACDTOSensorTrustController
- (BOOL)_isHardwareTrustError:(id)a3;
- (BOOL)canProcessRequest:(id)a3;
- (LACDTOSensorTrustController)initWithReplyQueue:(id)a3 ui:(id)a4 store:(id)a5 verifier:(id)a6 flags:(id)a7;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACDTOSensorTrustController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_ui, 0);
}

- (LACDTOSensorTrustController)initWithReplyQueue:(id)a3 ui:(id)a4 store:(id)a5 verifier:(id)a6 flags:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)LACDTOSensorTrustController;
  v16 = [(LACDTOSensorTrustController *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_ui, a4);
    objc_storeStrong((id *)&v17->_store, a5);
    objc_storeStrong((id *)&v17->_verifier, a6);
    objc_storeStrong((id *)&v17->_flags, a7);
  }

  return v17;
}

- (BOOL)canProcessRequest:(id)a3
{
  return [(LACFeatureFlagsProviderDTO *)self->_flags featureFlagDimpleKeySecureRepairEnabled];
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(LACDTOSensorTrustController *)self canProcessRequest:v8])
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke;
    v21[3] = &unk_2653B6AF0;
    id v11 = v8;
    id v22 = v11;
    id v12 = __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke((uint64_t)v21);
    [v11 updateOptions:v12];

    id v13 = LACLogDTOSensor();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_254F14000, v13, OS_LOG_TYPE_DEFAULT, "Sensor trust verification will start", (uint8_t *)&buf, 2u);
    }

    objc_initWeak(&buf, self);
    verifier = self->_verifier;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3;
    v16[3] = &unk_2653B6B18;
    objc_copyWeak(&v19, &buf);
    id v18 = v10;
    id v17 = v11;
    [(LACDTOSensorTrustVerifier *)verifier verifySensorTrustWithCompletion:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&buf);
  }
  else
  {
    id v15 = +[LACEvaluationResult resultWithNext:v8];
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

id __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) options];
  v2 = (void *)[v1 mutableCopy];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  v5 = v4;

  v6 = [NSNumber numberWithInteger:1086];
  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v6];

  v7 = [NSNumber numberWithInteger:1085];
  id v8 = [v5 objectForKeyedSubscript:v7];
  if ([v8 BOOLValue])
  {
    id v9 = [NSNumber numberWithInteger:1062];
    id v10 = [v5 objectForKeyedSubscript:v9];

    if (v10) {
      goto LABEL_9;
    }
    v7 = [NSNumber numberWithInteger:1062];
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v7];
  }
  else
  {
  }
LABEL_9:
  return v5;
}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v8 = LACLogDTOSensor();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3_cold_1((uint64_t)v6, v9);
      }

      id v10 = (void (**)(id, void *))a1[5];
      id v11 = +[LACEvaluationResult resultWithFailure:v6];
      v10[2](v10, v11);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138412290;
        id v18 = v5;
        _os_log_impl(&dword_254F14000, v9, OS_LOG_TYPE_DEFAULT, "Sensor trust verification did finish with result: %@", buf, 0xCu);
      }

      id v12 = (void *)WeakRetained[2];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4;
      v13[3] = &unk_2653B5F60;
      objc_copyWeak(&v16, a1 + 6);
      id v15 = a1[5];
      id v14 = a1[4];
      [v12 storeSensorTrustState:v5 completion:v13];

      objc_destroyWeak(&v16);
    }
  }
}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = LACLogDTOSensor();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4_cold_1((uint64_t)v3, v5);
      }

      uint64_t v6 = *(void *)(a1 + 40);
      v7 = +[LACEvaluationResult resultWithFailure:v3];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = +[LACEvaluationResult resultWithNext:*(void *)(a1 + 32)];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    }
  }
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  if (![(LACDTOSensorTrustController *)self canProcessRequest:v8]
    || ([v9 error],
        id v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v12 = [(LACDTOSensorTrustController *)self _isHardwareTrustError:v11],
        v11,
        !v12))
  {
LABEL_11:
    v10[2](v10, v9);
    goto LABEL_12;
  }
  id v13 = [v8 options];
  id v14 = [NSNumber numberWithInteger:1085];
  id v15 = [v13 objectForKey:v14];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    id v17 = LACLogDTOSensor();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v9 error];
      *(_DWORD *)id buf = 138543362;
      v36 = v18;
      _os_log_impl(&dword_254F14000, v17, OS_LOG_TYPE_DEFAULT, "Mapping unapproved sensor error %{public}@ to success on client's request", buf, 0xCu);
    }
    uint64_t v19 = +[LACEvaluationResult resultWithSuccess:MEMORY[0x263EFFA78]];
    v10[2](v10, v19);

    goto LABEL_12;
  }
  v20 = [v8 options];
  v21 = [NSNumber numberWithInteger:1039];
  id v22 = [v20 objectForKey:v21];
  int v23 = [v22 BOOLValue];

  if (v23)
  {
    v24 = LACLogDTOSensor();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_254F14000, v24, OS_LOG_TYPE_DEFAULT, "Skipping sensor trust alert on client's request", buf, 2u);
    }

    goto LABEL_11;
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke;
  v33[3] = &unk_2653B6B40;
  id v25 = v8;
  id v34 = v25;
  uint64_t v26 = __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke((uint64_t)v33);
  v27 = LACLogDTOSensor();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [NSNumber numberWithInteger:v26];
    *(_DWORD *)id buf = 138412290;
    v36 = v28;
    _os_log_impl(&dword_254F14000, v27, OS_LOG_TYPE_DEFAULT, "Sensor trust alert with id: %@ will appear.", buf, 0xCu);
  }
  ui = self->_ui;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke_8;
  v30[3] = &unk_2653B57A0;
  v32 = v10;
  id v31 = v9;
  [(LACUserInterfacePresenting *)ui presentUIForIdentifier:v26 request:v25 completion:v30];

LABEL_12:
}

uint64_t __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) payload];
  v2 = [v1 objectForKeyedSubscript:@"kLAEvaluationRequestPayloadKeyDTOEnvironment"];

  if ([v2 isStrictModeEnabled]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

void __68__LACDTOSensorTrustController_postProcessRequest_result_completion___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = LACLogDTOSensor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_254F14000, v4, OS_LOG_TYPE_DEFAULT, "Sensor trust alert did disappear (err: %@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_isHardwareTrustError:(id)a3
{
  id v3 = a3;
  if (v3) {
    BOOL v4 = +[LACError error:v3 hasCode:-1 subcode:30]
  }
      || +[LACError error:v3 hasCode:-1 subcode:31];
  else {
    BOOL v4 = 0;
  }

  return v4;
}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "Sensor trust verification failed %{public}@", (uint8_t *)&v2, 0xCu);
}

void __71__LACDTOSensorTrustController_processRequest_configuration_completion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "Sensor trust verification result could not be stored %{public}@", (uint8_t *)&v2, 0xCu);
}

@end