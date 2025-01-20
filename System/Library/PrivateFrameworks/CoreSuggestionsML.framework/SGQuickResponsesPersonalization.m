@interface SGQuickResponsesPersonalization
+ (id)augmentRecords:(id)a3 semanticClass:(unint64_t)a4 config:(id)a5;
+ (id)deduplicatedReplyTextsForReplyPositions:(id)a3 semanticClass:(unint64_t)a4 responseCount:(unint64_t)a5 config:(id)a6;
- (SGQuickResponsesPersonalization)init;
- (SGQuickResponsesPersonalization)initWithStore:(id)a3 withRng:(id)a4;
- (id)replyPositionsForSemanticClass:(unint64_t)a3 responseCount:(unint64_t)a4 config:(id)a5;
- (id)sortedReplyPositionsForSemanticClass:(unint64_t)a3 config:(id)a4;
- (void)registerDisplayedResponses:(id)a3 config:(id)a4;
- (void)registerSelectedResponse:(id)a3 config:(id)a4;
- (void)registerWrittenResponse:(id)a3 config:(id)a4;
@end

@implementation SGQuickResponsesPersonalization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rng, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)registerWrittenResponse:(id)a3 config:(id)a4
{
  v6 = (void *)MEMORY[0x263F08708];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 whitespaceAndNewlineCharacterSet];
  id v16 = [v8 stringByTrimmingCharactersInSet:v9];

  v10 = +[SGQuickResponsesReplies normalizeReplyText:v16];
  v11 = [v7 replies];
  v12 = [v11 normalizedReplyTextsSet];
  uint64_t v13 = [v12 containsObject:v10];

  store = self->_store;
  v15 = [v7 language];

  [(SGQuickResponsesStore *)store addWrittenToResponse:v10 language:v15 isMatch:v13];
}

- (void)registerSelectedResponse:(id)a3 config:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SGQuickResponsesReplies normalizeReplyText:v6];
  v9 = [v7 replies];
  v10 = [v9 normalizedReplyTextsSet];
  char v11 = [v10 containsObject:v8];

  if (v11)
  {
    store = self->_store;
    uint64_t v13 = [v7 language];
    [(SGQuickResponsesStore *)store addSelectedToResponse:v8 language:v13];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "No reply text string exists in config for selected response: %@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)registerDisplayedResponses:(id)a3 config:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v19 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v12 = +[SGQuickResponsesReplies normalizeReplyText:v11];
        uint64_t v13 = [v6 replies];
        int v14 = [v13 normalizedReplyTextsSet];
        char v15 = [v14 containsObject:v12];

        if (v15)
        {
          [v19 addObject:v12];
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = v11;
          _os_log_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_INFO, "No reply text string exists in config for displayed response: %@", buf, 0xCu);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }

  store = self->_store;
  v17 = [v6 language];
  [(SGQuickResponsesStore *)store addDisplayedToResponses:v19 language:v17];
}

- (id)sortedReplyPositionsForSemanticClass:(unint64_t)a3 config:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [v6 replies];
  uint64_t v8 = [v7 replyTextsForIndex:a3];

  store = self->_store;
  v10 = [v6 language];
  uint64_t v11 = [(SGQuickResponsesStore *)store recordsForResponsesInternal:v8 language:v10];

  if (v11)
  {
    v12 = +[SGQuickResponsesPersonalization augmentRecords:v11 semanticClass:a3 config:v6];

    uint64_t v13 = +[SGQuickResponsesReplyOption sortedReplyOptionsForRecords:v12 config:v6];
    int v14 = [v6 predictionParams];
    int v15 = [v14 isReplyTextRandomized];

    if (v15) {
      +[SGRandomization shuffleMutableArray:v13 inApproxEqualEpsilon:&__block_literal_global_118 withValueBlock:self->_rng withRng:0.000001];
    }
    uint64_t v16 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v13;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "position", (void)v24);
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

double __79__SGQuickResponsesPersonalization_sortedReplyPositionsForSemanticClass_config___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 ucb];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)replyPositionsForSemanticClass:(unint64_t)a3 responseCount:(unint64_t)a4 config:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(SGQuickResponsesPersonalization *)self sortedReplyPositionsForSemanticClass:a3 config:v8];
  if (!v9)
  {
    v10 = [v8 replies];
    uint64_t v11 = [v10 replyCountForIndex:a3];

    uint64_t v9 = +[SGRandomization shuffledSamplingWithoutReplacementForK:v11 fromN:v11 withRng:self->_rng];
  }
  v12 = +[SGQuickResponsesPersonalization deduplicatedReplyTextsForReplyPositions:v9 semanticClass:a3 responseCount:a4 config:v8];

  return v12;
}

- (SGQuickResponsesPersonalization)initWithStore:(id)a3 withRng:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGQuickResponsesPersonalization;
  id v8 = [(SGQuickResponsesPersonalization *)&v12 init];
  if (v8)
  {
    if (v6)
    {
      uint64_t v9 = (SGQuickResponsesStore *)v6;
    }
    else
    {
      uint64_t v9 = +[SGQuickResponsesStore sharedInstance];
    }
    store = v8->_store;
    v8->_store = v9;

    objc_storeStrong((id *)&v8->_rng, a4);
  }

  return v8;
}

- (SGQuickResponsesPersonalization)init
{
  return [(SGQuickResponsesPersonalization *)self initWithStore:0 withRng:0];
}

