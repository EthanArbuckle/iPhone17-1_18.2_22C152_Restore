@interface SGMISaliencyModel
+ (double)saliencyThreshold;
+ (id)defaultModel;
+ (id)getSaliencyOutputOf:(id)a3 forArray:(id)a4;
+ (id)saliencyForFeatureVector:(id)a3;
+ (int64_t)ruleBasedInferenceFor:(id)a3;
+ (int64_t)ruleBasedInferenceFor:(id)a3 config:(id)a4;
@end

@implementation SGMISaliencyModel

+ (id)getSaliencyOutputOf:(id)a3 forArray:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  v26[0] = &unk_1F25359D0;
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v26[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  id v24 = 0;
  v10 = (void *)[v7 initWithShape:v9 dataType:65568 error:&v24];
  id v11 = v24;

  if (v10)
  {
    if ([v6 count])
    {
      unint64_t v12 = 0;
      do
      {
        v13 = [v6 objectAtIndexedSubscript:v12];
        v25[0] = &unk_1F25359B8;
        v14 = [NSNumber numberWithInt:v12];
        v25[1] = v14;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
        [v10 setObject:v13 forKeyedSubscript:v15];

        ++v12;
      }
      while ([v6 count] > v12);
    }
    v16 = [[SGMISaliencyModelFeatureProvider alloc] initWithData:v10];
    id v23 = v11;
    v17 = [v5 predictionFromFeatures:v16 error:&v23];
    id v18 = v23;

    if (v17)
    {
      v19 = [v17 featureValueForName:@"Identity"];
      v20 = [v19 multiArrayValue];

      if (v20) {
        v21 = [[SGMISaliencyModelOutput alloc] initWithData:v20];
      }
      else {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }

    id v11 = v18;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (double)saliencyThreshold
{
  v2 = +[SGMISaliencyModelConfig defaultConfig];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 threshold];
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 2.0;
  }

  return v6;
}

+ (id)saliencyForFeatureVector:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = +[SGMISaliencyModelConfig defaultConfig];
  double v6 = v5;
  if (v5)
  {
    id v7 = [v5 featureNames];
    v8 = [a1 defaultModel];
    if (v8)
    {
      id v65 = a1;
      v9 = [v4 flatVectorForFeatureNames:v7];
      v66 = v8;
      v10 = [v8 modelDescription];
      id v11 = [v10 inputDescriptionsByName];
      unint64_t v12 = [v11 objectForKeyedSubscript:@"featureVector"];
      v13 = [v12 multiArrayConstraint];
      v14 = [v13 shape];
      v15 = [v14 objectAtIndexedSubscript:1];

      v16 = v15;
      uint64_t v17 = [v9 count];
      if (v17 == [v15 unsignedIntegerValue])
      {
        id v18 = objc_alloc(MEMORY[0x1E4F1E9A8]);
        v70[0] = &unk_1F25359D0;
        v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v70[1] = v19;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
        id v68 = 0;
        v21 = (void *)[v18 initWithShape:v20 dataType:65568 error:&v68];
        id v22 = v68;

        if (v21)
        {
          v63 = v22;
          v64 = v15;
          if ([v9 count])
          {
            unint64_t v23 = 0;
            do
            {
              id v24 = [v9 objectAtIndexedSubscript:v23];
              [v24 doubleValue];
              double v26 = v25;

              v27 = [v6 mean];
              v28 = [v27 objectAtIndexedSubscript:v23];
              [v28 doubleValue];
              double v30 = v29;

              v31 = [v6 std];
              v32 = [v31 objectAtIndexedSubscript:v23];
              [v32 doubleValue];
              double v34 = v33;

              v35 = [NSNumber numberWithDouble:(v26 - v30) / v34];
              v69[0] = &unk_1F25359B8;
              v36 = [NSNumber numberWithInt:v23];
              v69[1] = v36;
              v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
              [v21 setObject:v35 forKeyedSubscript:v37];

              ++v23;
            }
            while ([v9 count] > v23);
          }
          v38 = [[SGMISaliencyModelFeatureProvider alloc] initWithData:v21];
          id v67 = v63;
          v8 = v66;
          v39 = [v66 predictionFromFeatures:v38 error:&v67];
          id v62 = v67;

          if (v39)
          {
            v40 = [v39 featureValueForName:@"Identity"];
            uint64_t v41 = [v40 multiArrayValue];

            v61 = v39;
            if (v41)
            {
              v42 = [[SGMISaliencyModelOutput alloc] initWithData:v41];
              [(SGMISaliencyModelOutput *)v42 regularScore];
              double v44 = exp(v43);
              [(SGMISaliencyModelOutput *)v42 salientScore];
              long double v46 = exp(v45);
              long double v47 = v46 / (v44 + v46);
              [v65 saliencyThreshold];
              BOOL v49 = v47 > v48;
              v50 = [NSNumber numberWithDouble:(double)v47];
              BOOL v51 = v49;
              v8 = v66;
              [v4 saliencyWithScore:v50 isSalient:v51];
              v53 = v52 = (void *)v41;
            }
            else
            {
              v59 = sgMailIntelligenceLogHandle();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1CA650000, v59, OS_LOG_TYPE_ERROR, "SGMISaliencyModel: Error while parsing SGMISaliencyModel inference.", buf, 2u);
              }

              v53 = [v4 defaultSaliencyOnError];
              v52 = 0;
            }
            v16 = v64;
            id v22 = v62;

            v39 = v61;
          }
          else
          {
            v58 = sgMailIntelligenceLogHandle();
            id v22 = v62;
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v72 = v62;
              _os_log_error_impl(&dword_1CA650000, v58, OS_LOG_TYPE_ERROR, "SGMISaliencyModel: Error while running SGMISaliencyModel inference: %@", buf, 0xCu);
            }

            v53 = [v4 defaultSaliencyOnError];
            v16 = v64;
          }
        }
        else
        {
          v57 = sgMailIntelligenceLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v72 = v22;
            _os_log_error_impl(&dword_1CA650000, v57, OS_LOG_TYPE_ERROR, "SGMISaliencyModel: Error while initializing MLMultiArray for SGMISaliencyModel inference: %@", buf, 0xCu);
          }

          v53 = [v4 defaultSaliencyOnError];
          v8 = v66;
        }
      }
      else
      {
        v56 = sgMailIntelligenceLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v72 = v15;
          __int16 v73 = 2048;
          uint64_t v74 = [v9 count];
          _os_log_error_impl(&dword_1CA650000, v56, OS_LOG_TYPE_ERROR, "Error while preparing feature vector for mlmodel: dimension mismatch, expecting %@ got %lu", buf, 0x16u);
        }

        v53 = [v4 defaultSaliencyOnError];
        v8 = v66;
      }
    }
    else
    {
      v55 = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v55, OS_LOG_TYPE_ERROR, "Error - Couldn't get default saliency model when trying to run inference.", buf, 2u);
      }

      v53 = [v4 defaultSaliencyOnError];
    }
  }
  else
  {
    v54 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v54, OS_LOG_TYPE_ERROR, "SGMISaliencyModel: Unable to load SGMISaliencyModelConfig defaultConfig", buf, 2u);
    }

    v53 = [v4 defaultSaliencyOnError];
  }

  return v53;
}

