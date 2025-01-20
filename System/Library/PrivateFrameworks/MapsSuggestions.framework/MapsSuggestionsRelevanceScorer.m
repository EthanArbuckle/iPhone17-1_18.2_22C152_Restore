@interface MapsSuggestionsRelevanceScorer
- (MapsSuggestionsRelevanceScorer)init;
- (id)_confidenceForData:(uint64_t)a1;
- (id)_postProcessConfidences:(void *)a1;
- (id)confidenceForContacts:(id)a3 addresses:(id)a4;
- (id)confidenceForMapItems:(id)a3;
- (void)_confidenceForData:(uint64_t)a3 scorerIndex:(void *)a4 group:;
- (void)addScorer:(id)a3;
- (void)preLoadAllScorers;
@end

@implementation MapsSuggestionsRelevanceScorer

- (MapsSuggestionsRelevanceScorer)init
{
  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsRelevanceScorer;
  v2 = [(MapsSuggestionsRelevanceScorer *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    scorers = v2->_scorers;
    v2->_scorers = v3;

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantPast];
    scorersUpdatedAt = v2->_scorersUpdatedAt;
    v2->_scorersUpdatedAt = (NSDate *)v5;
  }
  return v2;
}

- (void)addScorer:(id)a3
{
}

- (id)confidenceForMapItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5)
  {
    v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "name", (void)v19);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v9);
    }

    v14 = [_RelevanceScorerData alloc];
    v15 = (void *)[v7 mutableCopy];
    v16 = [(_RelevanceScorerData *)v14 initWithNames:v6 addresses:0 mapItems:v15];

    v17 = -[MapsSuggestionsRelevanceScorer _confidenceForData:]((uint64_t)self, v16);
  }
  else
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "No mapItems to calculate score for", buf, 2u);
    }
    v17 = 0;
  }

  return v17;
}

- (id)_confidenceForData:(uint64_t)a1
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (!a1)
  {
    v38 = 0;
    goto LABEL_34;
  }
  v6 = [v4 names];
  objc_msgSend(v5, "setInputCount:", objc_msgSend(v6, "count"));

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 setFinalRelevanceScores:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 setIndexMapping:v8];

  id v9 = v5;
  uint64_t v10 = *(void **)(a1 + 8);
  if (!v10 || ![v10 count])
  {
    v32 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v32, OS_LOG_TYPE_ERROR, "No _scorers added.", buf, 2u);
    }

    goto LABEL_33;
  }
  v43 = (id *)a1;
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v12 = [MEMORY[0x1E4F1CA98] null];
  if ([v9 inputCount])
  {
    unint64_t v13 = 0;
    do
    {
      v14 = [v9 finalRelevanceScores];
      objc_sync_enter(v14);
      v15 = [v9 finalRelevanceScores];
      [v15 addObject:v12];

      objc_sync_exit(v14);
      v2 = [v9 names];
      v16 = [v2 objectAtIndexedSubscript:v13];
      int v17 = [v16 isEqual:v12];

      if (!v17) {
        goto LABEL_12;
      }
      uint64_t v18 = [v9 addresses];
      if (v18)
      {
        v2 = (void *)v18;
        long long v19 = [v9 addresses];
        long long v20 = [v19 objectAtIndexedSubscript:v13];
        int v21 = [v20 isEqual:v12];

        if (!v21) {
          goto LABEL_12;
        }
      }
      uint64_t v22 = [v9 mapItems];
      if (!v22) {
        goto LABEL_11;
      }
      v2 = (void *)v22;
      v23 = [v9 mapItems];
      v24 = [v23 objectAtIndexedSubscript:v13];
      int v25 = [v24 isEqual:v12];

      if (v25)
      {
LABEL_11:
        [v11 addIndex:v13];
      }
      else
      {
LABEL_12:
        v2 = [v9 indexMapping];
        v26 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v13];
        [v2 addObject:v26];
      }
      ++v13;
    }
    while (v13 < [v9 inputCount]);
  }
  v27 = [v9 names];
  [v27 removeObjectsAtIndexes:v11];

  v28 = [v9 addresses];
  [v28 removeObjectsAtIndexes:v11];

  v29 = [v9 mapItems];
  [v29 removeObjectsAtIndexes:v11];

  v30 = [v9 names];
  if (v30)
  {
    v2 = [v9 names];
    if ([v2 count])
    {
      BOOL v31 = 0;
LABEL_31:

      goto LABEL_32;
    }
  }
  v33 = [v9 addresses];
  if (v33)
  {
    v34 = [v9 addresses];
    if ([v34 count])
    {
      BOOL v31 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v41 = v34;
  }
  uint64_t v35 = objc_msgSend(v9, "mapItems", v41, v43);
  if (v35)
  {
    v36 = (void *)v35;
    v37 = [v9 mapItems];
    BOOL v31 = [v37 count] == 0;
  }
  else
  {
    BOOL v31 = 1;
  }
  v34 = v42;
  if (v33) {
    goto LABEL_29;
  }
LABEL_30:
  if (v30) {
    goto LABEL_31;
  }
LABEL_32:

  if (v31)
  {
LABEL_33:
    v38 = -[MapsSuggestionsRelevanceScorer _postProcessConfidences:](v9);
    goto LABEL_34;
  }
  dispatch_group_t v40 = dispatch_group_create();
  -[MapsSuggestionsRelevanceScorer _confidenceForData:scorerIndex:group:](v43, v9, 0, v40);
  dispatch_group_wait(v40, 0xFFFFFFFFFFFFFFFFLL);
  v38 = -[MapsSuggestionsRelevanceScorer _postProcessConfidences:](v9);

LABEL_34:
  return v38;
}

