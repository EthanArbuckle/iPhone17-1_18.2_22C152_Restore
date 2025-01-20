@interface AKAccountRecoveryStepVerifyPhoneNumber
- (BOOL)canProcessResponse:(id)a3;
- (id)_matchingAttributesWithPhoneNumber:(id)a3 linkRowElements:(id)a4;
- (id)_promptForPhoneNumberWithModel:(id)a3;
- (void)_beginVerifyPhoneNumberWithResponse:(id)a3 model:(id)a4 completion:(id)a5;
- (void)_processPhoneNumber:(id)a3 response:(id)a4 model:(id)a5 completion:(id)a6;
- (void)_sendSMSCodeWithModel:(id)a3 completion:(id)a4;
- (void)_verifyPhoneNumberWithModel:(id)a3 completion:(id)a4;
@end

@implementation AKAccountRecoveryStepVerifyPhoneNumber

- (BOOL)canProcessResponse:(id)a3
{
  v3 = [a3 data];
  v4 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"navigationBar" data:v3 error:0];

  v5 = [v4 firstObject];
  v6 = [v5 objectForKeyedSubscript:@"title"];
  v7 = [v6 lowercaseString];
  char v8 = [v7 containsString:@"phone number"];

  return v8;
}

- (void)_beginVerifyPhoneNumberWithResponse:(id)a3 model:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 data];
  v12 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"multiChoice" data:v11 error:0];

  if ([v12 count] == 1)
  {
    v13 = [v9 cliUtilities];
    v14 = [v9 configuration];
    v15 = [v12 firstObject];
    v16 = [v8 httpResponse];
    [v13 updateConfiguration:v14 fromXMLAttributes:v15 response:v16];

    [(AKAccountRecoveryStepVerifyPhoneNumber *)self _verifyPhoneNumberWithModel:v9 completion:v10];
  }
  else
  {
    v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountRecoveryStepVerifyPhoneNumber _beginVerifyPhoneNumberWithResponse:model:completion:]();
    }

    if (v10)
    {
      v18 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
      (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v18);
    }
  }
}

