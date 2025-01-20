@interface AKAppleIDAuthenticationCommandLineContext
+ (id)_findMatchingElementWithName:(id)a3 inElement:(id)a4;
+ (id)ruiElementsAttributesWithName:(id)a3 data:(id)a4 error:(id *)a5;
- (AKAppleIDAuthenticationCommandLineContext)init;
- (AKAppleIDAuthenticationCommandLineContext)initWithVerificationType:(int64_t)a3;
- (AKChangePasswordController)changePasswordController;
- (AKCommandLineUtilities)utility;
- (AKForgotPasswordController)forgotPasswordController;
- (BOOL)termsAccepted;
- (NSDate)birthday;
- (NSNumber)secondFactorCode;
- (NSString)countryCode;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)localSecret;
- (NSString)phoneNumber;
- (NSString)recoveryKey;
- (NSString)rootPath;
- (NSString)smsSecurityCode;
- (id)_accountCreationRequestBodyFromResponseDictionary:(id)a3 shouldIncludePhoneNumber:(BOOL)a4 shouldIncludeForSecurityCode:(BOOL)a5;
- (id)_accountDictionary;
- (id)_createContextDictionaryFromResponse:(id)a3;
- (id)_jsonPostbackDictionaryForCode:(id)a3 numberId:(id)a4;
- (id)_parseHeaderTitleForPasscodeView:(id)a3;
- (id)_parseTrustedPhoneNumberFromResponseDictionary:(id)a3;
- (id)_promptForBirthday;
- (id)_promptForCountryCode;
- (id)_promptForFirstName;
- (id)_promptForLastName;
- (id)_promptForPassword;
- (id)_promptForPhoneNumber;
- (id)_promptForUsername;
- (id)_promptForVerificationCodeWithSecureEntry:(BOOL)a3 forTrustedNumber:(id)a4;
- (id)_promptUserForSelectionWithTrustedNumbers:(id)a3;
- (id)_promptUserForTermsWithResponseDictionary:(id)a3;
- (id)_rootPath;
- (id)_xmlUIRequestForURL:(id)a3 withPostbackDictionary:(id)a4;
- (id)_xmlUIRequestForURL:(id)a3 withServerInfo:(id)a4;
- (int64_t)verificationType;
- (unint64_t)_capabilityForUIDisplay;
- (void)_beginDataTaskWithRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)_collectAndHandleTermsAndConditionsWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)_collectAndPostSecondFactorCodeWithRequestBody:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)_handleServerUIBirthdayVerificationWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)_handleServerUIPasswordVerificationWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)_handleServerUIPhoneVerificationWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)_handleServerUISMSVerificationWithResponseDictionary:(id)a3 statusCode:(int64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)_handleServerUISecondFactorWithObjectModel:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)_handleServerUIWithDictionary:(id)a3 statusCode:(int64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)_presentServerUIWithConfiguration:(id)a3 completion:(id)a4;
- (void)_promptForBirthday;
- (void)_verifySecondFactorCodeWithRequest:(id)a3 completion:(id)a4;
- (void)dismissBasicLoginUIWithCompletion:(id)a3;
- (void)dismissSecondFactorUIWithCompletion:(id)a3;
- (void)dismissServerProvidedUIWithCompletion:(id)a3;
- (void)presentBasicLoginUIWithCompletion:(id)a3;
- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6;
- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6;
- (void)presentSecondFactorUIWithCompletion:(id)a3;
- (void)presentServerProvidedUIWithConfiguration:(id)a3 completion:(id)a4;
- (void)setBirthday:(id)a3;
- (void)setChangePasswordController:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setForgotPasswordController:(id)a3;
- (void)setLastName:(id)a3;
- (void)setLocalSecret:(id)a3;
- (void)setNeedsNewAppleID:(BOOL)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setSecondFactorCode:(id)a3;
- (void)setSmsSecurityCode:(id)a3;
- (void)setTermsAccepted:(BOOL)a3;
@end

@implementation AKAppleIDAuthenticationCommandLineContext

- (AKAppleIDAuthenticationCommandLineContext)init
{
  return [(AKAppleIDAuthenticationCommandLineContext *)self initWithVerificationType:0];
}

- (AKAppleIDAuthenticationCommandLineContext)initWithVerificationType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AKAppleIDAuthenticationCommandLineContext;
  v4 = [(AKAppleIDAuthenticationContext *)&v10 init];
  if (v4)
  {
    v5 = objc_alloc_init(AKCommandLineUtilities);
    utility = v4->_utility;
    v4->_utility = v5;

    v4->_verificationType = a3;
    uint64_t v7 = [(AKAppleIDAuthenticationCommandLineContext *)v4 _rootPath];
    rootPath = v4->_rootPath;
    v4->_rootPath = (NSString *)v7;

    if (!v4->_verificationType) {
      [(AKAppleIDAuthenticationContext *)v4 setSupportsPiggybacking:1];
    }
  }
  return v4;
}

- (unint64_t)_capabilityForUIDisplay
{
  return 2;
}

- (void)setNeedsNewAppleID:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKAppleIDAuthenticationCommandLineContext;
  [(AKAppleIDAuthenticationContext *)&v6 setNeedsNewAppleID:a3];
  v4 = [(AKAppleIDAuthenticationCommandLineContext *)self _rootPath];
  rootPath = self->_rootPath;
  self->_rootPath = v4;
}

- (id)_rootPath
{
  BOOL v2 = [(AKAppleIDAuthenticationContext *)self needsNewAppleID];
  v3 = AKAuthorizationAppleAccountPathString;
  if (!v2) {
    v3 = AKAuthorizationAuthPathString;
  }
  v4 = *v3;

  return v4;
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(AKAppleIDAuthenticationCommandLineContext *)self _promptForUsername];
  v5 = [(AKAppleIDAuthenticationCommandLineContext *)self _promptForPassword];
  (*((void (**)(id, id, void *, void, void))v4 + 2))(v4, v6, v5, 0, 0);
}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v16 = a6;
  v8 = [a3 localizedDescription];
  AKPrintLine(@"Failed to validate username and password combination: %@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  [(AKAppleIDAuthenticationContext *)self _setPassword:0];
  [(AKAppleIDAuthenticationCommandLineContext *)self presentBasicLoginUIWithCompletion:v16];
}

- (void)presentSecondFactorUIWithCompletion:(id)a3
{
  v25 = (void (**)(id, void *, void))a3;
  uint64_t v11 = [(AKAppleIDAuthenticationCommandLineContext *)self secondFactorCode];
  if (v11)
  {
    v25[2](v25, v11, 0);
  }
  else
  {
    AKPrint(@"Enter 6 digit code: ", v4, v5, v6, v7, v8, v9, v10, v23);
    uint64_t v12 = AKReadLine(10);
    v20 = v12;
    if (v12)
    {
      v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "integerValue"));
      [(AKAppleIDAuthenticationCommandLineContext *)self setSecondFactorCode:v21];

      [(AKAppleIDAuthenticationCommandLineContext *)self secondFactorCode];
    }
    else
    {
      AKPrintLine(@"Failed to read code!", v13, v14, v15, v16, v17, v18, v19, v24);
      objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7012);
    v22 = };
    ((void (*)(void))v25[2])();
  }
}

