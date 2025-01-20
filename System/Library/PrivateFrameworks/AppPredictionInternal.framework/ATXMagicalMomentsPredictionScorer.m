@interface ATXMagicalMomentsPredictionScorer
- (ATXMagicalMomentsPredictionScorer)initWithCorrelatedEvents:(id)a3 andGlobalAppLaunchCountedSet:(id)a4;
- (BOOL)subExpertCanMakeHighConfidencePredictions;
- (BOOL)subExpertCanMakeHighConfidencePredictionsForBundleId:(id)a3;
- (BOOL)subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions;
- (BOOL)subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions;
- (BOOL)subExpertHasWitnessedEnoughRelevantAppLaunches;
- (double)maximumRelevanceWeightForMMScoring;
- (double)minimumRelevanceWeightForMMScoring;
- (double)scalingFactorFromTopPrediction;
- (id)cumulativeScoresWithDecayedWeightsByIdentifier;
- (id)dateSetForDecay;
- (id)generatePredictions;
- (id)getPredictionsFromFinalConfidences;
- (id)relevanceScoreForBundleId:(id)a3;
- (id)relevanceWeightsByIdentifier;
- (id)relevantAppLaunches;
- (id)startOfDayForDate:(id)a3;
- (id)topScoringIdentifier;
- (unint64_t)minimumNumberOfDaysOfObservationsRequiredForSubExpertToMakePredictions;
- (unint64_t)minimumNumberOfGlobalObservationsOfBundleIdForMMScoring;
- (unint64_t)minimumNumberOfRelevantObservationsOfBundleIdForMMScoring;
- (unint64_t)minimumNumberOfUniqueAnchorOccurrencesForBundleIdForMMScoring;
- (unint64_t)totalRelevantLaunchesForAllBundleIds;
- (void)computeModelConfidences;
- (void)computeRelevanceScoresForAllRelevantBundleIds;
- (void)computeTimeDecayedCumulativeScores;
- (void)generatePredictions;
- (void)getRelevantAppLaunchCountsAndDateSetFromCorrelationData;
- (void)scaleAllScoresWithTopScoringFactor;
- (void)subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions;
- (void)subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions;
- (void)subExpertHasWitnessedEnoughRelevantAppLaunches;
@end

@implementation ATXMagicalMomentsPredictionScorer

- (ATXMagicalMomentsPredictionScorer)initWithCorrelatedEvents:(id)a3 andGlobalAppLaunchCountedSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8 && [v7 count] && objc_msgSend(v9, "count"))
  {
    v15.receiver = self;
    v15.super_class = (Class)ATXMagicalMomentsPredictionScorer;
    v10 = [(ATXMagicalMomentsPredictionScorer *)&v15 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_globalAppLaunches, a4);
      objc_storeStrong(p_isa + 1, a3);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_INFO, "Attempted to initialize a Magical Moments Prediction Scorer without passing global app launch counts or relevant correlated events. Nothing to predict for this sub-expert!", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (void)computeRelevanceScoresForAllRelevantBundleIds
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = self->_relevantAppLaunches;
  uint64_t v4 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v16 objects:v28 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138413058;
    long long v15 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v10 = -[ATXMagicalMomentsPredictionScorer relevanceScoreForBundleId:](self, "relevanceScoreForBundleId:", v9, v15, (void)v16);
        [(NSMutableDictionary *)self->_relevanceWeightsByIdentifier setObject:v10 forKeyedSubscript:v9];

        self->_totalRelevantLaunchesForAllBundleIds += [(NSCountedSet *)self->_relevantAppLaunches countForObject:v9];
        v11 = __atxlog_handle_default();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          NSUInteger v12 = [(NSCountedSet *)self->_relevantAppLaunches countForObject:v9];
          NSUInteger v13 = [(NSCountedSet *)self->_globalAppLaunches countForObject:v9];
          v14 = [(NSMutableDictionary *)self->_relevanceWeightsByIdentifier objectForKeyedSubscript:v9];
          *(_DWORD *)buf = v15;
          uint64_t v21 = v9;
          __int16 v22 = 2048;
          NSUInteger v23 = v12;
          __int16 v24 = 2048;
          NSUInteger v25 = v13;
          __int16 v26 = 2112;
          v27 = v14;
          _os_log_debug_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEBUG, "ATXMM: ==> bundleId: %@, relevant launches: %lu, global launches: %lu, relevance weight: %@", buf, 0x2Au);
        }
      }
      uint64_t v6 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v16 objects:v28 count:16];
    }
    while (v6);
  }
}

