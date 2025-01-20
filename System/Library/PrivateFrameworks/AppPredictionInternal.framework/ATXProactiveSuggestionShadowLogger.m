@interface ATXProactiveSuggestionShadowLogger
- (ATXProactiveSuggestionShadowLogger)initWithClientModelIds:(id)a3 shadowEventPublisher:(id)a4 clientModelPublisher:(id)a5 contextPublisher:(id)a6 bookmarkURLPath:(id)a7;
- (BPSPublisher)clientModelPublisher;
- (BPSPublisher)contextPublisher;
- (BPSPublisher)shadowEventPublisher;
- (NSSet)clientModelIds;
- (NSURL)bookmarkURLPath;
- (id)newBookmarkWithURLPath:(id)a3 versionNumber:(id)a4 bookmark:(id)a5 metadata:(id)a6;
- (id)shadowLoggingPublisher;
- (void)enumerateShadowLoggingResultsWithBlock:(id)a3 clientModelCacheUpdatedBlock:(id)a4 completionBlock:(id)a5;
- (void)enumerateShadowLoggingResultsWithBlock:(id)a3 completionBlock:(id)a4;
- (void)setClientModelPublisher:(id)a3;
- (void)setContextPublisher:(id)a3;
- (void)setShadowEventPublisher:(id)a3;
@end

@implementation ATXProactiveSuggestionShadowLogger

- (ATXProactiveSuggestionShadowLogger)initWithClientModelIds:(id)a3 shadowEventPublisher:(id)a4 clientModelPublisher:(id)a5 contextPublisher:(id)a6 bookmarkURLPath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXProactiveSuggestionShadowLogger;
  v17 = [(ATXProactiveSuggestionShadowLogger *)&v23 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    clientModelIds = v17->_clientModelIds;
    v17->_clientModelIds = (NSSet *)v18;

    objc_storeStrong((id *)&v17->_shadowEventPublisher, a4);
    objc_storeStrong((id *)&v17->_clientModelPublisher, a5);
    objc_storeStrong((id *)&v17->_contextPublisher, a6);
    uint64_t v20 = [v16 copy];
    bookmarkURLPath = v17->_bookmarkURLPath;
    v17->_bookmarkURLPath = (NSURL *)v20;
  }
  return v17;
}

- (void)enumerateShadowLoggingResultsWithBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_completionBlock___block_invoke;
  v12[3] = &unk_1E68B4EA8;
  id v13 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_completionBlock___block_invoke_3;
  v10[3] = &unk_1E68B4EF0;
  id v11 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ATXProactiveSuggestionShadowLogger *)self enumerateShadowLoggingResultsWithBlock:v12 clientModelCacheUpdatedBlock:&__block_literal_global_209 completionBlock:v10];
}

uint64_t __93__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateShadowLoggingResultsWithBlock:(id)a3 clientModelCacheUpdatedBlock:(id)a4 completionBlock:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  bookmarkURLPath = self->_bookmarkURLPath;
  if (bookmarkURLPath)
  {
    id v12 = [MEMORY[0x1E4F4B618] bookmarkFromURLPath:bookmarkURLPath maxFileSize:kATXProactiveSuggestionShadowLoggerMaxOnDiskFileSizeInBytes versionNumber:&unk_1F27F2250];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "%@ - starting enumeration with bookmark: %@", buf, 0x16u);
  }
  id v16 = [(ATXProactiveSuggestionShadowLogger *)self shadowLoggingPublisher];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v39 = 0;
  v17 = [v12 bookmark];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __122__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_clientModelCacheUpdatedBlock_completionBlock___block_invoke;
  v29[3] = &unk_1E68B4F18;
  v29[4] = self;
  id v18 = v10;
  id v30 = v18;
  v31 = buf;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __122__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_clientModelCacheUpdatedBlock_completionBlock___block_invoke_18;
  v26[3] = &unk_1E68B4F40;
  id v19 = v9;
  id v27 = v19;
  id v20 = v8;
  id v28 = v20;
  id v21 = (id)[v16 sinkWithBookmark:v17 completion:v29 receiveInput:v26];

  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    v22 = (void *)MEMORY[0x1D25F6CC0]();
    objc_super v23 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      *(_DWORD *)v32 = 138412802;
      v33 = v25;
      __int16 v34 = 1024;
      int v35 = 1;
      __int16 v36 = 2112;
      uint64_t v37 = 0;
      _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "%@ - invoking outside completion handler with success: %u, error: %@", v32, 0x1Cu);
    }
    (*((void (**)(id, uint64_t, void))v18 + 2))(v18, 1, 0);
  }

  _Block_object_dispose(buf, 8);
}

void __122__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_clientModelCacheUpdatedBlock_completionBlock___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 error];
  uint64_t v8 = [v5 state];
  int v9 = v8 == 0;
  id v10 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138412802;
    v25 = v12;
    __int16 v26 = 1024;
    BOOL v27 = v8 == 0;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "%@ - sinkWithBookmark complete with completion success: %u, error: %@", buf, 0x1Cu);
  }
  if (!v8 && !v7)
  {
    id v13 = (void *)a1[4];
    uint64_t v14 = v13[2];
    if (v14)
    {
      id v15 = (void *)[v13 newBookmarkWithURLPath:v14 versionNumber:&unk_1F27F2250 bookmark:v6 metadata:0];
      id v23 = 0;
      int v9 = [v15 saveBookmarkWithError:&v23];
      id v7 = v23;
      id v16 = __atxlog_handle_blending_ecosystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        id v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138412802;
        v25 = v18;
        __int16 v26 = 1024;
        BOOL v27 = v9;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "%@ - saved new bookmark with success: %u, error: %@", buf, 0x1Cu);
      }
    }
    else
    {
      id v7 = 0;
      int v9 = 1;
    }
  }
  id v19 = (void *)MEMORY[0x1D25F6CC0]();
  id v20 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138412802;
    v25 = v22;
    __int16 v26 = 1024;
    BOOL v27 = v9;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "%@ - invoking completion handler with success: %u, error: %@", buf, 0x1Cu);
  }
  (*(void (**)(void))(a1[5] + 16))();
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
}

