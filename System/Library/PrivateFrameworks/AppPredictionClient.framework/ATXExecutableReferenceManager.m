@interface ATXExecutableReferenceManager
- (ATXExecutableReferenceManager)init;
- (ATXExecutableReferenceManager)initWithCacheDirectory:(id)a3 minDurationForTrackedReferencesToStayAround:(double)a4;
- (BOOL)_writeData:(id)a3;
- (BOOL)canExecutableClearOnEngagement:(id)a3;
- (BOOL)isExecutableHidden:(id)a3;
- (id)_executablePairsForSuggestions:(id)a3 clientModelId:(id)a4;
- (id)_loadReferences;
- (id)_pairsForClientModelId:(id)a3 map:(id)a4;
- (id)_readData;
- (id)clientModelIdsForExecutable:(id)a3;
- (id)description;
- (id)jsonDict;
- (id)referencesForClientModelId:(id)a3;
- (unint64_t)referenceCountForExecutable:(id)a3;
- (void)_addExecutablePairs:(id)a3 toMap:(id)a4;
- (void)_loadReferences;
- (void)_purgeReferencesIfPossibleInMap:(id)a3 forceWrite:(BOOL)a4;
- (void)_readData;
- (void)_writeReferences:(id)a3;
- (void)addReferencesForSuggestions:(id)a3 clientModelId:(id)a4;
- (void)markReferenceAsHiddenForExecutable:(id)a3 clientModelId:(id)a4 untilDate:(id)a5;
- (void)markReferencesAsPurgableFromClientModelIdIfPossible:(id)a3;
- (void)performBatchUpdateOfReferencesWithBlock:(id)a3;
- (void)purgeReferencesForSuggestions:(id)a3 clientModelId:(id)a4;
- (void)purgeReferencesIfPossible;
- (void)recordExecutable:(id)a3 clientModelId:(id)a4 shouldClearEngagement:(BOOL)a5;
- (void)updateDateOfReferenceForExecutable:(id)a3 clientModelId:(id)a4;
- (void)updateReferencesForProactiveSuggestions:(id)a3 clientModelId:(id)a4;
@end

@implementation ATXExecutableReferenceManager

- (ATXExecutableReferenceManager)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionCacheDirectory];
  v4 = [(ATXExecutableReferenceManager *)self initWithCacheDirectory:v3 minDurationForTrackedReferencesToStayAround:900.0];

  return v4;
}

- (ATXExecutableReferenceManager)initWithCacheDirectory:(id)a3 minDurationForTrackedReferencesToStayAround:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXExecutableReferenceManager;
  v7 = [(ATXExecutableReferenceManager *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 stringByAppendingPathComponent:@"ATXExecutableReferenceCache.pb"];
    path = v7->_path;
    v7->_path = (NSString *)v8;

    v7->_minDurationForTrackedReferencesToStayAround = a4;
  }

  return v7;
}

- (id)jsonDict
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v21 = objc_opt_new();
  v3 = [(ATXExecutableReferenceManager *)self _loadReferences];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v8 = [v7 debugTitle];
        v9 = objc_opt_new();
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v10 = [v3 objectForKey:v7];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = [*(id *)(*((void *)&v22 + 1) + 8 * j) jsonDict];
              [v9 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
          }
          while (v12);
        }

        [v21 setObject:v9 forKeyedSubscript:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v5);
  }
  v30[0] = @"type";
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v30[1] = @"references";
  v31[0] = v17;
  v31[1] = v21;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  return v18;
}

- (id)description
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(ATXExecutableReferenceManager *)self _loadReferences];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = v4;
        uint64_t v5 = *(void *)(*((void *)&v23 + 1) + 8 * v4);
        [v3 appendFormat:@"> References for executable: %@\n", v5];
        id v6 = [obj objectForKey:v5];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v20 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
              uint64_t v12 = [v11 clientModelId];
              uint64_t v13 = [v11 date];
              objc_msgSend(v3, "appendFormat:", @"  - %@ on %@; shouldPurge: %d clearOnEngagement: %d\n",
                v12,
                v13,
                [v11 shouldPurge],
                [v11 shouldClearOnEngagement]);
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v8);
        }
        [v3 appendString:@"\n"];

        uint64_t v4 = v18 + 1;
      }
      while (v18 + 1 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v16);
  }

  return v3;
}

