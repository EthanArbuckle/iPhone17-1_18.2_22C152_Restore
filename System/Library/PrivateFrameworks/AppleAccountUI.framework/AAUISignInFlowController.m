@interface AAUISignInFlowController
- (AAUISignInFlowController)init;
- (BOOL)ignoreLockAssertErrors;
- (BOOL)shouldAutomaticallySaveSignInResults;
- (BOOL)shouldHideActivationLockAlert;
- (BOOL)shouldStashLoginResponse;
- (CUMessageSession)messageSession;
- (UIViewController)presentingViewController;
- (id)_appleAccountType;
- (id)_messageForErrorAlert:(int64_t)a3;
- (id)_titleForError:(id)a3 account:(id)a4;
- (unint64_t)activationAction;
- (void)_hasActivationLockSupportedWatchWithCompletion:(id)a3;
- (void)_presentExistingAccountAlert:(id)a3;
- (void)_presentUnableToSaveAccountAlert;
- (void)_presentValidationErrorAlert:(id)a3 forAccount:(id)a4 completion:(id)a5;
- (void)_promptToEnableFindMyIfPossibleWithAccount:(id)a3 completion:(id)a4;
- (void)_saveAccount:(id)a3 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a4;
- (void)_showGenericTermsUIforAccount:(id)a3 completion:(id)a4;
- (void)_stashLoginResponseWithAuthenticationResults:(id)a3 completion:(id)a4;
- (void)_updateAppleAccountIfNecessary:(id)a3 withAltDSID:(id)a4 rawPassword:(id)a5;
- (void)_validateCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5;
- (void)_verifyLoginResponseForiCloudAccount:(id)a3 withSuccess:(BOOL)a4 response:(id)a5 error:(id)a6 completion:(id)a7;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)prewarmOperationsWithCompletion:(id)a3;
- (void)setActivationAction:(unint64_t)a3;
- (void)setIgnoreLockAssertErrors:(BOOL)a3;
- (void)setMessageSession:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setShouldAutomaticallySaveSignInResults:(BOOL)a3;
- (void)setShouldHideActivationLockAlert:(BOOL)a3;
- (void)setShouldStashLoginResponse:(BOOL)a3;
- (void)signInOperationManager:(id)a3 didSaveAccount:(id)a4 error:(id)a5;
- (void)signInWithIDMSAuthenticationResults:(id)a3 completion:(id)a4;
@end

@implementation AAUISignInFlowController

- (AAUISignInFlowController)init
{
  v10.receiver = self;
  v10.super_class = (Class)AAUISignInFlowController;
  v2 = [(AAUISignInFlowController *)&v10 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cdpContextsByAccountID = v2->_cdpContextsByAccountID;
    v2->_cdpContextsByAccountID = v5;

    v7 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    cdpContextsByAccountIDLock = v2->_cdpContextsByAccountIDLock;
    v2->_cdpContextsByAccountIDLock = v7;
  }
  return v2;
}

- (BOOL)shouldHideActivationLockAlert
{
  return [(AAUISignInFlowController *)self activationAction] != 0;
}

- (void)setShouldHideActivationLockAlert:(BOOL)a3
{
}

