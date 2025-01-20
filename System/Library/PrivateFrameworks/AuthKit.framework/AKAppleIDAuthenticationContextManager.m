@interface AKAppleIDAuthenticationContextManager
- (AKAppleIDAuthenticationContextManager)initWithAuthenticationController:(id)a3;
- (AKAppleIDAuthenticationDelegate)delegate;
- (id)_clientSideContextForServerContext:(id)a3;
- (id)registerContext:(id)a3;
- (void)activateProximitySession:(id)a3 context:(id)a4 completion:(id)a5;
- (void)dismissBasicLoginUIForContext:(id)a3 completion:(id)a4;
- (void)dismissKeepUsingUIForContext:(id)a3 withCompletion:(id)a4;
- (void)dismissNativeRecoveryUIForContext:(id)a3 completion:(id)a4;
- (void)dismissProximityPairingUIForContext:(id)a3 completion:(id)a4;
- (void)dismissSecondFactorUIForContext:(id)a3 completion:(id)a4;
- (void)dismissServerProvidedUIForContext:(id)a3 completion:(id)a4;
- (void)eraseAnisetteForContext:(id)a3 withCompletion:(id)a4;
- (void)fetchAnisetteDataForContext:(id)a3 provisionIfNecessary:(BOOL)a4 withCompletion:(id)a5;
- (void)fetchPeerAttestationDataForContext:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)launchOutOfProcessAuthentication:(id)a3 surrogateID:(id)a4 withErrorHandler:(id)a5;
- (void)legacyAnisetteDataForContext:(id)a3 DSID:(id)a4 withCompletion:(id)a5;
- (void)presentBasicLoginUIForContext:(id)a3 completion:(id)a4;
- (void)presentBiometricOrPasscodeValidationForContext:(id)a3 completion:(id)a4;
- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 completion:(id)a5;
- (void)presentKeepUsingUIForContext:(id)a3 appleID:(id)a4 completion:(id)a5;
- (void)presentLoginAlertForContext:(id)a3 withError:(id)a4 title:(id)a5 message:(id)a6 completion:(id)a7;
- (void)presentNativeRecoveryUIForContext:(id)a3 recoveryContext:(id)a4 completion:(id)a5;
- (void)presentProximityBroadcastUIForContext:(id)a3 completion:(id)a4;
- (void)presentProximityPairingUIForContext:(id)a3 verificationCode:(id)a4 completion:(id)a5;
- (void)presentProximityPinCodeUIForContext:(id)a3 completion:(id)a4;
- (void)presentSecondFactorAlertForContext:(id)a3 withError:(id)a4 title:(id)a5 message:(id)a6 completion:(id)a7;
- (void)presentSecondFactorUIForContext:(id)a3 completion:(id)a4;
- (void)presentServerProvidedUIForContext:(id)a3 withConfiguration:(id)a4 completion:(id)a5;
- (void)provisionAnisetteForContext:(id)a3 withCompletion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)shouldContinueWithAuthenticationResults:(id)a3 error:(id)a4 forContextID:(id)a5 completion:(id)a6;
- (void)showProximityErrorForContext:(id)a3 completion:(id)a4;
- (void)syncAnisetteForContext:(id)a3 withSIMData:(id)a4 completion:(id)a5;
- (void)unregisterContext:(id)a3;
@end

@implementation AKAppleIDAuthenticationContextManager

- (AKAppleIDAuthenticationContextManager)initWithAuthenticationController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AKAppleIDAuthenticationContextManager;
  v5 = [(AKAppleIDAuthenticationContextManager *)&v12 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    authContextsByUUID = v5->_authContextsByUUID;
    v5->_authContextsByUUID = v6;

    objc_storeWeak((id *)&v5->_authController, v4);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("AKContextManagerQueue", v8);
    authContextsQueue = v5->_authContextsQueue;
    v5->_authContextsQueue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (id)registerContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if ([v6 hasPrefix:@"AK"])
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__2;
    v24 = __Block_byref_object_dispose__2;
    id v25 = 0;
    authContextsQueue = self->_authContextsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__AKAppleIDAuthenticationContextManager_registerContext___block_invoke;
    block[3] = &unk_1E575F7C8;
    v19 = &v20;
    block[4] = self;
    id v8 = v4;
    id v18 = v8;
    dispatch_barrier_sync(authContextsQueue, block);
    if (v21[5])
    {
      dispatch_queue_t v9 = _AKLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [v8 _identifier];
        [(AKAppleIDAuthenticationContextManager *)v10 registerContext:v9];
      }

      v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7086);
    }
    else
    {
      v13 = self->_authContextsQueue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __57__AKAppleIDAuthenticationContextManager_registerContext___block_invoke_22;
      v15[3] = &unk_1E575F448;
      v15[4] = self;
      id v16 = v8;
      dispatch_barrier_async(v13, v15);

      v11 = 0;
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    objc_super v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager registerContext:]();
    }

    v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7085);
  }

  return v11;
}

