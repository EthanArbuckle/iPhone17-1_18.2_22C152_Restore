@interface AAUIPaymentVerificationHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (void)_validatePaymentVerificationWithServerAttributes:(id)a3 objectModel:(id)a4 completion:(id)a5;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation AAUIPaymentVerificationHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"ams:paymentVerification"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKey:@"action"];
  char v5 = [v4 isEqualToString:@"ams:paymentVerification"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 clientInfo];
  [(AAUIPaymentVerificationHook *)self _validatePaymentVerificationWithServerAttributes:v8 objectModel:v7 completion:v6];
}

- (void)_validatePaymentVerificationWithServerAttributes:(id)a3 objectModel:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke;
  block[3] = &unk_263F926B8;
  id v11 = v9;
  id v36 = v11;
  id v12 = v8;
  id v37 = v12;
  dispatch_async(MEMORY[0x263EF83A0], block);
  v13 = _AAUILogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v12;
    _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Payment Verification invoked : %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = [WeakRetained presentationContextForHook:self];

  v16 = (void *)MEMORY[0x263F27B28];
  v17 = [getAMSUIPaymentVerificationTokenFetchTaskClass() bagSubProfile];
  v18 = [getAMSUIPaymentVerificationTokenFetchTaskClass() bagSubProfileVersion];
  v19 = [v16 bagForProfile:v17 profileVersion:v18];

  id v20 = objc_alloc((Class)getAMSUIPaymentVerificationTokenFetchTaskClass());
  v21 = [v12 objectForKeyedSubscript:@"verificationMode"];
  uint64_t v22 = [v21 integerValue];
  v23 = [v12 objectForKeyedSubscript:@"accountName"];
  v24 = (void *)[v20 initWithMode:v22 accountParameters:v12 viewController:v15 bag:v19 displayName:v23];

  v25 = [v24 performTask];
  if (v25)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_2;
    v29[3] = &unk_263F939E8;
    v29[4] = self;
    id v31 = v10;
    id v30 = v11;
    [v25 addFinishBlock:v29];

    v26 = v31;
  }
  else
  {
    v27 = _AAUILogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[AAUIPaymentVerificationHook _validatePaymentVerificationWithServerAttributes:objectModel:completion:](v27);
    }

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_35;
    v32[3] = &unk_263F92048;
    id v33 = v11;
    id v34 = v10;
    v28 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], v32);

    v26 = v33;
  }
}

uint64_t __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startActivityIndicatorWithAttributes:*(void *)(a1 + 40)];
}

void __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_35(uint64_t a1)
{
  [*(id *)(a1 + 32) stopActivityIndicator];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -3);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
  }
}

void __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 tokenData];
    id v9 = @"YES";
    if (!v8) {
      id v9 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    v24 = v9;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "PaymentVerificationTokenFetch retuned with token %@ error : %@", buf, 0x16u);
  }
  id v10 = [v5 tokenData];

  if (v10)
  {
    id v11 = objc_alloc_init(AAUIServerHookResponse);
    [a1[4] setServerHookResponse:v11];

    v21 = @"token";
    id v12 = [v5 tokenData];
    v13 = [v12 base64EncodedStringWithOptions:0];
    uint64_t v22 = v13;
    v14 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v15 = [a1[4] serverHookResponse];
    [v15 setAdditionalPayload:v14];

    v16 = (void (**)(id, uint64_t, void))a1[6];
    if (v16) {
      v16[2](v16, 1, 0);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_45;
    block[3] = &unk_263F92348;
    id v18 = a1[5];
    id v20 = a1[6];
    id v19 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __103__AAUIPaymentVerificationHook__validatePaymentVerificationWithServerAttributes_objectModel_completion___block_invoke_45(uint64_t a1)
{
  [*(id *)(a1 + 32) stopActivityIndicator];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
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

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_validatePaymentVerificationWithServerAttributes:(os_log_t)log objectModel:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Unable to perform payment verification!", v1, 2u);
}

@end