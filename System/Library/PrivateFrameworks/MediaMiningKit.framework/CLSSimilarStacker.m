@interface CLSSimilarStacker
+ (id)distanceBlockWithMetric:(unint64_t)a3 sceneprintGetterBlock:(id)a4;
- (CLSSimilarStacker)initWithSimilarityModelClass:(Class)a3;
- (double)distanceBetweenItem:(id)a3 andItem:(id)a4;
- (double)distanceThresholdForSimilarity:(int64_t)a3 similarityModel:(id)a4;
- (double)distanceThresholdForSimilarity:(int64_t)a3 withSimilarityModelVersion:(unint64_t)a4;
- (id)_similarityModelForVersion:(unint64_t)a3;
- (id)adaptiveStackSimilarItems:(id)a3 progressBlock:(id)a4;
- (id)sceneprintGetterBlock;
- (id)similarGroupComparator;
- (id)stackSimilarItems:(id)a3 withSimilarity:(int64_t)a4 timestampSupport:(BOOL)a5 progressBlock:(id)a6;
- (void)overrideDistanceThreshold:(double)a3 forSimilarity:(int64_t)a4;
- (void)setSceneprintGetterBlock:(id)a3;
@end

@implementation CLSSimilarStacker

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sceneprintGetterBlock, 0);
  objc_storeStrong((id *)&self->_similarityModelByVersion, 0);
}

- (void)setSceneprintGetterBlock:(id)a3
{
}

- (id)sceneprintGetterBlock
{
  return self->_sceneprintGetterBlock;
}

- (id)_similarityModelForVersion:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:");
  v6 = [(NSMutableDictionary *)self->_similarityModelByVersion objectForKeyedSubscript:v5];
  if (!v6)
  {
    v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSceneAnalysisVersion:a3];
    [(NSMutableDictionary *)self->_similarityModelByVersion setObject:v6 forKeyedSubscript:v5];
  }

  return v6;
}

- (void)overrideDistanceThreshold:(double)a3 forSimilarity:(int64_t)a4
{
  if ((unint64_t)a4 <= 4) {
    *(&self->_distanceThresholdForIdenticalSimilarity + a4) = a3;
  }
}

- (double)distanceThresholdForSimilarity:(int64_t)a3 withSimilarityModelVersion:(unint64_t)a4
{
  v6 = [(CLSSimilarStacker *)self _similarityModelForVersion:a4];
  [(CLSSimilarStacker *)self distanceThresholdForSimilarity:a3 similarityModel:v6];
  double v8 = v7;

  return v8;
}

- (double)distanceThresholdForSimilarity:(int64_t)a3 similarityModel:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  switch(a3)
  {
    case 0:
      double distanceThresholdForIdenticalSimilarity = self->_distanceThresholdForIdenticalSimilarity;
      if (distanceThresholdForIdenticalSimilarity < 0.0)
      {
        [v6 identicalSimilarityDistanceThreshold];
        goto LABEL_12;
      }
      break;
    case 1:
      double distanceThresholdForIdenticalSimilarity = self->_distanceThresholdForIdenticalSimilarityWithPeople;
      if (distanceThresholdForIdenticalSimilarity < 0.0)
      {
        [v6 identicalSimilarityWithPeopleDistanceThreshold];
        goto LABEL_12;
      }
      break;
    case 2:
      double distanceThresholdForIdenticalSimilarity = self->_distanceThresholdForSemanticalSimilarity;
      if (distanceThresholdForIdenticalSimilarity < 0.0)
      {
        [v6 semanticalSimilarityDistanceThreshold];
        goto LABEL_12;
      }
      break;
    case 3:
      double distanceThresholdForIdenticalSimilarity = self->_distanceThresholdForSemanticalSimilarityWithPeople;
      if (distanceThresholdForIdenticalSimilarity < 0.0)
      {
        [v6 semanticalSimilarityWithPeopleDistanceThreshold];
        goto LABEL_12;
      }
      break;
    case 4:
      double distanceThresholdForIdenticalSimilarity = self->_distanceThresholdForSemanticalSimilarityWithPersons;
      if (distanceThresholdForIdenticalSimilarity < 0.0)
      {
        [v6 semanticalSimilarityWithPersonDistanceThreshold];
LABEL_12:
        double distanceThresholdForIdenticalSimilarity = v9;
      }
      break;
    default:
      double distanceThresholdForIdenticalSimilarity = 0.0;
      break;
  }

  return distanceThresholdForIdenticalSimilarity;
}