void __57__AKAppleIDAuthenticationContextManager_registerContext___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = [*(id *)(a1 + 40) _identifier];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __57__AKAppleIDAuthenticationContextManager_registerContext___block_invoke_22(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [v1 _identifier];
  [v2 setObject:v1 forKey:v3];
}

- (void)unregisterContext:(id)a3
{
  uint64_t v4 = [a3 _identifier];
  authContextsQueue = self->_authContextsQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__AKAppleIDAuthenticationContextManager_unregisterContext___block_invoke;
  v7[3] = &unk_1E575F448;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_barrier_async(authContextsQueue, v7);
}

void __59__AKAppleIDAuthenticationContextManager_unregisterContext___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v1 = *(void **)(*(void *)(a1 + 40) + 8);
    objc_msgSend(v1, "removeObjectForKey:");
  }
  else
  {
    v2 = _AKLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __59__AKAppleIDAuthenticationContextManager_unregisterContext___block_invoke_cold_1();
    }
  }
}

- (void)shouldContinueWithAuthenticationResults:(id)a3 error:(id)a4 forContextID:(id)a5 completion:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = _os_activity_create(&dword_193494000, "authkit/should-continue", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__2;
  v54 = __Block_byref_object_dispose__2;
  id v55 = 0;
  authContextsQueue = self->_authContextsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke;
  block[3] = &unk_1E575F7C8;
  v49 = &v50;
  block[4] = self;
  id v15 = v11;
  id v48 = v15;
  dispatch_sync(authContextsQueue, block);
  if (v51[5])
  {
    id v16 = _AKSignpostLogSystem();
    os_signpost_id_t v17 = _AKSignpostCreate(v16);
    uint64_t v19 = v18;

    uint64_t v20 = _AKSignpostLogSystem();
    v21 = v20;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      int v22 = [v10 code];
      *(_DWORD *)buf = 67240192;
      LODWORD(v58) = v22;
      _os_signpost_emit_with_name_impl(&dword_193494000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v17, "ShouldContinueWithResults", " Error=%{public,signpost.telemetry:number1,name=Error}d  enableTelemetry=YES ", buf, 8u);
    }

    v23 = _AKSignpostLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [v10 code];
      *(_DWORD *)buf = 134218240;
      os_signpost_id_t v58 = v17;
      __int16 v59 = 1026;
      int v60 = v24;
      _os_log_impl(&dword_193494000, v23, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: ShouldContinueWithResults  Error=%{public,signpost.telemetry:number1,name=Error}d  enableTelemetry=YES ", buf, 0x12u);
    }

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke_23;
    v43[3] = &unk_1E575F7F0;
    os_signpost_id_t v45 = v17;
    uint64_t v46 = v19;
    id v44 = v12;
    id v25 = (void (**)(void, void, void))MEMORY[0x1996FE880](v43);
    v26 = [(AKAppleIDAuthenticationContextManager *)self delegate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_authController);
    if (objc_opt_respondsToSelector())
    {
      v28 = _AKLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193494000, v28, OS_LOG_TYPE_DEFAULT, "Calling delegate...", buf, 2u);
      }

      id v29 = (id)[v39 mutableCopy];
      uint64_t v30 = [v26 authenticationController:WeakRetained shouldContinueWithAuthenticationResults:v29 error:v10 forContext:v51[5]];
      v31 = _AKLogSystem();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = @"NO";
        if (v30) {
          v32 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v58 = (os_signpost_id_t)v32;
        _os_log_impl(&dword_193494000, v31, OS_LOG_TYPE_DEFAULT, "Delegate says to continue? %@", buf, 0xCu);
      }

      ((void (**)(void, uint64_t, id))v25)[2](v25, v30, v29);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v38 = _AKLogSystem();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_193494000, v38, OS_LOG_TYPE_DEFAULT, "No delegate available.", buf, 2u);
        }

        ((void (**)(void, BOOL, id))v25)[2](v25, v10 == 0, v39);
        goto LABEL_26;
      }
      v35 = _AKLogSystem();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193494000, v35, OS_LOG_TYPE_DEFAULT, "Calling delegate...", buf, 2u);
      }

      v36 = (void *)[v39 mutableCopy];
      uint64_t v37 = v51[5];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke_35;
      v40[3] = &unk_1E575F818;
      v42 = v25;
      id v29 = v36;
      id v41 = v29;
      [v26 authenticationController:WeakRetained shouldContinueWithAuthenticationResults:v29 error:v10 forContext:v37 completion:v40];
    }
