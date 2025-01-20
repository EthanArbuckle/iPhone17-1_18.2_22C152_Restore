@interface BRCUTITypeCache
+ (id)defaultCache;
- (id)UTIForExtension:(id)a3;
- (id)_getLaunchServicesDatabaseGeneration;
- (id)_init;
- (id)_utiForExtension:(id)a3;
- (void)_invalidateCahceIfNeeded;
@end

@implementation BRCUTITypeCache

+ (id)defaultCache
{
  if (defaultCache_onceToken != -1) {
    dispatch_once(&defaultCache_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)defaultCache_defaultCache;

  return v2;
}

void __31__BRCUTITypeCache_defaultCache__block_invoke()
{
  id v0 = [[BRCUTITypeCache alloc] _init];
  v1 = (void *)defaultCache_defaultCache;
  defaultCache_defaultCache = (uint64_t)v0;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)BRCUTITypeCache;
  v2 = [(BRCUTITypeCache *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    utiCache = v2->_utiCache;
    v2->_utiCache = (NSCache *)v3;

    v5 = +[BRCUserDefaults defaultsForMangledID:0];
    -[NSCache setCountLimit:](v2->_utiCache, "setCountLimit:", [v5 utiCacheSize]);

    [(NSCache *)v2->_utiCache setEvictsObjectsWithDiscardedContent:1];
  }
  return v2;
}

- (id)_utiForExtension:(id)a3
{
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], (CFStringRef)a3, 0);

  return PreferredIdentifierForTag;
}

- (id)_getLaunchServicesDatabaseGeneration
{
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v5 = 0;
  [v2 getKnowledgeUUID:0 andSequenceNumber:&v5];
  id v3 = v5;

  return v3;
}

- (void)_invalidateCahceIfNeeded
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Invalidating UTI cache%@", (uint8_t *)&v2, 0xCu);
}

- (id)UTIForExtension:(id)a3
{
  id v4 = a3;
  [(BRCUTITypeCache *)self _invalidateCahceIfNeeded];
  id v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSCache *)v5->_utiCache objectForKey:v4];
  if (v6)
  {
    objc_super v7 = [MEMORY[0x1E4F1CA98] null];

    if (v6 == v7) {
      id v8 = 0;
    }
    else {
      id v8 = v6;
    }
    objc_sync_exit(v5);
  }
  else
  {
    objc_sync_exit(v5);

    v9 = [(BRCUTITypeCache *)v5 _utiForExtension:v4];
    v10 = v5;
    objc_sync_enter(v10);
    utiCache = v5->_utiCache;
    if (v9)
    {
      [(NSCache *)v5->_utiCache setObject:v9 forKey:v4];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [(NSCache *)utiCache setObject:v12 forKey:v4];
    }
    objc_sync_exit(v10);

    id v8 = v9;
    v6 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utiCache, 0);

  objc_storeStrong((id *)&self->_lastUTIDatabaseGeneration, 0);
}

@end