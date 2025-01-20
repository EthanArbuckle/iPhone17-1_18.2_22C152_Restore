@interface AASignInFlowController
- (AASignInFlowController)init;
- (AASignInFlowController)initWithAccountStore:(id)a3;
- (AASignInFlowControllerDelegate)delegate;
- (BOOL)_delegateRequiresTerms;
- (BOOL)_delegateWantsToBackgroundDataclassEnablement;
- (BOOL)_delegateWantsToSkipDataclassEnablement;
- (BOOL)_isDuplicateAccountError:(int64_t)a3;
- (BOOL)_newSignInReauth;
- (BOOL)_shouldEnableDataclassesForAccount:(id)a3;
- (BOOL)_shouldStashLoginResponse;
- (BOOL)existingAccount;
- (BOOL)ignoreLockAssertErrors;
- (BOOL)shouldAutomaticallySaveSignInResults;
- (CDPStateUIProvider)cdpUIProvider;
- (CUMessageSession)messageSession;
- (NSMutableDictionary)telemetryTimeSeries;
- (id)_aaErrorForErrorCode:(int64_t)a3;
- (id)_aaErrorForErrorCode:(int64_t)a3 withUnderlyingError:(id)a4;
- (id)_aaMessageForErrorCode:(int64_t)a3;
- (id)_nameForCloudService;
- (id)_onqueue_createCDPContextWithAuthResults:(id)a3;
- (id)_onqueue_createNewAppleAccountWithAuthResults:(id)a3 accountCreationError:(id *)a4;
- (id)_onqueue_updateOrCreateAppleAccountForAuthResults:(id)a3 accountCreationError:(id *)a4;
- (id)_titleForSignInFailureAlert;
- (id)_titleForVerificationFailureAlert;
- (id)_userPersonaUniqueString;
- (unint64_t)_findMyActivationAction;
- (void)_addKeysAndEnrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5;
- (void)_backgroundSaveAccount:(id)a3 withDataclassEnablement:(BOOL)a4 completion:(id)a5;
- (void)_cacheLoginResponse:(id)a3 forAccount:(id)a4 completion:(id)a5;
- (void)_delegate_presentAccountCreationError:(id)a3 completion:(id)a4;
- (void)_delegate_presentGenericTermsUIforAccount:(id)a3 authResults:(id)a4 serverError:(id)a5 completion:(id)a6;
- (void)_delegate_presentProgressViewForAccount:(id)a3 completion:(id)a4;
- (void)_delegate_presentValidationAlertForError:(id)a3 forAccount:(id)a4 completion:(id)a5;
- (void)_enableFindMyIfPossibleWithAccount:(id)a3 completion:(id)a4;
- (void)_enrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5;
- (void)_loginAndUpdateiCloudWithAuthResults:(id)a3 iCloudAccount:(id)a4 withCompletion:(id)a5;
- (void)_onqueue_addKeysAndEnrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5;
- (void)_onqueue_delegate_enableFindMyWithCompletion:(id)a3;
- (void)_onqueue_delegate_saveAccount:(id)a3 withDataclassEnablement:(BOOL)a4 completion:(id)a5;
- (void)_onqueue_enableFindMyIfPossibleWithAccount:(id)a3 completion:(id)a4;
- (void)_onqueue_enrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5;
- (void)_onqueue_legacyRegisterAndVerifyLoginForiCloudAccount:(id)a3 authResults:(id)a4 withCompletion:(id)a5;
- (void)_onqueue_prepareExistingAppleAccountForSignIn:(id)a3 withAuthResults:(id)a4 accountCreationError:(id *)a5;
- (void)_onqueue_registerAndVerifyLoginForiCloudAccount:(id)a3 authResults:(id)a4 withCompletion:(id)a5;
- (void)_onqueue_saveAccount:(id)a3 withAuthResults:(id)a4 withCDPEnablement:(BOOL)a5 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a6;
- (void)_onqueue_saveAccount:(id)a3 withDataclassEnablement:(BOOL)a4 completion:(id)a5;
- (void)_onqueue_saveTermsWithAuthResults:(id)a3 account:(id)a4;
- (void)_onqueue_signInWithIDMSAuthenticationResults:(id)a3 completion:(id)a4;
- (void)_onqueue_updateAppleAccount:(id)a3 withAuthenticationResults:(id)a4;
- (void)_onqueue_updateAppleAccountIfNecessary:(id)a3 withAltDSID:(id)a4 rawPassword:(id)a5;
- (void)_onqueue_validateAndEnrollCDPStateForAccount:(id)a3 withAuthResults:(id)a4 completion:(id)a5;
- (void)_onqueue_verifyLoginResponseForiCloudAccount:(id)a3 withAuthResults:(id)a4 withSuccess:(BOOL)a5 error:(id)a6 completion:(id)a7;
- (void)_preflightSaveWithAuthResults:(id)a3 account:(id)a4 withCompletion:(id)a5;
- (void)_registerAndVerifyLoginForiCloudAccount:(id)a3 authResults:(id)a4 withCompletion:(id)a5;
- (void)_saveAccount:(id)a3 withAuthResults:(id)a4 withCDPEnablement:(BOOL)a5 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a6;
- (void)_stashLoginResponseWithAuthenticationResults:(id)a3 appleAccount:(id)a4;
- (void)_userPersonaUniqueString;
- (void)_validateAndEnrollCDPStateForAccount:(id)a3 withAuthResults:(id)a4 completion:(id)a5;
- (void)_verifyLoginResponseForiCloudAccount:(id)a3 withAuthResults:(id)a4 withSuccess:(BOOL)a5 error:(id)a6 completion:(id)a7;
- (void)prewarmOperationsWithCompletion:(id)a3;
- (void)setCdpUIProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExistingAccount:(BOOL)a3;
- (void)setIgnoreLockAssertErrors:(BOOL)a3;
- (void)setMessageSession:(id)a3;
- (void)setShouldAutomaticallySaveSignInResults:(BOOL)a3;
- (void)setTelemetryTimeSeries:(id)a3;
- (void)signInWithIDMSAuthenticationResults:(id)a3 completion:(id)a4;
@end

@implementation AASignInFlowController

- (AASignInFlowController)init
{
  v3 = objc_opt_new();
  v4 = [(AASignInFlowController *)self initWithAccountStore:v3];

  return v4;
}

- (AASignInFlowController)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AASignInFlowController;
  v6 = [(AASignInFlowController *)&v14 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.AppleAccount.sign-in-flow-controller-ui", v7);
    uiQueue = v6->_uiQueue;
    v6->_uiQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.AppleAccount.sign-in-flow-controller-utility", v8);
    utilityQueue = v6->_utilityQueue;
    v6->_utilityQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_accountStore, a3);
  }

  return v6;
}

- (void)signInWithIDMSAuthenticationResults:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A11D8000, "appleaccount/signin-with-IDMSauthresults", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (!v7)
  {
    dispatch_queue_t v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[AASignInFlowController signInWithIDMSAuthenticationResults:completion:]();
    }
  }
  uiQueue = self->_uiQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__AASignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke;
  block[3] = &unk_1E5A484C0;
  block[4] = self;
  id v16 = v6;
  id v17 = v7;
  dispatch_queue_t v11 = uiQueue;
  id v12 = v7;
  id v13 = v6;
  dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v11, v14);

  os_activity_scope_leave(&state);
}

uint64_t __73__AASignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_signInWithIDMSAuthenticationResults:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_registerAndVerifyLoginForiCloudAccount:(id)a3 authResults:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uiQueue = self->_uiQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__AASignInFlowController__registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke;
  v17[3] = &unk_1E5A4A580;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = uiQueue;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v17);
  dispatch_async(v12, v16);
}

uint64_t __93__AASignInFlowController__registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_registerAndVerifyLoginForiCloudAccount:authResults:withCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_verifyLoginResponseForiCloudAccount:(id)a3 withAuthResults:(id)a4 withSuccess:(BOOL)a5 error:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uiQueue = self->_uiQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __108__AASignInFlowController__verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke;
  v23[3] = &unk_1E5A4A5A8;
  v23[4] = self;
  id v24 = v12;
  BOOL v28 = a5;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v17 = uiQueue;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v23);
  dispatch_async(v17, v22);
}

uint64_t __108__AASignInFlowController__verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_verifyLoginResponseForiCloudAccount:withAuthResults:withSuccess:error:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

- (void)_validateAndEnrollCDPStateForAccount:(id)a3 withAuthResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uiQueue = self->_uiQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__AASignInFlowController__validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke;
  v17[3] = &unk_1E5A4A580;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = uiQueue;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v17);
  dispatch_async(v12, v16);
}

uint64_t __90__AASignInFlowController__validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_validateAndEnrollCDPStateForAccount:withAuthResults:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_addKeysAndEnrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uiQueue = self->_uiQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__AASignInFlowController__addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke;
  v17[3] = &unk_1E5A4A580;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = uiQueue;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v17);
  dispatch_async(v12, v16);
}

uint64_t __88__AASignInFlowController__addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_addKeysAndEnrollCDPStateForAccount:withCDPContext:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_enrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uiQueue = self->_uiQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__AASignInFlowController__enrollCDPStateForAccount_withCDPContext_completion___block_invoke;
  v17[3] = &unk_1E5A4A580;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = uiQueue;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v17);
  dispatch_async(v12, v16);
}

uint64_t __78__AASignInFlowController__enrollCDPStateForAccount_withCDPContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_enrollCDPStateForAccount:withCDPContext:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_onqueue_signInWithIDMSAuthenticationResults:(id)a3 completion:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke;
  v63[3] = &unk_1E5A4A5D0;
  id v49 = v8;
  id v64 = v49;
  id v9 = (void *)MEMORY[0x1A622F430](v63);
  objc_storeStrong((id *)&self->_authResults, a3);
  id v10 = _AASignpostLogSystem();
  os_signpost_id_t v11 = _AASignpostCreate(v10);
  uint64_t v13 = v12;

  id v14 = _AASignpostLogSystem();
  id v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "GetLocalAppleAccount", " enableTelemetry=YES ", buf, 2u);
  }

  dispatch_block_t v16 = _AASignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v66 = v11;
    _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GetLocalAppleAccount  enableTelemetry=YES ", buf, 0xCu);
  }

  id v62 = 0;
  v48 = [(AASignInFlowController *)self _onqueue_updateOrCreateAppleAccountForAuthResults:v7 accountCreationError:&v62];
  id v17 = v62;
  id v18 = v17;
  if (v17)
  {
    id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "code"));
  }
  else
  {
    id v19 = 0;
  }
  id v20 = [(AASignInFlowController *)self telemetryTimeSeries];
  id v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "GetLocalAppleAccount", "errorCode");
  [v20 setObject:v19 forKeyedSubscript:v21];

  if (v18) {
  dispatch_block_t v22 = [v18 domain];
  }
  v23 = [(AASignInFlowController *)self telemetryTimeSeries];
  id v24 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "GetLocalAppleAccount", "errorDomain");
  [v23 setObject:v22 forKeyedSubscript:v24];

  double Nanoseconds = (double)_AASignpostGetNanoseconds(v11, v13);
  id v26 = _AASignpostLogSystem();
  id v27 = v26;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    int v28 = [v18 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v66) = v28;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v27, OS_SIGNPOST_INTERVAL_END, v11, "GetLocalAppleAccount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 8u);
  }
  double v29 = Nanoseconds / 1000000000.0;

  v30 = _AASignpostLogSystem();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = [v18 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v66 = v11;
    __int16 v67 = 2048;
    double v68 = v29;
    __int16 v69 = 1026;
    int v70 = v31;
    _os_log_impl(&dword_1A11D8000, v30, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:GetLocalAppleAccount  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x1Cu);
  }

  v32 = [(AASignInFlowController *)self telemetryTimeSeries];
  v33 = [NSNumber numberWithDouble:v29];
  [v32 setObject:v33 forKeyedSubscript:@"GetLocalAppleAccount"];

  if (v18)
  {
    [(AASignInFlowController *)self _delegate_presentAccountCreationError:v18 completion:v9];
  }
  else
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_37;
    v58[3] = &unk_1E5A4A620;
    id v61 = v9;
    v58[4] = self;
    id v34 = v7;
    id v59 = v34;
    id v35 = v48;
    id v60 = v35;
    v36 = (void *)MEMORY[0x1A622F430](v58);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_45;
    v54[3] = &unk_1E5A4A580;
    v54[4] = self;
    id v37 = v35;
    id v55 = v37;
    id v56 = v34;
    id v57 = v36;
    id v47 = v36;
    v38 = (void *)MEMORY[0x1A622F430](v54);
    v39 = _AASignpostLogSystem();
    os_signpost_id_t v40 = _AASignpostCreate(v39);
    uint64_t v42 = v41;

    v43 = _AASignpostLogSystem();
    v44 = v43;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A11D8000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v40, "SignInPresentProgressView", " enableTelemetry=YES ", buf, 2u);
    }

    v45 = _AASignpostLogSystem();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v66 = v40;
      _os_log_impl(&dword_1A11D8000, v45, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInPresentProgressView  enableTelemetry=YES ", buf, 0xCu);
    }

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_46;
    v50[3] = &unk_1E5A4A648;
    os_signpost_id_t v52 = v40;
    uint64_t v53 = v42;
    v50[4] = self;
    id v51 = v38;
    id v46 = v38;
    [(AASignInFlowController *)self _delegate_presentProgressViewForAccount:v37 completion:v50];
  }
}

