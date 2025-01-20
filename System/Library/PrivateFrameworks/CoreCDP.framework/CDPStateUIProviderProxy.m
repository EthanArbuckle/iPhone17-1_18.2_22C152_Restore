@interface CDPStateUIProviderProxy
- (CDPStateUIProvider)uiProvider;
- (CDPStateUIProviderProxy)initWithUIProvider:(id)a3;
- (void)cdpContext:(id)a3 createLocalSecretWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 presentRecoveryKeyWithValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 presentRemoteApprovalWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4;
- (void)cdpContext:(id)a3 promptForBeneficiaryAccessKeyWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForEDPRecoveryTokenWithValidator:(id)a4 successfulCDPRecoveryContinuationHandler:(id)a5;
- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7;
- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 promptForRecoveryKeyWithSecretValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 promptForRecoveryKeyWithValidator:(id)a4 completion:(id)a5;
- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6;
- (void)cdpContext:(id)a3 showError:(id)a4 withCompletion:(id)a5;
- (void)cdpContext:(id)a3 showError:(id)a4 withDefaultIndex:(int64_t)a5 withCompletion:(id)a6;
- (void)cdpContext:(id)a3 showResetCompletedAlertWithCompletion:(id)a4;
- (void)cdpContext:(id)a3 showResetFailedAlertWithUnderlyingError:(id)a4 completion:(id)a5;
- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5;
- (void)dismissRemoteApprovalWaitingScreenWithAction:(unint64_t)a3;
- (void)presentQuotaScreenWithCompletion:(id)a3;
- (void)setUiProvider:(id)a3;
@end

@implementation CDPStateUIProviderProxy

- (CDPStateUIProviderProxy)initWithUIProvider:(id)a3
{
  id v5 = a3;
  v6 = [(CDPStateUIProviderProxy *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uiProvider, a3);
  }

  return v7;
}

- (void)cdpContext:(id)a3 promptForAdoptionOfMultipleICSC:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__CDPStateUIProviderProxy_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke;
    block[3] = &unk_264317380;
    id v19 = v7;
    block[4] = self;
    id v18 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    v8 = v19;
LABEL_7:

    goto LABEL_8;
  }
  v9 = _CDPLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[CDPStateUIProviderProxy cdpContext:promptForAdoptionOfMultipleICSC:](v9, v10, v11, v12, v13, v14, v15, v16);
  }

  if (v7)
  {
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"CDPStateError" code:-5306 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v8);
    goto LABEL_7;
  }
LABEL_8:
}

void __70__CDPStateUIProviderProxy_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__CDPStateUIProviderProxy_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke_2;
  v3[3] = &unk_2643171D0;
  id v4 = *(id *)(a1 + 48);
  v2 = (void *)MEMORY[0x21D4671C0](v3);
  [*(id *)(*(void *)(a1 + 32) + 8) cdpContext:*(void *)(a1 + 40) promptForAdoptionOfMultipleICSC:v2];
}

uint64_t __70__CDPStateUIProviderProxy_cdpContext_promptForAdoptionOfMultipleICSC___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cdpContext:(id)a3 promptForICSCWithIsNumeric:(BOOL)a4 numericLength:(id)a5 isRandom:(BOOL)a6 validator:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __98__CDPStateUIProviderProxy_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke;
    block[3] = &unk_2643173A8;
    v24 = v12;
    id v25 = v14;
    v26 = self;
    BOOL v28 = a4;
    id v27 = v13;
    BOOL v29 = a6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    uint64_t v15 = v24;
  }
  else
  {
    uint64_t v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CDPStateUIProviderProxy cdpContext:promptForICSCWithIsNumeric:numericLength:isRandom:validator:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

void __98__CDPStateUIProviderProxy_cdpContext_promptForICSCWithIsNumeric_numericLength_isRandom_validator___block_invoke(uint64_t a1)
{
  v2 = [[CDPRemoteDeviceSecretValidator alloc] initWithContext:*(void *)(a1 + 32) validator:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 48) + 8) cdpContext:*(void *)(a1 + 32) promptForICSCWithIsNumeric:*(unsigned __int8 *)(a1 + 64) numericLength:*(void *)(a1 + 56) isRandom:*(unsigned __int8 *)(a1 + 65) validator:v2];
}

