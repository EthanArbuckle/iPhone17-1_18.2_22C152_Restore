@interface CDPAccountRepresentation
+ (id)representationForAccount:(id)a3;
+ (id)representationForAltDSID:(id)a3;
+ (id)representationForPrimaryAccount;
- (ACAccount)appleAccount;
- (ACAccount)authKitAccount;
- (ACAccountStore)accountStore;
- (AKAccountManager)accountManager;
- (BOOL)isBeneficiary;
- (BOOL)isICDPEnabled;
- (BOOL)isICDPEnabledByCheckingWithServer:(BOOL)a3;
- (BOOL)isSilentBurnCDPRepairEnabled;
- (BOOL)isSilentEscrowRecordRepairEnabled;
- (BOOL)isSilentEscrowRecordRepairEnabledV2;
- (BOOL)shouldPerformSilentEscrowRecordRepair;
- (CDPAccountRepresentation)initWithAccount:(id)a3;
- (CDPAccountRepresentation)initWithAltDSID:(id)a3;
- (CDPAccountRepresentation)initWithAltDSID:(id)a3 accountStore:(id)a4 accountManager:(id)a5;
- (CDPContext)generatedContext;
- (NSString)DSID;
- (NSString)altDSID;
- (NSString)authenticationToken;
- (NSString)escrowURLString;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)iCloudEnvironment;
- (NSString)stashedPRK;
- (NSString)username;
- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 staleModifiedDate:(id)a5 account:(id)a6 isStale:(BOOL *)a7;
- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5;
- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 checkForStale:(BOOL)a6 account:(id)a7;
- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 checkForStale:(BOOL)a6 account:(id)a7 saveHandler:(id)a8;
- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 saveHandler:(id)a6;
- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 staleModifiedDate:(id)a6 account:(id)a7 saveHandler:(id)a8;
- (id)_deserializedPropertyDictionaryForData:(id)a3 withPropertyValueOfClass:(Class)a4 error:(id *)a5;
- (id)_serializedPropertyDictionaryWithValue:(id)a3 lastModifiedDate:(id)a4 error:(id *)a5;
- (unint64_t)securityLevel;
- (void)_cachePropertyValue:(id)a3 forKey:(id)a4 lastModifiedDate:(id)a5 account:(id)a6 saveHandler:(id)a7;
- (void)generatedContext;
- (void)isSilentBurnCDPRepairEnabled;
- (void)setAccountManager:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)shouldPerformSilentEscrowRecordRepair;
- (void)silentEscrowRecordRepairEnabledWithCompletion:(id)a3;
@end

@implementation CDPAccountRepresentation

- (CDPAccountRepresentation)initWithAltDSID:(id)a3 accountStore:(id)a4 accountManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_msgSend(v10, "aa_appleAccountWithAltDSID:", v9);
  uint64_t v13 = [v11 authKitAccountWithAltDSID:v9];
  v14 = (void *)v13;
  if (v12 && v13)
  {
    v20.receiver = self;
    v20.super_class = (Class)CDPAccountRepresentation;
    v15 = [(CDPAccountRepresentation *)&v20 init];
    p_isa = (id *)&v15->super.isa;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_altDSID, a3);
      objc_storeStrong(p_isa + 1, v12);
      objc_storeStrong(p_isa + 2, v14);
      objc_storeStrong(p_isa + 4, a4);
      objc_storeStrong(p_isa + 5, a5);
    }
    self = p_isa;
    v17 = self;
  }
  else
  {
    v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CDPAccountRepresentation initWithAltDSID:accountStore:accountManager:]();
    }

    v17 = 0;
  }

  return v17;
}

- (CDPAccountRepresentation)initWithAltDSID:(id)a3
{
  v4 = (void *)MEMORY[0x263EFB210];
  id v5 = a3;
  v6 = [v4 defaultStore];
  v7 = [MEMORY[0x263F290F0] sharedInstance];
  v8 = [(CDPAccountRepresentation *)self initWithAltDSID:v5 accountStore:v6 accountManager:v7];

  return v8;
}

