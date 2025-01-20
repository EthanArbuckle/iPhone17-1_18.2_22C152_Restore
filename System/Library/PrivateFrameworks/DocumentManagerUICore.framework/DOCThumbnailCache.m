@interface DOCThumbnailCache
- (DOCThumbnailCache)init;
- (NSCache)recentlyUsedNodes;
- (NSMapTable)cachedThumbnailNodes;
- (void)clear;
@end

@implementation DOCThumbnailCache

- (NSCache)recentlyUsedNodes
{
  return self->_recentlyUsedNodes;
}

- (NSMapTable)cachedThumbnailNodes
{
  return self->_cachedThumbnailNodes;
}

- (DOCThumbnailCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)DOCThumbnailCache;
  v2 = [(DOCThumbnailCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    cachedThumbnailNodes = v2->_cachedThumbnailNodes;
    v2->_cachedThumbnailNodes = (NSMapTable *)v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    recentlyUsedNodes = v2->_recentlyUsedNodes;
    v2->_recentlyUsedNodes = v5;

    [(NSCache *)v2->_recentlyUsedNodes setCountLimit:maxCachedNodes];
    [(NSCache *)v2->_recentlyUsedNodes setEvictsObjectsWhenApplicationEntersBackground:0];
  }
  return v2;
}

- (void)clear
{
  id v2 = [(DOCThumbnailCache *)self recentlyUsedNodes];
  [v2 removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedNodes, 0);
  objc_storeStrong((id *)&self->_cachedThumbnailNodes, 0);
}

@end