- (BOOL)_writeData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = open([(NSString *)self->_path fileSystemRepresentation], 514, 384);
  if (v5 == -1)
  {
    uint64_t v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXEngagementRecordManager _writeData:]();
    }
    char v7 = 0;
  }
  else
  {
    int v6 = v5;
    char v7 = ATXCacheFileWrite();
    if ((v6 & 0x80000000) == 0) {
      close(v6);
    }
    uint64_t v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = @"ATXExecutableReferenceCache.pb";
      _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "Successfully wrote data to cache file: %@", buf, 0xCu);
    }
  }

  return v7;
}

- (id)_readData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = open([(NSString *)self->_path fileSystemRepresentation], 0);
  if (v2 == -1)
  {
    int v6 = *__error();
    char v7 = __atxlog_handle_default();
    uint64_t v8 = v7;
    if (v6 == 2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "No recently engaged cache references file found.", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[ATXExecutableReferenceManager _readData]();
    }

    id v5 = 0;
  }
  else
  {
    int v3 = v2;
    ATXCacheFileRead();
    if ((v3 & 0x80000000) == 0) {
      close(v3);
    }
    id v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = @"ATXExecutableReferenceCache.pb";
      _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_DEFAULT, "Successfully read data from cache file: %@", buf, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

- (void)performBatchUpdateOfReferencesWithBlock:(id)a3
{
  uint64_t v9 = (void (**)(void))a3;
  cachedExecutableToReferenceMapForBatchUpdates = self->__cachedExecutableToReferenceMapForBatchUpdates;
  id v5 = (void *)MEMORY[0x1AD0D3C30]();
  if (cachedExecutableToReferenceMapForBatchUpdates)
  {
    v9[2]();
  }
  else
  {
    int v6 = [(ATXExecutableReferenceManager *)self _loadReferences];
    self->__cachedExecutableToReferenceMapNeedsWrite = 0;
    objc_storeStrong((id *)&self->__cachedExecutableToReferenceMapForBatchUpdates, v6);
    char v7 = (void *)MEMORY[0x1AD0D3C30]();
    v9[2]();
    uint64_t v8 = self->__cachedExecutableToReferenceMapForBatchUpdates;
    self->__cachedExecutableToReferenceMapForBatchUpdates = 0;

    if (self->__cachedExecutableToReferenceMapNeedsWrite) {
      [(ATXExecutableReferenceManager *)self _writeReferences:v6];
    }
    self->__cachedExecutableToReferenceMapNeedsWrite = 0;
  }
}

- (id)_loadReferences
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1AD0D3C30](self, a2);
  id v4 = (void *)v3;
  cachedExecutableToReferenceMapForBatchUpdates = self->__cachedExecutableToReferenceMapForBatchUpdates;
  if (cachedExecutableToReferenceMapForBatchUpdates)
  {
    v43 = cachedExecutableToReferenceMapForBatchUpdates;
  }
  else
  {
    v42 = (void *)v3;
    int v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ATXExecutableReferenceManager _loadReferences](v6);
    }

    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__22;
    v65 = __Block_byref_object_dispose__22;
    id v66 = 0;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __48__ATXExecutableReferenceManager__loadReferences__block_invoke;
    v60[3] = &unk_1E5D06DE8;
    v60[4] = self;
    v60[5] = &v61;
    +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:@"ATXExecutableReferenceManager" block:v60];
    if ([(id)v62[5] length])
    {
      v43 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      char v7 = (void *)MEMORY[0x1AD0D3C30]();
      uint64_t v8 = [ATXPBExecutableReferenceCache alloc];
      uint64_t v9 = [(ATXPBExecutableReferenceCache *)v8 initWithData:v62[5]];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v10 = -[ATXPBExecutableReferenceCache keys](v9);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v68 count:16];
      v41 = (void *)v9;
      if (v11)
      {
        v44 = v10;
        uint64_t v45 = *(void *)v57;
        do
        {
          uint64_t v12 = 0;
          uint64_t v46 = v11;
          do
          {
            if (*(void *)v57 != v45) {
              objc_enumerationMutation(v10);
            }
            uint64_t v48 = v12;
            uint64_t v13 = *(void *)(*((void *)&v56 + 1) + 8 * v12);
            context = (void *)MEMORY[0x1AD0D3C30]();
            switch(-[ATXPBExecutableReferenceKey executableType](v13))
            {
              case 1u:
                v14 = (void *)MEMORY[0x1AD0D3C30]();
                uint64_t v15 = [ATXExecutableIdentifier alloc];
                uint64_t v16 = -[ATXPBExecutableReferenceKey executableString](v13);
                v49 = [(ATXExecutableIdentifier *)v15 initWithString:v16];

                goto LABEL_26;
              case 2u:
                v17 = (void *)MEMORY[0x1AD0D3C30]();
                uint64_t v18 = [ATXAction alloc];
                long long v19 = -[ATXPBExecutableReferenceKey executableAction](v13);
                long long v20 = [(ATXAction *)v18 initWithProto:v19];

                if (v20) {
                  v49 = [[ATXExecutableIdentifier alloc] initWithAction:v20];
                }
                else {
                  v49 = 0;
                }
                goto LABEL_25;
              case 3u:
                v17 = (void *)MEMORY[0x1AD0D3C30]();
                id v21 = objc_alloc(MEMORY[0x1E4F67E70]);
                long long v22 = -[ATXPBExecutableReferenceKey executableHeroApp](v13);
                long long v20 = (ATXAction *)[v21 initWithProto:v22];

                if (v20) {
                  v49 = [[ATXExecutableIdentifier alloc] initWithHeroAppPrediction:v20];
                }
                else {
                  v49 = 0;
                }
                goto LABEL_25;
              case 4u:
                v17 = (void *)MEMORY[0x1AD0D3C30]();
                id v23 = objc_alloc(MEMORY[0x1E4F938F0]);
                long long v24 = -[ATXPBExecutableReferenceKey executableInfoSuggestion](v13);
                long long v20 = (ATXAction *)[v23 initWithProto:v24];

                if (v20) {
                  v49 = [[ATXExecutableIdentifier alloc] initWithInfoSuggestion:v20];
                }
                else {
                  v49 = 0;
                }
                goto LABEL_25;
              case 5u:
                v17 = (void *)MEMORY[0x1AD0D3C30]();
                long long v25 = [ATXLinkActionContainer alloc];
                long long v26 = -[ATXPBExecutableReferenceKey executableLinkAction](v13);
                long long v20 = [(ATXLinkActionContainer *)v25 initWithProto:v26];

                if (v20) {
                  v49 = [[ATXExecutableIdentifier alloc] initWithLinkAction:v20];
                }
                else {
                  v49 = 0;
                }
LABEL_25:

LABEL_26:
                if (v49)
                {
                  uint64_t v27 = objc_opt_new();
                  long long v54 = 0u;
                  long long v55 = 0u;
                  long long v52 = 0u;
                  long long v53 = 0u;
                  long long v28 = -[ATXPBExecutableReferenceKey references](v13);
                  uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v67 count:16];
                  v51 = (void *)v27;
                  if (v29)
                  {
                    uint64_t v30 = *(void *)v53;
                    obuint64_t j = v28;
                    do
                    {
                      for (uint64_t i = 0; i != v29; ++i)
                      {
                        if (*(void *)v53 != v30) {
                          objc_enumerationMutation(obj);
                        }
                        uint64_t v32 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                        v33 = (void *)MEMORY[0x1AD0D3C30]();
                        uint64_t v34 = [ATXExecutableReference alloc];
                        v35 = -[ATXPBExecutableReferenceEntry clientModelId](v32);
                        v36 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:-[ATXPBExecutableReferenceEntry date](v32)];
                        BOOL v37 = -[ATXPBExecutableReferenceEntry shouldClearOnEngagement](v32);
                        BOOL v38 = -[ATXPBExecutableReferenceEntry shouldPurge](v32);
                        v39 = -[ATXExecutableReference initWithClientModelId:date:shouldClearOnEngagement:shouldPurge:suggestionIsHidden:](v34, "initWithClientModelId:date:shouldClearOnEngagement:shouldPurge:suggestionIsHidden:", v35, v36, v37, v38, -[ATXPBExecutableReferenceEntry suggestionIsHidden](v32));

                        [v51 addObject:v39];
                      }
                      long long v28 = obj;
                      uint64_t v29 = [obj countByEnumeratingWithState:&v52 objects:v67 count:16];
                    }
                    while (v29);
                  }

                  [(NSMapTable *)v43 setObject:v51 forKey:v49];
                }
                break;
              default:
                break;
            }
            v10 = v44;
            uint64_t v12 = v48 + 1;
          }
          while (v48 + 1 != v46);
          uint64_t v11 = [v44 countByEnumeratingWithState:&v56 objects:v68 count:16];
        }
        while (v11);
      }
    }
    else
    {
      v43 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    }
    _Block_object_dispose(&v61, 8);

    id v4 = v42;
  }

  return v43;
}