- (void)signInWithIDMSAuthenticationResults:(id)a3 completion:(id)a4
{
  v104[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v69 = _os_activity_create(&dword_209754000, "appleaccountui/signin-with-IDMSauthresults", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v69, &state);
  id v72 = objc_alloc_init(MEMORY[0x263F841B8]);
  if ([v72 isEnterprisePersona])
  {
    uint64_t v8 = [v72 userPersonaUniqueString];
    v9 = _AAUILogSystem();
    v75 = (void *)v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AAUISignInFlowController signInWithIDMSAuthenticationResults:completion:](v8, v9);
    }
  }
  else
  {
    v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AAUISignInFlowController signInWithIDMSAuthenticationResults:completion:].cold.4();
    }
    v75 = 0;
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke;
  aBlock[3] = &unk_263F93088;
  id v67 = v7;
  id v89 = v67;
  v76 = _Block_copy(aBlock);
  v74 = [v6 objectForKeyedSubscript:*MEMORY[0x263F29010]];
  v68 = [v6 objectForKeyedSubscript:*MEMORY[0x263F28F80]];
  uint64_t v10 = [v68 stringValue];
  v73 = [v6 objectForKeyedSubscript:*MEMORY[0x263F28F58]];
  v71 = [v6 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
  v77 = [v6 objectForKeyedSubscript:*MEMORY[0x263F28FF8]];
  v78 = (void *)v10;
  v11 = _AAUISignpostLogSystem();
  os_signpost_id_t v12 = _AAUISignpostCreate(v11);
  uint64_t v70 = v13;
  os_signpost_id_t v14 = v12;

  v15 = _AAUISignpostLogSystem();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209754000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "GetLocalAppleAccount", " enableTelemetry=YES ", buf, 2u);
  }

  v17 = _AAUISignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v92 = v14;
    _os_log_impl(&dword_209754000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GetLocalAppleAccount  enableTelemetry=YES ", buf, 0xCu);
  }

  if (v78)
  {
    v18 = -[ACAccountStore aa_appleAccountWithPersonID:](self->_accountStore, "aa_appleAccountWithPersonID:");
  }
  else
  {
    v18 = 0;
  }
  int AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x263F25B80], (CFStringRef)*MEMORY[0x263F256E0], 0);
  v20 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];

  v21 = [(ACAccountStore *)self->_accountStore aa_dataSeparatedAccounts];
  uint64_t v22 = [v21 count];

  if (v18)
  {
    v23 = _AAUILogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v92 = (os_signpost_id_t)v78;
      _os_log_impl(&dword_209754000, v23, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: found an existing account with DSID %@.", buf, 0xCu);
    }

    [(AAUISignInFlowController *)self _updateAppleAccountIfNecessary:v18 withAltDSID:v73 rawPassword:v77];
    if (v20)
    {
      v24 = _AAUILogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v92 = (os_signpost_id_t)v18;
        _os_log_impl(&dword_209754000, v24, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: cannot promote existing account %@.", buf, 0xCu);
      }

      v25 = [(AAUISignInFlowController *)self _messageForErrorAlert:-9002];
      v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v103 = *MEMORY[0x263F08320];
      v104[0] = v25;
      v27 = [NSDictionary dictionaryWithObjects:v104 forKeys:&v103 count:1];
      uint64_t v28 = [v26 errorWithDomain:@"AAUISignInErrors" code:-9002 userInfo:v27];
    }
    else
    {
      if (!v75)
      {
        v25 = [v18 objectForKeyedSubscript:*MEMORY[0x263EFADE0]];
        if (!v25
          || ([MEMORY[0x263F25908] findEnterprisePersonaIdentifier],
              v59 = objc_claimAutoreleasedReturnValue(),
              int v60 = [v25 isEqualToString:v59],
              v59,
              !v60))
        {
          v66 = _AAUILogSystem();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            os_signpost_id_t v92 = (os_signpost_id_t)v18;
            _os_log_impl(&dword_209754000, v66, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: promoting existing account %@ to primary.", buf, 0xCu);
          }

          objc_msgSend(v18, "aa_setAccountClass:", *MEMORY[0x263F25618]);
          [v18 setAccountDescription:@"iCloud"];
          v39 = 0;
          goto LABEL_39;
        }
        v61 = _AAUILogSystem();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          os_signpost_id_t v92 = (os_signpost_id_t)v18;
          _os_log_impl(&dword_209754000, v61, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: cannot promote existing data separated account %@.", buf, 0xCu);
        }

        v27 = [(AAUISignInFlowController *)self _messageForErrorAlert:-9011];
        v62 = (void *)MEMORY[0x263F087E8];
        uint64_t v99 = *MEMORY[0x263F08320];
        v100 = v27;
        v63 = [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
        v39 = [v62 errorWithDomain:@"AAUISignInErrors" code:-9011 userInfo:v63];

LABEL_38:
LABEL_39:

        goto LABEL_40;
      }
      v35 = _AAUILogSystem();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v92 = (os_signpost_id_t)v78;
        _os_log_impl(&dword_209754000, v35, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: found an existing account with DSID %@, but we're running in the enterprise persona.", buf, 0xCu);
      }

      v25 = [(AAUISignInFlowController *)self _messageForErrorAlert:-9010];
      v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v101 = *MEMORY[0x263F08320];
      v102 = v25;
      v27 = [NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      uint64_t v28 = [v36 errorWithDomain:@"AAUISignInErrors" code:-9010 userInfo:v27];
    }
LABEL_37:
    v39 = (void *)v28;
    goto LABEL_38;
  }
  v29 = _AAUILogSystem();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v92 = (os_signpost_id_t)v74;
    _os_log_impl(&dword_209754000, v29, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: will sign in new iCloud account for %@.", buf, 0xCu);
  }

  id v30 = objc_alloc(MEMORY[0x263EFB1F8]);
  v31 = [(AAUISignInFlowController *)self _appleAccountType];
  v18 = (void *)[v30 initWithAccountType:v31];

  [v18 setUsername:v74];
  v32 = [NSString stringWithFormat:@"%@", v78];
  [v18 setAccountProperty:v32 forKey:@"personID"];
  BOOL v33 = v22 == 0;

  if (v75) {
    char v34 = v33;
  }
  else {
    char v34 = 1;
  }
  if (!(v34 & 1 | (AppBooleanValue != 0)))
  {
    v37 = _AAUILogSystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[AAUISignInFlowController signInWithIDMSAuthenticationResults:completion:]();
    }

    v25 = [(AAUISignInFlowController *)self _messageForErrorAlert:-9012];
    v38 = (void *)MEMORY[0x263F087E8];
    uint64_t v97 = *MEMORY[0x263F08320];
    v98 = v25;
    v27 = [NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
    uint64_t v28 = [v38 errorWithDomain:@"AAUISignInErrors" code:-9012 userInfo:v27];
    goto LABEL_37;
  }
  if (v75)
  {
    [v18 setAccountDescription:v74];
    objc_msgSend(v18, "aa_setAccountClass:", *MEMORY[0x263F25610]);
    [v18 setObject:v75 forKeyedSubscript:*MEMORY[0x263EFADE0]];
  }
  else
  {
    if (v20)
    {
      [v18 setAccountDescription:v74];
      if (AppBooleanValue)
      {
        v64 = _AAUILogSystem();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
          -[AAUISignInFlowController signInWithIDMSAuthenticationResults:completion:]();
        }

        v65 = (void *)MEMORY[0x263F25610];
      }
      else
      {
        v65 = (void *)MEMORY[0x263F25608];
      }
    }
    else
    {
      [v18 setAccountDescription:@"iCloud"];
      v65 = (void *)MEMORY[0x263F25618];
    }
    objc_msgSend(v18, "aa_setAccountClass:", *v65);
  }
  v39 = 0;
LABEL_40:
  unint64_t Nanoseconds = _AAUISignpostGetNanoseconds(v14, v70);
  v41 = _AAUISignpostLogSystem();
  v42 = v41;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    int v43 = [v39 code];
    *(_DWORD *)buf = 67240192;
    LODWORD(v92) = v43;
    _os_signpost_emit_with_name_impl(&dword_209754000, v42, OS_SIGNPOST_INTERVAL_END, v14, "GetLocalAppleAccount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 8u);
  }

  v44 = _AAUISignpostLogSystem();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = [v39 code];
    *(_DWORD *)buf = 134218496;
    os_signpost_id_t v92 = v14;
    __int16 v93 = 2048;
    double v94 = (double)Nanoseconds / 1000000000.0;
    __int16 v95 = 1026;
    int v96 = v45;
    _os_log_impl(&dword_209754000, v44, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GetLocalAppleAccount  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x1Cu);
  }

  if (v39)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_67;
    block[3] = &unk_263F92DA0;
    block[4] = self;
    id v86 = v39;
    id v87 = v76;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v46 = [MEMORY[0x263EFB200] credentialWithPassword:v71];
    [v18 setCredential:v46];
    objc_msgSend(v18, "_aa_setRawPassword:", v77);
    if (objc_msgSend(v18, "aa_isAccountClass:", *MEMORY[0x263F25618]))
    {
      v47 = +[AAUICDPHelper cdpContextForPrimaryAccountWithAuthenticationResults:v6];
      v48 = [(AAUISignInFlowController *)self messageSession];
      [v47 setSharingChannel:v48];

      [v47 set_ignoreLockAssertErrors:[(AAUISignInFlowController *)self ignoreLockAssertErrors]];
      [(NSLock *)self->_cdpContextsByAccountIDLock lock];
      cdpContextsByAccountID = self->_cdpContextsByAccountID;
      v50 = [v18 identifier];
      [(NSMutableDictionary *)cdpContextsByAccountID setObject:v47 forKeyedSubscript:v50];

      [(NSLock *)self->_cdpContextsByAccountIDLock unlock];
    }
    else
    {
      v47 = _AAUILogSystem();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v92 = (os_signpost_id_t)v18;
        _os_log_impl(&dword_209754000, v47, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: HSA 2 account %@ is secondary, so no iCDP checks will be made.", buf, 0xCu);
      }
    }

    v51 = _AAUISignpostLogSystem();
    os_signpost_id_t v52 = _AAUISignpostCreate(v51);
    uint64_t v54 = v53;

    v55 = _AAUISignpostLogSystem();
    v56 = v55;
    if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209754000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v52, "SignInRegisterAccount", " enableTelemetry=YES ", buf, 2u);
    }

    v57 = _AAUISignpostLogSystem();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v92 = v52;
      _os_log_impl(&dword_209754000, v57, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInRegisterAccount  enableTelemetry=YES ", buf, 0xCu);
    }

    accountStore = self->_accountStore;
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_72;
    v79[3] = &unk_263F93128;
    os_signpost_id_t v83 = v52;
    uint64_t v84 = v54;
    v79[4] = self;
    id v80 = v18;
    id v82 = v76;
    id v81 = v6;
    [(ACAccountStore *)accountStore aa_registerAppleAccount:v80 withCompletion:v79];
  }
  os_activity_scope_leave(&state);
}

