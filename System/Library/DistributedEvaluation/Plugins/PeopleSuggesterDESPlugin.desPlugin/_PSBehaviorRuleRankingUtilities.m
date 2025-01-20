@interface _PSBehaviorRuleRankingUtilities
+ (BOOL)copyFileFromURL:(id)a3 toURL:(id)a4;
+ (BOOL)copyZippedAdaptableModel:(id)a3;
+ (BOOL)loadDeployedAdaptableModelUnderDirectory:(id)a3;
+ (BOOL)removeFolderAtPath:(id)a3;
+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featureDictArray:(id)a5;
+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featurizedRules:(id)a5;
+ (id)batchPredictWithMLModel:(id)a3 featureArrayDict:(id)a4;
+ (id)compileMLModelAtPath:(id)a3;
+ (id)getAdaptedCompiledMLModelPath;
+ (id)getAdaptedModelRecipeVersionFilePath;
+ (id)getArchivedDefaultAdaptableModelPath;
+ (id)getDeployedAdaptableCompiledMLModelPath;
+ (id)getDeployedCompiledMLModelPath;
+ (id)getDeployedCompiledMLModelPathForContactRanker;
+ (id)getIntermediateAdaptableCompiledMLModel;
+ (id)getTrialCompiledAdaptableMLModelPath;
+ (id)getTrialCompiledMLModelPath;
+ (id)getTrialCompiledMLModelPathForContactRanker;
+ (id)getZippedDefaultAdaptableModelPath;
+ (id)loadAdaptableModelConfig:(id)a3;
+ (id)loadMLModel:(id)a3 modelConfig:(id)a4;
+ (id)loadMLModelConfigurationWithConfigDict:(id)a3;
+ (id)predictWithMLModel:(id)a3 featureDictArray:(id)a4;
+ (id)reformatFeaturesInFeatureDictArray:(id)a3;
+ (id)reformatFeaturesInFeaturizedBehaviorRuleArray:(id)a3;
+ (id)unzipFileWithPath:(id)a3 toFileName:(id)a4 toFolderPath:(id)a5;
@end

@implementation _PSBehaviorRuleRankingUtilities

+ (id)getTrialCompiledMLModelPath
{
  v2 = +[_CDPaths peopleDirectory];
  v3 = [v2 stringByAppendingString:@"TrialRuleImportancePredictor.mlmodelc"];

  return v3;
}

+ (id)getTrialCompiledMLModelPathForContactRanker
{
  v2 = +[_CDPaths peopleDirectory];
  v3 = [v2 stringByAppendingString:@"TrialContactRankerModel.mlmodelc"];

  return v3;
}

+ (id)getTrialCompiledAdaptableMLModelPath
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"TrialAdaptableRuleImportancePredictor.mlmodelc"];
}

+ (id)getAdaptedCompiledMLModelPath
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"AdaptedRuleImportancePredictor.mlmodelc"];
}

+ (id)getDeployedCompiledMLModelPath
{
  return [@"/System/Library/PrivateFrameworks/PeopleSuggester.framework/" stringByAppendingString:@"RuleImportancePredictor.mlmodelc"];
}

+ (id)getDeployedCompiledMLModelPathForContactRanker
{
  return [@"/System/Library/PrivateFrameworks/PeopleSuggester.framework/" stringByAppendingString:@"ContactRankerModel.mlmodelc"];
}

+ (id)getDeployedAdaptableCompiledMLModelPath
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc"];
}

+ (id)getIntermediateAdaptableCompiledMLModel
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"IntermediateAdaptableModel.mlmodelc"];
}

+ (id)getAdaptedModelRecipeVersionFilePath
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"adaptedModelRecipeVersion.txt"];
}

