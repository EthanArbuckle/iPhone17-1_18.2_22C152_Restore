@interface CDPInternalWalrusStateController
- (BOOL)_shouldRetryForError:(id)a3;
- (CDPInternalWalrusStateController)initWithAccount:(id)a3 cdpdAccount:(id)a4 securityProxy:(id)a5 pcsProxy:(id)a6;
- (CDPInternalWalrusStateController)initWithAccount:(id)a3 cdpdAccount:(id)a4 securityProxy:(id)a5 pcsProxy:(id)a6 accountStore:(id)a7;
- (CDPInternalWalrusStateController)initWithContext:(id)a3;
- (id)_combinedWalrusStatusForPrimaryAccountWithError:(id *)a3;
- (id)_combinedWalrusStatusWithContext:(id)a3 error:(id *)a4;
- (id)_combinedWalrusStatusWithOptions:(id)a3 context:(id)a4 error:(id *)a5;
- (id)_eligibleAccountWithContext:(id)a3 checkWithServer:(BOOL)a4 requireCKAccount:(BOOL)a5 error:(id *)a6;
- (id)_eligiblePrimaryAccountForFlow:(unint64_t)a3 error:(id *)a4;
- (id)_fetchiCDPAccountInfoDictionaryWithContext:(id)a3 error:(id *)a4;
- (id)_optionsWithContext:(id)a3;
- (unint64_t)_escrowedKeysStatusUsingICDP:(id)a3;
- (unint64_t)_pcsAccountInfoStatusUsingICDP:(id)a3;
- (unint64_t)_statusForError:(id)a3;
- (unint64_t)_walrusStatusForPrimaryAccountWithError:(id *)a3;
- (unint64_t)_walrusStatusWithContext:(id)a3 error:(id *)a4;
- (unint64_t)_walrusStatusWithOptions:(id)a3 withError:(id *)a4;
- (void)_setAccountTelemetryOptInConfig:(BOOL)a3 altDSID:(id)a4 authController:(id)a5 accountManager:(id)a6 completion:(id)a7;
- (void)_updateWalrusState:(BOOL)a3 context:(id)a4 account:(id)a5 completion:(id)a6;
- (void)_updateWalrusStateAndPerformPostEnablementActions:(BOOL)a3 context:(id)a4 account:(id)a5 completion:(id)a6;
- (void)repairWalrusStatusWithCompletion:(id)a3;
- (void)setWalrusStatusEnabled:(BOOL)a3 password:(id)a4 completion:(id)a5;
- (void)setWebAccessStatusEnabled:(BOOL)a3 completion:(id)a4;
- (void)walrusStatusWithContext:(id)a3 completion:(id)a4;
- (void)webAccessStatusWithCompletion:(id)a3;
@end

@implementation CDPInternalWalrusStateController

uint64_t __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _shouldRetryForError:a2];
}

- (BOOL)_shouldRetryForError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F342B0]];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    BOOL v7 = v6 != -5110 && v6 != -5102;
    BOOL v8 = v6 != -5304 && v7;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (CDPInternalWalrusStateController)initWithAccount:(id)a3 cdpdAccount:(id)a4 securityProxy:(id)a5 pcsProxy:(id)a6
{
  v10 = (void *)MEMORY[0x263EFB210];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v10 defaultStore];
  v16 = [(CDPInternalWalrusStateController *)self initWithAccount:v14 cdpdAccount:v13 securityProxy:v12 pcsProxy:v11 accountStore:v15];

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_cdpDaemonAccount, 0);
  objc_storeStrong((id *)&self->_cdpAccount, 0);
  objc_storeStrong((id *)&self->_pcsProxy, 0);
  objc_storeStrong((id *)&self->_securityProxy, 0);
}

- (CDPInternalWalrusStateController)initWithAccount:(id)a3 cdpdAccount:(id)a4 securityProxy:(id)a5 pcsProxy:(id)a6 accountStore:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CDPInternalWalrusStateController;
  v17 = [(CDPInternalWalrusStateController *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_cdpAccount, a3);
    objc_storeStrong((id *)&v18->_securityProxy, a5);
    objc_storeStrong((id *)&v18->_pcsProxy, a6);
    objc_storeStrong((id *)&v18->_cdpDaemonAccount, a4);
    objc_storeStrong((id *)&v18->_accountStore, a7);
  }

  return v18;
}

void __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = v7;
  if (!v7 && v5)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "_statusForError:", v5));
  }
  id v8 = v6;
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v6 unsignedIntegerValue], v5);
}

void __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = 0;
  v4 = a2;
  uint64_t v5 = [v2 _walrusStatusWithContext:v3 error:&v8];
  id v6 = v8;
  id v7 = [NSNumber numberWithUnsignedInteger:v5];
  v4[2](v4, v7, v6);
}

