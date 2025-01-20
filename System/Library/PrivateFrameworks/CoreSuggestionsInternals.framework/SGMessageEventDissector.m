@interface SGMessageEventDissector
+ (BOOL)allowMessageEventDissector;
+ (BOOL)featureEnabled;
+ (BOOL)mobileAssetsEnabled;
+ (id)dateFromString:(id)a3;
+ (id)describeCategory:(unsigned __int8)a3;
+ (id)enrichmentsFromSchema:(id)a3 forMessage:(id)a4 forEntity:(id)a5 category:(id)a6;
+ (id)fallbackSchemaForGenericEventWithTitle:(id)a3 startDate:(id)a4 endDate:(id)a5;
+ (id)getFlightInformationForFlightEventData:(id)a3;
+ (id)loadEventClassifierModelFromPath:(id)a3;
+ (id)loadLazyPlistWithBasename:(id)a3;
+ (id)nilEntities:(id)a3;
+ (id)schemaOrgAndMissingEntitiesForExtractedEvent:(id)a3;
+ (id)sharedInstance;
+ (id)tupleWithEntity:(id)a3 label:(id)a4;
+ (unsigned)messageEventCategoryForCategoryString:(id)a3;
+ (void)logMLMessageEventExtractionInteractions:(id)a3 context:(id)a4;
- (BOOL)isDissectorProcessingWithinRateLimit;
- (BOOL)isMessageOfTypeEvent:(id)a3;
- (BOOL)shouldProcessTextMessage:(id)a3 entity:(id)a4;
- (id)_init;
- (id)eventClassifierMobileAssetsPath;
- (id)eventExtractionMobileAssetsPath;
- (id)eventsFromMessage:(id)a3 eventExtractionAssetsPath:(id)a4;
- (id)loadEventClassifierModel;
- (id)schemaOrgAndMissingEntitiesForMessage:(id)a3 withMLModelParameters:(id)a4;
- (void)addEnrichmentForEvents:(id)a3 toEntity:(id)a4 message:(id)a5 context:(id)a6 timingProcessingInMs:(unint64_t)a7;
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)logFailedEventExtractionForMessage:(id)a3 category:(id)a4 missingEntities:(id)a5 timingProcessingInMs:(unint64_t)a6;
- (void)logFailedEventExtractionForMessage:(id)a3 failureCode:(int64_t)a4;
- (void)logMLMessageEventExtractionForSchema:(id)a3 message:(id)a4 category:(id)a5 timingProcessingInMs:(unint64_t)a6;
@end

@implementation SGMessageEventDissector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dissectorConfig, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)schemaOrgAndMissingEntitiesForMessage:(id)a3 withMLModelParameters:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() featureEnabled])
  {
    v8 = (void *)MEMORY[0x1CB79B230]();
    v9 = objc_opt_new();
    v10 = (void *)MEMORY[0x1CB79B230]();
    v11 = objc_opt_class();
    v12 = [v7 objectForKeyedSubscript:@"eventClassifierPath"];
    v13 = [v11 loadEventClassifierModelFromPath:v12];

    if (v13)
    {
      v14 = [v6 textContent];
      v15 = [v13 predictedLabelHypothesesForString:v14 maximumCount:1];

      v16 = sgEventsLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [v15 allKeys];
        v17 = [v27 objectAtIndexedSubscript:0];
        v26 = [v15 allKeys];
        [v26 objectAtIndexedSubscript:0];
        v18 = v28 = v8;
        v19 = [v15 objectForKeyedSubscript:v18];
        [v19 doubleValue];
        *(_DWORD *)buf = 138412546;
        v31 = v17;
        __int16 v32 = 2048;
        uint64_t v33 = v20;
        _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Message classification by Event-Classifier: %@ (Score: %.02f)", buf, 0x16u);

        v8 = v28;
      }

      if (v15)
      {
        [v9 addObject:v15];
      }
    }
    v21 = [v7 objectForKeyedSubscript:@"assetFolderPath"];
    v22 = [(SGMessageEventDissector *)self eventsFromMessage:v6 eventExtractionAssetsPath:v21];

    if (v22 && [v22 count])
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __87__SGMessageEventDissector_schemaOrgAndMissingEntitiesForMessage_withMLModelParameters___block_invoke;
      v29[3] = &unk_1E65B95C0;
      v29[4] = self;
      v23 = objc_msgSend(v22, "_pas_mappedArrayWithTransform:", v29);
      [v9 addObjectsFromArray:v23];
    }
    v24 = (void *)[v9 copy];
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

id __87__SGMessageEventDissector_schemaOrgAndMissingEntitiesForMessage_withMLModelParameters___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() schemaOrgAndMissingEntitiesForExtractedEvent:v2];

  return v3;
}

- (void)logFailedEventExtractionForMessage:(id)a3 failureCode:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  v9 = [v8 localeIdentifier];
  [v7 setObject:v9 forKeyedSubscript:@"deviceLocale"];

  v10 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v10 forKeyedSubscript:@"failureReasonCode"];

  int v11 = [(id)objc_opt_class() mobileAssetsEnabled];
  v12 = NSNumber;
  if (v11)
  {
    v13 = [(NSDictionary *)self->_dissectorConfig objectForKeyedSubscript:@"EventExtractionMessageProcessingLimit"];
    int v14 = [v13 intValue];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__21514;
    v31 = __Block_byref_object_dispose__21515;
    id v32 = 0;
    lock = self->_lock;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __74__SGMessageEventDissector_logFailedEventExtractionForMessage_failureCode___block_invoke;
    v26[3] = &unk_1E65B9598;
    v26[4] = &v27;
    [(_PASLock *)lock runWithLockAcquired:v26];
    id v16 = (id)v28[5];
    _Block_object_dispose(&v27, 8);

    int v17 = [v16 intValue];
    v18 = [v12 numberWithInt:(v14 - v17)];
    [v7 setObject:v18 forKeyedSubscript:@"messageProcessingRate"];
  }
  else
  {
    v13 = +[SGMessageEventDissectorTrialClientWrapper sharedInstance];
    v18 = [v13 messageProcessingLimit];
    int v19 = [v18 intValue];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__21514;
    v31 = __Block_byref_object_dispose__21515;
    id v32 = 0;
    uint64_t v20 = self->_lock;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__SGMessageEventDissector_logFailedEventExtractionForMessage_failureCode___block_invoke_2;
    v25[3] = &unk_1E65B9598;
    v25[4] = &v27;
    [(_PASLock *)v20 runWithLockAcquired:v25];
    id v21 = (id)v28[5];
    _Block_object_dispose(&v27, 8);

    int v22 = [v21 intValue];
    v23 = [v12 numberWithInt:(v19 - v22)];
    [v7 setObject:v23 forKeyedSubscript:@"messageProcessingRate"];
  }
  v24 = +[SGRTCLogging defaultLogger];
  [v24 logMLMessageEventExtractionForTemplateName:@"ML_EventMessage" extractionStatus:1 outputInfo:v7 outputExceptions:MEMORY[0x1E4F1CBF0] timingProcessing:0];
}

void __74__SGMessageEventDissector_logFailedEventExtractionForMessage_failureCode___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __74__SGMessageEventDissector_logFailedEventExtractionForMessage_failureCode___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (void)logFailedEventExtractionForMessage:(id)a3 category:(id)a4 missingEntities:(id)a5 timingProcessingInMs:(unint64_t)a6
{
  id v29 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_opt_new();
  v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v14 = [v13 localeIdentifier];
  [v12 setObject:v14 forKeyedSubscript:@"deviceLocale"];

  [v12 setObject:v10 forKeyedSubscript:@"outputCategory"];
  int v15 = [(id)objc_opt_class() mobileAssetsEnabled];
  id v16 = NSNumber;
  if (v15)
  {
    int v17 = [(NSDictionary *)self->_dissectorConfig objectForKeyedSubscript:@"EventExtractionMessageProcessingLimit"];
    int v18 = [v17 intValue];
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__21514;
    v36 = __Block_byref_object_dispose__21515;
    id v37 = 0;
    lock = self->_lock;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __108__SGMessageEventDissector_logFailedEventExtractionForMessage_category_missingEntities_timingProcessingInMs___block_invoke;
    v31[3] = &unk_1E65B9598;
    v31[4] = &v32;
    [(_PASLock *)lock runWithLockAcquired:v31];
    id v20 = (id)v33[5];
    _Block_object_dispose(&v32, 8);

    int v21 = [v20 intValue];
    int v22 = [v16 numberWithInt:(v18 - v21)];
    [v12 setObject:v22 forKeyedSubscript:@"messageProcessingRate"];
  }
  else
  {
    int v17 = +[SGMessageEventDissectorTrialClientWrapper sharedInstance];
    int v22 = [v17 messageProcessingLimit];
    int v23 = [v22 intValue];
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__21514;
    v36 = __Block_byref_object_dispose__21515;
    id v37 = 0;
    v24 = self->_lock;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __108__SGMessageEventDissector_logFailedEventExtractionForMessage_category_missingEntities_timingProcessingInMs___block_invoke_2;
    v30[3] = &unk_1E65B9598;
    v30[4] = &v32;
    [(_PASLock *)v24 runWithLockAcquired:v30];
    id v25 = (id)v33[5];
    _Block_object_dispose(&v32, 8);

    int v26 = [v25 intValue];
    uint64_t v27 = [v16 numberWithInt:(v23 - v26)];
    [v12 setObject:v27 forKeyedSubscript:@"messageProcessingRate"];
  }
  v28 = +[SGRTCLogging defaultLogger];
  [v28 logMLMessageEventExtractionForTemplateName:@"ML_EventMessage" extractionStatus:1 outputInfo:v12 outputExceptions:v11 timingProcessing:a6];
}

