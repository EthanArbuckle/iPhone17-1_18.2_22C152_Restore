@interface WFDetectLanguageAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFDetectLanguageAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__WFDetectLanguageAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5EEE8;
  v3[4] = self;
  [a3 getStringRepresentations:v3];
}

void __53__WFDetectLanguageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v16 = v6;
    id v17 = v5;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(MEMORY[0x263F14018], "dominantLanguageForString:", *(void *)(*((void *)&v18 + 1) + 8 * v11), v16, v17, (void)v18);
          v13 = [MEMORY[0x263EFF960] currentLocale];
          v14 = [v13 localizedStringForLanguageCode:v12];

          if (v14)
          {
            v15 = [*(id *)(a1 + 32) output];
            [v15 addObject:v14];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [*(id *)(a1 + 32) finishRunningWithError:0];
    id v6 = v16;
    id v5 = v17;
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
}

@end