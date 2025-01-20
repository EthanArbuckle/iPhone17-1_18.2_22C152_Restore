@interface CDPDSecureChannelController
- (CDPDSecureChannelController)initWithContext:(id)a3;
- (void)_joinCircle:(id)a3;
- (void)_processAndReplyWithMessage:(id)a3 completion:(id)a4;
- (void)_startListeningWithProxy:(id)a3;
- (void)_startListeningWithProxyWithEnforcedQoS:(id)a3;
- (void)enforceQOS:(id)a3;
- (void)joinCircle:(id)a3;
- (void)startCircleApplicationApprovalServerWithContext:(id)a3 completion:(id)a4;
@end

@implementation CDPDSecureChannelController

- (CDPDSecureChannelController)initWithContext:(id)a3
{
  id v5 = a3;
  v6 = [(CDPDSecureChannelController *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_secureChannelContext, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.cdpd.secureChannelProcessingQueue", v9);
    secureChannelProcessingQueue = v7->_secureChannelProcessingQueue;
    v7->_secureChannelProcessingQueue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (void)enforceQOS:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  cdp_dispatch_sync_with_qos();
}

uint64_t __42__CDPDSecureChannelController_enforceQOS___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)joinCircle:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureChannelController joinCircle:]();
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__CDPDSecureChannelController_joinCircle___block_invoke;
  v7[3] = &unk_26432F430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CDPDSecureChannelController *)self enforceQOS:v7];
}

uint64_t __42__CDPDSecureChannelController_joinCircle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _joinCircle:*(void *)(a1 + 40)];
}

