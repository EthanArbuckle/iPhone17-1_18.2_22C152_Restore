@interface IPFeatureScanner
+ (BOOL)isNaturalLanguageEventDetectionEnabled;
+ (id)dataDetectorsFeatureExtractor;
+ (id)descriptionForScanResultType:(int64_t)a3;
+ (id)eventStore;
+ (id)keywordFeatureExtractor;
+ (id)sentenceFeatureExtractor;
+ (void)resetSharedCachesAndModels;
+ (void)setEventStoreForTesting:(id)a3;
- (BOOL)dataFeatures:(id)a3 containDateOlderThan:(id)a4 preciseTimeOnly:(BOOL)a5;
- (BOOL)isDateAroundNoon:(id)a3;
- (BOOL)isDateRoundedTo5Minutes:(id)a3;
- (BOOL)isEventProposalOrConfirmationFromFeatures:(id)a3 fromFeatureAtIndex:(unint64_t)a4 messageUnit:(id)a5 eventIsTenseDependent:(BOOL)a6 extractedFromSubject:(BOOL)a7 extractedPolarity:(unint64_t *)a8 polarityInfluencedByIpsosPlistRef:(BOOL *)a9;
- (BOOL)shouldReplaceSendDateWithCurrentDate;
- (NSArray)bodyMessageUnits;
- (NSArray)filteredDetectedEvents;
- (NSArray)stitchedEvents;
- (NSMutableArray)bodyAllFeatures;
- (NSMutableArray)bodyDataDetectorsFeatures;
- (NSMutableArray)bodyKeywordFeatures;
- (NSMutableArray)bodySentenceFeatures;
- (NSMutableArray)detectedEvents;
- (NSMutableSet)extractedNotesStrings;
- (id)_featureDataInFeatures:(id)a3 atIndex:(unint64_t)a4;
- (id)_featureSentenceInFeatures:(id)a3 atIndex:(unint64_t)a4;
- (id)_featureWithClass:(Class)a3 inFeatures:(id)a4 atIndex:(unint64_t)a5;
- (id)_nearbyFeatureDatas:(id)a3 fromFeatureAtIndex:(unint64_t)a4 messageUnit:(id)a5;
- (id)_nearbyFeatureSentences:(id)a3 fromFeatureAtIndex:(unint64_t)a4 messageUnit:(id)a5;
- (id)_regroupEventsWithSpreadTimeAsAllDayEvents:(id)a3;
- (id)_sortedFeaturesByDistance:(id)a3 aroundRange:(_NSRange)a4;
- (id)_sortedFeaturesByRange:(id)a3;
- (id)_stitchedEventsFromEvents:(id)a3;
- (id)analyzeFeatures:(id)a3 messageUnit:(id)a4;
- (id)analyzeFeatures:(id)a3 messageUnit:(id)a4 checkPolarity:(BOOL)a5 polarity:(unint64_t)a6;
- (id)artisNamesFromDataFeatures:(id)a3;
- (id)bestEventsFromEvents:(id)a3;
- (id)cleanedStringForFeatureData:(id)a3;
- (id)dataFeaturesInTheFutureFromDataFeatures:(id)a3 messageUnitSentDate:(id)a4;
- (id)decoratedTitle:(id)a3 withSubtitles:(id)a4;
- (id)decoratedTitleFromEventType:(id)a3 title:(id)a4 sender:(id)a5 recipients:(id)a6 isSent:(BOOL)a7 isTitleSenderDecorated:(BOOL *)a8;
- (id)entertainmentPOINamesFromDataFeatures:(id)a3;
- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 extractors:(id)a5 context:(id)a6;
- (id)filteredEventsForDetectedEvents:(id)a3 referenceDate:(id)a4;
- (id)messageSenderName;
- (id)movieTitlesFromDataFeatures:(id)a3;
- (id)normalizedAllDayDateFromDate:(id)a3;
- (id)notesStringsFromDataFeatures:(id)a3;
- (id)restaurantAndBarPOINamesFromDataFeatures:(id)a3;
- (id)shortNameForPerson:(id)a3;
- (id)sportTeamNamesFromDataFeatures:(id)a3;
- (id)stitchedEventsFromEvents:(id)a3;
- (id)stringsFromDataFeatures:(id)a3 matchingTypes:(id)a4;
- (id)subjectEventVocabularyIgnoreDateKeyword:(id)a3;
- (id)subjectEventVocabularyRejectionKeyword:(id)a3;
- (int64_t)resultType;
- (unint64_t)_distanceBetweenFeature:(id)a3 andFeature:(id)a4;
- (unint64_t)countOfFeaturesContainDateInTheFuture:(id)a3 messageUnitSentDate:(id)a4;
- (unint64_t)eventStatusFromPolarity:(unint64_t)a3;
- (unint64_t)featureSentencePolarityForFeatureAtIndex:(unint64_t)a3 inFeatures:(id)a4;
- (void)adjustTimeForEvent:(id)a3;
- (void)adjustTimeForEvents:(id)a3;
- (void)augmentDetectedDatesWithEndDates:(id)a3;
- (void)confidenceForEvents:(id)a3;
- (void)enrichEvents:(id)a3 messageUnits:(id)a4 dateInSubject:(id)a5 dataFeatures:(id)a6;
- (void)normalizedEvents:(id)a3;
- (void)resetScanState;
- (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)setBodyAllFeatures:(id)a3;
- (void)setBodyDataDetectorsFeatures:(id)a3;
- (void)setBodyKeywordFeatures:(id)a3;
- (void)setBodyMessageUnits:(id)a3;
- (void)setBodySentenceFeatures:(id)a3;
- (void)setDetectedEvents:(id)a3;
- (void)setExtractedNotesStrings:(id)a3;
- (void)setFilteredDetectedEvents:(id)a3;
- (void)setResultType:(int64_t)a3;
- (void)setStitchedEvents:(id)a3;
@end

@implementation IPFeatureScanner

+ (void)resetSharedCachesAndModels
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"IPScannerResetSharedCachesAndModelsNotification" object:0];
}

- (id)stitchedEventsFromEvents:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    uint64_t v6 = [(IPFeatureScanner *)self _stitchedEventsFromEvents:v4];

    v5 = [(IPFeatureScanner *)self _regroupEventsWithSpreadTimeAsAllDayEvents:v6];
    id v4 = (id)v6;
  }
  else
  {
    v5 = (void *)[v4 copy];
  }

  return v5;
}

- (void)setDetectedEvents:(id)a3
{
}

- (void)adjustTimeForEvents:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(IPFeatureScanner *)self adjustTimeForEvent:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (id)eventStore
{
  if (_sharedEventStore)
  {
    id v2 = (id)_sharedEventStore;
  }
  else
  {
    if (eventStore__pasOnceToken2 != -1) {
      dispatch_once(&eventStore__pasOnceToken2, &__block_literal_global_0);
    }
    id v2 = [(id)eventStore__pasExprOnceResult result];
  }
  return v2;
}

void __30__IPFeatureScanner_eventStore__block_invoke()
{
  v0 = (void *)MEMORY[0x22A632550]();
  uint64_t v1 = [objc_alloc(MEMORY[0x263F61E60]) initWithBlock:&__block_literal_global_10 idleTimeout:5.0];
  id v2 = (void *)eventStore__pasExprOnceResult;
  eventStore__pasExprOnceResult = v1;
}

id __30__IPFeatureScanner_eventStore__block_invoke_2()
{
  v0 = objc_opt_new();
  return v0;
}

+ (BOOL)isNaturalLanguageEventDetectionEnabled
{
  return 1;
}

+ (void)setEventStoreForTesting:(id)a3
{
}

- (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = (id)objc_opt_new();
  [v9 scanEventsInMessageUnits:v8 synchronously:v5 completionHandler:v7];
}

- (void)resetScanState
{
  [(IPFeatureScanner *)self setBodyMessageUnits:0];
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  [(IPFeatureScanner *)self setDetectedEvents:v3];

  uint64_t v4 = MEMORY[0x263EFFA68];
  [(IPFeatureScanner *)self setStitchedEvents:MEMORY[0x263EFFA68]];
  [(IPFeatureScanner *)self setFilteredDetectedEvents:v4];
  [(IPFeatureScanner *)self setResultType:0];
  BOOL v5 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
  [(IPFeatureScanner *)self setBodyAllFeatures:v5];

  uint64_t v6 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
  [(IPFeatureScanner *)self setBodyDataDetectorsFeatures:v6];

  id v7 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
  [(IPFeatureScanner *)self setBodyKeywordFeatures:v7];

  id v8 = [MEMORY[0x263EFF9C0] setWithCapacity:5];
  [(IPFeatureScanner *)self setExtractedNotesStrings:v8];

  id v9 = [MEMORY[0x263EFF980] arrayWithCapacity:100];
  [(IPFeatureScanner *)self setBodySentenceFeatures:v9];
}

+ (id)dataDetectorsFeatureExtractor
{
  if (dataDetectorsFeatureExtractor_onceToken != -1) {
    dispatch_once(&dataDetectorsFeatureExtractor_onceToken, &__block_literal_global_20);
  }
  id v2 = (void *)dataDetectorsFeatureExtractor_sExtractor;
  return v2;
}

uint64_t __49__IPFeatureScanner_dataDetectorsFeatureExtractor__block_invoke()
{
  dataDetectorsFeatureExtractor_sExtractor = +[IPFeatureExtractor defaultExtractor];
  return MEMORY[0x270F9A758]();
}

+ (id)keywordFeatureExtractor
{
  if (keywordFeatureExtractor_onceToken != -1) {
    dispatch_once(&keywordFeatureExtractor_onceToken, &__block_literal_global_23);
  }
  id v2 = (void *)keywordFeatureExtractor_kFeatureExtractor;
  return v2;
}

uint64_t __43__IPFeatureScanner_keywordFeatureExtractor__block_invoke()
{
  keywordFeatureExtractor_kFeatureExtractor = +[IPFeatureExtractor defaultExtractor];
  return MEMORY[0x270F9A758]();
}

+ (id)sentenceFeatureExtractor
{
  if (sentenceFeatureExtractor_onceToken != -1) {
    dispatch_once(&sentenceFeatureExtractor_onceToken, &__block_literal_global_26);
  }
  id v2 = (void *)sentenceFeatureExtractor_sFeatureExtractor;
  return v2;
}

uint64_t __44__IPFeatureScanner_sentenceFeatureExtractor__block_invoke()
{
  sentenceFeatureExtractor_sFeatureExtractor = +[IPFeatureExtractor defaultExtractor];
  return MEMORY[0x270F9A758]();
}

- (id)_sortedFeaturesByRange:(id)a3
{
  v3 = (void *)[a3 mutableCopy];
  [v3 sortUsingComparator:&__block_literal_global_30];
  return v3;
}

uint64_t __43__IPFeatureScanner__sortedFeaturesByRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 matchRange];
  unint64_t v6 = [v4 matchRange];

  uint64_t v7 = -1;
  if (v5 >= v6) {
    uint64_t v7 = 1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

- (unint64_t)_distanceBetweenFeature:(id)a3 andFeature:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 matchRange];
  uint64_t v8 = v7;
  uint64_t v9 = [v5 matchRange];
  uint64_t v11 = v10;

  int64_t v12 = v6 - (v11 + v9);
  if (v12 >= v9 - (v6 + v8)) {
    int64_t v12 = v9 - (v6 + v8);
  }
  if (v12 >= 0) {
    return v12;
  }
  else {
    return -v12;
  }
}

- (id)_sortedFeaturesByDistance:(id)a3 aroundRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v6 = (void *)[a3 mutableCopy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__IPFeatureScanner__sortedFeaturesByDistance_aroundRange___block_invoke;
  v8[3] = &__block_descriptor_48_e33_q24__0__IPFeature_8__IPFeature_16l;
  v8[4] = location;
  v8[5] = location + length;
  [v6 sortUsingComparator:v8];
  return v6;
}

uint64_t __58__IPFeatureScanner__sortedFeaturesByDistance_aroundRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 matchRange];
  uint64_t v8 = v7;
  uint64_t v9 = [v5 matchRange];
  uint64_t v11 = v10;

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  unint64_t v14 = v12 - (v6 + v8);
  if (v14 >= v6 - v13) {
    unint64_t v14 = v6 - v13;
  }
  uint64_t v15 = v12 - (v9 + v11);
  unint64_t v16 = v9 - v13;
  if (v15 >= v16) {
    uint64_t v15 = v16;
  }
  BOOL v17 = v14 == v15;
  BOOL v18 = (uint64_t)v14 < v15;
  uint64_t v19 = -1;
  if (!v18) {
    uint64_t v19 = 1;
  }
  if (v17) {
    return 0;
  }
  else {
    return v19;
  }
}

