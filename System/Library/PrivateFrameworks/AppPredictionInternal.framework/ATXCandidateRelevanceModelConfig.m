@interface ATXCandidateRelevanceModelConfig
- (ATXCandidateRelevanceModelConfig)init;
- (ATXCandidateRelevanceModelConfig)initWithAppIconState:(id)a3;
- (ATXCandidateRelevanceModelDataStoreProtocol)datastore;
- (ATXCandidateRelevanceModelTrainingPlanProtocol)modelTrainingPlan;
- (ATXProactiveSuggestionClientModel)clientModel;
- (BOOL)candidateIsStillValidToSuggest:(id)a3;
- (BOOL)isEnabled;
- (BOOL)shouldTrainModelWithCandidateDatasetMetadata:(id)a3;
- (BOOL)shouldTrainModelWithOverallDatasetMetadata:(id)a3;
- (BOOL)shouldTrainModelWithPositiveCandidateDatasetMetadata:(id)a3;
- (NSArray)featurizers;
- (NSSet)installedAppsKnownToSpringBoard;
- (NSString)abGroupIdentifier;
- (float)dataHarvestingSamplingRate;
- (id)featurizersFromConfigPlist;
- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4;
- (id)modelTrainingPlanParameters;
- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4;
- (int)maximumNumberOfTrainedCandidates;
- (int)minimumNumberOfDaysWithPositiveSamplesForCandidate;
- (int)minimumNumberOfDaysWithPositiveSamplesOverall;
- (int)minimumNumberOfDaysWithSamplesForCandidate;
- (int)minimumNumberOfPositiveSamplesForCandidate;
- (int)minimumNumberOfPositiveSamplesOverall;
- (int)minimumNumberOfSamplesForCandidate;
- (void)setClientModel:(id)a3;
- (void)setDatastore:(id)a3;
- (void)setInstalledAppsKnownToSpringBoard:(id)a3;
- (void)setModelTrainingPlan:(id)a3;
@end

@implementation ATXCandidateRelevanceModelConfig

- (ATXCandidateRelevanceModelConfig)init
{
  v3 = +[_ATXAppIconState sharedInstance];
  v4 = [(ATXCandidateRelevanceModelConfig *)self initWithAppIconState:v3];

  return v4;
}

- (ATXCandidateRelevanceModelConfig)initWithAppIconState:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ATXCandidateRelevanceModelConfig;
  v5 = [(ATXCandidateRelevanceModelConfig *)&v22 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4AF10]);
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [MEMORY[0x1E4F4AE28] abGroupOverride];
    v10 = (void *)[v6 initWithAssetsForResource:v8 ofType:@"plist" specifiedABGroup:v9];

    uint64_t v11 = [v10 abGroupContents];
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v11;

    uint64_t v13 = [v10 groupIdentifier];
    abGroupIdentifier = v5->_abGroupIdentifier;
    v5->_abGroupIdentifier = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v16 = [v4 allInstalledAppsKnownToSpringBoard];
    uint64_t v17 = [v15 setWithArray:v16];
    installedAppsKnownToSpringBoard = v5->_installedAppsKnownToSpringBoard;
    v5->_installedAppsKnownToSpringBoard = (NSSet *)v17;

    uint64_t v19 = [(ATXCandidateRelevanceModelConfig *)v5 featurizersFromConfigPlist];
    featurizers = v5->_featurizers;
    v5->_featurizers = (NSArray *)v19;
  }
  return v5;
}

- (BOOL)shouldTrainModelWithPositiveCandidateDatasetMetadata:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 numberOfPositiveSamples];
  if (v5 >= [(ATXCandidateRelevanceModelConfig *)self minimumNumberOfPositiveSamplesForCandidate])
  {
    unint64_t v7 = [v4 numberOfDaysWithPositiveSamples];
    BOOL v6 = v7 >= [(ATXCandidateRelevanceModelConfig *)self minimumNumberOfDaysWithPositiveSamplesForCandidate];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)shouldTrainModelWithCandidateDatasetMetadata:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 numberOfPositiveSamples];
  if (v5 >= -[ATXCandidateRelevanceModelConfig minimumNumberOfPositiveSamplesForCandidate](self, "minimumNumberOfPositiveSamplesForCandidate")&& (unint64_t v6 = [v4 numberOfSamples], v6 >= -[ATXCandidateRelevanceModelConfig minimumNumberOfSamplesForCandidate](self, "minimumNumberOfSamplesForCandidate"))&& (v7 = objc_msgSend(v4, "numberOfDaysWithPositiveSamples"), v7 >= -[ATXCandidateRelevanceModelConfig minimumNumberOfDaysWithPositiveSamplesForCandidate](self, "minimumNumberOfDaysWithPositiveSamplesForCandidate")))
  {
    unint64_t v10 = [v4 numberOfDaysWithSamples];
    BOOL v8 = v10 >= [(ATXCandidateRelevanceModelConfig *)self minimumNumberOfDaysWithSamplesForCandidate];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)shouldTrainModelWithOverallDatasetMetadata:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 numberOfPositiveSamples];
  if (v5 >= [(ATXCandidateRelevanceModelConfig *)self minimumNumberOfPositiveSamplesOverall])
  {
    unint64_t v7 = [v4 numberOfDaysWithPositiveSamples];
    BOOL v6 = v7 >= [(ATXCandidateRelevanceModelConfig *)self minimumNumberOfDaysWithPositiveSamplesOverall];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4
{
  id result = a3;
  __break(1u);
  return result;
}

- (BOOL)candidateIsStillValidToSuggest:(id)a3
{
  id v3 = a3;
  __break(1u);
  return (char)v3;
}

- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4
{
  id v5 = a3;
  id result = a4;
  __break(1u);
  return result;
}

- (BOOL)isEnabled
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"IsEnabled"];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (float)dataHarvestingSamplingRate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"DataHarvestingSamplingRate"];
  id v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    float v5 = v4;
  }
  else
  {
    float v5 = 0.0;
  }

  return v5;
}