- (void)_joinCircle:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, id))a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureChannelController _joinCircle:](v5);
  }

  id v6 = objc_alloc_init(CDPDCircleJoinResult);
  [(CDPDCircleJoinResult *)v6 setRequiresEscrowRecordsFetch:1];
  [(CDPDCircleJoinResult *)v6 setRequiresInitialSync:1];
  v7 = (void *)MEMORY[0x263F202A8];
  id v8 = [(CDPDSecureChannelContext *)self->_secureChannelContext context];
  uint64_t v9 = *MEMORY[0x263F34830];
  dispatch_queue_t v10 = [v7 analyticsEventWithContext:v8 eventName:*MEMORY[0x263F34750] category:*MEMORY[0x263F34830]];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CDPDSecureChannelContext secureChannelType](self->_secureChannelContext, "secureChannelType"));
  uint64_t v12 = *MEMORY[0x263F34770];
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x263F34770]];

  v13 = [(CDPDSecureChannelContext *)self->_secureChannelContext keychainCircleProxy];
  id v36 = 0;
  v14 = [v13 initiatingPayload:&v36];
  id v15 = v36;

  uint64_t v16 = *MEMORY[0x263F34558];
  if (!v14 || v15)
  {
    [v10 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v16];
    v27 = _CDPLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v15;
      _os_log_impl(&dword_218640000, v27, OS_LOG_TYPE_DEFAULT, "Secure Channel Init failed with error: %@", buf, 0xCu);
    }

    [v10 populateUnderlyingErrorsStartingWithRootError:v15];
    v28 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v28 sendEvent:v10];

    v4[2](v4, 0, v15);
  }
  else
  {
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v16];
    v17 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v17 sendEvent:v10];

    v18 = _CDPLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v14;
      _os_log_impl(&dword_218640000, v18, OS_LOG_TYPE_DEFAULT, "Sending initiating payload: %@", buf, 0xCu);
    }

    v19 = (void *)MEMORY[0x263F202A8];
    v20 = [(CDPDSecureChannelContext *)self->_secureChannelContext context];
    v21 = [v19 analyticsEventWithContext:v20 eventName:*MEMORY[0x263F34768] category:v9];

    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CDPDSecureChannelContext secureChannelType](self->_secureChannelContext, "secureChannelType"));
    [v21 setObject:v22 forKeyedSubscript:v12];

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__CDPDSecureChannelController__joinCircle___block_invoke;
    aBlock[3] = &unk_264330E68;
    id v32 = v21;
    v33 = self;
    v34 = v6;
    v35 = v4;
    id v23 = v21;
    v24 = _Block_copy(aBlock);
    v25 = [(CDPDSecureChannelContext *)self->_secureChannelContext secureChannelProxy];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __43__CDPDSecureChannelController__joinCircle___block_invoke_25;
    v29[3] = &unk_264330EB8;
    v29[4] = self;
    id v30 = v24;
    id v26 = v24;
    [v25 sendPayload:v14 completion:v29];
  }
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = MEMORY[0x263EFFA88];
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Secure Channel send failed with error: %@", buf, 0xCu);
    }

    uint64_t v7 = MEMORY[0x263EFFA80];
  }
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*MEMORY[0x263F34558]];
  [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v6];
  uint64_t v9 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v9 sendEvent:*(void *)(a1 + 32)];

  if (v5)
  {
    dispatch_queue_t v10 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __43__CDPDSecureChannelController__joinCircle___block_invoke_22;
    v12[3] = &unk_26432FF58;
    v12[4] = v10;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    [v10 _processAndReplyWithMessage:v5 completion:v12];
  }
  else
  {
    v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __43__CDPDSecureChannelController__joinCircle___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_22(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263F202A8];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) context];
  id v8 = [v6 analyticsEventWithContext:v7 eventName:*MEMORY[0x263F34740] category:*MEMORY[0x263F34830]];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "secureChannelType"));
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F34770]];

  if (a2)
  {
    dispatch_queue_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) circleProxy];
    id v25 = 0;
    uint64_t v11 = [v10 cachedCliqueStatus:&v25];
    id v12 = v25;

    if (v12 || v11 != 1)
    {
      v20 = _CDPLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __43__CDPDSecureChannelController__joinCircle___block_invoke_22_cold_1();
      }

      v18 = 0;
      uint64_t v17 = v12;
      id v16 = v12;
    }
    else
    {
      [*(id *)(a1 + 40) setDidJoin:1];
      id v13 = [*(id *)(*(void *)(a1 + 32) + 8) secureChannelProxy];
      objc_msgSend(*(id *)(a1 + 40), "setHasPeersWithCDPBackupRecords:", objc_msgSend(v13, "approverBackupRecordsExist"));

      id v14 = [*(id *)(*(void *)(a1 + 32) + 8) secureChannelProxy];
      objc_msgSend(*(id *)(a1 + 40), "setRemotePeeriCKState:", objc_msgSend(v14, "approveriCloudKeychainState"));

      [*(id *)(a1 + 40) setRequiresEscrowRecordsFetch:0];
      id v15 = [*(id *)(*(void *)(a1 + 32) + 8) keychainCircleProxy];
      objc_msgSend(*(id *)(a1 + 40), "setRequiresInitialSync:", objc_msgSend(v15, "requiresInitialSync"));

      id v16 = 0;
      uint64_t v17 = *(void **)(a1 + 40);
      v18 = v17;
    }
    id v21 = v17;
  }
  else
  {
    v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __43__CDPDSecureChannelController__joinCircle___block_invoke_22_cold_2();
    }

    id v16 = v5;
    v18 = 0;
  }
  if ([v18 didJoin]) {
    uint64_t v22 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v22 = MEMORY[0x263EFFA80];
  }
  [v8 setObject:v22 forKeyedSubscript:*MEMORY[0x263F34558]];
  [v8 populateUnderlyingErrorsStartingWithRootError:v16];
  id v23 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v23 sendEvent:v8];

  uint64_t v24 = *(void *)(a1 + 48);
  if (v24) {
    (*(void (**)(uint64_t, void *, id))(v24 + 16))(v24, v18, v16);
  }
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__CDPDSecureChannelController__joinCircle___block_invoke_25_cold_1();
  }

  id v11 = *(id *)(a1 + 40);
  dispatch_queue_t v10 = v5;
  id v8 = v6;
  id v9 = v5;
  cdp_dispatch_async_with_qos();
}

