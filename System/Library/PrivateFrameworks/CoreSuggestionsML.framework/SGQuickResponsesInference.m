@interface SGQuickResponsesInference
+ (id)dynamicIndicesAndTopIsDynamic:(id)a3 config:(id)a4;
+ (id)dynamicLabelForScore:(id)a3 config:(id)a4;
+ (id)languageForLocale:(id)a3 withLanguageDetectionForMessage:(id)a4;
+ (id)normalizeLabelScores:(id)a3;
+ (id)normalizeStringForDeduping:(id)a3;
+ (id)proactiveTriggerForDynamicLabel:(id)a3 context:(id)a4 language:(id)a5;
+ (id)proactiveTriggerForDynamicLabel:(id)a3 context:(id)a4 language:(id)a5 useContactNames:(BOOL)a6;
+ (id)quickResponsesForMessage:(id)a3 context:(id)a4 time:(id)a5 maxResponses:(unint64_t)a6 locale:(id)a7 recipientHandles:(id)a8 chunkPath:(id)a9 plistPath:(id)a10 espressoBinFilePath:(id)a11 vocabFilePath:(id)a12 includeCustomResponses:(BOOL)a13 includeResponsesToRobots:(BOOL)a14;
+ (id)quickResponsesForMessage:(id)a3 conversationTurns:(id)a4 maxResponses:(unint64_t)a5 localeIdentifier:(id)a6 recipientHandles:(id)a7 chunkPath:(id)a8 plistPath:(id)a9 espressoBinFilePath:(id)a10 vocabFilePath:(id)a11 useContactNames:(BOOL)a12 includeCustomResponses:(BOOL)a13 includeResponsesToRobots:(BOOL)a14;
+ (id)stringsForQuickResponses:(id)a3;
+ (void)registerDisplayedQuickResponses:(id)a3 plistPath:(id)a4 vocabPath:(id)a5;
+ (void)registerResponse:(id)a3 position:(id)a4 isCanned:(BOOL)a5 isUsingQuickResponses:(BOOL)a6 locale:(id)a7 plistPath:(id)a8 vocabPath:(id)a9;
- (SGQuickResponsesInference)initWithLanguage:(id)a3 chunkPath:(id)a4 plistPath:(id)a5 espressoBinFilePath:(id)a6 vocabFilePath:(id)a7;
- (SGQuickResponsesInference)initWithLanguage:(id)a3 plistPath:(id)a4 espressoBinFilePath:(id)a5 vocabFilePath:(id)a6 storeDirectory:(id)a7;
- (SGQuickResponsesInference)initWithModel:(id)a3 ranking:(id)a4 personalization:(id)a5 rng:(id)a6 store:(id)a7;
- (id)_getMergedPromptForMessage:(id)a3 conversationTurns:(id)a4;
- (id)addCustomResponsesToCommonResponses:(id)a3 language:(id)a4 locale:(id)a5 recipient:(id)a6 modelScores:(id)a7 maxResponses:(unint64_t)a8 customResponsesParams:(id)a9;
- (id)customResponsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 context:(id)a5 language:(id)a6 locale:(id)a7 recipients:(id)a8;
- (id)quickResponsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationHistory:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 locale:(id)a9 recipients:(id)a10 useContactNames:(BOOL)a11 includeCustomResponses:(BOOL)a12 includeResponsesToRobots:(BOOL)a13;
- (id)quickResponsesFromReplyPositions:(id)a3 isConfident:(BOOL)a4 config:(id)a5;
- (id)randomizedReplyPositionsForSemanticClass:(unint64_t)a3 responseCount:(unint64_t)a4 config:(id)a5;
- (id)replyPositionsForSemanticClass:(unint64_t)a3 responseCount:(unint64_t)a4 config:(id)a5;
- (id)replyPositionsFromSemanticClasses:(id)a3 config:(id)a4;
- (id)scoresAndIsConfidentForMessage:(id)a3 language:(id)a4 locale:(id)a5;
- (id)signpostedQuickResponsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationHistory:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 locale:(id)a9 recipients:(id)a10 useContactNames:(BOOL)a11 includeCustomResponses:(BOOL)a12 includeResponsesToRobots:(BOOL)a13;
@end

@implementation SGQuickResponsesInference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rng, 0);
  objc_storeStrong((id *)&self->_personalization, 0);
  objc_storeStrong((id *)&self->_ranking, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (id)customResponsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 context:(id)a5 language:(id)a6 locale:(id)a7 recipients:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v15)
  {
    v55 = [MEMORY[0x263F08690] currentHandler];
    [v55 handleFailureInMethod:a2, self, @"SGQuickResponsesInference.m", 887, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  v20 = [(SGQuickResponsesModel *)self->_model config];
  v21 = v20;
  if (v15
    && ([v20 customResponsesParameters],
        v22 = objc_claimAutoreleasedReturnValue(),
        v22,
        v22))
  {
    v23 = [(SGQuickResponsesInference *)self scoresAndIsConfidentForMessage:v15 language:v17 locale:v18];
    v24 = v23;
    if (v23)
    {
      id v58 = v17;
      v63 = v19;
      unint64_t v60 = a4;
      v25 = [v23 modelScores];
      v26 = [v24 normalizedModelScores];
      v27 = [v21 customResponsesParameters];
      int v28 = [v27 useNonNegativeClassesOnly];

      v59 = v26;
      if (v28)
      {
        id v29 = v26;

        v25 = v29;
      }
      v30 = [v21 customResponsesParameters];
      id v17 = v58;
      v61 = v24;
      id v62 = v16;
      if (v63 && [v63 count] == 1)
      {
        uint64_t v31 = [v63 firstObject];
      }
      else
      {
        uint64_t v31 = 0;
      }
      store = self->_store;
      [v30 distanceThreshold];
      float v35 = v34;
      [v30 countExponent];
      float v37 = v36;
      [v30 minDecayedCountForPrediction];
      float v39 = v38;
      uint64_t v40 = [v30 compatibilityVersion];
      char v41 = [v30 allowProfanity];
      [v30 minimumTimeIntervalSecs];
      double v43 = v42;
      [v30 usageSpreadExponent];
      *(float *)&double v45 = v44;
      LOBYTE(v56) = v41;
      v57 = v25;
      *(float *)&double v44 = v35;
      *(float *)&double v46 = v37;
      *(float *)&double v47 = v39;
      v48 = [(SGQuickResponsesStore *)store nearestCustomResponsesAndScoresToPromptEmbedding:v25 recipient:v31 limit:v60 withinRadius:v40 responseCountExponent:v58 minimumDecayedCount:v18 compatibilityVersion:v44 language:v46 locale:v47 allowProfanity:v43 minimumTimeInterval:v45 usageSpreadExponent:v56];
      v49 = objc_opt_new();
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __107__SGQuickResponsesInference_customResponsesForMessage_maximumResponses_context_language_locale_recipients___block_invoke;
      v64[3] = &unk_2647EA540;
      id v50 = v49;
      id v65 = v50;
      v66 = v30;
      id v51 = v30;
      [v48 enumerateObjectsUsingBlock:v64];
      v52 = (void *)v31;
      v53 = v66;
      id v32 = v50;

      v24 = v61;
      id v16 = v62;
      id v19 = v63;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error obtaining scores for message.", buf, 2u);
      }
      id v32 = 0;
    }
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

void __107__SGQuickResponsesInference_customResponsesForMessage_maximumResponses_context_language_locale_recipients___block_invoke(uint64_t a1, void *a2)
{
  v15[3] = *MEMORY[0x263EF8340];
  v3 = *(void **)(a1 + 32);
  v14[0] = @"reply";
  id v4 = a2;
  v5 = [v4 first];
  v15[0] = v5;
  v14[1] = @"distance";
  v6 = [v4 second];
  v15[1] = v6;
  v14[2] = @"confident";
  v7 = NSNumber;
  v8 = [v4 second];

  [v8 doubleValue];
  double v10 = v9;
  [*(id *)(a1 + 40) distanceThreshold];
  v12 = [v7 numberWithInt:v10 < v11];
  v15[2] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  [v3 addObject:v13];
}

- (id)addCustomResponsesToCommonResponses:(id)a3 language:(id)a4 locale:(id)a5 recipient:(id)a6 modelScores:(id)a7 maxResponses:(unint64_t)a8 customResponsesParams:(id)a9
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if ([v20 isCustomResponsesEnabled])
  {
    v61 = v15;
    v21 = sgSignpostHandle();
    int ptr = 7;
    os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, &ptr);

    v23 = sgSignpostHandle();
    v24 = v23;
    unint64_t v58 = v22 - 1;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "AddCustomResponses", "Start", buf, 2u);
    }
    os_signpost_id_t spid = v22;

    store = self->_store;
    [v20 distanceThreshold];
    float v27 = v26;
    [v20 countExponent];
    float v29 = v28;
    [v20 minDecayedCountForPrediction];
    float v31 = v30;
    uint64_t v32 = [v20 compatibilityVersion];
    char v33 = [v20 allowProfanity];
    [v20 minimumTimeIntervalSecs];
    double v35 = v34;
    [v20 usageSpreadExponent];
    *(float *)&double v37 = v36;
    LOBYTE(v55) = v33;
    id v59 = v18;
    *(float *)&double v36 = v27;
    *(float *)&double v38 = v29;
    *(float *)&double v39 = v31;
    id v60 = v17;
    uint64_t v40 = [(SGQuickResponsesStore *)store nearestCustomResponsesToPromptEmbedding:v19 recipient:v18 limit:a8 withinRadius:v32 responseCountExponent:v16 minimumDecayedCount:v17 compatibilityVersion:v36 language:v38 locale:v39 allowProfanity:v35 minimumTimeInterval:v37 usageSpreadExponent:v55];
    char v41 = objc_opt_new();
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v42 = v40;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v63 != v45) {
            objc_enumerationMutation(v42);
          }
          BYTE2(v56) = 1;
          LOWORD(v56) = 1;
          double v47 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:]([SGQuickResponse alloc], "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:", *(void *)(*((void *)&v62 + 1) + 8 * i), v16, -1, -1, -1, -1, -1, v56, spid);
          [v41 addObject:v47];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v44);
    }

    if ([v41 count])
    {
      id v15 = v61;
      if ([v41 count] < a8 && objc_msgSend(v61, "count"))
      {
        [v61 enumerateObjectsUsingBlock:&__block_literal_global_144];
        v48 = [v41 arrayByAddingObjectsFromArray:v61];
        v49 = +[SGDeduperML bucketerWithMapping:&__block_literal_global_148];
        id v50 = +[SGDeduperML dedupe:v48 bucketer:v49 resolver:&__block_literal_global_151];
      }
      else
      {
        id v50 = (id)[v41 copy];
      }
      id v18 = v59;
      if ([v50 count] > a8)
      {
        uint64_t v51 = objc_msgSend(v50, "subarrayWithRange:", 0, a8);

        id v50 = (id)v51;
      }
      id v17 = v60;
      v52 = sgSignpostHandle();
      v53 = v52;
      if (v58 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_226E32000, v53, OS_SIGNPOST_INTERVAL_END, spid, "AddCustomResponses", "Completed", buf, 2u);
      }
    }
    else
    {
      id v15 = v61;
      id v50 = v61;
      id v18 = v59;
      id v17 = v60;
    }
  }
  else
  {
    id v50 = v15;
  }

  return v50;
}

