@interface CDPDLocalSecretController
- (AAFKeychainManager)keychainManager;
- (BOOL)synchronizeCircleViewsForSecureBackupContext:(id)a3;
- (CDPContext)context;
- (CDPDCircleController)circleController;
- (CDPDLocalSecretController)initWithContext:(id)a3;
- (CDPDSecureBackupController)secureBackupController;
- (CDPLocalSecretFollowUpProvider)followUpProvider;
- (CDPStateUIProviderInternal)uiProvider;
- (id)_cdpStateMachine;
- (id)_makeICSCUpdateFinishEvent;
- (id)circlePeerIDForSecureBackupController:(id)a3;
- (id)contextForController:(id)a3;
- (id)secureChannelContextForController:(id)a3;
- (void)_attemptToEscrowPreRecord:(id)a3 completion:(id)a4;
- (void)_collectLocalSecretWithCompletion:(id)a3;
- (void)_createContextForSecret:(BOOL)a3 withCompletion:(id)a4;
- (void)_handleCompletionStatus:(BOOL)a3 preRecord:(BOOL)a4;
- (void)_localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5;
- (void)_repairWithStateMachine:(id)a3 completion:(id)a4;
- (void)_sendiCSCUpdateFinishEvent:(id)a3 didUpdate:(BOOL)a4 error:(id)a5;
- (void)_sendiCSCUpdateStartEvent;
- (void)_setContextWithAuthResults:(id)a3;
- (void)_wrappedLocalSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5;
- (void)attemptToEscrowPreRecord:(id)a3 completion:(id)a4;
- (void)circleController:(id)a3 secureBackupRecordsArePresentWithCompletion:(id)a4;
- (void)dealloc;
- (void)finishOfflineLocalSecretChangeWithCompletion:(id)a3;
- (void)localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5;
- (void)promptForAdoptionOfMultipleICSCWithCompletion:(id)a3;
- (void)setCircleController:(id)a3;
- (void)setContext:(id)a3;
- (void)setFollowUpProvider:(id)a3;
- (void)setKeychainManager:(id)a3;
- (void)setSecureBackupController:(id)a3;
- (void)setUiProvider:(id)a3;
@end

@implementation CDPDLocalSecretController

- (CDPDLocalSecretController)initWithContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CDPDLocalSecretController *)self init];
  if (v5)
  {
    if ([MEMORY[0x263F34400] canEnableMultiUserManatee])
    {
      v6 = _CDPLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [v4 altDSID];
        int v15 = 141558274;
        uint64_t v16 = 1752392040;
        __int16 v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "MUM: CDPDLocalSecretFollowUpProviderImpl init'ed with altDSID %{mask.hash}@", (uint8_t *)&v15, 0x16u);
      }
      v8 = [CDPDLocalSecretFollowUpProviderImpl alloc];
      v9 = [v4 altDSID];
      uint64_t v10 = [(CDPDLocalSecretFollowUpProviderImpl *)v8 initWithAltDSID:v9];
      followUpProvider = v5->_followUpProvider;
      v5->_followUpProvider = (CDPLocalSecretFollowUpProvider *)v10;
    }
    else
    {
      v12 = objc_alloc_init(CDPDLocalSecretFollowUpProviderImpl);
      v13 = v5->_followUpProvider;
      v5->_followUpProvider = (CDPLocalSecretFollowUpProvider *)v12;
    }
    [(CDPDLocalSecretController *)v5 setContext:v4];
  }

  return v5;
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "CDPDLocalSecretController dealloc", v1, 2u);
}

