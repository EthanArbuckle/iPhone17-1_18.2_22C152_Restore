@interface FTRegAccountServiceDelegate
- (BOOL)_account:(id)a3 matchesSetupParameters:(id)a4;
- (BOOL)_hasAccount;
- (BOOL)_hasOperationalAccount;
- (BOOL)_shouldSkipAccountSetup:(id)a3;
- (BOOL)serviceIsAvailable;
- (CNFRegController)regController;
- (FTRegAccountServiceDelegate)init;
- (FTRegAccountServiceDelegate)initWithRegController:(id)a3;
- (IDSAccountController)accountController;
- (NSDictionary)responseDictionary;
- (id)_defaultSetupRequestParameters;
- (id)_existingAccountForSetupParameters:(id)a3;
- (id)_existingOperationalAccount;
- (id)_logName;
- (id)completionHandler;
- (id)displayName;
- (id)name;
- (id)parametersForIdentityEstablishmentRequest;
- (id)parametersForLoginRequest;
- (id)serviceIdentifier;
- (int64_t)serviceType;
- (void)_cleanup;
- (void)_handleFailureWithErrorCode:(int64_t)a3;
- (void)_handleSuccess:(BOOL)a3 error:(id)a4;
- (void)handleLoginResponse:(id)a3 completion:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setRegController:(id)a3;
- (void)setResponseDictionary:(id)a3;
- (void)setupOperationFailed;
@end

@implementation FTRegAccountServiceDelegate

- (FTRegAccountServiceDelegate)initWithRegController:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FTRegAccountServiceDelegate;
  v5 = [(FTRegAccountServiceDelegate *)&v15 init];
  if (!v5)
  {
LABEL_6:
    v11 = v5;
    goto LABEL_10;
  }
  v6 = csui_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      [v4 serviceType];
      v8 = FTCServiceNameForServiceType();
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Creating SetupAssistant delegate with type: %@", buf, 0xCu);
    }
    v9 = [MEMORY[0x263F08B88] mainThread];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __53__FTRegAccountServiceDelegate_initWithRegController___block_invoke;
    v13[3] = &unk_2644F04A0;
    v10 = v5;
    v14 = v10;
    objc_msgSend(v9, "__im_performBlock:waitUntilDone:", v13, 1);

    [(FTRegAccountServiceDelegate *)v10 setRegController:v4];
    goto LABEL_6;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Not creating SetupAssistant delegate due to missing registration controller", buf, 2u);
  }

  v11 = 0;
LABEL_10:

  return v11;
}

void __53__FTRegAccountServiceDelegate_initWithRegController___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F4A568] sharedInstance];
  v2 = [*(id *)(a1 + 32) name];
  [v3 addListenerID:v2 capabilities:*MEMORY[0x263F4A888]];
}

- (FTRegAccountServiceDelegate)init
{
  id v3 = +[CNFRegController controllerForServiceType:[(FTRegAccountServiceDelegate *)self serviceType]];
  id v4 = [(FTRegAccountServiceDelegate *)self initWithRegController:v3];

  return v4;
}

- (id)_logName
{
  v2 = NSString;
  id v3 = [(FTRegAccountServiceDelegate *)self displayName];
  id v4 = [v2 stringWithFormat:@"SetupAssistant:%@", v3];

  return v4;
}

- (IDSAccountController)accountController
{
  accountController = self->_accountController;
  if (!accountController)
  {
    int64_t v4 = [(FTRegAccountServiceDelegate *)self serviceType];
    v5 = (id *)MEMORY[0x263F49FB8];
    if (v4 != 1) {
      v5 = (id *)MEMORY[0x263F49FA0];
    }
    v6 = (objc_class *)MEMORY[0x263F49FF8];
    id v7 = *v5;
    v8 = (IDSAccountController *)[[v6 alloc] initWithService:v7];

    v9 = self->_accountController;
    self->_accountController = v8;

    accountController = self->_accountController;
  }
  return accountController;
}

- (void)_cleanup
{
  [(FTRegAccountServiceDelegate *)self setResponseDictionary:0];
  [(FTRegAccountServiceDelegate *)self setCompletionHandler:0];
}

