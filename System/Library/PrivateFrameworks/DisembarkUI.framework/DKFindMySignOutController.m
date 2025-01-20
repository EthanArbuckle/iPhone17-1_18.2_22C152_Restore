@interface DKFindMySignOutController
- (ACAccount)account;
- (AKAppleIDAuthenticationInAppContext)authContext;
- (BOOL)isAuthInProgress;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (DKFindMySignOutController)initWithAccount:(id)a3 withCompletion:(id)a4;
- (UIButton)forgotButton;
- (UITextField)passwordField;
- (UIView)containerOutlineView;
- (id)_messageForError:(id)a3;
- (id)_titleForError:(id)a3;
- (id)completion;
- (void)_authenticateWithPassword:(id)a3;
- (void)_cancelTapped:(id)a3;
- (void)_disableFindMy:(id)a3 withPassword:(id)a4;
- (void)_handleFMIPAuthenticationResponse:(id)a3 withError:(id)a4 forContext:(id)a5 completion:(id)a6;
- (void)_passwordRecoveryButtonWasTapped:(id)a3;
- (void)_turnOffTapped:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setContainerOutlineView:(id)a3;
- (void)setForgotButton:(id)a3;
- (void)setIsAuthInProgress:(BOOL)a3;
- (void)setPasswordField:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DKFindMySignOutController

- (DKFindMySignOutController)initWithAccount:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = NSString;
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"TURN_OFF_FIND_MY_DISCLOSURE" value:&stru_26EAA9F58 table:@"Localizable"];
  v20 = v7;
  v12 = [v7 username];
  v13 = objc_msgSend(v9, "stringWithFormat:", v11, v12);

  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"APPLE_ACCOUNT_SIGN_IN" value:&stru_26EAA9F58 table:@"Localizable"];
  v21.receiver = self;
  v21.super_class = (Class)DKFindMySignOutController;
  v16 = [(DKFindMySignOutController *)&v21 initWithTitle:v15 detailText:v13 icon:0 contentLayout:3];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_account, a3);
    uint64_t v17 = MEMORY[0x237E2A3E0](v8);
    id completion = v16->_completion;
    v16->_id completion = (id)v17;
  }
  return v16;
}

