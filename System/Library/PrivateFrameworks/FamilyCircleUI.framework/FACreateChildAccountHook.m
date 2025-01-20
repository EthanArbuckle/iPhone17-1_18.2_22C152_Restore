@interface FACreateChildAccountHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIObjectModel)objectModel;
- (RUIServerHookDelegate)delegate;
- (void)_handleCreateChildAccountWithCompletion:(id)a3;
- (void)createChildControllerDidPresentInitialViewController:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setObjectModel:(id)a3;
@end

@implementation FACreateChildAccountHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"family:createChildAccount"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F25C10]];
  char v5 = [v4 isEqualToString:@"family:createChildAccount"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
}

- (void)_handleCreateChildAccountWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "handling child account creation (via rui hook)", buf, 2u);
  }

  v6 = [MEMORY[0x263EFB210] defaultStore];
  v7 = objc_msgSend(v6, "aa_primaryAppleAccount");
  if (v7)
  {
    v8 = [[FACreateChildController alloc] initWithAppleAccount:v7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = [WeakRetained presentationContextForHook:self];
    [(FACreateChildController *)v8 setPresentingViewController:v10];

    [(RUIObjectModel *)self->_objectModel startActivityIndicator];
    [(FACreateChildController *)v8 setDelegate:self];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__FACreateChildAccountHook__handleCreateChildAccountWithCompletion___block_invoke;
    v11[3] = &unk_264348FA8;
    id v12 = v4;
    [(FACreateChildController *)v8 createChildAccountWithCompletion:v11];

LABEL_7:
    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x263F087E8], "fa_familyErrorWithCode:", -1004);
    v8 = (FACreateChildController *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, FACreateChildController *))v4 + 2))(v4, 0, v8);
    goto LABEL_7;
  }
LABEL_8:
}

void __68__FACreateChildAccountHook__handleCreateChildAccountWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"NO";
    if (a2) {
      v7 = @"YES";
    }
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "child account creation(via rui hook) completed with success: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)createChildControllerDidPresentInitialViewController:(id)a3
{
  id v3 = [(FACreateChildAccountHook *)self objectModel];
  [v3 stopActivityIndicator];
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RUIObjectModel)objectModel
{
  return self->_objectModel;
}

- (void)setObjectModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end