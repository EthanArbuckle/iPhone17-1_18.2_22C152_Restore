@interface WFGetPostersAction
- (id)disabledOnPlatforms;
- (void)finishWithPosters:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetPostersAction

- (id)disabledOnPlatforms
{
  return &unk_26F076908;
}

- (void)finishWithPosters:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        v10 = [(WFGetPostersAction *)self output];
        [v10 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(WFGetPostersAction *)self finishRunningWithError:0];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = [(WFGetPostersAction *)self parameterValueForKey:@"WFPosterType" ofClass:objc_opt_class()];
  id v5 = objc_alloc_init(MEMORY[0x263F86DC8]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke;
  v7[3] = &unk_264E5DB20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getPostersWithCompletionHandler:v7];
}

void __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [v7 localizedName];
    uint64_t v9 = WFSanitizedPostersError();
    [v7 finishRunningWithError:v9];

    goto LABEL_9;
  }
  if (![*(id *)(a1 + 40) isEqualToString:@"All"])
  {
    if (![*(id *)(a1 + 40) isEqualToString:@"Current"]) {
      goto LABEL_10;
    }
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v10 = (void *)getPRSServiceClass_softClass;
    uint64_t v18 = getPRSServiceClass_softClass;
    if (!getPRSServiceClass_softClass)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __getPRSServiceClass_block_invoke;
      v14[3] = &unk_264E5EC88;
      v14[4] = &v15;
      __getPRSServiceClass_block_invoke((uint64_t)v14);
      v10 = (void *)v16[3];
    }
    long long v11 = v10;
    _Block_object_dispose(&v15, 8);
    id v8 = objc_alloc_init(v11);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke_2;
    v12[3] = &unk_264E59B80;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v5;
    [v8 fetchActivePosterConfiguration:v12];

LABEL_9:
    goto LABEL_10;
  }
  [*(id *)(a1 + 32) finishWithPosters:v5];
LABEL_10:
}

void __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v25[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 lockScreenPosterConfiguration];
    uint64_t v7 = *(void **)(a1 + 40);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke_3;
    v21[3] = &unk_264E59B58;
    id v8 = v6;
    id v22 = v8;
    uint64_t v9 = objc_msgSend(v7, "if_firstObjectPassingTest:", v21);
    v10 = (void *)v9;
    long long v11 = *(void **)(a1 + 32);
    if (v9)
    {
      uint64_t v23 = v9;
      long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
      [v11 finishWithPosters:v12];
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F870B8];
      v24[0] = *MEMORY[0x263F08338];
      long long v12 = WFLocalizedString(@"Unable to Get All Wallpapers");
      v25[0] = v12;
      v24[1] = *MEMORY[0x263F08320];
      uint64_t v18 = WFLocalizedString(@"An error occurred getting the current wallpaper.");
      v25[1] = v18;
      v19 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
      v20 = [v16 errorWithDomain:v17 code:6 userInfo:v19];
      [v11 finishRunningWithError:v20];
    }
  }
  else
  {
    id v13 = *(void **)(a1 + 32);
    long long v14 = [v13 localizedName];
    uint64_t v15 = WFSanitizedPostersError();
    [v13 finishRunningWithError:v15];
  }
}

uint64_t __49__WFGetPostersAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 UUID];
  id v4 = [*(id *)(a1 + 32) serverUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

@end