uint64_t __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_37(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    [*(id *)(a1 + 32) _stashLoginResponseWithAuthenticationResults:*(void *)(a1 + 40) appleAccount:*(void *)(a1 + 48)];
    id v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Successfully authenticated account, attempting to enable FindMy if possible...", buf, 2u);
    }

    id v10 = _AASignpostLogSystem();
    os_signpost_id_t v11 = _AASignpostCreate(v10);
    uint64_t v13 = v12;

    id v14 = _AASignpostLogSystem();
    id v15 = v14;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A11D8000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SignInEnableFindMy", " enableTelemetry=YES ", buf, 2u);
    }

    dispatch_block_t v16 = _AASignpostLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v27 = v11;
      _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInEnableFindMy  enableTelemetry=YES ", buf, 0xCu);
    }

    id v17 = *(void **)(a1 + 32);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_38;
    v19[3] = &unk_1E5A4A5F8;
    v19[4] = v17;
    os_signpost_id_t v23 = v11;
    uint64_t v24 = v13;
    uint64_t v18 = *(void *)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    char v25 = a2;
    id v20 = v7;
    id v21 = v8;
    [v17 _enableFindMyIfPossibleWithAccount:v18 completion:v19];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_38(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = [NSNumber numberWithBool:a2];
  id v5 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInEnableFindMy", "didEnable");
  [v5 setObject:v4 forKeyedSubscript:v6];

  double Nanoseconds = (double)_AASignpostGetNanoseconds(*(void *)(a1 + 64), *(void *)(a1 + 72));
  id v8 = _AASignpostLogSystem();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v18) = v2;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SignInEnableFindMy", " DidEnable=%{public,signpost.telemetry:number1,name=DidEnable}d ", buf, 8u);
  }
  double v11 = Nanoseconds / 1000000000.0;

  uint64_t v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134218496;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v11;
    __int16 v21 = 1026;
    int v22 = v2;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInEnableFindMy  DidEnable=%{public,signpost.telemetry:number1,name=DidEnable}d ", buf, 0x1Cu);
  }

  id v14 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v15 = [NSNumber numberWithDouble:v11];
  [v14 setObject:v15 forKeyedSubscript:@"SignInEnableFindMy"];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_45(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _termsAreRequired];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  if (v2)
  {
    return objc_msgSend(v3, "_delegate_presentGenericTermsUIforAccount:authResults:serverError:completion:", v4, v5, 0, v6);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    return objc_msgSend(v3, "_registerAndVerifyLoginForiCloudAccount:authResults:withCompletion:", v4, v5, v8, v6);
  }
}

uint64_t __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_46(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSNumber numberWithBool:a2];
  uint64_t v5 = [*(id *)(a1 + 32) telemetryTimeSeries];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInPresentProgressView", "didPresent");
  [v5 setObject:v4 forKeyedSubscript:v6];

  double Nanoseconds = (double)_AASignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v8 = _AASignpostLogSystem();
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v19) = v2;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SignInPresentProgressView", " DidPresent=%{public,signpost.telemetry:number1,name=DidPresent}d ", buf, 8u);
  }
  double v11 = Nanoseconds / 1000000000.0;

  uint64_t v12 = _AASignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218496;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    double v21 = v11;
    __int16 v22 = 1026;
    int v23 = v2;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInPresentProgressView  DidPresent=%{public,signpost.telemetry:number1,name=DidPresent}d ", buf, 0x1Cu);
  }

  id v14 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v15 = [NSNumber numberWithDouble:v11];
  [v14 setObject:v15 forKeyedSubscript:@"SignInPresentProgressView"];

  dispatch_block_t v16 = _AALogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_46_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_onqueue_updateOrCreateAppleAccountForAuthResults:(id)a3 accountCreationError:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4EDA8]];
  uint64_t v8 = [v7 stringValue];

  if (v8
    && ([(ACAccountStore *)self->_accountStore aa_appleAccountWithPersonID:v8],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    os_signpost_id_t v10 = (void *)v9;
    self->_existingAccount = 1;
    [(AASignInFlowController *)self _onqueue_prepareExistingAppleAccountForSignIn:v9 withAuthResults:v6 accountCreationError:a4];
    if (!a4) {
      goto LABEL_8;
    }
  }
  else
  {
    os_signpost_id_t v10 = [(AASignInFlowController *)self _onqueue_createNewAppleAccountWithAuthResults:v6 accountCreationError:a4];
    if (!a4) {
      goto LABEL_8;
    }
  }
  if (*a4)
  {
    id v11 = 0;
    goto LABEL_9;
  }
LABEL_8:
  [(AASignInFlowController *)self _onqueue_updateAppleAccount:v10 withAuthenticationResults:v6];
  id v11 = v10;
LABEL_9:

  return v11;
}

- (void)_onqueue_prepareExistingAppleAccountForSignIn:(id)a3 withAuthResults:(id)a4 accountCreationError:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F4ED98];
  id v10 = a4;
  id v11 = [v10 objectForKeyedSubscript:v9];
  uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F4EDF0]];
  uint64_t v13 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];

  [(AASignInFlowController *)self _onqueue_updateAppleAccountIfNecessary:v8 withAltDSID:v11 rawPassword:v12];
  [(AASignInFlowController *)self _onqueue_saveTermsWithAuthResults:v10 account:v8];

  id v14 = _AALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_msgSend(v8, "aa_altDSID");
    int v22 = 138412290;
    id v23 = v15;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: found an existing account with altDSID: %@", (uint8_t *)&v22, 0xCu);
  }
  dispatch_block_t v16 = [(AASignInFlowController *)self _userPersonaUniqueString];

  if (v16)
  {
    id v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_msgSend(v8, "aa_altDSID");
      int v22 = 138412290;
      id v23 = v18;
      _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: found an existing account with altDSID %@, but we're running in the enterprise persona.", (uint8_t *)&v22, 0xCu);
    }
    if (![v8 isDataSeparatedAccount]) {
      goto LABEL_18;
    }
LABEL_9:
    uint64_t v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[AASignInFlowController _onqueue_prepareExistingAppleAccountForSignIn:withAuthResults:accountCreationError:]();
    }

    if (a5)
    {
      *a5 = [(AASignInFlowController *)self _aaErrorForErrorCode:-8012];
    }
    goto LABEL_18;
  }
  if ([v8 isDataSeparatedAccount]) {
    goto LABEL_9;
  }
  if (!v13 && objc_msgSend(v8, "aa_isAccountClass:", @"basic"))
  {
    __int16 v20 = _AALogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v8;
      _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: promoting existing account %@ to primary", (uint8_t *)&v22, 0xCu);
    }

    objc_msgSend(v8, "aa_setAccountClass:", @"primary");
    double v21 = [(AASignInFlowController *)self _nameForCloudService];
    [v8 setAccountDescription:v21];
  }
LABEL_18:
}

- (id)_onqueue_createNewAppleAccountWithAuthResults:(id)a3 accountCreationError:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EE10]];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDA8]];
  uint64_t v8 = [v7 stringValue];

  v32 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDF8]];
  uint64_t v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = v6;
    _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: will sign in a new iCloud Account for %@", buf, 0xCu);
  }

  id v10 = objc_alloc(MEMORY[0x1E4F179B0]);
  id v11 = [(ACAccountStore *)self->_accountStore aa_appleAccountType];
  uint64_t v12 = (void *)[v10 initWithAccountType:v11];

  v33 = (void *)v6;
  [v12 setUsername:v6];
  uint64_t v13 = (void *)v8;
  objc_msgSend(v12, "_aa_setPersonID:", v8);
  id v14 = [(AASignInFlowController *)self _userPersonaUniqueString];
  BOOL v15 = +[AAPreferences isMultipleFullAccountsEnabled];
  dispatch_block_t v16 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];

  id v17 = [(ACAccountStore *)self->_accountStore aa_dataSeparatedAccounts];
  uint64_t v18 = [v17 count];

  if (v18) {
    int v19 = v15;
  }
  else {
    int v19 = 1;
  }
  __int16 v20 = _AALogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    double v21 = @"NO";
    if (v15) {
      int v22 = @"YES";
    }
    else {
      int v22 = @"NO";
    }
    if (v18) {
      id v23 = @"YES";
    }
    else {
      id v23 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    uint64_t v35 = (uint64_t)v22;
    __int16 v36 = 2112;
    id v37 = v23;
    if (!v19) {
      double v21 = @"YES";
    }
    __int16 v38 = 2112;
    v39 = v21;
    _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: multiple full accounts allowed: %@, already have data separated account: %@, disallow multiple full accounts: %@", buf, 0x20u);
  }

  if (v14) {
    char v24 = v19;
  }
  else {
    char v24 = 1;
  }
  if (v24)
  {
    char v25 = v13;
    if (v14)
    {
      id v26 = v33;
      [v12 setAccountDescription:v33];
      objc_msgSend(v12, "aa_setAccountClass:", @"full");
      [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F176E8]];
    }
    else
    {
      id v26 = v33;
      if (v16)
      {
        [v12 setAccountDescription:v33];
        if (v15) {
          uint64_t v28 = AAAccountClassFull;
        }
        else {
          uint64_t v28 = AAAccountClassBasic;
        }
      }
      else
      {
        double v29 = [(AASignInFlowController *)self _nameForCloudService];
        [v12 setAccountDescription:v29];

        uint64_t v28 = AAAccountClassPrimary;
      }
      objc_msgSend(v12, "aa_setAccountClass:", *v28);
    }
  }
  else
  {
    os_signpost_id_t v27 = _AALogSystem();
    char v25 = v13;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[AASignInFlowController _onqueue_createNewAppleAccountWithAuthResults:accountCreationError:]();
    }

    id v26 = v33;
    if (a4)
    {
      *a4 = [(AASignInFlowController *)self _aaErrorForErrorCode:-8013];
    }
  }
  [(AASignInFlowController *)self _onqueue_saveTermsWithAuthResults:v5 account:v12];

  return v12;
}

