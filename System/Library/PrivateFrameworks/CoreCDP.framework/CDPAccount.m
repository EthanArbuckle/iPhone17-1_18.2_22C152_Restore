@interface CDPAccount
+ (BOOL)checkIfAltDSIDIsBeneficiary:(id)a3;
+ (BOOL)isHSA2Enabled:(id)a3;
+ (BOOL)isICDPEnabledForDSID:(id)a3;
+ (BOOL)isICDPEnabledForDSID:(id)a3 checkWithServer:(BOOL)a4;
+ (BOOL)saveVerifiedAccount:(id)a3 error:(id *)a4;
+ (id)_authKitAccountWith:(id)a3;
+ (id)altDSIDForPersonID:(id)a3;
+ (id)appleAccountForAltDSID:(id)a3;
+ (id)contextForAccountWithAltDSID:(id)a3;
+ (id)personIDForAltDSID:(id)a3;
+ (id)sharedInstance;
- (BOOL)isOTEnabledForContext:(id)a3;
- (BOOL)primaryAccountIsBeneficiary;
- (BOOL)primaryAccountNeedsEscrowRecordRepair;
- (BOOL)rpdProbationIsInEffectForDuration:(double)a3 context:(id)a4;
- (NSDate)rpdProbationFirstSeenDate;
- (id)_serverFriendlyDateFormatter;
- (id)authToken;
- (id)contextForPrimaryAccount;
- (id)escrowURL;
- (id)iCloudEnv;
- (id)primaryAccountAltDSID;
- (id)primaryAccountDSID;
- (id)primaryAccountFirstName;
- (id)primaryAccountFullName;
- (id)primaryAccountStashedPRK;
- (id)primaryAccountUsername;
- (id)primaryAppleAccount;
- (id)primaryAuthKitAccount;
- (unint64_t)primaryAccountSecurityLevel;
- (void)octagonStatusForContext:(id)a3 withCompletion:(id)a4;
- (void)primaryAccountStashedPRK;
- (void)setRpdProbationFirstSeenDate:(id)a3;
- (void)sosStatusForContext:(id)a3 withCompletion:(id)a4;
@end

@implementation CDPAccount

- (id)primaryAppleAccount
{
  v2 = [MEMORY[0x263EFB210] defaultStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_account;
  return v2;
}

+ (BOOL)isICDPEnabledForDSID:(id)a3
{
  return [a1 isICDPEnabledForDSID:a3 checkWithServer:0];
}

+ (BOOL)isICDPEnabledForDSID:(id)a3 checkWithServer:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _os_activity_create(&dword_2182AE000, "cdp: enabled status check", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v7 = objc_alloc_init(CDPDaemonConnection);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke;
  v17[3] = &unk_264317018;
  id v8 = v5;
  id v18 = v8;
  v9 = [(CDPDaemonConnection *)v7 synchronousDaemonWithErrorHandler:v17];
  v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558530;
    *(void *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 1024;
    BOOL v21 = v4;
    _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "Checking iCDP status for DSID %{mask.hash}@ (checkWithServer=%{BOOL}d)", buf, 0x1Cu);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v21) = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke_29;
  v14[3] = &unk_264317040;
  id v11 = v8;
  id v15 = v11;
  v16 = buf;
  [v9 isICDPEnabledForDSID:v11 checkWithServer:v4 completion:v14];
  v12 = [(CDPDaemonConnection *)v7 connection];
  [v12 invalidate];

  LOBYTE(v12) = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  os_activity_scope_leave(&state);
  return (char)v12;
}

void __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
}

void __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke_29(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = @"DISABLED";
    uint64_t v8 = 1752392040;
    int v7 = 141558530;
    if (a2) {
      v6 = @"ENABLED";
    }
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "iCDP status for DSID %{mask.hash}@ is %@", (uint8_t *)&v7, 0x20u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

uint64_t __28__CDPAccount_sharedInstance__block_invoke()
{
  sharedInstance_account = objc_alloc_init(CDPAccount);
  return MEMORY[0x270F9A758]();
}

- (BOOL)isOTEnabledForContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = _CDPSignpostLogSystem();
  os_signpost_id_t v5 = _CDPSignpostCreate(v4);
  uint64_t v7 = v6;

  uint64_t v8 = _CDPSignpostLogSystem();
  __int16 v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "OctagonStatus", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  uint64_t v10 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: OctagonStatus  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  __int16 v11 = objc_alloc_init(CDPDaemonConnection);
  v12 = [(CDPDaemonConnection *)v11 synchronousDaemonWithErrorHandler:&__block_literal_global_40];
  uint64_t v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_2182AE000, v13, OS_LOG_TYPE_DEFAULT, "Checking OT status", (uint8_t *)&buf, 2u);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __36__CDPAccount_isOTEnabledForContext___block_invoke_41;
  v16[3] = &unk_264317068;
  v16[5] = v5;
  v16[6] = v7;
  v16[4] = &buf;
  [v12 isOTEnabledForContext:v3 completion:v16];
  v14 = [(CDPDaemonConnection *)v11 connection];
  [v14 invalidate];

  LOBYTE(v14) = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);

  return (char)v14;
}

