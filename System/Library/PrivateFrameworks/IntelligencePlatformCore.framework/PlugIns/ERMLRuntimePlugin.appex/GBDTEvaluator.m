@interface GBDTEvaluator
- (float)_firstOrderGradientWithPrediction:(float)a3 label:(float)a4;
- (float)_secondOrderGradientWithPrediction:(float)a3;
- (float)_sigmoidWithValue:(float)a3;
- (id)_computeBasicMetricsForTargets:(id)a3 predictions:(id)a4;
- (id)_computeFirstOrderGradientsWithTargets:(id)a3 predictions:(id)a4 positiveSampleWeight:(id)a5;
- (id)_computePredictionsFromModelWithInputVectors:(id)a3 currentModel:(id)a4 error:(id *)a5;
- (id)_computeSecondOrderGradientsWithTargets:(id)a3 predictions:(id)a4 positiveSampleWeight:(id)a5;
- (id)_computeSumOfGradientsLeftAndRightOfSplitWithFeature:(int)a3 threshold:(float)a4 inputVectors:(id)a5 gradients:(id)a6;
- (id)_differenceArrayWithArray:(id)a3;
- (id)_evaluateResultWithGradients:(id)a3 questions:(id)a4 inputVectors:(id)a5 reportGradientsBothSidesOfSplit:(BOOL)a6 reportNodeSumGradients:(BOOL)a7 reportPerFeatureResultDifference:(BOOL)a8 reportPerNodeResultDifference:(BOOL)a9;
- (id)_findNodeSamplesWithDecisionPath:(id)a3 inputVectors:(id)a4 gradients:(id)a5;
- (id)_l1NormWithArray:(id)a3;
- (id)_l2NormWithArray:(id)a3;
- (id)_makeKeysWithInputVectors:(id)a3;
- (id)_sumAbsoluteErrorWithPredictions:(id)a3 targets:(id)a4;
- (id)_sumAccuratePredictionsWithPredictions:(id)a3 targets:(id)a4;
- (id)_translateResultWithTranslateVector:(id)a3 result:(id)a4;
- (id)_weightResultWithWeightVector:(id)a3 result:(id)a4;
- (id)evaluateWithModelURL:(id)a3 dataSource:(id)a4 processDataReturnDict:(id)a5 error:(id *)a6;
@end

@implementation GBDTEvaluator