- (id)_featureWithClass:(Class)a3 inFeatures:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = a4;
  if ([v6 count] > a5)
  {
    uint64_t v7 = [v6 objectAtIndexedSubscript:a5];
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  uint64_t v7 = 0;
LABEL_5:

  return v7;
}

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4 extractors:(id)a5 context:(id)a6
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v32 = a4;
  id v10 = a5;
  id v33 = a6;
  v28 = v9;
  v29 = v10;
  if (v9)
  {
    id v11 = v9;
    if ((unint64_t)[v11 length] >= 0x2711)
    {
      uint64_t v12 = v11;
      id v11 = [v11 substringToIndex:10000];

      id v10 = v29;
    }
    v31 = v11;
    if ([v10 count] == 1)
    {
      uint64_t v13 = [v10 firstObject];
      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x3032000000;
      v55 = __Block_byref_object_copy_;
      v56 = __Block_byref_object_dispose_;
      id v57 = 0;
      unint64_t v14 = [v13 queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke;
      block[3] = &unk_264722C28;
      v51 = &v52;
      id v47 = v13;
      id v48 = v31;
      id v49 = v32;
      id v50 = v33;
      id v15 = v13;
      dispatch_sync(v14, block);

      id v16 = (id)v53[5];
      _Block_object_dispose(&v52, 8);
    }
    else
    {
      BOOL v17 = dispatch_group_create();
      BOOL v18 = [MEMORY[0x263EFF980] array];
      if (featuresForTextString_inMessageUnit_extractors_context__onceToken != -1) {
        dispatch_once(&featuresForTextString_inMessageUnit_extractors_context__onceToken, &__block_literal_global_32);
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v43 = 0u;
      long long v42 = 0u;
      id obj = v29;
      uint64_t v19 = [obj countByEnumeratingWithState:&v42 objects:v58 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v43 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            v23 = [v22 queue];
            v37[0] = MEMORY[0x263EF8330];
            v37[1] = 3221225472;
            v37[2] = __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_3;
            v37[3] = &unk_264722C78;
            v37[4] = v22;
            id v38 = v11;
            id v39 = v32;
            id v40 = v33;
            id v41 = v18;
            dispatch_group_async(v17, v23, v37);
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v42 objects:v58 count:16];
        }
        while (v19);
      }

      dispatch_time_t v24 = dispatch_time(0, 60000000000);
      dispatch_group_wait(v17, v24);
      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x3032000000;
      v55 = __Block_byref_object_copy_;
      v56 = __Block_byref_object_dispose_;
      id v57 = 0;
      v25 = featuresForTextString_inMessageUnit_extractors_context__sResponseQueue;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_5;
      v34[3] = &unk_264722CA0;
      id v35 = v18;
      v36 = &v52;
      id v26 = v18;
      dispatch_sync(v25, v34);
      id v16 = (id)v53[5];

      _Block_object_dispose(&v52, 8);
    }
  }
  else
  {
    id v16 = (id)MEMORY[0x263EFFA68];
  }

  return v16;
}

uint64_t __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(a1 + 32) featuresForTextString:*(void *)(a1 + 40) inMessageUnit:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  return MEMORY[0x270F9A758]();
}

void __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_2()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Ipsos.IPFeatureManager.response", v2);
  uint64_t v1 = (void *)featuresForTextString_inMessageUnit_extractors_context__sResponseQueue;
  featuresForTextString_inMessageUnit_extractors_context__sResponseQueue = (uint64_t)v0;
}

void __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) featuresForTextString:*(void *)(a1 + 40) inMessageUnit:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  if ([v2 count])
  {
    v3 = featuresForTextString_inMessageUnit_extractors_context__sResponseQueue;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_4;
    v4[3] = &unk_264722C50;
    id v5 = v2;
    id v6 = *(id *)(a1 + 64);
    dispatch_sync(v3, v4);
  }
}

uint64_t __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_4(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return objc_msgSend(*(id *)(result + 40), "addObjectsFromArray:");
  }
  return result;
}

uint64_t __75__IPFeatureScanner_featuresForTextString_inMessageUnit_extractors_context___block_invoke_5(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) copy];
  return MEMORY[0x270F9A758]();
}

- (id)_featureDataInFeatures:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(IPFeatureScanner *)self _featureWithClass:objc_opt_class() inFeatures:v6 atIndex:a4];

  return v7;
}

- (id)_featureSentenceInFeatures:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(IPFeatureScanner *)self _featureWithClass:objc_opt_class() inFeatures:v6 atIndex:a4];

  return v7;
}

- (id)_nearbyFeatureDatas:(id)a3 fromFeatureAtIndex:(unint64_t)a4 messageUnit:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [a5 originalMessage];
  v34 = [v9 dateSent];

  v36 = [(IPFeatureScanner *)self _featureWithClass:objc_opt_class() inFeatures:v8 atIndex:a4];
  uint64_t v10 = [v36 matchRange];
  uint64_t v12 = v11;
  uint64_t v13 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  v31 = v8;
  -[IPFeatureScanner _sortedFeaturesByDistance:aroundRange:](self, "_sortedFeaturesByDistance:aroundRange:", v8, v10, v12);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v38;
    unint64_t v19 = 0x264722000uLL;
    unint64_t v20 = 0x264722000uLL;
    do
    {
      uint64_t v21 = 0;
      uint64_t v33 = v16;
      do
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(v14);
        }
        v22 = *(void **)(*((void *)&v37 + 1) + 8 * v21);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((unint64_t)++v17 > 6
            || [(IPFeatureScanner *)self _distanceBetweenFeature:v36 andFeature:v22] > 0x7D0)
          {
            goto LABEL_21;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v36 != v22)
          {
            id v23 = v22;
            dispatch_time_t v24 = [v13 lastObject];
            if ([v24 type] && objc_msgSend(v24, "type") != 1) {
              goto LABEL_17;
            }
            unint64_t v25 = v20;
            unint64_t v26 = v19;
            id v27 = v14;
            v28 = v13;
            v29 = [v24 value];
            if ([v29 compare:v34] != -1)
            {

              uint64_t v13 = v28;
              id v14 = v27;
              unint64_t v19 = v26;
              unint64_t v20 = v25;
              uint64_t v16 = v33;
              goto LABEL_17;
            }
            uint64_t v32 = [v23 type];

            uint64_t v13 = v28;
            id v14 = v27;
            unint64_t v19 = v26;
            unint64_t v20 = v25;
            uint64_t v16 = v33;
            if (v32 == 5) {
              [v13 removeLastObject];
            }
            else {
LABEL_17:
            }
              [v13 addObject:v23];
          }
        }
        ++v21;
      }
      while (v16 != v21);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v16);
  }
LABEL_21:

  return v13;
}

- (id)_nearbyFeatureSentences:(id)a3 fromFeatureAtIndex:(unint64_t)a4 messageUnit:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [(IPFeatureScanner *)self _featureWithClass:objc_opt_class() inFeatures:v7 atIndex:a4];
  uint64_t v9 = [v8 matchRange];
  uint64_t v11 = v10;
  uint64_t v12 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  uint64_t v21 = v7;
  -[IPFeatureScanner _sortedFeaturesByDistance:aroundRange:](self, "_sortedFeaturesByDistance:aroundRange:", v7, v9, v11);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    unint64_t v16 = 0;
    uint64_t v17 = *(void *)v23;
LABEL_3:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v23 != v17) {
        objc_enumerationMutation(v13);
      }
      if (v16 > 5) {
        break;
      }
      unint64_t v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
      if ([(IPFeatureScanner *)self _distanceBetweenFeature:v8 andFeature:v19] > 0x3E8) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v8 != v19)
      {
        [v12 addObject:v19];
        ++v16;
      }
      if (v15 == ++v18)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v15) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v12;
}

- (BOOL)shouldReplaceSendDateWithCurrentDate
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"IPFeatureManagersReplaceSendDateWithCurrentDate"];

  return v3;
}

- (void)augmentDetectedDatesWithEndDates:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v27;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        unint64_t v10 = [v9 type];
        if (v10 < 2)
        {
          uint64_t v11 = [v9 contextDictionary];
          uint64_t v12 = [v11 objectForKeyedSubscript:@"endDate"];

          if (v12)
          {
            id v13 = v6;
            id v6 = 0;
          }
          else
          {
            id v25 = v9;
            id v13 = v6;
            id v6 = v25;
          }
LABEL_18:

          continue;
        }
        if (v10 == 2)
        {
          uint64_t v14 = [v9 matchRange];
          uint64_t v15 = [v6 matchRange];
          uint64_t v17 = v14 - (v16 + v15);
          if (v17 < 0) {
            uint64_t v17 = v16 + v15 - v14;
          }
          if ((unint64_t)v17 <= 0x31)
          {
            uint64_t v18 = [v9 contextDictionary];
            id v13 = [v18 objectForKeyedSubscript:@"endDate"];

            unint64_t v19 = [v6 value];
            [v13 timeIntervalSinceReferenceDate];
            double v21 = v20;
            [v19 timeIntervalSinceReferenceDate];
            double v23 = v21 - v22;
            if (v23 >= 1800.0 && v23 < 43200.0)
            {
              long long v24 = [v6 contextDictionary];
              [v24 setObject:v13 forKeyedSubscript:@"endDate"];
            }
            goto LABEL_18;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v5) {
        goto LABEL_23;
      }
    }
  }
  id v6 = 0;
LABEL_23:
}

- (unint64_t)featureSentencePolarityForFeatureAtIndex:(unint64_t)a3 inFeatures:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  unint64_t v8 = [v7 matchRange];
  uint64_t v9 = 0;
  while (1)
  {
    unint64_t v10 = [(IPFeatureScanner *)self _featureSentenceInFeatures:v6 atIndex:a3];
    if (v10)
    {
      unint64_t v11 = [v7 matchRange];
      if (v8 >= v11 && v8 - v11 < v12) {
        break;
      }
    }

    if ((unint64_t)++v9 >= 5)
    {
      unint64_t v13 = 0;
      goto LABEL_8;
    }
  }
  unint64_t v13 = [v10 polarity];

LABEL_8:
  return v13;
}

- (BOOL)isDateAroundNoon:(id)a3
{
  id v3 = a3;
  if (IPGregorianCalendar_once != -1) {
    dispatch_once(&IPGregorianCalendar_once, &__block_literal_global_532);
  }
  uint64_t v4 = [(id)IPGregorianCalendar_calendar components:32 fromDate:v3];
  BOOL v5 = [v4 hour] >= 11 && objc_msgSend(v4, "hour") < 14;

  return v5;
}

- (BOOL)isDateRoundedTo5Minutes:(id)a3
{
  id v3 = a3;
  if (IPGregorianCalendar_once != -1) {
    dispatch_once(&IPGregorianCalendar_once, &__block_literal_global_532);
  }
  uint64_t v4 = [(id)IPGregorianCalendar_calendar components:192 fromDate:v3];
  if ([v4 second]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = 0xCCCCCCCCCCCCCCCDLL * [v4 minute] + 0x1999999999999999 < 0x3333333333333333;
  }

  return v5;
}

