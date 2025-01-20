@interface CDPDCircleController
- (BOOL)canRetryCliqueStatus;
- (BOOL)synchronizeCircleViews;
- (CDPDCircleController)initWithUiProvider:(id)a3 delegate:(id)a4 circleProxy:(id)a5 octagonTrustProxy:(id)a6;
- (CDPDCircleDelegate)delegate;
- (CDPDCircleProxy)circleProxy;
- (CDPDOctagonTrustProxy)octagonProxy;
- (CDPStateUIProviderInternal)uiProvider;
- (id)_peerDeviceNamesByPeerID;
- (id)peerID;
- (int)circleSyncingStatus;
- (int64_t)cliqueStatus;
- (int64_t)nextRetryInterval;
- (unint64_t)circleStatus;
- (void)_attemptCustodianBackupRecoveryWithInfo:(id)a3 result:(id)a4 ignoreBackups:(BOOL)a5 completion:(id)a6;
- (void)_joinCircleFallbackWithResult:(id)a3 ignoreBackups:(BOOL)a4 completion:(id)a5;
- (void)_joinCircleIgnoringBackups:(BOOL)a3 context:(id)a4 completion:(id)a5;
- (void)_requestCircleJoinWithObserver:(id)a3 requestBlock:(id)a4 completion:(id)a5;
- (void)_requestToJoinAfterRestoreAndWaitForSuccessWithHandler:(id)a3;
- (void)_requestToJoinAndWaitForSuccessWithHandler:(id)a3;
- (void)_requestToJoinWithObserver:(id)a3 completion:(id)a4;
- (void)_requestToJoinWithRequestBlock:(id)a3 completion:(id)a4;
- (void)_silentReauthWithCompletion:(id)a3;
- (void)applyToJoinCircleWithJoinHandler:(id)a3;
- (void)cancelApplicationToJoinCircle;
- (void)dealloc;
- (void)joinCircleIgnoringBackups:(BOOL)a3 completion:(id)a4;
- (void)joinCircleWithCompletion:(id)a3;
- (void)joinCircleWithContext:(id)a3 completion:(id)a4;
- (void)prepareCircleStateForRecovery;
- (void)promptForCredentials:(id)a3;
- (void)resetCircleIncludingCloudKitData:(BOOL)a3 cloudKitResetReasonDescription:(id)a4 withCompletion:(id)a5;
- (void)setCircleProxy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOctagonProxy:(id)a3;
- (void)setUiProvider:(id)a3;
- (void)useCircleInfoToUpdateNameForDevices:(id)a3;
@end

@implementation CDPDCircleController

- (CDPDCircleController)initWithUiProvider:(id)a3 delegate:(id)a4 circleProxy:(id)a5 octagonTrustProxy:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(CDPDCircleController *)self init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uiProvider, a3);
    objc_storeWeak((id *)&v16->_delegate, v12);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.cdpd.circleRequestQueue", v17);
    requestSynchronizationQueue = v16->_requestSynchronizationQueue;
    v16->_requestSynchronizationQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v16->_circleProxy, a5);
    objc_storeStrong((id *)&v16->_octagonProxy, a6);
    retryIntervals = v16->_retryIntervals;
    v16->_retryIntervals = (NSArray *)&unk_26C9D3130;

    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.cdpd.circleControllerDefaultQueue", v22);
    cdpdCircleDefaultQueue = v16->_cdpdCircleDefaultQueue;
    v16->_cdpdCircleDefaultQueue = (OS_dispatch_queue *)v23;
  }
  return v16;
}

- (void)dealloc
{
  [(CDPDCircleStateObserver *)self->_circleJoinObserver stopObservingCircleStatusChange];
  v3.receiver = self;
  v3.super_class = (Class)CDPDCircleController;
  [(CDPDCircleController *)&v3 dealloc];
}

- (unint64_t)circleStatus
{
  return [(CDPDCircleProxy *)self->_circleProxy combinedCircleStatus:0];
}

- (int)circleSyncingStatus
{
  return [(CDPDCircleProxy *)self->_circleProxy cachedSOSCircleStatus:0];
}

