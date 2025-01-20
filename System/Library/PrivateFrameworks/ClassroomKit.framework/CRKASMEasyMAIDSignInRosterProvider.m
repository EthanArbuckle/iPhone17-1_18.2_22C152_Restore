@interface CRKASMEasyMAIDSignInRosterProvider
- (BOOL)isEasyStudentSignInDisabledByServer;
- (CRKASMEasyMAIDSignInRosterProvider)initWithRosterProviderGenerator:(id)a3;
- (CRKASMRosterProviderConfiguration)configuration;
- (CRKASMRosterProviding)instructorRosterProviderWithoutKeychain;
- (id)providerGenerator;
- (void)fetchEligibilityForEasyMAIDSignInWithCompletion:(id)a3;
@end

@implementation CRKASMEasyMAIDSignInRosterProvider

- (CRKASMEasyMAIDSignInRosterProvider)initWithRosterProviderGenerator:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKASMEasyMAIDSignInRosterProvider;
  v5 = [(CRKASMEasyMAIDSignInRosterProvider *)&v11 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x22A620AF0](v4);
    id providerGenerator = v5->_providerGenerator;
    v5->_id providerGenerator = (id)v6;

    uint64_t v8 = +[CRKASMRosterProviderConfiguration instructorRosterWithoutKeychainConfiguration];
    configuration = v5->_configuration;
    v5->_configuration = (CRKASMRosterProviderConfiguration *)v8;
  }
  return v5;
}

- (CRKASMRosterProviding)instructorRosterProviderWithoutKeychain
{
  instructorRosterProviderWithoutKeychain = self->_instructorRosterProviderWithoutKeychain;
  if (!instructorRosterProviderWithoutKeychain)
  {
    id v4 = [(CRKASMEasyMAIDSignInRosterProvider *)self providerGenerator];
    v5 = [(CRKASMEasyMAIDSignInRosterProvider *)self configuration];
    ((void (**)(void, void *))v4)[2](v4, v5);
    uint64_t v6 = (CRKASMRosterProviding *)objc_claimAutoreleasedReturnValue();
    v7 = self->_instructorRosterProviderWithoutKeychain;
    self->_instructorRosterProviderWithoutKeychain = v6;

    instructorRosterProviderWithoutKeychain = self->_instructorRosterProviderWithoutKeychain;
  }

  return instructorRosterProviderWithoutKeychain;
}

- (void)fetchEligibilityForEasyMAIDSignInWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke;
  v21[3] = &unk_2646F4B70;
  id v6 = v4;
  id v23 = v6;
  id v7 = v5;
  id v22 = v7;
  uint64_t v8 = (void (**)(void, void, void))MEMORY[0x22A620AF0](v21);
  BOOL v9 = [(CRKASMEasyMAIDSignInRosterProvider *)self isEasyStudentSignInDisabledByServer];
  v10 = [NSNumber numberWithBool:v9];
  [v7 setObject:v10 forKeyedSubscript:@"isEasyStudentSignInDisabledByServer"];

  if (v9) {
    goto LABEL_4;
  }
  objc_super v11 = [(CRKASMEasyMAIDSignInRosterProvider *)self configuration];
  v12 = [v11 rosterRequirements];
  uint64_t v13 = [v12 accountState];

  v14 = [NSNumber numberWithInteger:v13];
  [v7 setObject:v14 forKeyedSubscript:@"accountState"];

  if (v13 != 2)
  {
LABEL_4:
    v8[2](v8, 0, 0);
  }
  else
  {
    v15 = [(CRKASMEasyMAIDSignInRosterProvider *)self configuration];
    v16 = [v15 rosterRequirements];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_2;
    v17[3] = &unk_2646F4BE8;
    v20 = v8;
    id v18 = v7;
    v19 = self;
    [v16 currentUserWithCompletion:v17];
  }
}

void __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = (id)[v5 copy];
  (*(void (**)(uint64_t, uint64_t, id, id))(v4 + 16))(v4, a2, v7, v6);
}

void __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_3;
  block[3] = &unk_2646F4B98;
  id v12 = v6;
  id v16 = *(id *)(a1 + 48);
  id v13 = v5;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) hasEDUAccount];
    uint64_t v4 = [*(id *)(a1 + 40) isStudent] ^ 1;
    id v5 = [*(id *)(a1 + 40) person];
    id v6 = [v5 appleID];
    [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:@"appleID"];

    id v7 = [NSNumber numberWithBool:v3];
    [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:@"hasEDUAccount"];

    uint64_t v8 = [NSNumber numberWithBool:v4];
    [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:@"isNonStudent"];

    if v3 && (v4)
    {
      id v9 = [*(id *)(a1 + 56) configuration];
      id v10 = [v9 rosterRequirements];
      objc_super v11 = [*(id *)(a1 + 40) person];
      id v12 = [v11 objectID];
      id v13 = [v10 makeQueryForLocationsAllowingEasyStudentSignInForPersonID:v12];

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_4;
      v16[3] = &unk_2646F4BC0;
      id v19 = *(id *)(a1 + 64);
      id v17 = *(id *)(a1 + 48);
      id v18 = *(id *)(a1 + 40);
      [v13 setCompletion:v16];
      id v14 = [*(id *)(a1 + 56) configuration];
      uint64_t v15 = [v14 rosterRequirements];
      [v15 executeQuery:v13];

      return;
    }
    v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }

  v2();
}

void __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_5;
  block[3] = &unk_2646F4B98;
  id v10 = v6;
  id v14 = a1[6];
  id v11 = v5;
  id v12 = a1[4];
  id v13 = a1[5];
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __86__CRKASMEasyMAIDSignInRosterProvider_fetchEligibilityForEasyMAIDSignInWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
    return v2();
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) count];
    id v5 = [NSNumber numberWithUnsignedInteger:v4];
    [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:@"countOfLocationsAllowingEasyMAIDSignIn"];

    if (_CRKLogGeneral_onceToken_19 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_19, &__block_literal_global_61);
    }
    id v6 = (void *)_CRKLogGeneral_logObj_19;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_19, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 56);
      id v8 = v6;
      id v9 = [v7 person];
      id v10 = [v9 appleID];
      int v11 = 134218242;
      uint64_t v12 = v4;
      __int16 v13 = 2114;
      id v14 = v10;
      _os_log_impl(&dword_224C00000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu locations allowing EasyMAID for %{public}@", (uint8_t *)&v11, 0x16u);
    }
    return (*(uint64_t (**)(void, BOOL, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v4 != 0, 0);
  }
}

- (BOOL)isEasyStudentSignInDisabledByServer
{
  v2 = [MEMORY[0x263F29270] sharedBag];
  if (objc_opt_respondsToSelector())
  {
    char v3 = [v2 easyStudentSignInDisabled];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      BOOL v4 = 0;
      goto LABEL_7;
    }
    char v3 = [v2 isEasyStudentSignInDisabled];
  }
  BOOL v4 = v3;
LABEL_7:

  return v4;
}

- (CRKASMRosterProviderConfiguration)configuration
{
  return self->_configuration;
}

- (id)providerGenerator
{
  return self->_providerGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_providerGenerator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_instructorRosterProviderWithoutKeychain, 0);
}

@end