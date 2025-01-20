@interface LCFFeatureImportance
+ (id)_generateFeatureDictionaryForFeatureStore:(id)a3 featureNames:(id)a4 labelName:(id)a5;
+ (id)analyzeFeatureImportanceWithFeatureStore:(id)a3 featureNames:(id)a4 labelName:(id)a5;
+ (id)analyzeFeatureQuality:(id)a3 featureNames:(id)a4 labelName:(id)a5;
+ (id)computeCorrelationBetweenVector:(id)a3 andOtherVector:(id)a4;
@end

@implementation LCFFeatureImportance

+ (id)analyzeFeatureQuality:(id)a3 featureNames:(id)a4 labelName:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v25 = [a3 getMultiArrayFeatureVectors:v7 vectorName:@"vector" srcLabelName:v8 destLabelName:v8 option:4];
  v26 = v8;
  v9 = +[LCFFeatureImportance _generateFeatureDictionaryForFeatureStore:featureNames:labelName:](LCFFeatureImportance, "_generateFeatureDictionaryForFeatureStore:featureNames:labelName:");
  id v28 = (id)objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v15 = [v9 objectForKeyedSubscript:v14];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          int v18 = 0;
          uint64_t v19 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v30 != v19) {
                objc_enumerationMutation(v15);
              }
              if (!*(void *)(*((void *)&v29 + 1) + 8 * j)) {
                ++v18;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v17);
        }
        else
        {
          int v18 = 0;
        }

        v21 = NSNumber;
        v22 = [v9 objectForKeyedSubscript:v14];
        v23 = objc_msgSend(v21, "numberWithDouble:", (double)v18 / (double)(unint64_t)objc_msgSend(v22, "count"));

        [v28 setObject:v23 forKeyedSubscript:v14];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }

  return v28;
}

+ (id)analyzeFeatureImportanceWithFeatureStore:(id)a3 featureNames:(id)a4 labelName:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v38 = [v7 getFeatureVectors:v8 option:4];
  uint64_t v39 = v7;
  v37 = [v7 getMultiArrayFeatureVectors:v8 vectorName:@"vector" srcLabelName:v9 destLabelName:v9 option:4];
  v44 = v9;
  uint64_t v10 = +[LCFFeatureImportance _generateFeatureDictionaryForFeatureStore:featureNames:labelName:](LCFFeatureImportance, "_generateFeatureDictionaryForFeatureStore:featureNames:labelName:");
  uint64_t v11 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v8;
  uint64_t v12 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v17 = [v10 objectForKeyedSubscript:v16];
        int v18 = [v10 objectForKeyedSubscript:v44];
        uint64_t v19 = +[LCFFeatureImportance computeCorrelationBetweenVector:v17 andOtherVector:v18];

        [v11 setObject:v19 forKeyedSubscript:v16];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v13);
  }

  id v43 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v40 = [v11 allKeys];
  uint64_t v20 = [v40 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v42 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v46 != v42) {
          objc_enumerationMutation(v40);
        }
        uint64_t v23 = *(void *)(*((void *)&v45 + 1) + 8 * j);
        id v24 = objc_alloc(MEMORY[0x263F515F0]);
        v25 = NSNumber;
        v26 = [v10 objectForKeyedSubscript:v23];
        v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
        id v28 = [v11 objectForKeyedSubscript:v23];
        long long v29 = [v11 objectForKeyedSubscript:v23];
        long long v30 = (void *)[v24 init:v23 featureCount:v27 correlationCoefficient:v28 featureImportance:v29];

        [v43 addObject:v30];
      }
      uint64_t v21 = [v40 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v21);
  }

  id v31 = objc_alloc(MEMORY[0x263F515F8]);
  id v32 = objc_alloc(MEMORY[0x263F515D0]);
  long long v33 = [MEMORY[0x263F515B8] fromMLProvider:v38];
  long long v34 = (void *)[v32 init:v33 labelFeatureName:v44];
  long long v35 = (void *)[v31 init:v34 targetLabelFeatureName:v44 results:v43 succeeded:&unk_2703F9C70 analysisError:0];

  [MEMORY[0x263F515E8] emitFeatureImportanceEvent:v35];
  return v11;
}

