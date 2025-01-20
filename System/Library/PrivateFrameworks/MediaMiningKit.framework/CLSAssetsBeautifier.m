@interface CLSAssetsBeautifier
+ (id)beautifier;
- (BOOL)discardNonEligibleClustersInSampling;
- (BOOL)enableFinalNaturalClustering;
- (BOOL)enableFinalTimeClustering;
- (BOOL)enableIntermediateNaturalClustering;
- (BOOL)enableNetworkAccess;
- (BOOL)enableStatisticalSampling;
- (BOOL)itemIsRequired:(id)a3;
- (BOOL)usesKMeans;
- (CLSAssetsBeautifier)initWithSimilarityModelClass:(Class)a3;
- (NSSet)identifiersOfEligibleItems;
- (NSSet)identifiersOfRequiredItems;
- (OS_os_log)loggingConnection;
- (id)_clustersBySplittingZeroDiameterClustersInClusters:(id)a3 targetingNumberOfClusters:(unint64_t)a4;
- (id)_naturalClusteringBestItemInItems:(id)a3;
- (id)_naturalClusteringWithItems:(id)a3 withSimilarity:(int64_t)a4 timestampSupport:(BOOL)a5 debugInfo:(id)a6;
- (id)bestItemInItems:(id)a3;
- (id)deduplicateItems:(id)a3 debugInfo:(id)a4;
- (id)deduplicateItems:(id)a3 withDuration:(double)a4 andSimilarity:(int64_t)a5 debugInfo:(id)a6;
- (id)hierarchicalClusteringDistanceBlock;
- (id)performWithItems:(id)a3 maximumNumberOfItemsToChoose:(unint64_t)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)performWithItems:(id)a3 maximumNumberOfItemsToChoose:(unint64_t)a4 progressBlock:(id)a5;
- (id)rankSimilarItems:(id)a3;
- (id)requiredItemsInItems:(id)a3;
- (id)sampledItemsInSortedItems:(id)a3 maximumNumberOfItemsToChoose:(unint64_t)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)sortedItemsWithItems:(id)a3;
- (id)timeClusteringDistanceBlock;
- (void)setDiscardNonEligibleClustersInSampling:(BOOL)a3;
- (void)setEnableFinalNaturalClustering:(BOOL)a3;
- (void)setEnableFinalTimeClustering:(BOOL)a3;
- (void)setEnableIntermediateNaturalClustering:(BOOL)a3;
- (void)setEnableNetworkAccess:(BOOL)a3;
- (void)setEnableStatisticalSampling:(BOOL)a3;
- (void)setIdentifiersOfEligibleItems:(id)a3;
- (void)setIdentifiersOfRequiredItems:(id)a3;
- (void)setLoggingConnection:(id)a3;
- (void)setUsesKMeans:(BOOL)a3;
@end

@implementation CLSAssetsBeautifier

- (id)timeClusteringDistanceBlock
{
  return (id)[&__block_literal_global_2 copy];
}

double __63__CLSAssetsBeautifier_Performance__timeClusteringDistanceBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_msgSend((id)objc_msgSend(a2, "cls_universalDate"), "timeIntervalSinceDate:", objc_msgSend(a3, "cls_universalDate"));
  if (result < 0.0) {
    return -result;
  }
  return result;
}

- (id)hierarchicalClusteringDistanceBlock
{
  return (id)[&__block_literal_global_1114 copy];
}

double __71__CLSAssetsBeautifier_Performance__hierarchicalClusteringDistanceBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_msgSend((id)objc_msgSend(a2, "cls_universalDate"), "timeIntervalSinceDate:", objc_msgSend(a3, "cls_universalDate"));
  if (result < 0.0) {
    return -result;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_identifiersOfEligibleItems, 0);
  objc_storeStrong((id *)&self->_identifiersOfRequiredItems, 0);
  objc_storeStrong((id *)&self->_similarStacker, 0);
}