id __138__SGQuickResponsesInference_addCustomResponsesToCommonResponses_language_locale_recipient_modelScores_maxResponses_customResponsesParams___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  v3 = [a2 objectAtIndexedSubscript:0];
  id v4 = [v2 arrayWithObject:v3];

  return v4;
}

id __138__SGQuickResponsesInference_addCustomResponsesToCommonResponses_language_locale_recipient_modelScores_maxResponses_customResponsesParams___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 text];
  v3 = +[SGQuickResponsesInference normalizeStringForDeduping:v2];

  return v3;
}

uint64_t __138__SGQuickResponsesInference_addCustomResponsesToCommonResponses_language_locale_recipient_modelScores_maxResponses_customResponsesParams___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsConfident:1];
}

- (id)quickResponsesFromReplyPositions:(id)a3 isConfident:(BOOL)a4 config:(id)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  double v9 = v8;
  if (v7)
  {
    long long v62 = [v8 language];
    id v63 = (id)objc_opt_new();
    double v10 = [v9 replies];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v52 = v9;
      v12 = [v9 replies];
      id v60 = [v12 replyTextParent];
      id v59 = [v12 styleGroupParent];
      unint64_t v58 = [v12 semanticClassParent];
      v57 = [v12 models];
      id v61 = v12;
      uint64_t v56 = [v12 replyTexts];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v53 = v7;
      obuint64_t j = v7;
      uint64_t v13 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v65 != v15) {
              objc_enumerationMutation(obj);
            }
            id v17 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            id v18 = [v17 first];
            uint64_t v19 = [v18 unsignedIntegerValue];

            id v20 = [v17 second];
            uint64_t v21 = [v20 unsignedIntegerValue];

            os_signpost_id_t v22 = [v61 semanticClassReplyTexts];
            v23 = [v22 objectAtIndexedSubscript:v19];
            v24 = [v23 firstObject];
            uint64_t v25 = [v24 unsignedIntegerValue];

            uint64_t v26 = v25 + v21;
            float v27 = [v60 objectAtIndexedSubscript:v25 + v21];
            uint64_t v28 = [v27 unsignedIntegerValue];

            float v29 = [v59 objectAtIndexedSubscript:v28];
            uint64_t v30 = [v29 unsignedIntegerValue];

            float v31 = [v58 objectAtIndexedSubscript:v30];
            uint64_t v32 = [v31 unsignedIntegerValue];

            char v33 = [v57 objectAtIndexedSubscript:v32];
            uint64_t v34 = [v33 category];

            double v35 = [v56 objectAtIndexedSubscript:v26];
            BYTE2(v51) = a4;
            LOWORD(v51) = 0;
            double v36 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:]([SGQuickResponse alloc], "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:", v35, v62, v26, v28, v30, v32, v34, v51);
            [v63 addObject:v36];
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
        }
        while (v14);
      }

      double v9 = v52;
      id v7 = v53;
    }
    else
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v61 = v7;
      uint64_t v37 = [v61 countByEnumeratingWithState:&v68 objects:v73 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        id v54 = v7;
        uint64_t v39 = *(void *)v69;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v69 != v39) {
              objc_enumerationMutation(v61);
            }
            char v41 = *(void **)(*((void *)&v68 + 1) + 8 * j);
            id v42 = [v41 first];
            uint64_t v43 = [v42 unsignedIntegerValue];

            uint64_t v44 = [v41 second];
            uint64_t v45 = [v44 unsignedIntegerValue];

            double v46 = [v9 replies];
            double v47 = [v46 replyTextsForIndex:v43];
            v48 = [v47 objectAtIndexedSubscript:v45];

            BYTE2(v51) = a4;
            LOWORD(v51) = 0;
            v49 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:]([SGQuickResponse alloc], "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:", v48, v62, -1, -1, v43, -1, -1, v51);
            [v63 addObject:v49];
          }
          uint64_t v38 = [v61 countByEnumeratingWithState:&v68 objects:v73 count:16];
        }
        while (v38);
        id v7 = v54;
      }
    }
  }
  else
  {
    id v63 = 0;
  }

  return v63;
}

- (id)randomizedReplyPositionsForSemanticClass:(unint64_t)a3 responseCount:(unint64_t)a4 config:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a5;
  double v9 = objc_opt_new();
  double v10 = [NSNumber numberWithUnsignedInteger:a3];
  double v11 = [v8 replies];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v13 = [v8 replies];
  uint64_t v14 = v13;
  if (isKindOfClass)
  {
    id v33 = v8;
    uint64_t v15 = [v13 semanticClassStyleGroups];
    uint64_t v32 = [v15 objectAtIndexedSubscript:a3];

    id v16 = [v14 styleGroupReplyTexts];
    id v17 = [v14 semanticClassReplyTexts];
    id v18 = [v17 objectAtIndexedSubscript:a3];
    uint64_t v19 = [v18 firstObject];
    uint64_t v20 = [v19 unsignedIntegerValue];

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __91__SGQuickResponsesInference_randomizedReplyPositionsForSemanticClass_responseCount_config___block_invoke;
    v34[3] = &unk_2647EA4F8;
    id v21 = v16;
    id v35 = v21;
    double v36 = self;
    uint64_t v39 = v20;
    id v22 = v9;
    id v37 = v22;
    id v38 = v10;
    [v32 enumerateObjectsUsingBlock:v34];
    +[SGRandomization shuffleMutableArray:v22 withRng:self->_rng];
    if ([v22 count] <= a4) {
      a4 = [v22 count];
    }
    objc_msgSend(v22, "subarrayWithRange:", 0, a4);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    id v8 = v33;
  }
  else
  {
    unint64_t v24 = [v13 replyCountForIndex:a3];

    if (v24 >= a4) {
      unint64_t v25 = a4;
    }
    else {
      unint64_t v25 = v24;
    }
    uint64_t v14 = +[SGRandomization shuffledSamplingWithoutReplacementForK:v25 fromN:v24 withRng:self->_rng];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v26 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v41 != v28) {
            objc_enumerationMutation(v14);
          }
          uint64_t v30 = (void *)[objc_alloc(MEMORY[0x263F61EA8]) initWithFirst:v10 second:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          [v9 addObject:v30];
        }
        uint64_t v27 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v27);
    }
    id v23 = v9;
  }

  return v23;
}

