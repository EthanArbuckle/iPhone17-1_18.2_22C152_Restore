@interface _DPSymmetricRAPPORInternalBuildBudgetAuditor
- (_DPSymmetricRAPPORInternalBuildBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5;
@end

@implementation _DPSymmetricRAPPORInternalBuildBudgetAuditor

- (_DPSymmetricRAPPORInternalBuildBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 objectForKeyedSubscript:@"DediscoTaskConfig"];
  v10 = [v9 objectForKeyedSubscript:@"MinBatchSize"];
  unsigned int v11 = [v10 unsignedIntValue];

  if (v11 <= 5) {
    uint64_t v12 = 5;
  }
  else {
    uint64_t v12 = v11;
  }
  v38 = v8;
  v13 = [v8 objectForKeyedSubscript:@"epsilon"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [v7 objectForKeyedSubscript:@"DediscoTaskConfig"];
  v17 = [v16 objectForKeyedSubscript:@"DPConfig"];
  v36 = v17;
  v37 = v16;
  if (!v17)
  {
    v34 = a5;
    v35 = 0;
    double v21 = v15;
LABEL_11:
    v24 = (void *)[v7 mutableCopy];
    v25 = (void *)[v16 mutableCopy];
    v26 = [NSNumber numberWithUnsignedInt:v12];
    [v25 setObject:v26 forKeyedSubscript:@"MinBatchSize"];

    v41 = @"LocalEpsilon";
    v27 = [NSNumber numberWithDouble:v21];
    v42[0] = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    [v25 setObject:v28 forKeyedSubscript:@"DPConfig"];

    [v24 setObject:v25 forKeyedSubscript:@"DediscoTaskConfig"];
    id v7 = v24;
    goto LABEL_12;
  }
  unsigned int v33 = v12;
  v18 = v17;
  v19 = [v17 objectForKeyedSubscript:@"LocalEpsilon"];
  [v19 doubleValue];
  double v21 = v20;

  if (!+[_DPBudgetAuditor checkMetadataLocalEpsilon:defaultLocalEpsilon:error:](_DPBudgetAuditor, "checkMetadataLocalEpsilon:defaultLocalEpsilon:error:", a5, v21, v15)|| (+[_DPBudgetAuditor targetApproximateDPFromDPConfig:v18 error:a5], (uint64_t v22 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v23 = 0;
    goto LABEL_18;
  }
  v34 = a5;
  v35 = (void *)v22;
  uint64_t v12 = v33;
  if (v11 <= 4) {
    goto LABEL_11;
  }
LABEL_12:
  v29 = [[_DPSymmetricRAPPORWithOHE alloc] initWithBatchSize:v12 localEpsilon:v34 error:v21];
  if (v29)
  {
    v30 = +[_DPLog framework];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[_DPSymmetricRAPPORInternalBuildBudgetAuditor initWithMetadata:plistParameters:error:](v12, v30, v21);
    }

    v40.receiver = self;
    v40.super_class = (Class)_DPSymmetricRAPPORInternalBuildBudgetAuditor;
    v31 = v35;
    v23 = [(_DPBudgetAuditor *)&v40 initWithMetadata:v7 plistParameters:v38 targetADP:v35 maxADP:0 analysis:v29 error:v34];
    self = v23;
  }
  else
  {
    v23 = 0;
    v31 = v35;
  }

LABEL_18:
  return v23;
}

- (void)initWithMetadata:(int)a1 plistParameters:(NSObject *)a2 error:(double)a3 .cold.1(int a1, NSObject *a2, double a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  double v5 = a3;
  _os_log_debug_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_DEBUG, "Symmetric RAPPOR internal build budget auditor uses min batch size = %d, local epsilon = %f", (uint8_t *)v3, 0x12u);
}

@end