- (void)setLoggingConnection:(id)a3
{
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setDiscardNonEligibleClustersInSampling:(BOOL)a3
{
  self->_discardNonEligibleClustersInSampling = a3;
}

- (BOOL)discardNonEligibleClustersInSampling
{
  return self->_discardNonEligibleClustersInSampling;
}

- (void)setIdentifiersOfEligibleItems:(id)a3
{
}

- (NSSet)identifiersOfEligibleItems
{
  return self->_identifiersOfEligibleItems;
}

- (void)setIdentifiersOfRequiredItems:(id)a3
{
}

- (NSSet)identifiersOfRequiredItems
{
  return self->_identifiersOfRequiredItems;
}

- (void)setUsesKMeans:(BOOL)a3
{
  self->_usesKMeans = a3;
}

- (BOOL)usesKMeans
{
  return self->_usesKMeans;
}

- (void)setEnableFinalTimeClustering:(BOOL)a3
{
  self->_enableFinalTimeClustering = a3;
}

- (BOOL)enableFinalTimeClustering
{
  return self->_enableFinalTimeClustering;
}

- (void)setEnableFinalNaturalClustering:(BOOL)a3
{
  self->_enableFinalNaturalClustering = a3;
}

- (BOOL)enableFinalNaturalClustering
{
  return self->_enableFinalNaturalClustering;
}

- (void)setEnableIntermediateNaturalClustering:(BOOL)a3
{
  self->_enableIntermediateNaturalClustering = a3;
}

- (BOOL)enableIntermediateNaturalClustering
{
  return self->_enableIntermediateNaturalClustering;
}

- (void)setEnableNetworkAccess:(BOOL)a3
{
  self->_enableNetworkAccess = a3;
}

- (BOOL)enableNetworkAccess
{
  return self->_enableNetworkAccess;
}

- (void)setEnableStatisticalSampling:(BOOL)a3
{
  self->_enableStatisticalSampling = a3;
}

- (BOOL)enableStatisticalSampling
{
  return self->_enableStatisticalSampling;
}

- (id)requiredItemsInItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  identifiersOfRequiredItems = self->_identifiersOfRequiredItems;
  if (identifiersOfRequiredItems && [(NSSet *)identifiersOfRequiredItems count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v16 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v13 = self->_identifiersOfRequiredItems;
          v14 = [v12 clsIdentifier];
          LODWORD(v13) = [(NSSet *)v13 containsObject:v14];

          if (v13)
          {
            if (!v9) {
              id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v9 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    id v4 = v16;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)itemIsRequired:(id)a3
{
  identifiersOfRequiredItems = self->_identifiersOfRequiredItems;
  if (!identifiersOfRequiredItems) {
    return 0;
  }
  id v4 = [a3 clsIdentifier];
  BOOL v5 = [(NSSet *)identifiersOfRequiredItems containsObject:v4];

  return v5;
}

- (id)rankSimilarItems:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_1184];
}

uint64_t __40__CLSAssetsBeautifier_rankSimilarItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 clsIsAestheticallyPrettyGood];
  int v7 = [v5 clsIsAestheticallyPrettyGood];
  if (v6)
  {
    uint64_t v8 = -1;
    if (!v7) {
      goto LABEL_19;
    }
    [v4 clsAestheticScore];
    double v10 = v9;
    [v5 clsAestheticScore];
    double v12 = v11 + 0.0;
    double v13 = v10 + 0.0;
    if (v10 <= v11 + 0.0) {
      uint64_t v8 = 1;
    }
  }
  else
  {
    if (v7) {
      goto LABEL_7;
    }
    [v4 clsAestheticScore];
    double v10 = v14;
    [v5 clsAestheticScore];
    double v12 = v11 + 0.0;
    double v13 = v10 + 0.0;
    if (v10 <= v11 + 0.0) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = -1;
    }
  }
  if (v11 <= v13 && v10 <= v12)
  {
    int v16 = [v4 clsIsInterestingSDOF];
    int v17 = [v5 clsIsInterestingSDOF];
    if (v16 && !v17) {
      goto LABEL_18;
    }
    if ((v16 | v17 ^ 1) == 1)
    {
      [v4 clsSharpnessScore];
      double v20 = v19;
      [v5 clsSharpnessScore];
      if (v21 <= v20)
      {
        if (v21 >= v20)
        {
          uint64_t v22 = objc_msgSend(v4, "cls_universalDate");
          v23 = objc_msgSend(v5, "cls_universalDate");
          uint64_t v8 = [v22 compare:v23];

          if (!v8)
          {
            v24 = [v4 clsIdentifier];
            v25 = [v5 clsIdentifier];
            uint64_t v8 = [v24 compare:v25];
          }
          goto LABEL_19;
        }
LABEL_18:
        uint64_t v8 = -1;
        goto LABEL_19;
      }
    }
LABEL_7:
    uint64_t v8 = 1;
  }
LABEL_19:

  return v8;
}

- (id)_naturalClusteringWithItems:(id)a3 withSimilarity:(int64_t)a4 timestampSupport:(BOOL)a5 debugInfo:(id)a6
{
  BOOL v7 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  double v12 = objc_opt_new();
  v31 = v10;
  double v13 = [(CLSSimilarStacker *)self->_similarStacker stackSimilarItems:v10 withSimilarity:a4 timestampSupport:v7 progressBlock:0];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ((unint64_t)[v18 count] < 2)
        {
          double v20 = [v18 firstObject];
          double v19 = v20;
          if (v20)
          {
            identifiersOfEligibleItems = self->_identifiersOfEligibleItems;
            if (!identifiersOfEligibleItems
              || ([v20 clsIdentifier],
                  uint64_t v22 = objc_claimAutoreleasedReturnValue(),
                  BOOL v23 = [(NSSet *)identifiersOfEligibleItems containsObject:v22],
                  v22,
                  v23))
            {
              [v12 addObject:v19];
              if (v11)
              {
                if ([(CLSAssetsBeautifier *)self itemIsRequired:v19])
                {
                  v24 = v11;
                  uint64_t v25 = 4;
                  v26 = v19;
                  v27 = @"Item is required";
                }
                else
                {
                  v24 = v11;
                  uint64_t v25 = 1;
                  v26 = v19;
                  v27 = @"Alone in Natural Clustering";
                }
                [v24 setState:v25 ofItem:v26 withReason:v27];
              }
            }
          }
        }
        else
        {
          double v19 = [(CLSAssetsBeautifier *)self requiredItemsInItems:v18];
          if ([v19 count])
          {
            [v12 addObjectsFromArray:v19];
            if (v11) {
              [v11 dedupItems:v18 toRequiredItems:v19 withDedupingType:1];
            }
          }
          else
          {
            v28 = [(CLSAssetsBeautifier *)self _naturalClusteringBestItemInItems:v18];
            if (v28)
            {
              [v12 addObject:v28];
              [v11 dedupItems:v18 toItem:v28 withDedupingType:1];
            }
            else if (v11)
            {
              v29 = [MEMORY[0x1E4F1CAD0] setWithArray:v18];
              [v11 setState:2 ofItems:v29 withReason:@"Failed to find a best item in Natural Clustering"];
            }
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v15);
  }

  return v12;
}

- (id)_naturalClusteringBestItemInItems:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CLSAssetsBeautifier *)self requiredItemsInItems:v4];
  if ([v5 count])
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2150000, loggingConnection, OS_LOG_TYPE_ERROR, "_naturalClusteringBestItemInItems should not be called on items containing required items", buf, 2u);
    }
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v8)
  {
    id v11 = 0;
    long long v32 = v7;
    goto LABEL_37;
  }
  uint64_t v9 = v8;
  long long v35 = v5;
  int v10 = 0;
  id v11 = 0;
  uint64_t v12 = *(void *)v37;
  double v13 = *MEMORY[0x1E4F8E730];
  double v14 = -1.79769313e308;
  double v15 = 1.79769313e308;
  double v16 = -1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v37 != v12) {
        objc_enumerationMutation(v7);
      }
      long long v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      identifiersOfEligibleItems = self->_identifiersOfEligibleItems;
      if (identifiersOfEligibleItems)
      {
        double v20 = [*(id *)(*((void *)&v36 + 1) + 8 * i) clsIdentifier];
        BOOL v21 = [(NSSet *)identifiersOfEligibleItems containsObject:v20];

        if (!v21) {
          continue;
        }
      }
      [v18 clsContentScore];
      double v23 = v22;
      if (v15 >= v22) {
        double v15 = v22;
      }
      if ([v18 isFavorite]) {
        double v24 = v13;
      }
      else {
        double v24 = v23;
      }
      int v25 = [v18 clsIsAestheticallyPrettyGood];
      if (v24 <= v16)
      {
        if (v24 != v16 || (v25 & 1) == 0) {
          continue;
        }
      }
      else if (v25)
      {
        [v18 clsAestheticScore];
        double v27 = v26;
        int v10 = 1;
LABEL_28:
        id v30 = v18;

        double v14 = v27;
        double v16 = v24;
        id v11 = v30;
        continue;
      }
      if (v24 == v16) {
        int v10 = [v11 clsIsAestheticallyPrettyGood] ^ 1;
      }
      else {
        int v10 = 0;
      }
      [v18 clsAestheticScore];
      double v27 = v28;
      if (v24 > v16 || v28 > v14) {
        goto LABEL_28;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  }
  while (v9);

  if (v11)
  {
    id v5 = v35;
    if ((([v11 isFavorite] | v10) & 1) == 0)
    {
      [v11 clsContentScore];
      if (v31 == v15)
      {
        long long v32 = [(CLSAssetsBeautifier *)self rankSimilarItems:v7];
        if ([v32 count])
        {
          uint64_t v33 = [v32 firstObject];

          id v11 = (void *)v33;
        }
LABEL_37:
      }
    }
  }
  else
  {
    id v5 = v35;
  }

  return v11;
}

