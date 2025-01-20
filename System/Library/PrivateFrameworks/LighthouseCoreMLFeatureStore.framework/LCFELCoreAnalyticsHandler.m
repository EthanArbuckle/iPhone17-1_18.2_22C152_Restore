@interface LCFELCoreAnalyticsHandler
+ (BOOL)emitChangePointDetectionEvent:(id)a3;
+ (BOOL)emitFeatureImportanceEvent:(id)a3;
+ (BOOL)emitFeatureStatisticEvents:(id)a3 usageType:(int64_t)a4 batchProviderInfo:(id)a5;
+ (BOOL)emitModelTrainingEvent:(id)a3;
+ (BOOL)emitShadowEvaluationEvent:(id)a3;
+ (void)myAnalyticsSendEvent:(id)a3 eventPayload:(id)a4;
@end

@implementation LCFELCoreAnalyticsHandler

+ (void)myAnalyticsSendEvent:(id)a3 eventPayload:(id)a4
{
}

+ (BOOL)emitFeatureStatisticEvents:(id)a3 usageType:(int64_t)a4 batchProviderInfo:(id)a5
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v95 = a3;
  id v6 = a5;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  obuint64_t j = [v6 positiveFeatureStatistics];
  unint64_t v7 = 0x263F08000uLL;
  id v93 = v6;
  uint64_t v63 = [obj countByEnumeratingWithState:&v104 objects:v116 count:16];
  if (v63)
  {
    uint64_t v60 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v105 != v60) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        v114[0] = @"contextId";
        v10 = [v6 contextId];
        uint64_t v11 = [v10 UUIDString];
        v115[0] = v11;
        v114[1] = @"eventId";
        v84 = [v6 eventId];
        v81 = [v84 UUIDString];
        v115[1] = v81;
        v114[2] = @"featureValueStatisticId";
        v78 = [v95 UUIDString];
        v115[2] = v78;
        v114[3] = @"usageType";
        v75 = [NSNumber numberWithInteger:a4];
        v115[3] = v75;
        v114[4] = @"timeRange";
        v72 = [v6 timeRange];
        v115[4] = v72;
        v114[5] = @"faetureStoreKey";
        v12 = [v6 featureStoreKey];
        v13 = v12;
        if (!v12)
        {
          v59 = [MEMORY[0x263EFF9D0] null];
          v13 = v59;
        }
        v115[5] = v13;
        v114[6] = @"featureCount";
        uint64_t v14 = [v6 featureCount];
        v115[6] = v14;
        v115[7] = &unk_2703E7600;
        v114[7] = @"sampleType";
        v114[8] = @"featureName";
        v66 = [v9 featureName];
        v115[8] = v66;
        v114[9] = @"featureStat_count";
        v15 = [v9 count];
        v115[9] = v15;
        v114[10] = @"featureStat_mean";
        v16 = [v9 mean];
        v17 = [MEMORY[0x263F087B0] notANumber];
        v87 = (void *)v11;
        v90 = v10;
        v69 = (void *)v14;
        if ([v16 isEqualToNumber:v17]) {
          [MEMORY[0x263EFF9D0] null];
        }
        else {
        v18 = [v9 mean];
        }
        v115[10] = v18;
        v114[11] = @"featureStat_stddev";
        v19 = [v9 stddev];
        v20 = [MEMORY[0x263F087B0] notANumber];
        if ([v19 isEqualToNumber:v20]) {
          [MEMORY[0x263EFF9D0] null];
        }
        else {
        v21 = [v9 stddev];
        }
        v115[11] = v21;
        v22 = [NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:12];

        if (!v12) {
        +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:@"com.apple.LighthouseCoreMLFoundations.LCFELFeatureValueStatistic" eventPayload:v22];
        }

        id v6 = v93;
        unint64_t v7 = 0x263F08000uLL;
      }
      uint64_t v63 = [obj countByEnumeratingWithState:&v104 objects:v116 count:16];
    }
    while (v63);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obja = [v6 negativeFeatureStatistics];
  uint64_t v64 = [obja countByEnumeratingWithState:&v100 objects:v113 count:16];
  if (v64)
  {
    uint64_t v61 = *(void *)v101;
    do
    {
      for (uint64_t j = 0; j != v64; ++j)
      {
        if (*(void *)v101 != v61) {
          objc_enumerationMutation(obja);
        }
        v24 = *(void **)(*((void *)&v100 + 1) + 8 * j);
        v111[0] = @"contextId";
        v25 = [v6 contextId];
        uint64_t v26 = [v25 UUIDString];
        v112[0] = v26;
        v111[1] = @"eventId";
        v85 = [v6 eventId];
        v82 = [v85 UUIDString];
        v112[1] = v82;
        v111[2] = @"featureValueStatisticId";
        v79 = [v95 UUIDString];
        v112[2] = v79;
        v111[3] = @"usageType";
        v76 = [NSNumber numberWithInteger:a4];
        v112[3] = v76;
        v111[4] = @"timeRange";
        v73 = [v6 timeRange];
        v112[4] = v73;
        v111[5] = @"faetureStoreKey";
        v27 = [v6 featureStoreKey];
        v28 = v27;
        if (!v27)
        {
          v59 = [MEMORY[0x263EFF9D0] null];
          v28 = v59;
        }
        v112[5] = v28;
        v111[6] = @"featureCount";
        uint64_t v29 = [v6 featureCount];
        v112[6] = v29;
        v112[7] = &unk_2703E7618;
        v111[7] = @"sampleType";
        v111[8] = @"featureName";
        v67 = [v24 featureName];
        v112[8] = v67;
        v111[9] = @"featureStat_count";
        v30 = [v24 count];
        v112[9] = v30;
        v111[10] = @"featureStat_mean";
        v31 = [v24 mean];
        v32 = [MEMORY[0x263F087B0] notANumber];
        v88 = (void *)v26;
        v91 = v25;
        v70 = (void *)v29;
        if ([v31 isEqualToNumber:v32]) {
          [MEMORY[0x263EFF9D0] null];
        }
        else {
        v33 = [v24 mean];
        }
        v112[10] = v33;
        v111[11] = @"featureStat_stddev";
        v34 = [v24 stddev];
        v35 = [MEMORY[0x263F087B0] notANumber];
        if ([v34 isEqualToNumber:v35]) {
          [MEMORY[0x263EFF9D0] null];
        }
        else {
        v36 = [v24 stddev];
        }
        v112[11] = v36;
        v37 = [NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:12];

        if (!v27) {
        +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:@"com.apple.LighthouseCoreMLFoundations.LCFELFeatureValueStatistic" eventPayload:v37];
        }

        id v6 = v93;
        unint64_t v7 = 0x263F08000uLL;
      }
      uint64_t v64 = [obja countByEnumeratingWithState:&v100 objects:v113 count:16];
    }
    while (v64);
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v38 = [v6 totalFeatureStatistics];
  v39 = [v38 allValues];

  id objb = v39;
  uint64_t v65 = [v39 countByEnumeratingWithState:&v96 objects:v110 count:16];
  if (v65)
  {
    uint64_t v62 = *(void *)v97;
    do
    {
      for (uint64_t k = 0; k != v65; ++k)
      {
        if (*(void *)v97 != v62) {
          objc_enumerationMutation(objb);
        }
        v41 = *(void **)(*((void *)&v96 + 1) + 8 * k);
        v108[0] = @"contextId";
        v42 = [v6 contextId];
        uint64_t v43 = [v42 UUIDString];
        v109[0] = v43;
        v108[1] = @"eventId";
        v86 = [v6 eventId];
        v83 = [v86 UUIDString];
        v109[1] = v83;
        v108[2] = @"featureValueStatisticId";
        v80 = [v95 UUIDString];
        v109[2] = v80;
        v108[3] = @"usageType";
        v77 = [NSNumber numberWithInteger:a4];
        v109[3] = v77;
        v108[4] = @"timeRange";
        v74 = [v6 timeRange];
        v109[4] = v74;
        v108[5] = @"faetureStoreKey";
        v44 = [v6 featureStoreKey];
        v45 = v44;
        if (!v44)
        {
          v59 = [MEMORY[0x263EFF9D0] null];
          v45 = v59;
        }
        v109[5] = v45;
        v108[6] = @"featureCount";
        uint64_t v46 = [v6 featureCount];
        v109[6] = v46;
        v109[7] = &unk_2703E7630;
        v108[7] = @"sampleType";
        v108[8] = @"featureName";
        v68 = [v41 featureName];
        v109[8] = v68;
        v108[9] = @"featureStat_count";
        v47 = [v41 count];
        v109[9] = v47;
        v108[10] = @"featureStat_mean";
        v48 = [v41 mean];
        v49 = [*(id *)(v7 + 1968) notANumber];
        v89 = (void *)v43;
        v92 = v42;
        v71 = (void *)v46;
        if ([v48 isEqualToNumber:v49]) {
          [MEMORY[0x263EFF9D0] null];
        }
        else {
        v50 = [v41 mean];
        }
        v109[10] = v50;
        v108[11] = @"featureStat_stddev";
        v51 = [v41 stddev];
        v52 = [*(id *)(v7 + 1968) notANumber];
        if ([v51 isEqualToNumber:v52]) {
          [MEMORY[0x263EFF9D0] null];
        }
        else {
        v53 = [v41 stddev];
        }
        v109[11] = v53;
        v54 = [NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:12];

        if (!v44) {
        +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:@"com.apple.LighthouseCoreMLFoundations.LCFELFeatureValueStatistic" eventPayload:v54];
        }

        id v6 = v93;
        unint64_t v7 = 0x263F08000;
      }
      uint64_t v65 = [objb countByEnumeratingWithState:&v96 objects:v110 count:16];
    }
    while (v65);
  }

  return 1;
}