- (void)_handleSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = csui_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = @"NO";
    if (v4) {
      v8 = @"YES";
    }
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Finished successfully:%@, error:%@", (uint8_t *)&v11, 0x16u);
  }

  v9 = [(FTRegAccountServiceDelegate *)self completionHandler];

  if (v9)
  {
    v10 = [(FTRegAccountServiceDelegate *)self completionHandler];
    v10[2](v10, 1, 0);
  }
  [(FTRegAccountServiceDelegate *)self _cleanup];
}

- (void)_handleFailureWithErrorCode:(int64_t)a3
{
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ftreg.buddyerror" code:a3 userInfo:0];
  [(FTRegAccountServiceDelegate *)self _handleSuccess:0 error:v4];
}

- (BOOL)_hasAccount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [MEMORY[0x263F08B88] mainThread];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__FTRegAccountServiceDelegate__hasAccount__block_invoke;
  v5[3] = &unk_2644F04C8;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "__im_performBlock:waitUntilDone:", v5, 1);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __42__FTRegAccountServiceDelegate__hasAccount__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) regController];
  char v3 = [v2 isConnected];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) regController];
    [v4 connect:1];
  }
  v5 = [*(id *)(a1 + 32) regController];
  uint64_t v6 = [v5 accountsWithFilter:32772];

  id v7 = csui_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    uint64_t v10 = [v6 count];
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Found %lu existing accounts %@", (uint8_t *)&v9, 0x16u);
  }

  if (v6) {
    BOOL v8 = [v6 count] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
}

- (BOOL)_hasOperationalAccount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v3 = [MEMORY[0x263F08B88] mainThread];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__FTRegAccountServiceDelegate__hasOperationalAccount__block_invoke;
  v5[3] = &unk_2644F04C8;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "__im_performBlock:waitUntilDone:", v5, 1);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __53__FTRegAccountServiceDelegate__hasOperationalAccount__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) regController];
  char v3 = [v2 isConnected];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) regController];
    [v4 connect:1];
  }
  v5 = [*(id *)(a1 + 32) regController];
  uint64_t v6 = [v5 accountsWithFilter:65540];

  id v7 = csui_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    uint64_t v10 = [v6 count];
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Found %lu operational accounts %@", (uint8_t *)&v9, 0x16u);
  }

  if (v6) {
    BOOL v8 = [v6 count] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
}

