@interface ATXHomeScreenPageIconRanker
- (ATXHomeScreenPageIconRanker)init;
- (ATXHomeScreenPageIconRanker)initWithCache:(id)a3;
- (id)_pageForPageIndex:(unint64_t)a3;
- (id)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:(unint64_t)a3;
@end

@implementation ATXHomeScreenPageIconRanker

- (ATXHomeScreenPageIconRanker)init
{
  v3 = objc_opt_new();
  v4 = [(ATXHomeScreenPageIconRanker *)self initWithCache:v3];

  return v4;
}

- (ATXHomeScreenPageIconRanker)initWithCache:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHomeScreenPageIconRanker;
  v6 = [(ATXHomeScreenPageIconRanker *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cache, a3);
  }

  return v7;
}

- (id)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:(unint64_t)a3
{
  v3 = [(ATXHomeScreenPageIconRanker *)self _pageForPageIndex:a3];
  v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3)
  {
    id v5 = objc_opt_new();
    v6 = objc_opt_new();
    v7 = objc_opt_new();
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2419200.0];
    [v8 timeIntervalSinceReferenceDate];
    double v10 = v9;

    v11 = BiomeLibrary();
    v12 = [v11 App];
    v13 = [v12 InFocus];
    v14 = [NSNumber numberWithDouble:v10];
    v15 = objc_msgSend(v13, "atx_publisherFromStartTime:", v14);

    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_2;
    v64[3] = &unk_1E5D06280;
    v52 = v3;
    id v16 = v3;
    id v65 = v16;
    id v17 = v6;
    id v66 = v17;
    id v18 = v5;
    id v67 = v18;
    id v19 = v7;
    id v68 = v19;
    v53 = v15;
    id v20 = (id)[v15 sinkWithCompletion:&__block_literal_global_17 receiveInput:v64];
    v21 = objc_opt_new();
    v22 = [v16 leafIcons];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_5;
    v61[3] = &unk_1E5D062A8;
    id v23 = v18;
    id v62 = v23;
    id v24 = v21;
    id v63 = v24;
    [v22 enumerateObjectsUsingBlock:v61];

    v25 = __atxlog_handle_default();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:].cold.6();
    }

    v26 = [v17 allObjects];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_21;
    v59[3] = &unk_1E5D062D0;
    id v27 = v17;
    id v60 = v27;
    v28 = [v26 sortedArrayUsingComparator:v59];

    v29 = __atxlog_handle_default();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:].cold.5();
    }

    v30 = [v16 leafIcons];
    uint64_t v31 = objc_msgSend(v30, "_pas_mappedArrayWithIndexedTransform:", &__block_literal_global_26_0);
    v32 = (void *)v31;
    if (v31) {
      v33 = (void *)v31;
    }
    else {
      v33 = v4;
    }
    id v34 = v33;

    v35 = __atxlog_handle_default();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:].cold.4();
    }

    v36 = objc_opt_new();
    id v37 = v16;
    v38 = objc_opt_new();
    v39 = [v37 leafIcons];

    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __folderIndexesForPage_block_invoke;
    v69[3] = &unk_1E5D06318;
    id v70 = v38;
    id v40 = v38;
    [v39 enumerateObjectsUsingBlock:v69];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_28;
    v56[3] = &unk_1E5D05888;
    id v41 = v19;
    id v57 = v41;
    id v42 = v36;
    id v58 = v42;
    [v40 enumerateIndexesUsingBlock:v56];

    v43 = __atxlog_handle_default();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:]();
    }

    v44 = [v41 allObjects];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_30;
    v54[3] = &unk_1E5D062D0;
    id v45 = v41;
    id v55 = v45;
    v46 = [v44 sortedArrayUsingComparator:v54];

    v47 = __atxlog_handle_default();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:]();
    }

    v4 = objc_opt_new();
    v48 = (void *)[v42 copy];
    [v4 addObjectsFromArray:v48];

    v49 = (void *)[v24 copy];
    [v4 addObjectsFromArray:v49];

    [v4 addObjectsFromArray:v34];
    [v4 addObjectsFromArray:v46];
    [v4 addObjectsFromArray:v28];
    v50 = __atxlog_handle_default();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
      -[ATXHomeScreenPageIconRanker iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:]();
    }

    v3 = v52;
  }

  return v4;
}