- (void)getRelevantAppLaunchCountsAndDateSetFromCorrelationData
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = (NSMutableOrderedSet *)objc_opt_new();
  dateSetForDecay = self->_dateSetForDecay;
  self->_dateSetForDecay = v3;

  long long v5 = (NSCountedSet *)objc_opt_new();
  relevantAppLaunches = self->_relevantAppLaunches;
  self->_relevantAppLaunches = v5;

  uint64_t v7 = (NSMutableDictionary *)objc_opt_new();
  relevanceWeightsByIdentifier = self->_relevanceWeightsByIdentifier;
  self->_relevanceWeightsByIdentifier = v7;

  self->_totalRelevantLaunchesForAllBundleIds = 0;
  uint64_t v9 = objc_opt_new();
  v10 = (NSMutableDictionary *)objc_opt_new();
  numUniqueAnchorOccurrencesPerCandidate = self->_numUniqueAnchorOccurrencesPerCandidate;
  self->_numUniqueAnchorOccurrencesPerCandidate = v10;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = self->_correlatedEvents;
  uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v34 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v16 = [v15 firstEvent];
        long long v17 = [v16 startDate];
        long long v18 = [(ATXMagicalMomentsPredictionScorer *)self startOfDayForDate:v17];

        [(NSMutableOrderedSet *)self->_dateSetForDecay addObject:v18];
        long long v19 = self->_relevantAppLaunches;
        v20 = [v15 secondEvent];
        uint64_t v21 = [v20 identifier];
        [(NSCountedSet *)v19 addObject:v21];

        __int16 v22 = [v15 secondEvent];
        NSUInteger v23 = [v22 identifier];
        __int16 v24 = [v9 objectForKeyedSubscript:v23];

        if (!v24)
        {
          NSUInteger v25 = objc_opt_new();
          __int16 v26 = [v15 secondEvent];
          v27 = [v26 identifier];
          [v9 setObject:v25 forKeyedSubscript:v27];
        }
        v28 = [v15 secondEvent];
        uint64_t v29 = [v28 identifier];
        v30 = [v9 objectForKeyedSubscript:v29];
        v31 = [v15 firstEvent];
        v32 = [v31 startDate];
        [v30 addObject:v32];
      }
      uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v13);
  }

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __92__ATXMagicalMomentsPredictionScorer_getRelevantAppLaunchCountsAndDateSetFromCorrelationData__block_invoke;
  v35[3] = &unk_1E68AFC08;
  v35[4] = self;
  [v9 enumerateKeysAndObjectsUsingBlock:v35];
  [(NSMutableOrderedSet *)self->_dateSetForDecay sortUsingComparator:&__block_literal_global_78];
  [(ATXMagicalMomentsPredictionScorer *)self computeRelevanceScoresForAllRelevantBundleIds];
}

void __92__ATXMagicalMomentsPredictionScorer_getRelevantAppLaunchCountsAndDateSetFromCorrelationData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  long long v5 = NSNumber;
  id v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 40) setObject:v7 forKeyedSubscript:v6];
}