- (void)cdpContext:(id)a3 promptForLocalSecretWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F202A8] analyticsEventWithContext:v6 eventName:@"com.apple.corecdp.localSecretCollection" category:0x26C984850];
  if (objc_opt_respondsToSelector())
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __73__CDPStateUIProviderProxy_cdpContext_promptForLocalSecretWithCompletion___block_invoke;
    v19[3] = &unk_2643173F8;
    id v20 = v8;
    id v23 = v7;
    uint64_t v21 = self;
    id v22 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v19);

    v9 = v20;
  }
  else
  {
    uint64_t v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPStateUIProviderProxy cdpContext:promptForLocalSecretWithCompletion:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    v9 = [MEMORY[0x263F087E8] errorWithDomain:@"CDPStateError" code:-5306 userInfo:0];
    [v8 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"didSucceed"];
    [v8 populateUnderlyingErrorsStartingWithRootError:v9];
    uint64_t v18 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
    [v18 sendEvent:v8];

    if (v7) {
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
    }
  }
}

void __73__CDPStateUIProviderProxy_cdpContext_promptForLocalSecretWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = _CDPSignpostLogSystem();
  os_signpost_id_t v3 = _CDPSignpostCreate(v2);
  uint64_t v5 = v4;

  id v6 = _CDPSignpostLogSystem();
  id v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "LocalSecretCollect", " enableTelemetry=YES ", buf, 2u);
  }

  v8 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v19 = v3;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LocalSecretCollect  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __73__CDPStateUIProviderProxy_cdpContext_promptForLocalSecretWithCompletion___block_invoke_37;
  uint64_t v13 = &unk_2643173D0;
  os_signpost_id_t v16 = v3;
  uint64_t v17 = v5;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 56);
  v9 = (void *)MEMORY[0x21D4671C0](&v10);
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "cdpContext:promptForLocalSecretWithCompletion:", *(void *)(a1 + 48), v9, v10, v11, v12, v13);
}

void __73__CDPStateUIProviderProxy_cdpContext_promptForLocalSecretWithCompletion___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = a3;
  id v8 = a2;
  unint64_t Nanoseconds = _CDPSignpostGetNanoseconds(v5, v6);
  uint64_t v10 = _CDPSignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 48);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_2182AE000, v11, OS_SIGNPOST_INTERVAL_END, v12, "LocalSecretCollect", "", (uint8_t *)&v17, 2u);
  }

  uint64_t v13 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 48);
    int v17 = 134218240;
    uint64_t v18 = v14;
    __int16 v19 = 2048;
    double v20 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_2182AE000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: LocalSecretCollect ", (uint8_t *)&v17, 0x16u);
  }

  if (v8) {
    uint64_t v15 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v15 = MEMORY[0x263EFFA80];
  }
  [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:@"didSucceed"];
  [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v7];
  os_signpost_id_t v16 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
  [v16 sendEvent:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cdpContext:(id)a3 presentRemoteApprovalWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__CDPStateUIProviderProxy_cdpContext_presentRemoteApprovalWithCompletion___block_invoke;
    block[3] = &unk_264317420;
    void block[4] = self;
    id v18 = v6;
    id v19 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPStateUIProviderProxy cdpContext:presentRemoteApprovalWithCompletion:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    if (v7)
    {
      os_signpost_id_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"CDPStateError" code:-5306 userInfo:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
    }
  }
}

uint64_t __74__CDPStateUIProviderProxy_cdpContext_presentRemoteApprovalWithCompletion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) cdpContext:a1[5] presentRemoteApprovalWithCompletion:a1[6]];
}

- (void)dismissRemoteApprovalWaitingScreenWithAction:(unint64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__CDPStateUIProviderProxy_dismissRemoteApprovalWaitingScreenWithAction___block_invoke;
    v13[3] = &unk_264317448;
    v13[4] = self;
    v13[5] = a3;
    dispatch_async(MEMORY[0x263EF83A0], v13);
  }
  else
  {
    uint64_t v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CDPStateUIProviderProxy dismissRemoteApprovalWaitingScreenWithAction:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

uint64_t __72__CDPStateUIProviderProxy_dismissRemoteApprovalWaitingScreenWithAction___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) dismissRemoteApprovalWaitingScreenWithAction:*(void *)(a1 + 40)];
}