void __36__CDPAccount_isOTEnabledForContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __36__CDPAccount_isOTEnabledForContext___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __36__CDPAccount_isOTEnabledForContext___block_invoke_41(void *a1, char a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v7 = _CDPSignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v14 = 67240192;
    LODWORD(v15) = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v8, OS_SIGNPOST_INTERVAL_END, v9, "OctagonStatus", " Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v14, 8u);
  }

  uint64_t v10 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = a1[5];
    int v13 = [v5 code];
    int v14 = 134218496;
    uint64_t v15 = v12;
    __int16 v16 = 2048;
    double v17 = v11;
    __int16 v18 = 1026;
    int v19 = v13;
    _os_log_impl(&dword_2182AE000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: OctagonStatus  Error=%{public,signpost.telemetry:number1,name=Error}d ", (uint8_t *)&v14, 0x1Cu);
  }

  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
}

- (id)primaryAccountUsername
{
  id v2 = [(CDPAccount *)self primaryAppleAccount];
  id v3 = [v2 username];

  return v3;
}

- (id)primaryAccountDSID
{
  id v2 = [(CDPAccount *)self primaryAppleAccount];
  id v3 = [v2 accountProperties];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"personID"];

  return v4;
}

- (id)primaryAccountAltDSID
{
  id v2 = [(CDPAccount *)self primaryAppleAccount];
  id v3 = [MEMORY[0x263F290F0] sharedInstance];
  uint64_t v4 = [v3 altDSIDForAccount:v2];

  return v4;
}

- (unint64_t)primaryAccountSecurityLevel
{
  id v3 = [MEMORY[0x263F290F0] sharedInstance];
  uint64_t v4 = [(CDPAccount *)self primaryAccountAltDSID];
  id v5 = [v3 authKitAccountWithAltDSID:v4];

  uint64_t v6 = [MEMORY[0x263F290F0] sharedInstance];
  unint64_t v7 = [v6 securityLevelForAccount:v5];

  return v7;
}

- (BOOL)primaryAccountIsBeneficiary
{
  id v2 = [MEMORY[0x263F290F0] sharedInstance];
  id v3 = [v2 primaryAuthKitAccount];

  uint64_t v4 = [MEMORY[0x263F290F0] sharedInstance];
  char v5 = [v4 isBeneficiaryForAccount:v3];

  return v5;
}

- (id)authToken
{
  id v2 = [(CDPAccount *)self primaryAppleAccount];
  id v3 = objc_msgSend(v2, "aa_authToken");

  return v3;
}

- (id)escrowURL
{
  id v2 = [(CDPAccount *)self primaryAppleAccount];
  id v3 = [v2 propertiesForDataclass:*MEMORY[0x263EFB430]];
  uint64_t v4 = [v3 objectForKey:@"escrowProxyUrl"];

  return v4;
}

- (id)iCloudEnv
{
  id v2 = [(CDPAccount *)self primaryAppleAccount];
  id v3 = [v2 dataclassProperties];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"com.apple.Dataclass.Account"];
  char v5 = [v4 objectForKeyedSubscript:@"iCloudEnv"];

  return v5;
}

- (id)contextForPrimaryAccount
{
  return +[CDPContext contextForPrimaryAccount];
}

- (id)primaryAccountFirstName
{
  id v2 = [(CDPAccount *)self primaryAppleAccount];
  id v3 = objc_msgSend(v2, "aa_firstName");

  return v3;
}

- (id)primaryAccountFullName
{
  id v2 = [(CDPAccount *)self primaryAppleAccount];
  id v3 = objc_msgSend(v2, "aa_fullName");

  return v3;
}

- (id)primaryAuthKitAccount
{
  id v3 = [MEMORY[0x263F290F0] sharedInstance];
  uint64_t v4 = [(CDPAccount *)self primaryAccountAltDSID];
  char v5 = [v3 authKitAccountWithAltDSID:v4];

  return v5;
}

