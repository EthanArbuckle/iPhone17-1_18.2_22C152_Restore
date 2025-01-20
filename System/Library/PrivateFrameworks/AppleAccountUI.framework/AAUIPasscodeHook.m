@interface AAUIPasscodeHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_validatePasscodeWithServerAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation AAUIPasscodeHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"passcode:validate"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKey:*MEMORY[0x263F63818]];
  char v5 = [v4 isEqualToString:@"passcode:validate"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(AAUIPasscodeHook *)self _validatePasscodeWithServerAttributes:v7 completion:v6];
}

- (void)_validatePasscodeWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = [WeakRetained presentationContextForHook:self];
  objc_opt_class();
  id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F63828]];
  id v11 = 0;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }

  +[AAUIPasscodeValidateController stingrayControllerWithPresenter:forceInline:](AAUIPasscodeValidateController, "stingrayControllerWithPresenter:forceInline:", v9, [v11 BOOLValue]);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (void *)v18[5];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__AAUIPasscodeHook__validatePasscodeWithServerAttributes_completion___block_invoke;
  v14[3] = &unk_263F93008;
  id v13 = v7;
  id v15 = v13;
  v16 = &v17;
  [v12 validatePasscodeStateWithCompletion:v14];

  _Block_object_dispose(&v17, 8);
}

void __69__AAUIPasscodeHook__validatePasscodeWithServerAttributes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, BOOL))(v3 + 16))(v3, a2 != 0);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
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