- (void)dismissSecondFactorUIWithCompletion:(id)a3
{
}

- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v16 = a6;
  uint64_t v8 = [a3 localizedDescription];
  AKPrintLine(@"Failed to validate code: %@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  [(AKAppleIDAuthenticationCommandLineContext *)self presentSecondFactorUIWithCompletion:v16];
}

- (void)presentServerProvidedUIWithConfiguration:(id)a3 completion:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  uint64_t v7 = [v25 requestType];
  if (v7)
  {
    if (v7 == 1)
    {
      AKPrintLine(@"IDP second factor-authentication is not supported!", v8, 1, v10, v11, v12, v13, v14, v24);
    }
    else
    {
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:v7];
      AKPrintLine(@"Unexpected second-factor authentication (%@)!", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);
    }
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v23);
  }
  else
  {
    AKPrintLine(@"Requesting second-factor ServerUI...", v8, v9, v10, v11, v12, v13, v14, v24);
    [(AKAppleIDAuthenticationCommandLineContext *)self _presentServerUIWithConfiguration:v25 completion:v6];
  }
}

- (void)dismissServerProvidedUIWithCompletion:(id)a3
{
}

- (void)_presentServerUIWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AKAppleIDAuthenticationContext *)self needsCredentialRecovery])
  {
    AKPrintLine(@"Begin iForgot password flow", v8, v9, v10, v11, v12, v13, v14, v32);
    uint64_t v15 = 760;
    if (!self->_forgotPasswordController)
    {
      uint64_t v16 = AKForgotPasswordController;
LABEL_7:
      uint64_t v24 = (objc_class *)objc_alloc_init(v16);
      id v25 = *(Class *)((char *)&self->super.super.isa + v15);
      *(Class *)((char *)&self->super.super.isa + v15) = v24;

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (![(AKAppleIDAuthenticationContext *)self needsPasswordChange])
  {
    int64_t verificationType = self->_verificationType;
    if (verificationType)
    {
      if (verificationType != 1)
      {
        AKPrintLine(@"Unknown verification type", v17, v18, v19, v20, v21, v22, v23, v32);
        v26 = 0;
        goto LABEL_16;
      }
      v28 = [(AKAppleIDAuthenticationCommandLineContext *)self utility];
      v29 = [(AKAppleIDAuthenticationCommandLineContext *)self rootPath];
      v26 = [v28 mutableJSONRequestForPath:v29];

      v30 = _AKLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[AKAppleIDAuthenticationCommandLineContext _presentServerUIWithConfiguration:completion:](v6, v30);
      }
    }
    else
    {
      v30 = [v6 request];
      v26 = [v30 mutableCopy];
    }

LABEL_16:
    v31 = [v6 resourceLoadDelegate];
    [v31 signRequest:v26];

    [(AKAppleIDAuthenticationCommandLineContext *)self _beginDataTaskWithRequest:v26 configuration:v6 completion:v7];
    goto LABEL_17;
  }
  AKPrintLine(@"Begin change password flow", v17, v18, v19, v20, v21, v22, v23, v32);
  uint64_t v15 = 752;
  if (!self->_changePasswordController)
  {
    uint64_t v16 = AKChangePasswordController;
    goto LABEL_7;
  }
LABEL_8:
  v26 = [[AKAccountRecoveryModel alloc] initWithContext:self configuration:v6 utilities:self->_utility];
  [*(id *)((char *)&self->super.super.isa + v15) beginAccountRecoveryWithModel:v26 completion:v7];
LABEL_17:
}

- (void)_handleServerUISecondFactorWithObjectModel:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __113__AKAppleIDAuthenticationCommandLineContext__handleServerUISecondFactorWithObjectModel_configuration_completion___block_invoke;
  v65[3] = &unk_1E5762360;
  id v11 = v10;
  id v66 = v11;
  uint64_t v12 = (void (**)(void, void))MEMORY[0x1996FE880](v65);
  uint64_t v13 = [v8 allPages];
  uint64_t v14 = [v13 firstObject];

  if (v14)
  {
    uint64_t v15 = [v14 passcodeViewOM];
    uint64_t v16 = v15;
    if (v15)
    {
      uint64_t v17 = [v15 identifier];
      if (v17)
      {
        uint64_t v18 = [v16 attributes];
        uint64_t v19 = [v18 objectForKeyedSubscript:@"url"];

        if (v19)
        {
          v64 = v9;
          uint64_t v20 = [v16 attributes];
          uint64_t v21 = [v20 objectForKeyedSubscript:@"httpMethod"];

          if (v21)
          {
            uint64_t v22 = [v14 navTitle];
            v30 = (void *)v22;
            if (v22) {
              AKPrintLine(@"%@", v23, v24, v25, v26, v27, v28, v29, v22);
            }
            v61 = v30;
            v62 = v19;
            v63 = v17;
            v31 = [(AKAppleIDAuthenticationCommandLineContext *)self _parseHeaderTitleForPasscodeView:v16];
            v39 = v31;
            if (v31) {
              AKPrint(v31, v32, v33, v34, v35, v36, v37, v38, v57);
            }
            v40 = [v16 attributes];
            v41 = [v40 objectForKeyedSubscript:@"secure"];
            v60 = v39;
            uint64_t v42 = [v41 BOOLValue];

            v59 = [(AKAppleIDAuthenticationCommandLineContext *)self _promptForVerificationCodeWithSecureEntry:v42 forTrustedNumber:0];
            id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            [v43 setObject:v59 forKeyedSubscript:v63];
            v44 = [v8 serverInfo];
            [v43 setObject:v44 forKeyedSubscript:@"serverInfo"];

            v58 = [v8 absoluteURLWithString:v62];
            v45 = [(AKAppleIDAuthenticationCommandLineContext *)self _xmlUIRequestForURL:v58 withPostbackDictionary:v43];
            [v45 setHTTPMethod:v21];
            v46 = [v64 resourceLoadDelegate];
            [v46 signRequest:v45];

            uint64_t v17 = v63;
            [(AKAppleIDAuthenticationCommandLineContext *)self _verifySecondFactorCodeWithRequest:v45 completion:v11];

            uint64_t v19 = v62;
          }
          else
          {
            ((void (**)(void, __CFString *))v12)[2](v12, @"missing HTTP method");
          }

          id v9 = v64;
        }
        else
        {
          ((void (**)(void, __CFString *))v12)[2](v12, @"missing response URL");
        }
      }
      else
      {
        ((void (**)(void, __CFString *))v12)[2](v12, @"missing passcode identifier");
      }
    }
    else
    {
      ((void (**)(void, __CFString *))v12)[2](v12, @"missing passcode view");
    }
  }
  else
  {
    v47 = [v8 primaryAlert];

    if (v47)
    {
      v48 = [v8 primaryAlert];
      v49 = [v48 message];
      AKPrintLine(v49, v50, v51, v52, v53, v54, v55, v56, v57);
    }
    ((void (**)(void, __CFString *))v12)[2](v12, @"missing page");
  }
}