uint64_t __48__ATXExecutableReferenceManager__loadReferences__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _readData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)_writeReferences:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSMapTable *)a3;
  id v5 = v4;
  if (v4)
  {
    if (self->__cachedExecutableToReferenceMapForBatchUpdates == v4)
    {
      self->__cachedExecutableToReferenceMapNeedsWrite = 1;
    }
    else
    {
      long long v25 = self;
      int v6 = __atxlog_handle_default();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[ATXExecutableReferenceManager _writeReferences:](v6);
      }

      long long v26 = (void *)MEMORY[0x1AD0D3C30]();
      uint64_t v29 = objc_alloc_init(ATXPBExecutableReferenceCache);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v27 = v5;
      obuint64_t j = v5;
      uint64_t v30 = [(NSMapTable *)obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v30)
      {
        uint64_t v28 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v40 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            context = (void *)MEMORY[0x1AD0D3C30]();
            uint64_t v9 = objc_alloc_init(ATXPBExecutableReferenceKey);
            switch([v8 type])
            {
              case 0:
                -[ATXPBExecutableReferenceKey setExecutableType:]((uint64_t)v9, 1);
                v10 = [v8 object];
                -[ATXPBExecutableReferenceKey setExecutableString:]((uint64_t)v9, v10);
                goto LABEL_17;
              case 1:
                -[ATXPBExecutableReferenceKey setExecutableType:]((uint64_t)v9, 2);
                v10 = [v8 object];
                uint64_t v11 = [v10 proto];
                -[ATXPBExecutableReferenceKey setExecutableAction:]((uint64_t)v9, v11);
                goto LABEL_16;
              case 2:
                -[ATXPBExecutableReferenceKey setExecutableType:]((uint64_t)v9, 3);
                v10 = [v8 object];
                uint64_t v11 = [v10 proto];
                -[ATXPBExecutableReferenceKey setExecutableHeroApp:]((uint64_t)v9, v11);
                goto LABEL_16;
              case 3:
                -[ATXPBExecutableReferenceKey setExecutableType:]((uint64_t)v9, 4);
                v10 = [v8 object];
                uint64_t v11 = [v10 proto];
                -[ATXPBExecutableReferenceKey setExecutableInfoSuggestion:]((uint64_t)v9, v11);
                goto LABEL_16;
              case 4:
                -[ATXPBExecutableReferenceKey setExecutableType:]((uint64_t)v9, 5);
                v10 = [v8 object];
                uint64_t v11 = [v10 proto];
                -[ATXPBExecutableReferenceKey setExecutableLinkAction:]((uint64_t)v9, v11);
LABEL_16:

LABEL_17:
                break;
              default:
                break;
            }
            uint64_t v12 = -[NSMapTable objectForKey:](obj, "objectForKey:", v8, v25, v26);
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v36;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v36 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  v17 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                  uint64_t v18 = objc_alloc_init(ATXPBExecutableReferenceEntry);
                  long long v19 = [v17 clientModelId];
                  -[ATXPBExecutableReferenceEntry setClientModelId:]((uint64_t)v18, v19);

                  long long v20 = [v17 date];
                  [v20 timeIntervalSinceReferenceDate];
                  -[ATXPBExecutableReferenceEntry setDate:]((uint64_t)v18, v21);

                  -[ATXPBExecutableReferenceEntry setShouldClearOnEngagement:]((uint64_t)v18, [v17 shouldClearOnEngagement]);
                  -[ATXPBExecutableReferenceEntry setShouldPurge:]((uint64_t)v18, [v17 shouldPurge]);
                  -[ATXPBExecutableReferenceEntry setSuggestionIsHidden:]((uint64_t)v18, [v17 suggestionIsHidden]);
                  -[ATXPBExecutableReferenceKey addReferences:]((uint64_t)v9, v18);
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }
              while (v14);
            }
            -[ATXPBExecutableReferenceCache addKeys:]((uint64_t)v29, v9);
          }
          uint64_t v30 = [(NSMapTable *)obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v30);
      }

      long long v22 = [(ATXPBExecutableReferenceCache *)v29 data];
      id v23 = v22;
      if (v22)
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __50__ATXExecutableReferenceManager__writeReferences___block_invoke;
        v33[3] = &unk_1E5D04FC8;
        v33[4] = v25;
        id v34 = v22;
        +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:@"ATXExecutableReferenceManager" block:v33];
      }
      else
      {
        long long v24 = __atxlog_handle_default();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[ATXExecutableReferenceManager _writeReferences:](v24);
        }
      }
      id v5 = v27;
    }
  }
}