- (CDPAccountRepresentation)initWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F290F0] sharedInstance];
  v6 = [v5 altDSIDForAccount:v4];

  if (v6)
  {
    v7 = [v4 accountStore];
    v8 = [MEMORY[0x263F290F0] sharedInstance];
    self = [(CDPAccountRepresentation *)self initWithAltDSID:v6 accountStore:v7 accountManager:v8];

    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)representationForAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithAltDSID:v4];

  return v5;
}

+ (id)representationForAccount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithAccount:v4];

  return v5;
}

+ (id)representationForPrimaryAccount
{
  v3 = [MEMORY[0x263EFB210] defaultStore];
  id v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  if (v4)
  {
    id v5 = [a1 representationForAccount:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSString)username
{
  v2 = [(CDPAccountRepresentation *)self appleAccount];
  v3 = [v2 username];

  return (NSString *)v3;
}

- (NSString)DSID
{
  v2 = [(CDPAccountRepresentation *)self appleAccount];
  v3 = objc_msgSend(v2, "aa_personID");

  return (NSString *)v3;
}

- (NSString)authenticationToken
{
  v2 = [(CDPAccountRepresentation *)self appleAccount];
  v3 = objc_msgSend(v2, "aa_authToken");

  return (NSString *)v3;
}

- (NSString)escrowURLString
{
  v2 = [(CDPAccountRepresentation *)self appleAccount];
  v3 = [v2 propertiesForDataclass:*MEMORY[0x263EFB430]];

  id v4 = [v3 objectForKeyedSubscript:@"escrowProxyUrl"];

  return (NSString *)v4;
}

- (NSString)iCloudEnvironment
{
  v2 = [(CDPAccountRepresentation *)self appleAccount];
  v3 = [v2 dataclassProperties];
  id v4 = [v3 objectForKeyedSubscript:@"com.apple.Dataclass.Account"];

  id v5 = [v4 objectForKeyedSubscript:@"iCloudEnv"];

  return (NSString *)v5;
}

- (NSString)firstName
{
  v2 = [(CDPAccountRepresentation *)self appleAccount];
  v3 = objc_msgSend(v2, "aa_firstName");

  return (NSString *)v3;
}

- (NSString)fullName
{
  v2 = [(CDPAccountRepresentation *)self appleAccount];
  v3 = objc_msgSend(v2, "aa_fullName");

  return (NSString *)v3;
}

- (NSString)stashedPRK
{
  v3 = [(CDPAccountRepresentation *)self accountManager];
  id v4 = [(CDPAccountRepresentation *)self authKitAccount];
  id v5 = [v3 passwordResetTokenBackupForAccount:v4];

  return (NSString *)v5;
}

- (unint64_t)securityLevel
{
  v3 = [(CDPAccountRepresentation *)self accountManager];
  id v4 = [(CDPAccountRepresentation *)self authKitAccount];
  unint64_t v5 = [v3 securityLevelForAccount:v4];

  return v5;
}

- (BOOL)isBeneficiary
{
  v3 = [(CDPAccountRepresentation *)self accountManager];
  id v4 = [(CDPAccountRepresentation *)self authKitAccount];
  char v5 = [v3 isBeneficiaryForAccount:v4];

  return v5;
}

- (BOOL)isICDPEnabled
{
  return [(CDPAccountRepresentation *)self isICDPEnabledByCheckingWithServer:0];
}

- (BOOL)isSilentEscrowRecordRepairEnabled
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(CDPAccountRepresentation *)self accountManager];
  id v4 = [(CDPAccountRepresentation *)self authKitAccount];
  char v5 = [v3 isSilentEscrowRecordRepairEnabledForAccount:v4];

  v6 = _CDPLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412546;
      id v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Returning %@ for 'isSilentEscrowRecordRepairEnabled'", (uint8_t *)&v10, 0x16u);
    }

    char v8 = [v5 BOOLValue];
  }
  else
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = self;
      _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Assuming silent escrow record repair is disabled", (uint8_t *)&v10, 0xCu);
    }

    char v8 = 0;
  }

  return v8;
}