+ (id)getArchivedDefaultAdaptableModelPath
{
  return [@"/System/Library/DistributedEvaluation/Plugins/PeopleSuggesterDESPlugin.desPlugin/" stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc.archivedMLModel"];
}

+ (id)getZippedDefaultAdaptableModelPath
{
  return [@"/var/tmp/com.apple.siri-distributed-evaluation/" stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc.zip"];
}

+ (id)loadAdaptableModelConfig:(id)a3
{
  id v3 = a3;
  v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "loadAdaptableModelConfig is invoked with config file path: %@", buf, 0xCu);
  }

  v5 = +[NSURL fileURLWithPath:v3];
  id v12 = 0;
  v6 = +[NSDictionary dictionaryWithContentsOfURL:v5 error:&v12];
  id v7 = v12;
  v8 = +[_PSLogging generalChannel];
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Loaded adaptable model config from:%@", buf, 0xCu);
    }

    id v10 = v6;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_EAD0();
    }
  }

  return v6;
}

+ (id)loadMLModelConfigurationWithConfigDict:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v4 = (void *)qword_1DF60;
    uint64_t v34 = qword_1DF60;
    if (!qword_1DF60)
    {
      sub_44F8();
      v32[3] = (uint64_t)objc_getClass("MLModelConfiguration");
      qword_1DF60 = v32[3];
      v4 = (void *)v32[3];
    }
    v5 = v4;
    _Block_object_dispose(&v31, 8);
    id v30 = objc_alloc_init(v5);
    [v30 setComputeUnits:0];
    v6 = [v3 objectForKeyedSubscript:@"numClasses"];
    id v7 = [v6 integerValue];

    v8 = [v3 objectForKeyedSubscript:@"numTrees"];
    id v9 = [v8 integerValue];

    id v10 = [v3 objectForKeyedSubscript:@"maxDepth"];
    id v11 = [v10 integerValue];

    id v12 = [v3 objectForKeyedSubscript:@"learningRate"];
    [v12 doubleValue];
    double v14 = v13;

    v15 = [v3 objectForKeyedSubscript:@"minChildWeight"];
    id v16 = [v15 integerValue];

    v29 = [sub_20E0() numClasses];
    v35[0] = v29;
    v28 = +[NSNumber numberWithInteger:v7];
    v36[0] = v28;
    v27 = [sub_20E0() numTrees];
    v35[1] = v27;
    v17 = +[NSNumber numberWithInteger:v9];
    v36[1] = v17;
    v18 = [sub_20E0() maxDepth];
    v35[2] = v18;
    v19 = +[NSNumber numberWithInteger:v11];
    v36[2] = v19;
    v20 = [sub_20E0() learningRate];
    v35[3] = v20;
    v21 = +[NSNumber numberWithDouble:v14];
    v36[3] = v21;
    v22 = [sub_20E0() minChildWeight];
    v35[4] = v22;
    v23 = +[NSNumber numberWithInteger:v16];
    v36[4] = v23;
    v24 = [sub_20E0() objective];
    v35[5] = v24;
    v36[5] = @"binary:logistic";
    v25 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:6];
    [v30 setParameters:v25];
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

+ (id)loadMLModel:(id)a3 modelConfig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "loadMLModel is invoked with model path: %@", buf, 0xCu);
  }

  id v8 = objc_alloc_init((Class)NSFileManager);
  if ([v8 fileExistsAtPath:v5])
  {
    id v9 = [objc_alloc((Class)NSURL) initFileURLWithPath:v5];
    id v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Trying to load model with compiled model path: %@", buf, 0xCu);
    }

    id v11 = sub_2400();
    if (v6)
    {
      uint64_t v20 = 0;
      id v12 = (id *)&v20;
      uint64_t v13 = [v11 modelWithContentsOfURL:v9 configuration:v6 error:&v20];
    }
    else
    {
      uint64_t v19 = 0;
      id v12 = (id *)&v19;
      uint64_t v13 = [v11 modelWithContentsOfURL:v9 error:&v19];
    }
    double v14 = (void *)v13;
    id v15 = *v12;
    id v16 = v15;
    if (!v14 || v15)
    {
      v17 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_EB38();
      }
    }
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

