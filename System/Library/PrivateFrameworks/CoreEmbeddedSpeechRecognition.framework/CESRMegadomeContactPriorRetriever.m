@interface CESRMegadomeContactPriorRetriever
- (CESRMegadomeContactPriorRetriever)init;
- (id)_fetchTopNContactPriors:(int64_t)a3 error:(id *)a4;
- (id)allPriorInfoWithThreshold:(unsigned int)a3;
- (id)priorInfoForItemIds:(id)a3;
@end

@implementation CESRMegadomeContactPriorRetriever

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranker, 0);

  objc_storeStrong((id *)&self->_rankerConfig, 0);
}

- (id)_fetchTopNContactPriors:(int64_t)a3 error:(id *)a4
{
  v4 = [(GDPersonRankingService *)self->_ranker rankedPersonsWithMaxCount:a3 error:a4];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)allPriorInfoWithThreshold:(unsigned int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
  id v19 = 0;
  id v6 = [(CESRMegadomeContactPriorRetriever *)self _fetchTopNContactPriors:a3 error:&v19];
  id v7 = v19;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__CESRMegadomeContactPriorRetriever_allPriorInfoWithThreshold___block_invoke;
  v16[3] = &unk_1E61C3500;
  id v8 = v5;
  id v17 = v8;
  unsigned int v18 = a3;
  [v6 enumerateObjectsUsingBlock:v16];
  v9 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    int v11 = [v6 count];
    int v12 = [v8 count];
    *(_DWORD *)buf = 136315906;
    v21 = "-[CESRMegadomeContactPriorRetriever allPriorInfoWithThreshold:]";
    __int16 v22 = 1024;
    int v23 = v11;
    __int16 v24 = 1024;
    int v25 = v12;
    __int16 v26 = 1024;
    unsigned int v27 = a3;
    _os_log_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_INFO, "%s Fetched %u persons from Megadome Ranker, populated %u contact priors with threshold: %u", buf, 0x1Eu);
  }
  v13 = v17;
  id v14 = v8;

  return v14;
}

void __63__CESRMegadomeContactPriorRetriever_allPriorInfoWithThreshold___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [[CESRPriorInfo alloc] initWithOrdinality:(a3 + 1) score:0.0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(v5, "contactIdentifiers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
        if ([*(id *)(a1 + 32) count] < (unint64_t)*(unsigned int *)(a1 + 40)) {
          [*(id *)(a1 + 32) setObject:v6 forKey:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (id)priorInfoForItemIds:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v34 = 0;
    id v7 = [(CESRMegadomeContactPriorRetriever *)self _fetchTopNContactPriors:0x7FFFFFFFFFFFFFFFLL error:&v34];
    id v26 = v34;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __57__CESRMegadomeContactPriorRetriever_priorInfoForItemIds___block_invoke;
    v31[3] = &unk_1E61C34D8;
    id v8 = v5;
    id v32 = v8;
    id v9 = v6;
    id v33 = v9;
    [v7 enumerateObjectsUsingBlock:v31];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          long long v16 = [v9 objectForKey:v15];

          if (!v16)
          {
            id v17 = [[CESRPriorInfo alloc] initWithOrdinality:0 score:0.0];
            [v9 setValue:v17 forKey:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v12);
    }

    uint64_t v18 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      id v19 = v18;
      int v20 = [v7 count];
      int v21 = [v9 count];
      int v22 = [v4 count];
      *(_DWORD *)buf = 136315906;
      v36 = "-[CESRMegadomeContactPriorRetriever priorInfoForItemIds:]";
      __int16 v37 = 1024;
      int v38 = v20;
      __int16 v39 = 1024;
      int v40 = v21;
      __int16 v41 = 1024;
      int v42 = v22;
      _os_log_impl(&dword_1B8CCB000, v19, OS_LOG_TYPE_INFO, "%s Fetched %u persons from Megadome Ranker, populated %u contact priors for %u requested contacts", buf, 0x1Eu);
    }
    int v23 = v33;
    id v24 = v9;
  }
  else
  {
    id v24 = (id)MEMORY[0x1E4F1CC08];
  }

  return v24;
}

void __57__CESRMegadomeContactPriorRetriever_priorInfoForItemIds___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a2, "contactIdentifiers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    uint64_t v9 = (a3 + 1);
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) containsObject:v11])
        {
          uint64_t v12 = [[CESRPriorInfo alloc] initWithOrdinality:v9 score:0.0];
          [*(id *)(a1 + 40) setValue:v12 forKey:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (CESRMegadomeContactPriorRetriever)init
{
  v8.receiver = self;
  v8.super_class = (Class)CESRMegadomeContactPriorRetriever;
  v2 = [(CESRMegadomeContactPriorRetriever *)&v8 init];
  if (v2)
  {
    v3 = (GDPersonRankingServiceConfiguration *)objc_alloc_init(MEMORY[0x1E4F706C0]);
    rankerConfig = v2->_rankerConfig;
    v2->_rankerConfig = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F706B8]) initWithConfig:v2->_rankerConfig];
    ranker = v2->_ranker;
    v2->_ranker = (GDPersonRankingService *)v5;
  }
  return v2;
}

@end