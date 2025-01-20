@interface ATXWidgetPredictionTrainingDatasetBuilder
- (ATXWidgetPredictionTrainingDatasetBuilder)initWithDistinctScoreCounts:(id)a3;
- (id)createMLArrayBatchProviderFromTrainingArray:(id)a3;
- (id)featureDictionaryWithWidgetEngagementRecord:(id)a3;
- (id)mlFeatureKeyMapping;
- (id)mlFeatureValueForFeatureName:(id)a3 withWidgetEngagementRecord:(id)a4 withFeatureMapping:(id)a5;
- (id)propertyNameForInputFeatureName:(id)a3;
- (void)populateAdditionalFeaturesWithMultiArray:(id)a3 forWidgetEngagementRecord:(id)a4;
@end

@implementation ATXWidgetPredictionTrainingDatasetBuilder

- (ATXWidgetPredictionTrainingDatasetBuilder)initWithDistinctScoreCounts:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWidgetPredictionTrainingDatasetBuilder;
  v6 = [(ATXWidgetPredictionTrainingDatasetBuilder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_distinctScoreCounts, a3);
  }

  return v7;
}

- (void)populateAdditionalFeaturesWithMultiArray:(id)a3 forWidgetEngagementRecord:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F93BB8];
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [v7 widgetBundleId];
  v10 = [v7 widgetKind];

  id v12 = [v6 tupleWithFirst:v9 second:v10];

  v11 = [(NSDictionary *)self->_distinctScoreCounts objectForKeyedSubscript:v12];
  [v8 setObject:v11 atIndexedSubscript:0];
}

- (id)createMLArrayBatchProviderFromTrainingArray:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v30 = v33;
    uint64_t v9 = *(void *)v36;
    unint64_t v10 = 0x1E4F1E000uLL;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        context = (void *)MEMORY[0x1D25F6CC0]();
        v13 = [(ATXWidgetPredictionTrainingDatasetBuilder *)self featureDictionaryWithWidgetEngagementRecord:v12];
        if ([v12 type] == 1 || (uint64_t v14 = objc_msgSend(v12, "type"), v15 = @"Not Engaged", v14 == 2)) {
          v15 = @"Engaged";
        }
        v16 = objc_msgSend(*(id *)(v10 + 2384), "featureValueWithString:", v15, v30);
        [v13 setObject:v16 forKeyedSubscript:@"classLabel"];

        id v17 = objc_alloc(MEMORY[0x1E4F1E930]);
        uint64_t v34 = 0;
        uint64_t v18 = [v17 initWithDictionary:v13 error:&v34];
        v19 = (void *)v18;
        if (v34) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = v18 == 0;
        }
        int v21 = !v20;
        if (v20)
        {
          uint64_t v22 = v8;
          uint64_t v23 = v9;
          v24 = self;
          id v25 = v6;
          v26 = v5;
          v27 = __atxlog_handle_timeline();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            [(ATXWidgetPredictionTrainingDatasetBuilder *)&buf createMLArrayBatchProviderFromTrainingArray:v27];
          }

          id v5 = v26;
          id v6 = v25;
          self = v24;
          uint64_t v9 = v23;
          uint64_t v8 = v22;
          unint64_t v10 = 0x1E4F1E000;
        }
        else
        {
          [v5 addObject:v18];
        }

        if (!v21)
        {

          v28 = 0;
          goto LABEL_25;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1E910]) initWithFeatureProviderArray:v5];
LABEL_25:

  return v28;
}

- (id)featureDictionaryWithWidgetEngagementRecord:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(ATXWidgetPredictionTrainingDatasetBuilder *)self mlFeatureKeyMapping];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = objc_msgSend(v6, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v13 = [(ATXWidgetPredictionTrainingDatasetBuilder *)self mlFeatureValueForFeatureName:v12 withWidgetEngagementRecord:v4 withFeatureMapping:v6];
        [v5 setObject:v13 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)mlFeatureValueForFeatureName:(id)a3 withWidgetEngagementRecord:(id)a4 withFeatureMapping:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v20 = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:&unk_1F27F2AD8 dataType:65568 error:&v20];
  id v12 = v20;
  if (v12)
  {
    v13 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXWidgetPredictionTrainingDatasetBuilder mlFeatureValueForFeatureName:withWidgetEngagementRecord:withFeatureMapping:]((uint64_t)v8, v13);
    }

    uint64_t v14 = 0;
  }
  else
  {
    long long v15 = [v10 objectForKeyedSubscript:v8];
    int v16 = [v15 BOOLValue];

    if (v16)
    {
      long long v17 = [(ATXWidgetPredictionTrainingDatasetBuilder *)self propertyNameForInputFeatureName:v8];
      long long v18 = [v9 valueForKey:v17];
      [v11 setObject:v18 atIndexedSubscript:0];
    }
    else
    {
      [(ATXWidgetPredictionTrainingDatasetBuilder *)self populateAdditionalFeaturesWithMultiArray:v11 forWidgetEngagementRecord:v9];
    }
    uint64_t v14 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v11];
  }

  return v14;
}

- (id)mlFeatureKeyMapping
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"input_widget_family";
  v2 = [NSNumber numberWithBool:1];
  v6[1] = @"input_unique_score_count";
  v7[0] = v2;
  v3 = [NSNumber numberWithBool:0];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)propertyNameForInputFeatureName:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v9 = @"input_widget_family";
  v10[0] = @"widgetFamily";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v5 = [v4 objectForKeyedSubscript:v3];

  if (!v5)
  {
    id v6 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXWidgetPredictionTrainingDatasetBuilder propertyNameForInputFeatureName:]((uint64_t)v3, v6);
    }
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:v3];

  return v7;
}

- (void).cxx_destruct
{
}

- (void)createMLArrayBatchProviderFromTrainingArray:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXWidgetPredictionTrainingDatasetBuilder: Error initializing MLDictionaryFeatureProvider", buf, 2u);
}

- (void)mlFeatureValueForFeatureName:(uint64_t)a1 withWidgetEngagementRecord:(NSObject *)a2 withFeatureMapping:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXWidgetPredictionTrainingDatasetBuilder: Error initializing MLMultiArray for input feature: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)propertyNameForInputFeatureName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "ATXWidgetPredictionTrainingDatasetBuilder: unexpected input feature: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end