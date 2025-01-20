@interface EntityRelevancePFLTraining
+ (id)processDataForFeatureView:(id)a3 taskParameters:(id)a4 orderedFeatureNames:(id)a5 entityTypes:(id)a6 error:(id *)a7;
+ (id)taskResultFromDict:(id)a3;
+ (void)countClassInFullDataByEntityTypeWithLabeledData:(id)a3 returnDictionary:(id)a4;
+ (void)countClassInSampledDataByEntityTypeWithPositiveInputVectors:(id)a3 positiveEntityTypes:(id)a4 negativeInputVectors:(id)a5 negativeEntityTypes:(id)a6 numberOfEntityTypes:(int64_t)a7 returnDictionary:(id)a8;
- (FidesPHSEvaluatorDataSource)dataSource;
- (NSArray)configEntityTypesSpecification;
- (NSArray)configOrderedFeatureNamesSpecification;
- (NSDictionary)processDataReturnDict;
- (NSDictionary)selectedFeaturesConfig;
- (NSMutableArray)featureMatricesForAllShareEvents;
- (NSMutableDictionary)featureNameDict;
- (NSString)configBoltTaskIDSpecification;
- (NSString)configDepthSpecification;
- (NSString)configTreeSpecification;
- (id)createDataSourceForDodMLRecipe:(id)a3 error:(id *)a4;
- (id)generateResultsDictionaryWithModelURL:(id)a3 error:(id *)a4;
- (id)runTask:(id)a3 featureView:(id)a4 error:(id *)a5;
- (void)setConfigBoltTaskIDSpecification:(id)a3;
- (void)setConfigDepthSpecification:(id)a3;
- (void)setConfigEntityTypesSpecification:(id)a3;
- (void)setConfigOrderedFeatureNamesSpecification:(id)a3;
- (void)setConfigTreeSpecification:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFeatureMatricesForAllShareEvents:(id)a3;
- (void)setFeatureNameDict:(id)a3;
- (void)setProcessDataReturnDict:(id)a3;
- (void)setSelectedFeaturesConfig:(id)a3;
@end

