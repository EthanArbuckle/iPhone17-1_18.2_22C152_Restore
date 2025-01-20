@interface _DPBudgetAuditor
+ (BOOL)checkMetadataLocalEpsilon:(double)a3 defaultLocalEpsilon:(double)a4 error:(id *)a5;
+ (BOOL)containValidDPConfigInMetadata:(id)a3 error:(id *)a4;
+ (BOOL)isMetadataValid:(id)a3 plistParameters:(id)a4 error:(id *)a5;
+ (id)budgetAuditorFromMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5;
+ (id)budgetAuditorFromMetadata:(id)a3 plistParameters:(id)a4 isInternalBuild:(BOOL)a5 error:(id *)a6;
+ (id)maxApproximateDPFromPlist:(id)a3 error:(id *)a4;
+ (id)targetApproximateDPFromDPConfig:(id)a3 error:(id *)a4;
- (NSDictionary)metadata;
- (NSDictionary)plistParameters;
- (_DPApproximateDP)maxADP;
- (_DPApproximateDP)targetADP;
- (_DPBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 targetADP:(id)a5 maxADP:(id)a6 analysis:(id)a7 error:(id *)a8;
- (_DPPrivacyBudgetAnalysis)analysis;
- (id)auditedMetadataWithError:(id *)a3;
- (id)getSymmetricRAPPORLocalEpsilonWithError:(id *)a3;
@end

@implementation _DPBudgetAuditor

+ (id)budgetAuditorFromMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = objc_msgSend(a1, "budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:", v9, v8, +[_DPDeviceInfo isInternalBuild](_DPDeviceInfo, "isInternalBuild"), a5);

  return v10;
}

+ (id)budgetAuditorFromMetadata:(id)a3 plistParameters:(id)a4 isInternalBuild:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  if (!+[_DPBudgetAuditor isMetadataValid:v9 plistParameters:v10 error:a6])
  {
    v16 = 0;
    goto LABEL_25;
  }
  v11 = [v9 objectForKeyedSubscript:@"DediscoTaskConfig"];

  if (v11)
  {
    v12 = [v9 objectForKeyedSubscript:@"DediscoTaskConfig"];
    v13 = [v12 objectForKeyedSubscript:@"DPConfig"];
    v14 = [v13 objectForKeyedSubscript:@"Mechanism"];

    if ([v14 isEqual:@"None"])
    {
      v15 = _DPNoneDPBudgetAuditor;
LABEL_5:
      v16 = (_DPSymmetricRAPPORLegacyBudgetAuditor *)[[v15 alloc] initWithMetadata:v9 plistParameters:v10 error:a6];
LABEL_24:

      goto LABEL_25;
    }
    if (+[_DPBudgetAuditor containValidDPConfigInMetadata:v9 error:a6])
    {
      if (!v14 || [v14 isEqualToString:@"ClientSymmetricRAPPOR"])
      {
        if (v7) {
          v15 = _DPSymmetricRAPPORInternalBuildBudgetAuditor;
        }
        else {
          v15 = _DPSymmetricRAPPORBudgetAuditor;
        }
        goto LABEL_5;
      }
      if ([v14 isEqualToString:@"AggregatorDiscreteGaussianClientSymmetricRAPPOR"])
      {
        v15 = _DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor;
        goto LABEL_5;
      }
      v18 = [NSString stringWithFormat:@"Unknown DP mechanism specified in %@.%@.%@: %@", @"DediscoTaskConfig", @"DPConfig", @"Mechanism", v14];
      v19 = _DPPrivacyBudgetError(8, v18);

      v20 = +[_DPLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
      }

      if (a6) {
        *a6 = v19;
      }
    }
    v16 = 0;
    goto LABEL_24;
  }
  v17 = +[_DPLog framework];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:](v17);
  }

  v16 = [[_DPSymmetricRAPPORLegacyBudgetAuditor alloc] initWithMetadata:v9 plistParameters:v10 error:a6];
LABEL_25:

  return v16;
}