- (int64_t)cliqueStatus
{
  return [(CDPDCircleProxy *)self->_circleProxy cliqueStatus:0];
}

- (id)peerID
{
  return (id)[(CDPDCircleProxy *)self->_circleProxy peerId];
}

- (BOOL)synchronizeCircleViews
{
  return [(CDPDCircleProxy *)self->_circleProxy synchronizeCircleViews];
}

- (void)prepareCircleStateForRecovery
{
}

intptr_t __53__CDPDCircleController_prepareCircleStateForRecovery__block_invoke(intptr_t result, uint64_t a2)
{
  if (a2 != 3)
  {
    uint64_t v7 = v2;
    uint64_t v8 = v3;
    intptr_t v4 = result;
    v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Circle state changed to a state other than pending, proceeding with recovery", v6, 2u);
    }

    [*(id *)(v4 + 32) stopObservingCircleStatusChange];
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v4 + 40));
  }
  return result;
}

- (void)joinCircleWithContext:(id)a3 completion:(id)a4
{
}

- (void)joinCircleWithCompletion:(id)a3
{
}

- (void)joinCircleIgnoringBackups:(BOOL)a3 completion:(id)a4
{
}

- (void)_joinCircleIgnoringBackups:(BOOL)a3 context:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = (void (**)(id, CDPDCircleJoinResult *, void))a5;
  if (v8)
  {
    id v10 = v8;
    id v11 = [CDPDSecureChannelContext alloc];
    id v12 = [(CDPDCircleController *)self circleProxy];
    uint64_t v13 = [(CDPDSecureChannelContext *)v11 initWithContext:v10 circleProxy:v12];
  }
  else
  {
    id v14 = [(CDPDCircleController *)self delegate];
    id v10 = [v14 contextForController:self];

    id v12 = [(CDPDCircleController *)self delegate];
    uint64_t v13 = [v12 secureChannelContextForController:self];
  }
  v15 = (void *)v13;

  [v10 populateWalrusStatus];
  circleProxy = self->_circleProxy;
  id v67 = 0;
  uint64_t v17 = [(CDPDCircleProxy *)circleProxy combinedCircleStatus:&v67];
  id v18 = v67;
  v19 = objc_alloc_init(CDPDCircleJoinResult);
  [(CDPDCircleJoinResult *)v19 setCircleStatus:v17];
  [(CDPDCircleJoinResult *)v19 setRequiresEscrowRecordsFetch:1];
  [(CDPDCircleJoinResult *)v19 setRequiresInitialSync:1];
  if (v17 == 3)
  {
    [(CDPDCircleJoinResult *)v19 setNeedsBackupRecovery:1];
LABEL_10:
    v9[2](v9, v19, 0);
    goto LABEL_11;
  }
  if (v17 == 1)
  {
    v20 = _CDPLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:].cold.6();
    }

    [(CDPDCircleJoinResult *)v19 setDidJoin:1];
    goto LABEL_10;
  }
  BOOL v56 = v6;
  id v57 = v18;
  BOOL v21 = [(CDPDCircleController *)self canRetryCliqueStatus];
  v22 = _CDPLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v50 = [v10 sharingChannel];
    BOOL v51 = [(CDPDCircleController *)self canRetryCliqueStatus];
    *(_DWORD *)buf = 134218498;
    *(void *)v69 = v17;
    *(_WORD *)&v69[8] = 2112;
    *(void *)&v69[10] = v50;
    *(_WORD *)&v69[18] = 1024;
    *(_DWORD *)v70 = v51;
    _os_log_debug_impl(&dword_218640000, v22, OS_LOG_TYPE_DEBUG, "CDP join status: %lu, Sharing channel: %@, Retry possible: %{BOOL}d", buf, 0x1Cu);
  }
  BOOL v23 = 1;
  if (v17 != 2 && v17 != 4)
  {
    if (v17 == 5)
    {
      BOOL v23 = 0;
    }
    else
    {
      v24 = [v10 sharingChannel];
      BOOL v23 = v24 != 0;
    }
  }
  v25 = _CDPLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v55 = [v10 sharingChannel];
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v69 = v23;
    *(_WORD *)&v69[4] = 2048;
    *(void *)&v69[6] = v17;
    *(_WORD *)&v69[14] = 1024;
    *(_DWORD *)&v69[16] = v17 != 5;
    *(_WORD *)v70 = 2112;
    *(void *)&v70[2] = v55;
    __int16 v71 = 1024;
    BOOL v72 = v21;
    _os_log_debug_impl(&dword_218640000, v25, OS_LOG_TYPE_DEBUG, "Will attempt circle join: %{BOOL}d; CDP join status: %lu, has CK account: %{BOOL}d, Sharing channel: %@, Retry possible: %{BOOL}d",
      buf,
      0x28u);
  }
  if (v23)
  {
    v26 = _CDPLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v10 altDSID];
      *(_DWORD *)buf = 141558274;
      *(void *)v69 = 1752392040;
      *(_WORD *)&v69[8] = 2112;
      *(void *)&v69[10] = v27;
      _os_log_impl(&dword_218640000, v26, OS_LOG_TYPE_DEFAULT, "Attempting circle join for %{mask.hash}@", buf, 0x16u);
    }
    v28 = [MEMORY[0x263F343A8] sharedInstance];
    if ([v28 supportsSecureBackupRecovery])
    {
    }
    else
    {
      int v37 = [v10 _recoveryMethodAvailable];

      if (!v37)
      {
        BOOL v39 = 0;
        int v40 = 0;
        if (v15)
        {
LABEL_38:
          id v66 = 0;
          int v41 = [v15 initialize:&v66];
          id v42 = v66;
          if (v41)
          {
            v43 = [[CDPDSecureChannelController alloc] initWithContext:v15];
            v61[0] = MEMORY[0x263EF8330];
            v61[1] = 3221225472;
            v61[2] = __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke;
            v61[3] = &unk_26432FDA0;
            char v64 = v40;
            v61[4] = self;
            v62 = v19;
            BOOL v65 = v56;
            v63 = v9;
            [(CDPDSecureChannelController *)v43 joinCircle:v61];

            goto LABEL_53;
          }
LABEL_45:
          v46 = _CDPLogSystem();
          BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
          if (v39)
          {
            if (v47) {
              -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:]();
            }

            v48 = [v10 custodianRecoveryInfo];
            v59[0] = MEMORY[0x263EF8330];
            v59[1] = 3221225472;
            v59[2] = __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_46;
            v59[3] = &unk_26432F340;
            v60 = v9;
            [(CDPDCircleController *)self _attemptCustodianBackupRecoveryWithInfo:v48 result:v19 ignoreBackups:v56 completion:v59];
          }
          else
          {
            if (!v40)
            {
              if (v47) {
                -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:].cold.5();
              }

              id v18 = v57;
              if (v42)
              {
                id v49 = v42;
              }
              else
              {
                v52 = _CDPLogSystem();
                BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
                if (v15)
                {
                  if (v53) {
                    -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:].cold.4();
                  }
                }
                else if (v53)
                {
                  -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:]();
                }

                _CDPStateError();
                id v49 = (id)objc_claimAutoreleasedReturnValue();
              }
              v54 = v49;
              ((void (**)(id, CDPDCircleJoinResult *, id))v9)[2](v9, 0, v49);

              goto LABEL_54;
            }
            if (v47) {
              -[CDPDCircleController _joinCircleIgnoringBackups:context:completion:]();
            }

            [(CDPDCircleController *)self _joinCircleFallbackWithResult:v19 ignoreBackups:v56 completion:v9];
          }
