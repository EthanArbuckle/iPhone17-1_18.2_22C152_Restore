@interface FAPeerPaymentHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (FAAppleCashPresentationHandler)appleCashPresentationHandler;
- (RUIServerHookDelegate)delegate;
- (void)_handlePeerPaymentActionWithAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setAppleCashPresentationHandler:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FAPeerPaymentHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"family:peerPayment"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F25C10]];
  char v5 = [v4 isEqualToString:@"family:peerPayment"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = [a3 attributes];
  [(FAPeerPaymentHook *)self _handlePeerPaymentActionWithAttributes:v9 completion:v8];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(FAPeerPaymentHook *)self _handlePeerPaymentActionWithAttributes:v7 completion:v6];
}

- (void)_handlePeerPaymentActionWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = [v6 objectForKeyedSubscript:@"handleInHook"];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = [WeakRetained presentationContextForHook:self];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      v12 = [[FAAppleCashPresentationHandler alloc] initWithNavigationController:v11];

      [(FAPeerPaymentHook *)self setAppleCashPresentationHandler:v12];
      v13 = [(FAPeerPaymentHook *)self appleCashPresentationHandler];
      [v13 presentPeerPaymentControllerWithAttributes:v6 completion:&__block_literal_global_0];
    }
    else
    {
      v13 = _FALogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[FAPeerPaymentHook _handlePeerPaymentActionWithAttributes:completion:]((uint64_t)v10, v13);
      }
    }
  }
  else
  {
    v7[2](v7, 1, 0);
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

- (FAAppleCashPresentationHandler)appleCashPresentationHandler
{
  return self->_appleCashPresentationHandler;
}

- (void)setAppleCashPresentationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleCashPresentationHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handlePeerPaymentActionWithAttributes:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "FAPeerPaymentHook - Expected Navigation controller but got %@", (uint8_t *)&v4, 0xCu);
}

@end