void __91__SGQuickResponsesInference_randomizedReplyPositionsForSemanticClass_responseCount_config___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint32_t v3 = [v11 count];
  id v4 = *(void **)(*(void *)(a1 + 40) + 40);
  if (v4) {
    unint64_t v5 = [v4 next] % (unint64_t)v3;
  }
  else {
    unint64_t v5 = arc4random_uniform(v3);
  }
  v6 = [v11 objectAtIndexedSubscript:v5];
  uint64_t v7 = [v6 unsignedIntegerValue];

  id v8 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v7 - *(void *)(a1 + 64)];
  double v9 = *(void **)(a1 + 48);
  double v10 = (void *)[objc_alloc(MEMORY[0x263F61EA8]) initWithFirst:*(void *)(a1 + 56) second:v8];
  [v9 addObject:v10];
}

- (id)replyPositionsForSemanticClass:(unint64_t)a3 responseCount:(unint64_t)a4 config:(id)a5
{
  id v7 = a5;
  id v8 = objc_opt_new();
  double v9 = [NSNumber numberWithUnsignedInteger:a3];
  double v10 = [v7 replies];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v12 = [v7 replies];
  uint64_t v13 = v12;
  if (isKindOfClass)
  {
    id v39 = v7;
    uint64_t v14 = [v12 semanticClassStyleGroups];
    uint64_t v15 = [v14 objectAtIndexedSubscript:a3];

    id v16 = [v13 styleGroupReplyTexts];
    if ([v15 count] <= a4) {
      a4 = [v15 count];
    }
    id v17 = objc_msgSend(v13, "semanticClassReplyTexts", v13);
    id v18 = [v17 objectAtIndexedSubscript:a3];
    uint64_t v19 = [v18 firstObject];
    uint64_t v41 = [v19 unsignedIntegerValue];

    if (a4)
    {
      uint64_t v20 = 0;
      unint64_t v40 = a4;
      do
      {
        id v21 = [v15 objectAtIndexedSubscript:v20];
        id v22 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v21, "unsignedIntegerValue"));
        id v23 = [v22 firstObject];
        unint64_t v24 = v9;
        unint64_t v25 = v8;
        uint64_t v26 = v16;
        uint64_t v27 = v15;
        uint64_t v28 = [v23 unsignedIntegerValue];

        id v29 = objc_alloc(NSNumber);
        uint64_t v30 = v28 - v41;
        uint64_t v15 = v27;
        id v16 = v26;
        id v8 = v25;
        double v9 = v24;
        float v31 = (void *)[v29 initWithUnsignedInteger:v30];
        uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F61EA8]) initWithFirst:v24 second:v31];
        [v8 addObject:v32];

        ++v20;
      }
      while (v40 != v20);
    }

    id v7 = v39;
  }
  else
  {
    if ([v12 replyCountForIndex:a3] <= a4)
    {
      id v33 = [v7 replies];
      a4 = [v33 replyCountForIndex:a3];
    }
    if (a4)
    {
      uint64_t v34 = 0;
      do
      {
        id v35 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v34];
        double v36 = (void *)[objc_alloc(MEMORY[0x263F61EA8]) initWithFirst:v9 second:v35];
        [v8 addObject:v36];

        ++v34;
      }
      while (a4 != v34);
    }
  }

  return v8;
}

- (id)replyPositionsFromSemanticClasses:(id)a3 config:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v33 = v7;
    id v8 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v32 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v15 = [v8 objectForKeyedSubscript:v14];
          uint64_t v16 = [v15 unsignedIntegerValue] + 1;

          id v17 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v16];
          [v8 setObject:v17 forKeyedSubscript:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v11);
    }

    id v18 = objc_opt_new();
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __70__SGQuickResponsesInference_replyPositionsFromSemanticClasses_config___block_invoke;
    v39[3] = &unk_2647EA4D0;
    id v40 = v33;
    uint64_t v41 = self;
    id v19 = v18;
    id v42 = v19;
    [v8 enumerateKeysAndObjectsUsingBlock:v39];
    uint64_t v20 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v9;
    uint64_t v21 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v35 + 1) + 8 * j);
          uint64_t v26 = [v19 objectForKeyedSubscript:v25];
          uint64_t v27 = [v8 objectForKeyedSubscript:v25];
          uint64_t v28 = [v27 unsignedIntegerValue];

          id v29 = objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v26, "count") - v28);
          [v20 addObject:v29];
          uint64_t v30 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v28 - 1];
          [v8 setObject:v30 forKeyedSubscript:v25];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v22);
    }

    id v6 = v32;
    id v7 = v33;
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

void __70__SGQuickResponsesInference_replyPositionsFromSemanticClasses_config___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 unsignedIntegerValue];
  uint64_t v8 = [v5 unsignedIntegerValue];

  id v9 = [*(id *)(a1 + 32) predictionParams];
  int v10 = [v9 isPersonalizationDisabled];

  if (v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) predictionParams];
    int v12 = [v11 isReplyTextRandomized];

    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(a1 + 40);
    if (v12)
    {
      uint64_t v15 = [v13 randomizedReplyPositionsForSemanticClass:v7 responseCount:v8 config:v14];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(*(void *)(a1 + 40) + 32);
  }
  uint64_t v15 = [v13 replyPositionsForSemanticClass:v7 responseCount:v8 config:v14];
LABEL_6:
  id v16 = (id)v15;
  [*(id *)(a1 + 48) setObject:v15 forKeyedSubscript:v6];
}

- (id)quickResponsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationHistory:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 locale:(id)a9 recipients:(id)a10 useContactNames:(BOOL)a11 includeCustomResponses:(BOOL)a12 includeResponsesToRobots:(BOOL)a13
{
  uint64_t v170 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v156 = a5;
  id v154 = a6;
  id v153 = a7;
  id v155 = a8;
  id v20 = a9;
  id v159 = a10;
  uint64_t v21 = (void *)MEMORY[0x22A66BDC0]();
  v158 = v19;
  if (v19)
  {
    uint64_t v22 = [(SGQuickResponsesModel *)self->_model config];
    context = v21;
    uint64_t v23 = self;
    if (v20)
    {
      unint64_t v24 = +[SGLanguageDetection languageForLocaleIdentifier:v20];
    }
    else
    {
      unint64_t v24 = 0;
    }
    uint64_t v25 = v155;
    if (v24) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = v155;
    }
    id v27 = v26;

    uint64_t v28 = sgLogHandle();
    os_signpost_id_t v29 = os_signpost_id_generate(v28);

    uint64_t v30 = sgLogHandle();
    float v31 = v30;
    unint64_t v32 = v29 - 1;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "QuickResponsesForMessageRobo", " enableTelemetry=YES ", buf, 2u);
    }

    if (a13)
    {
      id v33 = v158;
      id v34 = +[SGQuickResponsesToRobots repliesToRobot:v158 language:v27 recipients:v159];
      if ([v34 count])
      {
        long long v35 = sgLogHandle();
        long long v36 = v35;
        if (v32 > 0xFFFFFFFFFFFFFFFDLL)
        {
          long long v44 = v156;
          long long v45 = v159;
          long long v37 = v35;
          goto LABEL_109;
        }
        long long v37 = v35;
        if (os_signpost_enabled(v35))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_226E32000, v36, OS_SIGNPOST_INTERVAL_END, v29, "QuickResponsesForMessageRobo", (const char *)&unk_226E6BA6D, buf, 2u);
        }
LABEL_38:
        long long v44 = v156;
        long long v45 = v159;