+ (id)augmentRecords:(id)a3 semanticClass:(unint64_t)a4 config:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v8 replies];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v11 = [v8 replies];
    objc_super v12 = [v11 semanticClassSelectedPseudocounts];
    uint64_t v13 = [v12 objectAtIndexedSubscript:a4];
  }
  else
  {
    uint64_t v13 = 0;
  }
  int v14 = objc_opt_new();
  int v15 = [v8 predictionParams];
  [v15 personalizationDisplayedPseudocount];
  double v17 = v16;

  uint64_t v18 = [v8 predictionParams];
  [v18 personalizationSelectedPseudocountPerSemanticClass];
  double v20 = v19;

  long long v21 = [v7 replyRecords];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    unint64_t v23 = 0;
    do
    {
      long long v24 = [v7 replyRecords];
      long long v25 = [v24 objectAtIndexedSubscript:v23];

      double v26 = v20;
      if (v13)
      {
        long long v27 = [v13 objectAtIndexedSubscript:v23];
        [v27 doubleValue];
        double v26 = v20 * v28;
      }
      [v25 selected];
      double v30 = v26 + v29;
      [v25 matched];
      double v32 = v26 + v31;
      v33 = [SGQuickResponsesReplyRecord alloc];
      [v25 displayed];
      v35 = [(SGQuickResponsesReplyRecord *)v33 initWithDisplayed:v17 + v34 selected:v30 matched:v32];
      [v14 addObject:v35];

      ++v23;
      v36 = [v7 replyRecords];
      unint64_t v37 = [v36 count];
    }
    while (v23 < v37);
  }
  v38 = [v8 replies];
  unint64_t v39 = [v38 replyTextCount];

  v40 = [v8 replies];
  unint64_t v41 = [v40 replyClassCount];

  v42 = [SGQuickResponsesRecords alloc];
  [v7 totalOpportunities];
  double v44 = v43 + v17 * (double)v41;
  [v7 totalDisplayed];
  double v46 = v45 + v17 * (double)v39;
  [v7 totalSelected];
  double v48 = v47 + v20 * (double)v41;
  [v7 totalMatched];
  double v50 = v49 + v20 * (double)v41;
  [v7 totalUnmatched];
  v52 = [(SGQuickResponsesRecords *)v42 initWithReplyRecords:v14 totalOpportunities:v44 totalDisplayed:v46 totalSelected:v48 totalMatched:v50 totalUnmatched:v51 + v17 * (double)v39 - v20 * (double)v41];

  return v52;
}

+ (id)deduplicatedReplyTextsForReplyPositions:(id)a3 semanticClass:(unint64_t)a4 responseCount:(unint64_t)a5 config:(id)a6
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  id v55 = (id)objc_opt_new();
  v54 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v11 = [v10 replies];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v50 = v10;
    uint64_t v13 = [v10 replies];
    int v14 = [v13 semanticClassStyleGroups];
    int v15 = [v14 objectAtIndexedSubscript:a4];

    double v16 = [v13 semanticClassReplyTexts];
    double v17 = [v16 objectAtIndexedSubscript:a4];

    double v49 = v13;
    v57 = [v13 replyTextParent];
    uint64_t v18 = [v15 firstObject];
    uint64_t v56 = [v18 unsignedIntegerValue];

    double v48 = v15;
    uint64_t v19 = [v15 count];
    double v20 = [v17 firstObject];
    uint64_t v21 = [v20 unsignedIntegerValue];

    double v47 = v17;
    unint64_t v22 = [v17 count];
    for (uint64_t i = objc_opt_new(); v19; --v19)
    {
      long long v24 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:0];
      [i addObject:v24];
    }
    if (v22 >= a5) {
      unint64_t v25 = a5;
    }
    else {
      unint64_t v25 = v22;
    }
    id v51 = v9;
    unint64_t v52 = v25;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = v9;
    uint64_t v26 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      unint64_t v28 = 0;
      uint64_t v29 = *(void *)v59;
LABEL_9:
      uint64_t v30 = 0;
      while (1)
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(obj);
        }
        double v31 = *(void **)(*((void *)&v58 + 1) + 8 * v30);
        double v32 = objc_msgSend(v57, "objectAtIndexedSubscript:", objc_msgSend(v31, "unsignedIntegerValue") + v21);
        uint64_t v33 = [v32 unsignedIntegerValue];

        uint64_t v34 = v33 - v56;
        v35 = [i objectAtIndexedSubscript:v33 - v56];
        uint64_t v36 = [v35 unsignedIntegerValue];

        if (!v36)
        {
          unint64_t v37 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:1];
          [i setObject:v37 atIndexedSubscript:v34];

          v38 = (void *)[objc_alloc(MEMORY[0x263F61EA8]) initWithFirst:v54 second:v31];
          [v55 addObject:v38];
          ++v28;

          if (v28 >= v52) {
            break;
          }
        }
        if (v27 == ++v30)
        {
          uint64_t v27 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
          if (v27) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    id v10 = v50;
    id v9 = v51;
  }
  else
  {
    uint64_t v39 = [v9 count];
    if (a5 && v39)
    {
      unint64_t v40 = 1;
      do
      {
        id v41 = objc_alloc(MEMORY[0x263F61EA8]);
        v42 = [v9 objectAtIndexedSubscript:v40 - 1];
        double v43 = (void *)[v41 initWithFirst:v54 second:v42];

        [v55 addObject:v43];
        unint64_t v44 = [v9 count];
        if (v40 >= a5) {
          break;
        }
      }
      while (v40++ < v44);
    }
  }

  return v55;
}

@end