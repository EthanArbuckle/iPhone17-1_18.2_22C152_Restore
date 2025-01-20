@interface _PSPersonalizationEvaluation
- (BOOL)cloneAdaptableModel:(id)a3 toFilePath:(id)a4 originalXgboostModelName:(id)a5 clonedXgboostModelName:(id)a6;
- (BOOL)evaluateIsInvokedOnce;
- (BOOL)performPrerequisitesBeforeAdaptationWithFeaturesConfigDeployPath:(id)a3;
- (MLModelConfiguration)adaptableModelConfiguration;
- (NSDictionary)recipe;
- (NSDictionary)selectedFeaturesConfig;
- (NSMutableArray)results;
- (NSMutableDictionary)featureNameDict;
- (NSMutableDictionary)modelTagToCandidateModel;
- (NSMutableDictionary)modelTagToHyperparameters;
- (NSNumber)accuracyGainThresholdForSwap;
- (NSNumber)batchSize;
- (NSNumber)engagementRateGainThresholdForSwap;
- (NSNumber)epoc;
- (NSNumber)evaluationIterationCount;
- (NSNumber)learningRate;
- (NSNumber)maxDepth;
- (NSNumber)minChildWeight;
- (NSNumber)minSampleCountForAdaptation;
- (NSNumber)minimumTestDataSizeForSwap;
- (NSNumber)numClasses;
- (NSNumber)numTrees;
- (NSNumber)recipeID;
- (NSNumber)swapOK;
- (NSNumber)testSplitPercent;
- (NSNumber)topN;
- (NSString)adaptableModelDeployPath;
- (NSURL)intermediateCompiledModelURL;
- (NSUserDefaults)psAdaptationDefaults;
- (ODCurareEvaluationAndReportingModule)curareEvaluationAndReporting;
- (_DKKnowledgeQuerying)knowledgeStore;
- (_PSPersonalizationEvaluation)initWithRecipe:(id)a3 knowledgeStore:(id)a4 shouldContinueBlock:(id)a5;
- (id)_getDataStatistics:(id)a3 forData:(id)a4;
- (id)createMLArrayBatchProviderWithMLModelType:(id)a3 withDataArray:(id)a4;
- (id)createMLFeatureProviderArrayFromSingleShareEventData:(id)a3 forMLModel:(id)a4;
- (id)evaluateWithModel:(id)a3;
- (id)hyperparametersForCandidateModel:(id)a3;
- (id)loadAdaptableModelUnderDirectory:(id)a3;
- (id)loadDefaultModel;
- (id)personalizeModel:(id)a3;
- (id)processDataWithQuery:(id)a3 balanceNeed:(BOOL)a4;
- (id)runAdaptationAndEvaluation;
- (id)runAdaptationAndEvaluationWithFeaturesConfigDeployPath:(id)a3 adaptableModelDeployPath:(id)a4;
- (id)shouldContinue;
- (int64_t)adaptationStrategy;
- (void)adaptMLModel:(id)a3 withMLModelType:(id)a4 withDataArray:(id)a5 modelConfiguration:(id)a6;
- (void)adaptMLModel:(id)a3 withTrainingData:(id)a4 modelConfiguration:(id)a5;
- (void)generateCandidateModels;
- (void)setAccuracyGainThresholdForSwap:(id)a3;
- (void)setAdaptableModelConfiguration:(id)a3;
- (void)setAdaptableModelDeployPath:(id)a3;
- (void)setAdaptationStrategy:(int64_t)a3;
- (void)setBatchSize:(id)a3;
- (void)setCurareEvaluationAndReporting:(id)a3;
- (void)setEngagementRateGainThresholdForSwap:(id)a3;
- (void)setEpoc:(id)a3;
- (void)setEvaluateIsInvokedOnce:(BOOL)a3;
- (void)setEvaluationIterationCount:(id)a3;
- (void)setFeatureNameDict:(id)a3;
- (void)setIntermediateCompiledModelURL:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLastDayOfAdaptation:(id)a3;
- (void)setLearningRate:(id)a3;
- (void)setMaxDepth:(id)a3;
- (void)setMinChildWeight:(id)a3;
- (void)setMinSampleCountForAdaptation:(id)a3;
- (void)setMinimumTestDataSizeForSwap:(id)a3;
- (void)setModelTagToCandidateModel:(id)a3;
- (void)setModelTagToHyperparameters:(id)a3;
- (void)setNumClasses:(id)a3;
- (void)setNumTrees:(id)a3;
- (void)setParametersForHyperparmeters:(id)a3;
- (void)setParametersFromRecipe;
- (void)setParametersFromRecipeForCandidateModel:(id)a3;
- (void)setPsAdaptationDefaults:(id)a3;
- (void)setRecipeID:(id)a3;
- (void)setResults:(id)a3;
- (void)setSelectedFeaturesConfig:(id)a3;
- (void)setShouldContinue:(id)a3;
- (void)setSwapOK:(id)a3;
- (void)setTestSplitPercent:(id)a3;
- (void)setTopN:(id)a3;
- (void)updateAdaptableModelConfigWithUpdateType:(int64_t)a3 numTrees:(id)a4;
- (void)updateMLModelWithURL:(id)a3 withMLModelType:(id)a4 withDataArray:(id)a5 modelConfiguration:(id)a6;
@end

@implementation _PSPersonalizationEvaluation

- (_PSPersonalizationEvaluation)initWithRecipe:(id)a3 knowledgeStore:(id)a4 shouldContinueBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_PSPersonalizationEvaluation;
  v12 = [(_PSPersonalizationEvaluation *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recipe, a3);
    objc_storeStrong((id *)&v13->_knowledgeStore, a4);
    os_log_t v14 = os_log_create("com.apple.PeopleSuggester.personalization", "general");
    v15 = (void *)qword_1DF98;
    qword_1DF98 = (uint64_t)v14;

    v16 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.PeopleSuggester.personalization"];
    psAdaptationDefaults = v13->_psAdaptationDefaults;
    v13->_psAdaptationDefaults = v16;

    id v18 = objc_retainBlock(v11);
    id shouldContinue = v13->_shouldContinue;
    v13->_id shouldContinue = v18;

    v13->_evaluateIsInvokedOnce = 0;
    v20 = qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Init successfully", v22, 2u);
    }
  }

  return v13;
}

- (void)setLastDayOfAdaptation:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSPersonalizationEvaluation *)self psAdaptationDefaults];
  [v5 setObject:v4 forKey:@"LastAdaptationDate"];
}

- (void)setParametersFromRecipe
{
  [(_PSPersonalizationEvaluation *)self setEvaluationIterationCount:&off_19010];
  v3 = [(_PSPersonalizationEvaluation *)self recipe];
  id v4 = [v3 valueForKey:@"evaluationIterationCount"];

  if (v4)
  {
    id v5 = [(_PSPersonalizationEvaluation *)self recipe];
    v6 = [v5 objectForKeyedSubscript:@"evaluationIterationCount"];
    [(_PSPersonalizationEvaluation *)self setEvaluationIterationCount:v6];
  }
  [(_PSPersonalizationEvaluation *)self setTestSplitPercent:&off_19028];
  v7 = [(_PSPersonalizationEvaluation *)self recipe];
  v8 = [v7 valueForKey:@"testSplitPercent"];

  if (v8)
  {
    id v9 = [(_PSPersonalizationEvaluation *)self recipe];
    id v10 = [v9 objectForKeyedSubscript:@"testSplitPercent"];
    [(_PSPersonalizationEvaluation *)self setTestSplitPercent:v10];
  }
  [(_PSPersonalizationEvaluation *)self setTopN:&off_19010];
  id v11 = [(_PSPersonalizationEvaluation *)self recipe];
  v12 = [v11 valueForKey:@"topN"];

  if (v12)
  {
    v13 = [(_PSPersonalizationEvaluation *)self recipe];
    os_log_t v14 = [v13 objectForKeyedSubscript:@"topN"];
    [(_PSPersonalizationEvaluation *)self setTopN:v14];
  }
  [(_PSPersonalizationEvaluation *)self setBatchSize:&off_19040];
  v15 = [(_PSPersonalizationEvaluation *)self recipe];
  v16 = [v15 valueForKey:@"batchSize"];

  if (v16)
  {
    v17 = [(_PSPersonalizationEvaluation *)self recipe];
    id v18 = [v17 objectForKeyedSubscript:@"batchSize"];
    [(_PSPersonalizationEvaluation *)self setBatchSize:v18];
  }
  [(_PSPersonalizationEvaluation *)self setEpoc:&off_19058];
  v19 = [(_PSPersonalizationEvaluation *)self recipe];
  v20 = [v19 valueForKey:@"epoc"];

  if (v20)
  {
    v21 = [(_PSPersonalizationEvaluation *)self recipe];
    v22 = [v21 objectForKeyedSubscript:@"epoc"];
    [(_PSPersonalizationEvaluation *)self setEpoc:v22];
  }
  [(_PSPersonalizationEvaluation *)self setSwapOK:&off_19070];
  objc_super v23 = [(_PSPersonalizationEvaluation *)self recipe];
  v24 = [v23 valueForKey:@"swapOK"];

  if (v24)
  {
    v25 = [(_PSPersonalizationEvaluation *)self recipe];
    v26 = [v25 objectForKeyedSubscript:@"swapOK"];
    [(_PSPersonalizationEvaluation *)self setSwapOK:v26];
  }
  [(_PSPersonalizationEvaluation *)self setAccuracyGainThresholdForSwap:&off_19010];
  v27 = [(_PSPersonalizationEvaluation *)self recipe];
  v28 = [v27 valueForKey:@"accuracyGainThresholdForSwap"];

  if (v28)
  {
    v29 = [(_PSPersonalizationEvaluation *)self recipe];
    v30 = [v29 objectForKeyedSubscript:@"accuracyGainThresholdForSwap"];
    [(_PSPersonalizationEvaluation *)self setAccuracyGainThresholdForSwap:v30];
  }
  [(_PSPersonalizationEvaluation *)self setEngagementRateGainThresholdForSwap:&off_19010];
  v31 = [(_PSPersonalizationEvaluation *)self recipe];
  v32 = [v31 valueForKey:@"engagementRateGainThresholdForSwap"];

  if (v32)
  {
    v33 = [(_PSPersonalizationEvaluation *)self recipe];
    v34 = [v33 objectForKeyedSubscript:@"engagementRateGainThresholdForSwap"];
    [(_PSPersonalizationEvaluation *)self setEngagementRateGainThresholdForSwap:v34];
  }
  [(_PSPersonalizationEvaluation *)self setMinimumTestDataSizeForSwap:&off_19088];
  v35 = [(_PSPersonalizationEvaluation *)self recipe];
  v36 = [v35 valueForKey:@"minimumTestDataSizeForSwap"];

  if (v36)
  {
    v37 = [(_PSPersonalizationEvaluation *)self recipe];
    v38 = [v37 objectForKeyedSubscript:@"minimumTestDataSizeForSwap"];
    [(_PSPersonalizationEvaluation *)self setMinimumTestDataSizeForSwap:v38];
  }
  [(_PSPersonalizationEvaluation *)self setRecipeID:&off_19070];
  v39 = [(_PSPersonalizationEvaluation *)self recipe];
  v40 = [v39 valueForKey:@"recipeID"];

  if (v40)
  {
    v41 = [(_PSPersonalizationEvaluation *)self recipe];
    v42 = [v41 objectForKeyedSubscript:@"recipeID"];
    [(_PSPersonalizationEvaluation *)self setRecipeID:v42];
  }
  [(_PSPersonalizationEvaluation *)self setMinSampleCountForAdaptation:&off_190A0];
  v43 = [(_PSPersonalizationEvaluation *)self recipe];
  v44 = [v43 valueForKey:@"minSampleCountForAdaptation"];

  if (v44)
  {
    v45 = [(_PSPersonalizationEvaluation *)self recipe];
    v46 = [v45 objectForKeyedSubscript:@"minSampleCountForAdaptation"];
    [(_PSPersonalizationEvaluation *)self setMinSampleCountForAdaptation:v46];
  }
  [(_PSPersonalizationEvaluation *)self setAdaptationStrategy:0];
  v47 = [(_PSPersonalizationEvaluation *)self recipe];
  uint64_t v48 = [v47 valueForKey:@"adaptationStrategy"];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(_PSPersonalizationEvaluation *)self recipe];
    v51 = [v50 objectForKeyedSubscript:@"adaptationStrategy"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_27;
    }
    v47 = [(_PSPersonalizationEvaluation *)self recipe];
    v53 = [v47 objectForKeyedSubscript:@"adaptationStrategy"];
    -[_PSPersonalizationEvaluation setAdaptationStrategy:](self, "setAdaptationStrategy:", (int)[v53 intValue]);
  }
