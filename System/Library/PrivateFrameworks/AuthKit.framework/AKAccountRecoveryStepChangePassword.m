@interface AKAccountRecoveryStepChangePassword
- (BOOL)_isNewPasswordErrorForData:(id)a3;
- (BOOL)canProcessResponse:(id)a3;
- (id)_matchingAttributeWithResponse:(id)a3;
- (id)_promptForConfirmPasswordWithModel:(id)a3;
- (id)_promptForNewPasswordWithModel:(id)a3;
- (void)_beginChangePasswordWithResponse:(id)a3 model:(id)a4 completion:(id)a5;
- (void)_verifyNewPasswordWithRowID:(id)a3 confirmRowID:(id)a4 model:(id)a5 completion:(id)a6;
@end

@implementation AKAccountRecoveryStepChangePassword

- (BOOL)canProcessResponse:(id)a3
{
  v3 = [a3 data];
  v4 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"navigationBar" data:v3 error:0];

  v5 = [v4 firstObject];
  v6 = [v5 objectForKeyedSubscript:@"title"];
  uint64_t v7 = [v6 lowercaseString];
  char v8 = [(id)v7 containsString:@"new password"];

  v9 = [v4 firstObject];
  v10 = [v9 objectForKeyedSubscript:@"title"];
  v11 = [v10 lowercaseString];
  LOBYTE(v7) = [v11 containsString:@"change password"];

  return v8 | v7;
}

- (void)_beginChangePasswordWithResponse:(id)a3 model:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 data];
  v12 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"editableTextRow" data:v11 error:0];

  if ((unint64_t)[v12 count] > 1)
  {
    v21 = [(AKAccountRecoveryStepChangePassword *)self _matchingAttributeWithResponse:v8];
    if (v21)
    {
      v22 = [v9 cliUtilities];
      v23 = [v9 configuration];
      v24 = [v8 httpResponse];
      [v22 updateConfiguration:v23 fromXMLAttributes:v21 response:v24];

      v25 = [v12 firstObject];
      v26 = [v25 objectForKeyedSubscript:@"id"];
      v27 = [v12 lastObject];
      v28 = [v27 objectForKeyedSubscript:@"id"];
      [(AKAccountRecoveryStepChangePassword *)self _verifyNewPasswordWithRowID:v26 confirmRowID:v28 model:v9 completion:v10];
    }
    else
    {
      v29 = _AKLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[AKAccountRecoveryStepChangePassword _beginChangePasswordWithResponse:model:completion:](v29, v30, v31, v32, v33, v34, v35, v36);
      }

      if (v10)
      {
        v37 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
        (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v37);
      }
    }
    goto LABEL_12;
  }
  v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountRecoveryStepChangePassword _beginChangePasswordWithResponse:model:completion:](v13, v14, v15, v16, v17, v18, v19, v20);
  }

  if (v10)
  {
    v21 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v21);
LABEL_12:
  }
}

- (id)_matchingAttributeWithResponse:(id)a3
{
  id v3 = a3;
  v4 = [v3 data];
  v5 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"multiChoice" data:v4 error:0];

  v6 = [v3 data];
  uint64_t v7 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"linkBarItem" data:v6 error:0];

  id v8 = [v3 data];

  id v9 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"button" data:v8 error:0];

  id v10 = objc_msgSend(v9, "aaf_filter:", &__block_literal_global_20);

  if ([v10 count] == 2)
  {
    v11 = v10;
LABEL_5:
    uint64_t v12 = [v11 lastObject];
LABEL_6:
    v13 = (void *)v12;
    goto LABEL_7;
  }
  if ([v7 count] == 2)
  {
    v11 = v7;
    goto LABEL_5;
  }
  if ([v5 count] == 1)
  {
    uint64_t v12 = [v5 firstObject];
    goto LABEL_6;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

uint64_t __70__AKAccountRecoveryStepChangePassword__matchingAttributeWithResponse___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"stringValue"];
  uint64_t v3 = [v2 containsString:@"Sign Out"];

  return v3;
}