- (id)evaluateWithModelURL:(id)a3 dataSource:(id)a4 processDataReturnDict:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = PluginGBDTLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Start of GBDT gradient computation", buf, 2u);
  }

  uint64_t v14 = [v12 objectForKeyedSubscript:@"CalculatedPositiveSampleWeight"];
  v15 = (void *)v14;
  if (v11)
  {
    v73 = self;
    v75 = (void *)v14;
    id v76 = v10;
    unsigned int v16 = [v11 computeFirstOrderGradients];
    unsigned int v17 = [v11 computeSecondOrderGradients];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      if (v16) {
        CFStringRef v18 = @"Yes";
      }
      else {
        CFStringRef v18 = @"No";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v78 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Computation and reporting of 1st order gradients: %@", buf, 0xCu);
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      if (v17) {
        CFStringRef v19 = @"Yes";
      }
      else {
        CFStringRef v19 = @"No";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v78 = v19;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Computation and reporting of 2nd order gradients: %@", buf, 0xCu);
    }

    if ((v16 | v17))
    {
      v20 = v12;
      unsigned int v71 = [v11 reportGradientsBothSidesOfSplit];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        if (v71) {
          CFStringRef v21 = @"Yes";
        }
        else {
          CFStringRef v21 = @"No";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v78 = v21;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Reporting gradients on both sides of split: %@", buf, 0xCu);
      }

      unsigned int v22 = [v11 reportNodeSumGradients];
      BOOL v23 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      unsigned int v65 = v22;
      if (v22)
      {
        if (!v23) {
          goto LABEL_32;
        }
        *(_WORD *)buf = 0;
        v24 = "Reporting sum of gradients in each node";
      }
      else
      {
        if (!v23) {
          goto LABEL_32;
        }
        *(_WORD *)buf = 0;
        v24 = "Reporting right and left gradients for last split evaluated in each node";
      }
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v24, buf, 2u);
LABEL_32:

      unsigned int v69 = [v11 reportPerFeatureResultDifference];
      id v12 = v20;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        if (v69) {
          CFStringRef v27 = @"Yes";
        }
        else {
          CFStringRef v27 = @"No";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v78 = v27;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "For each feature, report difference between gradients, rather than absolute values: %@", buf, 0xCu);
      }

      unsigned int v67 = [v11 reportPerNodeResultDifference];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        if (v67) {
          CFStringRef v28 = @"Yes";
        }
        else {
          CFStringRef v28 = @"No";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v78 = v28;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "For each node, report difference between gradients, rather than absolute values: %@", buf, 0xCu);
      }

      uint64_t v29 = +[MLModel compileModelAtURL:v10 error:a6];
      v26 = (void *)v29;
      if (*a6)
      {
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          goto LABEL_44;
        }
        *(_WORD *)buf = 0;
        v31 = "Failed to compile model.";
      }
      else
      {
        if (v29)
        {
          uint64_t v64 = +[MLModel modelWithContentsOfURL:v29 error:a6];
          if (*a6)
          {
            v15 = v75;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to load model.", buf, 2u);
            }
            id v25 = &__NSDictionary0__struct;
            v30 = v13;
            v13 = v64;
          }
          else
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Compilation of coreML model complete", buf, 2u);
            }

            v32 = [v11 inputVectors];
            v63 = [v32 mutableCopy];

            v33 = [v11 targetVector];
            id v62 = [v33 mutableCopy];

            v15 = v75;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Extraction of input vectors and targets from records into arrays complete", buf, 2u);
            }

            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              CFStringRef v34 = (const __CFString *)[v63 count];
              *(_DWORD *)buf = 134217984;
              CFStringRef v78 = v34;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Number of rows used for GBDT training = %lu", buf, 0xCu);
            }

            id v10 = v76;
            if ([v63 count])
            {
              v35 = [(GBDTEvaluator *)v73 _computePredictionsFromModelWithInputVectors:v63 currentModel:v64 error:a6];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Predictions of all input vectors from coreML model complete", buf, 2u);
              }

              id v36 = [v62 count];
              if (v36 == [v35 count])
              {
                v61 = v35;
                uint64_t v60 = [v11 GBDTQuestions];
                id v37 = objc_alloc_init((Class)NSMutableArray);
                if (v16)
                {
                  v38 = [(GBDTEvaluator *)v73 _computeFirstOrderGradientsWithTargets:v62 predictions:v61 positiveSampleWeight:v75];
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Computation of 1st order gradients complete", buf, 2u);
                  }

                  LOBYTE(v57) = v67;
                  v39 = [(GBDTEvaluator *)v73 _evaluateResultWithGradients:v38 questions:v60 inputVectors:v63 reportGradientsBothSidesOfSplit:v71 reportNodeSumGradients:v65 reportPerFeatureResultDifference:v69 reportPerNodeResultDifference:v57];
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Evaluation of results aggregating 1st order gradients left and right of splits for GBDT questions from recipe complete", buf, 2u);
                  }

                  [v37 addObjectsFromArray:v39];
                }
                if (v17)
                {
                  v40 = [(GBDTEvaluator *)v73 _computeSecondOrderGradientsWithTargets:v62 predictions:v61 positiveSampleWeight:v75];
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Computation of 2nd order gradients complete", buf, 2u);
                  }

                  LOBYTE(v57) = v67;
                  v41 = [(GBDTEvaluator *)v73 _evaluateResultWithGradients:v40 questions:v60 inputVectors:v63 reportGradientsBothSidesOfSplit:v71 reportNodeSumGradients:v65 reportPerFeatureResultDifference:v69 reportPerNodeResultDifference:v57];
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Evaluation of results aggregating 2nd order gradients left and right of splits for GBDT questions from recipe complete", buf, 2u);
                  }

                  [v37 addObjectsFromArray:v41];
                }
                v72 = [(GBDTEvaluator *)v73 _computeBasicMetricsForTargets:v62 predictions:v61];
                if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Computation of basic metrics complete", buf, 2u);
                }

                v42 = [v11 translateVector];
                v43 = [(GBDTEvaluator *)v73 _translateResultWithTranslateVector:v42 result:v37];

                if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Element-wise translation of result vector with translate vector complete", buf, 2u);
                }

                v44 = [v11 weightVector];
                uint64_t v45 = [(GBDTEvaluator *)v73 _weightResultWithWeightVector:v44 result:v43];

                if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Element-wise multiplication of result vector with weight vector complete", buf, 2u);
                }

                id v25 = objc_alloc_init((Class)NSMutableDictionary);
                [v25 addEntriesFromDictionary:v72];
                id v46 = objc_alloc_init((Class)NSMutableArray);
                [v46 addObject:v45];
                if (v46) {
                  [v25 setObject:v46 forKey:@"ModelDeltas"];
                }
                uint64_t v47 = [(GBDTEvaluator *)v73 _l1NormWithArray:v45];
                if (v47) {
                  [v25 setObject:v47 forKey:@"L1Norm"];
                }
                v68 = (void *)v47;
                v70 = (void *)v45;
                uint64_t v48 = [(GBDTEvaluator *)v73 _l2NormWithArray:v45];
                if (v48) {
                  [v25 setObject:v48 forKey:@"L2Norm"];
                }
                v66 = (void *)v48;
                uint64_t v49 = [(GBDTEvaluator *)v73 _sumAbsoluteErrorWithPredictions:v61 targets:v62];
                if (v49) {
                  [v25 setObject:v49 forKey:@"SumAbsolutePredictionError"];
                }
                v59 = (void *)v49;
                uint64_t v50 = [(GBDTEvaluator *)v73 _sumAccuratePredictionsWithPredictions:v61 targets:v62];
                if (v50) {
                  [v25 setObject:v50 forKey:@"SumAccuratePredictions"];
                }
                v58 = (void *)v50;
                v74 = v46;
                v51 = [v20 objectForKeyedSubscript:@"NumberTrainingSessions"];
                v30 = v63;
                if (v51) {
                  [v25 setObject:v51 forKey:@"NumberTrainingSessions"];
                }
                v52 = [v20 objectForKeyedSubscript:@"NumberTrainingRecords"];
                if (v52) {
                  [v25 setObject:v52 forKey:@"NumberTrainingRecords"];
                }
                v53 = [v20 objectForKeyedSubscript:@"NumberTrainingRecordsClass0"];
                if (v53) {
                  [v25 setObject:v53 forKey:@"NumberTrainingRecordsClass0"];
                }
                v54 = [v20 objectForKeyedSubscript:@"NumberTrainingRecordsClass1"];
                if (v54) {
                  [v25 setObject:v54 forKey:@"NumberTrainingRecordsClass1"];
                }

                id v10 = v76;
                v13 = v64;
                v55 = (void *)v60;
                v35 = v61;
              }
              else
              {
                id v10 = v76;
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Length of targets arrays does not equal length of predictions array", buf, 2u);
                }
                id v25 = &__NSDictionary0__struct;
                v55 = v13;
                v30 = v63;
                v13 = v64;
              }
            }
            else
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No valid records for GBDT evaluation", buf, 2u);
              }
              id v25 = &__NSDictionary0__struct;
              v35 = v13;
              v30 = v63;
              v13 = v64;
            }
          }
          goto LABEL_110;
        }
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_44:
          id v25 = &__NSDictionary0__struct;
          v15 = v75;