uint64_t __92__ATXMagicalMomentsPredictionScorer_getRelevantAppLaunchCountsAndDateSetFromCorrelationData__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (BOOL)subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_relevantAppLaunches;
  uint64_t v4 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if (-[NSCountedSet countForObject:](self->_relevantAppLaunches, "countForObject:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11) >= 7)
        {
          uint64_t v9 = __atxlog_handle_default();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
            -[ATXMagicalMomentsPredictionScorer subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions]();
          }

          BOOL v8 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v5 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  __atxlog_handle_default();
  v3 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v3->super.super.super, OS_LOG_TYPE_DEBUG)) {
    -[ATXMagicalMomentsPredictionScorer subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions]();
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (BOOL)subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions
{
  p_totalRelevantLaunchesForAllBundleIds = &self->_totalRelevantLaunchesForAllBundleIds;
  if (self->_totalRelevantLaunchesForAllBundleIds < 0xF
    || (unint64_t)[(NSCountedSet *)self->_relevantAppLaunches count] < 3)
  {
    uint64_t v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(ATXMagicalMomentsPredictionScorer *)(uint64_t)self subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions];
    }
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      [(ATXMagicalMomentsPredictionScorer *)(id *)&self->_relevantAppLaunches subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions];
    }
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)subExpertHasWitnessedEnoughRelevantAppLaunches
{
  if ([(ATXMagicalMomentsPredictionScorer *)self subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions])
  {
    v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ATXMagicalMomentsPredictionScorer subExpertHasWitnessedEnoughRelevantAppLaunches]();
    }
LABEL_7:

    LOBYTE(v4) = 1;
    return v4;
  }
  BOOL v4 = [(ATXMagicalMomentsPredictionScorer *)self subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions];
  if (v4)
  {
    v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ATXMagicalMomentsPredictionScorer subExpertHasWitnessedEnoughRelevantAppLaunches]();
    }
    goto LABEL_7;
  }
  return v4;
}

- (BOOL)subExpertCanMakeHighConfidencePredictions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NSMutableOrderedSet *)self->_dateSetForDecay count];
  if (v3 >= [(ATXMagicalMomentsPredictionScorer *)self minimumNumberOfDaysOfObservationsRequiredForSubExpertToMakePredictions])
  {
    if ([(ATXMagicalMomentsPredictionScorer *)self subExpertHasWitnessedEnoughRelevantAppLaunches])
    {
      return 1;
    }
    BOOL v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      uint64_t v6 = "ATXMM: Subexpert has not observed enough relevant app launches to confidently make predictions.";
      id v7 = v4;
      uint32_t v8 = 2;
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(NSMutableOrderedSet *)self->_dateSetForDecay count];
      int v10 = 134218240;
      uint64_t v11 = v5;
      __int16 v12 = 2048;
      unint64_t v13 = [(ATXMagicalMomentsPredictionScorer *)self minimumNumberOfDaysOfObservationsRequiredForSubExpertToMakePredictions];
      uint64_t v6 = "ATXMM: Subexpert has only been observed on %lu unique days. Minimum days required is %lu.";
      id v7 = v4;
      uint32_t v8 = 22;
LABEL_8:
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }

  return 0;
}

- (BOOL)subExpertCanMakeHighConfidencePredictionsForBundleId:(id)a3
{
  relevantAppLaunches = self->_relevantAppLaunches;
  id v5 = a3;
  unint64_t v6 = [(NSCountedSet *)relevantAppLaunches countForObject:v5];
  unint64_t v7 = [(NSCountedSet *)self->_globalAppLaunches countForObject:v5];
  uint32_t v8 = [(NSMutableDictionary *)self->_numUniqueAnchorOccurrencesPerCandidate objectForKey:v5];

  unint64_t v9 = [v8 unsignedIntegerValue];
  if (v7 < [(ATXMagicalMomentsPredictionScorer *)self minimumNumberOfGlobalObservationsOfBundleIdForMMScoring])
  {
    int v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ATXMagicalMomentsPredictionScorer subExpertCanMakeHighConfidencePredictionsForBundleId:]();
    }
