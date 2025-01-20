@interface ATXAnchorModelAppPredictionPostProcessor
- (ATXAnchorModelAppPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3;
- (ATXAnchorModelAppPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3 blacklist:(id)a4;
- (BOOL)shouldPredictAnchorModelAppPrediction;
@end

@implementation ATXAnchorModelAppPredictionPostProcessor

- (ATXAnchorModelAppPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3
{
  id v4 = a3;
  v5 = +[ATXAppPredictionBlacklist sharedInstance];
  v6 = [(ATXAnchorModelAppPredictionPostProcessor *)self initWithAnchorModelPrediction:v4 blacklist:v5];

  return v6;
}

- (ATXAnchorModelAppPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3 blacklist:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAnchorModelAppPredictionPostProcessor;
  v9 = [(ATXAnchorModelAppPredictionPostProcessor *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_anchorModelPrediction, a3);
    uint64_t v11 = objc_opt_new();
    storeWrapper = v10->_storeWrapper;
    v10->_storeWrapper = (ATXAnchorModelDataStoreWrapper *)v11;

    objc_storeStrong((id *)&v10->_blacklist, a4);
  }

  return v10;
}

- (BOOL)shouldPredictAnchorModelAppPrediction
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateType];
  int v4 = [v3 isEqualToString:@"app"];

  if (!v4) {
    return 0;
  }
  v5 = (void *)MEMORY[0x1E4F4AF00];
  v6 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateId];
  LOBYTE(v5) = [v5 isInstalledForBundle:v6];

  if (v5)
  {
    id v7 = (void *)MEMORY[0x1E4F4AF00];
    id v8 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateId];
    LOBYTE(v7) = [v7 isDeviceManagementPolicyOkForBundleId:v8];

    if (v7)
    {
      v9 = [(ATXAppPredictionBlacklist *)self->_blacklist disabledBundleIds];
      v10 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateId];
      int v11 = [v9 containsObject:v10];

      if (!v11) {
        return 1;
      }
      v12 = __atxlog_handle_anchor();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      v13 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateId];
      int v16 = 138412290;
      v17 = v13;
      objc_super v14 = "Skipping prediction for %@ because app is blacklisted.";
      goto LABEL_11;
    }
    v12 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateId];
      int v16 = 138412290;
      v17 = v13;
      objc_super v14 = "Skipping prediction for %@ because app is disabled from Screen Time.";
      goto LABEL_11;
    }
  }
  else
  {
    v12 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(ATXAnchorModelPrediction *)self->_anchorModelPrediction candidateId];
      int v16 = 138412290;
      v17 = v13;
      objc_super v14 = "Skipping prediction for %@ because app is not installed.";
LABEL_11:
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);
    }
  }
LABEL_12:

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklist, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
  objc_storeStrong((id *)&self->_anchorModelPrediction, 0);
}

@end