uint64_t __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_67(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    [*(id *)(a1 + 32) _presentExistingAccountAlert:*(void *)(a1 + 40)];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

void __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_72(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t Nanoseconds = _AAUISignpostGetNanoseconds(*(void *)(a1 + 64), *(void *)(a1 + 72));
  id v7 = _AAUISignpostLogSystem();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v23 = a2;
    *(_WORD *)&v23[4] = 1026;
    *(_DWORD *)&v23[6] = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_209754000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SignInRegisterAccount", " Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }

  uint64_t v10 = _AAUISignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = *(void *)(a1 + 64);
    int v13 = [v5 code];
    *(_DWORD *)buf = 134218752;
    *(void *)v23 = v12;
    *(_WORD *)&v23[8] = 2048;
    double v24 = v11;
    __int16 v25 = 1026;
    int v26 = a2;
    __int16 v27 = 1026;
    int v28 = v13;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInRegisterAccount  Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  os_signpost_id_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_73;
  v18[3] = &unk_263F93100;
  id v16 = *(id *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 32);
  id v21 = v16;
  v18[4] = v17;
  id v19 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 40);
  [v14 _verifyLoginResponseForiCloudAccount:v15 withSuccess:a2 response:0 error:v5 completion:v18];
}

void __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_73(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    os_signpost_id_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_2;
    v11[3] = &unk_263F930D8;
    v11[4] = v9;
    id v12 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    char v16 = 1;
    id v13 = v7;
    id v14 = v8;
    [v9 _stashLoginResponseWithAuthenticationResults:v10 completion:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_2(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Successfully authenticated account, attempting to enable FindMy if possible...", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_74;
  v5[3] = &unk_263F930B0;
  id v8 = *(id *)(a1 + 64);
  char v9 = *(unsigned char *)(a1 + 72);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _promptToEnableFindMyIfPossibleWithAccount:v4 completion:v5];
}

uint64_t __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_74(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"NO";
    if (a2) {
      id v5 = @"YES";
    }
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Result of enabling FindMy, didPrompt: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_updateAppleAccountIfNecessary:(id)a3 withAltDSID:(id)a4 rawPassword:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Checking to see if we should update altDSID on iCloud account %@", (uint8_t *)&v17, 0xCu);
  }

  if ([v9 length])
  {
    id v12 = objc_msgSend(v8, "aa_altDSID");
    uint64_t v13 = [v12 length];

    id v14 = _AAUILogSystem();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "iCloud account already has altDSID, ignoring...", (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      if (v15)
      {
        int v17 = 138412290;
        id v18 = v9;
        _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "Updating iCloud account with altDSID: %@", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(v8, "_aa_setAltDSID:", v9);
      objc_msgSend(v8, "_aa_setRawPassword:", v10);
      [(ACAccountStore *)self->_accountStore saveVerifiedAccount:v8 withCompletionHandler:0];
    }
  }
  else
  {
    char v16 = _AAUILogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "No altDSID provided, nothing to do...", (uint8_t *)&v17, 2u);
    }
  }
}

- (void)_verifyLoginResponseForiCloudAccount:(id)a3 withSuccess:(BOOL)a4 response:(id)a5 error:(id)a6 completion:(id)a7
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  if (!a4)
  {
    v23 = [v12 userInfo];
    uint64_t v19 = [v23 objectForKey:*MEMORY[0x263F25B18]];

    double v24 = _AAUILogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v19;
      _os_log_impl(&dword_209754000, v24, OS_LOG_TYPE_DEFAULT, "Account is not valid: handling error %@", buf, 0xCu);
    }

    if ([v19 isEqualToString:*MEMORY[0x263F25B38]])
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke;
      block[3] = &unk_263F92DA0;
      block[4] = self;
      __int16 v25 = &v36;
      id v36 = v11;
      int v26 = &v37;
      id v37 = v13;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_2;
      v31[3] = &unk_263F927F8;
      v31[4] = self;
      __int16 v25 = &v32;
      id v32 = v12;
      int v26 = &v33;
      id v33 = v11;
      id v34 = v13;
      dispatch_async(MEMORY[0x263EF83A0], v31);
    }
    uint64_t v22 = *v25;
    goto LABEL_18;
  }
  id v14 = _AAUILogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "Account is valid: finish account setup", buf, 2u);
  }

  BOOL v15 = objc_msgSend(v11, "aa_password");

  if (v15)
  {
    char v16 = _AAUILogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "We have a password, setAuthenticated to NO and grab delegate tokens", buf, 2u);
    }

    [v11 setAuthenticated:0];
  }
  [(NSLock *)self->_cdpContextsByAccountIDLock lock];
  cdpContextsByAccountID = self->_cdpContextsByAccountID;
  id v18 = [v11 identifier];
  uint64_t v19 = [(NSMutableDictionary *)cdpContextsByAccountID objectForKeyedSubscript:v18];

  [(NSLock *)self->_cdpContextsByAccountIDLock unlock];
  id v20 = _AAUILogSystem();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v20, OS_LOG_TYPE_DEFAULT, "Finished auth'ing account and must validate iCDP state.", buf, 2u);
    }

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_83;
    v27[3] = &unk_263F93150;
    id v28 = v11;
    uint64_t v29 = self;
    id v30 = v13;
    [(AAUISignInFlowController *)self _validateCDPStateForAccount:v28 withCDPContext:v19 completion:v27];

    uint64_t v22 = v28;
LABEL_18:

    goto LABEL_19;
  }
  if (v21)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v20, OS_LOG_TYPE_DEFAULT, "Finished auth'ing without a queued CDP context. No need to validate iCDP state.", buf, 2u);
  }

  [(AAUISignInFlowController *)self _saveAccount:v11 withAllDataclassesEnabledIfPossibleWithCompletion:v13];
LABEL_19:
}

uint64_t __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showGenericTermsUIforAccount:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentValidationErrorAlert:*(void *)(a1 + 40) forAccount:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_83(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) refresh];
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Validating iCDP succeeded! Proceeding with iCloud sign-in...", buf, 2u);
    }

    [*(id *)(a1 + 40) _saveAccount:*(void *)(a1 + 32) withAllDataclassesEnabledIfPossibleWithCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    int v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_83_cold_1((uint64_t)v5, v7);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_84;
    block[3] = &unk_263F92DA0;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(void **)(a1 + 48);
    id v12 = v8;
    uint64_t v13 = v9;
    id v14 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_84(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldDisplayToUser])
  {
    v2 = [*(id *)(a1 + 32) userInfo];
    v3 = [v2 objectForKey:*MEMORY[0x263F08320]];

    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 32) userInfo];
      id v5 = [v4 objectForKey:*MEMORY[0x263F08338]];
    }
    else
    {
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v3 = [v4 localizedStringForKey:@"VERIFICATION_FAILED_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
      id v5 = 0;
    }

    int v7 = [MEMORY[0x263F82418] alertWithTitle:v3 message:v5];
    id v8 = (void *)MEMORY[0x263F82400];
    uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];
    id v11 = [v8 actionWithTitle:v10 style:1 handler:0];
    [v7 addAction:v11];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_2_97;
    v13[3] = &unk_263F92070;
    id v15 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 32);
    [WeakRetained presentViewController:v7 animated:1 completion:v13];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