+ (BOOL)emitModelTrainingEvent:(id)a3
{
  v25[7] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08C38] UUID];
  uint64_t v5 = [v3 bachProviderInfo];
  if (v5) {
    +[LCFELCoreAnalyticsHandler emitFeatureStatisticEvents:v4 usageType:1 batchProviderInfo:v5];
  }
  v22 = (void *)v5;
  v24[0] = @"contextId";
  v21 = [v3 contextId];
  v20 = [v21 UUIDString];
  v25[0] = v20;
  v24[1] = @"eventId";
  v19 = [v3 eventId];
  v18 = [v19 UUIDString];
  v25[1] = v18;
  v24[2] = @"modelName";
  v17 = [v3 modelName];
  v25[2] = v17;
  v24[3] = @"succeeded";
  id v6 = [v3 succeeded];
  v25[3] = v6;
  v24[4] = @"errorDomain";
  unint64_t v7 = [v3 trainingError];
  v8 = [v7 domain];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x263EFF9D0] null];
  }
  v25[4] = v9;
  v24[5] = @"errorCodeEnum";
  v10 = NSNumber;
  uint64_t v11 = [v3 trainingError];
  v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "code"));
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x263EFF9D0] null];
  }
  v25[5] = v13;
  v24[6] = @"featureValueStatisticId";
  v23 = v4;
  uint64_t v14 = [v4 UUIDString];
  v25[6] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:7];

  if (!v12) {
  if (!v8)
  }

  +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:@"com.apple.LighthouseCoreMLFoundations.LCFELModelTrainingEvent" eventPayload:v15];
  return 1;
}

