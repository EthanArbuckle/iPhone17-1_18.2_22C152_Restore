@interface ATXAnchorModelPhase1Trainer
- (BOOL)candidateSatisfiesAllThresholds:(id)a3 trainingResult:(id)a4;
- (BOOL)candidateUniqueAnchorOccurrencesIsAtLeastMinimum:(int64_t)a3 candidateId:(id)a4 trainingResult:(id)a5;
- (BOOL)classConditionalProbabilityOfAnchorIsAtLeastMinimum:(double)a3 candidateId:(id)a4 trainingResult:(id)a5;
- (BOOL)posteriorProbabilityConditionedOnAnchorIsAtLeastMinimum:(double)a3 candidateId:(id)a4 trainingResult:(id)a5;
- (double)anchorPopularityForCandidate:(id)a3;
- (double)classConditionalProbabilityOfAnchorForCandidate:(id)a3;
- (double)globalPopularityForCandidate:(id)a3;
- (double)posteriorProbabilityConditionedOnAnchorForCandidate:(id)a3;
- (double)standardDeviationOfNumbers:(id)a3;
- (double)standardDeviationOfSecondsAfterAnchorForFirstOccurrenceOfCandidateId:(id)a3;
- (id)initForAnchor:(id)a3;
- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4;
- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4 hyperParameters:(id)a5 tracker:(id)a6;
- (id)selectedPredictionCandidates;
- (id)uniqueCandidateIdsThatOccurredAfterAnchor;
- (void)_logPredictionsFilteredDuringPhase1WithCandidateIdsToConsider:(id)a3 selectedCandidates:(id)a4;
- (void)uniqueCandidateIdsThatOccurredAfterAnchor;
@end

@implementation ATXAnchorModelPhase1Trainer

- (id)initForAnchor:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(ATXAnchorModelPhase1Trainer *)self initForAnchor:v4 anchorModelDataStoreWrapper:v5];

  return v6;
}

- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[ATXAnchorModelHyperParameters sharedInstance];
  v9 = objc_opt_new();
  id v10 = [(ATXAnchorModelPhase1Trainer *)self initForAnchor:v7 anchorModelDataStoreWrapper:v6 hyperParameters:v8 tracker:v9];

  return v10;
}

- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4 hyperParameters:(id)a5 tracker:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXAnchorModelPhase1Trainer;
  v15 = [(ATXAnchorModelPhase1Trainer *)&v18 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_anchor, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (id)selectedPredictionCandidates
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(ATXAnchorModelPhase1Trainer *)self uniqueCandidateIdsThatOccurredAfterAnchor];
  v5 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Phase 1: Starting training...", buf, 2u);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v54;
    v47 = @"linkaction";
    uint64_t v48 = *(void *)v54;
    v49 = v3;
    do
    {
      uint64_t v9 = 0;
      uint64_t v50 = v7;
      do
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v53 + 1) + 8 * v9);
        v52 = (void *)MEMORY[0x1D25F6CC0]();
        id v11 = objc_opt_new();
        BOOL v12 = [(ATXAnchorModelPhase1Trainer *)self candidateSatisfiesAllThresholds:v10 trainingResult:v11];
        id v13 = __atxlog_handle_anchor();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v59 = v10;
            _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate: %@ satisfies all thresholds.", buf, 0xCu);
          }

          v15 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper candidateTypeForCandidateId:v10];
          int v16 = [v15 isEqualToString:@"app"];

          storeWrapper = self->_storeWrapper;
          if (v16)
          {
            objc_super v18 = objc_opt_new();
            v19 = [(ATXAnchorModelDataStoreWrapperProtocol *)storeWrapper appLaunchDuetEventFromCandidateId:v10 date:v18];

            v20 = objc_opt_new();
            v57 = v19;
            v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
            v22 = objc_opt_new();
            v23 = [v20 historyForAppLaunchDuetEvents:v21 anchorOccurrenceDate:v22];
            v24 = [v23 objectAtIndexedSubscript:0];
            [v11 setLaunchHistory:v24];

            goto LABEL_26;
          }
          v25 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper candidateTypeForCandidateId:v10];
          int v26 = [v25 isEqualToString:@"action"];

          v27 = self->_storeWrapper;
          if (!v26)
          {
            v30 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper candidateTypeForCandidateId:v10];
            int v31 = [v30 isEqualToString:@"mode"];

            v32 = self->_storeWrapper;
            if (v31)
            {
              v33 = objc_opt_new();
              v19 = [(ATXAnchorModelDataStoreWrapperProtocol *)v32 modeBiomeEventFromCandidateId:v10 date:v33];

              if (!v19)
              {
                v43 = __atxlog_handle_anchor();
                v3 = v49;
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v59 = v10;
                  _os_log_impl(&dword_1D0FA3000, v43, OS_LOG_TYPE_DEFAULT, "Skipping candidate because we were unable to access the BMStoreEvent for the candidate. candidateId: %@", buf, 0xCu);
                }
LABEL_37:

                uint64_t v7 = v50;
                goto LABEL_30;
              }
              v20 = objc_opt_new();
              v21 = objc_opt_new();
              uint64_t v29 = [v20 historyForModeChangeEvent:v19 anchorOccurrenceDate:v21];
              goto LABEL_25;
            }
            v34 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper candidateTypeForCandidateId:v10];
            int v35 = [v34 isEqualToString:v47];

            if (v35)
            {
              v36 = self->_storeWrapper;
              v37 = objc_opt_new();
              v19 = [(ATXAnchorModelDataStoreWrapperProtocol *)v36 linkActionBiomeEventFromCandidateId:v10 date:v37];

              if (!v19)
              {
                v43 = __atxlog_handle_anchor();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v59 = v10;
                  _os_log_impl(&dword_1D0FA3000, v43, OS_LOG_TYPE_DEFAULT, "Skipping candidate because we were unable to access the BMStoreEvent for the candidate. candidateId: %@", buf, 0xCu);
                }
                goto LABEL_37;
              }
              v20 = objc_opt_new();
              v21 = objc_opt_new();
              uint64_t v29 = [v20 historyForLinkActionChangeEvent:v19 anchorOccurrenceDate:v21];
              goto LABEL_25;
            }
