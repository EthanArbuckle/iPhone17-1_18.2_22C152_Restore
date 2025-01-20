@interface UISplitViewController
@end

@implementation UISplitViewController

void __74__UISplitViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [*(id *)(a1 + 32) viewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = MEMORY[0x263EF8330];
        uint64_t v13 = 3221225472;
        v14 = __74__UISplitViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2;
        v15 = &unk_26478A048;
        uint64_t v16 = v9;
        gk_dispatch_group_do();
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__UISplitViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3;
  v10[3] = &unk_26478A020;
  id v11 = *(id *)(a1 + 40);
  dispatch_group_notify(v3, MEMORY[0x263EF83A0], v10);
}

uint64_t __74__UISplitViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _gkSetContentsNeedUpdateWithHandler:a2];
}

uint64_t __74__UISplitViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end