uint64_t __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_2_97(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)_validateCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = (objc_class *)MEMORY[0x263F343F0];
  id v11 = a4;
  id v12 = (void *)[[v10 alloc] initWithContext:v11];

  id v13 = objc_alloc(MEMORY[0x263F34A10]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  id v15 = (void *)[v13 initWithPresentingViewController:WeakRetained];

  id v16 = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_opt_class();
  LOBYTE(WeakRetained) = objc_opt_isKindOfClass();

  if (WeakRetained) {
    [v15 setForceInlinePresentation:1];
  }
  [v12 setUiProvider:v15];
  id v17 = v8;
  id v18 = v17;
  uint64_t v19 = v17;
  if (!self->_shouldAutomaticallySaveSignInResults)
  {
    uint64_t v19 = (void *)[v17 copy];

    [(ACAccountStore *)self->_accountStore setNotificationsEnabled:0];
  }
  [v19 setEnabled:1 forDataclass:*MEMORY[0x263EFB428]];
  [v19 setEnabled:1 forDataclass:*MEMORY[0x263EFB430]];
  [v19 setEnabled:1 forDataclass:*MEMORY[0x263EFB400]];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke;
  aBlock[3] = &unk_263F93178;
  void aBlock[4] = self;
  id v41 = v9;
  id v20 = v9;
  BOOL v21 = _Block_copy(aBlock);
  uint64_t v22 = _AAUISignpostLogSystem();
  os_signpost_id_t v23 = _AAUISignpostCreate(v22);
  uint64_t v25 = v24;

  int v26 = _AAUISignpostLogSystem();
  __int16 v27 = v26;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_209754000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v23, "SignInPreflightSave", " enableTelemetry=YES ", buf, 2u);
  }

  id v28 = _AAUISignpostLogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v43 = v23;
    _os_log_impl(&dword_209754000, v28, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInPreflightSave  enableTelemetry=YES ", buf, 0xCu);
  }

  accountStore = self->_accountStore;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_101;
  v33[3] = &unk_263F931F0;
  os_signpost_id_t v38 = v23;
  uint64_t v39 = v25;
  id v34 = v12;
  v35 = self;
  id v36 = v19;
  id v37 = v21;
  id v30 = v19;
  id v31 = v12;
  id v32 = v21;
  [(ACAccountStore *)accountStore saveAccount:v30 withCompletionHandler:v33];
}

void __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a3;
  [v4 setNotificationsEnabled:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_101(uint64_t a1, int a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t Nanoseconds = _AAUISignpostGetNanoseconds(*(void *)(a1 + 64), *(void *)(a1 + 72));
  int v7 = _AAUISignpostLogSystem();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)id v31 = a2;
    *(_WORD *)&v31[4] = 1026;
    *(_DWORD *)&v31[6] = [v5 code];
    _os_signpost_emit_with_name_impl(&dword_209754000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SignInPreflightSave", " DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }

  id v10 = _AAUISignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = (double)Nanoseconds / 1000000000.0;
    uint64_t v12 = *(void *)(a1 + 64);
    int v13 = [v5 code];
    *(_DWORD *)buf = 134218752;
    *(void *)id v31 = v12;
    *(_WORD *)&v31[8] = 2048;
    double v32 = v11;
    __int16 v33 = 1026;
    int v34 = a2;
    __int16 v35 = 1026;
    int v36 = v13;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInPreflightSave  DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  if (a2)
  {
    id v14 = _AAUISignpostLogSystem();
    os_signpost_id_t v15 = _AAUISignpostCreate(v14);
    uint64_t v17 = v16;

    id v18 = _AAUISignpostLogSystem();
    uint64_t v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209754000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SignInValidateCDP", " enableTelemetry=YES ", buf, 2u);
    }

    id v20 = _AAUISignpostLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)id v31 = v15;
      _os_log_impl(&dword_209754000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInValidateCDP  enableTelemetry=YES ", buf, 0xCu);
    }

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_102;
    v25[3] = &unk_263F931C8;
    os_signpost_id_t v28 = v15;
    uint64_t v29 = v17;
    BOOL v21 = *(void **)(a1 + 32);
    v25[4] = *(void *)(a1 + 40);
    id v27 = *(id *)(a1 + 56);
    id v26 = *(id *)(a1 + 48);
    [v21 handleCloudDataProtectionStateWithCompletion:v25];
  }
  else
  {
    uint64_t v22 = _AAUILogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v31 = v5;
      _os_log_impl(&dword_209754000, v22, OS_LOG_TYPE_DEFAULT, "iCDP preflighting failed because we could not save the iCloud account! Error: %@", buf, 0xCu);
    }

    uint64_t v23 = *(void *)(a1 + 56);
    uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:@"AAUISignInErrors" code:-9004 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);
  }
}

void __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_102(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a4;
  unint64_t Nanoseconds = _AAUISignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  os_signpost_id_t v9 = _AAUISignpostLogSystem();
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)id v26 = a3;
    *(_WORD *)&v26[4] = 1026;
    *(_DWORD *)&v26[6] = [v7 code];
    _os_signpost_emit_with_name_impl(&dword_209754000, v10, OS_SIGNPOST_INTERVAL_END, v11, "SignInValidateCDP", " Enabled=%{public,signpost.telemetry:number1,name=Enabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }

  uint64_t v12 = _AAUISignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (double)Nanoseconds / 1000000000.0;
    uint64_t v14 = *(void *)(a1 + 56);
    int v15 = [v7 code];
    *(_DWORD *)buf = 134218752;
    *(void *)id v26 = v14;
    *(_WORD *)&v26[8] = 2048;
    double v27 = v13;
    __int16 v28 = 1026;
    int v29 = a3;
    __int16 v30 = 1026;
    int v31 = v15;
    _os_log_impl(&dword_209754000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInValidateCDP  Enabled=%{public,signpost.telemetry:number1,name=Enabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  if (a2 && *(unsigned char *)(*(void *)(a1 + 32) + 56))
  {
    id v16 = v7;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v17 = v7;
    id v18 = _AAUILogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v18, OS_LOG_TYPE_DEFAULT, "Cleaning up temporary account state created during iCDP validation.", buf, 2u);
    }

    uint64_t v19 = *(void *)(a1 + 40);
    id v20 = *(void **)(*(void *)(a1 + 32) + 8);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_103;
    v21[3] = &unk_263F931A0;
    id v23 = *(id *)(a1 + 48);
    char v24 = a2;
    id v22 = v17;
    [v20 removeAccount:v19 withCompletionHandler:v21];
  }
}

