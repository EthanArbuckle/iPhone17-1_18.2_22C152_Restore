@interface QLThumbnailAdditionCache
+ (id)sharedInstance;
- (QLThumbnailAdditionCache)init;
- (id)thumbnailAdditionForItemAtURL:(id)a3 error:(id *)a4;
- (void)cacheAddition:(id)a3 forDocumentID:(id)a4;
- (void)purgeCachedAdditionForItemAtURL:(id)a3;
@end

@implementation QLThumbnailAdditionCache

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__QLThumbnailAdditionCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  v2 = (void *)sharedInstance_sSharedInstance;

  return v2;
}

uint64_t __42__QLThumbnailAdditionCache_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sSharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (QLThumbnailAdditionCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)QLThumbnailAdditionCache;
  v2 = [(QLThumbnailAdditionCache *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    additionsCache = v2->_additionsCache;
    v2->_additionsCache = v3;

    [(NSCache *)v2->_additionsCache setName:@"QLThumbnail Additions"];
    [(NSCache *)v2->_additionsCache setCountLimit:64];
  }
  return v2;
}

- (id)thumbnailAdditionForItemAtURL:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = 0;
  int v7 = [v6 getResourceValue:&v27 forKey:*MEMORY[0x1E4F1C550] error:a4];
  id v8 = v27;
  if (v8) {
    int v9 = v7;
  }
  else {
    int v9 = 0;
  }
  if (v9 != 1)
  {
    v17 = 0;
    goto LABEL_22;
  }
  v10 = self->_additionsCache;
  objc_sync_enter(v10);
  v11 = [(NSCache *)self->_additionsCache objectForKey:v8];
  objc_sync_exit(v10);

  if (![v11 isStillValid])
  {
    v18 = _log_0();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v19)
      {
        additionsCache = self->_additionsCache;
        *(_DWORD *)buf = 138412802;
        v29 = additionsCache;
        __int16 v30 = 2112;
        id v31 = v6;
        __int16 v32 = 2112;
        id v33 = v8;
        v21 = "Found addition in cache %@ for %@ (docID %@), but it is stale";
LABEL_15:
        _os_log_impl(&dword_1B281E000, v18, OS_LOG_TYPE_INFO, v21, buf, 0x20u);
      }
    }
    else if (v19)
    {
      v22 = self->_additionsCache;
      *(_DWORD *)buf = 138412802;
      v29 = v22;
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      id v33 = v8;
      v21 = "No addition found in cache %@ for %@ (docID %@)";
      goto LABEL_15;
    }

    v23 = [MEMORY[0x1E4F63BE8] manager];
    v24 = [v23 permanentStorageForItemAtURL:v6 allocateIfNone:0 error:a4];
    if (v24)
    {
      v25 = [MEMORY[0x1E4F63BD8] makeNameForUser:getuid() name:@"QLThumbnailAdditionName"];
      v17 = [v24 additionWithName:v25 inNameSpace:@"com.apple.thumbnails" error:a4];

      if (v17) {
        [(QLThumbnailAdditionCache *)self cacheAddition:v17 forDocumentID:v8];
      }
    }
    else
    {
      v17 = 0;
    }

    goto LABEL_21;
  }
  v12 = _log_0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = [v11 addition];
    v14 = self->_additionsCache;
    v15 = [v11 addition];
    v16 = [v15 userInfo];
    *(_DWORD *)buf = 138413314;
    v29 = v13;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 2112;
    v35 = v14;
    __int16 v36 = 2112;
    v37 = v16;
    _os_log_impl(&dword_1B281E000, v12, OS_LOG_TYPE_INFO, "Using cached addition (%@) for %@ (%@) in cache %@, user info %@", buf, 0x34u);
  }
  v17 = [v11 addition];
LABEL_21:

LABEL_22:

  return v17;
}

- (void)purgeCachedAdditionForItemAtURL:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  int v5 = [v4 getResourceValue:&v11 forKey:*MEMORY[0x1E4F1C550] error:0];
  id v6 = v11;
  if (v5)
  {
    additionsCache = self->_additionsCache;
    p_additionsCache = &self->_additionsCache;
    int v9 = additionsCache;
    objc_sync_enter(v9);
    v10 = _log_0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[QLThumbnailAdditionCache purgeCachedAdditionForItemAtURL:]();
    }

    [(NSCache *)*p_additionsCache removeObjectForKey:v6];
    objc_sync_exit(v9);
  }
}

- (void)cacheAddition:(id)a3 forDocumentID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[QLThumbnailCachedAddition alloc] initWithAddition:v6];
  if (v8)
  {
    int v9 = self->_additionsCache;
    objc_sync_enter(v9);
    v10 = _log_0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      additionsCache = self->_additionsCache;
      v12 = [v6 userInfo];
      int v13 = 138413058;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      v18 = additionsCache;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_debug_impl(&dword_1B281E000, v10, OS_LOG_TYPE_DEBUG, "Storing addition %@ for docID %@ in cache %@, user info %@", (uint8_t *)&v13, 0x2Au);
    }
    [(NSCache *)self->_additionsCache setObject:v8 forKey:v7];
    objc_sync_exit(v9);
  }
}

- (void).cxx_destruct
{
}

- (void)purgeCachedAdditionForItemAtURL:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_1B281E000, v0, v1, "Removing entry for key %@ in cache %@");
}

@end