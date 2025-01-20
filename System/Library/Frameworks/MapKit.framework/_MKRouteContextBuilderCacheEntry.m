@interface _MKRouteContextBuilderCacheEntry
- (NSArray)overlapResults;
- (NSArray)overlappingSections;
- (NSArray)routeIDs;
- (_MKRouteContextBuilderCacheEntry)initWithRoutes:(id)a3;
- (void)setOverlapResults:(id)a3;
- (void)setOverlappingSections:(id)a3;
- (void)setRouteIDs:(id)a3;
@end

@implementation _MKRouteContextBuilderCacheEntry

- (_MKRouteContextBuilderCacheEntry)initWithRoutes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKRouteContextBuilderCacheEntry;
  v5 = [(_MKRouteContextBuilderCacheEntry *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_35);
    routeIDs = v5->_routeIDs;
    v5->_routeIDs = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)routeIDs
{
  return self->_routeIDs;
}

- (void)setRouteIDs:(id)a3
{
}

- (NSArray)overlapResults
{
  return self->_overlapResults;
}

- (void)setOverlapResults:(id)a3
{
}

- (NSArray)overlappingSections
{
  return self->_overlappingSections;
}

- (void)setOverlappingSections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlappingSections, 0);
  objc_storeStrong((id *)&self->_overlapResults, 0);

  objc_storeStrong((id *)&self->_routeIDs, 0);
}

@end