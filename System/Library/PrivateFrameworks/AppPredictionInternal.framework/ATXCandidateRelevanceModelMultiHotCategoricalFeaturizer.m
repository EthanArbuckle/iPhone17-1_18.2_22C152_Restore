@interface ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer
- (ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer)init;
- (ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer)initWithObservedFeatureValueCounts:(id)a3;
- (ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer)initWithObservedFeatureValueCounts:(id)a3 maxCategoricalFeaturesCount:(unint64_t)a4;
- (id)categoricalFeatureValuesForContext:(id)a3 candidate:(id)a4;
- (id)computeFeatureValueNames;
- (id)featureVectorForContext:(id)a3 candidate:(id)a4;
- (id)immutableCopy;
- (void)observeContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer

- (ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer)init
{
  v3 = objc_opt_new();
  v4 = [(ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *)self initWithObservedFeatureValueCounts:v3];

  return v4;
}

- (ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer)initWithObservedFeatureValueCounts:(id)a3
{
  id v4 = a3;
  v5 = +[ATXCandidateRelevanceModelGlobals sharedInstance];
  v6 = -[ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer initWithObservedFeatureValueCounts:maxCategoricalFeaturesCount:](self, "initWithObservedFeatureValueCounts:maxCategoricalFeaturesCount:", v4, (int)[v5 maxCategoricalFeaturesCount]);

  return v6;
}

- (ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer)initWithObservedFeatureValueCounts:(id)a3 maxCategoricalFeaturesCount:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer;
  v8 = [(ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_observedFeatureValueCounts, a3);
    v9->_maxCategoricalFeaturesCount = a4;
  }

  return v9;
}

- (id)featureVectorForContext:(id)a3 candidate:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  v9 = [(ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *)self categoricalFeatureValuesForContext:v6 candidate:v7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v10 = [(ATXImmutableCandidateRelevanceModelFeaturizer *)self featureValueNames];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "containsObject:", *(void *)(*((void *)&v17 + 1) + 8 * i)));
        [v8 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v8;
}

- (void)observeContext:(id)a3 candidate:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *)self categoricalFeatureValuesForContext:a3 candidate:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_observedFeatureValueCounts objectForKey:v9];
        int v11 = [v10 intValue];

        observedFeatureValueCounts = self->_observedFeatureValueCounts;
        uint64_t v13 = [NSNumber numberWithInt:(v11 + 1)];
        [(NSMutableDictionary *)observedFeatureValueCounts setObject:v13 forKey:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (id)categoricalFeatureValuesForContext:(id)a3 candidate:(id)a4
{
  id v5 = a3;
  id result = a4;
  __break(1u);
  return result;
}

- (id)immutableCopy
{
  v2 = self;
  v3 = [(ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *)v2 computeFeatureValueNames];
  id v4 = [(ATXImmutableCandidateRelevanceModelFeaturizer *)v2 initWithFeatureValueNames:v3];

  return v4;
}

- (id)computeFeatureValueNames
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableDictionary *)self->_observedFeatureValueCounts allKeys];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer_computeFeatureValueNames__block_invoke;
  v12[3] = &unk_1E68ACBF8;
  v12[4] = self;
  id v4 = [v3 sortedArrayUsingComparator:v12];

  if ([v4 count] > self->_maxCategoricalFeaturesCount)
  {
    id v5 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      uint64_t v8 = [v4 count];
      unint64_t maxCategoricalFeaturesCount = self->_maxCategoricalFeaturesCount;
      *(_DWORD *)buf = 138412802;
      v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 2048;
      unint64_t v18 = maxCategoricalFeaturesCount;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - Pruning feature value names because there were %lu values observed which is more than the max of %lu values.", buf, 0x20u);
    }
    uint64_t v10 = objc_msgSend(v4, "subarrayWithRange:", 0, self->_maxCategoricalFeaturesCount);

    id v4 = (void *)v10;
  }
  return v4;
}

uint64_t __83__ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer_computeFeatureValueNames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v6];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  uint64_t v9 = [v7 compare:v8];

  if (!v9) {
    uint64_t v9 = [v5 compare:v6];
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end