- (id)dataFeaturesInTheFutureFromDataFeatures:(id)a3 messageUnitSentDate:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  unint64_t v8 = [v6 dateByAddingTimeInterval:600.0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (!objc_msgSend(v14, "type", (void)v17) || objc_msgSend(v14, "type") == 1)
        {
          uint64_t v15 = [v14 value];
          if ([v15 compare:v8] != -1) {
            [v7 addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v7;
}

- (unint64_t)countOfFeaturesContainDateInTheFuture:(id)a3 messageUnitSentDate:(id)a4
{
  uint64_t v4 = [(IPFeatureScanner *)self dataFeaturesInTheFutureFromDataFeatures:a3 messageUnitSentDate:a4];
  unint64_t v5 = [v4 count];

  return v5;
}

- (BOOL)dataFeatures:(id)a3 containDateOlderThan:(id)a4 preciseTimeOnly:(BOOL)a5
{
  BOOL v28 = a5;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (![v13 type] || objc_msgSend(v13, "type") == 1)
        {
          uint64_t v14 = [v13 value];
          if ([v14 compare:v7] == -1)
          {
            if (!v28) {
              goto LABEL_17;
            }
            uint64_t v15 = [v13 contextDictionary];
            [v15 objectForKeyedSubscript:@"timeIsApproximate"];
            v17 = id v16 = v8;
            int v29 = [v17 BOOLValue];

            long long v18 = [v13 contextDictionary];
            long long v19 = [v18 objectForKeyedSubscript:@"allDay"];
            char v20 = [v19 BOOLValue];

            double v21 = [v13 contextDictionary];
            uint64_t v22 = [v21 objectForKeyedSubscript:@"dateTimeIsTenseDependent"];
            char v23 = [v22 BOOLValue];

            id v8 = v16;
            BOOL v24 = [(IPFeatureScanner *)self isDateRoundedTo5Minutes:v14];
            if ((v20 & 1) == 0 && (v23 & 1) == 0 && (v29 & v24) == 0)
            {
LABEL_17:

              BOOL v25 = 1;
              goto LABEL_18;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v25 = 0;
LABEL_18:

  return v25;
}

- (id)subjectEventVocabularyRejectionKeyword:(id)a3
{
  return +[IPFeatureSentence eventVocabularyRejectionKeywordInString:a3 languageID:0];
}

- (id)subjectEventVocabularyIgnoreDateKeyword:(id)a3
{
  return +[IPFeatureSentence eventVocabularyIgnoreDateKeywordInString:a3 languageID:0];
}

- (BOOL)isEventProposalOrConfirmationFromFeatures:(id)a3 fromFeatureAtIndex:(unint64_t)a4 messageUnit:(id)a5 eventIsTenseDependent:(BOOL)a6 extractedFromSubject:(BOOL)a7 extractedPolarity:(unint64_t *)a8 polarityInfluencedByIpsosPlistRef:(BOOL *)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  long long v17 = v16;
  *a8 = 1;
  if (v10)
  {
    long long v18 = [v16 originalMessage];
    long long v19 = [v18 type];
    char v20 = IPMessageTypeShortMessage;

    if (v19 == v20)
    {
      BOOL v37 = 0;
      goto LABEL_70;
    }
  }
  double v21 = [v15 objectAtIndexedSubscript:a4];
  uint64_t v22 = [v21 matchRange];
  uint64_t v24 = v23;
  BOOL v25 = [(IPFeatureScanner *)self _nearbyFeatureSentences:v15 fromFeatureAtIndex:a4 messageUnit:v17];
  if (![v25 count])
  {
    BOOL v37 = 0;
    BOOL v28 = v25;
    goto LABEL_69;
  }
  uint64_t v103 = v24;
  unint64_t v26 = [v25 count];
  if (v26 >= 3) {
    uint64_t v27 = 3;
  }
  else {
    uint64_t v27 = v26;
  }
  BOOL v28 = objc_msgSend(v25, "subarrayWithRange:", 0, v27);

  int v29 = [v28 firstObject];
  v102 = a8;
  if (IPDebuggingModeEnabled_once != -1) {
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
  }
  if (IPDebuggingModeEnabled_sEnabled)
  {
    long long v30 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      long long v30 = _IPLogHandle;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      long long v31 = v30;
      [v21 matchString];
      long long v32 = v21;
      long long v33 = v17;
      uint64_t v35 = v34 = v29;
      *(_DWORD *)buf = 138412546;
      v116 = v35;
      __int16 v117 = 2112;
      v118 = v34;
      _os_log_impl(&dword_225684000, v31, OS_LOG_TYPE_INFO, "Evaluating main feature sentence containing date [%@]: %@ #FeatureManager", buf, 0x16u);

      int v29 = v34;
      long long v17 = v33;
      double v21 = v32;
    }
  }
  if ([v29 isQuoteAttributionLine])
  {
    v36 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v36 = _IPLogHandle;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225684000, v36, OS_LOG_TYPE_INFO, "Skip main feature because it is a QUOTE ATTRIBUTION LINE #FeatureManager", buf, 2u);
    }
    BOOL v37 = 0;
    goto LABEL_68;
  }
  long long v38 = [v29 eventVocabularyIgnoreDateKeyword];

  if (v38)
  {
    long long v39 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      long long v39 = _IPLogHandle;
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225684000, v39, OS_LOG_TYPE_INFO, "Skip main feature because it contains IGNORE vocabulary #FeatureManager", buf, 2u);
    }
    if (IPDebuggingModeEnabled_once != -1) {
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
    }
    if (IPDebuggingModeEnabled_sEnabled)
    {
      long long v40 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        long long v40 = _IPLogHandle;
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v41 = v40;
        uint64_t v42 = [v29 eventVocabularyIgnoreDateKeyword];
        *(_DWORD *)buf = 138412290;
        v116 = v42;
        _os_log_impl(&dword_225684000, v41, OS_LOG_TYPE_INFO, "Keyword: [%@] #FeatureManager", buf, 0xCu);
      }
    }
    BOOL v37 = 0;
    *a9 = 1;
    goto LABEL_68;
  }
  v98 = v21;
  v100 = v29;
  if (!v11) {
    goto LABEL_37;
  }
  uint64_t v43 = [v29 matchString];
  long long v44 = v29;
  long long v45 = (void *)v43;
  v46 = [v44 languageID];
  int64_t v47 = +[IPTenseDetector tenseOfString:v45 languageID:v46];

  if (!v47)
  {
    v69 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v69 = _IPLogHandle;
    }
    int v48 = 1;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225684000, v69, OS_LOG_TYPE_INFO, "Event SEEMS to be in the PAST. Let's check the fragment polarity. #FeatureManager", buf, 2u);
    }
  }
  else
  {
LABEL_37:
    int v48 = 0;
  }
  int v96 = v48;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v99 = v28;
  id v49 = v28;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v109 objects:v114 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v110 != v52) {
          objc_enumerationMutation(v49);
        }
        uint64_t v54 = [*(id *)(*((void *)&v109 + 1) + 8 * i) eventVocabularyRejectionKeyword];
        if (v54)
        {
          v61 = (void *)v54;
          v62 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v62 = _IPLogHandle;
          }
          double v21 = v98;
          BOOL v28 = v99;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_225684000, v62, OS_LOG_TYPE_INFO, "Skip because a REJECTION keyword was found nearby #FeatureManager", buf, 2u);
          }
          if (IPDebuggingModeEnabled_once != -1) {
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
          }
          if (IPDebuggingModeEnabled_sEnabled)
          {
            v63 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v63 = _IPLogHandle;
            }
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v116 = v61;
              _os_log_impl(&dword_225684000, v63, OS_LOG_TYPE_INFO, "Keyword: %@ #FeatureManager", buf, 0xCu);
            }
          }
          *a9 = 1;

          BOOL v37 = 0;
          int v29 = v100;
          goto LABEL_68;
        }
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v109 objects:v114 count:16];
    }
    while (v51);
  }

  double v108 = 0.0;
  uint64_t v55 = objc_msgSend(v100, "polarityForRange:confidence:", v22 - objc_msgSend(v100, "matchRange"), v103, &v108);
  v56 = [NSNumber numberWithDouble:v108];
  double v21 = v98;
  id v57 = [v98 contextDictionary];
  [v57 setObject:v56 forKeyedSubscript:@"polarityProbability"];

  if (v55 == 4)
  {
    v58 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v58 = _IPLogHandle;
    }
    int v29 = v100;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225684000, v58, OS_LOG_TYPE_INFO, "Skip because focused fragment polarity is REJECTION #FeatureManager", buf, 2u);
    }
    BOOL v28 = v99;
    if (IPDebuggingModeEnabled_once != -1) {
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
    }
    if (IPDebuggingModeEnabled_sEnabled)
    {
      uint64_t v59 = IPSOSLogHandle();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v60 = [v98 matchString];
        *(_DWORD *)buf = 138412290;
        v116 = v60;
        _os_log_impl(&dword_225684000, v59, OS_LOG_TYPE_INFO, "Focused fragment: [%@] #FeatureManager", buf, 0xCu);
      }
      goto LABEL_164;
    }
    goto LABEL_165;
  }
  if (!v10 && v55 == 2)
  {
    v65 = IPSOSLogHandle();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225684000, v65, OS_LOG_TYPE_INFO, "Found EVENT because focused fragment polarity is PROPOSAL #FeatureManager", buf, 2u);
    }

    BOOL v28 = v99;
    int v29 = v100;
    if (IPDebuggingModeEnabled_once != -1) {
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
    }
    if (IPDebuggingModeEnabled_sEnabled)
    {
      v66 = IPSOSLogHandle();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        v67 = [v98 matchString];
        *(_DWORD *)buf = 138412290;
        v116 = v67;
        _os_log_impl(&dword_225684000, v66, OS_LOG_TYPE_INFO, "Focused fragment: [%@] #FeatureManager", buf, 0xCu);
      }
    }
    uint64_t v68 = 2;
LABEL_97:
    unint64_t *v102 = v68;
LABEL_98:
    BOOL v37 = 1;
    goto LABEL_68;
  }
  v70 = IPSOSLogHandle();
  BOOL v71 = os_log_type_enabled(v70, OS_LOG_TYPE_INFO);
  if (!v10 && v55 == 3)
  {
    if (v71)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225684000, v70, OS_LOG_TYPE_INFO, "Found EVENT because focused fragment polarity is CONFIRMATION #FeatureManager", buf, 2u);
    }

    BOOL v28 = v99;
    int v29 = v100;
    if (IPDebuggingModeEnabled_once != -1) {
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
    }
    if (IPDebuggingModeEnabled_sEnabled)
    {
      v72 = IPSOSLogHandle();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        v73 = [v98 matchString];
        *(_DWORD *)buf = 138412290;
        v116 = v73;
        _os_log_impl(&dword_225684000, v72, OS_LOG_TYPE_INFO, "Focused fragment: [%@] #FeatureManager", buf, 0xCu);
      }
    }
    uint64_t v68 = 3;
    goto LABEL_97;
  }
  if (v10)
  {
    BOOL v28 = v99;
    int v29 = v100;
    if (v71)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225684000, v70, OS_LOG_TYPE_INFO, "Extracted from SUBJECT #FeatureManager", buf, 2u);
    }
  }
  else
  {
    int v29 = v100;
    if (v71)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225684000, v70, OS_LOG_TYPE_INFO, "No CLEAR POLARITY for focused fragment #FeatureManager", buf, 2u);
    }

    BOOL v28 = v99;
    if (IPDebuggingModeEnabled_once != -1) {
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
    }
    if (!IPDebuggingModeEnabled_sEnabled) {
      goto LABEL_110;
    }
    v70 = IPSOSLogHandle();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      v74 = [v98 matchString];
      *(_DWORD *)buf = 138412290;
      v116 = v74;
      _os_log_impl(&dword_225684000, v70, OS_LOG_TYPE_INFO, "Focused fragment: [%@] #FeatureManager", buf, 0xCu);
    }
  }

LABEL_110:
  if ([v29 polarity] == 4)
  {
    uint64_t v59 = IPSOSLogHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v75 = "Skip because main feature polarity is a rejection #FeatureManager";
      goto LABEL_163;
    }
    goto LABEL_164;
  }
  if (v96)
  {
    uint64_t v59 = IPSOSLogHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v75 = "Skip main feature because TENSE is in the PAST and event is tense dependent. #FeatureManager";
      goto LABEL_163;
    }
    goto LABEL_164;
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v76 = v49;
  uint64_t v101 = [v76 countByEnumeratingWithState:&v104 objects:v113 count:16];
  if (!v101)
  {

    goto LABEL_158;
  }
  id obj = v76;
  char v77 = 0;
  uint64_t v97 = *(void *)v105;
  while (2)
  {
    uint64_t v78 = 0;
    do
    {
      if (*(void *)v105 != v97) {
        objc_enumerationMutation(obj);
      }
      v79 = *(void **)(*((void *)&v104 + 1) + 8 * v78);
      if ([v79 polarity] == 2)
      {
        if (IPDebuggingModeEnabled_once != -1) {
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
        }
        if (IPDebuggingModeEnabled_sEnabled)
        {
          v80 = IPSOSLogHandle();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v116 = v79;
            _os_log_impl(&dword_225684000, v80, OS_LOG_TYPE_INFO, "Nearby feature: %@ #FeatureManager", buf, 0xCu);
          }
        }
        v81 = v21;
        v82 = IPSOSLogHandle();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225684000, v82, OS_LOG_TYPE_INFO, "Found PROPOSAL in nearby feature #FeatureManager", buf, 2u);
        }
        uint64_t v83 = 2;
      }
      else
      {
        if ([v79 polarity] != 3) {
          goto LABEL_142;
        }
        if (IPDebuggingModeEnabled_once != -1) {
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
        }
        if (IPDebuggingModeEnabled_sEnabled)
        {
          v84 = IPSOSLogHandle();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v116 = v79;
            _os_log_impl(&dword_225684000, v84, OS_LOG_TYPE_INFO, "Nearby feature: %@ #FeatureManager", buf, 0xCu);
          }
        }
        v81 = v21;
        v82 = IPSOSLogHandle();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225684000, v82, OS_LOG_TYPE_INFO, "Found CONFIRMATION in nearby feature #FeatureManager", buf, 2u);
        }
        uint64_t v83 = 3;
      }

      unint64_t *v102 = v83;
      char v77 = 1;
      double v21 = v81;
      BOOL v28 = v99;
      int v29 = v100;
LABEL_142:
      if ([v79 polarity] == 4)
      {
        if (IPDebuggingModeEnabled_once != -1) {
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
        }
        if (IPDebuggingModeEnabled_sEnabled)
        {
          v85 = IPSOSLogHandle();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v116 = v79;
            _os_log_impl(&dword_225684000, v85, OS_LOG_TYPE_INFO, "Nearby feature: %@ #FeatureManager", buf, 0xCu);
          }
        }
        v86 = IPSOSLogHandle();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225684000, v86, OS_LOG_TYPE_INFO, "Found REJECTION in nearby feature #FeatureManager", buf, 2u);
        }

        uint64_t v59 = IPSOSLogHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v75 = "Skip feature because rejection found nearby #FeatureManager";
          goto LABEL_163;
        }
        goto LABEL_164;
      }
      ++v78;
    }
    while (v101 != v78);
    uint64_t v101 = [obj countByEnumeratingWithState:&v104 objects:v113 count:16];
    if (v101) {
      continue;
    }
    break;
  }

  if (v77) {
    goto LABEL_98;
  }