LABEL_10:

    return 0;
  }
  if (v6 < [(ATXMagicalMomentsPredictionScorer *)self minimumNumberOfRelevantObservationsOfBundleIdForMMScoring])
  {
    int v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ATXMagicalMomentsPredictionScorer subExpertCanMakeHighConfidencePredictionsForBundleId:]();
    }
    goto LABEL_10;
  }
  if (v9 < [(ATXMagicalMomentsPredictionScorer *)self minimumNumberOfUniqueAnchorOccurrencesForBundleIdForMMScoring])
  {
    int v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ATXMagicalMomentsPredictionScorer subExpertCanMakeHighConfidencePredictionsForBundleId:]();
    }
    goto LABEL_10;
  }
  return 1;
}

- (id)relevanceScoreForBundleId:(id)a3
{
  relevantAppLaunches = self->_relevantAppLaunches;
  id v5 = a3;
  unint64_t v6 = [(NSCountedSet *)relevantAppLaunches countForObject:v5];
  double v7 = (double)v6 / (double)[(NSCountedSet *)self->_globalAppLaunches countForObject:v5];
  BOOL v8 = [(ATXMagicalMomentsPredictionScorer *)self subExpertCanMakeHighConfidencePredictionsForBundleId:v5];

  if (!v8)
  {
    unint64_t v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ATXMagicalMomentsPredictionScorer relevanceScoreForBundleId:]();
    }

    [(ATXMagicalMomentsPredictionScorer *)self minimumRelevanceWeightForMMScoring];
    double v7 = v7 * v10;
  }
  [(ATXMagicalMomentsPredictionScorer *)self maximumRelevanceWeightForMMScoring];
  if (v7 > v11)
  {
    [(ATXMagicalMomentsPredictionScorer *)self maximumRelevanceWeightForMMScoring];
    double v7 = v12;
  }
  unint64_t v13 = [NSNumber numberWithDouble:v7];
  return v13;
}

- (id)generatePredictions
{
  if (self->_finalPredictionConfidences)
  {
LABEL_16:
    double v11 = [(ATXMagicalMomentsPredictionScorer *)self getPredictionsFromFinalConfidences];
    goto LABEL_17;
  }
  unint64_t v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ATXMagicalMomentsPredictionScorer generatePredictions].cold.6();
  }

  [(ATXMagicalMomentsPredictionScorer *)self getRelevantAppLaunchCountsAndDateSetFromCorrelationData];
  BOOL v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ATXMagicalMomentsPredictionScorer generatePredictions].cold.5();
  }

  BOOL v5 = [(ATXMagicalMomentsPredictionScorer *)self subExpertCanMakeHighConfidencePredictions];
  unint64_t v6 = __atxlog_handle_default();
  double v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ATXMagicalMomentsPredictionScorer generatePredictions].cold.4();
    }

    [(ATXMagicalMomentsPredictionScorer *)self computeTimeDecayedCumulativeScores];
    BOOL v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ATXMagicalMomentsPredictionScorer generatePredictions]();
    }

    [(ATXMagicalMomentsPredictionScorer *)self scaleAllScoresWithTopScoringFactor];
    unint64_t v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ATXMagicalMomentsPredictionScorer generatePredictions]();
    }

    [(ATXMagicalMomentsPredictionScorer *)self computeModelConfidences];
    double v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ATXMagicalMomentsPredictionScorer generatePredictions]();
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v13 = 0;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_INFO, "ATXMM: Failed to meet quality control criteria. Nothing to predict for this sub-expert!", v13, 2u);
  }

  double v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_17:
  return v11;
}

