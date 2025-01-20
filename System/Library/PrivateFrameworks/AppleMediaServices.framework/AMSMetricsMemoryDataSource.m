@interface AMSMetricsMemoryDataSource
+ (id)batchesFromEvents:(id)a3;
- (AMSMetricsMemoryDataSource)initWithEvents:(id)a3;
- (BOOL)removeEvents:(id)a3 error:(id *)a4;
- (BOOL)willStartBatchingWithLogKey:(id)a3 error:(id *)a4;
- (NSMutableDictionary)batches;
- (void)enumerateSortedEventsForTopic:(id)a3 block:(id)a4;
- (void)setBatches:(id)a3;
@end

@implementation AMSMetricsMemoryDataSource

+ (id)batchesFromEvents:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v3;
  uint64_t v38 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v38)
  {
    v4 = @"0";
    uint64_t v37 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v42 != v37) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v7 = [v6 topic];
        v8 = (void *)v7;
        if (v7) {
          v9 = (__CFString *)v7;
        }
        else {
          v9 = &stru_1EDCA7308;
        }
        v10 = v9;

        int v11 = [v6 isAnonymous];
        v12 = @"1";
        if (!v11) {
          v12 = @"0";
        }
        v40 = v12;
        v13 = [v6 account];
        v14 = objc_msgSend(v13, "ams_DSID");
        if ([v14 integerValue] >= 1)
        {
          v15 = [v6 account];
          v16 = objc_msgSend(v15, "ams_DSID");
          v4 = [v16 stringValue];
        }
        uint64_t v17 = [v6 canaryIdentifier];
        v18 = (void *)v17;
        if (v17) {
          v19 = (__CFString *)v17;
        }
        else {
          v19 = &stru_1EDCA7308;
        }
        v20 = v19;

        v21 = &stru_1EDCA7308;
        if ([v6 isAnonymous])
        {
          v22 = [v6 clientIdentifier];
          if (v22)
          {
            v21 = [v6 clientIdentifier];
          }
          else
          {
            v21 = &stru_1EDCA7308;
          }
        }
        v23 = [v6 underlyingDictionary];
        uint64_t v24 = [v23 objectForKeyedSubscript:@"userId"];
        v25 = (void *)v24;
        if (v24) {
          v26 = (__CFString *)v24;
        }
        else {
          v26 = &stru_1EDCA7308;
        }
        v27 = v26;

        v28 = v10;
        v45[0] = v10;
        v45[1] = v40;
        v45[2] = v4;
        v45[3] = v20;
        v45[4] = v21;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:5];
        v30 = [v6 topic];
        int v31 = [v30 isEqualToString:@"xp_ase_appstore_ue"];

        if (v31)
        {
          uint64_t v32 = [v29 arrayByAddingObject:v27];

          v29 = (void *)v32;
        }
        v33 = [v29 componentsJoinedByString:@"."];
        id v34 = [v39 objectForKeyedSubscript:v33];
        if (!v34)
        {
          id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v39 setObject:v34 forKeyedSubscript:v33];
        }
        [v34 addObject:v6];

        v4 = @"0";
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v38);
  }

  return v39;
}

- (AMSMetricsMemoryDataSource)initWithEvents:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSMetricsMemoryDataSource;
  v5 = [(AMSMetricsMemoryDataSource *)&v10 init];
  if (v5)
  {
    v6 = +[AMSMetricsMemoryDataSource batchesFromEvents:v4];
    uint64_t v7 = [v6 mutableCopy];
    batches = v5->_batches;
    v5->_batches = (NSMutableDictionary *)v7;
  }
  return v5;
}

- (void)enumerateSortedEventsForTopic:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AMSMetricsMemoryDataSource *)self batches];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__AMSMetricsMemoryDataSource_enumerateSortedEventsForTopic_block___block_invoke;
  v11[3] = &unk_1E55A4B80;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];
}

void __66__AMSMetricsMemoryDataSource_enumerateSortedEventsForTopic_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(a1 + 32);
        if (v11)
        {
          id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) topic];
          int v13 = [v11 isEqualToString:v12];

          if (!v13) {
            continue;
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (BOOL)removeEvents:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(AMSMetricsMemoryDataSource *)self batches];
  v25 = [v6 allKeys];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v33;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v7;
        uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * v7);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v9 = v25;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v29 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              long long v15 = [(AMSMetricsMemoryDataSource *)self batches];
              long long v16 = [v15 objectForKeyedSubscript:v14];
              uint64_t v17 = [v16 indexOfObject:v8];

              if (v17 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v18 = [(AMSMetricsMemoryDataSource *)self batches];
                uint64_t v19 = [v18 objectForKeyedSubscript:v14];
                v20 = (void *)[v19 mutableCopy];

                [v20 removeObjectAtIndex:v17];
                v21 = [(AMSMetricsMemoryDataSource *)self batches];
                [v21 setObject:v20 forKeyedSubscript:v14];

                goto LABEL_16;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        uint64_t v7 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v26);
  }

  return 1;
}

- (BOOL)willStartBatchingWithLogKey:(id)a3 error:(id *)a4
{
  return 1;
}

- (NSMutableDictionary)batches
{
  return self->_batches;
}

- (void)setBatches:(id)a3
{
}

- (void).cxx_destruct
{
}

@end