+ (id)reformatFeaturesInFeaturizedBehaviorRuleArray:(id)a3
{
  id v3 = a3;
  id v27 = objc_alloc_init((Class)NSMutableDictionary);
  if ((unint64_t)[v3 count] >= 2)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v5 = [v3 objectAtIndexedSubscript:0];
    id v6 = [v5 features];

    id v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v38;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(v6);
          }
          [v4 addObject:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        }
        id v8 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v8);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v4;
    id v28 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v28)
    {
      uint64_t v26 = *(void *)v34;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
          id v13 = objc_alloc_init((Class)NSMutableArray);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v14 = v3;
          id v15 = v3;
          id v16 = [v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v30;
            do
            {
              for (k = 0; k != v17; k = (char *)k + 1)
              {
                if (*(void *)v30 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)k) features];
                v21 = [v20 objectForKeyedSubscript:v12];
                [v13 addObject:v21];
              }
              id v17 = [v15 countByEnumeratingWithState:&v29 objects:v41 count:16];
            }
            while (v17);
          }

          id v22 = [v13 copy];
          [v27 setObject:v22 forKeyedSubscript:v12];

          id v3 = v14;
        }
        id v28 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v28);
    }
  }
  id v23 = [v27 copy];

  return v23;
}

+ (id)reformatFeaturesInFeatureDictArray:(id)a3
{
  id v3 = a3;
  id v27 = objc_alloc_init((Class)NSMutableDictionary);
  if ((unint64_t)[v3 count] >= 2)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v5 = [v3 objectAtIndexedSubscript:0];
    id v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v37;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 addObject:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        }
        id v7 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v7);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v4;
    id v10 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (j = 0; j != v11; j = (char *)j + 1)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * (void)j);
          id v14 = objc_alloc_init((Class)NSMutableArray);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v15 = v3;
          id v16 = v3;
          id v17 = [v16 countByEnumeratingWithState:&v28 objects:v40 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v29;
            do
            {
              for (k = 0; k != v18; k = (char *)k + 1)
              {
                if (*(void *)v29 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)k) objectForKeyedSubscript:v13];
                [v14 addObject:v21];
              }
              id v18 = [v16 countByEnumeratingWithState:&v28 objects:v40 count:16];
            }
            while (v18);
          }

          id v22 = [v14 copy];
          [v27 setObject:v22 forKeyedSubscript:v13];

          id v3 = v15;
        }
        id v11 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v11);
    }
  }
  id v23 = [v27 copy];

  return v23;
}

+ (id)predictWithMLModel:(id)a3 featureDictArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * v12);
      id v14 = objc_alloc((Class)sub_2D6C());
      id v27 = 0;
      id v15 = [v14 initWithDictionary:v13 error:&v27];
      id v16 = v27;
      if (v16) {
        break;
      }
      id v26 = 0;
      id v17 = [v5 predictionFromFeatures:v15 error:&v26];
      id v18 = v26;
      if (v18)
      {
        id v23 = v18;
        v24 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_EBA0();
        }

LABEL_18:
        id v22 = 0;
        goto LABEL_19;
      }
      uint64_t v19 = [v17 featureValueForName:@"classProbability"];
      uint64_t v20 = [v19 dictionaryValue];

      if ([v20 count] == (char *)&dword_0 + 2)
      {
        v21 = [v20 objectForKeyedSubscript:&off_18FF8];
        [v7 addObject:v21];
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    id v23 = v16;
    id v17 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_EBD4();
    }
    goto LABEL_18;
  }
LABEL_12:

  id v22 = [v7 copy];
LABEL_19:

  return v22;
}

+ (id)batchPredictWithMLModel:(id)a3 featureArrayDict:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v22 = 0;
  id v8 = [objc_alloc((Class)sub_307C()) initWithDictionary:v6 error:&v22];
  id v9 = v22;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_EC3C();
    }
