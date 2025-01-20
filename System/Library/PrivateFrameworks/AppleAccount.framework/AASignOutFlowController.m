@interface AASignOutFlowController
- (AASignOutFlowController)init;
- (AASignOutFlowController)initWithContext:(id)a3;
- (AASignOutFlowControllerDelegate)delegate;
- (void)_delegate_disableFindMyDeviceForAccount:(id)a3 completion:(id)a4;
- (void)_delegate_performWalrusValidationForAccount:(id)a3 completion:(id)a4;
- (void)_delegate_presentError:(id)a3 withTitle:(id)a4;
- (void)_delegate_signOutAccount:(id)a3 completion:(id)a4;
- (void)_disableDeviceLocatorForAccount:(id)a3 completion:(id)a4;
- (void)_performWalrusValidationForAccount:(id)a3 completion:(id)a4;
- (void)_preflightSignOutOfAccount:(id)a3 completion:(id)a4;
- (void)_signOutAppleAccount:(id)a3 completion:(id)a4;
- (void)sendTelemetryEventSignoutFinish:(id)a3 account:(id)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)sendTelemetryEventSignoutStart:(id)a3;
- (void)setDelegate:(id)a3;
- (void)signOutAppleAccount:(id)a3 completion:(id)a4;
@end

@implementation AASignOutFlowController

- (AASignOutFlowController)init
{
  return [(AASignOutFlowController *)self initWithContext:0];
}

- (AASignOutFlowController)initWithContext:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AASignOutFlowController;
  v5 = [(AASignOutFlowController *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F179C8] defaultStore];
    accountStore = v5->_accountStore;
    v5->_accountStore = (ACAccountStore *)v6;

    if (v4)
    {
      v8 = [v4 authenticationResults];
      uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4EE00]];
      p_telemetryFlowID = (void **)&v5->telemetryFlowID;
      telemetryFlowID = v5->telemetryFlowID;
      v5->telemetryFlowID = (NSString *)v9;

      if (!v5->telemetryFlowID)
      {
        v12 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v13 = [v12 UUIDString];
        v14 = *p_telemetryFlowID;
        *p_telemetryFlowID = (void *)v13;

        v15 = _AALogSystem();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[AASignOutFlowController initWithContext:]((uint64_t *)&v5->telemetryFlowID, v15);
        }
      }
    }
  }

  return v5;
}

- (void)signOutAppleAccount:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v7 = (char *)a3;
  id v8 = a4;
  if (!v7)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"AASignOutFlowController.m", 50, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];
  }
  uint64_t v9 = [v7 accountType];
  v10 = [v9 identifier];
  char v11 = [v10 isEqualToString:*MEMORY[0x1E4F17750]];

  if (v11)
  {
    v12 = _os_activity_create(&dword_1A11D8000, "appleaccount/signOutAppleAccount", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v12, &state);
    uint64_t v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v7;
      _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Will begin sign out of account: %@", buf, 0xCu);
    }

    v14 = _AASignpostLogSystem();
    v15 = (char *)_AASignpostCreate(v14);
    objc_super v17 = v16;

    v18 = _AASignpostLogSystem();
    v19 = v18;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A11D8000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "SignOutAppleAccount", " enableTelemetry=YES ", buf, 2u);
    }

    v20 = _AASignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = v15;
      _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignOutAppleAccount  enableTelemetry=YES ", buf, 0xCu);
    }

    [(AASignOutFlowController *)self sendTelemetryEventSignoutStart:v7];
    objc_initWeak((id *)buf, self);
    v21 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke;
    block[3] = &unk_1E5A492A8;
    objc_copyWeak(v28, (id *)buf);
    v25 = v7;
    v26 = self;
    v28[1] = v15;
    v28[2] = v17;
    id v27 = v8;
    dispatch_async(v21, block);

    objc_destroyWeak(v28);
    objc_destroyWeak((id *)buf);
    os_activity_scope_leave(&state);
  }
  else
  {
    v22 = _AALogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "Attempting to sign out non-AppleAccount, bailing!", (uint8_t *)&state, 2u);
    }

    v12 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4404);
    (*((void (**)(id, void, NSObject *))v8 + 2))(v8, 0, v12);
  }
}