- (id)confidenceForContacts:(id)a3 addresses:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8 != [v7 count])
  {
    v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRelevanceScorer.m";
      __int16 v55 = 1024;
      int v56 = 105;
      __int16 v57 = 2082;
      v58 = "-[MapsSuggestionsRelevanceScorer confidenceForContacts:addresses:]";
      __int16 v59 = 2082;
      v60 = "count != [addresses count]";
      v32 = "At %{public}s:%d, %{public}s forbids: %{public}s. Information mismatch!! No. of contacts is different from n"
            "o. of addresses passed.";
      v33 = v29;
      os_log_type_t v34 = OS_LOG_TYPE_ERROR;
      uint32_t v35 = 38;
LABEL_29:
      _os_log_impl(&dword_1A70DF000, v33, v34, v32, buf, v35);
    }
LABEL_30:
    BOOL v31 = 0;
    goto LABEL_31;
  }
  if (!v8)
  {
    v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v32 = "No contacts to calculate score for";
      v33 = v29;
      os_log_type_t v34 = OS_LOG_TYPE_DEBUG;
      uint32_t v35 = 2;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  v37 = self;
  id v9 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
  uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v39 = v6;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "givenName", v37);
        int v17 = (void *)v16;
        if (v16) {
          uint64_t v18 = (void *)v16;
        }
        else {
          uint64_t v18 = v10;
        }
        [v9 addObject:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v13);
  }
  v42 = v9;

  long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v7];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v38 = v7;
  obuint64_t j = v7;
  uint64_t v20 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v44;
    uint64_t v40 = *MEMORY[0x1E4F1B770];
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(obj);
        }
        int v25 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || ([v25 label],
              v26 = objc_claimAutoreleasedReturnValue(),
              int v27 = [v26 isEqualToString:v40],
              v26,
              v27))
        {
          objc_msgSend(v19, "setObject:atIndexedSubscript:", v10, v22 + j, v37);
          [v42 setObject:v10 atIndexedSubscript:v22 + j];
        }
        else
        {
          v28 = [v25 value];
          [v19 setObject:v28 atIndexedSubscript:v22 + j];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      v22 += j;
    }
    while (v21);
  }

  v29 = v42;
  v30 = [[_RelevanceScorerData alloc] initWithNames:v42 addresses:v19 mapItems:0];
  BOOL v31 = -[MapsSuggestionsRelevanceScorer _confidenceForData:]((uint64_t)v37, v30);

  id v7 = v38;
  id v6 = v39;
LABEL_31:

  return v31;
}

- (void)preLoadAllScorers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  }
  if (s_verbose)
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136315138;
      uint64_t v20 = "-[MapsSuggestionsRelevanceScorer preLoadAllScorers]";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v19, 0xCu);
    }
  }
  id v4 = MapsSuggestionsNow();
  [v4 timeIntervalSinceDate:self->_scorersUpdatedAt];
  double v6 = v5;

  GEOConfigGetDouble();
  if (v6 < v7)
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      id v9 = "Ignoring preLoad";
      uint64_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
LABEL_16:
      _os_log_impl(&dword_1A70DF000, v10, v11, v9, (uint8_t *)&v19, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  uint64_t v12 = [(NSMutableArray *)self->_scorers count];
  if (!v12)
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v19) = 0;
      id v9 = "No scorers to fetch data from";
      uint64_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      goto LABEL_16;
    }
LABEL_17:

    return;
  }
  uint64_t v13 = v12;
  MapsSuggestionsNow();
  uint64_t v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
  scorersUpdatedAt = self->_scorersUpdatedAt;
  self->_scorersUpdatedAt = v14;

  uint64_t v16 = 0;
  do
  {
    uint64_t v17 = v16 + 1;
    uint64_t v18 = -[NSMutableArray objectAtIndexedSubscript:](self->_scorers, "objectAtIndexedSubscript:");
    [v18 preLoad];

    uint64_t v16 = v17;
  }
  while (v13 != v17);
}