- (void)_onqueue_updateAppleAccount:(id)a3 withAuthenticationResults:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4EDE8]];
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4EDF0]];
  uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4ED98]];
  id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4EDF8]];
  id v11 = [MEMORY[0x1E4F179C0] credentialWithPassword:v7];
  [v5 setCredential:v11];
  objc_msgSend(v5, "_aa_setRawPassword:", v8);
  objc_msgSend(v5, "_aa_setAltDSID:", v9);
  uint64_t v12 = objc_msgSend(v5, "aa_firstName");

  if (!v12)
  {
    objc_opt_class();
    id v13 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4EDB8]];
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    objc_msgSend(v5, "aa_setFirstName:", v14);
    BOOL v15 = _AALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[AASignInFlowController _onqueue_updateAppleAccount:withAuthenticationResults:]();
    }
  }
  dispatch_block_t v16 = objc_msgSend(v5, "aa_lastName");

  if (!v16)
  {
    objc_opt_class();
    id v17 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4EDD8]];
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    objc_msgSend(v5, "aa_setLastName:", v18);
    int v19 = _AALogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[AASignInFlowController _onqueue_updateAppleAccount:withAuthenticationResults:]();
    }
  }
  __int16 v20 = [v6 objectForKeyedSubscript:@"appProvidedContext"];

  if (v20)
  {
    double v21 = _AALogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [v6 objectForKeyedSubscript:@"appProvidedContext"];
      int v24 = 138412290;
      char v25 = v22;
      _os_log_impl(&dword_1A11D8000, v21, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: AuthContext contains AppProvidedContext: %@", (uint8_t *)&v24, 0xCu);
    }
    id v23 = [v6 objectForKeyedSubscript:@"appProvidedContext"];
    objc_msgSend(v5, "_aa_setAppProvidedContext:", v23);
  }
}

- (void)_onqueue_updateAppleAccountIfNecessary:(id)a3 withAltDSID:(id)a4 rawPassword:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Checking to see if we should update altDSID on iCloud account %@", (uint8_t *)&v17, 0xCu);
  }

  if ([v9 length])
  {
    uint64_t v12 = objc_msgSend(v8, "aa_altDSID");
    uint64_t v13 = [v12 length];

    id v14 = _AALogSystem();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "iCloud account already has altDSID, ignoring...", (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      if (v15)
      {
        int v17 = 138412290;
        id v18 = v9;
        _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Updating iCloud account with altDSID: %@", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(v8, "_aa_setRawPassword:", v10);
      objc_msgSend(v8, "_aa_setAltDSID:", v9);
      [(ACAccountStore *)self->_accountStore saveVerifiedAccount:v8 withCompletionHandler:0];
    }
  }
  else
  {
    dispatch_block_t v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "No altDSID provided, nothing to do...", (uint8_t *)&v17, 2u);
    }
  }
}

- (void)_onqueue_saveTermsWithAuthResults:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F4ED90]];
  if (v6)
  {
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AASignInFlowController _onqueue_saveTermsWithAuthResults:account:]();
    }

    id v8 = objc_opt_new();
    [v8 saveTermsAcceptance:v6 forAccount:v5];
  }
}

- (void)_cacheLoginResponse:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = _AASignpostLogSystem();
  os_signpost_id_t v12 = _AASignpostCreate(v11);
  uint64_t v14 = v13;

  BOOL v15 = _AASignpostLogSystem();
  dispatch_block_t v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SignInCacheLoginResponse", " enableTelemetry=YES ", buf, 2u);
  }

  int v17 = _AASignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v25 = v12;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInCacheLoginResponse  enableTelemetry=YES ", buf, 0xCu);
  }

  id v18 = objc_alloc_init(AADaemonController);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__AASignInFlowController__cacheLoginResponse_forAccount_completion___block_invoke;
  v20[3] = &unk_1E5A4A670;
  os_signpost_id_t v22 = v12;
  uint64_t v23 = v14;
  v20[4] = self;
  id v21 = v8;
  id v19 = v8;
  [(AADaemonController *)v18 cacheLoginResponse:v10 forAccount:v9 completion:v20];
}

void __68__AASignInFlowController__cacheLoginResponse_forAccount_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "code"));
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInCacheLoginResponse", "errorCode");
  [v6 setObject:v5 forKeyedSubscript:v7];

  if (v4) {
  id v8 = [v4 domain];
  }
  id v9 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInCacheLoginResponse", "errorDomain");
  [v9 setObject:v8 forKeyedSubscript:v10];

  double Nanoseconds = (double)_AASignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  os_signpost_id_t v12 = _AASignpostLogSystem();
  uint64_t v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 48);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v23) = [v4 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v13, OS_SIGNPOST_INTERVAL_END, v14, "SignInCacheLoginResponse", " Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 8u);
  }
  double v15 = Nanoseconds / 1000000000.0;

  dispatch_block_t v16 = _AASignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 48);
    int v18 = [v4 code];
    *(_DWORD *)buf = 134218496;
    uint64_t v23 = v17;
    __int16 v24 = 2048;
    double v25 = v15;
    __int16 v26 = 1026;
    int v27 = v18;
    _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInCacheLoginResponse  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x1Cu);
  }

  id v19 = [*(id *)(a1 + 32) telemetryTimeSeries];
  __int16 v20 = [NSNumber numberWithDouble:v15];
  [v19 setObject:v20 forKeyedSubscript:@"SignInCacheLoginResponse"];

  uint64_t v21 = *(void *)(a1 + 40);
  if (v21) {
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v4);
  }
}

- (void)_onqueue_registerAndVerifyLoginForiCloudAccount:(id)a3 authResults:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[AAPreferences shouldUseUnifiedLoginEndpoint])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke;
    v19[3] = &unk_1E5A4A6C0;
    v19[4] = self;
    id v11 = v8;
    id v20 = v11;
    os_signpost_id_t v12 = (void *)MEMORY[0x1A622F430](v19);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_70;
    v15[3] = &unk_1E5A4A710;
    v15[4] = self;
    id v16 = v9;
    id v17 = v12;
    id v18 = v10;
    id v13 = v12;
    [(AASignInFlowController *)self _loginAndUpdateiCloudWithAuthResults:v16 iCloudAccount:v11 withCompletion:v15];
  }
  else
  {
    os_signpost_id_t v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "[Warning] Using legacy non-unified login endpoint path for sign in (not expected)", buf, 2u);
    }

    [(AASignInFlowController *)self _onqueue_legacyRegisterAndVerifyLoginForiCloudAccount:v8 authResults:v9 withCompletion:v10];
  }
}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_68;
    v10[3] = &unk_1E5A4A698;
    id v11 = v5;
    id v12 = *(id *)(a1 + 40);
    id v13 = v6;
    [v7 _cacheLoginResponse:v11 forAccount:v8 completion:v10];
  }
  else
  {
    id v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_cold_1();
    }

    v6[2](v6);
  }
}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_68(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _AALogSystem();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_68_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Successfully cached login response (%@) for account (%@)", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_70(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (objc_msgSend(v10, "aa_isAARecoverableError"))
  {
    uint64_t v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "LoginAndUpdateiCloudAccount failed with recoverable error, retrying once...", buf, 2u);
    }

    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_71;
    v26[3] = &unk_1E5A4A6E8;
    id v15 = *(id *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void **)(a1 + 40);
    id v28 = v15;
    v26[4] = v16;
    id v27 = v17;
    id v29 = *(id *)(a1 + 56);
    [v13 _loginAndUpdateiCloudWithAuthResults:v14 iCloudAccount:v9 withCompletion:v26];

    id v18 = v28;
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 48);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_2;
    v20[3] = &unk_1E5A4A5A8;
    v20[4] = *(void *)(a1 + 32);
    id v21 = v9;
    id v22 = *(id *)(a1 + 40);
    char v25 = a2;
    id v23 = v10;
    id v24 = *(id *)(a1 + 56);
    (*(void (**)(uint64_t, id, void *))(v19 + 16))(v19, v11, v20);

    id v18 = v21;
  }
}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_71(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_71_cold_1();
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_72;
  v18[3] = &unk_1E5A4A5A8;
  id v13 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  v18[4] = *(void *)(a1 + 32);
  id v19 = v9;
  char v23 = a2;
  id v20 = v13;
  id v21 = v10;
  id v22 = *(id *)(a1 + 56);
  id v15 = *(void (**)(uint64_t, id, void *))(v14 + 16);
  id v16 = v10;
  id v17 = v9;
  v15(v14, v11, v18);
}

uint64_t __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_72(uint64_t a1)
{
  return [*(id *)(a1 + 32) _verifyLoginResponseForiCloudAccount:*(void *)(a1 + 40) withAuthResults:*(void *)(a1 + 48) withSuccess:*(unsigned __int8 *)(a1 + 72) error:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

uint64_t __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _verifyLoginResponseForiCloudAccount:*(void *)(a1 + 40) withAuthResults:*(void *)(a1 + 48) withSuccess:*(unsigned __int8 *)(a1 + 72) error:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (void)_loginAndUpdateiCloudWithAuthResults:(id)a3 iCloudAccount:(id)a4 withCompletion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = _AASignpostLogSystem();
  os_signpost_id_t v12 = _AASignpostCreate(v11);
  uint64_t v14 = v13;

  id v15 = _AASignpostLogSystem();
  id v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "LoginAndUpdateAccount", " enableTelemetry=YES ", buf, 2u);
  }

  id v17 = _AASignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v34 = v12;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: LoginAndUpdateAccount  enableTelemetry=YES ", buf, 0xCu);
  }

  id v18 = (void *)MEMORY[0x1E4F46FC8];
  id v19 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F4ED98]];
  id v20 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F4EE00]];

  id v21 = [v18 analyticsEventWithName:@"com.apple.appleaccount.iCloudAuthLoginAndUpdate" altDSID:v19 flowID:v20];

  id v22 = +[AAiCloudLoginAccountRequester delegateParamsForAllDelegates];
  accountStore = self->_accountStore;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __92__AASignInFlowController__loginAndUpdateiCloudWithAuthResults_iCloudAccount_withCompletion___block_invoke;
  v27[3] = &unk_1E5A4A738;
  os_signpost_id_t v31 = v12;
  uint64_t v32 = v14;
  v27[4] = self;
  id v28 = v21;
  id v29 = v8;
  id v30 = v9;
  id v24 = v9;
  id v25 = v8;
  id v26 = v21;
  [(ACAccountStore *)accountStore aa_loginAndUpdateiCloudAccount:v25 delegateParams:v22 withCompletion:v27];
}