LABEL_158:
  if (!v10)
  {
    [v29 matchRange];
    v87 = v21;
    int v89 = v88 - v103;
    v90 = [v29 matchString];
    int v91 = [v90 localizedCaseInsensitiveContainsString:@": "];

    BOOL v92 = v89 < 10;
    double v21 = v87;
    BOOL v28 = v99;
    if (v92 || v91)
    {
      v93 = [v21 contextDictionary];
      [v93 setObject:&unk_26D8CD690 forKeyedSubscript:@"polarityProbability"];

      v94 = IPSOSLogHandle();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225684000, v94, OS_LOG_TYPE_INFO, "Sentence containing DATE is very short. Detecting as a proposal. #FeatureManager", buf, 2u);
      }

      goto LABEL_98;
    }
  }
  uint64_t v59 = IPSOSLogHandle();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v75 = "Skip feature because no acceptation or proposal found nearby #FeatureManager";
LABEL_163:
    _os_log_impl(&dword_225684000, v59, OS_LOG_TYPE_INFO, v75, buf, 2u);
  }
LABEL_164:

LABEL_165:
  BOOL v37 = 0;
LABEL_68:

LABEL_69:
LABEL_70:

  return v37;
}

- (id)_stitchedEventsFromEvents:(id)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v64 = (id)objc_claimAutoreleasedReturnValue();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v3;
  uint64_t v65 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
  if (v65)
  {
    uint64_t v63 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v77 != v63) {
          objc_enumerationMutation(obj);
        }
        unint64_t v5 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v6 = v64;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v72 objects:v80 count:16];
        v70 = v5;
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v73;
          uint64_t v66 = i;
          uint64_t v67 = *(void *)v73;
          id v68 = v6;
          while (2)
          {
            uint64_t v10 = 0;
            uint64_t v69 = v8;
            do
            {
              if (*(void *)v73 != v9) {
                objc_enumerationMutation(v6);
              }
              BOOL v11 = *(void **)(*((void *)&v72 + 1) + 8 * v10);
              if ([v11 isAllDay] && objc_msgSend(v5, "isAllDay"))
              {
                uint64_t v12 = [v11 startDate];
                unint64_t v13 = [v5 startDate];
                [v12 timeIntervalSinceDate:v13];
                BOOL v15 = v14 == 0.0;
              }
              else
              {
                BOOL v15 = 0;
              }
              if (([v11 isAllDay] & 1) == 0 && (objc_msgSend(v5, "isAllDay") & 1) == 0)
              {
                id v16 = [v11 startDate];
                long long v17 = [v5 endDate];
                [v16 timeIntervalSinceDate:v17];
                if (fabs(v18) <= 3600.0) {
                  goto LABEL_33;
                }
                long long v19 = [v11 endDate];
                char v20 = [v5 startDate];
                [v19 timeIntervalSinceDate:v20];
                if (fabs(v21) <= 3600.0) {
                  goto LABEL_32;
                }
                BOOL v71 = v16;
                uint64_t v22 = [v11 startDate];
                uint64_t v23 = [v5 startDate];
                [v22 timeIntervalSinceDate:v23];
                if (fabs(v24) <= 3600.0)
                {

                  id v16 = v71;
LABEL_32:

                  id v6 = v68;
LABEL_33:

LABEL_34:
                  id v35 = v11;

                  uint64_t i = v66;
                  if (!v35) {
                    goto LABEL_41;
                  }
                  if ([v35 isAllDay])
                  {
LABEL_36:
                    uint64_t v36 = [v35 location];
                    if (v36)
                    {
                      BOOL v37 = (void *)v36;
                      long long v38 = [v70 location];

                      if (!v38)
                      {
                        long long v39 = [v35 location];
                        [v70 setLocation:v39];
                      }
                    }
                    if (objc_msgSend(v70, "ipsos_isDateTimeTenseDependent")) {
                      uint64_t v40 = objc_msgSend(v35, "ipsos_isDateTimeTenseDependent");
                    }
                    else {
                      uint64_t v40 = 0;
                    }
                    objc_msgSend(v70, "setIpsos_isDateTimeTenseDependent:", v40);
                    [v6 removeObject:v35];
                    uint64_t v55 = objc_msgSend(v70, "ipsos_dataFeatures");
                    v56 = objc_msgSend(v35, "ipsos_dataFeatures");
                    id v57 = [v55 arrayByAddingObjectsFromArray:v56];
                    objc_msgSend(v70, "setIpsos_dataFeatures:", v57);

                    [v6 addObject:v70];
                    goto LABEL_65;
                  }
                  if (([v35 isAllDay] & 1) == 0 && (objc_msgSend(v70, "isAllDay") & 1) != 0
                    || (objc_msgSend(v35, "ipsos_isTimeApproximate") & 1) == 0
                    && (objc_msgSend(v70, "ipsos_isTimeApproximate") & 1) != 0)
                  {
                    goto LABEL_65;
                  }
                  if (objc_msgSend(v35, "ipsos_isTimeApproximate")
                    && (objc_msgSend(v70, "ipsos_isTimeApproximate") & 1) == 0)
                  {
                    goto LABEL_36;
                  }
                  id v41 = [v35 startDate];
                  uint64_t v42 = [v70 startDate];
                  [v41 timeIntervalSinceDate:v42];
                  double v44 = v43;

                  if (v44 > 0.0)
                  {
                    long long v45 = [v70 startDate];
                    [v35 setStartDate:v45];
                  }
                  int v46 = objc_msgSend(v70, "ipsos_isEndTimeApproximate");
                  if (v46 == objc_msgSend(v35, "ipsos_isEndTimeApproximate"))
                  {
                    int64_t v47 = [v35 endDate];
                    int v48 = [v70 endDate];
                    [v47 timeIntervalSinceDate:v48];
                    double v50 = v49;

                    if (v50 < 0.0) {
                      goto LABEL_54;
                    }
                  }
                  if (!objc_msgSend(v70, "ipsos_isEndTimeApproximate")
                    || objc_msgSend(v35, "ipsos_isEndTimeApproximate"))
                  {
LABEL_54:
                    uint64_t v51 = [v70 endDate];
                    [v35 setEndDate:v51];

                    objc_msgSend(v35, "setIpsos_isEndTimeApproximate:", objc_msgSend(v70, "ipsos_isEndTimeApproximate"));
                  }
                  uint64_t v52 = [v35 location];
                  if (v52)
                  {
LABEL_58:
                  }
                  else
                  {
                    v53 = [v70 location];

                    if (v53)
                    {
                      uint64_t v52 = [v70 location];
                      [v35 setLocation:v52];
                      goto LABEL_58;
                    }
                  }
                  if (objc_msgSend(v70, "ipsos_isDateTimeTenseDependent")) {
                    uint64_t v54 = objc_msgSend(v35, "ipsos_isDateTimeTenseDependent");
                  }
                  else {
                    uint64_t v54 = 0;
                  }
                  objc_msgSend(v35, "setIpsos_isDateTimeTenseDependent:", v54);
                  v58 = objc_msgSend(v35, "ipsos_dataFeatures");
                  uint64_t v59 = objc_msgSend(v70, "ipsos_dataFeatures");
                  v60 = [v58 arrayByAddingObjectsFromArray:v59];
                  objc_msgSend(v35, "setIpsos_dataFeatures:", v60);

                  goto LABEL_65;
                }
                int v25 = objc_msgSend(v11, "ipsos_isTimeApproximate");
                if (v25 == objc_msgSend(v5, "ipsos_isTimeApproximate"))
                {

                  uint64_t v9 = v67;
                  id v6 = v68;
                  uint64_t v8 = v69;
                }
                else
                {
                  unint64_t v26 = [v11 startDate];
                  uint64_t v27 = [v5 startDate];
                  [v26 timeIntervalSinceDate:v27];
                  double v29 = fabs(v28);

                  unint64_t v5 = v70;
                  uint64_t v9 = v67;
                  id v6 = v68;
                  uint64_t v8 = v69;
                  if (v29 <= 18000.0) {
                    goto LABEL_34;
                  }
                }
              }
              int v30 = [v11 isAllDay];
              if (v30 == [v5 isAllDay])
              {
                BOOL v34 = 0;
              }
              else
              {
                long long v31 = [v11 startDate];
                long long v32 = [v5 startDate];
                [v31 timeIntervalSinceDate:v32];
                BOOL v34 = fabs(v33) < 86399.0;
              }
              if (v15 || v34) {
                goto LABEL_34;
              }
              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v72 objects:v80 count:16];
            uint64_t i = v66;
            if (v8) {
              continue;
            }
            break;
          }
        }

LABEL_41:
        [v6 addObject:v70];
        id v35 = 0;
LABEL_65:
      }
      uint64_t v65 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
    }
    while (v65);
  }

  return v64;
}

- (id)_regroupEventsWithSpreadTimeAsAllDayEvents:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 1)
  {
    id v4 = v3;
    goto LABEL_30;
  }
  if (_regroupEventsWithSpreadTimeAsAllDayEvents__onceToken != -1) {
    dispatch_once(&_regroupEventsWithSpreadTimeAsAllDayEvents__onceToken, &__block_literal_global_48);
  }
  id v4 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
  unint64_t v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v24 = v3;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = (void *)_regroupEventsWithSpreadTimeAsAllDayEvents__sDateFormatter;
        unint64_t v13 = [v11 startDate];
        double v14 = [v12 stringFromDate:v13];

        BOOL v15 = [v5 objectForKeyedSubscript:v14];
        if (!v15)
        {
          BOOL v15 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
          [v5 setObject:v15 forKeyedSubscript:v14];
        }
        if ([v11 isAllDay]) {
          [v15 insertObject:v11 atIndex:0];
        }
        else {
          [v15 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = [v16 objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        if ([v21 count] == 1)
        {
          uint64_t v22 = [v21 firstObject];
        }
        else
        {
          if ((unint64_t)[v21 count] < 2) {
            goto LABEL_27;
          }
          uint64_t v22 = [v21 firstObject];
          [v22 setAllDay:1];
          objc_msgSend(v22, "setIpsos_disableTimeAdjustment:", 1);
        }
        [v4 addObject:v22];

LABEL_27:
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  id v3 = v24;
LABEL_30:

  return v4;
}

uint64_t __63__IPFeatureScanner__regroupEventsWithSpreadTimeAsAllDayEvents___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)_regroupEventsWithSpreadTimeAsAllDayEvents__sDateFormatter;
  _regroupEventsWithSpreadTimeAsAllDayEvents__sDateFormatter = (uint64_t)v0;

  [(id)_regroupEventsWithSpreadTimeAsAllDayEvents__sDateFormatter setTimeStyle:0];
  id v2 = (void *)_regroupEventsWithSpreadTimeAsAllDayEvents__sDateFormatter;
  return [v2 setDateStyle:1];
}

- (void)adjustTimeForEvent:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (objc_msgSend(v3, "ipsos_timeNeedsMeridianGuess"))
  {
    id v4 = [v3 startDate];
    unint64_t v5 = objc_msgSend(v3, "ipsos_eventClassificationType");
    uint64_t v6 = [v5 preferedMeridian];
    if (!v6)
    {
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v7 = v6;
    if (IPGregorianCalendar_once != -1) {
      dispatch_once(&IPGregorianCalendar_once, &__block_literal_global_532);
    }
    id v8 = (id)IPGregorianCalendar_calendar;
    uint64_t v9 = [v8 components:32 fromDate:v4];
    uint64_t v10 = [v9 hour];
    unint64_t v11 = 12 - v10;
    if (12 - v10 < 0) {
      unint64_t v11 = v10 - 12;
    }
    if (v11 >= 2)
    {
      if (v7 == 2 && v10 <= 11)
      {
        if (IPDebuggingModeEnabled_once != -1) {
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
        }
        if (IPDebuggingModeEnabled_sEnabled)
        {
          uint64_t v12 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            uint64_t v12 = _IPLogHandle;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            unint64_t v13 = v12;
            double v14 = [v3 valueForKey:@"ipsos_betterDescription"];
            int v21 = 138412290;
            uint64_t v22 = v14;
            _os_log_impl(&dword_225684000, v13, OS_LOG_TYPE_INFO, "Adjusting time as PM for event: %@ #FeatureManager", (uint8_t *)&v21, 0xCu);
          }
        }
        BOOL v15 = [v3 startDate];
        id v16 = [v15 dateByAddingTimeInterval:43200.0];
        [v3 setStartDate:v16];

        uint64_t v17 = [v3 endDate];

        if (!v17) {
          goto LABEL_29;
        }
        uint64_t v18 = [v3 endDate];
        uint64_t v19 = [v18 dateByAddingTimeInterval:43200.0];
        [v3 setEndDate:v19];
      }
      else
      {
        if (v7 != 1 || v10 < 12) {
          goto LABEL_29;
        }
        if (IPDebuggingModeEnabled_once != -1) {
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
        }
        if (!IPDebuggingModeEnabled_sEnabled) {
          goto LABEL_29;
        }
        char v20 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          char v20 = _IPLogHandle;
        }
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
          goto LABEL_29;
        }
        uint64_t v18 = v20;
        uint64_t v19 = [v3 valueForKey:@"ipsos_betterDescription"];
        int v21 = 138412290;
        uint64_t v22 = v19;
        _os_log_impl(&dword_225684000, v18, OS_LOG_TYPE_INFO, "Adjusting time as AM for event: %@ #FeatureManager", (uint8_t *)&v21, 0xCu);
      }
    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_31:
}