LABEL_109:

        uint64_t v21 = context;
        goto LABEL_110;
      }
    }
    long long v38 = sgLogHandle();
    id v39 = v38;
    if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v39, OS_SIGNPOST_INTERVAL_END, v29, "QuickResponsesForMessageRobo", (const char *)&unk_226E6BA6D, buf, 2u);
    }

    id v40 = [v22 language];
    long long v37 = v40;
    id v33 = v158;
    if (v27 && ([v40 isEqualToString:v27] & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v167 = (unint64_t)v20;
        __int16 v168 = 2112;
        v169 = v37;
        _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot predict for locale %@ using model with language %@", buf, 0x16u);
      }
      id v34 = 0;
      goto LABEL_38;
    }
    v150 = v37;
    uint64_t v41 = [(SGQuickResponsesModel *)self->_model config];
    id v42 = [v41 predictionParams];
    unint64_t v43 = [v42 maxPromptLength];

    if ([v158 length] > v43)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v167 = v43;
        _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_INFO, "Returning nil because message length exceeds maximum length %ld)", buf, 0xCu);
      }
      id v34 = 0;
      long long v44 = v156;
      long long v45 = v159;
      long long v37 = v150;
      goto LABEL_109;
    }
    long long v44 = v156;
    if (!v156)
    {
      long long v46 = +[SGConversationTracker instance];
      double v47 = (void *)[objc_alloc(MEMORY[0x263F38248]) initWithText:v158 senderID:v154 timestamp:v153];
      long long v44 = [v46 addMessage:v47];
    }
    v146 = [(SGQuickResponsesInference *)v23 _getMergedPromptForMessage:v158 conversationTurns:v44];
    v48 = -[SGQuickResponsesInference scoresAndIsConfidentForMessage:language:locale:](v23, "scoresAndIsConfidentForMessage:language:locale:");
    long long v37 = v150;
    v144 = v48;
    if (!v48)
    {
      long long v45 = v159;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error obtaining scores for message.", buf, 2u);
      }
      id v34 = 0;
      goto LABEL_108;
    }
    uint64_t v49 = v48;
    p_isa = (id *)&v23->super.isa;
    v157 = v44;
    id v50 = [v48 modelScores];
    v145 = [v49 normalizedModelScores];
    unint64_t v51 = a4;
    if (!a4)
    {
      v52 = [v22 predictionParams];
      unint64_t v51 = [v52 defaultResponsesToReturn];
    }
    id v53 = [v22 replies];
    v148 = v50;
    if (v51 >= [v53 maxDistinctReplies])
    {
      id v54 = [v22 replies];
      unint64_t v51 = [v54 maxDistinctReplies];

      id v50 = v148;
    }

    uint64_t v55 = [v22 predictionParams];
    if ([v55 hasNegativeClass])
    {
      uint64_t v56 = [v50 objectAtIndexedSubscript:0];
      [v56 doubleValue];
      double v58 = v57;
      id v59 = [v22 predictionParams];
      [v59 negativeClassMaximumToPredict];
      BOOL v61 = v58 >= v60;

      long long v37 = v150;
      id v50 = v148;
    }
    else
    {
      BOOL v61 = 0;
    }
    unint64_t v140 = v51;

    if (v145) {
      long long v62 = v145;
    }
    else {
      long long v62 = v50;
    }
    id v63 = +[SGQuickResponsesScoring sortedWithUnweightedScores:v62 config:v22];
    long long v64 = [v63 objectAtIndexedSubscript:0];
    [v64 value];
    double v66 = v65;
    long long v67 = [v22 predictionParams];
    [v67 minToShowThreshold];
    double v69 = v68;

    int v70 = v66 < v69 || v61;
    int v141 = v70;
    long long v71 = sgLogHandle();
    os_signpost_id_t v72 = os_signpost_id_generate(v71);

    v73 = sgLogHandle();
    uint64_t v74 = v73;
    unint64_t v136 = v72 - 1;
    if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226E32000, v74, OS_SIGNPOST_INTERVAL_BEGIN, v72, "QuickResponsesForMessageTriggers", " enableTelemetry=YES ", buf, 2u);
    }
    os_signpost_id_t spid = v72;

    v75 = v63;
    v76 = [(id)objc_opt_class() dynamicIndicesAndTopIsDynamic:v63 config:v22];
    v77 = [v22 predictionParams];
    int v78 = [v77 dynamicLabelsEnabled];

    id v33 = v158;
    v139 = v76;
    if (!v78) {
      goto LABEL_67;
    }
    v79 = [v76 second];
    if ([v79 BOOLValue])
    {
      [v75 objectAtIndexedSubscript:0];
      v80 = v142 = v79;
      [v80 value];
      double v82 = v81;
      v83 = [v22 predictionParams];
      [v83 minToShowThreshold];
      double v85 = v84;

      if (v82 < v85)
      {
LABEL_67:
        v104 = [v76 first];
        v138 = v104;
        if ([v104 count])
        {
          v87 = v75;
          v105 = (void *)[v75 mutableCopy];
          [v105 removeObjectsAtIndexes:v104];
          v106 = [v22 predictionParams];
          v107 = [v106 modelTypeName];
          int v108 = [v107 isEqualToString:@"quickResponsesEspressoClassifierMultiLabel"];

          if (v108)
          {
            uint64_t v109 = [(id)objc_opt_class() normalizeLabelScores:v105];

            v87 = (void *)v109;
          }
          unint64_t v110 = v140;
          unint64_t v111 = v136;

          long long v37 = v150;
        }
        else
        {
          v87 = v75;
          unint64_t v110 = v140;
          unint64_t v111 = v136;
        }
        v112 = sgLogHandle();
        v113 = v112;
        if (v111 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v112))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_226E32000, v113, OS_SIGNPOST_INTERVAL_END, spid, "QuickResponsesForMessageTriggers", (const char *)&unk_226E6BA6D, buf, 2u);
        }

        v143 = [p_isa[3] resultsForModelScores:v87 responseCount:v110 config:v22];
        v137 = objc_msgSend(p_isa, "replyPositionsFromSemanticClasses:config:");
        v114 = objc_msgSend(p_isa, "quickResponsesFromReplyPositions:isConfident:config:");
        if (v159 && [v159 count] == 1)
        {
          v149 = [v159 firstObject];
        }
        else
        {
          v149 = 0;
        }
        v115 = sgLogHandle();
        os_signpost_id_t v116 = os_signpost_id_generate(v115);

        v117 = sgLogHandle();
        v118 = v117;
        if (v116 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v117))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_226E32000, v118, OS_SIGNPOST_INTERVAL_BEGIN, v116, "QuickResponsesForMessageCustom", " enableTelemetry=YES ", buf, 2u);
        }

        if (a12)
        {
          v119 = [v22 customResponsesParameters];
          int v120 = [v119 useNonNegativeClassesOnly];

          if (v120)
          {
            id v121 = v145;

            v148 = v121;
          }
          long long v37 = v150;
          if (v114)
          {
            if (v148)
            {
              v122 = [v22 customResponsesParameters];

              if (v122)
              {
                v123 = [v22 customResponsesParameters];
                uint64_t v124 = [p_isa addCustomResponsesToCommonResponses:v114 language:v155 locale:v20 recipient:v149 modelScores:v148 maxResponses:v140 customResponsesParams:v123];

                v114 = (void *)v124;
                uint64_t v25 = v155;
              }
            }
          }
        }
        v125 = sgLogHandle();
        v126 = v125;
        if (v116 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v125))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_226E32000, v126, OS_SIGNPOST_INTERVAL_END, v116, "QuickResponsesForMessageCustom", (const char *)&unk_226E6BA6D, buf, 2u);
        }

        id v33 = v158;
        if ([v114 count] == a4)
        {
          v127 = [v22 predictionParams];
          int v128 = v141 & [v127 filterNonConfident];

          if (v128 == 1)
          {
            long long v162 = 0u;
            long long v163 = 0u;
            long long v160 = 0u;
            long long v161 = 0u;
            id v34 = v114;
            uint64_t v129 = [v34 countByEnumeratingWithState:&v160 objects:v164 count:16];
            if (v129)
            {
              uint64_t v130 = v129;
              uint64_t v131 = *(void *)v161;
LABEL_96:
              uint64_t v132 = 0;
              while (1)
              {
                if (*(void *)v161 != v131) {
                  objc_enumerationMutation(v34);
                }
                if ([*(id *)(*((void *)&v160 + 1) + 8 * v132) isCustomResponse]) {
                  break;
                }
                if (v130 == ++v132)
                {
                  uint64_t v130 = [v34 countByEnumeratingWithState:&v160 objects:v164 count:16];
                  if (v130) {
                    goto LABEL_96;
                  }
                  goto LABEL_102;
                }
              }
            }
            else
            {
LABEL_102:

              id v34 = 0;
            }
            uint64_t v25 = v155;
            long long v37 = v150;
          }
          else
          {
            id v34 = v114;
            uint64_t v25 = v155;
          }
        }
        else
        {
          id v34 = 0;
        }

        long long v44 = v157;
        goto LABEL_107;
      }
      v86 = objc_opt_class();
      v87 = v75;
      v88 = [v75 objectAtIndexedSubscript:0];
      v79 = [v86 dynamicLabelForScore:v88 config:v22];

      if (v79)
      {
        uint64_t v89 = [(id)objc_opt_class() proactiveTriggerForDynamicLabel:v79 context:v146 language:v155 useContactNames:a11];
        if (v89)
        {
          v90 = (void *)v89;
          v143 = v79;
          v91 = sgQuicktypeLogHandle();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            v92 = [v87 objectAtIndexedSubscript:0];
            [v92 value];
            *(_DWORD *)buf = 138412546;
            unint64_t v167 = (unint64_t)v90;
            __int16 v168 = 2048;
            v169 = v93;
            _os_log_impl(&dword_226E32000, v91, OS_LOG_TYPE_DEFAULT, "QuickResponses - trigger: %@, score: %f", buf, 0x16u);
          }
          v94 = [SGQuickResponse alloc];
          v95 = [v87 objectAtIndexedSubscript:0];
          [v95 value];
          double v97 = v96;
          v98 = [v22 predictionParams];
          [v98 minToShowThreshold];
          v138 = v90;
          uint64_t v100 = [(SGQuickResponse *)v94 initWithProactiveTrigger:v90 isConfident:v97 >= v99];

          v101 = sgLogHandle();
          v102 = v101;
          if (v136 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_226E32000, v102, OS_SIGNPOST_INTERVAL_END, spid, "QuickResponsesForMessageTriggers", (const char *)&unk_226E6BA6D, buf, 2u);
          }

          v137 = (void *)v100;
          uint64_t v165 = v100;
          id v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v165 count:1];
          uint64_t v25 = v155;
          long long v44 = v157;
LABEL_107:
          long long v45 = v159;