- (void)viewDidLoad
{
  v118[13] = *MEMORY[0x263EF8340];
  v117.receiver = self;
  v117.super_class = (Class)DKFindMySignOutController;
  [(OBBaseWelcomeController *)&v117 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v4 = [(DKFindMySignOutController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(MEMORY[0x263F1C468]);
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
  id v8 = (void *)[v5 initWithTitle:v7 style:0 target:self action:sel__cancelTapped_];
  v9 = [(OBBaseWelcomeController *)self navigationItem];
  [v9 setLeftBarButtonItem:v8];

  id v10 = objc_alloc(MEMORY[0x263F1C468]);
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"TURN_OFF_FINDMY" value:&stru_26EAA9F58 table:@"Localizable"];
  v13 = (void *)[v10 initWithTitle:v12 style:0 target:self action:sel__turnOffTapped_];
  v14 = [(OBBaseWelcomeController *)self navigationItem];
  [v14 setRightBarButtonItem:v13];

  v15 = [(OBBaseWelcomeController *)self navigationItem];
  v16 = [v15 rightBarButtonItem];
  [v16 setEnabled:0];

  id v17 = objc_alloc(MEMORY[0x263F1CA98]);
  double v18 = *MEMORY[0x263F001A8];
  double v19 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v20 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v21 = *(double *)(MEMORY[0x263F001A8] + 24);
  v22 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x263F001A8], v19, v20, v21);
  [(DKFindMySignOutController *)self setPasswordField:v22];

  v23 = [MEMORY[0x263F1C550] clearColor];
  v24 = [(DKFindMySignOutController *)self passwordField];
  [v24 setBackgroundColor:v23];

  v25 = [(DKFindMySignOutController *)self passwordField];
  [v25 setDelegate:self];

  v26 = [MEMORY[0x263F1C658] defaultFontForTextStyle:*MEMORY[0x263F1D2C0]];
  v27 = [(DKFindMySignOutController *)self passwordField];
  [v27 setFont:v26];

  v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v29 = [v28 localizedStringForKey:@"CAPITALIZED_PASSWORD" value:&stru_26EAA9F58 table:@"Localizable"];
  v30 = [(DKFindMySignOutController *)self passwordField];
  [v30 setPlaceholder:v29];

  v31 = [(DKFindMySignOutController *)self passwordField];
  [v31 setSecureTextEntry:1];

  v32 = [(DKFindMySignOutController *)self passwordField];
  [v32 setReturnKeyType:0];

  uint64_t v33 = *MEMORY[0x263F1D700];
  v34 = [(DKFindMySignOutController *)self passwordField];
  [v34 setTextContentType:v33];

  v35 = [(DKFindMySignOutController *)self passwordField];
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];

  v36 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v18, v19, v20, v21);
  [(DKFindMySignOutController *)self setContainerOutlineView:v36];

  v37 = [(DKFindMySignOutController *)self containerOutlineView];
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v38 = [MEMORY[0x263F1C550] quaternaryLabelColor];
  uint64_t v39 = [v38 CGColor];
  v40 = [(DKFindMySignOutController *)self containerOutlineView];
  v41 = [v40 layer];
  [v41 setBorderColor:v39];

  v42 = [(DKFindMySignOutController *)self containerOutlineView];
  v43 = [v42 layer];
  [v43 setBorderWidth:1.0];

  v44 = [MEMORY[0x263F1C488] buttonWithType:1];
  [(DKFindMySignOutController *)self setForgotButton:v44];

  v45 = [(DKFindMySignOutController *)self forgotButton];
  v46 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v47 = [v46 localizedStringForKey:@"FORGOT_PASSWORD" value:&stru_26EAA9F58 table:@"Localizable"];
  [v45 setTitle:v47 forState:0];

  v48 = [(DKFindMySignOutController *)self forgotButton];
  [v48 addTarget:self action:sel__passwordRecoveryButtonWasTapped_ forControlEvents:64];

  v49 = [(DKFindMySignOutController *)self forgotButton];
  [v49 setTranslatesAutoresizingMaskIntoConstraints:0];

  v50 = [(DKFindMySignOutController *)self containerOutlineView];
  v51 = [(DKFindMySignOutController *)self passwordField];
  [v50 addSubview:v51];

  v52 = [(DKFindMySignOutController *)self contentView];
  v53 = [(DKFindMySignOutController *)self containerOutlineView];
  [v52 addSubview:v53];

  v54 = [(DKFindMySignOutController *)self contentView];
  v55 = [(DKFindMySignOutController *)self forgotButton];
  [v54 addSubview:v55];

  v92 = (void *)MEMORY[0x263F08938];
  v116 = [(DKFindMySignOutController *)self passwordField];
  v114 = [v116 centerYAnchor];
  v115 = [(DKFindMySignOutController *)self containerOutlineView];
  v113 = [v115 centerYAnchor];
  v112 = [v114 constraintEqualToAnchor:v113];
  v118[0] = v112;
  v111 = [(DKFindMySignOutController *)self passwordField];
  v109 = [v111 leadingAnchor];
  v110 = [(DKFindMySignOutController *)self containerOutlineView];
  v108 = [v110 leadingAnchor];
  v107 = [v109 constraintEqualToAnchor:v108 constant:11.0];
  v118[1] = v107;
  v106 = [(DKFindMySignOutController *)self passwordField];
  v104 = [v106 trailingAnchor];
  v105 = [(DKFindMySignOutController *)self containerOutlineView];
  v103 = [v105 trailingAnchor];
  v102 = [v104 constraintEqualToAnchor:v103 constant:-11.0];
  v118[2] = v102;
  v101 = [(DKFindMySignOutController *)self passwordField];
  v100 = [v101 heightAnchor];
  v99 = [v100 constraintEqualToConstant:21.0];
  v118[3] = v99;
  v98 = [(DKFindMySignOutController *)self containerOutlineView];
  v96 = [v98 topAnchor];
  v97 = [(DKFindMySignOutController *)self contentView];
  v95 = [v97 topAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v118[4] = v94;
  v93 = [(DKFindMySignOutController *)self containerOutlineView];
  v90 = [v93 leadingAnchor];
  v91 = [(DKFindMySignOutController *)self contentView];
  v89 = [v91 leadingAnchor];
  v88 = [v90 constraintEqualToAnchor:v89 constant:-1.0];
  v118[5] = v88;
  v87 = [(DKFindMySignOutController *)self containerOutlineView];
  v85 = [v87 trailingAnchor];
  v86 = [(DKFindMySignOutController *)self contentView];
  v84 = [v86 trailingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84 constant:1.0];
  v118[6] = v83;
  v82 = [(DKFindMySignOutController *)self containerOutlineView];
  v81 = [v82 heightAnchor];
  v80 = [v81 constraintEqualToConstant:41.0];
  v118[7] = v80;
  v79 = [(DKFindMySignOutController *)self forgotButton];
  v77 = [v79 topAnchor];
  v78 = [(DKFindMySignOutController *)self containerOutlineView];
  v76 = [v78 bottomAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:20.0];
  v118[8] = v75;
  v74 = [(DKFindMySignOutController *)self forgotButton];
  v72 = [v74 leadingAnchor];
  v73 = [(DKFindMySignOutController *)self contentView];
  v71 = [v73 leadingAnchor];
  v70 = [v72 constraintEqualToAnchor:v71];
  v118[9] = v70;
  v69 = [(DKFindMySignOutController *)self forgotButton];
  v67 = [v69 trailingAnchor];
  v68 = [(DKFindMySignOutController *)self contentView];
  v66 = [v68 trailingAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v118[10] = v65;
  v56 = [(DKFindMySignOutController *)self forgotButton];
  v57 = [v56 heightAnchor];
  v58 = [v57 constraintEqualToConstant:41.0];
  v118[11] = v58;
  v59 = [(DKFindMySignOutController *)self forgotButton];
  v60 = [v59 bottomAnchor];
  v61 = [(DKFindMySignOutController *)self contentView];
  v62 = [v61 bottomAnchor];
  v63 = [v60 constraintEqualToAnchor:v62];
  v118[12] = v63;
  v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:13];
  [v92 activateConstraints:v64];

  [(DKFindMySignOutController *)self setShouldAdjustScrollViewInsetForKeyboard:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DKFindMySignOutController;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:a3];
  v4 = [(DKFindMySignOutController *)self passwordField];
  [v4 becomeFirstResponder];
}

