@interface _DPDPGaussianMechanismParameter
- (BOOL)isMomentsAccountantAlgorithm;
- (BOOL)isV2;
- (BOOL)isValid;
- (NSDictionary)metadata;
- (_DPDPGaussianMechanismParameter)initWithV1Metadata:(id)a3 maxCentralEpsilon:(double)a4 maxCentralDelta:(double)a5;
- (_DPDPGaussianMechanismParameter)initWithV2Metadata:(id)a3 maxCentralEpsilon:(double)a4 maxCentralDelta:(double)a5;
- (double)clippingBound;
- (double)cohortSigma;
- (double)maxCentralDelta;
- (double)maxCentralEpsilon;
- (double)overallClippingBound;
- (double)overallDelta;
- (double)overallEpsilon;
- (double)sigmaAfterNormalization;
- (id)auditedMetadata;
- (int)numChunks;
- (int)renyiOrder;
- (int64_t)currentCohortSize;
- (int64_t)maxCohortSize;
- (int64_t)numIterations;
- (int64_t)populationSize;
- (void)isValid;
- (void)setCohortSigma:(double)a3;
@end

@implementation _DPDPGaussianMechanismParameter

- (_DPDPGaussianMechanismParameter)initWithV1Metadata:(id)a3 maxCentralEpsilon:(double)a4 maxCentralDelta:(double)a5
{
  id v8 = a3;
  v58.receiver = self;
  v58.super_class = (Class)_DPDPGaussianMechanismParameter;
  v9 = [(_DPDPGaussianMechanismParameter *)&v58 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_43;
  }
  v9->_maxCentralEpsilon = a4;
  v9->_maxCentralDelta = a5;
  v11 = [v8 objectForKeyedSubscript:@"AlgorithmParameters"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v43 = +[_DPLog framework];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[_DPDPGaussianMechanismParameter initWithV1Metadata:maxCentralEpsilon:maxCentralDelta:].cold.4();
    }
    goto LABEL_34;
  }
  v12 = [v11 objectForKeyedSubscript:@"Mechanism"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_25:
    v43 = +[_DPLog framework];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[_DPDPGaussianMechanismParameter initWithV1Metadata:maxCentralEpsilon:maxCentralDelta:](v43, v44, v45, v46, v47, v48, v49, v50);
    }
    goto LABEL_34;
  }
  v13 = [v11 objectForKeyedSubscript:@"Mechanism"];
  char v14 = [v13 isEqualToString:@"GaussianFromSigma"];

  if ((v14 & 1) == 0) {
    goto LABEL_25;
  }
  v15 = [v11 objectForKeyedSubscript:@"OverallEpsilon"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_31:

LABEL_32:
    v43 = +[_DPLog framework];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[_DPDPGaussianMechanismParameter initWithV1Metadata:maxCentralEpsilon:maxCentralDelta:]();
    }
    goto LABEL_34;
  }
  v16 = [v11 objectForKeyedSubscript:@"OverallDelta"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_30:

    goto LABEL_31;
  }
  v17 = [v11 objectForKeyedSubscript:@"ClippingBound"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_29:

    goto LABEL_30;
  }
  v18 = objc_msgSend(v11, "objectForKeyedSubscript:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_28:

    goto LABEL_29;
  }
  v19 = objc_msgSend(v11, "objectForKeyedSubscript:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_28;
  }
  v54 = objc_msgSend(v11, "objectForKeyedSubscript:");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_32;
  }
  v20 = [v11 objectForKeyedSubscript:@"OverallEpsilon"];
  [v20 doubleValue];
  v10->_overallEpsilon = v21;

  v22 = [v11 objectForKeyedSubscript:@"OverallDelta"];
  [v22 doubleValue];
  v10->_overallDelta = v23;

  v24 = [v11 objectForKeyedSubscript:@"SigmaAfterNormalizing"];
  [v24 doubleValue];
  v10->_sigmaAfterNormalization = v25;

  v26 = [v11 objectForKeyedSubscript:@"NumChunks"];
  v10->_numChunks = [v26 intValue];

  v27 = [v11 objectForKeyedSubscript:@"ClippingBound"];
  [v27 doubleValue];
  v10->_clippingBound = v28;

  v29 = [v11 objectForKeyedSubscript:@"OverallClippingBound"];
  [v29 doubleValue];
  v10->_overallClippingBound = v30;

  *(_WORD *)&v10->_isMomentsAccountantAlgorithm = 0;
  uint64_t v31 = [v8 copy];
  metadata = v10->_metadata;
  v10->_metadata = (NSDictionary *)v31;

  v33 = [v11 objectForKeyedSubscript:@"CurrentCohortSize"];
  if (v33
    || ([v11 objectForKeyedSubscript:@"MaxCohortSize"],
        (v33 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v11 objectForKeyedSubscript:@"PopulationSize"],
        (v33 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v11 objectForKeyedSubscript:@"RenyiOrder"],
        (v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v52 = [v11 objectForKeyedSubscript:@"NumIterations"];

    if (!v52) {
      goto LABEL_42;
    }
  }
  v34 = [v11 objectForKeyedSubscript:@"CurrentCohortSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = [v11 objectForKeyedSubscript:@"MaxCohortSize"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [v11 objectForKeyedSubscript:@"PopulationSize"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = objc_msgSend(v11, "objectForKeyedSubscript:");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v56 = objc_msgSend(v11, "objectForKeyedSubscript:");
          objc_opt_class();
          char v57 = objc_opt_isKindOfClass();

          if (v57)
          {
            v10->_isMomentsAccountantAlgorithm = 1;
            v38 = [v11 objectForKeyedSubscript:@"CurrentCohortSize"];
            v10->_currentCohortSize = [v38 longLongValue];

            v39 = [v11 objectForKeyedSubscript:@"MaxCohortSize"];
            v10->_maxCohortSize = [v39 longLongValue];

            v40 = [v11 objectForKeyedSubscript:@"PopulationSize"];
            v10->_populationSize = [v40 longLongValue];

            v41 = [v11 objectForKeyedSubscript:@"NumIterations"];
            v10->_numIterations = [v41 longLongValue];

            v42 = [v11 objectForKeyedSubscript:@"RenyiOrder"];
            v10->_renyiOrder = [v42 intValue];

LABEL_42:
LABEL_43:
            v51 = v10;
            goto LABEL_44;
          }
          goto LABEL_39;
        }
      }
    }
  }