void __108__SGMessageEventDissector_logFailedEventExtractionForMessage_category_missingEntities_timingProcessingInMs___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __108__SGMessageEventDissector_logFailedEventExtractionForMessage_category_missingEntities_timingProcessingInMs___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (void)logMLMessageEventExtractionForSchema:(id)a3 message:(id)a4 category:(id)a5 timingProcessingInMs:(unint64_t)a6
{
  id v29 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_opt_new();
  v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v14 = [v13 localeIdentifier];
  [v12 setObject:v14 forKeyedSubscript:@"deviceLocale"];

  [v12 setObject:v11 forKeyedSubscript:@"outputCategory"];
  int v15 = [(id)objc_opt_class() mobileAssetsEnabled];
  id v16 = NSNumber;
  if (v15)
  {
    int v17 = [(NSDictionary *)self->_dissectorConfig objectForKeyedSubscript:@"EventExtractionMessageProcessingLimit"];
    int v18 = [v17 intValue];
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__21514;
    v36 = __Block_byref_object_dispose__21515;
    id v37 = 0;
    lock = self->_lock;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __102__SGMessageEventDissector_logMLMessageEventExtractionForSchema_message_category_timingProcessingInMs___block_invoke;
    v31[3] = &unk_1E65B9598;
    v31[4] = &v32;
    [(_PASLock *)lock runWithLockAcquired:v31];
    id v20 = (id)v33[5];
    _Block_object_dispose(&v32, 8);

    int v21 = [v20 intValue];
    int v22 = [v16 numberWithInt:(v18 - v21)];
    [v12 setObject:v22 forKeyedSubscript:@"messageProcessingRate"];
  }
  else
  {
    int v17 = +[SGMessageEventDissectorTrialClientWrapper sharedInstance];
    int v22 = [v17 messageProcessingLimit];
    int v23 = [v22 intValue];
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__21514;
    v36 = __Block_byref_object_dispose__21515;
    id v37 = 0;
    v24 = self->_lock;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __102__SGMessageEventDissector_logMLMessageEventExtractionForSchema_message_category_timingProcessingInMs___block_invoke_2;
    v30[3] = &unk_1E65B9598;
    v30[4] = &v32;
    [(_PASLock *)v24 runWithLockAcquired:v30];
    id v25 = (id)v33[5];
    _Block_object_dispose(&v32, 8);

    int v26 = [v25 intValue];
    uint64_t v27 = [v16 numberWithInt:(v23 - v26)];
    [v12 setObject:v27 forKeyedSubscript:@"messageProcessingRate"];
  }
  v28 = +[SGRTCLogging defaultLogger];
  [v28 logMLMessageEventExtractionForTemplateName:@"ML_EventMessage" extractionStatus:0 outputInfo:v12 outputExceptions:MEMORY[0x1E4F1CBF0] timingProcessing:a6];
}

void __102__SGMessageEventDissector_logMLMessageEventExtractionForSchema_message_category_timingProcessingInMs___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __102__SGMessageEventDissector_logMLMessageEventExtractionForSchema_message_category_timingProcessingInMs___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (BOOL)isMessageOfTypeEvent:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__21514;
  int v21 = __Block_byref_object_dispose__21515;
  id v22 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__SGMessageEventDissector_isMessageOfTypeEvent___block_invoke;
  v14[3] = &unk_1E65B9570;
  v14[4] = self;
  id v16 = &v17;
  id v6 = v4;
  id v15 = v6;
  [(_PASLock *)lock runWithLockAcquired:v14];
  if ([(id)objc_opt_class() mobileAssetsEnabled])
  {
    id v7 = [(NSDictionary *)self->_dissectorConfig objectForKeyedSubscript:@"EventClassifierThreshold"];
  }
  else
  {
    v8 = +[SGMessageEventDissectorTrialClientWrapper sharedInstance];
    id v7 = [v8 eventClassifierThreshold];
  }
  v9 = (void *)v18[5];
  if (v9)
  {
    id v10 = [v9 objectForKeyedSubscript:@"Event"];
    if (v10)
    {
      id v11 = [(id)v18[5] objectForKeyedSubscript:@"Event"];
      BOOL v12 = [v11 compare:v7] == 1;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __48__SGMessageEventDissector_isMessageOfTypeEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = [v3[3] result];
  if (v4
    || ([*(id *)(a1 + 32) loadEventClassifierModel],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = v3[3],
        v3[3] = (id)v5,
        v6,
        [v3[3] result],
        (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = [v4 predictedLabelHypothesesForString:*(void *)(a1 + 40) maximumCount:1];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v10 = sgEventsLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) allKeys];
      BOOL v12 = [v11 objectAtIndexedSubscript:0];
      v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v14 = [v13 allKeys];
      id v15 = [v14 objectAtIndexedSubscript:0];
      id v16 = [v13 objectForKeyedSubscript:v15];
      [v16 doubleValue];
      int v18 = 138412546;
      uint64_t v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = v17;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Message classification by Event-Classifier: %@ (Score: %.02f)", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (id)loadEventClassifierModel
{
  id v3 = objc_alloc(MEMORY[0x1E4F93B60]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SGMessageEventDissector_loadEventClassifierModel__block_invoke;
  v6[3] = &unk_1E65BC1A0;
  v6[4] = self;
  id v4 = (void *)[v3 initWithBlock:v6 idleTimeout:300.0];
  return v4;
}

NSObject *__51__SGMessageEventDissector_loadEventClassifierModel__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() mobileAssetsEnabled])
  {
    id v2 = [*(id *)(a1 + 32) eventClassifierMobileAssetsPath];
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    v9 = +[SGMessageEventDissectorTrialClientWrapper sharedInstance];
    id v2 = [v9 eventClassifierModelPath];

    if (v2)
    {
LABEL_3:
      id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v2];
      id v4 = objc_opt_new();
      [v4 setComputeUnits:0];
      id v14 = 0;
      uint64_t v5 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v3 configuration:v4 error:&v14];
      id v6 = v14;
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = sgEventsLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v16 = v7;
          _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to load Event Classifier Model: %@", buf, 0xCu);
        }
      }
      else
      {
        id v13 = 0;
        uint64_t v8 = [objc_alloc(MEMORY[0x1E4F388E8]) initWithMLModel:v5 error:&v13];
        uint64_t v7 = v13;
        if (!v7)
        {
          uint64_t v8 = v8;
          id v10 = v8;
          goto LABEL_15;
        }
        id v11 = sgEventsLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v16 = v7;
          _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to convert ML Model to NL Model: %@", buf, 0xCu);
        }
      }
      id v10 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  uint64_t v7 = sgEventsLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to load Event Classifier Model. Model Path does not exist", buf, 2u);
  }
  id v10 = 0;
LABEL_16:

  return v10;
}

- (id)eventsFromMessage:(id)a3 eventExtractionAssetsPath:(id)a4
{
  v75[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sgEventsLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Fetching events from ML Runtime Plugin com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin eventExtractionAssetsPath: %{private}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v9 = [v6 textContent];
  id v10 = (void *)v9;
  if (v9)
  {
    v74[0] = @"TaskName";
    v74[1] = @"InputMessage";
    v75[0] = @"EventSuggestionsFromMessage";
    v75[1] = v9;
    v74[2] = @"AssetFolderPath";
    v75[2] = v7;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:3];
    BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F737C0]) initWithParametersDict:v11];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__21514;
    v72 = __Block_byref_object_dispose__21515;
    id v73 = 0;
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2020000000;
    char v68 = 0;
    if (serialQueue__pasOnceToken4 != -1) {
      dispatch_once(&serialQueue__pasOnceToken4, &__block_literal_global_461);
    }
    id v13 = serialQueue__pasExprOnceResult;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__SGMessageEventDissector_eventsFromMessage_eventExtractionAssetsPath___block_invoke;
    block[3] = &unk_1E65C06D8;
    id v14 = v12;
    id v61 = v14;
    v62 = @"com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin";
    p_long long buf = &buf;
    v64 = &v65;
    dispatch_async_and_wait(v13, block);
    id v15 = *(void **)(*((void *)&buf + 1) + 40);
    if (!v15)
    {
      if (*((unsigned char *)v66 + 24)) {
        uint64_t v50 = 102;
      }
      else {
        uint64_t v50 = 103;
      }
      [(SGMessageEventDissector *)self logFailedEventExtractionForMessage:v6 failureCode:v50];
      uint64_t v19 = 0;
      goto LABEL_33;
    }
    id v16 = [v15 objectForKeyedSubscript:@"events"];
    if (!v16
      || ([*(id *)(*((void *)&buf + 1) + 40) objectForKeyedSubscript:@"events"],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          BOOL v18 = [v17 count] == 0,
          v17,
          v16,
          v18))
    {
      v49 = sgEventsLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v59 = 0;
        _os_log_error_impl(&dword_1CA650000, v49, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: ML Runtime failed to return events information, bailing", v59, 2u);
      }

      int v23 = [*(id *)(*((void *)&buf + 1) + 40) objectForKeyedSubscript:@"errorCode"];
      -[SGMessageEventDissector logFailedEventExtractionForMessage:failureCode:](self, "logFailedEventExtractionForMessage:failureCode:", v6, (int)[v23 intValue]);
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v19 = [*(id *)(*((void *)&buf + 1) + 40) objectForKeyedSubscript:@"events"];
      __int16 v20 = [v19 objectAtIndexedSubscript:0];
      uint64_t v21 = [v20 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__CATEGORY"];
      int v22 = [v21 isEqualToString:@"Flight"];

      if (!v22)
      {
LABEL_33:

        _Block_object_dispose(&v65, 8);
        _Block_object_dispose(&buf, 8);

        goto LABEL_34;
      }
      int v23 = objc_opt_new();
      v58 = [v23 getFlightReferencesAndReservationId:v6];
      v24 = [v58 objectForKeyedSubscript:@"flightReferences"];
      if (v24)
      {
        id v25 = [v58 objectForKeyedSubscript:@"flightReferences"];
        BOOL v26 = [v25 count] == 0;

        if (!v26)
        {
          v54 = [v58 objectForKeyedSubscript:@"flightReferences"];
          v52 = [v54 objectAtIndexedSubscript:0];
          uint64_t v27 = [v52 objectForKeyedSubscript:@"airline"];
          v28 = [v27 objectForKeyedSubscript:@"IATA"];
          id v29 = [v19 objectAtIndexedSubscript:0];
          [v29 setObject:v28 forKeyedSubscript:@"carrierCode"];

          v55 = [v58 objectForKeyedSubscript:@"flightReferences"];
          v30 = [v55 objectAtIndexedSubscript:0];
          v31 = [v30 objectForKeyedSubscript:@"flightNumber"];
          uint64_t v32 = [v19 objectAtIndexedSubscript:0];
          [v32 setObject:v31 forKeyedSubscript:@"flightNumber"];

          uint64_t v33 = [v58 objectForKeyedSubscript:@"reservationId"];
          uint64_t v34 = [v19 objectAtIndexedSubscript:0];
          v35 = v34;
          v36 = v33 ? v33 : &stru_1F24EEF20;
          [v34 setObject:v36 forKeyedSubscript:@"reservationId"];

          if ([v19 count] == 2)
          {
            id v37 = [v58 objectForKeyedSubscript:@"flightReferences"];
            BOOL v38 = [v37 count] == 2;

            if (v38)
            {
              v56 = [v58 objectForKeyedSubscript:@"flightReferences"];
              v53 = [v56 objectAtIndexedSubscript:1];
              v39 = [v53 objectForKeyedSubscript:@"airline"];
              v40 = [v39 objectForKeyedSubscript:@"IATA"];
              v41 = [v19 objectAtIndexedSubscript:1];
              [v41 setObject:v40 forKeyedSubscript:@"carrierCode"];

              v57 = [v58 objectForKeyedSubscript:@"flightReferences"];
              v42 = [v57 objectAtIndexedSubscript:1];
              v43 = [v42 objectForKeyedSubscript:@"flightNumber"];
              v44 = [v19 objectAtIndexedSubscript:1];
              [v44 setObject:v43 forKeyedSubscript:@"flightNumber"];

              v45 = [v58 objectForKeyedSubscript:@"reservationId"];
              v46 = [v19 objectAtIndexedSubscript:1];
              v47 = v46;
              if (v45) {
                v48 = v45;
              }
              else {
                v48 = &stru_1F24EEF20;
              }
              [v46 setObject:v48 forKeyedSubscript:@"reservationId"];
            }
          }
        }
      }
    }
    goto LABEL_33;
  }
  id v11 = sgEventsLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Nil MessageBody Found. Bailing.", (uint8_t *)&buf, 2u);
  }
  uint64_t v19 = 0;