- (int)maximumNumberOfTrainedCandidates
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MaximumNumberOfTrainedCandidates"];
  id v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)minimumNumberOfPositiveSamplesForCandidate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MinimumNumberOfPositiveSamplesForCandidate"];
  id v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0x7FFFFFFF;
  }

  return v4;
}

- (int)minimumNumberOfSamplesForCandidate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MinimumNumberOfSamplesForCandidate"];
  id v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0x7FFFFFFF;
  }

  return v4;
}

- (int)minimumNumberOfDaysWithPositiveSamplesForCandidate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MinimumNumberOfDaysWithPositiveSamplesForCandidate"];
  id v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0x7FFFFFFF;
  }

  return v4;
}

- (int)minimumNumberOfDaysWithSamplesForCandidate
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MinimumNumberOfDaysWithSamplesForCandidate"];
  id v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0x7FFFFFFF;
  }

  return v4;
}

- (int)minimumNumberOfPositiveSamplesOverall
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MinimumNumberOfPositiveSamplesOverall"];
  id v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0x7FFFFFFF;
  }

  return v4;
}

- (int)minimumNumberOfDaysWithPositiveSamplesOverall
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"MinimumNumberOfDaysWithPositiveSamplesOverall"];
  id v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0x7FFFFFFF;
  }

  return v4;
}

- (id)modelTrainingPlanParameters
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ModelTrainingPlanParameters"];
  id v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v4 = v2;

  return v4;
}

- (id)featurizersFromConfigPlist
{
  uint64_t v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"Featurizers"];
  id v3 = (void *)v2;
  id v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2) {
    id v4 = (void *)v2;
  }
  id v5 = v4;

  BOOL v6 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke;
  v10[3] = &unk_1E68AC408;
  id v11 = v6;
  id v7 = v6;
  BOOL v8 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v10);

  return v8;
}

id __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!NSClassFromString(v3))
  {
    id v4 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke_cold_1((uint64_t)v3, v4);
    }
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
    id v4 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke_cold_2((uint64_t)v3, v4);
    }
LABEL_7:

    id v5 = 0;
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) addObject:v3];
  id v5 = objc_opt_new();
LABEL_9:

  return v5;
}

- (ATXCandidateRelevanceModelTrainingPlanProtocol)modelTrainingPlan
{
  return self->_modelTrainingPlan;
}

- (void)setModelTrainingPlan:(id)a3
{
}

- (ATXCandidateRelevanceModelDataStoreProtocol)datastore
{
  return self->_datastore;
}

- (void)setDatastore:(id)a3
{
}

- (ATXProactiveSuggestionClientModel)clientModel
{
  return self->_clientModel;
}

- (void)setClientModel:(id)a3
{
}

- (NSArray)featurizers
{
  return self->_featurizers;
}

- (NSString)abGroupIdentifier
{
  return self->_abGroupIdentifier;
}

- (NSSet)installedAppsKnownToSpringBoard
{
  return self->_installedAppsKnownToSpringBoard;
}

- (void)setInstalledAppsKnownToSpringBoard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedAppsKnownToSpringBoard, 0);
  objc_storeStrong((id *)&self->_abGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_featurizers, 0);
  objc_storeStrong((id *)&self->_clientModel, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
  objc_storeStrong((id *)&self->_modelTrainingPlan, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

void __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Error converting %@ to a class.", (uint8_t *)&v2, 0xCu);
}

void __62__ATXCandidateRelevanceModelConfig_featurizersFromConfigPlist__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Duplicate featurizer defined: %@", (uint8_t *)&v2, 0xCu);
}

@end