LABEL_27:
            v38 = __atxlog_handle_anchor();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v59 = v10;
              _os_log_impl(&dword_1D0FA3000, v38, OS_LOG_TYPE_DEFAULT, "Phase 1: ✅ (YES) Candidate: %@ selected to pass Phase 1.", buf, 0xCu);
            }

            [v11 setCandidateId:v10];
            v39 = self->_storeWrapper;
            v40 = [(ATXAnchor *)self->_anchor anchorTypeString];
            v41 = [(ATXAnchor *)self->_anchor anchorEventIdentifier];
            [(ATXAnchorModelDataStoreWrapperProtocol *)v39 assignMetricsForTrainingResult:v11 anchorType:v40 anchorEventIdentifier:v41 candidateId:v10];

            [v3 addObject:v11];
            goto LABEL_30;
          }
          v28 = objc_opt_new();
          v19 = [(ATXAnchorModelDataStoreWrapperProtocol *)v27 appIntentDuetEventFromCandidateId:v10 date:v28];

          if (v19)
          {
            v20 = objc_opt_new();
            v21 = objc_opt_new();
            uint64_t v29 = [v20 historyForActionUUIDWithAppIntentDuetEvent:v19 anchorOccurrenceDate:v21];
LABEL_25:
            v22 = (void *)v29;
            objc_msgSend(v11, "setLaunchHistory:", v29, v47);
LABEL_26:

            uint64_t v8 = v48;
            v3 = v49;
            uint64_t v7 = v50;
            goto LABEL_27;
          }
          v42 = __atxlog_handle_anchor();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v59 = v10;
            _os_log_impl(&dword_1D0FA3000, v42, OS_LOG_TYPE_DEFAULT, "Skipping candidate because we were unable to access the DuetEvent for the candidate. candidateId: %@", buf, 0xCu);
          }

          v3 = v49;
          uint64_t v7 = v50;
        }
        else
        {
          if (v14)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v59 = v10;
            _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Phase 1: ❌ (NO) Candidate: %@ rejected in Phase 1.", buf, 0xCu);
          }
        }
LABEL_30:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v44 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
      uint64_t v7 = v44;
    }
    while (v44);
  }

  v45 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v45, OS_LOG_TYPE_DEFAULT, "Phase 1: Done training.", buf, 2u);
  }

  [(ATXAnchorModelPhase1Trainer *)self _logPredictionsFilteredDuringPhase1WithCandidateIdsToConsider:obj selectedCandidates:v3];
  return v3;
}