- (BOOL)_account:(id)a3 matchesSetupParameters:(id)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a4, "__ftreg_responseAppleID");
  BOOL v8 = v7;
  if (v6 && [v7 length])
  {
    int v9 = [(FTRegAccountServiceDelegate *)self regController];
    uint64_t v10 = [v9 loginForAccount:v6];

    char v11 = [v10 isEqualToIgnoringCase:v8];
    if ([v10 hasMobileMeSuffix] && objc_msgSend(v8, "hasMobileMeSuffix"))
    {
      v12 = [v8 stripMobileMSuffixIfPresent];
      uint64_t v13 = [v10 stripMobileMSuffixIfPresent];
      char v14 = [v12 isEqualToIgnoringCase:v13];

      v11 |= v14;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)_existingAccountForSetupParameters:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(v4, "__ftreg_responseAppleID");
  id v6 = csui_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Looking for existing account for Apple ID: %@", buf, 0xCu);
  }

  if ([v5 length])
  {
    id v7 = [(FTRegAccountServiceDelegate *)self regController];
    BOOL v8 = [v7 accountsWithFilter:32772];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (-[FTRegAccountServiceDelegate _account:matchesSetupParameters:](self, "_account:matchesSetupParameters:", v14, v4, (void)v17))
          {
            id v15 = v14;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_14:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_existingOperationalAccount
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [(FTRegAccountServiceDelegate *)self regController];
  char v3 = [v2 accountsWithFilter:65540];

  id v4 = csui_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = [v3 count];
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu existing operational accounts", (uint8_t *)&v7, 0xCu);
  }

  if (v3 && [v3 count])
  {
    v5 = [v3 objectAtIndex:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldSkipAccountSetup:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v5 = csui_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Checking if user has denied permission to use phoneNumber for FaceTime/Messages.", buf, 2u);
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v16 = MEMORY[0x263EF8330];
  int v7 = v6;
  long long v17 = v7;
  uint64_t v8 = dispatch_get_global_queue(33, 0);
  IDSRegistrationControlGetStateForRegistrationType();

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v19 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v10 = [(FTRegAccountServiceDelegate *)self _existingOperationalAccount];
    if (v10
      && ![(FTRegAccountServiceDelegate *)self _account:v10 matchesSetupParameters:v4])
    {
      uint64_t v11 = csui_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v10 login];
        uint64_t v13 = [(FTRegAccountServiceDelegate *)self responseDictionary];
        char v14 = objc_msgSend(v13, "__ftreg_responseAppleID");
        *(_DWORD *)buf = 138412546;
        id v23 = v12;
        __int16 v24 = 2112;
        v25 = v14;
        _os_log_impl(&dword_21ED18000, v11, OS_LOG_TYPE_DEFAULT, "A registered AppleID account already exists (%@), but we are setting up for: %@. Bailing.", buf, 0x16u);
      }
      *((unsigned char *)v19 + 24) = 1;
    }

    BOOL v9 = *((unsigned char *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  return v9;
}

intptr_t __55__FTRegAccountServiceDelegate__shouldSkipAccountSetup___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    char v3 = csui_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEFAULT, "User has denied use of phoneNumber for FaceTime/Messages. Skipping account setup", v5, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)serviceIdentifier
{
  return 0;
}

- (id)parametersForLoginRequest
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  char v3 = [MEMORY[0x263F08B88] mainThread];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__FTRegAccountServiceDelegate_parametersForLoginRequest__block_invoke;
  v6[3] = &unk_2644F04C8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "__im_performBlock:waitUntilDone:", v6, 1);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__FTRegAccountServiceDelegate_parametersForLoginRequest__block_invoke(uint64_t a1)
{
  v2 = csui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Building setup request parameters", buf, 2u);
  }

  if ([*(id *)(a1 + 32) serviceIsAvailable])
  {
    char v3 = [MEMORY[0x263F841B0] sharedManager];
    if ([v3 isMultiUser])
    {
      id v4 = [MEMORY[0x263F841B0] sharedManager];
      v5 = [v4 currentUser];
      if ([v5 inFirstLoginSession])
      {

        goto LABEL_12;
      }
      int v12 = [*(id *)(a1 + 32) _hasAccount];

      if (!v12)
      {
LABEL_12:
        uint64_t v8 = csui_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v16 = 0;
          uint64_t v10 = "No accounts, sending default request parameters";
          uint64_t v11 = (uint8_t *)&v16;
          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
    else
    {
      char v6 = [*(id *)(a1 + 32) _hasAccount];

      if ((v6 & 1) == 0) {
        goto LABEL_12;
      }
    }
    int v7 = [*(id *)(a1 + 32) _hasOperationalAccount];
    uint64_t v8 = csui_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        __int16 v18 = 0;
        uint64_t v10 = "Operational account found, sending default parameters to try and refresh the account";
        uint64_t v11 = (uint8_t *)&v18;
LABEL_16:
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else if (v9)
    {
      *(_WORD *)long long v17 = 0;
      uint64_t v10 = "Found a non-operational account, sending default request parameters";
      uint64_t v11 = v17;
      goto LABEL_16;
    }
LABEL_17:

    uint64_t v13 = [*(id *)(a1 + 32) _defaultSetupRequestParameters];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (id)_defaultSetupRequestParameters
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"protocol-version";
  v5[0] = @"4";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)parametersForIdentityEstablishmentRequest
{
  return 0;
}

- (void)handleLoginResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F08B88] mainThread];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__FTRegAccountServiceDelegate_handleLoginResponse_completion___block_invoke;
  v11[3] = &unk_2644F0578;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend(v8, "__im_performBlock:", v11);
}