uint64_t __50__ATXExecutableReferenceManager__writeReferences___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeData:*(void *)(a1 + 40)];
}

- (void)recordExecutable:(id)a3 clientModelId:(id)a4 shouldClearEngagement:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  id v8 = a4;
  uint64_t v9 = [(ATXExecutableReferenceManager *)self _loadReferences];
  v10 = [ATXExecutableReference alloc];
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v12 = [(ATXExecutableReference *)v10 initWithClientModelId:v8 date:v11 shouldClearOnEngagement:v5];

  uint64_t v13 = [v9 objectForKey:v16];
  uint64_t v14 = v13;
  if (v13)
  {
    [v13 addObject:v12];
  }
  else
  {
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v12, 0);
    [v9 setObject:v15 forKey:v16];
  }
  [(ATXExecutableReferenceManager *)self _writeReferences:v9];
}

- (id)_pairsForClientModelId:(id)a3 map:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v6;
  uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v8;
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * v8);
        v10 = objc_msgSend(obj, "objectForKey:", v9, v20);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              id v16 = [v15 clientModelId];
              int v17 = [v16 isEqualToString:v5];

              if (v17)
              {
                uint64_t v18 = [[ATXExecutableReferencePair alloc] initWithReference:v15 executable:v9];
                [v7 addObject:v18];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v23 + 1;
      }
      while (v23 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v21);
  }

  return v7;
}

