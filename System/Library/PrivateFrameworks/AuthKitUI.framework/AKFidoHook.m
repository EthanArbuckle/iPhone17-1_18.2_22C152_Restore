@interface AKFidoHook
- (ACAccount)account;
- (AKFidoHook)initWithAccount:(id)a3;
- (BOOL)_isUserCancelError:(id)a3;
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (void)_startFidoRegistrationWithAttributes:(id)a3 completion:(id)a4;
- (void)_startFidoVerificationWithAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setAccount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation AKFidoHook

- (AKFidoHook)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKFidoHook;
  v6 = [(AKFidoHook *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (BOOL)shouldMatchElement:(id)a3
{
  id v3 = a3;
  v4 = [v3 name];
  if ([v4 isEqualToString:@"fido:register"])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v3 name];
    char v5 = [v6 isEqualToString:@"fido:verify"];
  }
  return v5;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3 = [a3 clientInfo];
  v4 = [v3 objectForKey:@"action"];

  if ([v4 isEqualToString:@"fido:register"]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"fido:verify"];
  }

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a6;
  v11 = [v15 name];
  int v12 = [v11 isEqualToString:@"fido:register"];

  if (v12)
  {
    [(AKFidoHook *)self _startFidoRegistrationWithAttributes:v9 completion:v10];
  }
  else
  {
    v13 = [v15 name];
    int v14 = [v13 isEqualToString:@"fido:verify"];

    if (v14) {
      [(AKFidoHook *)self _startFidoVerificationWithAttributes:v9 completion:v10];
    }
  }
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [v10 clientInfo];
  v8 = [v7 objectForKey:@"action"];

  if ([v8 isEqualToString:@"fido:register"])
  {
    id v9 = [v10 clientInfo];
    [(AKFidoHook *)self _startFidoRegistrationWithAttributes:v9 completion:v6];
  }
  else
  {
    if (![v8 isEqualToString:@"fido:verify"]) {
      goto LABEL_6;
    }
    id v9 = [v10 clientInfo];
    [(AKFidoHook *)self _startFidoVerificationWithAttributes:v9 completion:v6];
  }

LABEL_6:
}