void __62__FTRegAccountServiceDelegate_handleLoginResponse_completion___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setResponseDictionary:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCompletionHandler:*(void *)(a1 + 48)];
  v2 = csui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Got setup parameters:", buf, 2u);
  }

  [*(id *)(a1 + 40) enumerateKeysAndObjectsUsingBlock:&__block_literal_global];
  char v3 = *(void **)(a1 + 40);
  if (!v3 || ![v3 count])
  {
    uint64_t v8 = csui_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [*(id *)(a1 + 32) displayName];
      *(_DWORD *)buf = 138412290;
      v55 = v11;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Received empty setup response. Skipping setup for %@.", buf, 0xCu);
    }
    goto LABEL_11;
  }
  id v4 = [*(id *)(a1 + 32) responseDictionary];
  char v5 = objc_msgSend(v4, "__ftreg_isValidSetupDictionary");

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v6 responseDictionary];
    LODWORD(v6) = [v6 _shouldSkipAccountSetup:v7];

    if (v6)
    {
      uint64_t v8 = csui_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [*(id *)(a1 + 32) responseDictionary];
        objc_msgSend(v9, "__ftreg_responseAppleID");
        id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v10;
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Skipping setup for %@ because _shouldSkipAccountSetup returned YES.", buf, 0xCu);
      }
LABEL_11:

      [*(id *)(a1 + 32) _handleSuccess:1 error:0];
      return;
    }
    uint64_t v14 = [*(id *)(a1 + 32) responseDictionary];
    int v15 = objc_msgSend(v14, "__ftreg_responseIsUpgrade");

    __int16 v16 = csui_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = @"NO";
      if (v15) {
        long long v17 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v55 = v17;
      _os_log_impl(&dword_21ED18000, v16, OS_LOG_TYPE_DEFAULT, "Handling setup response [isUpgrade=%@], kicking off account setup", buf, 0xCu);
    }

    __int16 v18 = [*(id *)(a1 + 32) responseDictionary];
    long long v19 = objc_msgSend(v18, "__ftreg_candidateAliases");

    if ((unint64_t)[v19 count] > 1)
    {
LABEL_32:
      v32 = csui_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v19 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138412290;
        v55 = v33;
        _os_log_impl(&dword_21ED18000, v32, OS_LOG_TYPE_DEFAULT, "We have user-selectable aliases [%@]. Deferring to the setup manager.", buf, 0xCu);
      }
      v34 = +[FTRegAppleIDSetupManager sharedInstance];
      v35 = [*(id *)(a1 + 32) responseDictionary];
      objc_msgSend(v34, "addSetupDictionary:forService:", v35, objc_msgSend(*(id *)(a1 + 32), "serviceType"));

      [*(id *)(a1 + 32) _handleSuccess:1 error:0];
      goto LABEL_35;
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v51 != v23) {
            objc_enumerationMutation(v20);
          }
          if (objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * i), "_appearsToBePhoneNumber", (void)v50))
          {

            goto LABEL_32;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v50 objects:v62 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    v25 = [*(id *)(a1 + 32) responseDictionary];
    uint64_t v26 = IDSParseAuthDictionary();

    v27 = [*(id *)(a1 + 32) accountController];
    v28 = [v26 objectForKey:*MEMORY[0x263F4A138]];
    v29 = objc_msgSend(v28, "__imArrayByApplyingBlock:", &__block_literal_global_70);

    v30 = [MEMORY[0x263F3BB18] sharedInstance];
    char v31 = [v30 supportsSMS];

    if (v31)
    {
      if ([v29 count]) {
        [v29 arrayByAddingObject:*MEMORY[0x263F4A280]];
      }
      else {
      uint64_t v36 = IMSingleObjectArray();
      }

      v29 = (void *)v36;
    }
    uint64_t v37 = objc_msgSend(*(id *)(a1 + 32), "serviceType", (void)v50);
    v38 = (id *)MEMORY[0x263F49FB8];
    if (v37 != 1) {
      v38 = (id *)MEMORY[0x263F49FA0];
    }
    v39 = (__CFString *)*v38;
    v40 = [v26 objectForKey:*MEMORY[0x263F4A130]];
    v41 = [v26 objectForKey:*MEMORY[0x263F4A140]];
    v42 = csui_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v55 = v39;
      __int16 v56 = 2112;
      v57 = v40;
      __int16 v58 = 2112;
      v59 = v41;
      __int16 v60 = 2112;
      v61 = v29;
      _os_log_impl(&dword_21ED18000, v42, OS_LOG_TYPE_DEFAULT, " => Setting up service: %@   with apple id: %@  profile id: %@  aliases: %@", buf, 0x2Au);
    }

    v43 = [v27 serviceName];
    v44 = [v27 accountWithLoginID:v40 service:v43];

    if ([(__CFString *)v44 isActive]
      && [(__CFString *)v44 registrationStatus] == 5)
    {
      v45 = csui_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v44;
        v46 = " => Has existing registered account: %@";
        v47 = v45;
        uint32_t v48 = 12;
LABEL_51:
        _os_log_impl(&dword_21ED18000, v47, OS_LOG_TYPE_DEFAULT, v46, buf, v48);
      }
    }
    else
    {
      v49 = csui_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v44;
        _os_log_impl(&dword_21ED18000, v49, OS_LOG_TYPE_DEFAULT, " => Existing account: %@", buf, 0xCu);
      }

      if (![(__CFString *)v44 isUserDisabled])
      {
        v45 = objc_msgSend(v29, "__imSetFromArray");
        [v27 setupAccountWithSetupParameters:v26 aliases:v45 completionHandler:&__block_literal_global_81];
        goto LABEL_53;
      }
      v45 = csui_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v46 = " => Account was disabled by the user, not setting up...";
        v47 = v45;
        uint32_t v48 = 2;
        goto LABEL_51;
      }
    }