- (id)_executablePairsForSuggestions:(id)a3 clientModelId:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v23 = a4;
  id v24 = (id)objc_opt_new();
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = ATXAllowedEngagementRecordManagerClasses();
        uint64_t v14 = [v12 executableSpecification];
        uint64_t v15 = [v14 executableClassString];
        int v16 = [v13 containsObject:v15];

        if (v16)
        {
          int v17 = [ATXExecutableReference alloc];
          uint64_t v18 = [v12 uiSpecification];
          long long v19 = -[ATXExecutableReference initWithClientModelId:date:shouldClearOnEngagement:](v17, "initWithClientModelId:date:shouldClearOnEngagement:", v23, v6, [v18 shouldClearOnEngagement]);

          uint64_t v20 = ATXExecutableIdentifierForSuggestion(v12);
          uint64_t v21 = [[ATXExecutableReferencePair alloc] initWithReference:v19 executable:v20];
          [v24 addObject:v21];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  return v24;
}

- (void)updateReferencesForProactiveSuggestions:(id)a3 clientModelId:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ATXExecutableReferenceManager *)self _loadReferences];
  uint64_t v9 = [(ATXExecutableReferenceManager *)self _pairsForClientModelId:v7 map:v8];
  long long v56 = v7;
  long long v57 = v6;
  uint64_t v10 = [(ATXExecutableReferenceManager *)self _executablePairsForSuggestions:v6 clientModelId:v7];
  long long v58 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = (void *)[v9 mutableCopy];
  [v11 intersectSet:v10];
  long long v53 = v10;
  uint64_t v12 = (void *)[v10 mutableCopy];
  [v12 minusSet:v11];
  long long v54 = v9;
  uint64_t v13 = (void *)[v9 mutableCopy];
  v51 = v11;
  [v13 minusSet:v11];
  uint64_t v14 = [v12 count];
  BOOL v15 = v14 != 0;
  if (v14) {
    [(ATXExecutableReferenceManager *)self _addExecutablePairs:v12 toMap:v8];
  }
  long long v52 = v12;
  long long v55 = (void *)v8;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v13;
  uint64_t v16 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v65 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        uint64_t v21 = [v20 reference];
        char v22 = [v21 shouldPurge];

        if ((v22 & 1) == 0)
        {
          id v23 = [v20 reference];
          BOOL v15 = 1;
          [v23 setShouldPurge:1];

          id v24 = [v20 reference];
          int v25 = [v24 suggestionIsHidden];

          if (v25)
          {
            long long v26 = __atxlog_handle_default();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              long long v27 = (objc_class *)objc_opt_class();
              long long v28 = NSStringFromClass(v27);
              long long v29 = [v20 reference];
              *(_DWORD *)buf = 138412546;
              v70 = v28;
              __int16 v71 = 2112;
              v72 = v29;
              _os_log_impl(&dword_1A790D000, v26, OS_LOG_TYPE_DEFAULT, "%@ - updateReferencesForProactiveSuggestions marked hidden reference as purgable: %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
    }
    while (v17);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v30 = v51;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v61;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v61 != v33) {
          objc_enumerationMutation(v30);
        }
        long long v35 = *(void **)(*((void *)&v60 + 1) + 8 * v34);
        long long v36 = [v35 reference];
        if (![v36 shouldPurge]) {
          goto LABEL_27;
        }
        long long v37 = [v35 reference];
        long long v38 = [v37 date];
        [v58 timeIntervalSinceDate:v38];
        double v40 = v39;
        double minDurationForTrackedReferencesToStayAround = self->_minDurationForTrackedReferencesToStayAround;

        if (v40 < minDurationForTrackedReferencesToStayAround)
        {
          long long v42 = [v35 reference];
          int v43 = [v42 shouldPurge];

          if (v43)
          {
            v44 = [v35 reference];
            [v44 setShouldPurge:0];

            uint64_t v45 = [v35 reference];
            int v46 = [v45 suggestionIsHidden];

            if (v46)
            {
              long long v36 = __atxlog_handle_default();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                v47 = (objc_class *)objc_opt_class();
                uint64_t v48 = NSStringFromClass(v47);
                v49 = [v35 reference];
                *(_DWORD *)buf = 138412546;
                v70 = v48;
                __int16 v71 = 2112;
                v72 = v49;
                _os_log_impl(&dword_1A790D000, v36, OS_LOG_TYPE_DEFAULT, "%@ - updateReferencesForProactiveSuggestions unmarked hidden reference as purgable: %@", buf, 0x16u);
              }
              BOOL v15 = 1;
LABEL_27:

              goto LABEL_28;
            }
            BOOL v15 = 1;
          }
        }