void __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_103(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Failed to clean up after iCDP! Error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_saveAccount:(id)a3 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void, void))v7;
  if (self->_shouldAutomaticallySaveSignInResults)
  {
    if (self->_pendingCompletion)
    {
      uint64_t v9 = _AAUILogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AAUISignInFlowController _saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:]();
      }

      id v10 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -3);
      ((void (**)(void, void, void, void *))v8)[2](v8, 0, 0, v10);
    }
    else
    {
      os_signpost_id_t v11 = [(AAUISignInFlowController *)self presentingViewController];
      if (v11)
      {
        uint64_t v32 = 0;
        __int16 v33 = &v32;
        uint64_t v34 = 0x3032000000;
        __int16 v35 = __Block_byref_object_copy__7;
        int v36 = __Block_byref_object_dispose__7;
        uint64_t v37 = [[AAUISignInOperationManager alloc] initWithPresentingViewController:v11];
        [(id)v33[5] setDelegate:self];
        uint64_t v12 = _AAUISignpostLogSystem();
        double v13 = (char *)_AAUISignpostCreate(v12);
        int v15 = v14;

        id v16 = _AAUISignpostLogSystem();
        id v17 = v16;
        if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_209754000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v13, "SignInEnableDataclasses", " enableTelemetry=YES ", buf, 2u);
        }

        id v18 = _AAUISignpostLogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v39 = v13;
          _os_log_impl(&dword_209754000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInEnableDataclasses  enableTelemetry=YES ", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        uint64_t v24 = MEMORY[0x263EF8330];
        uint64_t v25 = 3221225472;
        id v26 = __91__AAUISignInFlowController__saveAccount_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke;
        double v27 = &unk_263F93218;
        v31[1] = v13;
        v31[2] = v15;
        int v29 = v8;
        id v19 = v6;
        id v28 = v19;
        objc_copyWeak(v31, (id *)buf);
        __int16 v30 = &v32;
        id v20 = _Block_copy(&v24);
        id pendingCompletion = self->_pendingCompletion;
        self->_id pendingCompletion = v20;

        objc_msgSend((id)v33[5], "signInAccount:enablingDataclasses:", v19, 1, v24, v25, v26, v27);
        objc_destroyWeak(v31);

        objc_destroyWeak((id *)buf);
        _Block_object_dispose(&v32, 8);
      }
      else
      {
        id v22 = _AAUILogSystem();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[AAUISignInFlowController _saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:]();
        }

        id v23 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -3);
        ((void (**)(void, void, void, void *))v8)[2](v8, 0, 0, v23);
      }
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, id, void))v7 + 2))(v7, 1, v6, 0);
  }
}

void __91__AAUISignInFlowController__saveAccount_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  unint64_t Nanoseconds = _AAUISignpostGetNanoseconds(*(void *)(a1 + 64), *(void *)(a1 + 72));
  id v8 = _AAUISignpostLogSystem();
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v22 = 67240448;
    *(_DWORD *)id v23 = a2;
    *(_WORD *)&v23[4] = 1026;
    *(_DWORD *)&v23[6] = [v6 code];
    _os_signpost_emit_with_name_impl(&dword_209754000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SignInEnableDataclasses", " DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0xEu);
  }

  os_signpost_id_t v11 = _AAUISignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (double)Nanoseconds / 1000000000.0;
    uint64_t v13 = *(void *)(a1 + 64);
    int v14 = [v6 code];
    int v22 = 134218752;
    *(void *)id v23 = v13;
    *(_WORD *)&v23[8] = 2048;
    double v24 = v12;
    __int16 v25 = 1026;
    int v26 = a2;
    __int16 v27 = 1026;
    int v28 = v14;
    _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInEnableDataclasses  DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0x22u);
  }

  int v15 = _AAUILogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = @"NO";
    if (a2) {
      id v16 = @"YES";
    }
    int v22 = 138412546;
    *(void *)id v23 = v16;
    *(_WORD *)&v23[8] = 2112;
    double v24 = *(double *)&v6;
    _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "iCloud account save completed with success: %@, error: %@", (uint8_t *)&v22, 0x16u);
  }

  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _presentUnableToSaveAccountAlert];
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = [MEMORY[0x263F087E8] errorWithDomain:@"AAUISignInErrors" code:-9004 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v18 + 16))(v18, 0, 0, v19);
  }
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = 0;
}

- (void)_stashLoginResponseWithAuthenticationResults:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_shouldStashLoginResponse)
  {
    os_signpost_id_t v38 = (void (**)(void))a4;
    id v7 = _AAUISignpostLogSystem();
    os_signpost_id_t v8 = _AAUISignpostCreate(v7);
    uint64_t v37 = v9;

    os_signpost_id_t v10 = _AAUISignpostLogSystem();
    os_signpost_id_t v11 = v10;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209754000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "StashLoginResponse", " enableTelemetry=YES ", buf, 2u);
    }

    double v12 = _AAUISignpostLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      os_signpost_id_t v40 = v8;
      _os_log_impl(&dword_209754000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StashLoginResponse  enableTelemetry=YES ", buf, 0xCu);
    }

    uint64_t v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[AAUISignInFlowController _stashLoginResponseWithAuthenticationResults:completion:].cold.5();
    }

    id v14 = [v6 objectForKeyedSubscript:*MEMORY[0x263F29010]];
    if (!v14)
    {
      int v15 = _AAUILogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[AAUISignInFlowController _stashLoginResponseWithAuthenticationResults:completion:].cold.4();
      }
    }
    id v16 = [v6 objectForKeyedSubscript:*MEMORY[0x263F28F58]];
    if (!v16)
    {
      id v17 = _AAUILogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[AAUISignInFlowController _stashLoginResponseWithAuthenticationResults:completion:]();
      }
    }
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F25998]) initWithAppleID:v14 altDSID:v16];
    id v19 = [v6 objectForKeyedSubscript:*MEMORY[0x263F28F80]];
    if (v19)
    {
      [v18 setDSID:v19];
      uint64_t v20 = [v6 objectForKeyedSubscript:*MEMORY[0x263F28FC0]];

      if (v20) {
        [v18 setBeneficiaryLogin:1];
      }
    }
    else
    {
      int v22 = _AAUILogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[AAUISignInFlowController _stashLoginResponseWithAuthenticationResults:completion:]();
      }
    }
    id v23 = [v6 objectForKeyedSubscript:*MEMORY[0x263F28FF8]];
    if (v23)
    {
      [v18 setRawPassword:v23];
    }
    else
    {
      double v24 = _AAUILogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[AAUISignInFlowController _stashLoginResponseWithAuthenticationResults:completion:]();
      }
    }
    __int16 v25 = [(ACAccountStore *)self->_accountStore aa_authKitAccountForAltDSID:v16];
    int v26 = v25;
    if (v25)
    {
      __int16 v27 = [v25 credential];
      int v28 = _AAUILogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v40 = (os_signpost_id_t)v26;
        _os_log_impl(&dword_209754000, v28, OS_LOG_TYPE_DEFAULT, "Trying to add CK and PRK for %@ to login context...", buf, 0xCu);
      }

      uint64_t v29 = [v27 credentialItemForKey:*MEMORY[0x263EFB028]];
      [v18 setContinuationKey:v29];

      __int16 v30 = [v27 credentialItemForKey:*MEMORY[0x263EFB108]];
      [v18 setPasswordResetKey:v30];
    }
    else
    {
      __int16 v27 = _AAUILogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v40 = (os_signpost_id_t)v16;
        _os_log_impl(&dword_209754000, v27, OS_LOG_TYPE_DEFAULT, "No AuthKit account to grab CK and PRK from for altDSID: %@", buf, 0xCu);
      }
    }

    int v31 = [MEMORY[0x263F258A8] sharedManager];
    [v31 setStashedContext:v18];

    uint64_t v32 = [MEMORY[0x263F258A8] sharedManager];
    [v32 persistStashedContext];

    unint64_t Nanoseconds = _AAUISignpostGetNanoseconds(v8, v37);
    uint64_t v34 = _AAUISignpostLogSystem();
    __int16 v35 = v34;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209754000, v35, OS_SIGNPOST_INTERVAL_END, v8, "StashLoginResponse", "", buf, 2u);
    }

    int v36 = _AAUISignpostLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      os_signpost_id_t v40 = v8;
      __int16 v41 = 2048;
      double v42 = (double)Nanoseconds / 1000000000.0;
      _os_log_impl(&dword_209754000, v36, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StashLoginResponse ", buf, 0x16u);
    }

    v38[2](v38);
  }
  else
  {
    BOOL v21 = (void (*)(void))*((void *)a4 + 2);
    id v14 = a4;
    v21();
  }
}