- (void)setContext:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v34) = 0;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Updating context for local secret change", (uint8_t *)&v34, 2u);
  }

  p_context = &self->_context;
  objc_storeStrong((id *)&self->_context, a3);
  v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(CDPContext *)*p_context type];
    uint64_t v10 = [(CDPContext *)*p_context appleID];
    v11 = [(CDPContext *)*p_context dsid];
    v12 = [(CDPContext *)*p_context altDSID];
    int v34 = 134219522;
    uint64_t v35 = v9;
    __int16 v36 = 2160;
    uint64_t v37 = 1752392040;
    __int16 v38 = 2112;
    v39 = v10;
    __int16 v40 = 2160;
    uint64_t v41 = 1752392040;
    __int16 v42 = 2112;
    v43 = v11;
    __int16 v44 = 2160;
    uint64_t v45 = 1752392040;
    __int16 v46 = 2112;
    v47 = v12;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "CDPDLocalSecretController: updated context with context type: %ld, appleID: %{mask.hash}@, dsid: %{mask.hash}@, adsid: %{mask.hash}@", (uint8_t *)&v34, 0x48u);
  }
  if (!*p_context)
  {
    uint64_t v24 = [MEMORY[0x263F34350] contextForPrimaryAccount];
    v22 = *p_context;
    *p_context = (CDPContext *)v24;
    goto LABEL_13;
  }
  v13 = [(CDPContext *)*p_context appleID];

  if (!v13)
  {
    v14 = [MEMORY[0x263F34328] sharedInstance];
    int v15 = [v14 primaryAccountUsername];
    [(CDPContext *)*p_context setAppleID:v15];
  }
  uint64_t v16 = [(CDPContext *)*p_context dsid];

  if (!v16)
  {
    __int16 v17 = NSNumber;
    v18 = [MEMORY[0x263F34328] sharedInstance];
    uint64_t v19 = [v18 primaryAccountDSID];
    v20 = objc_msgSend(v17, "numberWithLongLong:", objc_msgSend(v19, "longLongValue"));
    [(CDPContext *)*p_context setDsid:v20];
  }
  v21 = [(CDPContext *)*p_context altDSID];

  if (!v21)
  {
    v22 = [MEMORY[0x263F34328] sharedInstance];
    v23 = [v22 primaryAccountAltDSID];
    [(CDPContext *)*p_context setAltDSID:v23];

LABEL_13:
  }
  if (*p_context)
  {
    v25 = [MEMORY[0x263F08C38] UUID];
    v26 = [v25 UUIDString];
    [(CDPContext *)self->_context setTelemetryFlowID:v26];

    v27 = [[CDPDSecureBackupController alloc] initWithContext:self->_context uiProvider:0 delegate:self];
    secureBackupController = self->_secureBackupController;
    self->_secureBackupController = v27;

    v29 = [CDPDCircleController alloc];
    v30 = (void *)[objc_alloc(MEMORY[0x263F34340]) initWithContext:self->_context];
    v31 = [[CDPDOctagonTrustProxyImpl alloc] initWithContext:self->_context];
    v32 = [(CDPDCircleController *)v29 initWithUiProvider:0 delegate:self circleProxy:v30 octagonTrustProxy:v31];
    circleController = self->_circleController;
    self->_circleController = v32;
  }
}

- (void)attemptToEscrowPreRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CDPDLocalSecretController_attemptToEscrowPreRecord_completion___block_invoke;
  v10[3] = &unk_26432FE40;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(CDPDLocalSecretController *)self _createContextForSecret:0 withCompletion:v10];
}

void __65__CDPDLocalSecretController_attemptToEscrowPreRecord_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (a2)
  {
    id v7 = [v6 circleController];
    uint64_t v8 = [v7 circleStatus];

    if (v8 == 1)
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __65__CDPDLocalSecretController_attemptToEscrowPreRecord_completion___block_invoke_2;
      v14[3] = &unk_26432EDC0;
      v14[4] = v9;
      id v15 = *(id *)(a1 + 48);
      [v9 _attemptToEscrowPreRecord:v10 completion:v14];
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 48);
      if (v12)
      {
        v13 = _CDPStateError();
        (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
      }
    }
  }
  else
  {
    [v6 _handleCompletionStatus:0 preRecord:1];
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v5);
    }
  }
}

void __65__CDPDLocalSecretController_attemptToEscrowPreRecord_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) _handleCompletionStatus:a2 preRecord:1];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (void)localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(CDPDLocalSecretController *)self _sendiCSCUpdateStartEvent];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__CDPDLocalSecretController_localSecretChangedTo_secretType_completion___block_invoke;
  v11[3] = &unk_26432EDC0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(CDPDLocalSecretController *)self _wrappedLocalSecretChangedTo:v9 secretType:a4 completion:v11];
}

void __72__CDPDLocalSecretController_localSecretChangedTo_secretType_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) _makeICSCUpdateFinishEvent];
  [*(id *)(a1 + 32) _sendiCSCUpdateFinishEvent:v5 didUpdate:a2 error:v7];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
  }
}