- (id)bestItemInItems:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 count];
  if (!v5) {
    goto LABEL_57;
  }
  int v6 = [(CLSAssetsBeautifier *)self requiredItemsInItems:v4];
  if ([v6 count])
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2150000, loggingConnection, OS_LOG_TYPE_ERROR, "bestItemInItems should not be called on items containing required items", buf, 2u);
    }
  }
  if (v5 == (void *)1)
  {
    uint64_t v8 = [v4 firstObject];
    id v5 = v8;
    identifiersOfEligibleItems = self->_identifiersOfEligibleItems;
    if (identifiersOfEligibleItems
      && ([v8 clsIdentifier],
          int v10 = objc_claimAutoreleasedReturnValue(),
          BOOL v11 = [(NSSet *)identifiersOfEligibleItems containsObject:v10],
          v10,
          !v11)
      || ([v5 clsContentScore], v12 < *MEMORY[0x1E4F8E740]))
    {
      v45 = v6;
      id v46 = v4;
      double v13 = 0;
      goto LABEL_55;
    }
    goto LABEL_56;
  }
  v45 = v6;
  id v46 = v4;
  id v5 = [(CLSAssetsBeautifier *)self sortedItemsWithItems:v4];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v15 = [v5 count];
  double v54 = *MEMORY[0x1E4F8E740];
  double v53 = *MEMORY[0x1E4F8E730];
  unint64_t v48 = v15 >> 1;
  v49 = v5;
  unint64_t v50 = v15;
  double v47 = (double)v15 * 0.5;
  do
  {
    if ([v14 count] >= v15) {
      goto LABEL_52;
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v16 = v5;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (!v17)
    {

LABEL_52:
      double v13 = 0;
      break;
    }
    uint64_t v18 = v17;
    double v13 = 0;
    uint64_t v19 = *(void *)v56;
    double v20 = -1.79769313e308;
    double v21 = 1.79769313e308;
    double v22 = -1.79769313e308;
    double v23 = -1.79769313e308;
    double v51 = -1.79769313e308;
    double v52 = 1.79769313e308;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v56 != v19) {
          objc_enumerationMutation(v16);
        }
        int v25 = *(void **)(*((void *)&v55 + 1) + 8 * v24);
        if (([v14 containsObject:v25] & 1) == 0)
        {
          [v25 clsContentScore];
          double v27 = v26;
          double v28 = self->_identifiersOfEligibleItems;
          if (v28
            && ([v25 clsIdentifier],
                v29 = objc_claimAutoreleasedReturnValue(),
                BOOL v30 = [(NSSet *)v28 containsObject:v29],
                v29,
                !v30)
            || v27 < v54)
          {
            [v14 addObject:v25];
            goto LABEL_34;
          }
          if (v21 >= v27) {
            double v21 = v27;
          }
          int v31 = [v25 isFavorite];
          double v32 = -0.0;
          if (v31) {
            double v32 = v53;
          }
          double v33 = v27 + v32;
          [v25 clsAestheticScore];
          double v35 = v34;
          [v25 clsFaceScore];
          double v37 = v36;
          if (v33 > v22)
          {
            double v52 = 1.79769313e308;
LABEL_33:
            id v38 = v25;

            double v13 = v38;
            double v51 = v27;
            double v22 = v33;
            double v23 = v35;
            double v20 = v37;
            goto LABEL_34;
          }
          if (v33 != v22) {
            goto LABEL_34;
          }
          if (v36 > v20) {
            goto LABEL_32;
          }
          if (v36 != v20) {
            goto LABEL_34;
          }
          if (v35 > v23)
          {
LABEL_32:
            double v52 = v35 - v23;
            goto LABEL_33;
          }
          double v39 = v52;
          if (v52 >= v23 - v35) {
            double v39 = v23 - v35;
          }
          double v52 = v39;
        }
LABEL_34:
        ++v24;
      }
      while (v18 != v24);
      uint64_t v40 = [v16 countByEnumeratingWithState:&v55 objects:v60 count:16];
      uint64_t v18 = v40;
    }
    while (v40);

    unint64_t v15 = v50;
    if (!v13)
    {
      id v5 = v49;
      break;
    }
    id v5 = v49;
    if (v51 != v21) {
      break;
    }
    if (v50 < 2) {
      break;
    }
    if (objc_msgSend(v13, "isFavorite", v51)) {
      break;
    }
    if ([v13 clsIsAestheticallyPrettyGood]) {
      break;
    }
    double v41 = v52;
    if (v52 > 0.0) {
      break;
    }
    unint64_t v42 = v48;
    do
    {
      v43 = v13;
      double v13 = objc_msgSend(v16, "objectAtIndexedSubscript:", v42, v41);

      if (![v14 containsObject:v13]) {
        break;
      }
      double v41 = (double)v42;
      unint64_t v42 = v50 - v42 - (v47 <= (double)v42);
    }
    while (v42 < v50);
  }
  while (!v13);