- (void)_startFidoRegistrationWithAttributes:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v25 = a4;
  id v6 = _AKLogFido();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AKFidoHook _startFidoRegistrationWithAttributes:completion:]();
  }

  v7 = _AKLogFido();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AKFidoHook _startFidoRegistrationWithAttributes:completion:]();
  }

  uint64_t v8 = [v5 objectForKeyedSubscript:@"challenge"];
  v28 = [v5 objectForKeyedSubscript:@"userHandle"];
  v27 = [v5 objectForKeyedSubscript:@"rpId"];
  v26 = [v5 objectForKeyedSubscript:@"credentialName"];
  objc_opt_class();
  id v9 = [v5 objectForKeyedSubscript:@"excludedCredentials"];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v11 = [v10 componentsSeparatedByString:@","];
  int v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v13 = [v12 localizedStringForKey:@"FIDO_DISPLAY_NAME" value:&stru_1F1EE8138 table:@"Localizable"];

  v23 = (void *)v8;
  int v14 = (void *)[objc_alloc(MEMORY[0x1E4F4F030]) initWithChallengeString:v8 relyingPartyIdentifier:v27 userIdentifierString:v28 displayName:v13 credentialName:v26 credentials:v11];
  id v15 = [v5 objectForKeyedSubscript:@"promptTitle"];
  [v14 setPromptTitle:v15];

  v16 = [v5 objectForKeyedSubscript:@"promptHeader"];
  [v14 setPromptHeader:v16];

  v17 = [v5 objectForKeyedSubscript:@"promptBody"];
  [v14 setPromptBody:v17];

  [v14 setUseAlternativeKeysIcon:1];
  v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v19 = [v18 localizedStringForKey:@"FIDO_INCORRECT_KEY_PRESENTED_MESSAGE" value:&stru_1F1EE8138 table:@"Localizable"];
  [v14 setIncorrectKeyPresentedMessage:v19];

  v20 = _AKLogFido();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[AKFidoHook _startFidoRegistrationWithAttributes:completion:](v14);
  }

  v21 = objc_alloc_init(AKFidoUIController);
  objc_initWeak(&location, self);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke;
  v29[3] = &unk_1E648F168;
  objc_copyWeak(&v31, &location);
  id v22 = v25;
  id v30 = v22;
  [(AKFidoUIController *)v21 registerFidoKeyWithContext:v14 completion:v29];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v37[7] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F95F60]);
    [WeakRetained setServerHookResponse:v8];

    id v9 = _AKLogFido();
    id v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_3();
      }
      uint64_t v28 = a1;
      id v30 = v6;

      v11 = _AKLogFido();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_2(v5, v11);
      }

      v36[0] = @"credentialID";
      int v12 = [v5 credentialID];
      v37[0] = v12;
      v36[1] = @"clientData";
      v13 = [v5 clientData];
      v37[1] = v13;
      v36[2] = @"challenge";
      int v14 = [v5 challenge];
      v37[2] = v14;
      v36[3] = @"rpId";
      id v15 = [v5 relyingPartyIdentifier];
      v37[3] = v15;
      v36[4] = @"userHandle";
      v16 = [v5 userIdentifier];
      v37[4] = v16;
      v36[5] = @"credentialName";
      v17 = [v5 credentialName];
      v36[6] = @"success";
      v37[5] = v17;
      v37[6] = &unk_1F1F03660;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:7];
      v19 = (void *)[v18 mutableCopy];

      v20 = [v5 attestationsData];
      uint64_t v21 = [v20 length];

      if (v21)
      {
        id v22 = [v5 attestationsData];
        [v19 setObject:v22 forKeyedSubscript:@"attestation"];
      }
      v23 = objc_msgSend(v19, "copy", v28, v30);
      v24 = [WeakRetained serverHookResponse];
      [v24 setAdditionalPayload:v23];

      a1 = v29;
      id v6 = v31;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_1();
      }

      if ([WeakRetained _isUserCancelError:v6])
      {
        uint64_t v25 = *MEMORY[0x1E4F95F80];
        v34[0] = *MEMORY[0x1E4F95F88];
        v34[1] = @"success";
        v35[0] = v25;
        v35[1] = &unk_1F1F03678;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
        v23 = [WeakRetained serverHookResponse];
        [v23 setAdditionalPayload:v19];
      }
      else
      {
        v32[0] = @"errorDomain";
        v19 = [v6 domain];
        v33[0] = v19;
        v32[1] = @"errorCode";
        v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
        v32[2] = @"success";
        v33[1] = v23;
        v33[2] = &unk_1F1F03678;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
        v27 = [WeakRetained serverHookResponse];
        [v27 setAdditionalPayload:v26];
      }
    }
  }
  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5 != 0, v6);
}