LABEL_110:

          goto LABEL_111;
        }
        *(_WORD *)buf = 0;
        v31 = "nil compiledModelURL.";
      }
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v31, buf, 2u);
      goto LABEL_44;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Not computing or reporting 1st and 2nd order gradients. This is because ComputeFirstOrderGradients and ComputeSecondOrderGradients in recipe were both set to 0. Set these parameters to 1 if gradients are to be computed and reported. Exiting without computing result.", buf, 2u);
    }
    id v25 = &__NSDictionary0__struct;
    v26 = v13;
    v15 = v75;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "dataSource was nil", buf, 2u);
    }
    id v25 = &__NSDictionary0__struct;
    v26 = v13;
  }
LABEL_111:

  return v25;
}

- (id)_differenceArrayWithArray:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = [v3 objectAtIndexedSubscript:0];
    [v4 addObject:v5];

    if ((int)[v3 count] >= 2)
    {
      uint64_t v6 = 1;
      do
      {
        v7 = [v3 objectAtIndexedSubscript:v6];
        [v7 floatValue];
        float v9 = v8;
        id v10 = [v3 objectAtIndexedSubscript:v6 - 1];
        [v10 floatValue];
        float v12 = v9 - v11;

        *(float *)&double v13 = v12;
        uint64_t v14 = +[NSNumber numberWithFloat:v13];
        [v4 addObject:v14];

        ++v6;
      }
      while (v6 < (int)[v3 count]);
    }
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (id)_translateResultWithTranslateVector:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = PluginGBDTLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v19 = 134217984;
    id v20 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Size of result vector: %lu", (uint8_t *)&v19, 0xCu);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 count];
    int v19 = 134217984;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Size of translate vector: %lu", (uint8_t *)&v19, 0xCu);
  }

  id v9 = [v5 count];
  if (v9 == [v6 count])
  {
    if ((int)[v6 count] >= 1)
    {
      uint64_t v10 = 0;
      do
      {
        float v11 = [v6 objectAtIndexedSubscript:v10];
        [v11 floatValue];
        float v13 = v12;
        uint64_t v14 = [v5 objectAtIndexedSubscript:v10];
        [v14 floatValue];
        *(float *)&double v16 = v13 + v15;
        unsigned int v17 = +[NSNumber numberWithFloat:v16];
        [v6 setObject:v17 atIndexedSubscript:v10];

        ++v10;
      }
      while (v10 < (int)[v6 count]);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Translate vector is not the same size as result vector. No translating of results applied.", (uint8_t *)&v19, 2u);
    }
  }
  return v6;
}

