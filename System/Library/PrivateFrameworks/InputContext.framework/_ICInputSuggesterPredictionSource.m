@interface _ICInputSuggesterPredictionSource
- (BOOL)_populateError:(id *)a3 withExplanations:(id)a4;
- (BOOL)doesSupportTriggerSourceType:(unsigned __int8)a3;
- (PSGInputSuggester)inputSuggester;
- (_ICInputSuggesterPredictionSource)init;
- (id)_getPredictedItemFromStructuredInfo:(id)a3;
- (id)_quickTypeQueryWithTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 errorWithExplanations:(id *)a7;
- (id)getPeopleSuggester;
- (id)name;
- (id)requestFromTrigger:(id)a3 searchContext:(id)a4;
- (void)getPeopleSuggester;
- (void)hibernate;
- (void)init;
- (void)logEngagementForPredictedValues:(id)a3 position:(unint64_t)a4;
- (void)logImpressionForPredictedValues:(id)a3;
- (void)predictedItemsWithProactiveTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 handler:(id)a7;
- (void)propogateMetrics:(id)a3 data:(id)a4;
- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)setInputSuggester:(id)a3;
- (void)warmUp;
@end

@implementation _ICInputSuggesterPredictionSource

- (void)hibernate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    v6 = @"_ICPeopleSuggestorPredictionSource";
    _os_log_impl(&dword_235496000, v3, OS_LOG_TYPE_INFO, "%@: hibernating", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(_ICInputSuggesterPredictionSource *)self getPeopleSuggester];
  [v4 hibernate];
}

- (void)warmUp
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = [(_ICInputSuggesterPredictionSource *)self getPeopleSuggester];
  v3 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412546;
    int v5 = @"_ICPeopleSuggestorPredictionSource";
    __int16 v6 = 2112;
    uint64_t v7 = v2;
    _os_log_impl(&dword_235496000, v3, OS_LOG_TYPE_INFO, "%@:  warming up %@", (uint8_t *)&v4, 0x16u);
  }

  [v2 warmUp];
}

- (id)getPeopleSuggester
{
  *(void *)&v26[5] = *MEMORY[0x263EF8340];
  v3 = [(_ICInputSuggesterPredictionSource *)self inputSuggester];

  if (v3)
  {
LABEL_2:
    int v4 = [(_ICInputSuggesterPredictionSource *)self inputSuggester];
    goto LABEL_3;
  }
  if (![MEMORY[0x263F08B88] isMainThread])
  {
    [(NSCondition *)self->_peopleSuggestorLoadedCondition lock];
    v14 = [(_ICInputSuggesterPredictionSource *)self inputSuggester];

    if (v14)
    {
      [(NSCondition *)self->_peopleSuggestorLoadedCondition unlock];
    }
    else
    {
      do
      {
        v15 = _ICProactiveQuickTypeOSLogFacility();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          [(_ICInputSuggesterPredictionSource *)v25 getPeopleSuggester];
        }

        [(NSCondition *)self->_peopleSuggestorLoadedCondition wait];
        v16 = [(_ICInputSuggesterPredictionSource *)self inputSuggester];
      }
      while (!v16);
      [(NSCondition *)self->_peopleSuggestorLoadedCondition unlock];
      v17 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        [(_ICInputSuggesterPredictionSource *)v17 getPeopleSuggester];
      }
    }
    goto LABEL_2;
  }
  __int16 v6 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(_ICInputSuggesterPredictionSource *)v6 getPeopleSuggester];
  }

  int v4 = 0;
LABEL_3:
  return v4;
}

- (PSGInputSuggester)inputSuggester
{
  return (PSGInputSuggester *)objc_getProperty(self, a2, 40, 1);
}