LABEL_39:
  v43 = +[_DPLog framework];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
    -[_DPDPGaussianMechanismParameter initWithV1Metadata:maxCentralEpsilon:maxCentralDelta:]();
  }
LABEL_34:

  v51 = 0;
LABEL_44:

  return v51;
}

- (_DPDPGaussianMechanismParameter)initWithV2Metadata:(id)a3 maxCentralEpsilon:(double)a4 maxCentralDelta:(double)a5
{
  id v8 = a3;
  v63.receiver = self;
  v63.super_class = (Class)_DPDPGaussianMechanismParameter;
  v9 = [(_DPDPGaussianMechanismParameter *)&v63 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_17;
  }
  v9->_maxCentralEpsilon = a4;
  v9->_maxCentralDelta = a5;
  v11 = [v8 objectForKeyedSubscript:@"DediscoTaskConfig"];
  v12 = [v11 objectForKeyedSubscript:@"DPConfig"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v50 = +[_DPLog framework];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[_DPDPGaussianMechanismParameter initWithV2Metadata:maxCentralEpsilon:maxCentralDelta:].cold.4();
    }
    goto LABEL_30;
  }
  v13 = [v12 objectForKeyedSubscript:@"Mechanism"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_21:
    uint64_t v50 = +[_DPLog framework];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[_DPDPGaussianMechanismParameter initWithV2Metadata:maxCentralEpsilon:maxCentralDelta:](v50, v51, v52, v53, v54, v55, v56, v57);
    }
    goto LABEL_30;
  }
  char v14 = [v12 objectForKeyedSubscript:@"Mechanism"];
  char v15 = [v14 isEqualToString:@"GaussianWithSubsampledMomentsAccountant"];

  if ((v15 & 1) == 0) {
    goto LABEL_21;
  }
  v16 = [v12 objectForKeyedSubscript:@"TargetCentralEpsilon"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_27:

LABEL_28:
    uint64_t v50 = +[_DPLog framework];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[_DPDPGaussianMechanismParameter initWithV1Metadata:maxCentralEpsilon:maxCentralDelta:]();
    }
    goto LABEL_30;
  }
  v17 = [v12 objectForKeyedSubscript:@"TargetCentralDelta"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_26:

    goto LABEL_27;
  }
  v18 = objc_msgSend(v12, "objectForKeyedSubscript:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_25:

    goto LABEL_26;
  }
  v19 = objc_msgSend(v12, "objectForKeyedSubscript:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_24:

    goto LABEL_25;
  }
  v61 = v19;
  v20 = objc_msgSend(v12, "objectForKeyedSubscript:");
  objc_opt_class();
  double v21 = v20;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v19 = v61;
    goto LABEL_24;
  }
  v22 = objc_msgSend(v12, "objectForKeyedSubscript:");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_28;
  }
  double v23 = [v12 objectForKeyedSubscript:@"TargetCentralEpsilon"];
  [v23 doubleValue];
  v10->_overallEpsilon = v24;

  double v25 = [v12 objectForKeyedSubscript:@"TargetCentralDelta"];
  [v25 doubleValue];
  v10->_overallDelta = v26;

  v27 = [v12 objectForKeyedSubscript:@"SigmaAfterNormalizing"];
  [v27 doubleValue];
  v10->_sigmaAfterNormalization = v28;

  v29 = [v12 objectForKeyedSubscript:@"NumChunks"];
  v10->_numChunks = [v29 intValue];

  double v30 = [v12 objectForKeyedSubscript:@"ClippingBound"];
  [v30 doubleValue];
  v10->_clippingBound = v31;

  v32 = [v12 objectForKeyedSubscript:@"OverallClippingBound"];
  [v32 doubleValue];
  v10->_overallClippingBound = v33;

  v10->_isMomentsAccountantAlgorithm = 1;
  v34 = [v8 objectForKeyedSubscript:@"DediscoTaskConfig"];
  v35 = [v34 objectForKeyedSubscript:@"MinBatchSize"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_35:

LABEL_36:
    uint64_t v50 = +[_DPLog framework];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[_DPDPGaussianMechanismParameter initWithV1Metadata:maxCentralEpsilon:maxCentralDelta:]();
    }