- (void)cdpContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 offeringRemoteApproval:(BOOL)a5 validator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__CDPStateUIProviderProxy_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke;
  block[3] = &unk_264316E48;
  void block[4] = self;
  id v17 = v10;
  id v18 = v12;
  id v19 = v11;
  BOOL v20 = a5;
  id v13 = v11;
  id v14 = v12;
  id v15 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __104__CDPStateUIProviderProxy_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    os_signpost_id_t v3 = [[CDPRemoteDeviceSecretValidator alloc] initWithContext:*(void *)(a1 + 40) validator:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 32) + 8) cdpContext:*(void *)(a1 + 40) promptForRemoteSecretWithDevices:*(void *)(a1 + 56) offeringRemoteApproval:*(unsigned __int8 *)(a1 + 64) validator:v3];
  }
  else
  {
    v2 = _CDPLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __104__CDPStateUIProviderProxy_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_cold_1();
    }
  }
}

- (void)cdpRecoveryFlowContext:(id)a3 promptForRemoteSecretWithDevices:(id)a4 validator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __93__CDPStateUIProviderProxy_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator___block_invoke;
  v14[3] = &unk_264317470;
  v14[4] = self;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __93__CDPStateUIProviderProxy_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    v2 = [CDPRemoteDeviceSecretValidator alloc];
    os_signpost_id_t v3 = [*(id *)(a1 + 40) context];
    id v9 = [(CDPRemoteDeviceSecretValidator *)v2 initWithContext:v3 validator:*(void *)(a1 + 48)];

    [*(id *)(*(void *)(a1 + 32) + 8) cdpRecoveryFlowContext:*(void *)(a1 + 40) promptForRemoteSecretWithDevices:*(void *)(a1 + 56) validator:v9];
LABEL_5:

    return;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [CDPRemoteDeviceSecretValidator alloc];
    uint64_t v5 = [*(id *)(a1 + 40) context];
    id v9 = [(CDPRemoteDeviceSecretValidator *)v4 initWithContext:v5 validator:*(void *)(a1 + 48)];

    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = [*(id *)(a1 + 40) context];
    objc_msgSend(v6, "cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:", v7, *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "hasPeersForRemoteApproval"), v9);

    goto LABEL_5;
  }
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __93__CDPStateUIProviderProxy_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator___block_invoke_cold_1();
  }
}

- (void)cdpContext:(id)a3 promptForInteractiveAuthenticationWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [MEMORY[0x263F33228] reachabilityForInternetConnection];
    if ([v8 currentReachabilityStatus])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __87__CDPStateUIProviderProxy_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke;
      block[3] = &unk_264317380;
      id v21 = v7;
      void block[4] = self;
      id v20 = v6;
      dispatch_async(MEMORY[0x263EF83A0], block);

      id v9 = v21;
    }
    else
    {
      id v18 = _CDPLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CDPStateUIProviderProxy cdpContext:promptForInteractiveAuthenticationWithCompletion:](v18);
      }

      if (!v7) {
        goto LABEL_13;
      }
      id v9 = _CDPStateError(-5311, 0);
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
    }

LABEL_13:
    goto LABEL_14;
  }
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CDPStateUIProviderProxy cdpContext:promptForInteractiveAuthenticationWithCompletion:](v10, v11, v12, v13, v14, v15, v16, v17);
  }

  if (v7)
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"CDPStateError" code:-5306 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v8);
    goto LABEL_13;
  }
LABEL_14:
}

void __87__CDPStateUIProviderProxy_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __87__CDPStateUIProviderProxy_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke_2;
  v3[3] = &unk_264317130;
  id v4 = *(id *)(a1 + 48);
  v2 = (void *)MEMORY[0x21D4671C0](v3);
  [*(id *)(*(void *)(a1 + 32) + 8) cdpContext:*(void *)(a1 + 40) promptForInteractiveAuthenticationWithCompletion:v2];
}