- (_ICInputSuggesterPredictionSource)init
{
  v22.receiver = self;
  v22.super_class = (Class)_ICInputSuggesterPredictionSource;
  v2 = [(_ICInputSuggesterPredictionSource *)&v22 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)@"_ICInputSuggesterPredictionSource";

    int v5 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    peopleSuggestorLoadedCondition = v3->_peopleSuggestorLoadedCondition;
    v3->_peopleSuggestorLoadedCondition = v5;

    uint64_t v7 = [MEMORY[0x263EFF980] array];
    offered = v3->_offered;
    v3->_offered = (NSMutableArray *)v7;

    uint64_t v9 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(_ICInputSuggesterPredictionSource *)v9 init];
    }

    objc_initWeak(&location, v3);
    v17 = dispatch_get_global_queue(17, 0);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __41___ICInputSuggesterPredictionSource_init__block_invoke;
    v19[3] = &unk_264C561D8;
    objc_copyWeak(&v20, &location);
    dispatch_async(v17, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)name
{
  return self->_name;
}

- (BOOL)_populateError:(id *)a3 withExplanations:(id)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *a3;
  if (!*a3)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__2;
    v30 = __Block_byref_object_dispose__2;
    id v31 = (id)objc_opt_new();
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __69___ICInputSuggesterPredictionSource__populateError_withExplanations___block_invoke;
    v25[3] = &unk_264C56330;
    uint8_t v25[4] = &v26;
    [v5 enumerateExplanationCodeWithBlock:v25];
    if ([(id)v27[5] count])
    {
      uint64_t v7 = [(id)v27[5] componentsJoinedByString:@" "];
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v32 = *MEMORY[0x263F08320];
      v33[0] = v7;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      *a3 = [v8 errorWithDomain:@"com.apple.inputcontext.errors" code:5 userInfo:v9];

      uint64_t v10 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_ICInputSuggesterPredictionSource _populateError:withExplanations:]((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      uint64_t v7 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[_ICInputSuggesterPredictionSource _populateError:withExplanations:](v7, v17, v18, v19, v20, v21, v22, v23);
      }
    }

    _Block_object_dispose(&v26, 8);
  }

  return v6 == 0;
}

- (id)_quickTypeQueryWithTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 errorWithExplanations:(id *)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v35 = 0;
  v33 = @"_ICPeopleSuggestorPredictionSource_quickTypeQueryWithQuery";
  uint64_t v12 = mach_absolute_time();
  uint64_t v34 = v12;
  uint64_t v13 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = @"_ICPeopleSuggestorPredictionSource";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_235496000, v13, OS_LOG_TYPE_INFO, "%@: _quickTypeQueryWithQuery: %@", buf, 0x16u);
  }

  uint64_t v14 = [(_ICInputSuggesterPredictionSource *)self getPeopleSuggester];
  if (v14)
  {
    uint64_t v15 = [(_ICInputSuggesterPredictionSource *)self requestFromTrigger:v10 searchContext:v11];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v41 = __Block_byref_object_copy__2;
    v42 = __Block_byref_object_dispose__2;
    id v43 = 0;
    uint64_t v30 = 0;
    v31[0] = &v30;
    v31[1] = 0x3032000000;
    v31[2] = __Block_byref_object_copy__2;
    v31[3] = __Block_byref_object_dispose__2;
    id v32 = 0;
    inputSuggester = self->_inputSuggester;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __128___ICInputSuggesterPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke;
    v29[3] = &unk_264C56358;
    v29[4] = buf;
    v29[5] = &v30;
    [(PSGInputSuggester *)inputSuggester inputSuggestionsWithRequest:v15 completion:v29];
    if (*(void *)(v31[0] + 40))
    {
      uint64_t v17 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[_ICInputSuggesterPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:]((uint64_t)v31, v17);
      }

      *a7 = *(id *)(v31[0] + 40);
      uint64_t v18 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      uint64_t v19 = [*(id *)(*(void *)&buf[8] + 40) explanationSet];
      if (v19)
      {
        uint64_t v20 = [*(id *)(*(void *)&buf[8] + 40) responseItems];
        BOOL v21 = [v20 count] == 0;

        if (v21)
        {
          uint64_t v22 = [*(id *)(*(void *)&buf[8] + 40) explanationSet];
          [(_ICInputSuggesterPredictionSource *)self _populateError:a7 withExplanations:v22];
        }
      }
      uint64_t v23 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = [*(id *)(*(void *)&buf[8] + 40) responseItems];
        uint64_t v25 = [v24 count];
        *(_DWORD *)v36 = 138412546;
        v37 = @"_ICPeopleSuggestorPredictionSource";
        __int16 v38 = 2048;
        uint64_t v39 = v25;
        _os_log_impl(&dword_235496000, v23, OS_LOG_TYPE_INFO, "%@: _quickTypeQueryWithTrigger got %lu items", v36, 0x16u);
      }
      uint64_t v18 = [*(id *)(*(void *)&buf[8] + 40) responseItems];
    }
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v15 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_ICInputSuggesterPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:](v15);
    }
    uint64_t v18 = (void *)MEMORY[0x263EFFA68];
  }

  uint64_t v26 = mach_absolute_time();
  _ICMachTimeToNanoseconds(v26 - v12);
  v27 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[_ICInputSuggesterPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:]();
  }

  return v18;
}

- (void)predictedItemsWithProactiveTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 handler:(id)a7
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v47 = a4;
  v42 = (void (**)(id, void *, id))a7;
  v54[3] = 0;
  v54[1] = @"_ICPeopleSuggestorPredictionSource_predictedItemsWithProactiveTrigger";
  v41 = (void *)mach_absolute_time();
  v54[2] = v41;
  id v11 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_ICInputSuggesterPredictionSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

  v54[0] = 0;
  uint64_t v19 = [(_ICInputSuggesterPredictionSource *)self _quickTypeQueryWithTrigger:v44 searchContext:v47 limit:a5 timeoutInMilliseconds:a6 errorWithExplanations:v54];
  id v43 = v54[0];
  uint64_t v20 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v19;
  uint64_t v21 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
  v48 = (void *)v20;
  if (v21)
  {
    uint64_t v49 = *(void *)v51;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v51 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v50 + 1) + 8 * v22);
        uint64_t v24 = [v23 textualResponseSuggestion];

        if (v24)
        {
          uint64_t v25 = [_ICProactiveTrigger alloc];
          v55 = @"type";
          v56 = @"SmartReply";
          uint64_t v26 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          v27 = [(_ICProactiveTrigger *)v25 initWithSource:0 attributes:v26];

          uint64_t v28 = [MEMORY[0x263EFF910] date];
          v29 = [_ICPredictedItem alloc];
          uint64_t v30 = [v23 textualResponseSuggestion];
          id v31 = [v30 responseText];
          id v32 = [v23 textualResponseSuggestion];
          v33 = [v32 responseCategory];
          uint64_t v34 = [v47 applicationBundleIdentifier];
          LOWORD(v40) = 0;
          uint64_t v35 = -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:](v29, "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", @"SmartReply", 0, v31, v33, 0, v28, 1.0, v34, 0, 30, v40, 0, 0, v27);

          [v48 addObject:v35];
LABEL_10:

          goto LABEL_11;
        }
        v36 = [v23 structuredInfoSuggestion];

        if (v36)
        {
          v27 = [v23 structuredInfoSuggestion];
          uint64_t v28 = [(_ICInputSuggesterPredictionSource *)self _getPredictedItemFromStructuredInfo:v27];
          if (v28) {
            [v48 addObject:v28];
          }
          goto LABEL_10;
        }
LABEL_11:
        ++v22;
      }
      while (v21 != v22);
      uint64_t v37 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
      uint64_t v21 = v37;
    }
    while (v37);
  }

  v42[2](v42, v48, v43);
  uint64_t v38 = mach_absolute_time();
  _ICMachTimeToNanoseconds(v38 - (void)v41);
  uint64_t v39 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
    -[_ICInputSuggesterPredictionSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:]();
  }
}

