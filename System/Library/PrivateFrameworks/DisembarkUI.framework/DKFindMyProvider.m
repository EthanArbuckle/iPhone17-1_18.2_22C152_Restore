@interface DKFindMyProvider
- (id)stateChangeBlock;
- (void)_locatorStateDidChange:(id)a3;
- (void)disableFindMyWithPresentingViewController:(id)a3 completion:(id)a4;
- (void)fetchFindMyState:(id)a3;
- (void)preheatFindMyState;
- (void)setStateChangeBlock:(id)a3;
@end

@implementation DKFindMyProvider

- (void)preheatFindMyState
{
  v2 = _DKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_237B3F000, v2, OS_LOG_TYPE_DEFAULT, "Preheating Find My state...", v4, 2u);
  }

  v3 = [MEMORY[0x263F25CB8] sharedInstance];
  [v3 refreshCurrentState:&__block_literal_global_0];
}

void __38__DKFindMyProvider_preheatFindMyState__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = _DKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = @"known";
    if (a2 == 4) {
      v4 = @"unknown";
    }
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_237B3F000, v3, OS_LOG_TYPE_DEFAULT, "Find My state preheated; state is %@",
      (uint8_t *)&v5,
      0xCu);
  }
}

- (void)fetchFindMyState:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  int v5 = [MEMORY[0x263F25CB8] sharedInstance];
  char v6 = [v5 isStateKnown];

  uint64_t v7 = [MEMORY[0x263F25CB8] sharedInstance];
  v8 = v7;
  if (v6)
  {
    char v9 = [v7 isChangingState];

    if ((v9 & 1) == 0)
    {
      v12 = [MEMORY[0x263F25CB8] sharedInstance];
      v4[2](v4, [v12 isEnabled]);

      goto LABEL_8;
    }
    [(DKFindMyProvider *)self stateChangeBlock];
    if (objc_claimAutoreleasedReturnValue()) {
      -[DKFindMyProvider fetchFindMyState:]();
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __37__DKFindMyProvider_fetchFindMyState___block_invoke_2;
    v13[3] = &unk_264CF0DF8;
    v14 = v4;
    [(DKFindMyProvider *)self setStateChangeBlock:v13];
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:self selector:sel__locatorStateDidChange_ name:*MEMORY[0x263F25C28] object:0];

    v11 = v14;
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __37__DKFindMyProvider_fetchFindMyState___block_invoke;
    v15[3] = &unk_264CF0DD0;
    v15[4] = self;
    v16 = v4;
    [v8 refreshCurrentState:v15];

    v11 = v16;
  }

LABEL_8:
}

uint64_t __37__DKFindMyProvider_fetchFindMyState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchFindMyState:*(void *)(a1 + 40)];
}

uint64_t __37__DKFindMyProvider_fetchFindMyState___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F25CB8] sharedInstance];
  int v3 = [v2 isChangingState];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = [MEMORY[0x263F25CB8] sharedInstance];
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, [v5 isEnabled]);
  }
  return v3 ^ 1u;
}

- (void)disableFindMyWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(DKFindMyProvider *)self stateChangeBlock];
  if (objc_claimAutoreleasedReturnValue()) {
    -[DKFindMyProvider disableFindMyWithPresentingViewController:completion:]();
  }
  v8 = [MEMORY[0x263F25CB8] sharedInstance];
  char v9 = [v8 isEnabled];

  if (v9)
  {
    v10 = _DKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237B3F000, v10, OS_LOG_TYPE_DEFAULT, "Prompting to disable Find My...", buf, 2u);
    }

    v11 = [MEMORY[0x263EFB210] defaultStore];
    v12 = objc_msgSend(v11, "aa_primaryAppleAccount");

    v13 = [DKFindMySignOutController alloc];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke;
    v17[3] = &unk_264CF0E40;
    id v20 = v7;
    id v14 = v6;
    id v18 = v14;
    v19 = self;
    v15 = [(DKFindMySignOutController *)v13 initWithAccount:v12 withCompletion:v17];
    v16 = [v14 navigationController];
    [v16 pushViewController:v15 animated:1];
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

void __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke(id *a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_2;
    block[3] = &unk_264CF0A98;
    id v14 = a1[4];
    dispatch_async(MEMORY[0x263EF83A0], block);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_3;
    v11[3] = &unk_264CF0DF8;
    id v12 = a1[6];
    [a1[5] setStateChangeBlock:v11];
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:a1[5] selector:sel__locatorStateDidChange_ name:*MEMORY[0x263F25C28] object:0];

    id v7 = _DKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_237B3F000, v7, OS_LOG_TYPE_DEFAULT, "Disabling Find My...", v10, 2u);
    }

    v8 = [MEMORY[0x263F25CB8] sharedInstance];
    [v8 disableInContext:4 withWipeToken:v5 completion:&__block_literal_global_17];

    char v9 = _DKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_237B3F000, v9, OS_LOG_TYPE_DEFAULT, "Waiting for Find My to be disabled...", v10, 2u);
    }
  }
}

void __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationController];
  int v3 = [v2 view];
  [v3 setUserInteractionEnabled:0];

  id v6 = (id)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v6];
  id v5 = [*(id *)(a1 + 32) navigationItem];
  [v5 setRightBarButtonItem:v4];

  [v6 startAnimating];
}

uint64_t __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_3(uint64_t a1)
{
  v2 = [MEMORY[0x263F25CB8] sharedInstance];
  int v3 = [v2 isChangingState];

  if (v3)
  {
    uint64_t v4 = _DKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Find My state did update, but is still changing", buf, 2u);
    }

    return 0;
  }
  id v5 = [MEMORY[0x263F25CB8] sharedInstance];
  int v6 = [v5 isEnabled];

  id v7 = _DKLogSystem();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_3_cold_1(v8);
    }

    return 0;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_237B3F000, v8, OS_LOG_TYPE_DEFAULT, "Find My state did update to disabled", v12, 2u);
  }

  v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  uint64_t v9 = 1;
  v10();
  return v9;
}

void __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_14(uint64_t a1, int a2)
{
  int v3 = _DKLogSystem();
  uint64_t v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_14_cold_1(v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Disable of Find My succeeded", v5, 2u);
  }
}

- (void)_locatorStateDidChange:(id)a3
{
  uint64_t v4 = [(DKFindMyProvider *)self stateChangeBlock];

  if (v4)
  {
    id v5 = [(DKFindMyProvider *)self stateChangeBlock];
    int v6 = v5[2]();

    if (v6)
    {
      id v7 = [MEMORY[0x263F08A00] defaultCenter];
      [v7 removeObserver:self name:*MEMORY[0x263F25C28] object:0];
    }
  }
}

- (id)stateChangeBlock
{
  return self->_stateChangeBlock;
}

- (void)setStateChangeBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)fetchFindMyState:.cold.1()
{
}

- (void)disableFindMyWithPresentingViewController:completion:.cold.1()
{
}

void __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B3F000, log, OS_LOG_TYPE_ERROR, "Find My state did update, but is still enabled", v1, 2u);
}

void __73__DKFindMyProvider_disableFindMyWithPresentingViewController_completion___block_invoke_14_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B3F000, log, OS_LOG_TYPE_ERROR, "Disable of Find My failed", v1, 2u);
}

@end