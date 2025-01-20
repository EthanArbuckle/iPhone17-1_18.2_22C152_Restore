@interface BLSAlwaysOnExplicitEntriesTimeline
- (BLSAlwaysOnExplicitEntriesTimeline)initWithEntries:(id)a3 identifier:(id)a4 configure:(id)a5;
- (id)description;
- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4;
- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4;
@end

@implementation BLSAlwaysOnExplicitEntriesTimeline

- (BLSAlwaysOnExplicitEntriesTimeline)initWithEntries:(id)a3 identifier:(id)a4 configure:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSAlwaysOnExplicitEntriesTimeline;
  v11 = [(BLSAlwaysOnTimeline *)&v15 initWithIdentifier:v9 configure:v10];
  if (v11)
  {
    uint64_t v12 = [v8 sortedArrayUsingComparator:&__block_literal_global_93];
    explicitEntries = v11->_explicitEntries;
    v11->_explicitEntries = (NSArray *)v12;
  }
  return v11;
}

uint64_t __75__BLSAlwaysOnExplicitEntriesTimeline_initWithEntries_identifier_configure___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __49__BLSAlwaysOnExplicitEntriesTimeline_description__block_invoke;
  id v10 = &unk_1E6107450;
  id v4 = v3;
  id v11 = v4;
  uint64_t v12 = self;
  [v4 appendProem:self block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return v5;
}

void __49__BLSAlwaysOnExplicitEntriesTimeline_description__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v14 = [*(id *)(a1 + 40) identifier];
  id v3 = (id)objc_msgSend(v2, "appendObject:withName:");

  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "count"), @"count");
  id v15 = [*(id *)(*(void *)(a1 + 40) + 24) firstObject];
  id v5 = [*(id *)(*(void *)(a1 + 40) + 24) lastObject];
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v15 presentationTime];
  uint64_t v8 = objc_msgSend(v7, "bls_shortLoggingString");
  id v9 = (id)[v6 appendObject:v8 withName:@"first"];

  if (v15 != v5)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v5 presentationTime];
    uint64_t v12 = objc_msgSend(v11, "bls_shortLoggingString");
    id v13 = (id)[v10 appendObject:v12 withName:@"last"];
  }
}

- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    int64_t v8 = [v6 requestedFidelity];
  }
  else
  {
    v19 = self->_explicitEntries;
    if ([(NSArray *)v19 count])
    {
      id v9 = [(NSArray *)v19 firstObject];
      int64_t v8 = [v9 requestedFidelity];

      id v10 = [v20 startDate];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = v19;
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v11);
            }
            id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            v16 = [v15 presentationTime];
            uint64_t v17 = [v16 compare:v10];

            if (v17 != -1)
            {
              int64_t v8 = [v15 requestedFidelity];
              goto LABEL_14;
            }
          }
          uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      int64_t v8 = -1;
    }
  }
  return v8;
}

- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [v7 presentationTime];
  if (v8
    && ([v6 startDate],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 compare:v8],
        v9,
        v10 != 1))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v13 = [v6 endDate];
    id v14 = [v13 laterDate:v8];
    uint64_t v15 = [v12 initWithStartDate:v8 endDate:v14];

    uint64_t v11 = 0;
    id v6 = (id)v15;
  }
  else
  {
    uint64_t v11 = 1;
  }
  v16 = self->_explicitEntries;
  uint64_t v18 = +[BLSAlwaysOnTimeline rangeOfEntries:v16 forDateInterval:v6 shouldIncludePrevious:v11];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
  }
  else
  {
    v19 = -[NSArray subarrayWithRange:](v16, "subarrayWithRange:", v18, v17);
  }

  id v20 = bls_timelines_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v22 = [(BLSAlwaysOnTimeline *)self identifier];
    int v23 = [v19 count];
    long long v24 = objc_msgSend(v6, "bls_shortLoggingString");
    v25 = objc_msgSend(v19, "bls_boundedDescriptionWithMax:transformer:", 8, &__block_literal_global_104);
    int v26 = 134219010;
    v27 = self;
    __int16 v28 = 2114;
    id v29 = v22;
    __int16 v30 = 1024;
    int v31 = v23;
    __int16 v32 = 2114;
    v33 = v24;
    __int16 v34 = 2112;
    v35 = v25;
    _os_log_debug_impl(&dword_1B55DE000, v20, OS_LOG_TYPE_DEBUG, "%p:%{public}@ -> %d entries(subset) for %{public}@ : %@", (uint8_t *)&v26, 0x30u);
  }

  return v19;
}

id __87__BLSAlwaysOnExplicitEntriesTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 presentationTime];
  id v3 = objc_msgSend(v2, "bls_shortLoggingString");

  return v3;
}

- (void).cxx_destruct
{
}

@end