@implementation EntityRelevancePFLTraining

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configOrderedFeatureNamesSpecification, 0);
  objc_storeStrong((id *)&self->_configEntityTypesSpecification, 0);
  objc_storeStrong((id *)&self->_configBoltTaskIDSpecification, 0);
  objc_storeStrong((id *)&self->_configDepthSpecification, 0);
  objc_storeStrong((id *)&self->_configTreeSpecification, 0);
  objc_storeStrong((id *)&self->_selectedFeaturesConfig, 0);
  objc_storeStrong((id *)&self->_featureNameDict, 0);
  objc_storeStrong((id *)&self->_featureMatricesForAllShareEvents, 0);
  objc_storeStrong((id *)&self->_processDataReturnDict, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setConfigOrderedFeatureNamesSpecification:(id)a3
{
}

- (NSArray)configOrderedFeatureNamesSpecification
{
  return self->_configOrderedFeatureNamesSpecification;
}

- (void)setConfigEntityTypesSpecification:(id)a3
{
}

- (NSArray)configEntityTypesSpecification
{
  return self->_configEntityTypesSpecification;
}

- (void)setConfigBoltTaskIDSpecification:(id)a3
{
}

- (NSString)configBoltTaskIDSpecification
{
  return self->_configBoltTaskIDSpecification;
}

- (void)setConfigDepthSpecification:(id)a3
{
}

- (NSString)configDepthSpecification
{
  return self->_configDepthSpecification;
}

- (void)setConfigTreeSpecification:(id)a3
{
}

- (NSString)configTreeSpecification
{
  return self->_configTreeSpecification;
}

- (void)setSelectedFeaturesConfig:(id)a3
{
}

- (NSDictionary)selectedFeaturesConfig
{
  return self->_selectedFeaturesConfig;
}

- (void)setFeatureNameDict:(id)a3
{
}

- (NSMutableDictionary)featureNameDict
{
  return self->_featureNameDict;
}

- (void)setFeatureMatricesForAllShareEvents:(id)a3
{
}

- (NSMutableArray)featureMatricesForAllShareEvents
{
  return self->_featureMatricesForAllShareEvents;
}

- (void)setProcessDataReturnDict:(id)a3
{
}

- (NSDictionary)processDataReturnDict
{
  return self->_processDataReturnDict;
}

- (void)setDataSource:(id)a3
{
}

- (FidesPHSEvaluatorDataSource)dataSource
{
  return self->_dataSource;
}

- (id)generateResultsDictionaryWithModelURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [(EntityRelevancePFLTraining *)self dataSource];
  v9 = [(EntityRelevancePFLTraining *)self processDataReturnDict];
  v10 = [v7 evaluateWithModelURL:v6 dataSource:v8 processDataReturnDict:v9 error:a4];

  id v11 = [v10 mutableCopy];
  if (v11 && !*a4)
  {
    v16 = [(EntityRelevancePFLTraining *)self configTreeSpecification];
    [v11 setObject:v16 forKeyedSubscript:@"Tree"];

    v17 = [(EntityRelevancePFLTraining *)self configDepthSpecification];
    [v11 setObject:v17 forKeyedSubscript:@"Depth"];

    v18 = [(EntityRelevancePFLTraining *)self configBoltTaskIDSpecification];
    [v11 setObject:v18 forKeyedSubscript:@"BoltTaskID"];

    v19 = [(EntityRelevancePFLTraining *)self processDataReturnDict];
    v20 = [v19 objectForKeyedSubscript:@"PreSamplingPosCountByEntityType"];

    if (v20)
    {
      v21 = [(EntityRelevancePFLTraining *)self processDataReturnDict];
      v22 = [v21 objectForKeyedSubscript:@"PreSamplingPosCountByEntityType"];
      [v11 setObject:v22 forKeyedSubscript:@"PreSamplingPosCountByEntityType"];
    }
    v23 = [(EntityRelevancePFLTraining *)self processDataReturnDict];
    v24 = [v23 objectForKeyedSubscript:@"PreSamplingNegCountByEntityType"];

    if (v24)
    {
      v25 = [(EntityRelevancePFLTraining *)self processDataReturnDict];
      v26 = [v25 objectForKeyedSubscript:@"PreSamplingNegCountByEntityType"];
      [v11 setObject:v26 forKeyedSubscript:@"PreSamplingNegCountByEntityType"];
    }
    v27 = [(EntityRelevancePFLTraining *)self processDataReturnDict];
    v28 = [v27 objectForKeyedSubscript:@"PostSamplingPosCountByEntityType"];

    if (v28)
    {
      v29 = [(EntityRelevancePFLTraining *)self processDataReturnDict];
      v30 = [v29 objectForKeyedSubscript:@"PostSamplingPosCountByEntityType"];
      [v11 setObject:v30 forKeyedSubscript:@"PostSamplingPosCountByEntityType"];
    }
    v31 = [(EntityRelevancePFLTraining *)self processDataReturnDict];
    v32 = [v31 objectForKeyedSubscript:@"PostSamplingNegCountByEntityType"];

    if (v32)
    {
      v33 = [(EntityRelevancePFLTraining *)self processDataReturnDict];
      v34 = [v33 objectForKeyedSubscript:@"PostSamplingNegCountByEntityType"];
      [v11 setObject:v34 forKeyedSubscript:@"PostSamplingNegCountByEntityType"];
    }
    id v15 = v11;
  }
  else
  {
    v12 = PluginPFLLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v36 = *a4;
      *(_DWORD *)buf = 138412290;
      id v40 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to run evaluateWithModelURL with error: %@", buf, 0xCu);
    }

    id v13 = *a4;
    if (*a4)
    {
      NSErrorUserInfoKey v37 = NSUnderlyingErrorKey;
      id v38 = v13;
      v14 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    }
    else
    {
      v14 = 0;
    }
    *a4 = +[NSError errorWithDomain:@"IPMLRuntimePluginErrors" code:9007 userInfo:v14];

    id v15 = 0;
  }

  return v15;
}