- (void)setIsAuthInProgress:(BOOL)a3
{
  BOOL v5 = !a3;
  v6 = [(OBBaseWelcomeController *)self navigationItem];
  id v7 = [v6 leftBarButtonItem];
  [v7 setEnabled:v5];

  id v8 = [(OBBaseWelcomeController *)self navigationItem];
  v9 = [v8 rightBarButtonItem];
  [v9 setEnabled:v5];

  id v10 = [(DKFindMySignOutController *)self view];
  [v10 setUserInteractionEnabled:v5];

  self->_isAuthInProgress = a3;
}

- (void)_cancelTapped:(id)a3
{
  v4 = [(DKFindMySignOutController *)self completion];

  if (v4)
  {
    BOOL v5 = [(DKFindMySignOutController *)self completion];
    v5[2](v5, 1, 0);
  }
}

- (void)_turnOffTapped:(id)a3
{
  v4 = [(DKFindMySignOutController *)self passwordField];
  BOOL v5 = [v4 text];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v9 = [(DKFindMySignOutController *)self passwordField];
    id v7 = [v9 text];
    [(DKFindMySignOutController *)self _authenticateWithPassword:v7];
  }
  else
  {
    id v8 = _DKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DKFindMySignOutController _turnOffTapped:](v8);
    }
  }
}

- (void)_authenticateWithPassword:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[DKFindMySignOutController _authenticateWithPassword:]();
  }
  BOOL v5 = v4;
  [(DKFindMySignOutController *)self setIsAuthInProgress:1];
  id v6 = objc_alloc_init(MEMORY[0x263F292A8]);
  id v7 = [(DKFindMySignOutController *)self account];
  id v8 = [v7 username];
  [v6 setUsername:v8];

  [v6 _setPassword:v5];
  [v6 setNeedsCredentialRecovery:0];
  [v6 setNeedsNewAppleID:0];
  [v6 setAuthenticationType:2];
  [v6 setEnablePasscodeAuth:0];
  id v9 = objc_alloc_init(MEMORY[0x263F29118]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__DKFindMySignOutController__authenticateWithPassword___block_invoke;
  v10[3] = &unk_264CF0A48;
  v10[4] = self;
  [v9 authenticateWithContext:v6 completion:v10];
}

void __55__DKFindMySignOutController__authenticateWithPassword___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    v12 = [v6 domain];
    int v13 = [v12 isEqualToString:*MEMORY[0x263F28F30]];

    if (v13) {
      BOOL v14 = [v7 code] == -7003;
    }
    else {
      BOOL v14 = 0;
    }
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_3;
    v17[3] = &unk_264CF0A20;
    BOOL v20 = v14;
    id v15 = v7;
    uint64_t v16 = *(void *)(a1 + 32);
    id v18 = v15;
    uint64_t v19 = v16;
    dispatch_async(MEMORY[0x263EF83A0], v17);
    id v11 = v18;
  }
  else
  {
    id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x263F29010]];
    id v9 = [v5 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_2;
    block[3] = &unk_264CF09F8;
    block[4] = *(void *)(a1 + 32);
    id v22 = v8;
    id v23 = v9;
    id v10 = v9;
    id v11 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _disableFindMy:*(void *)(a1 + 40) withPassword:*(void *)(a1 + 48)];
}