LABEL_55:
  id v5 = v13;
  int v6 = v45;
  id v4 = v46;
LABEL_56:

LABEL_57:
  return v5;
}

- (id)sortedItemsWithItems:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F29008];
  id v4 = a3;
  id v5 = [v3 sortDescriptorWithKey:@"cls_universalDate" ascending:1];
  v10[0] = v5;
  int v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"clsIdentifier" ascending:1];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  uint64_t v8 = [v4 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)_clustersBySplittingZeroDiameterClustersInClusters:(id)a3 targetingNumberOfClusters:(unint64_t)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int64_t v6 = a4 - [v5 count];
  if (v6 <= 0)
  {
    id v40 = v5;
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          unint64_t v15 = [v14 objects];
          if ((unint64_t)[v15 count] <= 1) {
            id v16 = v7;
          }
          else {
            id v16 = v8;
          }
          [v16 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      id v46 = v8;
      unint64_t v42 = v9;
      v43 = v7;
      unint64_t v17 = 0x1E4F8A000;
      int64_t v18 = v6;
      do
      {
        uint64_t v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objects.@count" ascending:0];
        double v51 = v19;
        double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
        double v21 = v46;
        [v46 sortUsingDescriptors:v20];

        v45 = [v46 firstObject];
        double v22 = [v45 objects];
        unint64_t v23 = [v22 count];
        unint64_t v24 = [v46 count];
        unint64_t v25 = v23;
        if (v24 >= 2)
        {
          double v26 = [v46 objectAtIndexedSubscript:1];
          double v27 = [v26 objects];
          unint64_t v28 = [v27 count];

          double v21 = v46;
          unint64_t v29 = v23 / v28;
          unint64_t v17 = 0x1E4F8A000uLL;
          unint64_t v25 = v29 + 1;
        }
        int64_t v44 = v18 + 1;
        if (v25 >= v18 + 1) {
          unint64_t v30 = v18 + 1;
        }
        else {
          unint64_t v30 = v25;
        }
        [v21 removeObjectAtIndex:0];
        if (v30)
        {
          unint64_t v31 = 0;
          unint64_t v32 = v23;
          unint64_t v33 = v30;
          do
          {
            unint64_t v34 = v32 / v30;
            unint64_t v35 = v32 / v30 - v31;
            double v36 = *(void **)(v17 + 1928);
            double v37 = objc_msgSend(v22, "subarrayWithRange:");
            id v38 = [v36 clusterWithObjects:v37];

            unint64_t v17 = 0x1E4F8A000;
            if (v35 <= 1) {
              double v39 = v43;
            }
            else {
              double v39 = v46;
            }
            [v39 addObject:v38];

            v32 += v23;
            unint64_t v31 = v34;
            --v33;
          }
          while (v33);
        }
        int64_t v18 = v44 - v30;
      }
      while ((uint64_t)(v44 - v30) > 0);
      id v7 = v43;
      id v8 = v46;
      id v9 = [v43 arrayByAddingObjectsFromArray:v46];
    }
    id v40 = v9;
  }
  return v40;
}

- (id)deduplicateItems:(id)a3 withDuration:(double)a4 andSimilarity:(int64_t)a5 debugInfo:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  [v10 setAgent:@"Beautifier"];
  [v10 setStage:@"Deduplicate"];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  id v12 = objc_alloc(MEMORY[0x1E4F8A780]);
  id v13 = [(CLSAssetsBeautifier *)self timeClusteringDistanceBlock];
  id v14 = (void *)[v12 initWithDistanceBlock:v13];

  [v14 setMaximumDistance:a4];
  [v14 setMinimumNumberOfObjects:1];
  unint64_t v32 = v14;
  unint64_t v33 = v9;
  unint64_t v15 = [v14 performWithDataset:v9 progressBlock:0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    double v19 = *MEMORY[0x1E4F8E750];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        double v21 = [*(id *)(*((void *)&v35 + 1) + 8 * i) objects];
        if ((unint64_t)[v21 count] < 2)
        {
          id v23 = [v21 firstObject];
          if ([(CLSAssetsBeautifier *)self itemIsRequired:v23])
          {
            unint64_t v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];
            unint64_t v25 = v10;
            uint64_t v26 = 4;
            double v27 = v24;
            unint64_t v28 = @"Item is required";
          }
          else
          {
            [v23 clsContentScore];
            double v30 = v29;
            unint64_t v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];
            unint64_t v25 = v10;
            if (v30 <= v19)
            {
              uint64_t v26 = 2;
              double v27 = v24;
              unint64_t v28 = @"Asset is Junk";
            }
            else
            {
              uint64_t v26 = 1;
              double v27 = v24;
              unint64_t v28 = @"Unique asset";
            }
          }
          [v25 setState:v26 ofItems:v27 withReason:v28];
          goto LABEL_16;
        }
        double v22 = [(CLSAssetsBeautifier *)self _naturalClusteringWithItems:v21 withSimilarity:a5 timestampSupport:0 debugInfo:v10];
        id v23 = v22;
        if (v22 && [v22 count])
        {
          id v23 = v23;
          unint64_t v24 = v21;
          double v21 = v23;
LABEL_16:
        }
        [v11 addObjectsFromArray:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v17);
  }

  return v11;
}

- (id)deduplicateItems:(id)a3 debugInfo:(id)a4
{
  return [(CLSAssetsBeautifier *)self deduplicateItems:a3 withDuration:2 andSimilarity:a4 debugInfo:60.0];
}

