@interface CDPCustodianRecoveryController
- (CDPCustodianRecoveryController)initWithContext:(id)a3;
- (void)_fetchRecoveryInfoWithCompletion:(id)a3;
- (void)startRecoverySessionWithCompletion:(id)a3;
- (void)validateRecoveryCode:(id)a3 withCompletion:(id)a4;
@end

@implementation CDPCustodianRecoveryController

- (CDPCustodianRecoveryController)initWithContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDPCustodianRecoveryController;
  v6 = [(CDPCustodianRecoveryController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = (AACustodianController *)objc_alloc_init(MEMORY[0x263F257E8]);
    custodianController = v7->_custodianController;
    v7->_custodianController = v8;
  }
  return v7;
}

- (void)startRecoverySessionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F257F8]);
  v6 = [(CDPContext *)self->_context appleID];
  [v5 setOwnerAppleID:v6];

  objc_initWeak(&location, self);
  v7 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_context eventName:@"com.apple.corecdp.recoveryContact.owner.createSession" category:0x26C984850];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__CDPCustodianRecoveryController_startRecoverySessionWithCompletion___block_invoke;
  v16[3] = &unk_2643175C8;
  id v8 = v7;
  id v17 = v8;
  id v9 = v4;
  id v18 = v9;
  v10 = (void *)MEMORY[0x21D4671C0](v16);
  custodianController = self->_custodianController;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__CDPCustodianRecoveryController_startRecoverySessionWithCompletion___block_invoke_2;
  v13[3] = &unk_2643175F0;
  objc_copyWeak(&v15, &location);
  id v12 = v10;
  id v14 = v12;
  [(AACustodianController *)custodianController startCustodianRecoveryWithContext:v5 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __69__CDPCustodianRecoveryController_startRecoverySessionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  uint64_t v7 = v6;
  id v8 = [NSNumber numberWithBool:v7];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"didSucceed"];

  [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v5];
  id v9 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
  [v9 sendEvent:*(void *)(a1 + 32)];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v11, v5);
  }
}

void __69__CDPCustodianRecoveryController_startRecoverySessionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = _CDPLogSystem();
    uint64_t v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "Successfuly obtained custodian recovery session: %@", (uint8_t *)&v12, 0xCu);
      }

      objc_storeStrong(WeakRetained + 2, a2);
      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __69__CDPCustodianRecoveryController_startRecoverySessionWithCompletion___block_invoke_2_cold_1((uint64_t)v7, v10);
      }

      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v11();
  }
}

- (void)validateRecoveryCode:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F257F8]);
  [v8 setRecoverySessionID:self->_recoverySession];
  [v8 setRecoveryCode:v6];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(CDPContext *)self->_context telemetryFlowID];
    [v8 setTelemetryFlowID:v9];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [(CDPContext *)self->_context altDSID];
    [v8 setAltDSID:v10];
  }
  id v11 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_context eventName:@"com.apple.corecdp.recoveryContact.owner.validateCode" category:0x26C984850];
  objc_initWeak(&location, self);
  custodianController = self->_custodianController;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__CDPCustodianRecoveryController_validateRecoveryCode_withCompletion___block_invoke;
  v15[3] = &unk_264317618;
  id v13 = v11;
  id v16 = v13;
  objc_copyWeak(&v18, &location);
  id v14 = v7;
  id v17 = v14;
  [(AACustodianController *)custodianController validateCustodianRecoveryCodeWithContext:v8 completion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __70__CDPCustodianRecoveryController_validateRecoveryCode_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = [NSNumber numberWithBool:v9];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"didSucceed"];

  [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v7];
  id v11 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
  [v11 sendEvent:*(void *)(a1 + 32)];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5
    && ([v5 custodianUUID], id v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    id v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v5 custodianUUID];
      id v16 = [v15 UUIDString];
      int v21 = 138412290;
      v22 = v16;
      _os_log_impl(&dword_2182AE000, v14, OS_LOG_TYPE_DEFAULT, "Successfuly validated custodian recovery code for custodian with UUID: %@", (uint8_t *)&v21, 0xCu);
    }
    id v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __70__CDPCustodianRecoveryController_validateRecoveryCode_withCompletion___block_invoke_cold_1(v17);
    }

    [WeakRetained _fetchRecoveryInfoWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    id v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v5 custodianUUID];
      v20 = [v19 UUIDString];
      int v21 = 138412546;
      v22 = v20;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_2182AE000, v18, OS_LOG_TYPE_DEFAULT, "Validation of custodian recovery code for custodian with UUID: %@ failed with error: %@", (uint8_t *)&v21, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_fetchRecoveryInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_context eventName:@"com.apple.corecdp.recoveryContact.owner.fetchCustodianRecoveryInfo" category:0x26C984850];
  recoverySession = self->_recoverySession;
  custodianController = self->_custodianController;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__CDPCustodianRecoveryController__fetchRecoveryInfoWithCompletion___block_invoke;
  v10[3] = &unk_264317640;
  id v11 = v5;
  int v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v5;
  [(AACustodianController *)custodianController fetchCustodianRecoveryKeysWithSessionID:recoverySession completion:v10];
}

void __67__CDPCustodianRecoveryController__fetchRecoveryInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = [NSNumber numberWithBool:v9];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"didSucceed"];

  [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v7];
  id v11 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
  [v11 sendEvent:*(void *)(a1 + 32)];

  int v12 = _CDPLogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v13)
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 16);
      int v23 = 138412290;
      uint64_t v24 = v14;
      _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "Successfuly obtained recovery keys for sessionID: %@", (uint8_t *)&v23, 0xCu);
    }

    char v15 = objc_opt_respondsToSelector();
    id v16 = [CDPCustodianRecoveryInfo alloc];
    id v17 = [v5 wrappedRKC];
    id v18 = [v5 wrappingKey];
    v19 = [v5 custodianUUID];
    if (v15)
    {
      v20 = [v5 recordBuildVersion];
      int v21 = [(CDPCustodianRecoveryInfo *)v16 initWithWrappedRKC:v17 wrappingKey:v18 custodianUUID:v19 recordBuildVersion:v20];
    }
    else
    {
      int v21 = [(CDPCustodianRecoveryInfo *)v16 initWithWrappedRKC:v17 wrappingKey:v18 custodianUUID:v19];
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v13)
    {
      uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 16);
      int v23 = 138412546;
      uint64_t v24 = v22;
      __int16 v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_2182AE000, v12, OS_LOG_TYPE_DEFAULT, "Failed to fetch recovery keys for sessionID: %@ with error: %@", (uint8_t *)&v23, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custodianController, 0);
  objc_storeStrong((id *)&self->_recoverySession, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

void __69__CDPCustodianRecoveryController_startRecoverySessionWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain recoverySession with error: %@", (uint8_t *)&v2, 0xCu);
}

void __70__CDPCustodianRecoveryController_validateRecoveryCode_withCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "Attempting to fetch custodian recovery keys", v1, 2u);
}

@end