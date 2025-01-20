@interface _DPSymmetricRAPPORWithOHE
+ (double)binomialPMFForN:(unint64_t)a3 p:(double)a4 x:(unint64_t)a5 logBinomCoef:(double)a6;
+ (double)logBinomialCoefForN:(unint64_t)a3 x:(unint64_t)a4 prevLogBinomCoef:(double)a5;
- (_DPSymmetricRAPPORWithOHE)initWithBatchSize:(unsigned int)a3 localEpsilon:(double)a4 error:(id *)a5;
- (double)localEpsilon;
- (id)approximateDPBudgetForDelta:(double)a3 error:(id *)a4;
- (id)exceedApproximateDPBudget:(id)a3 error:(id *)a4;
- (id)renyiDPBudgetsForAlphas:(id)a3 error:(id *)a4;
- (unsigned)batchSize;
@end

@implementation _DPSymmetricRAPPORWithOHE

- (_DPSymmetricRAPPORWithOHE)initWithBatchSize:(unsigned int)a3 localEpsilon:(double)a4 error:(id *)a5
{
  if (!+[_DPApproximateDP isValidEpsilon:error:](_DPApproximateDP, "isValidEpsilon:error:", a5))
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (a4 > 16.0)
  {
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"Local epsilon %f exceeds the maximum allowed local epsilon %f.", *(void *)&a4, 0x4030000000000000);
    v10 = _DPPrivacyBudgetError(1, v9);

    v11 = +[_DPLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (!a3)
  {
    v10 = _DPPrivacyBudgetError(1, @"Batch size must be greater than 0.");
    v11 = +[_DPLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
LABEL_10:
    }
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
LABEL_11:

    if (a5) {
      *a5 = v10;
    }

    goto LABEL_14;
  }
  v15.receiver = self;
  v15.super_class = (Class)_DPSymmetricRAPPORWithOHE;
  v12 = [(_DPSymmetricRAPPORWithOHE *)&v15 init];
  if (v12)
  {
    v12->_batchSize = a3;
    v12->_localEpsilon = a4;
  }
  self = v12;
  v13 = self;
LABEL_15:

  return v13;
}

- (id)exceedApproximateDPBudget:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 delta];
  v7 = -[_DPSymmetricRAPPORWithOHE approximateDPBudgetForDelta:error:](self, "approximateDPBudgetForDelta:error:", a4);
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "exceed:", v6));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)renyiDPBudgetsForAlphas:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v60;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v60 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v59 + 1) + 8 * i) doubleValue];
          if (!+[_DPRenyiDP isValidAlpha:error:](_DPRenyiDP, "isValidAlpha:error:", a4))
          {
            id v50 = 0;
            id v51 = v7;
            goto LABEL_46;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v59 objects:v63 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    unsigned int v12 = [(_DPSymmetricRAPPORWithOHE *)self batchSize];
    if (v12 > 0x989680)
    {
      v13 = +[_DPLog framework];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[_DPSymmetricRAPPORWithOHE renyiDPBudgetsForAlphas:error:](v13);
      }

      unsigned int v12 = 10000000;
    }
    id v58 = v6;
    [(_DPSymmetricRAPPORWithOHE *)self localEpsilon];
    double v15 = exp(v14);
    [(_DPSymmetricRAPPORWithOHE *)self localEpsilon];
    double v17 = v15 / (exp(v16) + 1.0);
    uint64_t v18 = [v7 count];
    id v57 = [MEMORY[0x1E4F1CA58] dataWithLength:8 * v18];
    uint64_t v19 = [v57 bytes];
    id v56 = [MEMORY[0x1E4F1CA58] dataWithLength:8 * v18];
    uint64_t v20 = [v56 bytes];
    uint64_t v21 = v20;
    if (v18)
    {
      v22 = (void *)v20;
      v23 = (void *)v19;
      uint64_t v24 = v18;
      do
      {
        *v22++ = 0xFFF0000000000000;
        *v23++ = 0xFFF0000000000000;
        --v24;
      }
      while (v24);
    }
    unint64_t v25 = 0;
    double v26 = 1.0 - v17;
    unint64_t v27 = v12 - 1;
    uint64_t v28 = v12 + 1;
    double v29 = 0.0;
    double v30 = 0.0;
    do
    {
      double v31 = v29;
      if (v25 <= v27)
      {
        +[_DPSymmetricRAPPORWithOHE logBinomialCoefForN:v27 x:v25 prevLogBinomCoef:v30];
        double v30 = v32;
        +[_DPSymmetricRAPPORWithOHE binomialPMFForN:v27 p:v25 x:1.0 - v17 logBinomCoef:v32];
        double v29 = v33;
      }
      else
      {
        double v29 = 0.0;
      }
      double v34 = v26 * v31 + v17 * v29;
      if (v34 != 0.0)
      {
        double v35 = v17 * v31 + v26 * v29;
        if (v35 != 0.0)
        {
          double v36 = log(v34);
          double v34 = log(v35);
          if (v18)
          {
            double v37 = v34;
            for (uint64_t j = 0; j != v18; ++j)
            {
              v39 = [v7 objectAtIndexedSubscript:j];
              [v39 doubleValue];
              double v41 = v40;

              *(long double *)(v19 + 8 * j) = logaddexp(*(double *)(v19 + 8 * j), v37 * v41 + (1.0 - v41) * v36);
              double v34 = logaddexp(*(double *)(v21 + 8 * j), v36 * v41 + (1.0 - v41) * v37);
              *(double *)(v21 + 8 * j) = v34;
            }
          }
        }
      }
      ++v25;
    }
    while (v25 != v28);
    v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", v18, v34);
    if (v18)
    {
      uint64_t v43 = 0;
      while (1)
      {
        v44 = [v7 objectAtIndexedSubscript:v43];
        [v44 doubleValue];
        double v46 = v45;

        double v47 = *(double *)(v19 + 8 * v43);
        if (v47 <= *(double *)(v21 + 8 * v43)) {
          double v47 = *(double *)(v21 + 8 * v43);
        }
        v48 = [[_DPRenyiDP alloc] initWithAlpha:a4 tau:v46 error:v47 / (v46 + -1.0) + v47 / (v46 + -1.0)];
        if (!v48) {
          break;
        }
        v49 = v48;
        [v42 addObject:v48];

        if (v18 == ++v43) {
          goto LABEL_33;
        }
      }
      v53 = _DPPrivacyBudgetError(2, @"Failed to analyze Renyi-DP tau. The computed tau is not a finite value.");
      v54 = +[_DPLog framework];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
      }

      id v51 = v57;
      if (a4) {
        *a4 = v53;
      }

      id v50 = 0;
    }
    else
    {
LABEL_33:
      id v50 = v42;
      id v51 = v57;
    }

    id v6 = v58;
  }
  else
  {
    _DPPrivacyBudgetError(1, @"Renyi-DP alpha list cannot be empty");
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    v52 = +[_DPLog framework];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
    }

    if (a4)
    {
      id v51 = v51;
      id v50 = 0;
      *a4 = v51;
    }
    else
    {
      id v50 = 0;
    }
  }