uint64_t __43__CDPDSecureChannelController__joinCircle___block_invoke_26(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)startCircleApplicationApprovalServerWithContext:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  secureChannelContext = self->_secureChannelContext;
  id v8 = (void (**)(id, uint64_t, void))a4;
  [(CDPDSecureChannelContext *)secureChannelContext setSecureChannelType:2];
  id v9 = [(CDPDSecureChannelContext *)self->_secureChannelContext secureChannelProxy];
  int v10 = [v9 conformsToProtocol:&unk_26C9DA2A0];

  if (v10)
  {
    id v11 = [(CDPDSecureChannelContext *)self->_secureChannelContext secureChannelProxy];
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v12, OS_LOG_TYPE_DEFAULT, "Starting a CDP accepting server...", buf, 2u);
    }

    id v13 = [MEMORY[0x263F34328] sharedInstance];
    uint64_t v14 = [v13 primaryAccountSecurityLevel];

    if ([v6 managedAccountsAllowedInCDP])
    {
      id v27 = 0;
      int v15 = [v6 isiCDPEligibleWithError:&v27];
      id v16 = v27;
    }
    else
    {
      id v16 = 0;
      int v15 = 0;
    }
    uint64_t v17 = _CDPLogSystem();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v14 == 4 || v15)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "CDPDSecureChannelController: We are iCDP Eligible, checking for escrow records.", buf, 2u);
      }

      if ([v6 _skipEscrowFetches])
      {
        [v11 setApproverBackupRecordsExist:1];
        v19 = [(CDPDSecureChannelContext *)self->_secureChannelContext circleProxy];
        v20 = (void *)[objc_alloc(MEMORY[0x263F343E8]) initWithContext:v6];
        id v21 = +[CDPDKeychainSync keyChainSyncWithProxy:v19 sosCircleProxy:v20 context:v6];

        if ([(CDPDSecureBackupController *)v21 isUserVisibleKeychainSyncEnabled])uint64_t v22 = 2; {
        else
        }
          uint64_t v22 = 1;
        [v11 setApproveriCloudKeychainState:v22];
        [(CDPDSecureChannelController *)self _startListeningWithProxy:v11];
      }
      else
      {
        id v21 = [[CDPDSecureBackupController alloc] initWithContext:v6 uiProvider:0 delegate:0];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __90__CDPDSecureChannelController_startCircleApplicationApprovalServerWithContext_completion___block_invoke;
        v23[3] = &unk_264330DB8;
        id v24 = v11;
        id v25 = self;
        id v26 = v6;
        [(CDPDSecureBackupController *)v21 backupRecordsArePresentWithCompletion:v23];
      }
    }
    else
    {
      if (v18)
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v16;
        _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "Starting server in dry move, we are not iCDP eligible (error: %@)", buf, 0xCu);
      }

      [(CDPDSecureChannelController *)self _startListeningWithProxy:v11];
    }
    v8[2](v8, 1, 0);
  }
  else
  {
    id v11 = _CDPStateError();
    ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v11);
  }
}

void __90__CDPDSecureChannelController_startCircleApplicationApprovalServerWithContext_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setApproverBackupRecordsExist:");
  v2 = [*(id *)(*(void *)(a1 + 40) + 8) circleProxy];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F343E8]) initWithContext:*(void *)(a1 + 48)];
  id v6 = +[CDPDKeychainSync keyChainSyncWithProxy:v2 sosCircleProxy:v3 context:*(void *)(a1 + 48)];

  id v4 = *(void **)(a1 + 32);
  if ([v6 isUserVisibleKeychainSyncEnabled]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [v4 setApproveriCloudKeychainState:v5];
  [*(id *)(a1 + 40) _startListeningWithProxy:*(void *)(a1 + 32)];
}

- (void)_startListeningWithProxy:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureChannelController _startListeningWithProxy:]();
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__CDPDSecureChannelController__startListeningWithProxy___block_invoke;
  v7[3] = &unk_264330AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CDPDSecureChannelController *)self enforceQOS:v7];
}

uint64_t __56__CDPDSecureChannelController__startListeningWithProxy___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListeningWithProxyWithEnforcedQoS:*(void *)(a1 + 40)];
}

- (void)_startListeningWithProxyWithEnforcedQoS:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)os_transaction_create();
  id v6 = +[CDPDLockAssertion lock];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke;
  aBlock[3] = &unk_264330EE0;
  void aBlock[4] = self;
  id v15 = v4;
  id v16 = v6;
  id v17 = v5;
  id v7 = v5;
  id v8 = v6;
  id v9 = v4;
  int v10 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_2;
  v12[3] = &unk_264330F30;
  v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  [v9 listenForPayloadsWithHandler:v12];
}