- (void)_wrappedLocalSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(CDPContext *)self->_context isPrimaryAccount])
  {
    if ([v8 length])
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke;
      v13[3] = &unk_26432FF08;
      v13[4] = self;
      id v14 = v8;
      unint64_t v16 = a4;
      id v15 = v9;
      [(CDPDLocalSecretController *)self _createContextForSecret:1 withCompletion:v13];
    }
    else
    {
      id v12 = _CDPLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CDPDLocalSecretController _wrappedLocalSecretChangedTo:secretType:completion:](v12);
      }

      [(CDPDLocalSecretController *)self _handleCompletionStatus:1 preRecord:0];
      if (v9) {
        (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
      }
    }
  }
  else
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPDLocalSecretController _wrappedLocalSecretChangedTo:secretType:completion:](v10);
    }

    [(CDPDLocalSecretController *)self _handleCompletionStatus:1 preRecord:0];
    if (v9)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x263F087E8], "cdp_errorWithCode:", -5102);
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v11);
    }
  }
}

void __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (a2)
  {
    id v7 = [v6 circleController];
    uint64_t v8 = [v7 circleStatus];

    if (v8 == 1)
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke_29;
      v16[3] = &unk_26432EDC0;
      v16[4] = v9;
      uint64_t v11 = *(void *)(a1 + 56);
      id v17 = *(id *)(a1 + 48);
      [v9 _localSecretChangedTo:v10 secretType:v11 completion:v16];
    }
    else
    {
      v13 = _CDPLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Not in circle , trying repair", buf, 2u);
      }

      [*(id *)(*(void *)(a1 + 32) + 8) setCachedLocalSecret:*(void *)(a1 + 40)];
      [*(id *)(*(void *)(a1 + 32) + 8) setCachedLocalSecretType:*(void *)(a1 + 56)];
      id v14 = [[CDPDStateMachine alloc] initWithContext:*(void *)(*(void *)(a1 + 32) + 8) uiProvider:0];
      id v15 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke_28;
      v18[3] = &unk_26432EDC0;
      v18[4] = v15;
      id v19 = *(id *)(a1 + 48);
      [v15 _repairWithStateMachine:v14 completion:v18];
    }
  }
  else
  {
    [v6 _handleCompletionStatus:0 preRecord:0];
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v5);
    }
  }
}

void __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "repair completed with result: %{BOOL}d error: %@", (uint8_t *)v8, 0x12u);
  }

  [*(id *)(a1 + 32) _handleCompletionStatus:a2 preRecord:0];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

void __80__CDPDLocalSecretController__wrappedLocalSecretChangedTo_secretType_completion___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) _handleCompletionStatus:a2 preRecord:0];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (void)_sendiCSCUpdateStartEvent
{
  id v12 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_context eventName:*MEMORY[0x263F347E8] category:*MEMORY[0x263F34830]];
  v3 = [MEMORY[0x263F08D68] currentConnection];
  id v4 = objc_msgSend(v3, "aaf_processName");
  [v12 setObject:v4 forKeyedSubscript:*MEMORY[0x263F347F8]];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CDPDCircleController cliqueStatus](self->_circleController, "cliqueStatus"));
  [v12 setObject:v5 forKeyedSubscript:*MEMORY[0x263F34538]];

  id v6 = objc_alloc_init(CDPDAccount);
  uint64_t v7 = [(CDPContext *)self->_context dsid];
  uint64_t v8 = [v7 stringValue];
  uint64_t v9 = [(CDPDAccount *)v6 isICDPEnabledForDSID:v8 checkWithServer:0];

  id v10 = [NSNumber numberWithBool:v9];
  [v12 setObject:v10 forKeyedSubscript:*MEMORY[0x263F34518]];

  uint64_t v11 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v11 sendEvent:v12];
}

- (id)_makeICSCUpdateFinishEvent
{
  v2 = [MEMORY[0x263F202A8] analyticsEventWithContext:self->_context eventName:*MEMORY[0x263F347E0] category:*MEMORY[0x263F34830]];
  v3 = [MEMORY[0x263F08D68] currentConnection];
  id v4 = objc_msgSend(v3, "aaf_processName");
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x263F347F8]];

  return v2;
}