void __92__AASignInFlowController__loginAndUpdateiCloudWithAuthResults_iCloudAccount_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "code"));
  }
  else
  {
    id v10 = 0;
  }
  id v11 = [*(id *)(a1 + 32) telemetryTimeSeries];
  os_signpost_id_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "LoginAndUpdateAccount", "errorCode");
  [v11 setObject:v10 forKeyedSubscript:v12];

  if (v9) {
  uint64_t v13 = [v9 domain];
  }
  uint64_t v14 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "LoginAndUpdateAccount", "errorDomain");
  [v14 setObject:v13 forKeyedSubscript:v15];

  double Nanoseconds = (double)_AASignpostGetNanoseconds(*(void *)(a1 + 64), *(void *)(a1 + 72));
  id v17 = _AASignpostLogSystem();
  id v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 64);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)os_signpost_id_t v31 = a2;
    *(_WORD *)&v31[4] = 1026;
    *(_DWORD *)&v31[6] = [v9 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v18, OS_SIGNPOST_INTERVAL_END, v19, "LoginAndUpdateAccount", " Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }
  double v20 = Nanoseconds / 1000000000.0;

  id v21 = _AASignpostLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 64);
    int v23 = [v9 code];
    *(_DWORD *)buf = 134218752;
    *(void *)os_signpost_id_t v31 = v22;
    *(_WORD *)&v31[8] = 2048;
    double v32 = v20;
    __int16 v33 = 1026;
    int v34 = a2;
    __int16 v35 = 1026;
    int v36 = v23;
    _os_log_impl(&dword_1A11D8000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:LoginAndUpdateAccount  Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  id v24 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v25 = [NSNumber numberWithDouble:v20];
  [v24 setObject:v25 forKeyedSubscript:@"LoginAndUpdateAccount"];

  id v26 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 40) setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F47028]];

  [*(id *)(a1 + 40) populateUnderlyingErrorsStartingWithRootError:v9];
  id v27 = +[AAAnalyticsRTCReporter reporter];
  [v27 sendEvent:*(void *)(a1 + 40)];

  id v28 = [v7 responseDictionary];
  id v29 = [v28 objectForKeyedSubscript:@"serverInfo"];
  objc_msgSend(*(id *)(a1 + 48), "_aa_setTermsServerInfo:", v29);

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_onqueue_legacyRegisterAndVerifyLoginForiCloudAccount:(id)a3 authResults:(id)a4 withCompletion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AASignpostLogSystem();
  os_signpost_id_t v12 = _AASignpostCreate(v11);
  uint64_t v14 = v13;

  id v15 = _AASignpostLogSystem();
  id v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SignInRegisterAccount", " enableTelemetry=YES ", buf, 2u);
  }

  id v17 = _AASignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v29 = v12;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInRegisterAccount  enableTelemetry=YES ", buf, 0xCu);
  }

  accountStore = self->_accountStore;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __107__AASignInFlowController__onqueue_legacyRegisterAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke;
  v22[3] = &unk_1E5A4A760;
  os_signpost_id_t v26 = v12;
  uint64_t v27 = v14;
  v22[4] = self;
  id v23 = v8;
  id v24 = v9;
  id v25 = v10;
  id v19 = v10;
  id v20 = v9;
  id v21 = v8;
  [(ACAccountStore *)accountStore aa_registerAppleAccount:v21 withCompletion:v22];
}

void __107__AASignInFlowController__onqueue_legacyRegisterAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "code"));
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInRegisterAccount", "errorCode");
  [v8 setObject:v7 forKeyedSubscript:v9];

  if (v6) {
  id v10 = [v6 domain];
  }
  id v11 = [*(id *)(a1 + 32) telemetryTimeSeries];
  os_signpost_id_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInRegisterAccount", "errorDomain");
  [v11 setObject:v10 forKeyedSubscript:v12];

  double Nanoseconds = (double)_AASignpostGetNanoseconds(*(void *)(a1 + 64), *(void *)(a1 + 72));
  uint64_t v14 = _AASignpostLogSystem();
  id v15 = v14;
  os_signpost_id_t v16 = *(void *)(a1 + 64);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)id v24 = a2;
    *(_WORD *)&v24[4] = 1026;
    *(_DWORD *)&v24[6] = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v15, OS_SIGNPOST_INTERVAL_END, v16, "SignInRegisterAccount", " Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }
  double v17 = Nanoseconds / 1000000000.0;

  id v18 = _AASignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 64);
    int v20 = [v6 code];
    *(_DWORD *)buf = 134218752;
    *(void *)id v24 = v19;
    *(_WORD *)&v24[8] = 2048;
    double v25 = v17;
    __int16 v26 = 1026;
    int v27 = a2;
    __int16 v28 = 1026;
    int v29 = v20;
    _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInRegisterAccount  Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  id v21 = [*(id *)(a1 + 32) telemetryTimeSeries];
  uint64_t v22 = [NSNumber numberWithDouble:v17];
  [v21 setObject:v22 forKeyedSubscript:@"SignInRegisterAccount"];

  [*(id *)(a1 + 32) _verifyLoginResponseForiCloudAccount:*(void *)(a1 + 40) withAuthResults:*(void *)(a1 + 48) withSuccess:a2 error:v6 completion:*(void *)(a1 + 56)];
}

- (void)_onqueue_verifyLoginResponseForiCloudAccount:(id)a3 withAuthResults:(id)a4 withSuccess:(BOOL)a5 error:(id)a6 completion:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (a5)
  {
    os_signpost_id_t v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Account is valid: finish account setup", buf, 2u);
    }

    double v17 = objc_msgSend(v12, "aa_password");

    if (v17)
    {
      id v18 = _AALogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "We have a password, setAuthenticated to NO and grab delegate tokens", buf, 2u);
      }

      [v12 setAuthenticated:0];
    }
    uint64_t v19 = [(AASignInFlowController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      int v20 = [(AASignInFlowController *)self delegate];
      int v21 = [v20 skipCDPEnablement];

      if (v21)
      {
        uint64_t v22 = _AALogSystem();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = objc_msgSend(v12, "aa_altDSID");
          *(_DWORD *)buf = 141558274;
          uint64_t v39 = 1752392040;
          __int16 v40 = 2112;
          uint64_t v41 = v23;
          _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Skipping iCDP state machine for %{mask.hash}@ because delegate said to.", buf, 0x16u);
        }
LABEL_27:

        double v32 = _AALogSystem();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A11D8000, v32, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Finished auth'ing account and skipping iCDP state validation.", buf, 2u);
        }

        [(AASignInFlowController *)self _onqueue_saveAccount:v12 withAuthResults:v13 withCDPEnablement:0 withAllDataclassesEnabledIfPossibleWithCompletion:v15];
        goto LABEL_30;
      }
    }
    else
    {
    }
    int v27 = objc_msgSend(v12, "aa_isAccountClass:", @"primary");
    uint64_t v22 = _AALogSystem();
    BOOL v28 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (!v27)
    {
      if (v28)
      {
        os_signpost_id_t v31 = objc_msgSend(v12, "aa_altDSID");
        *(_DWORD *)buf = 141558274;
        uint64_t v39 = 1752392040;
        __int16 v40 = 2112;
        uint64_t v41 = v31;
        _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Account for %{mask.hash}@ is secondary and MultiUserManatee is off, no iCDP setup will be attempted.", buf, 0x16u);
      }
      goto LABEL_27;
    }
    if (v28)
    {
      int v29 = objc_msgSend(v12, "aa_altDSID");
      *(_DWORD *)buf = 141558274;
      uint64_t v39 = 1752392040;
      __int16 v40 = 2112;
      uint64_t v41 = v29;
      _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Account for %{mask.hash}@ is primary, proceeding with iCDP setup.", buf, 0x16u);
    }
    uint64_t v30 = _AALogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v30, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Finished auth'ing account and must validate iCDP state.", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __116__AASignInFlowController__onqueue_verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke;
    v33[3] = &unk_1E5A4A788;
    id v34 = v12;
    objc_copyWeak(&v37, (id *)buf);
    id v35 = v13;
    id v36 = v15;
    [(AASignInFlowController *)self _onqueue_validateAndEnrollCDPStateForAccount:v34 withAuthResults:v35 completion:v33];

    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v24 = [v14 userInfo];
    double v25 = [v24 objectForKey:@"localizedError"];

    __int16 v26 = _AALogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = (uint64_t)v25;
      _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "Account is not valid: handling error %@", buf, 0xCu);
    }

    if ([v25 isEqualToString:@"MOBILEME_TERMS_OF_SERVICE_UPDATE"]) {
      [(AASignInFlowController *)self _delegate_presentGenericTermsUIforAccount:v12 authResults:v13 serverError:v14 completion:v15];
    }
    else {
      [(AASignInFlowController *)self _delegate_presentValidationAlertForError:v14 forAccount:v12 completion:v15];
    }
  }
LABEL_30:
}

void __116__AASignInFlowController__onqueue_verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) refresh];
    uint64_t v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Validating iCDP succeeded! Proceeding with iCloud sign-in...", v10, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _saveAccount:*(void *)(a1 + 32) withAuthResults:*(void *)(a1 + 40) withCDPEnablement:1 withAllDataclassesEnabledIfPossibleWithCompletion:*(void *)(a1 + 48)];
    goto LABEL_12;
  }
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __116__AASignInFlowController__onqueue_verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke_cold_1();
  }

  if ([v5 shouldDisplayToUser])
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_delegate_presentValidationAlertForError:forAccount:completion:", v5, *(void *)(a1 + 32), *(void *)(a1 + 48));
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (!v5)
  {
    WeakRetained = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", -3);
    (*(void (**)(uint64_t, void, void, void *))(v9 + 16))(v9, 0, 0, WeakRetained);
    goto LABEL_12;
  }
  (*(void (**)(uint64_t, void, void, id))(v9 + 16))(v9, 0, 0, v5);
LABEL_13:
}

- (void)_onqueue_validateAndEnrollCDPStateForAccount:(id)a3 withAuthResults:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  id v12 = v11;
  if (self->_shouldAutomaticallySaveSignInResults)
  {
    if (self->_existingAccount)
    {
      id v13 = _AALogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "Skipping warmup flag as account already exists.", buf, 2u);
      }
    }
    else
    {
      [v11 setWarmingUp:1];
    }
    id v14 = v12;
  }
  else
  {
    [(ACAccountStore *)self->_accountStore setNotificationsEnabled:0];
    id v14 = (void *)[v12 copy];
  }
  [v14 setEnabled:1 forDataclass:*MEMORY[0x1E4F17AC8]];
  uint64_t v15 = *MEMORY[0x1E4F17AD0];
  if ([v14 isProvisionedForDataclass:*MEMORY[0x1E4F17AD0]]
    && (objc_msgSend(v14, "aa_serverDisabledDataclass:", v15) & 1) == 0)
  {
    [v14 setEnabled:1 forDataclass:v15];
  }
  [v14 setEnabled:1 forDataclass:*MEMORY[0x1E4F17AA0]];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke;
  v19[3] = &unk_1E5A4A7B0;
  v19[4] = self;
  id v20 = v9;
  id v21 = v14;
  id v22 = v10;
  id v16 = v10;
  id v17 = v14;
  id v18 = v9;
  [(AASignInFlowController *)self _preflightSaveWithAuthResults:v18 account:v17 withCompletion:v19];
}

void __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((objc_msgSend(v4, "aa_isAARecoverableError") & 1) != 0 || objc_msgSend(v4, "aa_isXPCError"))
  {
    id v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "PreflightSave failed with recoverable / xpc error, retrying once...", buf, 2u);
    }

    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke_93;
    v9[3] = &unk_1E5A48DE8;
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    [v6 _preflightSaveWithAuthResults:v7 account:v8 withCompletion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke_93(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke_93_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_preflightSaveWithAuthResults:(id)a3 account:(id)a4 withCompletion:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke;
  v36[3] = &unk_1E5A491B8;
  v36[4] = self;
  id v37 = v10;
  id v28 = v10;
  id v11 = (void *)MEMORY[0x1A622F430](v36);
  id v12 = _AASignpostLogSystem();
  os_signpost_id_t v13 = _AASignpostCreate(v12);
  uint64_t v15 = v14;

  id v16 = _AASignpostLogSystem();
  id v17 = v16;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SignInPreflightSave", " enableTelemetry=YES ", buf, 2u);
  }

  id v18 = _AASignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v39 = v13;
    _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInPreflightSave  enableTelemetry=YES ", buf, 0xCu);
  }

  uint64_t v19 = (void *)MEMORY[0x1E4F46FC8];
  id v20 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4ED98]];
  id v21 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4EE00]];
  id v22 = [v19 analyticsEventWithName:@"com.apple.appleaccount.iCloudAuthPreflightSave" altDSID:v20 flowID:v21];

  accountStore = self->_accountStore;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke_94;
  v29[3] = &unk_1E5A4A7D8;
  os_signpost_id_t v34 = v13;
  uint64_t v35 = v15;
  v29[4] = self;
  id v30 = v22;
  id v32 = v9;
  id v33 = v11;
  id v31 = v8;
  id v24 = v9;
  id v25 = v8;
  id v26 = v11;
  id v27 = v22;
  [(ACAccountStore *)accountStore saveAccount:v24 withCompletionHandler:v29];
}