LABEL_53:

    [*(id *)(a1 + 32) _handleSuccess:1 error:0];
LABEL_35:

    return;
  }
  id v12 = csui_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [*(id *)(a1 + 32) displayName];
    *(_DWORD *)buf = 138412290;
    v55 = v13;
    _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "Received incomplete setup response. Failing setup for %@.", buf, 0xCu);
  }
  [*(id *)(a1 + 32) _handleFailureWithErrorCode:4000];
}

void __62__FTRegAccountServiceDelegate_handleLoginResponse_completion___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 isEqual:@"password"];
  id v7 = csui_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v12) = 0;
      id v9 = "  => password : REDACTED";
      id v10 = v7;
      uint32_t v11 = 2;
LABEL_6:
      _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    }
  }
  else if (v8)
  {
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    id v15 = v5;
    id v9 = "  => %@ : %@";
    id v10 = v7;
    uint32_t v11 = 22;
    goto LABEL_6;
  }
}

id __62__FTRegAccountServiceDelegate_handleLoginResponse_completion___block_invoke_67(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 objectForKey:@"uri"];
  id v4 = [v2 objectForKey:@"status"];

  LODWORD(v2) = [v4 intValue];
  if (v2 == 5051)
  {
    id v5 = [v3 _stripFZIDPrefix];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __62__FTRegAccountServiceDelegate_handleLoginResponse_completion___block_invoke_78(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = csui_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a3) {
      id v7 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Got response from setup operation. Success=%@, error=%@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)setupOperationFailed
{
  char v3 = [MEMORY[0x263F08B88] mainThread];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__FTRegAccountServiceDelegate_setupOperationFailed__block_invoke;
  v4[3] = &unk_2644F04A0;
  v4[4] = self;
  objc_msgSend(v3, "__im_performBlock:waitUntilDone:", v4, 0);
}

uint64_t __51__FTRegAccountServiceDelegate_setupOperationFailed__block_invoke(uint64_t a1)
{
  id v2 = csui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEFAULT, "Setup operation failed. Cleaning up.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _cleanup];
}

- (int64_t)serviceType
{
  return 0;
}

- (id)name
{
  return 0;
}

- (id)displayName
{
  return 0;
}

- (BOOL)serviceIsAvailable
{
  return 0;
}

- (CNFRegController)regController
{
  return self->_regController;
}

- (void)setRegController:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setResponseDictionary:(id)a3
{
}

- (void)setAccountController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_regController, 0);
}

@end