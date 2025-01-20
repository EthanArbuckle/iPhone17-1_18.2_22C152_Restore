@interface FARequestConfigurator
- (AKAppleIDAuthenticationContext)authContext;
- (BOOL)_canConnectToAPS;
- (BOOL)attachSetupHeader;
- (FARequestConfigurator)initWithAccount:(id)a3;
- (NSDictionary)ephemeralAuthResults;
- (_TtP12FamilyCircle15FARequestSigner_)signer;
- (id)_account;
- (id)_accountStore;
- (id)_akSigningController;
- (id)_authContext;
- (id)_familyGrandSlamSigner;
- (id)_familyTokenForGrandSlamAccount:(id)a3 andTokenID:(id)a4;
- (id)_fresnoPayloadWithAdditionalPayload:(id)a3;
- (id)_grandSlamAccount;
- (id)_grandSlamSigner;
- (id)_serviceOwnersManager;
- (void)_addAccountForServiceType:(id)a3 toPayload:(id)a4 forKey:(id)a5;
- (void)_canConnectToAPS;
- (void)_resourceLoadDelegate:(id)a3;
- (void)addFresnoHeadersToRequest:(id)a3;
- (void)addFresnoHeadersToRequest:(id)a3 withCompletion:(id)a4;
- (void)addFresnoPayloadToRequest:(id)a3 additionalPayload:(id)a4;
- (void)addPayload:(id)a3 toRequest:(id)a4;
- (void)pushTokenWithCompletion:(id)a3;
- (void)renewCredentialsWithCompletion:(id)a3;
- (void)setAttachSetupHeader:(BOOL)a3;
- (void)setAuthContext:(id)a3;
- (void)setEphemeralAuthResults:(id)a3;
- (void)setSigner:(id)a3;
- (void)signURLRequest:(id)a3;
- (void)updateWithEphemeralAuthResults:(id)a3;
@end

@implementation FARequestConfigurator

- (FARequestConfigurator)initWithAccount:(id)a3
{
  id v5 = a3;
  v6 = [(FARequestConfigurator *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v7->_attachSetupHeader = 1;
  }

  return v7;
}

- (void)updateWithEphemeralAuthResults:(id)a3
{
  id v4 = a3;
  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FARequestConfigurator updateWithEphemeralAuthResults:](v5);
  }

  [(FARequestConfigurator *)self setEphemeralAuthResults:v4];
  v6 = [[FARequestEphemeralSigner alloc] initWithEphemeralAuthResults:v4];

  [(FARequestConfigurator *)self setSigner:v6];
  v7 = [(FARequestEphemeralSigner *)v6 account];
  account = self->_account;
  self->_account = v7;
}

- (void)addFresnoHeadersToRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke;
  aBlock[3] = &unk_1E6924F40;
  aBlock[4] = self;
  id v8 = v6;
  id v17 = v8;
  id v18 = v7;
  id v9 = v7;
  v10 = _Block_copy(aBlock);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_80;
  v13[3] = &unk_1E6924FB8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v10;
  id v11 = v10;
  id v12 = v8;
  [(FARequestConfigurator *)self _resourceLoadDelegate:v13];
}