void __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a3;
  [v4 setNotificationsEnabled:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke_94(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "code"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInPreflightSave", "errorCode");
  [v8 setObject:v7 forKeyedSubscript:v9];

  if (v6) {
  id v10 = [v6 domain];
  }
  id v11 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInPreflightSave", "errorDomain");
  [v11 setObject:v10 forKeyedSubscript:v12];

  double Nanoseconds = (double)_AASignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
  uint64_t v14 = _AASignpostLogSystem();
  uint64_t v15 = v14;
  os_signpost_id_t v16 = *(void *)(a1 + 72);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)id v31 = a2;
    *(_WORD *)&v31[4] = 1026;
    *(_DWORD *)&v31[6] = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v15, OS_SIGNPOST_INTERVAL_END, v16, "SignInPreflightSave", " DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }
  double v17 = Nanoseconds / 1000000000.0;

  id v18 = _AASignpostLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 72);
    int v20 = [v6 code];
    *(_DWORD *)buf = 134218752;
    *(void *)id v31 = v19;
    *(_WORD *)&v31[8] = 2048;
    double v32 = v17;
    __int16 v33 = 1026;
    int v34 = a2;
    __int16 v35 = 1026;
    int v36 = v20;
    _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInPreflightSave  DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  id v21 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v22 = [NSNumber numberWithDouble:v17];
  [v21 setObject:v22 forKeyedSubscript:@"SignInPreflightSave"];

  id v23 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F47028]];

  [*(id *)(a1 + 40) populateUnderlyingErrorsStartingWithRootError:v6];
  id v24 = +[AAAnalyticsRTCReporter reporter];
  [v24 sendEvent:*(void *)(a1 + 40)];

  if (a2)
  {
    id v25 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_createCDPContextWithAuthResults:", *(void *)(a1 + 48));
    if (v25)
    {
      [*(id *)(a1 + 32) _addKeysAndEnrollCDPStateForAccount:*(void *)(a1 + 56) withCDPContext:v25 completion:*(void *)(a1 + 64)];
    }
    else
    {
      id v27 = _AALogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke_94_cold_1();
      }

      uint64_t v28 = *(void *)(a1 + 64);
      int v29 = [*(id *)(a1 + 32) _aaErrorForErrorCode:-17];
      (*(void (**)(uint64_t, void, void *))(v28 + 16))(v28, 0, v29);
    }
  }
  else
  {
    id v26 = _AALogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v31 = v6;
      _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "iCDP preflighting failed because we could not save the iCloud account! Error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)_onqueue_addKeysAndEnrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AASignInFlowController _onqueue_addKeysAndEnrollCDPStateForAccount:withCDPContext:completion:]((uint64_t)self, v11);
  }

  id v12 = [(NSDictionary *)self->_authResults valueForKey:*MEMORY[0x1E4F4EDA0]];
  if (v12)
  {
    os_signpost_id_t v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "Looks to be a login from custodian recovery flows. Fetching recovery keys for CDP flows", buf, 2u);
    }

    uint64_t v14 = objc_alloc_init(AACustodianController);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __96__AASignInFlowController__onqueue_addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke;
    v15[3] = &unk_1E5A4A800;
    id v16 = v9;
    double v17 = self;
    id v18 = v8;
    id v19 = v10;
    [(AACustodianController *)v14 fetchCustodianRecoveryKeysWithSessionID:v12 completion:v15];
  }
  else
  {
    [(AASignInFlowController *)self _onqueue_enrollCDPStateForAccount:v8 withCDPContext:v9 completion:v10];
  }
}

void __96__AASignInFlowController__onqueue_addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [getCDPCustodianRecoveryInfoClass() instancesRespondToSelector:sel_recordBuildVersion];
    id v8 = objc_alloc((Class)getCDPCustodianRecoveryInfoClass());
    id v9 = [v5 wrappedRKC];
    id v10 = [v5 wrappingKey];
    id v11 = [v5 custodianUUID];
    if (v7)
    {
      id v12 = [v5 recordBuildVersion];
      os_signpost_id_t v13 = (void *)[v8 initWithWrappedRKC:v9 wrappingKey:v10 custodianUUID:v11 recordBuildVersion:v12];
    }
    else
    {
      os_signpost_id_t v13 = (void *)[v8 initWithWrappedRKC:v9 wrappingKey:v10 custodianUUID:v11];
    }

    [*(id *)(a1 + 32) setCustodianRecoveryInfo:v13];
  }
  else
  {
    uint64_t v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __96__AASignInFlowController__onqueue_addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 40) _enrollCDPStateForAccount:*(void *)(a1 + 48) withCDPContext:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
}

- (void)_onqueue_enrollCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v35 = 0;
  int v36 = &v35;
  uint64_t v37 = 0x2050000000;
  id v11 = (void *)getCDPStateControllerClass_softClass;
  uint64_t v38 = getCDPStateControllerClass_softClass;
  if (!getCDPStateControllerClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v40 = __getCDPStateControllerClass_block_invoke;
    uint64_t v41 = &unk_1E5A48F98;
    uint64_t v42 = &v35;
    __getCDPStateControllerClass_block_invoke((uint64_t)&buf);
    id v11 = (void *)v36[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v35, 8);
  os_signpost_id_t v13 = (void *)[[v12 alloc] initWithContext:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cdpUIProvider);
  BOOL v15 = WeakRetained == 0;

  if (v15)
  {
    id v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AASignInFlowController _onqueue_enrollCDPStateForAccount:withCDPContext:completion:]();
    }
  }
  else
  {
    id v16 = objc_loadWeakRetained((id *)&self->_cdpUIProvider);
    [v13 setUiProvider:v16];
  }

  double v17 = _AASignpostLogSystem();
  os_signpost_id_t v18 = _AASignpostCreate(v17);
  uint64_t v20 = v19;

  id v21 = _AASignpostLogSystem();
  id v22 = v21;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SignInValidateCDP", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  id v23 = _AASignpostLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_1A11D8000, v23, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInValidateCDP  enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);
  }

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke;
  v28[3] = &unk_1E5A4A850;
  v28[4] = self;
  id v29 = v13;
  os_signpost_id_t v33 = v18;
  uint64_t v34 = v20;
  id v31 = v8;
  id v32 = v10;
  id v30 = v9;
  id v24 = v8;
  id v25 = v10;
  id v26 = v9;
  id v27 = v13;
  [v27 handleCloudDataProtectionStateWithCompletion:v28];
}

void __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v44 = a4;
  id v6 = NSNumber;
  int v7 = [*(id *)(a1 + 40) context];
  id v8 = [v7 sharingChannel];
  id v9 = [v6 numberWithInt:v8 != 0];
  id v10 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInValidateCDP", "hasSharingChannel");
  [v10 setObject:v9 forKeyedSubscript:v11];

  id v12 = [NSNumber numberWithBool:a2];
  os_signpost_id_t v13 = [*(id *)(a1 + 32) telemetryTimeSeries];
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInValidateCDP", "shouldCompleteSignIn");
  [v13 setObject:v12 forKeyedSubscript:v14];

  BOOL v15 = [NSNumber numberWithBool:a2];
  id v16 = [*(id *)(a1 + 32) telemetryTimeSeries];
  double v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInValidateCDP", "cloudDataProtectionEnabled");
  [v16 setObject:v15 forKeyedSubscript:v17];

  if (v44)
  {
    os_signpost_id_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v44, "code"));
  }
  else
  {
    os_signpost_id_t v18 = 0;
  }
  uint64_t v19 = [*(id *)(a1 + 32) telemetryTimeSeries];
  uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInValidateCDP", "errorCode");
  [v19 setObject:v18 forKeyedSubscript:v20];

  if (v44) {
  id v21 = [v44 domain];
  }
  id v22 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInValidateCDP", "errorDomain");
  [v22 setObject:v21 forKeyedSubscript:v23];

  double Nanoseconds = (double)_AASignpostGetNanoseconds(*(void *)(a1 + 72), *(void *)(a1 + 80));
  id v25 = _AASignpostLogSystem();
  id v26 = v25;
  os_signpost_id_t v27 = *(void *)(a1 + 72);
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_DWORD *)long long buf = 67240448;
    *(_DWORD *)v50 = a3;
    *(_WORD *)&v50[4] = 1026;
    *(_DWORD *)&v50[6] = [v44 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v26, OS_SIGNPOST_INTERVAL_END, v27, "SignInValidateCDP", " Enabled=%{public,signpost.telemetry:number1,name=Enabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }
  double v28 = Nanoseconds / 1000000000.0;

  id v29 = _AASignpostLogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = *(void *)(a1 + 72);
    int v31 = [v44 code];
    *(_DWORD *)long long buf = 134218752;
    *(void *)v50 = v30;
    *(_WORD *)&v50[8] = 2048;
    double v51 = v28;
    __int16 v52 = 1026;
    int v53 = a3;
    __int16 v54 = 1026;
    int v55 = v31;
    _os_log_impl(&dword_1A11D8000, v29, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInValidateCDP  Enabled=%{public,signpost.telemetry:number1,name=Enabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  id v32 = [*(id *)(a1 + 32) telemetryTimeSeries];
  os_signpost_id_t v33 = [NSNumber numberWithDouble:v28];
  [v32 setObject:v33 forKeyedSubscript:@"SignInValidateCDP"];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v34 = [*(id *)(a1 + 48) telemetryTimeSeries];
    uint64_t v35 = _AALogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_1();
    }

    if (v34)
    {
      int v36 = [*(id *)(a1 + 32) telemetryTimeSeries];
      [v36 addEntriesFromDictionary:v34];
    }
  }
  else
  {
    uint64_t v34 = _AALogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_2();
    }
  }

  if (a2 && *(unsigned char *)(*(void *)(a1 + 32) + 48))
  {
    id v37 = v44;
    uint64_t v38 = *(void *)(a1 + 64);
    if (v38) {
      (*(void (**)(uint64_t, uint64_t, id))(v38 + 16))(v38, 1, v37);
    }
  }
  else
  {
    id v39 = v44;
    uint64_t v40 = _AALogSystem();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A11D8000, v40, OS_LOG_TYPE_DEFAULT, "Cleaning up temporary account state created during iCDP validation.", buf, 2u);
    }

    uint64_t v41 = *(void **)(*(void *)(a1 + 32) + 8);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_112;
    v45[3] = &unk_1E5A4A828;
    uint64_t v42 = *(void *)(a1 + 56);
    id v47 = *(id *)(a1 + 64);
    char v48 = a2;
    id v46 = v39;
    [v41 removeAccount:v42 withCompletionHandler:v45];
  }
}

void __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_112(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Failed to clean up after iCDP! Error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
}

