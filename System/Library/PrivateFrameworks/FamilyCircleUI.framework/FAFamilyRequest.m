@interface FAFamilyRequest
- (ACAccount)appleAccount;
- (FAFamilyRequest)initWithGrandSlamSigner:(id)a3;
- (id)_endpoint;
- (id)_queryString;
- (id)urlRequest;
- (void)URLRequestWithCompletion:(id)a3;
- (void)_baseURLForEndpoint:(id)a3 withCompletion:(id)a4;
- (void)_configureRequest:(id)a3 includePayload:(BOOL)a4;
- (void)_decoratedURLWithCompletion:(id)a3;
- (void)setAppleAccount:(id)a3;
- (void)urlRequest;
@end

@implementation FAFamilyRequest

- (FAFamilyRequest)initWithGrandSlamSigner:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FAFamilyRequest;
  v5 = [(AAFamilyRequest *)&v11 initWithGrandSlamSigner:v4];
  if (v5)
  {
    v6 = [v4 accountStore];
    v7 = [v4 grandSlamAccount];
    uint64_t v8 = objc_msgSend(v6, "aida_iCloudAccountMatchingAppleIDAuthAccount:", v7);
    appleAccount = v5->_appleAccount;
    v5->_appleAccount = (ACAccount *)v8;
  }
  return v5;
}

- (void)_configureRequest:(id)a3 includePayload:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = objc_alloc(MEMORY[0x263F3BFA8]);
  v7 = [(FAFamilyRequest *)self appleAccount];
  uint64_t v8 = (void *)[v6 initWithAccount:v7];

  [v8 setAttachSetupHeader:0];
  [v8 addFresnoHeadersToRequest:v9];
  if (v4) {
    [v8 addFresnoPayloadToRequest:v9 additionalPayload:0];
  }
}

- (id)_endpoint
{
  return (id)*MEMORY[0x263F3BEC0];
}

- (id)_queryString
{
  return 0;
}

- (void)_baseURLForEndpoint:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__FAFamilyRequest__baseURLForEndpoint_withCompletion___block_invoke;
  v10[3] = &unk_26434A358;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 URLForEndpoint:v9 withCompletion:v10];
}

void __54__FAFamilyRequest__baseURLForEndpoint_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  v7 = _FALogSystem();
  id v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "Recieved url for endpoint %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __54__FAFamilyRequest__baseURLForEndpoint_withCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_decoratedURLWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FAFamilyRequest *)self _endpoint];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__FAFamilyRequest__decoratedURLWithCompletion___block_invoke;
  v7[3] = &unk_26434A380;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FAFamilyRequest *)self _baseURLForEndpoint:v5 withCompletion:v7];
}

void __47__FAFamilyRequest__decoratedURLWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v12 = _FALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __47__FAFamilyRequest__decoratedURLWithCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = [MEMORY[0x263F08BA0] componentsWithURL:v5 resolvingAgainstBaseURL:0];
    uint64_t v9 = [*(id *)(a1 + 32) _queryString];
    [v8 setQuery:v9];

    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [v8 URL];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
  }
}

- (void)URLRequestWithCompletion:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FAFamilyRequest;
  id v5 = [(AAFamilyRequest *)&v13 urlRequest];
  id v6 = (void *)[v5 mutableCopy];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__FAFamilyRequest_URLRequestWithCompletion___block_invoke;
  v9[3] = &unk_26434A3A8;
  id v10 = v6;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v6;
  [(FAFamilyRequest *)self _decoratedURLWithCompletion:v9];
}

void __44__FAFamilyRequest_URLRequestWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setURL:a2];
  [*(id *)(a1 + 40) _configureRequest:*(void *)(a1 + 32) includePayload:0];
  [*(id *)(a1 + 32) setHTTPMethod:@"GET"];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)urlRequest
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[FAFamilyRequest urlRequest](v3);
  }

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__FAFamilyRequest_urlRequest__block_invoke;
  v8[3] = &unk_26434A3D0;
  id v10 = &v11;
  id v5 = v4;
  uint64_t v9 = v5;
  [(FAFamilyRequest *)self URLRequestWithCompletion:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __29__FAFamilyRequest_urlRequest__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

void __54__FAFamilyRequest__baseURLForEndpoint_withCompletion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2189F0000, v0, OS_LOG_TYPE_ERROR, "No url received %@", v1, 0xCu);
}

void __47__FAFamilyRequest__decoratedURLWithCompletion___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2189F0000, v1, OS_LOG_TYPE_ERROR, "Unable to decorate URL %@ error %@", v2, 0x16u);
}

- (void)urlRequest
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_2189F0000, log, OS_LOG_TYPE_ERROR, "Please use URLRequestWithCompletion:", v1, 2u);
}

@end