- (BOOL)isSilentEscrowRecordRepairEnabledV2
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(CDPAccountRepresentation *)self accountManager];
  id v4 = [(CDPAccountRepresentation *)self authKitAccount];
  char v5 = [v3 isSilentEscrowRecordRepairEnabledForAccountV2:v4];

  v6 = _CDPLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412546;
      id v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Returning %@ for 'isSilentEscrowRecordRepairEnabledV2'", (uint8_t *)&v10, 0x16u);
    }

    char v8 = [v5 BOOLValue];
  }
  else
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = self;
      _os_log_impl(&dword_2182AE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Assuming silent escrow record repair V2 is disabled", (uint8_t *)&v10, 0xCu);
    }

    char v8 = 0;
  }

  return v8;
}

- (BOOL)isSilentBurnCDPRepairEnabled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(CDPAccountRepresentation *)self accountManager];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
  {
    BOOL v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[CDPAccountRepresentation isSilentBurnCDPRepairEnabled](self);
    }
    goto LABEL_11;
  }
  char v5 = [(CDPAccountRepresentation *)self accountManager];
  v6 = [(CDPAccountRepresentation *)self authKitAccount];
  BOOL v7 = [v5 isSilentBurnCDPRepairEnabledForAccount:v6];

  char v8 = _CDPLogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v9)
    {
      int v12 = 138412290;
      uint64_t v13 = self;
      _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "%@: Assuming silent burn in mini-buddy is disabled", (uint8_t *)&v12, 0xCu);
    }

LABEL_11:
    char v10 = 0;
    goto LABEL_12;
  }
  if (v9)
  {
    int v12 = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "%@: Returning %@ for 'isSilentBurnCDPRepairEnabled'", (uint8_t *)&v12, 0x16u);
  }

  char v10 = [v7 BOOLValue];
LABEL_12:

  return v10;
}

