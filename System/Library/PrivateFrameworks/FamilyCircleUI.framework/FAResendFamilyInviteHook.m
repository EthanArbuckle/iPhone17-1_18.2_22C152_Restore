@interface FAResendFamilyInviteHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)loadResendRequestWithAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FAResendFamilyInviteHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"family:resendInvite"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F25C10]];
  char v5 = [v4 isEqualToString:@"family:resendInvite"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a6;
  v10 = _FALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v8 attributes];
    int v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "process element attributes %@", (uint8_t *)&v13, 0xCu);
  }
  v12 = [v8 attributes];
  [(FAResendFamilyInviteHook *)self loadResendRequestWithAttributes:v12 completion:v9];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(FAResendFamilyInviteHook *)self loadResendRequestWithAttributes:v7 completion:v6];
}

- (void)loadResendRequestWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectForKeyedSubscript:@"resendInviteUrl"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  id v9 = [WeakRetained presentationContextForHook:self];

  v10 = [[FACircleContext alloc] initWithEventType:@"FACircleEventTypeInviteViaMessages"];
  if (v7)
  {
    v11 = (void *)[objc_alloc(NSURL) initWithString:v7];
    [(FACircleContext *)v10 setUrlForContext:v11];
    v12 = [[FACircleStateController alloc] initWithPresenter:v9];
    [(FACircleStateController *)v12 setPresentationType:2];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__FAResendFamilyInviteHook_loadResendRequestWithAttributes_completion___block_invoke;
    v13[3] = &unk_264348E70;
    id v14 = v6;
    [(FACircleStateController *)v12 performWithContext:v10 completion:v13];
  }
}

void __71__FAResendFamilyInviteHook_loadResendRequestWithAttributes_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [v3 error];

  if (v4)
  {
    char v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 error];
      id v7 = [v6 localizedDescription];
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "Error from state controller for resend family invite %@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v3 error];
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, 1, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end