- (id)_onqueue_createCDPContextWithAuthResults:(id)a3
{
  id v4 = a3;
  id v5 = [(AASignInFlowController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(AASignInFlowController *)self delegate];
    uint64_t v7 = [v6 cdpContext];

    if (v7)
    {
      int v8 = [(AASignInFlowController *)self delegate];
      id v9 = [v8 cdpContext];

      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  uint64_t v10 = (void *)getCDPContextClass_softClass;
  uint64_t v18 = getCDPContextClass_softClass;
  if (!getCDPContextClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getCDPContextClass_block_invoke;
    v14[3] = &unk_1E5A48F98;
    v14[4] = &v15;
    __getCDPContextClass_block_invoke((uint64_t)v14);
    uint64_t v10 = (void *)v16[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v15, 8);
  id v9 = (void *)[[v11 alloc] initWithAuthenticationResults:v4];
  id v12 = [(AASignInFlowController *)self messageSession];
  [v9 setSharingChannel:v12];

  objc_msgSend(v9, "set_ignoreLockAssertErrors:", -[AASignInFlowController ignoreLockAssertErrors](self, "ignoreLockAssertErrors"));
LABEL_8:

  return v9;
}

- (void)_enableFindMyIfPossibleWithAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uiQueue = self->_uiQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__AASignInFlowController__enableFindMyIfPossibleWithAccount_completion___block_invoke;
  block[3] = &unk_1E5A484C0;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = uiQueue;
  id v10 = v7;
  id v11 = v6;
  dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v9, v12);
}

uint64_t __72__AASignInFlowController__enableFindMyIfPossibleWithAccount_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_enableFindMyIfPossibleWithAccount:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_onqueue_enableFindMyIfPossibleWithAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([MEMORY[0x1E4F46FF0] isVirtualMachine])
  {
    int v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      id v9 = "Device is a virtual machine, not enabling FindMy...";
      id v10 = (uint8_t *)&v16;
LABEL_17:
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  BOOL v11 = [(AASignInFlowController *)self _shouldEnableDataclassesForAccount:v6];
  if ([(AASignInFlowController *)self _findMyActivationAction] == 2 || !v11)
  {
    int v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      id v9 = "Activation lock action explicitly disabled, not enabling FindMy...";
      id v10 = (uint8_t *)&v15;
      goto LABEL_17;
    }
LABEL_18:

    v7[2](v7, 0);
    goto LABEL_19;
  }
  if (![(AASignInFlowController *)self shouldAutomaticallySaveSignInResults])
  {
    int v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      id v9 = "Automatic sign in result save disabled, not enabling FindMy...";
      id v10 = (uint8_t *)&v14;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (!objc_msgSend(v6, "aa_isAccountClass:", @"primary")
    || (objc_msgSend(v6, "aa_isPrimaryEmailVerified") & 1) == 0)
  {
    int v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v9 = "Account is not a primary with email verified...";
      id v10 = buf;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (([v6 isProvisionedForDataclass:*MEMORY[0x1E4F17AB0]] & 1) == 0)
  {
    int v8 = _AALogSystem();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    __int16 v12 = 0;
    id v9 = "Account is not provisioned for FindMy...";
    id v10 = (uint8_t *)&v12;
    goto LABEL_17;
  }
  [(AASignInFlowController *)self _onqueue_delegate_enableFindMyWithCompletion:v7];
LABEL_19:
}

- (void)_saveAccount:(id)a3 withAuthResults:(id)a4 withCDPEnablement:(BOOL)a5 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uiQueue = self->_uiQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__AASignInFlowController__saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke;
  block[3] = &unk_1E5A48538;
  block[4] = self;
  id v20 = v10;
  BOOL v23 = a5;
  id v21 = v11;
  id v22 = v12;
  __int16 v14 = uiQueue;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v14, v18);
}

uint64_t __123__AASignInFlowController__saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_saveAccount:withAuthResults:withCDPEnablement:withAllDataclassesEnabledIfPossibleWithCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56));
}

- (void)_backgroundSaveAccount:(id)a3 withDataclassEnablement:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  utilityQueue = self->_utilityQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__AASignInFlowController__backgroundSaveAccount_withDataclassEnablement_completion___block_invoke;
  v15[3] = &unk_1E5A4A878;
  void v15[4] = self;
  id v16 = v8;
  BOOL v18 = a4;
  id v17 = v9;
  id v11 = utilityQueue;
  id v12 = v9;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_DEFAULT, 0, v15);
  dispatch_async(v11, v14);
}

uint64_t __84__AASignInFlowController__backgroundSaveAccount_withDataclassEnablement_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_saveAccount:withDataclassEnablement:completion:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)_onqueue_saveAccount:(id)a3 withAuthResults:(id)a4 withCDPEnablement:(BOOL)a5 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void (**)(void, void, void, void))v12;
  if (self->_shouldAutomaticallySaveSignInResults)
  {
    if (self->_pendingSignIn)
    {
      dispatch_block_t v14 = _AALogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AASignInFlowController _onqueue_saveAccount:withAuthResults:withCDPEnablement:withAllDataclassesEnabledIfPossibleWithCompletion:]();
      }

      id v15 = [(AASignInFlowController *)self _aaErrorForErrorCode:-8004];
      ((void (**)(void, void, void, void *))v13)[2](v13, 0, 0, v15);
    }
    else
    {
      self->_pendingSignIn = 1;
      [v10 refresh];
      if ([v10 isWarmingUp])
      {
        id v16 = _AALogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Account is no longer warming up.", buf, 2u);
        }

        [v10 setWarmingUp:0];
      }
      BOOL v17 = v7
         && [(AASignInFlowController *)self _delegateWantsToBackgroundDataclassEnablement];
      BOOL v18 = [(AASignInFlowController *)self _shouldEnableDataclassesForAccount:v10];
      uint64_t v19 = _AALogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109632;
        *(_DWORD *)int v53 = v7;
        *(_WORD *)&v53[4] = 1024;
        *(_DWORD *)&v53[6] = v17;
        __int16 v54 = 1024;
        BOOL v55 = v18;
        _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "Saving account - isEnablingCDP: %{BOOL}d, wantsBackgroundDataclassEnablement %{BOOL}d, dataclassEnablement: %{BOOL}d", buf, 0x14u);
      }

      id v20 = (void *)MEMORY[0x1E4F46FC8];
      id v21 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F4ED98]];
      id v22 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F4EE00]];
      BOOL v23 = [v20 analyticsEventWithName:@"com.apple.appleaccount.iCloudAccountAdd" altDSID:v21 flowID:v22];

      if (v17)
      {
        id v24 = _AALogSystem();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)int v53 = v18;
          _os_log_impl(&dword_1A11D8000, v24, OS_LOG_TYPE_DEFAULT, "Kicking off accounts save with dataclass enablement (%{BOOL}d) in the background.", buf, 8u);
        }

        id v25 = _AASignpostLogSystem();
        os_signpost_id_t v26 = _AASignpostCreate(v25);
        uint64_t v28 = v27;

        id v29 = _AASignpostLogSystem();
        uint64_t v30 = v29;
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A11D8000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v26, "SignInEnableDataclasses", " enableTelemetry=YES ", buf, 2u);
        }

        int v31 = _AASignpostLogSystem();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          *(void *)int v53 = v26;
          _os_log_impl(&dword_1A11D8000, v31, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInEnableDataclasses  enableTelemetry=YES ", buf, 0xCu);
        }

        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __131__AASignInFlowController__onqueue_saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke;
        v47[3] = &unk_1E5A4A8A0;
        os_signpost_id_t v50 = v26;
        uint64_t v51 = v28;
        char v48 = v23;
        id v49 = self;
        id v32 = v23;
        [(AASignInFlowController *)self _backgroundSaveAccount:v10 withDataclassEnablement:v18 completion:v47];
        ((void (**)(void, uint64_t, id, void))v13)[2](v13, 1, v10, 0);
        os_signpost_id_t v33 = v48;
      }
      else
      {
        uint64_t v34 = _AASignpostLogSystem();
        os_signpost_id_t v35 = _AASignpostCreate(v34);
        uint64_t v37 = v36;

        uint64_t v38 = _AASignpostLogSystem();
        id v39 = v38;
        if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A11D8000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v35, "SignInEnableDataclasses", " enableTelemetry=YES ", buf, 2u);
        }

        uint64_t v40 = _AASignpostLogSystem();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          *(void *)int v53 = v35;
          _os_log_impl(&dword_1A11D8000, v40, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInEnableDataclasses  enableTelemetry=YES ", buf, 0xCu);
        }

        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __131__AASignInFlowController__onqueue_saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke_117;
        v42[3] = &unk_1E5A4A8C8;
        os_signpost_id_t v45 = v35;
        uint64_t v46 = v37;
        v42[4] = self;
        uint64_t v43 = v23;
        id v44 = v13;
        id v41 = v23;
        [(AASignInFlowController *)self _onqueue_delegate_saveAccount:v10 withDataclassEnablement:v18 completion:v42];

        os_signpost_id_t v33 = v43;
      }
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, id, void))v12 + 2))(v12, 1, v10, 0);
  }
}

void __131__AASignInFlowController__onqueue_saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F47028]];

  [*(id *)(a1 + 32) populateUnderlyingErrorsStartingWithRootError:v6];
  id v8 = +[AAAnalyticsRTCReporter reporter];
  [v8 sendEvent:*(void *)(a1 + 32)];

  unint64_t Nanoseconds = _AASignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  id v10 = _AASignpostLogSystem();
  id v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 48);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    int v16 = 67240448;
    *(_DWORD *)BOOL v17 = a2;
    *(_WORD *)&v17[4] = 1026;
    *(_DWORD *)&v17[6] = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SignInEnableDataclasses", " Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0xEu);
  }

  id v13 = _AASignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 48);
    int v15 = [v6 code];
    int v16 = 134218752;
    *(void *)BOOL v17 = v14;
    *(_WORD *)&v17[8] = 2048;
    double v18 = (double)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = a2;
    __int16 v21 = 1026;
    int v22 = v15;
    _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInEnableDataclasses  Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v16, 0x22u);
  }
}

void __131__AASignInFlowController__onqueue_saveAccount_withAuthResults_withCDPEnablement_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke_117(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "code"));
  }
  else
  {
    id v10 = 0;
  }
  id v11 = [*(id *)(a1 + 32) telemetryTimeSeries];
  os_signpost_id_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInEnableDataclasses", "errorCode");
  [v11 setObject:v10 forKeyedSubscript:v12];

  if (v9) {
  id v13 = [v9 domain];
  }
  uint64_t v14 = [*(id *)(a1 + 32) telemetryTimeSeries];
  int v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "SignInEnableDataclasses", "errorDomain");
  [v14 setObject:v13 forKeyedSubscript:v15];

  double Nanoseconds = (double)_AASignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  BOOL v17 = _AASignpostLogSystem();
  double v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 56);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)long long buf = 67240448;
    *(_DWORD *)int v31 = a2;
    *(_WORD *)&v31[4] = 1026;
    *(_DWORD *)&v31[6] = [v9 code];
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v18, OS_SIGNPOST_INTERVAL_END, v19, "SignInEnableDataclasses", " Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }
  double v20 = Nanoseconds / 1000000000.0;

  __int16 v21 = _AASignpostLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 56);
    int v23 = [v9 code];
    *(_DWORD *)long long buf = 134218752;
    *(void *)int v31 = v22;
    *(_WORD *)&v31[8] = 2048;
    double v32 = v20;
    __int16 v33 = 1026;
    int v34 = a2;
    __int16 v35 = 1026;
    int v36 = v23;
    _os_log_impl(&dword_1A11D8000, v21, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:SignInEnableDataclasses  Success=%{public,signpost.telemetry:number1,name=Success}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  id v24 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v25 = [NSNumber numberWithDouble:v20];
  [v24 setObject:v25 forKeyedSubscript:@"SignInEnableDataclasses"];

  os_signpost_id_t v26 = [NSNumber numberWithBool:a2];
  [*(id *)(a1 + 40) setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F47028]];

  [*(id *)(a1 + 40) populateUnderlyingErrorsStartingWithRootError:v9];
  uint64_t v27 = +[AAAnalyticsRTCReporter reporter];
  [v27 sendEvent:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t v28 = _AALogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = @"NO";
    if (a2) {
      id v29 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    *(void *)int v31 = v29;
    *(_WORD *)&v31[8] = 2112;
    double v32 = *(double *)&v9;
    _os_log_impl(&dword_1A11D8000, v28, OS_LOG_TYPE_DEFAULT, "iCloud account save completed with success: %@, error: %@", buf, 0x16u);
  }

  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    objc_msgSend(*(id *)(a1 + 32), "_delegate_presentAccountCreationError:completion:", v9, *(void *)(a1 + 48));
  }
}

- (void)_onqueue_saveAccount:(id)a3 withDataclassEnablement:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init(AASignInOperationHelper);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__AASignInFlowController__onqueue_saveAccount_withDataclassEnablement_completion___block_invoke;
  v12[3] = &unk_1E5A4A8F0;
  id v13 = v7;
  id v14 = v8;
  id v10 = v7;
  id v11 = v8;
  [(AASignInOperationHelper *)v9 signInAccount:v10 enablingDataclasses:v6 completion:v12];
}

