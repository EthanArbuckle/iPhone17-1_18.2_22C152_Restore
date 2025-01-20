@interface ATXAnchorModelPredictionScorer
+ (double)normalizeValue:(double)a3 parameterKey:(id)a4;
+ (double)predictedProbabilityFromNormalizedClassConditionalProbability:(double)a3 posteriorProbability:(double)a4 minutesAfterAnchor:(double)a5 standardDeviation:(double)a6 uniqueOccurrences:(double)a7;
- (double)scoreForTrainingResult:(id)a3;
@end

@implementation ATXAnchorModelPredictionScorer

- (double)scoreForTrainingResult:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 phase1TrainingResult];
  [v4 classConditionalProbability];
  double v6 = v5;

  v7 = [v3 phase1TrainingResult];
  [v7 posteriorProbability];
  double v9 = v8;

  v10 = [v3 offsetFromAnchorToShowPrediction];
  [v10 startSecondsAfterAnchor];
  double v12 = v11 / 60.0;

  v13 = [v3 phase1TrainingResult];
  [v13 standardDeviationOfOffsetFromAnchor];
  double v15 = v14;

  v16 = [v3 phase1TrainingResult];
  double v17 = (double)[v16 numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence];

  +[ATXAnchorModelPredictionScorer normalizeValue:@"classConditionalProbability" parameterKey:v6];
  double v19 = v18;
  +[ATXAnchorModelPredictionScorer normalizeValue:@"posteriorProbability" parameterKey:v9];
  double v21 = v20;
  +[ATXAnchorModelPredictionScorer normalizeValue:@"minutesAfterAnchor" parameterKey:v12];
  double v23 = v22;
  +[ATXAnchorModelPredictionScorer normalizeValue:@"standardDeviation" parameterKey:v15];
  double v25 = v24;
  +[ATXAnchorModelPredictionScorer normalizeValue:@"uniqueOccurrences" parameterKey:v17];
  +[ATXAnchorModelPredictionScorer predictedProbabilityFromNormalizedClassConditionalProbability:v19 posteriorProbability:v21 minutesAfterAnchor:v23 standardDeviation:v25 uniqueOccurrences:v26];
  double v28 = v27;
  v29 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = 134218242;
    double v41 = v28;
    __int16 v42 = 2112;
    double v43 = *(double *)&v3;
    _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "Predicted probability for trainingResult was %.2f. Training result: %@", (uint8_t *)&v40, 0x16u);
  }

  v30 = [v3 phase1TrainingResult];
  uint64_t v31 = [v30 numRejectedSuggestion];

  v32 = [v3 phase1TrainingResult];
  uint64_t v33 = [v32 numShownSuggestions];

  v34 = [v3 phase1TrainingResult];
  uint64_t v35 = [v34 numEngagedSuggestions];

  if (v31)
  {
    if (v28 + (double)v31 * -0.25 >= 0.0) {
      double v28 = v28 + (double)v31 * -0.25;
    }
    else {
      double v28 = 0.0;
    }
    v36 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 134218498;
      double v41 = *(double *)&v31;
      __int16 v42 = 2048;
      double v43 = v28;
      __int16 v44 = 2112;
      id v45 = v3;
      _os_log_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_DEFAULT, "Predicted probability after taking into account %ld rejections was %.2f. Training result: %@", (uint8_t *)&v40, 0x20u);
    }
  }
  if (v33)
  {
    if (v28 + (double)v33 * -0.025 >= 0.1) {
      double v28 = v28 + (double)v33 * -0.025;
    }
    else {
      double v28 = 0.1;
    }
    v37 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 134218498;
      double v41 = *(double *)&v33;
      __int16 v42 = 2048;
      double v43 = v28;
      __int16 v44 = 2112;
      id v45 = v3;
      _os_log_impl(&dword_1D0FA3000, v37, OS_LOG_TYPE_DEFAULT, "Predicted probability after taking into account %ld abandons was %.2f. Training result: %@", (uint8_t *)&v40, 0x20u);
    }
  }
  if (v35)
  {
    double v28 = fmin(v28 + (double)v35 * 0.1, 1.0);
    v38 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 134218498;
      double v41 = *(double *)&v35;
      __int16 v42 = 2048;
      double v43 = v28;
      __int16 v44 = 2112;
      id v45 = v3;
      _os_log_impl(&dword_1D0FA3000, v38, OS_LOG_TYPE_DEFAULT, "Predicted probability after taking into account %ld engagements was %.2f. Training result: %@", (uint8_t *)&v40, 0x20u);
    }
  }
  return v28;
}

+ (double)normalizeValue:(double)a3 parameterKey:(id)a4
{
  id v5 = a4;
  double v6 = +[ATXAnchorModelHyperParameters sharedInstance];
  [v6 minValueForParameterKey:v5];
  double v8 = v7;

  double v9 = +[ATXAnchorModelHyperParameters sharedInstance];
  [v9 maxValueForParameterKey:v5];
  double v11 = v10;

  double v12 = (a3 - v8) / (v11 - v8);
  double result = 1.0;
  if (v12 <= 1.0)
  {
    double result = (a3 - v8) / (v11 - v8);
    if (v12 < 0.0) {
      return 0.0;
    }
  }
  return result;
}

+ (double)predictedProbabilityFromNormalizedClassConditionalProbability:(double)a3 posteriorProbability:(double)a4 minutesAfterAnchor:(double)a5 standardDeviation:(double)a6 uniqueOccurrences:(double)a7
{
  double v12 = +[ATXAnchorModelHyperParameters sharedInstance];
  [v12 modelWeightForParameterKey:@"classConditionalProbability"];
  double v14 = v13 * a3;

  double v15 = +[ATXAnchorModelHyperParameters sharedInstance];
  [v15 modelWeightForParameterKey:@"posteriorProbability"];
  double v17 = v16 * a4;

  double v18 = +[ATXAnchorModelHyperParameters sharedInstance];
  [v18 modelWeightForParameterKey:@"minutesAfterAnchor"];
  double v20 = v19 * a5;

  double v21 = +[ATXAnchorModelHyperParameters sharedInstance];
  [v21 modelWeightForParameterKey:@"standardDeviation"];
  double v23 = v22 * a6;

  double v24 = +[ATXAnchorModelHyperParameters sharedInstance];
  [v24 modelWeightForParameterKey:@"uniqueOccurrences"];
  double v26 = v25 * a7;

  double v27 = +[ATXAnchorModelHyperParameters sharedInstance];
  [v27 modelWeightForParameterKey:@"bias"];
  double v29 = v28;

  float v30 = v14 + v17 + v20 + v23 + v26 + v29;
  float v31 = 1.0 / (float)(expf(-v30) + 1.0);
  double v32 = v31;
  if (v31 > 1.0)
  {
    uint64_t v33 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      +[ATXAnchorModelPredictionScorer predictedProbabilityFromNormalizedClassConditionalProbability:posteriorProbability:minutesAfterAnchor:standardDeviation:uniqueOccurrences:](v33, v32);
    }

    return 1.0;
  }
  return v32;
}

+ (void)predictedProbabilityFromNormalizedClassConditionalProbability:(os_log_t)log posteriorProbability:(double)a2 minutesAfterAnchor:standardDeviation:uniqueOccurrences:.cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Predicted probability in anchor model scoring function was above 1.0. Predicted probability: %.2f", (uint8_t *)&v2, 0xCu);
}

@end