uint64_t __87__CDPStateUIProviderProxy_cdpContext_promptForInteractiveAuthenticationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cdpContext:(id)a3 showError:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CDPStateUIProviderProxy cdpContext:showError:withCompletion:]((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
  }

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke;
  v21[3] = &unk_2643173F8;
  v21[4] = self;
  id v22 = v8;
  id v23 = v9;
  id v24 = v10;
  id v18 = v9;
  id v19 = v8;
  id v20 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v21);
}

void __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke_2;
    v4[3] = &unk_264317498;
    id v5 = *(id *)(a1 + 56);
    v2 = (void *)MEMORY[0x21D4671C0](v4);
    [*(id *)(*(void *)(a1 + 32) + 8) cdpContext:*(void *)(a1 + 40) showError:*(void *)(a1 + 48) withCompletion:v2];
  }
  else
  {
    os_signpost_id_t v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) cdpContext:*(void *)(a1 + 40) showError:*(void *)(a1 + 48) withDefaultIndex:0 withCompletion:*(void *)(a1 + 56)];
  }
}

uint64_t __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cdpContext:(id)a3 showError:(id)a4 withDefaultIndex:(int64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = _CDPLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[CDPStateUIProviderProxy cdpContext:showError:withCompletion:]((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke;
  block[3] = &unk_2643174C0;
  void block[4] = self;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  int64_t v27 = a5;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_2;
    v5[3] = &unk_264317498;
    id v6 = *(id *)(a1 + 56);
    v2 = (void *)MEMORY[0x21D4671C0](v5);
    [*(id *)(*(void *)(a1 + 32) + 8) cdpContext:*(void *)(a1 + 40) showError:*(void *)(a1 + 48) withDefaultIndex:*(void *)(a1 + 64) withCompletion:v2];
  }
  else
  {
    os_signpost_id_t v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_cold_1();
    }

    uint64_t v4 = *(void *)(a1 + 56);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, -1);
    }
  }
}

uint64_t __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cdpContext:(id)a3 presentRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__CDPStateUIProviderProxy_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke;
  v14[3] = &unk_2643173F8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __81__CDPStateUIProviderProxy_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __81__CDPStateUIProviderProxy_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_2;
    v8[3] = &unk_2643171D0;
    id v9 = *(id *)(a1 + 56);
    v2 = (void *)MEMORY[0x21D4671C0](v8);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
    id v5 = [[CDPRecoveryKeyValidatorProxyImpl alloc] initWithRemoteObject:*(void *)(a1 + 48)];
    [v4 cdpContext:v3 presentRecoveryKeyWithValidator:v5 completion:v2];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      _CDPStateError(-5306, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v7);
    }
  }
}

uint64_t __81__CDPStateUIProviderProxy_cdpContext_presentRecoveryKeyWithValidator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithValidator:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithValidator_completion___block_invoke;
  v14[3] = &unk_2643173F8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __83__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithValidator_completion___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __83__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithValidator_completion___block_invoke_2;
    v8[3] = &unk_2643171D0;
    id v9 = *(id *)(a1 + 56);
    v2 = (void *)MEMORY[0x21D4671C0](v8);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
    id v5 = [[CDPRecoveryKeyValidatorProxyImpl alloc] initWithRemoteObject:*(void *)(a1 + 48)];
    [v4 cdpContext:v3 promptForRecoveryKeyWithValidator:v5 completion:v2];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      _CDPStateError(-5306, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v7);
    }
  }
}

uint64_t __83__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithValidator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cdpContext:(id)a3 promptForRecoveryKeyWithSecretValidator:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithSecretValidator_completion___block_invoke;
  v14[3] = &unk_2643174E8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __89__CDPStateUIProviderProxy_cdpContext_promptForRecoveryKeyWithSecretValidator_completion___block_invoke(void *a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = *(void **)(a1[4] + 8);
    id v5 = [[CDPRecoveryKeySecretValidatorProxyImpl alloc] initWithRemoteObject:a1[6]];
    objc_msgSend(v3, "cdpContext:promptForRecoveryKeyWithSecretValidator:completion:", v2);
  }
  else
  {
    uint64_t v4 = a1[7];
    if (!v4) {
      return;
    }
    _CDPStateError(-5306, 0);
    id v5 = (CDPRecoveryKeySecretValidatorProxyImpl *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)cdpContext:(id)a3 promptForBeneficiaryAccessKeyWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__CDPStateUIProviderProxy_cdpContext_promptForBeneficiaryAccessKeyWithCompletion___block_invoke;
  block[3] = &unk_264317420;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __82__CDPStateUIProviderProxy_cdpContext_promptForBeneficiaryAccessKeyWithCompletion___block_invoke(void *a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = *(void **)(a1[4] + 8);
    uint64_t v4 = a1[6];
    [v3 cdpContext:v2 promptForBeneficiaryAccessKeyWithCompletion:v4];
  }
  else
  {
    uint64_t v5 = a1[6];
    if (v5)
    {
      _CDPStateError(-5306, 0);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v6);
    }
  }
}