LABEL_8:
    id v13 = 0;
    goto LABEL_9;
  }
  id v21 = 0;
  uint64_t v11 = [v5 predictionsFromBatch:v8 error:&v21];
  id v10 = v21;
  if (v10)
  {
    uint64_t v12 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_EC08();
    }

    goto LABEL_8;
  }
  id v20 = v5;
  if ((uint64_t)[v11 count] >= 1)
  {
    uint64_t v15 = 0;
    do
    {
      id v16 = [v11 featuresAtIndex:v15];
      id v17 = [v16 featureValueForName:@"classProbability"];
      id v18 = [v17 dictionaryValue];

      if ([v18 count] == (char *)&dword_0 + 2)
      {
        uint64_t v19 = [v18 objectForKeyedSubscript:&off_18FF8];
        [v7 addObject:v19];
      }
      ++v15;
    }
    while (v15 < (uint64_t)[v11 count]);
  }
  id v13 = [v7 copy];
  id v5 = v20;
LABEL_9:

  return v13;
}

+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featurizedRules:(id)a5
{
  id v38 = a3;
  id v7 = a4;
  id v8 = a5;
  long long v39 = v7;
  id v40 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [v7 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"];
  v45 = +[NSMutableArray array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v10 = v8;
  id v44 = [v10 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v44)
  {
    id obj = v10;
    uint64_t v43 = *(void *)v52;
    while (2)
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v52 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v13 = [&__NSDictionary0__struct mutableCopy];
        id v14 = objc_alloc((Class)sub_366C());
        uint64_t v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
        v55 = v15;
        id v16 = +[NSArray arrayWithObjects:&v55 count:1];
        id v50 = 0;
        id v17 = [v14 initWithShape:v16 dataType:65568 error:&v50];
        id v18 = v50;

        if (v18)
        {
          v25 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_ECE4();
          }
          goto LABEL_22;
        }
        if ([v9 count])
        {
          unint64_t v19 = 0;
          do
          {
            id v20 = [v12 features];
            id v21 = [v9 objectAtIndexedSubscript:v19];
            id v22 = [v20 objectForKeyedSubscript:v21];

            [v22 floatValue];
            id v23 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            [v17 setObject:v23 atIndexedSubscript:v19];

            ++v19;
          }
          while (v19 < (unint64_t)[v9 count]);
        }
        [v13 setObject:v17 forKeyedSubscript:@"input"];
        id v24 = objc_alloc((Class)sub_2D6C());
        id v49 = 0;
        v25 = [v24 initWithDictionary:v13 error:&v49];
        id v26 = v49;
        if (v26)
        {
          id v18 = v26;
          long long v31 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_ECA4(&buf, v48, v31);
          }

LABEL_22:
          long long v28 = v38;
          id v10 = obj;

          id v30 = 0;
          id v27 = obj;
          goto LABEL_23;
        }
        [v45 addObject:v25];
      }
      id v10 = obj;
      id v44 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v44) {
        continue;
      }
      break;
    }
  }

  id v27 = [objc_alloc((Class)sub_307C()) initWithFeatureProviderArray:v45];
  id v46 = 0;
  long long v28 = v38;
  id v13 = [v38 predictionsFromBatch:v27 error:&v46];
  id v18 = v46;
  if (v18)
  {
    long long v29 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_EC70();
    }

    id v30 = 0;
  }
  else
  {
    id obja = v10;
    if ((uint64_t)[v13 count] >= 1)
    {
      uint64_t v33 = 0;
      do
      {
        long long v34 = [v13 featuresAtIndex:v33];
        long long v35 = [v34 featureValueForName:@"classProbability"];
        long long v36 = [v35 dictionaryValue];

        if ([v36 count] == (char *)&dword_0 + 2)
        {
          long long v37 = [v36 objectForKeyedSubscript:&off_18FF8];
          [v40 addObject:v37];
        }
        ++v33;
      }
      while (v33 < (uint64_t)[v13 count]);
    }
    id v30 = [v40 copy];
    id v10 = obja;
  }
LABEL_23:

  return v30;
}

