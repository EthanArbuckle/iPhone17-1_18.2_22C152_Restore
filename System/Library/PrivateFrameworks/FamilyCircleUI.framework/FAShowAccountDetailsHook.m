@interface FAShowAccountDetailsHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_showAccountDetailsFor:(id)a3 withCompletion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FAShowAccountDetailsHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"family:showAccountDetails"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F25C10]];
  char v5 = [v4 isEqualToString:@"family:showAccountDetails"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = [a4 objectForKeyedSubscript:@"altDSID"];
  [(FAShowAccountDetailsHook *)self _showAccountDetailsFor:v9 withCompletion:v8];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 clientInfo];
  v7 = [v8 objectForKeyedSubscript:@"altDSID"];
  [(FAShowAccountDetailsHook *)self _showAccountDetailsFor:v7 withCompletion:v6];
}

- (void)_showAccountDetailsFor:(id)a3 withCompletion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[FAShowAccountDetailsHook _showAccountDetailsFor:withCompletion:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "%s - show account details for %@", buf, 0x16u);
  }

  id v9 = objc_opt_new();
  [v9 setCachePolicy:1];
  [v9 setQualityOfService:33];
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke;
  v12[3] = &unk_264349CF8;
  objc_copyWeak(&v15, (id *)buf);
  id v10 = v7;
  id v14 = v10;
  id v11 = v6;
  id v13 = v11;
  [v9 startRequestWithCompletionHandler:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v6)
  {
    id v8 = _FALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_cold_1((uint64_t)v6, v8);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    id v9 = [v5 members];
    id v10 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_12];
    id v11 = [v9 filteredArrayUsingPredicate:v10];
    v12 = [v11 firstObject];

    id v13 = v12;
    id v14 = v13;
    if ([a1[4] length])
    {
      id v15 = [v5 members];
      v16 = (void *)MEMORY[0x263F08A98];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_2;
      v29[3] = &unk_264349CA8;
      id v30 = a1[4];
      v17 = [v16 predicateWithBlock:v29];
      __int16 v18 = [v15 filteredArrayUsingPredicate:v17];
      id v14 = [v18 firstObject];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_3;
    block[3] = &unk_264349CD0;
    id v23 = v13;
    id v24 = v14;
    id v25 = v5;
    id v26 = WeakRetained;
    id v19 = a1[5];
    id v27 = 0;
    id v28 = v19;
    id v20 = v14;
    id v21 = v13;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_29(uint64_t a1, void *a2)
{
  return [a2 isMe];
}

uint64_t __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 altDSID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_3(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = +[FASwiftUIHostingControllerProvider familyMemberAccountChangePasswordControllerWithMainAccount:a1[4] memberToShow:a1[5] familyCircle:a1[6]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[7] + 8));
  uint64_t v4 = [WeakRetained presentationContextForHook:a1[7]];

  [v4 showViewController:v2 sender:0];
  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 136315650;
    id v9 = "-[FAShowAccountDetailsHook _showAccountDetailsFor:withCompletion:]_block_invoke_3";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "%s - %@ Displaying member details for %@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(a1[9] + 16))();
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

void __66__FAShowAccountDetailsHook__showAccountDetailsFor_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[FAShowAccountDetailsHook _showAccountDetailsFor:withCompletion:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "Error %s - %@", (uint8_t *)&v2, 0x16u);
}

@end