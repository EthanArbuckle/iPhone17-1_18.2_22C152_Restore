@interface ATXCandidateRelevanceModelConfigMinimalAction
- (ATXActionPredictionBlacklist)actionBlacklist;
- (ATXCandidateRelevanceModelConfigMinimalAction)init;
- (ATXDigitalHealthBlacklist)appDigitalHealthBlacklist;
- (BOOL)candidateIsStillValidToSuggest:(id)a3;
- (id)candidatePublisherFromStartTime:(double)a3;
- (id)datasetGenerator;
- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4;
- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4;
- (void)setActionBlacklist:(id)a3;
- (void)setAppDigitalHealthBlacklist:(id)a3;
@end

@implementation ATXCandidateRelevanceModelConfigMinimalAction

- (ATXCandidateRelevanceModelConfigMinimalAction)init
{
  v15.receiver = self;
  v15.super_class = (Class)ATXCandidateRelevanceModelConfigMinimalAction;
  v2 = [(ATXCandidateRelevanceModelConfig *)&v15 init];
  if (v2)
  {
    v3 = [ATXCandidateRelevanceLogisticRegressionModelTrainingPlan alloc];
    v4 = [(ATXCandidateRelevanceModelConfig *)v2 modelTrainingPlanParameters];
    v5 = [(ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *)v3 initWithParameters:v4];
    [(ATXCandidateRelevanceModelConfig *)v2 setModelTrainingPlan:v5];

    v6 = objc_opt_new();
    [(ATXCandidateRelevanceModelConfig *)v2 setDatastore:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F93940]);
    v8 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:5];
    v9 = +[ATXClientModelSuggestionReceiver sharedInstance];
    v10 = [v9 blendingLayerServer];
    v11 = (void *)[v7 initWithClientModelId:v8 blendingLayerServer:v10];
    [(ATXCandidateRelevanceModelConfig *)v2 setClientModel:v11];

    v12 = +[ATXActionPredictionBlacklist sharedInstanceWithAppPredictionBlacklist];
    [(ATXCandidateRelevanceModelConfigMinimalAction *)v2 setActionBlacklist:v12];

    v13 = +[ATXDigitalHealthBlacklist sharedInstance];
    [(ATXCandidateRelevanceModelConfigMinimalAction *)v2 setAppDigitalHealthBlacklist:v13];
  }
  return v2;
}

- (id)datasetGenerator
{
  v2 = [ATXCandidateRelevanceModelDatasetGenerator alloc];
  v3 = objc_opt_new();
  v4 = [(ATXCandidateRelevanceModelDatasetGenerator *)v2 initWithConfig:v3];

  return v4;
}

- (id)candidatePublisherFromStartTime:(double)a3
{
  return +[ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction candidatePublisherFromStartTime:a3];
}

- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4
{
  v6 = [a3 biomeStoreData];
  uint64_t v7 = [v6 actionFromDatastoreLookup];
  if (!v7) {
    goto LABEL_5;
  }
  v8 = (void *)v7;
  v9 = [v6 actionType];
  int v10 = [v9 isEqualToString:@"INPlayMediaIntent"];

  if (!v10
    || (+[ATXMediaActionPrediction updatedPlayMediaAction:v8], uint64_t v11 = objc_claimAutoreleasedReturnValue(), v8, (v8 = (void *)v11) != 0))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F93948]);
    v13 = [(ATXCandidateRelevanceModelConfig *)self clientModel];
    v14 = [v13 clientModelId];
    objc_super v15 = (void *)[v12 initWithClientModelId:v14 clientModelVersion:@"1.0" engagementResetPolicy:0];

    id v16 = objc_alloc(MEMORY[0x1E4F4B2B0]);
    *(float *)&double v17 = a4;
    v18 = (void *)[v16 initWithPredictedItem:v8 score:v17];
    v19 = +[ATXProactiveSuggestionBuilder _executableSpecForScoredAction:v18];
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:2 suggestedConfidenceCategory:a4];
    v21 = objc_opt_new();
    v22 = [v21 actionBehavioralReason];
    v23 = +[ATXProactiveSuggestionBuilder _uiSpecForScoredAction:v18 scoreSpec:v20 clientModelSpec:v15 predictionReason:v22];

    v24 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v15 executableSpecification:v19 uiSpecification:v23 scoreSpecification:v20];
  }
  else
  {
LABEL_5:
    v24 = 0;
  }

  return v24;
}

- (BOOL)candidateIsStillValidToSuggest:(id)a3
{
  v4 = [a3 biomeStoreData];
  v5 = [(ATXCandidateRelevanceModelConfig *)self installedAppsKnownToSpringBoard];
  v6 = [v4 bundleId];
  int v7 = [v5 containsObject:v6];

  v8 = [(ATXCandidateRelevanceModelConfigMinimalAction *)self actionBlacklist];
  v9 = [v4 bundleId];
  int v10 = [v4 actionType];
  char v11 = [v8 shouldPredictBundleId:v9 action:v10];

  id v12 = [(ATXCandidateRelevanceModelConfigMinimalAction *)self appDigitalHealthBlacklist];
  v13 = [v12 blacklistedBundleIds];
  v14 = [v4 bundleId];
  char v15 = [v13 containsObject:v14];

  if (v7) {
    char v16 = v11 & (v15 ^ 1);
  }
  else {
    char v16 = 0;
  }

  return v16;
}

- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (ATXDigitalHealthBlacklist)appDigitalHealthBlacklist
{
  return self->_appDigitalHealthBlacklist;
}

- (void)setAppDigitalHealthBlacklist:(id)a3
{
}

- (ATXActionPredictionBlacklist)actionBlacklist
{
  return self->_actionBlacklist;
}

- (void)setActionBlacklist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBlacklist, 0);
  objc_storeStrong((id *)&self->_appDigitalHealthBlacklist, 0);
}

@end