void __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263F202A8];
  id v8 = *(void **)(*(void *)(a1 + 32) + 8);
  id v9 = a2;
  int v10 = [v8 context];
  id v11 = [v7 analyticsEventWithContext:v10 eventName:*MEMORY[0x263F34758] category:*MEMORY[0x263F34830]];

  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "secureChannelType"));
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F34770]];

  id v13 = NSNumber;
  uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 8) circleProxy];
  id v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "cachedCliqueStatus:", 0));
  [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x263F34538]];

  id v16 = [*(id *)(a1 + 40) telemetryFlowIDFromRequester];

  if (v16)
  {
    id v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_cold_2(v17);
    }

    BOOL v18 = [*(id *)(a1 + 40) telemetryFlowIDFromRequester];
    [v11 setObject:v18 forKeyedSubscript:*MEMORY[0x263F20348]];

    v19 = *(void **)(*(void *)(a1 + 32) + 8);
    v20 = [*(id *)(a1 + 40) telemetryFlowIDFromRequester];
    [v19 setFlowIDFromRequester:v20];
  }
  id v21 = [*(id *)(*(void *)(a1 + 32) + 8) keychainCircleProxy];
  id v35 = 0;
  uint64_t v22 = [v21 processIncomingPayload:v9 error:&v35];

  id v23 = v35;
  if (v22)
  {
    uint64_t v24 = MEMORY[0x263EFFA88];
  }
  else
  {
    id v25 = _CDPLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v23;
      _os_log_impl(&dword_218640000, v25, OS_LOG_TYPE_DEFAULT, "Secure Channel process failed with error: %@", buf, 0xCu);
    }

    uint64_t v24 = MEMORY[0x263EFFA80];
  }
  [v11 setObject:v24 forKeyedSubscript:*MEMORY[0x263F34558]];
  [v11 populateUnderlyingErrorsStartingWithRootError:v23];
  id v26 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v26 sendEvent:v11];

  id v27 = v22;
  *a3 = v27;
  id v28 = v23;
  *a4 = v28;
  if (v28)
  {
    id v29 = _CDPLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_cold_1();
    }
  }
  uint64_t v30 = [*(id *)(*(void *)(a1 + 32) + 8) keychainCircleProxy];
  int v31 = [v30 isComplete];

  if (v28 || v31)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_84;
    block[3] = &unk_264330AA0;
    id v33 = *(id *)(a1 + 48);
    id v34 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_84(uint64_t a1)
{
  return [*(id *)(a1 + 32) unlock];
}

void __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_2_cold_1();
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_86;
  v12[3] = &unk_264330F08;
  id v9 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v13 = v7;
  id v14 = v10;
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  id v11 = v7;
  [v9 enforceQOS:v12];
}

uint64_t __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_86(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6], a1[7]);
}