uint64_t __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    v2 = _DKLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_3_cold_1(a1, v2);
    }

    v3 = (void *)MEMORY[0x263F1C3F8];
    id v4 = [*(id *)(a1 + 40) _titleForError:*(void *)(a1 + 32)];
    id v5 = [*(id *)(a1 + 40) _messageForError:*(void *)(a1 + 32)];
    id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

    id v7 = (void *)MEMORY[0x263F1C3F0];
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"OK" value:&stru_26EAA9F58 table:@"Localizable"];
    id v10 = [v7 actionWithTitle:v9 style:1 handler:0];
    [v6 addAction:v10];

    id v11 = [*(id *)(a1 + 40) navigationController];
    [v11 presentViewController:v6 animated:1 completion:0];
  }
  return [*(id *)(a1 + 40) setIsAuthInProgress:0];
}

- (void)_disableFindMy:(id)a3 withPassword:(id)a4
{
  id v5 = a4;
  id v6 = [(DKFindMySignOutController *)self account];
  objc_msgSend(v6, "aa_setPassword:", v5);

  id v7 = objc_opt_new();
  id v8 = [(DKFindMySignOutController *)self account];
  [v7 setAccount:v8];

  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"DISABLE_FIND_MY_PROMPT" value:&stru_26EAA9F58 table:@"Localizable"];
  [v7 setMessage:v10];

  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"TURN_OFF" value:&stru_26EAA9F58 table:@"Localizable"];
  [v7 setButtonTitle:v12];

  id v13 = objc_alloc(MEMORY[0x263F25840]);
  BOOL v14 = [v7 account];
  id v15 = (void *)[v13 initWithAccount:v14];

  uint64_t v16 = [v7 customRequestHeaders];
  [v15 setCustomHeaders:v16];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke;
  v18[3] = &unk_264CF0AC0;
  v18[4] = self;
  id v19 = v7;
  id v17 = v7;
  [v15 performRequestWithHandler:v18];
}

void __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v10 = *(void **)(a1 + 32);
    id v11 = [v8 error];
    uint64_t v12 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke_2;
    v14[3] = &unk_264CF0A70;
    objc_copyWeak(&v15, &location);
    [v10 _handleFMIPAuthenticationResponse:v8 withError:v11 forContext:v12 completion:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [*(id *)(a1 + 32) _handleFMIPAuthenticationResponse:0 withError:v9 forContext:*(void *)(a1 + 40) completion:0];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke_3;
  block[3] = &unk_264CF0A98;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = [WeakRetained completion];
  id v7 = [v5 fmipWipeToken];

  ((void (**)(void, uint64_t, void *))v6)[2](v6, a2, v7);
}

uint64_t __57__DKFindMySignOutController__disableFindMy_withPassword___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAuthInProgress:0];
}

- (void)_handleFMIPAuthenticationResponse:(id)a3 withError:(id)a4 forContext:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, id))a6;
  if (!v10
    || v11
    || ([v10 error], BOOL v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke;
    block[3] = &unk_264CF09F8;
    id v17 = v10;
    id v18 = v11;
    id v19 = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v15 = _DKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237B3F000, v15, OS_LOG_TYPE_DEFAULT, "FMIPAuthenticationRequest succeeded!", buf, 2u);
    }

    v13[2](v13, 0, v10);
  }
}

void __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = _DKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    _os_log_impl(&dword_237B3F000, v2, OS_LOG_TYPE_DEFAULT, "Failed to obtain an FMiP wipe token. Response: %@ and Error: %@", buf, 0x16u);
  }

  id v5 = (void *)MEMORY[0x263F1C3F8];
  id v6 = [*(id *)(a1 + 48) _titleForError:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 48) _messageForError:*(void *)(a1 + 40)];
  id v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  id v9 = (void *)MEMORY[0x263F1C3F0];
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_62;
  v18[3] = &unk_264CF0AE8;
  v18[4] = *(void *)(a1 + 48);
  id v12 = [v9 actionWithTitle:v11 style:1 handler:v18];
  [v8 addAction:v12];

  id v13 = (void *)MEMORY[0x263F1C3F0];
  BOOL v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = [v14 localizedStringForKey:@"RETRY" value:&stru_26EAA9F58 table:@"Localizable"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_2;
  v17[3] = &unk_264CF0AE8;
  void v17[4] = *(void *)(a1 + 48);
  uint64_t v16 = [v13 actionWithTitle:v15 style:0 handler:v17];
  [v8 addAction:v16];

  [*(id *)(a1 + 48) presentViewController:v8 animated:1 completion:0];
}