+ (int64_t)ruleBasedInferenceFor:(id)a3 config:(id)a4
{
  if (!a4) {
    return 2;
  }
  id v5 = a3;
  double v6 = [a4 saliencyOverrideRules];
  int64_t v7 = [v5 evaluateFirstMatchAmong:v6 defaultValue:2];

  return v7;
}

+ (int64_t)ruleBasedInferenceFor:(id)a3
{
  id v3 = a3;
  id v4 = +[SGMISaliencyModelConfig defaultConfig];
  int64_t v5 = +[SGMISaliencyModel ruleBasedInferenceFor:v3 config:v4];

  return v5;
}

+ (id)defaultModel
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, "SGMISaliencyModel: Loading CoreML model.", buf, 2u);
  }

  id v3 = +[SGMITrialClientWrapper sharedInstance];
  id v4 = [v3 modelPath];
  int64_t v5 = v4;
  if (!v4 || ![v4 length])
  {
    v8 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "SGMISaliencyModel: Invalid model path specifeid via Trial configuration.";
      goto LABEL_24;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_20;
  }
  double v6 = sgMailIntelligenceLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGMISaliencyModel: Loading model from Trial at path: %@", buf, 0xCu);
  }

  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v5];
  if (!v7)
  {
    v8 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "SGMISaliencyModel: Error converting model path to file URL";
LABEL_24:
      _os_log_fault_impl(&dword_1CA650000, v8, OS_LOG_TYPE_FAULT, v15, buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v8 = v7;
  v9 = objc_opt_new();
  [v9 setComputeUnits:0];
  id v17 = 0;
  v10 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v8 configuration:v9 error:&v17];
  id v11 = v17;
  unint64_t v12 = sgMailIntelligenceLogHandle();
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "SGMISaliencyModel: Finished loading CoreML model.", buf, 2u);
    }

    id v14 = v10;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_fault_impl(&dword_1CA650000, v13, OS_LOG_TYPE_FAULT, "SGMISaliencyModel: Error while initializing MLModel: %@", buf, 0xCu);
    }
  }
LABEL_20:

  return v10;
}

@end