- (void)_verifyPhoneNumberWithModel:(id)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AKAccountRecoveryStepVerifyPhoneNumber *)self _promptForPhoneNumberWithModel:v6];
  id v9 = [v6 configuration];
  id v10 = v9;
  if (v9)
  {
    v11 = [v9 request];
    v12 = (void *)[v11 mutableCopy];

    v13 = [v6 cliUtilities];
    v22 = @"number";
    v23[0] = v8;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [v13 signXMLRequest:v12 withPostbackDictionary:v14];

    v15 = [v10 resourceLoadDelegate];
    [v15 signRequest:v12];

    v16 = [v6 cliUtilities];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__AKAccountRecoveryStepVerifyPhoneNumber__verifyPhoneNumberWithModel_completion___block_invoke;
    v18[3] = &unk_1E575F4E8;
    v18[4] = self;
    id v19 = v8;
    id v20 = v6;
    id v21 = v7;
    [v16 beginDataTaskWithRequest:v12 completionHandler:v18];

LABEL_7:
    goto LABEL_8;
  }
  v17 = _AKLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountRecoveryStepSMSVerificationCode _beginSMSCodeVerificationWithResponse:model:completion:]();
  }

  if (v7)
  {
    v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*((void (**)(id, void, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

void __81__AKAccountRecoveryStepVerifyPhoneNumber__verifyPhoneNumberWithModel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[AKAccountRecoveryResponse alloc] initWithData:v6 httpResponse:v5];

  [*(id *)(a1 + 32) _processPhoneNumber:*(void *)(a1 + 40) response:v7 model:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_processPhoneNumber:(id)a3 response:(id)a4 model:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v11 data];
  v15 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"multiChoice" data:v14 error:0];

  v16 = [v11 data];
  v17 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"linkRow" data:v16 error:0];

  if ([v15 count])
  {
    v18 = [v12 cliUtilities];
    [v12 configuration];
    id v43 = v13;
    id v19 = self;
    id v20 = v17;
    v22 = id v21 = v10;
    [v15 firstObject];
    id v23 = v12;
    v25 = v24 = v15;
    v26 = [v11 httpResponse];
    [v18 updateConfiguration:v22 fromXMLAttributes:v25 response:v26];

    v15 = v24;
    id v12 = v23;

    id v10 = v21;
    v17 = v20;

    v27 = v19;
    id v13 = v43;
    [(AKAccountRecoveryStepVerifyPhoneNumber *)v27 _sendSMSCodeWithModel:v23 completion:v43];
  }
  else if ([v17 count])
  {
    v28 = [(AKAccountRecoveryStepVerifyPhoneNumber *)self _matchingAttributesWithPhoneNumber:v10 linkRowElements:v17];
    if (v28)
    {
      v29 = [v12 cliUtilities];
      [v12 configuration];
      id v44 = v13;
      v30 = self;
      v31 = v17;
      v33 = id v32 = v10;
      [v11 httpResponse];
      id v34 = v11;
      id v35 = v12;
      v37 = v36 = v15;
      [v29 updateConfiguration:v33 fromXMLAttributes:v28 response:v37];

      v15 = v36;
      id v12 = v35;
      id v11 = v34;

      id v10 = v32;
      v17 = v31;

      v38 = v30;
      id v13 = v44;
      [(AKAccountRecoveryStepVerifyPhoneNumber *)v38 _sendSMSCodeWithModel:v12 completion:v44];
    }
    else
    {
      v41 = _AKLogSystem();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[AKAccountRecoveryStepVerifyPhoneNumber _beginVerifyPhoneNumberWithResponse:model:completion:]();
      }

      if (v13)
      {
        v42 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
        (*((void (**)(id, void, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, 0, v42);
      }
    }
  }
  else
  {
    v39 = _AKLogSystem();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountRecoveryStepVerifyPhoneNumber _beginVerifyPhoneNumberWithResponse:model:completion:]();
    }

    if (v13)
    {
      v40 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
      (*((void (**)(id, void, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, 0, v40);
    }
  }
}

- (id)_matchingAttributesWithPhoneNumber:(id)a3 linkRowElements:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "objectForKey:", @"label", (void)v16);
        id v13 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "length") - 4);
        if ([v12 containsString:v13])
        {
          id v14 = v11;

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (void)_sendSMSCodeWithModel:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 configuration];
  uint64_t v8 = [v7 request];
  uint64_t v9 = (void *)[v8 mutableCopy];

  id v10 = [v6 cliUtilities];
  [v10 signXMLRequest:v9];

  id v11 = [v7 resourceLoadDelegate];
  [v11 signRequest:v9];

  id v12 = [v6 cliUtilities];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__AKAccountRecoveryStepVerifyPhoneNumber__sendSMSCodeWithModel_completion___block_invoke;
  v14[3] = &unk_1E575F4C0;
  id v15 = v5;
  id v13 = v5;
  [v12 beginDataTaskWithRequest:v9 completionHandler:v14];
}

uint64_t __75__AKAccountRecoveryStepVerifyPhoneNumber__sendSMSCodeWithModel_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void))(result + 16))(result, 1, a2, a3, 0, 0);
  }
  return result;
}

- (id)_promptForPhoneNumberWithModel:(id)a3
{
  v3 = [a3 context];
  v4 = [v3 phoneNumber];

  if (![v4 length])
  {
    AKPrint(@"Enter one of your trusted phone numbers to continue: ", v5, v6, v7, v8, v9, v10, v11, v14);
    uint64_t v12 = AKReadLine(1024);

    v4 = (void *)v12;
  }

  return v4;
}

- (void)_beginVerifyPhoneNumberWithResponse:model:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Failed phone number verification step with unexpected data", v2, v3, v4, v5, v6);
}

@end