void __113__AKAppleIDAuthenticationCommandLineContext__handleServerUISecondFactorWithObjectModel_configuration_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  AKPrintLine(@"Unsupported object model found: %@", a2, a3, a4, a5, a6, a7, a8, a2);
  uint64_t v9 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id))(v9 + 16))(v9, 0, 0, v10);
}

- (void)_handleServerUIWithDictionary:(id)a3 statusCode:(int64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v26 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void, id, void *))a6;
  if ([(AKAppleIDAuthenticationContext *)self needsNewAppleID])
  {
    if ((unint64_t)(a4 - 200) > 0x63)
    {
      uint64_t v12 = [(AKAppleIDAuthenticationCommandLineContext *)self utility];
      uint64_t v13 = [v12 errorFromServerResponseBody:v26];

      if (v13)
      {
        uint64_t v14 = [v13 userInfo];
        uint64_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
        uint64_t v16 = [v13 userInfo];
        uint64_t v25 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F28588]];
        AKPrintError(@"Error creating an account: %@.\n%@", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v15);
      }
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:underlyingError:", -7029, v13);
      v11[2](v11, 0, v26, v24);
    }
    else
    {
      [(AKAppleIDAuthenticationCommandLineContext *)self _handleServerUIBirthdayVerificationWithResponseDictionary:v26 configuration:v10 completion:v11];
    }
  }
  else
  {
    [(AKAppleIDAuthenticationCommandLineContext *)self _handleServerUISMSVerificationWithResponseDictionary:v26 statusCode:a4 configuration:v10 completion:v11];
  }
}

- (void)_verifySecondFactorCodeWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  AKPrintLine(@"Verifying code…", v7, v8, v9, v10, v11, v12, v13, v17);
  uint64_t v14 = +[AKURLSession sharedURLSession];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__AKAppleIDAuthenticationCommandLineContext__verifySecondFactorCodeWithRequest_completion___block_invoke;
  v18[3] = &unk_1E575F4C0;
  id v19 = v6;
  id v15 = v6;
  id v16 = (id)[v14 beginDataTaskWithRequest:v5 completionHandler:v18];
}

void __91__AKAppleIDAuthenticationCommandLineContext__verifySecondFactorCodeWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v10 = v6;
  if (objc_opt_isKindOfClass())
  {
    if (v10)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, void, void, id))(v8 + 16))(v8, 0, 0, v7);
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*(void (**)(uint64_t, void, void, void *))(v8 + 16))(v8, 0, 0, v9);
  }
LABEL_8:
}

- (void)_handleServerUIBirthdayVerificationWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(AKAppleIDAuthenticationCommandLineContext *)self _accountCreationRequestBodyFromResponseDictionary:v8 shouldIncludePhoneNumber:0 shouldIncludeForSecurityCode:0];
  uint64_t v12 = [(AKAppleIDAuthenticationCommandLineContext *)self rootPath];
  uint64_t v13 = [v12 stringByAppendingPathComponent:@"/birthday"];

  uint64_t v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationCommandLineContext _handleServerUIBirthdayVerificationWithResponseDictionary:configuration:completion:]();
  }

  AKPrintLine(@"☾ Verifying Birthday with server…", v15, v16, v17, v18, v19, v20, v21, v25[0]);
  objc_initWeak(&location, self);
  uint64_t v22 = [(AKAppleIDAuthenticationCommandLineContext *)self utility];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = (uint64_t)__128__AKAppleIDAuthenticationCommandLineContext__handleServerUIBirthdayVerificationWithResponseDictionary_configuration_completion___block_invoke;
  v25[3] = (uint64_t)&unk_1E5762388;
  objc_copyWeak(&v28, &location);
  id v23 = v9;
  id v26 = v23;
  id v24 = v10;
  id v27 = v24;
  [v22 createAndExecuteRequestForPath:v13 requestBody:v11 httpMethod:@"POST" configuration:v23 completion:v25];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __128__AKAppleIDAuthenticationCommandLineContext__handleServerUIBirthdayVerificationWithResponseDictionary_configuration_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (!a3 || a4)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 16);
    id WeakRetained = a3;
    v9(v8, a2, WeakRetained, a4);
  }
  else
  {
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _handleServerUIPasswordVerificationWithResponseDictionary:v7 configuration:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

- (void)_handleServerUIPasswordVerificationWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(AKAppleIDAuthenticationCommandLineContext *)self _accountCreationRequestBodyFromResponseDictionary:v8 shouldIncludePhoneNumber:0 shouldIncludeForSecurityCode:0];
  uint64_t v12 = [(AKAppleIDAuthenticationCommandLineContext *)self rootPath];
  uint64_t v13 = [v12 stringByAppendingPathComponent:@"/password"];

  uint64_t v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationCommandLineContext _handleServerUIPasswordVerificationWithResponseDictionary:configuration:completion:]();
  }

  AKPrintLine(@"⊛ Verifying Password with server…", v15, v16, v17, v18, v19, v20, v21, v25[0]);
  objc_initWeak(&location, self);
  uint64_t v22 = [(AKAppleIDAuthenticationCommandLineContext *)self utility];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = (uint64_t)__128__AKAppleIDAuthenticationCommandLineContext__handleServerUIPasswordVerificationWithResponseDictionary_configuration_completion___block_invoke;
  v25[3] = (uint64_t)&unk_1E5762388;
  objc_copyWeak(&v28, &location);
  id v23 = v9;
  id v26 = v23;
  id v24 = v10;
  id v27 = v24;
  [v22 createAndExecuteRequestForPath:v13 requestBody:v11 httpMethod:@"POST" configuration:v23 completion:v25];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __128__AKAppleIDAuthenticationCommandLineContext__handleServerUIPasswordVerificationWithResponseDictionary_configuration_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (!a3 || a4)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void (**)(uint64_t, uint64_t, id, uint64_t))(v8 + 16);
    id WeakRetained = a3;
    v9(v8, a2, WeakRetained, a4);
  }
  else
  {
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _handleServerUIPhoneVerificationWithResponseDictionary:v7 configuration:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

- (void)_handleServerUIPhoneVerificationWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = (uint64_t)__125__AKAppleIDAuthenticationCommandLineContext__handleServerUIPhoneVerificationWithResponseDictionary_configuration_completion___block_invoke;
  v26[3] = (uint64_t)&unk_1E5762388;
  objc_copyWeak(&v29, &location);
  id v11 = v9;
  id v27 = v11;
  id v12 = v10;
  id v28 = v12;
  uint64_t v13 = (void *)MEMORY[0x1996FE880](v26);
  uint64_t v14 = [(AKAppleIDAuthenticationCommandLineContext *)self _accountCreationRequestBodyFromResponseDictionary:v8 shouldIncludePhoneNumber:1 shouldIncludeForSecurityCode:0];
  uint64_t v15 = [(AKAppleIDAuthenticationCommandLineContext *)self rootPath];
  uint64_t v16 = [v15 stringByAppendingPathComponent:@"/verify/phone"];

  uint64_t v17 = _AKLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationCommandLineContext _handleServerUIPhoneVerificationWithResponseDictionary:configuration:completion:]();
  }

  AKPrintLine(@"☏ Verifying Phone Number with server…", v18, v19, v20, v21, v22, v23, v24, v26[0]);
  uint64_t v25 = [(AKAppleIDAuthenticationCommandLineContext *)self utility];
  [v25 createAndExecuteRequestForPath:v16 requestBody:v14 httpMethod:@"PUT" configuration:v11 completion:v13];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __125__AKAppleIDAuthenticationCommandLineContext__handleServerUIPhoneVerificationWithResponseDictionary_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v23 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v10 = WeakRetained;
  if (v8 || !WeakRetained)
  {
    id v12 = [v8 userInfo];
    uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
    uint64_t v14 = [v8 userInfo];
    uint64_t v22 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28588]];
    AKPrintError(@"Error Validating phone number: %@\n%@", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v13);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v11 = [WeakRetained _accountCreationRequestBodyFromResponseDictionary:v7 shouldIncludePhoneNumber:1 shouldIncludeForSecurityCode:1];
    [v10 _collectAndPostSecondFactorCodeWithRequestBody:v11 configuration:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

- (void)_collectAndHandleTermsAndConditionsWithResponseDictionary:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = (uint64_t)__128__AKAppleIDAuthenticationCommandLineContext__collectAndHandleTermsAndConditionsWithResponseDictionary_configuration_completion___block_invoke;
  v26[3] = (uint64_t)&unk_1E5762388;
  objc_copyWeak(&v28, &location);
  uint64_t v26[4] = (uint64_t)self;
  id v11 = v10;
  id v27 = v11;
  id v12 = (void *)MEMORY[0x1996FE880](v26);
  uint64_t v13 = [(AKAppleIDAuthenticationCommandLineContext *)self _accountCreationRequestBodyFromResponseDictionary:v8 shouldIncludePhoneNumber:1 shouldIncludeForSecurityCode:1];
  uint64_t v14 = (void *)[v13 mutableCopy];

  uint64_t v15 = [(AKAppleIDAuthenticationCommandLineContext *)self _promptUserForTermsWithResponseDictionary:v8];
  [v14 addEntriesFromDictionary:v15];

  uint64_t v16 = _AKLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationCommandLineContext _collectAndHandleTermsAndConditionsWithResponseDictionary:configuration:completion:]();
  }

  AKPrintLine(@"✓ Final verification with server…", v17, v18, v19, v20, v21, v22, v23, v26[0]);
  uint64_t v24 = [(AKAppleIDAuthenticationCommandLineContext *)self utility];
  uint64_t v25 = [(AKAppleIDAuthenticationCommandLineContext *)self rootPath];
  [v24 createAndExecuteRequestForPath:v25 requestBody:v14 httpMethod:@"POST" configuration:v9 completion:v12];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __128__AKAppleIDAuthenticationCommandLineContext__collectAndHandleTermsAndConditionsWithResponseDictionary_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v10 = WeakRetained;
  if (v8 || !WeakRetained)
  {
    uint64_t v16 = *(void *)(a1 + 40);
    if (v8)
    {
      (*(void (**)(uint64_t, void, void, id))(v16 + 16))(v16, 0, 0, v8);
      goto LABEL_8;
    }
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
    (*(void (**)(uint64_t, void, void, void *))(v16 + 16))(v16, 0, 0, v11);
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
    id v12 = [*(id *)(a1 + 32) _password];
    [v11 setObject:v12 forKeyedSubscript:@"AKPassword"];

    uint64_t v13 = [*(id *)(a1 + 32) username];
    [v11 setObject:v13 forKeyedSubscript:@"AKUsername"];

    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = (void *)[v11 copy];
    (*(void (**)(uint64_t, id, void *, void))(v14 + 16))(v14, v17, v15, 0);
  }
LABEL_8:
}

- (void)_handleServerUISMSVerificationWithResponseDictionary:(id)a3 statusCode:(int64_t)a4 configuration:(id)a5 completion:(id)a6
{
  int64_t v49 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke;
  v61[3] = &unk_1E57623B0;
  id v52 = v11;
  id v63 = v52;
  v61[4] = self;
  id v51 = v10;
  id v62 = v51;
  uint64_t v12 = MEMORY[0x1996FE880](v61);
  uint64_t v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationCommandLineContext _handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:]();
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v50 = v9;
  uint64_t v15 = [v9 objectForKeyedSubscript:@"trustedPhoneNumbers"];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [[AKTrustedPhoneNumber alloc] initWithJSONDictionary:*(void *)(*((void *)&v57 + 1) + 8 * i)];
        uint64_t v21 = [(AKTrustedPhoneNumber *)v20 identifier];
        [v14 setObject:v20 forKeyedSubscript:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v17);
  }

  if ((unint64_t)[v14 count] < 2)
  {
    uint64_t v35 = _AKLogSystem();
    uint64_t v33 = (void *)v12;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v35, OS_LOG_TYPE_DEFAULT, "Server indicates we only have one trusted number, lets use that.", buf, 2u);
    }

    uint64_t v36 = [v14 allKeys];
    uint64_t v37 = [v36 firstObject];
    id v29 = [v14 objectForKey:v37];

    v31 = v50;
    uint64_t v32 = v52;
    if ((unint64_t)(v49 - 200) > 0x63)
    {
      (*(void (**)(uint64_t, id, void))(v12 + 16))(v12, v29, 0);
      v30 = v51;
      goto LABEL_23;
    }
    v30 = v51;
  }
  else
  {
    AKPrintLine(@"Multiple trusted numbers found!\n", v22, v23, v24, v25, v26, v27, v28, v49);
    id v29 = [(AKAppleIDAuthenticationCommandLineContext *)self _promptUserForSelectionWithTrustedNumbers:v14];
    v31 = v50;
    v30 = v51;
    uint64_t v32 = v52;
    uint64_t v33 = (void *)v12;
    if (!v29)
    {
      uint64_t v34 = _AKLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[AKAppleIDAuthenticationCommandLineContext _handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:]();
      }

      objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7012);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, id))v52 + 2))(v52, 0, 0, v29);
      goto LABEL_23;
    }
  }
  uint64_t v38 = v31;
  v39 = [(AKAppleIDAuthenticationCommandLineContext *)self rootPath];
  v40 = [v39 stringByAppendingPathComponent:@"/verify/phone"];

  v41 = [(AKAppleIDAuthenticationCommandLineContext *)self utility];
  uint64_t v42 = [v41 mutableJSONRequestForPath:v40];

  id v43 = [v29 identifier];
  v44 = [(AKAppleIDAuthenticationCommandLineContext *)self _jsonPostbackDictionaryForCode:0 numberId:v43];

  objc_msgSend(v42, "ak_setJSONBodyWithParameters:", v44);
  [v42 setHTTPMethod:@"PUT"];
  v45 = [v30 resourceLoadDelegate];
  [v45 signRequest:v42];

  v46 = _AKLogSystem();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationCommandLineContext _handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:]();
  }

  v47 = +[AKURLSession sharedURLSession];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_135;
  v53[3] = &unk_1E5761980;
  id v54 = v29;
  id v55 = v33;
  id v29 = v29;
  id v48 = (id)[v47 beginDataTaskWithRequest:v42 completionHandler:v53];

  v31 = v38;