- (BOOL)shouldPerformSilentEscrowRecordRepair
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(CDPAccountRepresentation *)self isSilentEscrowRecordRepairEnabledV2])
  {
    v3 = [(CDPAccountRepresentation *)self generatedContext];
    if (v3)
    {
      char v4 = [(CDPController *)[CDPStateController alloc] initWithContext:v3];
      id v10 = 0;
      BOOL v5 = [(CDPStateController *)v4 shouldPerformSilentEscrowRecordRepairUsingCache:1 error:&v10];
      id v6 = v10;
      BOOL v7 = _CDPLogSystem();
      char v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[CDPAccountRepresentation shouldPerformSilentEscrowRecordRepair]();
        }
        LOBYTE(v5) = 0;
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        int v12 = self;
        __int16 v13 = 1024;
        BOOL v14 = v5;
        _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "%@: Checked if escrow record repair is needed (%{BOOL}d)", buf, 0x12u);
      }
    }
    else
    {
      _CDPLogSystem();
      char v4 = (CDPStateController *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_ERROR)) {
        [(CDPAccountRepresentation *)(uint64_t)self shouldPerformSilentEscrowRecordRepair];
      }
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v12 = self;
      _os_log_impl(&dword_2182AE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Silent escrow record repair is disabled by server, returning NO", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (CDPContext)generatedContext
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(CDPAccountRepresentation *)self DSID];
  if (v3)
  {
    char v4 = objc_alloc_init(CDPContext);
    BOOL v5 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
    [(CDPContext *)v4 setDsid:v5];

    id v6 = [(CDPAccountRepresentation *)self altDSID];
    [(CDPContext *)v4 setAltDSID:v6];

    BOOL v7 = [(CDPAccountRepresentation *)self username];
    [(CDPContext *)v4 setAppleID:v7];

    [(CDPContext *)v4 setIsBeneficiaryAccount:[(CDPAccountRepresentation *)self isBeneficiary]];
    char v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138413058;
      id v11 = self;
      __int16 v12 = 2112;
      __int16 v13 = v4;
      __int16 v14 = 2160;
      uint64_t v15 = 1752392040;
      __int16 v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "%@: Generated context (%@) for account with DSID (%{mask.hash}@)", (uint8_t *)&v10, 0x2Au);
    }
  }
  else
  {
    char v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(CDPAccountRepresentation *)self generatedContext];
    }
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isICDPEnabledByCheckingWithServer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v5 = _os_activity_create(&dword_2182AE000, "cdp/enabled-status-check", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = [(CDPAccountRepresentation *)self DSID];
  if (v6)
  {
    BOOL v7 = objc_alloc_init(CDPDaemonConnection);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke;
    v17[3] = &unk_264316CD0;
    v17[4] = self;
    id v8 = v6;
    id v18 = v8;
    BOOL v9 = [(CDPDaemonConnection *)v7 synchronousDaemonWithErrorHandler:v17];
    int v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2160;
      *(void *)&buf[14] = 1752392040;
      *(_WORD *)&buf[22] = 2112;
      id v21 = v8;
      __int16 v22 = 1024;
      BOOL v23 = v3;
      _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Checking iCDP status for account with DSID (%{mask.hash}@), will check with server (%{BOOL}d)", buf, 0x26u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v21) = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke_57;
    v14[3] = &unk_264316CF8;
    v14[4] = self;
    id v15 = v8;
    __int16 v16 = buf;
    [v9 isICDPEnabledForDSID:v15 checkWithServer:v3 completion:v14];
    id v11 = [(CDPDaemonConnection *)v7 connection];
    [v11 invalidate];

    BOOL v12 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v12 = 0;
  }

  os_activity_scope_leave(&state);
  return v12;
}

void __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
}

void __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke_57(void *a1, int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = @"DISABLED";
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    if (a2) {
      BOOL v5 = @"ENABLED";
    }
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 2160;
    uint64_t v11 = 1752392040;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "%@: iCDP status for account with DSID (%{mask.hash}@) is %@", (uint8_t *)&v8, 0x2Au);
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
}

- (void)silentEscrowRecordRepairEnabledWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v4 = (void (**)(id, uint64_t, void))a3;
  BOOL v5 = [(CDPAccountRepresentation *)self accountManager];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(CDPAccountRepresentation *)self accountManager];
    int v8 = [(CDPAccountRepresentation *)self authKitAccount];
    uint64_t v9 = [v7 isSilentEscrowRecordRepairEnabledForAccount:v8];

    __int16 v10 = _CDPLogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        __int16 v12 = [(CDPAccountRepresentation *)self authKitAccount];
        *(_DWORD *)buf = 138412802;
        v25 = self;
        __int16 v26 = 2112;
        uint64_t v27 = (uint64_t)v9;
        __int16 v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Returning cached 'silentEscrowRecordRepairEnabled' value (%@) from account (%@)", buf, 0x20u);
      }
      if (v4) {
        v4[2](v4, [v9 BOOLValue], 0);
      }
      goto LABEL_21;
    }
    if (v11)
    {
      __int16 v14 = [(CDPAccountRepresentation *)self altDSID];
      *(_DWORD *)buf = 138412802;
      v25 = self;
      __int16 v26 = 2160;
      uint64_t v27 = 1752392040;
      __int16 v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Calling to fetch user info for altDSID (%{mask.hash}@) for 'silentEscrowRecordRepairEnabled' value", buf, 0x20u);
    }
    id v15 = objc_alloc_init(MEMORY[0x263F29110]);
    uint64_t v16 = [(CDPAccountRepresentation *)self altDSID];
    [v15 setAltDSID:v16];

    [v15 setAppProvidedContext:@"silentEscrowRecordRepair"];
    id v17 = objc_alloc_init(MEMORY[0x263F29118]);
    if (objc_opt_respondsToSelector())
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke;
      v20[3] = &unk_264316D20;
      id v21 = v15;
      __int16 v22 = self;
      BOOL v23 = v4;
      [v17 getUserInformationWithContext:v21 completion:v20];

      id v18 = v21;
    }
    else
    {
      v19 = _CDPLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[CDPAccountRepresentation silentEscrowRecordRepairEnabledWithCompletion:]();
      }

      if (!v4) {
        goto LABEL_20;
      }
      id v18 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 0);
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v18);
    }

