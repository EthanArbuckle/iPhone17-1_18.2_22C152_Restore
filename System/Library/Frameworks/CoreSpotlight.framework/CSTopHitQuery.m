@interface CSTopHitQuery
+ (void)sortSearchableItems:(id)a3;
- (BOOL)isTopHitQuery;
- (CSTopHitQuery)initWithQueryString:(id)a3 context:(id)a4;
- (CSTopHitQuery)initWithQueryString:(id)a3 queryContext:(id)a4;
- (CSTopHitQuery)initWithUserQueryString:(id)a3 queryContext:(id)a4;
- (CSTopHitQuery)initWithUserString:(id)a3 queryContext:(id)a4;
- (unint64_t)dispatchApplyWidth;
- (void)filterRankedItems:(id)a3 hitCount:(unint64_t)a4;
- (void)handleBatches:(id)a3;
- (void)handleCompletion:(id)a3;
- (void)handleFoundInstantAnswers:(id)a3;
- (void)handleFoundItems:(id)a3;
@end

@implementation CSTopHitQuery

- (CSTopHitQuery)initWithQueryString:(id)a3 queryContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CSTopHitQuery;
  v4 = [(CSUserQuery *)&v7 initWithQueryString:a3 queryContext:a4];
  v5 = v4;
  if (v4) {
    thq_commonInit(v4);
  }
  return v5;
}

- (CSTopHitQuery)initWithQueryString:(id)a3 context:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CSTopHitQuery;
  v4 = [(CSUserQuery *)&v7 initWithQueryString:a3 context:a4];
  v5 = v4;
  if (v4) {
    thq_commonInit(v4);
  }
  return v5;
}

- (CSTopHitQuery)initWithUserString:(id)a3 queryContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CSTopHitQuery;
  v4 = [(CSUserQuery *)&v7 initWithQueryString:a3 context:a4];
  v5 = v4;
  if (v4) {
    thq_commonInit(v4);
  }
  return v5;
}

- (CSTopHitQuery)initWithUserQueryString:(id)a3 queryContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 maxItemCount] >= 1) {
    objc_msgSend(v7, "setMaxResultCount:", objc_msgSend(v7, "maxItemCount"));
  }
  v11.receiver = self;
  v11.super_class = (Class)CSTopHitQuery;
  v8 = [(CSUserQuery *)&v11 initWithUserQueryString:v6 queryContext:v7];
  v9 = v8;
  if (v8) {
    thq_commonInit(v8);
  }

  return v9;
}