LABEL_26:

    goto LABEL_27;
  }
  v33 = _AKLogSystem();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDAuthenticationContextManager shouldContinueWithAuthenticationResults:error:forContextID:completion:]((uint64_t)v15, v33, v34);
  }

  (*((void (**)(id, void, id))v12 + 2))(v12, 0, v39);
LABEL_27:

  _Block_object_dispose(&v50, 8);
  os_activity_scope_leave(&state);
}

uint64_t __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

void __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke_23(void *a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v7 = a3;
  unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v5, v6);
  dispatch_queue_t v9 = _AKSignpostLogSystem();
  id v10 = v9;
  os_signpost_id_t v11 = a1[5];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v13 = 67240192;
    LODWORD(v14) = a2;
    _os_signpost_emit_with_name_impl(&dword_193494000, v10, OS_SIGNPOST_INTERVAL_END, v11, "ShouldContinueWithResults", " ShouldContinue=%{public,signpost.telemetry:number2,name=ShouldContinue}d ", (uint8_t *)&v13, 8u);
  }

  id v12 = _AKSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218496;
    uint64_t v14 = a1[5];
    __int16 v15 = 2048;
    double v16 = (double)Nanoseconds / 1000000000.0;
    __int16 v17 = 1026;
    int v18 = a2;
    _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:ShouldContinueWithResults  ShouldContinue=%{public,signpost.telemetry:number2,name=ShouldContinue}d ", (uint8_t *)&v13, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __111__AKAppleIDAuthenticationContextManager_shouldContinueWithAuthenticationResults_error_forContextID_completion___block_invoke_35(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    if (a2) {
      uint64_t v5 = @"YES";
    }
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_193494000, v4, OS_LOG_TYPE_DEFAULT, "Delegate says to continue? %@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)presentKeepUsingUIForContext:(id)a3 appleID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  id v10 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:a3];
  if (!v10)
  {
    uint64_t v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentKeepUsingUIForContext:appleID:completion:]();
    }

    __int16 v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = -7011;
    goto LABEL_12;
  }
  char v11 = objc_opt_respondsToSelector();
  id v12 = _AKLogSystem();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if ((v11 & 1) == 0)
  {
    if (v13) {
      -[AKAppleIDAuthenticationContextManager presentKeepUsingUIForContext:appleID:completion:]();
    }

    __int16 v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = -7027;
LABEL_12:
    __int16 v17 = objc_msgSend(v15, "ak_errorWithCode:", v16);
    v9[2](v9, 0, v17);

    goto LABEL_13;
  }
  if (v13) {
    -[AKAppleIDAuthenticationContextManager presentKeepUsingUIForContext:appleID:completion:]();
  }

  [v10 presentKeepUsingUIForAppleID:v8 completion:v9];
LABEL_13:
}

- (void)dismissKeepUsingUIForContext:(id)a3 withCompletion:(id)a4
{
  uint64_t v9 = a4;
  uint64_t v6 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:a3];
  if (v6)
  {
    if (objc_opt_respondsToSelector())
    {
      [v6 dismissKeepUsingUIWithCompletion:v9];
      goto LABEL_7;
    }
    int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
    id v8 = (void (*)(void))v9[2];
  }
  else
  {
    int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7011);
    id v8 = (void (*)(void))v9[2];
  }
  v8();

LABEL_7:
}

- (void)presentBasicLoginUIForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v6];
  if (!v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -7011;
LABEL_8:
    id v12 = objc_msgSend(v9, "ak_errorWithCode:", v10);
    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v12);

    goto LABEL_9;
  }
  if (([v6 conformsToProtocol:&unk_1EE455670] & 1) == 0)
  {
    char v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:]();
    }

    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -7014;
    goto LABEL_8;
  }
  [v8 presentBasicLoginUIWithCompletion:v7];
LABEL_9:
}

- (void)dismissBasicLoginUIForContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:a3];
  id v8 = v7;
  if (!v7)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -7011;
LABEL_8:
    id v12 = objc_msgSend(v9, "ak_errorWithCode:", v10);
    v6[2](v6, 0, v12);

    goto LABEL_9;
  }
  if (([v7 conformsToProtocol:&unk_1EE455670] & 1) == 0)
  {
    char v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:]();
    }

    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -7014;
    goto LABEL_8;
  }
  [v8 dismissBasicLoginUIWithCompletion:v6];