- (id)createDataSourceForDodMLRecipe:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = +[FidesPHSEvaluatorDataSource defaultRecipeParams];
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_1000055D8;
  v26 = &unk_1000104C0;
  id v9 = v6;
  id v27 = v9;
  id v10 = v7;
  id v28 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:&v23];

  id v11 = [FidesPHSEvaluatorDataSource alloc];
  v12 = [(EntityRelevancePFLTraining *)self processDataReturnDict];
  id v13 = [v12 objectForKeyedSubscript:@"inputVectors"];
  v14 = [(EntityRelevancePFLTraining *)self processDataReturnDict];
  id v15 = [v14 objectForKeyedSubscript:@"targetVector"];
  v16 = [(FidesPHSEvaluatorDataSource *)v11 initWithRecipe:v10 inputVectors:v13 targetVector:v15 error:a4];

  if (v16 && !*a4)
  {
    v20 = v16;
  }
  else
  {
    v17 = PluginPFLLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v22 = *a4;
      *(_DWORD *)buf = 138412290;
      id v32 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to read from data source: %@", buf, 0xCu);
    }

    id v18 = *a4;
    if (*a4)
    {
      NSErrorUserInfoKey v29 = NSUnderlyingErrorKey;
      id v30 = v18;
      v19 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    }
    else
    {
      v19 = 0;
    }
    *a4 = +[NSError errorWithDomain:@"IPMLRuntimePluginErrors" code:9003 userInfo:v19];

    v20 = 0;
  }

  return v20;
}

- (id)runTask:(id)a3 featureView:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc((Class)NSString);
  id v11 = [v8 parameters];
  id v12 = objc_msgSend(v10, "initWithFormat:", @"%d", objc_msgSend(v11, "integerValueForKey:defaultValue:", @"Tree", -1));
  [(EntityRelevancePFLTraining *)self setConfigTreeSpecification:v12];

  id v13 = objc_alloc((Class)NSString);
  v14 = [v8 parameters];
  id v15 = objc_msgSend(v13, "initWithFormat:", @"%d", objc_msgSend(v14, "integerValueForKey:defaultValue:", @"Depth", -1));
  [(EntityRelevancePFLTraining *)self setConfigDepthSpecification:v15];

  v16 = [v8 parameters];
  v17 = [v16 stringValueForKey:@"BoltTaskID" defaultValue:@"nil"];
  [(EntityRelevancePFLTraining *)self setConfigBoltTaskIDSpecification:v17];

  id v18 = [(EntityRelevancePFLTraining *)self configBoltTaskIDSpecification];

  if (v18)
  {
    v19 = [v8 parameters];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"EntityTypes"];
    v21 = (void *)v20;
    if (v20) {
      id v22 = (void *)v20;
    }
    else {
      id v22 = &__NSArray0__struct;
    }
    [(EntityRelevancePFLTraining *)self setConfigEntityTypesSpecification:v22];

    v23 = [v8 parameters];
    uint64_t v24 = [v23 objectForKeyedSubscript:@"OrderedFeatureNames"];
    v25 = (void *)v24;
    if (v24) {
      v26 = (void *)v24;
    }
    else {
      v26 = &__NSArray0__struct;
    }
    [(EntityRelevancePFLTraining *)self setConfigOrderedFeatureNamesSpecification:v26];

    id v27 = [v8 parameters];
    id v28 = [(EntityRelevancePFLTraining *)self configOrderedFeatureNamesSpecification];
    NSErrorUserInfoKey v29 = [(EntityRelevancePFLTraining *)self configEntityTypesSpecification];
    id v30 = +[EntityRelevancePFLTraining processDataForFeatureView:v9 taskParameters:v27 orderedFeatureNames:v28 entityTypes:v29 error:a5];
    [(EntityRelevancePFLTraining *)self setProcessDataReturnDict:v30];

    v31 = [(EntityRelevancePFLTraining *)self processDataReturnDict];

    if (!v31)
    {
      id v40 = PluginPFLLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Got nil return from processDataWithTaskParameters:", buf, 2u);
      }

      id v41 = *a5;
      if (*a5)
      {
        NSErrorUserInfoKey v56 = NSUnderlyingErrorKey;
        id v57 = v41;
        id v38 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      }
      else
      {
        id v38 = 0;
      }
      uint64_t v42 = 9004;
      goto LABEL_29;
    }
    id v32 = [v8 parameters];
    v33 = [(EntityRelevancePFLTraining *)self createDataSourceForDodMLRecipe:v32 error:a5];
    [(EntityRelevancePFLTraining *)self setDataSource:v33];

    v34 = [(EntityRelevancePFLTraining *)self dataSource];
    if (!v34 || (id v35 = *a5, v34, v35))
    {
      id v36 = PluginPFLLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v51 = *a5;
        *(_DWORD *)buf = 138412290;
        id v55 = v51;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to get data source with error: %@", buf, 0xCu);
      }

      id v37 = *a5;
      if (*a5)
      {
        NSErrorUserInfoKey v52 = NSUnderlyingErrorKey;
        id v53 = v37;
        id v38 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      }
      else
      {
        id v38 = 0;
      }
      uint64_t v42 = 9002;