LABEL_23:
}

void __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Prompting for second factor code", v13, 2u);
    }

    id v9 = [*(id *)(a1 + 32) _promptForVerificationCodeWithSecureEntry:0 forTrustedNumber:v5];
    id v10 = *(void **)(a1 + 32);
    id v11 = [v5 identifier];
    uint64_t v12 = [v10 _jsonPostbackDictionaryForCode:v9 numberId:v11];

    [*(id *)(a1 + 32) _collectAndPostSecondFactorCodeWithRequestBody:v12 configuration:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

void __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_135(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_135_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_collectAndPostSecondFactorCodeWithRequestBody:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = (uint64_t)__117__AKAppleIDAuthenticationCommandLineContext__collectAndPostSecondFactorCodeWithRequestBody_configuration_completion___block_invoke;
  v25[3] = (uint64_t)&unk_1E57623D8;
  objc_copyWeak(&v29, &location);
  uint64_t v25[4] = (uint64_t)self;
  id v11 = v8;
  id v26 = v11;
  id v12 = v9;
  id v27 = v12;
  id v13 = v10;
  id v28 = v13;
  id v14 = (void *)MEMORY[0x1996FE880](v25);
  uint64_t v15 = [(AKAppleIDAuthenticationCommandLineContext *)self rootPath];
  uint64_t v16 = [v15 stringByAppendingPathComponent:@"/verify/phone/securitycode"];

  AKPrintLine(@"Verifying code...", v17, v18, v19, v20, v21, v22, v23, v25[0]);
  uint64_t v24 = [(AKAppleIDAuthenticationCommandLineContext *)self utility];
  [v24 createAndExecuteRequestForPath:v16 requestBody:v11 httpMethod:@"POST" configuration:v12 completion:v14];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __117__AKAppleIDAuthenticationCommandLineContext__collectAndPostSecondFactorCodeWithRequestBody_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v23 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && [*(id *)(a1 + 32) needsNewAppleID])
  {
    if (objc_msgSend(v8, "ak_isServiceError"))
    {
      id v10 = [v8 userInfo];
      id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
      id v12 = [v8 userInfo];
      uint64_t v22 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28588]];
      AKPrintError(@"ᐞᐞᐞ %@\n%@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v11);

      [WeakRetained setSmsSecurityCode:0];
      [WeakRetained _handleServerUIPhoneVerificationWithResponseDictionary:*(void *)(a1 + 40) configuration:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
    else
    {
      [WeakRetained _collectAndHandleTermsAndConditionsWithResponseDictionary:v7 configuration:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
  }
  else if (v23)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 56);
    if (v8)
    {
      (*(void (**)(uint64_t, void, void, id))(v20 + 16))(v20, 0, 0, v8);
    }
    else
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
      (*(void (**)(uint64_t, void, void, void *))(v20 + 16))(v20, 0, 0, v21);
    }
  }
}

- (id)_promptUserForSelectionWithTrustedNumbers:(id)a3
{
  id v3 = a3;
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_49];
  AKPrintLine(@"Please select a trusted number: ", v4, v5, v6, v7, v8, v9, v10, v19);
  id v11 = NSNumber;
  id v12 = AKReadLine(10);
  uint64_t v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));

  uint64_t v14 = [v3 allKeys];
  int v15 = [v14 containsObject:v13];

  if (v15)
  {
    uint64_t v16 = [v3 objectForKey:v13];
  }
  else
  {
    uint64_t v17 = _AKLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationCommandLineContext _promptUserForSelectionWithTrustedNumbers:]();
    }

    uint64_t v16 = 0;
  }

  return v16;
}

void __87__AKAppleIDAuthenticationCommandLineContext__promptUserForSelectionWithTrustedNumbers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v13 = [v3 identifier];
  uint64_t v4 = [v3 numberWithDialCode];
  uint64_t v5 = [v3 pushMode];

  AKPrintLine(@"%@. %@ via %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v13);
}

- (id)_parseTrustedPhoneNumberFromResponseDictionary:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"phoneNumberVerification"];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"phoneNumber"];
  if (v5)
  {
    uint64_t v6 = [[AKTrustedPhoneNumber alloc] initWithJSONDictionary:v5];
    uint64_t v7 = [(AKTrustedPhoneNumber *)v6 number];

    if (v7)
    {
      uint64_t v8 = [(AKTrustedPhoneNumber *)v6 number];
      [(AKAppleIDAuthenticationCommandLineContext *)self setPhoneNumber:v8];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_accountCreationRequestBodyFromResponseDictionary:(id)a3 shouldIncludePhoneNumber:(BOOL)a4 shouldIncludeForSecurityCode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v39[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(AKAppleIDAuthenticationCommandLineContext *)self _accountDictionary];
  uint64_t v10 = [(AKAppleIDAuthenticationCommandLineContext *)self _createContextDictionaryFromResponse:v8];
  v38[0] = @"account";
  v38[1] = @"createContext";
  v39[0] = v9;
  v39[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  uint64_t v12 = (void *)[v11 mutableCopy];

  if (v6)
  {
    id v27 = v12;
    v36[0] = @"phoneNumber";
    v34[0] = @"number";
    id v13 = [(AKAppleIDAuthenticationCommandLineContext *)self _promptForPhoneNumber];
    v35[0] = v13;
    v34[1] = @"countryCode";
    [(AKAppleIDAuthenticationCommandLineContext *)self _promptForCountryCode];
    v15 = BOOL v14 = v5;
    v35[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    v36[1] = @"mode";
    v37[0] = v16;
    v37[1] = @"sms";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    uint64_t v18 = (void *)[v17 mutableCopy];

    if (v14)
    {
      uint64_t v19 = [(AKAppleIDAuthenticationCommandLineContext *)self _parseTrustedPhoneNumberFromResponseDictionary:v8];
      uint64_t v20 = [(AKAppleIDAuthenticationCommandLineContext *)self _promptForVerificationCodeWithSecureEntry:0 forTrustedNumber:v19];
      uint64_t v21 = (void *)v20;
      uint64_t v32 = @"securityCode";
      uint64_t v22 = &stru_1EE40D360;
      if (v20) {
        uint64_t v22 = (__CFString *)v20;
      }
      v30 = @"code";
      v31 = v22;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v33 = v23;
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      [v18 addEntriesFromDictionary:v24];
    }
    id v28 = @"phoneNumberVerification";
    id v29 = v18;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v12 = v27;
    [v27 addEntriesFromDictionary:v25];
  }

  return v12;
}

- (id)_createContextDictionaryFromResponse:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 objectForKeyedSubscript:@"createContext"];
  v8[0] = @"token";
  uint64_t v4 = objc_msgSend(v3, "objectForKeyedSubscript:");
  v9[0] = v4;
  v8[1] = @"type";
  BOOL v5 = objc_msgSend(v3, "objectForKeyedSubscript:");
  v9[1] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)_accountDictionary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AKAppleIDAuthenticationCommandLineContext__accountDictionary__block_invoke;
  block[3] = &unk_1E575EA70;
  block[4] = self;
  if (_accountDictionary_onceToken != -1) {
    dispatch_once(&_accountDictionary_onceToken, block);
  }
  return (id)_accountDictionary_accountDictionary;
}

