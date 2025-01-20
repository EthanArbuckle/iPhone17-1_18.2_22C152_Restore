@interface MapsSuggestionsSuppressor
- (BOOL)isSuppressedEntry:(id)a3;
- (BOOL)loadSuppressedEntries;
- (BOOL)saveSuppressedEntries;
- (BOOL)suppressEntry:(id)a3 forTime:(double)a4;
- (MapsSuggestionsSuppressor)init;
- (MapsSuggestionsSuppressor)initWithFilePath:(id)a3;
- (NSString)uniqueName;
- (id)test_dateUntilSuppressedEntry:(id)a3;
- (uint64_t)_saveSuppressedEntries;
- (void)awaitQueue;
- (void)purge;
- (void)test_deleteSuppressedEntriesFile;
@end

@implementation MapsSuggestionsSuppressor

uint64_t __50__MapsSuggestionsSuppressor_loadSuppressedEntries__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (*(void *)(v1 + 16))
    {
      v2 = [*(id *)(v1 + 24) innerQueue];
      dispatch_assert_queue_V2(v2);

      v3 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v4 = [v3 fileExistsAtPath:*(void *)(v1 + 16)];

      if (v4)
      {
        uint64_t v5 = *(void *)(v1 + 16);
        id v26 = 0;
        v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5 options:0 error:&v26];
        v7 = (char *)v26;
        if (v7)
        {
          v8 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v7;
            _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "Failed to read suppressed entries to disk: %{public}@", buf, 0xCu);
          }

          uint64_t v1 = 0;
        }
        else if (v6)
        {
          v12 = (id *)(id)v1;
          objc_sync_enter(v12);
          id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v14 = objc_opt_class();
          uint64_t v15 = objc_opt_class();
          v16 = objc_msgSend(v13, "initWithObjects:", v14, v15, objc_opt_class(), 0);
          id v25 = 0;
          uint64_t v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v16 fromData:v6 error:&v25];
          id v18 = v25;
          id v19 = v12[1];
          v12[1] = (id)v17;

          uint64_t v1 = v18 == 0;
          if (v18)
          {
            v20 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v28 = "-[MapsSuggestionsSuppressor _loadSuppressedEntries]";
              __int16 v29 = 2112;
              *(void *)v30 = v18;
              _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_ERROR, "%s failed with error: %@", buf, 0x16u);
            }

            [v12[1] removeAllObjects];
          }
          else
          {
            v22 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v23 = (const char *)v12[1];
              *(_DWORD *)buf = 138412290;
              v28 = v23;
              _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_DEBUG, "Suppressed Entries loaded from file are %@", buf, 0xCu);
            }
          }
          objc_sync_exit(v12);
        }
        else
        {
          v21 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A70DF000, v21, OS_LOG_TYPE_DEBUG, "Suppressed entries file returned nil content. Nothing to load", buf, 2u);
          }

          [*(id *)(v1 + 8) removeAllObjects];
          uint64_t v1 = 1;
        }
      }
      else
      {
        v10 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v11 = *(const char **)(v1 + 16);
          *(_DWORD *)buf = 138543362;
          v28 = v11;
          _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Suppressed entries file '%{public}@' does not exist. Nothing to load", buf, 0xCu);
        }

        [*(id *)(v1 + 8) removeAllObjects];
        return 1;
      }
    }
    else
    {
      v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSuppressor.m";
        __int16 v29 = 1024;
        *(_DWORD *)v30 = 110;
        *(_WORD *)&v30[4] = 2082;
        *(void *)&v30[6] = "-[MapsSuggestionsSuppressor _loadSuppressedEntries]";
        __int16 v31 = 2082;
        v32 = "nil == (_suppressionEntriesFilePath)";
        _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires file path to be set", buf, 0x26u);
      }

      return 0;
    }
  }
  return v1;
}

- (MapsSuggestionsSuppressor)init
{
  v3 = MapsSuggestionsPathForSuppressedEntries();
  char v4 = [(MapsSuggestionsSuppressor *)self initWithFilePath:v3];

  return v4;
}

uint64_t __50__MapsSuggestionsSuppressor_saveSuppressedEntries__block_invoke(uint64_t a1)
{
  return -[MapsSuggestionsSuppressor _saveSuppressedEntries](*(void *)(a1 + 32));
}

