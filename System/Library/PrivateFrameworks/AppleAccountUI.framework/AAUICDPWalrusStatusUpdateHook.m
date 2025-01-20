@interface AAUICDPWalrusStatusUpdateHook
- (AAUICDPWalrusStatusUpdateHook)initWithAppleAccount:(id)a3;
- (id)additionalPayloadForAction:(id)a3 error:(id)a4;
- (id)changeControllerForAction:(id)a3;
- (void)postCompletionProcessingForAction:(id)a3 error:(id)a4;
@end

@implementation AAUICDPWalrusStatusUpdateHook

- (AAUICDPWalrusStatusUpdateHook)initWithAppleAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUICDPWalrusStatusUpdateHook;
  v6 = [(AAUICDPWalrusStatusUpdateHook *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)changeControllerForAction:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"walrus:enable"])
  {
    uint64_t v5 = 1;
  }
  else
  {
    if (![v4 isEqualToString:@"walrus:disable"])
    {
      v8 = 0;
      goto LABEL_9;
    }
    uint64_t v5 = 2;
  }
  if (objc_opt_respondsToSelector())
  {
    v6 = [MEMORY[0x263F290F0] sharedInstance];
    v7 = [v6 altDSIDForAccount:self->_account];

    v8 = [MEMORY[0x263F34A28] controllerWithTargetWalrusStatus:v5 altDSID:v7];
  }
  else
  {
    v8 = [MEMORY[0x263F34A28] controllerWithTargetWalrusStatus:v5];
  }
LABEL_9:

  return v8;
}

- (id)additionalPayloadForAction:(id)a3 error:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    if ([a3 isEqualToString:@"walrus:enable"])
    {
      v11 = @"walrusClientState";
      v12[0] = &unk_26BD70BC8;
      uint64_t v5 = NSDictionary;
      v6 = (void **)v12;
      v7 = &v11;
    }
    else
    {
      objc_super v9 = @"walrusClientState";
      v10 = &unk_26BD70BE0;
      uint64_t v5 = NSDictionary;
      v6 = &v10;
      v7 = &v9;
    }
    id v4 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:1];
  }
  return v4;
}

- (void)postCompletionProcessingForAction:(id)a3 error:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  int v6 = [a3 isEqualToString:@"walrus:disable"];
  if (!a4 && v6)
  {
    v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Dismissing Walrus CFUs", v12, 2u);
    }

    id v8 = objc_alloc_init(MEMORY[0x263F25868]);
    account = self->_account;
    uint64_t v10 = *MEMORY[0x263F25680];
    v13[0] = *MEMORY[0x263F25688];
    v13[1] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    [v8 dismissFollowUpsForAccount:account identifiers:v11 completion:&__block_literal_global_17];
  }
}

void __73__AAUICDPWalrusStatusUpdateHook_postCompletionProcessingForAction_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __73__AAUICDPWalrusStatusUpdateHook_postCompletionProcessingForAction_error___block_invoke_cold_2((uint64_t)v4, v5);
    }
  }
  if (a2)
  {
    int v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __73__AAUICDPWalrusStatusUpdateHook_postCompletionProcessingForAction_error___block_invoke_cold_1(v6);
    }
  }
}

- (void).cxx_destruct
{
}

void __73__AAUICDPWalrusStatusUpdateHook_postCompletionProcessingForAction_error___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Successfully dismissed Walrus CFUs", v1, 2u);
}

void __73__AAUICDPWalrusStatusUpdateHook_postCompletionProcessingForAction_error___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Error occurred in dismissing Walrus CFUs: %@", (uint8_t *)&v2, 0xCu);
}

@end