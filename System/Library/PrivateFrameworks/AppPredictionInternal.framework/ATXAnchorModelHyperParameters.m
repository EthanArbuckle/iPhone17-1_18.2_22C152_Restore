@interface ATXAnchorModelHyperParameters
+ (ATXAnchorModelHyperParameters)sharedInstance;
- (ATXAnchorModelHyperParameters)init;
- (double)highBlendingConfidenceScoreThreshold;
- (double)idleTimeEndAnchorMinimumSecondsForBeingIdle;
- (double)maxDurationForAnchorModelPredictionInSecondsForPhase3;
- (double)maxSecondsSinceCandidateOccurrenceToConsiderCandidateForPrediction;
- (double)maxTrainingAgeInSecondsToConsiderForRetraining;
- (double)maxValueForParameterKey:(id)a3;
- (double)mediumBlendingConfidenceScoreThreshold;
- (double)minClassConditionalProbabilityForCandidateForPhase1;
- (double)minClassConditionalProbabilityForHighConfidencePredictionForAnchor:(id)a3;
- (double)minClassConditionalProbabilityForMediumConfidencePredictionForAnchor:(id)a3;
- (double)minDurationForAnchorModelPredictionInSecondsForPhase3;
- (double)minPosteriorProbabilityForCandidateForPhase1;
- (double)minPosteriorProbabilityForHighConfidencePredictionForAnchor:(id)a3;
- (double)minPosteriorProbabilityForMediumConfidencePredictionForAnchor:(id)a3;
- (double)minPosteriorProbabilityToIgnoreClassConditionalProbabilityForCandidateForPhase1;
- (double)minValueForParameterKey:(id)a3;
- (double)modelWeightForParameterKey:(id)a3;
- (double)percentileForEndOffsetFromAnchorForPhase3;
- (double)percentileForStartOffsetFromAnchorForPhase3;
- (double)ratioForLeafNodeDecision;
- (double)secondsBeforeHistoricalStartDateToPredictCandidate;
- (id)abGroup;
- (id)anchorsDisabledForHomescreen;
- (id)enabledAnchors;
- (id)knownAnchorClasses;
- (int64_t)candidateClassifierTypeForPhase2;
- (int64_t)minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForHighConfidencePredictionForAnchor:(id)a3;
- (int64_t)minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForMediumConfidencePredictionForAnchor:(id)a3;
- (int64_t)minUniqueAnchorOccurrencesForAnchorForPhase1;
@end

@implementation ATXAnchorModelHyperParameters

+ (ATXAnchorModelHyperParameters)sharedInstance
{
  if (sharedInstance__pasOnceToken6_12 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_12, &__block_literal_global_89);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_16;
  return (ATXAnchorModelHyperParameters *)v2;
}

void __47__ATXAnchorModelHyperParameters_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_16;
  sharedInstance__pasExprOnceResult_16 = v1;
}

- (ATXAnchorModelHyperParameters)init
{
  v11.receiver = self;
  v11.super_class = (Class)ATXAnchorModelHyperParameters;
  v2 = [(ATXAnchorModelHyperParameters *)&v11 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F4AF08];
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [v3 rawDictionaryForResource:v5 ofType:@"plplist"];

    v7 = (void *)[objc_alloc(MEMORY[0x1E4F4AF10]) initWithAssetContents:v6];
    uint64_t v8 = [v7 abGroupContents];
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v8;
  }
  return v2;
}

- (id)abGroup
{
  return [(NSDictionary *)self->_parameters objectForKey:@"abGroup"];
}