- (id)_getPredictedItemFromStructuredInfo:(id)a3
{
  id v3 = a3;
  int v4 = [v3 proactiveTrigger];
  id v5 = [_ICProactiveTrigger alloc];
  id v6 = [v4 triggerAttributes];
  uint64_t v7 = [(_ICProactiveTrigger *)v5 initWithSource:0 attributes:v6];

  uint64_t v8 = [v3 portraitItem];

  if (v8)
  {
    uint64_t v9 = [v3 portraitItem];

    id v10 = +[_ICPredictedItem predictedItemFromQuickTypeItem:v9 trigger:v7];
  }
  else
  {
    uint64_t v9 = [v3 operationalItem];

    id v11 = [MEMORY[0x263EFF910] date];
    uint64_t v12 = [_ICPredictedItem alloc];
    uint64_t v13 = [v9 itemIdentifier];
    uint64_t v14 = [v9 value];
    uint64_t v15 = [v9 bundleIdentifier];
    uint64_t v16 = [v9 operationData];
    LOWORD(v19) = 0;
    id v10 = -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:](v12, "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", v13, 1, v14, 0, 0, v11, 1.0, v15, 0, 30, v19, 0, v16, v7);

    uint64_t v17 = [(_ICPredictedItem *)v10 identifier];
    LODWORD(v14) = [v17 isEqualToString:@"surf"];

    if (v14) {
      [(_ICPredictedItem *)v10 setLayoutHint:1];
    }
  }
  return v10;
}

- (id)requestFromTrigger:(id)a3 searchContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__2;
  id v31 = __Block_byref_object_dispose__2;
  id v32 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [v5 inputContextHistory];

  if (v7)
  {
    uint64_t v8 = [v5 inputContextHistory];
    if ([v8 mostRecentTextEntryIsByMe])
    {
      uint64_t v23 = 0;
    }
    else
    {
      uint64_t v23 = [v8 mostRecentNonSenderTextEntry];
    }
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __70___ICInputSuggesterPredictionSource_requestFromTrigger_searchContext___block_invoke;
    v26[3] = &unk_264C56380;
    v26[4] = &v27;
    [v8 enumerateAllEntries:v26];
  }
  else
  {
    uint64_t v23 = 0;
  }
  id v9 = objc_alloc(MEMORY[0x263F618D8]);
  uint64_t v21 = v28[5];
  unsigned int v20 = [v6 shouldDisableAutoCaps];
  unsigned int v19 = [v6 isResponseContextDenylisted];
  uint64_t v25 = [v5 context];
  uint64_t v24 = [v25 length];
  if (v24)
  {
    uint64_t v22 = [v5 context];
  }
  else
  {
    uint64_t v22 = 0;
  }
  id v10 = [v6 locale];
  id v11 = [v6 applicationBundleIdentifier];
  uint64_t v12 = [v6 recipients];
  uint64_t v13 = [v5 inputContextHistory];
  uint64_t v14 = [v13 recipientNames];
  uint64_t v15 = [v5 contentType];
  uint64_t v16 = [v5 availableApps];
  uint64_t v17 = objc_msgSend(v9, "initWithResponseContext:conversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:", v23, v21, 0, v20, v19, v22, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v10, v11, v12,
                  v14,
                  v15,
                  v16,
                  3,
                  2,
                  3);

  if (v24) {
  _Block_object_dispose(&v27, 8);
  }

  return v17;
}

- (void)logImpressionForPredictedValues:(id)a3
{
  id v3 = (void *)MEMORY[0x263F618C8];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 logMetricForEventType:0 externalMetadata:0 predictedValues:v4];
}

