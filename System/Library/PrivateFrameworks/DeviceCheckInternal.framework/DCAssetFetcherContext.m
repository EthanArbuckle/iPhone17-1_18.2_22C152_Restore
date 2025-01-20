@interface DCAssetFetcherContext
- (BOOL)allowCatalogRefresh;
- (BOOL)ignoreCachedMetadata;
- (id)description;
- (void)setAllowCatalogRefresh:(BOOL)a3;
- (void)setIgnoreCachedMetadata:(BOOL)a3;
@end

@implementation DCAssetFetcherContext

- (id)description
{
  v3 = [(id)objc_opt_class() description];
  v4 = +[NSString stringWithFormat:@"<%@: %p - refreshAllowed: %d, ignoreMetadataCache: %d>", v3, self, self->_allowCatalogRefresh, self->_ignoreCachedMetadata];

  return v4;
}

- (BOOL)allowCatalogRefresh
{
  return self->_allowCatalogRefresh;
}

- (void)setAllowCatalogRefresh:(BOOL)a3
{
  self->_allowCatalogRefresh = a3;
}

- (BOOL)ignoreCachedMetadata
{
  return self->_ignoreCachedMetadata;
}

- (void)setIgnoreCachedMetadata:(BOOL)a3
{
  self->_ignoreCachedMetadata = a3;
}

@end