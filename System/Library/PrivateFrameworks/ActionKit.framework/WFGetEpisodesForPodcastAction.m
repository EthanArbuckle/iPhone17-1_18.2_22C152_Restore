@interface WFGetEpisodesForPodcastAction
- (void)getPodcastEpisodesWithIdentifiers:(id)a3 withCompletion:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetEpisodesForPodcastAction

- (void)getPodcastEpisodesWithIdentifiers:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__56140;
  v12[4] = __Block_byref_object_dispose__56141;
  id v13 = 0;
  v7 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__WFGetEpisodesForPodcastAction_getPodcastEpisodesWithIdentifiers_withCompletion___block_invoke;
  v9[3] = &unk_264E5EF38;
  id v8 = v6;
  id v10 = v8;
  v11 = v12;
  [v7 lookupMediaType:301 withIdentifiers:v5 withCompletion:v9];

  _Block_object_dispose(v12, 8);
}

void __82__WFGetEpisodesForPodcastAction_getPodcastEpisodesWithIdentifiers_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v11 = v6;
    uint64_t v7 = [MEMORY[0x263F86840] modelsOfClass:objc_opt_class() fromJSONArray:v5 error:&v11];
    id v8 = v11;

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v6 = v8;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_264E5EF10;
  v4[4] = self;
  id v3 = a3;
  [v3 getObjectRepresentation:v4 forClass:objc_opt_class()];
}

void __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v5 = [a2 identifier];
    v10[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];

    uint64_t v7 = objc_opt_new();
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke_2;
    v9[3] = &unk_264E5EEE8;
    void v9[4] = *(void *)(a1 + 32);
    [v7 lookupMediaType:300 withIdentifiers:v6 withCompletion:v9];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    [v8 finishRunningWithError:a4];
  }
}

void __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a2 firstObject];
  uint64_t v7 = v6;
  if (v6)
  {
    id v27 = v5;
    id v8 = [v6 objectForKeyedSubscript:@"relationships"];
    uint64_t v9 = objc_opt_class();
    id v10 = WFEnforceClass(v8, v9);

    v26 = v10;
    id v11 = [v10 objectForKeyedSubscript:@"episodes"];
    uint64_t v12 = objc_opt_class();
    id v13 = WFEnforceClass(v11, v12);

    v14 = [v13 objectForKeyedSubscript:@"data"];
    uint64_t v15 = objc_opt_class();
    v16 = WFEnforceClass(v14, v15);

    id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v29 + 1) + 8 * i) objectForKeyedSubscript:@"id"];
          [v17 addObject:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v20);
    }

    uint64_t v24 = [v17 count];
    v25 = *(void **)(a1 + 32);
    if (v24)
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke_3;
      v28[3] = &unk_264E5EEE8;
      v28[4] = v25;
      [v25 getPodcastEpisodesWithIdentifiers:v17 withCompletion:v28];
    }
    else
    {
      [v25 finishRunningWithError:0];
    }
    id v5 = v27;
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
}

void __60__WFGetEpisodesForPodcastAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        uint64_t v12 = [*(id *)(a1 + 32) output];
        [v12 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end