LABEL_53:
          id v18 = v57;
LABEL_54:

          goto LABEL_11;
        }
LABEL_44:
        id v42 = 0;
        goto LABEL_45;
      }
    }
    v38 = [v10 custodianRecoveryInfo];
    BOOL v39 = v38 != 0;

    int v40 = 1;
    if (v15) {
      goto LABEL_38;
    }
    goto LABEL_44;
  }
  if (v17 != 5)
  {
    id v18 = v57;
    v44 = _CDPStateErrorWithUnderlying();
    ((void (**)(id, CDPDCircleJoinResult *, void *))v9)[2](v9, 0, v44);
LABEL_42:

    goto LABEL_11;
  }
  id v18 = v57;
  if (![(CDPDCircleController *)self canRetryCliqueStatus])
  {
    v44 = _CDPStateError();
    v45 = _CDPStateErrorWithUnderlying();
    ((void (**)(id, CDPDCircleJoinResult *, void *))v9)[2](v9, 0, v45);

    goto LABEL_42;
  }
  int64_t v29 = [(CDPDCircleController *)self nextRetryInterval];
  v30 = _CDPLogSystem();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [NSNumber numberWithInteger:v29];
    *(_DWORD *)buf = 138412290;
    *(void *)v69 = v31;
    _os_log_impl(&dword_218640000, v30, OS_LOG_TYPE_DEFAULT, "scheduling join retry after %@ seconds as security says there is no CK account yet", buf, 0xCu);
  }
  v32 = _CDPSignpostLogSystem();
  os_signpost_id_t v33 = _CDPSignpostCreate();

  v34 = _CDPSignpostLogSystem();
  v35 = v34;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218640000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "NoCKAccountBackOffRetry", " enableTelemetry=YES ", buf, 2u);
  }

  v36 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v69 = v33;
    _os_log_impl(&dword_218640000, v36, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: NoCKAccountBackOffRetry  enableTelemetry=YES ", buf, 0xCu);
  }

  dispatch_time(0, 1000000000 * v29);
  v58 = v9;
  cdp_dispatch_after_with_qos();

