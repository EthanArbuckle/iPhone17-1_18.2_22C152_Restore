@interface _DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor
- (_DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5;
@end

@implementation _DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor

- (_DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor)initWithMetadata:(id)a3 plistParameters:(id)a4 error:(id *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v53 = a4;
  v50 = v6;
  v52 = objc_msgSend(v6, "objectForKeyedSubscript:");
  v7 = objc_msgSend(v52, "objectForKeyedSubscript:");
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v66[0] = @"SigmaAfterNormalizing";
  v66[1] = @"LocalEpsilon";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v67 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v57 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        v14 = [v7 objectForKeyedSubscript:v13];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v43 = [NSString stringWithFormat:@"Malformed parameter (%@.%@.%@) in metadata, expected numbers.", @"DediscoTaskConfig", @"DPConfig", v13];
          _DPPrivacyBudgetError(8, v43);
          id v17 = (id)objc_claimAutoreleasedReturnValue();

          v44 = +[_DPLog framework];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            -[_DPSemanticVersion initWithString:error:]((uint64_t)v17, v44);
          }

          v18 = v52;
          v16 = v53;
          v31 = v50;
          v30 = self;
          if (a5)
          {
            id v17 = v17;
            v42 = 0;
            *a5 = v17;
          }
          else
          {
            v42 = 0;
          }
          goto LABEL_31;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v56 objects:v67 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v16 = v53;
  v8 = +[_DPBudgetAuditor maxApproximateDPFromPlist:v53 error:a5];
  if (v8)
  {
    id v17 = +[_DPBudgetAuditor targetApproximateDPFromDPConfig:v7 error:a5];
    v18 = v52;
    if (!v17) {
      goto LABEL_25;
    }
    v19 = objc_msgSend(v52, "objectForKeyedSubscript:");
    LODWORD(v20) = [v19 unsignedIntValue];

    uint64_t v20 = v20 <= 5 ? 5 : v20;
    v21 = [v7 objectForKeyedSubscript:@"SigmaAfterNormalizing"];
    [v21 doubleValue];
    double v23 = v22;

    v24 = [v7 objectForKeyedSubscript:@"LocalEpsilon"];
    [v24 doubleValue];
    double v26 = v25;

    v27 = [v53 objectForKeyedSubscript:@"epsilon"];
    [v27 doubleValue];
    LODWORD(v24) = +[_DPBudgetAuditor checkMetadataLocalEpsilon:a5 defaultLocalEpsilon:v26 error:v28];

    if (v24)
    {
      unsigned int v49 = v20;
      v29 = [[_DPSymmetricRAPPORWithOHE alloc] initWithBatchSize:v20 localEpsilon:a5 error:v26];
      v31 = v50;
      v30 = self;
      if (v29)
      {
        v32 = [[_DPHistogramWithAggregatorDiscreteGaussian alloc] initWithSigma:v29 rappor:a5 error:v23];
        if (v32)
        {
          v47 = v29;
          v48 = v32;
          v33 = +[_DPLog framework];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218496;
            double v61 = v23;
            __int16 v62 = 2048;
            double v63 = v26;
            __int16 v64 = 1024;
            unsigned int v65 = v49;
            _os_log_debug_impl(&dword_1DC55E000, v33, OS_LOG_TYPE_DEBUG, "Histogram with aggregator discrete Gaussian uses sigma = %f, symmetric RAPPOR local epsilon = %f, min batch size = %d", buf, 0x1Cu);
          }

          v46 = (void *)[v50 mutableCopy];
          v34 = [v50 objectForKeyedSubscript:@"DediscoTaskConfig"];
          v35 = (void *)[v34 mutableCopy];

          v36 = [NSNumber numberWithUnsignedInt:v49];
          [v35 setObject:v36 forKeyedSubscript:@"MinBatchSize"];

          v37 = (void *)[v7 mutableCopy];
          v38 = NSNumber;
          [(_DPHistogramWithAggregatorDiscreteGaussian *)v48 squaredL2Sensitivity];
          v39 = objc_msgSend(v38, "numberWithDouble:");
          [v37 setObject:v39 forKeyedSubscript:@"SquaredL2Sensitivity"];

          [v35 setObject:v37 forKeyedSubscript:@"DPConfig"];
          [v46 setObject:v35 forKeyedSubscript:@"DediscoTaskConfig"];
          id v40 = v46;

          v55.receiver = self;
          v55.super_class = (Class)_DPHistogramWithAggregatorDiscreteGaussianBudgetAuditor;
          v41 = [(_DPBudgetAuditor *)&v55 initWithMetadata:v40 plistParameters:v53 targetADP:v17 maxADP:v8 analysis:v48 error:a5];

          v30 = v41;
          v32 = v48;
          v31 = v40;
          v42 = v30;
          v29 = v47;
        }
        else
        {
          v42 = 0;
        }
      }
      else
      {
        v42 = 0;
      }
    }
    else
    {
LABEL_25:
      v42 = 0;
      v31 = v50;
      v30 = self;
    }
LABEL_31:
  }
  else
  {
    v42 = 0;
    v30 = self;
    v18 = v52;
    v31 = v50;
  }

  return v42;
}

@end