@interface FAShowSubscriptionsHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation FAShowSubscriptionsHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"family:showSubscriptionsPage"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F25C10]];
  char v5 = [v4 isEqualToString:@"family:showSubscriptionsPage"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  objc_msgSend(NSURL, "URLWithString:", *MEMORY[0x263F17FE0], a4, a5, a6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (SKAccountPageViewController *)[objc_alloc(MEMORY[0x263F17F90]) initWithAccountURL:v11];
  controller = self->controller;
  self->controller = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = [WeakRetained presentationContextForHook:self];

  [v10 showViewController:self->controller sender:0];
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->controller, 0);
}

@end