- (BOOL)candidateSatisfiesAllThresholds:(id)a3 trainingResult:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForCandidate:v6 anchor:self->_anchor];
  [v7 setNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence:v8];
  uint64_t v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated unique anchor occurrences", (uint8_t *)&v31, 2u);
  }

  if (![(ATXAnchorModelPhase1Trainer *)self candidateUniqueAnchorOccurrencesIsAtLeastMinimum:[(ATXAnchorModelHyperParameters *)self->_hyperParameters minUniqueAnchorOccurrencesForAnchorForPhase1] candidateId:v6 trainingResult:v7])goto LABEL_23; {
  [(ATXAnchorModelPhase1Trainer *)self classConditionalProbabilityOfAnchorForCandidate:v6];
  }
  uint64_t v11 = v10;
  objc_msgSend(v7, "setClassConditionalProbability:");
  BOOL v12 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated class conditional probability", (uint8_t *)&v31, 2u);
  }

  [(ATXAnchorModelPhase1Trainer *)self posteriorProbabilityConditionedOnAnchorForCandidate:v6];
  double v14 = v13;
  objc_msgSend(v7, "setPosteriorProbability:");
  v15 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated posterior probability", (uint8_t *)&v31, 2u);
  }

  [(ATXAnchorModelHyperParameters *)self->_hyperParameters minClassConditionalProbabilityForCandidateForPhase1];
  if (!-[ATXAnchorModelPhase1Trainer classConditionalProbabilityOfAnchorIsAtLeastMinimum:candidateId:trainingResult:](self, "classConditionalProbabilityOfAnchorIsAtLeastMinimum:candidateId:trainingResult:", v6, v7))
  {
    [(ATXAnchorModelHyperParameters *)self->_hyperParameters minPosteriorProbabilityToIgnoreClassConditionalProbabilityForCandidateForPhase1];
    if (v14 <= v16)
    {
LABEL_23:
      BOOL v29 = 0;
      goto LABEL_24;
    }
    v17 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      [(ATXAnchorModelHyperParameters *)self->_hyperParameters minPosteriorProbabilityToIgnoreClassConditionalProbabilityForCandidateForPhase1];
      int v31 = 138412802;
      id v32 = v6;
      __int16 v33 = 2048;
      double v34 = v14;
      __int16 v35 = 2048;
      uint64_t v36 = v18;
      _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate %@ posterior probability (%.2f) is high enough to proceed even though the class conditional probability requirement is not met. High threshold: %.2f", (uint8_t *)&v31, 0x20u);
    }
  }
  [(ATXAnchorModelHyperParameters *)self->_hyperParameters minPosteriorProbabilityForCandidateForPhase1];
  if (!-[ATXAnchorModelPhase1Trainer posteriorProbabilityConditionedOnAnchorIsAtLeastMinimum:candidateId:trainingResult:](self, "posteriorProbabilityConditionedOnAnchorIsAtLeastMinimum:candidateId:trainingResult:", v6, v7))goto LABEL_23; {
  [(ATXAnchorModelPhase1Trainer *)self standardDeviationOfSecondsAfterAnchorForFirstOccurrenceOfCandidateId:v6];
  }
  uint64_t v20 = v19;
  objc_msgSend(v7, "setStandardDeviationOfOffsetFromAnchor:");
  v21 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated standard deviation of offset from anchor", (uint8_t *)&v31, 2u);
  }

  [(ATXAnchorModelPhase1Trainer *)self anchorPopularityForCandidate:v6];
  uint64_t v23 = v22;
  objc_msgSend(v7, "setAnchorPopularity:");
  v24 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated anchor popularity", (uint8_t *)&v31, 2u);
  }

  [(ATXAnchorModelPhase1Trainer *)self globalPopularityForCandidate:v6];
  uint64_t v26 = v25;
  objc_msgSend(v7, "setGlobalPopularity:");
  v27 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "Phase 1: calculated global popularity", (uint8_t *)&v31, 2u);
  }

  v28 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 138413826;
    id v32 = v6;
    __int16 v33 = 2048;
    double v34 = *(double *)&v8;
    __int16 v35 = 2048;
    uint64_t v36 = v11;
    __int16 v37 = 2048;
    double v38 = v14;
    __int16 v39 = 2048;
    uint64_t v40 = v20;
    __int16 v41 = 2048;
    uint64_t v42 = v23;
    __int16 v43 = 2048;
    uint64_t v44 = v26;
    _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate %@ unique anchor occurrence count: %ld, class-conditional probability: %.2f, posterior probability: %.2f, standard deviation in offset from anchor: %.2f, anchorProbability: %.2f, globalPopularity: %.2f", (uint8_t *)&v31, 0x48u);
  }

  BOOL v29 = 1;
