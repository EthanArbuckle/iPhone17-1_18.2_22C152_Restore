@interface ATXAnchorModelAnchorEventHandler
- (ATXAnchor)anchor;
- (ATXAnchorModelAnchorEventHandler)initWithAnchor:(id)a3 anchorEvent:(id)a4;
- (ATXAnchorModelAnchorEventHandler)initWithAnchor:(id)a3 anchorEvent:(id)a4 dataStoreWrapper:(id)a5 hyperParameters:(id)a6 tracker:(id)a7;
- (ATXDuetEvent)anchorEvent;
- (BOOL)predictionIsHighConfidence:(id)a3;
- (BOOL)predictionIsMediumConfidence:(id)a3;
- (double)predictionScoreFromTrainingResult:(id)a3;
- (id)anchorModelPredictionFromTrainingResult:(id)a3 classificationResult:(id)a4;
- (id)dateIntervalFromTrainingResult:(id)a3;
- (id)predictionForCandidateFromTrainingResult:(id)a3;
- (id)predictionsForAnchorEvent;
- (void)_logPhaseFilteredMetricFromTrainingResults:(id)a3 anchorModelPredictions:(id)a4;
@end

@implementation ATXAnchorModelAnchorEventHandler

- (ATXAnchorModelAnchorEventHandler)initWithAnchor:(id)a3 anchorEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = +[ATXAnchorModelHyperParameters sharedInstance];
  v10 = objc_opt_new();
  v11 = [(ATXAnchorModelAnchorEventHandler *)self initWithAnchor:v7 anchorEvent:v6 dataStoreWrapper:v8 hyperParameters:v9 tracker:v10];

  return v11;
}

- (ATXAnchorModelAnchorEventHandler)initWithAnchor:(id)a3 anchorEvent:(id)a4 dataStoreWrapper:(id)a5 hyperParameters:(id)a6 tracker:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ATXAnchorModelAnchorEventHandler;
  v17 = [(ATXAnchorModelAnchorEventHandler *)&v28 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    anchor = v17->_anchor;
    v17->_anchor = (ATXAnchor *)v18;

    [v13 identifier];
    id obj = a6;
    id v20 = v16;
    id v21 = v15;
    v23 = id v22 = v14;
    [(ATXAnchor *)v17->_anchor setAnchorEventIdentifier:v23];

    id v14 = v22;
    id v15 = v21;
    id v16 = v20;
    objc_storeStrong((id *)&v17->_anchorEvent, a4);
    objc_storeStrong((id *)&v17->_dataStoreWrapper, a5);
    objc_storeStrong((id *)&v17->_tracker, a7);
    uint64_t v24 = [(id)objc_opt_class() anchorOccurenceDateFromDuetEvent:v13];
    baseDate = v17->_baseDate;
    v17->_baseDate = (NSDate *)v24;

    objc_storeStrong((id *)&v17->_hyperParameters, obj);
  }

  return v17;
}

- (id)predictionsForAnchorEvent
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(ATXAnchorModelDataStoreWrapperProtocol *)self->_dataStoreWrapper trainingResultsForAnchor:self->_anchor];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1D25F6CC0]();
        v11 = [(ATXAnchorModelAnchorEventHandler *)self predictionForCandidateFromTrainingResult:v9];
        if ([v11 shouldPredictCandidate])
        {
          id v12 = [(ATXAnchorModelAnchorEventHandler *)self anchorModelPredictionFromTrainingResult:v9 classificationResult:v11];
          [v3 addObject:v12];
          id v13 = __atxlog_handle_anchor();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v20 = v12;
            _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Inference: Will predict candidate: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  [(ATXAnchorModelAnchorEventHandler *)self _logPhaseFilteredMetricFromTrainingResults:v4 anchorModelPredictions:v3];
  return v3;
}

- (id)predictionForCandidateFromTrainingResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 candidateClassifier];
  uint64_t v6 = [v5 classifyCandidateForAnchorOccurrence:self->_anchorEvent trainingResult:v4];

  return v6;
}