LABEL_46:

  return v50;
}

- (id)approximateDPBudgetForDelta:(double)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (+[_DPApproximateDP isValidDelta:error:](_DPApproximateDP, "isValidDelta:error:"))
  {
    id v7 = +[_DPRenyiDP defaultAlphas];
    uint64_t v8 = [(_DPSymmetricRAPPORWithOHE *)self renyiDPBudgetsForAlphas:v7 error:a4];

    if ([v8 count])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = 0;
        uint64_t v13 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v9);
            }
            double v15 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "approximateDPForDelta:error:", a4, a3, (void)v23);
            if (!v15)
            {

              uint64_t v21 = 0;
              goto LABEL_20;
            }
            long double v16 = v15;
            if (!v12 || ([v15 epsilon], double v18 = v17, objc_msgSend(v12, "epsilon"), v18 < v19))
            {
              id v20 = v16;

              id v12 = v20;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v12 = 0;
      }

      id v12 = v12;
      uint64_t v21 = v12;
LABEL_20:
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  return v21;
}

+ (double)logBinomialCoefForN:(unint64_t)a3 x:(unint64_t)a4 prevLogBinomCoef:(double)a5
{
  double result = 0.0;
  if (a4)
  {
    if (a4 < a3)
    {
      long double v9 = a5 - log((double)a4);
      return v9 + log((double)(a3 - a4 + 1));
    }
  }
  return result;
}

+ (double)binomialPMFForN:(unint64_t)a3 p:(double)a4 x:(unint64_t)a5 logBinomCoef:(double)a6
{
  long double v9 = a6 + (double)a5 * log(a4);
  long double v10 = v9 + (double)(a3 - a5) * log(1.0 - a4);
  return exp(v10);
}

- (unsigned)batchSize
{
  return self->_batchSize;
}

- (double)localEpsilon
{
  return self->_localEpsilon;
}

- (void)renyiDPBudgetsForAlphas:(os_log_t)log error:.cold.3(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 10000000;
  _os_log_debug_impl(&dword_1DC55E000, log, OS_LOG_TYPE_DEBUG, "Cap batch size at %u to keep computation time of symmetric RAPPOR analysis in reasonable range.", (uint8_t *)v1, 8u);
}

@end