- (id)notesStringsFromDataFeatures:(id)a3
{
  return [(IPFeatureScanner *)self stringsFromDataFeatures:a3 matchingTypes:&unk_26D8CD9A8];
}

- (id)movieTitlesFromDataFeatures:(id)a3
{
  return [(IPFeatureScanner *)self stringsFromDataFeatures:a3 matchingTypes:&unk_26D8CD9C0];
}

- (id)sportTeamNamesFromDataFeatures:(id)a3
{
  return [(IPFeatureScanner *)self stringsFromDataFeatures:a3 matchingTypes:&unk_26D8CD9D8];
}

- (id)artisNamesFromDataFeatures:(id)a3
{
  return [(IPFeatureScanner *)self stringsFromDataFeatures:a3 matchingTypes:&unk_26D8CD9F0];
}

- (id)restaurantAndBarPOINamesFromDataFeatures:(id)a3
{
  return [(IPFeatureScanner *)self stringsFromDataFeatures:a3 matchingTypes:&unk_26D8CDA08];
}

- (id)entertainmentPOINamesFromDataFeatures:(id)a3
{
  return [(IPFeatureScanner *)self stringsFromDataFeatures:a3 matchingTypes:&unk_26D8CDA20];
}

- (id)filteredEventsForDetectedEvents:(id)a3 referenceDate:(id)a4
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v116 = a4;
  if (![v6 count])
  {
    id v106 = (id)MEMORY[0x263EFFA68];
    goto LABEL_199;
  }
  v114 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v113 = v6;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v127 objects:v137 count:16];
  if (!v8) {
    goto LABEL_173;
  }
  uint64_t v9 = v8;
  unint64_t v10 = 0x263EFF000uLL;
  uint64_t v118 = *(void *)v128;
  v115 = self;
  do
  {
    uint64_t v11 = 0;
    uint64_t v117 = v9;
    do
    {
      if (*(void *)v128 != v118) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v127 + 1) + 8 * v11);
      unint64_t v13 = [*(id *)(v10 + 2624) standardUserDefaults];
      char v14 = [v13 BOOLForKey:@"IPFeatureManagersSkipConfidenceFiltering"];

      if ((v14 & 1) == 0)
      {
        objc_msgSend(v12, "ipsos_confidence");
        if (v15 < 0.45)
        {
          id v16 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            id v16 = _IPLogHandle;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = v16;
            objc_msgSend(v12, "ipsos_confidence");
            *(_DWORD *)buf = 134217984;
            v134 = v18;
            _os_log_impl(&dword_225684000, v17, OS_LOG_TYPE_INFO, "Skipped event because it's confidence score is too low (confidence: %0.4f) #FeatureManager", buf, 0xCu);
          }
          if (IPDebuggingModeEnabled_once != -1) {
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
          }
          if (IPDebuggingModeEnabled_sEnabled)
          {
            uint64_t v19 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              uint64_t v19 = _IPLogHandle;
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              char v20 = v19;
              int v21 = [v12 startDate];
              *(_DWORD *)buf = 138412290;
              v134 = v21;
              _os_log_impl(&dword_225684000, v20, OS_LOG_TYPE_INFO, "Filtered event (Start date: %@) #FeatureManager", buf, 0xCu);
            }
          }
          uint64_t v22 = self;
          uint64_t v23 = -80;
          goto LABEL_170;
        }
      }
      id v24 = objc_msgSend(v12, "ipsos_eventClassificationType");

      if (!v24)
      {
        long long v38 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          long long v38 = _IPLogHandle;
        }
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225684000, v38, OS_LOG_TYPE_INFO, "Skipped event because it doesn't has any clear classification type #FeatureManager", buf, 2u);
        }
        if (IPDebuggingModeEnabled_once != -1) {
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
        }
        if (IPDebuggingModeEnabled_sEnabled)
        {
          long long v39 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            long long v39 = _IPLogHandle;
          }
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
LABEL_59:
            id v41 = v39;
            uint64_t v42 = [v12 startDate];
            *(_DWORD *)buf = 138412290;
            v134 = v42;
            _os_log_impl(&dword_225684000, v41, OS_LOG_TYPE_INFO, "Filtered event (Start date: %@) #FeatureManager", buf, 0xCu);
          }
        }
LABEL_60:
        uint64_t v22 = self;
        uint64_t v23 = -65;
        goto LABEL_170;
      }
      if ([v12 isAllDay])
      {
        long long v25 = objc_msgSend(v12, "ipsos_eventClassificationType");

        if (!v25)
        {
          uint64_t v40 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            uint64_t v40 = _IPLogHandle;
          }
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_225684000, v40, OS_LOG_TYPE_INFO, "Skipped event because it doesn't has any clear classification type and is all day #FeatureManager", buf, 2u);
          }
          if (IPDebuggingModeEnabled_once != -1) {
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
          }
          if (IPDebuggingModeEnabled_sEnabled)
          {
            long long v39 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              long long v39 = _IPLogHandle;
            }
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
              goto LABEL_59;
            }
          }
          goto LABEL_60;
        }
      }
      if ([v12 isAllDay])
      {
        if ((objc_msgSend(v12, "ipsos_allDayPreferred") & 1) == 0)
        {
          long long v26 = objc_msgSend(v12, "ipsos_eventClassificationType");
          char v27 = [v26 isAllDayAllowed];

          if ((v27 & 1) == 0)
          {
            int v48 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              int v48 = _IPLogHandle;
            }
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_225684000, v48, OS_LOG_TYPE_INFO, "Skipped event because it is all day #FeatureManager", buf, 2u);
            }
            if (IPDebuggingModeEnabled_once != -1) {
              dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
            }
            if (IPDebuggingModeEnabled_sEnabled)
            {
              double v49 = _IPLogHandle;
              if (!_IPLogHandle)
              {
                IPInitLogging();
                double v49 = _IPLogHandle;
              }
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                double v50 = v49;
                uint64_t v51 = [v12 startDate];
                *(_DWORD *)buf = 138412290;
                v134 = v51;
                _os_log_impl(&dword_225684000, v50, OS_LOG_TYPE_INFO, "Filtered event (Start date: %@) #FeatureManager", buf, 0xCu);
              }
            }
            goto LABEL_168;
          }
        }
      }
      if (([v12 isAllDay] & 1) == 0)
      {
        long long v28 = [v12 startDate];
        if (![(IPFeatureScanner *)self isDateRoundedTo5Minutes:v28])
        {

LABEL_62:
          double v43 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            double v43 = _IPLogHandle;
          }
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_225684000, v43, OS_LOG_TYPE_INFO, "Skipped event because time is not rounded #FeatureManager", buf, 2u);
          }
          unint64_t v10 = 0x263EFF000;
          if (IPDebuggingModeEnabled_once != -1) {
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
          }
          if (IPDebuggingModeEnabled_sEnabled)
          {
            double v44 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              double v44 = _IPLogHandle;
            }
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              long long v45 = v44;
              int v46 = [v12 startDate];
              int64_t v47 = [v12 endDate];
              *(_DWORD *)buf = 138412546;
              v134 = v46;
              __int16 v135 = 2112;
              v136 = v47;
              _os_log_impl(&dword_225684000, v45, OS_LOG_TYPE_INFO, "Filtered event (Start date: %@, End date: %@) #FeatureManager", buf, 0x16u);
            }
          }
          uint64_t v22 = self;
          uint64_t v23 = -67;
          goto LABEL_170;
        }
        long long v29 = [v12 endDate];
        BOOL v30 = [(IPFeatureScanner *)self isDateRoundedTo5Minutes:v29];

        if (!v30) {
          goto LABEL_62;
        }
      }
      if ([v12 isAllDay])
      {
        long long v31 = [v12 title];
        uint64_t v32 = [v31 length];

        if (!v32)
        {
          v58 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v58 = _IPLogHandle;
          }
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_225684000, v58, OS_LOG_TYPE_INFO, "Skipped event because all-day event has no title #FeatureManager", buf, 2u);
          }
          unint64_t v10 = 0x263EFF000;
          if (IPDebuggingModeEnabled_once != -1) {
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
          }
          if (IPDebuggingModeEnabled_sEnabled)
          {
            uint64_t v59 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              uint64_t v59 = _IPLogHandle;
            }
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              v60 = v59;
              v61 = [v12 startDate];
              v62 = [v12 endDate];
              *(_DWORD *)buf = 138412546;
              v134 = v61;
              __int16 v135 = 2112;
              v136 = v62;
              _os_log_impl(&dword_225684000, v60, OS_LOG_TYPE_INFO, "Filtered event (Start date: %@, End date: %@) #FeatureManager", buf, 0x16u);
            }
          }
          uint64_t v22 = self;
          uint64_t v23 = -70;
          goto LABEL_170;
        }
      }
      if (([v12 isAllDay] & 1) == 0)
      {
        double v33 = objc_msgSend(v12, "ipsos_eventClassificationType");
        BOOL v34 = [v12 startDate];
        char v35 = [v33 isDateWithinRange:v34];

        if ((v35 & 1) == 0)
        {
          uint64_t v52 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            uint64_t v52 = _IPLogHandle;
          }
          unint64_t v10 = 0x263EFF000;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_225684000, v52, OS_LOG_TYPE_INFO, "Skipped event because it's not within an acceptable time range #FeatureManager", buf, 2u);
          }
          if (IPDebuggingModeEnabled_once != -1) {
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
          }
          if (IPDebuggingModeEnabled_sEnabled)
          {
            v53 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v53 = _IPLogHandle;
            }
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              uint64_t v54 = v53;
              uint64_t v55 = objc_msgSend(v12, "ipsos_eventClassificationType");
              v56 = [v55 identifier];
              id v57 = [v12 startDate];
              *(_DWORD *)buf = 138412546;
              v134 = v56;
              __int16 v135 = 2112;
              v136 = v57;
              _os_log_impl(&dword_225684000, v54, OS_LOG_TYPE_INFO, "Filtered event (Type: %@, Start date: %@) #FeatureManager", buf, 0x16u);

              unint64_t v10 = 0x263EFF000;
            }
          }
          uint64_t v22 = self;
          uint64_t v23 = -69;
          goto LABEL_170;
        }
      }
      uint64_t v36 = objc_msgSend(v12, "ipsos_eventClassificationType");
      if (![v36 isFairlyGeneric]) {
        goto LABEL_110;
      }
      BOOL v37 = objc_msgSend(v12, "ipsos_eventClassificationType");
      if (([v37 isAppointment] & 1) == 0)
      {

LABEL_110:
        goto LABEL_111;
      }
      if ([v12 isAllDay])
      {

LABEL_156:
        int v91 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          int v91 = _IPLogHandle;
        }
        unint64_t v10 = 0x263EFF000;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225684000, v91, OS_LOG_TYPE_INFO, "Skipped event because it's an appointment with a vague / all day date #FeatureManager", buf, 2u);
        }
        if (IPDebuggingModeEnabled_once != -1) {
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
        }
        if (IPDebuggingModeEnabled_sEnabled)
        {
          BOOL v92 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            BOOL v92 = _IPLogHandle;
          }
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            v93 = v92;
            v94 = objc_msgSend(v12, "ipsos_eventClassificationType");
            v95 = [v94 identifier];
            int v96 = [v12 startDate];
            *(_DWORD *)buf = 138412546;
            v134 = v95;
            __int16 v135 = 2112;
            v136 = v96;
            _os_log_impl(&dword_225684000, v93, OS_LOG_TYPE_INFO, "Filtered event (Type: %@, Start date: %@) #FeatureManager", buf, 0x16u);

            unint64_t v10 = 0x263EFF000;
          }
        }
        if ([v12 isAllDay])
        {
LABEL_168:
          uint64_t v22 = self;
          uint64_t v23 = -66;
        }
        else
        {
LABEL_169:
          uint64_t v22 = self;
          uint64_t v23 = -60;
        }
LABEL_170:
        [(IPFeatureScanner *)v22 setResultType:v23];
        goto LABEL_171;
      }
      int v90 = objc_msgSend(v12, "ipsos_isTimeApproximate");

      if (v90) {
        goto LABEL_156;
      }