void __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) ephemeralAuthResults];
  BOOL v8 = v7 != 0;

  id v9 = *(void **)(a1 + 40);
  v10 = [*(id *)(a1 + 32) _account];
  objc_msgSend(v9, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v10, v8);

  id v11 = *(void **)(a1 + 40);
  id v12 = [*(id *)(a1 + 32) _account];
  objc_msgSend(v11, "aa_addLoggedInAppleIDHeaderWithAccount:", v12);

  objc_msgSend(*(id *)(a1 + 40), "aa_addLocationSharingAllowedHeader");
  objc_msgSend(*(id *)(a1 + 40), "ak_addClientTimeHeader");
  v13 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v14 = (void *)MEMORY[0x1E4F1CA20];
  id v15 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  v33[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  id v17 = [v14 minimizedLanguagesFromLanguages:v16];
  id v18 = [v17 componentsJoinedByString:@","];

  v19 = *(void **)(a1 + 40);
  v20 = [v13 componentsJoinedByString:@", "];
  [v19 setValue:v20 forHTTPHeaderField:@"X-MMe-Language"];

  [*(id *)(a1 + 40) setValue:v18 forHTTPHeaderField:@"Accept-Language"];
  if (_os_feature_enabled_impl()) {
    [*(id *)(a1 + 40) setValue:@"true" forHTTPHeaderField:@"X-iCloud-Experiment-Mode"];
  }
  v21 = objc_msgSend(v5, "aa_hexString");
  if (v21) {
    [*(id *)(a1 + 40) setValue:v21 forHTTPHeaderField:@"X-APNS-Push-Token"];
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 80)) {
    [*(id *)(a1 + 40) setValue:@"true" forHTTPHeaderField:@"X-MMe-Family-Setup"];
  }
  id v22 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v23 = +[FamilyDefaultSuites familyUserDefaultsSuite];
  v24 = (void *)[v22 initWithSuiteName:v23];

  uint64_t v25 = [v24 integerForKey:@"MockInviteCode"];
  v26 = _FALogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 134217984;
    uint64_t v32 = v25;
    _os_log_impl(&dword_1D252C000, v26, OS_LOG_TYPE_DEFAULT, "MockInviteCode %ld", (uint8_t *)&v31, 0xCu);
  }

  if (v25 == 1) {
    [*(id *)(a1 + 40) setValue:@"sender" forHTTPHeaderField:@"X-Apple-Family-Mock-Invite"];
  }
  [*(id *)(a1 + 32) signURLRequest:*(void *)(a1 + 40)];
  v27 = _FALogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [*(id *)(a1 + 40) allHTTPHeaderFields];
    v29 = [v28 allKeys];
    int v31 = 138477827;
    uint64_t v32 = (uint64_t)v29;
    _os_log_impl(&dword_1D252C000, v27, OS_LOG_TYPE_DEFAULT, "Headers added to request %{private}@", (uint8_t *)&v31, 0xCu);
  }
  uint64_t v30 = *(void *)(a1 + 48);
  if (v30) {
    (*(void (**)(uint64_t, uint64_t, id))(v30 + 16))(v30, 1, v6);
  }
}

void __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) ephemeralAuthResults];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) ephemeralAuthResults];
    [v3 updateWithAuthResults:v5];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_2;
  v7[3] = &unk_1E6924F90;
  uint64_t v6 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  [v3 signRequest:v6 withCompletionHandler:v7];
}

void __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithBool:a2];
    *(_DWORD *)buf = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1D252C000, v6, OS_LOG_TYPE_DEFAULT, "LoadDelegate signed request %@ - %@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_82;
  v11[3] = &unk_1E6924F68;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v9;
  id v10 = v5;
  [v8 pushTokenWithCompletion:v11];
}

void __66__FARequestConfigurator_addFresnoHeadersToRequest_withCompletion___block_invoke_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D252C000, v4, OS_LOG_TYPE_DEFAULT, "Push token fetched", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)signURLRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(FARequestConfigurator *)self signer];

  if (v5)
  {
    [(FARequestConfigurator *)self signer];
  }
  else
  {
    uint64_t v6 = [(FARequestConfigurator *)self _grandSlamSigner];
    [v6 signURLRequest:v4];

    [(FARequestConfigurator *)self _familyGrandSlamSigner];
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 signURLRequest:v4];
}