- (id)_weightResultWithWeightVector:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = PluginGBDTLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v19 = 134217984;
    id v20 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Size of result vector: %lu", (uint8_t *)&v19, 0xCu);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 count];
    int v19 = 134217984;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Size of weight vector: %lu", (uint8_t *)&v19, 0xCu);
  }

  id v9 = [v5 count];
  if (v9 == [v6 count])
  {
    if ((int)[v6 count] >= 1)
    {
      uint64_t v10 = 0;
      do
      {
        float v11 = [v6 objectAtIndexedSubscript:v10];
        [v11 floatValue];
        float v13 = v12;
        uint64_t v14 = [v5 objectAtIndexedSubscript:v10];
        [v14 floatValue];
        *(float *)&double v16 = v13 * v15;
        unsigned int v17 = +[NSNumber numberWithFloat:v16];
        [v6 setObject:v17 atIndexedSubscript:v10];

        ++v10;
      }
      while (v10 < (int)[v6 count]);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Weight vector is not the same size as result vector. No weighting of results is being applied.", (uint8_t *)&v19, 2u);
    }
  }
  return v6;
}

- (id)_evaluateResultWithGradients:(id)a3 questions:(id)a4 inputVectors:(id)a5 reportGradientsBothSidesOfSplit:(BOOL)a6 reportNodeSumGradients:(BOOL)a7 reportPerFeatureResultDifference:(BOOL)a8 reportPerNodeResultDifference:(BOOL)a9
{
  BOOL v80 = a8;
  BOOL v69 = a7;
  BOOL v90 = a6;
  id v73 = a3;
  id v12 = a4;
  id v72 = a5;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  if ((int)[v12 count] < 1) {
    goto LABEL_66;
  }
  uint64_t v15 = 0;
  *(void *)&long long v14 = 67109376;
  long long v68 = v14;
  v88 = self;
  v70 = v13;
  id v71 = v12;
  do
  {
    double v16 = objc_msgSend(v12, "objectAtIndexedSubscript:", v15, v68);
    uint64_t v17 = [v16 objectForKeyedSubscript:@"decisionPath"];

    CFStringRef v18 = [v12 objectAtIndexedSubscript:v15];
    int v19 = [v18 objectForKeyedSubscript:@"splits"];

    id v76 = (void *)v17;
    id v20 = [(GBDTEvaluator *)self _findNodeSamplesWithDecisionPath:v17 inputVectors:v72 gradients:v73];
    CFStringRef v21 = [v20 objectAtIndex:0];
    v75 = v20;
    v87 = [v20 objectAtIndex:1];
    id v22 = objc_alloc_init((Class)NSMutableArray);
    id v78 = objc_alloc_init((Class)NSMutableArray);
    v83 = v19;
    v74 = [v19 allKeys];
    BOOL v23 = [v74 sortedArrayUsingComparator:&stru_100010500];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v24 = v21;
    id v25 = [v24 countByEnumeratingWithState:&v99 objects:v109 count:16];
    obid j = v24;
    if (!v25)
    {

      int v28 = 0x7FFFFFFF;
      unsigned int v36 = 0x80000000;
      goto LABEL_20;
    }
    id v26 = v25;
    uint64_t v27 = *(void *)v100;
    int v28 = 0x80000000;
    int v29 = 0x7FFFFFFF;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v100 != v27) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        if (v28 < (int)[v31 count]) {
          int v28 = [v31 count];
        }
        if (v29 > (int)[v31 count]) {
          int v29 = [v31 count];
        }
      }
      id v26 = [obj countByEnumeratingWithState:&v99 objects:v109 count:16];
    }
    while (v26);

    if (v29 != v28)
    {
      unsigned int v36 = v28;
      int v28 = v29;
LABEL_20:
      v32 = PluginGBDTLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = v68;
        int v106 = v28;
        __int16 v107 = 1024;
        unsigned int v108 = v36;
        CFStringRef v34 = v32;
        v35 = "Inconsistent training data feature count varies between %d and %d";
        goto LABEL_65;
      }
LABEL_21:

      goto LABEL_22;
    }
    if ([v23 count] != (id)v28)
    {
      v32 = PluginGBDTLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        unsigned int v33 = [v23 count];
        *(_DWORD *)buf = v68;
        int v106 = v28;
        __int16 v107 = 1024;
        unsigned int v108 = v33;
        CFStringRef v34 = v32;
        v35 = "Training data with %d features passed to recipe with expected %d features in the test split";
LABEL_65:
        _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, v35, buf, 0xEu);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
