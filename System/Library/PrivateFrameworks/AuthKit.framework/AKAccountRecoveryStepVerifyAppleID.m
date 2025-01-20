@interface AKAccountRecoveryStepVerifyAppleID
- (BOOL)canProcessResponse:(id)a3;
- (id)_promptForUsernameWithModel:(id)a3;
- (void)_beginVerifyAppleIDWithResponse:(id)a3 model:(id)a4 completion:(id)a5;
- (void)_verifyAppleIDWithModel:(id)a3 completion:(id)a4;
@end

@implementation AKAccountRecoveryStepVerifyAppleID

- (BOOL)canProcessResponse:(id)a3
{
  v3 = [a3 data];
  v4 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"navigationBar" data:v3 error:0];

  v5 = [v4 firstObject];
  v6 = [v5 objectForKeyedSubscript:@"title"];
  v7 = [v6 lowercaseString];
  char v8 = [v7 containsString:@"forgot password"];

  return v8;
}

- (void)_beginVerifyAppleIDWithResponse:(id)a3 model:(id)a4 completion:(id)a5
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

    [(AKAccountRecoveryStepVerifyAppleID *)self _verifyAppleIDWithModel:v9 completion:v10];
  }
  else
  {
    v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AKAccountRecoveryStepVerifyAppleID _beginVerifyAppleIDWithResponse:model:completion:](v17);
    }

    if (v10)
    {
      v18 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
      (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v18);
    }
  }
}

- (void)_verifyAppleIDWithModel:(id)a3 completion:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AKAccountRecoveryStepVerifyAppleID *)self _promptForUsernameWithModel:v7];
  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountRecoveryStepVerifyAppleID _verifyAppleIDWithModel:completion:](v9);
  }

  id v10 = [v7 configuration];
  v11 = [v10 request];
  v12 = (void *)[v11 mutableCopy];

  v13 = [v7 cliUtilities];
  v20 = @"id";
  v21[0] = v8;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  [v13 signXMLRequest:v12 withPostbackDictionary:v14];

  v15 = [v10 resourceLoadDelegate];
  [v15 signRequest:v12];

  v16 = [v7 cliUtilities];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__AKAccountRecoveryStepVerifyAppleID__verifyAppleIDWithModel_completion___block_invoke;
  v18[3] = &unk_1E575F4C0;
  id v19 = v6;
  id v17 = v6;
  [v16 beginDataTaskWithRequest:v12 completionHandler:v18];
}

uint64_t __73__AKAccountRecoveryStepVerifyAppleID__verifyAppleIDWithModel_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void))(result + 16))(result, 1, a2, a3, 0, 0);
  }
  return result;
}

- (id)_promptForUsernameWithModel:(id)a3
{
  id v3 = a3;
  v4 = [v3 context];
  v5 = [v4 username];

  if (![v5 length])
  {
    AKPrint(@"Enter your email address or phone number: ", v6, v7, v8, v9, v10, v11, v12, v16);
    uint64_t v13 = AKReadLine(1024);

    if (v13)
    {
      v14 = [v3 context];
      [v14 setUsername:v13];

      v5 = (void *)v13;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)_beginVerifyAppleIDWithResponse:(os_log_t)log model:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Failed AppleID verify step with unexpected data", v1, 2u);
}

- (void)_verifyAppleIDWithModel:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Verifying user entered Apple ID", v1, 2u);
}

@end