- (void)_sendiCSCUpdateFinishEvent:(id)a3 didUpdate:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = NSNumber;
  circleController = self->_circleController;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_msgSend(v8, "numberWithInteger:", -[CDPDCircleController cliqueStatus](circleController, "cliqueStatus"));
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F34538]];

  id v19 = objc_alloc_init(CDPDAccount);
  v13 = [(CDPContext *)self->_context dsid];
  id v14 = [v13 stringValue];
  uint64_t v15 = [(CDPDAccount *)v19 isICDPEnabledForDSID:v14 checkWithServer:0];

  unint64_t v16 = [NSNumber numberWithBool:v15];
  [v11 setObject:v16 forKeyedSubscript:*MEMORY[0x263F34518]];

  id v17 = [NSNumber numberWithBool:v5];
  [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x263F34558]];

  [v11 populateUnderlyingErrorsStartingWithRootError:v10];
  v18 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v18 sendEvent:v11];
}

- (void)finishOfflineLocalSecretChangeWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke;
  aBlock[3] = &unk_26432EDC0;
  aBlock[4] = self;
  id v5 = v4;
  id v13 = v5;
  id v6 = _Block_copy(aBlock);
  uint64_t v7 = [MEMORY[0x263F343A8] sharedInstance];
  int v8 = [v7 hasLocalSecret];

  if (v8)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_2;
    v10[3] = &unk_26432EDC0;
    v10[4] = self;
    id v11 = v6;
    [(CDPDLocalSecretController *)self _createContextForSecret:1 withCompletion:v10];
  }
  else
  {
    uint64_t v9 = _CDPStateError();
    (*((void (**)(void *, void, void *))v6 + 2))(v6, 0, v9);
  }
}

void __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) _handleCompletionStatus:a2 preRecord:0];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

void __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) _cdpStateMachine];
  uint64_t v5 = v4;
  if (a2)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_3;
    v6[3] = &unk_26432FF58;
    v6[4] = *(void *)(a1 + 32);
    id v7 = v4;
    id v8 = *(id *)(a1 + 40);
    [v7 shouldPerformRepairWithOptionForceFetch:0 completion:v6];
  }
  else
  {
    [*(id *)(a1 + 32) _repairWithStateMachine:v4 completion:*(void *)(a1 + 40)];
  }
}

void __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_3(void *a1, int a2, uint64_t a3)
{
  v3 = (void *)a1[4];
  if (a3 || a2)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = (void *)a1[4];
    [v6 _repairWithStateMachine:v4 completion:v5];
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_4;
    v7[3] = &unk_26432FF30;
    v7[4] = v3;
    id v8 = (id)a1[6];
    [v3 _collectLocalSecretWithCompletion:v7];
  }
}

void __74__CDPDLocalSecretController_finishOfflineLocalSecretChangeWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 validatedSecret];
    objc_msgSend(v4, "_localSecretChangedTo:secretType:completion:", v5, objc_msgSend(v6, "secretType"), *(void *)(a1 + 40));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_attemptToEscrowPreRecord:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc_init(CDPDSecureBackupContext);
    [(CDPDSecureBackupContext *)v8 setPreRecordUUID:v6];
    uint64_t v9 = [[CDPCAEscrowReporter alloc] initWithPreRecordIdentifier:v6];
    [(CDPCAEscrowReporter *)v9 didAttemptEscrowPreRecord];
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Have EscrowPreRecord, attempting to enable secure backup: %@", buf, 0xCu);
    }

    id v11 = +[CDPDLockAssertion lock];
    secureBackupController = self->_secureBackupController;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __66__CDPDLocalSecretController__attemptToEscrowPreRecord_completion___block_invoke;
    v14[3] = &unk_26432EDC0;
    id v15 = v11;
    id v16 = v7;
    id v13 = v11;
    [(CDPDSecureBackupController *)secureBackupController checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:v8 completion:v14];
  }
  else
  {
    _CDPStateError();
    id v8 = (CDPDSecureBackupContext *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, CDPDSecureBackupContext *))v7 + 2))(v7, 0, v8);
  }
}

