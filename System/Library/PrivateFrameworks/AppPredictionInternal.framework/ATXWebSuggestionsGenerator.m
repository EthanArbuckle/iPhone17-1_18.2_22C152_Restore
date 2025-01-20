@interface ATXWebSuggestionsGenerator
- (ATXWebSuggestionsGenerator)init;
- (id)dedupedUrlsFromUrls:(id)a3 limit:(unint64_t)a4;
- (id)rootUrlFromUrl:(id)a3;
- (id)urlToDatesGivenWebpageHistory:(id)a3;
- (id)webpageHistory;
- (id)webpageTitlesAndSubtitles;
- (id)webpageTitlesAndSubtitlesGivenWebpageHistory:(id)a3;
- (id)websitePredictionsForAllContexts;
- (id)websitePredictionsForContextType:(id)a3 limit:(unint64_t)a4;
- (void)overwriteWebsitePredictionsCacheWithWebsiteString:(id)a3 contextType:(id)a4;
- (void)refreshWebsitePredictions;
@end

@implementation ATXWebSuggestionsGenerator

- (ATXWebSuggestionsGenerator)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXWebSuggestionsGenerator;
  v2 = [(ATXWebSuggestionsGenerator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (ATXVerticalModelsCache *)v3;
  }
  return v2;
}

- (void)refreshWebsitePredictions
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v22 = [(ATXWebSuggestionsGenerator *)self webpageHistory];
  v23 = [(ATXWebSuggestionsGenerator *)self urlToDatesGivenWebpageHistory:v22];
  if ([v23 count])
  {
    v21 = objc_alloc_init(ATXContextHeuristicsBiomeStream);
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    v51[3] = 0;
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__24;
    v49 = __Block_byref_object_dispose__24;
    id v50 = (id)objc_opt_new();
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__24;
    v43[4] = __Block_byref_object_dispose__24;
    id v44 = (id)objc_opt_new();
    v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
    [v2 timeIntervalSinceReferenceDate];
    uint64_t v3 = -[ATXContextHeuristicsBiomeStream publisherFromStartTime:](v21, "publisherFromStartTime:");
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __55__ATXWebSuggestionsGenerator_refreshWebsitePredictions__block_invoke_2;
    v37[3] = &unk_1E68AE190;
    id v38 = v23;
    v39 = self;
    v40 = v51;
    v41 = v43;
    v42 = &v45;
    id v4 = (id)[v3 sinkWithCompletion:&__block_literal_global_50 shouldContinue:v37];

    v27 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = (id)v46[5];
    uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v53 count:16];
    if (v5)
    {
      uint64_t v26 = *(void *)v34;
      do
      {
        uint64_t v28 = v5;
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          v8 = objc_opt_new();
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          v9 = [(id)v46[5] objectForKeyedSubscript:v7];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v52 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v30;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v30 != v11) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * j);
                v14 = objc_msgSend((id)v46[5], "objectForKeyedSubscript:", v7, v21);
                unint64_t v15 = [v14 countForObject:v13];

                if (v15 >= 5)
                {
                  do
                  {
                    [v8 addObject:v13];
                    --v15;
                  }
                  while (v15);
                }
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v52 count:16];
            }
            while (v10);
          }

          [v27 setObject:v8 forKeyedSubscript:v7];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v53 count:16];
      }
      while (v5);
    }

    cache = self->_cache;
    v17 = (void *)[v27 copy];
    [(ATXVerticalModelsCache *)cache writeWebsiteSuggestionsCache:v17];

    v18 = self->_cache;
    v19 = [(ATXWebSuggestionsGenerator *)self webpageTitlesAndSubtitlesGivenWebpageHistory:v22];
    [(ATXVerticalModelsCache *)v18 writeWebsiteTitlesAndSubtitlesCache:v19];

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(v51, 8);
  }
  else
  {
    uint64_t v20 = MEMORY[0x1E4F1CC08];
    [(ATXVerticalModelsCache *)self->_cache writeWebsiteSuggestionsCache:MEMORY[0x1E4F1CC08]];
    [(ATXVerticalModelsCache *)self->_cache writeWebsiteTitlesAndSubtitlesCache:v20];
  }
}