- (void)addFresnoHeadersToRequest:(id)a3
{
  id v4 = a3;
  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D252C000, v5, OS_LOG_TYPE_DEFAULT, "DEPRECATED - Please use completion based signer", buf, 2u);
  }

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__FARequestConfigurator_addFresnoHeadersToRequest___block_invoke;
  v8[3] = &unk_1E6924FE0;
  dispatch_semaphore_t v9 = v6;
  id v7 = v6;
  [(FARequestConfigurator *)self addFresnoHeadersToRequest:v4 withCompletion:v8];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __51__FARequestConfigurator_addFresnoHeadersToRequest___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_canConnectToAPS
{
  kern_return_t v2;
  int v3;
  NSObject *v4;
  BOOL v5;
  __SecTask *v7;
  __SecTask *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  audit_token_t v12;
  mach_msg_type_number_t task_info_outCnt;
  audit_token_t task_info_out;

  memset(&task_info_out, 0, sizeof(task_info_out));
  task_info_outCnt = 8;
  v2 = task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)&task_info_out, &task_info_outCnt);
  if (v2)
  {
    id v3 = v2;
    id v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(FARequestConfigurator *)v3 _canConnectToAPS];
    }
  }
  else
  {
    id v12 = task_info_out;
    id v7 = SecTaskCreateWithAuditToken(0, &v12);
    if (!v7)
    {
      id v11 = _FALogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[FARequestConfigurator _canConnectToAPS](v11);
      }

      goto LABEL_5;
    }
    id v8 = v7;
    *(void *)v12.val = 0;
    dispatch_semaphore_t v9 = (void *)SecTaskCopyValueForEntitlement(v7, @"aps-connection-initiate", (CFErrorRef *)&v12);

    id v4 = *(NSObject **)v12.val;
    if (!*(void *)v12.val)
    {
      id v5 = v9 != 0;
      CFRelease(v8);
      return v5;
    }
    id v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(FARequestConfigurator *)(uint64_t)v4 _canConnectToAPS];
    }

    CFRelease(v8);
  }

LABEL_5:
  LOBYTE(v5) = 0;
  return v5;
}

- (void)pushTokenWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6925008;
  id v5 = v4;
  aBlock[4] = self;
  id v13 = v5;
  dispatch_semaphore_t v6 = (void (**)(void))_Block_copy(aBlock);
  if (![(FARequestConfigurator *)self _canConnectToAPS])
  {
    id v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D252C000, v8, OS_LOG_TYPE_DEFAULT, "Process can't connect to APS. Skipping token retrieval step", buf, 2u);
    }

    goto LABEL_7;
  }
  if (self->_pushToken)
  {
LABEL_7:
    v6[2](v6);
    goto LABEL_8;
  }
  id v7 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke_88;
  v9[3] = &unk_1E6924C28;
  v9[4] = self;
  id v10 = v6;
  [v7 fetchAAURLConfigurationWithCompletion:v9];

LABEL_8:
}

uint64_t __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 72));
}

void __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke_88_cold_1((uint64_t)v5, (uint64_t)v7, v8);
    }
  }
  dispatch_semaphore_t v9 = [v5 apsEnvironment];
  id v10 = objc_alloc(MEMORY[0x1E4F4E1E8]);
  id v11 = (void *)[v10 initWithEnvironmentName:v9 queue:MEMORY[0x1E4F14428]];
  id v12 = [v11 publicToken];
  if (!v12)
  {
    id v13 = _FALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1D252C000, v13, OS_LOG_TYPE_DEFAULT, "APSConnection did not give us a publicToken for environment %@", (uint8_t *)&v17, 0xCu);
    }
  }
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 72);
  *(void *)(v14 + 72) = v12;
  id v16 = v12;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addFresnoPayloadToRequest:(id)a3 additionalPayload:(id)a4
{
  id v6 = a3;
  id v7 = [(FARequestConfigurator *)self _fresnoPayloadWithAdditionalPayload:a4];
  id v8 = [v6 HTTPBody];

  if (v8)
  {
    dispatch_semaphore_t v9 = (void *)MEMORY[0x1E4F28F98];
    id v10 = [v6 HTTPBody];
    id v11 = [v9 propertyListWithData:v10 options:1 format:0 error:0];

    id v12 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [v11 addEntriesFromDictionary:v7];
      uint64_t v14 = [v11 copy];

      id v7 = (void *)v14;
    }
  }
  id v15 = _FALogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[FARequestConfigurator addFresnoPayloadToRequest:additionalPayload:]((uint64_t)v7, v15);
  }

  objc_msgSend(v6, "aa_setBodyWithParameters:", v7);
  [v6 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
}