void __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_62(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) completion];
  v1[2](v1, 1, 0);
}

void __95__DKFindMySignOutController__handleFMIPAuthenticationResponse_withError_forContext_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [v1 account];
  v2 = objc_msgSend(v3, "aa_password");
  [v1 _authenticateWithPassword:v2];
}

- (id)_titleForError:(id)a3
{
  uint64_t v3 = [a3 code];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3 == 401) {
    id v6 = @"MOBILEME_AUTHENTICATION_FAILED_MESSAGE";
  }
  else {
    id v6 = @"VERIFICATION_FAILED_TITLE";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_26EAA9F58 table:@"Localizable"];

  return v7;
}

- (id)_messageForError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == 401)
  {
    uint64_t v4 = &stru_26EAA9F58;
  }
  else
  {
    uint64_t v4 = [v3 localizedDescription];
  }

  return v4;
}

- (void)_passwordRecoveryButtonWasTapped:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F292A8]);
  [v4 setNeedsCredentialRecovery:1];
  [v4 setPresentingViewController:self];
  id v5 = [(DKFindMySignOutController *)self account];
  id v6 = [v5 username];
  [v4 setUsername:v6];

  [(DKFindMySignOutController *)self setIsAuthInProgress:1];
  id v7 = objc_alloc_init(MEMORY[0x263F29118]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__DKFindMySignOutController__passwordRecoveryButtonWasTapped___block_invoke;
  v8[3] = &unk_264CF0A48;
  v8[4] = self;
  [v7 authenticateWithContext:v4 completion:v8];
}

void __62__DKFindMySignOutController__passwordRecoveryButtonWasTapped___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__DKFindMySignOutController__passwordRecoveryButtonWasTapped___block_invoke_2;
  block[3] = &unk_264CF0A98;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __62__DKFindMySignOutController__passwordRecoveryButtonWasTapped___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAuthInProgress:0];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DKFindMySignOutController *)self isAuthInProgress];
  if (v5)
  {
    id v6 = _DKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DKFindMySignOutController textFieldShouldReturn:](v6);
    }
  }
  else
  {
    id v7 = [(DKFindMySignOutController *)self passwordField];
    id v8 = [v7 text];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      id v10 = [(DKFindMySignOutController *)self passwordField];
      id v11 = [v10 text];
      [(DKFindMySignOutController *)self _authenticateWithPassword:v11];
    }
    [v4 endEditing:1];
  }

  return !v5;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = [a3 text];
  id v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  BOOL v12 = [v11 length] != 0;
  id v13 = [(OBBaseWelcomeController *)self navigationItem];
  BOOL v14 = [v13 rightBarButtonItem];
  [v14 setEnabled:v12];

  return 1;
}

- (UITextField)passwordField
{
  return self->_passwordField;
}

- (void)setPasswordField:(id)a3
{
}

- (UIButton)forgotButton
{
  return self->_forgotButton;
}

- (void)setForgotButton:(id)a3
{
}

- (AKAppleIDAuthenticationInAppContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (UIView)containerOutlineView
{
  return self->_containerOutlineView;
}

- (void)setContainerOutlineView:(id)a3
{
}

- (BOOL)isAuthInProgress
{
  return self->_isAuthInProgress;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_containerOutlineView, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_forgotButton, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);
}

- (void)_turnOffTapped:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B3F000, log, OS_LOG_TYPE_ERROR, "DKFindMySignOutController - turnOffFindMyPressed textfield length zero", v1, 2u);
}

- (void)_authenticateWithPassword:.cold.1()
{
}

void __55__DKFindMySignOutController__authenticateWithPassword___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_237B3F000, a2, OS_LOG_TYPE_ERROR, "DKFindMySignOut-authenticateWithPassword error: %@", (uint8_t *)&v3, 0xCu);
}

- (void)textFieldShouldReturn:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B3F000, log, OS_LOG_TYPE_ERROR, "DKFindMySignOut-AKAuthentication keyboard return pressed when auth is still in progress", v1, 2u);
}

@end