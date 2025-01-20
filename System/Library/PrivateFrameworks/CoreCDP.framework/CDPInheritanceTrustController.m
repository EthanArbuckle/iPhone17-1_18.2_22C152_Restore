@interface CDPInheritanceTrustController
- (BOOL)isInheritanceAccessKeyValid:(id)a3;
- (void)checkInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 completion:(id)a5;
- (void)createInheritanceKeyWithContext:(id)a3 completion:(id)a4;
- (void)deleteInheritanceAccessKeyWithContext:(id)a3 completion:(id)a4;
- (void)recoverOctagonWithContext:(id)a3 inheritanceKey:(id)a4 completion:(id)a5;
- (void)recreateInheritanceKeyWithContext:(id)a3 newOTPeerID:(id)a4 inheritanceKey:(id)a5 completion:(id)a6;
- (void)validateAccessKey:(id)a3 withContext:(id)a4 completion:(id)a5;
@end

@implementation CDPInheritanceTrustController

- (void)createInheritanceKeyWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 cliqueConfiguration];
  v8 = objc_alloc_init(CDPAccount);
  v9 = [(CDPAccount *)v8 primaryAccountDSID];
  BOOL v10 = +[CDPAccount isICDPEnabledForDSID:v9];

  v11 = _CDPLogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12) {
      -[CDPInheritanceTrustController createInheritanceKeyWithContext:completion:](v5);
    }

    v13 = (void *)MEMORY[0x263F16D30];
    v14 = [v5 beneficiaryIdentifier];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __76__CDPInheritanceTrustController_createInheritanceKeyWithContext_completion___block_invoke;
    v21[3] = &unk_264317200;
    v15 = &v22;
    id v22 = v6;
    id v16 = v6;
    [v13 createInheritanceKey:v7 uuid:v14 reply:v21];
  }
  else
  {
    if (v12) {
      -[CDPInheritanceTrustController createInheritanceKeyWithContext:completion:](v5);
    }

    v17 = (void *)MEMORY[0x263F16D30];
    v14 = [v5 beneficiaryIdentifier];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __76__CDPInheritanceTrustController_createInheritanceKeyWithContext_completion___block_invoke_18;
    v19[3] = &unk_264317200;
    v15 = &v20;
    id v20 = v6;
    id v18 = v6;
    [v17 generateInheritanceKey:v7 uuid:v14 reply:v19];
  }
}

void __76__CDPInheritanceTrustController_createInheritanceKeyWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 accessCode];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void __76__CDPInheritanceTrustController_createInheritanceKeyWithContext_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 accessCode];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)recoverOctagonWithContext:(id)a3 inheritanceKey:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x263F5B748]) initFromAccessKey:v8];
  v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CDPInheritanceTrustController recoverOctagonWithContext:inheritanceKey:completion:](v8);
  }

  BOOL v12 = _CDPLogSystem();
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CDPInheritanceTrustController recoverOctagonWithContext:inheritanceKey:completion:]();
    }

    v14 = (void *)MEMORY[0x263F16D30];
    v15 = [v7 cliqueConfiguration];
    [v14 recoverOctagonUsingInheritanceKey:v15 inheritanceKey:v10 reply:v9];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CDPInheritanceTrustController recoverOctagonWithContext:inheritanceKey:completion:]();
    }

    v15 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5216);
    v9[2](v9, v15);
  }
}

- (BOOL)isInheritanceAccessKeyValid:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F5B748];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initFromAccessKey:v4];

  return v5 != 0;
}

- (void)deleteInheritanceAccessKeyWithContext:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F16D30];
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 cliqueConfiguration];
  id v8 = [v7 beneficiaryIdentifier];

  [v5 removeInheritanceKey:v9 inheritanceKeyUUID:v8 reply:v6];
}

- (void)validateAccessKey:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [v8 dsid];
  if (v10)
  {

LABEL_4:
    BOOL v12 = [v8 cliqueConfiguration];
    v13 = (void *)[objc_alloc(MEMORY[0x263F5B748]) initFromAccessKey:v7];
    v14 = (void *)MEMORY[0x263F16D30];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke;
    v16[3] = &unk_2643171A8;
    id v18 = v9;
    id v17 = v7;
    [v14 preflightRecoverOctagonUsingInheritanceKey:v12 inheritanceKey:v13 reply:v16];

    goto LABEL_5;
  }
  v11 = [v8 altDSID];

  if (v11) {
    goto LABEL_4;
  }
  v15 = _CDPLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    -[CDPCustodianRecoveryKeyController validateRecoveryKey:withContext:completion:]();
  }

  BOOL v12 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5003);
  (*((void (**)(id, void *))v9 + 2))(v9, v12);
LABEL_5:
}