- (unint64_t)_walrusStatusWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v13 = 0;
    id v7 = [(CDPInternalWalrusStateController *)self _eligibleAccountWithContext:v6 checkWithServer:0 requireCKAccount:1 error:&v13];
    id v8 = v13;
    if (v7)
    {
      v9 = [(CDPInternalWalrusStateController *)self _optionsWithContext:v6];
      unint64_t v10 = [(CDPInternalWalrusStateController *)self _walrusStatusWithOptions:v9 withError:a4];
    }
    else
    {
      id v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CDPInternalWalrusStateController _walrusStatusWithContext:error:]();
      }

      if (a4) {
        *a4 = v8;
      }
      unint64_t v10 = [(CDPInternalWalrusStateController *)self _statusForError:v8];
    }
  }
  else
  {
    unint64_t v10 = [(CDPInternalWalrusStateController *)self _walrusStatusForPrimaryAccountWithError:a4];
  }

  return v10;
}

- (unint64_t)_walrusStatusForPrimaryAccountWithError:(id *)a3
{
  id v12 = 0;
  uint64_t v5 = [(CDPInternalWalrusStateController *)self _eligiblePrimaryAccountForFlow:0 error:&v12];
  id v6 = v12;
  if (v5)
  {
    id v7 = [(CDPAccount *)self->_cdpAccount contextForPrimaryAccount];
    id v8 = [(CDPInternalWalrusStateController *)self _optionsWithContext:v7];

    unint64_t v9 = [(CDPInternalWalrusStateController *)self _walrusStatusWithOptions:v8 withError:a3];
  }
  else
  {
    unint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPInternalWalrusStateController _walrusStatusForPrimaryAccountWithError:]();
    }

    if (a3) {
      *a3 = v6;
    }
    unint64_t v9 = [(CDPInternalWalrusStateController *)self _statusForError:v6];
  }

  return v9;
}

- (unint64_t)_statusForError:(id)a3
{
  uint64_t v3 = [a3 code];
  if (v3 == -5304 || v3 == -5110) {
    return 2;
  }
  else {
    return 0;
  }
}

- (void)_walrusStatusForPrimaryAccountWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "No eligible primary account found, cannot fetch walrus status: %@", v2, v3, v4, v5, v6);
}

- (id)_eligiblePrimaryAccountForFlow:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(CDPAccount *)self->_cdpAccount primaryAppleAccount];
  id v8 = v7;
  if (!v7)
  {
    unint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPInternalWalrusStateController _eligiblePrimaryAccountForFlow:error:]();
    }
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    id v13 = [(CDPAccount *)self->_cdpAccount primaryAuthKitAccount];

    if (v13) {
      goto LABEL_12;
    }
    unint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPInternalWalrusStateController _eligiblePrimaryAccountForFlow:error:]();
    }
LABEL_9:

    if (a4)
    {
      id v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = -5102;
LABEL_19:
      objc_msgSend(v11, "cdp_errorWithCode:", v12);
      id v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!a3)
  {
    unint64_t v9 = objc_msgSend(v7, "aa_cloudKitAccount");

    if (!v9)
    {
      unint64_t v10 = _CDPLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CDPInternalWalrusStateController _eligiblePrimaryAccountForFlow:error:]();
      }
      goto LABEL_9;
    }
  }
LABEL_12:
  if ([(CDPAccount *)self->_cdpAccount primaryAccountSecurityLevel] == 4)
  {
    cdpDaemonAccount = self->_cdpDaemonAccount;
    id v15 = [(CDPAccount *)self->_cdpAccount primaryAccountDSID];
    LOBYTE(cdpDaemonAccount) = [(CDPDAccount *)cdpDaemonAccount isICDPEnabledForDSID:v15 checkWithServer:0];

    if (cdpDaemonAccount)
    {
      id v16 = v8;
      goto LABEL_21;
    }
    if (a4)
    {
      id v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = -5304;
      goto LABEL_19;
    }
  }
  else if (a4)
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = -5110;
    goto LABEL_19;
  }
LABEL_20:
  id v16 = 0;
LABEL_21:

  return v16;
}

- (void)_eligiblePrimaryAccountForFlow:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "No Primary account.", v2, v3, v4, v5, v6);
}

- (void)walrusStatusWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke;
  aBlock[3] = &unk_264330878;
  aBlock[4] = self;
  id v18 = v7;
  id v8 = v7;
  unint64_t v9 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke_2;
  v15[3] = &unk_2643308A0;
  v15[4] = self;
  id v16 = v6;
  id v10 = v6;
  id v11 = _Block_copy(v15);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__CDPInternalWalrusStateController_walrusStatusWithContext_completion___block_invoke_3;
  v14[3] = &unk_2643308C8;
  v14[4] = self;
  uint64_t v12 = _Block_copy(v14);
  id v13 = (void *)[objc_alloc(MEMORY[0x263F203F8]) initWithMaxRetries:1];
  [v13 scheduleTask:v11 shouldRetry:v12 completionHandler:v9];
}