LABEL_27:
  [(_PSPersonalizationEvaluation *)self setNumClasses:&off_19058];
  [(_PSPersonalizationEvaluation *)self setNumTrees:&off_19088];
  [(_PSPersonalizationEvaluation *)self setMaxDepth:&off_190B8];
  [(_PSPersonalizationEvaluation *)self setLearningRate:&off_19100];
  [(_PSPersonalizationEvaluation *)self setMinChildWeight:&off_19058];
  v54 = [(_PSPersonalizationEvaluation *)self recipe];
  v55 = [v54 valueForKey:@"adaptationParameters"];

  if (v55)
  {
    v56 = [(_PSPersonalizationEvaluation *)self recipe];
    v57 = [v56 objectForKeyedSubscript:@"adaptationParameters"];
    v58 = [v57 valueForKey:@"numClasses"];

    if (v58)
    {
      v59 = [(_PSPersonalizationEvaluation *)self recipe];
      v60 = [v59 objectForKeyedSubscript:@"adaptationParameters"];
      v61 = [v60 objectForKeyedSubscript:@"numClasses"];
      [(_PSPersonalizationEvaluation *)self setNumClasses:v61];
    }
    v62 = [(_PSPersonalizationEvaluation *)self recipe];
    v63 = [v62 objectForKeyedSubscript:@"adaptationParameters"];
    v64 = [v63 valueForKey:@"numTrees"];

    if (v64)
    {
      v65 = [(_PSPersonalizationEvaluation *)self recipe];
      v66 = [v65 objectForKeyedSubscript:@"adaptationParameters"];
      v67 = [v66 objectForKeyedSubscript:@"numTrees"];
      [(_PSPersonalizationEvaluation *)self setNumTrees:v67];
    }
    v68 = [(_PSPersonalizationEvaluation *)self recipe];
    v69 = [v68 objectForKeyedSubscript:@"adaptationParameters"];
    v70 = [v69 valueForKey:@"maxDepth"];

    if (v70)
    {
      v71 = [(_PSPersonalizationEvaluation *)self recipe];
      v72 = [v71 objectForKeyedSubscript:@"adaptationParameters"];
      v73 = [v72 objectForKeyedSubscript:@"maxDepth"];
      [(_PSPersonalizationEvaluation *)self setMaxDepth:v73];
    }
    v74 = [(_PSPersonalizationEvaluation *)self recipe];
    v75 = [v74 objectForKeyedSubscript:@"adaptationParameters"];
    v76 = [v75 valueForKey:@"learningRate"];

    if (v76)
    {
      v77 = [(_PSPersonalizationEvaluation *)self recipe];
      v78 = [v77 objectForKeyedSubscript:@"adaptationParameters"];
      v79 = [v78 objectForKeyedSubscript:@"learningRate"];
      [(_PSPersonalizationEvaluation *)self setLearningRate:v79];
    }
    v80 = [(_PSPersonalizationEvaluation *)self recipe];
    v81 = [v80 objectForKeyedSubscript:@"adaptationParameters"];
    v82 = [v81 valueForKey:@"minChildWeight"];

    if (v82)
    {
      id v85 = [(_PSPersonalizationEvaluation *)self recipe];
      v83 = [v85 objectForKeyedSubscript:@"adaptationParameters"];
      v84 = [v83 objectForKeyedSubscript:@"minChildWeight"];
      [(_PSPersonalizationEvaluation *)self setMinChildWeight:v84];
    }
  }
}

- (BOOL)performPrerequisitesBeforeAdaptationWithFeaturesConfigDeployPath:(id)a3
{
  id v4 = a3;
  [(_PSPersonalizationEvaluation *)self setParametersFromRecipe];
  id v5 = +[NSMutableArray array];
  [(_PSPersonalizationEvaluation *)self setResults:v5];

  v6 = [(_PSPersonalizationEvaluation *)self loadDefaultModel];
  if (v6)
  {
    v7 = qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Default ML Model loaded successfully", (uint8_t *)&v12, 2u);
    }
    v8 = [v4 stringByAppendingString:@"com.apple.PeopleSuggester.Config.SelectedFeatures.plist"];
    id v9 = qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "dodML is loading defaultSelectedFeaturesConfigPath from path: %@", (uint8_t *)&v12, 0xCu);
    }
    id v10 = +[NSDictionary dictionaryWithContentsOfFile:v8];
    [(_PSPersonalizationEvaluation *)self setSelectedFeaturesConfig:v10];
  }
  return v6 != 0;
}

- (id)runAdaptationAndEvaluation
{
  [(_PSPersonalizationEvaluation *)self setAdaptableModelDeployPath:@"/System/Library/DistributedEvaluation/Plugins/PeopleSuggesterDESPlugin.desPlugin/"];
  v3 = [(_PSPersonalizationEvaluation *)self adaptableModelDeployPath];
  id v4 = [(_PSPersonalizationEvaluation *)self adaptableModelDeployPath];
  id v5 = [(_PSPersonalizationEvaluation *)self runAdaptationAndEvaluationWithFeaturesConfigDeployPath:v3 adaptableModelDeployPath:v4];

  return v5;
}

- (id)evaluateWithModel:(id)a3
{
  id v97 = a3;
  v3 = qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Arrived in NEW evaluateWithModel method", buf, 2u);
  }
  id v4 = [v97 CDQuery];
  BOOL v5 = v4 == 0;

  v6 = (void *)qword_1DF98;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
      sub_F004();
    }
    v34 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = [v97 CDQuery];
      id v9 = [v8 predicate];
      id v10 = [v9 predicateFormat];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v10;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Candidate model query predicate: %@", buf, 0xCu);
    }
    id v11 = (void *)qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      int v12 = v11;
      v13 = [v97 CDModelDataStreamIdentifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Candidate model stream id: %@", buf, 0xCu);
    }
    if (([v97 isDefaultModel] & 1) != 0
      || ([v97 isPersonalizableModel] & 1) == 0)
    {
      v27 = [v97 modelURL];
      v28 = [v27 path];
      v98 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v28 modelConfig:0];

      v29 = (void *)qword_1DF98;
      if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
      {
        v30 = v29;
        v31 = [v97 modelURL];
        v32 = [v31 path];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v32;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "DEFAULT Loading adapted model from %@", buf, 0xCu);
      }
      CFStringRef v26 = @"classicMLModel";
    }
    else
    {
      os_log_t v14 = (void *)qword_1DF98;
      if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        v16 = [v97 modelConfiguration];
        v17 = [v16 parameters];
        id v18 = [v97 modelTag];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "EVALUATE Candidate model config: %@ model tag: %@", buf, 0x16u);
      }
      v19 = [v97 modelURL];
      v20 = [v19 path];
      v21 = [v97 modelConfiguration];
      v98 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v20 modelConfig:v21];

      v22 = (void *)qword_1DF98;
      if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
      {
        objc_super v23 = v22;
        v24 = [v97 modelURL];
        v25 = [v24 path];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v25;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "ADAPTABLE Loading adapted model from %@", buf, 0xCu);
      }
      CFStringRef v26 = @"adaptableMLModel";
    }
    CFStringRef v99 = v26;
    if ([v97 isDefaultModel])
    {
      CFStringRef v33 = @"bothMatched";
    }
    else
    {
      unsigned int v35 = [v97 isPersonalizableModel];
      CFStringRef v33 = @"personAndAppMatched";
      if (v35) {
        CFStringRef v33 = @"predictedClass";
      }
    }
    CFStringRef v107 = v33;
    v36 = qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v107;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Using prediction label name: %@", buf, 0xCu);
    }
    v37 = [v97 CDQuery];
    v101 = [(_PSPersonalizationEvaluation *)self processDataWithQuery:v37 balanceNeed:0];

    v38 = (void *)qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      v39 = v38;
      id v40 = [v101 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v40;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Amount of data for evaluation: %ld", buf, 0xCu);
    }
    if ([v101 count])
    {
      v42 = 0;
      uint64_t v96 = 0;
      int v108 = 0;
      int v112 = 0;
      uint64_t v105 = 0;
      uint64_t v106 = 0;
      uint64_t v103 = 0;
      *(void *)&long long v41 = 138412290;
      long long v94 = v41;
      while (1)
      {
        v110 = [v101 objectAtIndexedSubscript:v103];
        v102 = [(_PSPersonalizationEvaluation *)self createMLFeatureProviderArrayFromSingleShareEventData:v110 forMLModel:v99];
        id v113 = [objc_alloc((Class)sub_6F8C()) initWithFeatureProviderArray:v102];
        id v114 = v42;
        v43 = [v98 predictionsFromBatch:v113 error:&v114];
        id v104 = v114;

        if (v104)
        {
          v44 = qword_1DF98;
          if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v94;
            *(void *)&buf[4] = v104;
            _os_log_error_impl(&dword_0, v44, OS_LOG_TYPE_ERROR, "ML model load to predict with error：%@", buf, 0xCu);
          }
        }
        v45 = (void *)qword_1DF98;
        if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
        {
          v46 = v45;
          id v47 = [v43 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v47;
          _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "Amount of predictions, %ld", buf, 0xCu);
        }
        if ((uint64_t)objc_msgSend(v43, "count", v94) >= 1) {
          break;
        }
LABEL_48:
        id v109 = objc_alloc_init((Class)NSMutableArray);
        if ((uint64_t)[v43 count] >= 1)
        {
          uint64_t v55 = 0;
          do
          {
            v56 = [v110 objectAtIndexedSubscript:v55];
            v57 = [v43 featuresAtIndex:v55];
            v58 = [v57 featureValueForName:@"classProbability"];
            v59 = [v58 dictionaryValue];

            v60 = [v59 objectForKeyedSubscript:&off_19058];
            [v60 floatValue];
            float v62 = v61;

            v63 = [(_PSPersonalizationEvaluation *)self featureNameDict];
            v64 = [v63 objectForKeyedSubscript:@"recipientAndBundleIDAsInteger"];

            v65 = [scoredRule alloc];
            v66 = [v113 featuresAtIndex:v55];
            v67 = [v66 featureValueForName:@"predictedClass"];
            id v68 = [v67 int64Value];
            v69 = objc_msgSend(v56, "objectAtIndexedSubscript:", (int)objc_msgSend(v64, "intValue"));
            *(float *)&double v70 = v62 * 100.0;
            v71 = [(scoredRule *)v65 initWithLabel:v68 score:v69 recipientUniqueID:v70];

            [v109 addObject:v71];
            ++v55;
          }
          while (v55 < (uint64_t)[v43 count]);
        }
        v72 = +[NSSortDescriptor sortDescriptorWithKey:0 ascending:0 selector:"compare:"];
        v119 = v72;
        v73 = +[NSArray arrayWithObjects:&v119 count:1];
        v74 = [v109 sortedArrayUsingDescriptors:v73];

        id v75 = objc_alloc_init((Class)NSMutableSet);
        if ([v74 count])
        {
          uint64_t v76 = 0;
          for (unint64_t i = 0; i < (unint64_t)[v74 count]; ++i)
          {
            v78 = [(_PSPersonalizationEvaluation *)self topN];
            BOOL v79 = v76 < (uint64_t)[v78 integerValue];

            if (!v79) {
              break;
            }
            v80 = [v74 objectAtIndexedSubscript:i];
            if ([v80 ruleLabel] == (char *)&dword_0 + 1)
            {

              ++v96;
              break;
            }
            v81 = [v80 recipientUniqueID];
            unsigned __int8 v82 = [v75 containsObject:v81];

            if ((v82 & 1) == 0)
            {
              v83 = [v80 recipientUniqueID];
              [v75 addObject:v83];

              ++v76;
            }
          }
        }

        v84 = v104;
        v42 = v104;
        if (++v103 >= (unint64_t)[v101 count]) {
          goto LABEL_63;
        }
      }
      uint64_t v48 = 0;
      while (1)
      {
        v49 = [v43 featuresAtIndex:v48];
        v50 = [v49 featureValueForName:v107];
        v51 = (char *)[v50 int64Value];

        v52 = [v113 featuresAtIndex:v48];
        v53 = [v52 featureValueForName:@"predictedClass"];
        v54 = (char *)[v53 int64Value];

        if (v51 == v54)
        {
          ++v108;
          if (v51 == (unsigned char *)&dword_0 + 1)
          {
            LODWORD(v105) = v105 + 1;
            ++v112;
LABEL_46:
            ++HIDWORD(v106);
            goto LABEL_47;
          }
          if (!v51) {
            break;
          }
        }
        ++v112;
        if (v54 == (unsigned char *)&dword_0 + 1) {
          goto LABEL_46;
        }
        if (!v54) {
          goto LABEL_44;
        }
LABEL_47:
        if (++v48 >= (uint64_t)[v43 count]) {
          goto LABEL_48;
        }
      }
      ++HIDWORD(v105);
      ++v112;
LABEL_44:
      LODWORD(v106) = v106 + 1;
      goto LABEL_47;
    }
    uint64_t v105 = 0;
    uint64_t v106 = 0;
    int v112 = 0;
    int v108 = 0;
    uint64_t v96 = 0;
    v84 = 0;
