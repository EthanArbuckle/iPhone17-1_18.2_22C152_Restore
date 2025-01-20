@interface ATXInformationRanker
- (id)sortFeaturizedSuggestions:(id)a3 withFeatureWeights:(id)a4;
@end

@implementation ATXInformationRanker

- (id)sortFeaturizedSuggestions:(id)a3 withFeatureWeights:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "scoreWithFeatureWeights:", v6, (void)v22);
        double v15 = v14;
        v16 = [ATXScoredInfoSuggestion alloc];
        v17 = [v13 suggestion];
        v18 = [v13 featureSet];
        v19 = [(ATXScoredInfoSuggestion *)v16 initWithSuggestion:v17 featureSet:v18 score:v15];
        [v7 addObject:v19];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  v20 = [v7 sortedArrayUsingComparator:&__block_literal_global_72];

  return v20;
}

uint64_t __69__ATXInformationRanker_sortFeaturizedSuggestions_withFeatureWeights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 score];
  double v7 = v6;
  [v5 score];
  if (v7 <= v8)
  {
    [v4 score];
    double v11 = v10;
    [v5 score];
    uint64_t v9 = v11 < v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

@end