LABEL_20:
    goto LABEL_21;
  }
  uint64_t v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[CDPAccountRepresentation silentEscrowRecordRepairEnabledWithCompletion:](self);
  }

  if (v4)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 0);
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v9);
LABEL_21:
  }
}

void __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke_cold_2(a1, (uint64_t)v6, v7);
    }

    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
    }
    goto LABEL_16;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v5 silentEscrowRecordRepairEnabled];
    __int16 v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [*(id *)(a1 + 32) altDSID];
      int v15 = 138412802;
      uint64_t v16 = v9;
      __int16 v17 = 2160;
      uint64_t v18 = 1752392040;
      __int16 v19 = 2112;
      objc_super v20 = v11;
      _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "Returning server fetched 'silentEscrowRecordRepairEnabled' value (%@) for altDSID (%{mask.hash}@)", (uint8_t *)&v15, 0x20u);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, uint64_t, void))(v12 + 16))(v12, [v9 BOOLValue], 0);
    }
    goto LABEL_15;
  }
  uint64_t v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke_cold_1(a1, (uint64_t)v5, v13);
  }

  uint64_t v14 = *(void *)(a1 + 48);
  if (v14)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", 0);
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v9);
LABEL_15:
  }
LABEL_16:
}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  __int16 v10 = [(CDPAccountRepresentation *)self appleAccount];
  BOOL v11 = [(CDPAccountRepresentation *)self _cachedPropertyValueOfClass:a3 forKey:v9 valueProducer:v8 checkForStale:1 account:v10 saveHandler:0];

  return v11;
}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 saveHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [(CDPAccountRepresentation *)self appleAccount];
  uint64_t v14 = [(CDPAccountRepresentation *)self _cachedPropertyValueOfClass:a3 forKey:v12 valueProducer:v11 checkForStale:1 account:v13 saveHandler:v10];

  return v14;
}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 checkForStale:(BOOL)a6 account:(id)a7
{
  return [(CDPAccountRepresentation *)self _cachedPropertyValueOfClass:a3 forKey:a4 valueProducer:a5 checkForStale:a6 account:a7 saveHandler:0];
}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 checkForStale:(BOOL)a6 account:(id)a7 saveHandler:(id)a8
{
  BOOL v10 = a6;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  if (v10)
  {
    uint64_t v18 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-86400.0];
  }
  else
  {
    uint64_t v18 = 0;
  }
  __int16 v19 = [(CDPAccountRepresentation *)self _cachedPropertyValueOfClass:a3 forKey:v14 valueProducer:v15 staleModifiedDate:v18 account:v16 saveHandler:v17];

  return v19;
}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 valueProducer:(id)a5 staleModifiedDate:(id)a6 account:(id)a7 saveHandler:(id)a8
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = (void (**)(void))a5;
  id v16 = a7;
  id v17 = a8;
  char v25 = 0;
  uint64_t v18 = [(CDPAccountRepresentation *)self _cachedPropertyValueOfClass:a3 forKey:v14 staleModifiedDate:a6 account:v16 isStale:&v25];
  if (!v18 || v25)
  {
    __int16 v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[CDPAccountRepresentation _cachedPropertyValueOfClass:forKey:valueProducer:staleModifiedDate:account:saveHandler:]();
    }

    objc_super v20 = v15[2](v15);
    uint64_t v21 = _CDPLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = self;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 2112;
      v31 = v20;
      _os_log_debug_impl(&dword_2182AE000, v21, OS_LOG_TYPE_DEBUG, "%@: Called value producer for key (%@) and received value (%@)", buf, 0x20u);
    }

    if (v20)
    {
      __int16 v22 = [MEMORY[0x263EFF910] date];
      [(CDPAccountRepresentation *)self _cachePropertyValue:v20 forKey:v14 lastModifiedDate:v22 account:v16 saveHandler:v17];

      id v23 = v20;
      uint64_t v18 = v23;
    }
  }
  return v18;
}