- (id)performWithItems:(id)a3 maximumNumberOfItemsToChoose:(unint64_t)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v81 = a5;
  id v79 = a6;
  uint64_t v10 = MEMORY[0x1D2602540]();
  uint64_t v11 = (void (**)(void, void, double))v10;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x2020000000;
  char v97 = 0;
  if (!v10
    || (char v93 = 0,
        (*(void (**)(uint64_t, char *, double))(v10 + 16))(v10, &v93, 0.0),
        char v12 = *((unsigned char *)v95 + 24) | v93,
        (*((unsigned char *)v95 + 24) = v12) == 0))
  {
    id v14 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    {
      int v29 = [v9 count];
      *(_DWORD *)buf = 67109376;
      int v101 = a4;
      __int16 v102 = 1024;
      int v103 = v29;
      _os_log_debug_impl(&dword_1D2150000, (os_log_t)v14, OS_LOG_TYPE_DEBUG, "Beautifier: Beautifying %d items out of %d", buf, 0xEu);
    }

    [v81 setAgent:@"Beautifier"];
    unint64_t v15 = self;
    uint64_t v16 = [(CLSAssetsBeautifier *)self sortedItemsWithItems:v9];
    v77 = [(CLSAssetsBeautifier *)self sampledItemsInSortedItems:v16 maximumNumberOfItemsToChoose:a4 debugInfo:v81 progressBlock:v79];
    v78 = -[CLSAssetsBeautifier sortedItemsWithItems:](self, "sortedItemsWithItems:");
    v76 = (void *)v16;
    if (v11)
    {
      char v93 = 0;
      ((void (**)(void, char *, double))v11)[2](v11, &v93, 0.5);
      char v17 = *((unsigned char *)v95 + 24) | v93;
      *((unsigned char *)v95 + 24) = v17;
      if (v17)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v101 = 333;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        id v13 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_95;
      }
    }
    id v18 = v78;
    id v19 = v18;
    if (self->_enableFinalNaturalClustering && (unint64_t)[v18 count] >= 2)
    {
      [v81 setStage:@"Final Natural Clustering"];
      [v81 beginTentativeSection];
      double v20 = [(CLSAssetsBeautifier *)self _naturalClusteringWithItems:v19 withSimilarity:0 timestampSupport:0 debugInfo:v81];
      uint64_t v21 = [v20 count];
      [v81 endTentativeSectionWithSuccess:v21 != 0];
      if (v21)
      {
        double v22 = self->_loggingConnection;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
        {
          int v63 = [v19 count];
          int v64 = [v20 count];
          *(_DWORD *)buf = 67109376;
          int v101 = v63;
          __int16 v102 = 1024;
          int v103 = v64;
          _os_log_debug_impl(&dword_1D2150000, (os_log_t)v22, OS_LOG_TYPE_DEBUG, "Final Natural Clustering filtered from %d to %d items", buf, 0xEu);
        }

        id v23 = v20;
        id v19 = v23;
      }

      unint64_t v15 = self;
    }
    if (v11)
    {
      char v93 = 0;
      ((void (**)(void, char *, double))v11)[2](v11, &v93, 0.5);
      char v24 = *((unsigned char *)v95 + 24) | v93;
      *((unsigned char *)v95 + 24) = v24;
      if (v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v101 = 353;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        id v13 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_94;
      }
    }
    if (!v15->_enableFinalTimeClustering || (unint64_t)[v19 count] < 2)
    {
LABEL_86:
      long long v58 = v15->_loggingConnection;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        int v61 = [v19 count];
        int v62 = [v9 count];
        *(_DWORD *)buf = 67109376;
        int v101 = v61;
        __int16 v102 = 1024;
        int v103 = v62;
        _os_log_debug_impl(&dword_1D2150000, v58, OS_LOG_TYPE_DEBUG, "Beautifier: Beautified %d items out of %d", buf, 0xEu);
      }

      if (v11
        && (char v93 = 0,
            ((void (**)(void, char *, double))v11)[2](v11, &v93, 1.0),
            char v59 = *((unsigned char *)v95 + 24) | v93,
            (*((unsigned char *)v95 + 24) = v59) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v101 = 451;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        id v13 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        id v19 = v19;
        id v13 = v19;
      }
      goto LABEL_94;
    }
    [v81 setStage:@"Final Time Clustering"];
    id v70 = v19;
    id v25 = objc_alloc(MEMORY[0x1E4F8A780]);
    id v26 = [(CLSAssetsBeautifier *)v15 timeClusteringDistanceBlock];
    double v27 = (void *)[v25 initWithDistanceBlock:v26];

    [v27 setMaximumDistance:3.0];
    [v27 setMinimumNumberOfObjects:1];
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __93__CLSAssetsBeautifier_performWithItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke;
    v90[3] = &unk_1E6910648;
    id v72 = v11;
    id v91 = v72;
    v92 = &v94;
    v69 = [v27 performWithDataset:v70 progressBlock:v90];
    if (*((unsigned char *)v95 + 24))
    {
      int v28 = 1;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v101 = 366;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
LABEL_83:

      if (v28)
      {
        id v13 = (void *)MEMORY[0x1E4F1CBF0];
        id v19 = v70;
LABEL_94:

LABEL_95:
        goto LABEL_96;
      }
      unint64_t v15 = self;
      id v19 = v70;
      goto LABEL_86;
    }
    v73 = [MEMORY[0x1E4F1CA48] array];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v30 = v69;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v86 objects:v99 count:16];
    if (!v31)
    {
LABEL_76:

      long long v55 = self->_loggingConnection;
      if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_DEBUG))
      {
        int v65 = [v70 count];
        int v66 = [v73 count];
        *(_DWORD *)buf = 67109376;
        int v101 = v65;
        __int16 v102 = 1024;
        int v103 = v66;
        _os_log_debug_impl(&dword_1D2150000, (os_log_t)v55, OS_LOG_TYPE_DEBUG, "Final Time Clustering filtered from %d to %d items", buf, 0xEu);
      }

      id v56 = v73;
      int v28 = 0;
      long long v57 = v70;
      id v70 = v56;
LABEL_82:

      goto LABEL_83;
    }
    uint64_t v74 = *(void *)v87;
    double v32 = *MEMORY[0x1E4F8E730];
    v67 = v27;
    id v68 = v9;
    id obj = v30;
LABEL_32:
    uint64_t v75 = v31;
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v87 != v74) {
        objc_enumerationMutation(obj);
      }
      unint64_t v34 = *(void **)(*((void *)&v86 + 1) + 8 * v33);
      if (v11)
      {
        char v93 = 0;
        (*((void (**)(id, char *, double))v72 + 2))(v72, &v93, 0.5);
        char v35 = *((unsigned char *)v95 + 24) | v93;
        *((unsigned char *)v95 + 24) = v35;
        if (v35)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            int v101 = 372;
            _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
          }
          int v28 = 1;
          long long v57 = obj;
          goto LABEL_82;
        }
      }
      long long v36 = objc_msgSend(v34, "objects", v67, v68);
      if ((unint64_t)([v36 count] - 2) <= 2) {
        break;
      }
      [v73 addObjectsFromArray:v36];