- (void)addPayload:(id)a3 toRequest:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "aa_setBodyWithParameters:", a3);
  [v5 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
}

- (void)renewCredentialsWithCompletion:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F17A40];
  v17[0] = MEMORY[0x1E4F1CC38];
  uint64_t v6 = *MEMORY[0x1E4F17A20];
  v16[0] = v5;
  v16[1] = v6;
  uint64_t v15 = *MEMORY[0x1E4F4BF58];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v17[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  dispatch_semaphore_t v9 = [(FARequestConfigurator *)self _account];
  if (v9)
  {
    id v10 = [(FARequestConfigurator *)self _accountStore];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__FARequestConfigurator_renewCredentialsWithCompletion___block_invoke;
    v13[3] = &unk_1E6925030;
    id v14 = v4;
    [v10 renewCredentialsForAccount:v9 options:v8 completion:v13];
  }
  else
  {
    id v11 = _FALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1D252C000, v11, OS_LOG_TYPE_DEFAULT, "No primary Apple account found. Not attempting credential renwal.", v12, 2u);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __56__FARequestConfigurator_renewCredentialsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    uint64_t v8 = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1D252C000, v6, OS_LOG_TYPE_DEFAULT, "Result of renewing credentials for family request configurator: %ld. Error: %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_account
{
  account = self->_account;
  if (!account)
  {
    id v4 = [(FARequestConfigurator *)self _accountStore];
    objc_msgSend(v4, "aa_primaryAppleAccount");
    id v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_account;
    self->_account = v5;

    account = self->_account;
  }
  return account;
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    id v4 = [MEMORY[0x1E4F179C8] defaultStore];
    id v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (id)_grandSlamAccount
{
  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    id v4 = [(FARequestConfigurator *)self _accountStore];
    id v5 = [(FARequestConfigurator *)self _account];
    objc_msgSend(v4, "aa_grandSlamAccountForiCloudAccount:", v5);
    uint64_t v6 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    int v7 = self->_grandSlamAccount;
    self->_grandSlamAccount = v6;

    grandSlamAccount = self->_grandSlamAccount;
  }
  return grandSlamAccount;
}

- (id)_grandSlamSigner
{
  grandSlamSigner = self->_grandSlamSigner;
  if (!grandSlamSigner)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F4BFC0]);
    id v5 = [(FARequestConfigurator *)self _accountStore];
    uint64_t v6 = [(FARequestConfigurator *)self _grandSlamAccount];
    int v7 = (AAGrandSlamSigner *)[v4 initWithAccountStore:v5 grandSlamAccount:v6 appTokenID:*MEMORY[0x1E4F4BF60]];
    uint64_t v8 = self->_grandSlamSigner;
    self->_grandSlamSigner = v7;

    grandSlamSigner = self->_grandSlamSigner;
  }
  return grandSlamSigner;
}

- (id)_familyGrandSlamSigner
{
  familyGrandSlamSigner = self->_familyGrandSlamSigner;
  if (!familyGrandSlamSigner)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F4BFC0]);
    id v5 = [(FARequestConfigurator *)self _accountStore];
    uint64_t v6 = [(FARequestConfigurator *)self _grandSlamAccount];
    int v7 = (AAGrandSlamSigner *)[v4 initWithAccountStore:v5 grandSlamAccount:v6 appTokenID:*MEMORY[0x1E4F4BF58]];
    uint64_t v8 = self->_familyGrandSlamSigner;
    self->_familyGrandSlamSigner = v7;

    [(AAGrandSlamSigner *)self->_familyGrandSlamSigner setHeaderFieldKey:*MEMORY[0x1E4F4BF48]];
    familyGrandSlamSigner = self->_familyGrandSlamSigner;
  }
  return familyGrandSlamSigner;
}

