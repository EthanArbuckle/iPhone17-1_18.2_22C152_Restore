@interface BSBrandManager
- (BSBrandManager)initWithBrandType:(int64_t)a3 cachingEnabled:(BOOL)a4;
- (BSBrandManager)initWithBrandType:(int64_t)a3 cachingEnabled:(BOOL)a4 brandDataSourceOpaqueWrapper:(id)a5;
- (BSBrandManager)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4 brandDataSourceOpaqueWrapper:(id)a5;
- (void)brandWithURI:(id)a3 completion:(id)a4;
- (void)brandWithURI:(id)a3 usingSim:(id)a4 completion:(id)a5;
- (void)clearUnusedCachedLogos:(id)a3;
- (void)fetchAssetWithURL:(id)a3 type:(int64_t)a4 completion:(id)a5;
@end

@implementation BSBrandManager

- (BSBrandManager)initWithBrandType:(int64_t)a3 cachingEnabled:(BOOL)a4
{
  if (self) {
    return [(BSBrandManager *)self initWithCachingEnabled:a4 cacheURL:0 brandDataSourceOpaqueWrapper:0];
  }
  return self;
}

- (BSBrandManager)initWithBrandType:(int64_t)a3 cachingEnabled:(BOOL)a4 brandDataSourceOpaqueWrapper:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if (v7)
  {
    v8 = self;
    BOOL v9 = v5;
    id v10 = v7;
  }
  else
  {
    if (!self)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v8 = self;
    BOOL v9 = v5;
    id v10 = 0;
  }
  v11 = [(BSBrandManager *)v8 initWithCachingEnabled:v9 cacheURL:0 brandDataSourceOpaqueWrapper:v10];
LABEL_6:
  v12 = v11;

  return v12;
}

- (BSBrandManager)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4 brandDataSourceOpaqueWrapper:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BSBrandManager;
  id v10 = [(BSBrandManager *)&v15 init];
  if (v10)
  {
    if (!v9)
    {
      v11 = objc_alloc_init(IMBrandChatBotBrandDataSourceObjcShim);
      id v9 = [(IMBrandChatBotBrandDataSourceObjcShim *)v11 opaqueWrapper];
    }
    v12 = [[BSBrandManagerObjcShim alloc] initWithCachingEnabled:v6 cacheURL:v8 brandDataSourceWrapper:v9];
    shim = v10->_shim;
    v10->_shim = v12;
  }
  return v10;
}

- (void)brandWithURI:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (self) {
    self = (BSBrandManager *)self->_shim;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__BSBrandManager_brandWithURI_completion___block_invoke;
  v8[3] = &unk_26485D790;
  id v9 = v6;
  id v7 = v6;
  [(BSBrandManager *)self brandWithURI:a3 completion:v8];
}

void __42__BSBrandManager_brandWithURI_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[BSBrand alloc] _initWithShim:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)brandWithURI:(id)a3 usingSim:(id)a4 completion:(id)a5
{
  id v8 = a5;
  if (self) {
    self = (BSBrandManager *)self->_shim;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__BSBrandManager_brandWithURI_usingSim_completion___block_invoke;
  v10[3] = &unk_26485D790;
  id v11 = v8;
  id v9 = v8;
  [(BSBrandManager *)self brandWithURI:a3 usingSim:a4 completion:v10];
}

void __51__BSBrandManager_brandWithURI_usingSim_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[BSBrand alloc] _initWithShim:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)clearUnusedCachedLogos:(id)a3
{
  if (self) {
    self = (BSBrandManager *)self->_shim;
  }
  [(BSBrandManager *)self clearUnusedCachedLogos:a3];
}

- (void)fetchAssetWithURL:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  if (self) {
    self = (BSBrandManager *)self->_shim;
  }
  [(BSBrandManager *)self fetchAssetWithURL:a3 assetType:a4 completion:a5];
}

- (void).cxx_destruct
{
}

@end