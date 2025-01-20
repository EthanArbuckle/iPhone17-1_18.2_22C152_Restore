@interface CRKBooksServiceProxy
- (CRKBooksServiceProxy)init;
- (CRKValidXPCConnectionProvider)connectionProvider;
- (void)_fetchBooksWithRequest:(id)a3 completion:(id)a4;
- (void)_fetchChaptersWithRequest:(id)a3 completion:(id)a4;
- (void)fetchBooksWithRequest:(id)a3 completion:(id)a4;
- (void)fetchChaptersWithRequest:(id)a3 completion:(id)a4;
@end

@implementation CRKBooksServiceProxy

- (CRKBooksServiceProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKBooksServiceProxy;
  v2 = [(CRKBooksServiceProxy *)&v6 init];
  if (v2)
  {
    v3 = [[CRKValidXPCConnectionProvider alloc] initWithBuilder:&__block_literal_global_11];
    connectionProvider = v2->_connectionProvider;
    v2->_connectionProvider = v3;
  }
  return v2;
}

uint64_t __28__CRKBooksServiceProxy_init__block_invoke()
{
  return objc_msgSend(MEMORY[0x263F08D68], "crk_booksServiceConnection");
}

- (void)fetchBooksWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__CRKBooksServiceProxy_fetchBooksWithRequest_completion___block_invoke;
  v8[3] = &unk_2646F3AD8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CRKBooksServiceProxy *)self _fetchBooksWithRequest:a3 completion:v8];
}

void __57__CRKBooksServiceProxy_fetchBooksWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchBooksWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKBooksServiceProxy *)self connectionProvider];
  id v9 = [v8 connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__CRKBooksServiceProxy__fetchBooksWithRequest_completion___block_invoke;
  v15[3] = &unk_2646F34B0;
  id v10 = v6;
  id v16 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__CRKBooksServiceProxy__fetchBooksWithRequest_completion___block_invoke_3;
  v13[3] = &unk_2646F3B28;
  id v14 = v10;
  id v12 = v10;
  [v11 fetchBooksWithRequest:v7 completion:v13];
}

void __58__CRKBooksServiceProxy__fetchBooksWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__CRKBooksServiceProxy__fetchBooksWithRequest_completion___block_invoke_2;
  v6[3] = &unk_2646F3488;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __58__CRKBooksServiceProxy__fetchBooksWithRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __58__CRKBooksServiceProxy__fetchBooksWithRequest_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CRKBooksServiceProxy__fetchBooksWithRequest_completion___block_invoke_4;
  block[3] = &unk_2646F3B00;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __58__CRKBooksServiceProxy__fetchBooksWithRequest_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchChaptersWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__CRKBooksServiceProxy_fetchChaptersWithRequest_completion___block_invoke;
  v8[3] = &unk_2646F3B50;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(CRKBooksServiceProxy *)self _fetchChaptersWithRequest:a3 completion:v8];
}

void __60__CRKBooksServiceProxy_fetchChaptersWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchChaptersWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKBooksServiceProxy *)self connectionProvider];
  id v9 = [v8 connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__CRKBooksServiceProxy__fetchChaptersWithRequest_completion___block_invoke;
  v15[3] = &unk_2646F34B0;
  id v10 = v6;
  id v16 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__CRKBooksServiceProxy__fetchChaptersWithRequest_completion___block_invoke_3;
  v13[3] = &unk_2646F3B78;
  id v14 = v10;
  id v12 = v10;
  [v11 fetchChaptersWithRequest:v7 completion:v13];
}

void __61__CRKBooksServiceProxy__fetchChaptersWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__CRKBooksServiceProxy__fetchChaptersWithRequest_completion___block_invoke_2;
  v6[3] = &unk_2646F3488;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __61__CRKBooksServiceProxy__fetchChaptersWithRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __61__CRKBooksServiceProxy__fetchChaptersWithRequest_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CRKBooksServiceProxy__fetchChaptersWithRequest_completion___block_invoke_4;
  block[3] = &unk_2646F3B00;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__CRKBooksServiceProxy__fetchChaptersWithRequest_completion___block_invoke_4(void *a1)
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