void __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E4F46FC8];
    id v4 = objc_msgSend(*(id *)(a1 + 32), "aida_alternateDSID");
    v5 = [v3 analyticsEventWithName:@"com.apple.appleaccount.signOutFinish" altDSID:v4 flowID:*(void *)(*(void *)(a1 + 40) + 16)];

    uint64_t v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_2;
    v11[3] = &unk_1E5A49280;
    v11[4] = WeakRetained;
    id v7 = v6;
    long long v16 = *(_OWORD *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(a1 + 48);
    id v12 = v7;
    uint64_t v13 = v8;
    id v14 = v5;
    id v15 = v9;
    v10 = v5;
    [WeakRetained _preflightSignOutOfAccount:v7 completion:v11];
  }
  else
  {
    v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_cold_1(v10);
    }
  }
}

void __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v33 = v7;
    __int16 v34 = 2112;
    double v35 = *(double *)&v5;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Sign out preflight completed with success: %@ and error: %@", buf, 0x16u);
  }

  if (a2)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_41;
    v25[3] = &unk_1E5A49280;
    id v26 = v8;
    long long v31 = *(_OWORD *)(a1 + 72);
    id v10 = v5;
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = *(void **)(a1 + 56);
    id v27 = v10;
    uint64_t v28 = v11;
    id v29 = v12;
    id v30 = *(id *)(a1 + 64);
    [v9 _signOutAppleAccount:v26 completion:v25];
  }
  else
  {
    uint64_t v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_2_cold_1();
    }

    unint64_t Nanoseconds = _AASignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
    id v15 = _AASignpostLogSystem();
    long long v16 = v15;
    os_signpost_id_t v17 = *(void *)(a1 + 72);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v18 = [v5 code];
      *(_DWORD *)buf = 67240192;
      LODWORD(v33) = v18;
      _os_signpost_emit_with_name_impl(&dword_1A11D8000, v16, OS_SIGNPOST_INTERVAL_END, v17, "SignOutAppleAccount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 8u);
    }

    v19 = _AASignpostLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = (double)Nanoseconds / 1000000000.0;
      v21 = *(__CFString **)(a1 + 72);
      int v22 = [v5 code];
      *(_DWORD *)buf = 134218496;
      v33 = v21;
      __int16 v34 = 2048;
      double v35 = v20;
      __int16 v36 = 1026;
      int v37 = v22;
      _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignOutAppleAccount  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x1Cu);
    }

    [*(id *)(a1 + 48) sendTelemetryEventSignoutFinish:*(void *)(a1 + 56) account:*(void *)(a1 + 40) didSucceed:0 error:v5];
    uint64_t v23 = *(void *)(a1 + 64);
    if (v23)
    {
      if (v5)
      {
        (*(void (**)(uint64_t, void, id))(v23 + 16))(v23, 0, v5);
      }
      else
      {
        v24 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", 0);
        (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);
      }
    }
  }
}

void __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_41(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = @"NO";
    int v19 = 138412802;
    if (a2) {
      uint64_t v8 = @"YES";
    }
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    double v22 = *(double *)&v8;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Sign out of account (%@) completed with success: %@ and error: %@", (uint8_t *)&v19, 0x20u);
  }

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
  id v10 = _AASignpostLogSystem();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v13 = [*(id *)(a1 + 40) code];
    int v19 = 67240192;
    LODWORD(v20) = v13;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SignOutAppleAccount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 8u);
  }

  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = (double)Nanoseconds / 1000000000.0;
    uint64_t v16 = *(void *)(a1 + 72);
    int v17 = [*(id *)(a1 + 40) code];
    int v19 = 134218496;
    uint64_t v20 = v16;
    __int16 v21 = 2048;
    double v22 = v15;
    __int16 v23 = 1026;
    LODWORD(v24) = v17;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignOutAppleAccount  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v19, 0x1Cu);
  }

  [*(id *)(a1 + 48) sendTelemetryEventSignoutFinish:*(void *)(a1 + 56) account:*(void *)(a1 + 32) didSucceed:a2 error:v5];
  uint64_t v18 = *(void *)(a1 + 64);
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, id))(v18 + 16))(v18, a2, v5);
  }
}