- (void)filterRankedItems:(id)a3 hitCount:(unint64_t)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  unint64_t tokenCount = self->_tokenCount;
  if (tokenCount && (unint64_t)[v6 count] >= 2)
  {
    unint64_t v46 = tokenCount;
    unint64_t v47 = [v7 count];
    v9 = [v7 objectAtIndexedSubscript:0];
    v10 = [v9 attributeSet];
    objc_super v11 = [v10 attributeDictionary];
    v12 = [v11 objectForKeyedSubscript:@"kMDQueryResultScoreL1"];
    [v12 floatValue];
    float v14 = v13;

    v15 = [v7 objectAtIndexedSubscript:0];
    v16 = [v15 attributeSet];
    v17 = [v16 attributeDictionary];
    v18 = [v17 objectForKeyedSubscript:@"kMDQueryResultScoreL2"];
    [v18 floatValue];
    unsigned int v20 = v19;

    if (v14 <= 0.00000011921 || ((unint64_t v21 = [v7 count], v21 >= a4) ? (v22 = a4) : (v22 = v21), v22 < 2))
    {
LABEL_26:
      unint64_t v39 = v46;
    }
    else
    {
      unint64_t v45 = __PAIR64__(*(unsigned int *)"H?F?", v20);
      unint64_t v23 = 1;
      while (1)
      {
        v24 = objc_msgSend(v7, "objectAtIndexedSubscript:", v23, v45);
        v25 = [v24 attributeSet];
        v26 = [v25 attributeDictionary];
        v27 = [v26 objectForKeyedSubscript:@"kMDQueryResultScoreL1"];
        [v27 floatValue];
        float v29 = v28;

        v30 = [v7 objectAtIndexedSubscript:v23];
        v31 = [v30 attributeSet];
        v32 = [v31 attributeDictionary];
        v33 = [v32 objectForKeyedSubscript:@"kMDQueryResultScoreL2"];
        [v33 floatValue];
        float v35 = v34;

        float v36 = v29 / v14;
        if (v29 == 0.0)
        {
          if (_os_feature_enabled_impl() && v35 < 0.33 && v29 < 0.00000011921) {
            goto LABEL_25;
          }
        }
        else if (v36 > 0.890452653 && v36 <= 0.8933734 {
               || v29 > 0.07188 && v29 <= 0.16988 && v36 <= *((float *)&v45 + 1))
        }
        {
LABEL_25:
          unint64_t v47 = v23;
          goto LABEL_26;
        }
        if (v47 == v23) {
          break;
        }
        ++v23;
        unint64_t v37 = [v7 count];
        if (v37 >= a4) {
          unint64_t v38 = a4;
        }
        else {
          unint64_t v38 = v37;
        }
        if (v23 >= v38) {
          goto LABEL_26;
        }
      }
      v43 = logForCSLogCategoryDefault();
      unint64_t v39 = v46;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = [(CSUserQuery *)self queryContext];
        *(_DWORD *)buf = 67110912;
        int v49 = [v44 queryID];
        __int16 v50 = 2048;
        unint64_t v51 = v46;
        __int16 v52 = 2048;
        unint64_t v53 = v47;
        __int16 v54 = 2048;
        double v55 = v29;
        __int16 v56 = 2048;
        double v57 = v36;
        __int16 v58 = 2048;
        double v59 = v35;
        __int16 v60 = 2048;
        double v61 = (float)(v35 / *(float *)&v45);
        __int16 v62 = 2048;
        double v63 = (float)(*(float *)&v45 - v35);
        _os_log_impl(&dword_18D0E3000, v43, OS_LOG_TYPE_INFO, "[TopHit Thresholding][qid=%d][num_tokens=%lu] Thresholding applied at item %lu:\nScores={L1Score=%.04f, L1ScoreRatio=%.04f, L2Score=%.04f, L2ScoreRatio=%.04f, L2ScoreDiff=%.04f}", buf, 0x4Eu);
      }
    }
    if (v47 < [v7 count])
    {
      v40 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = [(CSUserQuery *)self queryContext];
        int v42 = [v41 queryID];
        *(_DWORD *)buf = 67109632;
        int v49 = v42;
        __int16 v50 = 2048;
        unint64_t v51 = v39;
        __int16 v52 = 2048;
        unint64_t v53 = v47;
        _os_log_impl(&dword_18D0E3000, v40, OS_LOG_TYPE_INFO, "[TopHit Thresholding][qid=%d][num_tokens=%lu] Results beyond the top %lu results are filtered", buf, 0x1Cu);
      }
      objc_msgSend(v7, "removeObjectsInRange:", v47, objc_msgSend(v7, "count") - v47);
    }
  }
}

