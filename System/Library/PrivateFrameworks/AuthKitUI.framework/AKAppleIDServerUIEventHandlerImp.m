@interface AKAppleIDServerUIEventHandlerImp
- (void)fetchUserInformationForAltDSID:(id)a3 completion:(id)a4;
- (void)postCDPFollowUpForError:(id)a3;
- (void)reauthenticateWithContext:(id)a3 withCompletion:(id)a4;
- (void)startCDPRepairWithContext:(id)a3 withAdditionalData:(id)a4 completion:(id)a5;
- (void)updateAccountUsernameForAltDSID:(id)a3 withHarvestedData:(id)a4;
- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forContext:(id)a4 withAuthController:(id)a5 completion:(id)a6;
@end

@implementation AKAppleIDServerUIEventHandlerImp

- (void)reauthenticateWithContext:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDServerUIEventHandlerImp reauthenticateWithContext:withCompletion:]();
  }

  v8 = objc_alloc_init(AKAppleIDAuthenticationInAppContext);
  id v9 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  v10 = [v6 username];
  [(AKAppleIDAuthenticationInAppContext *)v8 setUsername:v10];

  v11 = [v6 altDSID];
  [(AKAppleIDAuthenticationInAppContext *)v8 setAltDSID:v11];

  [(AKAppleIDAuthenticationInAppContext *)v8 setIsUsernameEditable:0];
  v12 = [v6 presentingViewController];

  [(AKAppleIDAuthenticationInAppContext *)v8 setPresentingViewController:v12];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__AKAppleIDServerUIEventHandlerImp_reauthenticateWithContext_withCompletion___block_invoke;
  v14[3] = &unk_1E648F4C0;
  id v15 = v5;
  id v13 = v5;
  [v9 authenticateWithContext:v8 completion:v14];
}

uint64_t __77__AKAppleIDServerUIEventHandlerImp_reauthenticateWithContext_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchUserInformationForAltDSID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDServerUIEventHandlerImp fetchUserInformationForAltDSID:completion:]();
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__AKAppleIDServerUIEventHandlerImp_fetchUserInformationForAltDSID_completion___block_invoke;
  v10[3] = &unk_1E648F4E8;
  id v11 = v5;
  id v9 = v5;
  [v8 getUserInformationForAltDSID:v6 completion:v10];
}

uint64_t __78__AKAppleIDServerUIEventHandlerImp_fetchUserInformationForAltDSID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateAccountUsernameForAltDSID:(id)a3 withHarvestedData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDServerUIEventHandlerImp updateAccountUsernameForAltDSID:withHarvestedData:]((uint64_t)v5, v7);
  }

  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4EE10]];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F4EF40] sharedInstance];
    [v9 updateUsername:v8 forAccountsWithAltDSID:v5];
  }
  else
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1C38C1000, v9, OS_LOG_TYPE_DEFAULT, "CFU flow completed without updated username", v10, 2u);
    }
  }
}

- (void)startCDPRepairWithContext:(id)a3 withAdditionalData:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__AKAppleIDServerUIEventHandlerImp_startCDPRepairWithContext_withAdditionalData_completion___block_invoke;
  block[3] = &unk_1E648F510;
  id v14 = v8;
  id v15 = v7;
  id v16 = v9;
  id v10 = v9;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __92__AKAppleIDServerUIEventHandlerImp_startCDPRepairWithContext_withAdditionalData_completion___block_invoke(uint64_t a1)
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __92__AKAppleIDServerUIEventHandlerImp_startCDPRepairWithContext_withAdditionalData_completion___block_invoke_cold_1();
  }

  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F4EDF0]];
  v4 = (void *)MEMORY[0x1E4F4EFF0];
  id v5 = [*(id *)(a1 + 40) altDSID];
  id v6 = [v4 contextForAltDSID:v5];

  if (v6)
  {
    [v6 setPassword:v3];
    id v7 = [MEMORY[0x1E4F4EFF0] stateControllerWithContext:v6];
    id v8 = (void *)MEMORY[0x1E4F4EFF0];
    id v9 = [*(id *)(a1 + 40) presentingViewController];
    id v10 = [v8 cdpUIControllerWithPresentingViewController:v9];

    [v7 setUiProvider:v10];
    [v7 repairCloudDataProtectionStateWithCompletion:*(void *)(a1 + 48)];

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7114);
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v7);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)updateStateWithExternalAuthenticationResponse:(id)a3 forContext:(id)a4 withAuthController:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDServerUIEventHandlerImp updateStateWithExternalAuthenticationResponse:forContext:withAuthController:completion:]();
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  [v14 _updateWithValuesFromContext:v11];

  [v14 setAnticipateEscrowAttempt:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __123__AKAppleIDServerUIEventHandlerImp_updateStateWithExternalAuthenticationResponse_forContext_withAuthController_completion___block_invoke;
  v16[3] = &unk_1E648F538;
  id v17 = v9;
  id v15 = v9;
  [v10 updateStateWithExternalAuthenticationResponse:v12 forContext:v14 completion:v16];
}

uint64_t __123__AKAppleIDServerUIEventHandlerImp_updateStateWithExternalAuthenticationResponse_forContext_withAuthController_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)postCDPFollowUpForError:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F4EFF0] followUpRepairContext];
  [v4 setRepairType:2];
  id v5 = [MEMORY[0x1E4F4EFF0] followUpController];
  [v5 postFollowUpWithContext:v4 error:0];

  id v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDServerUIEventHandlerImp postCDPFollowUpForError:]((uint64_t)v3, v6);
  }
}

- (void)reauthenticateWithContext:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Server UI starting to reauthenticate...", v2, v3, v4, v5, v6);
}

- (void)fetchUserInformationForAltDSID:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Server UI to fetch user information", v2, v3, v4, v5, v6);
}

- (void)updateAccountUsernameForAltDSID:(uint64_t)a1 withHarvestedData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Updating Account username with AltDSID: %@", (uint8_t *)&v2, 0xCu);
}

void __92__AKAppleIDServerUIEventHandlerImp_startCDPRepairWithContext_withAdditionalData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Server UI Starting iCDP repair...", v2, v3, v4, v5, v6);
}

- (void)updateStateWithExternalAuthenticationResponse:forContext:withAuthController:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Update state with external authentication response", v2, v3, v4, v5, v6);
}

- (void)postCDPFollowUpForError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "Posted CDP repair follow up in response to error: %@", (uint8_t *)&v2, 0xCu);
}

@end