+ (BOOL)emitShadowEvaluationEvent:(id)a3
{
  v27[8] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08C38] UUID];
  uint64_t v5 = [v3 inputBachProviderInfo];
  if (v5) {
    +[LCFELCoreAnalyticsHandler emitFeatureStatisticEvents:v4 usageType:2 batchProviderInfo:v5];
  }
  v24 = (void *)v5;
  v26[0] = @"contextId";
  v23 = [v3 contextId];
  v22 = [v23 UUIDString];
  v27[0] = v22;
  v26[1] = @"eventId";
  v21 = [v3 eventId];
  v20 = [v21 UUIDString];
  v27[1] = v20;
  v26[2] = @"modelName";
  v19 = [v3 modelName];
  v27[2] = v19;
  v26[3] = @"succeeded";
  v18 = [v3 succeeded];
  v27[3] = v18;
  v26[4] = @"errorDomain";
  v17 = [v3 evaluationError];
  id v6 = [v17 domain];
  unint64_t v7 = v6;
  if (!v6)
  {
    unint64_t v7 = [MEMORY[0x263EFF9D0] null];
  }
  v27[4] = v7;
  v26[5] = @"errorCodeEnum";
  v8 = NSNumber;
  v9 = [v3 evaluationError];
  v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "code"));
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x263EFF9D0] null];
  }
  v27[5] = v11;
  v26[6] = @"featureValueStatisticId";
  v25 = v4;
  v12 = [v4 UUIDString];
  v27[6] = v12;
  v26[7] = @"accuracy";
  v13 = [v3 accuracy];
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v14 = [MEMORY[0x263EFF9D0] null];
  }
  v27[7] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:8];
  if (!v13) {

  }
  if (!v10) {
  if (!v6)
  }

  +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:@"com.apple.LighthouseCoreMLFoundations.LCFELShadowEvaluationEvent" eventPayload:v15];
  return 1;
}