uint64_t __82__AASignInFlowController__onqueue_saveAccount_withDataclassEnablement_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v4 + 16))(v4, 1, *(void *)(a1 + 32), 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v4 + 16))(v4, a2, 0, a3);
  }
}

- (void)_delegate_presentAccountCreationError:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AASignInFlowController *)self _titleForSignInFailureAlert];
  id v9 = [v6 userInfo];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

  id v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412802;
    id v21 = v6;
    __int16 v22 = 2112;
    int v23 = v8;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_error_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_ERROR, "AASignInFlowController: Sign in - account creation failed with error: %@, title: %@, message: %@", buf, 0x20u);
  }

  os_signpost_id_t v12 = [(AASignInFlowController *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke;
    block[3] = &unk_1E5A4A940;
    block[4] = self;
    id v16 = v8;
    id v17 = v10;
    id v19 = v7;
    id v18 = v6;
    dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
  else
  {
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v6);
  }
}

void __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke_2;
  v6[3] = &unk_1E5A4A918;
  id v8 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  [v2 signInFlowController:v3 showAlertWithTitle:v4 message:v5 completion:v6];
}

uint64_t __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke_2(uint64_t a1)
{
  int v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke_2_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_delegate_presentGenericTermsUIforAccount:(id)a3 authResults:(id)a4 serverError:(id)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_block_t v14 = _AALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v25 = v10;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Account needs terms: %@", buf, 0xCu);
  }

  int v15 = [(AASignInFlowController *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __103__AASignInFlowController__delegate_presentGenericTermsUIforAccount_authResults_serverError_completion___block_invoke;
    v20[3] = &unk_1E5A4A580;
    v20[4] = self;
    id v21 = v10;
    id v22 = v11;
    id v23 = v13;
    dispatch_block_t v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v20);
    dispatch_async(MEMORY[0x1E4F14428], v17);
  }
  else
  {
    id v18 = _AALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AASignInFlowController _delegate_presentGenericTermsUIforAccount:authResults:serverError:completion:]();
    }

    id v19 = [(AASignInFlowController *)self _aaErrorForErrorCode:-8010 withUnderlyingError:v12];
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v19);
  }
}

void __103__AASignInFlowController__delegate_presentGenericTermsUIforAccount_authResults_serverError_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = _AASignpostLogSystem();
  os_signpost_id_t v3 = _AASignpostCreate(v2);
  uint64_t v5 = v4;

  id v6 = _AASignpostLogSystem();
  id v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "TermsAcceptance", " enableTelemetry=YES ", buf, 2u);
  }

  id v8 = _AASignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v18 = v3;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: TermsAcceptance  enableTelemetry=YES ", buf, 0xCu);
  }

  id v9 = [*(id *)(a1 + 32) delegate];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__AASignInFlowController__delegate_presentGenericTermsUIforAccount_authResults_serverError_completion___block_invoke_127;
  v12[3] = &unk_1E5A4A8C8;
  void v12[4] = v10;
  os_signpost_id_t v15 = v3;
  uint64_t v16 = v5;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  [v9 signInFlowController:v10 presentGenericTermsUIForAccount:v11 completion:v12];
}

void __103__AASignInFlowController__delegate_presentGenericTermsUIforAccount_authResults_serverError_completion___block_invoke_127(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"NO";
    if (a2) {
      uint64_t v10 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    int v31 = v10;
    __int16 v32 = 2112;
    double v33 = *(double *)&v8;
    _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "AASignInFlowController: Account accepted terms: %@, error: %@", buf, 0x16u);
  }

  if (v8)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "code"));
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = [*(id *)(a1 + 32) telemetryTimeSeries];
  id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "TermsAcceptance", "errorCode");
  [v12 setObject:v11 forKeyedSubscript:v13];

  if (v8) {
  id v14 = [v8 domain];
  }
  os_signpost_id_t v15 = [*(id *)(a1 + 32) telemetryTimeSeries];
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s_%s", "TermsAcceptance", "errorDomain");
  [v15 setObject:v14 forKeyedSubscript:v16];

  double Nanoseconds = (double)_AASignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  os_signpost_id_t v18 = _AASignpostLogSystem();
  uint64_t v19 = v18;
  os_signpost_id_t v20 = *(void *)(a1 + 56);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    int v21 = [v8 code];
    *(_DWORD *)long long buf = 67240192;
    LODWORD(v31) = v21;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v19, OS_SIGNPOST_INTERVAL_END, v20, "TermsAcceptance", " Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 8u);
  }
  double v22 = Nanoseconds / 1000000000.0;

  id v23 = _AASignpostLogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v24 = *(__CFString **)(a1 + 56);
    int v25 = [v8 code];
    *(_DWORD *)long long buf = 134218496;
    int v31 = v24;
    __int16 v32 = 2048;
    double v33 = v22;
    __int16 v34 = 1026;
    int v35 = v25;
    _os_log_impl(&dword_1A11D8000, v23, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs:TermsAcceptance  Error=%{public,signpost.telemetry:number1,name=Error}d ", buf, 0x1Cu);
  }

  uint64_t v26 = [*(id *)(a1 + 32) telemetryTimeSeries];
  uint64_t v27 = [NSNumber numberWithDouble:v22];
  [v26 setObject:v27 forKeyedSubscript:@"TermsAcceptance"];

  if (a2)
  {
    [*(id *)(a1 + 32) _registerAndVerifyLoginForiCloudAccount:v7 authResults:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v28 = *(void *)(a1 + 48);
    if (v8)
    {
      (*(void (**)(uint64_t, void, void, id))(v28 + 16))(v28, 0, 0, v8);
    }
    else
    {
      id v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AASignInErrors" code:-8006 userInfo:0];
      (*(void (**)(uint64_t, void, void, void *))(v28 + 16))(v28, 0, 0, v29);
    }
  }
}

- (void)_delegate_presentValidationAlertForError:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 userInfo];
  uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F28568]];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(AASignInFlowController *)self _titleForVerificationFailureAlert];
  }
  id v13 = v12;

  id v14 = [v7 userInfo];
  os_signpost_id_t v15 = [v14 objectForKey:*MEMORY[0x1E4F28588]];

  uint64_t v16 = _AALogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412802;
    id v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v13;
    __int16 v29 = 2112;
    uint64_t v30 = v15;
    _os_log_error_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_ERROR, "AASignInFlowController: Sign in - validation failed with error: %@, title: %@, message: %@", buf, 0x20u);
  }

  dispatch_block_t v17 = [(AASignInFlowController *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke;
    block[3] = &unk_1E5A4A940;
    block[4] = self;
    id v21 = v13;
    id v22 = v15;
    id v24 = v8;
    id v23 = v7;
    dispatch_block_t v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(MEMORY[0x1E4F14428], v19);
  }
  else
  {
    (*((void (**)(id, void, void, id))v8 + 2))(v8, 0, 0, v7);
  }
}

void __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke_2;
  v6[3] = &unk_1E5A4A918;
  id v8 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  [v2 signInFlowController:v3 showAlertWithTitle:v4 message:v5 completion:v6];
}

uint64_t __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke_2(uint64_t a1)
{
  int v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke_2_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_delegate_presentProgressViewForAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    id v8 = [(AASignInFlowController *)self delegate];
    char v9 = objc_opt_respondsToSelector();
    uint64_t v10 = _AALogSystem();
    uint64_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[AASignInFlowController _delegate_presentProgressViewForAccount:completion:]();
      }

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __77__AASignInFlowController__delegate_presentProgressViewForAccount_completion___block_invoke;
      v14[3] = &unk_1E5A4A580;
      id v15 = v8;
      uint64_t v16 = self;
      id v17 = v6;
      id v18 = v7;
      dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v14);
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AASignInFlowController _delegate_presentProgressViewForAccount:completion:]();
      }

      if (v7) {
        (*((void (**)(id, void))v7 + 2))(v7, 0);
      }
    }
  }
  else
  {
    id v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AASignInFlowController _delegate_presentProgressViewForAccount:completion:]();
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

uint64_t __77__AASignInFlowController__delegate_presentProgressViewForAccount_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signInFlowController:*(void *)(a1 + 40) presentProgressViewForAccount:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_onqueue_delegate_saveAccount:(id)a3 withDataclassEnablement:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = a5;
  char v9 = [(AASignInFlowController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0 && v6)
  {
    uint64_t v11 = [(AASignInFlowController *)self delegate];
    [v11 signInFlowController:self saveAccount:v12 withAllDataclassesEnabledIfPossibleWithCompletion:v8];
  }
  else
  {
    [(AASignInFlowController *)self _onqueue_saveAccount:v12 withDataclassEnablement:v6 completion:v8];
  }
}

- (void)_onqueue_delegate_enableFindMyWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AASignInFlowController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AASignInFlowController *)self delegate];
    unint64_t v8 = [(AASignInFlowController *)self _findMyActivationAction];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__AASignInFlowController__onqueue_delegate_enableFindMyWithCompletion___block_invoke;
    v10[3] = &unk_1E5A48C60;
    id v11 = v4;
    [v7 signInFlowController:self enableFindMyWithAction:v8 completion:v10];
  }
  else
  {
    char v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AASignInFlowController _onqueue_delegate_enableFindMyWithCompletion:](self, v9);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __71__AASignInFlowController__onqueue_delegate_enableFindMyWithCompletion___block_invoke(uint64_t a1)
{
  int v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__AASignInFlowController__onqueue_delegate_enableFindMyWithCompletion___block_invoke_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_nameForCloudService
{
  int v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  uint64_t v3 = [v2 localizedStringForKey:@"SERVICE_TYPE_ICLOUD" value:0 table:@"Localizable"];

  return v3;
}

- (id)_titleForSignInFailureAlert
{
  int v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  uint64_t v3 = [v2 localizedStringForKey:@"SIGN_IN_ERROR_TITLE" value:0 table:@"Localizable"];

  return v3;
}

- (id)_titleForVerificationFailureAlert
{
  int v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  uint64_t v3 = [v2 localizedStringForKey:@"VERIFICATION_FAILED_TITLE" value:0 table:@"Localizable"];

  return v3;
}

- (id)_aaErrorForErrorCode:(int64_t)a3
{
  return [(AASignInFlowController *)self _aaErrorForErrorCode:a3 withUnderlyingError:0];
}

- (id)_aaErrorForErrorCode:(int64_t)a3 withUnderlyingError:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v8 = [(AASignInFlowController *)self _aaMessageForErrorCode:a3];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  char v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AASignInErrors" code:a3 userInfo:v7];

  return v9;
}

- (id)_aaMessageForErrorCode:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v6 = [v5 localizedStringForKey:@"UNABLE_TO_VALIDATE" value:0 table:@"Localizable"];

  if ([(AASignInFlowController *)self _isDuplicateAccountError:a3])
  {
    id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v8 = [v7 localizedStringForKey:@"ALREADY_EXISTING_ACCOUNT_DESC" value:0 table:@"Localizable"];

    id v6 = (void *)v8;
  }

  return v6;
}

- (BOOL)_isDuplicateAccountError:(int64_t)a3
{
  return ((unint64_t)(a3 + 8012) < 0xB) & (0x403u >> (a3 + 76));
}