- (double)distanceBetweenItem:(id)a3 andItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = -[CLSSimilarStacker _similarityModelForVersion:](self, "_similarityModelForVersion:", [v7 clsSimilarityModelVersion]);
  objc_msgSend((id)objc_opt_class(), "distanceBlockWithMetric:sceneprintGetterBlock:", objc_msgSend(v8, "metric"), self->_sceneprintGetterBlock);
  double v9 = (double (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  double v10 = ((double (**)(void, id, id))v9)[2](v9, v7, v6);

  return v10;
}

- (id)adaptiveStackSimilarItems:(id)a3 progressBlock:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 count];
  double v9 = [v6 firstObject];
  uint64_t v10 = [v9 clsSimilarityModelVersion];

  v11 = [(CLSSimilarStacker *)self _similarityModelForVersion:v10];
  v33 = objc_msgSend((id)objc_opt_class(), "distanceBlockWithMetric:sceneprintGetterBlock:", objc_msgSend(v11, "metric"), self->_sceneprintGetterBlock);
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:v33];
  [v12 setMinimumNumberOfObjects:1];
  [(CLSSimilarStacker *)self distanceThresholdForSimilarity:2 similarityModel:v11];
  double v14 = v13;
  v34 = v11;
  [(CLSSimilarStacker *)self distanceThresholdForSimilarity:0 similarityModel:v11];
  double v16 = v15;
  v17 = 0;
  double v18 = (double)v8;
  double v19 = v14 - v15;
  double v20 = 1.0;
  double v21 = 0.0;
  do
  {
    v22 = v17;
    double v23 = (v20 + v21) * 0.5;
    [v12 setMaximumDistance:v16 + v23 * v19];
    v17 = [v12 performWithDataset:v6 progressBlock:v7];

    if ([v17 count] <= (unint64_t)(v23 * v18) / 3)
    {
      double v20 = (v20 + v21) * 0.5;
      double v23 = v21;
    }
    else if ([v17 count] <= (unint64_t)(v23 * v18) / 3 + 1)
    {
      break;
    }
    double v21 = v23;
  }
  while (v20 - v23 > 0.0000001);
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v25 = v17;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = [*(id *)(*((void *)&v35 + 1) + 8 * i) objects];
        [v24 addObject:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v27);
  }

  v31 = [(CLSSimilarStacker *)self similarGroupComparator];
  [v24 sortWithOptions:16 usingComparator:v31];

  return v24;
}

- (id)stackSimilarItems:(id)a3 withSimilarity:(int64_t)a4 timestampSupport:(BOOL)a5 progressBlock:(id)a6
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = [v9 count];
  if (v11)
  {
    if (v11 == 1)
    {
      v41[0] = v9;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    }
    else
    {
      int64_t v27 = a4;
      uint64_t v28 = self;
      v29 = v10;
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v30 = v9;
      id v14 = v9;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v37 != v17) {
              objc_enumerationMutation(v14);
            }
            double v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            double v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v19, "clsSimilarityModelVersion", v27, v28, v29));
            id v21 = [v13 objectForKeyedSubscript:v20];
            if (!v21)
            {
              id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v13 setObject:v21 forKeyedSubscript:v20];
            }
            [v21 addObject:v19];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v16);
      }

      if ((unint64_t)[v13 count] >= 2
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[CLSSimilarStacker] Items with mixed sceneprint versions, deduping may not be optimal", buf, 2u);
      }
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __85__CLSSimilarStacker_stackSimilarItems_withSimilarity_timestampSupport_progressBlock___block_invoke;
      v31[3] = &unk_1E690F648;
      v31[4] = v28;
      int64_t v34 = v27;
      id v10 = v29;
      id v33 = v29;
      id v23 = v22;
      id v32 = v23;
      [v13 enumerateKeysAndObjectsUsingBlock:v31];
      id v24 = [(CLSSimilarStacker *)v28 similarGroupComparator];
      [v23 sortWithOptions:16 usingComparator:v24];

      id v25 = v32;
      id v12 = v23;

      id v9 = v30;
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

