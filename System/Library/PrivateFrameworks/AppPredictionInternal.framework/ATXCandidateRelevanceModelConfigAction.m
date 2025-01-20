@interface ATXCandidateRelevanceModelConfigAction
- (ATXActionPredictionBlacklist)actionBlacklist;
- (ATXCandidateRelevanceModelConfigAction)init;
- (ATXDigitalHealthBlacklist)appDigitalHealthBlacklist;
- (BOOL)candidateIsStillValidToSuggest:(id)a3;
- (id)candidatePublisherFromStartTime:(double)a3;
- (id)datasetGenerator;
- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4;
- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4;
- (void)setActionBlacklist:(id)a3;
- (void)setAppDigitalHealthBlacklist:(id)a3;
@end

@implementation ATXCandidateRelevanceModelConfigAction

- (ATXCandidateRelevanceModelConfigAction)init
{
  v15.receiver = self;
  v15.super_class = (Class)ATXCandidateRelevanceModelConfigAction;
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
    [(ATXCandidateRelevanceModelConfigAction *)v2 setActionBlacklist:v12];

    v13 = +[ATXDigitalHealthBlacklist sharedInstance];
    [(ATXCandidateRelevanceModelConfigAction *)v2 setAppDigitalHealthBlacklist:v13];
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
  return +[ATXCandidateRelevanceModelDatasetGeneratorConfigAction candidatePublisherFromStartTime:a3];
}

- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F93948];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = [(ATXCandidateRelevanceModelConfig *)self clientModel];
  v10 = [v9 clientModelId];
  v11 = (void *)[v8 initWithClientModelId:v10 clientModelVersion:@"1.0" engagementResetPolicy:0];

  v12 = [v7 biomeStoreData];

  if (!v12) {
    goto LABEL_5;
  }
  v13 = [v12 actionKey];
  v14 = +[_ATXActionUtils getActionTypeFromActionKey:v13];
  int v15 = [v14 isEqualToString:@"INPlayMediaIntent"];

  if (!v15
    || (+[ATXMediaActionPrediction updatedPlayMediaAction:v12], uint64_t v16 = objc_claimAutoreleasedReturnValue(), v12, (v12 = (void *)v16) != 0))
  {
    id v17 = objc_alloc(MEMORY[0x1E4F4B2B0]);
    *(float *)&double v18 = a4;
    v19 = (void *)[v17 initWithPredictedItem:v12 score:v18];
    v20 = +[ATXProactiveSuggestionBuilder _executableSpecForScoredAction:v19];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:2 suggestedConfidenceCategory:a4];
    v22 = objc_opt_new();
    v23 = [v22 actionBehavioralReason];
    v24 = +[ATXProactiveSuggestionBuilder _uiSpecForScoredAction:v19 scoreSpec:v21 clientModelSpec:v11 predictionReason:v23];

    v25 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v11 executableSpecification:v20 uiSpecification:v24 scoreSpecification:v21];
  }
  else
  {
LABEL_5:
    v25 = 0;
  }

  return v25;
}

- (BOOL)candidateIsStillValidToSuggest:(id)a3
{
  v4 = [a3 biomeStoreData];
  v5 = [v4 actionKey];
  v6 = +[_ATXActionUtils getActionTypeFromActionKey:v5];

  if (v6)
  {
    id v7 = [(ATXCandidateRelevanceModelConfig *)self installedAppsKnownToSpringBoard];
    id v8 = [v4 bundleId];
    int v9 = [v7 containsObject:v8];

    v10 = [(ATXCandidateRelevanceModelConfigAction *)self actionBlacklist];
    v11 = [v4 bundleId];
    char v12 = [v10 shouldPredictBundleId:v11 action:v6];

    v13 = [(ATXCandidateRelevanceModelConfigAction *)self appDigitalHealthBlacklist];
    v14 = [v13 blacklistedBundleIds];
    int v15 = [v4 bundleId];
    char v16 = [v14 containsObject:v15];

    if (v9) {
      char v17 = v12 & (v16 ^ 1);
    }
    else {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
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