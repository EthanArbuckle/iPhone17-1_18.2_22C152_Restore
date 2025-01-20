@interface ATXCacheReader
- (ATXCacheReader)initWithCacheBasePath:(id)a3;
- (id)readCacheFileForCachePath:(id)a3;
- (id)readCacheFileForConsumerSubtype:(unsigned __int8)a3;
- (void)_handleDirChange;
- (void)dealloc;
@end

@implementation ATXCacheReader

- (ATXCacheReader)initWithCacheBasePath:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ATXCacheReader;
  v5 = [(ATXCacheReader *)&v29 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F93B70]);
    v7 = objc_opt_new();
    uint64_t v8 = [v6 initWithGuardedData:v7];
    v9 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v8;

    if (v4)
    {
      id v10 = v4;
      v12 = (id *)(v5 + 16);
      v11 = (void *)*((void *)v5 + 2);
      *((void *)v5 + 2) = v10;
    }
    else
    {
      v11 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
      uint64_t v13 = [v11 stringByAppendingPathComponent:@"caches/ATXCacheFile"];
      v12 = (id *)(v5 + 16);
      v14 = (void *)*((void *)v5 + 2);
      *((void *)v5 + 2) = v13;
    }
    id v15 = [*v12 stringByDeletingLastPathComponent];
    int v16 = open((const char *)[v15 UTF8String], 0x8000);
    if ((v16 & 0x80000000) == 0)
    {
      unsigned int v17 = v16;
      objc_initWeak(&location, v5);
      v18 = dispatch_get_global_queue(9, 0);
      dispatch_source_t v19 = dispatch_source_create(MEMORY[0x1E4F144A8], v17, 2uLL, v18);
      v20 = (void *)*((void *)v5 + 3);
      *((void *)v5 + 3) = v19;

      v21 = *((void *)v5 + 3);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __40__ATXCacheReader_initWithCacheBasePath___block_invoke;
      handler[3] = &unk_1E5D05748;
      objc_copyWeak(&v27, &location);
      dispatch_source_set_event_handler(v21, handler);
      v22 = *((void *)v5 + 3);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __40__ATXCacheReader_initWithCacheBasePath___block_invoke_2;
      v24[3] = &__block_descriptor_36_e5_v8__0l;
      unsigned int v25 = v17;
      dispatch_source_set_cancel_handler(v22, v24);
      dispatch_resume(*((dispatch_object_t *)v5 + 3));
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }
  return (ATXCacheReader *)v5;
}

void __40__ATXCacheReader_initWithCacheBasePath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDirChange];
}

uint64_t __40__ATXCacheReader_initWithCacheBasePath___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)dealloc
{
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_57];
  vnodeSource = self->_vnodeSource;
  if (vnodeSource) {
    dispatch_source_cancel(vnodeSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)ATXCacheReader;
  [(ATXCacheReader *)&v4 dealloc];
}

uint64_t __25__ATXCacheReader_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(unsigned int *)(a2 + 16);
  if ((result & 0x80000000) == 0) {
    return close(result);
  }
  return result;
}

- (id)readCacheFileForConsumerSubtype:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5 = +[ATXAppPredictorAssetMapping assetMappingWithCachedAssets];
  id v6 = [v5 getFullCachePathWithBaseCachePath:self->_cacheBasePath consumerSubType:v3];

  v7 = [(ATXCacheReader *)self readCacheFileForCachePath:v6];

  return v7;
}

- (id)readCacheFileForCachePath:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__13;
    int v16 = __Block_byref_object_dispose__13;
    id v17 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__ATXCacheReader_readCacheFileForCachePath___block_invoke;
    v9[3] = &unk_1E5D08448;
    id v10 = v4;
    v11 = &v12;
    [(_PASLock *)lock runWithLockAcquired:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __44__ATXCacheReader_readCacheFileForCachePath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((*((_DWORD *)v3 + 4) & 0x80000000) == 0)
  {
    char v4 = [*(id *)(a1 + 32) isEqualToString:*((void *)v3 + 1)];
    int v5 = *((_DWORD *)v3 + 4);
    if (v4)
    {
      if ((v5 & 0x80000000) == 0)
      {
LABEL_8:
        ATXCacheFileRead();
        goto LABEL_12;
      }
    }
    else
    {
      close(v5);
      *((_DWORD *)v3 + 4) = -1;
    }
  }
  int v6 = open((const char *)[*(id *)(a1 + 32) UTF8String], 0);
  *((_DWORD *)v3 + 4) = v6;
  if ((v6 & 0x80000000) == 0)
  {
    objc_storeStrong((id *)v3 + 1, *(id *)(a1 + 32));
    goto LABEL_8;
  }
  id v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *__error();
    v9[0] = 67109120;
    v9[1] = v8;
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "Could not open app predictions cache: errno=%i", (uint8_t *)v9, 8u);
  }

LABEL_12:
}

- (void)_handleDirChange
{
  id v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "Directory changed, closing fd if open", v4, 2u);
  }

  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_25_0];
}

void __34__ATXCacheReader__handleDirChange__block_invoke(uint64_t a1, _DWORD *a2)
{
  int v2 = a2[4];
  if ((v2 & 0x80000000) == 0)
  {
    char v4 = a2;
    close(v2);
    a2[4] = -1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vnodeSource, 0);
  objc_storeStrong((id *)&self->_cacheBasePath, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end