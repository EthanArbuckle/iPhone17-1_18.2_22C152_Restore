@interface BCSIconController
- (BCSIconController)init;
- (BCSIconRemoteFetch)iconRemoteFetch;
- (void)fetchSquareIconDataForBusinessItem:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)setIconRemoteFetch:(id)a3;
@end

@implementation BCSIconController

- (BCSIconController)init
{
  v7.receiver = self;
  v7.super_class = (Class)BCSIconController;
  v2 = [(BCSIconController *)&v7 init];
  if (v2)
  {
    v3 = [[BCSCoalesceHelper alloc] initWithQOSClass:25];
    v4 = -[BCSIconRemoteFetch initWithCoalesceHelper:]((id *)[BCSIconRemoteFetch alloc], v3);
    iconRemoteFetch = v2->_iconRemoteFetch;
    v2->_iconRemoteFetch = (BCSIconRemoteFetch *)v4;
  }
  return v2;
}

- (void)fetchSquareIconDataForBusinessItem:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  if (v10)
  {
    +[BCSBusinessItemMemoryCache sharedCache]();
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    v12 = -[BCSBusinessItemMemoryCache lastFetchedBusinessItemIconDataForBizItem:](v11, v8);

    if (v12)
    {
      v10[2](v10, v12, 0);
    }
    else
    {
      v13 = [(BCSIconController *)self iconRemoteFetch];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __85__BCSIconController_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke;
      v14[3] = &unk_26424A290;
      id v15 = v8;
      v16 = v10;
      -[BCSIconRemoteFetch fetchSquareIconDataForBusinessItem:forClientBundleID:completion:](v13, v15, v9, v14);
    }
  }
}

void __85__BCSIconController_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7 && !v5)
  {
    v6 = +[BCSBusinessItemMemoryCache sharedCache]();
    -[BCSBusinessItemMemoryCache setLastFetchedBusinesIconData:withMatchingBusinessItem:]((uint64_t)v6, v7, *(void **)(a1 + 32));
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BCSIconRemoteFetch)iconRemoteFetch
{
  return self->_iconRemoteFetch;
}

- (void)setIconRemoteFetch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end