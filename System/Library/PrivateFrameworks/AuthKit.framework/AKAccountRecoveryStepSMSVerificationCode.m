@interface AKAccountRecoveryStepSMSVerificationCode
- (BOOL)canProcessResponse:(id)a3;
- (id)_promptForSMSCode;
- (void)_beginSMSCodeVerificationWithResponse:(id)a3 model:(id)a4 completion:(id)a5;
- (void)_verifySMSCodeWithData:(id)a3 model:(id)a4 completion:(id)a5;
@end

@implementation AKAccountRecoveryStepSMSVerificationCode

- (BOOL)canProcessResponse:(id)a3
{
  v3 = [a3 data];
  v4 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"navigationBar" data:v3 error:0];

  v5 = [v4 firstObject];
  v6 = [v5 objectForKeyedSubscript:@"title"];
  v7 = [v6 lowercaseString];
  char v8 = [v7 containsString:@"verification code"];

  return v8;
}

- (void)_beginSMSCodeVerificationWithResponse:(id)a3 model:(id)a4 completion:(id)a5
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 data];
  v12 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"pinView" data:v11 error:0];

  v13 = [v8 data];
  v14 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"serverInfo" data:v13 error:0];

  if ([v12 count] == 1 && objc_msgSend(v14, "count") == 1)
  {
    v31 = v9;
    v15 = [v12 firstObject];
    v16 = [v14 firstObject];
    v17 = [v15 objectForKey:@"id"];
    int v18 = [v17 isEqualToString:@"code"];

    if (!v18)
    {
      v26 = _AKLogSystem();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[AKAccountRecoveryStepSMSVerificationCode _beginSMSCodeVerificationWithResponse:model:completion:]();
      }

      id v9 = v31;
      if (!v10) {
        goto LABEL_27;
      }
      v23 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
      (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v23);
LABEL_26:

LABEL_27:
      goto LABEL_28;
    }
    v30 = v16;
    v19 = [v31 cliUtilities];
    v20 = [v31 configuration];
    v21 = [v8 httpResponse];
    [v19 updateConfiguration:v20 fromXMLAttributes:v15 response:v21];

    v22 = [v31 configuration];

    if (!v22)
    {
      v27 = _AKLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[AKAccountRecoveryStepSMSVerificationCode _beginSMSCodeVerificationWithResponse:model:completion:]();
      }

      if (v10)
      {
        v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKGenericError" code:-17003 userInfo:0];
        (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v28);
      }
      id v9 = v31;
      goto LABEL_28;
    }
    v23 = [(AKAccountRecoveryStepSMSVerificationCode *)self _promptForSMSCode];
    if ([v23 length])
    {
      v32[0] = @"serverInfo";
      v32[1] = @"code";
      v16 = v30;
      v33[0] = v30;
      v33[1] = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
      [(AKAccountRecoveryStepSMSVerificationCode *)self _verifySMSCodeWithData:v24 model:v31 completion:v10];
    }
    else
    {
      v29 = _AKLogSystem();
      v16 = v30;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[AKAccountRecoveryStepSMSVerificationCode _beginSMSCodeVerificationWithResponse:model:completion:]();
      }

      if (!v10) {
        goto LABEL_25;
      }
      v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKGenericError" code:-17003 userInfo:0];
      (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v24);
    }

LABEL_25:
    id v9 = v31;
    goto LABEL_26;
  }
  v25 = _AKLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountRecoveryStepSMSVerificationCode _beginSMSCodeVerificationWithResponse:model:completion:]();
  }

  if (v10)
  {
    v15 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
    (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v15);
LABEL_28:
  }
}

- (void)_verifySMSCodeWithData:(id)a3 model:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v8 configuration];
  v11 = [v10 request];
  v12 = (void *)[v11 mutableCopy];

  v13 = [v8 cliUtilities];
  [v13 signXMLRequest:v12 withPostbackDictionary:v9];

  v14 = [v10 resourceLoadDelegate];
  [v14 signRequest:v12];

  v15 = [v8 cliUtilities];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__AKAccountRecoveryStepSMSVerificationCode__verifySMSCodeWithData_model_completion___block_invoke;
  v17[3] = &unk_1E575F4C0;
  id v18 = v7;
  id v16 = v7;
  [v15 beginDataTaskWithRequest:v12 completionHandler:v17];
}

uint64_t __84__AKAccountRecoveryStepSMSVerificationCode__verifySMSCodeWithData_model_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void))(result + 16))(result, 1, a2, a3, 0, 0);
  }
  return result;
}

- (id)_promptForSMSCode
{
  AKPrint(@"Enter verification code: ", (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);

  return AKReadLine(1024);
}

- (void)_beginSMSCodeVerificationWithResponse:model:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "requestConfiguration is nil", v2, v3, v4, v5, v6);
}

- (void)_beginSMSCodeVerificationWithResponse:model:completion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Failed sms verification step with unexpected data", v2, v3, v4, v5, v6);
}

@end