+ (BOOL)emitFeatureImportanceEvent:(id)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obuint64_t j = [v3 results];
  uint64_t v68 = [obj countByEnumeratingWithState:&v89 objects:v95 count:16];
  if (v68)
  {
    uint64_t v67 = *(void *)v90;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v90 != v67) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v89 + 1) + 8 * v4);
        id v6 = [v3 inputBachProviderInfo];
        unint64_t v7 = [v6 totalFeatureStatistics];
        v8 = [v5 featureName];
        v9 = [v7 objectForKeyedSubscript:v8];

        if (v9)
        {
          v10 = [v3 inputBachProviderInfo];
          uint64_t v11 = [v10 totalFeatureStatistics];
          v12 = [v5 featureName];
          v13 = [v11 objectForKeyedSubscript:v12];
          v86 = [v13 count];

          uint64_t v14 = [v3 inputBachProviderInfo];
          v15 = [v14 totalFeatureStatistics];
          v16 = [v5 featureName];
          v17 = [v15 objectForKeyedSubscript:v16];
          v18 = [v17 mean];
          v19 = [MEMORY[0x263F087B0] notANumber];
          char v20 = [v18 isEqualToNumber:v19];

          if (v20)
          {
            uint64_t v87 = 0;
          }
          else
          {
            v23 = [v3 inputBachProviderInfo];
            v24 = [v23 totalFeatureStatistics];
            v25 = [v5 featureName];
            uint64_t v26 = [v24 objectForKeyedSubscript:v25];
            uint64_t v87 = [v26 mean];
          }
          v27 = [v3 inputBachProviderInfo];
          v28 = [v27 totalFeatureStatistics];
          uint64_t v29 = [v5 featureName];
          v30 = [v28 objectForKeyedSubscript:v29];
          v31 = [v30 stddev];
          v32 = [MEMORY[0x263F087B0] notANumber];
          char v33 = [v31 isEqualToNumber:v32];

          if (v33)
          {
            uint64_t v22 = 0;
          }
          else
          {
            v34 = [v3 inputBachProviderInfo];
            v35 = [v34 totalFeatureStatistics];
            v36 = [v5 featureName];
            v37 = [v35 objectForKeyedSubscript:v36];
            uint64_t v22 = [v37 stddev];
          }
          v21 = (void *)v87;
        }
        else
        {
          v21 = 0;
          uint64_t v22 = 0;
          v86 = &unk_2703E7648;
        }
        v93[0] = @"contextId";
        v83 = [v3 contextId];
        v82 = [v83 UUIDString];
        v94[0] = v82;
        v93[1] = @"eventId";
        v81 = [v3 eventId];
        v80 = [v81 UUIDString];
        v94[1] = v80;
        v93[2] = @"succeeded";
        v79 = [v3 succeeded];
        v94[2] = v79;
        v93[3] = @"errorDomain";
        v78 = [v3 analysisError];
        uint64_t v38 = [v78 domain];
        uint64_t v39 = v38;
        if (!v38)
        {
          v66 = [MEMORY[0x263EFF9D0] null];
          uint64_t v39 = (uint64_t)v66;
        }
        v77 = (void *)v38;
        v94[3] = v39;
        v93[4] = @"errorCodeEnum";
        v40 = NSNumber;
        v76 = [v3 analysisError];
        uint64_t v41 = objc_msgSend(v40, "numberWithInteger:", objc_msgSend(v76, "code"));
        v75 = (void *)v41;
        if (!v41)
        {
          uint64_t v65 = [MEMORY[0x263EFF9D0] null];
          uint64_t v41 = (uint64_t)v65;
        }
        v94[4] = v41;
        v93[5] = @"timeRange";
        v74 = [v3 inputBachProviderInfo];
        v73 = [v74 timeRange];
        v94[5] = v73;
        v93[6] = @"faetureStoreKey";
        v72 = [v3 inputBachProviderInfo];
        v42 = [v72 featureStoreKey];
        uint64_t v43 = v42;
        if (!v42)
        {
          uint64_t v64 = [MEMORY[0x263EFF9D0] null];
          uint64_t v43 = v64;
        }
        v94[6] = v43;
        v93[7] = @"featureCount";
        v71 = [v3 inputBachProviderInfo];
        v70 = [v71 featureCount];
        v94[7] = v70;
        v93[8] = @"featureName";
        v44 = [v5 featureName];
        v45 = v44;
        if (!v44)
        {
          uint64_t v63 = [MEMORY[0x263EFF9D0] null];
          v45 = v63;
        }
        v94[8] = v45;
        v94[9] = v86;
        uint64_t v46 = v21;
        v93[9] = @"featureStat_count";
        v93[10] = @"featureStat_mean";
        if (!v21)
        {
          uint64_t v62 = [MEMORY[0x263EFF9D0] null];
          uint64_t v46 = v62;
        }
        v94[10] = v46;
        v93[11] = @"featureStat_stddev";
        uint64_t v47 = v22;
        v84 = (void *)v22;
        if (!v22)
        {
          uint64_t v61 = [MEMORY[0x263EFF9D0] null];
          uint64_t v47 = (uint64_t)v61;
        }
        v94[11] = v47;
        v93[12] = @"correlationCoefficient";
        v48 = [v5 correlationCoefficient];
        v49 = [MEMORY[0x263F087B0] notANumber];
        uint64_t v85 = v4;
        v88 = v21;
        if ([v48 isEqualToNumber:v49]) {
          [MEMORY[0x263EFF9D0] null];
        }
        else {
        v50 = [v5 correlationCoefficient];
        }
        v94[12] = v50;
        v93[13] = @"featureImportance";
        v51 = [v5 featureImportance];
        v52 = [MEMORY[0x263F087B0] notANumber];
        if ([v51 isEqualToNumber:v52]) {
          [MEMORY[0x263EFF9D0] null];
        }
        else {
        v53 = [v5 featureImportance];
        }
        v94[13] = v53;
        v93[14] = @"targetLabelFeatureName";
        id v54 = v3;
        v55 = [v3 targetLabelFeatureName];
        v56 = v55;
        if (!v55)
        {
          uint64_t v60 = [MEMORY[0x263EFF9D0] null];
          v56 = v60;
        }
        v94[14] = v56;
        v69 = [NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:15];
        if (!v55) {

        }
        if (!v84) {
        id v3 = v54;
        }
        if (v88)
        {
          if (v44) {
            goto LABEL_41;
          }
        }
        else
        {

          if (v44) {
            goto LABEL_41;
          }
        }