- (id)_akSigningController
{
  akSigningController = self->_akSigningController;
  if (!akSigningController)
  {
    id v4 = (AKAppleIDSigningController *)objc_alloc_init(MEMORY[0x1E4F4EF80]);
    id v5 = self->_akSigningController;
    self->_akSigningController = v4;

    akSigningController = self->_akSigningController;
  }
  return akSigningController;
}

- (void)_resourceLoadDelegate:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__FARequestConfigurator__resourceLoadDelegate___block_invoke;
  aBlock[3] = &unk_1E6925008;
  id v5 = v4;
  aBlock[4] = self;
  id v13 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  int v7 = v6;
  if (self->_resourceLoadDelegate)
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
    __int16 v9 = [(FARequestConfigurator *)self _authContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__FARequestConfigurator__resourceLoadDelegate___block_invoke_2;
    v10[3] = &unk_1E6925058;
    v10[4] = self;
    id v11 = v7;
    [v8 getServerUILoadDelegateWithContext:v9 completion:v10];
  }
}

uint64_t __47__FARequestConfigurator__resourceLoadDelegate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 64));
}

void __47__FARequestConfigurator__resourceLoadDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1D252C000, v7, OS_LOG_TYPE_DEFAULT, "Received resource load delegate %@ - %@", (uint8_t *)&v11, 0x16u);
  }

  [v5 setShouldSendSigningHeaders:1];
  uint64_t v8 = *(void *)(a1 + 32);
  __int16 v9 = *(void **)(v8 + 64);
  *(void *)(v8 + 64) = v5;
  id v10 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_authContext
{
  authContext = self->_authContext;
  if (!authContext)
  {
    id v4 = (AKAppleIDAuthenticationContext *)objc_alloc_init(MEMORY[0x1E4F4EF60]);
    id v5 = self->_authContext;
    self->_authContext = v4;

    id v6 = self->_authContext;
    int v7 = [(FARequestConfigurator *)self _account];
    uint64_t v8 = objc_msgSend(v7, "aa_altDSID");
    [(AKAppleIDAuthenticationContext *)v6 setAltDSID:v8];

    authContext = self->_authContext;
  }
  return authContext;
}

- (id)_fresnoPayloadWithAdditionalPayload:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = v5;
  if (v4) {
    [v5 addEntriesFromDictionary:v4];
  }
  [(FARequestConfigurator *)self _addAccountForServiceType:*MEMORY[0x1E4F4D8E8] toPayload:v6 forKey:@"iCloudAccountDetails"];
  [(FARequestConfigurator *)self _addAccountForServiceType:*MEMORY[0x1E4F4D908] toPayload:v6 forKey:@"iTunesAccountDetails"];

  return v6;
}

