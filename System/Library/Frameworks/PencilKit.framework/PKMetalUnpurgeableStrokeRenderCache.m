@interface PKMetalUnpurgeableStrokeRenderCache
- (PKMetalUnpurgeableStrokeRenderCache)initWithInk:(id)a3 renderZoomFactor:(int64_t)a4;
- (void)addBuffer:(id)a3;
- (void)addSecondaryBuffer:(id)a3;
- (void)dealloc;
@end

@implementation PKMetalUnpurgeableStrokeRenderCache

- (PKMetalUnpurgeableStrokeRenderCache)initWithInk:(id)a3 renderZoomFactor:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKMetalUnpurgeableStrokeRenderCache;
  v7 = [(PKMetalStrokeRenderCache *)&v11 initWithInk:v6 renderZoomFactor:a4];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    lockedResourceSet = v7->_lockedResourceSet;
    v7->_lockedResourceSet = (NSMutableSet *)v8;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_lockedResourceSet;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) unlock];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)PKMetalUnpurgeableStrokeRenderCache;
  [(PKMetalUnpurgeableStrokeRenderCache *)&v7 dealloc];
}

- (void)addBuffer:(id)a3
{
  id v4 = a3;
  -[PKMetalStrokeRenderCacheBuffer lockPurgeableResourcesAddToSet:]((uint64_t)v4, self->_lockedResourceSet);
  v5.receiver = self;
  v5.super_class = (Class)PKMetalUnpurgeableStrokeRenderCache;
  [(PKMetalStrokeRenderCache *)&v5 addBuffer:v4];
}

- (void)addSecondaryBuffer:(id)a3
{
  id v4 = a3;
  -[PKMetalStrokeRenderCacheBuffer lockPurgeableResourcesAddToSet:]((uint64_t)v4, self->_lockedResourceSet);
  v5.receiver = self;
  v5.super_class = (Class)PKMetalUnpurgeableStrokeRenderCache;
  [(PKMetalStrokeRenderCache *)&v5 addSecondaryBuffer:v4];
}

- (void).cxx_destruct
{
}

@end