void __122__ATXProactiveSuggestionShadowLogger_enumerateShadowLoggingResultsWithBlock_clientModelCacheUpdatedBlock_completionBlock___block_invoke_18(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void *)MEMORY[0x1D25F6CC0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = a1 + 32;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v4 = a1 + 40;
  }
  (*(void (**)(void))(*(void *)v4 + 16))();
LABEL_6:
}

- (id)shadowLoggingPublisher
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v3 = [(ATXProactiveSuggestionShadowLogger *)self clientModelPublisher];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke;
  v14[3] = &unk_1E68AF140;
  v14[4] = self;
  uint64_t v4 = [v3 filterWithIsIncluded:v14];

  id v5 = [(ATXProactiveSuggestionShadowLogger *)self contextPublisher];
  v15[0] = v5;
  id v6 = [(ATXProactiveSuggestionShadowLogger *)self shadowEventPublisher];
  v15[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v8 = [v4 orderedMergeWithOthers:v7 comparator:&__block_literal_global_26_2];

  int v9 = objc_opt_new();
  id v10 = [v8 scanWithInitial:v9 nextPartialResult:&__block_literal_global_31];

  id v11 = [v10 filterWithIsIncluded:&__block_literal_global_35_3];
  id v12 = [v11 flatMapWithTransform:&__block_literal_global_38_2];

  return v12;
}

uint64_t __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 8);
    id v6 = [v3 clientModelId];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

ATXProactiveSuggestionShadowLoggingContextEventTuple *__60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 eventBody];
  if (v6)
  {
    uint64_t v7 = [v4 shadowLoggingContext];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 updateWithClientModelCacheUpdate:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v7 updateWithContext:v6];
      }
    }
    double v8 = [[ATXProactiveSuggestionShadowLoggingContextEventTuple alloc] initWithEvent:v5 shadowLoggingContext:v7];
  }
  else
  {
    double v8 = (ATXProactiveSuggestionShadowLoggingContextEventTuple *)v4;
  }

  return v8;
}

uint64_t __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 event];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 eventBody];
    if (v4)
    {
      objc_opt_class();
      char v5 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

id __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_new();
  id v4 = [v2 event];
  char v5 = v4;
  if (!v4)
  {
    uint64_t v7 = [v3 bpsPublisher];
    goto LABEL_12;
  }
  id v6 = [v4 eventBody];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v8 = [v2 shadowLoggingContext];
      double v9 = [v8 context];

      if (v9)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [v5 timestamp];
        uint64_t v11 = objc_msgSend(v10, "initWithTimeIntervalSinceReferenceDate:");
        id v12 = [v8 clientModelCacheUpdates];
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        id v18 = __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_6;
        id v19 = &unk_1E68B4FC8;
        id v20 = v6;
        id v21 = v11;
        id v22 = v8;
        id v13 = v3;
        id v23 = v13;
        id v14 = v11;
        [v12 enumerateKeysAndObjectsUsingBlock:&v16];

        uint64_t v7 = objc_msgSend(v13, "bpsPublisher", v16, v17, v18, v19);
      }
      else
      {
        uint64_t v7 = [v3 bpsPublisher];
      }

      goto LABEL_11;
    }
    [v3 addObject:v6];
  }
  uint64_t v7 = [v3 bpsPublisher];
LABEL_11:

LABEL_12:
  return v7;
}

void __60__ATXProactiveSuggestionShadowLogger_shadowLoggingPublisher__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  char v5 = [ATXProactiveSuggestionShadowLoggingResult alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  double v8 = [*(id *)(a1 + 48) context];
  double v9 = [(ATXProactiveSuggestionShadowLoggingResult *)v5 initWithShadowEvent:v6 shadowEventDate:v7 clientModelCacheUpdate:v4 context:v8];

  [*(id *)(a1 + 56) addObject:v9];
}

- (id)newBookmarkWithURLPath:(id)a3 versionNumber:(id)a4 bookmark:(id)a5 metadata:(id)a6
{
  double v9 = (objc_class *)MEMORY[0x1E4F4B618];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[[v9 alloc] initWithURLPath:v13 versionNumber:v12 bookmark:v11 metadata:v10];

  return v14;
}

- (NSSet)clientModelIds
{
  return self->_clientModelIds;
}

- (NSURL)bookmarkURLPath
{
  return self->_bookmarkURLPath;
}

- (BPSPublisher)shadowEventPublisher
{
  return self->_shadowEventPublisher;
}

- (void)setShadowEventPublisher:(id)a3
{
}

- (BPSPublisher)clientModelPublisher
{
  return self->_clientModelPublisher;
}

- (void)setClientModelPublisher:(id)a3
{
}

- (BPSPublisher)contextPublisher
{
  return self->_contextPublisher;
}

- (void)setContextPublisher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextPublisher, 0);
  objc_storeStrong((id *)&self->_clientModelPublisher, 0);
  objc_storeStrong((id *)&self->_shadowEventPublisher, 0);
  objc_storeStrong((id *)&self->_bookmarkURLPath, 0);
  objc_storeStrong((id *)&self->_clientModelIds, 0);
}

@end