LABEL_28:
        ++v34;
      }
      while (v32 != v34);
      uint64_t v50 = [v30 countByEnumeratingWithState:&v60 objects:v68 count:16];
      uint64_t v32 = v50;
    }
    while (v50);
  }

  [(ATXExecutableReferenceManager *)self _purgeReferencesIfPossibleInMap:v55 forceWrite:v15];
}

- (unint64_t)referenceCountForExecutable:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXExecutableReferenceManager *)self _loadReferences];
  id v6 = [v5 objectForKey:v4];

  unint64_t v7 = [v6 count];
  return v7;
}

- (id)clientModelIdsForExecutable:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ATXExecutableReferenceManager *)self _loadReferences];
  id v6 = [v5 objectForKey:v4];
  unint64_t v7 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "clientModelId", (void)v17);

        if (v14)
        {
          BOOL v15 = [v13 clientModelId];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (BOOL)canExecutableClearOnEngagement:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ATXExecutableReferenceManager *)self _loadReferences];
  [v5 objectForKey:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "shouldClearOnEngagement", (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)isExecutableHidden:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ATXExecutableReferenceManager *)self _loadReferences];
  [v5 objectForKey:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "suggestionIsHidden", (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)referencesForClientModelId:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  [(ATXExecutableReferenceManager *)self _loadReferences];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v8 = [obj objectForKey:v7];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = [*(id *)(*((void *)&v19 + 1) + 8 * j) clientModelId];
              int v14 = [v13 isEqualToString:v4];

              if (v14) {
                [v5 addObject:v7];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v10);
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }

  return v5;
}

- (void)markReferencesAsPurgableFromClientModelIdIfPossible:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v31 = self;
  id v5 = [(ATXExecutableReferenceManager *)self _loadReferences];
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v7 = v5;
    uint64_t v28 = [v7 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v28)
    {
      char v8 = 0;
      long long v25 = v5;
      uint64_t v26 = *(void *)v37;
      long long v27 = v7;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v7);
          }
          uint64_t v30 = v9;
          uint64_t v10 = *(void *)(*((void *)&v36 + 1) + 8 * v9);
          context = (void *)MEMORY[0x1AD0D3C30]();
          uint64_t v11 = [v7 objectForKey:v10];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v33 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                uint64_t v17 = objc_msgSend(v16, "clientModelId", v25);
                int v18 = [v17 isEqualToString:v4];

                if (v18)
                {
                  if ([v16 suggestionIsHidden])
                  {
                    if ([v16 suggestionIsHidden])
                    {
                      long long v19 = [v16 date];
                      [v6 timeIntervalSinceDate:v19];
                      double v21 = v20;

                      if (v21 > 0.0)
                      {
                        [v16 setShouldPurge:1];
                        long long v22 = __atxlog_handle_default();
                        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                        {
                          long long v23 = (objc_class *)objc_opt_class();
                          long long v24 = NSStringFromClass(v23);
                          *(_DWORD *)buf = 138412546;
                          long long v41 = v24;
                          __int16 v42 = 2112;
                          int v43 = v16;
                          _os_log_impl(&dword_1A790D000, v22, OS_LOG_TYPE_DEFAULT, "%@ - markReferencesAsPurgableFromClientModelIdIfPossible marked hidden reference as purgable: %@", buf, 0x16u);
                        }
                      }
                    }
                    char v8 = 1;
                  }
                  else
                  {
                    char v8 = 1;
                    [v16 setShouldPurge:1];
                  }
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v44 count:16];
            }
            while (v13);
          }

          uint64_t v9 = v30 + 1;
          id v7 = v27;
        }
        while (v30 + 1 != v28);
        uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v28);

      id v5 = v25;
      if (v8) {
        [(ATXExecutableReferenceManager *)v31 _writeReferences:v27];
      }
    }
    else
    {
    }
  }
}