LABEL_63:
    sub_7094();
    id v85 = objc_opt_new();
    [v85 setMetricName:@"engagement rate new"];
    objc_msgSend(v85, "setMetricValue:", (double)v96 * 100.0 / (double)(unint64_t)objc_msgSend(v101, "count"));
    [v85 setNumberOfPositiveSamples:v96];
    objc_msgSend(v85, "setNumberOfSamples:", objc_msgSend(v101, "count"));
    sub_7094();
    v86 = objc_opt_new();
    [v86 setMetricName:@"binary accuracy"];
    [v86 setMetricValue:(double)v108 * 100.0 / (double)v112];
    [v86 setNumberOfPositiveSamples:v108];
    [v86 setNumberOfSamples:v112];
    sub_7094();
    v87 = objc_opt_new();
    [v87 setMetricName:@"binary accuracy class 1"];
    [v87 setMetricValue:(double)(int)v105 * 100.0 / (double)SHIDWORD(v106)];
    [v87 setNumberOfPositiveSamples:v105];
    [v87 setNumberOfSamples:HIDWORD(v106)];
    sub_7094();
    v88 = objc_opt_new();
    [v88 setMetricName:@"binary accuracy class 0"];
    [v88 setMetricValue:(double)SHIDWORD(v105) * 100.0 / (double)(int)v106];
    [v88 setNumberOfPositiveSamples:HIDWORD(v105)];
    [v88 setNumberOfSamples:v106];
    v89 = [(_PSPersonalizationEvaluation *)self _getDataStatistics:v99 forData:v101];
    uint64_t v115 = 0;
    v116 = &v115;
    uint64_t v117 = 0x2050000000;
    v90 = (void *)qword_1DFC0;
    uint64_t v118 = qword_1DFC0;
    if (!qword_1DFC0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_D864;
      v121 = &unk_18560;
      v122 = &v115;
      sub_D720();
      Class Class = objc_getClass("ODCurareReportFillerModelEvaluationSummary");
      *(void *)(v122[1] + 24) = Class;
      qword_1DFC0 = *(void *)(v122[1] + 24);
      v90 = (void *)v116[3];
    }
    id v92 = v90;
    _Block_object_dispose(&v115, 8);
    v34 = objc_opt_new();
    [v34 addModelEvaluationResults:v85];
    [v34 addModelEvaluationResults:v86];
    [v34 addModelEvaluationResults:v87];
    [v34 addModelEvaluationResults:v88];
    if (![(_PSPersonalizationEvaluation *)self evaluateIsInvokedOnce])
    {
      [v34 setDataUsedToEvaluateModel:v89];
      [(_PSPersonalizationEvaluation *)self setEvaluateIsInvokedOnce:1];
    }
  }

  return v34;
}

- (void)updateMLModelWithURL:(id)a3 withMLModelType:(id)a4 withDataArray:(id)a5 modelConfiguration:(id)a6
{
}

- (void)adaptMLModel:(id)a3 withMLModelType:(id)a4 withDataArray:(id)a5 modelConfiguration:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [(_PSPersonalizationEvaluation *)self createMLArrayBatchProviderWithMLModelType:a4 withDataArray:a5];
  [(_PSPersonalizationEvaluation *)self adaptMLModel:v11 withTrainingData:v12 modelConfiguration:v10];
}

- (id)createMLArrayBatchProviderWithMLModelType:(id)a3 withDataArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (unint64_t i = 0; i != v11; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        os_log_t v14 = -[_PSPersonalizationEvaluation createMLFeatureProviderArrayFromSingleShareEventData:forMLModel:](self, "createMLFeatureProviderArrayFromSingleShareEventData:forMLModel:", *(void *)(*((void *)&v17 + 1) + 8 * i), v6, (void)v17);
        [v8 addObjectsFromArray:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  id v15 = [objc_alloc((Class)sub_6F8C()) initWithFeatureProviderArray:v8];

  return v15;
}

- (void)setParametersForHyperparmeters:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 numTrees];
  [(_PSPersonalizationEvaluation *)self setNumTrees:v5];

  id v6 = [v4 learningRate];
  [(_PSPersonalizationEvaluation *)self setLearningRate:v6];

  id v7 = [v4 minChildWeight];
  [(_PSPersonalizationEvaluation *)self setMinChildWeight:v7];

  id v8 = [v4 adaptationStrategy];

  [(_PSPersonalizationEvaluation *)self setAdaptationStrategy:v8];
}

- (void)setParametersFromRecipeForCandidateModel:(id)a3
{
  id v4 = [a3 modelConfiguration];
  [(_PSPersonalizationEvaluation *)self setAdaptableModelConfiguration:v4];
}

- (id)hyperparametersForCandidateModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_PSPersonalizationEvaluation *)self modelTagToHyperparameters];
  id v6 = [v4 modelTag];
  id v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v8 = (void *)qword_1DFC8;
  uint64_t v19 = qword_1DFC8;
  if (!qword_1DFC8)
  {
    sub_D720();
    v17[3] = (uint64_t)objc_getClass("ODCurareReportFillerModelHyperparameters");
    qword_1DFC8 = v17[3];
    id v8 = (void *)v17[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v16, 8);
  id v10 = objc_opt_new();
  [v10 setVersionNumber:1];
  [v10 addHyperparameterIndices:0];
  id v11 = [v7 numTrees];
  [v11 floatValue];
  objc_msgSend(v10, "addHyperparameterValues:");

  [v10 addHyperparameterIndices:1];
  uint64_t v12 = [v7 learningRate];
  [v12 floatValue];
  objc_msgSend(v10, "addHyperparameterValues:");

  [v10 addHyperparameterIndices:2];
  v13 = [v7 minChildWeight];
  [v13 floatValue];
  objc_msgSend(v10, "addHyperparameterValues:");

  [v10 addHyperparameterIndices:3];
  *(float *)&double v14 = (float)(uint64_t)[v7 adaptationStrategy];
  [v10 addHyperparameterValues:v14];

  return v10;
}

- (id)personalizeModel:(id)a3
{
  id v4 = a3;
  if (!(*((unsigned int (**)(void))self->_shouldContinue + 2))())
  {
LABEL_12:
    id v16 = 0;
    goto LABEL_13;
  }
  BOOL v5 = qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Arrived in NEW personalize method", buf, 2u);
  }
  [(_PSPersonalizationEvaluation *)self setParametersFromRecipeForCandidateModel:v4];
  id v6 = [v4 CDQuery];
  BOOL v7 = v6 == 0;

  id v8 = (void *)qword_1DF98;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
      sub_F038();
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = [v4 CDQuery];
    id v11 = [v10 predicate];
    uint64_t v12 = [v11 predicateFormat];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v12;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Candidate model query predicate: %@", buf, 0xCu);
  }
  unsigned int v13 = [v4 isDefaultModel];
  double v14 = qword_1DF98;
  BOOL v15 = os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Candidate model was default, not ok!!", buf, 2u);
    }
    goto LABEL_12;
  }
  if (v15)
  {
    uint64_t v18 = v14;
    uint64_t v19 = [(_PSPersonalizationEvaluation *)self numTrees];
    long long v20 = [(_PSPersonalizationEvaluation *)self maxDepth];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v20;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Personalizing with numTrees: %@, maxDepth: %@", buf, 0x16u);
  }
  v21 = (void *)qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    v22 = v21;
    objc_super v23 = [v4 modelURL];
    v24 = [v23 absoluteString];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v24;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "ADAPTABLE Loading adapted model from %@", buf, 0xCu);
  }
  CFStringRef v26 = [v4 CDQuery];
  v27 = [(_PSPersonalizationEvaluation *)self processDataWithQuery:v26 balanceNeed:1];

  v28 = (void *)qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    v29 = v28;
    id v30 = [v27 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v30;
    _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Amount of sharing sessions used for personalization: %ld", buf, 0xCu);
  }
  v31 = [(_PSPersonalizationEvaluation *)self adaptableModelDeployPath];
  id v32 = [(_PSPersonalizationEvaluation *)self loadAdaptableModelUnderDirectory:v31];

  CFStringRef v33 = (void *)qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    v34 = v33;
    unsigned int v35 = [v4 modelConfiguration];
    v36 = [v35 parameters];
    v37 = [v4 modelTag];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v37;
    _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "PERSONALIZE Candidate model config: %@ model tag: %@", buf, 0x16u);
  }
  v38 = [(_PSPersonalizationEvaluation *)self intermediateCompiledModelURL];
  v39 = [v4 modelConfiguration];
  [(_PSPersonalizationEvaluation *)self updateMLModelWithURL:v38 withMLModelType:@"adaptableMLModel" withDataArray:v27 modelConfiguration:v39];

  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2050000000;
  id v40 = (void *)qword_1DFD0;
  uint64_t v54 = qword_1DFD0;
  if (!qword_1DFD0)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_D904;
    v56 = &unk_18560;
    v57 = &v51;
    sub_D720();
    Class Class = objc_getClass("ODCurareReportFillerModelInformation");
    *(void *)(v57[1] + 24) = Class;
    qword_1DFD0 = *(void *)(v57[1] + 24);
    id v40 = (void *)v52[3];
  }
  id v42 = v40;
  _Block_object_dispose(&v51, 8);
  v43 = objc_opt_new();
  [v43 setIsDefaultModel:0];
  v44 = [(_PSPersonalizationEvaluation *)self _getDataStatistics:@"adaptableMLModel" forData:v27];
  [v43 setDataUsedToPersonalizeModel:v44];

  v45 = [(_PSPersonalizationEvaluation *)self hyperparametersForCandidateModel:v4];
  [v43 setModelHyperparameters:v45];

  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2050000000;
  v46 = (void *)qword_1DFD8;
  uint64_t v54 = qword_1DFD8;
  if (!qword_1DFD8)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_D954;
    v56 = &unk_18560;
    v57 = &v51;
    sub_D720();
    Class v47 = objc_getClass("ODCurareModelInformation");
    *(void *)(v57[1] + 24) = v47;
    qword_1DFD8 = *(void *)(v57[1] + 24);
    v46 = (void *)v52[3];
  }
  uint64_t v48 = v46;
  _Block_object_dispose(&v51, 8);
  id v49 = [v48 alloc];
  v50 = [(_PSPersonalizationEvaluation *)self intermediateCompiledModelURL];
  id v16 = [v49 initWithModelInformation:v43 modelURL:v50];

  NSLog(@"personalizeModel return: ODCurareModelInformation: %@", v16);
LABEL_13:

  return v16;
}