- (void)_promptToEnableFindMyIfPossibleWithAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if ([(AAUISignInFlowController *)self activationAction] == 2)
  {
    os_signpost_id_t v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Activation lock explicitly disabled, not enabling FindMy...";
LABEL_14:
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (![(AAUISignInFlowController *)self shouldAutomaticallySaveSignInResults])
  {
    os_signpost_id_t v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Automatic sign in result save disabled, not enabling FindMy...";
      goto LABEL_14;
    }
LABEL_15:

    v7[2](v7, 0);
    goto LABEL_16;
  }
  if (!objc_msgSend(v6, "aa_isAccountClass:", *MEMORY[0x263F25618])
    || (objc_msgSend(v6, "aa_isPrimaryEmailVerified") & 1) == 0)
  {
    os_signpost_id_t v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Account is not a primary with email verified...";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (([v6 isProvisionedForDataclass:*MEMORY[0x263EFB410]] & 1) == 0)
  {
    os_signpost_id_t v8 = _AAUILogSystem();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "Account is not provisioned for FindMy...";
    goto LABEL_14;
  }
  os_signpost_id_t v10 = [(AAUISignInFlowController *)self presentingViewController];
  if (v10)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke;
    v12[3] = &unk_263F932B0;
    v12[4] = self;
    id v14 = v7;
    id v13 = v10;
    [(AAUISignInFlowController *)self _hasActivationLockSupportedWatchWithCompletion:v12];
  }
  else
  {
    os_signpost_id_t v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AAUISignInFlowController _promptToEnableFindMyIfPossibleWithAccount:completion:]();
    }

    v7[2](v7, 0);
  }

LABEL_16:
}

void __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_2;
  aBlock[3] = &__block_descriptor_33_e5_v8__0l;
  char v15 = a2;
  id v6 = _Block_copy(aBlock);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_110;
  v9[3] = &unk_263F93288;
  v9[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v13 = *(id *)(a1 + 48);
  id v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 32)) {
      v3 = @"YES";
    }
    else {
      v3 = @"NO";
    }
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Enabling FindMy for newly added account, hasWatch: %{public}@.", (uint8_t *)&v6, 0xCu);
  }

  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v4 = [MEMORY[0x263F3CC60] sharedInstance];
    [v4 userNotifiedOfActivationLockForAllPairedDevices];
  }
  id v5 = +[AAUIDeviceLocatorService sharedInstance];
  [v5 enableInContext:3];
}

void __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_110(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activationAction] == 1)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v4 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DEVICE_LOCATOR_TITLE"];
    id v5 = [v3 localizedStringForKey:v4 value:&stru_26BD39CD8 table:@"Localizable"];

    int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];

    uint64_t v8 = [MEMORY[0x263F82418] alertWithTitle:v5 message:*(void *)(a1 + 40)];
    uint64_t v9 = (void *)MEMORY[0x263F82400];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_2_115;
    v13[3] = &unk_263F93260;
    id v14 = *(id *)(a1 + 64);
    id v10 = [v9 actionWithTitle:v7 style:0 handler:v13];
    [v8 addAction:v10];

    id v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Presenting activation lock enable alert...", v12, 2u);
    }

    [*(id *)(a1 + 48) presentViewController:v8 animated:1 completion:*(void *)(a1 + 56)];
  }
}

uint64_t __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_2_115(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_hasActivationLockSupportedWatchWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__AAUISignInFlowController__hasActivationLockSupportedWatchWithCompletion___block_invoke;
  aBlock[3] = &unk_263F932D8;
  id v5 = v4;
  void aBlock[4] = self;
  id v14 = v5;
  int v6 = _Block_copy(aBlock);
  id v7 = [MEMORY[0x263F57730] sharedInstance];
  uint64_t v8 = [v7 getActivePairedDevice];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"02168E84-5DD8-4B19-9204-A79F04B33A32"];
  int v10 = [v8 supportsCapability:v9];

  if (v10)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__AAUISignInFlowController__hasActivationLockSupportedWatchWithCompletion___block_invoke_2;
    v11[3] = &unk_263F93300;
    id v12 = v6;
    +[AAUIDeviceLocatorConfirmationUtilities checkIfWatchHasAppleIDAccount:v11];
  }
  else
  {
    (*((void (**)(void *, void))v6 + 2))(v6, 0);
  }
}

void __75__AAUISignInFlowController__hasActivationLockSupportedWatchWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2) {
    return;
  }
  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (a2)
  {
    id v4 = @"DEVICE_LOCATOR_MESSAGE_WATCH";
    if (([@"DEVICE_LOCATOR_MESSAGE_WATCH" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      char v5 = 0;
    }
    else
    {
      id v4 = [@"DEVICE_LOCATOR_MESSAGE_WATCH" stringByAppendingString:@"_REBRAND"];
      char v5 = 1;
    }
    uint64_t v8 = [v11 localizedStringForKey:v4 value:&stru_26BD39CD8 table:@"Localizable"];
    (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, 1, v8);

    if ((v5 & 1) == 0) {
      goto LABEL_16;
    }
  }
  else
  {
    int v6 = (void *)MEMORY[0x263F82670];
    id v4 = @"DEVICE_LOCATOR_MESSAGE";
    if (([@"DEVICE_LOCATOR_MESSAGE" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v7 = 0;
    }
    else
    {
      id v4 = [@"DEVICE_LOCATOR_MESSAGE" stringByAppendingString:@"_REBRAND"];
      int v7 = 1;
    }
    uint64_t v9 = [v6 modelSpecificLocalizedStringKeyForKey:v4];
    int v10 = [v11 localizedStringForKey:v9 value:&stru_26BD39CD8 table:@"Localizable"];
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v10);

    if (!v7) {
      goto LABEL_16;
    }
  }

LABEL_16:
}

uint64_t __75__AAUISignInFlowController__hasActivationLockSupportedWatchWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentUnableToSaveAccountAlert
{
  v3 = (void *)MEMORY[0x263F82418];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v5 = [v4 localizedStringForKey:@"SAVE_FAILED_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];
  id v11 = [v3 alertWithTitle:v5 message:0];

  int v6 = (void *)MEMORY[0x263F82400];
  int v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];
  uint64_t v9 = [v6 actionWithTitle:v8 style:1 handler:0];
  [v11 addAction:v9];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [WeakRetained presentViewController:v11 animated:1 completion:0];
}

- (void)_showGenericTermsUIforAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  if (WeakRetained)
  {
    if (self->_pendingCompletion)
    {
      uint64_t v9 = _AAUILogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Error! A pending completion for sign-in already exists and we are about to overwrite it!", v20, 2u);
      }
    }
    int v10 = _Block_copy(v7);
    id pendingCompletion = self->_pendingCompletion;
    self->_id pendingCompletion = v10;

    id v12 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v14 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    char v15 = v14;
    if (isKindOfClass)
    {
      uint64_t v16 = [v14 topViewController];

      char v15 = (void *)v16;
    }
    id v17 = [[AAUIGenericTermsRemoteUI alloc] initWithAccount:v6 inStore:self->_accountStore];
    genericTermsRemoteUI = self->_genericTermsRemoteUI;
    self->_genericTermsRemoteUI = v17;

    [(AAUIGenericTermsRemoteUI *)self->_genericTermsRemoteUI setDelegate:self];
    [(AAUIGenericTermsRemoteUI *)self->_genericTermsRemoteUI presentFromViewController:v15 modal:1];
  }
  else
  {
    id v19 = [MEMORY[0x263F087E8] errorWithDomain:@"AAUISignInErrors" code:-9005 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v19);
  }
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  id v6 = a3;
  genericTermsRemoteUI = self->_genericTermsRemoteUI;
  self->_genericTermsRemoteUI = 0;

  uint64_t v8 = _Block_copy(self->_pendingCompletion);
  id pendingCompletion = self->_pendingCompletion;
  self->_id pendingCompletion = 0;

  if (a4)
  {
    accountStore = self->_accountStore;
    id v11 = [v6 account];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __70__AAUISignInFlowController_genericTermsRemoteUI_didFinishWithSuccess___block_invoke;
    v13[3] = &unk_263F93150;
    void v13[4] = self;
    id v14 = v6;
    id v15 = v8;
    [(ACAccountStore *)accountStore aa_registerAppleAccount:v11 withCompletion:v13];
  }
  else
  {
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"AAUISignInErrors" code:-9006 userInfo:0];
    (*((void (**)(void *, void, void, void *))v8 + 2))(v8, 0, 0, v12);
  }
}

