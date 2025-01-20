@interface ATXNLEventsDataSource
- (ATXNLEventsDataSource)initWithDevice:(id)a3;
- (void)nlEventsWithCallback:(id)a3;
@end

@implementation ATXNLEventsDataSource

- (ATXNLEventsDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNLEventsDataSource;
  v6 = [(ATXNLEventsDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)nlEventsWithCallback:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  if (ATXHeuristicCanLearnFromApp(&unk_1F27273F8))
  {
    id v5 = [(ATXHeuristicDevice *)self->_device eventStore];
    v6 = [v5 predicateForNaturalLanguageSuggestedEventsWithSearchString:0];
    v7 = [v5 eventsMatchingPredicate:v6];
    v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_14];
    objc_super v9 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = [v8 count];
      _os_log_impl(&dword_1D0F43000, v9, OS_LOG_TYPE_INFO, "Got %tu events from NL Events", buf, 0xCu);
    }

    if ([v8 count])
    {
      v17 = v7;
      v18 = v6;
      v10 = objc_opt_new();
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = -[ATXHeuristicDevice dictForEvent:](self->_device, "dictForEvent:", *(void *)(*((void *)&v19 + 1) + 8 * v15), v17, v18, (void)v19);
            if (v16) {
              [v10 addObject:v16];
            }

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }

      v4[2](v4, v10, 0);
      v7 = v17;
      v6 = v18;
    }
    else
    {
      v4[2](v4, (void *)MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    v4[2](v4, (void *)MEMORY[0x1E4F1CBF0], 0);
  }
}

uint64_t __46__ATXNLEventsDataSource_nlEventsWithCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 localCustomObjectForKey:@"EKEventNaturalLanguageSuggestedEventExpirationDate"];
  v7 = [v5 localCustomObjectForKey:@"EKEventNaturalLanguageSuggestedEventExpirationDate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = v6 != 0;
    BOOL v9 = v7 != 0;
    if (v6 && v7)
    {
      uint64_t v10 = [v7 compare:v6];
      goto LABEL_20;
    }
  }
  else
  {

    BOOL v9 = 0;
    v7 = 0;
    BOOL v8 = v6 != 0;
  }
  if (v8) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }
  if (!v8 && !v9)
  {
    id v11 = [v4 creationDate];
    uint64_t v12 = [v5 creationDate];
    uint64_t v13 = v12;
    if (v11 && v12)
    {
      uint64_t v10 = [v12 compare:v11];
    }
    else if (v11)
    {
      uint64_t v10 = -1;
    }
    else
    {
      uint64_t v10 = v12 != 0;
    }
  }
LABEL_20:

  return v10;
}

- (void).cxx_destruct
{
}

@end