LABEL_74:

      if (++v33 == v75)
      {
        id v30 = obj;
        uint64_t v31 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
        if (v31) {
          goto LABEL_32;
        }
        goto LABEL_76;
      }
    }
    long long v37 = [(CLSAssetsBeautifier *)self requiredItemsInItems:v36];
    if ([v37 count])
    {
      [v73 addObjectsFromArray:v37];
      if (v81) {
        [v81 dedupItems:v36 toRequiredItems:v37 withDedupingType:5];
      }
      goto LABEL_73;
    }
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v39 = v36;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v82 objects:v98 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v83 != v41) {
            objc_enumerationMutation(v39);
          }
          v43 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          if (([v43 clsIsInterestingSDOF] & 1) != 0
            || ([v43 clsIsInterestingHDR] & 1) != 0
            || [v43 clsIsInterestingLivePhoto])
          {
            [v38 addObject:v43];
          }
        }
        uint64_t v40 = [v39 countByEnumeratingWithState:&v82 objects:v98 count:16];
      }
      while (v40);
    }

    double v27 = v67;
    id v9 = v68;
    int64_t v44 = [(CLSAssetsBeautifier *)self bestItemInItems:v39];
    if (v44)
    {
      if (![v38 count]
        || ([v44 clsIsInterestingSDOF] & 1) != 0
        || ([v44 clsIsInterestingHDR] & 1) != 0
        || ([v44 clsIsInterestingLivePhoto] & 1) != 0)
      {
        goto LABEL_65;
      }
      v45 = [(CLSAssetsBeautifier *)self bestItemInItems:v38];
      [v44 clsContentScore];
      double v47 = v46;
      if ([v44 isFavorite]) {
        double v48 = v32;
      }
      else {
        double v48 = -0.0;
      }
      [v45 clsContentScore];
      double v50 = v49;
      int v51 = [v45 isFavorite];
      double v52 = -0.0;
      if (v51) {
        double v52 = v32;
      }
      if (v50 + v52 < v47 + v48)
      {

LABEL_65:
        uint64_t v53 = 5;
LABEL_66:
        [v73 addObject:v44];
        [v81 dedupItems:v39 toItem:v44 withDedupingType:v53];
LABEL_72:

LABEL_73:
        goto LABEL_74;
      }

      if (v45)
      {
        int64_t v44 = v45;
        uint64_t v53 = 4;
        goto LABEL_66;
      }
    }
    if (v81)
    {
      double v54 = [MEMORY[0x1E4F1CAD0] setWithArray:v39];
      [v81 setState:2 ofItems:v54 withReason:@"No best item was found"];
    }
    int64_t v44 = 0;
    goto LABEL_72;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v101 = 316;
    _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
  }
  id v13 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_96:
  _Block_object_dispose(&v94, 8);

  return v13;
}

uint64_t __93__CLSAssetsBeautifier_performWithItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

- (id)performWithItems:(id)a3 maximumNumberOfItemsToChoose:(unint64_t)a4 progressBlock:(id)a5
{
  return [(CLSAssetsBeautifier *)self performWithItems:a3 maximumNumberOfItemsToChoose:a4 debugInfo:0 progressBlock:a5];
}

