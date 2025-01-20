@interface SGQuickResponsesRanking
- (SGQuickResponsesRanking)initWithSeed:(unint64_t)a3;
- (id)classResultsForScores:(id)a3 numResponses:(id)a4 responseCount:(unint64_t)a5 config:(id)a6;
- (id)indexesForScores:(id)a3 numResponses:(id)a4;
- (id)resultsForModelScores:(id)a3 responseCount:(unint64_t)a4 config:(id)a5;
- (id)semanticClassesForCategory:(unint64_t)a3 responseCount:(unint64_t)a4 configReplies:(id)a5;
- (id)semanticClassesForResults:(id)a3 scores:(id)a4 numResponses:(id)a5 config:(id)a6;
@end

@implementation SGQuickResponsesRanking

- (void).cxx_destruct
{
}

- (id)semanticClassesForCategory:(unint64_t)a3 responseCount:(unint64_t)a4 configReplies:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = [v8 categorySemanticClasses];
  v10 = [v9 objectAtIndexedSubscript:a3];

  v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v10];
  +[SGRandomization shuffleMutableArray:v11 withRng:self->_rng];
  if ([v11 count] >= a4)
  {
    v23 = objc_msgSend(v11, "subarrayWithRange:", 0, a4);
  }
  else
  {
    v25 = self;
    unint64_t v26 = a4;
    v12 = objc_opt_new();
    id v28 = v8;
    v13 = [v8 semanticClasses];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v27 = v10;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v20 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v19, "unsignedIntegerValue", v25));
          uint64_t v21 = [v20 count] - 1;

          for (; v21; --v21)
            [v12 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v16);
    }

    +[SGRandomization shuffleMutableArray:v12 withRng:v25->_rng];
    v22 = objc_msgSend(v12, "subarrayWithRange:", 0, v26 - objc_msgSend(v11, "count"));
    v23 = [v11 arrayByAddingObjectsFromArray:v22];

    v10 = v27;
    id v8 = v28;
  }

  return v23;
}

- (id)semanticClassesForResults:(id)a3 scores:(id)a4 numResponses:(id)a5 config:(id)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v13 predictionParams];
  char v15 = [v14 isPerCategory];

  if ((v15 & 1) != 0
    && ([v13 replies],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v16,
        (isKindOfClass & 1) != 0))
  {
    id v40 = v13;
    v18 = [v13 replies];
    v19 = [v18 categoryModels];
    uint64_t v20 = [v19 count];

    uint64_t v21 = objc_opt_new();
    v22 = objc_opt_new();
    uint64_t v23 = [objc_alloc(NSNumber) initWithUnsignedInteger:0];
    if (v20)
    {
      uint64_t v24 = MEMORY[0x263EFFA68];
      do
      {
        [v21 addObject:v24];
        [v22 addObject:v23];
        --v20;
      }
      while (v20);
    }
    v39 = (void *)v23;
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __80__SGQuickResponsesRanking_semanticClassesForResults_scores_numResponses_config___block_invoke;
    v49[3] = &unk_2647EB270;
    id v42 = v11;
    id v50 = v11;
    id v25 = v21;
    id v51 = v25;
    v52 = self;
    id v38 = v18;
    id v53 = v38;
    id v41 = v12;
    [v12 enumerateObjectsUsingBlock:v49];
    id v26 = (id)objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v43 = v10;
    id obj = v10;
    uint64_t v27 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = [*(id *)(*((void *)&v45 + 1) + 8 * i) unsignedIntegerValue];
          long long v32 = [v22 objectAtIndexedSubscript:v31];
          uint64_t v33 = [v32 unsignedIntegerValue];

          uint64_t v34 = [v25 objectAtIndexedSubscript:v31];
          v35 = [v34 objectAtIndexedSubscript:v33];

          v36 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v33 + 1];
          [v22 setObject:v36 atIndexedSubscript:v31];

          [v26 addObject:v35];
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v28);
    }

    id v11 = v42;
    id v10 = v43;
    id v13 = v40;
    id v12 = v41;
  }
  else
  {
    id v26 = v10;
  }

  return v26;
}