LABEL_30:

    uint64_t v49 = 0;
    goto LABEL_31;
  }
  v36 = [v12 objectForKeyedSubscript:@"MaxCohortSize"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_34:

    goto LABEL_35;
  }
  v37 = objc_msgSend(v12, "objectForKeyedSubscript:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_33:

    goto LABEL_34;
  }
  v60 = v37;
  v38 = objc_msgSend(v12, "objectForKeyedSubscript:");
  objc_opt_class();
  v62 = v38;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v37 = v60;
    goto LABEL_33;
  }
  v39 = objc_msgSend(v12, "objectForKeyedSubscript:");
  objc_opt_class();
  char v40 = objc_opt_isKindOfClass();

  if ((v40 & 1) == 0) {
    goto LABEL_36;
  }
  v41 = [v8 objectForKeyedSubscript:@"DediscoTaskConfig"];
  v42 = [v41 objectForKeyedSubscript:@"MinBatchSize"];
  v10->_currentCohortSize = [v42 longLongValue];

  v43 = [v12 objectForKeyedSubscript:@"MaxCohortSize"];
  v10->_maxCohortSize = [v43 longLongValue];

  uint64_t v44 = [v12 objectForKeyedSubscript:@"PopulationSize"];
  v10->_populationSize = [v44 longLongValue];

  uint64_t v45 = [v12 objectForKeyedSubscript:@"NumIterations"];
  v10->_numIterations = [v45 longLongValue];

  uint64_t v46 = [v12 objectForKeyedSubscript:@"RenyiOrder"];
  v10->_renyiOrder = [v46 intValue];

  v10->_isV2 = 1;
  uint64_t v47 = [v8 copy];
  metadata = v10->_metadata;
  v10->_metadata = (NSDictionary *)v47;