+ (id)_generateFeatureDictionaryForFeatureStore:(id)a3 featureNames:(id)a4 labelName:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v40 = v9;
    uint64_t v10 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v38 = v8;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v44 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v17 = objc_opt_new();
          [v10 setObject:v17 forKeyedSubscript:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v13);
    }

    int v18 = objc_opt_new();
    id v9 = v40;
    [v10 setObject:v18 forKeyedSubscript:v40];

    if ([v7 count] < 1)
    {
LABEL_16:
      id v36 = v10;
      id v8 = v38;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v39 = v7;
      while (1)
      {
        uint64_t v20 = [v7 featuresAtIndex:v19];
        uint64_t v21 = [v20 featureValueForName:@"vector"];
        v22 = [v21 multiArrayValue];

        uint64_t v42 = v20;
        uint64_t v23 = [v20 featureValueForName:v9];
        uint64_t v41 = [v23 int64Value];

        id v24 = v22;
        uint64_t v25 = [v24 dataPointer];
        v26 = [v24 shape];
        v27 = [v26 objectAtIndexedSubscript:0];
        uint64_t v28 = [v27 longLongValue];

        if (v28 != [v11 count]) {
          break;
        }
        if ([v11 count])
        {
          unint64_t v29 = 0;
          do
          {
            long long v30 = [v11 objectAtIndexedSubscript:v29];
            double v31 = *(double *)(v25 + 8 * v29);
            id v32 = [v10 objectForKeyedSubscript:v30];
            long long v33 = [NSNumber numberWithDouble:v31];
            [v32 addObject:v33];

            ++v29;
          }
          while ([v11 count] > v29);
        }
        id v9 = v40;
        long long v34 = [v10 objectForKeyedSubscript:v40];
        long long v35 = [NSNumber numberWithDouble:(double)v41];
        [v34 addObject:v35];

        ++v19;
        id v7 = v39;
        if ([v39 count] <= v19) {
          goto LABEL_16;
        }
      }

      id v36 = 0;
      id v8 = v38;
      id v9 = v40;
    }
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

+ (id)computeCorrelationBetweenVector:(id)a3 andOtherVector:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        [v13 doubleValue];
        double v11 = v11 + v14;
        [v13 doubleValue];
        double v16 = v15;
        [v13 doubleValue];
        double v10 = v10 + v16 * v17;
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
  }
  if ([v5 count])
  {
    double v18 = v11 / (float)(unint64_t)[v5 count];
    double v19 = sqrt((v10 - v11 * v11 / (double)(unint64_t)[v5 count])/ (double)(unint64_t)(objc_msgSend(v5, "count") - 1));
  }
  else
  {
    double v19 = -1.0;
    double v18 = -1.0;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v20 = v6;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    double v24 = 0.0;
    double v25 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        v27 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        objc_msgSend(v27, "doubleValue", (void)v44);
        double v24 = v24 + v28;
        [v27 doubleValue];
        double v30 = v29;
        [v27 doubleValue];
        double v25 = v25 + v30 * v31;
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v22);
  }
  else
  {
    double v24 = 0.0;
    double v25 = 0.0;
  }

  if ([v20 count])
  {
    double v32 = v24 / (float)(unint64_t)[v20 count];
    double v33 = sqrt((v25 - v24 * v24 / (double)(unint64_t)[v20 count])/ (double)(unint64_t)(objc_msgSend(v20, "count") - 1));
  }
  else
  {
    double v32 = -1.0;
    double v33 = -1.0;
  }
  if (objc_msgSend(v5, "count", (void)v44))
  {
    unint64_t v34 = 0;
    double v35 = 0.0;
    do
    {
      id v36 = [v5 objectAtIndexedSubscript:v34];
      v37 = [v20 objectAtIndexedSubscript:v34];
      [v36 doubleValue];
      double v39 = (v38 - v18) / v19;
      [v37 doubleValue];
      double v35 = v35 + v39 * ((v40 - v32) / v33);

      ++v34;
    }
    while ([v5 count] > v34);
  }
  else
  {
    double v35 = 0.0;
  }
  unint64_t v41 = [v5 count];
  uint64_t v42 = [NSNumber numberWithDouble:v35 * (1.0 / ((double)v41 + -1.0))];

  return v42;
}

@end