- (CDPInternalWalrusStateController)initWithContext:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F34328];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  id v7 = [[CDPDAccount alloc] initWithContext:v5];

  id v8 = objc_alloc_init(CDPWalrusSecurityProxyImpl);
  id v9 = objc_alloc_init(MEMORY[0x263F343D0]);
  id v10 = [(CDPInternalWalrusStateController *)self initWithAccount:v6 cdpdAccount:v7 securityProxy:v8 pcsProxy:v9];

  return v10;
}

- (unint64_t)_walrusStatusWithOptions:(id)a3 withError:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _CDPSignpostLogSystem();
  os_signpost_id_t v8 = _CDPSignpostCreate();

  id v9 = _CDPSignpostLogSystem();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchAccountCleanupStatus", " enableTelemetry=YES ", buf, 2u);
  }

  id v11 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v27 = v8;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchAccountCleanupStatus  enableTelemetry=YES ", buf, 0xCu);
  }

  pcsProxy = self->_pcsProxy;
  id v25 = 0;
  int v13 = [(CDPProtectedCloudStorageProxy *)pcsProxy isWalrusEnabledWithOptions:v6 error:&v25];

  id v14 = v25;
  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  id v16 = _CDPSignpostLogSystem();
  v17 = v16;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    int v18 = [v14 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v27) = v18;
    _os_signpost_emit_with_name_impl(&dword_218640000, v17, OS_SIGNPOST_INTERVAL_END, v8, "FetchAccountCleanupStatus", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }

  v19 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = [v14 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v27 = v8;
    __int16 v28 = 2048;
    double v29 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v30 = 1026;
    int v31 = v20;
    _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchAccountCleanupStatus  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  objc_super v21 = _CDPLogSystem();
  v22 = v21;
  if (v14)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CDPInternalWalrusStateController _walrusStatusWithOptions:withError:]();
    }

    unint64_t v23 = 0;
    if (a4) {
      *a4 = v14;
    }
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v27) = v13;
      _os_log_impl(&dword_218640000, v22, OS_LOG_TYPE_DEFAULT, "Successfully fetched walrus status: (%{BOOL}d)", buf, 8u);
    }

    if (v13) {
      unint64_t v23 = 1;
    }
    else {
      unint64_t v23 = 2;
    }
  }

  return v23;
}

- (id)_combinedWalrusStatusWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    id v13 = 0;
    id v7 = [(CDPInternalWalrusStateController *)self _eligibleAccountWithContext:v6 checkWithServer:0 requireCKAccount:1 error:&v13];
    id v8 = v13;
    if (v7)
    {
      id v9 = [(CDPInternalWalrusStateController *)self _optionsWithContext:v6];
      id v10 = [(CDPInternalWalrusStateController *)self _combinedWalrusStatusWithOptions:v9 context:v6 error:a4];
    }
    else
    {
      id v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CDPInternalWalrusStateController _combinedWalrusStatusWithContext:error:]();
      }

      id v10 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }
  else
  {
    id v10 = [(CDPInternalWalrusStateController *)self _combinedWalrusStatusForPrimaryAccountWithError:a4];
  }

  return v10;
}

- (id)_combinedWalrusStatusForPrimaryAccountWithError:(id *)a3
{
  id v12 = 0;
  id v5 = [(CDPInternalWalrusStateController *)self _eligiblePrimaryAccountForFlow:0 error:&v12];
  id v6 = v12;
  if (v5)
  {
    id v7 = [(CDPAccount *)self->_cdpAccount contextForPrimaryAccount];
    id v8 = [(CDPInternalWalrusStateController *)self _optionsWithContext:v7];
    id v9 = [(CDPInternalWalrusStateController *)self _combinedWalrusStatusWithOptions:v8 context:v7 error:a3];
  }
  else
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPInternalWalrusStateController _combinedWalrusStatusForPrimaryAccountWithError:]();
    }

    id v9 = 0;
    if (a3) {
      *a3 = v6;
    }
  }

  return v9;
}

- (id)_combinedWalrusStatusWithOptions:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = (objc_class *)MEMORY[0x263F34348];
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  id v34 = 0;
  unint64_t v12 = [(CDPInternalWalrusStateController *)self _walrusStatusWithOptions:v10 withError:&v34];

  id v13 = v34;
  [v11 setOctagonWalrusStatus:v12];
  id v33 = 0;
  id v14 = [(CDPInternalWalrusStateController *)self _fetchiCDPAccountInfoDictionaryWithContext:v9 error:&v33];

  id v15 = v33;
  if (v15)
  {
    if (!v13)
    {
      id v16 = _CDPLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:].cold.7();
      }

      v17 = v15;
      if (!a5) {
        goto LABEL_12;
      }