LABEL_22:
    uint64_t v77 = v15;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v79 = v23;
    id v84 = [v79 countByEnumeratingWithState:&v95 objects:v104 count:16];
    id v37 = 0;
    if (!v84) {
      goto LABEL_49;
    }
    uint64_t v81 = *(void *)v96;
    v82 = v22;
    do
    {
      for (id j = 0; j != v84; id j = v53 + 1)
      {
        if (*(void *)v96 != v81) {
          objc_enumerationMutation(v79);
        }
        v85 = (char *)j;
        v39 = *(void **)(*((void *)&v95 + 1) + 8 * (void)j);
        v40 = [v83 objectForKey:v39];
        id v41 = objc_alloc_init((Class)NSMutableArray);
        id v86 = objc_alloc_init((Class)NSMutableArray);
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v42 = v40;
        id v43 = [v42 countByEnumeratingWithState:&v91 objects:v103 count:16];
        if (v43)
        {
          id v44 = v43;
          uint64_t v45 = *(void *)v92;
          do
          {
            for (k = 0; k != v44; k = (char *)k + 1)
            {
              if (*(void *)v92 != v45) {
                objc_enumerationMutation(v42);
              }
              uint64_t v47 = *(void **)(*((void *)&v91 + 1) + 8 * (void)k);
              id v48 = [v39 intValue];
              if ((int)v48 >= v28)
              {
                v51 = PluginGBDTLog();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v106 = (int)v48;
                  _os_log_fault_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_FAULT, "Invalid feature '@%d' in test split", buf, 8u);
                }
                goto LABEL_37;
              }
              [v47 floatValue];
              uint64_t v49 = -[GBDTEvaluator _computeSumOfGradientsLeftAndRightOfSplitWithFeature:threshold:inputVectors:gradients:](v88, "_computeSumOfGradientsLeftAndRightOfSplitWithFeature:threshold:inputVectors:gradients:", v48, obj, v87);

              uint64_t v50 = [v49 objectAtIndexedSubscript:0];
              [v41 addObject:v50];

              if (v90)
              {
                v51 = [v49 objectAtIndexedSubscript:1];
                [v86 addObject:v51];
                id v37 = v49;
LABEL_37:

                continue;
              }
              id v37 = v49;
            }
            id v44 = [v42 countByEnumeratingWithState:&v91 objects:v103 count:16];
          }
          while (v44);
        }

        if (!v80)
        {
          id v22 = v82;
          [v82 addObjectsFromArray:v41];
          v53 = v85;
          v55 = v86;
          if (!v90) {
            goto LABEL_47;
          }
          goto LABEL_45;
        }
        uint64_t v52 = [(GBDTEvaluator *)v88 _differenceArrayWithArray:v41];

        id v22 = v82;
        v53 = v85;
        if (v90)
        {
          uint64_t v54 = [(GBDTEvaluator *)v88 _differenceArrayWithArray:v86];

          [v82 addObjectsFromArray:v52];
          v55 = (void *)v54;
          id v41 = (id)v52;
LABEL_45:
          [v78 addObjectsFromArray:v55];
          goto LABEL_47;
        }
        [v82 addObjectsFromArray:v52];
        id v41 = (id)v52;
        v55 = v86;
LABEL_47:
      }
      id v84 = [v79 countByEnumeratingWithState:&v95 objects:v104 count:16];
    }
    while (v84);
LABEL_49:

    if (a9)
    {
      self = v88;
      v56 = [(GBDTEvaluator *)v88 _differenceArrayWithArray:v22];

      id v13 = v70;
      id v12 = v71;
      uint64_t v57 = v77;
      if (v90)
      {
        v58 = [(GBDTEvaluator *)v88 _differenceArrayWithArray:v78];

        [v70 addObjectsFromArray:v56];
        goto LABEL_54;
      }
      [v70 addObjectsFromArray:v56];
LABEL_56:
      if (v37 && !v90)
      {
        if (v69)
        {
          v59 = [v37 objectAtIndexedSubscript:0];
          [v59 floatValue];
          float v61 = v60;
          id v62 = [v37 objectAtIndexedSubscript:1];
          [v62 floatValue];
          *(float *)&double v64 = v61 + v63;
          unsigned int v65 = +[NSNumber numberWithFloat:v64];
          [v13 addObject:v65];
        }
        else
        {
          v66 = [v37 objectAtIndexedSubscript:1];
          [v13 addObject:v66];
        }
      }
      v58 = v78;
    }
    else
    {
      id v13 = v70;
      [v70 addObjectsFromArray:v22];
      self = v88;
      id v12 = v71;
      uint64_t v57 = v77;
      v56 = v22;
      if (!v90) {
        goto LABEL_56;
      }
      v58 = v78;
LABEL_54:
      [v13 addObjectsFromArray:v58];
    }

    uint64_t v15 = v57 + 1;
  }
  while (v15 < (int)[v12 count]);
LABEL_66:

  return v13;
}