LABEL_34:

  return v19;
}

void __71__SGMessageEventDissector_eventsFromMessage_eventExtractionAssetsPath___block_invoke(void *a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = (void *)MEMORY[0x1E4F737B8];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__SGMessageEventDissector_eventsFromMessage_eventExtractionAssetsPath___block_invoke_2;
  v9[3] = &unk_1E65B9548;
  uint64_t v11 = a1[6];
  id v6 = v2;
  id v10 = v6;
  [v3 performTask:v4 forPluginID:v5 completionHandler:v9];
  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v6 timeoutSeconds:8.0] == 1)
  {
    id v7 = sgEventsLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 0;
      _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: MLRuntime Plugin task timeout", (uint8_t *)v8, 2u);
    }

    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

void __71__SGMessageEventDissector_eventsFromMessage_eventExtractionAssetsPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 JSONResult];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = sgEventsLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: MLRuntime Plugin Task failed with error:  %@", (uint8_t *)&v10, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addEnrichmentForEvents:(id)a3 toEntity:(id)a4 message:(id)a5 context:(id)a6 timingProcessingInMs:(unint64_t)a7
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v47 = a5;
  id v42 = a6;
  context = (void *)MEMORY[0x1CB79B230]();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
  uint64_t v48 = v13;
  if (v13)
  {
    uint64_t v45 = *(void *)v59;
    v40 = self;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v59 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = v14;
        id v15 = *(void **)(*((void *)&v58 + 1) + 8 * v14);
        uint64_t v16 = MEMORY[0x1CB79B230](v13);
        uint64_t v17 = objc_msgSend((id)objc_opt_class(), "schemaOrgAndMissingEntitiesForExtractedEvent:", v15, context);
        BOOL v18 = (void *)v16;
        uint64_t v19 = (void *)v17;
        __int16 v20 = [v19 objectForKeyedSubscript:@"schema"];
        uint64_t v21 = [v19 objectForKeyedSubscript:@"category"];
        uint64_t v22 = MEMORY[0x1CB79B230]();
        int v23 = (void *)v22;
        if (v20)
        {
          v24 = (void *)MEMORY[0x1CB79B230]([(SGMessageEventDissector *)self logMLMessageEventExtractionForSchema:v20 message:v47 category:v21 timingProcessingInMs:a7]);
          id v25 = [(id)objc_opt_class() enrichmentsFromSchema:v20 forMessage:v47 forEntity:v12 category:v21];
          log = v25;
          if (v25)
          {
            v49 = v23;
            v51 = v20;
            v43 = v21;
            v44 = v19;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            BOOL v26 = v25;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v54 objects:v66 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v55;
              do
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v55 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  v31 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                  uint64_t v32 = (void *)MEMORY[0x1CB79B230]();
                  uint64_t v33 = [MEMORY[0x1E4F5D9F0] extractedFromTemplateWithName:@"ML_EventMessage"];
                  [v31 addTag:v33];

                  uint64_t v34 = [MEMORY[0x1E4F5D9F0] extractedFromTemplateWithShortName:@"ML_EventMessage"];
                  [v31 addTag:v34];

                  v35 = sgEventsLogHandle();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 138412546;
                    v63 = v31;
                    __int16 v64 = 2112;
                    id v65 = v12;
                    _os_log_impl(&dword_1CA650000, v35, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Adding Enrichment: %@ to entity:%@", buf, 0x16u);
                  }

                  [v12 addEnrichment:v31];
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v54 objects:v66 count:16];
              }
              while (v28);
            }

            self = v40;
            uint64_t v21 = v43;
            uint64_t v19 = v44;
            int v23 = v49;
            __int16 v20 = v51;
          }
          [(id)objc_opt_class() logMLMessageEventExtractionInteractions:v12 context:v42];
          uint64_t v36 = v52;
        }
        else
        {
          uint64_t v50 = (void *)v22;
          id v37 = v19;
          BOOL v38 = [v19 objectForKeyedSubscript:@"missingEntities"];
          [(SGMessageEventDissector *)self logFailedEventExtractionForMessage:v47 category:v21 missingEntities:v38 timingProcessingInMs:a7];

          log = sgEventsLogHandle();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            v63 = v15;
            __int16 v64 = 2112;
            id v65 = v12;
            _os_log_error_impl(&dword_1CA650000, log, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Could not extract event deatils from event dictionary: %@ for entity: %@", buf, 0x16u);
          }
          uint64_t v19 = v37;
          __int16 v20 = 0;
          uint64_t v36 = v52;
          int v23 = v50;
        }

        uint64_t v14 = v36 + 1;
      }
      while (v14 != v48);
      uint64_t v13 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
      uint64_t v48 = v13;
    }
    while (v13);
  }
}

- (id)eventExtractionMobileAssetsPath
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = +[SGAsset regionAsset];
  id v3 = [v2 filesystemPathForAssetDataRelativePath:@"MLEventExtractionModel.assets"];

  if (_os_feature_enabled_impl())
  {
    uint64_t v4 = +[SGAsset localeAsset];
    uint64_t v5 = [v4 filesystemPathForAssetDataRelativePath:@"MLEventExtractionModel.assets"];

    id v3 = (void *)v5;
  }
  uint64_t v6 = sgEventsLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138477827;
      id v11 = v3;
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: MLEventExtractionAssets Path: %{private}@", (uint8_t *)&v10, 0xCu);
    }

    id v8 = v3;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to find MA path for MLEventExtractionAssets", (uint8_t *)&v10, 2u);
    }
  }
  return v3;
}

