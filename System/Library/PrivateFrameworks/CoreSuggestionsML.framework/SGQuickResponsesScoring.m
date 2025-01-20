@interface SGQuickResponsesScoring
+ (id)categoryScoresWithModelScores:(id)a3 configReplies:(id)a4;
+ (id)modelScoresWithUnweightedScores:(id)a3 configReplies:(id)a4;
+ (id)sortedWithUnweightedScores:(id)a3 config:(id)a4;
@end

@implementation SGQuickResponsesScoring

+ (id)categoryScoresWithModelScores:(id)a3 configReplies:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 categoryModels];
  uint64_t v8 = [v7 count];

  for (i = objc_opt_new(); v8; --v8)
  {
    v10 = objc_opt_new();
    [i addObject:v10];
  }
  v11 = [v6 models];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__SGQuickResponsesScoring_categoryScoresWithModelScores_configReplies___block_invoke;
  v17[3] = &unk_2647EB248;
  id v18 = v11;
  id v12 = i;
  id v19 = v12;
  id v13 = v11;
  [v5 enumerateObjectsUsingBlock:v17];
  v14 = v19;
  id v15 = v12;

  return v15;
}

void __71__SGQuickResponsesScoring_categoryScoresWithModelScores_configReplies___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v8 = [v7 category];

  id v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v8];
  [v6 doubleValue];
  double v10 = v9;

  [v11 addScore:v10];
}

+ (id)modelScoresWithUnweightedScores:(id)a3 configReplies:(id)a4
{
  id v5 = a3;
  id v6 = [a4 models];
  v7 = objc_opt_new();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__SGQuickResponsesScoring_modelScoresWithUnweightedScores_configReplies___block_invoke;
  v13[3] = &unk_2647EB248;
  id v14 = v6;
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v13];

  double v10 = v15;
  id v11 = v8;

  return v11;
}

void __73__SGQuickResponsesScoring_modelScoresWithUnweightedScores_configReplies___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 doubleValue];
  double v6 = v5;
  v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v7 scoreWeight];
  double v9 = v6 * v8;

  double v10 = *(void **)(a1 + 40);
  id v11 = (id)[objc_alloc(NSNumber) initWithDouble:v9];
  [v10 addObject:v11];
}

+ (id)sortedWithUnweightedScores:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  double v8 = [v6 replies];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v10 = [v6 replies];
    id v11 = +[SGQuickResponsesScoring modelScoresWithUnweightedScores:v5 configReplies:v10];
    id v12 = +[SGQuickResponsesScoring categoryScoresWithModelScores:v11 configReplies:v10];
    id v13 = [v6 predictionParams];
    [v13 weightForCategoryAverage];
    uint64_t v15 = v14;

    v16 = [v6 predictionParams];
    [v16 weightForCategoryMax];
    uint64_t v18 = v17;

    id v19 = [v6 predictionParams];
    [v19 weightForIndividualModel];
    uint64_t v21 = v20;

    v22 = [v6 predictionParams];
    int v23 = [v22 isPerCategory];

    if (v23)
    {
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke_2;
      v41[3] = &unk_2647EB2C0;
      v42[1] = v15;
      v42[2] = v18;
      v24 = (id *)v42;
      v42[0] = v7;
      [v12 enumerateObjectsUsingBlock:v41];
    }
    else
    {
      v29 = [v10 models];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke_3;
      v34[3] = &unk_2647EB2E8;
      v24 = &v35;
      id v35 = v12;
      uint64_t v38 = v15;
      uint64_t v39 = v18;
      id v36 = v11;
      uint64_t v40 = v21;
      id v37 = v7;
      [v29 enumerateObjectsUsingBlock:v34];
    }
    v30 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:0];
    v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v30, 0);
    [v7 sortUsingDescriptors:v31];

    id v32 = v7;
  }
  else
  {
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke;
    v43[3] = &unk_2647EB298;
    id v25 = v7;
    id v44 = v25;
    [v5 enumerateObjectsUsingBlock:v43];
    v26 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:0];
    v27 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v26, 0);
    [v25 sortUsingDescriptors:v27];

    id v28 = v25;
    double v10 = v44;
  }

  return v7;
}

void __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [SGQuickResponsesClassScore alloc];
  [v5 doubleValue];
  double v8 = v7;

  double v9 = [(SGQuickResponsesClassScore *)v6 initWithValue:a3 index:v8];
  [v4 addObject:v9];
}

void __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 average];
  double v7 = v6;
  double v8 = *(double *)(a1 + 40);
  [v5 maximum];
  double v10 = v9;

  double v11 = v10 * *(double *)(a1 + 48) + v7 * v8;
  id v12 = *(void **)(a1 + 32);
  id v13 = [[SGQuickResponsesClassScore alloc] initWithValue:a3 index:v11];
  [v12 addObject:v13];
}

void __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v22 = a2;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v22, "category"));
  [v5 average];
  double v7 = v6;
  double v8 = *(double *)(a1 + 56);
  [v5 maximum];
  double v10 = v9;
  double v11 = *(double *)(a1 + 64);
  id v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  [v12 doubleValue];
  double v14 = v13;
  double v15 = *(double *)(a1 + 72);

  unint64_t v16 = [v22 semanticClassIndex];
  uint64_t v17 = [v22 semanticClasses];
  uint64_t v18 = [v17 count];

  if (v16 < v18 + v16)
  {
    double v19 = v10 * v11 + v7 * v8 + v14 * v15;
    do
    {
      uint64_t v20 = *(void **)(a1 + 48);
      uint64_t v21 = [[SGQuickResponsesClassScore alloc] initWithValue:v16 index:v19];
      [v20 addObject:v21];

      ++v16;
      --v18;
    }
    while (v18);
  }
}

@end