LABEL_11:
}

void __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 didJoin])
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Secure channel worked, we joined the circle...", v12, 2u);
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_12:
    v8();
    goto LABEL_13;
  }
  int v9 = *(unsigned __int8 *)(a1 + 56);
  id v10 = _CDPLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (!v9)
  {
    if (v11) {
      __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_cold_1();
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_12;
  }
  if (v11) {
    __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_cold_2();
  }

  [*(id *)(a1 + 32) _joinCircleFallbackWithResult:*(void *)(a1 + 40) ignoreBackups:*(unsigned __int8 *)(a1 + 57) completion:*(void *)(a1 + 48)];
LABEL_13:
}

uint64_t __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_47(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_47_cold_1();
  }

  uint64_t Nanoseconds = _CDPSignpostGetNanoseconds();
  intptr_t v4 = _CDPSignpostLogSystem();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = *(void *)(a1 + 64);
    int v11 = 67240192;
    LODWORD(v12) = v7;
    _os_signpost_emit_with_name_impl(&dword_218640000, v5, OS_SIGNPOST_INTERVAL_END, v6, "NoCKAccountBackOffRetry", " NextRetryInterval=%{public,signpost.telemetry:number1,name=NextRetryInterval}d ", (uint8_t *)&v11, 8u);
  }

  id v8 = _CDPSignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 48);
    __int16 v13 = 2048;
    double v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v15 = 1026;
    int v16 = v9;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: NoCKAccountBackOffRetry  NextRetryInterval=%{public,signpost.telemetry:number1,name=NextRetryInterval}d ", (uint8_t *)&v11, 0x1Cu);
  }

  return [*(id *)(a1 + 32) _joinCircleIgnoringBackups:*(unsigned __int8 *)(a1 + 72) context:0 completion:*(void *)(a1 + 40)];
}

- (void)_joinCircleFallbackWithResult:(id)a3 ignoreBackups:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Falling back to recovery based circle flows...", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke;
  v14[3] = &unk_26432FDF0;
  int v16 = self;
  id v17 = v9;
  BOOL v18 = a4;
  id v15 = v8;
  id v12 = v8;
  id v13 = v9;
  [WeakRetained circleController:self secureBackupRecordsArePresentWithCompletion:v14];
}