- (void)computeTimeDecayedCumulativeScores
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (!self->_cumulativeScoresWithDecayedWeightsByIdentifier)
  {
    unint64_t v3 = (NSMutableDictionary *)objc_opt_new();
    cumulativeScoresWithDecayedWeightsByIdentifier = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
    self->_cumulativeScoresWithDecayedWeightsByIdentifier = v3;

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obuint64_t j = self->_correlatedEvents;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v75 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v61 != v7) {
            objc_enumerationMutation(obj);
          }
          unint64_t v9 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          double v10 = [v9 firstEvent];
          double v11 = [v10 startDate];
          double v12 = [(ATXMagicalMomentsPredictionScorer *)self startOfDayForDate:v11];

          long double v13 = (double)(unint64_t)[(NSMutableOrderedSet *)self->_dateSetForDecay indexOfObject:v12];
          relevanceWeightsByIdentifier = self->_relevanceWeightsByIdentifier;
          long long v15 = [v9 secondEvent];
          uint64_t v16 = [v15 identifier];
          long long v17 = [(NSMutableDictionary *)relevanceWeightsByIdentifier objectForKeyedSubscript:v16];
          [v17 doubleValue];
          double v19 = v18;
          double v20 = pow(0.99, v13);

          uint64_t v21 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
          __int16 v22 = [v9 secondEvent];
          NSUInteger v23 = [v22 identifier];
          __int16 v24 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:v23];

          if (!v24)
          {
            NSUInteger v25 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
            __int16 v26 = [v9 secondEvent];
            v27 = [v26 identifier];
            [(NSMutableDictionary *)v25 setObject:&unk_1F27F0CD8 forKeyedSubscript:v27];
          }
          v28 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
          uint64_t v29 = [v9 secondEvent];
          v30 = [v29 identifier];
          v31 = [(NSMutableDictionary *)v28 objectForKeyedSubscript:v30];
          [v31 doubleValue];
          double v33 = v20 * v19 + v32;

          uint64_t v34 = [NSNumber numberWithDouble:v33];
          v35 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
          long long v36 = [v9 secondEvent];
          long long v37 = [v36 identifier];
          [(NSMutableDictionary *)v35 setObject:v34 forKeyedSubscript:v37];

          if (!self->_topScoringIdentifier
            || (-[NSMutableDictionary objectForKeyedSubscript:](self->_cumulativeScoresWithDecayedWeightsByIdentifier, "objectForKeyedSubscript:"), long long v38 = objc_claimAutoreleasedReturnValue(), [v38 doubleValue], v40 = v39, v38, v33 > v40))
          {
            uint64_t v41 = [v9 secondEvent];
            v42 = [v41 identifier];
            topScoringIdentifier = self->_topScoringIdentifier;
            self->_topScoringIdentifier = v42;
          }
        }
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v75 count:16];
      }
      while (v6);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v44 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
    uint64_t v45 = [(NSMutableDictionary *)v44 countByEnumeratingWithState:&v56 objects:v74 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v57 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v56 + 1) + 8 * j);
          v50 = __atxlog_handle_default();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            id obja = [(NSCountedSet *)self->_relevantAppLaunches countForObject:v49];
            NSUInteger v51 = [(NSCountedSet *)self->_globalAppLaunches countForObject:v49];
            v52 = [(NSMutableDictionary *)self->_relevanceWeightsByIdentifier objectForKeyedSubscript:v49];
            v53 = [(NSMutableDictionary *)self->_cumulativeScoresWithDecayedWeightsByIdentifier objectForKeyedSubscript:v49];
            *(_DWORD *)buf = 138413314;
            uint64_t v65 = v49;
            __int16 v66 = 2048;
            id v67 = obja;
            __int16 v68 = 2048;
            NSUInteger v69 = v51;
            __int16 v70 = 2112;
            v71 = v52;
            __int16 v72 = 2112;
            v73 = v53;
            _os_log_debug_impl(&dword_1D0FA3000, v50, OS_LOG_TYPE_DEBUG, "ATXMM: ==> bundleId: %@, relevant launches: %lu, global launches: %lu, relevance weight: %@, decayed cumulative score: %@", buf, 0x34u);
          }
        }
        uint64_t v46 = [(NSMutableDictionary *)v44 countByEnumeratingWithState:&v56 objects:v74 count:16];
      }
      while (v46);
    }
  }
}

- (double)scalingFactorFromTopPrediction
{
  unint64_t v3 = [(NSMutableDictionary *)self->_cumulativeScoresWithDecayedWeightsByIdentifier objectForKeyedSubscript:self->_topScoringIdentifier];
  [v3 doubleValue];
  double v5 = v4;

  return (double)[(NSCountedSet *)self->_relevantAppLaunches countForObject:self->_topScoringIdentifier]/ v5;
}