LABEL_108:
          goto LABEL_109;
        }
      }
      v103 = v139;
    }
    else
    {
      v103 = v76;
    }

    v76 = v103;
    goto LABEL_67;
  }
  v134 = [MEMORY[0x263F08690] currentHandler];
  [v134 handleFailureInMethod:a2, self, @"SGQuickResponsesInference.m", 501, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];

  id v34 = 0;
  long long v44 = v156;
  id v33 = 0;
  uint64_t v25 = v155;
  long long v45 = v159;
LABEL_110:

  return v34;
}

- (id)scoresAndIsConfidentForMessage:(id)a3 language:(id)a4 locale:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SGQuickResponsesModel *)self->_model config];
  int v12 = [(SGQuickResponsesModel *)self->_model config];
  uint64_t v13 = [v12 predictionParams];
  unint64_t v14 = [v13 maxPromptLength];

  if ([v8 length] <= v14)
  {
    id v16 = [(SGQuickResponsesModel *)self->_model config];
    id v17 = [v16 language];

    if (v10)
    {
      id v18 = +[SGLanguageDetection languageForLocaleIdentifier:v10];
    }
    else
    {
      id v18 = 0;
    }
    if (v18) {
      id v19 = v18;
    }
    else {
      id v19 = v9;
    }
    id v20 = v19;

    if (v20 && ([v17 isEqualToString:v20] & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v52 = (unint64_t)v10;
        __int16 v53 = 2112;
        id v54 = v17;
        _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot predict for locale %@ using model with language %@", buf, 0x16u);
      }
      uint64_t v15 = 0;
    }
    else
    {
      id v50 = v17;
      uint64_t v21 = sgLogHandle();
      os_signpost_id_t v22 = os_signpost_id_generate(v21);

      uint64_t v23 = sgLogHandle();
      unint64_t v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_226E32000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "QuickResponsesForMessageFeaturization", " enableTelemetry=YES ", buf, 2u);
      }

      uint64_t v25 = [(SGQuickResponsesModel *)self->_model featuresOf:v8];
      uint64_t v26 = sgLogHandle();
      id v27 = v26;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_226E32000, v27, OS_SIGNPOST_INTERVAL_END, v22, "QuickResponsesForMessageFeaturization", (const char *)&unk_226E6BA6D, buf, 2u);
      }

      if (v25)
      {
        uint64_t v28 = sgLogHandle();
        os_signpost_id_t v29 = os_signpost_id_generate(v28);

        uint64_t v30 = sgLogHandle();
        float v31 = v30;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_226E32000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "QuickResponsesForMessagePrediction", " enableTelemetry=YES ", buf, 2u);
        }

        unint64_t v32 = [(SGQuickResponsesModel *)self->_model predict:v25];
        id v33 = sgLogHandle();
        id v34 = v33;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_226E32000, v34, OS_SIGNPOST_INTERVAL_END, v29, "QuickResponsesForMessagePrediction", (const char *)&unk_226E6BA6D, buf, 2u);
        }

        if (v32)
        {
          long long v35 = [v11 predictionParams];
          int v36 = [v35 hasNegativeClass];

          if (v36)
          {
            double v37 = 0.0;
            if ((unint64_t)[v32 count] >= 2)
            {
              unint64_t v38 = 1;
              do
              {
                id v39 = [v32 objectAtIndexedSubscript:v38];
                [v39 doubleValue];
                double v37 = v37 + v40;

                ++v38;
              }
              while ([v32 count] > v38);
            }
            uint64_t v41 = objc_msgSend(v32, "subarrayWithRange:", 0, objc_msgSend(v32, "count") - 1);
            id v42 = (void *)[v41 mutableCopy];

            [v42 setObject:&unk_26DB015E8 atIndexedSubscript:0];
            if ((unint64_t)[v42 count] >= 2)
            {
              uint64_t v49 = v25;
              unint64_t v43 = 1;
              do
              {
                long long v44 = NSNumber;
                long long v45 = [v42 objectAtIndexedSubscript:v43];
                [v45 doubleValue];
                double v47 = [v44 numberWithDouble:v46 / v37];
                [v42 setObject:v47 atIndexedSubscript:v43];

                ++v43;
              }
              while ([v42 count] > v43);
              uint64_t v25 = v49;
            }
          }
          else
          {
            id v42 = 0;
          }
          uint64_t v15 = +[SGQuickResponsesScores quickResponsesScoresWithModelScores:v32 normalizedModelScores:v42];
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v52 = (unint64_t)v9;
            _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not predict score (prediction for language %@ not supported?)", buf, 0xCu);
          }
          uint64_t v15 = 0;
        }
        id v17 = v50;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v52 = (unint64_t)v9;
          _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_INFO, "Could not featurize (prediction for language %@ not supported?)", buf, 0xCu);
        }
        uint64_t v15 = 0;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v52 = v14;
      _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_INFO, "Returning nil because message length exceeds maximum length %ld)", buf, 0xCu);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)signpostedQuickResponsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationHistory:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 locale:(id)a9 recipients:(id)a10 useContactNames:(BOOL)a11 includeCustomResponses:(BOOL)a12 includeResponsesToRobots:(BOOL)a13
{
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a3;
  uint64_t v25 = sgLogHandle();
  os_signpost_id_t v26 = os_signpost_id_generate(v25);

  id v27 = sgLogHandle();
  uint64_t v28 = v27;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_226E32000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "QuickResponsesForMessage", " enableTelemetry=YES ", buf, 2u);
  }

  BYTE2(v33) = a13;
  BYTE1(v33) = a12;
  LOBYTE(v33) = 1;
  os_signpost_id_t v29 = -[SGQuickResponsesInference quickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:](self, "quickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:", v24, a4, v23, v22, v21, v20, v19, v18, v33);

  uint64_t v30 = sgLogHandle();
  float v31 = v30;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)int v36 = 0;
    _os_signpost_emit_with_name_impl(&dword_226E32000, v31, OS_SIGNPOST_INTERVAL_END, v26, "QuickResponsesForMessage", (const char *)&unk_226E6BA6D, v36, 2u);
  }

  return v29;
}

- (id)_getMergedPromptForMessage:(id)a3 conversationTurns:(id)a4
{
  model = self->_model;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SGQuickResponsesModel *)model config];
  id v9 = [v8 predictionParams];

  uint64_t v10 = [v9 maxPromptLength];
  [v9 maxPromptWindowSeconds];
  double v12 = v11;
  uint64_t v13 = [v9 promptJoiningString];
  unint64_t v14 = +[SGConversationTracker getMergedPromptForMessage:v7 conversationTurns:v6 maxPromptLength:v10 maxPromptWindowSeconds:v13 promptJoiningString:v12];

  return v14;
}

- (SGQuickResponsesInference)initWithLanguage:(id)a3 plistPath:(id)a4 espressoBinFilePath:(id)a5 vocabFilePath:(id)a6 storeDirectory:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (![v17 length])
  {
    uint64_t v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SGQuickResponsesInference.m", 250, @"Invalid parameter not satisfying: %@", @"storeDirectory.length" object file lineNumber description];
  }
  id v18 = [[SGQuickResponsesStore alloc] initInDirectory:v17 inMemory:0 withMigration:1];
  if (v18)
  {
    id v19 = +[SGQuickResponsesModel modelForLanguage:v13 mode:1 chunkPath:v15 plistPath:v14 vocabPath:v16];
    id v20 = v19;
    if (v19)
    {
      id v29 = v13;
      id v21 = [v19 config];
      id v22 = [v21 predictionParams];
      int v23 = [v22 isPersonalizationDisabled];

      id v24 = objc_opt_new();
      if (v23)
      {
        self = [(SGQuickResponsesInference *)self initWithModel:v20 ranking:v24 personalization:0 rng:0 store:v18];
      }
      else
      {
        os_signpost_id_t v26 = objc_opt_new();
        self = [(SGQuickResponsesInference *)self initWithModel:v20 ranking:v24 personalization:v26 rng:0 store:v18];
      }
      uint64_t v25 = self;
      id v13 = v29;
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v17;
      _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "QuickResponses: Could not initialize SGQuickResponsesStore in directory - %@", buf, 0xCu);
    }
    uint64_t v25 = 0;
  }

  return v25;
}