- (uint64_t)_saveSuppressedEntries
{
  uint64_t v1 = a1;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BOOL v2 = *(void *)(a1 + 16) == 0;
    v3 = GEOFindOrCreateLog();
    char v4 = v3;
    if (v2)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSuppressor.m";
        __int16 v16 = 1024;
        int v17 = 153;
        __int16 v18 = 2082;
        id v19 = "-[MapsSuggestionsSuppressor _saveSuppressedEntries]";
        __int16 v20 = 2082;
        v21 = "nil == (_suppressionEntriesFilePath)";
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires file path to be set", buf, 0x26u);
      }
      uint64_t v1 = 0;
    }
    else
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(const char **)(v1 + 8);
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v5;
        _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_INFO, "Suppressed Entries writing to file are %@", buf, 0xCu);
      }

      v6 = (id)v1;
      objc_sync_enter(v6);
      v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (const char *)v6[1];
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v8;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_INFO, "Suppressed Entries writing to file are %@", buf, 0xCu);
      }

      char v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6[1] requiringSecureCoding:1 error:0];
      objc_sync_exit(v6);

      uint64_t v9 = *(void *)(v1 + 16);
      id v13 = 0;
      uint64_t v1 = [v4 writeToFile:v9 options:0 error:&v13];
      v10 = (char *)v13;
      if ((v1 & 1) == 0)
      {
        v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v15 = v10;
          _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "Failed to write suppressed entries to disk: %{public}@", buf, 0xCu);
        }
      }
    }
  }
  return v1;
}

BOOL __47__MapsSuggestionsSuppressor_isSuppressedEntry___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  BOOL v2 = [*(id *)(a1 + 40) uniqueIdentifier];
  v3 = [v1 objectForKeyedSubscript:v2];

  if (v3) {
    BOOL v4 = MapsSuggestionsIsInTheFuture(v3);
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isSuppressedEntry:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__MapsSuggestionsSuppressor_isSuppressedEntry___block_invoke;
  v8[3] = &unk_1E5CBAA08;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(queue) = [(MapsSuggestionsQueue *)queue syncBOOLReturningBlock:v8];

  return (char)queue;
}

- (MapsSuggestionsSuppressor)initWithFilePath:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsSuppressor;
  uint64_t v5 = [(MapsSuggestionsSuppressor *)&v13 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    suppressionEntries = v5->_suppressionEntries;
    v5->_suppressionEntries = v6;

    uint64_t v8 = [v4 copy];
    suppressionEntriesFilePath = v5->_suppressionEntriesFilePath;
    v5->_suppressionEntriesFilePath = (NSString *)v8;

    v10 = [[MapsSuggestionsQueue alloc] initSerialQueueWithName:@"MapsSuggestionsSuppressorQueue"];
    queue = v5->_queue;
    v5->_queue = v10;

    [(MapsSuggestionsSuppressor *)v5 loadSuppressedEntries];
  }

  return v5;
}

- (void)purge
{
  [(MapsSuggestionsSuppressor *)self loadSuppressedEntries];
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__MapsSuggestionsSuppressor_purge__block_invoke;
  v4[3] = &unk_1E5CB8D10;
  v4[4] = self;
  [(MapsSuggestionsQueue *)queue syncBlock:v4];
  [(MapsSuggestionsSuppressor *)self saveSuppressedEntries];
}

- (BOOL)saveSuppressedEntries
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MapsSuggestionsSuppressor_saveSuppressedEntries__block_invoke;
  v4[3] = &unk_1E5CBAA58;
  v4[4] = self;
  return [(MapsSuggestionsQueue *)queue syncBOOLReturningBlock:v4];
}

- (BOOL)loadSuppressedEntries
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__MapsSuggestionsSuppressor_loadSuppressedEntries__block_invoke;
  v4[3] = &unk_1E5CBAA58;
  v4[4] = self;
  return [(MapsSuggestionsQueue *)queue syncBOOLReturningBlock:v4];
}