LABEL_17:
  uint64_t v49 = v10;
LABEL_31:

  return v49;
}

- (BOOL)isValid
{
  [(_DPDPGaussianMechanismParameter *)self overallEpsilon];
  [(_DPDPGaussianMechanismParameter *)self overallDelta];
  [(_DPDPGaussianMechanismParameter *)self sigmaAfterNormalization];
  [(_DPDPGaussianMechanismParameter *)self clippingBound];
  [(_DPDPGaussianMechanismParameter *)self overallClippingBound];
  [(_DPDPGaussianMechanismParameter *)self overallEpsilon];
  if (v3 <= 0.0
    || ([(_DPDPGaussianMechanismParameter *)self overallDelta], v4 <= 0.0)
    || ([(_DPDPGaussianMechanismParameter *)self sigmaAfterNormalization], v5 <= 0.0)
    || ([(_DPDPGaussianMechanismParameter *)self clippingBound], v6 <= 0.0)
    || ([(_DPDPGaussianMechanismParameter *)self overallClippingBound], v7 <= 0.0)
    || [(_DPDPGaussianMechanismParameter *)self numChunks] <= 0)
  {
    v9 = +[_DPLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_DPDPGaussianMechanismParameter isValid]();
    }
    goto LABEL_12;
  }
  [(_DPDPGaussianMechanismParameter *)self sigmaAfterNormalization];
  if (v8 < 0.5)
  {
    v9 = +[_DPLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(_DPDPGaussianMechanismParameter *)v9 isValid];
    }