void __80__SGQuickResponsesRanking_semanticClassesForResults_scores_numResponses_config___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v8 = [v7 index];

  uint64_t v9 = [v6 unsignedIntegerValue];
  id v10 = [*(id *)(a1 + 48) semanticClassesForCategory:v8 responseCount:v9 configReplies:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) setObject:v10 atIndexedSubscript:v8];
}

- (id)indexesForScores:(id)a3 numResponses:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__SGQuickResponsesRanking_indexesForScores_numResponses___block_invoke;
  v13[3] = &unk_2647EB248;
  id v14 = v5;
  id v8 = v7;
  id v15 = v8;
  id v9 = v5;
  [v6 enumerateObjectsUsingBlock:v13];

  id v10 = v15;
  id v11 = v8;

  return v11;
}

void __57__SGQuickResponsesRanking_indexesForScores_numResponses___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 unsignedIntegerValue];
  id v6 = objc_alloc(NSNumber);
  v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  id v8 = (id)objc_msgSend(v6, "initWithUnsignedInteger:", objc_msgSend(v7, "index"));

  for (; v5; --v5)
    [*(id *)(a1 + 40) addObject:v8];
}

- (id)classResultsForScores:(id)a3 numResponses:(id)a4 responseCount:(unint64_t)a5 config:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = [v13 predictionParams];
  unint64_t v15 = [v14 responsesToShowAtTopForDiversity];

  if (v15 && v15 < a5)
  {
    uint64_t v16 = +[SGQuickResponsesDistributingCount numResponsesForScores:v11 responseCount:v15 config:v13];
    uint64_t v17 = objc_opt_new();
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    id v26 = __83__SGQuickResponsesRanking_classResultsForScores_numResponses_responseCount_config___block_invoke;
    uint64_t v27 = &unk_2647EB220;
    id v28 = v16;
    uint64_t v29 = self;
    id v30 = v17;
    SEL v31 = a2;
    id v18 = v17;
    id v19 = v16;
    [v12 enumerateObjectsUsingBlock:&v24];
    uint64_t v20 = -[SGQuickResponsesRanking indexesForScores:numResponses:](self, "indexesForScores:numResponses:", v11, v19, v24, v25, v26, v27);
    uint64_t v21 = [(SGQuickResponsesRanking *)self indexesForScores:v11 numResponses:v18];
    v22 = [v20 arrayByAddingObjectsFromArray:v21];
  }
  else
  {
    v22 = [(SGQuickResponsesRanking *)self indexesForScores:v11 numResponses:v12];
  }

  return v22;
}

void __83__SGQuickResponsesRanking_classResultsForScores_numResponses_responseCount_config___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v11 = a2;
  if ([*(id *)(a1 + 32) count] <= a3)
  {
    [v11 unsignedIntegerValue];
    unint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    unint64_t v6 = [v5 unsignedIntegerValue];

    if ([v11 unsignedIntegerValue] < v6)
    {
      v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"SGQuickResponsesRanking.m", 57, @"Invalid parameter not satisfying: %@", @"num.unsignedIntegerValue >= headerCount" object file lineNumber description];
    }
  }
  unint64_t v8 = [v11 unsignedIntegerValue] - v6;
  id v9 = *(void **)(a1 + 48);
  id v10 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v8];
  [v9 addObject:v10];
}

- (id)resultsForModelScores:(id)a3 responseCount:(unint64_t)a4 config:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    id v10 = +[SGQuickResponsesDistributingCount numResponsesForScores:v8 responseCount:a4 config:v9];
    id v11 = [(SGQuickResponsesRanking *)self classResultsForScores:v8 numResponses:v10 responseCount:a4 config:v9];
    id v12 = [(SGQuickResponsesRanking *)self semanticClassesForResults:v11 scores:v8 numResponses:v10 config:v9];
  }
  else
  {
    id v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

- (SGQuickResponsesRanking)initWithSeed:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SGQuickResponsesRanking;
  v4 = [(SGQuickResponsesRanking *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F61E88]) initWithSeed:a3];
    rng = v4->_rng;
    v4->_rng = (_PASRng *)v5;
  }
  return v4;
}

@end