void __66__CDPDLocalSecretController__attemptToEscrowPreRecord_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) unlock];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (void)_localSecretChangedTo:(id)a3 secretType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(CDPCALocalSecretReporter);
  if ([v8 length])
  {
    [(CDPCALocalSecretReporter *)v10 didChangeLocalSecret];
    id v11 = objc_alloc_init(CDPDSecureBackupContext);
    [(CDPDSecureBackupContext *)v11 setLocalSecret:v8];
    [(CDPDSecureBackupContext *)v11 setLocalSecretType:a4];
    id v12 = +[CDPDLockAssertion lock];
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v13, OS_LOG_TYPE_DEFAULT, "Have local secret, attempting to enable secure backup", buf, 2u);
    }

    secureBackupController = self->_secureBackupController;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __73__CDPDLocalSecretController__localSecretChangedTo_secretType_completion___block_invoke;
    v16[3] = &unk_26432EDC0;
    id v17 = v12;
    id v18 = v9;
    id v15 = v12;
    [(CDPDSecureBackupController *)secureBackupController checkAndRemoveExistingThenEnableSecureBackupRecordWithContext:v11 completion:v16];
  }
  else
  {
    [(CDPCALocalSecretReporter *)v10 didRemoveLocalSecret];
    _CDPStateError();
    id v11 = (CDPDSecureBackupContext *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, CDPDSecureBackupContext *))v9 + 2))(v9, 0, v11);
  }
}

void __73__CDPDLocalSecretController__localSecretChangedTo_secretType_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) unlock];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (void)_handleCompletionStatus:(BOOL)a3 preRecord:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    if (a4) {
      return;
    }
    id v10 = [MEMORY[0x263F343A8] sharedInstance];
    int v11 = [v10 hasLocalSecret];

    id v12 = _CDPLogSystem();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "Failed to update local secret by re-enabling SecureBackup", (uint8_t *)&v16, 2u);
      }

      uint64_t v14 = [(CDPContext *)self->_context type];
      id v15 = [(CDPDLocalSecretController *)self followUpProvider];
      id v9 = v15;
      if (v14 == 7) {
        [v15 postConfirmExistingSecretFollowUp];
      }
      else {
        [v15 postLocalSecretChangeFollowUp];
      }
      goto LABEL_16;
    }
    if (v13)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "No secret, no follow up", (uint8_t *)&v16, 2u);
    }

    id v8 = [(CDPDLocalSecretController *)self followUpProvider];
    id v9 = v8;
    goto LABEL_15;
  }
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(CDPContext *)self->_context type];
    int v16 = 134217984;
    uint64_t v17 = v6;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated local secret by re-enabling SecureBackup with context type: %ld", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v7 = [(CDPContext *)self->_context type];
  id v8 = [(CDPDLocalSecretController *)self followUpProvider];
  id v9 = v8;
  if (v7 != 7)
  {
LABEL_15:
    [v8 deleteLocalSecretChangeFollowUp];
    goto LABEL_16;
  }
  [v8 deleteConfirmExistingSecretFollowUp];
LABEL_16:
}

- (void)_repairWithStateMachine:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Failed to silently update local secret, starting repair", v9, 2u);
  }

  [(CDPContext *)self->_context set_alwaysCreateEscrowRecord:1];
  [v7 repairCloudDataProtectionStateWithCompletion:v6];
}

- (void)_setContextWithAuthResults:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Creating new CDPContext with the auth results", (uint8_t *)&v9, 2u);
  }

  id v6 = (void *)[objc_alloc(MEMORY[0x263F34350]) initWithAuthenticationResults:v4];
  objc_msgSend(v6, "setType:", -[CDPContext type](self->_context, "type"));
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 type];
    int v9 = 134217984;
    uint64_t v10 = v8;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Context type set to %ld", (uint8_t *)&v9, 0xCu);
  }

  [(CDPDLocalSecretController *)self setContext:v6];
}

- (void)_createContextForSecret:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke;
  v20 = &unk_26432FF80;
  id v7 = v6;
  v21 = self;
  id v22 = v7;
  uint64_t v8 = _Block_copy(&v17);
  int v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uiProvider = self->_uiProvider;
    uint64_t v11 = objc_msgSend(MEMORY[0x263F34328], "sharedInstance", v17, v18, v19, v20);
    id v12 = [v11 primaryAccountStashedPRK];
    *(_DWORD *)buf = 138412802;
    uint64_t v24 = uiProvider;
    __int16 v25 = 1024;
    BOOL v26 = v4;
    __int16 v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "Refreshing context for input: (%@) - %{BOOL}d - %@", buf, 0x1Cu);
  }
  if ([(CDPContext *)self->_context type] == 6
    && v4
    && self->_uiProvider
    && ([MEMORY[0x263F34328] sharedInstance],
        BOOL v13 = objc_claimAutoreleasedReturnValue(),
        [v13 primaryAccountStashedPRK],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        !v14))
  {
    int v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v16, OS_LOG_TYPE_DEFAULT, "Enabling backup, but we are missing a PRK, force interaction to get one", buf, 2u);
    }

    [(CDPStateUIProviderInternal *)self->_uiProvider cdpContext:self->_context promptForInteractiveAuthenticationWithCompletion:v8];
  }
  else
  {
    id v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v15, OS_LOG_TYPE_DEFAULT, "Refreshing context with PET", buf, 2u);
    }

    +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithCompletion:v8];
  }
}