- (id)primaryAccountStashedPRK
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CDPAccount primaryAccountStashedPRK](v3);
  }

  uint64_t v4 = [(CDPAccount *)self primaryAuthKitAccount];
  if (v4)
  {
    char v5 = [MEMORY[0x263EFB210] defaultStore];
    id v13 = 0;
    uint64_t v6 = [v5 credentialForAccount:v4 error:&v13];
    id v7 = v13;

    uint64_t v8 = [v6 credentialItemForKey:*MEMORY[0x263EFB100]];
    os_signpost_id_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
      double v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[CDPAccount primaryAccountStashedPRK](v11);
      }
    }
    else
    {
      double v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(CDPAccount *)(uint64_t)v7 primaryAccountStashedPRK];
      }
    }
  }
  else
  {
    os_signpost_id_t v9 = 0;
  }

  return v9;
}

- (BOOL)primaryAccountNeedsEscrowRecordRepair
{
  id v2 = +[CDPAccountRepresentation representationForPrimaryAccount];
  char v3 = [v2 shouldPerformSilentEscrowRecordRepair];

  return v3;
}

+ (BOOL)saveVerifiedAccount:(id)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  char v5 = (void *)MEMORY[0x263EFB210];
  id v6 = a3;
  id v7 = [v5 defaultStore];
  LOBYTE(a4) = [v7 saveVerifiedAccount:v6 error:a4];

  return (char)a4;
}

+ (id)_authKitAccountWith:(id)a3
{
  if (a3)
  {
    char v3 = (void *)MEMORY[0x263F290F0];
    id v4 = a3;
    char v5 = [v3 sharedInstance];
    id v6 = [v5 authKitAccountWithAltDSID:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (BOOL)checkIfAltDSIDIsBeneficiary:(id)a3
{
  char v3 = [a1 _authKitAccountWith:a3];
  id v4 = [MEMORY[0x263F290F0] sharedInstance];
  char v5 = [v4 isBeneficiaryForAccount:v3];

  return v5;
}

+ (id)appleAccountForAltDSID:(id)a3
{
  char v3 = (void *)MEMORY[0x263EFB210];
  id v4 = a3;
  char v5 = [v3 defaultStore];
  id v6 = objc_msgSend(v5, "aa_appleAccountWithAltDSID:", v4);

  return v6;
}

+ (id)personIDForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() appleAccountForAltDSID:v3];

  char v5 = NSNumber;
  id v6 = objc_msgSend(v4, "aa_personID");
  id v7 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "longLongValue"));

  return v7;
}

+ (id)altDSIDForPersonID:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFB210];
  id v4 = a3;
  char v5 = [v3 defaultStore];
  id v6 = objc_msgSend(v5, "aa_appleAccountWithPersonID:", v4);

  id v7 = objc_msgSend(v6, "aa_altDSID");

  return v7;
}

+ (id)contextForAccountWithAltDSID:(id)a3
{
  return +[CDPContext contextForAccountWithAltDSID:a3];
}

+ (BOOL)isHSA2Enabled:(id)a3
{
  id v3 = [a1 _authKitAccountWith:a3];
  id v4 = [MEMORY[0x263F290F0] sharedInstance];
  uint64_t v5 = [v4 securityLevelForAccount:v3];

  return v5 == 4;
}

- (void)octagonStatusForContext:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _os_activity_create(&dword_2182AE000, "cdp/statemachine-clique-status", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v8 = objc_alloc_init(CDPDaemonConnection);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke;
  v14[3] = &unk_264317090;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(CDPDaemonConnection *)v8 daemonWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke_2;
  v12[3] = &unk_2643170B8;
  id v11 = v9;
  id v13 = v11;
  [v10 cliqueStatusForContext:v5 completion:v12];

  os_activity_scope_leave(&state);
}

uint64_t __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, -1, a2);
  }
  return result;
}

void __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke_2_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      id v13 = *(void (**)(void))(v12 + 16);
LABEL_8:
      v13();
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14)
    {
      id v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_8;
    }
  }
}

- (void)sosStatusForContext:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_2182AE000, "cdp/statemachine-circle-status", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  uint64_t v8 = objc_alloc_init(CDPDaemonConnection);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke;
  v14[3] = &unk_264317090;
  id v9 = v6;
  id v15 = v9;
  uint64_t v10 = [(CDPDaemonConnection *)v8 daemonWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke_2;
  v12[3] = &unk_2643170E0;
  id v11 = v9;
  id v13 = v11;
  [v10 circleStatusForContext:v5 completion:v12];

  os_activity_scope_leave(&state);
}

uint64_t __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 0xFFFFFFFFLL, a2);
  }
  return result;
}

