@interface _DPSymmetricRAPPORBudgetAuditor
- (BOOL)auditedFromPlist;
- (_DPSymmetricRAPPORBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5;
- (id)auditedMetadataWithError:(id *)a3;
@end

@implementation _DPSymmetricRAPPORBudgetAuditor

- (_DPSymmetricRAPPORBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  v50[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 objectForKeyedSubscript:@"DefaultMinBatchSize"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v12 = [v9 objectForKeyedSubscript:@"DefaultMinBatchSize"];
    unsigned int v13 = [v12 unsignedIntValue];

    v14 = [v9 objectForKeyedSubscript:@"epsilon"];
    [v14 doubleValue];
    double v16 = v15;

    id v17 = +[_DPBudgetAuditor maxApproximateDPFromPlist:v9 error:a5];
    if (v17)
    {
      v46 = a5;
      v47 = self;
      v18 = objc_msgSend(v8, "objectForKeyedSubscript:");
      v19 = [v18 objectForKeyedSubscript:@"MinBatchSize"];
      uint64_t v20 = [v19 unsignedIntValue];

      v21 = [v18 objectForKeyedSubscript:@"DPConfig"];
      id v17 = v17;
      if (v21)
      {
        id v22 = v8;
        v23 = v18;
        v24 = [v21 objectForKeyedSubscript:@"LocalEpsilon"];
        [v24 doubleValue];
        double v26 = v25;

        v27 = v46;
        if (+[_DPBudgetAuditor checkMetadataLocalEpsilon:v46 defaultLocalEpsilon:v26 error:v16])
        {
          v28 = +[_DPBudgetAuditor targetApproximateDPFromDPConfig:v21 error:v46];

          if (v28)
          {
            v45 = v21;
            double v16 = v26;
LABEL_16:
            v40 = [[_DPSymmetricRAPPORWithOHE alloc] initWithBatchSize:v20 localEpsilon:v27 error:v16];
            if (v40)
            {
              v41 = +[_DPLog framework];
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
                -[_DPSymmetricRAPPORBudgetAuditor initWithMetadata:plistParameters:error:](v20, v41, v16);
              }

              v48.receiver = v47;
              v48.super_class = (Class)_DPSymmetricRAPPORBudgetAuditor;
              v42 = [(_DPBudgetAuditor *)&v48 initWithMetadata:v22 plistParameters:v9 targetADP:v28 maxADP:v17 analysis:v40 error:v27];
              if (v42) {
                v42->_auditedFromPlist = v45 == 0;
              }
              v31 = v42;
              v47 = v31;
            }
            else
            {
              v31 = 0;
            }

            v21 = v45;
            goto LABEL_25;
          }
          v31 = 0;
        }
        else
        {
          v31 = 0;
          v28 = v17;
        }
LABEL_25:

        self = v47;
        id v8 = v22;
        goto LABEL_26;
      }
      v45 = 0;
      if (v20 <= v13) {
        uint64_t v20 = v13;
      }
      else {
        uint64_t v20 = v20;
      }
      v44 = (void *)[v8 mutableCopy];
      v32 = (void *)[v18 mutableCopy];
      v33 = [NSNumber numberWithUnsignedInt:v20];
      [v32 setObject:v33 forKeyedSubscript:@"MinBatchSize"];

      v49[0] = @"LocalEpsilon";
      v34 = [NSNumber numberWithDouble:v16];
      v50[0] = v34;
      v49[1] = @"TargetCentralEpsilon";
      v35 = NSNumber;
      [v17 epsilon];
      v36 = objc_msgSend(v35, "numberWithDouble:");
      v50[1] = v36;
      v49[2] = @"TargetCentralDelta";
      v37 = NSNumber;
      [v17 delta];
      v38 = objc_msgSend(v37, "numberWithDouble:");
      v50[2] = v38;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3];
      [v32 setObject:v39 forKeyedSubscript:@"DPConfig"];

      id v22 = v44;
      [v44 setObject:v32 forKeyedSubscript:@"DediscoTaskConfig"];

      v28 = v17;
      v23 = v18;
      v27 = v46;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  v29 = [NSString stringWithFormat:@"Malformed parameter (%@) in plist, expected numbers.", @"DefaultMinBatchSize"];
  _DPPrivacyBudgetError(7, v29);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  v30 = +[_DPLog framework];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    -[_DPSemanticVersion initWithString:error:]((uint64_t)v17, v30);
  }

  if (!a5)
  {
LABEL_11:
    v31 = 0;
    goto LABEL_26;
  }
  id v17 = v17;
  v31 = 0;
  *a5 = v17;
LABEL_26:

  return v31;
}

- (id)auditedMetadataWithError:(id *)a3
{
  if ([(_DPSymmetricRAPPORBudgetAuditor *)self auditedFromPlist])
  {
    v5 = [(_DPBudgetAuditor *)self metadata];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_DPSymmetricRAPPORBudgetAuditor;
    v5 = [(_DPBudgetAuditor *)&v7 auditedMetadataWithError:a3];
  }
  return v5;
}

- (BOOL)auditedFromPlist
{
  return self->_auditedFromPlist;
}

- (void)initWithMetadata:(int)a1 plistParameters:(NSObject *)a2 error:(double)a3 .cold.1(int a1, NSObject *a2, double a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  double v5 = a3;
  _os_log_debug_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_DEBUG, "Symmetric RAPPOR budget auditor uses min batch size = %d, local epsilon = %f", (uint8_t *)v3, 0x12u);
}

@end