- (id)_cachedPropertyValueOfClass:(Class)a3 forKey:(id)a4 staleModifiedDate:(id)a5 account:(id)a6 isStale:(BOOL *)a7
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v12 = (__CFString *)a4;
  id v13 = a5;
  id v14 = (__CFString *)a6;
  [(__CFString *)v14 refresh];
  objc_opt_class();
  id v15 = [(__CFString *)v14 accountPropertyForKey:v12];
  if (objc_opt_isKindOfClass()) {
    id v16 = (__CFString *)v15;
  }
  else {
    id v16 = 0;
  }

  if (v16)
  {
    id v29 = 0;
    id v17 = [(CDPAccountRepresentation *)self _deserializedPropertyDictionaryForData:v16 withPropertyValueOfClass:a3 error:&v29];
    uint64_t v18 = v29;
    if (v17)
    {
      __int16 v28 = a7;
      objc_opt_class();
      id v19 = [(__CFString *)v17 objectForKeyedSubscript:@"com.apple.cdp.appleaccount.property.last-modified-date"];
      if (objc_opt_isKindOfClass()) {
        objc_super v20 = v19;
      }
      else {
        objc_super v20 = 0;
      }

      if (v20)
      {
        id v22 = [(__CFString *)v17 objectForKeyedSubscript:@"com.apple.cdp.appleaccount.property"];
        if (objc_opt_isKindOfClass()) {
          id v23 = v22;
        }
        else {
          id v23 = 0;
        }

        if (v23)
        {
          if (v13 && [v20 compare:v13] == -1)
          {
            __int16 v26 = _CDPLogSystem();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413314;
              v31 = self;
              __int16 v32 = 2112;
              v33 = @"com.apple.cdp.appleaccount.property";
              __int16 v34 = 2112;
              v35 = v12;
              __int16 v36 = 2112;
              v37 = v20;
              __int16 v38 = 2112;
              id v39 = v13;
              _os_log_debug_impl(&dword_2182AE000, v26, OS_LOG_TYPE_DEBUG, "%@: Cached property value (%@) for key (%@) is stale (lastModifiedDate [%@] < staleModifiedDate [%@])", buf, 0x34u);
            }

            if (v28) {
              *__int16 v28 = 1;
            }
          }
          else
          {
            uint64_t v24 = _CDPLogSystem();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              -[CDPAccountRepresentation _cachedPropertyValueOfClass:forKey:staleModifiedDate:account:isStale:]((uint64_t)self, (uint64_t)v12, v24);
            }

            if (v28) {
              *__int16 v28 = 0;
            }
          }
          id v23 = v23;
          uint64_t v21 = v23;
        }
        else
        {
          char v25 = _CDPLogSystem();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v31 = self;
            __int16 v32 = 2112;
            v33 = v17;
            __int16 v34 = 2112;
            v35 = v12;
            _os_log_debug_impl(&dword_2182AE000, v25, OS_LOG_TYPE_DEBUG, "%@: Found nil property value in cached property dictionary (%@) for key (%@)", buf, 0x20u);
          }

          uint64_t v21 = 0;
        }
      }
      else
      {
        id v23 = _CDPLogSystem();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v31 = self;
          __int16 v32 = 2112;
          v33 = v17;
          __int16 v34 = 2112;
          v35 = v12;
          _os_log_fault_impl(&dword_2182AE000, v23, OS_LOG_TYPE_FAULT, "%@: Expected lastModifiedDate value in cached property dictionary (%@) for key (%@)", buf, 0x20u);
        }
        uint64_t v21 = 0;
      }
    }
    else
    {
      objc_super v20 = _CDPLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138413058;
        v31 = self;
        __int16 v32 = 2112;
        v33 = v12;
        __int16 v34 = 2112;
        v35 = v16;
        __int16 v36 = 2112;
        v37 = v18;
        _os_log_fault_impl(&dword_2182AE000, v20, OS_LOG_TYPE_FAULT, "%@: Failed to deserialize property dictionary for key (%@) from data (%@) with error (%@)", buf, 0x2Au);
      }
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v31 = self;
      __int16 v32 = 2112;
      v33 = v12;
      __int16 v34 = 2112;
      v35 = v14;
      _os_log_debug_impl(&dword_2182AE000, v18, OS_LOG_TYPE_DEBUG, "%@: No cached property for key (%@) was found on account (%@)", buf, 0x20u);
    }
    uint64_t v21 = 0;
  }

  return v21;
}