- (void)_preflightSignOutOfAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  if (+[AADeviceInfo hasiCloudSignOutRestriction]
    || objc_msgSend(v6, "aa_isRemotelyManaged"))
  {
    uint64_t v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AASignOutFlowController _preflightSignOutOfAccount:completion:](v6, v8);
    }

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4406);
    v7[2](v7, 0, v9);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__AASignOutFlowController__preflightSignOutOfAccount_completion___block_invoke;
    v10[3] = &unk_1E5A48510;
    v10[4] = self;
    id v11 = v6;
    os_signpost_id_t v12 = v7;
    [(AASignOutFlowController *)self _performWalrusValidationForAccount:v11 completion:v10];
  }
}

void __65__AASignOutFlowController__preflightSignOutOfAccount_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = _AASignpostLogSystem();
    os_signpost_id_t v4 = _AASignpostCreate(v3);
    uint64_t v6 = v5;

    uint64_t v7 = _AASignpostLogSystem();
    uint64_t v8 = v7;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A11D8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v4, "DisableFindMyDevice", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v9 = _AASignpostLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v18 = v4;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: DisableFindMyDevice  enableTelemetry=YES ", buf, 0xCu);
    }

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__AASignOutFlowController__preflightSignOutOfAccount_completion___block_invoke_45;
    v13[3] = &unk_1E5A492D0;
    os_signpost_id_t v15 = v4;
    uint64_t v16 = v6;
    id v14 = *(id *)(a1 + 48);
    [v10 _disableDeviceLocatorForAccount:v11 completion:v13];
  }
  else
  {
    os_signpost_id_t v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v12();
  }
}

void __65__AASignOutFlowController__preflightSignOutOfAccount_completion___block_invoke_45(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v6 = _AASignpostLogSystem();
  uint64_t v7 = v6;
  os_signpost_id_t v8 = a1[5];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v13 = 67240192;
    LODWORD(v14) = [v4 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v7, OS_SIGNPOST_INTERVAL_END, v8, "DisableFindMyDevice", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v13, 8u);
  }

  uint64_t v9 = _AASignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = (double)Nanoseconds / 1000000000.0;
    uint64_t v11 = a1[5];
    int v12 = [v4 code];
    int v13 = 134218496;
    uint64_t v14 = v11;
    __int16 v15 = 2048;
    double v16 = v10;
    __int16 v17 = 1026;
    int v18 = v12;
    _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: DisableFindMyDevice  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v13, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)_performWalrusValidationForAccount:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  os_signpost_id_t v8 = [v6 accountType];
  uint64_t v9 = [v8 identifier];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F17750]];

  char v11 = objc_msgSend(v6, "aa_isAccountClass:", @"primary");
  if (v10 && (v11 & 1) != 0)
  {
    [(AASignOutFlowController *)self _delegate_performWalrusValidationForAccount:v6 completion:v7];
  }
  else
  {
    int v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Walrus validation is not necessary for non-primary/non-apple account: %@", (uint8_t *)&v13, 0xCu);
    }

    v7[2](v7, 1, 0);
  }
}

- (void)_signOutAppleAccount:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  os_signpost_id_t v8 = _AASignpostLogSystem();
  os_signpost_id_t v9 = _AASignpostCreate(v8);
  uint64_t v11 = v10;

  int v12 = _AASignpostLogSystem();
  int v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SignOutAppleAccountDelegate", " enableTelemetry=YES ", buf, 2u);
  }

  id v14 = _AASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v21 = v9;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignOutAppleAccountDelegate  enableTelemetry=YES ", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__AASignOutFlowController__signOutAppleAccount_completion___block_invoke;
  v16[3] = &unk_1E5A492D0;
  os_signpost_id_t v18 = v9;
  uint64_t v19 = v11;
  id v17 = v6;
  id v15 = v6;
  [(AASignOutFlowController *)self _delegate_signOutAccount:v7 completion:v16];
}

void __59__AASignOutFlowController__signOutAppleAccount_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t Nanoseconds = _AASignpostGetNanoseconds(a1[5], a1[6]);
  id v6 = _AASignpostLogSystem();
  id v7 = v6;
  os_signpost_id_t v8 = a1[5];
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v13 = 67240192;
    LODWORD(v14) = [v4 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SignOutAppleAccountDelegate", " Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v13, 8u);
  }

  os_signpost_id_t v9 = _AASignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = (double)Nanoseconds / 1000000000.0;
    uint64_t v11 = a1[5];
    int v12 = [v4 code];
    int v13 = 134218496;
    uint64_t v14 = v11;
    __int16 v15 = 2048;
    double v16 = v10;
    __int16 v17 = 1026;
    int v18 = v12;
    _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignOutAppleAccountDelegate  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v13, 0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)_disableDeviceLocatorForAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  os_signpost_id_t v8 = [v6 accountType];
  os_signpost_id_t v9 = [v8 identifier];
  char v10 = [v9 isEqualToString:*MEMORY[0x1E4F17750]];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      int v12 = "Attempting to sign out non-AppleAccount, all clear!";
      int v13 = (uint8_t *)&v15;
