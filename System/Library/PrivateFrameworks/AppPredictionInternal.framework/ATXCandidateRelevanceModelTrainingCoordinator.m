@interface ATXCandidateRelevanceModelTrainingCoordinator
- (ATXCandidateRelevanceModelTrainingCoordinator)init;
- (ATXCandidateRelevanceModelTrainingCoordinator)initWithConfigs:(id)a3;
- (void)trainUsingConfig:(id)a3 xpcActivity:(id)a4 disregardDatasetMetadataRequirements:(BOOL)a5;
- (void)trainWithXPCActivity:(id)a3 disregardDatasetMetadataRequirements:(BOOL)a4;
@end

@implementation ATXCandidateRelevanceModelTrainingCoordinator

- (ATXCandidateRelevanceModelTrainingCoordinator)init
{
  v3 = allRelevanceModelConfigs();
  v4 = [(ATXCandidateRelevanceModelTrainingCoordinator *)self initWithConfigs:v3];

  return v4;
}

- (ATXCandidateRelevanceModelTrainingCoordinator)initWithConfigs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelTrainingCoordinator;
  v6 = [(ATXCandidateRelevanceModelTrainingCoordinator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configs, a3);
  }

  return v7;
}

- (void)trainWithXPCActivity:(id)a3 disregardDatasetMetadataRequirements:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%@ - Beginning model training for all configs.", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_configs;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[ATXCandidateRelevanceModelTrainingCoordinator trainUsingConfig:xpcActivity:disregardDatasetMetadataRequirements:](self, "trainUsingConfig:xpcActivity:disregardDatasetMetadataRequirements:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), v6, v4, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)trainUsingConfig:(id)a3 xpcActivity:(id)a4 disregardDatasetMetadataRequirements:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [[ATXCandidateRelevanceModelTrainer alloc] initWithConfig:v8];

  [(ATXCandidateRelevanceModelTrainer *)v9 trainWithXPCActivity:v7 disregardDatasetMetadataRequirements:v5];
}

- (void).cxx_destruct
{
}

@end