LABEL_111:
      uint64_t v63 = objc_msgSend(v12, "ipsos_eventClassificationType");
      if ([v63 isFairlyGeneric])
      {
        int v64 = [v12 isAllDay];

        unint64_t v10 = 0x263EFF000;
        if (v64)
        {
          uint64_t v65 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            uint64_t v65 = _IPLogHandle;
          }
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_225684000, v65, OS_LOG_TYPE_INFO, "Skipped all-day event with a fairy generic event type #FeatureManager", buf, 2u);
          }
          if (IPDebuggingModeEnabled_once != -1) {
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
          }
          if (IPDebuggingModeEnabled_sEnabled)
          {
            uint64_t v66 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              uint64_t v66 = _IPLogHandle;
            }
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              uint64_t v67 = v66;
              id v68 = objc_msgSend(v12, "ipsos_eventClassificationType");
              uint64_t v69 = [v68 identifier];
              v70 = [v12 startDate];
              *(_DWORD *)buf = 138412546;
              v134 = v69;
              __int16 v135 = 2112;
              v136 = v70;
              _os_log_impl(&dword_225684000, v67, OS_LOG_TYPE_INFO, "Filtered event (Type: %@, Start date: %@) #FeatureManager", buf, 0x16u);

              unint64_t v10 = 0x263EFF000;
            }
          }
          goto LABEL_168;
        }
      }
      else
      {
      }
      id v71 = v7;
      long long v72 = [v12 startDate];
      [v72 timeIntervalSinceDate:v116];
      double v74 = v73;

      int v75 = objc_msgSend(v12, "ipsos_isTimeOffset");
      int v76 = objc_msgSend(v12, "ipsos_isEventTimeOnlyAndReferrengingToSentDate");
      int v77 = 0;
      if ([v12 isAllDay] && v74 < 86400.0) {
        int v77 = objc_msgSend(v12, "ipsos_allDayPreferred") ^ 1;
      }
      int v78 = 0;
      if (([v12 isAllDay] & 1) == 0 && v74 < 21600.0) {
        int v78 = objc_msgSend(v12, "ipsos_isTimeApproximate");
      }
      int v79 = 0;
      if (([v12 isAllDay] & 1) == 0 && v74 < 43200.0) {
        int v79 = objc_msgSend(v12, "ipsos_isTimeApproximate");
      }
      objc_msgSend(v12, "ipsos_duration");
      double v81 = v80;
      uint64_t v82 = objc_msgSend(v12, "ipsos_eventClassificationType");
      int v83 = [v82 isMealRelated];

      if (((v76 & (v75 ^ 1) | v77 | v78) & 1) != 0 || (v79 & (v83 ^ 1) & 1) != 0 || v74 > 31536000.0 || v81 > 172800.0)
      {
        id v7 = v71;
        uint64_t v9 = v117;
        if (IPDebuggingModeEnabled_once != -1) {
          dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
        }
        self = v115;
        unint64_t v10 = 0x263EFF000;
        if (IPDebuggingModeEnabled_sEnabled)
        {
          v85 = _IPLogHandle;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v85 = _IPLogHandle;
          }
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            v86 = v85;
            v87 = objc_msgSend(v12, "ipsos_eventClassificationType");
            int v88 = [v87 identifier];
            int v89 = [v12 startDate];
            *(_DWORD *)buf = 138412546;
            v134 = v88;
            __int16 v135 = 2112;
            v136 = v89;
            _os_log_impl(&dword_225684000, v86, OS_LOG_TYPE_INFO, "Filtered event (Type: %@, Start date: %@) #FeatureManager", buf, 0x16u);
          }
        }
        goto LABEL_169;
      }
      id v7 = v71;
      uint64_t v9 = v117;
      if (v74 < 86400.0) {
        objc_msgSend(v12, "setIpsos_eventAttributes:", objc_msgSend(v12, "ipsos_eventAttributes") | 0x10);
      }
      self = v115;
      unint64_t v10 = 0x263EFF000;
      if (objc_msgSend(v12, "ipsos_eventStatus") == 2) {
        objc_msgSend(v12, "setIpsos_eventAttributes:", objc_msgSend(v12, "ipsos_eventAttributes") | 0x20);
      }
      if ((objc_msgSend(v12, "ipsos_usesDefaultClassificationTypeStartTime") & 1) != 0
        || objc_msgSend(v12, "ipsos_isTimeApproximate"))
      {
        objc_msgSend(v12, "setIpsos_eventAttributes:", objc_msgSend(v12, "ipsos_eventAttributes") | 0x80);
      }
      objc_msgSend(v12, "ipsos_confidence");
      if (v84 > 0.95) {
        objc_msgSend(v12, "setIpsos_eventAttributes:", objc_msgSend(v12, "ipsos_eventAttributes") | 0x200);
      }
      [v114 addObject:v12];
LABEL_171:
      ++v11;
    }
    while (v9 != v11);
    uint64_t v9 = [v7 countByEnumeratingWithState:&v127 objects:v137 count:16];
  }
  while (v9);
LABEL_173:

  uint64_t v97 = v114;
  if ((unint64_t)[v114 count] < 2)
  {
    id v106 = v114;
  }
  else
  {
    v98 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v114, "count"));
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v99 = v114;
    uint64_t v100 = [v99 countByEnumeratingWithState:&v123 objects:v132 count:16];
    if (v100)
    {
      uint64_t v101 = v100;
      uint64_t v102 = *(void *)v124;
      do
      {
        for (uint64_t i = 0; i != v101; ++i)
        {
          if (*(void *)v124 != v102) {
            objc_enumerationMutation(v99);
          }
          long long v104 = *(void **)(*((void *)&v123 + 1) + 8 * i);
          if (([v104 isAllDay] & 1) == 0) {
            [v98 addObject:v104];
          }
        }
        uint64_t v101 = [v99 countByEnumeratingWithState:&v123 objects:v132 count:16];
      }
      while (v101);
    }

    if ([v98 count]) {
      long long v105 = v98;
    }
    else {
      long long v105 = v99;
    }
    id v106 = v105;

    uint64_t v97 = v114;
  }
  if ((unint64_t)[v106 count] >= 2)
  {
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v107 = v106;
    uint64_t v108 = [v107 countByEnumeratingWithState:&v119 objects:v131 count:16];
    if (v108)
    {
      uint64_t v109 = v108;
      uint64_t v110 = *(void *)v120;
      do
      {
        for (uint64_t j = 0; j != v109; ++j)
        {
          if (*(void *)v120 != v110) {
            objc_enumerationMutation(v107);
          }
          objc_msgSend(*(id *)(*((void *)&v119 + 1) + 8 * j), "setIpsos_eventAttributes:", objc_msgSend(*(id *)(*((void *)&v119 + 1) + 8 * j), "ipsos_eventAttributes") | 0x40);
        }
        uint64_t v109 = [v107 countByEnumeratingWithState:&v119 objects:v131 count:16];
      }
      while (v109);
    }

    uint64_t v97 = v114;
  }

  id v6 = v113;
LABEL_199:

  return v106;
}

- (id)normalizedAllDayDateFromDate:(id)a3
{
  uint64_t v3 = IPGregorianCalendar_once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&IPGregorianCalendar_once, &__block_literal_global_532);
  }
  id v5 = (id)IPGregorianCalendar_calendar;
  id v6 = [v5 components:254 fromDate:v4];

  id v7 = (void *)[v6 copy];
  [v7 setHour:0];
  [v7 setMinute:0];
  [v7 setSecond:0];
  [v7 setTimeZone:0];
  uint64_t v8 = [v5 dateFromComponents:v7];

  return v8;
}

- (void)normalizedEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 isAllDay])
        {
          unint64_t v10 = [v9 startDate];
          uint64_t v11 = [(IPFeatureScanner *)self normalizedAllDayDateFromDate:v10];
          [v9 setStartDate:v11];

          uint64_t v12 = [v9 endDate];
          unint64_t v13 = [(IPFeatureScanner *)self normalizedAllDayDateFromDate:v12];
          [v9 setEndDate:v13];

          [v9 setTimeZone:0];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (id)bestEventsFromEvents:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    id v4 = [MEMORY[0x263EFF980] arrayWithCapacity:10];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_msgSend(v10, "ipsos_confidence", (void)v13);
          if (v11 > 0.7) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (id)stringsFromDataFeatures:(id)a3 matchingTypes:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "type", (void)v18));
        int v15 = [v6 containsObject:v14];

        if (v15)
        {
          long long v16 = [v13 matchString];
          if (v16) {
            [v7 addObject:v16];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)cleanedStringForFeatureData:(id)a3
{
  uint64_t v3 = IPLocalizedString_once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&IPLocalizedString_once, &__block_literal_global_540);
  }
  id v5 = [(id)IPLocalizedString_bundle localizedStringForKey:@", ", &stru_26D895C60, @"DataDetectorsNaturalLanguage" value table];
  id v6 = [v4 matchString];

  uint64_t v7 = [NSString stringWithFormat:@"%@\n", v5];
  id v8 = [v6 stringByReplacingOccurrencesOfString:v7 withString:@"\n"];

  uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@", \n", @"\n" withString];

  uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@",\n" withString:@"\n"];

  uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"\n\n" withString:@"\n"];

  uint64_t v12 = [v11 stringByReplacingOccurrencesOfString:@"\n" withString:v5];

  return v12;
}

+ (id)descriptionForScanResultType:(int64_t)a3
{
  id result = @"IPFeatureScanResultTypeEventNotFound";
  if (a3 > -51)
  {
    if (a3 > -21)
    {
      switch(a3)
      {
        case -13:
          id result = @"IPFeatureScanResultTypeNoSentencePolarityExtractedOrAssetMissing";
          break;
        case -12:
          id result = @"IPFeatureScanResultTypeContainsTooManyDatesInTheFuture";
          break;
        case -11:
          id result = @"IPFeatureScanResultTypeContainsDateInTheFarPast";
          break;
        case -10:
          id result = @"IPFeatureScanResultTypeNoDateInTheFuture";
          break;
        case -9:
        case -8:
        case -7:
        case -6:
        case -5:
        case -4:
        case -3:
        case -2:
        case 0:
          return result;
        case -1:
          id result = @"IPFeatureScanResultTypeDisabled";
          break;
        case 1:
          id result = @"IPFeatureScanResultTypeEventFound";
          break;
        case 2:
          id result = @"IPFeatureScanResultTypeMultipleEventsFound";
          break;
        default:
          if (a3 == -20) {
            id result = @"IPFeatureScanResultTypeNoPolarityProposalOrAcceptation";
          }
          break;
      }
      return result;
    }
    id v4 = @"IPFeatureScanResultTypeSubjectContainsRejection";
    id v5 = @"IPFeatureScanResultTypeBlacklistedSender";
    id v6 = @"IPFeatureScanResultTypeIgnoreOrRejectionKeywordFound";
    if (a3 != -21) {
      id v6 = @"IPFeatureScanResultTypeEventNotFound";
    }
    if (a3 != -40) {
      id v5 = v6;
    }
    BOOL v7 = a3 == -50;
LABEL_18:
    if (v7) {
      return v4;
    }
    else {
      return v5;
    }
  }
  if (a3 <= -71)
  {
    id v4 = @"IPFeatureScanResultTypeContainsDateInThePastWithPreciseTime";
    id v5 = @"IPFeatureScanResultTypeGroupMessageConversation";
    id v8 = @"IPFeatureScanResultTypeEventFilteredOutLowConfidenceScore";
    if (a3 != -80) {
      id v8 = @"IPFeatureScanResultTypeEventNotFound";
    }
    if (a3 != -90) {
      id v5 = v8;
    }
    BOOL v7 = a3 == -110;
    goto LABEL_18;
  }
  switch(a3)
  {
    case -70:
      id result = @"IPFeatureScanResultTypeEventFilteredOutAllDayWithNoTitle";
      break;
    case -69:
      id result = @"IPFeatureScanResultTypeEventFilteredOutNotAcceptableTimeRangeForEventType";
      break;
    case -68:
      id result = @"IPFeatureScanResultTypeEventFilteredOutSeveralDetectedEvents";
      break;
    case -67:
      id result = @"IPFeatureScanResultTypeEventFilteredOutNotRoundedTime";
      break;
    case -66:
      id result = @"IPFeatureScanResultTypeEventFilteredOutAllDayEvent";
      break;
    case -65:
      id result = @"IPFeatureScanResultTypeEventNoClassificationType";
      break;
    case -60:
      id result = @"IPFeatureScanResultTypeEventFilteredOut";
      break;
    default:
      return result;
  }
  return result;
}

