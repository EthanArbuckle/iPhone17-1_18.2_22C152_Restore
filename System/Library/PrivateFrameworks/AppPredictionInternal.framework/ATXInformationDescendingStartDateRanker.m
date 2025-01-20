@interface ATXInformationDescendingStartDateRanker
- (id)sortFeaturizedSuggestions:(id)a3 withFeatureWeights:(id)a4;
@end

@implementation ATXInformationDescendingStartDateRanker

- (id)sortFeaturizedSuggestions:(id)a3 withFeatureWeights:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "scoreWithFeatureWeights:", v6, (void)v21);
        double v15 = v14;
        v16 = [ATXScoredInfoSuggestion alloc];
        v17 = [v13 suggestion];
        v18 = [v13 featureSet];
        v19 = [(ATXScoredInfoSuggestion *)v16 initWithSuggestion:v17 featureSet:v18 score:v15];

        [v7 addObject:v19];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  [v7 sortWithOptions:16 usingComparator:&__block_literal_global_19];
  return v7;
}

uint64_t __88__ATXInformationDescendingStartDateRanker_sortFeaturizedSuggestions_withFeatureWeights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 suggestion];
  uint64_t v7 = [v6 confidenceLevel];
  id v8 = [v5 suggestion];
  uint64_t v9 = [v8 confidenceLevel];

  if (v7 > v9) {
    goto LABEL_8;
  }
  uint64_t v10 = [v4 suggestion];
  uint64_t v11 = [v10 confidenceLevel];
  v12 = [v5 suggestion];
  uint64_t v13 = [v12 confidenceLevel];

  if (v11 < v13) {
    goto LABEL_6;
  }
  double v14 = [v4 suggestion];
  double v15 = [v14 startDate];
  [v15 timeIntervalSinceReferenceDate];
  double v17 = v16;

  v18 = [v5 suggestion];
  v19 = [v18 startDate];
  [v19 timeIntervalSinceReferenceDate];
  double v21 = v20;

  if (v17 > v21)
  {
LABEL_8:
    uint64_t v22 = -1;
    goto LABEL_9;
  }
  if (v17 >= v21)
  {
    [v4 score];
    double v24 = v23;
    [v5 score];
    if (v24 <= v25)
    {
      [v4 score];
      double v28 = v27;
      [v5 score];
      uint64_t v22 = v28 < v29;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v22 = 1;
LABEL_9:

  return v22;
}

@end