void __63__AKAppleIDAuthenticationCommandLineContext__accountDictionary__block_invoke(uint64_t a1)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  BOOL v2 = [*(id *)(a1 + 32) _promptForUsername];
  id v3 = [*(id *)(a1 + 32) _promptForPassword];
  uint64_t v4 = [*(id *)(a1 + 32) _promptForFirstName];
  BOOL v5 = [*(id *)(a1 + 32) _promptForLastName];
  BOOL v6 = [*(id *)(a1 + 32) _promptForBirthday];
  v15[0] = @"name";
  v15[1] = @"password";
  v16[0] = v2;
  v16[1] = v3;
  v15[2] = @"person";
  v14[0] = v6;
  v13[0] = @"birthday";
  v13[1] = @"name";
  v11[0] = @"firstName";
  v11[1] = @"lastName";
  v12[0] = v4;
  v12[1] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v10 = (void *)_accountDictionary_accountDictionary;
  _accountDictionary_accountDictionary = v9;
}

- (void)_beginDataTaskWithRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[AKURLSession sharedURLSession];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke;
  v16[3] = &unk_1E5762448;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  id v15 = (id)[v11 beginDataTaskWithRequest:v12 completionHandler:v16];
}

void __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_cold_1();
  }

  if (v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_153;
    v13[3] = &unk_1E5762420;
    v13[4] = *(void *)(a1 + 32);
    id v14 = v7;
    id v15 = v8;
    id v16 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v13);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 56);
    if (v9)
    {
      (*(void (**)(uint64_t, void, void, id))(v11 + 16))(v11, 0, 0, v9);
    }
    else
    {
      id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
      (*(void (**)(uint64_t, void, void, void *))(v11 + 16))(v11, 0, 0, v12);
    }
  }
}

void __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_153(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) verificationType];
  id v3 = *(void **)(a1 + 32);
  if (v2 == 1)
  {
    uint64_t v4 = [v3 utility];
    id v18 = [v4 jsonDictionaryForData:*(void *)(a1 + 40) error:0];

    if (v18)
    {
      BOOL v5 = *(void **)(a1 + 32);
      id v6 = *(id *)(a1 + 48);
      objc_msgSend(v5, "_handleServerUIWithDictionary:statusCode:configuration:completion:", v18, objc_msgSend(v6, "statusCode"), *(void *)(a1 + 56), *(void *)(a1 + 72));
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void, id))(v10 + 16))(v10, 0, 0, v6);
    }
LABEL_17:

    return;
  }
  if (![v3 verificationType])
  {
    RUIParserClass = (objc_class *)RemoteUILibraryCore();
    if (RUIParserClass) {
      RUIParserClass = (objc_class *)getRUIParserClass();
    }
    id v12 = [RUIParserClass alloc];
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [*(id *)(a1 + 64) URL];
    id v18 = (id)[v12 initWithXML:v13 baseURL:v14 delegate:0];

    id v6 = [v18 error];
    id v15 = [v18 uiObjectModel];
    if (v15)
    {
      [*(id *)(a1 + 32) _handleServerUISecondFactorWithObjectModel:v15 configuration:*(void *)(a1 + 56) completion:*(void *)(a1 + 72)];
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 72);
      if (v6)
      {
        (*(void (**)(uint64_t, void, void, id))(v16 + 16))(v16, 0, 0, v6);
      }
      else
      {
        id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
        (*(void (**)(uint64_t, void, void, void *))(v16 + 16))(v16, 0, 0, v17);
      }
    }

    goto LABEL_17;
  }
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_153_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 72);
  id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7014);
  (*(void (**)(uint64_t, void, void, void *))(v8 + 16))(v8, 0, 0, v9);
}

- (id)_parseHeaderTitleForPasscodeView:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  NSSelectorFromString(&cfstr_Htmlcontent.isa);
  uint64_t v4 = [v3 HTMLHeader];

  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    id v5 = [v4 valueForKey:@"HTMLContent"];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      uint64_t v8 = [v6 dataUsingEncoding:4];
      id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v10 = UIKitLibraryCore();
      if (v10)
      {
        uint64_t v11 = getNSDocumentTypeDocumentAttribute();
      }
      else
      {
        uint64_t v11 = 0;
      }
      id v17 = v11;
      uint64_t v12 = UIKitLibraryCore();
      if (v12)
      {
        uint64_t v13 = getNSHTMLTextDocumentType();
      }
      else
      {
        uint64_t v13 = 0;
      }
      v18[0] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v15 = (void *)[v9 initWithData:v8 options:v14 documentAttributes:0 error:0];

      if (v12) {
      if (v10)
      }

      if (v15)
      {
        id v7 = [v15 string];
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_xmlUIRequestForURL:(id)a3 withServerInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = v8;
  if (v7) {
    [v8 setObject:v7 forKeyedSubscript:@"serverInfo"];
  }
  uint64_t v10 = [(AKAppleIDAuthenticationCommandLineContext *)self _xmlUIRequestForURL:v6 withPostbackDictionary:v9];

  return v10;
}

- (id)_xmlUIRequestForURL:(id)a3 withPostbackDictionary:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F18D50];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithURL:v7];

  objc_msgSend(v8, "ak_setBodyWithParameters:", v6);
  [v8 setHTTPMethod:@"POST"];
  [v8 setValue:@"application/x-buddyml" forHTTPHeaderField:@"Accept"];
  [v8 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];

  return v8;
}

+ (id)ruiElementsAttributesWithName:(id)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v26 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29250]) initWithData:v26];
  RUIXMLParserDelegateClass = (objc_class *)RemoteUILibraryCore();
  if (RUIXMLParserDelegateClass) {
    RUIXMLParserDelegateClass = (objc_class *)getRUIXMLParserDelegateClass();
  }
  id v10 = objc_alloc_init(RUIXMLParserDelegateClass);
  [v8 setDelegate:v10];
  uint64_t v25 = v8;
  [v8 parse];
  [v10 xmlElement];
  uint64_t v24 = v27 = v7;
  uint64_t v11 = objc_msgSend(a1, "_findMatchingElementWithName:inElement:", v7);
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v19 = [v18 attributtes];
        uint64_t v20 = (void *)[v19 mutableCopy];

        uint64_t v21 = [v18 stringValue];

        if (v21)
        {
          uint64_t v22 = [v18 stringValue];
          [v20 setObject:v22 forKey:@"stringValue"];
        }
        [v12 addObject:v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);
  }

  return v12;
}