void __34__MapsSuggestionsSuppressor_purge__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 8);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__MapsSuggestionsSuppressor_purge__block_invoke_19;
    v13[3] = &unk_1E5CBAA30;
    id v4 = v2;
    id v14 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v13];
    uint64_t v5 = [v4 mutableCopy];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v5;

    uint64_t v8 = v14;
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_FAULT, "_suppressionEntries is not a NSDictionary:<%p>", buf, 0xCu);
    }

    uint64_t v11 = [v2 mutableCopy];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v12 + 8);
    *(void *)(v12 + 8) = v11;
  }
}

- (NSString)uniqueName
{
  id v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)suppressEntry:(id)a3 forTime:(double)a4
{
  id v6 = a3;
  v7 = MapsSuggestionsNowWithOffset(a4);
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__MapsSuggestionsSuppressor_suppressEntry_forTime___block_invoke;
  v16[3] = &unk_1E5CB8880;
  v16[4] = self;
  id v9 = v7;
  id v17 = v9;
  id v10 = v6;
  id v18 = v10;
  [(MapsSuggestionsQueue *)queue syncBlock:v16];
  objc_initWeak(&location, self);
  uint64_t v11 = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__MapsSuggestionsSuppressor_suppressEntry_forTime___block_invoke_17;
  v13[3] = &unk_1E5CB8058;
  objc_copyWeak(&v14, &location);
  [(MapsSuggestionsQueue *)v11 asyncBlock:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return 1;
}

void __51__MapsSuggestionsSuppressor_suppressEntry_forTime___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = [*(id *)(a1 + 48) uniqueIdentifier];
  [v3 setObject:v2 forKey:v4];

  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_INFO, "Suppressed Entries about to write to file are : %@", (uint8_t *)&v7, 0xCu);
  }
}

void __51__MapsSuggestionsSuppressor_suppressEntry_forTime___block_invoke_17(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    -[MapsSuggestionsSuppressor _saveSuppressedEntries]((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      uint64_t v5 = "MapsSuggestionsSuppressor.m";
      __int16 v6 = 1026;
      int v7 = 80;
      __int16 v8 = 2082;
      uint64_t v9 = "-[MapsSuggestionsSuppressor suppressEntry:forTime:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void __34__MapsSuggestionsSuppressor_purge__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (MapsSuggestionsIsInTheFuture(v5)) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (void)test_deleteSuppressedEntriesFile
{
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__MapsSuggestionsSuppressor_test_deleteSuppressedEntriesFile__block_invoke;
  v3[3] = &unk_1E5CB8D10;
  v3[4] = self;
  [(MapsSuggestionsQueue *)queue syncBlock:v3];
}

void __61__MapsSuggestionsSuppressor_test_deleteSuppressedEntriesFile__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v5 = 0;
  [v2 removeItemAtPath:v3 error:&v5];
  id v4 = v5;

  if ([*(id *)(*(void *)(a1 + 32) + 8) count]) {
    [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  }
}

- (id)test_dateUntilSuppressedEntry:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__MapsSuggestionsSuppressor_test_dateUntilSuppressedEntry___block_invoke;
    v10[3] = &unk_1E5CBAA80;
    v10[4] = self;
    id v11 = v4;
    int v7 = [(MapsSuggestionsQueue *)queue syncReturningBlock:v10];
  }
  else
  {
    __int16 v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      objc_super v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSuppressor.m";
      __int16 v14 = 1024;
      int v15 = 204;
      __int16 v16 = 2082;
      id v17 = "-[MapsSuggestionsSuppressor test_dateUntilSuppressedEntry:]";
      __int16 v18 = 2082;
      id v19 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }

    int v7 = 0;
  }

  return v7;
}

id __59__MapsSuggestionsSuppressor_test_dateUntilSuppressedEntry___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = [*(id *)(a1 + 40) uniqueIdentifier];
  uint64_t v3 = [v1 objectForKeyedSubscript:v2];

  return v3;
}

- (void)awaitQueue
{
  uint64_t v2 = [(MapsSuggestionsQueue *)self->_queue innerQueue];
  dispatch_barrier_sync(v2, &__block_literal_global_37);
}

void __39__MapsSuggestionsSuppressor_awaitQueue__block_invoke()
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_suppressionEntriesFilePath, 0);
  objc_storeStrong((id *)&self->_suppressionEntries, 0);
}

@end