- (void)generateCandidateModels
{
  if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
  {
    v3 = objc_opt_new();
    [(_PSPersonalizationEvaluation *)self setModelTagToHyperparameters:v3];

    id v4 = objc_opt_new();
    [(_PSPersonalizationEvaluation *)self setModelTagToCandidateModel:v4];

    BOOL v5 = [(_PSPersonalizationEvaluation *)self numTrees];
    v152 = v5;
    id v6 = +[NSArray arrayWithObjects:&v152 count:1];

    BOOL v7 = [(_PSPersonalizationEvaluation *)self recipe];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"numTrees"];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = [(_PSPersonalizationEvaluation *)self recipe];
      id v11 = [v10 objectForKeyedSubscript:@"numTrees"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        unsigned int v13 = [(_PSPersonalizationEvaluation *)self recipe];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"numTrees"];

        BOOL v15 = qword_1DF98;
        if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v142 = v14;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Setting numTrees to: %@", buf, 0xCu);
        }
        id v6 = (void *)v14;
      }
    }
    else
    {
    }
    id v16 = [(_PSPersonalizationEvaluation *)self learningRate];
    v151 = v16;
    CFStringRef v99 = +[NSArray arrayWithObjects:&v151 count:1];

    long long v17 = [(_PSPersonalizationEvaluation *)self recipe];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"learningRate"];
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      long long v20 = [(_PSPersonalizationEvaluation *)self recipe];
      v21 = [v20 objectForKeyedSubscript:@"learningRate"];
      objc_opt_class();
      char v22 = objc_opt_isKindOfClass();

      if (v22)
      {
        objc_super v23 = [(_PSPersonalizationEvaluation *)self recipe];
        uint64_t v24 = [v23 objectForKeyedSubscript:@"learningRate"];

        v25 = qword_1DF98;
        if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v142 = v24;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Setting learningRate to: %@", buf, 0xCu);
        }
        CFStringRef v99 = (void *)v24;
      }
    }
    else
    {
    }
    CFStringRef v26 = [(_PSPersonalizationEvaluation *)self minChildWeight];
    v150 = v26;
    uint64_t v103 = +[NSArray arrayWithObjects:&v150 count:1];

    v27 = [(_PSPersonalizationEvaluation *)self recipe];
    uint64_t v28 = [v27 objectForKeyedSubscript:@"minChildWeight"];
    if (v28)
    {
      v29 = (void *)v28;
      id v30 = [(_PSPersonalizationEvaluation *)self recipe];
      v31 = [v30 objectForKeyedSubscript:@"minChildWeight"];
      objc_opt_class();
      char v32 = objc_opt_isKindOfClass();

      if (v32)
      {
        CFStringRef v33 = [(_PSPersonalizationEvaluation *)self recipe];
        uint64_t v34 = [v33 objectForKeyedSubscript:@"minChildWeight"];

        unsigned int v35 = qword_1DF98;
        if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v142 = v34;
          _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Setting minChildWeight to: %@", buf, 0xCu);
        }
        uint64_t v103 = (void *)v34;
      }
    }
    else
    {
    }
    v36 = +[NSNumber numberWithInt:[(_PSPersonalizationEvaluation *)self adaptationStrategy]];
    v149 = v36;
    int v108 = +[NSArray arrayWithObjects:&v149 count:1];

    v37 = [(_PSPersonalizationEvaluation *)self recipe];
    uint64_t v38 = [v37 objectForKeyedSubscript:@"adaptationStrategy"];
    if (v38)
    {
      v39 = (void *)v38;
      id v40 = [(_PSPersonalizationEvaluation *)self recipe];
      long long v41 = [v40 objectForKeyedSubscript:@"adaptationStrategy"];
      objc_opt_class();
      char v42 = objc_opt_isKindOfClass();

      if (v42)
      {
        v43 = [(_PSPersonalizationEvaluation *)self recipe];
        uint64_t v44 = [v43 objectForKeyedSubscript:@"adaptationStrategy"];

        v45 = qword_1DF98;
        if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v142 = v44;
          _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Setting adaptationStrategy to: %@", buf, 0xCu);
        }
        int v108 = (void *)v44;
      }
    }
    else
    {
    }
    v46 = +[_PSBehaviorRuleRankingUtilities getDeployedAdaptableCompiledMLModelPath];
    uint64_t v115 = +[NSURL URLWithString:v46];

    Class v47 = +[_PSBehaviorRuleRankingUtilities getDeployedCompiledMLModelPath];
    uint64_t v96 = +[NSURL URLWithString:v47];

    uint64_t v48 = +[_DKSystemEventStreams behavioralRuleFeaturesStream];
    id v114 = [v48 name];

    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id obj = v6;
    id v100 = [obj countByEnumeratingWithState:&v136 objects:v148 count:16];
    if (v100)
    {
      uint64_t v49 = 0;
      uint64_t v98 = *(void *)v137;
      do
      {
        uint64_t v50 = 0;
        do
        {
          if (*(void *)v137 != v98)
          {
            uint64_t v51 = v50;
            objc_enumerationMutation(obj);
            uint64_t v50 = v51;
          }
          uint64_t v101 = v50;
          uint64_t v113 = *(void *)(*((void *)&v136 + 1) + 8 * v50);
          long long v132 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          id v102 = v99;
          id v105 = [v102 countByEnumeratingWithState:&v132 objects:v147 count:16];
          if (v105)
          {
            uint64_t v104 = *(void *)v133;
            do
            {
              uint64_t v52 = 0;
              do
              {
                if (*(void *)v133 != v104)
                {
                  uint64_t v53 = v52;
                  objc_enumerationMutation(v102);
                  uint64_t v52 = v53;
                }
                uint64_t v106 = v52;
                uint64_t v116 = *(void *)(*((void *)&v132 + 1) + 8 * v52);
                long long v128 = 0u;
                long long v129 = 0u;
                long long v130 = 0u;
                long long v131 = 0u;
                id v107 = v103;
                id v110 = [v107 countByEnumeratingWithState:&v128 objects:v146 count:16];
                if (v110)
                {
                  uint64_t v109 = *(void *)v129;
                  do
                  {
                    for (unint64_t i = 0; i != v110; unint64_t i = (char *)i + 1)
                    {
                      if (*(void *)v129 != v109) {
                        objc_enumerationMutation(v107);
                      }
                      uint64_t v118 = *(void *)(*((void *)&v128 + 1) + 8 * i);
                      long long v124 = 0u;
                      long long v125 = 0u;
                      long long v126 = 0u;
                      long long v127 = 0u;
                      id v112 = v108;
                      id v55 = [v112 countByEnumeratingWithState:&v124 objects:v145 count:16];
                      if (v55)
                      {
                        id v56 = v55;
                        v111 = i;
                        uint64_t v117 = *(void *)v125;
                        do
                        {
                          v57 = 0;
                          uint64_t v58 = v49;
                          do
                          {
                            if (*(void *)v125 != v117) {
                              objc_enumerationMutation(v112);
                            }
                            uint64_t v59 = *(void *)(*((void *)&v124 + 1) + 8 * (void)v57);
                            [(_PSPersonalizationEvaluation *)self setParametersFromRecipe];
                            float v61 = [[ModelHyperparameters alloc] initWithNumTrees:v113 learningRate:v116 minChildWeight:v118 adaptationStrategy:v59];
                            [(_PSPersonalizationEvaluation *)self setParametersForHyperparmeters:v61];
                            int64_t v62 = [(_PSPersonalizationEvaluation *)self adaptationStrategy];
                            v63 = [(_PSPersonalizationEvaluation *)self numTrees];
                            [(_PSPersonalizationEvaluation *)self updateAdaptableModelConfigWithUpdateType:v62 numTrees:v63];

                            v64 = +[NSString stringWithFormat:@"model_%d", (char *)v57 + v58];
                            v65 = (void *)qword_1DF98;
                            if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
                            {
                              v66 = v65;
                              v67 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
                              id v68 = [v67 parameters];
                              *(_DWORD *)buf = 138412546;
                              uint64_t v142 = (uint64_t)v68;
                              __int16 v143 = 2112;
                              v144 = v64;
                              _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, "Candidate model config: %@ model tag: %@", buf, 0x16u);
                            }
                            id v69 = objc_alloc((Class)sub_8AD4());
                            double v70 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
                            id v71 = [v69 initWithModelURL:v115 withCoreDuetStreamIdentifier:v114 andMetadata:v70];

                            [v71 setModelTag:v64];
                            [v71 setIsDefaultModel:0];
                            [v71 setIsPersonalizableModel:1];
                            v72 = [(_PSPersonalizationEvaluation *)self modelTagToCandidateModel];
                            [v72 setObject:v71 forKeyedSubscript:v64];

                            v73 = [(_PSPersonalizationEvaluation *)self modelTagToHyperparameters];
                            [v73 setObject:v61 forKeyedSubscript:v64];

                            [(_PSPersonalizationEvaluation *)self setParametersFromRecipe];
                            v57 = (char *)v57 + 1;
                          }
                          while (v56 != v57);
                          id v56 = [v112 countByEnumeratingWithState:&v124 objects:v145 count:16];
                          uint64_t v49 = (v58 + v57);
                        }
                        while (v56);
                        uint64_t v49 = (v58 + v57);
                        unint64_t i = v111;
                      }
                    }
                    id v110 = [v107 countByEnumeratingWithState:&v128 objects:v146 count:16];
                  }
                  while (v110);
                }

                uint64_t v52 = v106 + 1;
              }
              while ((id)(v106 + 1) != v105);
              id v105 = [v102 countByEnumeratingWithState:&v132 objects:v147 count:16];
            }
            while (v105);
          }

          uint64_t v50 = v101 + 1;
        }
        while ((id)(v101 + 1) != v100);
        id v100 = [obj countByEnumeratingWithState:&v136 objects:v148 count:16];
      }
      while (v100);
    }

    v74 = (void *)v96;
    id v75 = [objc_alloc((Class)sub_8AD4()) initWithModelURL:v96 withCoreDuetStreamIdentifier:v114 andMetadata:0];
    [v75 setModelTag:@"default_model"];
    [v75 setIsDefaultModel:1];
    [v75 setIsPersonalizableModel:0];
    uint64_t v76 = [(_PSPersonalizationEvaluation *)self modelTagToCandidateModel];
    [v76 setObject:v75 forKeyedSubscript:@"default_model"];

    id v77 = [(_PSPersonalizationEvaluation *)self recipe];
    uint64_t v78 = [v77 objectForKeyedSubscript:@"shadowEvaluationModels"];
    if (v78)
    {
      BOOL v79 = (void *)v78;
      v80 = [(_PSPersonalizationEvaluation *)self recipe];
      v81 = [v80 objectForKeyedSubscript:@"shadowEvaluationModels"];
      objc_opt_class();
      char v82 = objc_opt_isKindOfClass();

      if ((v82 & 1) == 0)
      {
LABEL_68:

        return;
      }
      id v119 = v75;
      v83 = [(_PSPersonalizationEvaluation *)self recipe];
      v84 = [v83 objectForKeyedSubscript:@"shadowEvaluationModels"];

      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v77 = v84;
      id v85 = [v77 countByEnumeratingWithState:&v120 objects:v140 count:16];
      if (v85)
      {
        id v86 = v85;
        uint64_t v87 = *(void *)v121;
        do
        {
          for (j = 0; j != v86; j = (char *)j + 1)
          {
            if (*(void *)v121 != v87) {
              objc_enumerationMutation(v77);
            }
            uint64_t v89 = *(void *)(*((void *)&v120 + 1) + 8 * (void)j);
            v90 = [v77 objectForKeyedSubscript:v89];
            v91 = +[NSCharacterSet URLHostAllowedCharacterSet];
            id v92 = [v90 stringByAddingPercentEncodingWithAllowedCharacters:v91];
            v93 = +[NSURL URLWithString:v92];

            id v94 = [objc_alloc((Class)sub_8AD4()) initWithModelURL:v93 withCoreDuetStreamIdentifier:v114 andMetadata:0];
            [v94 setModelTag:v89];
            [v94 setIsDefaultModel:0];
            [v94 setIsPersonalizableModel:0];
            v95 = [(_PSPersonalizationEvaluation *)self modelTagToCandidateModel];
            [v95 setObject:v94 forKeyedSubscript:v89];
          }
          id v86 = [v77 countByEnumeratingWithState:&v120 objects:v140 count:16];
        }
        while (v86);
      }

      v74 = (void *)v96;
      id v75 = v119;
    }

    goto LABEL_68;
  }
}

- (id)runAdaptationAndEvaluationWithFeaturesConfigDeployPath:(id)a3 adaptableModelDeployPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_PSPersonalizationEvaluation *)self performPrerequisitesBeforeAdaptationWithFeaturesConfigDeployPath:v6])
  {
    if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
    {
      uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
      id v9 = qword_1DF98;
      if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Curare evaluation and dignostics framework will be used", (uint8_t *)&buf, 2u);
      }
      uint64_t v46 = 0;
      Class v47 = &v46;
      uint64_t v48 = 0x2050000000;
      id v10 = (void *)qword_1DFE8;
      uint64_t v49 = qword_1DFE8;
      if (!qword_1DFE8)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        uint64_t v52 = sub_D9F4;
        uint64_t v53 = &unk_18560;
        uint64_t v54 = &v46;
        sub_D720();
        Class Class = objc_getClass("ODCurareDataCachePruningPolicyObject");
        *(void *)(v54[1] + 24) = Class;
        qword_1DFE8 = *(void *)(v54[1] + 24);
        id v10 = (void *)v47[3];
      }
      uint64_t v12 = v10;
      _Block_object_dispose(&v46, 8);
      id v13 = [[v12 alloc] initWithMaximumNumberOfDays:28 maximumNumberOfEvents:28];
      uint64_t v46 = 0;
      Class v47 = &v46;
      uint64_t v48 = 0x2050000000;
      uint64_t v14 = (void *)qword_1DFF0;
      uint64_t v49 = qword_1DFF0;
      if (!qword_1DFF0)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        uint64_t v52 = sub_DA44;
        uint64_t v53 = &unk_18560;
        uint64_t v54 = &v46;
        sub_D720();
        Class v15 = objc_getClass("ODCurareEvaluationAndReportingModule");
        *(void *)(v54[1] + 24) = v15;
        qword_1DFF0 = *(void *)(v54[1] + 24);
        uint64_t v14 = (void *)v47[3];
      }
      id v16 = v14;
      _Block_object_dispose(&v46, 8);
      id v17 = [v16 alloc];
      uint64_t v18 = [v8 bundleIdentifier];
      id v45 = 0;
      id v19 = [v17 initWithBundleIdentifier:v18 dataProviderInstance:self evaluationInstance:self personalizationInstance:self pruningPolicy:v13 error:&v45];
      id v20 = v45;
      [(_PSPersonalizationEvaluation *)self setCurareEvaluationAndReporting:v19];

      if (v20)
      {
        v21 = qword_1DF98;
        if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v20;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Failed to create ODCurareEvaluationAndReporting instance with error %@", (uint8_t *)&buf, 0xCu);
        }
        char v22 = [v20 localizedDescription];
      }
      else
      {
        [(_PSPersonalizationEvaluation *)self generateCandidateModels];
        objc_super v23 = [(_PSPersonalizationEvaluation *)self modelTagToCandidateModel];
        char v42 = [v23 allValues];

        if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
        {
          uint64_t v46 = 0;
          Class v47 = &v46;
          uint64_t v48 = 0x2050000000;
          uint64_t v24 = (void *)qword_1DFF8;
          uint64_t v49 = qword_1DFF8;
          if (!qword_1DFF8)
          {
            *(void *)&long long buf = _NSConcreteStackBlock;
            *((void *)&buf + 1) = 3221225472;
            uint64_t v52 = sub_DA94;
            uint64_t v53 = &unk_18560;
            uint64_t v54 = &v46;
            sub_D720();
            Class v25 = objc_getClass("ODCurareModelSelectionParameter");
            *(void *)(v54[1] + 24) = v25;
            qword_1DFF8 = *(void *)(v54[1] + 24);
            uint64_t v24 = (void *)v47[3];
          }
          CFStringRef v26 = v24;
          _Block_object_dispose(&v46, 8);
          id v27 = [[v26 alloc] initWithMetricName:@"engagement rate new" percentageIncrease:0.05];
          id v50 = v27;
          uint64_t v28 = +[NSArray arrayWithObjects:&v50 count:1];

          uint64_t v46 = 0;
          Class v47 = &v46;
          uint64_t v48 = 0x2050000000;
          v29 = (void *)qword_1E000;
          uint64_t v49 = qword_1E000;
          if (!qword_1E000)
          {
            *(void *)&long long buf = _NSConcreteStackBlock;
            *((void *)&buf + 1) = 3221225472;
            uint64_t v52 = sub_DAE4;
            uint64_t v53 = &unk_18560;
            uint64_t v54 = &v46;
            sub_D720();
            Class v30 = objc_getClass("ODCurareModelSelectionPolicy");
            *(void *)(v54[1] + 24) = v30;
            qword_1E000 = *(void *)(v54[1] + 24);
            v29 = (void *)v47[3];
          }
          v31 = v29;
          _Block_object_dispose(&v46, 8);
          id v41 = [[v31 alloc] initWithModelSelectionParameters:v28 minimumNumberOfEvaluations:&off_190D0 minimumNumberOfSamples:0];
          uint64_t v46 = 0;
          Class v47 = &v46;
          uint64_t v48 = 0x2050000000;
          char v32 = (void *)qword_1E008;
          uint64_t v49 = qword_1E008;
          if (!qword_1E008)
          {
            *(void *)&long long buf = _NSConcreteStackBlock;
            *((void *)&buf + 1) = 3221225472;
            uint64_t v52 = sub_DB34;
            uint64_t v53 = &unk_18560;
            uint64_t v54 = &v46;
            sub_D720();
            Class v33 = objc_getClass("ODCurarePersonalizationPolicy");
            *(void *)(v54[1] + 24) = v33;
            qword_1E008 = *(void *)(v54[1] + 24);
            char v32 = (void *)v47[3];
          }
          uint64_t v34 = v32;
          _Block_object_dispose(&v46, 8);
          id v35 = [[v34 alloc] initWithModelSelectionParameters:v28 minimumNumberOfSamplesForPersonalization:&off_19010 minimumNumberOfSamplesForPersonalizationSelection:&off_190D0];
          v36 = [(_PSPersonalizationEvaluation *)self curareEvaluationAndReporting];
          id v44 = 0;
          [v36 trainAndEvaluateModelsWithCandidateModels:v42 personalizationPolicy:v35 selectionPolicy:v41 error:&v44];
          id v20 = v44;

          if (v20)
          {
            if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
              sub_F0D4();
            }
            objc_msgSend(v20, "localizedDescription", v41);
            char v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else if ((*((unsigned int (**)(void))self->_shouldContinue + 2))())
          {
            v37 = [(_PSPersonalizationEvaluation *)self curareEvaluationAndReporting];
            id v43 = 0;
            uint64_t v38 = [v37 getSelectedModel:&v43];
            id v20 = v43;

            v39 = qword_1DF98;
            if (v20)
            {
              if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
                sub_F06C();
              }
              objc_msgSend(v20, "localizedDescription", v41);
              char v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v38;
                _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Model: %@", (uint8_t *)&buf, 0xCu);
              }
              char v22 = &stru_18EC0;
            }
          }
          else
          {
            id v20 = 0;
            char v22 = @"Asked to stop";
          }
        }
        else
        {
          id v20 = 0;
          char v22 = @"Asked to stop";
        }
      }
    }
    else
    {
      char v22 = @"Asked to stop";
    }
  }
  else
  {
    char v22 = @"Prereqs are not satisfied";
  }

  return v22;
}