- (BOOL)_delegateWantsToSkipDataclassEnablement
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AASignInFlowController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(AASignInFlowController *)self delegate];
    int v6 = [v5 skipDataclassEnablement];

    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = @"NO";
      if (v6) {
        uint64_t v8 = @"YES";
      }
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Delegate wants to skip dataclass enablement: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_delegateWantsToBackgroundDataclassEnablement
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AASignInFlowController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(AASignInFlowController *)self delegate];
    int v6 = [v5 backgroundDataclassEnablement];

    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = @"NO";
      if (v6) {
        uint64_t v8 = @"YES";
      }
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Delegate wants to background dataclass enablement: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_delegateRequiresTerms
{
  uint64_t v3 = [(AASignInFlowController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(AASignInFlowController *)self delegate];
  int v6 = [v5 requiredTerms];
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (unint64_t)_findMyActivationAction
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AASignInFlowController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(AASignInFlowController *)self delegate];
  unint64_t v6 = [v5 findMyActivationAction];

  if (v6)
  {
    BOOL v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      unint64_t v10 = v6;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Delegate provided custom activation action: %lu", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

- (BOOL)_shouldEnableDataclassesForAccount:(id)a3
{
  id v4 = a3;
  if ([(AASignInFlowController *)self _delegateWantsToSkipDataclassEnablement]|| self->_existingAccount && ![(AASignInFlowController *)self _newSignInReauth])
  {
    char v5 = 0;
  }
  else
  {
    char v5 = objc_msgSend(v4, "aa_isPrimaryEmailVerified");
  }

  return v5;
}

- (BOOL)_newSignInReauth
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AASignInFlowController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(AASignInFlowController *)self delegate];
    int v6 = [v5 newSignInReauth];

    BOOL v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = @"NO";
      if (v6) {
        uint64_t v8 = @"YES";
      }
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Delegate indicates new sign in reauth: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)_shouldStashLoginResponse
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AASignInFlowController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(AASignInFlowController *)self delegate];
    int v6 = [v5 shouldStashLoginResponse];

    BOOL v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = @"NO";
      if (v6) {
        uint64_t v8 = @"YES";
      }
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "Delegate wants to stash login response: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_stashLoginResponseWithAuthenticationResults:(id)a3 appleAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AASignInFlowController *)self _shouldStashLoginResponse])
  {
    utilityQueue = self->_utilityQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __84__AASignInFlowController__stashLoginResponseWithAuthenticationResults_appleAccount___block_invoke;
    v11[3] = &unk_1E5A488A8;
    id v12 = v7;
    id v13 = v6;
    int v9 = utilityQueue;
    dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_DEFAULT, 0, v11);
    dispatch_async(v9, v10);
  }
}

void __84__AASignInFlowController__stashLoginResponseWithAuthenticationResults_appleAccount___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = _AASignpostLogSystem();
  os_signpost_id_t v3 = _AASignpostCreate(v2);
  uint64_t v5 = v4;

  id v6 = _AASignpostLogSystem();
  id v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "StashLoginResponse", " enableTelemetry=YES ", (uint8_t *)&v16, 2u);
  }

  uint64_t v8 = _AASignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134217984;
    os_signpost_id_t v17 = v3;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StashLoginResponse  enableTelemetry=YES ", (uint8_t *)&v16, 0xCu);
  }

  int v9 = objc_msgSend(*(id *)(a1 + 32), "aa_cloudKitAccount");
  dispatch_block_t v10 = [v9 credential];
  uint64_t v11 = [v10 token];

  +[AALoginContextManager stashLoginResponseWithAuthenticationResults:*(void *)(a1 + 40) cloudKitToken:v11];
  unint64_t Nanoseconds = _AASignpostGetNanoseconds(v3, v5);
  id v13 = _AASignpostLogSystem();
  id v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A11D8000, v14, OS_SIGNPOST_INTERVAL_END, v3, "StashLoginResponse", (const char *)&unk_1A12BB323, (uint8_t *)&v16, 2u);
  }

  id v15 = _AASignpostLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218240;
    os_signpost_id_t v17 = v3;
    __int16 v18 = 2048;
    double v19 = (double)Nanoseconds / 1000000000.0;
    _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StashLoginResponse ", (uint8_t *)&v16, 0x16u);
  }
}

- (id)_userPersonaUniqueString
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB3700]);
  if (([v2 isEnterprisePersona] & 1) != 0 || objc_msgSend(v2, "isGuestPersona"))
  {
    os_signpost_id_t v3 = [v2 userPersonaUniqueString];
    uint64_t v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(AASignInFlowController *)(uint64_t)v3 _userPersonaUniqueString];
    }
  }
  else
  {
    uint64_t v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[AASignInFlowController _userPersonaUniqueString]();
    }
    os_signpost_id_t v3 = 0;
  }

  return v3;
}

- (void)prewarmOperationsWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[AARemoteServer sharedServer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke;
  v6[3] = &unk_1E5A4A990;
  id v7 = v3;
  id v5 = v3;
  [v4 configurationWithCompletion:v6];
}

void __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [@"PREWARM" dataUsingEncoding:4];
  id v5 = dispatch_group_create();
  id v6 = [v3 absintheEnable];

  if ([v6 unsignedIntegerValue] == 1)
  {
    dispatch_group_enter(v5);
    id v7 = +[AAAbsintheSigner sharedSigner];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke_2;
    v10[3] = &unk_1E5A4A968;
    uint64_t v11 = v5;
    [v7 signatureForData:v4 completion:v10];
  }
  if (*(void *)(a1 + 32))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke_3;
    v8[3] = &unk_1E5A48448;
    id v9 = *(id *)(a1 + 32);
    dispatch_group_notify(v5, MEMORY[0x1E4F14428], v8);
  }
}

void __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke_2(uint64_t a1)
{
}

uint64_t __58__AASignInFlowController_prewarmOperationsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AASignInFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AASignInFlowControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CDPStateUIProvider)cdpUIProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cdpUIProvider);

  return (CDPStateUIProvider *)WeakRetained;
}

- (void)setCdpUIProvider:(id)a3
{
}

- (BOOL)shouldAutomaticallySaveSignInResults
{
  return self->_shouldAutomaticallySaveSignInResults;
}

- (void)setShouldAutomaticallySaveSignInResults:(BOOL)a3
{
  self->_shouldAutomaticallySaveSignInResults = a3;
}

- (BOOL)existingAccount
{
  return self->_existingAccount;
}

- (void)setExistingAccount:(BOOL)a3
{
  self->_existingAccount = a3;
}

- (BOOL)ignoreLockAssertErrors
{
  return self->_ignoreLockAssertErrors;
}

- (void)setIgnoreLockAssertErrors:(BOOL)a3
{
  self->_ignoreLockAssertErrors = a3;
}

- (CUMessageSession)messageSession
{
  return self->_messageSession;
}

- (void)setMessageSession:(id)a3
{
}

- (NSMutableDictionary)telemetryTimeSeries
{
  return self->_telemetryTimeSeries;
}

- (void)setTelemetryTimeSeries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryTimeSeries, 0);
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_destroyWeak((id *)&self->_cdpUIProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uiQueue, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_authResults, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)signInWithIDMSAuthenticationResults:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1A11D8000, v0, OS_LOG_TYPE_FAULT, "CloudService sign in was called with a nil completion. This should should never happen.", v1, 2u);
}

void __82__AASignInFlowController__onqueue_signInWithIDMSAuthenticationResults_completion___block_invoke_46_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_1A11D8000, v0, OS_LOG_TYPE_DEBUG, "Delegate presented progress view: %@", v1, 0xCu);
}

- (void)_onqueue_prepareExistingAppleAccountForSignIn:withAuthResults:accountCreationError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AASignInFlowController: cannot promote existing data separated account %@.", v2, v3, v4, v5, v6);
}

- (void)_onqueue_createNewAppleAccountWithAuthResults:accountCreationError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "AASignInFlowController: Having multiple full accounts is not a supported configuration.", v2, v3, v4, v5, v6);
}

- (void)_onqueue_updateAppleAccount:withAuthenticationResults:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "Updated Apple account (%@) with temporary last name from IdMS results (%@)");
}

- (void)_onqueue_updateAppleAccount:withAuthenticationResults:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "Updated Apple account (%@) with temporary first name from IdMS results (%@)");
}

- (void)_onqueue_saveTermsWithAuthResults:account:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "Auth results contained terms info.", v2, v3, v4, v5, v6);
}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Nil response cannot be cached, immediately continuing sign in", v2, v3, v4, v5, v6);
}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_68_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_ERROR, "Failed to cache login response (%@) for account (%@) with error: %@", v4, 0x20u);
}

void __101__AASignInFlowController__onqueue_registerAndVerifyLoginForiCloudAccount_authResults_withCompletion___block_invoke_71_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "LoginAndUpdateiCloudAccount completed retry.", v2, v3, v4, v5, v6);
}

void __116__AASignInFlowController__onqueue_verifyLoginResponseForiCloudAccount_withAuthResults_withSuccess_error_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Validating iCDP failed with error %@! Blocking iCloud sign-in...", v2, v3, v4, v5, v6);
}

void __98__AASignInFlowController__onqueue_validateAndEnrollCDPStateForAccount_withAuthResults_completion___block_invoke_93_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "PreflightSave completed retry.", v2, v3, v4, v5, v6);
}

void __79__AASignInFlowController__preflightSaveWithAuthResults_account_withCompletion___block_invoke_94_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "AASignInFlowController: Skipping iCDP state machine because we failed to create a CDPContext.", v2, v3, v4, v5, v6);
}

- (void)_onqueue_addKeysAndEnrollCDPStateForAccount:(uint64_t)a1 withCDPContext:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 16) allKeys];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "Looking for custodian sessionID in authentication results: %{private}@", v4, 0xCu);
}

void __96__AASignInFlowController__onqueue_addKeysAndEnrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "Failed to fetch Custodian recovery keys with error: %@, continuing with regular CDP Flows", v2, v3, v4, v5, v6);
}

- (void)_onqueue_enrollCDPStateForAccount:withCDPContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "No CDPUI provider, this may not go well.", v2, v3, v4, v5, v6);
}

void __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "CDPContext (%@) is providing specialized time series: %@");
}

void __86__AASignInFlowController__onqueue_enrollCDPStateForAccount_withCDPContext_completion___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_1A11D8000, v0, OS_LOG_TYPE_DEBUG, "CDPContext (%@) does not respond to 'telemetryTimeSeries' selector (SDK mismatch)", v1, 0xCu);
}

- (void)_onqueue_saveAccount:withAuthResults:withCDPEnablement:withAllDataclassesEnabledIfPossibleWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Attempt to save account while another save is mid-flight!", v2, v3, v4, v5, v6);
}

void __75__AASignInFlowController__delegate_presentAccountCreationError_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AASignInFlowController: Sign in - account creation failed, didShowAlert: %@", v2, v3, v4, v5, v6);
}

- (void)_delegate_presentGenericTermsUIforAccount:authResults:serverError:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "AASignInFlowController: Failing sign in as account needs terms and we are unable to display UI", v2, v3, v4, v5, v6);
}

void __89__AASignInFlowController__delegate_presentValidationAlertForError_forAccount_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AASignInFlowController: Sign in - validation failed, didShowAlert: %@", v2, v3, v4, v5, v6);
}

- (void)_delegate_presentProgressViewForAccount:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "AASignInFlowController: Requesting delegate (%@) to present progress view for account (%@)");
}

- (void)_delegate_presentProgressViewForAccount:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AASignInFlowController: Delegate (%@) does not respond to selector 'signInFlowController:presentProgressViewForAccount:completion:'", v2, v3, v4, v5, v6);
}

- (void)_delegate_presentProgressViewForAccount:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "AASignInFlowController: AppleAccountUI/AppleIDSignInProgress=false, skipping delegate call", v2, v3, v4, v5, v6);
}

- (void)_onqueue_delegate_enableFindMyWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 delegate];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "AASignInFlowController: Delegate (%@) does not respond to selector, FindMy enable failed.", v4, 0xCu);
}

void __71__AASignInFlowController__onqueue_delegate_enableFindMyWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1(&dword_1A11D8000, v0, v1, "AASignInFlowController: User completed FindMy activation with result: %@", v2, v3, v4, v5, v6);
}

- (void)_userPersonaUniqueString
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "We're not running in data separated Persona.", v2, v3, v4, v5, v6);
}

@end