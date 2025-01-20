@interface BMMiningTaskConfig
- (BMMiningTaskConfig)init;
- (BOOL)interactionExtractedTopicFromAttachmentFactorInUse;
- (BOOL)loadBMMiningTaskConfig:(id)a3;
- (NSDictionary)bmMiningTaskConfig;
- (NSString)experimentID;
- (NSString)treatmentID;
- (NSString)trialID;
- (TRIClient)trialClient;
- (TRITrackingId)trialTrackingID;
- (int)deploymentID;
- (void)loadDefaultConfig;
- (void)registerWithTrial;
- (void)setBmMiningTaskConfig:(id)a3;
- (void)setDeploymentID:(int)a3;
- (void)setExperimentID:(id)a3;
- (void)setInteractionExtractedTopicFromAttachmentFactorInUse:(BOOL)a3;
- (void)setTreatmentID:(id)a3;
- (void)setTrialClient:(id)a3;
- (void)setTrialID:(id)a3;
- (void)setTrialTrackingID:(id)a3;
- (void)updateFactorLevels;
- (void)updateFactorLevelsFromFilePath:(id)a3;
@end

@implementation BMMiningTaskConfig

- (BMMiningTaskConfig)init
{
  v5.receiver = self;
  v5.super_class = (Class)BMMiningTaskConfig;
  v2 = [(BMMiningTaskConfig *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(BMMiningTaskConfig *)v2 loadDefaultConfig];
    [(BMMiningTaskConfig *)v3 registerWithTrial];
  }
  return v3;
}

- (void)registerWithTrial
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v3 = (void *)getTRIClientClass_softClass;
  uint64_t v20 = getTRIClientClass_softClass;
  if (!getTRIClientClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __getTRIClientClass_block_invoke;
    v15 = &unk_264546958;
    v16 = &v17;
    __getTRIClientClass_block_invoke((uint64_t)buf);
    v3 = (void *)v18[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v17, 8);
  objc_super v5 = [v4 clientWithIdentifier:210];
  trialClient = self->_trialClient;
  self->_trialClient = v5;

  if (self->_trialClient)
  {
    v7 = BMLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FF33000, v7, OS_LOG_TYPE_INFO, "Trial: get trial client", buf, 2u);
    }

    [(BMMiningTaskConfig *)self updateFactorLevels];
    objc_initWeak((id *)buf, self);
    v8 = self->_trialClient;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__BMMiningTaskConfig_registerWithTrial__block_invoke;
    v10[3] = &unk_264546988;
    objc_copyWeak(&v11, (id *)buf);
    id v9 = (id)[(TRIClient *)v8 addUpdateHandlerForNamespaceName:@"COREML_SYSTEMS_PEOPLE_SUGGESTER" usingBlock:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __39__BMMiningTaskConfig_registerWithTrial__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateFactorLevels];
    id WeakRetained = v2;
  }
}

- (void)updateFactorLevels
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FF33000, log, OS_LOG_TYPE_ERROR, "Failed to load trial config, fallback to default config", v1, 2u);
}

- (void)updateFactorLevelsFromFilePath:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = BMLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_21FF33000, v5, OS_LOG_TYPE_INFO, "Updating from override config path:%@", (uint8_t *)&v8, 0xCu);
  }

  if ([(BMMiningTaskConfig *)self loadBMMiningTaskConfig:v4])
  {
    trialID = self->_trialID;
    self->_trialID = (NSString *)@"Override";
  }
  else
  {
    v7 = BMLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BMMiningTaskConfig updateFactorLevelsFromFilePath:](v7);
    }

    [(BMMiningTaskConfig *)self loadDefaultConfig];
  }
}

- (void)loadDefaultConfig
{
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v5 pathForResource:@"com.apple.BehaviorMiner.Config.Default" ofType:@"plist"];
  [(BMMiningTaskConfig *)self loadBMMiningTaskConfig:v3];
  trialID = self->_trialID;
  self->_trialID = (NSString *)@"Default";
}

- (BOOL)loadBMMiningTaskConfig:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NSURL fileURLWithPath:v4];
  id v14 = 0;
  v6 = [NSDictionary dictionaryWithContentsOfURL:v5 error:&v14];
  id v7 = v14;
  [(BMMiningTaskConfig *)self setBmMiningTaskConfig:v6];

  int v8 = [(BMMiningTaskConfig *)self bmMiningTaskConfig];

  if (v8)
  {
    id v9 = [(BMMiningTaskConfig *)self bmMiningTaskConfig];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"interactionExtractedTopicFromAttachmentFactorInUse"];
    -[BMMiningTaskConfig setInteractionExtractedTopicFromAttachmentFactorInUse:](self, "setInteractionExtractedTopicFromAttachmentFactorInUse:", [v10 BOOLValue]);

    id v11 = BMLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [(BMMiningTaskConfig *)self bmMiningTaskConfig];
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_21FF33000, v11, OS_LOG_TYPE_INFO, "Loaded bmMiningTaskConfig with contents:%@, loaded from path:%@", buf, 0x16u);
    }
  }
  else
  {
    id v11 = BMLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(BMMiningTaskConfig *)(uint64_t)v4 loadBMMiningTaskConfig:v11];
    }
  }

  return v8 != 0;
}

- (NSString)trialID
{
  return self->_trialID;
}

- (void)setTrialID:(id)a3
{
}

- (BOOL)interactionExtractedTopicFromAttachmentFactorInUse
{
  return self->_interactionExtractedTopicFromAttachmentFactorInUse;
}

- (void)setInteractionExtractedTopicFromAttachmentFactorInUse:(BOOL)a3
{
  self->_interactionExtractedTopicFromAttachmentFactorInUse = a3;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (TRITrackingId)trialTrackingID
{
  return self->_trialTrackingID;
}

- (void)setTrialTrackingID:(id)a3
{
}

- (NSString)treatmentID
{
  return self->_treatmentID;
}

- (void)setTreatmentID:(id)a3
{
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (void)setExperimentID:(id)a3
{
}

- (int)deploymentID
{
  return self->_deploymentID;
}

- (void)setDeploymentID:(int)a3
{
  self->_deploymentID = a3;
}

- (NSDictionary)bmMiningTaskConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBmMiningTaskConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmMiningTaskConfig, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);

  objc_storeStrong((id *)&self->_trialID, 0);
}

- (void)updateFactorLevelsFromFilePath:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FF33000, log, OS_LOG_TYPE_ERROR, "Failed to load override config, fallback to default config", v1, 2u);
}

- (void)loadBMMiningTaskConfig:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21FF33000, log, OS_LOG_TYPE_ERROR, "Failed to load trial config with path:%@, with error：%@", (uint8_t *)&v3, 0x16u);
}

@end