- (SGQuickResponsesInference)initWithLanguage:(id)a3 chunkPath:(id)a4 plistPath:(id)a5 espressoBinFilePath:(id)a6 vocabFilePath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[SGQuickResponsesConfig modelTypeAndSubModelKeyForLanguage:v12 plistPath:v14 vocabPath:v16 warmupBlock:&__block_literal_global_418];
  if (v17)
  {
    id v18 = v13;
    id v19 = [v17 first];
    int v20 = [v19 isEqualToString:@"quickResponsesEspressoClassifierMultiLabel"];

    if (v20)
    {
      id v21 = v15;

      id v18 = v21;
    }
    id v22 = +[SGQuickResponsesModel modelForLanguage:v12 mode:1 chunkPath:v18 plistPath:v14 vocabPath:v16 modelTypeAndSubModelKey:v17];
    int v23 = v22;
    if (v22)
    {
      id v31 = v15;
      id v32 = v13;
      id v24 = [v22 config];
      uint64_t v25 = [v24 predictionParams];
      int v26 = [v25 isPersonalizationDisabled];

      id v27 = objc_opt_new();
      if (v26)
      {
        self = [(SGQuickResponsesInference *)self initWithModel:v23 ranking:v27 personalization:0 rng:0 store:0];
      }
      else
      {
        id v29 = objc_opt_new();
        self = [(SGQuickResponsesInference *)self initWithModel:v23 ranking:v27 personalization:v29 rng:0 store:0];
      }
      id v13 = v32;

      uint64_t v28 = self;
      id v15 = v31;
    }
    else
    {
      uint64_t v28 = 0;
    }
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

void __100__SGQuickResponsesInference_initWithLanguage_chunkPath_plistPath_espressoBinFilePath_vocabFilePath___block_invoke()
{
  +[SGQuickResponsesToRobots warmup];
  +[SGQuickResponsesStore warmup];
  SGPersonalizeEmojisWarmup();
}

- (SGQuickResponsesInference)initWithModel:(id)a3 ranking:(id)a4 personalization:(id)a5 rng:(id)a6 store:(id)a7
{
  id v11 = a3;
  id v14 = a3;
  obuint64_t j = a4;
  id v15 = a4;
  id v40 = a5;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_13:
    int v36 = [MEMORY[0x263F08690] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"SGQuickResponsesInference.m", 193, @"Invalid parameter not satisfying: %@", @"ranking" object file lineNumber description];

    if (v16) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  long long v35 = [MEMORY[0x263F08690] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"SGQuickResponsesInference.m", 192, @"Invalid parameter not satisfying: %@", @"model" object file lineNumber description];

  if (!v15) {
    goto LABEL_13;
  }
LABEL_3:
  if (v16) {
    goto LABEL_6;
  }
LABEL_4:
  [v14 config];
  SEL v37 = a2;
  id v19 = v18;
  id v20 = v11;
  id v21 = v14;
  id v22 = self;
  id v23 = v17;
  id v24 = v16;
  int v26 = v25 = v15;
  [v26 predictionParams];
  v27 = id v38 = a6;
  char v28 = [v27 isPersonalizationDisabled];

  a6 = v38;
  id v15 = v25;
  id v16 = v24;
  id v17 = v23;
  self = v22;
  id v14 = v21;
  id v11 = v20;
  id v18 = v19;
  if ((v28 & 1) == 0)
  {
    id v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:v37, self, @"SGQuickResponsesInference.m", 194, @"Invalid parameter not satisfying: %@", @"personalization != nil || model.config.predictionParams.isPersonalizationDisabled" object file lineNumber description];

    a6 = v38;
  }
LABEL_6:
  v41.receiver = self;
  v41.super_class = (Class)SGQuickResponsesInference;
  uint64_t v30 = [(SGQuickResponsesInference *)&v41 init];
  id v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_model, v11);
    objc_storeStrong((id *)&v31->_ranking, obj);
    objc_storeStrong((id *)&v31->_personalization, v40);
    objc_storeStrong((id *)&v31->_rng, a6);
    if (v18)
    {
      id v32 = (SGQuickResponsesStore *)v18;
    }
    else
    {
      id v32 = +[SGQuickResponsesStore sharedInstance];
    }
    store = v31->_store;
    v31->_store = v32;
  }
  return v31;
}

+ (void)registerResponse:(id)a3 position:(id)a4 isCanned:(BOOL)a5 isUsingQuickResponses:(BOOL)a6 locale:(id)a7 plistPath:(id)a8 vocabPath:(id)a9
{
  BOOL v12 = a5;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = (void *)MEMORY[0x22A66BDC0]();
  if (v12 && !a6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_INFO, "SGQuickResponses: attempted to register a canned response but not using QuickResponses.", buf, 2u);
    }
    id v20 = v14;
    goto LABEL_27;
  }
  id v21 = +[SGConversationTracker instance];
  [v21 clear];

  id v20 = _PASRepairString();

  if (v16)
  {
    uint64_t v22 = +[SGLanguageDetection languageForLocaleIdentifier:v16];
    if (v22)
    {
      id v23 = (void *)v22;
      uint64_t v24 = +[SGQuickResponsesModel configForLanguage:v22 mode:1 plistPath:v17 vocabPath:v18];
      id v25 = (void *)v24;
      if (!v24)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v39 = v17;
          __int16 v40 = 2112;
          objc_super v41 = v23;
          _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SGQuickResponses: attempted to register a response but config at %@ is nil (language %@ not supported?).", buf, 0x16u);
        }
        goto LABEL_26;
      }
      SEL v37 = (void *)v24;
      if (v15
        && v12
        && (unint64_t v36 = [v15 unsignedIntegerValue],
            [v25 predictionParams],
            int v26 = objc_claimAutoreleasedReturnValue(),
            unint64_t v27 = [v26 defaultResponsesToReturn],
            v26,
            BOOL v28 = v36 >= v27,
            id v25 = v37,
            v28))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v15;
          id v31 = &_os_log_internal;
          id v32 = "SGQuickResponses: attempted to register a canned response at position %@ that is not likely to have come"
                " from QuickResponses.";
          uint32_t v33 = 12;
          goto LABEL_23;
        }
      }
      else
      {
        id v29 = [v25 predictionParams];
        int v30 = [v29 isPersonalizationDisabled];

        if (!v30)
        {
          id v34 = objc_opt_new();
          long long v35 = v34;
          id v25 = v37;
          if (v12) {
            [v34 registerSelectedResponse:v20 config:v37];
          }
          else {
            [v34 registerWrittenResponse:v20 config:v37];
          }

          goto LABEL_26;
        }
        id v25 = v37;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v31 = &_os_log_internal;
          id v32 = "SGQuickResponses: attempted to register displayed responses but personalization is disabled.";
          uint32_t v33 = 2;
LABEL_23:
          _os_log_impl(&dword_226E32000, v31, OS_LOG_TYPE_INFO, v32, buf, v33);
        }
      }
LABEL_26:

      goto LABEL_27;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SGQuickResponses: attempted to register a response but language is nil.", buf, 2u);
  }
LABEL_27:
}

+ (void)registerDisplayedQuickResponses:(id)a3 plistPath:(id)a4 vocabPath:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x22A66BDC0]();
  if ([v8 count])
  {
    BOOL v12 = [v8 firstObject];
    id v13 = [v12 lang];

    if (v13)
    {
      id v14 = +[SGQuickResponsesModel configForLanguage:v13 mode:1 plistPath:v9 vocabPath:v10];
      id v15 = v14;
      if (v14)
      {
        id v16 = [v14 predictionParams];
        int v17 = [v16 isPersonalizationDisabled];

        if (v17)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
          {
            LOWORD(v20) = 0;
            _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_INFO, "SGQuickResponses: attempted to register displayed responses but personalization is disabled.", (uint8_t *)&v20, 2u);
          }
        }
        else
        {
          id v18 = [a1 stringsForQuickResponses:v8];
          if ([v18 count])
          {
            id v19 = objc_opt_new();
            [v19 registerDisplayedResponses:v18 config:v15];
          }
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        int v20 = 138412290;
        id v21 = v13;
        _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SGQuickResponses: attempted to register displayed responses but config is nil (language %@ not supported?).", (uint8_t *)&v20, 0xCu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SGQuickResponses: attempted to register displayed responses but language is nil.", (uint8_t *)&v20, 2u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v20) = 0;
    _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SGQuickResponses: attempted to register displayed responses with 0 responses.", (uint8_t *)&v20, 2u);
  }
}

+ (id)dynamicLabelForScore:(id)a3 config:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 replies];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [v8 replies];
    BOOL v12 = [v8 predictionParams];
    int v13 = [v12 isPerCategory];

    if (v13)
    {
      id v14 = [v11 categorySemanticClasses];
      id v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "index"));

      if ([v15 count] != 1)
      {
        int v26 = sgQuicktypeLogHandle();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
LABEL_14:

          id v21 = 0;
          goto LABEL_15;
        }
        *(_DWORD *)buf = 134218240;
        uint64_t v31 = [v7 index];
        __int16 v32 = 2048;
        uint64_t v33 = [v15 count];
        unint64_t v27 = "SGQuickResponses: dynamic label (score index %tu) should have one semantic class (count - %tu)!";