void __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_2(id *a1, void *a2)
{
  v3 = [a2 eventBody];
  if ([v3 starting])
  {
    v4 = [v3 bundleID];
    id v5 = [a1[4] leafIcons];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_3;
    v7[3] = &unk_1E5D06258;
    id v8 = v4;
    id v9 = a1[5];
    id v10 = a1[6];
    id v11 = a1[7];
    id v6 = v4;
    [v5 enumerateObjectsUsingBlock:v7];
  }
}

void __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 bundleId];
    if ([*(id *)(a1 + 32) isEqualToString:v8])
    {
      id v9 = *(void **)(a1 + 40);
      id v10 = [NSNumber numberWithUnsignedInteger:a3];
      [v9 addObject:v10];

      [*(id *)(a1 + 48) addObject:*(void *)(a1 + 32)];
      *a4 = 1;

      goto LABEL_7;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_4;
    v11[3] = &unk_1E5D06230;
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 56);
    uint64_t v14 = a3;
    [v7 enumerateApps:v11];
  }
LABEL_7:
}

void __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_4(void *a1, void *a2)
{
  v3 = [a2 bundleId];
  int v4 = [v3 isEqualToString:a1[4]];

  if (v4)
  {
    id v5 = (void *)a1[5];
    id v6 = [NSNumber numberWithUnsignedInteger:a1[6]];
    [v5 addObject:v6];
  }
}

uint64_t __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v11;
  if (isKindOfClass)
  {
    id v7 = [v11 bundleId];
    if (([*(id *)(a1 + 32) containsObject:v7] & 1) == 0)
    {
      id v8 = *(void **)(a1 + 40);
      id v9 = [NSNumber numberWithUnsignedInteger:a3];
      [v8 addObject:v9];
    }
    id v6 = v11;
  }

  return MEMORY[0x1F41817F8](isKindOfClass, v6);
}

uint64_t __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_21(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 countForObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  if (v7 >= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v7 > v8) {
    return 1;
  }
  else {
    return v9;
  }
}

id __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_23(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [NSNumber numberWithUnsignedInteger:a3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_28(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

uint64_t __88__ATXHomeScreenPageIconRanker_iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex___block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 countForObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  if (v7 >= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v7 > v8) {
    return 1;
  }
  else {
    return v9;
  }
}

- (id)_pageForPageIndex:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  cache = self->_cache;
  id v20 = 0;
  id v5 = [(ATXHomeScreenConfigCache *)cache loadHomeScreenAndTodayPageConfigurationsWithError:&v20];
  id v6 = v20;
  if (v6)
  {
    unint64_t v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenPageIconRanker _pageForPageIndex:]();
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "pageIndex", (void)v16) == a3)
        {
          id v14 = v13;
          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_15:

  return v14;
}

- (void).cxx_destruct
{
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "ATXHomeScreenPageIconRanker: final sorted icon indexes: %@", v2, v3, v4, v5, v6);
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "ATXHomeScreenPageIconRanker: sorted launched folder indexes: %@", v2, v3, v4, v5, v6);
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "ATXHomeScreenPageIconRanker: unlaunched folder indexes: %@", v2, v3, v4, v5, v6);
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "ATXHomeScreenPageIconRanker: web clip indexes: %@", v2, v3, v4, v5, v6);
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "ATXHomeScreenPageIconRanker: sorted launched app indexes: %@", v2, v3, v4, v5, v6);
}

- (void)iconIndexesInAscendingOrderOfHistoricalUsageForPageIndex:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_9(&dword_1A790D000, v0, v1, "ATXHomeScreenPageIconRanker: unlaunched app indexes: %@", v2, v3, v4, v5, v6);
}

- (void)_pageForPageIndex:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "ATXHomeScreenPageIconRanker: Unable to retrieve home screen config: %@", v1, 0xCu);
}

@end