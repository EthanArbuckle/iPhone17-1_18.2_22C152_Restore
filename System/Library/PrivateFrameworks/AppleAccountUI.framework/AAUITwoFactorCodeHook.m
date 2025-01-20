@interface AAUITwoFactorCodeHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_generateLoginCode:(id)a3;
- (void)generateLoginCodeWithPresenter:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUITwoFactorCodeHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"code:generate"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char v4 = [v3 clientInfo];

  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  char v7 = [v6 isEqualToString:@"code:generate"];
  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
}

- (void)_generateLoginCode:(id)a3
{
  id v4 = a3;
  id v6 = [(AAUITwoFactorCodeHook *)self delegate];
  id v5 = [v6 presentationContextForHook:self];
  [(AAUITwoFactorCodeHook *)self generateLoginCodeWithPresenter:v5 completion:v4];
}

- (void)generateLoginCodeWithPresenter:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Starting to generate verification code...", buf, 2u);
  }

  id v9 = objc_alloc_init(MEMORY[0x263F29118]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke;
  v12[3] = &unk_263F936A0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 generateLoginCodeWithCompletion:v12];
}

void __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_2;
  block[3] = &unk_263F93678;
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = v8;
  id v9 = *(id *)(a1 + 48);
  id v16 = v5;
  id v17 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = _AAUILogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v3;
      _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Failed to generate login code. Error: %@", buf, 0xCu);
    }

    id v4 = (void *)MEMORY[0x263F82418];
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"HSA2_CODE_GENERATOR_FAILED_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
    uint64_t v7 = [v4 alertWithTitle:v6 message:0];

    v8 = *(void **)(a1 + 48);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_46;
    v25[3] = &unk_263F92070;
    id v27 = *(id *)(a1 + 64);
    id v26 = *(id *)(a1 + 32);
    [v8 presentViewController:v7 animated:1 completion:v25];
  }
  else
  {
    id v9 = (void *)MEMORY[0x263F29200];
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = @"HSA2_CODE_GENERATOR_TITLE";
    if (([@"HSA2_CODE_GENERATOR_TITLE" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v21 = 0;
    }
    else
    {
      id v11 = [@"HSA2_CODE_GENERATOR_TITLE" stringByAppendingString:@"_REBRAND"];
      int v21 = 1;
    }
    v12 = [v10 localizedStringForKey:v11 value:&stru_26BD39CD8 table:@"Localizable"];
    id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"HSA2_CODE_GENERATOR_BODY" value:&stru_26BD39CD8 table:@"Localizable"];
    id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v16 = [v15 localizedStringForKey:@"HSA2_CODE_GENERATOR_FOOTER" value:&stru_26BD39CD8 table:@"Localizable"];
    uint64_t v17 = [v9 buildLoginCodeNotificationWithTitle:v12 body:v14 footer:v16 loginCode:*(void *)(a1 + 56)];

    if (v21) {
    if (v17)
    }
    {
      v18 = (void *)MEMORY[0x263F259E0];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_2_67;
      v22[3] = &unk_263F93650;
      uint64_t v24 = v17;
      id v23 = *(id *)(a1 + 64);
      [v18 waitForResponseToNotification:v17 completion:v22];
    }
    else
    {
      v19 = _AAUILogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209754000, v19, OS_LOG_TYPE_DEFAULT, "Unable to create CFUserNotificationRef!", buf, 2u);
      }

      uint64_t v20 = *(void *)(a1 + 64);
      if (v20) {
        (*(void (**)(uint64_t, void, void))(v20 + 16))(v20, 0, 0);
      }
    }
  }
}

uint64_t __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_46(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __67__AAUITwoFactorCodeHook_generateLoginCodeWithPresenter_completion___block_invoke_2_67(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end