void __85__CLSSimilarStacker_stackSimilarItems_withSimilarity_timestampSupport_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_similarityModelForVersion:", objc_msgSend(a2, "unsignedIntegerValue"));
  id v7 = objc_msgSend((id)objc_opt_class(), "distanceBlockWithMetric:sceneprintGetterBlock:", objc_msgSend(v6, "metric"), *(void *)(*(void *)(a1 + 32) + 64));
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:v7];
  [v8 setMinimumNumberOfObjects:1];
  [*(id *)(a1 + 32) distanceThresholdForSimilarity:*(void *)(a1 + 56) similarityModel:v6];
  objc_msgSend(v8, "setMaximumDistance:");
  uint64_t v16 = v5;
  id v9 = [v8 performWithDataset:v5 progressBlock:*(void *)(a1 + 48)];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(a1 + 40);
        uint64_t v15 = [*(id *)(*((void *)&v17 + 1) + 8 * v13) objects];
        [v14 addObject:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (id)similarGroupComparator
{
  return &__block_literal_global_2121;
}

uint64_t __43__CLSSimilarStacker_similarGroupComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 firstObject];
  id v6 = [v4 firstObject];

  id v7 = objc_msgSend(v5, "cls_universalDate");
  unint64_t v8 = objc_msgSend(v6, "cls_universalDate");
  uint64_t v9 = [v7 compare:v8];

  if (!v9)
  {
    uint64_t v10 = [v5 clsIdentifier];
    uint64_t v11 = [v6 clsIdentifier];
    uint64_t v9 = [v10 compare:v11];
  }
  return v9;
}

- (CLSSimilarStacker)initWithSimilarityModelClass:(Class)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CLSSimilarStacker;
  id v4 = [(CLSSimilarStacker *)&v14 init];
  id v5 = v4;
  if (v4)
  {
    v4->_similarityModelClass = a3;
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    similarityModelByVersion = v5->_similarityModelByVersion;
    v5->_similarityModelByVersion = v6;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v5->_double distanceThresholdForIdenticalSimilarity = _Q0;
    *(_OWORD *)&v5->_distanceThresholdForSemanticalSimilarity = _Q0;
    v5->_distanceThresholdForSemanticalSimilarityWithPersons = -1.0;
  }
  return v5;
}

+ (id)distanceBlockWithMetric:(unint64_t)a3 sceneprintGetterBlock:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 == 1)
  {
    id v7 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    unint64_t v8 = __67__CLSSimilarStacker_distanceBlockWithMetric_sceneprintGetterBlock___block_invoke_2;
    goto LABEL_5;
  }
  if (!a3)
  {
    id v7 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    unint64_t v8 = __67__CLSSimilarStacker_distanceBlockWithMetric_sceneprintGetterBlock___block_invoke;
LABEL_5:
    v7[2] = v8;
    v7[3] = &unk_1E690F670;
    v7[4] = v5;
    uint64_t v9 = (void *)MEMORY[0x1D2602540](v7);

    goto LABEL_7;
  }
  uint64_t v9 = &__block_literal_global_34;
LABEL_7:

  return v9;
}

double __67__CLSSimilarStacker_distanceBlockWithMetric_sceneprintGetterBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
  }
  else {
  unint64_t v8 = [v5 clsSceneprint];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }
  else {
  uint64_t v10 = [v6 clsSceneprint];
  }
  uint64_t v11 = v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12) {
    double v13 = 1.79769313e308;
  }
  else {
    double v13 = CLSEuclidianDistanceBetweenSceneprints(v8, v10);
  }

  return v13;
}

double __67__CLSSimilarStacker_distanceBlockWithMetric_sceneprintGetterBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
  }
  else {
  unint64_t v8 = [v5 clsSceneprint];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }
  else {
  uint64_t v10 = [v6 clsSceneprint];
  }
  uint64_t v11 = (void *)v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12
    || (uint64_t v13 = [v8 requestRevision], v13 != objc_msgSend(v11, "requestRevision"))
    || (double v14 = (CLSCosineSimilarityBetweenSceneprints(v8, v11) + 1.0) * 0.5, v14 <= 0.0))
  {
    double v15 = 1.79769313e308;
  }
  else
  {
    double v15 = (1.0 - v14) / v14;
  }

  return v15;
}

double __67__CLSSimilarStacker_distanceBlockWithMetric_sceneprintGetterBlock___block_invoke_3()
{
  return 1.79769313e308;
}

@end