- (void)handleBatches:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CSUserQuery *)self queryContext];
  if ([v5 maxCount] < 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v6 = [(CSUserQuery *)self queryContext];
    uint64_t v7 = [v6 maxCount];
  }
  v8 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CSTopHitQuery handleBatches:]();
  }
  unint64_t v34 = v7;
  float v35 = self;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v9);
        }
        v12 += [*(id *)(*((void *)&v42 + 1) + 8 * i) count];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v16 = v9;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v16);
        }
        [v15 addObjectsFromArray:*(void *)(*((void *)&v38 + 1) + 8 * j)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v18);
  }

  unint64_t v21 = [v15 objectEnumerator];
  unint64_t v22 = 0;
  uint64_t v23 = 0;
  for (uint64_t k = 0; ; uint64_t k = v28)
  {
    v25 = [v21 nextObject];
    v26 = v25;
    if (!v25) {
      break;
    }
    v27 = [v25 bundleID];

    if (!v22 || [v22 isEqualToString:v27])
    {
      uint64_t v28 = k + 1;
      goto LABEL_38;
    }
LABEL_28:
    if (k == 1)
    {
      float v29 = [v15 objectAtIndexedSubscript:v23];
      unint64_t v46 = v29;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      v37.receiver = v35;
      v37.super_class = (Class)CSTopHitQuery;
      [(CSUserQuery *)&v37 handleFoundItems:v30];
    }
    else
    {
      id v31 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v32 = objc_msgSend(v15, "subarrayWithRange:", v23, k);
      float v29 = (void *)[v31 initWithArray:v32];

      +[CSTopHitQuery sortSearchableItems:v29];
      if (([v22 isEqualToString:@"com.apple.mobilemail"] & 1) != 0
        || [v22 isEqualToString:@"com.apple.pommesctl"])
      {
        [(CSTopHitQuery *)v35 filterRankedItems:v29 hitCount:v34];
      }
      if (v34)
      {
        if (v34 < [v29 count]) {
          objc_msgSend(v29, "removeObjectsInRange:", v34, objc_msgSend(v29, "count") - v34);
        }
      }
      v36.receiver = v35;
      v36.super_class = (Class)CSTopHitQuery;
      [(CSUserQuery *)&v36 handleFoundItems:v29];
    }
    uint64_t v28 = v26 != 0;

    v23 += k;
LABEL_38:

    id v33 = v27;
    unint64_t v22 = v33;
  }
  v27 = v22;
  if (k) {
    goto LABEL_28;
  }
}

+ (void)sortSearchableItems:(id)a3
{
}

uint64_t __37__CSTopHitQuery_sortSearchableItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 attributeSet];
  id v6 = [v5 attributeDictionary];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"kMDQueryResultScoreL2"];

  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v8 = [NSNumber numberWithFloat:0.0];

    uint64_t v7 = (void *)v8;
  }
  id v9 = [v4 attributeSet];
  uint64_t v10 = [v9 attributeDictionary];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"kMDQueryResultScoreL2"];

  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v12 = [NSNumber numberWithFloat:0.0];

    uint64_t v11 = (void *)v12;
  }
  [v7 floatValue];
  float v14 = v13;
  [v11 floatValue];
  if (v14 <= v15)
  {
    [v7 floatValue];
    float v18 = v17;
    [v11 floatValue];
    uint64_t v16 = v18 < v19;
  }
  else
  {
    uint64_t v16 = -1;
  }

  return v16;
}

- (unint64_t)dispatchApplyWidth
{
  return 1;
}

- (void)handleFoundItems:(id)a3
{
  id v4 = a3;
  v5 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CSTopHitQuery handleFoundItems:]();
  }

  [(NSMutableArray *)self->_batches addObject:v4];
}

- (void)handleFoundInstantAnswers:(id)a3
{
  id v4 = a3;
  v5 = [(CSUserQuery *)self foundInstantAnswersHandler];

  if (v5)
  {
    id v6 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CSTopHitQuery handleFoundInstantAnswers:]();
    }

    uint64_t v7 = [(CSUserQuery *)self foundInstantAnswersHandler];
    ((void (**)(void, id))v7)[2](v7, v4);
  }
}

- (BOOL)isTopHitQuery
{
  return 1;
}

- (void)handleCompletion:(id)a3
{
  id v4 = a3;
  v5 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CSTopHitQuery handleCompletion:]();
  }

  if (!v4) {
    [(CSTopHitQuery *)self handleBatches:self->_batches];
  }
  v6.receiver = self;
  v6.super_class = (Class)CSTopHitQuery;
  [(CSUserQuery *)&v6 handleCompletion:v4];
}

- (void).cxx_destruct
{
}

- (void)handleBatches:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_2(&dword_18D0E3000, v0, v1, "Handle batches %@ for query:%@");
}

- (void)handleFoundItems:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_2(&dword_18D0E3000, v0, v1, "Received batch %@ for query:%@");
}

- (void)handleFoundInstantAnswers:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_2(&dword_18D0E3000, v0, v1, "Handle instant answer batches %@ for query:%@");
}

- (void)handleCompletion:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_2(&dword_18D0E3000, v0, v1, "Received completion %@ for query:%@");
}

@end