@interface CRKDmdBackedInstructordTransportProvider
- (void)fetchTransportWithCompletion:(id)a3;
@end

@implementation CRKDmdBackedInstructordTransportProvider

- (void)fetchTransportWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F39D18] currentUserConnection];
  v5 = objc_opt_new();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__CRKDmdBackedInstructordTransportProvider_fetchTransportWithCompletion___block_invoke;
  v7[3] = &unk_2646F5780;
  id v8 = v3;
  id v6 = v3;
  [v4 performRequest:v5 completion:v7];
}

void __73__CRKDmdBackedInstructordTransportProvider_fetchTransportWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9F0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__CRKDmdBackedInstructordTransportProvider_fetchTransportWithCompletion___block_invoke_2;
  v11[3] = &unk_2646F33D8;
  id v12 = v6;
  id v8 = *(id *)(a1 + 32);
  id v13 = v5;
  id v14 = v8;
  id v9 = v5;
  id v10 = v6;
  objc_msgSend(v7, "cat_performBlockOnMainRunLoop:", v11);
}

void __73__CRKDmdBackedInstructordTransportProvider_fetchTransportWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) endpoint];
    id v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v5];
    v4 = (void *)[objc_alloc(MEMORY[0x263F39CE8]) initWithXPCConnection:v3];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

@end