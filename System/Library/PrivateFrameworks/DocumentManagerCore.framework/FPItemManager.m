@interface FPItemManager
@end

@implementation FPItemManager

void __80__FPItemManager_DOCUtils__doc_fetchRootItemForProviderDomain_completionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDataSeparatedDomain]) {
    [MEMORY[0x263F397B0] dataSeparatedICloudDefaultContainer];
  }
  else {
  v2 = [MEMORY[0x263F397B0] iCloudDefaultContainer];
  }
  if (!v2)
  {
    v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F05370] code:-2001 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__FPItemManager_DOCUtils__doc_fetchRootItemForProviderDomain_completionHandler___block_invoke_2;
  v4[3] = &unk_2641B5740;
  id v5 = *(id *)(a1 + 40);
  [v2 fetchFPItem:v4];
}

uint64_t __80__FPItemManager_DOCUtils__doc_fetchRootItemForProviderDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end