void __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (v7)
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke_cold_1();
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  [*(id *)(a1 + 32) setHasPeersWithCDPBackupRecords:a3];
  if (((a2 & 1) != 0 || a3) && !*(unsigned char *)(a1 + 56) || [*(id *)(a1 + 32) circleStatus] == 2)
  {
    [*(id *)(a1 + 32) setNeedsBackupRecovery:1];
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_10:
    v9();
    goto LABEL_11;
  }
  id v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v10, OS_LOG_TYPE_DEFAULT, "Circle status is CDPSyncingStatusAbsent and backups are NOT present... Trying to create and join the circle", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
  id v12 = [WeakRetained contextForController:*(void *)(a1 + 40)];

  id v13 = [MEMORY[0x263F202A8] analyticsEventWithContext:v12 eventName:*MEMORY[0x263F34530] category:*MEMORY[0x263F34830]];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke_50;
  v17[3] = &unk_26432FB98;
  id v15 = *(void **)(a1 + 40);
  double v14 = *(void **)(a1 + 48);
  id v18 = v13;
  v19 = v15;
  id v21 = v14;
  id v20 = *(id *)(a1 + 32);
  id v16 = v13;
  [v15 _requestToJoinAndWaitForSuccessWithHandler:v17];

LABEL_11:
}

void __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke_50(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*MEMORY[0x263F34558]];

  os_signpost_id_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "cliqueStatus"));
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:*MEMORY[0x263F34538]];

  id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "circleSyncingStatus"));
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*MEMORY[0x263F34528]];

  if (v9) {
    [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v9];
  }
  else {
    [*(id *)(a1 + 48) setDidJoin:a2];
  }
  id v8 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v8 sendEvent:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_attemptCustodianBackupRecoveryWithInfo:(id)a3 result:(id)a4 ignoreBackups:(BOOL)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  circleProxy = self->_circleProxy;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __96__CDPDCircleController__attemptCustodianBackupRecoveryWithInfo_result_ignoreBackups_completion___block_invoke;
  v15[3] = &unk_26432FE18;
  v15[4] = self;
  id v16 = v10;
  BOOL v18 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  [(CDPDCircleProxy *)circleProxy recoverOctagonUsingCustodianInfo:a3 completion:v15];
}

void __96__CDPDCircleController__attemptCustodianBackupRecoveryWithInfo_result_ignoreBackups_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  intptr_t v4 = _CDPLogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __96__CDPDCircleController__attemptCustodianBackupRecoveryWithInfo_result_ignoreBackups_completion___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) _joinCircleFallbackWithResult:*(void *)(a1 + 40) ignoreBackups:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_signpost_id_t v6 = 0;
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Custodian CDP Recovery succeeded", v6, 2u);
    }

    [*(id *)(a1 + 40) setDidJoin:1];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (BOOL)canRetryCliqueStatus
{
  return self->_cliqueStatusRetryCount < 5;
}

- (int64_t)nextRetryInterval
{
  retryIntervals = self->_retryIntervals;
  ++self->_cliqueStatusRetryCount;
  id v3 = -[NSArray objectAtIndexedSubscript:](retryIntervals, "objectAtIndexedSubscript:");
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)promptForCredentials:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_signpost_id_t v6 = [WeakRetained contextForController:self];

  uint64_t v7 = [v6 password];
  if (!v7)
  {
LABEL_7:
    uiProvider = self->_uiProvider;
    if (uiProvider)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      id v14 = [v13 contextForController:self];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __45__CDPDCircleController_promptForCredentials___block_invoke;
      v16[3] = &unk_26432F0B8;
      id v17 = v6;
      BOOL v18 = self;
      id v19 = v4;
      [(CDPStateUIProviderInternal *)uiProvider cdpContext:v14 promptForInteractiveAuthenticationWithCompletion:v16];

      goto LABEL_10;
    }
LABEL_9:
    id v15 = _CDPStateError();
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v15);

    goto LABEL_10;
  }
  id v8 = (void *)v7;
  uint64_t v9 = [v6 appleID];
  if (!v9)
  {

    goto LABEL_7;
  }
  id v10 = (void *)v9;
  id v11 = [v6 altDSID];

  if (!v11) {
    goto LABEL_7;
  }
  if (![(CDPDCircleProxy *)self->_circleProxy registerCredentials]) {
    goto LABEL_9;
  }
  (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
LABEL_10:
}

