@interface EMFAnchoredSearchAnchorsCache
+ (id)sharedCache;
- (EMFAnchoredSearchAnchorsCache)init;
- (NSCache)anchorsCache;
- (id)anchorCollectionForLocaleIdentifier:(id)a3;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)purgeAllCachedAnchorCollections;
- (void)removeAnchorCollectionForLocaleIdentifier:(id)a3;
- (void)setAnchorCollection:(id)a3 forLocaleIdentifier:(id)a4;
- (void)setAnchorsCache:(id)a3;
@end

@implementation EMFAnchoredSearchAnchorsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedCache___sharedCache;
  return v2;
}

uint64_t __44__EMFAnchoredSearchAnchorsCache_sharedCache__block_invoke()
{
  sharedCache___sharedCache = objc_alloc_init(EMFAnchoredSearchAnchorsCache);
  return MEMORY[0x1F41817F8]();
}

- (EMFAnchoredSearchAnchorsCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)EMFAnchoredSearchAnchorsCache;
  v2 = [(EMFAnchoredSearchAnchorsCache *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    anchorsCache = v2->_anchorsCache;
    v2->_anchorsCache = v3;

    [(NSCache *)v2->_anchorsCache setDelegate:v2];
  }
  return v2;
}

- (id)anchorCollectionForLocaleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(EMFAnchoredSearchAnchorsCache *)self anchorsCache];
  objc_super v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setAnchorCollection:(id)a3 forLocaleIdentifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a4;
  if ((unint64_t)a3 | v6)
  {
    id v7 = a3;
    v8 = [(EMFAnchoredSearchAnchorsCache *)self anchorsCache];
    [v8 setObject:v7 forKey:v6];

    v9 = emf_logging_get_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138543362;
      unint64_t v11 = v6;
      _os_log_impl(&dword_1B8C45000, v9, OS_LOG_TYPE_INFO, "Caching search anchors for locale identifier '%{public}@'", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)removeAnchorCollectionForLocaleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(EMFAnchoredSearchAnchorsCache *)self anchorsCache];
  [v5 removeObjectForKey:v4];
}

- (void)purgeAllCachedAnchorCollections
{
  id v2 = [(EMFAnchoredSearchAnchorsCache *)self anchorsCache];
  [v2 removeAllObjects];
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = emf_logging_get_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1B8C45000, v5, OS_LOG_TYPE_INFO, "Evicting '%@' from collections cache", (uint8_t *)&v6, 0xCu);
  }
}

- (NSCache)anchorsCache
{
  return self->_anchorsCache;
}

- (void)setAnchorsCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end