LABEL_29:
      id v47 = +[NSError errorWithDomain:@"IPMLRuntimePluginErrors" code:v42 userInfo:v38];
LABEL_30:
      v39 = 0;
      *a5 = v47;
      goto LABEL_31;
    }
    v43 = [v8 parameters];
    id v38 = [v43 stringValueForKey:@"ModelFileName" defaultValue:0];

    if (!v38)
    {
      v49 = PluginPFLLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "No model file specified for key 'ModelFileName' in Trial attachment", buf, 2u);
      }

      id v47 = +[NSError errorWithDomain:@"IPMLRuntimePluginErrors" code:9005 userInfo:0];
      id v38 = 0;
      goto LABEL_30;
    }
    v44 = [v8 attachments];
    v45 = [v44 attachmentURLsForBasename:v38];

    if ([v45 count] == (id)1)
    {
      v46 = [v45 objectAtIndexedSubscript:0];
      v39 = [(EntityRelevancePFLTraining *)self generateResultsDictionaryWithModelURL:v46 error:a5];
    }
    else
    {
      v50 = PluginPFLLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        id v55 = [v45 count];
        _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "modelURLs had a length not equal to 1: %lu", buf, 0xCu);
      }

      +[NSError errorWithDomain:@"IPMLRuntimePluginErrors" code:9006 userInfo:0];
      v39 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v38 = PluginPFLLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Got nil configBoltTaskIDSpecification", buf, 2u);
    }
    v39 = 0;
  }
LABEL_31:

  return v39;
}