- (id)loadDefaultModel
{
  v2 = +[_PSBehaviorRuleRankingUtilities getTrialCompiledMLModelPath];
  v3 = qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    uint64_t v14 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "dodML is trying to load trialCompiledMLModel from path: %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v4 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v2 modelConfig:0];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    id v6 = qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = v2;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Trial model is loaded for adaptation from path: %@", (uint8_t *)&v13, 0xCu);
    }
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = +[_PSBehaviorRuleRankingUtilities getDeployedCompiledMLModelPath];
    id v9 = qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "dodML is trying to load deployedCompiledMLModel from path: %@", (uint8_t *)&v13, 0xCu);
    }
    id v7 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v8 modelConfig:0];
    id v10 = qword_1DF98;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        uint64_t v14 = v8;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Deployed default model is loaded for adaptation from path: %@", (uint8_t *)&v13, 0xCu);
      }
      id v11 = v7;
    }
    else if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR))
    {
      sub_F13C();
    }
  }

  return v7;
}

- (BOOL)cloneAdaptableModel:(id)a3 toFilePath:(id)a4 originalXgboostModelName:(id)a5 clonedXgboostModelName:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (+[_PSBehaviorRuleRankingUtilities removeFolderAtPath:v10])
  {
    id v13 = objc_alloc_init((Class)NSFileManager);
    id v25 = 0;
    unsigned __int8 v14 = [v13 copyItemAtPath:v9 toPath:v10 error:&v25];
    id v15 = v25;
    if (v15 || (v14 & 1) == 0)
    {
      char v22 = qword_1DF98;
      if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v10;
        __int16 v30 = 2112;
        id v31 = v15;
        _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "While cloning adaptable model, copying folder from path:%@ to path:%@ failed with error：%@", buf, 0x20u);
      }
      unsigned __int8 v20 = 0;
    }
    else
    {
      id v16 = [v10 stringByAppendingString:@"/"];
      id v17 = [v16 stringByAppendingString:v11];

      uint64_t v18 = [v10 stringByAppendingString:@"/"];
      id v19 = [v18 stringByAppendingString:v12];

      id v24 = 0;
      unsigned __int8 v20 = [v13 moveItemAtPath:v17 toPath:v19 error:&v24];
      id v15 = v24;
      if (v15) {
        unsigned __int8 v20 = 0;
      }
      if ((v20 & 1) == 0)
      {
        v21 = qword_1DF98;
        if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412802;
          id v27 = v17;
          __int16 v28 = 2112;
          id v29 = v19;
          __int16 v30 = 2112;
          id v31 = v15;
          _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "While cloning adaptable model, renaming file with path:%@ to path:%@ failed with error：%@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
      sub_F170();
    }
    unsigned __int8 v20 = 0;
  }

  return v20;
}

- (void)updateAdaptableModelConfigWithUpdateType:(int64_t)a3 numTrees:(id)a4
{
  id v28 = a4;
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v6 = (void *)qword_1E010;
  uint64_t v32 = qword_1E010;
  if (!qword_1E010)
  {
    sub_D58C();
    v30[3] = (uint64_t)objc_getClass("MLModelConfiguration");
    qword_1E010 = v30[3];
    id v6 = (void *)v30[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v29, 8);
  id v8 = objc_alloc_init(v7);
  [(_PSPersonalizationEvaluation *)self setAdaptableModelConfiguration:v8];

  id v9 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
  [v9 setComputeUnits:0];

  id v27 = [sub_9E94() numClasses];
  if (a3 == 2)
  {
    v35[0] = v27;
    CFStringRef v26 = [(_PSPersonalizationEvaluation *)self numClasses];
    id v25 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v26 intValue]);
    v36[0] = v25;
    id v24 = [sub_9E94() numTrees];
    v35[1] = v24;
    objc_super v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v28 intValue]);
    v36[1] = v23;
    char v22 = [sub_9E94() maxDepth];
    v35[2] = v22;
    v21 = [(_PSPersonalizationEvaluation *)self maxDepth];
    unsigned __int8 v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v21 intValue]);
    v36[2] = v20;
    id v10 = [sub_9E94() learningRate];
    v35[3] = v10;
    id v11 = [(_PSPersonalizationEvaluation *)self learningRate];
    [v11 floatValue];
    id v12 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v36[3] = v12;
    id v13 = [sub_9E94() minChildWeight];
    v35[4] = v13;
    unsigned __int8 v14 = [(_PSPersonalizationEvaluation *)self minChildWeight];
    [v14 floatValue];
    id v15 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v36[4] = v15;
    id v16 = [sub_9E94() objective];
    v35[5] = v16;
    v36[5] = @"binary:logistic";
    id v17 = [sub_9E94() updateType];
    v35[6] = v17;
    v36[6] = @"treeRefresh";
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:7];
    id v19 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
    [v19 setParameters:v18];
  }
  else
  {
    v33[0] = v27;
    CFStringRef v26 = [(_PSPersonalizationEvaluation *)self numClasses];
    id v25 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v26 intValue]);
    v34[0] = v25;
    id v24 = [sub_9E94() numTrees];
    v33[1] = v24;
    objc_super v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v28 intValue]);
    v34[1] = v23;
    char v22 = [sub_9E94() maxDepth];
    v33[2] = v22;
    v21 = [(_PSPersonalizationEvaluation *)self maxDepth];
    unsigned __int8 v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v21 intValue]);
    v34[2] = v20;
    id v10 = [sub_9E94() learningRate];
    v33[3] = v10;
    id v11 = [(_PSPersonalizationEvaluation *)self learningRate];
    [v11 floatValue];
    id v12 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v34[3] = v12;
    id v13 = [sub_9E94() minChildWeight];
    v33[4] = v13;
    unsigned __int8 v14 = [(_PSPersonalizationEvaluation *)self minChildWeight];
    [v14 floatValue];
    id v15 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v34[4] = v15;
    id v16 = [sub_9E94() objective];
    v33[5] = v16;
    v34[5] = @"binary:logistic";
    id v17 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:6];
    uint64_t v18 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
    [v18 setParameters:v17];
  }
}

- (id)loadAdaptableModelUnderDirectory:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_PSPersonalizationEvaluation *)self adaptationStrategy];
  id v6 = [(_PSPersonalizationEvaluation *)self numTrees];
  [(_PSPersonalizationEvaluation *)self updateAdaptableModelConfigWithUpdateType:v5 numTrees:v6];

  +[_PSBehaviorRuleRankingUtilities loadDeployedAdaptableModelUnderDirectory:v4];
  id v7 = objc_alloc_init((Class)NSFileManager);
  id v8 = +[_PSBehaviorRuleRankingUtilities getIntermediateAdaptableCompiledMLModel];
  id v9 = +[_PSBehaviorRuleRankingUtilities getTrialCompiledAdaptableMLModelPath];
  if ([v7 fileExistsAtPath:v9])
  {
    if ([(_PSPersonalizationEvaluation *)self cloneAdaptableModel:v9 toFilePath:v8 originalXgboostModelName:@"TrialAdaptableRuleImportancePredictor.xgboost" clonedXgboostModelName:@"IntermediateAdaptableModel.xgboost"])
    {
      goto LABEL_3;
    }
LABEL_12:
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
      sub_F274();
    }
    goto LABEL_17;
  }
  unsigned __int8 v20 = +[_PSBehaviorRuleRankingUtilities getDeployedAdaptableCompiledMLModelPath];
  if (([v7 fileExistsAtPath:v20] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
      sub_F2A8();
    }

    goto LABEL_17;
  }
  unsigned __int8 v21 = [(_PSPersonalizationEvaluation *)self cloneAdaptableModel:v20 toFilePath:v8 originalXgboostModelName:@"AdaptableRuleImportancePredictor.xgboost" clonedXgboostModelName:@"IntermediateAdaptableModel.xgboost"];

  if ((v21 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_3:
  id v10 = [objc_alloc((Class)NSURL) initFileURLWithPath:v8];
  [(_PSPersonalizationEvaluation *)self setIntermediateCompiledModelURL:v10];

  id v11 = [(_PSPersonalizationEvaluation *)self intermediateCompiledModelURL];

  if (!v11)
  {
LABEL_17:
    id v19 = 0;
    goto LABEL_22;
  }
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v12 = (void *)qword_1E020;
  uint64_t v32 = qword_1E020;
  if (!qword_1E020)
  {
    *(void *)long long buf = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    CFStringRef v26 = sub_DC24;
    id v27 = &unk_18560;
    id v28 = &v29;
    sub_D58C();
    v30[3] = (uint64_t)objc_getClass("MLModel");
    qword_1E020 = *(void *)(v28[1] + 24);
    id v12 = (void *)v30[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v29, 8);
  unsigned __int8 v14 = [(_PSPersonalizationEvaluation *)self intermediateCompiledModelURL];
  id v15 = [(_PSPersonalizationEvaluation *)self adaptableModelConfiguration];
  id v23 = 0;
  id v16 = [v13 modelWithContentsOfURL:v14 configuration:v15 error:&v23];
  id v17 = v23;

  uint64_t v18 = qword_1DF98;
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
      sub_F1A4(v18, self, (uint64_t)v17);
    }
    id v19 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Cloning adaptable ML model to intermediate model and loading it was successful", buf, 2u);
    }
    id v19 = v16;
  }

LABEL_22:

  return v19;
}

