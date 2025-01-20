@interface FPItemManager(DOCUtils)
- (void)doc_fetchRootItemForProviderDomain:()DOCUtils completionHandler:;
@end

@implementation FPItemManager(DOCUtils)

- (void)doc_fetchRootItemForProviderDomain:()DOCUtils completionHandler:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isUsingFPFS] && objc_msgSend(v5, "isiCloudDriveProvider"))
  {
    v7 = +[DOCNodeStartupManager shared];
    [v7 startIfNeeded];

    v8 = dispatch_get_global_queue(25, 0);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __80__FPItemManager_DOCUtils__doc_fetchRootItemForProviderDomain_completionHandler___block_invoke;
    v10[3] = &unk_2641B5768;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v8, v10);
  }
  else
  {
    v9 = [MEMORY[0x263F054C0] defaultManager];
    [v9 fetchRootItemForProviderDomain:v5 completionHandler:v6];
  }
}

@end