LABEL_9:
}

- (void)presentLoginAlertForContext:(id)a3 withError:(id)a4 title:(id)a5 message:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:a3];
  __int16 v17 = v16;
  if (!v16)
  {
    int v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = -7011;
LABEL_8:
    v21 = objc_msgSend(v18, "ak_errorWithCode:", v19);
    (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v21);

    goto LABEL_9;
  }
  if (([v16 conformsToProtocol:&unk_1EE455670] & 1) == 0)
  {
    uint64_t v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:]();
    }

    int v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = -7014;
    goto LABEL_8;
  }
  [v17 presentLoginAlertWithError:v12 title:v13 message:v14 completion:v15];
LABEL_9:
}

- (void)presentSecondFactorUIForContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:a3];
  if (!v7)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = -7011;
LABEL_8:
    char v11 = objc_msgSend(v8, "ak_errorWithCode:", v9);
    v6[2](v6, 0, v11);

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentSecondFactorUIForContext:completion:]();
    }

    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = -7014;
    goto LABEL_8;
  }
  [v7 presentSecondFactorUIWithCompletion:v6];
LABEL_9:
}

- (void)dismissSecondFactorUIForContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:a3];
  if (!v7)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = -7011;
LABEL_8:
    char v11 = objc_msgSend(v8, "ak_errorWithCode:", v9);
    v6[2](v6, 0, v11);

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:]();
    }

    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = -7014;
    goto LABEL_8;
  }
  [v7 dismissSecondFactorUIWithCompletion:v6];
LABEL_9:
}

- (void)presentSecondFactorAlertForContext:(id)a3 withError:(id)a4 title:(id)a5 message:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void, void *))a7;
  uint64_t v16 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:a3];
  if (!v16)
  {
    __int16 v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = -7011;
LABEL_8:
    uint64_t v20 = objc_msgSend(v17, "ak_errorWithCode:", v18);
    v15[2](v15, 0, v20);

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:]();
    }

    __int16 v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = -7014;
    goto LABEL_8;
  }
  [v16 presentSecondFactorAlertWithError:v12 title:v13 message:v14 completion:v15];
LABEL_9:
}

- (void)presentServerProvidedUIForContext:(id)a3 withConfiguration:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 138412802;
    id v25 = self;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_debug_impl(&dword_193494000, v11, OS_LOG_TYPE_DEBUG, "%@: Presenting server provided UI for context (%@) with configuration (%@)", (uint8_t *)&v24, 0x20u);
  }

  id v12 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v8];
  id v13 = v12;
  if (!v12)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = -7011;
LABEL_14:
    v23 = objc_msgSend(v20, "ak_errorWithCode:", v21);
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v23);

    goto LABEL_15;
  }
  if (([v12 conformsToProtocol:&unk_1EE455AF0] & 1) == 0)
  {
    int v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:]();
    }

    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = -7014;
    goto LABEL_14;
  }
  id v14 = [v13 anisetteDataProvider];

  if (v14)
  {
    id v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v13 anisetteDataProvider];
      __int16 v17 = [v9 resourceLoadDelegate];
      int v24 = 138412802;
      id v25 = self;
      __int16 v26 = 2112;
      id v27 = v16;
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_impl(&dword_193494000, v15, OS_LOG_TYPE_DEFAULT, "%@: Setting the anisette data provider (%@) on resource load delegate (%@)", (uint8_t *)&v24, 0x20u);
    }
    uint64_t v18 = [v9 resourceLoadDelegate];
    uint64_t v19 = [v13 anisetteDataProvider];
    [v18 setAnisetteDataProvider:v19];
  }
  [v13 presentServerProvidedUIWithConfiguration:v9 completion:v10];
LABEL_15:
}

- (void)dismissServerProvidedUIForContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:a3];
  id v8 = v7;
  if (!v7)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -7011;
LABEL_8:
    id v12 = objc_msgSend(v9, "ak_errorWithCode:", v10);
    v6[2](v6, 0, v12);

    goto LABEL_9;
  }
  if (([v7 conformsToProtocol:&unk_1EE455AF0] & 1) == 0)
  {
    char v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:]();
    }

    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -7014;
    goto LABEL_8;
  }
  [v8 dismissServerProvidedUIWithCompletion:v6];
LABEL_9:
}

- (void)presentNativeRecoveryUIForContext:(id)a3 recoveryContext:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  uint64_t v10 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:a3];
  char v11 = v10;
  if (!v10)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = -7011;