+ (id)_findMatchingElementWithName:(id)a3 inElement:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    id v8 = [v7 name];
    int v9 = [v6 isEqualToString:v8];

    if (v9)
    {
      v24[0] = v7;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v11 = objc_msgSend(v7, "children", 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        id v10 = (void *)MEMORY[0x1E4F1CBF0];
        do
        {
          uint64_t v15 = 0;
          uint64_t v16 = v10;
          do
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            id v17 = [a1 _findMatchingElementWithName:v6 inElement:*(void *)(*((void *)&v19 + 1) + 8 * v15)];
            id v10 = [v16 arrayByAddingObjectsFromArray:v17];

            ++v15;
            uint64_t v16 = v10;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }
      else
      {
        id v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_promptForVerificationCodeWithSecureEntry:(BOOL)a3 forTrustedNumber:(id)a4
{
  id v6 = a4;
  id v7 = [(AKAppleIDAuthenticationCommandLineContext *)self smsSecurityCode];
  if ([v7 length])
  {
    uint64_t v15 = v7;
  }
  else
  {
    if (v6)
    {
      uint64_t v16 = NSString;
      id v17 = [v6 numberWithDialCode];
      long long v28 = [v6 pushMode];
      id v18 = [v16 stringWithFormat:@"A second factor code was send to %@ via %@"];
      AKPrintLine(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v17);
    }
    AKPrint(@"Enter second factor code: ", v8, v9, v10, v11, v12, v13, v14, v27);
    if (a3) {
      AKReadLineSecure(10);
    }
    else {
    uint64_t v15 = AKReadLine(10);
    }

    if (v15) {
      [(AKAppleIDAuthenticationCommandLineContext *)self setSmsSecurityCode:v15];
    }
  }

  return v15;
}

- (id)_promptForBirthday
{
  id v3 = [(AKAppleIDAuthenticationCommandLineContext *)self birthday];

  if (v3)
  {
    uint64_t v4 = [(AKAppleIDAuthenticationCommandLineContext *)self utility];
    id v5 = [v4 dateFormatter];
    id v6 = [(AKAppleIDAuthenticationCommandLineContext *)self birthday];
    id v7 = [v5 stringFromDate:v6];
  }
  else
  {
    id v7 = 0;
  }
  if (![v7 length])
  {
    AKPrint(@"Enter your birthday(YYYY-MM-DD): ", v8, v9, v10, v11, v12, v13, v14, v33);
    uint64_t v15 = AKReadLine(12);

    uint64_t v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationCommandLineContext _promptForBirthday]();
    }

    id v17 = [(AKAppleIDAuthenticationCommandLineContext *)self utility];
    id v18 = [v17 dateFormatter];
    uint64_t v19 = [v18 dateFromString:v15];

    if (v19)
    {
      [(AKAppleIDAuthenticationCommandLineContext *)self setBirthday:v19];
    }
    else
    {
      uint64_t v20 = [(AKAppleIDAuthenticationCommandLineContext *)self utility];
      uint64_t v21 = [v20 dateFormatter];
      uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v23 = [v21 stringFromDate:v22];
      AKPrintError(@"Please enter a valid birthday(%@)!", v24, v25, v26, v27, v28, v29, v30, (uint64_t)v23);

      uint64_t v31 = [(AKAppleIDAuthenticationCommandLineContext *)self _promptForBirthday];

      uint64_t v15 = (void *)v31;
    }

    id v7 = v15;
  }

  return v7;
}

- (id)_promptForPassword
{
  id v3 = [(AKAppleIDAuthenticationContext *)self _password];
  if (![v3 length])
  {
    AKPrint(@"Enter password: ", v4, v5, v6, v7, v8, v9, v10, v13);
    uint64_t v11 = AKReadLineSecure(1024);

    if (v11)
    {
      [(AKAppleIDAuthenticationContext *)self _setPassword:v11];
      id v3 = (void *)v11;
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (id)_promptForUsername
{
  id v3 = [(AKAppleIDAuthenticationContext *)self username];
  if (![v3 length])
  {
    AKPrint(@"Enter username: ", v4, v5, v6, v7, v8, v9, v10, v13);
    uint64_t v11 = AKReadLine(1024);

    if (v11)
    {
      [(AKAppleIDAuthenticationContext *)self setUsername:v11];
      id v3 = (void *)v11;
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (id)_promptForPhoneNumber
{
  id v3 = [(AKAppleIDAuthenticationCommandLineContext *)self phoneNumber];
  if (![v3 length])
  {
    AKPrint(@"Phone Number for this account: ", v4, v5, v6, v7, v8, v9, v10, v13);
    uint64_t v11 = AKReadLine(1024);

    if (v11)
    {
      [(AKAppleIDAuthenticationCommandLineContext *)self setPhoneNumber:v11];
      id v3 = (void *)v11;
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (id)_promptForCountryCode
{
  id v3 = [(AKAppleIDAuthenticationCommandLineContext *)self countryCode];
  if (![v3 length])
  {
    AKPrint(@"Country code for this account: ", v4, v5, v6, v7, v8, v9, v10, v13);
    uint64_t v11 = AKReadLine(1024);

    if (v11)
    {
      [(AKAppleIDAuthenticationCommandLineContext *)self setCountryCode:v11];
      id v3 = (void *)v11;
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (id)_promptForFirstName
{
  id v3 = [(AKAppleIDAuthenticationCommandLineContext *)self firstName];
  if (![v3 length])
  {
    AKPrint(@"Enter first name for the account: ", v4, v5, v6, v7, v8, v9, v10, v13);
    uint64_t v11 = AKReadLine(1024);

    if (v11)
    {
      [(AKAppleIDAuthenticationCommandLineContext *)self setFirstName:v11];
      id v3 = (void *)v11;
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (id)_promptForLastName
{
  id v3 = [(AKAppleIDAuthenticationCommandLineContext *)self lastName];
  if (![v3 length])
  {
    AKPrint(@"Enter last name for the account: ", v4, v5, v6, v7, v8, v9, v10, v13);
    uint64_t v11 = AKReadLine(1024);

    if (v11)
    {
      [(AKAppleIDAuthenticationCommandLineContext *)self setLastName:v11];
      id v3 = (void *)v11;
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (id)_promptUserForTermsWithResponseDictionary:(id)a3
{
  v100[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 objectForKeyedSubscript:@"termsList"];
  uint64_t v5 = [v4 firstObject];
  if (!v5) {
    goto LABEL_12;
  }
  if (![(AKAppleIDAuthenticationCommandLineContext *)self termsAccepted])
  {
    AKPrintLine(@"Do you agree to terms and conditions?", v6, v7, v8, v9, v10, v11, v12, v96);
    AKPrint(@"Y to agree / READ to print out the terms (please just say yess!): ", v13, v14, v15, v16, v17, v18, v19, v96);
    uint64_t v20 = AKReadLine(10);
    if ([v20 isEqualToString:@"READ"])
    {
      AKPrintLine(@"OK here we go…", v21, v22, v23, v24, v25, v26, v27, v96);
      AKPrintLine(&stru_1EE40D360, v28, v29, v30, v31, v32, v33, v34, v96);
      uint64_t v35 = [v5 objectForKeyedSubscript:@"termsPageDetails"];
      uint64_t v36 = [v35 objectForKeyedSubscript:@"title"];
      AKPrintLine(v36, v37, v38, v39, v40, v41, v42, v43, v96);

      AKPrintLine(&stru_1EE40D360, v44, v45, v46, v47, v48, v49, v50, v96);
      id v51 = [v35 objectForKeyedSubscript:@"prologue"];
      AKPrintLine(v51, v52, v53, v54, v55, v56, v57, v58, v96);

      AKPrintLine(&stru_1EE40D360, v59, v60, v61, v62, v63, v64, v65, v96);
      id v66 = [v35 objectForKeyedSubscript:@"agree"];
      AKPrintLine(v66, v67, v68, v69, v70, v71, v72, v73, v96);

      AKPrint(@"Y to agree: ", v74, v75, v76, v77, v78, v79, v80, v96);
      v81 = AKReadLine(10);

      v82 = [v81 lowercaseString];
      uint64_t v20 = [v82 substringToIndex:1];

      if ([v20 isEqualToString:@"y"]) {
        [(AKAppleIDAuthenticationCommandLineContext *)self setTermsAccepted:1];
      }
    }
  }
  if ([(AKAppleIDAuthenticationCommandLineContext *)self termsAccepted])
  {
    v83 = _AKLogSystem();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v96) = 0;
      _os_log_impl(&dword_193494000, v83, OS_LOG_TYPE_DEFAULT, "User agreed to terms and conditions", (uint8_t *)&v96, 2u);
    }

    AKPrintLine(@"⚖ Terms and Conditions Accepted…", v84, v85, v86, v87, v88, v89, v90, v96);
    v99 = @"acceptedTerms";
    v97[0] = @"versions";
    v91 = objc_msgSend(v5, "objectForKeyedSubscript:");
    v98[0] = v91;
    v97[1] = @"deviceVersions";
    v92 = objc_msgSend(v5, "objectForKeyedSubscript:");
    v98[1] = v92;
    v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];
    v100[0] = v93;
    v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:&v99 count:1];
  }
  else
  {
LABEL_12:
    v94 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v94;
}

- (id)_jsonPostbackDictionaryForCode:(id)a3 numberId:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v14 = @"id";
  v15[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v7 setObject:v8 forKey:@"phoneNumber"];
  if (v5)
  {
    uint64_t v12 = @"code";
    id v13 = v5;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v7 setObject:v9 forKey:@"securityCode"];
  }
  [v7 setObject:@"sms" forKey:@"mode"];
  uint64_t v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationCommandLineContext _jsonPostbackDictionaryForCode:numberId:]();
  }

  return v7;
}

- (NSNumber)secondFactorCode
{
  return self->_secondFactorCode;
}

- (void)setSecondFactorCode:(id)a3
{
}

- (int64_t)verificationType
{
  return self->_verificationType;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSDate)birthday
{
  return self->_birthday;
}

- (void)setBirthday:(id)a3
{
}

- (BOOL)termsAccepted
{
  return self->_termsAccepted;
}

- (void)setTermsAccepted:(BOOL)a3
{
  self->_termsAccepted = a3;
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (NSString)localSecret
{
  return self->_localSecret;
}

- (void)setLocalSecret:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)smsSecurityCode
{
  return self->_smsSecurityCode;
}

- (void)setSmsSecurityCode:(id)a3
{
}

- (AKCommandLineUtilities)utility
{
  return self->_utility;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (AKChangePasswordController)changePasswordController
{
  return self->_changePasswordController;
}

- (void)setChangePasswordController:(id)a3
{
}

- (AKForgotPasswordController)forgotPasswordController
{
  return self->_forgotPasswordController;
}

- (void)setForgotPasswordController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forgotPasswordController, 0);
  objc_storeStrong((id *)&self->_changePasswordController, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_utility, 0);
  objc_storeStrong((id *)&self->_smsSecurityCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_localSecret, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);

  objc_storeStrong((id *)&self->_secondFactorCode, 0);
}

- (void)_presentServerUIWithConfiguration:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 request];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "request: %@", v4, 0xCu);
}

- (void)_handleServerUIBirthdayVerificationWithResponseDictionary:configuration:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Providing birthday info.", v2, v3, v4, v5, v6);
}

- (void)_handleServerUIPasswordVerificationWithResponseDictionary:configuration:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Providing password info.", v2, v3, v4, v5, v6);
}

- (void)_handleServerUIPhoneVerificationWithResponseDictionary:configuration:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Providing Phone number info.", v2, v3, v4, v5, v6);
}

- (void)_collectAndHandleTermsAndConditionsWithResponseDictionary:configuration:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Finishing up Apple ID creation flow.", v2, v3, v4, v5, v6);
}

- (void)_handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "No trusted number selected", v2, v3, v4, v5, v6);
}

- (void)_handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Sending selected trusted number", v2, v3, v4, v5, v6);
}

- (void)_handleServerUISMSVerificationWithResponseDictionary:statusCode:configuration:completion:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Selecting trusted numbers", v2, v3, v4, v5, v6);
}

void __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Error, not attempting to collect second factor code", v2, v3, v4, v5, v6);
}

void __134__AKAppleIDAuthenticationCommandLineContext__handleServerUISMSVerificationWithResponseDictionary_statusCode_configuration_completion___block_invoke_135_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Selected trusted number response %@", v2, v3, v4, v5, v6);
}

- (void)_promptUserForSelectionWithTrustedNumbers:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_193494000, v1, OS_LOG_TYPE_ERROR, "Invalid trusted number selection %@ - %@", v2, 0x16u);
}

void __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Received response %@", v2, v3, v4, v5, v6);
}

void __96__AKAppleIDAuthenticationCommandLineContext__beginDataTaskWithRequest_configuration_completion___block_invoke_153_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Attempt to show server UI with unsupported configuration (still in the works)", v2, v3, v4, v5, v6);
}

- (void)_promptForBirthday
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_193494000, v0, OS_LOG_TYPE_ERROR, "(%@)", v1, 0xCu);
}

- (void)_jsonPostbackDictionaryForCode:numberId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Constructed SMS postback dictionary - %@", v2, v3, v4, v5, v6);
}

@end