LABEL_24:

  return v29;
}

- (BOOL)candidateUniqueAnchorOccurrencesIsAtLeastMinimum:(int64_t)a3 candidateId:(id)a4 trainingResult:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  int64_t v9 = [v8 numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence];
  if (v9 < a3)
  {
    uint64_t v10 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = v7;
      __int16 v14 = 2048;
      int64_t v15 = a3;
      __int16 v16 = 2048;
      uint64_t v17 = [v8 numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence];
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate %@ failed unique anchor occurrence count requirement. Req: %ld, Actual: %ld", (uint8_t *)&v12, 0x20u);
    }
  }
  return v9 >= a3;
}

- (BOOL)classConditionalProbabilityOfAnchorIsAtLeastMinimum:(double)a3 candidateId:(id)a4 trainingResult:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  [v8 classConditionalProbability];
  double v10 = v9;
  if (v9 < a3)
  {
    uint64_t v11 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v8 classConditionalProbability];
      int v14 = 138412802;
      id v15 = v7;
      __int16 v16 = 2048;
      double v17 = a3;
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate %@ failed class conditional probability requirement. Req: %.2f, Actual: %.2f", (uint8_t *)&v14, 0x20u);
    }
  }
  return v10 >= a3;
}

- (double)classConditionalProbabilityOfAnchorForCandidate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper numCandidateOccurrencesInAnchorContextForCandidate:v4 anchor:self->_anchor];
  uint64_t v6 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper numCandidateOccurrencesInAllContextsForCandidate:v4];
  uint64_t v7 = v6;
  if (v6) {
    double v8 = (double)v5 / (double)v6;
  }
  else {
    double v8 = 0.0;
  }
  double v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 138413058;
    id v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    double v18 = v8;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "Phase 1: Candidate: %@. anchorContextCount = %ld, allContextCount = %ld ==> p(anchor | candidate) = %.3f", (uint8_t *)&v11, 0x2Au);
  }

  return v8;
}

- (BOOL)posteriorProbabilityConditionedOnAnchorIsAtLeastMinimum:(double)a3 candidateId:(id)a4 trainingResult:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  [v8 posteriorProbability];
  double v10 = v9;
  if (v9 < a3)
  {
    int v11 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v8 posteriorProbability];
      int v14 = 138412802;
      id v15 = v7;
      __int16 v16 = 2048;
      double v17 = a3;
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Phase 1: Candidate %@ failed posterior probability requirement. Req: %.2f, Actual: %.2f", (uint8_t *)&v14, 0x20u);
    }
  }
  return v10 >= a3;
}

- (double)posteriorProbabilityConditionedOnAnchorForCandidate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper numUniqueAnchorOccurrencesForCandidate:v4 anchor:self->_anchor];
  uint64_t v6 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper numUniqueAnchorOccurrencesForAnchor:self->_anchor candidateId:v4];
  uint64_t v7 = v6;
  if (v6) {
    double v8 = (double)v5 / (double)v6;
  }
  else {
    double v8 = 0.0;
  }
  double v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 138413058;
    id v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    double v18 = v8;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "Phase 1: Candidate: %@. uniqueOccurrencesInAnchorContext = %ld, uniqueAnchorOccurrences = %ld ==> p(candidate | anchor) = %.3f", (uint8_t *)&v11, 0x2Au);
  }

  return v8;
}

- (double)standardDeviationOfSecondsAfterAnchorForFirstOccurrenceOfCandidateId:(id)a3
{
  id v4 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper secondsAfterAnchorWhenCandidateOccurredForAnchor:self->_anchor candidateId:a3 onlyConsiderFirstOccurrencePerAnchor:1];
  [(ATXAnchorModelPhase1Trainer *)self standardDeviationOfNumbers:v4];
  double v6 = v5;

  return v6;
}