void __45__CDPDCircleController_promptForCredentials___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) updateWithAuthenticationResults:v5];
    int v7 = [*(id *)(*(void *)(a1 + 40) + 48) registerCredentials];
    uint64_t v8 = *(void *)(a1 + 48);
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1, 0);
    }
    else
    {
      id v11 = _CDPStateError();
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v11);
    }
  }
  else
  {
    uint64_t v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __45__CDPDCircleController_promptForCredentials___block_invoke_cold_1();
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v6);
    }
  }
}

- (void)_silentReauthWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained contextForController:self];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__CDPDCircleController__silentReauthWithCompletion___block_invoke;
  v8[3] = &unk_26432F680;
  id v9 = v4;
  id v7 = v4;
  [v6 reauthenticateUserWithCompletion:v8];
}

uint64_t __52__CDPDCircleController__silentReauthWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetCircleIncludingCloudKitData:(BOOL)a3 cloudKitResetReasonDescription:(id)a4 withCompletion:(id)a5
{
  id v6 = a5;
  id v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to reset and join new circle after recovery succeeded but resulted in a pending circle join...", buf, 2u);
  }

  circleProxy = self->_circleProxy;
  id v27 = 0;
  [(CDPDCircleProxy *)circleProxy removeThisDeviceFromCircle:&v27];
  id v9 = v27;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke;
  aBlock[3] = &unk_26432F680;
  id v10 = v6;
  id v26 = v10;
  id v11 = _Block_copy(aBlock);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_56;
  v23[3] = &unk_26432F430;
  v23[4] = self;
  id v12 = v11;
  id v24 = v12;
  id v13 = (void (**)(void))_Block_copy(v23);
  unint64_t v14 = [(CDPDCircleController *)self circleStatus];
  id v15 = _CDPLogSystem();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14 == 3)
  {
    if (v16) {
      -[CDPDCircleController resetCircleIncludingCloudKitData:cloudKitResetReasonDescription:withCompletion:]();
    }

    id v17 = objc_alloc_init(CDPDCircleStateObserver);
    BOOL v18 = self->_circleProxy;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_58;
    v20[3] = &unk_26432FE68;
    id v21 = v17;
    v22 = v13;
    id v19 = v17;
    [(CDPDCircleStateObserver *)v19 observeCircleStateWithCircleProxy:v18 changeHandler:v20];
  }
  else
  {
    if (v16) {
      -[CDPDCircleController resetCircleIncludingCloudKitData:cloudKitResetReasonDescription:withCompletion:]();
    }

    v13[2](v13);
  }
}

void __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_218640000, v6, OS_LOG_TYPE_DEFAULT, "Circle reset completed with success: %{BOOL}d, error: %{public}@", (uint8_t *)v8, 0x12u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

void __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_56(uint64_t a1)
{
  uint64_t v2 = _CDPLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v2, OS_LOG_TYPE_DEFAULT, "Resetting circle after join attempt following recovery resulted in pending...", buf, 2u);
  }

  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  id v12 = 0;
  id v4 = [v3 requestToResetProtectedData:&v12];
  id v5 = v12;

  if (v4)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_10:
    v6();
    goto LABEL_11;
  }
  if (!objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5109))
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_10;
  }
  uint64_t v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_56_cold_1();
  }

  uint64_t v8 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_57;
  v9[3] = &unk_26432FE40;
  v9[4] = v8;
  id v11 = *(id *)(a1 + 40);
  id v10 = v5;
  [v8 _silentReauthWithCompletion:v9];

LABEL_11:
}

void __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_57(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 48);
    id v7 = 0;
    id v4 = [v3 requestToResetProtectedData:&v7];
    id v5 = v7;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

uint64_t __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_58(uint64_t result, uint64_t a2)
{
  if (a2 != 3)
  {
    uint64_t v2 = result;
    id v3 = _CDPLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_58_cold_1();
    }

    (*(void (**)(void))(*(void *)(v2 + 40) + 16))();
    return [*(id *)(v2 + 32) stopObservingCircleStatusChange];
  }
  return result;
}

