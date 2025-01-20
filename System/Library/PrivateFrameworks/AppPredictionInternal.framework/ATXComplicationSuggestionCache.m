@interface ATXComplicationSuggestionCache
- (ATXComplicationSuggestionCache)init;
- (BOOL)_writeComplicationsCache:(id)a3 path:(id)a4 withError:(id *)a5;
- (BOOL)writeComplicationsInlineSetCache:(id)a3;
- (BOOL)writeComplicationsLandscapeModularSetCache:(id)a3;
- (BOOL)writeComplicationsModularSetCache:(id)a3;
- (id)_fetchCachedRankedComplicationDescriptorsWithPath:(id)a3 error:(id *)a4;
- (id)fetchInlineSetComplicationDescriptors;
- (id)fetchLandscapeModularSetComplicationDescriptors;
- (id)fetchModularSetComplicationDescriptors;
@end

@implementation ATXComplicationSuggestionCache

- (ATXComplicationSuggestionCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXComplicationSuggestionCache;
  v2 = [(ATXComplicationSuggestionCache *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.proactive.ATXComplicationSuggestionCache", v3);

    id v5 = objc_alloc(MEMORY[0x1E4F93B80]);
    v6 = objc_opt_new();
    uint64_t v7 = [v5 initWithGuardedData:v6 serialQueue:v4];
    lock = v2->_lock;
    v2->_lock = (_PASQueueLock *)v7;
  }
  return v2;
}

- (BOOL)writeComplicationsModularSetCache:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__ATXComplicationSuggestionCache_writeComplicationsModularSetCache___block_invoke;
  v8[3] = &unk_1E68AFE48;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  objc_super v10 = &v11;
  [(_PASQueueLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __68__ATXComplicationSuggestionCache_writeComplicationsModularSetCache___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = [MEMORY[0x1E4F4B650] complicationModularSetCacheFilePath];
  id v12 = 0;
  [v5 _writeComplicationsCache:v6 path:v7 withError:&v12];
  id v8 = v12;

  if (v8)
  {
    id v9 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Error while writing modular complication set cache: %@", buf, 0xCu);
    }
    char v10 = 0;
  }
  else
  {
    id v11 = (id)a1[5];
    id v9 = v3[1];
    v3[1] = v11;
    char v10 = 1;
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v10;
}

- (BOOL)writeComplicationsLandscapeModularSetCache:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__ATXComplicationSuggestionCache_writeComplicationsLandscapeModularSetCache___block_invoke;
  v8[3] = &unk_1E68AFE48;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  char v10 = &v11;
  [(_PASQueueLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __77__ATXComplicationSuggestionCache_writeComplicationsLandscapeModularSetCache___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = [MEMORY[0x1E4F4B650] complicationLandscapeModularSetCacheFilePath];
  id v12 = 0;
  [v5 _writeComplicationsCache:v6 path:v7 withError:&v12];
  id v8 = v12;

  if (v8)
  {
    id v9 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Error while writing complication landscape modular set cache: %@", buf, 0xCu);
    }
    char v10 = 0;
  }
  else
  {
    id v11 = (id)a1[5];
    id v9 = v3[1];
    v3[1] = v11;
    char v10 = 1;
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v10;
}

- (BOOL)writeComplicationsInlineSetCache:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__ATXComplicationSuggestionCache_writeComplicationsInlineSetCache___block_invoke;
  v8[3] = &unk_1E68AFE48;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  char v10 = &v11;
  [(_PASQueueLock *)lock runWithLockAcquired:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

void __67__ATXComplicationSuggestionCache_writeComplicationsInlineSetCache___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = [MEMORY[0x1E4F4B650] complicationInlineSetCacheFilePath];
  id v12 = 0;
  [v5 _writeComplicationsCache:v6 path:v7 withError:&v12];
  id v8 = v12;

  if (v8)
  {
    id v9 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Error while writing complication inline set cache: %@", buf, 0xCu);
    }
    char v10 = 0;
  }
  else
  {
    id v11 = (id)a1[5];
    id v9 = v3[3];
    v3[3] = v11;
    char v10 = 1;
  }

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v10;
}

- (id)fetchModularSetComplicationDescriptors
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__40;
  char v10 = __Block_byref_object_dispose__40;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__ATXComplicationSuggestionCache_fetchModularSetComplicationDescriptors__block_invoke;
  v5[3] = &unk_1E68AFE70;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __72__ATXComplicationSuggestionCache_fetchModularSetComplicationDescriptors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3[1];
  if (v4)
  {
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [MEMORY[0x1E4F4B650] complicationModularSetCacheFilePath];
    id v18 = 0;
    uint64_t v10 = [v8 _fetchCachedRankedComplicationDescriptorsWithPath:v9 error:&v18];
    id v11 = v18;
    id v12 = v3[1];
    v3[1] = (id)v10;

    if (v11)
    {
      uint64_t v13 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Error while reading complication set 1 cache: %@", buf, 0xCu);
      }

      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v16 = [v3[1] copy];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
}

- (id)fetchInlineSetComplicationDescriptors
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__40;
  uint64_t v10 = __Block_byref_object_dispose__40;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__ATXComplicationSuggestionCache_fetchInlineSetComplicationDescriptors__block_invoke;
  v5[3] = &unk_1E68AFE70;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __71__ATXComplicationSuggestionCache_fetchInlineSetComplicationDescriptors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3[3];
  if (v4)
  {
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [MEMORY[0x1E4F4B650] complicationInlineSetCacheFilePath];
    id v18 = 0;
    uint64_t v10 = [v8 _fetchCachedRankedComplicationDescriptorsWithPath:v9 error:&v18];
    id v11 = v18;
    id v12 = v3[3];
    v3[3] = (id)v10;

    if (v11)
    {
      uint64_t v13 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Error while reading complication inline set cache: %@", buf, 0xCu);
      }

      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v16 = [v3[3] copy];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
}

- (id)fetchLandscapeModularSetComplicationDescriptors
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__40;
  uint64_t v10 = __Block_byref_object_dispose__40;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__ATXComplicationSuggestionCache_fetchLandscapeModularSetComplicationDescriptors__block_invoke;
  v5[3] = &unk_1E68AFE70;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __81__ATXComplicationSuggestionCache_fetchLandscapeModularSetComplicationDescriptors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3[2];
  if (v4)
  {
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [MEMORY[0x1E4F4B650] complicationLandscapeModularSetCacheFilePath];
    id v18 = 0;
    uint64_t v10 = [v8 _fetchCachedRankedComplicationDescriptorsWithPath:v9 error:&v18];
    id v11 = v18;
    id v12 = v3[2];
    v3[2] = (id)v10;

    if (v11)
    {
      uint64_t v13 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Error while reading landscape modular complication set cache: %@", buf, 0xCu);
      }

      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v16 = [v3[2] copy];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
}

- (BOOL)_writeComplicationsCache:(id)a3 path:(id)a4 withError:(id *)a5
{
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F4B638];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 alloc];
  id v11 = __atxlog_handle_lock_screen();
  id v12 = (void *)[v10 initWithCacheFilePath:v8 loggingHandle:v11 debugName:@"complications"];

  LOBYTE(a5) = [v12 storeSecureCodedObject:v9 error:a5];
  return (char)a5;
}

- (id)_fetchCachedRankedComplicationDescriptorsWithPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F4B638]);
  uint64_t v7 = __atxlog_handle_lock_screen();
  id v8 = (void *)[v6 initWithCacheFilePath:v5 loggingHandle:v7 debugName:@"complications"];

  id v9 = (void *)MEMORY[0x1D25F6CC0]();
  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = [v8 readSecureCodedObjectWithMaxValidAge:v12 allowableClasses:a4 error:-1.0];
  uint64_t v14 = v13;
  if (!v13) {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v15 = v13;

  return v15;
}

- (void).cxx_destruct
{
}

@end