- (void)_cachePropertyValue:(id)a3 forKey:(id)a4 lastModifiedDate:(id)a5 account:(id)a6 saveHandler:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v25 = 0;
  id v16 = [(CDPAccountRepresentation *)self _serializedPropertyDictionaryWithValue:v12 lastModifiedDate:a5 error:&v25];
  id v17 = v25;
  if (!v12 || v16)
  {
    [v14 setAccountProperty:v16 forKey:v13];
    id v19 = [v14 accountStore];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke;
    v20[3] = &unk_264316D48;
    id v21 = v12;
    id v22 = v13;
    id v23 = v14;
    id v24 = v15;
    [v19 saveAccount:v23 withCompletionHandler:v20];
  }
  else
  {
    uint64_t v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = self;
      __int16 v28 = 2112;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v17;
      _os_log_fault_impl(&dword_2182AE000, v18, OS_LOG_TYPE_FAULT, "%@: Failed to serialize property dictionary for key (%@) with error (%@)", buf, 0x20u);
    }

    if (v15) {
      (*((void (**)(id, void, id))v15 + 2))(v15, 0, v17);
    }
  }
}

void __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _CDPLogSystem();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke_cold_2();
  }

  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (id)_serializedPropertyDictionaryWithValue:(id)a3 lastModifiedDate:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF9A0];
    id v9 = a4;
    id v10 = a3;
    id v11 = [v8 dictionaryWithCapacity:2];
    [v11 setObject:v10 forKeyedSubscript:@"com.apple.cdp.appleaccount.property"];

    [v11 setObject:v9 forKeyedSubscript:@"com.apple.cdp.appleaccount.property.last-modified-date"];
    id v16 = 0;
    id v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v16];
    id v13 = v16;
    if (v13)
    {
      id v14 = _CDPLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v18 = self;
        __int16 v19 = 2112;
        objc_super v20 = v11;
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_error_impl(&dword_2182AE000, v14, OS_LOG_TYPE_ERROR, "%@: Failed to archive property dictionary (%@) with error (%@)", buf, 0x20u);
      }

      if (a5) {
        *a5 = v13;
      }
    }
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