- (void)useCircleInfoToUpdateNameForDevices:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CDPDCircleController *)self _peerDeviceNamesByPeerID];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v8 = 138412546;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "recordID", v17, (void)v18);

        if (v13)
        {
          unint64_t v14 = [v12 recordID];
          id v15 = [v5 objectForKey:v14];

          if (v15)
          {
            BOOL v16 = _CDPLogSystem();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v17;
              BOOL v23 = v12;
              __int16 v24 = 2112;
              v25 = v15;
              _os_log_debug_impl(&dword_218640000, v16, OS_LOG_TYPE_DEBUG, "Updating device name for %@ to '%@' based on circle info", buf, 0x16u);
            }

            [v12 setLocalizedName:v15];
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }
}

- (id)_peerDeviceNamesByPeerID
{
  return (id)[(CDPDCircleProxy *)self->_circleProxy peerDeviceNamesByPeerID];
}

- (void)applyToJoinCircleWithJoinHandler:(id)a3
{
  id v6 = a3;
  id v4 = objc_alloc_init(CDPDCircleStateObserver);
  circleJoinObserver = self->_circleJoinObserver;
  self->_circleJoinObserver = v4;

  [(CDPDCircleController *)self _requestToJoinWithObserver:self->_circleJoinObserver completion:v6];
}

- (void)_requestToJoinWithObserver:(id)a3 completion:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__CDPDCircleController__requestToJoinWithObserver_completion___block_invoke;
  v4[3] = &unk_26432FE90;
  v4[4] = self;
  [(CDPDCircleController *)self _requestCircleJoinWithObserver:a3 requestBlock:v4 completion:a4];
}

uint64_t __62__CDPDCircleController__requestToJoinWithObserver_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) requestToJoinCircle:a2];
}

- (void)_requestToJoinAndWaitForSuccessWithHandler:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__CDPDCircleController__requestToJoinAndWaitForSuccessWithHandler___block_invoke;
  v3[3] = &unk_26432FE90;
  v3[4] = self;
  [(CDPDCircleController *)self _requestToJoinWithRequestBlock:v3 completion:a3];
}

uint64_t __67__CDPDCircleController__requestToJoinAndWaitForSuccessWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) requestToJoinCircle:a2];
}

- (void)_requestToJoinAfterRestoreAndWaitForSuccessWithHandler:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __79__CDPDCircleController__requestToJoinAfterRestoreAndWaitForSuccessWithHandler___block_invoke;
  v3[3] = &unk_26432FE90;
  v3[4] = self;
  [(CDPDCircleController *)self _requestToJoinWithRequestBlock:v3 completion:a3];
}

uint64_t __79__CDPDCircleController__requestToJoinAfterRestoreAndWaitForSuccessWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) requestToJoinCircleAfterRestore:a2];
}

- (void)_requestToJoinWithRequestBlock:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = objc_alloc_init(CDPDCircleStateObserver);
  [(CDPDCircleController *)self _requestCircleJoinWithObserver:v8 requestBlock:v7 completion:v6];
}

- (void)_requestCircleJoinWithObserver:(id)a3 requestBlock:(id)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (uint64_t (**)(id, id *))a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Requesting to join circle with handler", buf, 2u);
  }

  if ([(CDPDCircleController *)self circleStatus] == 1)
  {
    id v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CDPDCircleController _requestCircleJoinWithObserver:requestBlock:completion:]();
    }

    if (v10) {
      v10[2](v10, 1, 0);
    }
  }
  else
  {
    *(void *)buf = 0;
    id v26 = buf;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke;
    aBlock[3] = &unk_26432FEE0;
    void aBlock[4] = self;
    __int16 v24 = buf;
    id v13 = v8;
    id v22 = v13;
    BOOL v23 = v10;
    unint64_t v14 = _Block_copy(aBlock);
    circleProxy = self->_circleProxy;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_60;
    v19[3] = &unk_26432F3B8;
    id v16 = v14;
    id v20 = v16;
    [v13 observeChangeToState:1 circleProxy:circleProxy handler:v19];
    id v18 = 0;
    LOBYTE(circleProxy) = v9[2](v9, &v18);
    id v17 = v18;
    if ((circleProxy & 1) == 0) {
      (*((void (**)(id, void, id))v16 + 2))(v16, 0, v17);
    }

    _Block_object_dispose(buf, 8);
  }
}