- (void)_processAndReplyWithMessage:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v6;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Processing reply: %@", buf, 0xCu);
  }

  id v9 = (void *)MEMORY[0x263F202A8];
  id v10 = [(CDPDSecureChannelContext *)self->_secureChannelContext context];
  uint64_t v11 = *MEMORY[0x263F34830];
  id v12 = [v9 analyticsEventWithContext:v10 eventName:*MEMORY[0x263F34760] category:*MEMORY[0x263F34830]];

  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CDPDSecureChannelContext secureChannelType](self->_secureChannelContext, "secureChannelType"));
  uint64_t v14 = *MEMORY[0x263F34770];
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x263F34770]];

  uint64_t v15 = [(CDPDSecureChannelContext *)self->_secureChannelContext keychainCircleProxy];
  id v36 = 0;
  uint64_t v16 = [v15 processIncomingPayload:v6 error:&v36];
  id v17 = v36;

  if (v17) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 0;
  }
  if (v18) {
    uint64_t v19 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v19 = MEMORY[0x263EFFA88];
  }
  [v12 setObject:v19 forKeyedSubscript:*MEMORY[0x263F34558]];
  [v12 populateUnderlyingErrorsStartingWithRootError:v17];
  v20 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v20 sendEvent:v12];

  if (v17)
  {
    id v21 = _CDPLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureChannelController _processAndReplyWithMessage:completion:]();
    }

    v7[2](v7, 0, v17);
  }
  else
  {
    uint64_t v22 = [(CDPDSecureChannelContext *)self->_secureChannelContext keychainCircleProxy];
    int v23 = [v22 isComplete];

    uint64_t v24 = _CDPLogSystem();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218640000, v24, OS_LOG_TYPE_DEFAULT, "Secure channel request completed...", buf, 2u);
      }

      v7[2](v7, 1, 0);
    }
    else
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v16;
        _os_log_impl(&dword_218640000, v24, OS_LOG_TYPE_DEFAULT, "Sending response: %@", buf, 0xCu);
      }

      id v26 = (void *)MEMORY[0x263F202A8];
      id v27 = [(CDPDSecureChannelContext *)self->_secureChannelContext context];
      id v28 = [v26 analyticsEventWithContext:v27 eventName:*MEMORY[0x263F34768] category:v11];

      id v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CDPDSecureChannelContext secureChannelType](self->_secureChannelContext, "secureChannelType"));
      [v28 setObject:v29 forKeyedSubscript:v14];

      uint64_t v30 = [(CDPDSecureChannelContext *)self->_secureChannelContext secureChannelProxy];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __70__CDPDSecureChannelController__processAndReplyWithMessage_completion___block_invoke;
      v32[3] = &unk_264330F58;
      id v33 = v28;
      id v34 = self;
      id v35 = v7;
      id v31 = v28;
      [v30 sendPayload:v16 completion:v32];
    }
  }
}

void __70__CDPDSecureChannelController__processAndReplyWithMessage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = MEMORY[0x263EFFA88];
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Secure Channel send failed with error: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v7 = MEMORY[0x263EFFA80];
  }
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*MEMORY[0x263F34558]];
  [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v6];
  id v9 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v9 sendEvent:*(void *)(a1 + 32)];

  if (v5)
  {
    [*(id *)(a1 + 40) _processAndReplyWithMessage:v5 completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __70__CDPDSecureChannelController__processAndReplyWithMessage_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureChannelProcessingQueue, 0);
  objc_storeStrong((id *)&self->_secureChannelContext, 0);
}

- (void)joinCircle:.cold.1()
{
  qos_class_self();
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "numberWithUnsignedInt:");
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_0(&dword_218640000, v1, v2, "Attempting to join circle with QOS: %@. %@ will be enforced.", v3, v4, v5, v6, v7);
}

- (void)_joinCircle:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Creating initiating payload...", v1, 2u);
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to send initiating message for resume: %@", v2, v3, v4, v5, v6);
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "We completed, but ended up with error... %@", v2, v3, v4, v5, v6);
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_22_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to process and reply message with replyError: %@", v2, v3, v4, v5, v6);
}

void __43__CDPDSecureChannelController__joinCircle___block_invoke_25_cold_1()
{
  qos_class_self();
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "numberWithUnsignedInt:");
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_0(&dword_218640000, v1, v2, "Processing SecureChannel reply with QOS: %@. %@ will be enforced.", v3, v4, v5, v6, v7);
}

- (void)_startListeningWithProxy:.cold.1()
{
  qos_class_self();
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "numberWithUnsignedInt:");
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_0(&dword_218640000, v1, v2, "Listening for SecureChannel payloads with QOS: %@. %@ will be enforced.", v3, v4, v5, v6, v7);
}

void __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to process requestor payload on approver side with error: %@", v2, v3, v4, v5, v6);
}

void __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Setting requester's flowID on kCDPAnalyticsSecureChannelProcessApprovalEvent", v1, 2u);
}

void __71__CDPDSecureChannelController__startListeningWithProxyWithEnforcedQoS___block_invoke_2_cold_1()
{
  qos_class_self();
  v0 = objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "numberWithUnsignedInt:");
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_6_0(&dword_218640000, v1, v2, "Processing SecureChannel approvingProxy payload with QOS: %@. %@ will be enforced.", v3, v4, v5, v6, v7);
}

- (void)_processAndReplyWithMessage:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to process reply with error: %@", v2, v3, v4, v5, v6);
}

void __70__CDPDSecureChannelController__processAndReplyWithMessage_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to send response with error: %@", v2, v3, v4, v5, v6);
}

@end