- (id)processDataWithQuery:(id)a3 balanceNeed:(BOOL)a4
{
  BOOL v133 = a4;
  id v129 = a3;
  id v4 = &NSLog_ptr;
  long long v135 = objc_opt_new();
  long long v134 = objc_opt_new();
  int64_t v5 = qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "In processDataWithQuery", buf, 2u);
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 10;
  while (1)
  {
    unint64_t v130 = v8;
    [v129 setLimit:10];
    uint64_t v131 = v6;
    [v129 setOffset:v6];
    id v9 = [(_PSPersonalizationEvaluation *)self knowledgeStore];
    id v181 = 0;
    id v10 = [v9 executeQuery:v129 error:&v181];
    id v11 = v181;

    id v12 = (void *)qword_1DF98;
    if (v11) {
      break;
    }
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      id v13 = v12;
      unsigned __int8 v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 count]);
      *(_DWORD *)long long buf = 138412290;
      v191 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "knowledgeEvents parsing, number of events: %@", buf, 0xCu);
    }
    long long v179 = 0u;
    long long v180 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    id obj = v10;
    id v15 = [obj countByEnumeratingWithState:&v177 objects:v189 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v178;
      uint64_t v136 = *(void *)v178;
      do
      {
        uint64_t v18 = 0;
        id v137 = v16;
        do
        {
          if (*(void *)v178 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v177 + 1) + 8 * (void)v18);
          if (v19)
          {
            v140 = *(void **)(*((void *)&v177 + 1) + 8 * (void)v18);
            v141 = v18;
            unsigned __int8 v20 = [v19 metadata];
            unsigned __int8 v21 = +[_DKBehavioralRuleFeaturesMetadataKey featureDict];
            char v22 = [v20 objectForKeyedSubscript:v21];

            v147 = v22;
            if (v22)
            {
              id v23 = (void *)qword_1DF98;
              if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
              {
                id v24 = v23;
                uint64_t v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 count]);
                *(_DWORD *)long long buf = 138412290;
                v191 = v25;
                _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "number of data points: %@", buf, 0xCu);
              }
              if (objc_msgSend(v22, "count", v129))
              {
                uint64_t v7 = (v7 + 1);
                CFStringRef v26 = (void *)qword_1DF98;
                if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
                {
                  id v27 = v26;
                  id v28 = [v22 objectAtIndexedSubscript:0];
                  uint64_t v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v28 count]);
                  *(_DWORD *)long long buf = 138412290;
                  v191 = v29;
                  _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "data point dimension: %@", buf, 0xCu);
                }
              }
              __int16 v30 = (void *)qword_1DF98;
              if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
              {
                uint64_t v31 = v30;
                uint64_t v32 = +[NSNumber numberWithInt:v7];
                *(_DWORD *)long long buf = 138412290;
                v191 = v32;
                _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "countEvents: %@", buf, 0xCu);
              }
              unsigned int v139 = v7;
              if (v7 == 1 && [v147 count])
              {
                Class v33 = [(_PSPersonalizationEvaluation *)self selectedFeaturesConfig];
                uint64_t v34 = [v33 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"];

                id v35 = objc_alloc_init((Class)NSMutableDictionary);
                [(_PSPersonalizationEvaluation *)self setFeatureNameDict:v35];

                long long v175 = 0u;
                long long v176 = 0u;
                long long v173 = 0u;
                long long v174 = 0u;
                id v36 = v34;
                unint64_t v37 = (unint64_t)[v36 countByEnumeratingWithState:&v173 objects:v188 count:16];
                if (v37)
                {
                  uint64_t v38 = 0;
                  uint64_t v39 = *(void *)v174;
                  do
                  {
                    id v40 = 0;
                    uint64_t v41 = v38;
                    do
                    {
                      if (*(void *)v174 != v39) {
                        objc_enumerationMutation(v36);
                      }
                      uint64_t v42 = *(void *)(*((void *)&v173 + 1) + 8 * (void)v40);
                      id v43 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                      id v44 = +[NSNumber numberWithInt:(char *)v40 + v41];
                      [v43 setValue:v44 forKey:v42];

                      id v40 = (char *)v40 + 1;
                    }
                    while ((void *)v37 != v40);
                    unint64_t v37 = (unint64_t)[v36 countByEnumeratingWithState:&v173 objects:v188 count:16];
                    uint64_t v38 = (v41 + v40);
                  }
                  while (v37);
                  unint64_t v37 = (v41 + v40);
                }

                id v45 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                uint64_t v46 = +[NSNumber numberWithInt:v37];
                [v45 setValue:v46 forKey:@"personAndAppMatched"];

                Class v47 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                uint64_t v48 = +[NSNumber numberWithInt:(v37 + 1)];
                [v47 setValue:v48 forKey:@"recipientAndBundleIDAsInteger"];

                uint64_t v49 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                id v50 = +[NSNumber numberWithInt:(v37 + 2)];
                [v49 setValue:v50 forKey:@"predictedClass"];

                uint64_t v51 = (void *)qword_1DF98;
                if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
                {
                  uint64_t v52 = v51;
                  uint64_t v53 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                  *(_DWORD *)long long buf = 138412290;
                  v191 = v53;
                  _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "featureNameDict: %@", buf, 0xCu);
                }
              }
              id v143 = objc_alloc_init((Class)v4[99]);
              if (v133)
              {
                id v142 = objc_alloc_init((Class)v4[99]);
                if ([v147 count])
                {
                  uint64_t v145 = 0;
                  while (1)
                  {
                    id v54 = objc_alloc_init((Class)v4[99]);
                    long long v169 = 0u;
                    long long v170 = 0u;
                    long long v171 = 0u;
                    long long v172 = 0u;
                    id v55 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                    id v56 = [v55 countByEnumeratingWithState:&v169 objects:v187 count:16];
                    if (v56)
                    {
                      id v57 = v56;
                      uint64_t v58 = *(void *)v170;
                      do
                      {
                        for (unint64_t i = 0; i != v57; unint64_t i = (char *)i + 1)
                        {
                          if (*(void *)v170 != v58) {
                            objc_enumerationMutation(v55);
                          }
                          if (([*(id *)(*((void *)&v169 + 1) + 8 * i) isEqualToString:@"predictedClass"] & 1) == 0)
                          {
                            v60 = objc_opt_new();
                            [v54 addObject:v60];
                          }
                        }
                        id v57 = [v55 countByEnumeratingWithState:&v169 objects:v187 count:16];
                      }
                      while (v57);
                    }

                    long long v167 = 0u;
                    long long v168 = 0u;
                    long long v165 = 0u;
                    long long v166 = 0u;
                    float v61 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                    id v62 = [v61 countByEnumeratingWithState:&v165 objects:v186 count:16];
                    if (!v62) {
                      break;
                    }
                    id v63 = v62;
                    char v64 = 0;
                    uint64_t v65 = *(void *)v166;
                    id v144 = v61;
                    do
                    {
                      for (j = 0; j != v63; j = (char *)j + 1)
                      {
                        if (*(void *)v166 != v65) {
                          objc_enumerationMutation(v144);
                        }
                        v67 = *(void **)(*((void *)&v165 + 1) + 8 * (void)j);
                        if (([v67 isEqualToString:@"predictedClass"] & 1) == 0)
                        {
                          id v68 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                          id v69 = [v68 objectForKeyedSubscript:v67];
                          signed int v70 = [v69 intValue];
                          id v71 = [v54 count];

                          if ((unint64_t)v71 > v70)
                          {
                            v72 = [v147 objectAtIndexedSubscript:v145];
                            v73 = [v72 objectForKeyedSubscript:v67];
                            v74 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                            id v75 = [v74 objectForKeyedSubscript:v67];
                            objc_msgSend(v54, "setObject:atIndexedSubscript:", v73, (int)objc_msgSend(v75, "intValue"));
                          }
                        }
                        if ([v67 isEqualToString:@"personAndAppMatched"])
                        {
                          uint64_t v76 = [v147 objectAtIndexedSubscript:v145];
                          id v77 = [v76 objectForKeyedSubscript:v67];

                          v64 |= [v77 intValue] == 1;
                        }
                      }
                      id v63 = [v144 countByEnumeratingWithState:&v165 objects:v186 count:16];
                    }
                    while (v63);

                    id v4 = &NSLog_ptr;
                    if ((v64 & 1) == 0) {
                      goto LABEL_61;
                    }
                    id v78 = [v54 copy];
                    BOOL v79 = v143;
LABEL_62:
                    [v79 addObject:v78];

                    if ((unint64_t)[v147 count] <= ++v145) {
                      goto LABEL_63;
                    }
                  }

LABEL_61:
                  id v78 = [v54 copy];
                  BOOL v79 = v142;
                  goto LABEL_62;
                }
LABEL_63:
                id v80 = objc_alloc_init((Class)v4[99]);
                long long v161 = 0u;
                long long v162 = 0u;
                long long v163 = 0u;
                long long v164 = 0u;
                id v81 = v143;
                id v82 = [v81 countByEnumeratingWithState:&v161 objects:v185 count:16];
                if (v82)
                {
                  id v83 = v82;
                  uint64_t v84 = *(void *)v162;
                  do
                  {
                    for (k = 0; k != v83; k = (char *)k + 1)
                    {
                      if (*(void *)v162 != v84) {
                        objc_enumerationMutation(v81);
                      }
                      id v86 = [*(id *)(*((void *)&v161 + 1) + 8 * (void)k) copy];
                      [v80 addObject:v86];
                    }
                    id v83 = [v81 countByEnumeratingWithState:&v161 objects:v185 count:16];
                  }
                  while (v83);
                }

                [v142 shuffle];
                uint64_t v87 = (char *)[v81 count];
                v88 = (void *)qword_1DF98;
                if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
                {
                  uint64_t v89 = v88;
                  v90 = +[NSNumber numberWithUnsignedLong:v87];
                  *(_DWORD *)long long buf = 138412290;
                  v191 = v90;
                  _os_log_impl(&dword_0, v89, OS_LOG_TYPE_INFO, "posCount: %@", buf, 0xCu);
                }
                long long v159 = 0u;
                long long v160 = 0u;
                long long v157 = 0u;
                long long v158 = 0u;
                id v91 = v142;
                id v92 = (char *)[v91 countByEnumeratingWithState:&v157 objects:v184 count:16];
                if (v92)
                {
                  v93 = v92;
                  unint64_t v94 = 0;
                  uint64_t v95 = *(void *)v158;
LABEL_74:
                  uint64_t v96 = 0;
                  if ((unint64_t)v87 >= v94) {
                    id v97 = &v87[-v94];
                  }
                  else {
                    id v97 = 0;
                  }
                  while (1)
                  {
                    if (*(void *)v158 != v95) {
                      objc_enumerationMutation(v91);
                    }
                    if (v97 == v96) {
                      break;
                    }
                    id v98 = [*(id *)(*((void *)&v157 + 1) + 8 * (void)v96) copy];
                    [v80 addObject:v98];

                    if (v93 == ++v96)
                    {
                      v93 = (char *)[v91 countByEnumeratingWithState:&v157 objects:v184 count:16];
                      v94 += (unint64_t)v96;
                      if (v93) {
                        goto LABEL_74;
                      }
                      break;
                    }
                  }
                }

                [v135 addObject:v80];
                CFStringRef v99 = v143;
              }
              else
              {
                if ([v147 count])
                {
                  unint64_t v146 = 0;
                  do
                  {
                    id v100 = objc_alloc_init((Class)v4[99]);
                    long long v153 = 0u;
                    long long v154 = 0u;
                    long long v155 = 0u;
                    long long v156 = 0u;
                    uint64_t v101 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                    id v102 = [v101 countByEnumeratingWithState:&v153 objects:v183 count:16];
                    if (v102)
                    {
                      id v103 = v102;
                      uint64_t v104 = *(void *)v154;
                      do
                      {
                        for (m = 0; m != v103; m = (char *)m + 1)
                        {
                          if (*(void *)v154 != v104) {
                            objc_enumerationMutation(v101);
                          }
                          if (([*(id *)(*((void *)&v153 + 1) + 8 * (void)m) isEqualToString:@"predictedClass"] & 1) == 0)
                          {
                            uint64_t v106 = objc_opt_new();
                            [v100 addObject:v106];
                          }
                        }
                        id v103 = [v101 countByEnumeratingWithState:&v153 objects:v183 count:16];
                      }
                      while (v103);
                    }

                    long long v151 = 0u;
                    long long v152 = 0u;
                    long long v149 = 0u;
                    long long v150 = 0u;
                    id v107 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                    id v108 = [v107 countByEnumeratingWithState:&v149 objects:v182 count:16];
                    if (v108)
                    {
                      id v109 = v108;
                      uint64_t v110 = *(void *)v150;
                      do
                      {
                        for (n = 0; n != v109; n = (char *)n + 1)
                        {
                          if (*(void *)v150 != v110) {
                            objc_enumerationMutation(v107);
                          }
                          id v112 = *(void **)(*((void *)&v149 + 1) + 8 * (void)n);
                          if (([v112 isEqualToString:@"predictedClass"] & 1) == 0)
                          {
                            uint64_t v113 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                            id v114 = [v113 objectForKeyedSubscript:v112];
                            signed int v115 = [v114 intValue];
                            id v116 = [v100 count];

                            if ((unint64_t)v116 > v115)
                            {
                              uint64_t v117 = [v147 objectAtIndexedSubscript:v146];
                              uint64_t v118 = [v117 objectForKeyedSubscript:v112];
                              id v119 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                              long long v120 = [v119 objectForKeyedSubscript:v112];
                              objc_msgSend(v100, "setObject:atIndexedSubscript:", v118, (int)objc_msgSend(v120, "intValue"));
                            }
                          }
                        }
                        id v109 = [v107 countByEnumeratingWithState:&v149 objects:v182 count:16];
                      }
                      while (v109);
                    }

                    id v121 = [v100 copy];
                    [v143 addObject:v121];

                    ++v146;
                    id v4 = &NSLog_ptr;
                  }
                  while ((unint64_t)[v147 count] > v146);
                }
                CFStringRef v99 = v143;
                [v135 addObject:v143];
              }

              long long v122 = [v140 startDate];
              [v134 addObject:v122];

              uint64_t v7 = v139;
              uint64_t v17 = v136;
              id v16 = v137;
            }

            uint64_t v18 = v141;
          }
          uint64_t v18 = (char *)v18 + 1;
        }
        while (v18 != v16);
        id v16 = [obj countByEnumeratingWithState:&v177 objects:v189 count:16];
      }
      while (v16);
    }

    uint64_t v6 = v131 + 10;
    uint64_t v8 = v130 + 10;
    if (v130 >= 0x5B)
    {
      long long v123 = (void *)qword_1DF98;
      if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
      {
        long long v124 = v123;
        long long v125 = +[NSNumber numberWithInt:v7];
        *(_DWORD *)long long buf = 138412290;
        v191 = v125;
        _os_log_impl(&dword_0, v124, OS_LOG_TYPE_INFO, "knowledge store events with data: %@", buf, 0xCu);
      }
      long long v126 = v135;
      id v127 = v135;
      goto LABEL_117;
    }
  }
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
    sub_F2DC();
  }

  id v127 = 0;
  long long v126 = v135;