- (id)_computeSumOfGradientsLeftAndRightOfSplitWithFeature:(int)a3 threshold:(float)a4 inputVectors:(id)a5 gradients:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if ((int)[v9 count] < 1)
  {
    float v14 = 0.0;
    float v13 = 0.0;
  }
  else
  {
    uint64_t v12 = 0;
    float v13 = 0.0;
    float v14 = 0.0;
    do
    {
      uint64_t v15 = [v9 objectAtIndex:v12];
      double v16 = [v15 objectAtIndex:a3];

      [v16 floatValue];
      float v18 = v17;
      int v19 = [v10 objectAtIndexedSubscript:v12];
      [v19 floatValue];
      float v21 = v20;

      if (v18 <= a4) {
        float v22 = v21;
      }
      else {
        float v22 = -0.0;
      }
      float v14 = v14 + v22;
      if (v18 <= a4) {
        float v23 = -0.0;
      }
      else {
        float v23 = v21;
      }
      float v13 = v13 + v23;

      ++v12;
    }
    while (v12 < (int)[v9 count]);
  }
  *(float *)&double v11 = v14;
  id v24 = +[NSNumber numberWithFloat:v11];
  v29[0] = v24;
  *(float *)&double v25 = v13;
  id v26 = +[NSNumber numberWithFloat:v25];
  v29[1] = v26;
  uint64_t v27 = +[NSArray arrayWithObjects:v29 count:2];

  return v27;
}

- (id)_findNodeSamplesWithDecisionPath:(id)a3 inputVectors:(id)a4 gradients:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v28 = a5;
  id v27 = objc_alloc_init((Class)NSMutableArray);
  id v26 = objc_alloc_init((Class)NSMutableArray);
  if ((int)[v8 count] < 1) {
    goto LABEL_13;
  }
  uint64_t v9 = 0;
  do
  {
    if ((int)[v7 count] < 1)
    {
LABEL_10:
      float v23 = [v8 objectAtIndexedSubscript:v9];
      [v27 addObject:v23];

      uint64_t v12 = [v28 objectAtIndexedSubscript:v9];
      [v26 addObject:v12];
      goto LABEL_12;
    }
    uint64_t v10 = 0;
    while (1)
    {
      double v11 = [v7 objectAtIndexedSubscript:v10];
      uint64_t v12 = [v11 objectAtIndexedSubscript:0];

      float v13 = [v7 objectAtIndexedSubscript:v10];
      float v14 = [v13 objectAtIndexedSubscript:1];

      uint64_t v15 = [v7 objectAtIndexedSubscript:v10];
      double v16 = [v15 objectAtIndexedSubscript:2];

      LODWORD(v15) = [v16 intValue];
      float v17 = [v8 objectAtIndexedSubscript:v9];
      float v18 = objc_msgSend(v17, "objectAtIndexedSubscript:", (int)objc_msgSend(v12, "intValue"));
      [v18 floatValue];
      float v20 = v19;
      [v14 floatValue];
      float v22 = v21;

      if (v15 != 1) {
        break;
      }
      if (v20 > v22) {
        goto LABEL_11;
      }
LABEL_9:

      if (++v10 >= (int)[v7 count]) {
        goto LABEL_10;
      }
    }
    if (v20 > v22) {
      goto LABEL_9;
    }
LABEL_11:

LABEL_12:
    ++v9;
  }
  while (v9 < (int)[v8 count]);
LABEL_13:
  v29[0] = v27;
  v29[1] = v26;
  id v24 = +[NSArray arrayWithObjects:v29 count:2];

  return v24;
}

- (id)_computeSecondOrderGradientsWithTargets:(id)a3 predictions:(id)a4 positiveSampleWeight:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = +[NSMutableArray array];
  if ((int)[v8 count] >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      float v13 = [v8 objectAtIndexedSubscript:v12];
      [v13 floatValue];
      float v15 = v14;

      double v16 = [v9 objectAtIndexedSubscript:v12];
      [v16 floatValue];
      -[GBDTEvaluator _secondOrderGradientWithPrediction:](self, "_secondOrderGradientWithPrediction:");
      float v18 = v17;

      if (v15 == 1.0)
      {
        [v10 floatValue];
        float v18 = v18 * *(float *)&v19;
      }
      *(float *)&double v19 = v18;
      float v20 = +[NSNumber numberWithFloat:v19];
      [v11 addObject:v20];

      ++v12;
    }
    while (v12 < (int)[v8 count]);
  }

  return v11;
}

- (id)_computeFirstOrderGradientsWithTargets:(id)a3 predictions:(id)a4 positiveSampleWeight:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = +[NSMutableArray array];
  if ((int)[v8 count] >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      float v13 = [v8 objectAtIndexedSubscript:v12];
      [v13 floatValue];
      float v15 = v14;

      double v16 = [v9 objectAtIndexedSubscript:v12];
      [v16 floatValue];
      -[GBDTEvaluator _firstOrderGradientWithPrediction:label:](self, "_firstOrderGradientWithPrediction:label:");
      float v18 = v17;

      if (v15 == 1.0)
      {
        [v10 floatValue];
        float v18 = v18 * *(float *)&v19;
      }
      *(float *)&double v19 = v18;
      float v20 = +[NSNumber numberWithFloat:v19];
      [v11 addObject:v20];

      ++v12;
    }
    while (v12 < (int)[v8 count]);
  }

  return v11;
}