LABEL_41:
        if (!v42) {

        }
        if (!v75) {
        if (!v77)
        }

        +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:@"com.apple.LighthouseCoreMLFoundations.LCFELFeatureImportanceEvent" eventPayload:v69];
        uint64_t v4 = v85 + 1;
      }
      while (v68 != v85 + 1);
      uint64_t v57 = [obj countByEnumeratingWithState:&v89 objects:v95 count:16];
      uint64_t v68 = v57;
    }
    while (v57);
  }

  return 1;
}

+ (BOOL)emitChangePointDetectionEvent:(id)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  obuint64_t j = [v3 results];
  uint64_t v67 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
  if (v67)
  {
    uint64_t v65 = *(void *)v87;
    id v66 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v87 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v86 + 1) + 8 * v4);
        id v6 = (void *)MEMORY[0x263F08900];
        unint64_t v7 = [v5 changepointTimestamps];
        id v85 = 0;
        uint64_t v8 = [v6 dataWithJSONObject:v7 options:1 error:&v85];
        id v78 = v85;

        v79 = (void *)v8;
        v84 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
        v9 = [v3 inputBachProviderInfo];
        v10 = [v9 totalFeatureStatistics];
        uint64_t v11 = [v5 featureName];
        v12 = [v10 objectForKeyedSubscript:v11];

        uint64_t v80 = v4;
        if (v12)
        {
          v13 = [v3 inputBachProviderInfo];
          uint64_t v14 = [v13 totalFeatureStatistics];
          v15 = [v5 featureName];
          v16 = [v14 objectForKeyedSubscript:v15];
          v83 = [v16 count];

          v17 = [v3 inputBachProviderInfo];
          v18 = [v17 totalFeatureStatistics];
          v19 = [v5 featureName];
          char v20 = [v18 objectForKeyedSubscript:v19];
          v21 = [v20 mean];
          uint64_t v22 = [MEMORY[0x263F087B0] notANumber];
          char v23 = [v21 isEqualToNumber:v22];

          if (v23)
          {
            uint64_t v81 = 0;
          }
          else
          {
            uint64_t v26 = [v3 inputBachProviderInfo];
            v27 = [v26 totalFeatureStatistics];
            v28 = [v5 featureName];
            uint64_t v29 = [v27 objectForKeyedSubscript:v28];
            uint64_t v81 = [v29 mean];
          }
          v30 = [v3 inputBachProviderInfo];
          v31 = [v30 totalFeatureStatistics];
          v32 = [v5 featureName];
          char v33 = [v31 objectForKeyedSubscript:v32];
          v34 = [v33 stddev];
          v35 = [MEMORY[0x263F087B0] notANumber];
          char v36 = [v34 isEqualToNumber:v35];

          if (v36)
          {
            uint64_t v25 = 0;
          }
          else
          {
            v37 = [v3 inputBachProviderInfo];
            uint64_t v38 = [v37 totalFeatureStatistics];
            uint64_t v39 = [v5 featureName];
            v40 = [v38 objectForKeyedSubscript:v39];
            uint64_t v25 = [v40 stddev];
          }
          v24 = (void *)v81;
        }
        else
        {
          v24 = 0;
          uint64_t v25 = 0;
          v83 = &unk_2703E7648;
        }
        v90[0] = @"contextId";
        v77 = [v3 contextId];
        v76 = [v77 UUIDString];
        v91[0] = v76;
        v90[1] = @"eventId";
        v75 = [v3 eventId];
        v74 = [v75 UUIDString];
        v91[1] = v74;
        v90[2] = @"succeeded";
        v73 = [v3 succeeded];
        v91[2] = v73;
        v90[3] = @"errorDomain";
        v72 = [v3 analysisError];
        uint64_t v41 = [v72 domain];
        v42 = v41;
        if (!v41)
        {
          uint64_t v64 = [MEMORY[0x263EFF9D0] null];
          v42 = v64;
        }
        v82 = (void *)v25;
        v91[3] = v42;
        v90[4] = @"errorCodeEnum";
        uint64_t v43 = NSNumber;
        v71 = [v3 analysisError];
        v44 = objc_msgSend(v43, "numberWithInteger:", objc_msgSend(v71, "code"));
        v45 = v44;
        if (!v44)
        {
          uint64_t v63 = [MEMORY[0x263EFF9D0] null];
          v45 = v63;
        }
        v91[4] = v45;
        v90[5] = @"timeRange";
        v70 = [v3 inputBachProviderInfo];
        v69 = [v70 timeRange];
        v91[5] = v69;
        v90[6] = @"faetureStoreKey";
        uint64_t v68 = [v3 inputBachProviderInfo];
        uint64_t v46 = [v68 featureStoreKey];
        uint64_t v47 = v46;
        if (!v46)
        {
          uint64_t v62 = [MEMORY[0x263EFF9D0] null];
          uint64_t v47 = v62;
        }
        v91[6] = v47;
        v90[7] = @"featureCount";
        v48 = [v3 inputBachProviderInfo];
        v49 = [v48 featureCount];
        v91[7] = v49;
        v90[8] = @"featureName";
        v50 = [v5 featureName];
        v51 = v50;
        if (!v50)
        {
          uint64_t v61 = [MEMORY[0x263EFF9D0] null];
          v51 = v61;
        }
        v91[8] = v51;
        v91[9] = v83;
        v52 = v24;
        v90[9] = @"featureStat_count";
        v90[10] = @"featureStat_mean";
        if (!v24)
        {
          uint64_t v60 = [MEMORY[0x263EFF9D0] null];
          v52 = v60;
        }
        v91[10] = v52;
        v90[11] = @"featureStat_stddev";
        v53 = v82;
        if (!v82)
        {
          v59 = [MEMORY[0x263EFF9D0] null];
          v53 = v59;
        }
        v91[11] = v53;
        v90[12] = @"changePoints_count";
        id v54 = [v5 detectedChangePointCount];
        v90[13] = @"changePoints";
        v91[12] = v54;
        v91[13] = v84;
        v55 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:14];

        if (v82)
        {
          if (!v24) {
            goto LABEL_39;
          }
        }
        else
        {

          if (!v24)
          {
LABEL_39:

            if (v50) {
              goto LABEL_30;
            }
            goto LABEL_40;
          }
        }
        if (v50) {
          goto LABEL_30;
        }
LABEL_40:

LABEL_30:
        if (!v46) {

        }
        id v3 = v66;
        if (!v44) {

        }
        if (!v41) {
        +[LCFELCoreAnalyticsHandler myAnalyticsSendEvent:@"com.apple.LighthouseCoreMLFoundations.LCFELChangePointDetectionEvent" eventPayload:v55];
        }

        uint64_t v4 = v80 + 1;
      }
      while (v67 != v80 + 1);
      uint64_t v56 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
      uint64_t v67 = v56;
    }
    while (v56);
  }

  return 1;
}

@end