- (id)_postProcessConfidences:(void *)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a1;
  uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v21 = [[MapsSuggestionsRelevanceScore alloc] initWithConfidence:MapsSuggestionsConfidenceDontKnow()];
  obuint64_t j = [v23 finalRelevanceScores];
  objc_sync_enter(obj);
  for (unint64_t i = 0; i < objc_msgSend(v23, "inputCount", obj); ++i)
  {
    v2 = [v23 finalRelevanceScores];
    v3 = [v2 objectAtIndexedSubscript:i];

    if (v22 == v3)
    {
      id v4 = [v23 finalRelevanceScores];
      [v4 setObject:v21 atIndexedSubscript:i];
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v5 = [v23 finalRelevanceScores];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        }
        if (s_verbose)
        {
          GEOFindOrCreateLog();
          uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            [v9 confidence];
            uint64_t v12 = v11;
            uint64_t v13 = [v9 lastInteractionTime];
            *(_DWORD *)buf = 134218242;
            v29 = v12;
            __int16 v30 = 2112;
            *(void *)BOOL v31 = v13;
            _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "finalConfidence: %f, Time: %@", buf, 0x16u);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v6);
  }

  uint64_t v14 = [v23 finalRelevanceScores];
  uint64_t v15 = [v14 count];
  BOOL v16 = v15 == [v23 inputCount];

  if (v16)
  {
    uint64_t v17 = [v23 finalRelevanceScores];
    id v18 = [v17 copy];
  }
  else
  {
    uint64_t v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRelevanceScorer.m";
      __int16 v30 = 1024;
      *(_DWORD *)BOOL v31 = 356;
      *(_WORD *)&v31[4] = 2082;
      *(void *)&v31[6] = "-[MapsSuggestionsRelevanceScorer _postProcessConfidences:]";
      __int16 v32 = 2082;
      v33 = "[data.finalRelevanceScores count] != data.inputCount";
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. ERROR! Mismatch in input and finalRelevanceScores count. Returning nil", buf, 0x26u);
    }
    id v18 = 0;
  }

  objc_sync_exit(obj);
  return v18;
}