void __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2;
  block[3] = &unk_26432FEB8;
  uint64_t v13 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  char v14 = a2;
  id v10 = v7;
  id v11 = v5;
  id v12 = *(id *)(a1 + 48);
  id v8 = v5;
  dispatch_sync(v6, block);
}

uint64_t __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 56) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    [*(id *)(result + 32) stopObservingCircleStatusChange];
    int v3 = *(unsigned __int8 *)(v2 + 64);
    id v4 = _CDPLogSystem();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Successfully joined the circle", v12, 2u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);
    }

    result = *(void *)(v2 + 48);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(v2 + 64), *(void *)(v2 + 40));
    }
  }
  return result;
}

uint64_t __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelApplicationToJoinCircle
{
  [(CDPDCircleStateObserver *)self->_circleJoinObserver stopObservingCircleStatusChange];
  circleJoinObserver = self->_circleJoinObserver;
  self->_circleJoinObserver = 0;
}

- (CDPDCircleProxy)circleProxy
{
  return self->_circleProxy;
}

- (void)setCircleProxy:(id)a3
{
}

- (CDPStateUIProviderInternal)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (CDPDCircleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CDPDCircleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CDPDOctagonTrustProxy)octagonProxy
{
  return self->_octagonProxy;
}

- (void)setOctagonProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_octagonProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uiProvider, 0);
  objc_storeStrong((id *)&self->_circleProxy, 0);
  objc_storeStrong((id *)&self->_cdpdCircleDefaultQueue, 0);
  objc_storeStrong((id *)&self->_retryIntervals, 0);
  objc_storeStrong((id *)&self->_requestSynchronizationQueue, 0);
  objc_storeStrong((id *)&self->_circleJoinObserver, 0);
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to initialized secure channel with error: %@, Custodian keys available attempting recovery", v2, v3, v4, v5, v6);
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to initialized secure channel with error: %@, starting to fall back...", v2, v3, v4, v5, v6);
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "No secure channel", v1, 2u);
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.4()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "No explicit error, falling back to CDPStateErrorCouldNotApplyToJoinCircleNoFallback", v1, 2u);
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to initialized secure channel, no fallback. %@", v2, v3, v4, v5, v6);
}

- (void)_joinCircleIgnoringBackups:context:completion:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Circle join requested, but we are already in circle!", v2, v3, v4, v5, v6);
}

void __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to resume session, no fallback. %@", v2, v3, v4, v5, v6);
}

void __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Failed to resume session: %@, start to fall back...", v2, v3, v4, v5, v6);
}

void __70__CDPDCircleController__joinCircleIgnoringBackups_context_completion___block_invoke_47_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Retrying circle join now!", v2, v3, v4, v5, v6);
}

void __79__CDPDCircleController__joinCircleFallbackWithResult_ignoreBackups_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Can't join circle, failed to check for presence of secure backup records: %{public}@", v2, v3, v4, v5, v6);
}

void __96__CDPDCircleController__attemptCustodianBackupRecoveryWithInfo_result_ignoreBackups_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Custodian CDP Recovery failed with error: %@", v2, v3, v4, v5, v6);
}

void __45__CDPDCircleController_promptForCredentials___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "UI provider failed to perform interactive authentication for repair. Error: %@", v2, v3, v4, v5, v6);
}

- (void)resetCircleIncludingCloudKitData:cloudKitResetReasonDescription:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Pending application state was not resolved immediately after calling remove... waiting to see state != Pending", v2, v3, v4, v5, v6);
}

- (void)resetCircleIncludingCloudKitData:cloudKitResetReasonDescription:withCompletion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Pending application state was resolved immediately after calling remove", v2, v3, v4, v5, v6);
}

void __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_56_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_218640000, v0, v1, "Attempt 1 - Failed to reset due to auth error, will retry: %@", v2, v3, v4, v5, v6);
}

void __103__CDPDCircleController_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion___block_invoke_58_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Pending application state was resolved!", v2, v3, v4, v5, v6);
}

- (void)_requestCircleJoinWithObserver:requestBlock:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Request made, but we were already in circle, completing...", v2, v3, v4, v5, v6);
}

void __79__CDPDCircleController__requestCircleJoinWithObserver_requestBlock_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end