+ (id)batchPredictWithAdaptedMLModel:(id)a3 psConfigForAdaptableModel:(id)a4 featureDictArray:(id)a5
{
  id v42 = a3;
  id v7 = a4;
  id v8 = a5;
  id v43 = objc_alloc_init((Class)NSMutableArray);
  id v41 = v7;
  id v9 = [v7 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"];
  id v46 = +[NSMutableArray array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v45 = *(void *)v53;
    id v40 = v49;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v53 != v45) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v14 = objc_msgSend(&__NSDictionary0__struct, "mutableCopy", v40);
        id v15 = objc_alloc((Class)sub_366C());
        id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
        v56 = v16;
        id v17 = +[NSArray arrayWithObjects:&v56 count:1];
        id v51 = 0;
        id v18 = [v15 initWithShape:v17 dataType:65568 error:&v51];
        id v19 = v51;

        if (v19)
        {
          v25 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_ECE4();
          }
          goto LABEL_22;
        }
        if ([v9 count])
        {
          unint64_t v20 = 0;
          do
          {
            id v21 = [v9 objectAtIndexedSubscript:v20];
            id v22 = [v13 objectForKeyedSubscript:v21];

            [v22 floatValue];
            id v23 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
            [v18 setObject:v23 atIndexedSubscript:v20];

            ++v20;
          }
          while (v20 < (unint64_t)[v9 count]);
        }
        [v14 setObject:v18 forKeyedSubscript:@"input"];
        id v24 = objc_alloc((Class)sub_2D6C());
        id v50 = 0;
        v25 = [v24 initWithDictionary:v14 error:&v50];
        id v26 = v50;
        if (v26)
        {
          id v19 = v26;
          uint64_t v33 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_ECA4(&buf, v40, v33);
          }

LABEL_22:
          long long v32 = v41;
          long long v29 = v42;
          id v27 = obj;

          id v31 = 0;
          id v28 = obj;
          goto LABEL_23;
        }
        [v46 addObject:v25];
      }
      id v11 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v27 = obj;

  id v28 = [objc_alloc((Class)sub_307C()) initWithFeatureProviderArray:v46];
  id v47 = 0;
  long long v29 = v42;
  id v14 = [v42 predictionsFromBatch:v28 error:&v47];
  id v19 = v47;
  if (v19)
  {
    id v30 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_EC70();
    }

    id v31 = 0;
    long long v32 = v41;
  }
  else
  {
    if ((uint64_t)[v14 count] >= 1)
    {
      uint64_t v35 = 0;
      do
      {
        long long v36 = [v14 featuresAtIndex:v35];
        long long v37 = [v36 featureValueForName:@"classProbability"];
        id v38 = [v37 dictionaryValue];

        if ([v38 count] == (char *)&dword_0 + 2)
        {
          long long v39 = [v38 objectForKeyedSubscript:&off_18FF8];
          [v43 addObject:v39];
        }
        ++v35;
      }
      while (v35 < (uint64_t)[v14 count]);
    }
    id v31 = [v43 copy];
    long long v32 = v41;
    id v27 = obj;
  }
LABEL_23:

  return v31;
}

+ (BOOL)removeFolderAtPath:(id)a3
{
  id v3 = a3;
  char v12 = 0;
  id v4 = objc_alloc_init((Class)NSFileManager);
  if ([v4 fileExistsAtPath:v3 isDirectory:&v12]) {
    BOOL v5 = v12 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || (id v11 = 0, [v4 removeItemAtPath:v3 error:&v11], (v6 = v11) == 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    id v7 = v6;
    id v8 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_ED18();
    }

    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)copyFileFromURL:(id)a3 toURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSFileManager);
  id v12 = 0;
  unsigned __int8 v8 = [v7 copyItemAtURL:v5 toURL:v6 error:&v12];
  id v9 = v12;
  if ((v8 & 1) == 0)
  {
    id v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint8_t buf = 138412802;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Failed to copy file with path:%@ to path:%@, with error：%@", buf, 0x20u);
    }
  }
  return v8;
}

+ (id)compileMLModelAtPath:(id)a3
{
  id v3 = a3;
  id v4 = +[NSURL fileURLWithPath:v3];
  id v11 = 0;
  id v5 = [sub_2400() compileModelAtURL:v4 error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    id v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_ED80();
    }
  }

  return v5;
}

