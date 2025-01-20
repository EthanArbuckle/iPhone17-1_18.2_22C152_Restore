@interface _DPSymmetricRAPPORLegacyBudgetAuditor
- (_DPSymmetricRAPPORLegacyBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5;
@end

@implementation _DPSymmetricRAPPORLegacyBudgetAuditor

- (_DPSymmetricRAPPORLegacyBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 objectForKeyedSubscript:@"DefaultMinBatchSize"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"Malformed parameter (%@) in plist, expected numbers.", @"DefaultMinBatchSize"];
    _DPPrivacyBudgetError(7, v20);
    v17 = (_DPSymmetricRAPPORWithOHE *)objc_claimAutoreleasedReturnValue();

    v21 = +[_DPLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[_DPSemanticVersion initWithString:error:]((uint64_t)v17, v21);
    }

    if (a5)
    {
      v17 = v17;
      v19 = 0;
      *a5 = v17;
      goto LABEL_11;
    }
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  v12 = [v9 objectForKeyedSubscript:@"DefaultMinBatchSize"];
  uint64_t v13 = [v12 unsignedIntValue];

  v14 = [v9 objectForKeyedSubscript:@"epsilon"];
  [v14 doubleValue];
  double v16 = v15;

  v17 = [[_DPSymmetricRAPPORWithOHE alloc] initWithBatchSize:v13 localEpsilon:a5 error:v16];
  if (!v17) {
    goto LABEL_10;
  }
  v18 = +[_DPLog framework];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[_DPSymmetricRAPPORLegacyBudgetAuditor initWithMetadata:plistParameters:error:](v13, v18, v16);
  }

  v23.receiver = self;
  v23.super_class = (Class)_DPSymmetricRAPPORLegacyBudgetAuditor;
  self = [(_DPBudgetAuditor *)&v23 initWithMetadata:v8 plistParameters:v9 targetADP:0 maxADP:0 analysis:v17 error:a5];
  v19 = self;
LABEL_11:

  return v19;
}

- (void)initWithMetadata:(int)a1 plistParameters:(NSObject *)a2 error:(double)a3 .cold.1(int a1, NSObject *a2, double a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  double v5 = a3;
  _os_log_debug_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_DEBUG, "Symmetric RAPPOR legacy budget auditor uses min batch size = %d, local epsilon = %f", (uint8_t *)v3, 0x12u);
}

@end