- (void)updateDateOfReferenceForExecutable:(id)a3 clientModelId:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(ATXExecutableReferenceManager *)self _loadReferences];
  uint64_t v9 = [v8 objectForKey:v6];
  if ([v9 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      double v21 = v9;
      long long v22 = v8;
      long long v23 = self;
      id v24 = v6;
      char v13 = 0;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v17 = (void *)MEMORY[0x1AD0D3C30]();
          int v18 = [v16 clientModelId];
          int v19 = [v18 isEqualToString:v7];

          if (v19)
          {
            double v20 = [MEMORY[0x1E4F1C9C8] date];
            [v16 updateDateTo:v20];

            char v13 = 1;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);

      id v6 = v24;
      uint64_t v9 = v21;
      char v8 = v22;
      if (v13) {
        [(ATXExecutableReferenceManager *)v23 _writeReferences:v22];
      }
    }
    else
    {
    }
  }
}

- (void)markReferenceAsHiddenForExecutable:(id)a3 clientModelId:(id)a4 untilDate:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v26 = a5;
  id v10 = [(ATXExecutableReferenceManager *)self _loadReferences];
  uint64_t v11 = [v10 objectForKey:v8];
  if ([v11 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      long long v22 = v11;
      long long v23 = v10;
      id v24 = self;
      id v25 = v8;
      char v15 = 0;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v12);
          }
          int v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          int v19 = (void *)MEMORY[0x1AD0D3C30]();
          double v20 = [v18 clientModelId];
          int v21 = [v20 isEqualToString:v9];

          if (v21)
          {
            [v18 updateDateTo:v26];
            char v15 = 1;
            [v18 setSuggestionIsHidden:1];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v14);

      id v8 = v25;
      uint64_t v11 = v22;
      id v10 = v23;
      if (v15) {
        [(ATXExecutableReferenceManager *)v24 _writeReferences:v23];
      }
    }
    else
    {
    }
  }
}

- (void)purgeReferencesIfPossible
{
  id v3 = [(ATXExecutableReferenceManager *)self _loadReferences];
  [(ATXExecutableReferenceManager *)self _purgeReferencesIfPossibleInMap:v3 forceWrite:0];
}

- (void)_purgeReferencesIfPossibleInMap:(id)a3 forceWrite:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v31 = v6;
  id v8 = (void *)[v6 copy];
  uint64_t v29 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (!v29)
  {

    if (!v4) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  BOOL v26 = v4;
  int v9 = 0;
  uint64_t v27 = *(void *)v39;
  long long v28 = v8;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v39 != v27) {
        objc_enumerationMutation(v8);
      }
      uint64_t v33 = v10;
      uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * v10);
      context = (void *)MEMORY[0x1AD0D3C30]();
      uint64_t v30 = v11;
      id v12 = [v31 objectForKey:v11];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v13 = (void *)[v12 copy];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v13);
            }
            int v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if ([v18 shouldPurge])
            {
              int v19 = [v18 date];
              [v7 timeIntervalSinceDate:v19];
              double v21 = v20;
              double minDurationForTrackedReferencesToStayAround = self->_minDurationForTrackedReferencesToStayAround;

              if (v21 >= minDurationForTrackedReferencesToStayAround)
              {
                [v12 removeObject:v18];
                if ([v18 suggestionIsHidden])
                {
                  long long v23 = __atxlog_handle_default();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    id v24 = (objc_class *)objc_opt_class();
                    id v25 = NSStringFromClass(v24);
                    *(_DWORD *)buf = 138412546;
                    int v43 = v25;
                    __int16 v44 = 2112;
                    uint64_t v45 = v18;
                    _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_DEFAULT, "%@ - purged hidden reference: %@", buf, 0x16u);
                  }
                }
                int v9 = 1;
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v46 count:16];
        }
        while (v15);
      }

      if (![v12 count])
      {
        [v31 removeObjectForKey:v30];
        int v9 = 1;
      }

      uint64_t v10 = v33 + 1;
      id v8 = v28;
    }
    while (v33 + 1 != v29);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v47 count:16];
  }
  while (v29);

  if ((v9 | v26)) {
LABEL_25:
  }
    [(ATXExecutableReferenceManager *)self _writeReferences:v31];