void __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke_2_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      id v13 = *(void (**)(void))(v12 + 16);
LABEL_8:
      v13();
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14)
    {
      id v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_8;
    }
  }
}

- (NSDate)rpdProbationFirstSeenDate
{
  id v3 = +[CDPAccount sharedInstance];
  id v4 = [v3 primaryAppleAccount];

  id v5 = [v4 accountPropertyForKey:@"rpdProbationFirstSeenDate"];
  uint64_t v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(CDPAccount(Probation) *)(uint64_t)v5 rpdProbationFirstSeenDate];
  }

  id v13 = [(CDPAccount *)self _serverFriendlyDateFormatter];
  uint64_t v14 = [v13 dateFromString:v5];

  return (NSDate *)v14;
}

- (void)setRpdProbationFirstSeenDate:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPAccount *)self _serverFriendlyDateFormatter];
  uint64_t v6 = [v5 stringFromDate:v4];

  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CDPAccount(Probation) setRpdProbationFirstSeenDate:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }

  uint64_t v14 = +[CDPAccount sharedInstance];
  id v15 = [v14 primaryAppleAccount];

  [v15 setAccountProperty:v6 forKey:@"rpdProbationFirstSeenDate"];
  id v20 = 0;
  BOOL v16 = +[CDPAccount saveVerifiedAccount:v15 error:&v20];
  id v17 = v20;
  if (v16)
  {
    id v18 = [(CDPAccount *)self rpdProbationFirstSeenDate];
  }
  else
  {
    int v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CDPAccount(Probation) setRpdProbationFirstSeenDate:]((uint64_t)v17, v19);
    }
  }
}

- (id)_serverFriendlyDateFormatter
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
  [v3 setLocale:v2];
  id v4 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v3 setTimeZone:v4];

  return v3;
}

- (BOOL)rpdProbationIsInEffectForDuration:(double)a3 context:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v6 = [MEMORY[0x263F202A8] analyticsEventWithContext:a4 eventName:@"com.apple.corecdp.rpdProbation" category:0x26C984850];
  uint64_t v7 = [(CDPAccount *)self rpdProbationFirstSeenDate];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF910] now];
    [v8 timeIntervalSinceDate:v7];
    double v10 = v9;

    BOOL v11 = v10 >= a3;
    if (v10 < a3)
    {
      uint64_t v12 = [NSNumber numberWithDouble:a3 - v10];
      [v6 setObject:v12 forKeyedSubscript:@"remainingProbationTime"];
    }
    else
    {
      [v6 setObject:&unk_26C984808 forKeyedSubscript:@"remainingProbationTime"];
    }
    uint64_t v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CDPAccount(Probation) rpdProbationIsInEffectForDuration:context:](v13, v14, v15, v16, v17, v18, v19, v20);
    }

    BOOL v21 = _CDPLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[CDPAccount(Probation) rpdProbationIsInEffectForDuration:context:](v21, v22, v23, v24, v25, v26, v27, v28);
    }

    v29 = _CDPLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      int v34 = 134218496;
      double v35 = v10;
      __int16 v36 = 2048;
      double v37 = a3;
      __int16 v38 = 1024;
      BOOL v39 = v10 >= a3;
      _os_log_debug_impl(&dword_2182AE000, v29, OS_LOG_TYPE_DEBUG, "RPD Probation: Can show RPD option: %f >= %f = %{BOOL}d", (uint8_t *)&v34, 0x1Cu);
    }
  }
  else if (a3 == 0.0)
  {
    [v6 setObject:&unk_26C984808 forKeyedSubscript:@"remainingProbationTime"];
    BOOL v11 = 1;
  }
  else
  {
    v32 = [MEMORY[0x263EFF910] now];
    [(CDPAccount *)self setRpdProbationFirstSeenDate:v32];

    v33 = [NSNumber numberWithDouble:a3];
    [v6 setObject:v33 forKeyedSubscript:@"remainingProbationTime"];

    BOOL v11 = 0;
  }
  v30 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
  [v30 sendEvent:v6];

  return v11;
}

void __51__CDPAccount_isICDPEnabledForDSID_checkWithServer___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 141558530;
  uint64_t v5 = 1752392040;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_2182AE000, log, OS_LOG_TYPE_ERROR, "XPC Error while checking if iCDP is enabled for DSID %{mask.hash}@: %@", (uint8_t *)&v4, 0x20u);
}

void __36__CDPAccount_isOTEnabledForContext___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)primaryAccountStashedPRK
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "Fetching PRK for primary Account", v1, 2u);
}

void __67__CDPAccount_CircleStatus__octagonStatusForContext_withCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__CDPAccount_CircleStatus__sosStatusForContext_withCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end