- (void)enrichEvents:(id)a3 messageUnits:(id)a4 dateInSubject:(id)a5 dataFeatures:(id)a6
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v83 = a4;
  id v79 = a5;
  id v11 = a6;
  if ([v10 count])
  {
    uint64_t v82 = [(IPFeatureScanner *)self movieTitlesFromDataFeatures:v11];
    int v78 = [(IPFeatureScanner *)self sportTeamNamesFromDataFeatures:v11];
    int v76 = [(IPFeatureScanner *)self artisNamesFromDataFeatures:v11];
    int v75 = [(IPFeatureScanner *)self restaurantAndBarPOINamesFromDataFeatures:v11];
    id v72 = v11;
    [(IPFeatureScanner *)self entertainmentPOINamesFromDataFeatures:v11];
    v74 = id v73 = v10;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id obj = v10;
    uint64_t v81 = [obj countByEnumeratingWithState:&v92 objects:v96 count:16];
    if (!v81) {
      goto LABEL_80;
    }
    uint64_t v80 = *(void *)v93;
    while (1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v93 != v80) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v92 + 1) + 8 * v12);
        long long v14 = objc_msgSend(v13, "ipsos_eventClassificationType");

        if (!v14)
        {
          int v15 = objc_msgSend(v13, "ipsos_messageUnit");
          long long v16 = objc_msgSend(v13, "ipsos_messageUnit");
          long long v17 = [v16 keywordFeatures];
          long long v18 = objc_msgSend(v13, "ipsos_dataFeatures");
          long long v19 = +[IPEventClassificationType eventClassificationTypeFromMessageUnit:v15 keywordFeatures:v17 datafeatures:v18];
          objc_msgSend(v13, "setIpsos_eventClassificationType:", v19);
        }
        long long v20 = objc_msgSend(v13, "ipsos_eventClassificationType");
        long long v21 = v20;
        if (v20 && ![v20 isFairlyGeneric]) {
          goto LABEL_23;
        }
        uint64_t v22 = [v83 firstObject];
        uint64_t v23 = [v22 bestLanguageID];

        if ([v82 count])
        {
          uint64_t v24 = +[IPEventClassificationType eventTypeForMoviesAndLanguageID:v23];
        }
        else if ([v78 count])
        {
          uint64_t v24 = +[IPEventClassificationType eventTypeForSportAndLanguageID:v23];
        }
        else if ([v76 count])
        {
          uint64_t v24 = +[IPEventClassificationType eventTypeForCultureAndLanguageID:v23];
        }
        else if ([v75 count])
        {
          uint64_t v24 = +[IPEventClassificationType eventTypeForMealsAndLanguageID:v23];
        }
        else
        {
          if (![v74 count]) {
            goto LABEL_22;
          }
          uint64_t v24 = +[IPEventClassificationType eventTypeForEntertainmentAndLanguageID:v23];
        }
        long long v25 = (void *)v24;

        long long v21 = v25;
LABEL_22:
        objc_msgSend(v13, "setIpsos_eventClassificationType:", v21);

        if (!v21) {
          goto LABEL_76;
        }
LABEL_23:
        uint64_t v26 = [v13 isAllDay];
        int v27 = objc_msgSend(v13, "ipsos_allDayPreferred");
        unsigned int v89 = objc_msgSend(v13, "ipsos_isTimeApproximate");
        int v28 = objc_msgSend(v13, "ipsos_isEndTimeApproximate");
        long long v29 = [v13 startDate];
        BOOL v30 = [v13 endDate];
        long long v31 = v30;
        uint64_t v86 = v12;
        if (v26)
        {
          [v30 timeIntervalSinceDate:v29];
          BOOL v33 = fabs(v32) > 86400.0;
        }
        else
        {
          uint64_t v34 = [v21 adjustedEventClassificationTypeWithStartDate:v29];

          objc_msgSend(v13, "setIpsos_eventClassificationType:", v34);
          BOOL v33 = 0;
          long long v21 = (void *)v34;
        }
        if (([v21 defaultStartingTimeHour] & 0x80000000) != 0)
        {
          id v40 = 0;
        }
        else
        {
          int v84 = v27;
          int v87 = v28;
          char v35 = v31;
          uint64_t v36 = (void *)MEMORY[0x263EFF910];
          int v37 = 3600 * [v21 defaultStartingTimeHour];
          double v38 = (double)(int)(v37 + 60 * [v21 defaultStartingTimeMinutes]);
          long long v39 = [(IPFeatureScanner *)self normalizedAllDayDateFromDate:v29];
          id v40 = [v36 dateWithTimeInterval:v39 sinceDate:v38];

          if (v40) {
            char v41 = v26;
          }
          else {
            char v41 = 1;
          }
          if (v41 & 1) != 0 || ((v89 ^ 1))
          {
            long long v31 = v35;
            if (!v40) {
              goto LABEL_39;
            }
            BOOL v43 = 0;
          }
          else
          {
            [v40 timeIntervalSinceDate:v29];
            BOOL v43 = fabs(v42) <= 5400.0;
            long long v31 = v35;
          }
          if ((v26 ^ 1 | v84 | v33) != 1 || v43)
          {
            id v44 = v40;

            unsigned int v89 = 1;
            objc_msgSend(v13, "setIpsos_usesDefaultClassificationTypeStartTime:", 1);
            id v40 = v44;

            uint64_t v26 = 0;
            long long v29 = v40;
            long long v31 = v40;
            int v28 = v87;
          }
        }
LABEL_39:
        v85 = v40;
        if (v26 & 1) != 0 || ((v28 ^ 1))
        {
          int v88 = v31;
        }
        else
        {
          [v21 defaultDuration];
          if (v45 <= 0.0)
          {
            if ([(IPFeatureScanner *)self isDateAroundNoon:v29])
            {
              int v48 = v29;
              double v49 = 3600.0;
            }
            else
            {
              int v48 = v29;
              double v49 = 7200.0;
            }
            uint64_t v47 = [v48 dateByAddingTimeInterval:v49];
          }
          else
          {
            int v46 = (void *)MEMORY[0x263EFF910];
            [v21 defaultDuration];
            uint64_t v47 = objc_msgSend(v46, "dateWithTimeInterval:sinceDate:", v29);
          }
          uint64_t v50 = v47;

          int v88 = (void *)v50;
        }
        unsigned __int8 v91 = 0;
        uint64_t v51 = [(IPFeatureScanner *)self bodyMessageUnits];
        uint64_t v52 = [v83 objectAtIndexedSubscript:0];
        [v52 originalMessage];
        uint64_t v54 = v53 = self;
        uint64_t v55 = [v54 subject];
        v56 = [v21 adjustedEventTitleForMessageUnits:v51 subject:v55 dateInSubject:v79 eventStartDate:v29 isGeneratedFromSubject:&v91];

        char v90 = 0;
        if ([v21 isSportRelated])
        {
          uint64_t v57 = [(IPFeatureScanner *)v53 decoratedTitle:v56 withSubtitles:v78];
          self = v53;
          uint64_t v12 = v86;
        }
        else
        {
          self = v53;
          v58 = v88;
          if ([v21 isMovieRelated] && v82)
          {
            uint64_t v57 = [(IPFeatureScanner *)v53 decoratedTitle:v56 withSubtitles:v82];
            uint64_t v12 = v86;
            goto LABEL_69;
          }
          uint64_t v12 = v86;
          if ([v21 isCultureRelated] && objc_msgSend(v76, "count"))
          {
            uint64_t v59 = self;
            v60 = v56;
            v61 = v76;
LABEL_68:
            uint64_t v57 = [(IPFeatureScanner *)v59 decoratedTitle:v60 withSubtitles:v61];
            goto LABEL_69;
          }
          if ([v21 isMealRelated] && objc_msgSend(v75, "count"))
          {
            uint64_t v59 = self;
            v60 = v56;
            v61 = v75;
            goto LABEL_68;
          }
          if (![v56 length] && objc_msgSend(v74, "count"))
          {
            uint64_t v59 = self;
            v60 = v56;
            v61 = v74;
            goto LABEL_68;
          }
          if (![v21 prefersTitleSenderDecoration]) {
            goto LABEL_70;
          }
          v62 = [v21 defaultTitle];
          int v63 = [v62 isEqualToString:v56];

          if (!v63)
          {
            v58 = v88;
            goto LABEL_70;
          }
          int v64 = [v83 firstObject];
          uint64_t v65 = [v64 originalMessage];

          uint64_t v66 = [v65 sender];
          uint64_t v67 = [v65 recipients];
          uint64_t v57 = -[IPFeatureScanner decoratedTitleFromEventType:title:sender:recipients:isSent:isTitleSenderDecorated:](self, "decoratedTitleFromEventType:title:sender:recipients:isSent:isTitleSenderDecorated:", v21, v56, v66, v67, [v65 isSent], &v90);

          uint64_t v12 = v86;
          v56 = v65;
        }
        v58 = v88;
LABEL_69:

        v56 = (void *)v57;
LABEL_70:
        [v13 setAllDay:v26];
        [v13 setStartDate:v29];
        [v13 setEndDate:v58];
        objc_msgSend(v13, "setIpsos_isTimeApproximate:", v89);
        [v13 setTitle:v56];
        if ([v56 length])
        {
          int v68 = v91;
          uint64_t v69 = objc_msgSend(v13, "ipsos_eventAttributes");
          uint64_t v70 = 1024;
          if (!v68) {
            uint64_t v70 = 2048;
          }
          objc_msgSend(v13, "setIpsos_eventAttributes:", v69 | v70);
          if (v90) {
            objc_msgSend(v13, "setIpsos_eventAttributes:", objc_msgSend(v13, "ipsos_eventAttributes") | 0x1000);
          }
        }

LABEL_76:
        ++v12;
      }
      while (v81 != v12);
      uint64_t v71 = [obj countByEnumeratingWithState:&v92 objects:v96 count:16];
      uint64_t v81 = v71;
      if (!v71)
      {
LABEL_80:

        id v11 = v72;
        id v10 = v73;
        break;
      }
    }
  }
}

- (id)messageSenderName
{
  id v2 = [(IPFeatureScanner *)self bodyMessageUnits];
  uint64_t v3 = [v2 firstObject];
  id v4 = [v3 originalMessage];

  id v5 = [v4 sender];
  id v6 = [v5 displayableName];

  return v6;
}

- (id)shortNameForPerson:(id)a3
{
  uint64_t v3 = [a3 displayableName];
  if ([v3 containsString:@"@"])
  {
    id v4 = 0;
  }
  else
  {
    id v5 = objc_opt_new();
    id v6 = [v5 personNameComponentsFromString:v3];

    if (v6)
    {
      id v7 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v6 style:1 options:0];
    }
    else
    {
      id v7 = v3;
    }
    id v4 = v7;
  }
  return v4;
}

- (id)decoratedTitle:(id)a3 withSubtitles:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IPLocalizedString_once != -1) {
    dispatch_once(&IPLocalizedString_once, &__block_literal_global_540);
  }
  id v7 = [(id)IPLocalizedString_bundle localizedStringForKey:@"%@: %@" value:&stru_26D895C60 table:@"DataDetectorsNaturalLanguage"];
  if (IPLocalizedString_once != -1) {
    dispatch_once(&IPLocalizedString_once, &__block_literal_global_540);
  }
  id v8 = [(id)IPLocalizedString_bundle localizedStringForKey:@" / " value:&stru_26D895C60 table:@"DataDetectorsNaturalLanguage"];
  if ([v6 count] && (unint64_t)objc_msgSend(v6, "count") <= 3)
  {
    uint64_t v9 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v6];
    id v10 = [v9 array];

    id v11 = objc_msgSend(v10, "_pas_componentsJoinedByString:", v8);
    uint64_t v12 = [MEMORY[0x263EFF960] currentLocale];
    long long v13 = [v11 lowercaseStringWithLocale:v12];
    if ([v13 isEqualToString:v11])
    {
    }
    else
    {
      long long v14 = [v11 uppercaseStringWithLocale:v12];
      int v15 = [v14 isEqualToString:v11];

      if (!v15)
      {
LABEL_11:
        if ([v5 length])
        {
          _PASValidatedFormat(v7, v18, v19, v20, v21, v22, v23, v24, (uint64_t)v5);
          id v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v25 = v11;
        }
        id v26 = v25;

        id v6 = v10;
        id v5 = v26;
        goto LABEL_15;
      }
    }
    long long v16 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v17 = [v11 capitalizedStringWithLocale:v16];

    id v11 = (void *)v17;
    goto LABEL_11;
  }
LABEL_15:

  return v5;
}

- (void)confidenceForEvents:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [(IPFeatureScanner *)self confidenceForEvent:v9 baseConfidence:1.0];
        double v11 = fmin(v10, 1.0);
        if (v11 < 0.0) {
          double v11 = 0.0;
        }
        objc_msgSend(v9, "setIpsos_confidence:", v11);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)analyzeFeatures:(id)a3 messageUnit:(id)a4
{
  return [(IPFeatureScanner *)self analyzeFeatures:a3 messageUnit:a4 checkPolarity:1 polarity:0];
}

- (id)analyzeFeatures:(id)a3 messageUnit:(id)a4 checkPolarity:(BOOL)a5 polarity:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v37 = 0;
  double v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy_;
  char v41 = __Block_byref_object_dispose_;
  id v42 = (id)objc_opt_new();
  long long v12 = [v11 originalMessage];
  long long v13 = [v12 dateSent];

  long long v14 = [(IPFeatureScanner *)self bodyMessageUnits];
  id v15 = [v14 firstObject];
  BOOL v16 = v15 == v11;

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F61E68]) initWithBlock:&__block_literal_global_197];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __71__IPFeatureScanner_analyzeFeatures_messageUnit_checkPolarity_polarity___block_invoke_2;
  v24[3] = &unk_264722CC8;
  BOOL v30 = v35;
  id v18 = v13;
  BOOL v33 = a5;
  BOOL v34 = v16;
  id v25 = v18;
  id v26 = self;
  id v19 = v10;
  id v27 = v19;
  id v20 = v11;
  id v28 = v20;
  unint64_t v32 = a6;
  id v21 = v17;
  id v29 = v21;
  long long v31 = &v37;
  [v19 enumerateObjectsUsingBlock:v24];
  id v22 = (id)v38[5];

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

