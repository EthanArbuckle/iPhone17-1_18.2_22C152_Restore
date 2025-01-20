@interface ATXVerticalModelsCache
- (ATXVerticalModelsCache)init;
- (BOOL)_writeCache:(id)a3 path:(id)a4 withError:(id *)a5;
- (BOOL)writeWebsiteSuggestionsCache:(id)a3;
- (BOOL)writeWebsiteTitlesAndSubtitlesCache:(id)a3;
- (id)_fetchWebsiteCacheWithPath:(id)a3 error:(id *)a4;
- (id)_fetchWebsiteTitlesAndSubtitlesCacheWithPath:(id)a3 error:(id *)a4;
- (id)fetchWebsiteSuggestionsCache;
- (id)fetchWebsiteTitlesAndSubtitlesCache;
@end

@implementation ATXVerticalModelsCache

- (ATXVerticalModelsCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXVerticalModelsCache;
  v2 = [(ATXVerticalModelsCache *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.proactive.ATXVerticalModelsCache", v3);

    id v5 = objc_alloc(MEMORY[0x1E4F93B80]);
    v6 = objc_opt_new();
    uint64_t v7 = [v5 initWithGuardedData:v6 serialQueue:v4];
    lock = v2->_lock;
    v2->_lock = (_PASQueueLock *)v7;
  }
  return v2;
}

- (BOOL)writeWebsiteSuggestionsCache:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ATXVerticalModelsCache_writeWebsiteSuggestionsCache___block_invoke;
  v8[3] = &unk_1E68B64E8;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  objc_super v10 = &v11;
  [(_PASQueueLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __55__ATXVerticalModelsCache_writeWebsiteSuggestionsCache___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = [MEMORY[0x1E4F4B650] websiteSuggestionsVerticalModelCacheFilePath];
  id v11 = 0;
  [v4 _writeCache:v5 path:v6 withError:&v11];
  id v7 = v11;

  if (v7)
  {
    v8 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Error while writing website suggestions cache: %@", buf, 0xCu);
    }
    char v9 = 0;
  }
  else
  {
    id v10 = (id)a1[5];
    v8 = v3[1];
    v3[1] = v10;
    char v9 = 1;
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v9;
}

- (BOOL)writeWebsiteTitlesAndSubtitlesCache:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__ATXVerticalModelsCache_writeWebsiteTitlesAndSubtitlesCache___block_invoke;
  v8[3] = &unk_1E68B64E8;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [(_PASQueueLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __62__ATXVerticalModelsCache_writeWebsiteTitlesAndSubtitlesCache___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = [MEMORY[0x1E4F4B650] websiteTitlesAndSubtitlesCacheFilePath];
  id v11 = 0;
  [v4 _writeCache:v5 path:v6 withError:&v11];
  id v7 = v11;

  if (v7)
  {
    v8 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Error while writing website suggestions cache: %@", buf, 0xCu);
    }
    char v9 = 0;
  }
  else
  {
    id v10 = (id)a1[5];
    v8 = v3[2];
    v3[2] = v10;
    char v9 = 1;
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v9;
}

- (id)fetchWebsiteSuggestionsCache
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__108;
  id v10 = __Block_byref_object_dispose__108;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ATXVerticalModelsCache_fetchWebsiteSuggestionsCache__block_invoke;
  v5[3] = &unk_1E68B6510;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__ATXVerticalModelsCache_fetchWebsiteSuggestionsCache__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3[1];
  if (v4)
  {
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    char v9 = [MEMORY[0x1E4F4B650] websiteSuggestionsVerticalModelCacheFilePath];
    id v18 = 0;
    uint64_t v10 = [v8 _fetchWebsiteCacheWithPath:v9 error:&v18];
    id v11 = v18;
    id v12 = v3[1];
    v3[1] = (id)v10;

    if (v11)
    {
      id v13 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Error while reading website suggestions cache: %@", buf, 0xCu);
      }

      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = MEMORY[0x1E4F1CC08];
    }
    else
    {
      uint64_t v16 = [v3[1] copy];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      v15 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
}

- (id)fetchWebsiteTitlesAndSubtitlesCache
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__108;
  uint64_t v10 = __Block_byref_object_dispose__108;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__ATXVerticalModelsCache_fetchWebsiteTitlesAndSubtitlesCache__block_invoke;
  v5[3] = &unk_1E68B6510;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__ATXVerticalModelsCache_fetchWebsiteTitlesAndSubtitlesCache__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3[2];
  if (v4)
  {
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    char v9 = [MEMORY[0x1E4F4B650] websiteTitlesAndSubtitlesCacheFilePath];
    id v18 = 0;
    uint64_t v10 = [v8 _fetchWebsiteTitlesAndSubtitlesCacheWithPath:v9 error:&v18];
    id v11 = v18;
    id v12 = v3[2];
    v3[2] = (id)v10;

    if (v11)
    {
      id v13 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Error while reading website titles and subtitles cache: %@", buf, 0xCu);
      }

      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = MEMORY[0x1E4F1CC08];
    }
    else
    {
      uint64_t v16 = [v3[2] copy];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      v15 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
}

- (BOOL)_writeCache:(id)a3 path:(id)a4 withError:(id *)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F4B638];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 alloc];
  id v11 = __atxlog_handle_action_prediction();
  id v12 = (void *)[v10 initWithCacheFilePath:v8 loggingHandle:v11 debugName:@"webSuggestions"];

  LOBYTE(a5) = [v12 storeSecureCodedObject:v9 error:a5];
  return (char)a5;
}

- (id)_fetchWebsiteCacheWithPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F4B638]);
  id v7 = __atxlog_handle_action_prediction();
  id v8 = (void *)[v6 initWithCacheFilePath:v5 loggingHandle:v7 debugName:@"webSuggestions"];

  id v9 = (void *)MEMORY[0x1D25F6CC0]();
  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v10, "initWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  v15 = [v8 readSecureCodedObjectWithMaxValidAge:v14 allowableClasses:a4 error:-1.0];
  uint64_t v16 = v15;
  if (!v15) {
    v15 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v17 = v15;

  return v17;
}

- (id)_fetchWebsiteTitlesAndSubtitlesCacheWithPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F4B638]);
  id v7 = __atxlog_handle_action_prediction();
  id v8 = (void *)[v6 initWithCacheFilePath:v5 loggingHandle:v7 debugName:@"webSuggestions"];

  id v9 = (void *)MEMORY[0x1D25F6CC0]();
  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v10, "initWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  v15 = [v8 readSecureCodedObjectWithMaxValidAge:v14 allowableClasses:a4 error:-1.0];
  uint64_t v16 = v15;
  if (!v15) {
    v15 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v17 = v15;

  return v17;
}

- (void).cxx_destruct
{
}

@end