- (id)_computeBasicMetricsForTargets:(id)a3 predictions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((int)[v6 count] < 1)
  {
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    float v13 = 0.0;
  }
  else
  {
    uint64_t v8 = 0;
    LODWORD(v9) = 0;
    LODWORD(v10) = 0;
    LODWORD(v11) = 0;
    LODWORD(v12) = 0;
    float v13 = 0.0;
    do
    {
      float v14 = [v6 objectAtIndexedSubscript:v8];
      [v14 floatValue];
      float v16 = v15;

      float v17 = [v7 objectAtIndexedSubscript:v8];
      [v17 floatValue];
      -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
      float v19 = v18;

      float v20 = logf(v19);
      float v21 = (float)-(float)((float)(1.0 - v16) * logf(1.0 - v19)) - (float)(v16 * v20);
      if (v19 <= 0.5) {
        unsigned int v22 = v11;
      }
      else {
        unsigned int v22 = v11 + 1;
      }
      if (v19 > 0.5) {
        unsigned int v23 = v10;
      }
      else {
        unsigned int v23 = v10 + 1;
      }
      if (v19 > 0.5) {
        unsigned int v24 = v12;
      }
      else {
        unsigned int v24 = v12 + 1;
      }
      if (v19 <= 0.5) {
        unsigned int v25 = v9;
      }
      else {
        unsigned int v25 = v9 + 1;
      }
      if (v16 > 0.5) {
        uint64_t v12 = v24;
      }
      else {
        uint64_t v12 = v12;
      }
      float v13 = v13 + v21;
      if (v16 > 0.5) {
        uint64_t v11 = v11;
      }
      else {
        uint64_t v11 = v22;
      }
      if (v16 > 0.5) {
        uint64_t v10 = v10;
      }
      else {
        uint64_t v10 = v23;
      }
      if (v16 > 0.5) {
        uint64_t v9 = v25;
      }
      else {
        uint64_t v9 = v9;
      }
      ++v8;
    }
    while (v8 < (int)[v6 count]);
  }
  double v26 = (double)(int)v9;
  int v27 = v9 + v11;
  if (((int)v9 + (int)v11 < 0) ^ __OFADD__(v9, v11) | (v9 + v11 == 0)) {
    double v28 = NAN;
  }
  else {
    double v28 = v26 / (double)v27;
  }
  if ((int)v9 + (int)v12 < 1) {
    double v29 = NAN;
  }
  else {
    double v29 = v26 / (double)((int)v9 + (int)v12);
  }
  int v30 = v10 + v12 + v27;
  if (v30 < 1) {
    double v31 = NAN;
  }
  else {
    double v31 = (double)((int)v9 + (int)v10) / (double)v30;
  }
  if (v28 + v29 <= 0.0) {
    double v32 = NAN;
  }
  else {
    double v32 = (v28 * v29 + v28 * v29) / (v28 + v29);
  }
  id v33 = [v6 count];
  if (v33) {
    double v34 = v13 / (double)(unint64_t)v33;
  }
  else {
    double v34 = NAN;
  }
  v48[0] = @"Precision";
  uint64_t v47 = +[NSNumber numberWithDouble:v28];
  v49[0] = v47;
  v49[1] = &off_1000110C0;
  v48[1] = @"PrecisionNotNull";
  v48[2] = @"Recall";
  id v46 = +[NSNumber numberWithDouble:v29];
  v49[2] = v46;
  v49[3] = &off_1000110C0;
  v48[3] = @"RecallNotNull";
  v48[4] = @"Accuracy";
  uint64_t v45 = +[NSNumber numberWithDouble:v31];
  v49[4] = v45;
  v49[5] = &off_1000110C0;
  v48[5] = @"AccuracyNotNull";
  v48[6] = @"F1Score";
  v35 = +[NSNumber numberWithDouble:v32];
  v49[6] = v35;
  v49[7] = &off_1000110C0;
  v48[7] = @"F1ScoreNotNull";
  v48[8] = @"AvgCrossEntropyLoss";
  unsigned int v36 = +[NSNumber numberWithDouble:v34];
  v49[8] = v36;
  v49[9] = &off_1000110C0;
  v48[9] = @"AvgCrossEntropyLossNotNull";
  v48[10] = @"SumCrossEntropyLoss";
  *(float *)&double v37 = v13;
  v38 = +[NSNumber numberWithFloat:v37];
  v49[10] = v38;
  v48[11] = @"TruePos";
  v39 = +[NSNumber numberWithInt:v9];
  v49[11] = v39;
  v48[12] = @"TrueNeg";
  v40 = +[NSNumber numberWithInt:v10];
  v49[12] = v40;
  v48[13] = @"FalsePos";
  id v41 = +[NSNumber numberWithInt:v11];
  v49[13] = v41;
  v48[14] = @"FalseNeg";
  id v42 = +[NSNumber numberWithInt:v12];
  v49[14] = v42;
  id v43 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:15];

  return v43;
}