- (void)_addAccountForServiceType:(id)a3 toPayload:(id)a4 forKey:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = [(FARequestConfigurator *)self signer];

  if (v12)
  {
    if ((id)*MEMORY[0x1E4F4D8E8] == v8)
    {
      __int16 v13 = [(FARequestConfigurator *)self signer];
      id v14 = [v13 accountInfoPayload];
      uint64_t v15 = [v14 mutableCopy];

      id v11 = (id)v15;
    }
LABEL_16:
    uint64_t v18 = [v11 copy];
    [v9 setObject:v18 forKey:v10];
    goto LABEL_17;
  }
  id v16 = [(FARequestConfigurator *)self _serviceOwnersManager];
  int v17 = [v16 accountForService:v8];

  uint64_t v18 = _FALogSystem();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v17;
      _os_log_impl(&dword_1D252C000, v18, OS_LOG_TYPE_DEFAULT, "Account for service - %@", buf, 0xCu);
    }

    uint64_t v20 = [v17 username];
    if (v20) {
      [v11 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F4C038]];
    }
    v21 = [(FARequestConfigurator *)self _serviceOwnersManager];
    id v22 = [v21 DSIDForAccount:v17 service:v8];

    if (v22) {
      [v11 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F4C040]];
    }
    v28 = (void *)v20;
    v23 = [(FARequestConfigurator *)self _serviceOwnersManager];
    v24 = [v23 altDSIDForAccount:v17 service:v8];

    if (v24) {
      [v11 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F4C030]];
    }
    uint64_t v25 = [(FARequestConfigurator *)self _accountStore];
    v26 = objc_msgSend(v25, "aa_grandSlamAccountForAltDSID:", v24);

    v27 = [(FARequestConfigurator *)self _familyTokenForGrandSlamAccount:v26 andTokenID:*MEMORY[0x1E4F4BF58]];
    if (v27) {
      [v11 setObject:v27 forKeyedSubscript:@"dsFamilyToken"];
    }

    goto LABEL_16;
  }
  if (v19)
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v8;
    _os_log_impl(&dword_1D252C000, v18, OS_LOG_TYPE_DEFAULT, "No Account found for serviceType - %@", buf, 0xCu);
  }
LABEL_17:
}

- (id)_familyTokenForGrandSlamAccount:(id)a3 andTokenID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(FARequestConfigurator *)self _accountStore];
    id v9 = [v8 credentialForAccount:v6 serviceID:v7];

    id v10 = [v9 token];
    if (!v10)
    {
      id v11 = _FALogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v13 = 0;
        _os_log_impl(&dword_1D252C000, v11, OS_LOG_TYPE_DEFAULT, "Error: No GS Family token.", v13, 2u);
      }
    }
  }
  else
  {
    id v9 = _FALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D252C000, v9, OS_LOG_TYPE_DEFAULT, "No grandslam account, unable to fetch token", buf, 2u);
    }
    id v10 = 0;
  }

  return v10;
}

- (id)_serviceOwnersManager
{
  serviceOwnersManager = self->_serviceOwnersManager;
  if (!serviceOwnersManager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F4D938]);
    id v5 = [(FARequestConfigurator *)self _accountStore];
    id v6 = (AIDAServiceOwnersManager *)[v4 initWithAccountStore:v5];
    id v7 = self->_serviceOwnersManager;
    self->_serviceOwnersManager = v6;

    serviceOwnersManager = self->_serviceOwnersManager;
  }
  return serviceOwnersManager;
}

- (BOOL)attachSetupHeader
{
  return self->_attachSetupHeader;
}

- (void)setAttachSetupHeader:(BOOL)a3
{
  self->_attachSetupHeader = a3;
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (_TtP12FamilyCircle15FARequestSigner_)signer
{
  return self->_signer;
}

- (void)setSigner:(id)a3
{
}

- (NSDictionary)ephemeralAuthResults
{
  return self->_ephemeralAuthResults;
}

- (void)setEphemeralAuthResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralAuthResults, 0);
  objc_storeStrong((id *)&self->_signer, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_resourceLoadDelegate, 0);
  objc_storeStrong((id *)&self->_akSigningController, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_familyGrandSlamSigner, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)updateWithEphemeralAuthResults:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D252C000, log, OS_LOG_TYPE_DEBUG, "FARequestConfigurator updating with ephemeralAuthResults", v1, 2u);
}

- (void)_canConnectToAPS
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D252C000, a2, OS_LOG_TYPE_ERROR, "Unable to get a self audit token: %d", (uint8_t *)v2, 8u);
}

void __49__FARequestConfigurator_pushTokenWithCompletion___block_invoke_88_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D252C000, log, OS_LOG_TYPE_ERROR, "Unable to fetch configuration %@ with error %@", (uint8_t *)&v3, 0x16u);
}

- (void)addFresnoPayloadToRequest:(uint64_t)a1 additionalPayload:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D252C000, a2, OS_LOG_TYPE_DEBUG, "Body: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end