- (_DPBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 targetADP:(id)a5 maxADP:(id)a6 analysis:(id)a7 error:(id *)a8
{
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_DPBudgetAuditor;
  v18 = [(_DPBudgetAuditor *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_metadata, a3);
    objc_storeStrong((id *)&v19->_plistParameters, a4);
    objc_storeStrong((id *)&v19->_targetADP, a5);
    objc_storeStrong((id *)&v19->_maxADP, a6);
    objc_storeStrong((id *)&v19->_analysis, a7);
  }

  return v19;
}

- (id)auditedMetadataWithError:(id *)a3
{
  v5 = [(_DPBudgetAuditor *)self targetADP];

  if (v5)
  {
    v6 = [(_DPBudgetAuditor *)self targetADP];
    BOOL v7 = [(_DPBudgetAuditor *)self analysis];
    id v8 = [v7 exceedApproximateDPBudget:v6 error:a3];

    if (v8)
    {
      if (![v8 BOOLValue])
      {
        id v16 = [(_DPBudgetAuditor *)self maxADP];

        if (v16)
        {
          id v17 = [(_DPBudgetAuditor *)self maxADP];
          if ([v6 exceed:v17])
          {
            v18 = [NSString stringWithFormat:@"Target %@ budget exceeds the maximum allowed %@ budget.", v6, v17];
            v19 = _DPPrivacyBudgetError(4, v18);

            v20 = +[_DPLog framework];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
            }

            if (a3) {
              *a3 = v19;
            }

            id v14 = 0;
          }
          else
          {
            id v14 = [(_DPBudgetAuditor *)self metadata];
          }
        }
        else
        {
          id v14 = [(_DPBudgetAuditor *)self metadata];
        }
        goto LABEL_23;
      }
      id v9 = NSString;
      id v10 = [(_DPBudgetAuditor *)self analysis];
      v11 = [v9 stringWithFormat:@"Privacy budget analysis %@ will exceed the target %@ budget.", objc_opt_class(), v6];
      v12 = _DPPrivacyBudgetError(5, v11);

      v13 = +[_DPLog framework];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
      }

      if (a3) {
        *a3 = v12;
      }
    }
    id v14 = 0;
LABEL_23:

    goto LABEL_24;
  }
  id v15 = +[_DPLog framework];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[_DPBudgetAuditor auditedMetadataWithError:](v15);
  }

  id v14 = [(_DPBudgetAuditor *)self metadata];
LABEL_24:
  return v14;
}

- (id)getSymmetricRAPPORLocalEpsilonWithError:(id *)a3
{
  v5 = [(_DPBudgetAuditor *)self analysis];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v7 = NSNumber;
    id v8 = [(_DPBudgetAuditor *)self analysis];
    [v8 localEpsilon];
    id v9 = objc_msgSend(v7, "numberWithDouble:");
LABEL_6:

    goto LABEL_13;
  }
  id v10 = [(_DPBudgetAuditor *)self analysis];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    id v8 = [(_DPBudgetAuditor *)self analysis];
    v12 = [v8 rappor];

    if (v12)
    {
      v13 = NSNumber;
      id v14 = [v8 rappor];
      [v14 localEpsilon];
      id v9 = objc_msgSend(v13, "numberWithDouble:");

      goto LABEL_6;
    }
  }
  id v15 = _DPPrivacyBudgetError(6, @"Symmetric RAPPOR is not configured in privacy budget analysis while it is expected to be.");
  id v16 = +[_DPLog framework];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
  }

  if (a3) {
    *a3 = v15;
  }

  id v9 = 0;
LABEL_13:
  return v9;
}