+ (id)unzipFileWithPath:(id)a3 toFileName:(id)a4 toFolderPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)NSURL) initFileURLWithPath:v9];

  id v11 = (NSURL *)[objc_alloc((Class)NSURL) initFileURLWithPath:v8];
  id v12 = +[NSData dataWithContentsOfURL:v10];
  uint64_t v13 = _PSUnarchiverZip([v12 bytes], (unint64_t)objc_msgSend(v12, "length"), v11);
  id v14 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = +[NSNumber numberWithBool:v13];
    int v27 = 138412290;
    id v28 = v15;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "_PSUnarchiverZip returned %@", (uint8_t *)&v27, 0xCu);
  }
  if (v13)
  {
    id v16 = objc_alloc((Class)NSURL);
    __int16 v17 = [v8 stringByAppendingString:v7];
    id v18 = [v16 initFileURLWithPath:v17];
  }
  else
  {
    __int16 v17 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_EDE8(v17, v19, v20, v21, v22, v23, v24, v25);
    }
    id v18 = 0;
  }

  return v18;
}

+ (BOOL)copyZippedAdaptableModel:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_EE58();
    }
    goto LABEL_10;
  }
  id v4 = +[_PSBehaviorRuleRankingUtilities getTrialCompiledAdaptableMLModelPath];
  if (!+[_PSBehaviorRuleRankingUtilities removeFolderAtPath:v4])
  {
LABEL_10:
    BOOL v6 = 0;
    goto LABEL_11;
  }
  id v5 = +[_PSBehaviorRuleRankingUtilities unzipFileWithPath:v3 toFileName:@"TrialAdaptableRuleImportancePredictor.mlmodelc" toFolderPath:@"/var/tmp/com.apple.siri-distributed-evaluation/"];
  BOOL v6 = v5 != 0;
  if (!v5)
  {
    id v7 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_EE8C();
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)loadDeployedAdaptableModelUnderDirectory:(id)a3
{
  id v3 = a3;
  char v36 = 0;
  id v4 = objc_alloc_init((Class)NSFileManager);
  id v5 = +[_PSBehaviorRuleRankingUtilities getDeployedAdaptableCompiledMLModelPath];
  if ([v4 fileExistsAtPath:v5 isDirectory:&v36]) {
    BOOL v6 = v36 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = [v3 stringByAppendingString:@"AdaptableRuleImportancePredictor.mlmodelc.archivedMLModel"];
    if (([v4 fileExistsAtPath:v7] & 1) == 0)
    {
      id v8 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_EF98((uint64_t)v7, v8, v12, v13, v14, v15, v16, v17);
      }
      id v9 = 0;
      char v10 = 0;
      goto LABEL_23;
    }
    id v8 = +[_PSBehaviorRuleRankingUtilities getZippedDefaultAdaptableModelPath];
    if ([v4 fileExistsAtPath:v8])
    {
      id v9 = 0;
    }
    else
    {
      [v4 createDirectoryAtPath:@"/var/tmp/com.apple.siri-distributed-evaluation/" withIntermediateDirectories:1 attributes:0 error:0];
      id v34 = 0;
      unsigned __int8 v18 = [v4 copyItemAtPath:v7 toPath:v8 error:&v34];
      id v9 = v34;
      if ((v18 & 1) == 0)
      {
        uint64_t v19 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_EF2C((uint64_t)v9, v19, v27, v28, v29, v30, v31, v32);
        }
        goto LABEL_21;
      }
    }
    uint64_t v19 = +[_PSBehaviorRuleRankingUtilities unzipFileWithPath:v8 toFileName:@"AdaptableRuleImportancePredictor.mlmodelc" toFolderPath:@"/var/tmp/com.apple.siri-distributed-evaluation/"];
    char v10 = v19 != 0;
    if (v19)
    {
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    uint64_t v20 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_EEC0((uint64_t)v8, v20, v21, v22, v23, v24, v25, v26);
    }

LABEL_21:
    char v10 = 0;
    goto LABEL_22;
  }
  id v9 = +[_PSLogging generalChannel];
  char v10 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t buf = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Deployed adaptable ML model already exist, no need to unzip", buf, 2u);
  }
LABEL_24:

  return v10;
}

@end