+ (id)processDataForFeatureView:(id)a3 taskParameters:(id)a4 orderedFeatureNames:(id)a5 entityTypes:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = PluginPFLLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "In processDataWithTaskParameters", buf, 2u);
  }

  v100 = v13;
  v101 = v12;
  id v15 = [v10 getPFLTrainingDataForAllEventsWithOrderedFeatureNames:v12 entityTypes:v13];
  log = v14;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = [v15 labeledVectors];
    v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 count]);
    id v18 = [v15 orderedFeatureNames];
    v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 count]);
    *(_DWORD *)buf = 138412546;
    v111 = v17;
    __int16 v112 = 2112;
    v113 = v19;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "number of rows: %@, number of features per row: %@", buf, 0x16u);

    v14 = log;
  }

  uint64_t v20 = objc_opt_new();
  v21 = [v15 orderedFeatureNames];
  id v22 = [v21 count];

  if (v22)
  {
    unint64_t v23 = 0;
    do
    {
      uint64_t v24 = [v15 orderedFeatureNames];
      v25 = [v24 objectAtIndexedSubscript:v23];
      [v20 appendFormat:@"%d:%@", v23, v25];

      v26 = [v15 orderedFeatureNames];
      id v27 = (char *)[v26 count] - 1;

      if ((unint64_t)v27 > v23) {
        [v20 appendString:@", "];
      }
      ++v23;
      id v28 = [v15 orderedFeatureNames];
      id v29 = [v28 count];
    }
    while ((unint64_t)v29 > v23);
  }
  id v96 = v10;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v111 = v20;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Features used for PFL: %@", buf, 0xCu);
  }

  uint64_t v30 = objc_opt_new();
  v31 = objc_opt_new();
  v109 = objc_opt_new();
  id v32 = objc_opt_new();
  v33 = objc_opt_new();
  v108 = objc_opt_new();
  v107 = objc_opt_new();
  v103 = (void *)v30;
  +[EntityRelevancePFLTraining countClassInFullDataByEntityTypeWithLabeledData:v15 returnDictionary:v30];
  LODWORD(v34) = -1.0;
  [v11 floatValueForKey:@"PositiveSampleWeight" defaultValue:v34];
  float v36 = v35;
  unsigned int v97 = [v11 BOOLValueForKey:@"BalanceSamplesByClass" defaultValue:0];
  v102 = v11;
  uint64_t v105 = (uint64_t)[v11 integerValueForKey:@"MaxSamples" defaultValue:0];
  id v37 = [v15 labeledVectors];
  id v38 = [v37 count];

  if (v38)
  {
    unint64_t v39 = 0;
    do
    {
      id v41 = [v15 labeledVectors];
      uint64_t v42 = [v41 objectAtIndexedSubscript:v39];

      v43 = [v42 target];
      [v43 doubleValue];
      double v45 = v44;

      v46 = [v42 inputVector];
      if (v45 <= 0.0)
      {
        [v33 addObject:v46];

        v50 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v42 entityType]);
        [v108 addObject:v50];

        v48 = [v42 target];
        v49 = v107;
      }
      else
      {
        [v31 addObject:v46];

        id v47 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v42 entityType]);
        [v109 addObject:v47];

        v48 = [v42 target];
        v49 = v32;
      }
      [v49 addObject:v48];

      ++v39;
      id v51 = [v15 labeledVectors];
      id v52 = [v51 count];
    }
    while ((unint64_t)v52 > v39);
  }
  id v53 = [v31 count];
  id v54 = [v33 count];
  id v55 = [v31 count];
  id v56 = [v33 count];
  if (v36 == -1.0 || v105 == 1) {
    char v58 = 1;
  }
  else {
    char v58 = v97;
  }
  if ((v58 & 1) == 0) {
    goto LABEL_29;
  }
  if (v53 && v54)
  {
    if (v105 == 1)
    {
      double v59 = (double)arc4random() / 4294967300.0;
      unint64_t v60 = v59 < 0.5;
      unint64_t v61 = v59 >= 0.5;
      goto LABEL_54;
    }
LABEL_29:
    if (v105 > 0) {
      unsigned int v62 = v97;
    }
    else {
      unsigned int v62 = 0;
    }
    if (v62 == 1)
    {
      if (v54 >= v53) {
        unint64_t v63 = (unint64_t)v53;
      }
      else {
        unint64_t v63 = (unint64_t)v54;
      }
      if ((unint64_t)v105 >> 1 >= v63) {
        unint64_t v61 = v63;
      }
      else {
        unint64_t v61 = (unint64_t)v105 >> 1;
      }
      unint64_t v60 = v61;
    }
    else if (v105 < 1)
    {
      if (v53 >= v54) {
        unint64_t v68 = (unint64_t)v54;
      }
      else {
        unint64_t v68 = (unint64_t)v53;
      }
      if (v97) {
        unint64_t v61 = v68;
      }
      else {
        unint64_t v61 = (unint64_t)v55;
      }
      if (v97) {
        unint64_t v60 = v68;
      }
      else {
        unint64_t v60 = (unint64_t)v56;
      }
    }
    else
    {
      unint64_t v61 = (int)(float)((float)((float)(unint64_t)v53 / (float)((unint64_t)v53 + (unint64_t)v54))
                       * (float)v105);
      unint64_t v60 = v105 - v61;
    }
LABEL_54:
    v69 = &_s20IntelligencePlatform11ViewServiceC032entityRelevanceHistoricalFeatureC0AA06EntityfghC0VSgvg_ptr;
    if ((unint64_t)[v31 count] <= v61)
    {
      v106 = v32;
      v70 = v31;
    }
    else
    {
      unint64_t v98 = v60;
      v70 = objc_opt_new();
      v106 = objc_opt_new();
      v71 = objc_opt_new();
      while ((unint64_t)[v70 count] < v61)
      {
        v72 = objc_msgSend(v69[106], "numberWithUnsignedInt:", arc4random_uniform((uint32_t)objc_msgSend(v31, "count")));
        if (([v71 containsObject:v72] & 1) == 0)
        {
          [v71 addObject:v72];
          v73 = objc_msgSend(v31, "objectAtIndex:", (int)objc_msgSend(v72, "intValue"));
          [v70 addObject:v73];

          v74 = objc_msgSend(v32, "objectAtIndex:", (int)objc_msgSend(v72, "intValue"));
          [v106 addObject:v74];

          v69 = &_s20IntelligencePlatform11ViewServiceC032entityRelevanceHistoricalFeatureC0AA06EntityfghC0VSgvg_ptr;
        }
      }
      unint64_t v60 = v98;
    }
    v99 = v70;
    if ((unint64_t)[v33 count] <= v60)
    {
      v75 = v33;
      v67 = v107;
      v82 = &selRef_processDataReturnDict;
    }
    else
    {
      v75 = objc_opt_new();
      unint64_t v76 = v60;
      v67 = objc_opt_new();
      v77 = objc_opt_new();
      if ((unint64_t)[v75 count] < v76)
      {
        unint64_t v78 = v76;
        do
        {
          v79 = objc_msgSend(v69[106], "numberWithUnsignedInt:", arc4random_uniform((uint32_t)objc_msgSend(v33, "count")));
          if (([v77 containsObject:v79] & 1) == 0)
          {
            [v77 addObject:v79];
            v80 = objc_msgSend(v33, "objectAtIndex:", (int)objc_msgSend(v79, "intValue"));
            [v75 addObject:v80];

            v81 = objc_msgSend(v107, "objectAtIndex:", (int)objc_msgSend(v79, "intValue"));
            [v67 addObject:v81];

            v69 = &_s20IntelligencePlatform11ViewServiceC032entityRelevanceHistoricalFeatureC0AA06EntityfghC0VSgvg_ptr;
          }
        }
        while ((unint64_t)[v75 count] < v78);
      }

      v82 = &selRef_processDataReturnDict;
      v70 = v99;
    }
    if (v36 == -1.0)
    {
      float v83 = (float)(unint64_t)[v75 count];
      float v36 = v83 / (float)(unint64_t)[v70 count];
    }
    objc_msgSend(v82 + 104, "countClassInSampledDataByEntityTypeWithPositiveInputVectors:positiveEntityTypes:negativeInputVectors:negativeEntityTypes:numberOfEntityTypes:returnDictionary:", v70, v109, v75, v108, objc_msgSend(v15, "numberOfEntityTypes"), v103);
    v84 = objc_opt_new();
    v85 = objc_opt_new();
    [v84 addObjectsFromArray:v70];
    [v84 addObjectsFromArray:v75];
    [v85 addObjectsFromArray:v106];
    [v85 addObjectsFromArray:v67];
    [v103 setObject:v84 forKeyedSubscript:@"inputVectors"];
    [v103 setObject:v85 forKeyedSubscript:@"targetVector"];
    id v86 = objc_msgSend(objc_alloc((Class)v69[106]), "initWithInt:", objc_msgSend(v84, "count"));
    [v103 setObject:v86 forKeyedSubscript:@"NumberTrainingRecords"];

    id v87 = objc_msgSend(objc_alloc((Class)v69[106]), "initWithInt:", objc_msgSend(v75, "count"));
    [v103 setObject:v87 forKeyedSubscript:@"NumberTrainingRecordsClass0"];

    id v88 = objc_msgSend(objc_alloc((Class)v69[106]), "initWithInt:", objc_msgSend(v70, "count"));
    [v103 setObject:v88 forKeyedSubscript:@"NumberTrainingRecordsClass1"];

    id v89 = objc_alloc((Class)v69[106]);
    *(float *)&double v90 = v36;
    id v91 = [v89 initWithFloat:v90];
    [v103 setObject:v91 forKeyedSubscript:@"CalculatedPositiveSampleWeight"];

    v92 = log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v93 = objc_msgSend(v69[106], "numberWithUnsignedInteger:", objc_msgSend(v84, "count"));
      *(_DWORD *)buf = 138412290;
      v111 = v93;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "records with data: %@", buf, 0xCu);

      v92 = log;
    }

    v66 = v103;
    id v64 = v103;

    id v32 = v106;
    v33 = v75;
    v65 = v96;
    v31 = v99;
    goto LABEL_75;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Returning nil from processDataWithTaskParameters because no positive or negative samples were found, and we need to balance classes, compute weights, or randomly select one of two classes, which will fail.", buf, 2u);
  }

  +[NSError errorWithDomain:@"IPMLRuntimePluginErrors" code:9001 userInfo:0];
  id v64 = 0;
  v65 = v96;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
  v66 = v103;
  v67 = v107;