LABEL_19:
        _os_log_fault_impl(&dword_226E32000, v26, OS_LOG_TYPE_FAULT, v27, buf, 0x16u);
        goto LABEL_14;
      }
      id v16 = [v15 objectAtIndexedSubscript:0];
      uint64_t v17 = [v16 unsignedIntegerValue];
    }
    else
    {
      uint64_t v17 = [v7 index];
    }
    uint64_t v22 = [v11 semanticClassReplyTexts];
    id v15 = [v22 objectAtIndexedSubscript:v17];

    if ([v15 count] == 1)
    {
      id v23 = [v15 objectAtIndexedSubscript:0];
      uint64_t v24 = [v23 unsignedIntegerValue];

      id v25 = [v11 replyTexts];
      id v21 = [v25 objectAtIndexedSubscript:v24];

      goto LABEL_15;
    }
    int v26 = sgQuicktypeLogHandle();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 134218240;
    uint64_t v31 = [v7 index];
    __int16 v32 = 2048;
    uint64_t v33 = [v15 count];
    unint64_t v27 = "SGQuickResponses: dynamic label (score index %tu) should have one reply text per semantic class (count - %tu)!";
    goto LABEL_19;
  }
  uint64_t v18 = [v7 index];
  id v19 = [v8 replies];
  uint64_t v20 = [v19 replyCountForIndex:v18];

  if (v20 != 1)
  {
    id v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"SGQuickResponsesInference.m", 1125, @"Invalid parameter not satisfying: %@", @"[config.replies replyCountForIndex:semanticClassIndex] == 1" object file lineNumber description];
  }
  id v11 = [v8 replies];
  id v15 = [v11 replyTextsForIndex:v18];
  id v21 = [v15 firstObject];
LABEL_15:

  return v21;
}

+ (id)proactiveTriggerForDynamicLabel:(id)a3 context:(id)a4 language:(id)a5 useContactNames:(BOOL)a6
{
  v41[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (proactiveTriggerForDynamicLabel_context_language_useContactNames__onceToken != -1) {
    dispatch_once(&proactiveTriggerForDynamicLabel_context_language_useContactNames__onceToken, &__block_literal_global_168);
  }
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x3032000000;
  SEL v37 = __Block_byref_object_copy__432;
  id v38 = __Block_byref_object_dispose__433;
  id v39 = &stru_26DAF9368;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__432;
  __int16 v32 = __Block_byref_object_dispose__433;
  id v33 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __94__SGQuickResponsesInference_proactiveTriggerForDynamicLabel_context_language_useContactNames___block_invoke_2;
  v22[3] = &unk_2647EA5B8;
  id v25 = &v28;
  int v26 = &v34;
  BOOL v27 = a6;
  id v12 = v11;
  id v23 = v12;
  id v13 = v10;
  id v24 = v13;
  id v14 = (void (**)(void))MEMORY[0x22A66BFD0](v22);
  id v15 = [(id)proactiveTriggerForDynamicLabel_context_language_useContactNames__triggerForLabel objectForKeyedSubscript:v9];
  if (!v15)
  {
    uint64_t v20 = sgQuicktypeLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_fault_impl(&dword_226E32000, v20, OS_LOG_TYPE_FAULT, "SGQuickResponses: Could not find trigger for dynamic label %@", buf, 0xCu);
    }
LABEL_14:

    id v18 = 0;
    goto LABEL_15;
  }
  if (([v9 isEqualToString:@"thirdPartyPhoneUEhPTkUuM3AK"] & 1) != 0
    || ([v9 isEqualToString:@"thirdPartyEmailRU1BSUwuMXAK"] & 1) != 0
    || [v9 isEqualToString:@"thirdPartyPostalUE9TVEFMLjFwCg"])
  {
    v14[2](v14);
    id v16 = (void *)v29[5];
    if (v16 != (void *)v35[5])
    {
      id v17 = v16;
      id v18 = (id)[v15 mutableCopy];
      v41[0] = proactiveTriggerForDynamicLabel_context_language_useContactNames__givenNameQualifier;
      *(void *)buf = v17;
      id v19 = [NSDictionary dictionaryWithObjects:buf forKeys:v41 count:1];
      [v18 setObject:v19 forKey:proactiveTriggerForDynamicLabel_context_language_useContactNames__qualifiersKey];

      goto LABEL_15;
    }
    uint64_t v20 = sgQuicktypeLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_226E32000, v20, OS_LOG_TYPE_DEFAULT, "SGQuickResponses: No name found for thirdparty dynamic label: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  id v18 = v15;
LABEL_15:

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

void __94__SGQuickResponsesInference_proactiveTriggerForDynamicLabel_context_language_useContactNames___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v2 + 40);
  uint32_t v3 = (id *)(v2 + 40);
  if (!v4)
  {
    objc_storeStrong(v3, *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    BOOL v5 = *(unsigned char *)(a1 + 64) == 0;
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2050000000;
    id v6 = (void *)getSGNameDetectorClass_softClass_434;
    uint64_t v21 = getSGNameDetectorClass_softClass_434;
    if (!getSGNameDetectorClass_softClass_434)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __getSGNameDetectorClass_block_invoke_435;
      v17[3] = &unk_2647EB178;
      v17[4] = &v18;
      __getSGNameDetectorClass_block_invoke_435((uint64_t)v17);
      id v6 = (void *)v19[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v18, 8);
    id v8 = (void *)[[v7 alloc] initWithLanguage:*(void *)(a1 + 32)];
    id v9 = [v8 detectNames:*(void *)(a1 + 40) algorithm:2 * v5];

    if ([v9 count] == 1)
    {
      id v10 = [v9 firstObject];
      id v11 = *(void **)(a1 + 40);
      uint64_t v12 = [v10 range];
      uint64_t v14 = objc_msgSend(v11, "substringWithRange:", v12, v13);
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
}

void __94__SGQuickResponsesInference_proactiveTriggerForDynamicLabel_context_language_useContactNames___block_invoke()
{
  v52[8] = *MEMORY[0x263EF8340];
  uint64_t v31 = (void *)*MEMORY[0x263F511B8];
  uint64_t v30 = (void *)*MEMORY[0x263F511F8];
  v0 = (void *)*MEMORY[0x263F511C0];
  v1 = (void *)*MEMORY[0x263F511A8];
  uint64_t v2 = (void *)*MEMORY[0x263F51238];
  uint32_t v3 = (void *)*MEMORY[0x263F511F0];
  uint64_t v4 = (void *)*MEMORY[0x263F511E8];
  BOOL v5 = (void *)*MEMORY[0x263F51220];
  id v6 = (void *)*MEMORY[0x263F511D0];
  id v7 = (void *)*MEMORY[0x263F51230];
  id v8 = (void *)*MEMORY[0x263F511B0];
  id v9 = (id)*MEMORY[0x263F51200];
  id v10 = (void *)proactiveTriggerForDynamicLabel_context_language_useContactNames__qualifiersKey;
  proactiveTriggerForDynamicLabel_context_language_useContactNames__qualifiersKey = (uint64_t)v9;
  id v34 = v8;
  id v33 = v7;
  id v29 = v6;
  id v11 = v5;
  id v28 = v4;
  id v12 = v3;
  id v13 = v2;
  id v14 = v1;
  id v15 = v0;
  id v16 = v30;
  id v17 = v31;

  objc_storeStrong((id *)&proactiveTriggerForDynamicLabel_context_language_useContactNames__givenNameQualifier, (id)*MEMORY[0x263F511E0]);
  v50[2] = v29;
  v51[0] = @"firstPartyPhoneUEhPTkUuMXAK";
  v49[0] = v17;
  v49[1] = v13;
  v50[0] = v16;
  v50[1] = v12;
  v49[2] = v11;
  __int16 v32 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];
  v52[0] = v32;
  v51[1] = @"firstPartyEmailRU1BSUwuMXAK";
  v47[0] = v17;
  v47[1] = v13;
  v48[0] = v15;
  v48[1] = v12;
  int v26 = v15;
  v47[2] = v11;
  v48[2] = v29;
  BOOL v27 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];
  v52[1] = v27;
  v51[2] = @"firstPartyPostalUE9TVEFMLjFwCg";
  v45[0] = v17;
  v45[1] = v13;
  v46[0] = v14;
  v46[1] = v12;
  v45[2] = v11;
  v46[2] = v29;
  id v25 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
  v52[2] = v25;
  v51[3] = @"thirdPartyPhoneUEhPTkUuM3AK";
  v43[0] = v17;
  v43[1] = v13;
  v44[0] = v16;
  v44[1] = v12;
  v43[2] = v11;
  v44[2] = v33;
  id v24 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];
  v52[3] = v24;
  v51[4] = @"thirdPartyEmailRU1BSUwuMXAK";
  v41[0] = v17;
  v41[1] = v13;
  v42[0] = v15;
  v42[1] = v12;
  void v41[2] = v11;
  v42[2] = v33;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
  v52[4] = v18;
  v51[5] = @"thirdPartyPostalUE9TVEFMLjFwCg";
  v39[0] = v17;
  v39[1] = v13;
  v40[0] = v14;
  v40[1] = v12;
  v39[2] = v11;
  v40[2] = v33;
  id v19 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
  v52[5] = v19;
  v51[6] = @"firstPartyLocTE9DLjFwCg";
  v37[0] = v13;
  v37[1] = v11;
  v38[0] = v28;
  v38[1] = v34;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  v52[6] = v20;
  v51[7] = @"photoSharingUEhPVE8K";
  id v35 = v13;
  uint64_t v36 = @"photosharing";
  uint64_t v21 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  v52[7] = v21;
  uint64_t v22 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:8];
  id v23 = (void *)proactiveTriggerForDynamicLabel_context_language_useContactNames__triggerForLabel;
  proactiveTriggerForDynamicLabel_context_language_useContactNames__triggerForLabel = v22;
}

