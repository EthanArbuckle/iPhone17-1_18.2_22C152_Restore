@interface CRKInternetDateServiceProxy
- (CRKInternetDateServiceProxy)init;
- (CRKValidXPCConnectionProvider)connectionProvider;
- (void)_fetchInternetDateWithCompletion:(id)a3;
- (void)fetchInternetDateWithCompletion:(id)a3;
@end

@implementation CRKInternetDateServiceProxy

- (CRKInternetDateServiceProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKInternetDateServiceProxy;
  v2 = [(CRKInternetDateServiceProxy *)&v6 init];
  if (v2)
  {
    v3 = [[CRKValidXPCConnectionProvider alloc] initWithBuilder:&__block_literal_global_115];
    connectionProvider = v2->_connectionProvider;
    v2->_connectionProvider = v3;
  }
  return v2;
}

uint64_t __35__CRKInternetDateServiceProxy_init__block_invoke()
{
  return objc_msgSend(MEMORY[0x263F08D68], "crk_internetDateServiceConnection");
}

- (void)fetchInternetDateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__CRKInternetDateServiceProxy_fetchInternetDateWithCompletion___block_invoke;
  v6[3] = &unk_2646F59B0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRKInternetDateServiceProxy *)self _fetchInternetDateWithCompletion:v6];
}

void __63__CRKInternetDateServiceProxy_fetchInternetDateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchInternetDateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKInternetDateServiceProxy *)self connectionProvider];
  id v6 = [v5 connection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke;
  v12[3] = &unk_2646F34B0;
  id v7 = v4;
  id v13 = v7;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v12];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_3;
  v10[3] = &unk_2646F59D8;
  id v11 = v7;
  id v9 = v7;
  [v8 fetchInternetDateWithCompletion:v10];
}

void __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_2;
  v6[3] = &unk_2646F3488;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_4;
  block[3] = &unk_2646F3B00;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __64__CRKInternetDateServiceProxy__fetchInternetDateWithCompletion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (CRKValidXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

- (void).cxx_destruct
{
}

@end