LABEL_26:
}

- (void)purgeReferencesForSuggestions:(id)a3 clientModelId:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v35 = [(ATXExecutableReferenceManager *)self _loadReferences];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v31 = self;
    char v11 = 0;
    uint64_t v12 = *(void *)v44;
    uint64_t v32 = *(void *)v44;
    id v33 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v34 = v10;
      do
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v38 = v13;
        uint64_t v14 = *(void **)(*((void *)&v43 + 1) + 8 * v13);
        uint64_t v37 = MEMORY[0x1AD0D3C30]();
        uint64_t v15 = ATXAllowedEngagementRecordManagerClasses();
        uint64_t v16 = [v14 executableSpecification];
        uint64_t v17 = [v16 executableClassString];
        int v18 = [v15 containsObject:v17];

        if (v18)
        {
          int v19 = ATXExecutableIdentifierForSuggestion(v14);
          if (v19)
          {
            double v20 = [v35 objectForKey:v19];
            if ([v20 count])
            {
              long long v36 = v19;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              double v21 = (void *)[v20 copy];
              uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v40;
                do
                {
                  for (uint64_t i = 0; i != v23; ++i)
                  {
                    if (*(void *)v40 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    BOOL v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                    if (objc_msgSend(v26, "shouldPurge", v31))
                    {
                      uint64_t v27 = [v26 clientModelId];
                      int v28 = [v27 isEqualToString:v7];

                      if (v28)
                      {
                        [v20 removeObject:v26];
                        char v11 = 1;
                      }
                    }
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
                }
                while (v23);
              }

              uint64_t v12 = v32;
              id v8 = v33;
              uint64_t v10 = v34;
              int v19 = v36;
              if (![v20 count])
              {
                [v35 removeObjectForKey:v36];
                char v11 = 1;
              }
            }
          }
          uint64_t v30 = (void *)v37;
          uint64_t v29 = v38;
        }
        else
        {
          uint64_t v30 = (void *)v37;
          uint64_t v29 = v38;
        }
        uint64_t v13 = v29 + 1;
      }
      while (v13 != v10);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v10);

    if (v11) {
      [(ATXExecutableReferenceManager *)v31 _writeReferences:v35];
    }
  }
  else
  {
  }
}

- (void)addReferencesForSuggestions:(id)a3 clientModelId:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1AD0D3C30]();
  id v8 = [(ATXExecutableReferenceManager *)self _loadReferences];
  uint64_t v9 = [(ATXExecutableReferenceManager *)self _executablePairsForSuggestions:v10 clientModelId:v6];
  if ([v9 count])
  {
    [(ATXExecutableReferenceManager *)self _addExecutablePairs:v9 toMap:v8];
    [(ATXExecutableReferenceManager *)self _writeReferences:v8];
  }
}

- (void)_addExecutablePairs:(id)a3 toMap:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        char v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 executable];
        uint64_t v13 = [v6 objectForKey:v12];

        if (v13)
        {
          uint64_t v14 = [v11 reference];
          [v13 addObject:v14];
        }
        else
        {
          id v15 = objc_alloc(MEMORY[0x1E4F1CA80]);
          uint64_t v14 = [v11 reference];
          uint64_t v16 = objc_msgSend(v15, "initWithObjects:", v14, 0);
          uint64_t v17 = [v11 executable];
          [v6 setObject:v16 forKey:v17];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedExecutableToReferenceMapForBatchUpdates, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (void)_readData
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_1_7(&dword_1A790D000, v1, v2, "Couldn't open recently engaged cache references file: [%i] %s", v3, v4, v5, v6, v7);
}

- (void)_loadReferences
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A790D000, log, OS_LOG_TYPE_DEBUG, "Loading recently engaged references from disk", v1, 2u);
}

- (void)_writeReferences:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "Could not archive references with error", v1, 2u);
}

- (void)_writeReferences:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A790D000, log, OS_LOG_TYPE_DEBUG, "Writing recently engaged cache references", v1, 2u);
}

@end