- (void)cdpContext:(id)a3 showResetCompletedAlertWithCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[CDPStateUIProviderProxy cdpContext:showResetCompletedAlertWithCompletion:]";
    __int16 v16 = 1024;
    int v17 = 276;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__CDPStateUIProviderProxy_cdpContext_showResetCompletedAlertWithCompletion___block_invoke;
  block[3] = &unk_264317420;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __76__CDPStateUIProviderProxy_cdpContext_showResetCompletedAlertWithCompletion___block_invoke(void *a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = *(void **)(a1[4] + 8);
    uint64_t v4 = a1[6];
    [v3 cdpContext:v2 showResetCompletedAlertWithCompletion:v4];
  }
  else
  {
    uint64_t v5 = a1[6];
    if (v5)
    {
      _CDPStateError(-5306, 0);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v6);
    }
  }
}

- (void)cdpContext:(id)a3 createLocalSecretWithCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[CDPStateUIProviderProxy cdpContext:createLocalSecretWithCompletion:]";
    __int16 v16 = 1024;
    int v17 = 287;
    _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__CDPStateUIProviderProxy_cdpContext_createLocalSecretWithCompletion___block_invoke;
  block[3] = &unk_264317420;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __70__CDPStateUIProviderProxy_cdpContext_createLocalSecretWithCompletion___block_invoke(void *a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = *(void **)(a1[4] + 8);
    uint64_t v4 = a1[6];
    [v3 cdpContext:v2 createLocalSecretWithCompletion:v4];
  }
  else
  {
    uint64_t v5 = a1[6];
    if (v5)
    {
      _CDPStateError(-5306, 0);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v6);
    }
  }
}

- (void)presentQuotaScreenWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CDPStateUIProviderProxy presentQuotaScreenWithCompletion:]";
    __int16 v11 = 1024;
    int v12 = 298;
    _os_log_impl(&dword_2182AE000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CDPStateUIProviderProxy_presentQuotaScreenWithCompletion___block_invoke;
  v7[3] = &unk_264317510;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __60__CDPStateUIProviderProxy_presentQuotaScreenWithCompletion___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v3 presentQuotaScreenWithCompletion:v2];
  }
  else
  {
    uint64_t v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60__CDPStateUIProviderProxy_presentQuotaScreenWithCompletion___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
    }
  }
  return result;
}

- (void)cdpContext:(id)a3 showResetFailedAlertWithUnderlyingError:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CDPStateUIProviderProxy cdpContext:showResetFailedAlertWithUnderlyingError:completion:]";
    __int16 v21 = 1024;
    int v22 = 311;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __89__CDPStateUIProviderProxy_cdpContext_showResetFailedAlertWithUnderlyingError_completion___block_invoke;
  v15[3] = &unk_2643174E8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void __89__CDPStateUIProviderProxy_cdpContext_showResetFailedAlertWithUnderlyingError_completion___block_invoke(void *a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = *(void **)(a1[4] + 8);
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7];
    [v3 cdpContext:v2 showResetFailedAlertWithUnderlyingError:v4 completion:v5];
  }
  else
  {
    uint64_t v6 = a1[7];
    if (v6)
    {
      _CDPStateError(-5306, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v7);
    }
  }
}