- (void)logEngagementForPredictedValues:(id)a3 position:(unint64_t)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F618C8];
  id v6 = a3;
  uint64_t v7 = [v5 sharedInstance];
  uint64_t v10 = *MEMORY[0x263F61940];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a4];
  v11[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v7 logMetricForEventType:1 externalMetadata:v9 predictedValues:v6];
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  int v5 = a4;
  v20[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = v7;
  if (v5 == 3)
  {
    uint64_t v14 = [v7 length];
    offered = self->_offered;
    if (v14)
    {
      [(NSMutableArray *)offered addObject:v8];
    }
    else
    {
      if ([(NSMutableArray *)offered count])
      {
        [(PSGInputSuggester *)self->_inputSuggester logMetricForEventType:0 externalMetadata:0 predictedValues:self->_offered];
        uint64_t v16 = _ICProactiveQuickTypeOSLogFacility();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[_ICInputSuggesterPredictionSource provideFeedbackForString:type:style:]((id *)&self->_offered);
        }
      }
      uint64_t v17 = (NSArray *)[(NSMutableArray *)self->_offered copy];
      prevOffered = self->_prevOffered;
      self->_prevOffered = v17;

      [(NSMutableArray *)self->_offered removeAllObjects];
    }
  }
  else if (v5 == 1)
  {
    id v9 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_ICInputSuggesterPredictionSource provideFeedbackForString:type:style:](v8);
    }

    NSUInteger v10 = [(NSArray *)self->_prevOffered indexOfObject:v8];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      inputSuggester = self->_inputSuggester;
      uint64_t v19 = *MEMORY[0x263F61940];
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:v10 + 1];
      v20[0] = v12;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [(PSGInputSuggester *)inputSuggester logMetricForEventType:1 externalMetadata:v13 predictedValues:self->_prevOffered];
    }
  }
}

- (void)propogateMetrics:(id)a3 data:(id)a4
{
  id v10 = a4;
  id v6 = NSString;
  id v7 = a3;
  uint64_t v8 = [v6 stringWithUTF8String:"SpeedMetric"];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    [(PSGInputSuggester *)self->_inputSuggester logMetricForEventType:2 externalMetadata:v10 predictedValues:0];
  }
}

- (BOOL)doesSupportTriggerSourceType:(unsigned __int8)a3
{
  return a3 == 3;
}

- (void)setInputSuggester:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSuggester, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_prevOffered, 0);
  objc_storeStrong((id *)&self->_offered, 0);
  objc_storeStrong((id *)&self->_peopleSuggestorLoadedCondition, 0);
}

- (void)init
{
}

- (void)getPeopleSuggester
{
  *(_DWORD *)buf = 138412290;
  *a2 = @"_ICPeopleSuggestorPredictionSource";
  _os_log_debug_impl(&dword_235496000, log, OS_LOG_TYPE_DEBUG, "%@: Request for uninitialized People Suggester on a background thread, waiting", buf, 0xCu);
}

- (void)_populateError:(uint64_t)a3 withExplanations:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_populateError:(uint64_t)a3 withExplanations:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235496000, v0, v1, "_ICScales: %@ took %f seconds", v2, v3, v4, v5, 2u);
}

- (void)_quickTypeQueryWithTrigger:(os_log_t)log searchContext:limit:timeoutInMilliseconds:errorWithExplanations:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = @"_ICPeopleSuggestorPredictionSource";
  _os_log_error_impl(&dword_235496000, log, OS_LOG_TYPE_ERROR, "%@: failed to get People Suggestor!", (uint8_t *)&v1, 0xCu);
}

- (void)_quickTypeQueryWithTrigger:(uint64_t)a1 searchContext:(NSObject *)a2 limit:timeoutInMilliseconds:errorWithExplanations:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412546;
  uint64_t v4 = @"_ICPeopleSuggestorPredictionSource";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_235496000, a2, OS_LOG_TYPE_ERROR, "%@: inputSuggestionsForRequest error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235496000, v0, v1, "_ICScales: %@ took %f seconds", v2, v3, v4, v5, 2u);
}

- (void)predictedItemsWithProactiveTrigger:(uint64_t)a3 searchContext:(uint64_t)a4 limit:(uint64_t)a5 timeoutInMilliseconds:(uint64_t)a6 handler:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)provideFeedbackForString:(void *)a1 type:style:.cold.1(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_3_0(&dword_235496000, v1, v2, "Feedback Accepted by _ICInputSuggesterPredictionSource with string length = %lu", v3, v4, v5, v6, 0);
}

- (void)provideFeedbackForString:(id *)a1 type:style:.cold.2(id *a1)
{
  [*a1 count];
  OUTLINED_FUNCTION_3_0(&dword_235496000, v1, v2, "Feedback Offered by _ICInputSuggesterPredictionSource with strings count = %lu", v3, v4, v5, v6, 0);
}

@end