- (void)scaleAllScoresWithTopScoringFactor
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "ATXMM: Scaling Factor: %f", (uint8_t *)&v2, 0xCu);
}

- (void)computeModelConfidences
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  double v3 = (NSMutableDictionary *)objc_opt_new();
  finalPredictionConfidences = self->_finalPredictionConfidences;
  self->_finalPredictionConfidences = v3;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v5 = self->_cumulativeScoresWithDecayedWeightsByIdentifier;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v25;
    *(void *)&long long v7 = 134218498;
    long long v23 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(double *)(*((void *)&v24 + 1) + 8 * i);
        double v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_cumulativeScoresWithDecayedWeightsByIdentifier, "objectForKeyedSubscript:", *(void *)&v11, v23);
        [v12 doubleValue];
        double v14 = v13;

        double v15 = v14 + 1.0;
        double v16 = self->_totalScaledCumulativeScoresForAllBundleIds + 1.0 - v14;
        if (v14 + 1.0 < 1.0 && fabs(v15 + -1.0) >= 0.00001 || v16 < 1.0 && fabs(v16 + -1.0) >= 0.00001)
        {
          double v19 = __atxlog_handle_default();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            double totalScaledCumulativeScoresForAllBundleIds = self->_totalScaledCumulativeScoresForAllBundleIds;
            *(_DWORD *)buf = v23;
            double v29 = totalScaledCumulativeScoresForAllBundleIds;
            __int16 v30 = 2048;
            double v31 = v14;
            __int16 v32 = 2112;
            double v33 = v11;
            _os_log_error_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_ERROR, "ERROR: Wrong weight in the model: {totalWeight=%f, appWeight=%f, app=%@}", buf, 0x20u);
          }

          double v18 = 0.0;
        }
        else
        {
          +[ATXMagicalMomentsStatistics calculateModelConfidenceWithCorrectPredictions:v14 + 1.0 incorrectPredictions:self->_totalScaledCumulativeScoresForAllBundleIds + 1.0 - v14];
          double v18 = v17;
        }
        double v20 = [NSNumber numberWithDouble:v18];
        [(NSMutableDictionary *)self->_finalPredictionConfidences setObject:v20 forKeyedSubscript:*(void *)&v11];

        uint64_t v21 = __atxlog_handle_default();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          double v29 = v11;
          __int16 v30 = 2048;
          double v31 = v15;
          __int16 v32 = 2048;
          double v33 = v16;
          __int16 v34 = 2048;
          double v35 = v18;
          _os_log_debug_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEBUG, "ATXMM: ==> bundleId: %@, alpha: %f, beta: %f, confidence: %f", buf, 0x2Au);
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v8);
  }
}

- (id)getPredictionsFromFinalConfidences
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = self->_finalPredictionConfidences;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 138412802;
    long long v18 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        double v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_relevanceWeightsByIdentifier, "objectForKeyedSubscript:", v10, v18, (void)v19);
        [v11 doubleValue];
        double v13 = v12;

        if (v13 >= 0.0)
        {
          double v15 = [ATXMagicalMomentsPrediction alloc];
          double v16 = [(NSMutableDictionary *)self->_finalPredictionConfidences objectForKeyedSubscript:v10];
          [v16 doubleValue];
          double v14 = -[ATXMagicalMomentsPrediction initWithConfidence:predictionIdentifier:](v15, "initWithConfidence:predictionIdentifier:", v10);

          [v3 addObject:v14];
        }
        else
        {
          double v14 = __atxlog_handle_default();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v18;
            uint64_t v24 = v10;
            __int16 v25 = 2048;
            double v26 = v13;
            __int16 v27 = 2048;
            uint64_t v28 = 0;
            _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_INFO, "FILTER: A globally used app would not be suggested. (%@: %f < %f)", buf, 0x20u);
          }
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)startOfDayForDate:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 alloc];
  long long v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v7 = [v6 startOfDayForDate:v4];

  return v7;
}