- (id)sampledItemsInSortedItems:(id)a3 maximumNumberOfItemsToChoose:(unint64_t)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v86 = a3;
  id v90 = a5;
  id v9 = a6;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x2020000000;
  char v124 = 0;
  long long v89 = (void (**)(void, void, double))MEMORY[0x1D2602540]();
  id v79 = v9;
  if (v89)
  {
    char v120 = 0;
    ((void (**)(void, char *, double))v89)[2](v89, &v120, 0.0);
    char v10 = *((unsigned char *)v122 + 24) | v120;
    *((unsigned char *)v122 + 24) = v10;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v129 = 127;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_118;
    }
  }
  char v12 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
  {
    int v51 = [v86 count];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v129 = a4;
    *(_WORD *)&v129[4] = 1024;
    *(_DWORD *)&v129[6] = v51;
    _os_log_debug_impl(&dword_1D2150000, (os_log_t)v12, OS_LOG_TYPE_DEBUG, "Beautifier: Sampling %d items out of %d", buf, 0xEu);
  }

  [v90 setStage:@"Sampling"];
  long long v85 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  context = (void *)MEMORY[0x1D2602300]();
  if (self->_enableStatisticalSampling)
  {
    if (self->_usesKMeans)
    {
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F8A8C8]) initWithNumericValueKeypaths:&unk_1F28F2CF0];
      [v13 setK:a4];
      id v87 = v13;
      if (self->_discardNonEligibleClustersInSampling)
      {
        id v14 = v86;
        id obj = 0;
        uint64_t v78 = MEMORY[0x1E4F143A8];
        double v15 = *MEMORY[0x1E4F8E740];
        while (1)
        {
          v117[0] = v78;
          v117[1] = 3221225472;
          v117[2] = __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke;
          v117[3] = &unk_1E6910648;
          v118 = v89;
          v119 = &v121;
          v80 = v14;
          uint64_t v16 = [v87 performWithDataset:v14 progressBlock:v117];

          if (*((unsigned char *)v122 + 24)) {
            break;
          }
          unint64_t v81 = [v16 count];
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v129 = v81;
            _os_log_debug_impl(&dword_1D2150000, loggingConnection, OS_LOG_TYPE_DEBUG, "Beautifier: got %d clusters", buf, 8u);
          }
          id v92 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          id obj = v16;
          uint64_t v18 = [obj countByEnumeratingWithState:&v113 objects:v127 count:16];
          if (v18)
          {
            unint64_t v97 = 0;
            uint64_t v93 = *(void *)v114;
            do
            {
              uint64_t v95 = v18;
              for (uint64_t i = 0; i != v95; ++i)
              {
                if (*(void *)v114 != v93) {
                  objc_enumerationMutation(obj);
                }
                double v20 = *(void **)(*((void *)&v113 + 1) + 8 * i);
                long long v109 = 0u;
                long long v110 = 0u;
                long long v111 = 0u;
                long long v112 = 0u;
                uint64_t v21 = [v20 objects];
                uint64_t v22 = [v21 countByEnumeratingWithState:&v109 objects:v126 count:16];
                if (v22)
                {
                  uint64_t v23 = *(void *)v110;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v22; ++j)
                    {
                      if (*(void *)v110 != v23) {
                        objc_enumerationMutation(v21);
                      }
                      id v25 = *(void **)(*((void *)&v109 + 1) + 8 * j);
                      identifiersOfEligibleItems = self->_identifiersOfEligibleItems;
                      if (identifiersOfEligibleItems)
                      {
                        double v27 = [*(id *)(*((void *)&v109 + 1) + 8 * j) clsIdentifier];
                        BOOL v28 = [(NSSet *)identifiersOfEligibleItems containsObject:v27];

                        if (!v28) {
                          continue;
                        }
                      }
                      [v25 clsContentScore];
                      if (v29 >= v15)
                      {

                        uint64_t v31 = [v20 objects];
                        [v92 addObjectsFromArray:v31];
                        ++v97;
                        goto LABEL_32;
                      }
                    }
                    uint64_t v22 = [v21 countByEnumeratingWithState:&v109 objects:v126 count:16];
                    if (v22) {
                      continue;
                    }
                    break;
                  }
                }

                id v30 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v31 = [v20 objects];
                double v32 = [v30 setWithArray:v31];
                [v90 setState:2 ofItems:v32 withReason:@"Non-eligible cluster"];

LABEL_32:
              }
              uint64_t v18 = [obj countByEnumeratingWithState:&v113 objects:v127 count:16];
            }
            while (v18);
          }
          else
          {
            unint64_t v97 = 0;
          }

          if (v81 < a4 || (unint64_t v33 = [v92 count], v81 <= v97) || v33 <= v97)
          {

            v98 = @"kMeans";
            id v50 = v80;
            goto LABEL_69;
          }
          unint64_t v34 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEBUG))
          {
            int v35 = [v92 count];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v129 = v81 - v97;
            *(_WORD *)&v129[4] = 1024;
            *(_DWORD *)&v129[6] = v35;
            _os_log_debug_impl(&dword_1D2150000, (os_log_t)v34, OS_LOG_TYPE_DEBUG, "Beautifier: found %d non-eligible clusters, iterating with %d items", buf, 0xEu);
          }

          id v14 = [(CLSAssetsBeautifier *)self sortedItemsWithItems:v92];
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v129 = 156;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }

        double v49 = v14;
        goto LABEL_64;
      }
      v106[0] = MEMORY[0x1E4F143A8];
      v106[1] = 3221225472;
      v106[2] = __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke_41;
      v106[3] = &unk_1E6910648;
      v107 = v89;
      v108 = &v121;
      uint64_t v16 = [v13 performWithDataset:v86 progressBlock:v106];
      if (*((unsigned char *)v122 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v129 = 194;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        double v49 = v107;
LABEL_64:

        int v47 = 0;
        double v48 = @"kMeans";
LABEL_65:
        v98 = v48;
LABEL_71:

        id obj = v16;
        goto LABEL_72;
      }
      double v52 = self->_loggingConnection;
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEBUG))
      {
        int v76 = [v16 count];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v129 = v76;
        _os_log_debug_impl(&dword_1D2150000, (os_log_t)v52, OS_LOG_TYPE_DEBUG, "Beautifier: got %d clusters", buf, 8u);
      }

      v98 = @"kMeans";
      id v50 = v107;
      id obj = v16;
    }
    else
    {
      id v41 = objc_alloc(MEMORY[0x1E4F8A870]);
      id v42 = [(CLSAssetsBeautifier *)self hierarchicalClusteringDistanceBlock];
      id v87 = (id)[v41 initWithDistanceBlock:v42];

      [v87 setUsesSortedDataRelativeDistanceCache:1];
      [v87 setLinkage:0];
      [v87 setK:a4];
      v43 = [v86 lastObject];
      int64_t v44 = objc_msgSend(v43, "cls_universalDate");
      v45 = [v86 firstObject];
      double v46 = objc_msgSend(v45, "cls_universalDate");
      [v44 timeIntervalSinceDate:v46];
      objc_msgSend(v87, "setThreshold:");

      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3221225472;
      v103[2] = __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke_46;
      v103[3] = &unk_1E6910648;
      uint64_t v104 = v89;
      v105 = &v121;
      id obj = [v87 performWithDataset:v86 progressBlock:v103];
      if (*((unsigned char *)v122 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v129 = 212;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }

        int v47 = 0;
        v98 = @"HAC";
        uint64_t v16 = obj;
        goto LABEL_71;
      }
      v98 = @"HAC";
      id v50 = v104;
    }
LABEL_69:

    if ((uint64_t)(a4 - [obj count]) < 1)
    {
      int v47 = 1;
      goto LABEL_72;
    }
    uint64_t v16 = -[CLSAssetsBeautifier _clustersBySplittingZeroDiameterClustersInClusters:targetingNumberOfClusters:](self, "_clustersBySplittingZeroDiameterClustersInClusters:targetingNumberOfClusters:", obj);
    int v47 = 1;
    id v87 = obj;
    goto LABEL_71;
  }
  id v87 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  unint64_t v36 = [v86 count];
  if (a4)
  {
    unint64_t v37 = vcvtad_u64_f64((double)v36 / (double)a4);
    while (1)
    {
      if (v89)
      {
        char v120 = 0;
        ((void (**)(void, char *, double))v89)[2](v89, &v120, 0.5);
        char v38 = *((unsigned char *)v122 + 24) | v120;
        *((unsigned char *)v122 + 24) = v38;
        if (v38) {
          break;
        }
      }
      id v39 = objc_msgSend(v86, "subarrayWithRange:", 0, v37);
      uint64_t v40 = [MEMORY[0x1E4F8A788] clusterWithObjects:v39];
      [v87 addObject:v40];
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v129 = 230;
      _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
    }
    uint64_t v16 = 0;
    int v47 = 0;
    double v48 = @"Bucketing";
    goto LABEL_65;
  }
  int v47 = 1;
  v98 = @"Bucketing";
  id obj = v87;