void __70__AAUISignInFlowController_genericTermsRemoteUI_didFinishWithSuccess___block_invoke(void *a1, uint64_t a2, void *a3)
{
  char v5 = (void *)a1[4];
  id v6 = (void *)a1[5];
  id v7 = a3;
  id v8 = [v6 account];
  [v5 _verifyLoginResponseForiCloudAccount:v8 withSuccess:a2 response:0 error:v7 completion:a1[6]];
}

- (void)_presentValidationErrorAlert:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v56 = [v8 userInfo];
  uint64_t v53 = v10;
  if (v56)
  {
    id v11 = [v56 objectForKey:*MEMORY[0x263F25B18]];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = [v8 userInfo];
  id v13 = [v12 objectForKey:*MEMORY[0x263F25B48]];

  if (v13)
  {
    id v14 = [v13 objectForKey:*MEMORY[0x263F25B20]];
    uint64_t v15 = [v13 objectForKey:*MEMORY[0x263F25B50]];
    uint64_t v16 = [v13 objectForKey:*MEMORY[0x263F25B10]];
    if (v15) {
      goto LABEL_9;
    }
  }
  else
  {
    id v14 = 0;
    uint64_t v16 = 0;
  }
  uint64_t v15 = [(AAUISignInFlowController *)self _titleForError:v8 account:v9];
LABEL_9:
  v55 = (void *)v15;
  if (!v14)
  {
    id v17 = (void *)*MEMORY[0x263F25B30];
    if ([v11 isEqualToString:*MEMORY[0x263F25B30]])
    {
      uint64_t v49 = v16;
      uint64_t v18 = NSString;
      id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v51 = self;
      if (([v17 containsString:@"REBRAND"] & 1) != 0
        || !_os_feature_enabled_impl())
      {
        uint64_t v20 = v11;
        int v21 = 0;
      }
      else
      {
        uint64_t v20 = v11;
        id v17 = [v17 stringByAppendingString:@"_REBRAND"];
        int v21 = 1;
      }
      int v22 = [v19 localizedStringForKey:v17 value:&stru_26BD39CD8 table:@"Localizable"];
      id v23 = [v9 username];
      id v14 = objc_msgSend(v18, "stringWithFormat:", v22, v23);

      if (v21) {
      id v11 = v20;
      }
      uint64_t v16 = v49;
      self = v51;
      uint64_t v15 = (uint64_t)v55;
    }
    else
    {
      id v14 = [v8 localizedDescription];
    }
  }
  double v24 = [MEMORY[0x263F82418] alertWithTitle:v15 message:v14];
  uint64_t v54 = v13;
  if ([v8 code] == 403 && objc_msgSend(v11, "isEqualToString:", *MEMORY[0x263F25B40]))
  {
    __int16 v25 = (void *)MEMORY[0x263F82400];
    int v26 = (void *)v16;
    [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v27 = v50 = v9;
    [v27 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];
    int v28 = v52 = self;
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke;
    v65[3] = &unk_263F93328;
    uint64_t v29 = v53;
    id v30 = v53;
    id v67 = v30;
    v48 = v11;
    id v31 = v8;
    id v66 = v31;
    uint64_t v32 = [v25 actionWithTitle:v28 style:0 handler:v65];
    [v24 addAction:v32];

    __int16 v33 = (void *)MEMORY[0x263F82400];
    uint64_t v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v35 = [v34 localizedStringForKey:@"LEARN_MORE" value:&stru_26BD39CD8 table:@"Localizable"];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_147;
    v62[3] = &unk_263F93328;
    id v63 = v31;
    id v64 = v30;
    id v36 = v31;
    id v11 = v48;
    id v37 = v30;
    os_signpost_id_t v38 = v33;
    self = v52;
    uint64_t v39 = [v38 actionWithTitle:v35 style:1 handler:v62];
    [v24 addAction:v39];

    id v9 = v50;
    os_signpost_id_t v40 = &v67;
  }
  else
  {
    int v26 = (void *)v16;
    if (!v16)
    {
      __int16 v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v26 = [v41 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];
    }
    double v42 = (void *)MEMORY[0x263F82400];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_3;
    v57[3] = &unk_263F93350;
    os_signpost_id_t v40 = (id *)v58;
    v58[0] = v11;
    v58[1] = self;
    id v43 = v9;
    uint64_t v29 = v53;
    id v60 = v8;
    id v61 = v53;
    id v59 = v43;
    id v44 = v8;
    id v45 = v53;
    v46 = [v42 actionWithTitle:v26 style:1 handler:v57];
    [v24 addAction:v46];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [WeakRetained presentViewController:v24 animated:1 completion:0];
}

uint64_t __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "User dismissed Unsupported Device alert.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_147(uint64_t a1)
{
  uint64_t v2 = (void *)*MEMORY[0x263F83300];
  v3 = [NSURL URLWithString:@"https://www.me.com/findmyiphone/account"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_2;
  v4[3] = &unk_263F932D8;
  id v6 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  [v2 openURL:v3 withCompletionHandler:v4];
}

uint64_t __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F25B30]])
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 64);
    return [v2 _showGenericTermsUIforAccount:v3 completion:v4];
  }
  else
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
    return v6();
  }
}