- (unint64_t)minimumNumberOfDaysOfObservationsRequiredForSubExpertToMakePredictions
{
  return 3;
}

- (unint64_t)minimumNumberOfRelevantObservationsOfBundleIdForMMScoring
{
  return 3;
}

- (unint64_t)minimumNumberOfUniqueAnchorOccurrencesForBundleIdForMMScoring
{
  return 3;
}

- (unint64_t)minimumNumberOfGlobalObservationsOfBundleIdForMMScoring
{
  return 5;
}

- (double)minimumRelevanceWeightForMMScoring
{
  return 0.01;
}

- (double)maximumRelevanceWeightForMMScoring
{
  return 0.6;
}

- (id)dateSetForDecay
{
  return self->_dateSetForDecay;
}

- (id)relevantAppLaunches
{
  return self->_relevantAppLaunches;
}

- (unint64_t)totalRelevantLaunchesForAllBundleIds
{
  return self->_totalRelevantLaunchesForAllBundleIds;
}

- (id)relevanceWeightsByIdentifier
{
  return self->_relevanceWeightsByIdentifier;
}

- (id)cumulativeScoresWithDecayedWeightsByIdentifier
{
  return self->_cumulativeScoresWithDecayedWeightsByIdentifier;
}

- (id)topScoringIdentifier
{
  return self->_topScoringIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalPredictionConfidences, 0);
  objc_storeStrong((id *)&self->_cumulativeScoresWithDecayedWeightsByIdentifier, 0);
  objc_storeStrong((id *)&self->_dateSetForDecay, 0);
  objc_storeStrong((id *)&self->_topScoringIdentifier, 0);
  objc_storeStrong((id *)&self->_relevanceWeightsByIdentifier, 0);
  objc_storeStrong((id *)&self->_numUniqueAnchorOccurrencesPerCandidate, 0);
  objc_storeStrong((id *)&self->_globalAppLaunches, 0);
  objc_storeStrong((id *)&self->_relevantAppLaunches, 0);
  objc_storeStrong((id *)&self->_correlatedEvents, 0);
}

- (void)subExpertHasObservedEnoughLaunchesForOneAppToMakePredictions
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_6(&dword_1D0FA3000, v0, (uint64_t)v0, "ATXMM: bundleId: %@ has %lu relevantLaunchesForBundleId launches, and makes the expert eligible for training/prediction.", v1);
}

- (void)subExpertHasObservedEnoughLaunchesForMultipleAppsToMakePredictions
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 16) count];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_6(&dword_1D0FA3000, a3, v4, "ATXMM: %lu bundleIds observed for this subexpert with %lu total relevant launches, making the expert ineligible for training/prediction.", v5);
}

- (void)subExpertHasWitnessedEnoughRelevantAppLaunches
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXMM: Subexpert has observed enough events for multiple apps to proceed with making predictions.", v2, v3, v4, v5, v6);
}

- (void)subExpertCanMakeHighConfidencePredictionsForBundleId:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXMM: Can't make a confident prediction for this bundleId because subexpert hasn't seen enough global launches.", v2, v3, v4, v5, v6);
}

- (void)subExpertCanMakeHighConfidencePredictionsForBundleId:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXMM: Can't make a confident prediction for this bundleId because subexpert hasn't seen enough relevant launches.", v2, v3, v4, v5, v6);
}

- (void)subExpertCanMakeHighConfidencePredictionsForBundleId:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXMM: Can't make a confident prediction for this bundleId because it wasn't seen across enough unique anchor occurrences.", v2, v3, v4, v5, v6);
}

- (void)relevanceScoreForBundleId:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_6(&dword_1D0FA3000, v0, (uint64_t)v0, "ATXMM: Can't make a confident prediction for the bundleId with relevantLaunchCount: %lu globalLaunchCount: %lu", v1);
}

- (void)generatePredictions
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "ATXMM: generatePredictions - 1. Compute the relevance score for all apps.", v2, v3, v4, v5, v6);
}

@end