LABEL_11:
      *a5 = v17;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(v11, "setPcsWalrusStatus:", -[CDPInternalWalrusStateController _pcsAccountInfoStatusUsingICDP:](self, "_pcsAccountInfoStatusUsingICDP:", v14));
    objc_msgSend(v11, "setEscrowWalrusStatus:", -[CDPInternalWalrusStateController _escrowedKeysStatusUsingICDP:](self, "_escrowedKeysStatusUsingICDP:", v14));
    if (!v13) {
      goto LABEL_12;
    }
  }
  int v18 = _CDPLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:].cold.6();
  }

  v17 = v13;
  if (a5) {
    goto LABEL_11;
  }
LABEL_12:
  int v19 = [v11 mismatchDetected];
  int v20 = _CDPLogSystem();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21) {
      -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:]();
    }
  }
  else
  {
    if (v21) {
      -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:].cold.5();
    }

    v22 = +[CDPDFollowUpController sharedInstance];
    int v23 = [v22 hasPendingFollowUpWithUniqueIdentifier:@"com.apple.CDPFollowUpIdentifier.adpStateHealing"];

    int v20 = _CDPLogSystem();
    BOOL v24 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
    if (v23)
    {
      if (v24) {
        -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:]();
      }

      id v25 = +[CDPDFollowUpController sharedInstance];
      v26 = [MEMORY[0x263F34388] contextForADPStateHealing];
      id v32 = 0;
      char v27 = [v25 clearFollowUpWithContext:v26 error:&v32];
      int v20 = v32;

      __int16 v28 = _CDPLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:](v27, v20, v28);
      }
    }
    else if (v24)
    {
      -[CDPInternalWalrusStateController _combinedWalrusStatusWithOptions:context:error:].cold.4();
    }
  }

  double v29 = _CDPLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v11;
    _os_log_impl(&dword_218640000, v29, OS_LOG_TYPE_DEFAULT, "Walrus state: %@", buf, 0xCu);
  }

  id v30 = v11;
  return v30;
}

- (void)repairWalrusStatusWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v17 = 0;
  id v5 = [(CDPInternalWalrusStateController *)self _eligiblePrimaryAccountForFlow:1 error:&v17];
  id v6 = v17;
  id v7 = _CDPLogSystem();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Repairing status for account %@, initiating silent auth.", (uint8_t *)&buf, 0xCu);
    }

    id v9 = (void *)os_transaction_create();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x3032000000;
    int v20 = __Block_byref_object_copy__6;
    BOOL v21 = __Block_byref_object_dispose__6;
    id v22 = (id)objc_opt_new();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__CDPInternalWalrusStateController_repairWalrusStatusWithCompletion___block_invoke;
    v11[3] = &unk_2643308F0;
    id v10 = v9;
    id v12 = v10;
    p_long long buf = &buf;
    id v15 = v4;
    id v13 = self;
    id v14 = v5;
    +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithCompletion:v11];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CDPInternalWalrusStateController repairWalrusStatusWithCompletion:]();
    }

    if (v4) {
      (*((void (**)(id, id))v4 + 2))(v4, v6);
    }
  }
}

