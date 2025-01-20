@interface SCNAssetCatalogCacheEntry
- (double)timestamp;
- (id)item;
- (void)dealloc;
- (void)setItem:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation SCNAssetCatalogCacheEntry

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNAssetCatalogCacheEntry;
  [(SCNAssetCatalogCacheEntry *)&v3 dealloc];
}

- (id)item
{
  return self->item;
}

- (void)setItem:(id)a3
{
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

@end