- (double)standardDeviationOfNumbers:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (void *)MEMORY[0x1E4F28C68];
    double v5 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v3];
    v12[0] = v5;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    uint64_t v7 = [v4 expressionForFunction:@"stddev:" arguments:v6];

    double v8 = [v7 expressionValueWithObject:0 context:0];
    [v8 doubleValue];
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (id)uniqueCandidateIdsThatOccurredAfterAnchor
{
  p_anchor = (uint64_t *)&self->_anchor;
  id v3 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper uniqueCandidateIdsThatOccurredAfterAnchor:self->_anchor];
  id v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(ATXAnchorModelPhase1Trainer *)p_anchor uniqueCandidateIdsThatOccurredAfterAnchor];
  }

  return v3;
}

- (double)anchorPopularityForCandidate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper numCandidateOccurrencesInAnchorContextForCandidate:v4 anchor:self->_anchor];
  storeWrapper = self->_storeWrapper;
  uint64_t v7 = [(ATXAnchorModelDataStoreWrapperProtocol *)storeWrapper candidateTypeForCandidateId:v4];
  uint64_t v8 = [(ATXAnchorModelDataStoreWrapperProtocol *)storeWrapper numCandidateOccurrencesInAnchorContextForCandidateType:v7 anchor:self->_anchor];

  if (v8) {
    double v9 = (double)v5 / (double)v8;
  }
  else {
    double v9 = 0.0;
  }
  double v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138413058;
    id v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    double v19 = v9;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, "Phase 1: Candidate: %@. occurencesInAnchorContextForCandidate = %ld, occurencesInAnchorContextForAllCandidatesOfSameType = %ld ==> anchorProbability = %.3f", (uint8_t *)&v12, 0x2Au);
  }

  return v9;
}

- (double)globalPopularityForCandidate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper numCandidateOccurrencesInAllContextsForCandidate:v4];
  storeWrapper = self->_storeWrapper;
  uint64_t v7 = [(ATXAnchorModelDataStoreWrapperProtocol *)storeWrapper candidateTypeForCandidateId:v4];
  uint64_t v8 = [(ATXAnchorModelDataStoreWrapperProtocol *)storeWrapper numCandidateOccurrencesInAllContextsForCandidateType:v7];

  if (v8) {
    double v9 = (double)v5 / (double)v8;
  }
  else {
    double v9 = 0.0;
  }
  double v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138413058;
    id v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    double v19 = v9;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, "Phase 1: Candidate: %@. occurencesInAllContextsForCandidate = %ld, occurencesInAllContextsForCandidatesOfSameType = %ld ==> globalPopularity = %.3f", (uint8_t *)&v12, 0x2Au);
  }

  return v9;
}

- (void)_logPredictionsFilteredDuringPhase1WithCandidateIdsToConsider:(id)a3 selectedCandidates:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  [v8 setPhaseDescription:1];
  [v8 setPhaseType:0];
  uint64_t v9 = [v7 count];

  [v8 setNumStartingCandidates:v9];
  uint64_t v10 = [v6 count];

  [v8 setNumEndingCandidates:v10];
  int v11 = [(ATXAnchor *)self->_anchor anchorTypeString];
  [v8 setAnchorType:v11];

  int v12 = [(ATXAnchorModelHyperParameters *)self->_hyperParameters abGroup];
  [v8 setAbGroup:v12];

  [(ATXPETEventTracker2Protocol *)self->_tracker logMessage:v8];
  id v13 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelPhase1Trainer _logPredictionsFilteredDuringPhase1WithCandidateIdsToConsider:selectedCandidates:]((uint64_t)self, v8, v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)uniqueCandidateIdsThatOccurredAfterAnchor
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Phase 1: Unique candidates found after anchor (%@): %@", (uint8_t *)&v4, 0x16u);
}

- (void)_logPredictionsFilteredDuringPhase1WithCandidateIdsToConsider:(NSObject *)a3 selectedCandidates:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  __int16 v6 = NSStringFromClass(v5);
  int v7 = [a2 numStartingCandidates];
  int v8 = [a2 numEndingCandidates];
  uint64_t v9 = [a2 anchorType];
  uint64_t v10 = [a2 abGroup];
  int v11 = 138413314;
  int v12 = v6;
  __int16 v13 = 1024;
  int v14 = v7;
  __int16 v15 = 1024;
  int v16 = v8;
  __int16 v17 = 2112;
  __int16 v18 = v9;
  __int16 v19 = 2112;
  uint64_t v20 = v10;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAnchorModelPhaseFilterTracker for phase 1 with starting candidates: %u ending candidates: %u, anchorType: %@ abGroup: %@", (uint8_t *)&v11, 0x2Cu);
}

@end