- (id)anchorModelPredictionFromTrainingResult:(id)a3 classificationResult:(id)a4
{
  id v5 = a3;
  [(ATXAnchorModelAnchorEventHandler *)self predictionScoreFromTrainingResult:v5];
  double v7 = v6;
  v8 = [ATXAnchorModelPrediction alloc];
  uint64_t v9 = [(ATXAnchor *)self->_anchor anchorTypeString];
  anchorEvent = self->_anchorEvent;
  v11 = [v5 candidateType];
  v32 = [v5 candidateId];
  v31 = [(ATXAnchorModelAnchorEventHandler *)self dateIntervalFromTrainingResult:v5];
  v34 = [v5 phase1TrainingResult];
  uint64_t v29 = [v34 numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence];
  v33 = [v5 phase1TrainingResult];
  [v33 posteriorProbability];
  double v13 = v12;
  v30 = [v5 phase1TrainingResult];
  [v30 classConditionalProbability];
  double v15 = v14;
  long long v16 = [v5 phase1TrainingResult];
  [v16 standardDeviationOfOffsetFromAnchor];
  double v18 = v17;
  v19 = [v5 phase1TrainingResult];
  [v19 anchorPopularity];
  double v21 = v20;
  uint64_t v22 = [v5 phase1TrainingResult];
  [v22 globalPopularity];
  double v24 = v23;
  v25 = [v5 offsetFromAnchorToShowPrediction];
  v26 = [v5 candidateClassifier];

  v27 = [(ATXAnchorModelPrediction *)v8 initWithAnchorType:v9 anchorEvent:anchorEvent candidateType:v11 candidateId:v32 dateIntervalForPrediction:v31 score:v29 numUniqueOccurrencesAfterAnchor:v7 posteriorProbability:v13 classConditionalProbability:v15 standardDeviationOfOffsetFromAnchor:v18 anchorPopularity:v21 globalPopularity:v24 offsetFromAnchorToShowPrediction:v25 candidateClassifier:v26];
  return v27;
}

- (double)predictionScoreFromTrainingResult:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 scoreForTrainingResult:v3];
  double v6 = v5;
  double v7 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    double v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Score for training result: %.2f, training result: %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (BOOL)predictionIsHighConfidence:(id)a3
{
  id v4 = a3;
  hyperParameters = self->_hyperParameters;
  double v6 = [v4 anchor];
  uint64_t v7 = [(ATXAnchorModelHyperParameters *)hyperParameters minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForHighConfidencePredictionForAnchor:v6];

  v8 = [v4 phase1TrainingResult];
  uint64_t v9 = [v8 numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence];

  if (v9 >= v7)
  {
    __int16 v11 = self->_hyperParameters;
    id v12 = [v4 anchor];
    [(ATXAnchorModelHyperParameters *)v11 minClassConditionalProbabilityForHighConfidencePredictionForAnchor:v12];
    double v14 = v13;

    double v15 = self->_hyperParameters;
    long long v16 = [v4 anchor];
    [(ATXAnchorModelHyperParameters *)v15 minPosteriorProbabilityForHighConfidencePredictionForAnchor:v16];
    double v18 = v17;

    v19 = [v4 phase1TrainingResult];
    [v19 classConditionalProbability];
    double v21 = v20;
    if (v20 >= v14
      && ([v4 phase1TrainingResult],
          long long v16 = objc_claimAutoreleasedReturnValue(),
          [v16 classConditionalProbability],
          v22 <= 1.0))
    {
      BOOL v10 = 1;
    }
    else
    {
      double v23 = [v4 phase1TrainingResult];
      [v23 posteriorProbability];
      BOOL v10 = v24 >= v18;

      if (v21 < v14) {
        goto LABEL_9;
      }
    }

LABEL_9:
    goto LABEL_10;
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)predictionIsMediumConfidence:(id)a3
{
  id v4 = a3;
  hyperParameters = self->_hyperParameters;
  double v6 = [v4 anchor];
  uint64_t v7 = [(ATXAnchorModelHyperParameters *)hyperParameters minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForMediumConfidencePredictionForAnchor:v6];

  v8 = [v4 phase1TrainingResult];
  uint64_t v9 = [v8 numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence];

  if (v9 >= v7)
  {
    __int16 v11 = self->_hyperParameters;
    id v12 = [v4 anchor];
    [(ATXAnchorModelHyperParameters *)v11 minClassConditionalProbabilityForMediumConfidencePredictionForAnchor:v12];
    double v14 = v13;

    double v15 = self->_hyperParameters;
    long long v16 = [v4 anchor];
    [(ATXAnchorModelHyperParameters *)v15 minPosteriorProbabilityForMediumConfidencePredictionForAnchor:v16];
    double v18 = v17;

    v19 = [v4 phase1TrainingResult];
    [v19 classConditionalProbability];
    double v21 = v20;
    if (v20 >= v14
      && ([v4 phase1TrainingResult],
          long long v16 = objc_claimAutoreleasedReturnValue(),
          [v16 classConditionalProbability],
          v22 <= 1.0))
    {
      BOOL v10 = 1;
    }
    else
    {
      double v23 = [v4 phase1TrainingResult];
      [v23 posteriorProbability];
      BOOL v10 = v24 >= v18;

      if (v21 < v14) {
        goto LABEL_9;
      }
    }

LABEL_9:
    goto LABEL_10;
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (id)dateIntervalFromTrainingResult:(id)a3
{
  id v4 = [a3 offsetFromAnchorToShowPrediction];
  [v4 startSecondsAfterAnchor];
  double v6 = v5;
  [(ATXAnchorModelHyperParameters *)self->_hyperParameters secondsBeforeHistoricalStartDateToPredictCandidate];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:self->_baseDate sinceDate:v6 - v7];
  id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v4 endSecondsAfterAnchor];
  BOOL v10 = objc_msgSend(v9, "initWithTimeInterval:sinceDate:", self->_baseDate);
  __int16 v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v10];

  return v11;
}