uint64_t __55__ATXWebSuggestionsGenerator_refreshWebsitePredictions__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 eventBody];
  uint64_t v5 = [v4 contextType];

  if (v5)
  {
    long long v34 = v5;
    long long v35 = v3;
    objc_super v6 = (void *)MEMORY[0x1E4F1C9C8];
    [v3 timestamp];
    uint64_t v7 = objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    v9 = [v8 allKeys];
    uint64_t v10 = [v9 objectAtIndexedSubscript:0];

    uint64_t v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    v12 = [v11 objectForKeyedSubscript:v10];

    long long v36 = (void *)v7;
    if ([v12 compare:v7] == -1)
    {
      while (1)
      {
        v37 = v12;
        v16 = [*(id *)(a1 + 40) rootUrlFromUrl:v10];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v17 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v39 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              v23 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v22];

              if (!v23)
              {
                v24 = objc_opt_new();
                [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v24 forKeyedSubscript:v22];
              }
              v25 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v22];
              if (v10 && ([v16 isEqual:v10] & 1) == 0)
              {
                [v25 addObject:v10];
                [v25 addObject:v10];
              }
              if (v16) {
                [v25 addObject:v16];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
          }
          while (v19);
        }

        uint64_t v26 = ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        if (v26 == [*(id *)(a1 + 32) count]) {
          break;
        }
        v27 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
        uint64_t v28 = [v27 allKeys];
        uint64_t v14 = [v28 objectAtIndexedSubscript:0];

        long long v29 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
        uint64_t v13 = [v29 objectForKeyedSubscript:v14];

        uint64_t v10 = (void *)v14;
        v12 = v13;
        if ([v13 compare:v7] != -1) {
          goto LABEL_21;
        }
      }

      uint64_t v15 = 0;
      uint64_t v5 = v34;
      id v3 = v35;
      uint64_t v13 = v37;
    }
    else
    {
      uint64_t v13 = v12;
      uint64_t v14 = (uint64_t)v10;
LABEL_21:
      id v3 = v35;
      long long v30 = [v35 eventBody];
      int v31 = [v30 isStart];

      long long v32 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (v31)
      {
        uint64_t v5 = v34;
        [v32 addObject:v34];
      }
      else
      {
        uint64_t v5 = v34;
        if ([v32 containsObject:v34]) {
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObject:v34];
        }
      }
      uint64_t v15 = 1;
      uint64_t v10 = (void *)v14;
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

- (id)websitePredictionsForAllContexts
{
  id v3 = [(ATXVerticalModelsCache *)self->_cache fetchWebsiteSuggestionsCache];
  if (![v3 count])
  {
    [(ATXWebSuggestionsGenerator *)self refreshWebsitePredictions];
    uint64_t v4 = [(ATXVerticalModelsCache *)self->_cache fetchWebsiteSuggestionsCache];

    id v3 = (void *)v4;
  }
  return v3;
}

- (id)websitePredictionsForContextType:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(ATXWebSuggestionsGenerator *)self websitePredictionsForAllContexts];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    v9 = [v8 allObjects];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__ATXWebSuggestionsGenerator_websitePredictionsForContextType_limit___block_invoke;
    v13[3] = &unk_1E68AC7A0;
    id v14 = v8;
    uint64_t v10 = [v9 sortedArrayUsingComparator:v13];

    uint64_t v11 = [(ATXWebSuggestionsGenerator *)self dedupedUrlsFromUrls:v10 limit:a4];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

uint64_t __69__ATXWebSuggestionsGenerator_websitePredictionsForContextType_limit___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 countForObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  if (v7 > v8) {
    return -1;
  }
  else {
    return 1;
  }
}

- (id)webpageTitlesAndSubtitles
{
  return [(ATXVerticalModelsCache *)self->_cache fetchWebsiteTitlesAndSubtitlesCache];
}

- (void)overwriteWebsitePredictionsCacheWithWebsiteString:(id)a3 contextType:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(ATXWebSuggestionsGenerator *)self refreshWebsitePredictions];
  unint64_t v8 = objc_opt_new();
  v9 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  int v10 = 10;
  do
  {
    [v8 addObject:v9];
    --v10;
  }
  while (v10);
  cache = self->_cache;
  id v13 = v7;
  v14[0] = v8;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [(ATXVerticalModelsCache *)cache writeWebsiteSuggestionsCache:v12];
}

- (id)urlToDatesGivenWebpageHistory:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "action", (void)v20);
        v12 = [v11 userActivity];

        id v13 = [v10 dateInterval];
        id v14 = [v13 startDate];

        uint64_t v15 = [v12 webpageURL];
        v16 = (void *)v15;
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17)
        {
          uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v14 forKey:v15];
          [v4 addObject:v18];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)webpageHistory
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4B3B8]);
  id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
  id v5 = [v2 getActivityIntentEventsBetweenStartDate:v3 endDate:v4 bundleIdFilter:@"com.apple.mobilesafari"];

  return v5;
}

- (id)rootUrlFromUrl:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 scheme];
  [v5 setScheme:v6];

  uint64_t v7 = [v4 host];

  [v5 setHost:v7];
  uint64_t v8 = [v5 URL];

  return v8;
}

- (id)dedupedUrlsFromUrls:(id)a3 limit:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v18 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v20;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v8);
      }
      if (v11 == a4) {
        break;
      }
      uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
      uint64_t v15 = [(ATXWebSuggestionsGenerator *)self rootUrlFromUrl:v14];
      if (v15 && ([v7 containsObject:v15] & 1) == 0)
      {
        [v7 addObject:v15];
        [v18 addObject:v14];
        ++v11;
      }

      if (v10 == ++v13)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v16 = (void *)[v18 copy];
  return v16;
}

- (id)webpageTitlesAndSubtitlesGivenWebpageHistory:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "action", (void)v21);
        uint64_t v11 = [v10 userActivity];
        uint64_t v12 = [v11 webpageURL];

        uint64_t v13 = [v10 actionTitle];
        uint64_t v14 = [v10 actionSubtitle];
        uint64_t v15 = (void *)v14;
        if (v12) {
          BOOL v16 = v13 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16 && v14 != 0)
        {
          v25[0] = v13;
          v25[1] = v14;
          uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
          [v4 setObject:v18 forKeyedSubscript:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = (void *)[v4 copy];
  return v19;
}

- (void).cxx_destruct
{
}

@end