void __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _CDPLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)recreateInheritanceKeyWithContext:(id)a3 newOTPeerID:(id)a4 inheritanceKey:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[CDPInheritanceTrustController recreateInheritanceKeyWithContext:newOTPeerID:inheritanceKey:completion:]();
  }

  v14 = [v9 dsid];
  if (v14)
  {

LABEL_6:
    id v16 = [v9 cliqueConfiguration];
    id v17 = (void *)[objc_alloc(MEMORY[0x263F5B748]) initFromAccessKey:v11];
    id v18 = (void *)MEMORY[0x263F16D30];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __105__CDPInheritanceTrustController_recreateInheritanceKeyWithContext_newOTPeerID_inheritanceKey_completion___block_invoke;
    v20[3] = &unk_264317200;
    id v21 = v12;
    [v18 recreateInheritanceKey:v16 uuid:v10 oldIK:v17 reply:v20];

LABEL_7:
    goto LABEL_8;
  }
  v15 = [v9 altDSID];

  if (v15) {
    goto LABEL_6;
  }
  v19 = _CDPLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    -[CDPInheritanceTrustController recreateInheritanceKeyWithContext:newOTPeerID:inheritanceKey:completion:]();
  }

  if (v12)
  {
    id v16 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5003);
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v16);
    goto LABEL_7;
  }
LABEL_8:
}

void __105__CDPInheritanceTrustController_recreateInheritanceKeyWithContext_newOTPeerID_inheritanceKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __105__CDPInheritanceTrustController_recreateInheritanceKeyWithContext_newOTPeerID_inheritanceKey_completion___block_invoke_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      id v10 = [v5 accessCode];
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
    }
  }
}

- (void)checkInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CDPInheritanceTrustController checkInheritanceKey:inheritanceKeyUUID:completion:]();
  }

  id v11 = [v7 dsid];
  if (v11)
  {

LABEL_6:
    v13 = [v7 cliqueConfiguration];
    v14 = (void *)MEMORY[0x263F16D30];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke;
    v16[3] = &unk_2643171D0;
    id v17 = v9;
    [v14 checkInheritanceKey:v13 inheritanceKeyUUID:v8 reply:v16];

    goto LABEL_7;
  }
  id v12 = [v7 altDSID];

  if (v12) {
    goto LABEL_6;
  }
  v15 = _CDPLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    -[CDPCustodianRecoveryKeyController validateRecoveryKey:withContext:completion:]();
  }

  v13 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5003);
  (*((void (**)(id, void *))v9 + 2))(v9, v13);
LABEL_7:
}

void __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_3();
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_9;
  }
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v8) {
      __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_1();
    }
    goto LABEL_8;
  }
  if (v8) {
    __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_2();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 0);
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

LABEL_9:
}

- (void)createInheritanceKeyWithContext:(void *)a1 completion:.cold.1(void *a1)
{
  v1 = [a1 beneficiaryIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_2182AE000, v2, v3, "Generating Inheritance access key for CDP account. Beneficiary: %@", v4, v5, v6, v7, v8);
}

- (void)createInheritanceKeyWithContext:(void *)a1 completion:.cold.2(void *a1)
{
  v1 = [a1 beneficiaryIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_2182AE000, v2, v3, "Generating Inheritance access key for non-CDP account - not saved on OT. Beneficiary: %@", v4, v5, v6, v7, v8);
}

- (void)recoverOctagonWithContext:inheritanceKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2182AE000, v0, OS_LOG_TYPE_ERROR, "Unable to create the access key without access string or data.", v1, 2u);
}

- (void)recoverOctagonWithContext:inheritanceKey:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Attempting to recover Octagon with the inheritance key.", v2, v3, v4, v5, v6);
}

- (void)recoverOctagonWithContext:(void *)a1 inheritanceKey:completion:.cold.3(void *a1)
{
  uint64_t v1 = [a1 beneficiaryID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_2182AE000, v2, v3, "Creating the access key for beneficiary: %@", v4, v5, v6, v7, v8);
}

void __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) beneficiaryID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_2182AE000, v2, v3, "Inheritance key valid for beneficiary: %@", v4, v5, v6, v7, v8);
}

void __74__CDPInheritanceTrustController_validateAccessKey_withContext_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Error validating inheritance key: %@", v2, v3, v4, v5, v6);
}

- (void)recreateInheritanceKeyWithContext:newOTPeerID:inheritanceKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_2182AE000, v0, v1, "CDPCustodianController init is missing required dsid. Unable to recreate inheritance keys", v2, v3, v4, v5, v6);
}

- (void)recreateInheritanceKeyWithContext:newOTPeerID:inheritanceKey:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "recreateInheritanceKeyWithContext called", v2, v3, v4, v5, v6);
}

void __105__CDPInheritanceTrustController_recreateInheritanceKeyWithContext_newOTPeerID_inheritanceKey_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Error recreating inheritance key: %@", v2, v3, v4, v5, v6);
}

- (void)checkInheritanceKey:inheritanceKeyUUID:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "checkInheritanceKey called", v2, v3, v4, v5, v6);
}

void __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Inheritance key for beneficiary exists", v2, v3, v4, v5, v6);
}

void __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "Inheritance key for beneficiary does not exist", v2, v3, v4, v5, v6);
}

void __83__CDPInheritanceTrustController_checkInheritanceKey_inheritanceKeyUUID_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Error checking inheritance key: %@", v2, v3, v4, v5, v6);
}

@end