- (void)_verifyNewPasswordWithRowID:(id)a3 confirmRowID:(id)a4 model:(id)a5 completion:(id)a6
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(AKAccountRecoveryStepChangePassword *)self _promptForNewPasswordWithModel:v12];
  uint64_t v15 = [(AKAccountRecoveryStepChangePassword *)self _promptForConfirmPasswordWithModel:v12];
  uint64_t v16 = [v12 configuration];
  uint64_t v17 = v16;
  if (v16)
  {
    uint64_t v18 = [v16 request];
    uint64_t v19 = (void *)[v18 mutableCopy];

    uint64_t v20 = [v12 cliUtilities];
    v39[0] = v10;
    v39[1] = v11;
    v40[0] = v14;
    v40[1] = v15;
    v39[2] = @"serverInfo";
    v40[2] = &unk_1EE43EB30;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
    uint64_t v34 = v15;
    id v21 = v11;
    v23 = id v22 = v10;
    [v20 signXMLRequest:v19 withPostbackDictionary:v23];

    v24 = [v17 resourceLoadDelegate];
    [v24 signRequest:v19];

    v25 = [v12 cliUtilities];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __97__AKAccountRecoveryStepChangePassword__verifyNewPasswordWithRowID_confirmRowID_model_completion___block_invoke;
    v35[3] = &unk_1E5760B50;
    id v38 = v13;
    v35[4] = self;
    id v36 = v12;
    id v37 = v14;
    [v25 beginDataTaskWithRequest:v19 completionHandler:v35];

    id v10 = v22;
    id v11 = v21;
    uint64_t v15 = v34;

LABEL_7:
    goto LABEL_8;
  }
  v26 = _AKLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[AKAccountRecoveryStepChangePassword _verifyNewPasswordWithRowID:confirmRowID:model:completion:](v26, v27, v28, v29, v30, v31, v32, v33);
  }

  if (v13)
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*((void (**)(id, void, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, 0, v19);
    goto LABEL_7;
  }
LABEL_8:
}

void __97__AKAccountRecoveryStepChangePassword__verifyNewPasswordWithRowID_confirmRowID_model_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v44[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  id v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDRecoveryController _logResponse:]((uint64_t)v10, v11);
  }

  if (!v9)
  {
    if ([*(id *)(a1 + 32) _isNewPasswordErrorForData:v7])
    {
      AKPrintLine(@"Your new password must be different than one of the passwords you have used in the last year.", v20, v21, v22, v23, v24, v25, v26, v42);
      uint64_t v27 = *(void *)(a1 + 56);
      if (!v27) {
        goto LABEL_12;
      }
      uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7026);
      (*(void (**)(uint64_t, void, void, void, void, void *))(v27 + 16))(v27, 0, 0, 0, 0, v28);
    }
    else
    {
      uint64_t v29 = *(void *)(a1 + 48);
      uint64_t v30 = [*(id *)(a1 + 40) context];
      [v30 _setPassword:v29];

      v43[0] = @"AKUsername";
      uint64_t v31 = [*(id *)(a1 + 40) context];
      uint64_t v32 = [v31 username];
      uint64_t v33 = *(void *)(a1 + 48);
      v44[0] = v32;
      v44[1] = v33;
      v43[1] = @"AKPassword";
      v43[2] = @"AKRawPassword";
      v44[2] = v33;
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];

      AKPrintLine(@"Password changed successfully.", v34, v35, v36, v37, v38, v39, v40, v42);
      uint64_t v41 = *(void *)(a1 + 56);
      if (v41) {
        (*(void (**)(uint64_t, void, id, id, void *, void))(v41 + 16))(v41, 0, v7, v8, v28, 0);
      }
    }

    goto LABEL_12;
  }
  AKPrintLine(@"Failed to change password. Error - %@", v12, v13, v14, v15, v16, v17, v18, (uint64_t)v9);
  uint64_t v19 = *(void *)(a1 + 56);
  if (v19) {
    (*(void (**)(uint64_t, void, void, void, void, id))(v19 + 16))(v19, 0, 0, 0, 0, v9);
  }
LABEL_12:
}

- (BOOL)_isNewPasswordErrorForData:(id)a3
{
  uint64_t v3 = +[AKAppleIDAuthenticationCommandLineContext ruiElementsAttributesWithName:@"alert" data:a3 error:0];
  v4 = [v3 firstObject];
  v5 = [v4 objectForKeyedSubscript:@"title"];
  v6 = [v5 lowercaseString];
  char v7 = [v6 containsString:@"choose different password"];

  return v7;
}

- (id)_promptForNewPasswordWithModel:(id)a3
{
  uint64_t v3 = [a3 context];
  v4 = [v3 _password];

  if (![v4 length])
  {
    AKPrint(@"Enter new password: ", v5, v6, v7, v8, v9, v10, v11, v14);
    uint64_t v12 = AKReadLineSecure(1024);

    v4 = (void *)v12;
  }

  return v4;
}

- (id)_promptForConfirmPasswordWithModel:(id)a3
{
  uint64_t v3 = [a3 context];
  v4 = [v3 _password];

  if (![v4 length])
  {
    AKPrint(@"Confirm new password: ", v5, v6, v7, v8, v9, v10, v11, v14);
    uint64_t v12 = AKReadLineSecure(1024);

    v4 = (void *)v12;
  }

  return v4;
}

- (void)_beginChangePasswordWithResponse:(uint64_t)a3 model:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_verifyNewPasswordWithRowID:(uint64_t)a3 confirmRowID:(uint64_t)a4 model:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end