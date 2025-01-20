@interface CPAnalyticsKnowledgeStoreDestination
- (CPAnalyticsKnowledgeStoreDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4;
- (NSMutableArray)matchers;
- (_DKKnowledgeSaving)knowledgeStore;
- (id)_datasetSampleFromEvent:(id)a3 andMatcher:(id)a4;
- (void)_addCoreDuetDatasetSample:(id)a3 toDataset:(id)a4;
- (void)processEvent:(id)a3;
@end

@implementation CPAnalyticsKnowledgeStoreDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_matchers, 0);
}

- (_DKKnowledgeSaving)knowledgeStore
{
  return self->_knowledgeStore;
}

- (NSMutableArray)matchers
{
  return self->_matchers;
}

- (void)_addCoreDuetDatasetSample:(id)a3 toDataset:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x263F35098];
  v9 = [MEMORY[0x263F35068] typeForName:@"PFLDatasetSampleSchemaVersion"];
  v10 = [v8 eventStreamWithName:v7 valueType:v9];

  v11 = (void *)MEMORY[0x263F350A0];
  v12 = [MEMORY[0x263F35068] typeForName:@"PFLDatasetSampleSchemaVersion"];
  v13 = [v11 identifierWithString:@"PFLDatasetSample-v1.0" type:v12];

  v14 = (void *)MEMORY[0x263F35088];
  v15 = [v6 date];
  v16 = [v6 date];
  v17 = [v6 metadata];
  v18 = [v14 eventWithStream:v10 startDate:v15 endDate:v16 value:v13 metadata:v17];

  v19 = [(CPAnalyticsKnowledgeStoreDestination *)self knowledgeStore];
  v27[0] = v18;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  v21 = dispatch_get_global_queue(9, 0);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __76__CPAnalyticsKnowledgeStoreDestination__addCoreDuetDatasetSample_toDataset___block_invoke;
  v24[3] = &unk_26423C240;
  id v25 = v7;
  id v26 = v6;
  id v22 = v6;
  id v23 = v7;
  [v19 saveObjects:v20 responseQueue:v21 withCompletion:v24];
}

void __76__CPAnalyticsKnowledgeStoreDestination__addCoreDuetDatasetSample_toDataset___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CPAnalyticsLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(void **)(a1 + 32);
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_215355000, v7, OS_LOG_TYPE_INFO, "CPAnalytics KnowledgeStore saved in %@", (uint8_t *)&v10, 0xCu);
    }

    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v7 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"cd_stream"];
    v9 = [*(id *)(a1 + 40) subset];
    [v7 setObject:v9 forKeyedSubscript:@"cd_subset"];

    +[CPAnalyticsCoreAnalyticsHelper sendCoreAnalyticsEvent:@"com.apple.photos.coreduet.saved" withPayload:v7 shouldSanitize:0];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_error_impl(&dword_215355000, v7, OS_LOG_TYPE_ERROR, "CPAnalytics KnowledgeStore failed to save Duet event: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (id)_datasetSampleFromEvent:(id)a3 andMatcher:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 identifierPropertyName];
  v8 = [v5 propertyForKey:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v6 subsetPropertyName];
    int v10 = [v6 subsetPropertyValue];
    if (v9)
    {
      uint64_t v11 = [v5 propertyForKey:v9];

      int v10 = (void *)v11;
    }
    uint64_t v12 = [CPAnalyticsKnowledgeStoreDatasetSample alloc];
    v13 = [v5 timestamp];
    v14 = [(CPAnalyticsKnowledgeStoreDatasetSample *)v12 initWithIdentifier:v8 andDate:v13 forSubset:v10];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)processEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(CPAnalyticsKnowledgeStoreDestination *)self matchers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      int v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      if ([v10 doesMatch:v4])
      {
        uint64_t v11 = [(CPAnalyticsKnowledgeStoreDestination *)self _datasetSampleFromEvent:v4 andMatcher:v10];
        if (v11)
        {
          uint64_t v12 = [v10 datasetName];
          [(CPAnalyticsKnowledgeStoreDestination *)self _addCoreDuetDatasetSample:v11 toDataset:v12];
        }
        int v13 = [v10 matchNextEvent];

        if (!v13) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (CPAnalyticsKnowledgeStoreDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CPAnalyticsKnowledgeStoreDestination;
  uint64_t v6 = [(CPAnalyticsKnowledgeStoreDestination *)&v26 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F350B8] knowledgeStore];
    knowledgeStore = v6->_knowledgeStore;
    v6->_knowledgeStore = (_DKKnowledgeSaving *)v7;

    uint64_t v9 = [v5 objectForKeyedSubscript:@"events"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v10, "count"));
      matchers = v6->_matchers;
      v6->_matchers = (NSMutableArray *)v11;

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v23;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * v17);
            uint64_t v19 = [CPAnalyticsCoreDuetEventMatcher alloc];
            v20 = -[CPAnalyticsCoreDuetEventMatcher initWithConfig:](v19, "initWithConfig:", v18, (void)v22);
            if (v20) {
              [(NSMutableArray *)v6->_matchers addObject:v20];
            }

            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v15);
      }
    }
  }

  return v6;
}

@end