- (double)maxSecondsSinceCandidateOccurrenceToConsiderCandidateForPrediction
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"MaxSecondsSinceCandidateOccurrenceToConsiderCandidateForPrediction"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (int64_t)minUniqueAnchorOccurrencesForAnchorForPhase1
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"MinUniqueAnchorOccurrencesForAnchorForPhase1"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (double)minClassConditionalProbabilityForCandidateForPhase1
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"MinClassConditionalProbabilityForCandidateForPhase1"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)minPosteriorProbabilityForCandidateForPhase1
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"MinPosteriorProbabilityForCandidateForPhase1"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)minPosteriorProbabilityToIgnoreClassConditionalProbabilityForCandidateForPhase1
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"MinPosteriorProbabilityToIgnoreClassConditionalProbabilityForCandidateForPhase1"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (int64_t)candidateClassifierTypeForPhase2
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"CandidateClassifierTypeForPhase2"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (double)idleTimeEndAnchorMinimumSecondsForBeingIdle
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"IdleTimeEndAnchorMinimumSecondsForBeingIdle"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)percentileForStartOffsetFromAnchorForPhase3
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"PercentileForStartOffsetFromAnchorForPhase3"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)percentileForEndOffsetFromAnchorForPhase3
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"PercentileForEndOffsetFromAnchorForPhase3"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)minDurationForAnchorModelPredictionInSecondsForPhase3
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"MinDurationOfAnchorModelPredictionInSecondsForPhase3"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)maxDurationForAnchorModelPredictionInSecondsForPhase3
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"MaxDurationOfAnchorModelPredictionInSecondsForPhase3"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)secondsBeforeHistoricalStartDateToPredictCandidate
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"SecondsBeforeHistoricalStartDateToPredictCandidate"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)mediumBlendingConfidenceScoreThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"MediumBlendingConfidenceScoreThreshold"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)highBlendingConfidenceScoreThreshold
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"HighBlendingConfidenceScoreThreshold"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)maxTrainingAgeInSecondsToConsiderForRetraining
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"MaxTrainingAgeInSecondsToConsiderForRetraining"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)ratioForLeafNodeDecision
{
  v2 = [(NSDictionary *)self->_parameters objectForKey:@"RatioForLeafNodeDecision"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)knownAnchorClasses
{
  v2 = objc_opt_new();
  for (uint64_t i = 0; i != 23; ++i)
  {
    double v4 = +[ATXAnchor anchorTypeToAnchorClassName:i];
    if (v4) {
      [v2 addObject:v4];
    }
  }
  return v2;
}

- (id)enabledAnchors
{
  double v3 = [(ATXAnchorModelHyperParameters *)self knownAnchorClasses];
  double v4 = [(NSDictionary *)self->_parameters objectForKey:@"EnabledAnchors"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__ATXAnchorModelHyperParameters_enabledAnchors__block_invoke;
  v8[3] = &unk_1E68B0200;
  id v9 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v8);

  return v6;
}

uint64_t __47__ATXAnchorModelHyperParameters_enabledAnchors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];
  if ((v4 & 1) == 0)
  {
    id v5 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __47__ATXAnchorModelHyperParameters_enabledAnchors__block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  return v4;
}

- (id)anchorsDisabledForHomescreen
{
  id v3 = [(ATXAnchorModelHyperParameters *)self knownAnchorClasses];
  uint64_t v4 = [(NSDictionary *)self->_parameters objectForKey:@"AnchorsDisabledForHomescreen"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__ATXAnchorModelHyperParameters_anchorsDisabledForHomescreen__block_invoke;
  v9[3] = &unk_1E68B0200;
  id v10 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v9);

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
  return v7;
}

uint64_t __61__ATXAnchorModelHyperParameters_anchorsDisabledForHomescreen__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];
  if ((v4 & 1) == 0)
  {
    id v5 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __61__ATXAnchorModelHyperParameters_anchorsDisabledForHomescreen__block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  return v4;
}

- (int64_t)minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForHighConfidencePredictionForAnchor:(id)a3
{
  parameters = self->_parameters;
  id v4 = a3;
  id v5 = [(NSDictionary *)parameters objectForKeyedSubscript:@"AnchorPredictionScoringParameters"];
  v6 = (objc_class *)objc_opt_class();

  v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [v8 objectForKeyedSubscript:@"High_NumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence"];
    int64_t v10 = [v9 integerValue];
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:@"Default"];
    objc_super v11 = [v9 objectForKeyedSubscript:@"High_NumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence"];
    int64_t v10 = [v11 integerValue];
  }
  return v10;
}

- (int64_t)minNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrencesForMediumConfidencePredictionForAnchor:(id)a3
{
  parameters = self->_parameters;
  id v4 = a3;
  id v5 = [(NSDictionary *)parameters objectForKeyedSubscript:@"AnchorPredictionScoringParameters"];
  v6 = (objc_class *)objc_opt_class();

  v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [v8 objectForKeyedSubscript:@"Med_NumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence"];
    int64_t v10 = [v9 integerValue];
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:@"Default"];
    objc_super v11 = [v9 objectForKeyedSubscript:@"Med_NumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence"];
    int64_t v10 = [v11 integerValue];
  }
  return v10;
}

