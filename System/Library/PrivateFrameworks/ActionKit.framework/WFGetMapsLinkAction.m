@interface WFGetMapsLinkAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetMapsLinkAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__WFGetMapsLinkAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __50__WFGetMapsLinkAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 numberOfItems])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = [v5 items];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
          v13 = [*(id *)(a1 + 32) output];
          v14 = [v12 mapsLink];
          v15 = [v14 mapsAppURL];
          [v13 addObject:v15];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __50__WFGetMapsLinkAction_runAsynchronouslyWithInput___block_invoke_2;
    v16[3] = &unk_264E5EEE8;
    v16[4] = *(void *)(a1 + 32);
    [v6 getStringRepresentations:v16];
  }
}

void __50__WFGetMapsLinkAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = objc_alloc_init(MEMORY[0x263F336D0]);
        [v9 setSearchQuery:v8];
        uint64_t v10 = [v9 mapsAppURL];
        if (v10)
        {
          uint64_t v11 = [*(id *)(a1 + 32) output];
          [v11 addObject:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  [*(id *)(a1 + 32) finishRunningWithError:0];
}

@end