- (void)cdpContext:(id)a3 promptForEDPRecoveryTokenWithValidator:(id)a4 successfulCDPRecoveryContinuationHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "-[CDPStateUIProviderProxy cdpContext:promptForEDPRecoveryTokenWithValidator:successfulCDPRecoveryContinuationHandler:]";
    __int16 v22 = 1024;
    int v23 = 323;
    _os_log_impl(&dword_2182AE000, v11, OS_LOG_TYPE_DEFAULT, "%s (%d) called", buf, 0x12u);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __118__CDPStateUIProviderProxy_cdpContext_promptForEDPRecoveryTokenWithValidator_successfulCDPRecoveryContinuationHandler___block_invoke;
  v15[3] = &unk_2643174E8;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void __118__CDPStateUIProviderProxy_cdpContext_promptForEDPRecoveryTokenWithValidator_successfulCDPRecoveryContinuationHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isBeneficiaryFlow])
  {
    uint64_t v2 = _CDPLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __118__CDPStateUIProviderProxy_cdpContext_promptForEDPRecoveryTokenWithValidator_successfulCDPRecoveryContinuationHandler___block_invoke_cold_1(v2);
    }
LABEL_10:

    return;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v2 = _CDPLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __118__CDPStateUIProviderProxy_cdpContext_promptForEDPRecoveryTokenWithValidator_successfulCDPRecoveryContinuationHandler___block_invoke_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    goto LABEL_10;
  }
  id v10 = [[CDPRemoteDeviceSecretValidator alloc] initWithContext:*(void *)(a1 + 32) validator:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 40) + 8) cdpContext:*(void *)(a1 + 32) promptForEDPRecoveryTokenWithValidator:v10 successfulCDPRecoveryContinuationHandler:*(void *)(a1 + 56)];
}

- (CDPStateUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)cdpContext:(uint64_t)a3 promptForAdoptionOfMultipleICSC:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cdpContext:(uint64_t)a3 promptForICSCWithIsNumeric:(uint64_t)a4 numericLength:(uint64_t)a5 isRandom:(uint64_t)a6 validator:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cdpContext:(uint64_t)a3 promptForLocalSecretWithCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cdpContext:(uint64_t)a3 presentRemoteApprovalWithCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dismissRemoteApprovalWaitingScreenWithAction:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __104__CDPStateUIProviderProxy_cdpContext_promptForRemoteSecretWithDevices_offeringRemoteApproval_validator___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_2182AE000, v0, OS_LOG_TYPE_DEBUG, "Warning: UI provider %@ does not respond to selector cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:", v1, 0xCu);
}

void __93__CDPStateUIProviderProxy_cdpRecoveryFlowContext_promptForRemoteSecretWithDevices_validator___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_2182AE000, v0, OS_LOG_TYPE_DEBUG, "Warning: UI provider %@ does not respond to selectors cdpRecoveryFlowContext:promptForRemoteSecretWithDevices:validator: and cdpContext:promptForRemoteSecretWithDevices:offeringRemoteApproval:validator:", v1, 0xCu);
}

- (void)cdpContext:(os_log_t)log promptForInteractiveAuthenticationWithCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2182AE000, log, OS_LOG_TYPE_ERROR, "Bailed out of interactive authentication. Preventing appearance of prompt because network is unreachable.", v1, 2u);
}

- (void)cdpContext:(uint64_t)a3 promptForInteractiveAuthenticationWithCompletion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cdpContext:(uint64_t)a3 showError:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__CDPStateUIProviderProxy_cdpContext_showError_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Warning: UI provider %@ does not respond to selector cdpContext:showError:withCompletion:", v2, v3, v4, v5, v6);
}

void __80__CDPStateUIProviderProxy_cdpContext_showError_withDefaultIndex_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_3(&dword_2182AE000, v0, v1, "Warning: UI provider %@ does not respond to selector cdpContext:showError:withDefaultIndex:withCompletion:", v2, v3, v4, v5, v6);
}

void __60__CDPStateUIProviderProxy_presentQuotaScreenWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __118__CDPStateUIProviderProxy_cdpContext_promptForEDPRecoveryTokenWithValidator_successfulCDPRecoveryContinuationHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2182AE000, log, OS_LOG_TYPE_ERROR, "Attempted to prompt for EDP recovery token while in beneficiary flow. Doing nothing.", v1, 2u);
}

void __118__CDPStateUIProviderProxy_cdpContext_promptForEDPRecoveryTokenWithValidator_successfulCDPRecoveryContinuationHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end