- (double)minPosteriorProbabilityForHighConfidencePredictionForAnchor:(id)a3
{
  parameters = self->_parameters;
  id v4 = a3;
  id v5 = [(NSDictionary *)parameters objectForKeyedSubscript:@"AnchorPredictionScoringParameters"];
  v6 = (objc_class *)objc_opt_class();

  v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [v8 objectForKeyedSubscript:@"High_PosteriorProbability"];
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:@"Default"];
    v12 = [v9 objectForKeyedSubscript:@"High_PosteriorProbability"];
    [v12 doubleValue];
    double v11 = v13;
  }
  return v11;
}

- (double)minPosteriorProbabilityForMediumConfidencePredictionForAnchor:(id)a3
{
  parameters = self->_parameters;
  id v4 = a3;
  id v5 = [(NSDictionary *)parameters objectForKeyedSubscript:@"AnchorPredictionScoringParameters"];
  v6 = (objc_class *)objc_opt_class();

  v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [v8 objectForKeyedSubscript:@"Med_PosteriorProbability"];
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:@"Default"];
    v12 = [v9 objectForKeyedSubscript:@"Med_PosteriorProbability"];
    [v12 doubleValue];
    double v11 = v13;
  }
  return v11;
}

- (double)minClassConditionalProbabilityForHighConfidencePredictionForAnchor:(id)a3
{
  parameters = self->_parameters;
  id v4 = a3;
  id v5 = [(NSDictionary *)parameters objectForKeyedSubscript:@"AnchorPredictionScoringParameters"];
  v6 = (objc_class *)objc_opt_class();

  v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [v8 objectForKeyedSubscript:@"High_ClassConditionalProbability"];
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:@"Default"];
    v12 = [v9 objectForKeyedSubscript:@"High_ClassConditionalProbability"];
    [v12 doubleValue];
    double v11 = v13;
  }
  return v11;
}

- (double)minClassConditionalProbabilityForMediumConfidencePredictionForAnchor:(id)a3
{
  parameters = self->_parameters;
  id v4 = a3;
  id v5 = [(NSDictionary *)parameters objectForKeyedSubscript:@"AnchorPredictionScoringParameters"];
  v6 = (objc_class *)objc_opt_class();

  v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [v8 objectForKeyedSubscript:@"Med_ClassConditionalProbability"];
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:@"Default"];
    v12 = [v9 objectForKeyedSubscript:@"Med_ClassConditionalProbability"];
    [v12 doubleValue];
    double v11 = v13;
  }
  return v11;
}

- (double)minValueForParameterKey:(id)a3
{
  parameters = self->_parameters;
  id v4 = a3;
  id v5 = [(NSDictionary *)parameters objectForKeyedSubscript:@"ScoringModelParameters"];
  v6 = [v5 objectForKeyedSubscript:@"ScalingParameters"];
  v7 = [v6 objectForKeyedSubscript:v4];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"min"];
  [v8 doubleValue];
  double v10 = v9;

  return v10;
}

- (double)maxValueForParameterKey:(id)a3
{
  parameters = self->_parameters;
  id v4 = a3;
  id v5 = [(NSDictionary *)parameters objectForKeyedSubscript:@"ScoringModelParameters"];
  v6 = [v5 objectForKeyedSubscript:@"ScalingParameters"];
  v7 = [v6 objectForKeyedSubscript:v4];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"max"];
  [v8 doubleValue];
  double v10 = v9;

  return v10;
}

- (double)modelWeightForParameterKey:(id)a3
{
  parameters = self->_parameters;
  id v4 = a3;
  id v5 = [(NSDictionary *)parameters objectForKeyedSubscript:@"ScoringModelParameters"];
  v6 = [v5 objectForKeyedSubscript:@"ModelWeights"];
  v7 = [v6 objectForKeyedSubscript:v4];

  [v7 doubleValue];
  double v9 = v8;

  return v9;
}

- (void).cxx_destruct
{
}

void __47__ATXAnchorModelHyperParameters_enabledAnchors__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "EnabledAnchors in AnchorModelHyperParameters contained an unknown anchor: %@", (uint8_t *)&v2, 0xCu);
}

void __61__ATXAnchorModelHyperParameters_anchorsDisabledForHomescreen__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "AnchorsDisabledForHomescreen in AnchorModelHyperParameters contained an unknown anchor: %@", (uint8_t *)&v2, 0xCu);
}

@end