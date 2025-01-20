@interface ATXAnchorModelPhase3Trainer
- (double)endSecondsAfterAnchorGivenHistoricalOffsets:(id)a3;
- (double)endSecondsAfterAnchorGivenHistoricalOffsets:(id)a3 startSecondsAfterAnchor:(double)a4;
- (double)startSecondsAfterAnchorGivenHistoricalOffsets:(id)a3;
- (id)initForAnchor:(id)a3;
- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4;
- (id)trainPhase3ForCandidate:(id)a3;
- (unint64_t)indexOfPercentile:(double)a3 array:(id)a4;
@end

@implementation ATXAnchorModelPhase3Trainer

- (id)initForAnchor:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [(ATXAnchorModelPhase3Trainer *)self initForAnchor:v4 anchorModelDataStoreWrapper:v5];

  return v6;
}

- (id)initForAnchor:(id)a3 anchorModelDataStoreWrapper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAnchorModelPhase3Trainer;
  v9 = [(ATXAnchorModelPhase3Trainer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_anchor, a3);
    objc_storeStrong((id *)&v10->_storeWrapper, a4);
    uint64_t v11 = +[ATXAnchorModelHyperParameters sharedInstance];
    hyperParameters = v10->_hyperParameters;
    v10->_hyperParameters = (ATXAnchorModelHyperParameters *)v11;
  }
  return v10;
}

- (id)trainPhase3ForCandidate:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D25F6CC0]();
  id v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelPhase3Trainer trainPhase3ForCandidate:]((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper secondsAfterAnchorWhenCandidateOccurredForAnchor:self->_anchor candidateId:v4 onlyConsiderFirstOccurrencePerAnchor:1];
  objc_super v14 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_storeWrapper secondsAfterAnchorWhenCandidateOccurredForAnchor:self->_anchor candidateId:v4 onlyConsiderFirstOccurrencePerAnchor:0];
  if (v13 && [v13 count])
  {
    [(ATXAnchorModelPhase3Trainer *)self startSecondsAfterAnchorGivenHistoricalOffsets:v13];
    double v16 = v15;
    -[ATXAnchorModelPhase3Trainer endSecondsAfterAnchorGivenHistoricalOffsets:startSecondsAfterAnchor:](self, "endSecondsAfterAnchorGivenHistoricalOffsets:startSecondsAfterAnchor:", v14);
    double v18 = v17;
    v19 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelPhase3Trainer trainPhase3ForCandidate:]((uint64_t)v4, v19, v20, v21, v22, v23, v24, v25);
    }

    v26 = [[ATXAnchorModelPredictionOffsetFromAnchorOccurrence alloc] initWithStartSecondsAfterAnchor:v16 endSecondsAfterAnchor:v18];
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (double)startSecondsAfterAnchorGivenHistoricalOffsets:(id)a3
{
  hyperParameters = self->_hyperParameters;
  id v5 = a3;
  [(ATXAnchorModelHyperParameters *)hyperParameters percentileForStartOffsetFromAnchorForPhase3];
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", -[ATXAnchorModelPhase3Trainer indexOfPercentile:array:](self, "indexOfPercentile:array:", v5));

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (double)endSecondsAfterAnchorGivenHistoricalOffsets:(id)a3 startSecondsAfterAnchor:(double)a4
{
  [(ATXAnchorModelPhase3Trainer *)self endSecondsAfterAnchorGivenHistoricalOffsets:a3];
  double v7 = v6;
  double v8 = v6 - a4;
  [(ATXAnchorModelHyperParameters *)self->_hyperParameters maxDurationForAnchorModelPredictionInSecondsForPhase3];
  if (v8 > v9)
  {
    uint64_t v10 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelPhase3Trainer endSecondsAfterAnchorGivenHistoricalOffsets:startSecondsAfterAnchor:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    [(ATXAnchorModelHyperParameters *)self->_hyperParameters maxDurationForAnchorModelPredictionInSecondsForPhase3];
    return v18 + a4;
  }
  [(ATXAnchorModelHyperParameters *)self->_hyperParameters minDurationForAnchorModelPredictionInSecondsForPhase3];
  if (v8 < v19)
  {
    uint64_t v20 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelPhase3Trainer endSecondsAfterAnchorGivenHistoricalOffsets:startSecondsAfterAnchor:](v20, v21, v22, v23, v24, v25, v26, v27);
    }

    [(ATXAnchorModelHyperParameters *)self->_hyperParameters minDurationForAnchorModelPredictionInSecondsForPhase3];
    return v18 + a4;
  }
  return v7;
}

- (double)endSecondsAfterAnchorGivenHistoricalOffsets:(id)a3
{
  hyperParameters = self->_hyperParameters;
  id v5 = a3;
  [(ATXAnchorModelHyperParameters *)hyperParameters percentileForEndOffsetFromAnchorForPhase3];
  double v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", -[ATXAnchorModelPhase3Trainer indexOfPercentile:array:](self, "indexOfPercentile:array:", v5));

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (unint64_t)indexOfPercentile:(double)a3 array:(id)a4
{
  id v5 = a4;
  double v6 = v5;
  if (v5 && [v5 count])
  {
    unint64_t v7 = (unint64_t)(ceil((double)(unint64_t)[v6 count] * a3) + -1.0);
  }
  else
  {
    double v8 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelPhase3Trainer indexOfPercentile:array:](v8, a3);
    }

    unint64_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)trainPhase3ForCandidate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)trainPhase3ForCandidate:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)endSecondsAfterAnchorGivenHistoricalOffsets:(uint64_t)a3 startSecondsAfterAnchor:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)endSecondsAfterAnchorGivenHistoricalOffsets:(uint64_t)a3 startSecondsAfterAnchor:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)indexOfPercentile:(os_log_t)log array:(double)a2 .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Tried to compute the %.2f percentile from an empty array.", (uint8_t *)&v2, 0xCu);
}

@end