@interface LCFChangepointDetection
+ (id)_generateFeatureDictionaryForFeatureStore:(id)a3 featureNames:(id)a4 labelName:(id)a5 timestampName:(id)a6;
+ (id)analyzeChangePointInEvents:(id)a3 withTestParameters:(id)a4 lastRunDate:(id)a5;
+ (id)convertFeatureStoreToEvents:(id)a3 featureNames:(id)a4 labelName:(id)a5 valueName:(id)a6 timestampName:(id)a7;
@end

@implementation LCFChangepointDetection

+ (id)convertFeatureStoreToEvents:(id)a3 featureNames:(id)a4 labelName:(id)a5 valueName:(id)a6 timestampName:(id)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  v25 = +[LCFChangepointDetection _generateFeatureDictionaryForFeatureStore:a3 featureNames:v11 labelName:a5 timestampName:v13];
  id v26 = (id)objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v11;
  uint64_t v27 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v27)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v14;
        uint64_t v28 = *(void *)(*((void *)&v30 + 1) + 8 * v14);
        v15 = objc_msgSend(v25, "objectForKeyedSubscript:");
        v16 = [v25 objectForKeyedSubscript:v13];
        v17 = objc_opt_new();
        if ([v15 count])
        {
          unint64_t v18 = 0;
          do
          {
            v34[0] = v12;
            v19 = [v15 objectAtIndexedSubscript:v18];
            v34[1] = v13;
            v35[0] = v19;
            v20 = [v16 objectAtIndexedSubscript:v18];
            v35[1] = v20;
            v21 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];

            [v17 addObject:v21];
            ++v18;
          }
          while ([v15 count] > v18);
        }
        [v26 setObject:v17 forKeyedSubscript:v28];

        uint64_t v14 = v29 + 1;
      }
      while (v29 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v27);
  }

  return v26;
}

+ (id)_generateFeatureDictionaryForFeatureStore:(id)a3 featureNames:(id)a4 labelName:(id)a5 timestampName:(id)a6
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v51 = a6;
  id v12 = [v9 getMultiArrayFeatureVectors:v10 vectorName:@"vector" srcLabelName:v11 destLabelName:v11 option:0];
  id v13 = [v9 getFeatureVectorTimestamps];
  if ([v12 count] && (uint64_t v14 = objc_msgSend(v12, "count"), v14 == objc_msgSend(v13, "count")))
  {
    v49 = v12;
    v50 = v13;
    id v47 = v9;
    v15 = objc_opt_new();
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v46 = v10;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v56 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v55 + 1) + 8 * i);
          v22 = objc_opt_new();
          [v15 setObject:v22 forKeyedSubscript:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v18);
    }

    v23 = objc_opt_new();
    [v15 setObject:v23 forKeyedSubscript:v11];

    uint64_t v24 = objc_opt_new();
    [v15 setObject:v24 forKeyedSubscript:v51];

    id v12 = v49;
    if ([v49 count] < 1)
    {
LABEL_17:
      id v44 = v15;
      id v10 = v46;
    }
    else
    {
      uint64_t v25 = 0;
      id v48 = v11;
      while (1)
      {
        id v26 = [v12 featuresAtIndex:v25];
        uint64_t v27 = [v26 featureValueForName:@"vector"];
        uint64_t v28 = [v27 multiArrayValue];

        uint64_t v52 = v25;
        v53 = [v50 objectAtIndexedSubscript:v25];
        v54 = v26;
        uint64_t v29 = [v26 featureValueForName:v11];
        uint64_t v30 = [v29 int64Value];

        id v31 = v28;
        uint64_t v32 = [v31 dataPointer];
        long long v33 = [v31 shape];
        v34 = [v33 objectAtIndexedSubscript:0];
        uint64_t v35 = [v34 longLongValue];

        if (v35 != [v16 count]) {
          break;
        }
        if ([v16 count])
        {
          unint64_t v36 = 0;
          do
          {
            uint64_t v37 = [v16 objectAtIndexedSubscript:v36];
            double v38 = *(double *)(v32 + 8 * v36);
            v39 = [v15 objectForKeyedSubscript:v37];
            v40 = [NSNumber numberWithDouble:v38];
            [v39 addObject:v40];

            ++v36;
          }
          while ([v16 count] > v36);
        }
        id v11 = v48;
        v41 = [v15 objectForKeyedSubscript:v48];
        v42 = [NSNumber numberWithDouble:(double)v30];
        [v41 addObject:v42];

        v43 = [v15 objectForKeyedSubscript:v51];
        [v43 addObject:v53];

        uint64_t v25 = v52 + 1;
        id v12 = v49;
        if ([v49 count] <= v52 + 1) {
          goto LABEL_17;
        }
      }

      id v44 = 0;
      id v10 = v46;
      id v11 = v48;
    }
    id v13 = v50;

    id v9 = v47;
  }
  else
  {
    id v44 = 0;
  }

  return v44;
}

+ (id)analyzeChangePointInEvents:(id)a3 withTestParameters:(id)a4 lastRunDate:(id)a5
{
  return 0;
}

@end