- (void)_confidenceForData:(uint64_t)a3 scorerIndex:(void *)a4 group:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = a4;
  if ([a1[1] count] != a3)
  {
    id v9 = [v7 names];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      os_log_type_t v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = [a1[1] objectAtIndexedSubscript:a3];
        *(_DWORD *)buf = 138412290;
        __int16 v30 = v12;
        _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "Processing scorer %@", buf, 0xCu);
      }
      dispatch_group_enter(v8);
      objc_initWeak((id *)buf, a1);
      long long v24 = [a1[1] objectAtIndexedSubscript:a3];
      uint64_t v13 = [v7 names];
      id v23 = (void *)[v13 copy];
      uint64_t v14 = [v7 addresses];
      uint64_t v15 = (void *)[v14 copy];
      BOOL v16 = [v7 mapItems];
      uint64_t v17 = (void *)[v16 copy];
      uint64_t v22 = v13;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __71__MapsSuggestionsRelevanceScorer__confidenceForData_scorerIndex_group___block_invoke;
      v25[3] = &unk_1E5CBAC38;
      objc_copyWeak(v28, (id *)buf);
      id v18 = v7;
      id v26 = v18;
      uint64_t v21 = a3 + 1;
      v28[1] = (id)(a3 + 1);
      int v19 = v8;
      long long v27 = v19;
      char v20 = [v24 relevanceScoreForNames:v23 addresses:v15 mapItems:v17 completion:v25];

      if ((v20 & 1) == 0)
      {
        -[MapsSuggestionsRelevanceScorer _confidenceForData:scorerIndex:group:](a1, v18, v21, v19);
        dispatch_group_leave(v19);
      }

      objc_destroyWeak(v28);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __71__MapsSuggestionsRelevanceScorer__confidenceForData_scorerIndex_group___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v66 = v6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v65 = v5;
  if (WeakRetained)
  {
    uint64_t v62 = a1;
    id v7 = *(void **)(a1 + 32);
    id v64 = v5;
    id v69 = v7;
    v63 = (char *)v6;
    if (v63)
    {
      uint64_t v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v81 = v63;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "Scorer returned error %@", buf, 0xCu);
      }
    }
    else
    {
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      }
      if (s_verbose)
      {
        os_log_type_t v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v81 = (char *)@"Scorer confidence is: ";
          _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      obuint64_t j = v64;
      uint64_t v12 = [obj countByEnumeratingWithState:&v72 objects:buf count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v73;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v73 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void **)(*((void *)&v72 + 1) + 8 * v14);
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1) {
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            }
            if (s_verbose)
            {
              BOOL v16 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                [v15 confidence];
                uint64_t v18 = v17;
                int v19 = [v15 lastInteractionTime];
                *(_DWORD *)v76 = 134218242;
                uint64_t v77 = v18;
                __int16 v78 = 2112;
                v79 = v19;
                _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "Confidence: %f, Time: %@", v76, 0x16u);
              }
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [obj countByEnumeratingWithState:&v72 objects:buf count:16];
        }
        while (v12);
      }

      if (!obj) {
        goto LABEL_53;
      }
      uint64_t v70 = [obj count];
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v70];
      char v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v70];
      uint64_t v61 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v70];
      v68 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v70];
      if (v70)
      {
        uint64_t v22 = 0;
        *(void *)&long long v21 = 134217984;
        long long v60 = v21;
        do
        {
          id v23 = objc_msgSend(obj, "objectAtIndexedSubscript:", v22, v60);
          [v23 confidence];
          if (v24 == MapsSuggestionsConfidenceDefinitelyTrue())
          {
            v42 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v76 = v60;
              uint64_t v77 = v22;
              _os_log_impl(&dword_1A70DF000, v42, OS_LOG_TYPE_DEBUG, "Scorer returned high confidence for %lu", v76, 0xCu);
            }

            uint64_t v40 = [v69 finalRelevanceScores];
            objc_sync_enter(v40);
            long long v43 = [v69 finalRelevanceScores];
            long long v44 = [v69 indexMapping];
            long long v45 = [v44 objectAtIndexedSubscript:v22];
            uint64_t v46 = [v45 unsignedIntegerValue];
            long long v47 = [obj objectAtIndexedSubscript:v22];
            [v43 replaceObjectAtIndex:v46 withObject:v47];

            objc_sync_exit(v40);
          }
          else
          {
            long long v25 = [v69 names];
            if (v25)
            {
              id v26 = [v69 names];
              BOOL v27 = [v26 count] == 0;

              if (!v27)
              {
                v28 = [v69 names];
                v29 = [v28 objectAtIndexedSubscript:v22];
                [v8 addObject:v29];
              }
            }
            __int16 v30 = [v69 addresses];
            if (v30)
            {
              uint64_t v31 = [v69 addresses];
              BOOL v32 = [v31 count] == 0;

              if (!v32)
              {
                v33 = [v69 addresses];
                os_log_type_t v34 = [v33 objectAtIndexedSubscript:v22];
                [v20 addObject:v34];
              }
            }
            uint64_t v35 = [v69 mapItems];
            if (v35)
            {
              v36 = [v69 mapItems];
              BOOL v37 = [v36 count] == 0;

              if (!v37)
              {
                id v38 = [v69 mapItems];
                id v39 = [v38 objectAtIndexedSubscript:v22];
                [v61 addObject:v39];
              }
            }
            uint64_t v40 = [v69 indexMapping];
            v41 = [v40 objectAtIndexedSubscript:v22];
            [v68 addObject:v41];
          }
          ++v22;
        }
        while (v70 != v22);
      }
      long long v48 = [v69 names];
      BOOL v49 = v48 == 0;

      if (!v49)
      {
        long long v50 = [v69 names];
        [v50 removeAllObjects];

        v51 = [v69 names];
        [v51 addObjectsFromArray:v8];
      }
      v52 = [v69 addresses];
      BOOL v53 = v52 == 0;

      if (!v53)
      {
        v54 = [v69 addresses];
        [v54 removeAllObjects];

        __int16 v55 = [v69 addresses];
        [v55 addObjectsFromArray:v20];
      }
      int v56 = [v69 mapItems];
      BOOL v57 = v56 == 0;

      if (!v57)
      {
        v58 = [v69 mapItems];
        [v58 removeAllObjects];

        __int16 v59 = [v69 mapItems];
        [v59 addObjectsFromArray:v61];
      }
      [v69 setIndexMapping:v68];
    }
LABEL_53:

    uint64_t v10 = WeakRetained;
    -[MapsSuggestionsRelevanceScorer _confidenceForData:scorerIndex:group:](WeakRetained, *(void *)(v62 + 32), *(void *)(v62 + 56), *(void *)(v62 + 40));
    dispatch_group_leave(*(dispatch_group_t *)(v62 + 40));
    goto LABEL_54;
  }
  GEOFindOrCreateLog();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v81 = "MapsSuggestionsRelevanceScorer.m";
    __int16 v82 = 1026;
    int v83 = 208;
    __int16 v84 = 2082;
    v85 = "-[MapsSuggestionsRelevanceScorer _confidenceForData:scorerIndex:group:]_block_invoke";
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }

  uint64_t v10 = 0;
LABEL_54:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scorersUpdatedAt, 0);
  objc_storeStrong((id *)&self->_scorers, 0);
}

@end