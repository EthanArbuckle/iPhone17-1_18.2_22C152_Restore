@interface FPDAccessControlServicer
- (FPDAccessControlServicer)initWithAccessStore:(id)a3;
- (FPDAccessControlStore)accessStore;
- (void)bundleIdentifiersWithAccessToAnyItemCompletionHandler:(id)a3;
- (void)revokeAccessToAllItemsForBundle:(id)a3 completionHandler:(id)a4;
- (void)setAccessStore:(id)a3;
@end

@implementation FPDAccessControlServicer

- (FPDAccessControlServicer)initWithAccessStore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FPDAccessControlServicer;
  v5 = [(FPDAccessControlServicer *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_accessStore, v4);
  }

  return v6;
}

- (void)bundleIdentifiersWithAccessToAnyItemCompletionHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessStore);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__FPDAccessControlServicer_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A75648;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained performWithDBConnection:v7];
}

void __82__FPDAccessControlServicer_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__FPDAccessControlServicer_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E6A75620;
    id v10 = v5;
    id v11 = v6;
    id v7 = v6;
    [v10 performWithFlags:0 action:v9];
    (*(void (**)(void, id, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7, 0, v8);
  }
}

uint64_t __82__FPDAccessControlServicer_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) fetch:@"SELECT identifier FROM bundle_keys LIMIT 100"];
  if ([v2 next])
  {
    do
    {
      v3 = *(void **)(a1 + 40);
      id v4 = [v2 objectAtIndexedSubscript:0];
      [v3 addObject:v4];
    }
    while (([v2 next] & 1) != 0);
  }

  return 1;
}

- (void)revokeAccessToAllItemsForBundle:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessStore);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__FPDAccessControlServicer_revokeAccessToAllItemsForBundle_completionHandler___block_invoke;
  v11[3] = &unk_1E6A75670;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [WeakRetained performWithDBConnection:v11];
}

void __78__FPDAccessControlServicer_revokeAccessToAllItemsForBundle_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__FPDAccessControlServicer_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_2;
    v6[3] = &unk_1E6A74E28;
    id v7 = *(id *)(a1 + 32);
    [a2 performWithFlags:16 action:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __78__FPDAccessControlServicer_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 execute:@"DELETE FROM bundle_keys WHERE identifier = %@", *(void *)(a1 + 32)];
}

- (FPDAccessControlStore)accessStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessStore);
  return (FPDAccessControlStore *)WeakRetained;
}

- (void)setAccessStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end