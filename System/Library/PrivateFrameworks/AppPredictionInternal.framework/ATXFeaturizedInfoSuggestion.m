@interface ATXFeaturizedInfoSuggestion
- (ATXFeaturizedInfoSuggestion)initWithSuggestion:(id)a3 featureSet:(id)a4;
- (ATXInfoSuggestion)suggestion;
- (ATXInformationFeatureSet)featureSet;
- (double)scoreWithFeatureWeights:(id)a3;
@end

@implementation ATXFeaturizedInfoSuggestion

- (ATXFeaturizedInfoSuggestion)initWithSuggestion:(id)a3 featureSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXFeaturizedInfoSuggestion;
  v9 = [(ATXFeaturizedInfoSuggestion *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestion, a3);
    objc_storeStrong((id *)&v10->_featureSet, a4);
  }

  return v10;
}

- (double)scoreWithFeatureWeights:(id)a3
{
  suggestion = self->_suggestion;
  id v5 = a3;
  v6 = [(ATXInfoSuggestion *)suggestion widgetBundleIdentifier];
  id v7 = [(ATXInfoSuggestion *)self->_suggestion widgetKind];
  [(ATXInformationFeatureSet *)self->_featureSet valueForFeature:1];
  double v44 = v8;
  [(ATXInformationFeatureSet *)self->_featureSet valueForFeature:2];
  double v43 = v9;
  [(ATXInformationFeatureSet *)self->_featureSet valueForFeature:3];
  double v42 = v10;
  [(ATXInformationFeatureSet *)self->_featureSet valueForFeature:4];
  double v41 = v11;
  [(ATXInformationFeatureSet *)self->_featureSet valueForFeature:5];
  double v40 = v12;
  [(ATXInformationFeatureSet *)self->_featureSet valueForFeature:6];
  double v39 = v13;
  [(ATXInformationFeatureSet *)self->_featureSet valueForFeature:7];
  double v38 = v14;
  [(ATXInformationFeatureSet *)self->_featureSet valueForFeature:9];
  double v37 = v15;
  [(ATXInformationFeatureSet *)self->_featureSet valueForFeature:8];
  double v36 = v16;
  [v5 weightForFeatureName:1 widgetExtensionBundleId:v6 widgetKind:v7];
  double v35 = v17;
  [v5 weightForFeatureName:2 widgetExtensionBundleId:v6 widgetKind:v7];
  double v19 = v18;
  [v5 weightForFeatureName:3 widgetExtensionBundleId:v6 widgetKind:v7];
  double v21 = v20;
  [v5 weightForFeatureName:4 widgetExtensionBundleId:v6 widgetKind:v7];
  double v23 = v22;
  [v5 weightForFeatureName:5 widgetExtensionBundleId:v6 widgetKind:v7];
  double v25 = v24;
  [v5 weightForFeatureName:6 widgetExtensionBundleId:v6 widgetKind:v7];
  double v27 = v26;
  [v5 weightForFeatureName:7 widgetExtensionBundleId:v6 widgetKind:v7];
  double v29 = v28;
  [v5 weightForFeatureName:9 widgetExtensionBundleId:v6 widgetKind:v7];
  double v31 = v30;
  [v5 weightForFeatureName:8 widgetExtensionBundleId:v6 widgetKind:v7];
  double v33 = v32;

  return v43 * v19 + v35 * v44 + v21 * v42 + v23 * v41 + v25 * v40 + v27 * v39 + v29 * v38 + v31 * v37 + v33 * v36;
}

- (ATXInfoSuggestion)suggestion
{
  return self->_suggestion;
}

- (ATXInformationFeatureSet)featureSet
{
  return self->_featureSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSet, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end