- (float)_secondOrderGradientWithPrediction:(float)a3
{
  -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
  float v6 = v5;
  *(float *)&double v7 = -a3;
  [(GBDTEvaluator *)self _sigmoidWithValue:v7];
  return v6 * v8;
}

- (float)_firstOrderGradientWithPrediction:(float)a3 label:(float)a4
{
  -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
  return v5 - a4;
}

- (float)_sigmoidWithValue:(float)a3
{
  return 1.0 / (exp((float)-a3) + 1.0);
}

- (id)_sumAccuratePredictionsWithPredictions:(id)a3 targets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (v8 == [v7 count])
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "floatValue", (void)v25);
          -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
          if (v15 <= 0.5) {
            float v16 = &off_1000110D8;
          }
          else {
            float v16 = &off_1000110C0;
          }
          [v9 addObject:v16];
        }
        id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }

    if ((int)[v10 count] < 1)
    {
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      do
      {
        float v19 = objc_msgSend(v9, "objectAtIndexedSubscript:", v17, (void)v25);
        unsigned int v20 = [v19 intValue];
        float v21 = [v7 objectAtIndexedSubscript:v17];
        unsigned int v22 = [v21 intValue];

        if (v20 == v22) {
          ++v18;
        }
        ++v17;
      }
      while (v17 < (int)[v10 count]);
    }
    unsigned int v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v18, (void)v25);
  }
  else
  {
    unsigned int v23 = 0;
  }

  return v23;
}

- (id)_sumAbsoluteErrorWithPredictions:(id)a3 targets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((int)[v6 count] < 1)
  {
    float v10 = 0.0;
  }
  else
  {
    uint64_t v9 = 0;
    float v10 = 0.0;
    do
    {
      id v11 = [v6 objectAtIndexedSubscript:v9];
      [v11 floatValue];
      -[GBDTEvaluator _sigmoidWithValue:](self, "_sigmoidWithValue:");
      float v13 = v12;
      float v14 = [v7 objectAtIndexedSubscript:v9];
      [v14 floatValue];
      float v10 = v10 + vabds_f32(v13, v15);

      ++v9;
    }
    while (v9 < (int)[v6 count]);
  }
  *(float *)&double v8 = v10;
  float v16 = +[NSNumber numberWithFloat:v8];

  return v16;
}

- (id)_l2NormWithArray:(id)a3
{
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v17;
    float v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        float v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v10 floatValue];
        float v12 = v11;
        [v10 floatValue];
        float v8 = v8 + (float)(v12 * v13);
      }
      id v6 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    float v8 = 0.0;
  }
  *(float *)&double v5 = sqrtf(v8);
  float v14 = +[NSNumber numberWithFloat:v5];

  return v14;
}

- (id)_l1NormWithArray:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v14;
    float v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) floatValue];
        float v8 = v8 + fabsf(v10);
      }
      id v6 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    float v8 = 0.0;
  }
  *(float *)&double v5 = v8;
  float v11 = +[NSNumber numberWithFloat:v5];

  return v11;
}

- (id)_computePredictionsFromModelWithInputVectors:(id)a3 currentModel:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  float v10 = [(GBDTEvaluator *)self _makeKeysWithInputVectors:v8];
  float v11 = +[NSMutableArray array];
  if ((int)[v8 count] >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      id v13 = objc_alloc((Class)NSDictionary);
      long long v14 = [v8 objectAtIndexedSubscript:v12];
      id v15 = [v13 initWithObjects:v14 forKeys:v10];

      id v16 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithDictionary:v15 error:0];
      if (v16)
      {
        long long v17 = [v9 predictionFromFeatures:v16 error:a5];
        long long v18 = [v17 featureValueForName:@"predictedValue"];
        [v18 doubleValue];
        double v20 = v19;

        float v21 = +[NSNumber numberWithDouble:v20];
        [v11 addObject:v21];
      }
      else
      {
        long long v17 = PluginPFLLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)unsigned int v23 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Got nil inputProvider", v23, 2u);
        }
      }

      ++v12;
    }
    while (v12 < (int)[v8 count]);
  }

  return v11;
}

- (id)_makeKeysWithInputVectors:(id)a3
{
  id v3 = [a3 objectAtIndex:0];
  int v4 = [v3 count];

  double v5 = +[NSMutableArray array];
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = +[NSNumber numberWithInt:v6];
      id v8 = [v7 stringValue];
      [v5 addObject:v8];

      uint64_t v6 = (v6 + 1);
    }
    while (v4 != v6);
  }
  return v5;
}

@end