void __69__CDPInternalWalrusStateController_repairWalrusStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__CDPInternalWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_cold_1();
    }

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) reportRepairAttemptFailedDueToAuthenticationError:v6];
    uint64_t v9 = *(void *)(a1 + 56);
    if (v9) {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Silent auth completed, continuing walrus repair.", buf, 2u);
  }

  id v41 = v5;
  uint64_t v10 = [objc_alloc(MEMORY[0x263F34350]) initWithAuthenticationResults:v5];
  uint64_t v11 = [*(id *)(a1 + 40) _optionsWithContext:v10];
  id v12 = *(void **)(a1 + 40);
  id v46 = 0;
  uint64_t v37 = [v12 _walrusStatusWithOptions:v11 withError:&v46];
  id v39 = v46;
  id v13 = *(void **)(a1 + 40);
  id v45 = 0;
  id v14 = [v13 _fetchiCDPAccountInfoDictionaryWithContext:v10 error:&v45];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  id v38 = v45;
  if (!v38)
  {
    uint64_t v15 = [*(id *)(a1 + 40) _pcsAccountInfoStatusUsingICDP:v14];
    uint64_t v16 = [*(id *)(a1 + 40) _escrowedKeysStatusUsingICDP:v14];
  }
  uint64_t v35 = v15;
  id v17 = *(void **)(*(void *)(a1 + 40) + 16);
  int v18 = [*(id *)(a1 + 48) identifier];
  id v44 = 0;
  uint64_t v19 = [v17 repairWalrusWithAccountIdentifier:v18 options:v11 error:&v44];
  id v20 = v44;

  BOOL v21 = *(void **)(a1 + 40);
  id v43 = 0;
  v40 = (void *)v11;
  uint64_t v22 = [v21 _walrusStatusWithOptions:v11 withError:&v43];
  id v36 = v43;
  uint64_t v23 = *(void **)(a1 + 40);
  id v42 = 0;
  BOOL v24 = (void *)v10;
  id v25 = [v23 _fetchiCDPAccountInfoDictionaryWithContext:v10 error:&v42];
  id v26 = v42;

  uint64_t v27 = 0;
  uint64_t v28 = 0;
  if (!v26)
  {
    uint64_t v27 = [*(id *)(a1 + 40) _pcsAccountInfoStatusUsingICDP:v25];
    uint64_t v28 = [*(id *)(a1 + 40) _escrowedKeysStatusUsingICDP:v25];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) reportRepairAttemptFinishedWithSuccess:v19 authenticationError:0 accountInfoFetchErrorBeforeRepair:v38 repairError:v20 accountInfoFetchErrorAfterRepair:v26 octagonStatusBefore:v37 octagonStatusAfter:v22 pcsStatusBefore:v35 pcsStatusAfter:v27 escrowKeysStatusBefore:v16 escrowKeysStatusAfter:v28];
  double v29 = _CDPLogSystem();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    id v5 = v41;
    if (v30)
    {
      *(_WORD *)long long buf = 0;
      int v31 = "Repair completed successfully";
      id v32 = v29;
      uint32_t v33 = 2;
LABEL_17:
      _os_log_impl(&dword_218640000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
    }
  }
  else
  {
    id v5 = v41;
    if (v30)
    {
      *(_DWORD *)long long buf = 138412290;
      id v48 = v20;
      int v31 = "Repair completed with error: %@";
      id v32 = v29;
      uint32_t v33 = 12;
      goto LABEL_17;
    }
  }

  uint64_t v34 = *(void *)(a1 + 56);
  if (v34) {
    (*(void (**)(uint64_t, id))(v34 + 16))(v34, v20);
  }

LABEL_21:
}

- (id)_fetchiCDPAccountInfoDictionaryWithContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[CDPDSecureBackupConfiguration configurationWithContext:v5];
  id v7 = [v6 accountInfoFetchSetupDictionary];
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CDPInternalWalrusStateController _fetchiCDPAccountInfoDictionaryWithContext:error:]((uint64_t)v7);
  }

  uint64_t v9 = [[CDPDSecureBackupProxyImpl alloc] initWithContext:v5];
  uint64_t v10 = [(CDPDSecureBackupProxyImpl *)v9 accountInfoWithInfo:v7 error:a4];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"SecureBackupStingrayMetadata"];
  id v12 = [v11 objectForKeyedSubscript:@"ClientMetadata"];
  id v13 = [v12 objectForKeyedSubscript:@"SecureBackupiCloudDataProtection"];

  id v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[CDPInternalWalrusStateController _fetchiCDPAccountInfoDictionaryWithContext:error:]((uint64_t)v13);
  }

  return v13;
}

- (unint64_t)_pcsAccountInfoStatusUsingICDP:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"kPCSMetadataiCDPWalrus"];
  if (v3)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([v3 BOOLValue]) {
        unint64_t v4 = 1;
      }
      else {
        unint64_t v4 = 2;
      }
    }
    else
    {
      unint64_t v4 = 0;
    }
  }
  else
  {
    unint64_t v4 = 2;
  }

  return v4;
}

- (unint64_t)_escrowedKeysStatusUsingICDP:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"kPCSMetadataEscrowedKeys"];
  if (v3) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)setWalrusStatusEnabled:(BOOL)a3 password:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v27 = 0;
  uint64_t v10 = [(CDPInternalWalrusStateController *)self _eligiblePrimaryAccountForFlow:1 error:&v27];
  id v11 = v27;
  if (v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F29118]);
    id v13 = [MEMORY[0x263F290F0] sharedInstance];
    id v14 = objc_msgSend(v10, "aa_altDSID");
    [(CDPInternalWalrusStateController *)self _setAccountTelemetryOptInConfig:v6 altDSID:v14 authController:v12 accountManager:v13 completion:&__block_literal_global_9];

    uint64_t v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(CDPAccount *)self->_cdpAccount primaryAccountAltDSID];
      *(_DWORD *)long long buf = 138412290;
      double v29 = v16;
      _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "Updating Walrus status for account %@, initiating silent auth.", buf, 0xCu);
    }
    id v17 = (void *)os_transaction_create();
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __79__CDPInternalWalrusStateController_setWalrusStatusEnabled_password_completion___block_invoke_69;
    v20[3] = &unk_264330960;
    id v21 = v17;
    id v25 = v9;
    id v22 = v8;
    uint64_t v23 = self;
    BOOL v26 = v6;
    id v24 = v10;
    id v18 = v17;
    +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithCompletion:v20];
  }
  else
  {
    uint64_t v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CDPInternalWalrusStateController repairWalrusStatusWithCompletion:]();
    }

    if (v9) {
      (*((void (**)(id, void, id))v9 + 2))(v9, 0, v11);
    }
  }
}