LABEL_117:

  return v127;
}

- (id)createMLFeatureProviderArrayFromSingleShareEventData:(id)a3 forMLModel:(id)a4
{
  id v6 = a3;
  id v58 = a4;
  id v54 = +[NSMutableArray array];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v6;
  id v57 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
  if (!v57)
  {
    float v61 = 0;
    goto LABEL_39;
  }
  float v61 = 0;
  uint64_t v56 = *(void *)v79;
  *(void *)&long long v7 = 138412290;
  long long v53 = v7;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v79 != v56)
      {
        uint64_t v9 = v8;
        objc_enumerationMutation(obj);
        uint64_t v8 = v9;
      }
      uint64_t v59 = v8;
      id v10 = *(void **)(*((void *)&v78 + 1) + 8 * v8);
      id v11 = [v10 mutableCopy];
      id v12 = [(_PSPersonalizationEvaluation *)self featureNameDict];
      char v64 = [v12 objectForKeyedSubscript:@"personAndAppMatched"];

      id v63 = objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v64, "intValue"));
      uint64_t v82 = 0;
      id v83 = &v82;
      uint64_t v84 = 0x2050000000;
      id v13 = (void *)qword_1E028;
      uint64_t v85 = qword_1E028;
      if (!qword_1E028)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        id v91 = sub_DC74;
        id v92 = &unk_18560;
        v93 = &v82;
        sub_D58C();
        Class Class = objc_getClass("MLFeatureValue");
        *(void *)(v93[1] + 24) = Class;
        qword_1E028 = *(void *)(v93[1] + 24);
        id v13 = (void *)v83[3];
      }
      id v15 = v13;
      _Block_object_dispose(&v82, 8);
      [v63 floatValue];
      id v62 = [v15 featureValueWithInt64:(int)v16];
      if ([v58 isEqualToString:@"classicMLModel"])
      {
        uint64_t v17 = [(_PSPersonalizationEvaluation *)self featureNameDict];
        id v65 = [v17 objectForKeyedSubscript:@"predictedClass"];

        objc_msgSend(v11, "setObject:atIndexedSubscript:", v62, (int)objc_msgSend(v65, "intValue"));
        id v18 = objc_alloc_init((Class)NSMutableDictionary);
        long long v77 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v74 = 0u;
        id v19 = [(_PSPersonalizationEvaluation *)self featureNameDict];
        id v20 = [v19 countByEnumeratingWithState:&v74 objects:v88 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v75;
          do
          {
            for (unint64_t i = 0; i != v20; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v75 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = *(void *)(*((void *)&v74 + 1) + 8 * i);
              id v24 = [(_PSPersonalizationEvaluation *)self featureNameDict];
              uint64_t v25 = [v24 objectForKeyedSubscript:v23];

              CFStringRef v26 = objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v25, "intValue"));
              [v18 setValue:v26 forKey:v23];
            }
            id v20 = [v19 countByEnumeratingWithState:&v74 objects:v88 count:16];
          }
          while (v20);
        }

        id v27 = objc_alloc((Class)sub_BBAC());
        id v28 = [v18 copy];
        id v73 = v61;
        id v66 = [v27 initWithDictionary:v28 error:&v73];
        id v29 = v73;

        if (!v29)
        {
          [v54 addObject:v66];
          goto LABEL_34;
        }
        __int16 v30 = qword_1DF98;
        if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR))
        {
LABEL_24:
          LODWORD(buf) = v53;
          *(void *)((char *)&buf + 4) = v29;
          _os_log_error_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, "Error getting sample point into MLDictionaryFeatureProvider format with error:%@", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        if (![v58 isEqualToString:@"adaptableMLModel"]) {
          goto LABEL_35;
        }
        uint64_t v31 = [(_PSPersonalizationEvaluation *)self selectedFeaturesConfig];
        id v65 = [v31 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"];

        id v18 = [&__NSDictionary0__struct mutableCopy];
        uint64_t v82 = 0;
        id v83 = &v82;
        uint64_t v84 = 0x2050000000;
        uint64_t v32 = (void *)qword_1E038;
        uint64_t v85 = qword_1E038;
        if (!qword_1E038)
        {
          *(void *)&long long buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472;
          id v91 = sub_DD14;
          id v92 = &unk_18560;
          v93 = &v82;
          sub_D58C();
          Class v33 = objc_getClass("MLMultiArray");
          *(void *)(v93[1] + 24) = v33;
          qword_1E038 = *(void *)(v93[1] + 24);
          uint64_t v32 = (void *)v83[3];
        }
        uint64_t v34 = v32;
        _Block_object_dispose(&v82, 8);
        id v35 = [v34 alloc];
        id v36 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v65 count]);
        uint64_t v87 = v36;
        unint64_t v37 = +[NSArray arrayWithObjects:&v87 count:1];
        id v72 = v61;
        id v66 = [v35 initWithShape:v37 dataType:65568 error:&v72];
        id v29 = v72;

        if (!v29)
        {
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v65 = v65;
          id v38 = [v65 countByEnumeratingWithState:&v68 objects:v86 count:16];
          if (v38)
          {
            uint64_t v39 = 0;
            uint64_t v40 = *(void *)v69;
            do
            {
              for (j = 0; j != v38; j = (char *)j + 1)
              {
                if (*(void *)v69 != v40) {
                  objc_enumerationMutation(v65);
                }
                uint64_t v42 = *(void *)(*((void *)&v68 + 1) + 8 * (void)j);
                id v43 = [(_PSPersonalizationEvaluation *)self featureNameDict];
                id v44 = [v43 objectForKeyedSubscript:v42];

                id v45 = objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v44, "intValue"));
                [v45 floatValue];
                uint64_t v46 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
                [v66 setObject:v46 atIndexedSubscript:(char *)j + v39];
              }
              id v38 = [v65 countByEnumeratingWithState:&v68 objects:v86 count:16];
              v39 += (uint64_t)j;
            }
            while (v38);
          }

          [v18 setObject:v66 forKeyedSubscript:@"input"];
          [v18 setObject:v62 forKeyedSubscript:@"predictedClass"];
          Class v47 = [(_PSPersonalizationEvaluation *)self featureNameDict];
          uint64_t v48 = [v47 objectForKeyedSubscript:@"recipientAndBundleIDAsInteger"];

          uint64_t v49 = objc_msgSend(v11, "objectAtIndexedSubscript:", (int)objc_msgSend(v48, "intValue"));
          [v18 setObject:v49 forKeyedSubscript:@"recipientAndBundleIDAsInteger"];

          id v50 = objc_alloc((Class)sub_BBAC());
          id v67 = 0;
          id v51 = [v50 initWithDictionary:v18 error:&v67];
          id v29 = v67;
          [v54 addObject:v51];

          goto LABEL_34;
        }
        __int16 v30 = qword_1DF98;
        if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_ERROR)) {
          goto LABEL_24;
        }
      }
LABEL_34:

      float v61 = v29;
LABEL_35:

      uint64_t v8 = v59 + 1;
    }
    while ((id)(v59 + 1) != v57);
    id v57 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
  }
  while (v57);
LABEL_39:

  return v54;
}

- (void)adaptMLModel:(id)a3 withTrainingData:(id)a4 modelConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    id v12 = v11;
    id v13 = [v10 parameters];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v9 count];
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "AdaptMLModel config: %@, amount of data: %ld", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v57 = sub_C3AC;
  id v58 = sub_C3BC;
  id v59 = 0;
  uint64_t v46 = 0;
  Class v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = sub_C3AC;
  id v50 = sub_C3BC;
  dispatch_semaphore_t v51 = dispatch_semaphore_create(0);
  id v14 = v9;
  id v15 = qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    LOWORD(v60) = 0;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Training data prepped for model adaptation", (uint8_t *)&v60, 2u);
  }
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_C3C4;
  v45[3] = &unk_185E8;
  v45[4] = self;
  v45[5] = &v46;
  float v16 = objc_retainBlock(v45);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_C484;
  v41[3] = &unk_18610;
  id v17 = v8;
  id v42 = v17;
  id v43 = buf;
  id v44 = &v46;
  id v18 = objc_retainBlock(v41);
  uint64_t v52 = 0;
  long long v53 = &v52;
  uint64_t v54 = 0x2050000000;
  id v19 = (void *)qword_1E040;
  uint64_t v55 = qword_1E040;
  if (!qword_1E040)
  {
    *(void *)&long long v60 = _NSConcreteStackBlock;
    *((void *)&v60 + 1) = 3221225472;
    float v61 = sub_DD64;
    id v62 = &unk_18560;
    id v63 = &v52;
    sub_D58C();
    Class Class = objc_getClass("MLUpdateProgressHandlers");
    *(void *)(v63[1] + 24) = Class;
    qword_1E040 = *(void *)(v63[1] + 24);
    id v19 = (void *)v53[3];
  }
  uint64_t v21 = v19;
  _Block_object_dispose(&v52, 8);
  id v22 = [[v21 alloc] initForEvents:3 progressHandler:v16 completionHandler:v18];
  if (!v14
    || ([v14 array],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        BOOL v24 = [v23 count] == 0,
        v23,
        v24))
  {
    id v38 = qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      LOWORD(v60) = 0;
      _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL is not initiated due to lack of training data", (uint8_t *)&v60, 2u);
    }
    goto LABEL_24;
  }
  uint64_t v25 = (id)qword_1DF98;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = v10;
    id v27 = [v14 array];
    id v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v27 count]);
    LODWORD(v60) = 138412290;
    *(void *)((char *)&v60 + 4) = v28;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Update task will be initiated with %@ number of samples", (uint8_t *)&v60, 0xCu);

    id v10 = v26;
  }

  id v29 = (id)qword_1DF98;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    __int16 v30 = [v10 parameters];
    LODWORD(v60) = 138412290;
    *(void *)((char *)&v60 + 4) = v30;
    _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Config: %@", (uint8_t *)&v60, 0xCu);
  }
  uint64_t v52 = 0;
  long long v53 = &v52;
  uint64_t v54 = 0x2050000000;
  uint64_t v31 = (void *)qword_1E048;
  uint64_t v55 = qword_1E048;
  if (!qword_1E048)
  {
    *(void *)&long long v60 = _NSConcreteStackBlock;
    *((void *)&v60 + 1) = 3221225472;
    float v61 = sub_DDB4;
    id v62 = &unk_18560;
    id v63 = &v52;
    sub_D58C();
    Class v32 = objc_getClass("MLUpdateTask");
    *(void *)(v63[1] + 24) = v32;
    qword_1E048 = *(void *)(v63[1] + 24);
    uint64_t v31 = (void *)v53[3];
  }
  id v33 = v31;
  _Block_object_dispose(&v52, 8);
  uint64_t v34 = (id *)(*(void *)&buf[8] + 40);
  id obj = *(id *)(*(void *)&buf[8] + 40);
  id v35 = [v33 updateTaskForModelAtURL:v17 trainingData:v14 configuration:v10 progressHandlers:v22 error:&obj];
  objc_storeStrong(v34, obj);
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    [v35 resume];
    uint64_t v39 = qword_1DF98;
    if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
    {
      LOWORD(v60) = 0;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL initiated", (uint8_t *)&v60, 2u);
    }

LABEL_24:
    dispatch_semaphore_wait((dispatch_semaphore_t)v47[5], 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_25;
  }
  id v36 = qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    uint64_t v37 = *(void *)(*(void *)&buf[8] + 40);
    LODWORD(v60) = 138412290;
    *(void *)((char *)&v60 + 4) = v37;
    _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL caused error: %@", (uint8_t *)&v60, 0xCu);
  }

LABEL_25:
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(buf, 8);
}