LABEL_12:

    return 0;
  }
  [(_DPDPGaussianMechanismParameter *)self overallEpsilon];
  double v19 = v18;
  [(_DPDPGaussianMechanismParameter *)self maxCentralEpsilon];
  if (v19 > v20)
  {
    double v21 = +[_DPLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      [(_DPDPGaussianMechanismParameter *)self isValid];
    }
LABEL_20:

    return 0;
  }
  [(_DPDPGaussianMechanismParameter *)self overallDelta];
  double v23 = v22;
  [(_DPDPGaussianMechanismParameter *)self maxCentralDelta];
  if (v23 > v24)
  {
    double v21 = +[_DPLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      [(_DPDPGaussianMechanismParameter *)self isValid];
    }
    goto LABEL_20;
  }
  [(_DPDPGaussianMechanismParameter *)self sigmaAfterNormalization];
  double v26 = v25;
  if ([(_DPDPGaussianMechanismParameter *)self numChunks] >= 2)
  {
    [(_DPDPGaussianMechanismParameter *)self clippingBound];
    double v28 = v27;
    [(_DPDPGaussianMechanismParameter *)self overallClippingBound];
    if (v28 > v29)
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_DPDPGaussianMechanismParameter isValid].cold.5();
      }
      goto LABEL_12;
    }
    [(_DPDPGaussianMechanismParameter *)self sigmaAfterNormalization];
    double v31 = v30;
    [(_DPDPGaussianMechanismParameter *)self clippingBound];
    double v33 = v31 * v32;
    [(_DPDPGaussianMechanismParameter *)self overallClippingBound];
    double v26 = v33 / v34;
    if (fabs(v26) == INFINITY || v26 < 0.5)
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(_DPDPGaussianMechanismParameter *)v9 isValid];
      }
      goto LABEL_12;
    }
  }
  if ([(_DPDPGaussianMechanismParameter *)self isMomentsAccountantAlgorithm])
  {
    if ([(_DPDPGaussianMechanismParameter *)self numIterations] < 1
      || [(_DPDPGaussianMechanismParameter *)self currentCohortSize] < 1
      || [(_DPDPGaussianMechanismParameter *)self maxCohortSize] < 1
      || [(_DPDPGaussianMechanismParameter *)self populationSize] <= 0)
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_DPDPGaussianMechanismParameter isValid].cold.7();
      }
      goto LABEL_12;
    }
    int64_t v35 = [(_DPDPGaussianMechanismParameter *)self currentCohortSize];
    if (v35 > [(_DPDPGaussianMechanismParameter *)self maxCohortSize])
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_DPDPGaussianMechanismParameter isValid].cold.8();
      }
      goto LABEL_12;
    }
    int64_t v48 = [(_DPDPGaussianMechanismParameter *)self maxCohortSize];
    if (v48 > [(_DPDPGaussianMechanismParameter *)self populationSize])
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_DPDPGaussianMechanismParameter isValid].cold.9();
      }
      goto LABEL_12;
    }
    if (fabs(v26) == INFINITY || v26 < 0.5)
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(_DPDPGaussianMechanismParameter *)v9 isValid];
      }
      goto LABEL_12;
    }
    if ([(_DPDPGaussianMechanismParameter *)self renyiOrder] < 2
      || [(_DPDPGaussianMechanismParameter *)self renyiOrder] >= 33)
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_DPDPGaussianMechanismParameter isValid]1(v9);
      }
      goto LABEL_12;
    }
    if ([(_DPDPGaussianMechanismParameter *)self populationSize] >= 1400000001)
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(_DPDPGaussianMechanismParameter *)v9 isValid];
      }
      goto LABEL_12;
    }
    if ([(_DPDPGaussianMechanismParameter *)self numIterations] <= 9)
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_DPDPGaussianMechanismParameter isValid]3(v9);
      }
      goto LABEL_12;
    }
    _DPMomentsAccountantSubSampledRenyiEpsilon([(_DPDPGaussianMechanismParameter *)self renyiOrder], (double)[(_DPDPGaussianMechanismParameter *)self maxCohortSize]/ (double)[(_DPDPGaussianMechanismParameter *)self populationSize], v26);
    id v78 = 0;
    v64 = [[_DPRenyiDP alloc] initWithAlpha:&v78 tau:(double)[(_DPDPGaussianMechanismParameter *)self renyiOrder] error:v63 * (double)[(_DPDPGaussianMechanismParameter *)self numIterations]];
    id v65 = v78;
    if (!v64)
    {
      v75 = +[_DPLog framework];
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
        -[_DPDPGaussianMechanismParameter isValid]4();
      }

      return 0;
    }
    [(_DPDPGaussianMechanismParameter *)self overallDelta];
    id v77 = v65;
    v66 = -[_DPRenyiDP approximateDPForDelta:error:](v64, "approximateDPForDelta:error:", &v77);
    id v67 = v77;

    if (!v66)
    {
      v72 = +[_DPLog framework];
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        -[_DPDPGaussianMechanismParameter isValid]5();
      }
      id v73 = v67;
      goto LABEL_75;
    }
    v68 = [_DPApproximateDP alloc];
    [(_DPDPGaussianMechanismParameter *)self overallEpsilon];
    double v70 = v69;
    [(_DPDPGaussianMechanismParameter *)self overallDelta];
    id v76 = v67;
    v72 = [(_DPApproximateDP *)v68 initWithEpsilon:&v76 delta:v70 error:v71];
    id v73 = v76;

    if (!v72)
    {
      v74 = +[_DPLog framework];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        -[_DPDPGaussianMechanismParameter isValid]6();
      }
      goto LABEL_74;
    }
    if ([v66 exceed:v72])
    {
      v74 = +[_DPLog framework];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        -[_DPDPGaussianMechanismParameter isValid]7();
      }
LABEL_74:

