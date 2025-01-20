@interface UIViewController
@end

@implementation UIViewController

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke(id *a1, void *a2)
{
  v3 = a2;
  v4 = [a1[4] presentedViewController];

  if (v4)
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2;
    v19 = &unk_26478A048;
    id v20 = a1[4];
    gk_dispatch_group_do();
  }
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_4;
  v13 = &unk_26478A110;
  id v5 = a1[5];
  id v6 = a1[4];
  id v14 = v5;
  id v15 = v6;
  gk_dispatch_group_do();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3_29;
  v8[3] = &unk_26478A020;
  v7 = a1[5];
  id v9 = a1[6];
  dispatch_group_notify(v3, v7, v8);
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) presentedViewController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3;
  v6[3] = &unk_26478A020;
  id v7 = v3;
  id v5 = v3;
  [v4 _gkSetContentsNeedUpdateWithHandler:v6];
}

uint64_t __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5;
  block[3] = &unk_26478A0E8;
  id v10 = v3;
  int8x16_t v7 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v7.i64[0];
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  id v6 = v3;
  dispatch_async(v4, block);
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5(id *a1)
{
  uint64_t v2 = (uint64_t)(a1 + 4);
  id v3 = objc_getAssociatedObject(a1[4], @"_gkContentRecentlyUpdated");
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    if (!*MEMORY[0x263F40328]) {
      id v5 = (id)GKOSLoggers();
    }
    id v6 = *MEMORY[0x263F40338];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40338], OS_LOG_TYPE_DEBUG)) {
      __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5_cold_1(v2, v6, v7, v8, v9, v10, v11, v12);
    }
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v13 = (void *)[a1[6] copy];
    uint64_t v14 = objc_getAssociatedObject(a1[4], @"_gkContentUpdateHandlers");
    if (v14)
    {
      id v15 = (id)v14;
      uint64_t v16 = (void *)MEMORY[0x22A644A10](v13);
      [v15 addObject:v16];

      if (!*MEMORY[0x263F40328]) {
        id v17 = (id)GKOSLoggers();
      }
      v18 = *MEMORY[0x263F40338];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40338], OS_LOG_TYPE_DEBUG)) {
        __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5_cold_2(v2, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x263EFF980];
      v26 = (void *)MEMORY[0x22A644A10](v13);
      v27 = objc_msgSend(v25, "arrayWithObjects:", v26, 0);

      objc_setAssociatedObject(a1[4], @"_gkContentUpdateHandlers", v27, (void *)0x301);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_24;
      block[3] = &unk_26478A0C0;
      v28 = a1[5];
      void block[4] = a1[4];
      id v15 = v27;
      id v30 = v15;
      id v31 = a1[5];
      dispatch_async(v28, block);
    }
  }
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_24(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = *(void **)(a1 + 32);
  int v4 = [NSNumber numberWithBool:1];
  objc_setAssociatedObject(v3, @"_gkContentRecentlyUpdated", v4, (void *)0x301);

  if (!*MEMORY[0x263F40328]) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = *MEMORY[0x263F40338];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40338], OS_LOG_TYPE_DEBUG)) {
    __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_24_cold_1(v2, v6, v7, v8, v9, v10, v11, v12);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_26;
  v17[3] = &unk_26478A070;
  v13 = *(void **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  [v13 _gkUpdateContentsWithCompletionHandlerAndError:v17];
  objc_setAssociatedObject(*(id *)(a1 + 32), @"_gkContentUpdateHandlers", 0, (void *)0x301);
  dispatch_time_t v14 = dispatch_time(0, 1000000000);
  id v15 = *(NSObject **)(a1 + 48);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2_28;
  v16[3] = &unk_26478A098;
  v16[4] = *(void *)(a1 + 32);
  dispatch_after(v14, v15, v16);
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_26(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_2_28(uint64_t a1)
{
}

uint64_t __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_3_29(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __113__UIViewController_GKAdditions___gkPresentActivityViewControllerForActivityItems_fromView_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v12 = a2;
  id v9 = a4;
  id v10 = a5;
  if (a3) {
    [*(id *)(a1 + 32) _gkDismissActivityViewControllerAnimated:1];
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, uint64_t))(v11 + 16))(v11, v12, a3);
  }
}

uint64_t __120__UIViewController_GKAlerts___gkPresentAlertWithTitle_message_buttonTitle_dismissHandler_presentationCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __106__UIViewController_GKAlerts___gkPresentConfirmationAlertWithTitle_message_buttonTitle_block_cancelAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__UIViewController_GKRestrictionAlerts___gkInGameUIUnavailableAlertWithRestrictionMode_dismissHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_5_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__UIViewController_GKAdditions___gkSetContentsNeedUpdateWithHandler___block_invoke_24_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end