+ (id)targetApproximateDPFromDPConfig:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [_DPApproximateDP alloc];
  BOOL v7 = [v5 objectForKeyedSubscript:@"TargetCentralEpsilon"];
  [v7 doubleValue];
  double v9 = v8;
  id v10 = [v5 objectForKeyedSubscript:@"TargetCentralDelta"];

  [v10 doubleValue];
  id v24 = 0;
  v12 = [(_DPApproximateDP *)v6 initWithEpsilon:&v24 delta:v9 error:v11];
  id v13 = v24;

  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v15 = +[_DPLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[_DPBudgetAuditor targetApproximateDPFromDPConfig:error:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    if (a4)
    {
      _DPPrivacyBudgetErrorWithUnderlyingError(8, @"Malformed target central DP parameters in metadata.", v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

+ (id)maxApproximateDPFromPlist:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [_DPApproximateDP alloc];
  BOOL v7 = [v5 objectForKeyedSubscript:@"MaxCentralEpsilon"];
  [v7 doubleValue];
  double v9 = v8;
  id v10 = [v5 objectForKeyedSubscript:@"MaxCentralDelta"];

  [v10 doubleValue];
  id v24 = 0;
  v12 = [(_DPApproximateDP *)v6 initWithEpsilon:&v24 delta:v9 error:v11];
  id v13 = v24;

  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v15 = +[_DPLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[_DPBudgetAuditor maxApproximateDPFromPlist:error:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    if (a4)
    {
      _DPPrivacyBudgetErrorWithUnderlyingError(7, @"Malformed max central DP parameters in plist.", v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

+ (BOOL)checkMetadataLocalEpsilon:(double)a3 defaultLocalEpsilon:(double)a4 error:(id *)a5
{
  if (a3 > a4)
  {
    double v8 = objc_msgSend(NSString, "stringWithFormat:", @"Local epsilon specified in metadata (%f) cannot exceed the default local epsilon (%f) in the plist.", *(void *)&a3, *(void *)&a4);
    double v9 = _DPPrivacyBudgetError(8, v8);

    id v10 = +[_DPLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
    }

    if (a5) {
      *a5 = v9;
    }
  }
  return a3 <= a4;
}

+ (BOOL)containValidDPConfigInMetadata:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [a3 objectForKeyedSubscript:@"DediscoTaskConfig"];
  v6 = [v5 objectForKeyedSubscript:@"DPConfig"];

  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v24[0] = @"LocalEpsilon";
    v24[1] = @"TargetCentralEpsilon";
    v24[2] = @"TargetCentralDelta";
    BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v13 = [v6 objectForKeyedSubscript:v12];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            uint64_t v16 = [NSString stringWithFormat:@"Malformed parameter (%@.%@.%@) in metadata, expected numbers.", @"DediscoTaskConfig", @"DPConfig", v12];
            uint64_t v17 = _DPPrivacyBudgetError(8, v16);

            uint64_t v18 = +[_DPLog framework];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
            }

            if (a4) {
              *a4 = v17;
            }

            BOOL v15 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v15 = 1;
LABEL_16:
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

+ (BOOL)isMetadataValid:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v48[0] = @"MaxCentralEpsilon";
  v48[1] = @"MaxCentralDelta";
  v48[2] = @"epsilon";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v45 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8 * v12);
      id v14 = [v7 objectForKeyedSubscript:v13];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v29 = [NSString stringWithFormat:@"Malformed parameter (%@) in plist, expected numbers.", v13];
    id v24 = _DPPrivacyBudgetError(7, v29);

    v30 = +[_DPLog framework];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
    }

    v31 = a5;
    if (a5)
    {
      id v32 = v24;
      goto LABEL_22;
    }
    goto LABEL_23;
  }
LABEL_9:

  uint64_t v16 = [v6 objectForKeyedSubscript:@"DediscoTaskConfig"];

  if (!v16)
  {
    BOOL v28 = 1;
    goto LABEL_26;
  }
  uint64_t v17 = [v6 objectForKeyedSubscript:@"DediscoTaskConfig"];
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
    v34 = [NSString stringWithFormat:@"Malformed parameter (%@) in metadata, expected a dictionary.", @"DediscoTaskConfig"];
    _DPPrivacyBudgetError(8, v34);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    v35 = +[_DPLog framework];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
    }

    if (a5)
    {
      id v8 = v8;
      BOOL v28 = 0;
      *a5 = v8;
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  id v8 = [v6 objectForKeyedSubscript:@"DediscoTaskConfig"];
  uint64_t v19 = [v8 objectForKeyedSubscript:@"MinBatchSize"];
  objc_opt_class();
  char v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) == 0)
  {
    v36 = [NSString stringWithFormat:@"Malformed parameter (%@.%@) in metadata, expected numbers.", @"DediscoTaskConfig", @"MinBatchSize"];
    id v24 = _DPPrivacyBudgetError(8, v36);

    v37 = +[_DPLog framework];
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  long long v21 = [v8 objectForKeyedSubscript:@"DPConfig"];

  if (v21)
  {
    long long v22 = [v8 objectForKeyedSubscript:@"DPConfig"];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    if (v23)
    {
      id v24 = [v8 objectForKeyedSubscript:@"DPConfig"];
      uint64_t v25 = [v24 objectForKeyedSubscript:@"Mechanism"];
      if (!v25
        || (uint64_t v26 = (void *)v25,
            [v24 objectForKeyedSubscript:@"Mechanism"],
            v27 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char v42 = objc_opt_isKindOfClass(),
            v27,
            v26,
            (v42 & 1) != 0))
      {

        goto LABEL_17;
      }
      v39 = [NSString stringWithFormat:@"Malformed parameter (%@.%@.%@) in metadata, expected a string.", @"DediscoTaskConfig", @"DPConfig", @"Mechanism"];
      v40 = _DPPrivacyBudgetError(8, v39);

      v41 = +[_DPLog framework];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
      }

      if (a5) {
        *a5 = v40;
      }

LABEL_23:
LABEL_24:
      BOOL v28 = 0;
      goto LABEL_25;
    }
    v38 = [NSString stringWithFormat:@"Malformed parameter (%@.%@) in metadata, expected a dictionary.", @"DediscoTaskConfig", @"DPConfig"];
    id v24 = _DPPrivacyBudgetError(8, v38);

    v37 = +[_DPLog framework];
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
LABEL_36:

      v31 = a5;
      if (a5)
      {
        id v32 = v24;
        id v24 = v32;
LABEL_22:
        id *v31 = v32;
      }
      goto LABEL_23;
    }
LABEL_35:
    +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
    goto LABEL_36;
  }
LABEL_17:
  BOOL v28 = 1;
LABEL_25:

LABEL_26:
  return v28;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDictionary)plistParameters
{
  return self->_plistParameters;
}

- (_DPPrivacyBudgetAnalysis)analysis
{
  return self->_analysis;
}

- (_DPApproximateDP)targetADP
{
  return self->_targetADP;
}

- (_DPApproximateDP)maxADP
{
  return self->_maxADP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxADP, 0);
  objc_storeStrong((id *)&self->_targetADP, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_plistParameters, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

+ (void)budgetAuditorFromMetadata:(os_log_t)log plistParameters:isInternalBuild:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DC55E000, log, OS_LOG_TYPE_DEBUG, "Unable to infer DP budget auditor from donation metadata, using default symmetric RAPPOR legacy auditor.", v1, 2u);
}

+ (void)budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)auditedMetadataWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1DC55E000, log, OS_LOG_TYPE_DEBUG, "DP budget auditing is bypassed.", v1, 2u);
}

+ (void)targetApproximateDPFromDPConfig:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)maxApproximateDPFromPlist:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end