- (id)eventClassifierMobileAssetsPath
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = +[SGAsset regionAsset];
  id v3 = (void *)[[NSString alloc] initWithFormat:@"%@.%@", @"EventClassifier", @"mlmodelc"];
  uint64_t v4 = [v2 filesystemPathForAssetDataRelativePath:v3];

  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = +[SGAsset localeAsset];
    uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"%@.%@", @"EventClassifier", @"mlmodelc"];
    uint64_t v7 = [v5 filesystemPathForAssetDataRelativePath:v6];

    uint64_t v4 = (void *)v7;
  }
  id v8 = sgEventsLogHandle();
  uint64_t v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138477827;
      uint64_t v13 = v4;
      _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: EventClassifier Model Path: %{private}@", buf, 0xCu);
    }

    id v10 = v4;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to find MA path for EventClassifier model", buf, 2u);
    }
  }
  return v4;
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(id)objc_opt_class() featureEnabled])
  {
    uint64_t v11 = mach_absolute_time();
    uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
    if ([(SGMessageEventDissector *)self shouldProcessTextMessage:v8 entity:v9])
    {
      char v13 = [v9 hasEventEnrichment];
      if ((v13 & 1) == 0)
      {
        uint64_t v14 = sgEventsLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Message is potential event message, dissecting to extract events", buf, 2u);
        }

        if ([(id)objc_opt_class() mobileAssetsEnabled])
        {
          id v15 = [(SGMessageEventDissector *)self eventExtractionMobileAssetsPath];
          if (v15)
          {
LABEL_8:
            uint64_t v16 = [(SGMessageEventDissector *)self eventsFromMessage:v8 eventExtractionAssetsPath:v15];
            uint64_t v17 = v16;
            if (v16 && [v16 count])
            {
              uint64_t v18 = mach_absolute_time() - v11;
              if (SGMachTimeToNanoseconds_onceToken != -1) {
                dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_16442);
              }
              unint64_t v19 = v18
                  * SGMachTimeToNanoseconds_machTimebaseInfo
                  / *(unsigned int *)algn_1EB9F00D4
                  / 0xF4240;
              unint64_t v20 = [v17 count];
              v24[0] = MEMORY[0x1E4F143A8];
              v24[1] = 3221225472;
              v24[2] = __61__SGMessageEventDissector_dissectTextMessage_entity_context___block_invoke;
              v24[3] = &unk_1E65B9520;
              v24[4] = self;
              unint64_t v21 = v19 / v20;
              uint64_t v17 = v17;
              id v25 = v17;
              id v26 = v9;
              id v27 = v8;
              id v28 = v10;
              unint64_t v29 = v21;
              [v26 runWithDissectorLock:v24];
            }
            else
            {
              int v23 = sgEventsLogHandle();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)long long buf = 0;
                _os_log_error_impl(&dword_1CA650000, v23, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to fetch events from MLRuntime, bailing", buf, 2u);
              }
            }
LABEL_20:

            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v22 = +[SGMessageEventDissectorTrialClientWrapper sharedInstance];
          id v15 = [v22 eventExtractionAssetsPath];

          if (v15) {
            goto LABEL_8;
          }
        }
        uint64_t v17 = sgEventsLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl(&dword_1CA650000, v17, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to fetch Event Extraction Assets from TRIAL, bailing", buf, 2u);
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
  }
LABEL_21:
}

uint64_t __61__SGMessageEventDissector_dissectTextMessage_entity_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addEnrichmentForEvents:*(void *)(a1 + 40) toEntity:*(void *)(a1 + 48) message:*(void *)(a1 + 56) context:*(void *)(a1 + 64) timingProcessingInMs:*(void *)(a1 + 72)];
}

- (BOOL)shouldProcessTextMessage:(id)a3 entity:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!+[SGMessageEventDissector allowMessageEventDissector])
  {
    uint64_t v11 = sgEventsLogHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

LABEL_12:
      BOOL v10 = 0;
      goto LABEL_13;
    }
    LOWORD(v17) = 0;
    uint64_t v12 = "SGMessageEventDissector: Skipping Message Event dissector: allowMessageEventDissector is OFF";
    char v13 = v11;
    uint32_t v14 = 2;
LABEL_10:
    _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
    goto LABEL_11;
  }
  uint64_t v6 = [v5 textContent];
  uint64_t v7 = [v6 length];

  if (!v7 || (_os_feature_enabled_impl() & 1) == 0 && ![v5 isPotentialEventMessage]) {
    goto LABEL_12;
  }
  id v8 = [v5 textContent];
  BOOL v9 = [(SGMessageEventDissector *)self isMessageOfTypeEvent:v8];

  if (!v9)
  {
    uint64_t v11 = sgEventsLogHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v17 = 138412290;
    uint64_t v18 = @"Event";
    uint64_t v12 = "SGMessageEventDissector: Skipping Message: Message is not classified as %@ type by the Event-Classifier.";
    char v13 = v11;
    uint32_t v14 = 12;
    goto LABEL_10;
  }
  if (![(SGMessageEventDissector *)self isDissectorProcessingWithinRateLimit])
  {
    uint64_t v16 = sgEventsLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissector: Skipping Message: Exceeded Rate Limit", (uint8_t *)&v17, 2u);
    }

    [(SGMessageEventDissector *)self logFailedEventExtractionForMessage:v5 failureCode:101];
    goto LABEL_12;
  }
  BOOL v10 = 1;
LABEL_13:

  return v10;
}

- (BOOL)isDissectorProcessingWithinRateLimit
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SGMessageEventDissector_isDissectorProcessingWithinRateLimit__block_invoke;
  v5[3] = &unk_1E65B94F8;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __63__SGMessageEventDissector_isDissectorProcessingWithinRateLimit__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v20 = a2;
  if ([(id)objc_opt_class() mobileAssetsEnabled])
  {
    char v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"EventExtractionMessageProcessingLimit"];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"EventExtractionRateLimitInterval"];
  }
  else
  {
    id v5 = +[SGMessageEventDissectorTrialClientWrapper sharedInstance];
    char v3 = [v5 messageProcessingLimit];

    uint64_t v6 = +[SGMessageEventDissectorTrialClientWrapper sharedInstance];
    uint64_t v4 = [v6 rateLimitInterval];
  }
  id v7 = v20[1];
  id v8 = v20[2];
  char v9 = objc_opt_new();
  [v9 timeIntervalSinceDate:v7];
  double v11 = v10;
  [v4 doubleValue];
  if (v11 >= v12)
  {
    id v13 = v9;

    id v14 = v3;
    id v7 = v13;
    id v8 = v14;
  }
  if ((int)[v8 intValue] >= 1)
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "intValue") - 1);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v8 = (id)v15;
  }
  id v16 = v20[1];
  v20[1] = v7;
  id v17 = v7;

  id v18 = v20[2];
  v20[2] = v8;
  id v19 = v8;
}

- (id)_init
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)SGMessageEventDissector;
  dispatch_semaphore_t v2 = [(SGMessageEventDissector *)&v20 init];
  if (v2)
  {
    char v3 = objc_opt_new();
    uint64_t v4 = objc_opt_new();
    id v5 = (void *)v3[1];
    v3[1] = v4;

    if ([(id)objc_opt_class() mobileAssetsEnabled])
    {
      uint64_t v6 = [(id)objc_opt_class() loadLazyPlistWithBasename:@"SGMessageEventDissectorConfig"];
      dissectorConfig = v2->_dissectorConfig;
      v2->_dissectorConfig = (NSDictionary *)v6;

      id v8 = v2->_dissectorConfig;
      if (!v8)
      {
        v21[0] = @"EventExtractionMessageProcessingLimit";
        v21[1] = @"EventExtractionRateLimitInterval";
        v22[0] = &unk_1F2535E98;
        v22[1] = &unk_1F2535EB0;
        v21[2] = @"EventClassifierThreshold";
        v22[2] = &unk_1F2536668;
        uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
        double v10 = v2->_dissectorConfig;
        v2->_dissectorConfig = (NSDictionary *)v9;

        id v8 = v2->_dissectorConfig;
      }
      uint64_t v11 = [(NSDictionary *)v8 objectForKeyedSubscript:@"EventExtractionMessageProcessingLimit"];
      double v12 = (void *)v3[2];
      v3[2] = v11;
    }
    else
    {
      double v12 = +[SGMessageEventDissectorTrialClientWrapper sharedInstance];
      uint64_t v13 = [v12 messageProcessingLimit];
      id v14 = (void *)v3[2];
      v3[2] = v13;
    }
    uint64_t v15 = [(SGMessageEventDissector *)v2 loadEventClassifierModel];
    id v16 = (void *)v3[3];
    v3[3] = v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v3];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v17;
  }
  return v2;
}

+ (id)loadEventClassifierModelFromPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v3];
    id v5 = objc_opt_new();
    [v5 setComputeUnits:0];
    id v15 = 0;
    uint64_t v6 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v4 configuration:v5 error:&v15];
    id v7 = v15;
    if (v6)
    {
      id v14 = v7;
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F388E8]) initWithMLModel:v6 error:&v14];
      uint64_t v9 = v14;

      if (v8)
      {
        double v10 = v8;
        uint64_t v11 = v10;
      }
      else
      {
        double v12 = sgEventsLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v17 = v9;
          _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to convert ML Model to NL Model: %@", buf, 0xCu);
        }

        double v10 = 0;
        uint64_t v11 = 0;
      }
    }
    else
    {
      double v10 = sgEventsLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v17 = v7;
        _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to load Event Classifier Model: %@", buf, 0xCu);
      }
      uint64_t v11 = 0;
      uint64_t v9 = v7;
    }
  }
  else
  {
    uint64_t v9 = sgEventsLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Unable to load Event Classifier Model. Model Path does not exist", buf, 2u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

+ (void)logMLMessageEventExtractionInteractions:(id)a3 context:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v19 = v5;
  id v7 = [v5 enrichments];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x1CB79B230]();
        id v14 = [v12 duplicateKey];
        [v14 entityType];
        if (SGEntityTypeIsEvent())
        {
          char v15 = [v12 isNaturalLanguageEvent];

          if (v15) {
            goto LABEL_16;
          }
          int v16 = [v6 backpressureHazard];
          if (v16 == 1) {
            unsigned int v17 = 12;
          }
          else {
            unsigned int v17 = 0;
          }
          if (v16) {
            uint64_t v18 = v17;
          }
          else {
            uint64_t v18 = 13;
          }
          id v14 = +[SGRTCLogging defaultLogger];
          [v14 logMLMessageEventInteractionForEntity:v12 interface:0 actionType:v18];
        }

LABEL_16:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

