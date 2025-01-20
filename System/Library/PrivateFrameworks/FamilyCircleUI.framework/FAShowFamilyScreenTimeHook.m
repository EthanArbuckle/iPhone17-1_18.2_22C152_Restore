@interface FAShowFamilyScreenTimeHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_showFamilyScreenTimeWithCompletion:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FAShowFamilyScreenTimeHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"family:showFamilyScreenTime"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F25C10]];
  char v5 = [v4 isEqualToString:@"family:showFamilyScreenTime"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
}

- (void)_showFamilyScreenTimeWithCompletion:(id)a3
{
  char v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = [WeakRetained presentationContextForHook:self];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v8 = (void *)getSTFamilyCircleViewControllerProviderClass_softClass;
  uint64_t v18 = getSTFamilyCircleViewControllerProviderClass_softClass;
  if (!getSTFamilyCircleViewControllerProviderClass_softClass)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getSTFamilyCircleViewControllerProviderClass_block_invoke;
    v14[3] = &unk_264348998;
    v14[4] = &v15;
    __getSTFamilyCircleViewControllerProviderClass_block_invoke((uint64_t)v14);
    v8 = (void *)v16[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v15, 8);
  v10 = [v9 familyRootViewControllerPresentedAsModal:isKindOfClass & 1];
  v11 = _FALogSystem();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_2189F0000, v12, OS_LOG_TYPE_DEFAULT, "We have a screen time family view controller, presenting", (uint8_t *)v14, 2u);
    }

    [v6 showViewController:v10 sender:self];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FAShowFamilyScreenTimeHook _showFamilyScreenTimeWithCompletion:](v12);
    }

    v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3BDB8] code:-1000 userInfo:0];
    v4[2](v4, 0, v13);
  }
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

- (void)_showFamilyScreenTimeWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2189F0000, log, OS_LOG_TYPE_ERROR, "No screen time family view controller found", v1, 2u);
}

@end