void __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 domain];
  if ([v7 isEqualToString:*MEMORY[0x263F28F30]])
  {
    uint64_t v8 = [v6 code];

    if (v8 == -7003)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke_2;
      v12[3] = &unk_26432FF80;
      id v9 = *(id *)(a1 + 40);
      v12[4] = *(void *)(a1 + 32);
      id v13 = v9;
      +[CDPAuthenticationHelper silentAuthenticationForPrimaryAccountWithCompletion:v12];

      goto LABEL_11;
    }
  }
  else
  {
  }
  if (v6)
  {
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke_cold_1(v10);
    }

    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) _setContextWithAuthResults:v5];
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v11();
LABEL_11:
}

uint64_t __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) _setContextWithAuthResults:a2];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (id)_cdpStateMachine
{
  v2 = [[CDPDStateMachine alloc] initWithContext:self->_context uiProvider:self->_uiProvider];
  return v2;
}

- (void)_collectLocalSecretWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDLocalSecretController _collectLocalSecretWithCompletion:](v5);
  }

  [(CDPStateUIProviderInternal *)self->_uiProvider cdpContext:self->_context promptForLocalSecretWithCompletion:v4];
}

- (id)circlePeerIDForSecureBackupController:(id)a3
{
  p_circleController = (uint64_t *)&self->_circleController;
  id v4 = [(CDPDCircleController *)self->_circleController peerID];
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(CDPDLocalSecretController *)(uint64_t)v4 circlePeerIDForSecureBackupController:v5];
  }

  return v4;
}

- (BOOL)synchronizeCircleViewsForSecureBackupContext:(id)a3
{
  return [(CDPDCircleController *)self->_circleController synchronizeCircleViews];
}

- (void)promptForAdoptionOfMultipleICSCWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
}

- (void)circleController:(id)a3 secureBackupRecordsArePresentWithCompletion:(id)a4
{
}

- (id)contextForController:(id)a3
{
  return self->_context;
}

- (id)secureChannelContextForController:(id)a3
{
  return 0;
}

- (CDPContext)context
{
  return self->_context;
}

- (CDPDCircleController)circleController
{
  return self->_circleController;
}

- (void)setCircleController:(id)a3
{
}

- (CDPDSecureBackupController)secureBackupController
{
  return self->_secureBackupController;
}

- (void)setSecureBackupController:(id)a3
{
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (CDPLocalSecretFollowUpProvider)followUpProvider
{
  return self->_followUpProvider;
}

- (void)setFollowUpProvider:(id)a3
{
}

- (AAFKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_followUpProvider, 0);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_secureBackupController, 0);
  objc_storeStrong((id *)&self->_circleController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_wrappedLocalSecretChangedTo:(os_log_t)log secretType:completion:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[CDPDLocalSecretController _wrappedLocalSecretChangedTo:secretType:completion:]";
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "No local secret passed in, nothing to update %s. Aborting", (uint8_t *)&v1, 0xCu);
}

- (void)_wrappedLocalSecretChangedTo:(os_log_t)log secretType:completion:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[CDPDLocalSecretController _wrappedLocalSecretChangedTo:secretType:completion:]";
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "No primary account found in %s. Aborting", (uint8_t *)&v1, 0xCu);
}

void __68__CDPDLocalSecretController__createContextForSecret_withCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "Failed to reauthenticate before updating local secret", v1, 2u);
}

- (void)_collectLocalSecretWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Prompting user to enter local secret...", v1, 2u);
}

- (void)circlePeerIDForSecureBackupController:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Got peer id: %@ from %@", (uint8_t *)&v4, 0x16u);
}

@end