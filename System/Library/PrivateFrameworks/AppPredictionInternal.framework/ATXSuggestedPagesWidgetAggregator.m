@interface ATXSuggestedPagesWidgetAggregator
- (ATXSuggestedPagesWidgetAggregator)init;
- (ATXSuggestedPagesWidgetAggregator)initWithSources:(id)a3;
- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesWidgetAggregator

- (ATXSuggestedPagesWidgetAggregator)init
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v10[0] = v3;
  v4 = objc_opt_new();
  v10[1] = v4;
  v5 = objc_opt_new();
  v10[2] = v5;
  v6 = objc_opt_new();
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  v8 = [(ATXSuggestedPagesWidgetAggregator *)self initWithSources:v7];

  return v8;
}

- (ATXSuggestedPagesWidgetAggregator)initWithSources:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSuggestedPagesWidgetAggregator;
  v5 = [(ATXSuggestedPagesWidgetAggregator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sources = v5->_sources;
    v5->_sources = (NSArray *)v6;
  }
  return v5;
}

- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v8 = self->_sources;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v47;
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = [*(id *)(*((void *)&v46 + 1) + 8 * i) provideWidgetsForPageType:a3 environment:v6];
        v15 = (void *)v14;
        if (v14) {
          uint64_t v16 = v14;
        }
        else {
          uint64_t v16 = v12;
        }
        [v7 addObjectsFromArray:v16];
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v10);
  }

  v17 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v18 = v7;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v43 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        v24 = [v23 intent];
        if (v24)
        {
          [v17 setObject:v24 forKey:v23];
          [v23 setIntent:0];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v20);
  }

  v37 = v18;
  v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v18];
  v26 = [v25 allObjects];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v27 = v26;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v38 + 1) + 8 * k);
        v33 = [MEMORY[0x1E4F29128] UUID];
        v34 = [v33 UUIDString];
        [v32 setWidgetUniqueId:v34];

        v35 = [v17 objectForKey:v32];
        [v32 setIntent:v35];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v29);
  }

  return v27;
}

- (void).cxx_destruct
{
}

@end