LABEL_8:
    id v15 = objc_msgSend(v12, "ak_errorWithCode:", v13);
    v9[2](v9, 0, v15);

    goto LABEL_9;
  }
  if (([v10 conformsToProtocol:&unk_1EE45EF20] & 1) == 0)
  {
    id v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:]();
    }

    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = -7014;
    goto LABEL_8;
  }
  [v11 presentNativeRecoveryUIWithContext:v8 completion:v9];
LABEL_9:
}

- (void)dismissNativeRecoveryUIForContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:a3];
  id v8 = v7;
  if (!v7)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -7011;
LABEL_8:
    id v12 = objc_msgSend(v9, "ak_errorWithCode:", v10);
    v6[2](v6, 0, v12);

    goto LABEL_9;
  }
  if (([v7 conformsToProtocol:&unk_1EE45EF20] & 1) == 0)
  {
    char v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentBasicLoginUIForContext:completion:]();
    }

    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -7014;
    goto LABEL_8;
  }
  [v8 dismissNativeRecoveryUIWithCompletion:v6];
LABEL_9:
}

- (void)presentBiometricOrPasscodeValidationForContext:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v11];
  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      id v8 = [v11 username];
      [v7 presentBiometricOrPasscodeValidationForAppleID:v8 completion:v6];
      goto LABEL_7;
    }
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -7027;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -7011;
  }
  id v8 = objc_msgSend(v9, "ak_errorWithCode:", v10);
  v6[2](v6, 0, v8);
LABEL_7:
}

- (void)launchOutOfProcessAuthentication:(id)a3 surrogateID:(id)a4 withErrorHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F28C58];
  id v7 = a5;
  objc_msgSend(v6, "ak_errorWithCode:", -7027);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v7, v8);
}

- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  id v11 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v8];
  if (!v11)
  {
    id v15 = _AKLogFido();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentFidoAuthForContext:fidoContext:completion:]();
    }

    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = -7011;
    goto LABEL_12;
  }
  char v12 = objc_opt_respondsToSelector();
  uint64_t v13 = _AKLogFido();
  id v14 = v13;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AKAppleIDAuthenticationContextManager presentFidoAuthForContext:fidoContext:completion:]();
    }

    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = -7027;
LABEL_12:
    uint64_t v18 = objc_msgSend(v16, "ak_errorWithCode:", v17);
    v10[2](v10, 0, v18);

    goto LABEL_13;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager presentFidoAuthForContext:fidoContext:completion:]();
  }

  [v11 presentFidoAuthForContext:v8 fidoContext:v9 completion:v10];
LABEL_13:
}

- (void)presentProximityBroadcastUIForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:]();
  }

  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:]();
  }

  uint64_t v10 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v6];
  if (!v10)
  {
    if (!v7) {
      goto LABEL_17;
    }
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = -7011;
LABEL_16:
    uint64_t v16 = objc_msgSend(v14, "ak_errorWithCode:", v15);
    v7[2](v7, 0, v16);

    goto LABEL_17;
  }
  char v11 = objc_opt_respondsToSelector();
  char v12 = _AKLogSystem();
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "Asking the client context to present proximity broadcast UI.", v17, 2u);
    }

    [v10 presentProximityBroadcastUIWithCompletion:v7];
    goto LABEL_17;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:]();
  }

  if (v7)
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = -7014;
    goto LABEL_16;
  }
LABEL_17:
}

- (void)presentProximityPairingUIForContext:(id)a3 verificationCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  char v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager presentProximityPairingUIForContext:verificationCode:completion:]();
  }

  char v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager presentProximityPairingUIForContext:verificationCode:completion:]();
  }

  uint64_t v13 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v8];
  if (!v13)
  {
    if (!v10) {
      goto LABEL_17;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = -7011;
LABEL_16:
    uint64_t v19 = objc_msgSend(v17, "ak_errorWithCode:", v18);
    v10[2](v10, 0, v19);

    goto LABEL_17;
  }
  char v14 = objc_opt_respondsToSelector();
  uint64_t v15 = _AKLogSystem();
  uint64_t v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "Asking the client context to present proximity pairing UI.", v20, 2u);
    }

    [v13 presentProximityPairingUIWithVerificationCode:v9 completion:v10];
    goto LABEL_17;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:]();
  }

  if (v10)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = -7014;
    goto LABEL_16;
  }
LABEL_17:
}

- (void)presentProximityPinCodeUIForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager presentProximityPinCodeUIForContext:completion:]();
  }

  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager presentProximityPinCodeUIForContext:completion:]();
  }

  uint64_t v10 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v6];
  if (!v10)
  {
    if (!v7) {
      goto LABEL_17;
    }
    char v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = -7011;
LABEL_16:
    uint64_t v16 = objc_msgSend(v14, "ak_errorWithCode:", v15);
    v7[2](v7, 0, v16);

    goto LABEL_17;
  }
  char v11 = objc_opt_respondsToSelector();
  char v12 = _AKLogSystem();
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "Asking the client context show to proximity PIN Entry UI.", v17, 2u);
    }

    [v10 presentProximityPinCodeUIWithCompletion:v7];
    goto LABEL_17;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:]();
  }

  if (v7)
  {
    char v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = -7014;
    goto LABEL_16;
  }
LABEL_17:
}

- (void)activateProximitySession:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  char v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager activateProximitySession:context:completion:]();
  }

  char v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412802;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_debug_impl(&dword_193494000, v12, OS_LOG_TYPE_DEBUG, "%@: Called to activate proximity session (%@) for context (%@)", (uint8_t *)&v20, 0x20u);
  }

  uint64_t v13 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v9];
  if (!v13)
  {
    if (!v10) {
      goto LABEL_17;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = -7011;
LABEL_16:
    uint64_t v19 = objc_msgSend(v17, "ak_errorWithCode:", v18);
    v10[2](v10, 0, v19);

    goto LABEL_17;
  }
  char v14 = objc_opt_respondsToSelector();
  uint64_t v15 = _AKLogSystem();
  uint64_t v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_193494000, v16, OS_LOG_TYPE_DEFAULT, "Asking the client context to activate proximity session.", (uint8_t *)&v20, 2u);
    }

    [v13 activateProximitySession:v8 completion:v10];
    goto LABEL_17;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:]();
  }

  if (v10)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = -7014;
    goto LABEL_16;
  }
LABEL_17:
}

- (void)dismissProximityPairingUIForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager dismissProximityPairingUIForContext:completion:]();
  }

  id v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager dismissProximityPairingUIForContext:completion:]();
  }

  uint64_t v10 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v6];
  if (!v10)
  {
    if (!v7) {
      goto LABEL_17;
    }
    char v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = -7011;
LABEL_16:
    uint64_t v16 = objc_msgSend(v14, "ak_errorWithCode:", v15);
    v7[2](v7, 0, v16);

    goto LABEL_17;
  }
  char v11 = objc_opt_respondsToSelector();
  char v12 = _AKLogSystem();
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_193494000, v13, OS_LOG_TYPE_DEFAULT, "Asking the client context to dismiss proximity pairing UI.", v17, 2u);
    }

    [v10 dismissProximityPairingUIWithCompletion:v7];
    goto LABEL_17;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:]();
  }

  if (v7)
  {
    char v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = -7014;
    goto LABEL_16;
  }
LABEL_17:
}

- (void)showProximityErrorForContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager showProximityErrorForContext:completion:]();
  }

  id v9 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v7];

  if (!v9)
  {
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = -7011;
LABEL_14:
    uint64_t v15 = objc_msgSend(v13, "ak_errorWithCode:", v14);
    v6[2](v6, 0, v15);

    goto LABEL_15;
  }
  char v10 = objc_opt_respondsToSelector();
  char v11 = _AKLogSystem();
  char v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_193494000, v12, OS_LOG_TYPE_DEFAULT, "Asking the client context to show proximity error UI.", v16, 2u);
    }

    [v9 showProximityErrorWithCompletion:v6];
    goto LABEL_15;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[AKAppleIDAuthenticationContextManager presentProximityBroadcastUIForContext:completion:]();
  }

  if (v6)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = -7014;
    goto LABEL_14;
  }
LABEL_15:
}

- (void)provisionAnisetteForContext:(id)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager provisionAnisetteForContext:withCompletion:]();
  }

  id v9 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v7];

  if (v9)
  {
    char v10 = [v9 anisetteDataProvider];
    char v11 = v10;
    if (v10)
    {
      [v10 provisionAnisetteWithCompletion:v6];
    }
    else
    {
      char v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
      v6[2](v6, 0, v12);
    }
  }
  else
  {
    char v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7011);
    v6[2](v6, 0, v11);
  }
}

- (void)syncAnisetteForContext:(id)a3 withSIMData:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = a3;
  char v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager syncAnisetteForContext:withSIMData:completion:]();
  }

  char v12 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v10];

  if (v12)
  {
    uint64_t v13 = [v12 anisetteDataProvider];
    uint64_t v14 = v13;
    if (v13)
    {
      [v13 syncAnisetteWithSIMData:v8 completion:v9];
    }
    else
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
      v9[2](v9, 0, v15);
    }
  }
  else
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7011);
    v9[2](v9, 0, v14);
  }
}