id __71__IPFeatureScanner_analyzeFeatures_messageUnit_checkPolarity_polarity___block_invoke()
{
  return +[IPFeatureScanner eventStore];
}

void __71__IPFeatureScanner_analyzeFeatures_messageUnit_checkPolarity_polarity___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = (void *)MEMORY[0x22A632550]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    if ([v9 type] && objc_msgSend(v9, "type") != 1
      || ([v9 isMatchStringInsideQuotationMarks] & 1) != 0)
    {
      goto LABEL_63;
    }
    id v83 = a4;
    uint64_t v86 = [v9 value];
    id v10 = [v9 contextDictionary];
    int v87 = [v10 objectForKeyedSubscript:@"endDate"];

    id v11 = [v9 contextDictionary];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"endDateTimeZone"];

    if (!v12)
    {
      uint64_t v12 = [MEMORY[0x263EFFA18] systemTimeZone];
    }
    v85 = (void *)v12;
    long long v13 = [v9 contextDictionary];
    long long v14 = [v13 objectForKeyedSubscript:@"allDay"];
    unsigned int obj = [v14 BOOLValue];

    id v15 = [v9 contextDictionary];
    BOOL v16 = [v15 objectForKeyedSubscript:@"prefersAllDay"];
    unsigned int v77 = [v16 BOOLValue];

    uint64_t v17 = [v9 contextDictionary];
    id v18 = [v17 objectForKeyedSubscript:@"timeIsApproximate"];
    int v19 = [v18 BOOLValue];

    id v20 = [v9 contextDictionary];
    id v21 = [v20 objectForKeyedSubscript:@"timeNeedsMeridianGuess"];
    unsigned int v75 = [v21 BOOLValue];

    id v22 = [v9 contextDictionary];
    uint64_t v23 = [v22 objectForKeyedSubscript:@"dateTimeIsTenseDependent"];
    unsigned int v79 = [v23 BOOLValue];

    uint64_t v24 = [v9 contextDictionary];
    id v25 = [v24 objectForKeyedSubscript:@"dateIsTimeOnlyAndReferrengingToSentDate"];
    unsigned int v74 = [v25 BOOLValue];

    id v26 = [v9 contextDictionary];
    id v27 = [v26 objectForKeyedSubscript:@"isTimeOffset"];
    unsigned int v73 = [v27 BOOLValue];

    id v28 = [v9 contextDictionary];
    id v29 = [v28 objectForKeyedSubscript:@"dateOnlyContainsTimeInformation"];
    char v30 = [v29 BOOLValue];

    long long v31 = [v9 contextDictionary];
    unint64_t v32 = [v31 objectForKeyedSubscript:@"isDateRange"];
    char v84 = [v32 BOOLValue];

    BOOL v33 = [v9 contextDictionary];
    BOOL v34 = [v33 objectForKeyedSubscript:@"extractedInSubject"];
    uint64_t v35 = [v34 BOOLValue];

    unsigned int v76 = v19;
    if (v87) {
      int v36 = v19;
    }
    else {
      int v36 = 1;
    }
    int v71 = v36;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      char v37 = v30;
    }
    else {
      char v37 = 0;
    }
    uint64_t v38 = [v86 compare:*(void *)(a1 + 32)];
    uint64_t v39 = v86;
    if ((v37 & 1) != 0 || v38 == -1)
    {
      if (IPDebuggingModeEnabled_once != -1) {
        dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_535);
      }
      a4 = v83;
      if (IPDebuggingModeEnabled_sEnabled)
      {
        BOOL v43 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          BOOL v43 = _IPLogHandle;
        }
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          id v44 = v43;
          double v45 = [v9 matchString];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v45;
          _os_log_impl(&dword_225684000, v44, OS_LOG_TYPE_INFO, "Skip date:%@ #FeatureManager", buf, 0xCu);
        }
      }
      goto LABEL_62;
    }
    char v92 = 0;
    *(void *)buf = 1;
    if (*(unsigned char *)(a1 + 96))
    {
      if (*(unsigned char *)(a1 + 97)) {
        char v40 = 0;
      }
      else {
        char v40 = v35;
      }
      if (v40) {
        goto LABEL_38;
      }
      if (([*(id *)(a1 + 40) isEventProposalOrConfirmationFromFeatures:*(void *)(a1 + 48) fromFeatureAtIndex:a3 messageUnit:*(void *)(a1 + 56) eventIsTenseDependent:v79 extractedFromSubject:v35 extractedPolarity:buf polarityInfluencedByIpsosPlistRef:&v92] & 1) == 0)
      {
        if (v92)
        {
          char v41 = *(void **)(a1 + 40);
          uint64_t v42 = -21;
LABEL_39:
          [v41 setResultType:v42];
LABEL_61:
          a4 = v83;
LABEL_62:
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v84;

LABEL_63:
          goto LABEL_64;
        }
LABEL_38:
        char v41 = *(void **)(a1 + 40);
        uint64_t v42 = -20;
        goto LABEL_39;
      }
    }
    else
    {
      *(void *)buf = *(void *)(a1 + 88);
      if ((*(void *)buf & 0xFFFFFFFFFFFFFFFELL) != 2) {
        goto LABEL_38;
      }
    }
    int v46 = (void *)MEMORY[0x263F04B90];
    uint64_t v47 = [*(id *)(a1 + 64) result];
    int v48 = [v46 eventWithEventStore:v47];

    objc_msgSend(v48, "setIpsos_eventAttributes:", 0);
    double v49 = [*(id *)(a1 + 56) originalMessage];
    LODWORD(v47) = [v49 isGroupConversation];

    if (v47) {
      objc_msgSend(v48, "setIpsos_eventAttributes:", objc_msgSend(v48, "ipsos_eventAttributes") | 8);
    }
    unsigned int v72 = v71 | obj;
    uint64_t v50 = [*(id *)(a1 + 56) originalMessage];
    int v51 = [v50 isSenderSignificant];

    uint64_t v52 = v87;
    v53 = v85;
    if (v51) {
      objc_msgSend(v48, "setIpsos_eventAttributes:", objc_msgSend(v48, "ipsos_eventAttributes") | 0x100);
    }
    id v95 = v9;
    uint64_t v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v95 count:1];
    objc_msgSend(v48, "setIpsos_dataFeatures:", v54);

    objc_msgSend(v48, "setIpsos_messageUnit:", *(void *)(a1 + 56));
    objc_msgSend(v48, "setIpsos_eventStatus:", objc_msgSend(*(id *)(a1 + 40), "eventStatusFromPolarity:", *(void *)buf));
    if (v87)
    {
      if (!obj) {
        goto LABEL_47;
      }
    }
    else
    {
      if (!obj)
      {
        if ([*(id *)(a1 + 40) isDateAroundNoon:v86]) {
          double v56 = 3600.0;
        }
        else {
          double v56 = 7200.0;
        }
        uint64_t v52 = [v86 dateByAddingTimeInterval:v56];
        goto LABEL_47;
      }
      uint64_t v52 = [v86 dateByAddingTimeInterval:1.0];
    }

    uint64_t v55 = [v52 dateByAddingTimeInterval:-1.0];

    v53 = 0;
    uint64_t v52 = (void *)v55;
LABEL_47:
    [v48 setStartTimeZone:v53];
    v85 = v53;
    [v48 setEndTimeZone:v53];
    [v48 setAllDay:obj];
    [v48 setStartDate:v86];
    int v87 = v52;
    [v48 setEndDate:v52];
    objc_msgSend(v48, "setIpsos_isTimeApproximate:", v76);
    objc_msgSend(v48, "setIpsos_isEndTimeApproximate:", v72);
    objc_msgSend(v48, "setIpsos_timeNeedsMeridianGuess:", v75);
    objc_msgSend(v48, "setIpsos_isDateTimeTenseDependent:", v79);
    objc_msgSend(v48, "setIpsos_isEventTimeOnlyAndReferrengingToSentDate:", v74);
    objc_msgSend(v48, "setIpsos_isTimeOffset:", v73);
    objc_msgSend(v48, "setIpsos_eventClassificationType:", 0);
    objc_msgSend(v48, "setIpsos_allDayPreferred:", v77);
    id v94 = v9;
    uint64_t v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v94 count:1];
    objc_msgSend(v48, "setIpsos_dataFeatures:", v57);

    objc_msgSend(v48, "setIpsos_messageUnit:", *(void *)(a1 + 56));
    v58 = (void *)MEMORY[0x263F04B38];
    uint64_t v59 = [*(id *)(a1 + 64) result];
    v60 = [v58 calendarForEntityType:0 eventStore:v59];
    [v48 setCalendar:v60];

    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v48];
    uint64_t v61 = [*(id *)(a1 + 40) _nearbyFeatureDatas:*(void *)(a1 + 48) fromFeatureAtIndex:a3 messageUnit:*(void *)(a1 + 56)];
    v62 = [*(id *)(a1 + 40) extractedNotesStrings];
    int v63 = [*(id *)(a1 + 40) notesStringsFromDataFeatures:v61];
    [v62 addObjectsFromArray:v63];

    int v64 = [MEMORY[0x263EFF980] array];
    uint64_t v80 = (void *)v61;
    [v64 addObjectsFromArray:v61];
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id obja = [v64 reverseObjectEnumerator];
    uint64_t v65 = [obja countByEnumeratingWithState:&v88 objects:v93 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v89;
      int v78 = v64;
      while (2)
      {
        for (uint64_t i = 0; i != v66; ++i)
        {
          if (*(void *)v89 != v67) {
            objc_enumerationMutation(obja);
          }
          uint64_t v69 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          if ([v69 type] == 3
            || [v69 type] == 7
            || [v69 type] == 12
            || [v69 type] == 13)
          {
            uint64_t v70 = [*(id *)(a1 + 40) cleanedStringForFeatureData:v69];
            [v48 setLocation:v70];

            int v64 = v78;
            goto LABEL_60;
          }
        }
        uint64_t v66 = [obja countByEnumeratingWithState:&v88 objects:v93 count:16];
        int v64 = v78;
        if (v66) {
          continue;
        }
        break;
      }
    }
LABEL_60:

    uint64_t v39 = v86;
    goto LABEL_61;
  }
LABEL_64:
  if (a3 == 100) {
    *a4 = 1;
  }
}

- (unint64_t)eventStatusFromPolarity:(unint64_t)a3
{
  if (a3 - 2 >= 3) {
    return 0;
  }
  else {
    return a3 - 1;
  }
}

- (id)decoratedTitleFromEventType:(id)a3 title:(id)a4 sender:(id)a5 recipients:(id)a6 isSent:(BOOL)a7 isTitleSenderDecorated:(BOOL *)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if ((unint64_t)[v17 count] < 2)
  {
    if (v9)
    {
      id v19 = [v17 firstObject];
    }
    else
    {
      id v19 = v16;
    }
    id v20 = v19;
    if (v19)
    {
      id v21 = [(IPFeatureScanner *)self shortNameForPerson:v19];
      if (([v21 containsString:@"+"] & 1) == 0 && objc_msgSend(v21, "integerValue") <= 0)
      {
        uint64_t v22 = [v14 decoratedTitleFromTitle:v15 participantName:v21 isTitleSenderDecorated:a8];

        id v15 = (id)v22;
      }
    }
    id v18 = v15;
  }
  else
  {
    id v18 = v15;
  }

  return v18;
}

- (NSArray)bodyMessageUnits
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBodyMessageUnits:(id)a3
{
}

- (NSMutableArray)bodyAllFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBodyAllFeatures:(id)a3
{
}

- (NSMutableArray)bodyDataDetectorsFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBodyDataDetectorsFeatures:(id)a3
{
}

- (NSMutableArray)bodyKeywordFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBodyKeywordFeatures:(id)a3
{
}

- (NSMutableArray)bodySentenceFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBodySentenceFeatures:(id)a3
{
}

- (NSMutableArray)detectedEvents
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)stitchedEvents
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStitchedEvents:(id)a3
{
}

- (NSArray)filteredDetectedEvents
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFilteredDetectedEvents:(id)a3
{
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(int64_t)a3
{
  self->_resultType = a3;
}

- (NSMutableSet)extractedNotesStrings
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExtractedNotesStrings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedNotesStrings, 0);
  objc_storeStrong((id *)&self->_filteredDetectedEvents, 0);
  objc_storeStrong((id *)&self->_stitchedEvents, 0);
  objc_storeStrong((id *)&self->_detectedEvents, 0);
  objc_storeStrong((id *)&self->_bodySentenceFeatures, 0);
  objc_storeStrong((id *)&self->_bodyKeywordFeatures, 0);
  objc_storeStrong((id *)&self->_bodyDataDetectorsFeatures, 0);
  objc_storeStrong((id *)&self->_bodyAllFeatures, 0);
  objc_storeStrong((id *)&self->_bodyMessageUnits, 0);
}

@end