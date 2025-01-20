@interface BerylliumBurdenDeterminer
- (BerylliumBurdenDeterminer)initWithAnalyticsEventSubmissionManager:(id)a3;
- (id)burdenForTachogramClassifications:(id)a3 calculationType:(int64_t)a4 calculationTypeContext:(id)a5 error:(id *)a6;
@end

@implementation BerylliumBurdenDeterminer

- (BerylliumBurdenDeterminer)initWithAnalyticsEventSubmissionManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BerylliumBurdenDeterminer;
  v6 = [(BerylliumBurdenDeterminer *)&v10 init];
  if (v6)
  {
    v7 = (ABAfibBurdenAnalyzer *)objc_alloc_init(MEMORY[0x1E4F49EA8]);
    analyzer = v6->_analyzer;
    v6->_analyzer = v7;

    objc_storeStrong((id *)&v6->_analyticsEventSubmissionManager, a3);
  }

  return v6;
}

- (id)burdenForTachogramClassifications:(id)a3 calculationType:(int64_t)a4 calculationTypeContext:(id)a5 error:(id *)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (![MEMORY[0x1E4F2B860] isAppleInternalInstall]) {
    goto LABEL_17;
  }
  v12 = HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride();
  if (v12)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F67D88]), "initWithBurdenPercentage:burdenPercentageWasClampedToLowerBound:unavailabilityReason:", 0, 0, objc_msgSend(v12, "integerValue"));
  }
  else
  {
    v14 = HKHRAFibBurdenAnalysisPercentageOverride();
    v15 = v14;
    if (v14)
    {
      v16 = a6;
      unint64_t v17 = [v14 integerValue];
      uint64_t v18 = v17;
      if (v17 >= 0x65)
      {
        _HKInitializeLogging();
        v25 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[BerylliumBurdenDeterminer burdenForTachogramClassifications:calculationType:calculationTypeContext:error:].cold.4(v18, v25);
        }

        v13 = 0;
      }
      else
      {
        BOOL v19 = v17 < 3;
        uint64_t v20 = v17 >= 3 ? v17 : 2;
        id v21 = objc_alloc(MEMORY[0x1E4F67D88]);
        [NSNumber numberWithDouble:(double)v20 / 100.0];
        id v22 = v11;
        v24 = int64_t v23 = a4;
        v13 = (void *)[v21 initWithBurdenPercentage:v24 burdenPercentageWasClampedToLowerBound:v19 unavailabilityReason:0];

        a4 = v23;
        id v11 = v22;
      }
      a6 = v16;
    }
    else
    {
      v13 = 0;
    }
  }
  if (!v13)
  {
LABEL_17:
    id v57 = v11;
    int64_t v26 = a4;
    v27 = objc_msgSend(v10, "hk_map:", &__block_literal_global_2, a6);
    v28 = [(ABAfibBurdenAnalyzer *)self->_analyzer determineBurdenForTachogramClassificationBuckets:v27];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v29 = v10;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = 0;
      uint64_t v33 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v59 != v33) {
            objc_enumerationMutation(v29);
          }
          v32 += [*(id *)(*((void *)&v58 + 1) + 8 * i) count];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v31);
    }
    else
    {
      uint64_t v32 = 0;
    }

    if (v28)
    {
      v35 = [v28 burdenPercentage];

      if (!v35)
      {
        switch([v28 unavailabilityReason])
        {
          case 0:
            _HKInitializeLogging();
            v52 = HKHRAFibBurdenLogForCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
              -[BerylliumBurdenDeterminer burdenForTachogramClassifications:calculationType:calculationTypeContext:error:]((uint64_t)self, v52);
            }
            goto LABEL_55;
          case 1:
            id v54 = objc_alloc(MEMORY[0x1E4F67D88]);
            uint64_t v55 = 1;
            goto LABEL_51;
          case 2:
            id v54 = objc_alloc(MEMORY[0x1E4F67D88]);
            uint64_t v55 = 2;
            goto LABEL_51;
          case 3:
            id v54 = objc_alloc(MEMORY[0x1E4F67D88]);
            uint64_t v55 = 3;
LABEL_51:
            v13 = (void *)[v54 initWithBurdenPercentage:0 burdenPercentageWasClampedToLowerBound:0 unavailabilityReason:v55];
            if (!v13) {
              goto LABEL_52;
            }
            goto LABEL_31;
          default:
            _HKInitializeLogging();
            v52 = HKHRAFibBurdenLogForCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
              -[BerylliumBurdenDeterminer burdenForTachogramClassifications:calculationType:calculationTypeContext:error:]((uint64_t)self, v28, v52);
            }
LABEL_55:

            objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unknown error occurred in AFib Burden infrastructure");
            v46 = (HDHRAFibBurdenAnalysisAnalyticsEvent *)(id)objc_claimAutoreleasedReturnValue();
            id v11 = v57;
            if (v46)
            {
              if (v56) {
                void *v56 = v46;
              }
              else {
                _HKLogDroppedError();
              }
            }

            goto LABEL_42;
        }
      }
      v36 = [v28 burdenPercentage];
      [v36 floatValue];
      float v38 = v37 - *MEMORY[0x1E4F49EA0];

      float v39 = -v38;
      if (v38 >= 0.0) {
        float v39 = v38;
      }
      BOOL v40 = v39 < 2.2204e-16;
      id v41 = objc_alloc(MEMORY[0x1E4F67D88]);
      v42 = [v28 burdenPercentage];
      v13 = (void *)[v41 initWithBurdenPercentage:v42 burdenPercentageWasClampedToLowerBound:v40 unavailabilityReason:0];

      if (!v13)
      {
LABEL_52:
        id v11 = v57;
        goto LABEL_44;
      }