void __79__CDPInternalWalrusStateController_setWalrusStatusEnabled_password_completion___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _CDPLogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__CDPInternalWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_cold_1();
    }

    uint64_t v9 = *(void *)(a1 + 64);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Silent auth completed, continuing walrus update.", buf, 2u);
    }

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F34350]) initWithAuthenticationResults:v5];
    [v10 setNewPassword:*(void *)(a1 + 40) oldPassword:0];
    uint64_t v11 = *(unsigned __int8 *)(a1 + 72);
    id v12 = *(void **)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __79__CDPInternalWalrusStateController_setWalrusStatusEnabled_password_completion___block_invoke_70;
    v15[3] = &unk_264330938;
    v15[4] = v12;
    id v16 = v10;
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 64);
    id v14 = v10;
    [v12 _updateWalrusStateAndPerformPostEnablementActions:v11 context:v14 account:v13 completion:v15];
  }
}

void __79__CDPInternalWalrusStateController_setWalrusStatusEnabled_password_completion___block_invoke_70(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) _optionsWithContext:*(void *)(a1 + 40)];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v15 = 0;
  uint64_t v9 = [v7 _combinedWalrusStatusWithOptions:v6 context:v8 error:&v15];
  id v10 = v15;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v17 = v9;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Walrus state after update attempt: %@", buf, 0xCu);
  }

  if (a2)
  {
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12)
    {
      uint64_t v13 = *(void (**)(void))(v12 + 16);
LABEL_10:
      v13();
    }
  }
  else
  {
    if (!v5)
    {
      _CDPStateError();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v14 = *(void *)(a1 + 56);
    if (v14)
    {
      uint64_t v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_10;
    }
  }
}

- (void)_setAccountTelemetryOptInConfig:(BOOL)a3 altDSID:(id)a4 authController:(id)a5 accountManager:(id)a6 completion:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(id, void, void *))a7;
  id v15 = (void *)os_transaction_create();
  id v16 = [v13 authKitAccountWithAltDSID:v11];
  if (!v16)
  {
    id v21 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5108);
    v14[2](v14, 0, v21);
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = [v13 accountAccessTelemetryOptInForAccount:v16];
    uint64_t v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      int v28 = v17;
      _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, "Is opted-in = %{BOOL}d", buf, 8u);
    }

    if (a3) {
      goto LABEL_10;
    }
    uint64_t v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "ADP was not enabled, so Telemetry collection was opted-out", buf, 2u);
    }

    [v13 setAccountAccessTelemetryOptIn:0 forAccount:v16 error:0];
  }
  uint64_t v17 = 0;
LABEL_10:
  id v20 = [NSNumber numberWithBool:v17];
  id v21 = [v20 stringValue];

  uint64_t v22 = *MEMORY[0x263F28F40];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __117__CDPInternalWalrusStateController__setAccountTelemetryOptInConfig_altDSID_authController_accountManager_completion___block_invoke;
  v23[3] = &unk_26432F6A8;
  id v24 = v15;
  char v26 = v17;
  id v25 = v14;
  [v12 setConfigurationInfo:v21 forIdentifier:v22 forAltDSID:v11 completion:v23];

LABEL_12:
}

void __117__CDPInternalWalrusStateController__setAccountTelemetryOptInConfig_altDSID_authController_accountManager_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(unsigned __int8 *)(a1 + 48);
      v12[0] = 67109120;
      v12[1] = v8;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Set Account Telemetry Opt-In Value to %{BOOL}d", (uint8_t *)v12, 8u);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      id v10 = *(void (**)(void))(v9 + 16);
LABEL_10:
      v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __117__CDPInternalWalrusStateController__setAccountTelemetryOptInConfig_altDSID_authController_accountManager_completion___block_invoke_cold_1(a1, (uint64_t)v5, v7);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      id v10 = *(void (**)(void))(v11 + 16);
      goto LABEL_10;
    }
  }
}

- (void)webAccessStatusWithCompletion:(id)a3
{
}

- (void)setWebAccessStatusEnabled:(BOOL)a3 completion:(id)a4
{
}