- (id)_messageForErrorAlert:(int64_t)a3
{
  BOOL v3 = (unint64_t)(a3 + 9011) > 9 || ((1 << (a3 + 51)) & 0x203) == 0;
  uint64_t v4 = NSString;
  if (v3)
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"UNABLE_TO_VALIDATE" value:&stru_26BD39CD8 table:@"Localizable"];
    id v8 = [v4 stringWithFormat:v6];
  }
  else
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"ALREADY_EXISTING_ACCOUNT_DESC"];
    id v7 = [v5 localizedStringForKey:v6 value:&stru_26BD39CD8 table:@"Localizable"];
    id v8 = objc_msgSend(v4, "stringWithFormat:", v7, @"iCloud");
  }
  return v8;
}

- (void)_presentExistingAccountAlert:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a3;
  id v7 = [v5 bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SIGN_IN_ERROR_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  id v17 = [v4 stringWithFormat:v8];

  id v9 = [v6 userInfo];

  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F08320]];

  id v11 = [MEMORY[0x263F82418] alertWithTitle:v17 message:v10];
  id v12 = (void *)MEMORY[0x263F82400];
  id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];
  uint64_t v15 = [v12 actionWithTitle:v14 style:1 handler:0];
  [v11 addAction:v15];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [WeakRetained presentViewController:v11 animated:1 completion:0];
}

- (id)_titleForError:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 userInfo];
  id v8 = v7;
  if (v7
    && (uint64_t v9 = *MEMORY[0x263F25B18],
        [v7 objectForKey:*MEMORY[0x263F25B18]],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    id v11 = [v8 objectForKey:v9];
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = [v5 code];
  switch(v12)
  {
    case 403:
      if (!v11) {
        break;
      }
      if (![v11 isEqualToString:*MEMORY[0x263F25B28]])
      {
        uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v18 = [v11 stringByAppendingString:@"_DYNAMIC_TITLE"];
        id v13 = [v15 localizedStringForKey:v18 value:&stru_26BD39CD8 table:@"Localizable"];

        goto LABEL_15;
      }
LABEL_11:
      id v13 = objc_msgSend(v6, "aa_displayName");
      goto LABEL_16;
    case 402:
      id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v15 = v14;
      uint64_t v16 = @"MOBILEME_PAID_ACCOUNT_LAPSED_TITLE";
      goto LABEL_14;
    case 401:
      goto LABEL_11;
  }
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v15 = v14;
  uint64_t v16 = @"VERIFICATION_FAILED_TITLE";
LABEL_14:
  id v13 = [v14 localizedStringForKey:v16 value:&stru_26BD39CD8 table:@"Localizable"];
LABEL_15:

LABEL_16:
  return v13;
}

- (id)_appleAccountType
{
  appleAccountType = self->_appleAccountType;
  if (!appleAccountType)
  {
    uint64_t v4 = [(ACAccountStore *)self->_accountStore accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAE58]];
    id v5 = self->_appleAccountType;
    self->_appleAccountType = v4;

    appleAccountType = self->_appleAccountType;
  }
  return appleAccountType;
}

- (void)prewarmOperationsWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F25930] sharedServer];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke;
  v6[3] = &unk_263F933A0;
  id v7 = v3;
  id v5 = v3;
  [v4 configurationWithCompletion:v6];
}

void __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [@"PREWARM" dataUsingEncoding:4];
  id v5 = dispatch_group_create();
  id v6 = [v3 absintheEnable];

  if ([v6 unsignedIntegerValue] == 1)
  {
    dispatch_group_enter(v5);
    id v7 = [MEMORY[0x263F25740] sharedSigner];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke_2;
    v10[3] = &unk_263F93378;
    id v11 = v5;
    [v7 signatureForData:v4 completion:v10];
  }
  if (*(void *)(a1 + 32))
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke_3;
    v8[3] = &unk_263F920E8;
    id v9 = *(id *)(a1 + 32);
    dispatch_group_notify(v5, MEMORY[0x263EF83A0], v8);
  }
}

void __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke_2(uint64_t a1)
{
}

uint64_t __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signInOperationManager:(id)a3 didSaveAccount:(id)a4 error:(id)a5
{
  id pendingCompletion = (void (**)(id, BOOL, id, id))self->_pendingCompletion;
  if (pendingCompletion)
  {
    pendingCompletion[2](pendingCompletion, a4 != 0, a4, a5);
    id v7 = self->_pendingCompletion;
    self->_id pendingCompletion = 0;
  }
  else
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AAUISignInFlowController signInOperationManager:didSaveAccount:error:]();
    }
  }
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
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

- (unint64_t)activationAction
{
  return self->_activationAction;
}

- (void)setActivationAction:(unint64_t)a3
{
  self->_activationAction = a3;
}

- (BOOL)shouldStashLoginResponse
{
  return self->_shouldStashLoginResponse;
}

- (void)setShouldStashLoginResponse:(BOOL)a3
{
  self->_shouldStashLoginResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_cdpContextsByAccountIDLock, 0);
  objc_storeStrong((id *)&self->_cdpContextsByAccountID, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_genericTermsRemoteUI, 0);
  objc_storeStrong((id *)&self->_appleAccountType, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)signInWithIDMSAuthenticationResults:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Multiple full accounts allowed! Setting account class to full!", v2, v3, v4, v5, v6);
}

- (void)signInWithIDMSAuthenticationResults:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Having multiple full accounts is not a supported configuration.", v2, v3, v4, v5, v6);
}

- (void)signInWithIDMSAuthenticationResults:(uint64_t)a1 completion:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Enterprise persona detected: %@", (uint8_t *)&v2, 0xCu);
}

- (void)signInWithIDMSAuthenticationResults:completion:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "We're not running in Enterprise Persona.", v2, v3, v4, v5, v6);
}

void __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_83_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Validating iCDP failed with error %@! Blocking iCloud sign-in...", (uint8_t *)&v2, 0xCu);
}

- (void)_saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Attempt to save without a valid presenting view controller!", v2, v3, v4, v5, v6);
}

- (void)_saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Attempt to save account while another save is mid-flight!", v2, v3, v4, v5, v6);
}

- (void)_stashLoginResponseWithAuthenticationResults:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Login response results missing rp!", v2, v3, v4, v5, v6);
}

- (void)_stashLoginResponseWithAuthenticationResults:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Login response results missing DSID!", v2, v3, v4, v5, v6);
}

- (void)_stashLoginResponseWithAuthenticationResults:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Login response results missing altDSID!", v2, v3, v4, v5, v6);
}

- (void)_stashLoginResponseWithAuthenticationResults:completion:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Login response results missing username!", v2, v3, v4, v5, v6);
}

- (void)_stashLoginResponseWithAuthenticationResults:completion:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Stashing login response because caller said so...", v2, v3, v4, v5, v6);
}

- (void)_promptToEnableFindMyIfPossibleWithAccount:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Failed to enable FindMy, no presentingViewController found!", v2, v3, v4, v5, v6);
}

- (void)signInOperationManager:didSaveAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Sign in operation manager completed without a callback!", v2, v3, v4, v5, v6);
}

@end