LABEL_31:
      v43 = [HDHRAFibBurdenAnalysisAnalyticsEvent alloc];
      v44 = [v28 metricsForCoreAnalytics];
      int64_t v45 = v26;
      id v11 = v57;
      v46 = [(HDHRAFibBurdenAnalysisAnalyticsEvent *)v43 initWithResult:v13 calculationType:v45 calculationTypeDetails:v57 numberOfTachograms:v32 additionalPayloadFromAlgorithm:v44];

      [(HKAnalyticsEventSubmissionManager *)self->_analyticsEventSubmissionManager submitEvent:v46 error:0];
    }
    else
    {
      _HKInitializeLogging();
      v47 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[BerylliumBurdenDeterminer burdenForTachogramClassifications:calculationType:calculationTypeContext:error:]((uint64_t)self, v47);
      }

      v48 = [HDHRAFibBurdenAnalysisAnalyticsEvent alloc];
      int64_t v49 = v26;
      id v11 = v57;
      v46 = [(HDHRAFibBurdenAnalysisAnalyticsEvent *)v48 initWithResult:0 calculationType:v49 calculationTypeDetails:v57 numberOfTachograms:v32 additionalPayloadFromAlgorithm:0];
      [(HKAnalyticsEventSubmissionManager *)self->_analyticsEventSubmissionManager submitEvent:v46 error:0];
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Infrastructure error when determining AFib Burden value");
      id v50 = (id)objc_claimAutoreleasedReturnValue();
      v51 = v50;
      if (v50)
      {
        if (v56) {
          void *v56 = v50;
        }
        else {
          _HKLogDroppedError();
        }
      }

LABEL_42:
      v13 = 0;
    }

LABEL_44:
  }

  return v13;
}

uint64_t __108__BerylliumBurdenDeterminer_burdenForTachogramClassifications_calculationType_calculationTypeContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_map:", &__block_literal_global_280);
}

uint64_t __108__BerylliumBurdenDeterminer_burdenForTachogramClassifications_calculationType_calculationTypeContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 tachogramClassification];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);

  objc_storeStrong((id *)&self->_analyzer, 0);
}

- (void)burdenForTachogramClassifications:(uint64_t)a1 calculationType:(NSObject *)a2 calculationTypeContext:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_ERROR, "[%@] Nil result received from Beryllium, implying infrastructure error", (uint8_t *)&v2, 0xCu);
}

- (void)burdenForTachogramClassifications:(NSObject *)a3 calculationType:calculationTypeContext:error:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 unavailabilityReason];
  _os_log_fault_impl(&dword_1D3AC6000, a3, OS_LOG_TYPE_FAULT, "[%@] Unexpected unavailability reason given: %lu", (uint8_t *)&v4, 0x16u);
}

- (void)burdenForTachogramClassifications:(uint64_t)a1 calculationType:(NSObject *)a2 calculationTypeContext:error:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_FAULT, "[%@] No burden percentage given but also no unavailability reason", (uint8_t *)&v2, 0xCu);
}

- (void)burdenForTachogramClassifications:(uint64_t)a1 calculationType:(NSObject *)a2 calculationTypeContext:error:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3AC6000, a2, OS_LOG_TYPE_ERROR, "Invalid percentage given for HKHRAFibBurdenAnalysisPercentageOverride: %ld", (uint8_t *)&v2, 0xCu);
}

@end