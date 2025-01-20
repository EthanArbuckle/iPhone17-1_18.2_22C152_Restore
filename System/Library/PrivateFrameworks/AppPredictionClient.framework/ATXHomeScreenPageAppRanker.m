@interface ATXHomeScreenPageAppRanker
- (id)appsInAscendingOrderOfHistoricalUsage:(id)a3;
- (id)appsInAscendingOrderOfHistoricalUsageForPage:(unint64_t)a3;
@end

@implementation ATXHomeScreenPageAppRanker

- (id)appsInAscendingOrderOfHistoricalUsageForPage:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  id v20 = 0;
  v6 = [v5 loadHomeScreenAndTodayPageConfigurationsWithError:&v20];
  id v7 = v20;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    v12 = (void *)MEMORY[0x1E4F1CBF0];
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "pageIndex", (void)v16) == a3)
        {
          v12 = [(ATXHomeScreenPageAppRanker *)self appsInAscendingOrderOfHistoricalUsage:v14];
          goto LABEL_12;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_12:

  return v12;
}

- (id)appsInAscendingOrderOfHistoricalUsage:(id)a3
{
  v3 = [a3 nonFolderAppsOnPage];
  v4 = (void *)[v3 mutableCopy];

  v5 = objc_opt_new();
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2419200.0];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  uint64_t v9 = BiomeLibrary();
  uint64_t v10 = [v9 App];
  uint64_t v11 = [v10 InFocus];
  v12 = [NSNumber numberWithDouble:v8];
  v13 = objc_msgSend(v11, "atx_publisherFromStartTime:", v12);

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68__ATXHomeScreenPageAppRanker_appsInAscendingOrderOfHistoricalUsage___block_invoke_2;
  v25[3] = &unk_1E5D066E0;
  id v26 = v4;
  id v14 = v5;
  id v27 = v14;
  id v15 = v4;
  id v16 = (id)[v13 sinkWithCompletion:&__block_literal_global_20 receiveInput:v25];
  [v15 minusSet:v14];
  long long v17 = [v15 allObjects];
  long long v18 = (void *)[v17 mutableCopy];

  long long v19 = [v14 allObjects];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __68__ATXHomeScreenPageAppRanker_appsInAscendingOrderOfHistoricalUsage___block_invoke_3;
  v23[3] = &unk_1E5D062D0;
  id v24 = v14;
  id v20 = v14;
  v21 = [v19 sortedArrayUsingComparator:v23];
  [v18 addObjectsFromArray:v21];

  return v18;
}

void __68__ATXHomeScreenPageAppRanker_appsInAscendingOrderOfHistoricalUsage___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 eventBody];
  v3 = [v4 bundleID];
  if ([v4 starting] && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3)) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

uint64_t __68__ATXHomeScreenPageAppRanker_appsInAscendingOrderOfHistoricalUsage___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
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

@end