LABEL_75:

  return v64;
}

+ (void)countClassInSampledDataByEntityTypeWithPositiveInputVectors:(id)a3 positiveEntityTypes:(id)a4 negativeInputVectors:(id)a5 negativeEntityTypes:(id)a6 numberOfEntityTypes:(int64_t)a7 returnDictionary:(id)a8
{
  id v34 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v32 = a8;
  id v16 = [objc_alloc((Class)NSMutableData) initWithLength:4 * a7];
  if ([v34 count])
  {
    unint64_t v17 = 0;
    do
    {
      id v18 = [v16 mutableBytes];
      v19 = [v13 objectAtIndexedSubscript:v17];
      id v20 = [v19 integerValue];
      ++v18[(void)v20];

      ++v17;
    }
    while ((unint64_t)[v34 count] > v17);
  }
  id v21 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a7];
  if (a7 >= 1)
  {
    uint64_t v22 = 0;
    do
    {
      unint64_t v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)[v16 mutableBytes] + v22));
      [v21 addObject:v23];

      ++v22;
    }
    while (a7 != v22);
  }
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, @"PostSamplingPosCountByEntityType", v32);

  id v24 = [objc_alloc((Class)NSMutableData) initWithLength:4 * a7];
  if ([v14 count])
  {
    unint64_t v25 = 0;
    do
    {
      v26 = [v24 mutableBytes];
      id v27 = [v15 objectAtIndexedSubscript:v25];
      id v28 = [v27 integerValue];
      ++v26[(void)v28];

      ++v25;
    }
    while ((unint64_t)[v14 count] > v25);
  }
  id v29 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a7];
  if (a7 >= 1)
  {
    uint64_t v30 = 0;
    do
    {
      v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)[v24 mutableBytes] + v30));
      [v29 addObject:v31];

      ++v30;
    }
    while (a7 != v30);
  }
  [v33 setObject:v29 forKeyedSubscript:@"PostSamplingNegCountByEntityType"];
}