- (id)_deserializedPropertyDictionaryForData:(id)a3 withPropertyValueOfClass:(Class)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v8)
  {
    id v9 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    id v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", a4, objc_opt_class(), 0);
    id v15 = 0;
    id v11 = [MEMORY[0x263F08928] unarchivedDictionaryWithKeysOfClasses:v9 objectsOfClasses:v10 fromData:v8 error:&v15];
    id v12 = v15;
    if (v12)
    {
      id v13 = _CDPLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v17 = self;
        __int16 v18 = 2112;
        id v19 = v8;
        __int16 v20 = 2112;
        id v21 = v12;
        _os_log_error_impl(&dword_2182AE000, v13, OS_LOG_TYPE_ERROR, "%@: Failed to unarchive data (%@) with error (%@)", buf, 0x20u);
      }

      if (a5) {
        *a5 = v12;
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (ACAccount)authKitAccount
{
  return self->_authKitAccount;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (AKAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_authKitAccount, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

- (void)initWithAltDSID:accountStore:accountManager:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_2182AE000, v0, v1, "Unable to create CDPAccountRepresentation instance due to nil Apple account (%@) or AuthKit account (%@)");
}

- (void)isSilentBurnCDPRepairEnabled
{
  os_log_t v1 = [a1 accountManager];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_2182AE000, v2, v3, "%@: Unable to check 'isSilentBurnCDPRepairEnabled' because AKAccountManager (%@) doesn't respond to selector", v4, v5, v6, v7, v8);
}

- (void)shouldPerformSilentEscrowRecordRepair
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_2182AE000, v0, v1, "%@: Failed to check if escrow record repair is needed with error (%@)");
}

- (void)generatedContext
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 appleAccount];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "%@: Unable to generate context for account (%@) with no DSID", v4, 0x16u);
}

void __62__CDPAccountRepresentation_isICDPEnabledByCheckingWithServer___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138413058;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2160;
  *(void *)&v3[14] = 1752392040;
  *(_WORD *)&v3[22] = 2112;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_3_0(&dword_2182AE000, a2, a3, "%@: Failed to check if iCDP is enabled for account with DSID (%{mask.hash}@) with error (%@)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *(void *)(a1 + 40), (void)v4, WORD4(v4));
}

- (void)silentEscrowRecordRepairEnabledWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_2182AE000, v0, v1, "%@: Unable to fetch user info with context because AKAppleIDAuthenticationController (%@) doesn't respond to selector");
}

- (void)silentEscrowRecordRepairEnabledWithCompletion:(void *)a1 .cold.2(void *a1)
{
  os_log_t v1 = [a1 accountManager];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6(&dword_2182AE000, v2, v3, "%@: Unable to check 'silentEscrowRecordRepairEnabled' because AKAccountManager (%@) doesn't respond to selector", v4, v5, v6, v7, v8);
}

void __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_5_0(&dword_2182AE000, a2, a3, "%@: Unable to check 'silentEscrowRecordRepairEnabled' because AKUserInformation (%@) doesn't respond to selector", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __74__CDPAccountRepresentation_silentEscrowRecordRepairEnabledWithCompletion___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) altDSID];
  int v6 = 141558530;
  uint64_t v7 = 1752392040;
  __int16 v8 = 2112;
  id v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_2182AE000, a3, OS_LOG_TYPE_ERROR, "Failed to fetch user info for altDSID (%{mask.hash}@) with error (%@)", (uint8_t *)&v6, 0x20u);
}

- (void)_cachedPropertyValueOfClass:forKey:valueProducer:staleModifiedDate:account:saveHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_2182AE000, v0, OS_LOG_TYPE_DEBUG, "%@: Calling value producer for key (%@)", v1, 0x16u);
}

- (void)_cachedPropertyValueOfClass:(os_log_t)log forKey:staleModifiedDate:account:isStale:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  int v6 = @"com.apple.cdp.appleaccount.property";
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "%@: Returned cached property value (%@) for key (%@)", (uint8_t *)&v3, 0x20u);
}

void __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_2182AE000, v0, OS_LOG_TYPE_DEBUG, "Successfully saved cached property value (%@) for key (%@) on account (%@)", v1, 0x20u);
}

void __92__CDPAccountRepresentation__cachePropertyValue_forKey_lastModifiedDate_account_saveHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_2182AE000, v0, v1, "Failed to save cached property value (%@) for key (%@) on account (%@) with error (%@)");
}

@end