- (id)_eligibleAccountWithContext:(id)a3 checkWithServer:(BOOL)a4 requireCKAccount:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v8 = a3;
  uint64_t v9 = [v8 altDSID];
  if (!v9)
  {
    id v10 = (void *)MEMORY[0x263F34328];
    uint64_t v11 = [v8 dsid];
    id v12 = [v11 stringValue];
    uint64_t v9 = [v10 altDSIDForPersonID:v12];
  }
  uint64_t v13 = [MEMORY[0x263F34328] appleAccountForAltDSID:v9];
  uint64_t v14 = v13;
  if (v13)
  {
    if (v7
      && (objc_msgSend(v13, "aa_cloudKitAccount"),
          id v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
      uint64_t v19 = _CDPLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CDPInternalWalrusStateController _eligibleAccountWithContext:checkWithServer:requireCKAccount:error:]();
      }

      if (a6)
      {
        uint64_t v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = -5102;
        goto LABEL_16;
      }
    }
    else
    {
      if ([MEMORY[0x263F34328] isHSA2Enabled:v9])
      {
        id v16 = v14;
        goto LABEL_18;
      }
      if (a6)
      {
        uint64_t v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = -5110;
        goto LABEL_16;
      }
    }
  }
  else if (a6)
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = -5108;
LABEL_16:
    objc_msgSend(v17, "cdp_errorWithCode:", v18);
    id v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  id v16 = 0;
LABEL_18:

  return v16;
}

- (void)_updateWalrusStateAndPerformPostEnablementActions:(BOOL)a3 context:(id)a4 account:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  uint64_t v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Walrus state change initiated...", buf, 2u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke;
  v16[3] = &unk_2643309D8;
  BOOL v19 = v8;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  [(CDPInternalWalrusStateController *)self _updateWalrusState:v8 context:v12 account:v15 completion:v16];
}

void __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Walrus status change succeeded, notifying downstream systems...", buf, 2u);
    }

    BOOL v7 = (void *)os_transaction_create();
    BOOL v8 = v7;
    char v9 = *(unsigned char *)(a1 + 56);
    if (v9)
    {
      id v10 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_76;
      v18[3] = &unk_264330988;
      char v20 = v9;
      id v19 = v7;
      [v10 setWebAccessStatusEnabled:0 completion:v18];
    }
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = *(void **)(*(void *)(a1 + 32) + 40);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_78;
    v16[3] = &unk_2643309B0;
    id v13 = v8;
    id v17 = v13;
    [v12 renewCredentialsForAccount:v11 completion:v16];
    +[CDPBroadcaster broadcastWalrusStateChangeNotification];
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      (*(void (**)(uint64_t, uint64_t, void))(v14 + 16))(v14, 1, 0);
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v5);
    }
  }
}

void __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = _CDPLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_76_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(unsigned __int8 *)(a1 + 40);
    BOOL v7 = *(unsigned char *)(a1 + 40) == 0;
    v8[0] = 67109376;
    v8[1] = v6;
    __int16 v9 = 1024;
    BOOL v10 = v7;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "After updating walrus state to %{BOOL}d, successfully updated web access status to %{BOOL}d", (uint8_t *)v8, 0xEu);
  }
}

void __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 description];
    int v7 = 134218242;
    uint64_t v8 = a2;
    __int16 v9 = 2112;
    BOOL v10 = v6;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Renew credentials completed with result %tu, with error: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_updateWalrusState:(BOOL)a3 context:(id)a4 account:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, uint64_t, void))a6;
  id v13 = [(CDPInternalWalrusStateController *)self _optionsWithContext:v10];
  pcsProxy = self->_pcsProxy;
  uint64_t v15 = [v11 identifier];
  id v27 = 0;
  int v16 = [(CDPProtectedCloudStorageProxy *)pcsProxy setWalrusEnabled:v8 accountIdentifier:v15 options:v13 error:&v27];
  id v17 = v27;

  if (v16)
  {
    if (v12) {
LABEL_3:
    }
      v12[2](v12, 1, 0);
  }
  else if (v8 && [v17 code] == 159)
  {
    id v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, "Dropped keys successfully, this error means success for mismatched state", buf, 2u);
    }

    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_218640000, v19, OS_LOG_TYPE_DEFAULT, "Walrus state update failed... try again", buf, 2u);
    }

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __82__CDPInternalWalrusStateController__updateWalrusState_context_account_completion___block_invoke;
    v20[3] = &unk_264330A00;
    id v21 = v10;
    uint64_t v22 = self;
    BOOL v25 = v8;
    id v23 = v11;
    id v24 = v12;
    +[CDPAuthenticationHelper silentAuthenticationForContext:v21 withCompletion:v20];
  }
}

