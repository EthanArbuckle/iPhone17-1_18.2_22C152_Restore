@interface UINavigationController
@end

@implementation UINavigationController

void __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = [*(id *)(a1 + 32) viewControllers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) viewControllers];
    v7 = [v6 objectAtIndex:0];

    v8 = [*(id *)(a1 + 32) topViewController];

    if (v7 == v8)
    {
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      v19 = __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3;
      v20 = &unk_26478A048;
      id v21 = v7;
      gk_dispatch_group_do();
      uint64_t v11 = MEMORY[0x263EF8330];
      uint64_t v12 = 3221225472;
      v13 = __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_4;
      v14 = &unk_26478A110;
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = v21;
      gk_dispatch_group_do();
    }
    else
    {
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2;
      v25 = &unk_26478A048;
      uint64_t v26 = *(void *)(a1 + 32);
      gk_dispatch_group_do();
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5;
  block[3] = &unk_26478A020;
  id v10 = *(id *)(a1 + 40);
  dispatch_group_notify(v3, MEMORY[0x263EF83A0], block);
}

void __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 topViewController];
  [v4 _gkSetContentsNeedUpdateWithHandler:v3];
}

uint64_t __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _gkSetContentsNeedUpdateWithHandler:a2];
}

void __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) topViewController];
  if (v3 != *(void **)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) topViewController];
    [v4 _gkSetContentsNeedUpdateWithHandler:v5];
  }
}

uint64_t __75__UINavigationController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end