+ (void)countClassInFullDataByEntityTypeWithLabeledData:(id)a3 returnDictionary:(id)a4
{
  id v28 = a3;
  id v5 = a4;
  id v6 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 4 * (void)objc_msgSend(v28, "numberOfEntityTypes"));
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 4 * (void)objc_msgSend(v28, "numberOfEntityTypes"));
  id v8 = [v28 labeledVectors];
  id v9 = [v8 count];

  if (v9)
  {
    unint64_t v10 = 0;
    do
    {
      id v11 = [v28 labeledVectors];
      id v12 = [v11 objectAtIndexedSubscript:v10];
      id v13 = [v12 entityType];

      id v14 = [v28 labeledVectors];
      id v15 = [v14 objectAtIndexedSubscript:v10];
      id v16 = [v15 target];
      [v16 floatValue];
      float v18 = v17;

      if (v18 <= 0.0) {
        v19 = v7;
      }
      else {
        v19 = v6;
      }
      id v20 = [v19 mutableBytes];
      ++v20[(void)v13];
      ++v10;
      id v21 = [v28 labeledVectors];
      id v22 = [v21 count];
    }
    while ((unint64_t)v22 > v10);
  }
  id v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v28, "numberOfEntityTypes"));
  id v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v28, "numberOfEntityTypes"));
  if ((uint64_t)[v28 numberOfEntityTypes] >= 1)
  {
    uint64_t v25 = 0;
    do
    {
      v26 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)[v6 mutableBytes] + v25));
      [v23 addObject:v26];

      id v27 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)[v7 mutableBytes] + v25));
      [v24 addObject:v27];

      ++v25;
    }
    while ((uint64_t)[v28 numberOfEntityTypes] > v25);
  }
  [v5 setObject:v23 forKeyedSubscript:@"PreSamplingPosCountByEntityType"];
  [v5 setObject:v24 forKeyedSubscript:@"PreSamplingNegCountByEntityType"];
}

+ (id)taskResultFromDict:(id)a3
{
  if (a3)
  {
    id v3 = [a3 mutableCopy];
    v4 = [v3 objectForKeyedSubscript:@"ModelDeltas"];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v39;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(v4);
          }
          v7 += (uint64_t)[*(id *)(*((void *)&v38 + 1) + 8 * i) count];
        }
        id v6 = [v4 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v6);
      size_t v10 = 4 * v7;
    }
    else
    {
      size_t v10 = 0;
    }
    id v12 = malloc_type_malloc(v10, 0x100004052888210uLL);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = v4;
    id v14 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v35;
      size_t v28 = v10;
      id v29 = v3;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v20 = v19;
          id v21 = [v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v31;
            do
            {
              for (k = 0; k != v22; k = (char *)k + 1)
              {
                if (*(void *)v31 != v23) {
                  objc_enumerationMutation(v20);
                }
                objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)k), "floatValue", v28);
                v12[v16++] = v25;
              }
              id v22 = [v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
            }
            while (v22);
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
        size_t v10 = v28;
        id v3 = v29;
      }
      while (v15);
    }

    v26 = +[NSData dataWithBytes:v12 length:v10];
    free(v12);
    if (+[NSJSONSerialization isValidJSONObject:v3]) {
      id v11 = [objc_alloc((Class)MLRTaskResult) initWithJSONResult:v3 unprivatizedVector:v26];
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

@end