void __82__CDPInternalWalrusStateController__updateWalrusState_context_account_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) updateWithAuthenticationResults:v5];
  }
  else
  {
    int v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __82__CDPInternalWalrusStateController__updateWalrusState_context_account_completion___block_invoke_cold_1();
    }
  }
  BOOL v8 = [*(id *)(a1 + 40) _optionsWithContext:*(void *)(a1 + 32)];
  __int16 v9 = *(void **)(*(void *)(a1 + 40) + 16);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 64);
  id v11 = [*(id *)(a1 + 48) identifier];
  id v15 = 0;
  uint64_t v12 = [v9 setWalrusEnabled:v10 accountIdentifier:v11 options:v8 error:&v15];
  id v13 = v15;

  uint64_t v14 = *(void *)(a1 + 56);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, v12, v13);
  }
}

- (id)_optionsWithContext:(id)a3
{
  return (id)[MEMORY[0x263F343C8] setupDictionaryWithContext:a3];
}

- (void)_walrusStatusWithContext:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Account not eligible, cannot fetch walrus status: %@", v2, v3, v4, v5, v6);
}

- (void)_walrusStatusWithOptions:withError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to fetch walrus status with error: %@", v2, v3, v4, v5, v6);
}

- (void)_combinedWalrusStatusWithContext:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Account not eligible, cannot fetch walrus matched status: %@", v2, v3, v4, v5, v6);
}

- (void)_combinedWalrusStatusForPrimaryAccountWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "No eligible primary account found, cannot fetch walrus matched status: %@", v2, v3, v4, v5, v6);
}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Walrus state mismatch detected", v2, v3, v4, v5, v6);
}

- (void)_combinedWalrusStatusWithOptions:(char)a1 context:(void *)a2 error:(NSObject *)a3 .cold.2(char a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = a1 & 1;
  uint64_t v5 = [a2 description];
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2112;
  BOOL v8 = v5;
  _os_log_debug_impl(&dword_218640000, a3, OS_LOG_TYPE_DEBUG, "Did Clear Pending ADPStateHealing CFU? %d with error: %@", (uint8_t *)v6, 0x12u);
}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Pending ADPStateHealing CFU found. Dismissing...", v2, v3, v4, v5, v6);
}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "No Pending ADPStateHealing CFU found. Continuing to Return combined walrus status", v2, v3, v4, v5, v6);
}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Walrus state mismatch NOT detected. Checking if there is a pending ADPStateHealing CFU posted...", v2, v3, v4, v5, v6);
}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Walrus octagon state error: %@", v2, v3, v4, v5, v6);
}

- (void)_combinedWalrusStatusWithOptions:context:error:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Walrus stingray state error: %@", v2, v3, v4, v5, v6);
}

- (void)repairWalrusStatusWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "No eligible primary account found, cannot update walrus status: %@", v2, v3, v4, v5, v6);
}

void __69__CDPInternalWalrusStateController_repairWalrusStatusWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to perform silent auth with error: %@", v2, v3, v4, v5, v6);
}

- (void)_fetchiCDPAccountInfoDictionaryWithContext:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  uint64_t v1 = +[CDPDSecureBackupController _sanitizedInfoDictionary:a1];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "Fetched iCDP dictionary: %@", v4, v5, v6, v7, v8);
}

- (void)_fetchiCDPAccountInfoDictionaryWithContext:(uint64_t)a1 error:.cold.2(uint64_t a1)
{
  uint64_t v1 = +[CDPDSecureBackupController _sanitizedInfoDictionary:a1];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "Fetched account info with %@", v4, v5, v6, v7, v8);
}

void __117__CDPInternalWalrusStateController__setAccountTelemetryOptInConfig_altDSID_authController_accountManager_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "Did not set Account Telemetry Opt-In Value to %{BOOL}d with error: %@", (uint8_t *)v4, 0x12u);
}

- (void)_eligibleAccountWithContext:checkWithServer:requireCKAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Account has no CloudKit account", v2, v3, v4, v5, v6);
}

- (void)_eligiblePrimaryAccountForFlow:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Primary account has no CloudKit account", v2, v3, v4, v5, v6);
}

- (void)_eligiblePrimaryAccountForFlow:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Primary account has no AuthKit account", v2, v3, v4, v5, v6);
}

void __113__CDPInternalWalrusStateController__updateWalrusStateAndPerformPostEnablementActions_context_account_completion___block_invoke_76_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "After successfully updating walrus state to ON, failed to update web access state to OFF with error: %@", v2, v3, v4, v5, v6);
}

void __82__CDPInternalWalrusStateController__updateWalrusState_context_account_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Silent re-authentication prior to Walrus re-try failed with error: %@", v2, v3, v4, v5, v6);
}

@end