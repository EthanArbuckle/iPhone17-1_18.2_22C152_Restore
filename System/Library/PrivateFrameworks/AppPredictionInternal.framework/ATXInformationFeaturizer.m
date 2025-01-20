@interface ATXInformationFeaturizer
- (double)_fetchAppLaunchCountForBundleIdentifier:(id)a3;
- (double)_fetchAppLaunchPopularityForBundleIdentifier:(id)a3;
- (double)_fetchFeedbackForWidgetBundleId:(id)a3 type:(unint64_t)a4;
- (id)_featureSetForSuggestion:(id)a3;
- (id)featurizeInfoSuggestions:(id)a3;
- (id)featurizeTimelineWithWidgetBundleId:(id)a3 widgetKind:(id)a4 appBundleIdentifier:(id)a5;
- (id)populateFeatureSetForWidgetBundleId:(id)a3 widgetKind:(id)a4 appBundleIdentifier:(id)a5;
- (void)_lazyLoadAppLaunchHistogram;
- (void)_lazyLoadWidgetFeedbackHistogram;
@end

@implementation ATXInformationFeaturizer

- (id)featurizeInfoSuggestions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = -[ATXInformationFeaturizer _featureSetForSuggestion:](self, "_featureSetForSuggestion:", v11, (void)v15);
        v13 = [[ATXFeaturizedInfoSuggestion alloc] initWithSuggestion:v11 featureSet:v12];
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_featureSetForSuggestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 widgetBundleIdentifier];
  id v6 = [v4 widgetKind];
  uint64_t v7 = [v4 appBundleIdentifier];
  uint64_t v8 = [(ATXInformationFeaturizer *)self populateFeatureSetForWidgetBundleId:v5 widgetKind:v6 appBundleIdentifier:v7];

  uint64_t v9 = [v4 confidenceLevel];
  [v8 appendFeature:4 value:(double)v9];
  v10 = [v8 build];

  return v10;
}

- (id)populateFeatureSetForWidgetBundleId:(id)a3 widgetKind:(id)a4 appBundleIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = objc_opt_new();
  [(ATXInformationFeaturizer *)self _fetchAppLaunchPopularityForBundleIdentifier:v7];
  double v11 = v10;
  [(ATXInformationFeaturizer *)self _fetchAppLaunchCountForBundleIdentifier:v7];
  double v13 = v12;

  [v9 appendFeature:2 value:v11];
  [v9 appendFeature:3 value:v13];
  [(ATXInformationFeaturizer *)self _fetchFeedbackForWidgetBundleId:v8 type:2];
  objc_msgSend(v9, "appendFeature:value:", 1);
  [(ATXInformationFeaturizer *)self _fetchFeedbackForWidgetBundleId:v8 type:0];
  objc_msgSend(v9, "appendFeature:value:", 5);
  [(ATXInformationFeaturizer *)self _fetchFeedbackForWidgetBundleId:v8 type:3];
  objc_msgSend(v9, "appendFeature:value:", 6);
  [(ATXInformationFeaturizer *)self _fetchFeedbackForWidgetBundleId:v8 type:4];
  objc_msgSend(v9, "appendFeature:value:", 7);
  [(ATXInformationFeaturizer *)self _fetchFeedbackForWidgetBundleId:v8 type:7];
  objc_msgSend(v9, "appendFeature:value:", 9);
  [(ATXInformationFeaturizer *)self _fetchFeedbackForWidgetBundleId:v8 type:1];
  double v15 = v14;

  [v9 appendFeature:8 value:v15];
  return v9;
}

- (id)featurizeTimelineWithWidgetBundleId:(id)a3 widgetKind:(id)a4 appBundleIdentifier:(id)a5
{
  v5 = [(ATXInformationFeaturizer *)self populateFeatureSetForWidgetBundleId:a3 widgetKind:a4 appBundleIdentifier:a5];
  id v6 = [v5 build];

  return v6;
}

- (void)_lazyLoadAppLaunchHistogram
{
  if (!self->_appLaunchHistory)
  {
    id v5 = +[_ATXAppLaunchHistogramManager sharedInstance];
    v3 = [v5 histogramForLaunchType:0];
    appLaunchHistory = self->_appLaunchHistory;
    self->_appLaunchHistory = v3;
  }
}

- (void)_lazyLoadWidgetFeedbackHistogram
{
  if (!self->_widgetFeedback)
  {
    v3 = (ATXHomeScreenWidgetFeedback *)objc_opt_new();
    widgetFeedback = self->_widgetFeedback;
    self->_widgetFeedback = v3;
    MEMORY[0x1F41817F8](v3, widgetFeedback);
  }
}

- (double)_fetchAppLaunchPopularityForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(ATXInformationFeaturizer *)self _lazyLoadAppLaunchHistogram];
    [(_ATXAppLaunchHistogram *)self->_appLaunchHistory overallLaunchPopularityForBundleId:v4];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)_fetchAppLaunchCountForBundleIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    [(ATXInformationFeaturizer *)self _lazyLoadAppLaunchHistogram];
    appLaunchHistory = self->_appLaunchHistory;
    v10[0] = v4;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(_ATXAppLaunchHistogram *)appLaunchHistory totalLaunchesForBundleIds:v6];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)_fetchFeedbackForWidgetBundleId:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    [(ATXInformationFeaturizer *)self _lazyLoadWidgetFeedbackHistogram];
    [(ATXHomeScreenWidgetFeedback *)self->_widgetFeedback eventCountForWidgetBundleId:v6 type:a4];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetFeedback, 0);
  objc_storeStrong((id *)&self->_appLaunchHistory, 0);
}

@end