- (void)_startFidoVerificationWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogFido();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKFidoHook _startFidoVerificationWithAttributes:completion:]();
  }

  id v9 = _AKLogFido();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AKFidoHook _startFidoVerificationWithAttributes:completion:]();
  }

  id v10 = [v6 objectForKeyedSubscript:@"challenge"];
  v11 = [v6 objectForKeyedSubscript:@"rpId"];
  objc_opt_class();
  id v12 = [v6 objectForKeyedSubscript:@"allowedCredentials"];
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  int v14 = [v13 componentsSeparatedByString:@","];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F4F030]) initWithChallengeString:v10 relyingPartyIdentifier:v11 userIdentifierString:0 displayName:0 credentialName:0 credentials:v14];
  v16 = [v6 objectForKeyedSubscript:@"promptTitle"];
  [v15 setPromptTitle:v16];

  v17 = [v6 objectForKeyedSubscript:@"promptHeader"];
  [v15 setPromptHeader:v17];

  v18 = [v6 objectForKeyedSubscript:@"promptBody"];
  [v15 setPromptBody:v18];

  [v15 setUseAlternativeKeysIcon:1];
  v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  v20 = [v19 localizedStringForKey:@"FIDO_INCORRECT_KEY_PRESENTED_MESSAGE" value:&stru_1F1EE8138 table:@"Localizable"];
  [v15 setIncorrectKeyPresentedMessage:v20];

  uint64_t v21 = _AKLogFido();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[AKFidoHook _startFidoVerificationWithAttributes:completion:](v15);
  }

  id v22 = objc_alloc_init(AKFidoUIController);
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke;
  v24[3] = &unk_1E648F190;
  objc_copyWeak(&v26, &location);
  id v23 = v7;
  id v25 = v23;
  [(AKFidoUIController *)v22 verifyFidoKeyWithFidoContext:v15 completion:v24];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v31[8] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F95F60]);
    [WeakRetained setServerHookResponse:v8];

    id v9 = _AKLogFido();
    id v10 = v9;
    if (v5)
    {
      uint64_t v24 = a1;
      id v25 = v6;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke_cold_2();
      }

      v30[0] = @"authenticatorData";
      uint64_t v11 = [v5 authenticatorData];
      v31[0] = v11;
      v30[1] = @"signatureData";
      id v12 = [v5 signature];
      v31[1] = v12;
      v30[2] = @"credentialID";
      id v23 = [v5 credentialID];
      v31[2] = v23;
      v30[3] = @"clientData";
      id v13 = [v5 clientData];
      v31[3] = v13;
      v30[4] = @"userHandle";
      int v14 = [v5 userIdentifier];
      v31[4] = v14;
      v30[5] = @"rpId";
      id v15 = [v5 relyingPartyIdentifier];
      v31[5] = v15;
      v30[6] = @"challenge";
      v16 = [v5 challenge];
      v30[7] = @"success";
      v31[6] = v16;
      v31[7] = &unk_1F1F03660;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:8];
      v18 = [WeakRetained serverHookResponse];
      [v18 setAdditionalPayload:v17];

      v19 = (void *)v11;
      a1 = v24;
      id v6 = v25;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke_cold_1();
      }

      if ([WeakRetained _isUserCancelError:v6])
      {
        uint64_t v20 = *MEMORY[0x1E4F95F80];
        v28[0] = *MEMORY[0x1E4F95F88];
        v28[1] = @"success";
        v29[0] = v20;
        v29[1] = &unk_1F1F03678;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
        id v12 = [WeakRetained serverHookResponse];
        [v12 setAdditionalPayload:v19];
      }
      else
      {
        v26[0] = @"errorDomain";
        v19 = [v6 domain];
        v27[0] = v19;
        v26[1] = @"errorCode";
        id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
        v26[2] = @"success";
        v27[1] = v12;
        v27[2] = &unk_1F1F03678;
        uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
        id v22 = [WeakRetained serverHookResponse];
        [v22 setAdditionalPayload:v21];
      }
    }
  }
  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5 != 0, v6);
}

- (BOOL)_isUserCancelError:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "ak_isUserCancelError")) {
    char v4 = 1;
  }
  else {
    char v4 = [MEMORY[0x1E4F4F028] isFidoUserCancelError:v3];
  }

  return v4;
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_serverHookResponse, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_startFidoRegistrationWithAttributes:(void *)a1 completion:.cold.1(void *a1)
{
  v1 = [a1 incorrectKeyPresentedMessage];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1C38C1000, v2, v3, "Setting fidoContext.incorrectKeyPresentedMessage = %@", v4, v5, v6, v7, v8);
}

- (void)_startFidoRegistrationWithAttributes:completion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_DEBUG, "Fido registration attributes:\n%@", v1, 0xCu);
}

- (void)_startFidoRegistrationWithAttributes:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Fido hook requested to register the key.", v2, v3, v4, v5, v6);
}

void __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_ERROR, "Fido registration failed: %@", v1, 0xCu);
}

void __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 credentialID];
  uint64_t v5 = [a1 attestationsData];
  uint8_t v6 = [a1 clientData];
  int v7 = 138412802;
  uint8_t v8 = v4;
  __int16 v9 = 2112;
  id v10 = v5;
  __int16 v11 = 2112;
  id v12 = v6;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Fido registration succeeded with CredentialID: %@\nAttestationsData: %@\nClientData: %@", (uint8_t *)&v7, 0x20u);
}

void __62__AKFidoHook__startFidoRegistrationWithAttributes_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Fido registration was a success.", v2, v3, v4, v5, v6);
}

- (void)_startFidoVerificationWithAttributes:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 incorrectKeyPresentedMessage];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1C38C1000, v2, v3, "Setting fidoContext.incorrectKeyPresentedMessage = %@", v4, v5, v6, v7, v8);
}

- (void)_startFidoVerificationWithAttributes:completion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_DEBUG, "Fido verification attributes:\n%@", v1, 0xCu);
}

- (void)_startFidoVerificationWithAttributes:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Fido hook requested to verify the key.", v2, v3, v4, v5, v6);
}

void __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1C38C1000, v0, OS_LOG_TYPE_ERROR, "Fido verification failed: %@", v1, 0xCu);
}

void __62__AKFidoHook__startFidoVerificationWithAttributes_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Fido verification was a success.", v2, v3, v4, v5, v6);
}

@end