@interface CRKScreenshotServiceProxy
- (CRKScreenshotServiceProxy)init;
- (CRKValidXPCConnectionProvider)connectionProvider;
- (void)_fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4;
- (void)fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4;
@end

@implementation CRKScreenshotServiceProxy

- (CRKScreenshotServiceProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKScreenshotServiceProxy;
  v2 = [(CRKScreenshotServiceProxy *)&v6 init];
  if (v2)
  {
    v3 = [[CRKValidXPCConnectionProvider alloc] initWithBuilder:&__block_literal_global_93];
    connectionProvider = v2->_connectionProvider;
    v2->_connectionProvider = v3;
  }
  return v2;
}

uint64_t __33__CRKScreenshotServiceProxy_init__block_invoke()
{
  return objc_msgSend(MEMORY[0x263F08D68], "crk_screenshotServiceConnection");
}

- (void)fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__CRKScreenshotServiceProxy_fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke;
  v9[3] = &unk_2646F4808;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  -[CRKScreenshotServiceProxy _fetchScreenshotDataWithMaximumSizeInPixels:completion:](self, "_fetchScreenshotDataWithMaximumSizeInPixels:completion:", v9, width, height);
}

void __83__CRKScreenshotServiceProxy_fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(id *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchScreenshotDataWithMaximumSizeInPixels:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(CRKScreenshotServiceProxy *)self connectionProvider];
  v9 = [v8 connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke;
  v15[3] = &unk_2646F34B0;
  id v10 = v7;
  id v16 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_3;
  v13[3] = &unk_2646F53F0;
  id v14 = v10;
  id v12 = v10;
  objc_msgSend(v11, "fetchScreenshotDataWithMaximumSizeInPixels:completion:", v13, width, height);
}

void __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_2;
  v6[3] = &unk_2646F3488;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_4;
  block[3] = &unk_2646F3B00;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __84__CRKScreenshotServiceProxy__fetchScreenshotDataWithMaximumSizeInPixels_completion___block_invoke_4(void *a1)
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