LABEL_8:
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
LABEL_9:

    v7[2](v7, 1, 0);
    goto LABEL_10;
  }
  if ((objc_msgSend(v6, "aa_isAccountClass:", @"primary") & 1) == 0)
  {
    uint64_t v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      int v12 = "Attempting to sign out secondary account, all clear!";
      int v13 = (uint8_t *)&v14;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [(AASignOutFlowController *)self _delegate_disableFindMyDeviceForAccount:v6 completion:v7];
LABEL_10:
}

- (void)_delegate_presentError:(id)a3 withTitle:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = [v6 userInfo];
  os_signpost_id_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

  char v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    _os_log_error_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_ERROR, "AASignOutFlowController: Will show alert for error: %@, title: %@, message: %@", buf, 0x20u);
  }

  uint64_t v11 = [(AASignOutFlowController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__AASignOutFlowController__delegate_presentError_withTitle___block_invoke;
    block[3] = &unk_1E5A48720;
    void block[4] = self;
    id v15 = v7;
    id v16 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    int v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AASignOutFlowController _delegate_presentError:withTitle:](self);
    }
  }
}

void __60__AASignOutFlowController__delegate_presentError_withTitle___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 signOutFlowController:*(void *)(a1 + 32) showAlertWithTitle:*(void *)(a1 + 40) message:*(void *)(a1 + 48) completion:&__block_literal_global_13];
}

void __60__AASignOutFlowController__delegate_presentError_withTitle___block_invoke_2(uint64_t a1, char a2)
{
  v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__AASignOutFlowController__delegate_presentError_withTitle___block_invoke_2_cold_1(a2, v3);
  }
}

- (void)_delegate_disableFindMyDeviceForAccount:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = [(AASignOutFlowController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  char v10 = _AALogSystem();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Calling delegate to disable find my device for account: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__AASignOutFlowController__delegate_disableFindMyDeviceForAccount_completion___block_invoke;
    block[3] = &unk_1E5A484C0;
    void block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AASignOutFlowController _delegate_disableFindMyDeviceForAccount:completion:](self);
    }

    char v12 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4405);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __78__AASignOutFlowController__delegate_disableFindMyDeviceForAccount_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__AASignOutFlowController__delegate_disableFindMyDeviceForAccount_completion___block_invoke_2;
  v5[3] = &unk_1E5A48DE8;
  id v6 = *(id *)(a1 + 48);
  [v2 signOutFlowController:v3 disableFindMyDeviceForAccount:v4 completion:v5];
}

void __78__AASignOutFlowController__delegate_disableFindMyDeviceForAccount_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v8 = 138412546;
    char v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Delegate disabled find my device with success %@ and error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_delegate_signOutAccount:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(AASignOutFlowController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  __int16 v10 = _AALogSystem();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Calling delegate to sign out account: %@", buf, 0xCu);
    }

    uint64_t v12 = [(AASignOutFlowController *)self delegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__AASignOutFlowController__delegate_signOutAccount_completion___block_invoke;
    v14[3] = &unk_1E5A48DE8;
    id v15 = v7;
    [v12 signOutFlowController:self signOutAccount:v6 completion:v14];

    int v13 = v15;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AASignOutFlowController _delegate_signOutAccount:completion:](self);
    }

    int v13 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4405);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

void __63__AASignOutFlowController__delegate_signOutAccount_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v8 = 138412546;
    char v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Delegate signOutAccount completed with success %@ and error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_delegate_performWalrusValidationForAccount:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(AASignOutFlowController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  __int16 v10 = _AALogSystem();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Calling delegate to perform walrus validation for account: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__AASignOutFlowController__delegate_performWalrusValidationForAccount_completion___block_invoke;
    block[3] = &unk_1E5A484C0;
    void block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AASignOutFlowController _delegate_performWalrusValidationForAccount:completion:](self);
    }

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -4405);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __82__AASignOutFlowController__delegate_performWalrusValidationForAccount_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__AASignOutFlowController__delegate_performWalrusValidationForAccount_completion___block_invoke_2;
  v5[3] = &unk_1E5A48DE8;
  id v6 = *(id *)(a1 + 48);
  [v2 signOutFlowController:v3 performWalrusValidationForAccount:v4 completion:v5];
}