LABEL_72:
  if (!v47)
  {
LABEL_116:
    id v11 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_117;
  }
  [v90 setClusters:obj withReason:v98];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v88 = obj;
  uint64_t v53 = [v88 countByEnumeratingWithState:&v99 objects:v125 count:16];
  if (!v53) {
    goto LABEL_110;
  }
  uint64_t v94 = *(void *)v100;
  double v54 = *MEMORY[0x1E4F8E730];
  double v55 = *MEMORY[0x1E4F8E738];
  while (2)
  {
    uint64_t v96 = v53;
    for (uint64_t k = 0; k != v96; ++k)
    {
      if (*(void *)v100 != v94) {
        objc_enumerationMutation(v88);
      }
      long long v57 = *(void **)(*((void *)&v99 + 1) + 8 * k);
      if (v89)
      {
        char v120 = 0;
        ((void (**)(void, char *, double))v89)[2](v89, &v120, 0.5);
        char v58 = *((unsigned char *)v122 + 24) | v120;
        *((unsigned char *)v122 + 24) = v58;
        if (v58)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v129 = 244;
            _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
          }

          goto LABEL_116;
        }
      }
      char v59 = [v57 objects];
      v60 = [(CLSAssetsBeautifier *)self requiredItemsInItems:v59];
      if (![v60 count])
      {
        int v61 = [(CLSAssetsBeautifier *)self bestItemInItems:v59];
        char v62 = [v61 isFavorite];
        double v63 = v54;
        if ((v62 & 1) == 0) {
          objc_msgSend(v61, "clsContentScore", v54);
        }
        if (v63 < v55
          && self->_enableIntermediateNaturalClustering
          && (unint64_t)[v59 count] >= 2)
        {
          [v90 beginTentativeSection];
          long long v84 = [(CLSAssetsBeautifier *)self _naturalClusteringWithItems:v59 withSimilarity:0 timestampSupport:1 debugInfo:v90];
          uint64_t v64 = [v84 count];
          BOOL v65 = v64 != 0;
          [v90 endTentativeSectionWithSuccess:v65];
          if (v64)
          {
            uint64_t v82 = [(CLSAssetsBeautifier *)self bestItemInItems:v84];

            if (v90)
            {
              int v66 = [NSString stringWithFormat:@"Intermediate Natural Clustering, chose %lu items out of %lu", objc_msgSend(v84, "count"), objc_msgSend(v59, "count")];

              v67 = self->_loggingConnection;
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v129 = v66;
                _os_log_debug_impl(&dword_1D2150000, v67, OS_LOG_TYPE_DEBUG, "Beautifier: %@", buf, 0xCu);
              }
              id v68 = [MEMORY[0x1E4F1CAD0] setWithArray:v84];
              [v90 chooseItems:v68 inCluster:v57 withReason:v66];

              [NSString stringWithFormat:@"Best Item, chose %d item out of %lu", v82 != 0, objc_msgSend(v84, "count")];
              v69 = (__CFString *)objc_claimAutoreleasedReturnValue();

              id v70 = self->_loggingConnection;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v129 = v69;
                _os_log_debug_impl(&dword_1D2150000, v70, OS_LOG_TYPE_DEBUG, "Beautifier: %@", buf, 0xCu);
              }
              [v90 chooseItem:v82 inItems:v84 withReason:v69];
            }
            else
            {
              v69 = v98;
            }
          }
          else
          {
            v69 = v98;
            uint64_t v82 = (uint64_t)v61;
          }

          int v61 = (void *)v82;
          if (!v82) {
            goto LABEL_97;
          }
        }
        else
        {
          LOBYTE(v65) = 0;
          v69 = v98;
          if (!v61) {
            goto LABEL_97;
          }
        }
        [v85 addObject:v61];
LABEL_97:
        if (v65)
        {
          v98 = v69;
        }
        else
        {
          [NSString stringWithFormat:@"Best Item, chose %d items out of %lu", v61 != 0, objc_msgSend(v59, "count")];
          v98 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v71 = self->_loggingConnection;
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v129 = v98;
            _os_log_debug_impl(&dword_1D2150000, v71, OS_LOG_TYPE_DEBUG, "Beautifier: %@", buf, 0xCu);
          }
          [v90 chooseItem:v61 inCluster:v57 withReason:v98];
        }
        goto LABEL_102;
      }
      [v85 addObjectsFromArray:v60];
      if (!v90) {
        goto LABEL_103;
      }
      int v61 = [MEMORY[0x1E4F1CAD0] setWithArray:v60];
      [v90 requireItems:v61 inCluster:v57];
LABEL_102:

LABEL_103:
    }
    uint64_t v53 = [v88 countByEnumeratingWithState:&v99 objects:v125 count:16];
    if (v53) {
      continue;
    }
    break;
  }
LABEL_110:

  id v72 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_DEBUG))
  {
    int v74 = [v85 count];
    int v75 = [v86 count];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v129 = v74;
    *(_WORD *)&v129[4] = 1024;
    *(_DWORD *)&v129[6] = v75;
    _os_log_debug_impl(&dword_1D2150000, (os_log_t)v72, OS_LOG_TYPE_DEBUG, "Beautifier: Sampled %d items out of %d", buf, 0xEu);
  }

  id v11 = v85;
LABEL_117:

LABEL_118:
  _Block_object_dispose(&v121, 8);

  return v11;
}

uint64_t __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke_41(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __102__CLSAssetsBeautifier_sampledItemsInSortedItems_maximumNumberOfItemsToChoose_debugInfo_progressBlock___block_invoke_46(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.0 + 0.5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

- (CLSAssetsBeautifier)initWithSimilarityModelClass:(Class)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSAssetsBeautifier;
  id v4 = [(CLSAssetsBeautifier *)&v9 init];
  id v5 = (CLSAssetsBeautifier *)v4;
  if (v4)
  {
    v4[8] = 1;
    *(_DWORD *)(v4 + 9) = 0;
    v4[24] = 1;
    char v6 = [[CLSSimilarStacker alloc] initWithSimilarityModelClass:a3];
    similarStacker = v5->_similarStacker;
    v5->_similarStacker = v6;

    objc_storeStrong((id *)&v5->_loggingConnection, MEMORY[0x1E4F14500]);
  }
  return v5;
}

+ (id)beautifier
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

@end