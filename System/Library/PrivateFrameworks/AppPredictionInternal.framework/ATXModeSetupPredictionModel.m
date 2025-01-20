@interface ATXModeSetupPredictionModel
- (ATXModeSetupPredictionModel)initWithMode:(unint64_t)a3;
- (double)probabilityScore;
- (id)featuresToModel;
- (id)modeSetupPredictionModel;
- (id)modelName;
- (void)modelName;
- (void)probabilityScore;
@end

@implementation ATXModeSetupPredictionModel

- (ATXModeSetupPredictionModel)initWithMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXModeSetupPredictionModel;
  result = [(ATXModeSetupPredictionModel *)&v5 init];
  if (result) {
    result->_mode = a3;
  }
  return result;
}

- (id)featuresToModel
{
  v3 = objc_opt_new();
  v4 = [[ATXModeSetupPredictionFeaturesCorrelator alloc] initWithMode:self->_mode features:v3];
  objc_super v5 = [(ATXModeSetupPredictionFeaturesCorrelator *)v4 featureVector];

  return v5;
}

- (id)modelName
{
  p_mode = &self->_mode;
  v3 = +[ATXFocusModeModelsUtil setupPredictionModelNameForMode:self->_mode];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = __atxlog_handle_modes();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(ATXModeSetupPredictionModel *)(uint64_t)p_mode modelName];
    }
  }
  return v4;
}

- (id)modeSetupPredictionModel
{
  v2 = [(ATXModeSetupPredictionModel *)self modelName];
  v3 = +[ATXCoreMLUtilities loadCoreMLModelWithName:v2];

  return v3;
}

- (double)probabilityScore
{
  v3 = [(ATXModeSetupPredictionModel *)self modeSetupPredictionModel];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1E930]);
    id v5 = [(ATXModeSetupPredictionModel *)self featuresToModel];
    id v17 = 0;
    v6 = (void *)[v4 initWithDictionary:v5 error:&v17];
    id v7 = v17;

    if (v7)
    {
      v8 = __atxlog_handle_modes();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(ATXModeSetupPredictionModel *)(uint64_t)v7 probabilityScore];
      }
    }
    id v16 = v7;
    v9 = [v3 predictionFromFeatures:v6 error:&v16];
    id v10 = v16;

    if (v10)
    {
      v11 = __atxlog_handle_modes();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(ATXModeSetupPredictionModel *)(uint64_t)v10 probabilityScore];
      }
    }
    v12 = [v9 featureValueForName:@"classProbability"];
    +[ATXCoreMLUtilities scoreForModelOutputValue:v12 outputIndexedSubscript:1];
    double v14 = v13;
  }
  else
  {
    double v14 = 0.0;
  }

  return v14;
}

- (void)modelName
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = ATXModeToString();
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeSetupPredictionModel: nil returned for CoreML model file name for this mode: %@", (uint8_t *)&v4, 0xCu);
}

- (void)probabilityScore
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeSetupPredictionModel - Error initializing MLDictionaryFeatureProvider for inference on the CoreMLModel: %@", (uint8_t *)&v2, 0xCu);
}

@end