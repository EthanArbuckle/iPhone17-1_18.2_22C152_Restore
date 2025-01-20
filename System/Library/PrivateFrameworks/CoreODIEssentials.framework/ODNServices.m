@interface ODNServices
- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4;
- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4;
- (void)fetchConfigThrowingWithCompletion:(id)a3;
- (void)fetchConfigWithCompletion:(id)a3;
- (void)fetchGeoCodingsForAddresses:(id)a3 completion:(id)a4;
- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5;
- (void)registerICloudLoginWithCompletion:(id)a3;
- (void)unregisterICloudLoginWithCompletion:(id)a3;
- (void)updateGeoCodingsForAddresses:(id)a3 locations:(id)a4 completion:(id)a5;
@end

@implementation ODNServices

- (void)updateGeoCodingsForAddresses:(id)a3 locations:(id)a4 completion:(id)a5
{
  v7 = (void (**)(id, void))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[Lt10zus2DOk3OfFf sharedInstance];
  [v10 updateGeoCodingsForAddresses:v9 locations:v8];

  v7[2](v7, 0);
}

- (void)fetchGeoCodingsForAddresses:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[Lt10zus2DOk3OfFf sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__ODNServices_fetchGeoCodingsForAddresses_completion___block_invoke;
  v9[3] = &unk_26422BA50;
  id v10 = v5;
  id v8 = v5;
  [v7 fetchGeoCodingsForAddresses:v6 completion:v9];
}

uint64_t __54__ODNServices_fetchGeoCodingsForAddresses_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchConfigThrowingWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[Lt10zus2DOk3OfFf sharedInstance];
  [v4 fetchConfigThrowingWithCompletion:v3];
}

- (void)fetchConfigWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[Lt10zus2DOk3OfFf sharedInstance];
  [v4 fetchConfigWithCompletion:v3];
}

- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[Lt10zus2DOk3OfFf sharedInstance];
  [v7 dKsJLlNX54lzKt5n:v6 eqF2XJh3hHBJQf2K:v5];
}

- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[Lt10zus2DOk3OfFf sharedInstance];
  [v7 evrtH713YbFfEOzk:v6 completion:v5];
}

- (void)registerICloudLoginWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[Lt10zus2DOk3OfFf sharedInstance];
  [v4 registerICloudLoginWithCompletion:v3];
}

- (void)unregisterICloudLoginWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[Lt10zus2DOk3OfFf sharedInstance];
  [v4 unregisterICloudLoginWithCompletion:v3];
}

- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[Lt10zus2DOk3OfFf sharedInstance];
  [v10 ofLBc0SV56ddaijH:v9 i7D0Lridvo8oYoNd:v8 completion:v7];
}

@end