@interface ATXOneHotCategoricalFeatureCross
- (ATXOneHotCategoricalFeatureCross)initWithFeatures:(id)a3;
- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXOneHotCategoricalFeatureCross

- (ATXOneHotCategoricalFeatureCross)initWithFeatures:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXOneHotCategoricalFeatureCross;
  v6 = [(ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_features, a3);
  }

  return v7;
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v9 = self->_features;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "categoricalFeatureValueForContext:candidate:", v6, v7, (void)v17);
        [v8 addObject:v14];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v15 = [v8 componentsJoinedByString:@"_"];

  return v15;
}

- (void).cxx_destruct
{
}

@end