+ (id)getFlightInformationForFlightEventData:(id)a3
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = [v3 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__DEPARTURE_LOCATION"];
  v106 = [v3 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__ARRIVAL_LOCATION"];
  v97 = [v3 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__START_DATETIME"];
  uint64_t v6 = [v3 objectForKeyedSubscript:@"carrierCode"];
  v98 = [v3 objectForKeyedSubscript:@"flightNumber"];
  v94 = [v3 objectForKeyedSubscript:@"reservationId"];
  v95 = (void *)v6;
  if (!v6 || !v98 || !v97)
  {
    log = sgEventsLogHandle();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, log, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: airlineCode or flightNumber or departureDateTime not found, bailing", buf, 2u);
    }
    id v20 = 0;
    goto LABEL_88;
  }
  id v92 = v3;
  id v7 = objc_opt_new();
  [v7 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  uint64_t v8 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v7 setTimeZone:v8];

  uint64_t v9 = [a1 dateFromString:v97];
  log = v7;
  uint64_t v10 = [v7 stringFromDate:v9];

  v93 = objc_opt_new();
  v107 = (void *)v10;
  uint64_t v11 = [v93 flightInformationWithAirlineCode:v95 flightNumber:v98 flightDate:v10];
  if (![v11 count])
  {
    char v15 = sgEventsLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: No flight information found, bailing", buf, 2u);
    }
    id v20 = 0;
    goto LABEL_87;
  }
  if ([v11 count] == 1)
  {
    double v12 = [v11 objectAtIndexedSubscript:0];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"legs"];
    uint64_t v14 = [v13 count];

    if (v14 == 1)
    {
      char v15 = [v11 objectAtIndexedSubscript:0];
      int v16 = [v11 objectAtIndexedSubscript:0];
      unsigned int v17 = [v16 objectForKeyedSubscript:@"legs"];
      uint64_t v18 = [v17 objectAtIndexedSubscript:0];

      v108 = 0;
      id v19 = 0;
      goto LABEL_51;
    }
  }
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v21 = v11;
  uint64_t v102 = [v21 countByEnumeratingWithState:&v119 objects:v128 count:16];
  if (!v102)
  {

    uint64_t v18 = 0;
    id v19 = 0;
    v108 = 0;
    char v15 = 0;
    goto LABEL_83;
  }
  id obj = v21;
  char v15 = 0;
  v108 = 0;
  id v19 = 0;
  uint64_t v99 = *(void *)v120;
  v100 = v11;
  v110 = v5;
  v101 = v4;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v120 != v99) {
        objc_enumerationMutation(obj);
      }
      v109 = v15;
      uint64_t v103 = v22;
      long long v23 = *(void **)(*((void *)&v119 + 1) + 8 * v22);

      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      v104 = v23;
      id v105 = [v23 objectForKeyedSubscript:@"legs"];
      uint64_t v24 = [v105 countByEnumeratingWithState:&v115 objects:v127 count:16];
      if (!v24)
      {
        id v19 = 0;
        goto LABEL_39;
      }
      uint64_t v25 = v24;
      id v19 = 0;
      uint64_t v113 = *(void *)v116;
      do
      {
        uint64_t v26 = 0;
        do
        {
          id v27 = v19;
          if (*(void *)v116 != v113) {
            objc_enumerationMutation(v105);
          }
          id v28 = *(void **)(*((void *)&v115 + 1) + 8 * v26);
          unint64_t v29 = objc_msgSend(v28, "objectForKeyedSubscript:", @"departureAirport", v92);
          v30 = [v28 objectForKeyedSubscript:@"arrivalAirport"];
          v31 = [v28 objectForKeyedSubscript:@"departureActualTime"];
          uint64_t v32 = [a1 dateFromString:v31];
          uint64_t v33 = [log stringFromDate:v32];

          uint64_t v34 = [v29 objectForKeyedSubscript:@"code"];
          if ([v5 isEqualToString:v34])
          {
            int v35 = [v33 isEqualToString:v107];

            if (v35) {
              goto LABEL_26;
            }
          }
          else
          {
            uint64_t v36 = [v29 objectForKeyedSubscript:@"city"];
            if ([v5 isEqualToString:v36])
            {
              char v37 = [v33 isEqualToString:v107];

              if (v37)
              {
LABEL_26:
                BOOL v38 = v108;
                v39 = v109;
                v108 = v28;
                v109 = v104;
                v40 = v27;
LABEL_30:

                id v19 = v38;
LABEL_31:
                id v41 = v28;

                id v19 = v40;
                goto LABEL_32;
              }
            }
            else
            {
            }
          }
          v39 = [v30 objectForKeyedSubscript:@"code"];
          if ([v106 isEqualToString:v39])
          {
            BOOL v38 = v27;
            v40 = v28;
            goto LABEL_30;
          }
          id v42 = [v30 objectForKeyedSubscript:@"city"];
          char v43 = [v106 isEqualToString:v42];

          v40 = v28;
          id v19 = v27;
          if (v43) {
            goto LABEL_31;
          }
LABEL_32:

          ++v26;
          id v5 = v110;
        }
        while (v25 != v26);
        uint64_t v44 = [v105 countByEnumeratingWithState:&v115 objects:v127 count:16];
        uint64_t v25 = v44;
      }
      while (v44);
LABEL_39:

      char v15 = v109;
      if (v109 && v108)
      {

        uint64_t v11 = v100;
        uint64_t v4 = v101;
        goto LABEL_49;
      }
      uint64_t v22 = v103 + 1;
      uint64_t v11 = v100;
      uint64_t v4 = v101;
    }
    while (v103 + 1 != v102);
    uint64_t v102 = [obj countByEnumeratingWithState:&v119 objects:v128 count:16];
  }
  while (v102);

  if (!v108)
  {
    uint64_t v18 = 0;
    v108 = 0;
    goto LABEL_83;
  }
LABEL_49:
  uint64_t v18 = objc_msgSend(v108, "mutableCopy", v92);
  if (v19)
  {
    uint64_t v45 = [v19 objectForKeyedSubscript:@"arrivalAirport"];
    [v18 setObject:v45 forKeyedSubscript:@"arrivalAirport"];

    v46 = [v19 objectForKeyedSubscript:@"arrivalActualTime"];
    [v18 setObject:v46 forKeyedSubscript:@"arrivalActualTime"];

    id v47 = [v19 objectForKeyedSubscript:@"arrivalGate"];
    [v18 setObject:v47 forKeyedSubscript:@"arrivalGate"];

    uint64_t v48 = [v19 objectForKeyedSubscript:@"arrivalTerminal"];
    [v18 setObject:v48 forKeyedSubscript:@"arrivalTerminal"];
  }
LABEL_51:
  if (v15 && v18)
  {
    v49 = [v15 objectForKeyedSubscript:@"carrierCode"];
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];

    if (v49 != v50)
    {
      v51 = [v15 objectForKeyedSubscript:@"carrierCode"];
      [v4 setObject:v51 forKeyedSubscript:@"carrierCode"];
    }
    uint64_t v52 = [v15 objectForKeyedSubscript:@"carrierName", v92];
    v53 = [MEMORY[0x1E4F1CA98] null];

    if (v52 != v53)
    {
      long long v54 = [v15 objectForKeyedSubscript:@"carrierName"];
      [v4 setObject:v54 forKeyedSubscript:@"carrierName"];
    }
    long long v55 = [v15 objectForKeyedSubscript:@"flightNumber"];
    long long v56 = [MEMORY[0x1E4F1CA98] null];

    if (v55 != v56)
    {
      long long v57 = [v15 objectForKeyedSubscript:@"flightNumber"];
      [v4 setObject:v57 forKeyedSubscript:@"flightNumber"];
    }
    if (v94) {
      [v4 setObject:v94 forKeyedSubscript:@"reservationId"];
    }
    long long v58 = [v18 objectForKeyedSubscript:@"departureActualTime"];
    long long v59 = [MEMORY[0x1E4F1CA98] null];

    if (v58 != v59)
    {
      long long v60 = [v18 objectForKeyedSubscript:@"departureActualTime"];
      [v4 setObject:v60 forKeyedSubscript:@"departureActualTime"];
    }
    long long v61 = [v18 objectForKeyedSubscript:@"arrivalActualTime"];
    v62 = [MEMORY[0x1E4F1CA98] null];

    if (v61 != v62)
    {
      v63 = [v18 objectForKeyedSubscript:@"arrivalActualTime"];
      [v4 setObject:v63 forKeyedSubscript:@"arrivalActualTime"];
    }
    __int16 v64 = [v18 objectForKeyedSubscript:@"departureGate"];
    id v65 = [MEMORY[0x1E4F1CA98] null];

    if (v64 != v65)
    {
      v66 = [v18 objectForKeyedSubscript:@"departureGate"];
      [v4 setObject:v66 forKeyedSubscript:@"departureGate"];
    }
    uint64_t v67 = [v18 objectForKeyedSubscript:@"arrivalGate"];
    uint64_t v68 = [MEMORY[0x1E4F1CA98] null];

    if (v67 != v68)
    {
      v69 = [v18 objectForKeyedSubscript:@"arrivalGate"];
      [v4 setObject:v69 forKeyedSubscript:@"arrivalGate"];
    }
    v114 = v19;
    uint64_t v70 = [v18 objectForKeyedSubscript:@"departureTerminal"];
    v71 = [MEMORY[0x1E4F1CA98] null];

    if (v70 != v71)
    {
      v72 = [v18 objectForKeyedSubscript:@"departureTerminal"];
      [v4 setObject:v72 forKeyedSubscript:@"departureTerminal"];
    }
    id v73 = v15;
    v74 = [v18 objectForKeyedSubscript:@"arrivalTerminal"];
    v75 = [MEMORY[0x1E4F1CA98] null];

    if (v74 != v75)
    {
      v76 = [v18 objectForKeyedSubscript:@"arrivalTerminal"];
      [v4 setObject:v76 forKeyedSubscript:@"arrivalTerminal"];
    }
    v77 = [v18 objectForKeyedSubscript:@"departureAirport"];
    v78 = [v18 objectForKeyedSubscript:@"arrivalAirport"];
    v79 = [v77 objectForKeyedSubscript:@"name"];
    v80 = [MEMORY[0x1E4F1CA98] null];

    if (v79 != v80)
    {
      v81 = [v77 objectForKeyedSubscript:@"name"];
      [v4 setObject:v81 forKeyedSubscript:@"departureAirportName"];
    }
    v82 = [v78 objectForKeyedSubscript:@"name"];
    v83 = [MEMORY[0x1E4F1CA98] null];

    if (v82 != v83)
    {
      v84 = [v78 objectForKeyedSubscript:@"name"];
      [v4 setObject:v84 forKeyedSubscript:@"arrivalAirportName"];
    }
    v85 = [v77 objectForKeyedSubscript:@"code"];
    v86 = [MEMORY[0x1E4F1CA98] null];

    if (v85 != v86)
    {
      v87 = [v77 objectForKeyedSubscript:@"code"];
      [v4 setObject:v87 forKeyedSubscript:@"departureAirportCode"];
    }
    v88 = [v78 objectForKeyedSubscript:@"code"];
    v89 = [MEMORY[0x1E4F1CA98] null];

    if (v88 != v89)
    {
      v90 = [v78 objectForKeyedSubscript:@"code"];
      [v4 setObject:v90 forKeyedSubscript:@"arrivalAirportCode"];
    }
    id v20 = v4;

    char v15 = v73;
    id v19 = v114;
    goto LABEL_86;
  }