LABEL_75:
      return 0;
    }
  }
  else
  {
    [(_DPDPGaussianMechanismParameter *)self overallEpsilon];
    double v37 = _DPGaussianMechanismMinimumDelta(v36, v26, 1.0);
    [(_DPDPGaussianMechanismParameter *)self overallDelta];
    if (v38 + 0.000000238418579 < v37)
    {
      v9 = +[_DPLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(_DPDPGaussianMechanismParameter *)v9 isValid];
      }
      goto LABEL_12;
    }
  }
  [(_DPDPGaussianMechanismParameter *)self setCohortSigma:v26];
  return 1;
}

- (id)auditedMetadata
{
  if ([(_DPDPGaussianMechanismParameter *)self isValid])
  {
    BOOL v3 = [(_DPDPGaussianMechanismParameter *)self isV2];
    double v4 = [(_DPDPGaussianMechanismParameter *)self metadata];
    double v5 = v4;
    if (v3)
    {
      double v6 = [v4 objectForKeyedSubscript:@"DediscoTaskConfig"];
      double v7 = [v6 objectForKeyedSubscript:@"DPConfig"];
      double v8 = (void *)[v7 mutableCopy];

      v9 = NSNumber;
      [(_DPDPGaussianMechanismParameter *)self cohortSigma];
      uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
      [v8 setObject:v10 forKeyedSubscript:@"CohortSigma"];

      uint64_t v11 = [(_DPDPGaussianMechanismParameter *)self metadata];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"DediscoTaskConfig"];
      uint64_t v13 = (void *)[v12 mutableCopy];

      [v13 setObject:v8 forKeyedSubscript:@"DPConfig"];
      uint64_t v14 = [(_DPDPGaussianMechanismParameter *)self metadata];
      double v5 = (void *)[v14 mutableCopy];

      [v5 setObject:v13 forKeyedSubscript:@"DediscoTaskConfig"];
    }
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (double)cohortSigma
{
  return self->_cohortSigma;
}

- (void)setCohortSigma:(double)a3
{
  self->_cohortSigma = a3;
}

- (double)maxCentralEpsilon
{
  return self->_maxCentralEpsilon;
}

- (double)maxCentralDelta
{
  return self->_maxCentralDelta;
}

- (double)overallEpsilon
{
  return self->_overallEpsilon;
}

- (double)overallDelta
{
  return self->_overallDelta;
}

- (double)sigmaAfterNormalization
{
  return self->_sigmaAfterNormalization;
}

- (int)numChunks
{
  return self->_numChunks;
}

- (double)clippingBound
{
  return self->_clippingBound;
}

- (double)overallClippingBound
{
  return self->_overallClippingBound;
}

- (BOOL)isMomentsAccountantAlgorithm
{
  return self->_isMomentsAccountantAlgorithm;
}

- (int64_t)currentCohortSize
{
  return self->_currentCohortSize;
}

- (int64_t)maxCohortSize
{
  return self->_maxCohortSize;
}

- (int64_t)populationSize
{
  return self->_populationSize;
}

- (int64_t)numIterations
{
  return self->_numIterations;
}

- (int)renyiOrder
{
  return self->_renyiOrder;
}

- (BOOL)isV2
{
  return self->_isV2;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
}

- (void)initWithV1Metadata:maxCentralEpsilon:maxCentralDelta:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Malformed moments accountant algorithm parameters from donation.", v2, v3, v4, v5, v6);
}

- (void)initWithV1Metadata:maxCentralEpsilon:maxCentralDelta:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Malformed algorithm parameters from donation.", v2, v3, v4, v5, v6);
}

- (void)initWithV1Metadata:(uint64_t)a3 maxCentralEpsilon:(uint64_t)a4 maxCentralDelta:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithV1Metadata:maxCentralEpsilon:maxCentralDelta:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Malformed metadata entry %@.", v2, v3, v4, v5, v6);
}

- (void)initWithV2Metadata:(uint64_t)a3 maxCentralEpsilon:(uint64_t)a4 maxCentralDelta:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithV2Metadata:maxCentralEpsilon:maxCentralDelta:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1DC55E000, v0, (uint64_t)v0, "Malformed metadata entry %@.%@", v1);
}

- (void)isValid
{
}

@end