- (id)_getDataStatistics:(id)a3 forData:(id)a4
{
  id v91 = a3;
  id v95 = a4;
  id v6 = qword_1DF98;
  if (os_log_type_enabled((os_log_t)qword_1DF98, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Arrived in NEW _getDataStatistics method", buf, 2u);
  }
  id v96 = objc_alloc_init((Class)NSMutableDictionary);
  long long v7 = [(_PSPersonalizationEvaluation *)self selectedFeaturesConfig];
  id v8 = [v7 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"];

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v101 objects:v115 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v102;
    do
    {
      for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v102 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v101 + 1) + 8 * i);
        id v14 = objc_alloc_init((Class)NSMutableArray);
        [v96 setValue:v14 forKey:v13];
      }
      id v10 = [v9 countByEnumeratingWithState:&v101 objects:v115 count:16];
    }
    while (v10);
  }

  if ([v95 count])
  {
    unint64_t v15 = 0;
    do
    {
      float v16 = [v95 objectAtIndexedSubscript:v15];
      BOOL v17 = [v16 count] == 0;

      if (!v17)
      {
        unint64_t v18 = 0;
        do
        {
          if ([v9 count])
          {
            unint64_t v19 = 0;
            do
            {
              id v20 = [v9 objectAtIndexedSubscript:v19];
              if (([v20 isEqual:@"confidence"] & 1) == 0) {
                [v20 isEqual:@"support"];
              }
              uint64_t v21 = [v96 objectForKeyedSubscript:v20];
              id v22 = [v95 objectAtIndexedSubscript:v15];
              uint64_t v23 = [v22 objectAtIndexedSubscript:v18];
              BOOL v24 = [v23 objectAtIndexedSubscript:v19];
              [v21 addObject:v24];

              ++v19;
            }
            while (v19 < (unint64_t)[v9 count]);
          }
          uint64_t v25 = [v95 objectAtIndexedSubscript:v15];
          id v26 = [v25 count];

          ++v18;
        }
        while (v18 < (unint64_t)v26);
      }
      ++v15;
    }
    while (v15 < (unint64_t)[v95 count]);
  }
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2050000000;
  id v27 = (void *)qword_1E050;
  uint64_t v113 = qword_1E050;
  if (!qword_1E050)
  {
    *(void *)long long buf = _NSConcreteStackBlock;
    uint64_t v106 = 3221225472;
    id v107 = sub_DE04;
    id v108 = &unk_18560;
    id v109 = &v110;
    sub_D720();
    Class Class = objc_getClass("ODCurareReportFillerDataSet");
    *(void *)(v109[1] + 24) = Class;
    qword_1E050 = *(void *)(v109[1] + 24);
    id v27 = (void *)v111[3];
  }
  id v29 = v27;
  _Block_object_dispose(&v110, 8);
  id v94 = (id)objc_opt_new();
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2050000000;
  __int16 v30 = (void *)qword_1E058;
  uint64_t v113 = qword_1E058;
  if (!qword_1E058)
  {
    *(void *)long long buf = _NSConcreteStackBlock;
    uint64_t v106 = 3221225472;
    id v107 = sub_DE54;
    id v108 = &unk_18560;
    id v109 = &v110;
    sub_D720();
    Class v31 = objc_getClass("ODCurareReportFillerDataSetSize");
    *(void *)(v109[1] + 24) = v31;
    qword_1E058 = *(void *)(v109[1] + 24);
    __int16 v30 = (void *)v111[3];
  }
  id v32 = v30;
  _Block_object_dispose(&v110, 8);
  id v92 = objc_opt_new();
  objc_msgSend(v92, "setNumberOfUserSessions:", objc_msgSend(v95, "count"));
  [v92 setNumberOfUserSamples:0];
  if ([v95 count])
  {
    unint64_t v33 = 0;
    do
    {
      uint64_t v34 = [v95 objectAtIndexedSubscript:v33];
      objc_msgSend(v92, "setNumberOfUserSamples:", objc_msgSend(v92, "numberOfUserSamples") + objc_msgSend(v34, "count"));

      ++v33;
    }
    while (v33 < (unint64_t)[v95 count]);
  }
  [v94 setSize:v92];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = v9;
  id v35 = [obj countByEnumeratingWithState:&v97 objects:v114 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v98;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v98 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = *(void *)(*((void *)&v97 + 1) + 8 * (void)j);
        uint64_t v40 = [_PSFeatureStatistics alloc];
        uint64_t v41 = [v96 objectForKeyedSubscript:v38];
        id v42 = [(_PSFeatureStatistics *)v40 initWithList:v41];

        uint64_t v110 = 0;
        v111 = &v110;
        uint64_t v112 = 0x2050000000;
        id v43 = (void *)qword_1E060;
        uint64_t v113 = qword_1E060;
        if (!qword_1E060)
        {
          *(void *)long long buf = _NSConcreteStackBlock;
          uint64_t v106 = 3221225472;
          id v107 = sub_DEA4;
          id v108 = &unk_18560;
          id v109 = &v110;
          sub_D720();
          Class v44 = objc_getClass("ODCurareReportFillerDataSetStats");
          *(void *)(v109[1] + 24) = v44;
          qword_1E060 = *(void *)(v109[1] + 24);
          id v43 = (void *)v111[3];
        }
        id v45 = v43;
        _Block_object_dispose(&v110, 8);
        uint64_t v46 = objc_opt_new();
        [v46 setFeatureName:v38];
        [(_PSFeatureStatistics *)v42 min];
        Class v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        uint64_t v48 = [v47 stringValue];
        [v46 setFeatureValueMin:v48];

        [(_PSFeatureStatistics *)v42 max];
        uint64_t v49 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        id v50 = [v49 stringValue];
        [v46 setFeatureValueMax:v50];

        [(_PSFeatureStatistics *)v42 avg];
        dispatch_semaphore_t v51 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        uint64_t v52 = [v51 stringValue];
        [v46 setFeatureValueMean:v52];

        [(_PSFeatureStatistics *)v42 stdev];
        long long v53 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        uint64_t v54 = [v53 stringValue];
        [v46 setFeatureValueStd:v54];

        uint64_t v55 = [(_PSFeatureStatistics *)v42 percentiles];
        uint64_t v56 = [v55 objectForKeyedSubscript:@"10%"];
        id v57 = [v56 stringValue];
        BOOL v58 = v57 == 0;

        if (v58)
        {
          [v46 setFeatureValuePercentile10:@"nil"];
        }
        else
        {
          id v59 = [(_PSFeatureStatistics *)v42 percentiles];
          long long v60 = [v59 objectForKeyedSubscript:@"10%"];
          float v61 = [v60 stringValue];
          [v46 setFeatureValuePercentile10:v61];
        }
        id v62 = [(_PSFeatureStatistics *)v42 percentiles];
        id v63 = [v62 objectForKeyedSubscript:@"25%"];
        char v64 = [v63 stringValue];
        BOOL v65 = v64 == 0;

        if (v65)
        {
          [v46 setFeatureValuePercentile25:@"nil"];
        }
        else
        {
          id v66 = [(_PSFeatureStatistics *)v42 percentiles];
          id v67 = [v66 objectForKeyedSubscript:@"25%"];
          long long v68 = [v67 stringValue];
          [v46 setFeatureValuePercentile25:v68];
        }
        long long v69 = [(_PSFeatureStatistics *)v42 percentiles];
        long long v70 = [v69 objectForKeyedSubscript:@"50%"];
        long long v71 = [v70 stringValue];
        BOOL v72 = v71 == 0;

        if (v72)
        {
          [v46 setFeatureValuePercentile50:@"nil"];
        }
        else
        {
          id v73 = [(_PSFeatureStatistics *)v42 percentiles];
          long long v74 = [v73 objectForKeyedSubscript:@"50%"];
          long long v75 = [v74 stringValue];
          [v46 setFeatureValuePercentile50:v75];
        }
        long long v76 = [(_PSFeatureStatistics *)v42 percentiles];
        long long v77 = [v76 objectForKeyedSubscript:@"75%"];
        long long v78 = [v77 stringValue];
        BOOL v79 = v78 == 0;

        if (v79)
        {
          [v46 setFeatureValuePercentile75:@"nil"];
        }
        else
        {
          long long v80 = [(_PSFeatureStatistics *)v42 percentiles];
          long long v81 = [v80 objectForKeyedSubscript:@"75%"];
          uint64_t v82 = [v81 stringValue];
          [v46 setFeatureValuePercentile75:v82];
        }
        id v83 = [(_PSFeatureStatistics *)v42 percentiles];
        uint64_t v84 = [v83 objectForKeyedSubscript:@"90%"];
        uint64_t v85 = [v84 stringValue];
        BOOL v86 = v85 == 0;

        if (v86)
        {
          [v46 setFeatureValuePercentile90:@"nil"];
        }
        else
        {
          uint64_t v87 = [(_PSFeatureStatistics *)v42 percentiles];
          v88 = [v87 objectForKeyedSubscript:@"90%"];
          uint64_t v89 = [v88 stringValue];
          [v46 setFeatureValuePercentile90:v89];
        }
        [v94 addStats:v46];
      }
      id v35 = [obj countByEnumeratingWithState:&v97 objects:v114 count:16];
    }
    while (v35);
  }

  return v94;
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (NSString)adaptableModelDeployPath
{
  return self->_adaptableModelDeployPath;
}

- (void)setAdaptableModelDeployPath:(id)a3
{
}

- (int64_t)adaptationStrategy
{
  return self->_adaptationStrategy;
}

- (void)setAdaptationStrategy:(int64_t)a3
{
  self->_adaptationStrategy = a3;
}

- (NSMutableDictionary)modelTagToHyperparameters
{
  return self->_modelTagToHyperparameters;
}

- (void)setModelTagToHyperparameters:(id)a3
{
}

- (NSMutableDictionary)modelTagToCandidateModel
{
  return self->_modelTagToCandidateModel;
}

- (void)setModelTagToCandidateModel:(id)a3
{
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (NSMutableDictionary)featureNameDict
{
  return self->_featureNameDict;
}

- (void)setFeatureNameDict:(id)a3
{
}

- (NSDictionary)selectedFeaturesConfig
{
  return self->_selectedFeaturesConfig;
}

- (void)setSelectedFeaturesConfig:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (MLModelConfiguration)adaptableModelConfiguration
{
  return self->_adaptableModelConfiguration;
}

- (void)setAdaptableModelConfiguration:(id)a3
{
}

- (NSURL)intermediateCompiledModelURL
{
  return self->_intermediateCompiledModelURL;
}

- (void)setIntermediateCompiledModelURL:(id)a3
{
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(id)a3
{
}

- (NSNumber)topN
{
  return self->_topN;
}

- (void)setTopN:(id)a3
{
}

- (NSNumber)epoc
{
  return self->_epoc;
}

- (void)setEpoc:(id)a3
{
}

- (NSNumber)evaluationIterationCount
{
  return self->_evaluationIterationCount;
}

- (void)setEvaluationIterationCount:(id)a3
{
}

- (NSNumber)testSplitPercent
{
  return self->_testSplitPercent;
}

- (void)setTestSplitPercent:(id)a3
{
}

- (NSNumber)swapOK
{
  return self->_swapOK;
}

- (void)setSwapOK:(id)a3
{
}

- (NSNumber)accuracyGainThresholdForSwap
{
  return self->_accuracyGainThresholdForSwap;
}

- (void)setAccuracyGainThresholdForSwap:(id)a3
{
}

- (NSNumber)engagementRateGainThresholdForSwap
{
  return self->_engagementRateGainThresholdForSwap;
}

- (void)setEngagementRateGainThresholdForSwap:(id)a3
{
}

- (NSNumber)minimumTestDataSizeForSwap
{
  return self->_minimumTestDataSizeForSwap;
}

- (void)setMinimumTestDataSizeForSwap:(id)a3
{
}

- (NSNumber)numClasses
{
  return self->_numClasses;
}

- (void)setNumClasses:(id)a3
{
}

- (NSNumber)numTrees
{
  return self->_numTrees;
}

- (void)setNumTrees:(id)a3
{
}

- (NSNumber)maxDepth
{
  return self->_maxDepth;
}

- (void)setMaxDepth:(id)a3
{
}

- (NSNumber)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(id)a3
{
}

- (NSNumber)minChildWeight
{
  return self->_minChildWeight;
}

- (void)setMinChildWeight:(id)a3
{
}

- (NSNumber)recipeID
{
  return self->_recipeID;
}

- (void)setRecipeID:(id)a3
{
}

- (NSNumber)minSampleCountForAdaptation
{
  return self->_minSampleCountForAdaptation;
}

- (void)setMinSampleCountForAdaptation:(id)a3
{
}

- (NSUserDefaults)psAdaptationDefaults
{
  return self->_psAdaptationDefaults;
}

- (void)setPsAdaptationDefaults:(id)a3
{
}

- (ODCurareEvaluationAndReportingModule)curareEvaluationAndReporting
{
  return self->_curareEvaluationAndReporting;
}

- (void)setCurareEvaluationAndReporting:(id)a3
{
}

- (BOOL)evaluateIsInvokedOnce
{
  return self->_evaluateIsInvokedOnce;
}

- (void)setEvaluateIsInvokedOnce:(BOOL)a3
{
  self->_evaluateIsInvokedOnce = a3;
}

- (id)shouldContinue
{
  return self->_shouldContinue;
}

- (void)setShouldContinue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldContinue, 0);
  objc_storeStrong((id *)&self->_curareEvaluationAndReporting, 0);
  objc_storeStrong((id *)&self->_psAdaptationDefaults, 0);
  objc_storeStrong((id *)&self->_minSampleCountForAdaptation, 0);
  objc_storeStrong((id *)&self->_recipeID, 0);
  objc_storeStrong((id *)&self->_minChildWeight, 0);
  objc_storeStrong((id *)&self->_learningRate, 0);
  objc_storeStrong((id *)&self->_maxDepth, 0);
  objc_storeStrong((id *)&self->_numTrees, 0);
  objc_storeStrong((id *)&self->_numClasses, 0);
  objc_storeStrong((id *)&self->_minimumTestDataSizeForSwap, 0);
  objc_storeStrong((id *)&self->_engagementRateGainThresholdForSwap, 0);
  objc_storeStrong((id *)&self->_accuracyGainThresholdForSwap, 0);
  objc_storeStrong((id *)&self->_swapOK, 0);
  objc_storeStrong((id *)&self->_testSplitPercent, 0);
  objc_storeStrong((id *)&self->_evaluationIterationCount, 0);
  objc_storeStrong((id *)&self->_epoc, 0);
  objc_storeStrong((id *)&self->_topN, 0);
  objc_storeStrong((id *)&self->_batchSize, 0);
  objc_storeStrong((id *)&self->_intermediateCompiledModelURL, 0);
  objc_storeStrong((id *)&self->_adaptableModelConfiguration, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_selectedFeaturesConfig, 0);
  objc_storeStrong((id *)&self->_featureNameDict, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_modelTagToCandidateModel, 0);
  objc_storeStrong((id *)&self->_modelTagToHyperparameters, 0);
  objc_storeStrong((id *)&self->_adaptableModelDeployPath, 0);

  objc_storeStrong((id *)&self->_recipe, 0);
}

@end