void __82__AASignOutFlowController__delegate_performWalrusValidationForAccount_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v8 = 138412546;
    char v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "AASignOutFlowController: Delegate 'performWalrusValidationForAccount:completion' completed with success %@ and error %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendTelemetryEventSignoutStart:(id)a3
{
  id v4 = a3;
  id v5 = [(AASignOutFlowController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AASignOutFlowController *)self delegate];
    [v7 setTelemetryFlowID:self->telemetryFlowID];
  }
  else
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AASignOutFlowController sendTelemetryEventSignoutStart:](v7);
    }
  }

  int v8 = +[AAAnalyticsRTCReporter reporter];
  char v9 = (void *)MEMORY[0x1E4F46FC8];
  __int16 v10 = objc_msgSend(v4, "aida_alternateDSID");

  id v11 = [v9 analyticsEventWithName:@"com.apple.appleaccount.signOutStart" altDSID:v10 flowID:self->telemetryFlowID];
  [v8 sendEvent:v11];
}

- (void)sendTelemetryEventSignoutFinish:(id)a3 account:(id)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  int v8 = NSNumber;
  id v9 = a6;
  id v10 = a3;
  id v11 = [v8 numberWithBool:v6];
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F47028]];

  [v10 populateUnderlyingErrorsStartingWithRootError:v9];
  id v12 = +[AAAnalyticsRTCReporter reporter];
  [v12 sendEvent:v10];
}

- (AASignOutFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AASignOutFlowControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->telemetryFlowID, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)initWithContext:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "Received nil telemetryFlowID from AIDAServiceContext, generated new telemetryFlowID %@", (uint8_t *)&v3, 0xCu);
}

void __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A11D8000, log, OS_LOG_TYPE_FAULT, "AASignOutFlowController unexpectedly deallocated during signout", v1, 2u);
}

void __58__AASignOutFlowController_signOutAppleAccount_completion___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1A11D8000, v0, OS_LOG_TYPE_ERROR, "AASignOutFlowController: Sign out preflight failed with error: %@", v1, 0xCu);
}

- (void)_preflightSignOutOfAccount:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (+[AADeviceInfo hasiCloudSignOutRestriction]) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  if (objc_msgSend(a1, "aa_isRemotelyManaged")) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "AASignOutFlowController: Sign out preflight failed - the device has sign out restriction(%@) or account is remotely managed(%@)", (uint8_t *)&v6, 0x16u);
}

- (void)_delegate_presentError:(void *)a1 withTitle:.cold.1(void *a1)
{
  v1 = [a1 delegate];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1A11D8000, v2, v3, "AASignOutFlowController: Delegate (%@) does not respond to selector showAlertWithTitle:message:", v4, v5, v6, v7, v8);
}

void __60__AASignOutFlowController__delegate_presentError_withTitle___block_invoke_2_cold_1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = @"NO";
  if (a1) {
    uint64_t v2 = @"YES";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "AASignOutFlowController: didShowAlert: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_delegate_disableFindMyDeviceForAccount:(void *)a1 completion:.cold.1(void *a1)
{
  v1 = [a1 delegate];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1A11D8000, v2, v3, "AASignOutFlowController: Delegate (%@) does not respond to selector disableFindMyDeviceForAccount.", v4, v5, v6, v7, v8);
}

- (void)_delegate_signOutAccount:(void *)a1 completion:.cold.1(void *a1)
{
  v1 = [a1 delegate];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1A11D8000, v2, v3, "AASignOutFlowController: Delegate (%@) does not respond to selector signOutAccount", v4, v5, v6, v7, v8);
}

- (void)_delegate_performWalrusValidationForAccount:(void *)a1 completion:.cold.1(void *a1)
{
  v1 = [a1 delegate];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1A11D8000, v2, v3, "AASignOutFlowController: Delegate (%@) does not respond to selector 'performWalrusValidationForAccount:completion'", v4, v5, v6, v7, v8);
}

- (void)sendTelemetryEventSignoutStart:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "AASignOutFlowController's delegate does not respond to selector: telemetryFlowID", v1, 2u);
}

@end