LABEL_83:
  v77 = sgEventsLogHandle();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138478083;
    v124 = v107;
    __int16 v125 = 2113;
    v126 = v5;
    _os_log_error_impl(&dword_1CA650000, v77, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: No flight information for departure date:%{private}@ & departureLocation:%{private}@ found, bailing", buf, 0x16u);
  }
  id v20 = 0;
LABEL_86:

LABEL_87:
  id v3 = v92;

LABEL_88:
  return v20;
}

+ (id)describeCategory:(unsigned __int8)a3
{
  if (a3 > 6u) {
    return @"Unknown";
  }
  else {
    return off_1E65B95E0[a3];
  }
}

+ (unsigned)messageEventCategoryForCategoryString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Flight"])
  {
    unsigned __int8 v4 = 1;
  }
  else if ([v3 isEqualToString:@"Bus"])
  {
    unsigned __int8 v4 = 2;
  }
  else if ([v3 isEqualToString:@"Train"])
  {
    unsigned __int8 v4 = 3;
  }
  else if ([v3 isEqualToString:@"Hotel"])
  {
    unsigned __int8 v4 = 4;
  }
  else if ([v3 isEqualToString:@"Movie"])
  {
    unsigned __int8 v4 = 5;
  }
  else if ([v3 isEqualToString:@"GenericEvent"])
  {
    unsigned __int8 v4 = 6;
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (id)nilEntities:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unsigned __int8 v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 first];

        if (!v11)
        {
          double v12 = [v10 second];

          if (v12)
          {
            uint64_t v13 = [v10 second];
            [v4 addObject:v13];
          }
          else
          {
            uint64_t v13 = sgEventsLogHandle();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)char v15 = 0;
              _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: No name for missing entity", v15, 2u);
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)tupleWithEntity:(id)a3 label:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithFirst:v7 second:v6];

  return v8;
}

+ (id)dateFromString:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = objc_opt_new();
  id v5 = [v4 dateFromString:v3];

  return v5;
}

+ (id)enrichmentsFromSchema:(id)a3 forMessage:(id)a4 forEntity:(id)a5 category:(id)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = [(id)objc_opt_class() messageEventCategoryForCategoryString:v12];

  if ((v13 - 1) < 5)
  {
    uint64_t v14 = objc_opt_new();
    v39[0] = v9;
    char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    id v16 = [v14 enrichmentsFromSchemas:v15 inTextMessage:v10 parentEntity:v11];

LABEL_3:
    id v16 = v16;
    long long v17 = v16;
    goto LABEL_4;
  }
  if (v13 != 6)
  {
    id v16 = 0;
    goto LABEL_3;
  }
  long long v19 = [v9 objectForKeyedSubscript:@"reservationFor"];
  id v20 = [v19 objectForKeyedSubscript:@"name"];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = [v19 objectForKeyedSubscript:@"startDate"];
  long long v23 = [v21 dateFromString:v22];

  uint64_t v24 = objc_opt_class();
  uint64_t v25 = [v19 objectForKeyedSubscript:@"endDate"];
  uint64_t v26 = [v24 dateFromString:v25];

  id v16 = 0;
  int v27 = 0;
  if (v23 && v26)
  {
    if ([v23 compare:v26] == 1)
    {
      int v27 = 0;
      id v16 = 0;
    }
    else
    {
      id v28 = [NSString alloc];
      unint64_t v29 = [v19 objectForKeyedSubscript:@"startDate"];
      v30 = [v19 objectForKeyedSubscript:@"endDate"];
      uint64_t v36 = (void *)[v28 initWithFormat:@"GenericEvent|%@|%@|%@", v20, v29, v30];
      char v37 = v20;

      v31 = [v11 duplicateKey];
      int v35 = +[SGDuplicateKey duplicateKeyForPseudoEventWithGroupId:v36 parentKey:v31];

      uint64_t v32 = [[SGPipelineEnrichment alloc] initWithDuplicateKey:v35 title:v20 parent:v11];
      int v27 = 1;
      [(SGEntity *)v32 setState:1];
      uint64_t v33 = [MEMORY[0x1E4F5DB40] floatingRangeWithLocalStartDate:v23 endDate:v26];
      [(SGEntity *)v32 setTimeRange:v33];
      [(SGEntity *)v32 setTitle:v37];
      [v11 creationTimestamp];
      -[SGPipelineEnrichment setCreationTimestamp:](v32, "setCreationTimestamp:");
      [v11 lastModifiedTimestamp];
      -[SGPipelineEnrichment setLastModifiedTimestamp:](v32, "setLastModifiedTimestamp:");
      uint64_t v34 = [MEMORY[0x1E4F5D9F0] extractedEvent];
      [(SGEntity *)v32 addTag:v34];

      BOOL v38 = v32;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];

      id v20 = v37;
    }
  }

  if (v27) {
    goto LABEL_3;
  }
  long long v17 = 0;
LABEL_4:

  return v17;
}

+ (id)fallbackSchemaForGenericEventWithTitle:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v16[0] = @"@context";
  v16[1] = @"@type";
  v17[0] = @"http://schema.org";
  v17[1] = @"http://schema.org/EventReservation";
  v17[2] = @"http://schema.org/ReservationConfirmed";
  v16[2] = @"reservationStatus";
  v16[3] = @"reservationFor";
  v14[0] = @"@type";
  v14[1] = @"name";
  v15[0] = @"http://schema.org/Event";
  v15[1] = a3;
  v14[2] = @"startDate";
  v14[3] = @"endDate";
  v15[2] = a4;
  v15[3] = a5;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 dictionaryWithObjects:v15 forKeys:v14 count:4];
  v17[3] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  return v12;
}