- (void)_logPhaseFilteredMetricFromTrainingResults:(id)a3 anchorModelPredictions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = [v6 firstObject];
    uint64_t v9 = [v8 candidateClassifierType];

    BOOL v10 = objc_opt_new();
    [v10 setPhaseDescription:2];
    if ((unint64_t)(v9 - 1) > 2) {
      __int16 v11 = @"unknown";
    }
    else {
      __int16 v11 = off_1E68ACDD0[v9 - 1];
    }
    [v10 setPhaseType:v11];
    objc_msgSend(v10, "setNumStartingCandidates:", objc_msgSend(v6, "count"));
    objc_msgSend(v10, "setNumEndingCandidates:", objc_msgSend(v7, "count"));
    id v12 = [(ATXAnchor *)self->_anchor anchorTypeString];
    [v10 setAnchorType:v12];

    double v13 = [(ATXAnchorModelHyperParameters *)self->_hyperParameters abGroup];
    [v10 setAbGroup:v13];

    [(ATXPETEventTracker2Protocol *)self->_tracker logMessage:v10];
    double v14 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelAnchorEventHandler _logPhaseFilteredMetricFromTrainingResults:anchorModelPredictions:]((uint64_t)self, v10, v14);
    }
  }
}

- (ATXAnchor)anchor
{
  return self->_anchor;
}

- (ATXDuetEvent)anchorEvent
{
  return self->_anchorEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorEvent, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_baseDate, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_dataStoreWrapper, 0);
}

- (void)_logPhaseFilteredMetricFromTrainingResults:(NSObject *)a3 anchorModelPredictions:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = [a2 numStartingCandidates];
  int v8 = [a2 numEndingCandidates];
  uint64_t v9 = [a2 anchorType];
  BOOL v10 = [a2 abGroup];
  int v11 = 138413314;
  id v12 = v6;
  __int16 v13 = 1024;
  int v14 = v7;
  __int16 v15 = 1024;
  int v16 = v8;
  __int16 v17 = 2112;
  double v18 = v9;
  __int16 v19 = 2112;
  double v20 = v10;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAnchorModelPhaseFilterTracker for phase 2 with starting candidates: %u ending candidates: %u, anchorType: %@ abGroup: %@", (uint8_t *)&v11, 0x2Cu);
}

@end