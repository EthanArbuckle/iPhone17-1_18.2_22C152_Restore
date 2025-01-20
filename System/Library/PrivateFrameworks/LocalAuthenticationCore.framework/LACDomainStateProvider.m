@interface LACDomainStateProvider
- (LACDomainStateProvider)initWithProviders:(id)a3;
- (void)_domainStateWithProviders:(id)a3 request:(id)a4 partialResult:(id)a5 completion:(id)a6;
- (void)domainStateForRequest:(id)a3 completion:(id)a4;
@end

@implementation LACDomainStateProvider

- (LACDomainStateProvider)initWithProviders:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDomainStateProvider;
  v6 = [(LACDomainStateProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_providers, a3);
  }

  return v7;
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
}

- (void)_domainStateWithProviders:(id)a3 request:(id)a4 partialResult:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count])
  {
    objc_initWeak(&location, self);
    v14 = [v10 firstObject];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __85__LACDomainStateProvider__domainStateWithProviders_request_partialResult_completion___block_invoke;
    v15[3] = &unk_2653B7028;
    objc_copyWeak(&v20, &location);
    id v19 = v13;
    id v16 = v10;
    id v17 = v12;
    id v18 = v11;
    [v14 domainStateForRequest:v18 completion:v15];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, id, void))v13 + 2))(v13, v12, 0);
  }
}

void __85__LACDomainStateProvider__domainStateWithProviders_request_partialResult_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 32), "count") - 1);
      v8 = (void *)[*(id *)(a1 + 40) mutableCopy];
      [v8 addEntriesFromDictionary:v9];
      [WeakRetained _domainStateWithProviders:v7 request:*(void *)(a1 + 48) partialResult:v8 completion:*(void *)(a1 + 56)];
    }
  }
}

- (void).cxx_destruct
{
}

@end