- (void)eraseAnisetteForContext:(id)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager eraseAnisetteForContext:withCompletion:]();
  }

  id v9 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v7];

  if (v9)
  {
    id v10 = [v9 anisetteDataProvider];
    char v11 = v10;
    if (v10)
    {
      [v10 eraseAnisetteWithCompletion:v6];
    }
    else
    {
      char v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
      v6[2](v6, 0, v12);
    }
  }
  else
  {
    char v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7011);
    v6[2](v6, 0, v11);
  }
}

- (void)fetchAnisetteDataForContext:(id)a3 provisionIfNecessary:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = a3;
  id v10 = _AKLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager fetchAnisetteDataForContext:provisionIfNecessary:withCompletion:]();
  }

  char v11 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v9];

  if (v11)
  {
    char v12 = [v11 anisetteDataProvider];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 fetchAnisetteDataAndProvisionIfNecessary:v5 withCompletion:v8];
    }
    else
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
      v8[2](v8, 0, v14);
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7011);
    v8[2](v8, 0, v13);
  }
}

- (void)legacyAnisetteDataForContext:(id)a3 DSID:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = a3;
  char v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager legacyAnisetteDataForContext:DSID:withCompletion:]();
  }

  char v12 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v10];

  if (v12)
  {
    uint64_t v13 = [v12 anisetteDataProvider];
    uint64_t v14 = v13;
    if (v13)
    {
      [v13 legacyAnisetteDataForDSID:v8 withCompletion:v9];
    }
    else
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
      v9[2](v9, 0, v15);
    }
  }
  else
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7011);
    v9[2](v9, 0, v14);
  }
}

- (void)fetchPeerAttestationDataForContext:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  char v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationContextManager fetchPeerAttestationDataForContext:withRequest:completion:]();
  }

  char v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 138412802;
    __int16 v22 = self;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_debug_impl(&dword_193494000, v12, OS_LOG_TYPE_DEBUG, "%@: Called to fetch peer attestation data for context (%@) with request (%@)", (uint8_t *)&v21, 0x20u);
  }

  uint64_t v13 = [(AKAppleIDAuthenticationContextManager *)self _clientSideContextForServerContext:v8];
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7011);
    v10[2](v10, 0, v15);
    goto LABEL_17;
  }
  uint64_t v15 = [v13 anisetteDataProvider];
  if (!v15)
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7060);
LABEL_16:
    int v20 = (void *)v19;
    v10[2](v10, 0, (void *)v19);

    goto LABEL_17;
  }
  char v16 = objc_opt_respondsToSelector();
  uint64_t v17 = _AKLogSystem();
  uint64_t v18 = v17;
  if ((v16 & 1) == 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412802;
      __int16 v22 = self;
      __int16 v23 = 2112;
      id v24 = v15;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_error_impl(&dword_193494000, v18, OS_LOG_TYPE_ERROR, "%@: Unable to call anisette data provider (%@) to fetch peer attestation data for request (%@) because it does not respond to 'fetchPeerAttestationDataForRequest:completion:'", (uint8_t *)&v21, 0x20u);
    }

    uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AKAnisetteError" code:-8009 userInfo:0];
    goto LABEL_16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412802;
    __int16 v22 = self;
    __int16 v23 = 2112;
    id v24 = v15;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_193494000, v18, OS_LOG_TYPE_DEFAULT, "%@: Calling anisette data provider (%@) to fetch peer attestation data for request (%@)", (uint8_t *)&v21, 0x20u);
  }

  [v15 fetchPeerAttestationDataForRequest:v9 completion:v10];
LABEL_17:
}

- (id)_clientSideContextForServerContext:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 _identifier];

  if (v5)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    int v21 = __Block_byref_object_copy__2;
    __int16 v22 = __Block_byref_object_dispose__2;
    id v23 = 0;
    authContextsQueue = self->_authContextsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__AKAppleIDAuthenticationContextManager__clientSideContextForServerContext___block_invoke;
    block[3] = &unk_1E575F7C8;
    uint64_t v17 = &v18;
    block[4] = self;
    id v7 = v4;
    id v16 = v7;
    dispatch_sync(authContextsQueue, block);
    id v8 = (void *)v19[5];
    if (v8)
    {
      [v8 _updateWithValuesFromContext:v7];
      id v9 = (id)v19[5];
    }
    else
    {
      char v12 = _AKLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [v7 _identifier];
        [(AKAppleIDAuthenticationContextManager *)v13 _clientSideContextForServerContext:v12];
      }

      id v9 = 0;
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(AKAppleIDAuthenticationContextManager *)(uint64_t)v4 _clientSideContextForServerContext:v11];
    }

    id v9 = 0;
  }

  return v9;
}