+ (id)proactiveTriggerForDynamicLabel:(id)a3 context:(id)a4 language:(id)a5
{
  return +[SGQuickResponsesInference proactiveTriggerForDynamicLabel:a3 context:a4 language:a5 useContactNames:1];
}

+ (id)normalizeLabelScores:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v5 = 0;
    double v6 = 0.0;
    do
    {
      id v7 = [v3 objectAtIndexedSubscript:v5];
      [v7 value];
      double v6 = v6 + v8;

      ++v5;
    }
    while (v5 < [v3 count]);
  }
  else
  {
    double v6 = 0.0;
  }
  if ([v3 count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = [SGQuickResponsesClassScore alloc];
      id v11 = [v3 objectAtIndexedSubscript:v9];
      [v11 value];
      double v13 = v12 / v6;
      id v14 = [v3 objectAtIndexedSubscript:v9];
      id v15 = -[SGQuickResponsesClassScore initWithValue:index:](v10, "initWithValue:index:", [v14 index], v13);
      [v4 setObject:v15 atIndexedSubscript:v9];

      ++v9;
    }
    while (v9 < [v3 count]);
  }

  return v4;
}

+ (id)dynamicIndicesAndTopIsDynamic:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__432;
  __int16 v32 = __Block_byref_object_dispose__433;
  id v33 = 0;
  id v33 = (id)objc_opt_new();
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__432;
  int v26 = __Block_byref_object_dispose__433;
  id v27 = (id)MEMORY[0x263EFFA80];
  id v7 = [v6 replies];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v9 = [v6 replies];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__SGQuickResponsesInference_dynamicIndicesAndTopIsDynamic_config___block_invoke_2;
    v13[3] = &unk_2647EA590;
    id v14 = v6;
    id v10 = v9;
    id v15 = v10;
    id v16 = &v28;
    id v17 = &v22;
    [v5 enumerateObjectsUsingBlock:v13];
    id v11 = [MEMORY[0x263F61EA8] tupleWithFirst:v29[5] second:v23[5]];
  }
  else
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __66__SGQuickResponsesInference_dynamicIndicesAndTopIsDynamic_config___block_invoke;
    v18[3] = &unk_2647EA568;
    id v19 = v6;
    uint64_t v20 = &v28;
    uint64_t v21 = &v22;
    [v5 enumerateObjectsUsingBlock:v18];
    id v11 = [MEMORY[0x263F61EA8] tupleWithFirst:v29[5] second:v23[5]];
    id v10 = v19;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v11;
}

void __66__SGQuickResponsesInference_dynamicIndicesAndTopIsDynamic_config___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v5 = (void *)a1[4];
  id v6 = a2;
  id v7 = [v5 replies];
  uint64_t v8 = [v6 index];

  id v11 = [v7 replyTextForIndex:v8 position:0];

  if (+[SGQuickResponsesDynamicLabelSet isDynamicLabel:v11])
  {
    [*(id *)(*(void *)(a1[5] + 8) + 40) addIndex:a3];
    if (!a3)
    {
      uint64_t v9 = *(void *)(a1[6] + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = MEMORY[0x263EFFA88];
    }
  }
}

void __66__SGQuickResponsesInference_dynamicIndicesAndTopIsDynamic_config___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 predictionParams];
  int v8 = [v7 isPerCategory];

  uint64_t v9 = *(void **)(a1 + 40);
  if (v8)
  {
    id v10 = [v9 categoryModels];
    uint64_t v11 = [v6 index];

    double v12 = [v10 objectAtIndexedSubscript:v11];
    id v19 = [v12 objectAtIndexedSubscript:0];
  }
  else
  {
    id v10 = [v9 semanticClassParent];
    uint64_t v13 = [v6 index];

    id v19 = [v10 objectAtIndexedSubscript:v13];
  }

  id v14 = [*(id *)(a1 + 40) models];
  id v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v19, "unsignedIntegerValue"));
  int v16 = [v15 dynamicLabel];

  if (v16)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addIndex:a3];
    if (!a3)
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = MEMORY[0x263EFFA88];
    }
  }
}

+ (id)normalizeStringForDeduping:(id)a3
{
  return (id)[a3 lowercaseString];
}

+ (id)quickResponsesForMessage:(id)a3 conversationTurns:(id)a4 maxResponses:(unint64_t)a5 localeIdentifier:(id)a6 recipientHandles:(id)a7 chunkPath:(id)a8 plistPath:(id)a9 espressoBinFilePath:(id)a10 vocabFilePath:(id)a11 useContactNames:(BOOL)a12 includeCustomResponses:(BOOL)a13 includeResponsesToRobots:(BOOL)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  if ([v23 length] || objc_msgSend(v25, "length"))
  {
    id v40 = v19;
    context = (void *)MEMORY[0x22A66BDC0]();
    id v27 = +[SGLanguageDetection languageForLocaleIdentifier:v21];
    uint64_t v28 = [[SGQuickResponsesInference alloc] initWithLanguage:v27 chunkPath:v23 plistPath:v24 espressoBinFilePath:v25 vocabFilePath:v26];
    unint64_t v29 = a5;
    id v30 = v23;
    id v31 = v26;
    id v32 = v25;
    id v33 = v24;
    id v34 = v20;
    id v35 = v28;
    BYTE2(v38) = a14;
    LOWORD(v38) = __PAIR16__(a13, a12);
    uint64_t v36 = -[SGQuickResponsesInference signpostedQuickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:](v28, "signpostedQuickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:", v40, v29, v34, 0, 0, v27, v21, v22, v38);

    id v20 = v34;
    id v24 = v33;
    id v25 = v32;
    id v26 = v31;
    id v23 = v30;

    id v19 = v40;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Required model file(s) not specified.", buf, 2u);
    }
    uint64_t v36 = 0;
  }

  return v36;
}

+ (id)quickResponsesForMessage:(id)a3 context:(id)a4 time:(id)a5 maxResponses:(unint64_t)a6 locale:(id)a7 recipientHandles:(id)a8 chunkPath:(id)a9 plistPath:(id)a10 espressoBinFilePath:(id)a11 vocabFilePath:(id)a12 includeCustomResponses:(BOOL)a13 includeResponsesToRobots:(BOOL)a14
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v37 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  context = (void *)MEMORY[0x22A66BDC0]();
  id v24 = _PASRepairString();
  id v25 = +[SGQuickResponsesInference languageForLocale:v18 withLanguageDetectionForMessage:v24];
  uint64_t v36 = v20;
  if (v25)
  {
    id v26 = [[SGQuickResponsesInference alloc] initWithLanguage:v25 chunkPath:v20 plistPath:v21 espressoBinFilePath:v22 vocabFilePath:v23];
    id v27 = v26;
    if (v26)
    {
      BYTE2(v33) = a14;
      BYTE1(v33) = a13;
      LOBYTE(v33) = 1;
      uint64_t v28 = v19;
      id v32 = v19;
      unint64_t v29 = v17;
      id v30 = -[SGQuickResponsesInference signpostedQuickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:](v26, "signpostedQuickResponsesForMessage:maximumResponses:conversationHistory:context:time:language:locale:recipients:useContactNames:includeCustomResponses:includeResponsesToRobots:", v24, a6, 0, v37, v17, v25, v18, v32, v33);
    }
    else
    {
      uint64_t v28 = v19;
      unint64_t v29 = v17;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v25;
        _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_INFO, "Could not find inference model (an error occurred, or possibly prediction for language %@ not supported)", buf, 0xCu);
      }
      id v30 = 0;
    }
  }
  else
  {
    uint64_t v28 = v19;
    unint64_t v29 = v17;
    id v30 = 0;
  }

  return v30;
}

+ (id)stringsForQuickResponses:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "text", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)languageForLocale:(id)a3 withLanguageDetectionForMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "QuickResponses: No message was passed in.", buf, 2u);
    }
    goto LABEL_13;
  }
  if (![v6 length])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v14 = 0;
      _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_INFO, "QuickResponses: Message length 0 passed in, ignoring.", v14, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v5)
  {
LABEL_8:
    id v10 = +[SGLanguageDetection languageForLocaleIdentifier:v5];

    goto LABEL_15;
  }
  uint64_t v8 = (void *)MEMORY[0x22A66BDC0]();
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long v13 = 0;
    _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "QuickResponses: No locale was passed in.", v13, 2u);
  }
  uint64_t v9 = +[SGLanguageDetection detectLanguageFromText:v7];
  if (v9)
  {
    id v5 = (id)v9;
    goto LABEL_8;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long v12 = 0;
    _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "QuickResponses: No language was detected from the message.", v12, 2u);
  }
LABEL_14:
  id v10 = 0;
LABEL_15:

  return v10;
}

@end