+ (id)schemaOrgAndMissingEntitiesForExtractedEvent:(id)a3
{
  v179[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_class();
  id v7 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__CATEGORY"];
  LODWORD(v6) = [v6 messageEventCategoryForCategoryString:v7];

  id v8 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__CATEGORY"];
  [v5 setObject:v8 forKeyedSubscript:@"category"];

  switch((int)v6)
  {
    case 0:
      id v9 = [NSString alloc];
      id v10 = [(id)objc_opt_class() describeCategory:0];
      id v11 = (void *)[v9 initWithFormat:@"Unsupported category: %@", v10];
      v137 = v11;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v137 count:1];

      int v13 = 0;
      goto LABEL_124;
    case 1:
      BOOL v38 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v14 = [a1 getFlightInformationForFlightEventData:v4];
      if (!v14)
      {
        int v13 = 0;
        id v12 = 0;
LABEL_100:
        v135 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__START_DATETIME"];
        char v15 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__END_DATETIME"];
        id v65 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__TITLE"];
        if (v65 && v135 && v15)
        {
          v82 = sgEventsLogHandle();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
          {
            id v105 = [(id)objc_opt_class() describeCategory:1];
            *(_DWORD *)long long buf = 138412290;
            v168 = v105;
            _os_log_debug_impl(&dword_1CA650000, v82, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: Using fallback schema for generic event for category: %@", buf, 0xCu);
          }
          uint64_t v83 = [(id)objc_opt_class() fallbackSchemaForGenericEventWithTitle:v65 startDate:v135 endDate:v15];

          v84 = [(id)objc_opt_class() describeCategory:6];
          [v5 setObject:v84 forKeyedSubscript:@"category"];

          int v13 = (void *)v83;
        }
        goto LABEL_120;
      }
      uint64_t v39 = [v14 objectForKeyedSubscript:@"carrierCode"];
      long long v121 = [v14 objectForKeyedSubscript:@"carrierName"];
      uint64_t v40 = [v14 objectForKeyedSubscript:@"flightNumber"];
      uint64_t v115 = [v14 objectForKeyedSubscript:@"reservationId"];
      uint64_t v41 = [v14 objectForKeyedSubscript:@"departureActualTime"];
      uint64_t v42 = [v14 objectForKeyedSubscript:@"arrivalActualTime"];
      uint64_t v114 = [v14 objectForKeyedSubscript:@"departureAirportName"];
      v127 = [v14 objectForKeyedSubscript:@"arrivalAirportName"];
      uint64_t v43 = [v14 objectForKeyedSubscript:@"departureAirportCode"];
      uint64_t v44 = [v14 objectForKeyedSubscript:@"arrivalAirportCode"];
      __int16 v125 = [v14 objectForKeyedSubscript:@"departureGate"];
      v124 = [v14 objectForKeyedSubscript:@"arrivalGate"];
      v123 = [v14 objectForKeyedSubscript:@"departureTerminal"];
      long long v122 = [v14 objectForKeyedSubscript:@"arrivalTerminal"];
      if (v39) {
        BOOL v45 = v40 == 0;
      }
      else {
        BOOL v45 = 1;
      }
      BOOL v48 = v45 || v41 == 0 || v42 == 0 || v43 == 0;
      v132 = (void *)v40;
      v136 = (void *)v44;
      BOOL v49 = v48 || v44 == 0;
      char v50 = !v49;
      char v116 = v50;
      long long v119 = (void *)v41;
      long long v120 = (void *)v39;
      long long v117 = (void *)v43;
      long long v118 = (void *)v42;
      if (v49)
      {
        v78 = objc_opt_class();
        uint64_t v113 = [(id)objc_opt_class() tupleWithEntity:v39 label:@"carrierCode"];
        v169[0] = v113;
        v112 = [(id)objc_opt_class() tupleWithEntity:v40 label:@"flightNumber"];
        v169[1] = v112;
        long long v57 = [(id)objc_opt_class() tupleWithEntity:v41 label:@"departureTime"];
        v169[2] = v57;
        long long v61 = [(id)objc_opt_class() tupleWithEntity:v42 label:@"arrivalTime"];
        v169[3] = v61;
        v79 = [(id)objc_opt_class() tupleWithEntity:v43 label:@"departureAirportCode"];
        v169[4] = v79;
        v80 = [(id)objc_opt_class() tupleWithEntity:v136 label:@"arrivalAirportCode"];
        v169[5] = v80;
        v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:6];
        id v12 = [v78 nilEntities:v81];

        int v13 = 0;
        long long v55 = (void *)v114;
        v62 = (void *)v115;
      }
      else
      {
        v178[0] = @"@context";
        v178[1] = @"@type";
        v179[0] = @"http://schema.org";
        v179[1] = @"http://schema.org/FlightReservation";
        v178[2] = @"reservationFor";
        v177[0] = @"http://schema.org/Flight";
        v176[0] = @"@type";
        v176[1] = @"airline";
        v174[0] = @"@type";
        v174[1] = @"iataCode";
        v175[0] = @"http://schema.org/Airline";
        v175[1] = v39;
        v174[2] = @"name";
        v51 = v121;
        if (!v121) {
          v51 = &stru_1F24EEF20;
        }
        v175[2] = v51;
        uint64_t v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v175 forKeys:v174 count:3];
        v177[1] = v113;
        v176[2] = @"arrivalAirport";
        v172[0] = @"@type";
        v172[1] = @"iataCode";
        v173[0] = @"http://schema.org/Airport";
        v173[1] = v44;
        v172[2] = @"name";
        uint64_t v52 = v127;
        if (!v127) {
          uint64_t v52 = &stru_1F24EEF20;
        }
        v173[2] = v52;
        v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v173 forKeys:v172 count:3];
        v177[2] = v112;
        v177[3] = v42;
        v176[3] = @"arrivalTime";
        v176[4] = @"arrivalGate";
        v53 = v124;
        if (!v124) {
          v53 = &stru_1F24EEF20;
        }
        long long v54 = v122;
        if (!v122) {
          long long v54 = &stru_1F24EEF20;
        }
        v177[4] = v53;
        v177[5] = v54;
        v176[5] = @"arrivalTerminal";
        v176[6] = @"departureAirport";
        v170[0] = @"@type";
        v170[1] = @"iataCode";
        v171[0] = @"http://schema.org/Airport";
        v171[1] = v43;
        v170[2] = @"name";
        long long v55 = (void *)v114;
        if (v114) {
          long long v56 = (__CFString *)v114;
        }
        else {
          long long v56 = &stru_1F24EEF20;
        }
        v171[2] = v56;
        long long v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v171 forKeys:v170 count:3];
        v177[6] = v57;
        v177[7] = v41;
        v176[7] = @"departureTime";
        v176[8] = @"departureGate";
        long long v58 = v125;
        if (!v125) {
          long long v58 = &stru_1F24EEF20;
        }
        long long v59 = v123;
        if (!v123) {
          long long v59 = &stru_1F24EEF20;
        }
        v177[8] = v58;
        v177[9] = v59;
        v176[9] = @"departureTerminal";
        v176[10] = @"flightNumber";
        v177[10] = v40;
        uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v177 forKeys:v176 count:11];
        long long v61 = (void *)v60;
        v62 = (void *)v115;
        if (v115) {
          v63 = (__CFString *)v115;
        }
        else {
          v63 = &stru_1F24EEF20;
        }
        v179[2] = v60;
        v179[3] = v63;
        v178[3] = @"reservationId";
        v178[4] = @"reservationStatus";
        v179[4] = @"http://schema.org/ReservationConfirmed";
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v179 forKeys:v178 count:5];
        id v12 = 0;
      }

      if ((v116 & 1) == 0) {
        goto LABEL_100;
      }
      goto LABEL_122;
    case 2:
      uint64_t v14 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__DEPARTURE_LOCATION"];
      v135 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__ARRIVAL_LOCATION"];
      char v15 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__START_DATETIME"];
      id v16 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__END_DATETIME"];
      long long v17 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__END_DATETIME_IS_SIGNIFICANT"];
      int v18 = [v17 BOOLValue];

      uint64_t v19 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__TITLE"];
      id v20 = (void *)v19;
      if (v14 && v135 && v15 && v16 && v18)
      {
        v160[0] = @"@context";
        v160[1] = @"@type";
        v161[0] = @"http://schema.org";
        v161[1] = @"http://schema.org/BusReservation";
        v161[2] = @"http://schema.org/ReservationConfirmed";
        v160[2] = @"reservationStatus";
        v160[3] = @"reservationFor";
        v159[0] = @"http://schema.org/BusTrip";
        v158[0] = @"@type";
        v158[1] = @"departureBusStop";
        v130 = (void *)v19;
        uint64_t v21 = v16;
        v156[0] = @"@type";
        v156[1] = @"name";
        v157[0] = @"http://schema.org/BusStop";
        v157[1] = v14;
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v157 forKeys:v156 count:2];
        v159[1] = v22;
        v159[2] = v15;
        v158[2] = @"departureTime";
        v158[3] = @"arrivalBusStop";
        v154[0] = @"@type";
        v154[1] = @"name";
        v155[0] = @"http://schema.org/BusStop";
        v155[1] = v135;
        long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v155 forKeys:v154 count:2];
        v158[4] = @"arrivalTime";
        v159[3] = v23;
        v159[4] = v16;
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v159 forKeys:v158 count:5];
        v161[3] = v24;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v161 forKeys:v160 count:4];

        id v16 = v21;
        id v20 = v130;
        goto LABEL_16;
      }
      if (!v19 || !v15 || !v16)
      {
        v85 = objc_opt_class();
        v133 = [(id)objc_opt_class() tupleWithEntity:v14 label:@"departureBusStop"];
        v153[0] = v133;
        v128 = [(id)objc_opt_class() tupleWithEntity:v135 label:@"arrivalBusStop"];
        v153[1] = v128;
        v86 = [(id)objc_opt_class() tupleWithEntity:v15 label:@"startDate"];
        v153[2] = v86;
        v126 = v16;
        v87 = [(id)objc_opt_class() tupleWithEntity:v16 label:@"endDate"];
        v153[3] = v87;
        v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:4];
        id v12 = [v85 nilEntities:v88];

        uint64_t v22 = sgEventsLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v108 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @", ");
          *(_DWORD *)long long buf = 138412290;
          v168 = v108;
          _os_log_error_impl(&dword_1CA650000, v22, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Missing entities for message event extraction: %@", buf, 0xCu);
        }
        int v13 = 0;
        id v16 = v126;
        goto LABEL_79;
      }
      v69 = sgEventsLogHandle();
      if (!os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_77;
      }
      uint64_t v70 = [(id)objc_opt_class() describeCategory:2];
      *(_DWORD *)long long buf = 138412290;
      v168 = v70;
      goto LABEL_130;
    case 3:
      uint64_t v14 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__DEPARTURE_LOCATION"];
      v135 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__ARRIVAL_LOCATION"];
      char v15 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__START_DATETIME"];
      id v16 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__END_DATETIME"];
      uint64_t v25 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__END_DATETIME_IS_SIGNIFICANT"];
      int v26 = [v25 BOOLValue];

      uint64_t v27 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__TITLE"];
      id v20 = (void *)v27;
      if (v14 && v135 && v15 && v16 && v26)
      {
        v151[0] = @"@context";
        v151[1] = @"@type";
        v152[0] = @"http://schema.org";
        v152[1] = @"http://schema.org/TrainReservation";
        v152[2] = @"http://schema.org/ReservationConfirmed";
        v151[2] = @"reservationStatus";
        v151[3] = @"reservationFor";
        v150[0] = @"http://schema.org/TrainTrip";
        v149[0] = @"@type";
        v149[1] = @"departureStation";
        v131 = v5;
        id v28 = v14;
        unint64_t v29 = v15;
        v30 = (void *)v27;
        v31 = v16;
        v147[0] = @"@type";
        v147[1] = @"name";
        v148[0] = @"http://schema.org/TrainStation";
        v148[1] = v28;
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v148 forKeys:v147 count:2];
        v150[1] = v22;
        v150[2] = v29;
        v149[2] = @"departureTime";
        v149[3] = @"arrivalStation";
        v145[0] = @"@type";
        v145[1] = @"name";
        v146[0] = @"http://schema.org/TrainStation";
        v146[1] = v135;
        long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v146 forKeys:v145 count:2];
        v149[4] = @"arrivalTime";
        v150[3] = v23;
        v150[4] = v16;
        uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v150 forKeys:v149 count:5];
        v152[3] = v32;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:v151 count:4];

        id v16 = v31;
        id v20 = v30;
        char v15 = v29;
        uint64_t v14 = v28;
        id v5 = v131;
LABEL_16:

LABEL_78:
        id v12 = 0;
        goto LABEL_79;
      }
      if (v27 && v15 && v16)
      {
        v69 = sgEventsLogHandle();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v70 = [(id)objc_opt_class() describeCategory:3];
          *(_DWORD *)long long buf = 138412290;
          v168 = v70;
LABEL_130:
          _os_log_debug_impl(&dword_1CA650000, v69, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: Using fallback schema for generic event for category: %@", buf, 0xCu);
        }
LABEL_77:

        int v13 = [(id)objc_opt_class() fallbackSchemaForGenericEventWithTitle:v20 startDate:v15 endDate:v16];
        uint64_t v22 = [(id)objc_opt_class() describeCategory:6];
        [v5 setObject:v22 forKeyedSubscript:@"category"];
        goto LABEL_78;
      }
      v89 = objc_opt_class();
      v134 = [(id)objc_opt_class() tupleWithEntity:v14 label:@"departureStation"];
      v144[0] = v134;
      v90 = [(id)objc_opt_class() tupleWithEntity:v135 label:@"arrivalStation"];
      v144[1] = v90;
      v91 = [(id)objc_opt_class() tupleWithEntity:v15 label:@"startDate"];
      v144[2] = v91;
      uint64_t v129 = v16;
      id v92 = [(id)objc_opt_class() tupleWithEntity:v16 label:@"endDate"];
      v144[3] = v92;
      v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:4];
      id v12 = [v89 nilEntities:v93];

      uint64_t v22 = sgEventsLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v109 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @", ");
        *(_DWORD *)long long buf = 138412290;
        v168 = v109;
        _os_log_error_impl(&dword_1CA650000, v22, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Missing entities for message event extraction: %@", buf, 0xCu);
      }
      int v13 = 0;
      id v16 = v129;
LABEL_79:

      goto LABEL_121;
    case 4:
      uint64_t v14 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__NAME"];
      v135 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__START_DATETIME"];
      char v15 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__END_DATETIME"];
      uint64_t v33 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__END_DATETIME_IS_SIGNIFICANT"];
      int v34 = [v33 BOOLValue];

      uint64_t v35 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__TITLE"];
      uint64_t v36 = (void *)v35;
      if (v14 && v135 && v15 && v34)
      {
        v166[0] = @"http://schema.org";
        v166[1] = @"http://schema.org/LodgingReservation";
        v165[0] = @"@context";
        v165[1] = @"@type";
        v165[2] = @"checkinTime";
        v165[3] = @"checkoutTime";
        v166[2] = v135;
        v166[3] = v15;
        v166[4] = @"http://schema.org/ReservationConfirmed";
        v165[4] = @"reservationStatus";
        v165[5] = @"reservationFor";
        v163[0] = @"@type";
        v163[1] = @"name";
        v164[0] = @"http://schema.org/LodgingBusiness";
        v164[1] = v14;
        char v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v164 forKeys:v163 count:2];
        v166[5] = v37;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v166 forKeys:v165 count:6];
LABEL_86:
        id v12 = 0;
        goto LABEL_115;
      }
      if (v35 && v135 && v15)
      {
        v71 = sgEventsLogHandle();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          v106 = [(id)objc_opt_class() describeCategory:4];
          *(_DWORD *)long long buf = 138412290;
          v168 = v106;
          _os_log_debug_impl(&dword_1CA650000, v71, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: Using fallback schema for generic event for category: %@", buf, 0xCu);
        }
        int v13 = [(id)objc_opt_class() fallbackSchemaForGenericEventWithTitle:v36 startDate:v135 endDate:v15];
        char v37 = [(id)objc_opt_class() describeCategory:6];
        [v5 setObject:v37 forKeyedSubscript:@"category"];
        goto LABEL_86;
      }
      v94 = objc_opt_class();
      v95 = [(id)objc_opt_class() tupleWithEntity:v14 label:@"name"];
      v162[0] = v95;
      v96 = [(id)objc_opt_class() tupleWithEntity:v135 label:@"startDate"];
      v162[1] = v96;
      v97 = [(id)objc_opt_class() tupleWithEntity:v15 label:@"endDate"];
      v162[2] = v97;
      v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:3];
      id v12 = [v94 nilEntities:v98];

      char v37 = sgEventsLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v110 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @", ");
        *(_DWORD *)long long buf = 138412290;
        v168 = v110;
        _os_log_error_impl(&dword_1CA650000, v37, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Missing entities for message event extraction: %@", buf, 0xCu);
      }
      int v13 = 0;
LABEL_115:

      goto LABEL_121;
    case 5:
      uint64_t v14 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__NAME"];
      v135 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__START_DATETIME"];
      char v15 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__END_DATETIME"];
      uint64_t v64 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__TITLE"];
      id v65 = (void *)v64;
      if (v14 && v135)
      {
        v142[0] = @"@context";
        v142[1] = @"@type";
        v143[0] = @"http://schema.org";
        v143[1] = @"http://schema.org/EventReservation";
        v143[2] = @"http://schema.org/ReservationConfirmed";
        v142[2] = @"reservationStatus";
        v142[3] = @"reservationFor";
        v140[0] = @"@type";
        v140[1] = @"name";
        v141[0] = @"http://schema.org/ScreeningEvent";
        v141[1] = v14;
        v140[2] = @"startDate";
        v141[2] = v135;
        v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v140 count:3];
        v143[3] = v66;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v143 forKeys:v142 count:4];
LABEL_93:
        id v12 = 0;
        goto LABEL_119;
      }
      if (v64 && v135 && v15)
      {
        v72 = sgEventsLogHandle();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          v107 = [(id)objc_opt_class() describeCategory:5];
          *(_DWORD *)long long buf = 138412290;
          v168 = v107;
          _os_log_debug_impl(&dword_1CA650000, v72, OS_LOG_TYPE_DEBUG, "SGMessageEventDissector: Using fallback schema for generic event for category: %@", buf, 0xCu);
        }
        int v13 = [(id)objc_opt_class() fallbackSchemaForGenericEventWithTitle:v65 startDate:v135 endDate:v15];
        v66 = [(id)objc_opt_class() describeCategory:6];
        [v5 setObject:v66 forKeyedSubscript:@"category"];
        goto LABEL_93;
      }
      uint64_t v99 = objc_opt_class();
      v100 = [(id)objc_opt_class() tupleWithEntity:v14 label:@"name"];
      v139[0] = v100;
      v101 = [(id)objc_opt_class() tupleWithEntity:v135 label:@"startDate"];
      v139[1] = v101;
      uint64_t v102 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:2];
      id v12 = [v99 nilEntities:v102];

      v66 = sgEventsLogHandle();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v111 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @", ");
        *(_DWORD *)long long buf = 138412290;
        v168 = v111;
        _os_log_error_impl(&dword_1CA650000, v66, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Missing entities for message event extraction: %@", buf, 0xCu);
      }
      int v13 = 0;
LABEL_119:

LABEL_120:
LABEL_121:

LABEL_122:
      if (v13) {
        [v5 setObject:v13 forKeyedSubscript:@"schema"];
      }
LABEL_124:
      if (v12)
      {
        [v5 setObject:v12 forKeyedSubscript:@"missingEntities"];
      }
LABEL_126:

      return v5;
    case 6:
      uint64_t v14 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__TITLE"];
      v135 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__START_DATETIME"];
      char v15 = [v4 objectForKeyedSubscript:@"EventMetaDataExtractor_ML_EVENT__END_DATETIME"];
      uint64_t v67 = objc_opt_class();
      uint64_t v68 = v67;
      if (v14 && v135 && v15)
      {
        int v13 = [v67 fallbackSchemaForGenericEventWithTitle:v14 startDate:v135 endDate:v15];
        id v12 = 0;
      }
      else
      {
        id v73 = [(id)objc_opt_class() tupleWithEntity:v14 label:@"name"];
        v138[0] = v73;
        v74 = [(id)objc_opt_class() tupleWithEntity:v135 label:@"startDate"];
        v138[1] = v74;
        v75 = [(id)objc_opt_class() tupleWithEntity:v15 label:@"endDate"];
        v138[2] = v75;
        v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:3];
        id v12 = [v68 nilEntities:v76];

        v77 = sgEventsLogHandle();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v104 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @", ");
          *(_DWORD *)long long buf = 138412290;
          v168 = v104;
          _os_log_error_impl(&dword_1CA650000, v77, OS_LOG_TYPE_ERROR, "SGMessageEventDissector: Missing entities for message event extraction: %@", buf, 0xCu);
        }
        int v13 = 0;
      }
      goto LABEL_121;
    default:
      int v13 = 0;
      goto LABEL_126;
  }
}

+ (BOOL)mobileAssetsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)featureEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)loadLazyPlistWithBasename:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 stringByAppendingPathExtension:@"plplist"];
  if (!v3)
  {
    id v11 = 0;
    goto LABEL_14;
  }
  id v4 = +[SGAsset regionAsset];
  id v5 = [v4 filesystemPathForAssetDataRelativePath:v3];

  if (_os_feature_enabled_impl())
  {
    id v6 = +[SGAsset localeAsset];
    uint64_t v7 = [v6 filesystemPathForAssetDataRelativePath:v3];

    id v5 = (void *)v7;
  }
  if (!v5)
  {
    id v9 = sgEventsLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      char v15 = v3;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "Unable to resolve path: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  id v13 = 0;
  id v8 = [MEMORY[0x1E4F93B50] dictionaryWithPath:v5 error:&v13];
  id v9 = v13;
  if (!v8)
  {
    id v10 = sgEventsLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      char v15 = v5;
      __int16 v16 = 2112;
      long long v17 = v9;
      _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);
    }

LABEL_12:
    id v8 = 0;
  }

  id v11 = v8;
LABEL_14:

  return v11;
}

+ (BOOL)allowMessageEventDissector
{
  return [MEMORY[0x1E4F5DAF0] detectMessageEventsML];
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3_21797 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3_21797, &__block_literal_global_21798);
  }
  dispatch_semaphore_t v2 = (void *)sharedInstance__pasExprOnceResult_21799;
  return v2;
}

void __41__SGMessageEventDissector_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = [[SGMessageEventDissector alloc] _init];
  dispatch_semaphore_t v2 = (void *)sharedInstance__pasExprOnceResult_21799;
  sharedInstance__pasExprOnceResult_21799 = (uint64_t)v1;
}

@end