void __76__AKAppleIDAuthenticationContextManager__clientSideContextForServerContext___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = [*(id *)(a1 + 40) _identifier];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (AKAppleIDAuthenticationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKAppleIDAuthenticationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authContextsQueue, 0);
  objc_destroyWeak((id *)&self->_authController);

  objc_storeStrong((id *)&self->_authContextsByUUID, 0);
}

- (void)registerContext:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_7(&dword_193494000, a3, (uint64_t)a3, "Context ID %@ has already been registered for authentication!", (uint8_t *)a2);
}

- (void)registerContext:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Bad client! You are not supposed to provide your own implementation of AKAppleIDAuthenticationUIProvider!", v2, v3, v4, v5, v6);
}

void __59__AKAppleIDAuthenticationContextManager_unregisterContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Missing context identifier, how did we get here?", v2, v3, v4, v5, v6);
}

- (void)shouldContinueWithAuthenticationResults:(uint64_t)a3 error:forContextID:completion:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_7(&dword_193494000, a2, a3, "Client has no knowledge of context ID: %@", (uint8_t *)&v3);
}

- (void)presentKeepUsingUIForContext:appleID:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "AKAppleIDAuthenticationContextManager failed to presentKeepUsingUIForContext. The client context is missing from the auth context.", v2, v3, v4, v5, v6);
}

- (void)presentKeepUsingUIForContext:appleID:completion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Presenting keep using UI.", v2, v3, v4, v5, v6);
}

- (void)presentKeepUsingUIForContext:appleID:completion:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Client context missing presentKeepUsingUIForAppleID", v2, v3, v4, v5, v6);
}

- (void)presentBasicLoginUIForContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Error: We do not have a UI-capable context on the client side!", v2, v3, v4, v5, v6);
}

- (void)presentSecondFactorUIForContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Error: We do not have a UI-capabable context on the client side!", v2, v3, v4, v5, v6);
}

- (void)presentFidoAuthForContext:fidoContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Error: Context is not configured for a Fido presentation!", v2, v3, v4, v5, v6);
}

- (void)presentFidoAuthForContext:fidoContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_193494000, v0, v1, "Asking the client context to present Fido ui.", v2, v3, v4, v5, v6);
}

- (void)presentFidoAuthForContext:fidoContext:completion:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Error: We do not have a UIProvider. Unable to launch the Fido service!", v2, v3, v4, v5, v6);
}

- (void)presentProximityBroadcastUIForContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_193494000, v0, v1, "Error: We do not have a proximity UI-capable context on the client side!", v2, v3, v4, v5, v6);
}

- (void)presentProximityBroadcastUIForContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v0, v1, "%@: Called to present proximity broadcast UI for context (%@)");
}

- (void)presentProximityBroadcastUIForContext:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)presentProximityPairingUIForContext:verificationCode:completion:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v0, v1, "%@: Called to present proximity pairing UI for context (%@)");
}

- (void)presentProximityPairingUIForContext:verificationCode:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)presentProximityPinCodeUIForContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v0, v1, "%@: Called to present proximity PIN Entry UI for context (%@)");
}

- (void)presentProximityPinCodeUIForContext:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)activateProximitySession:context:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)dismissProximityPairingUIForContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_2(&dword_193494000, v0, v1, "%@: Called to dismiss proximity pairing UI for context (%@)");
}

- (void)dismissProximityPairingUIForContext:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)showProximityErrorForContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)provisionAnisetteForContext:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)syncAnisetteForContext:withSIMData:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)eraseAnisetteForContext:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)fetchAnisetteDataForContext:provisionIfNecessary:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)legacyAnisetteDataForContext:DSID:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)fetchPeerAttestationDataForContext:withRequest:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_193494000, v0, v1, "%s (%d) called", v2, v3, v4, v5, v6);
}

- (void)_clientSideContextForServerContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_7(&dword_193494000, a2, a3, "Server has provided an invalid context lacking an ID: %@", (uint8_t *)&v3);
}

- (void)_clientSideContextForServerContext:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_7(&dword_193494000, a3, (uint64_t)a3, "Client has no knowledge of context ID: %@", (uint8_t *)a2);
}

@end