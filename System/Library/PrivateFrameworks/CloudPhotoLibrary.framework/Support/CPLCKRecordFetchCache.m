@interface CPLCKRecordFetchCache
- (CPLCKRecordFetchCache)init;
- (id)cachedRecordWithID:(id)a3;
- (id)description;
- (void)didFetchRecordWithID:(id)a3 record:(id)a4;
- (void)didModifyRecordWithID:(id)a3;
- (void)resetTrackingCounts;
- (void)willFetchRecordCount:(unint64_t)a3;
@end

@implementation CPLCKRecordFetchCache

- (CPLCKRecordFetchCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPLCKRecordFetchCache;
  v2 = [(CPLCKRecordFetchCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:300];
    mapping = v2->_mapping;
    v2->_mapping = v3;
  }
  return v2;
}

- (void)didFetchRecordWithID:(id)a3 record:(id)a4
{
  id v6 = a3;
  id v7 = [a4 copy];
  [(NSMutableDictionary *)self->_mapping setObject:v7 forKeyedSubscript:v6];
}

- (id)cachedRecordWithID:(id)a3
{
  v4 = [(NSMutableDictionary *)self->_mapping objectForKeyedSubscript:a3];
  v5 = v4;
  uint64_t v6 = 24;
  if (!v4) {
    uint64_t v6 = 16;
  }
  ++*(Class *)((char *)&self->super.isa + v6);
  id v7 = [v4 copy];

  return v7;
}

- (void)didModifyRecordWithID:(id)a3
{
  mapping = self->_mapping;
  id v5 = a3;
  id v6 = [(NSMutableDictionary *)mapping count];
  [(NSMutableDictionary *)self->_mapping removeObjectForKey:v5];

  if ([(NSMutableDictionary *)self->_mapping count] != v6) {
    ++self->_dropCount;
  }
}

- (void)resetTrackingCounts
{
  *(_OWORD *)&self->_missCount = 0u;
  *(_OWORD *)&self->_dropCount = 0u;
}

- (void)willFetchRecordCount:(unint64_t)a3
{
  self->_fetchCount += a3;
}

- (id)description
{
  id v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"[%lu records - hit: %lu - miss: %lu - fetch: %lu - drop: %lu]", -[NSMutableDictionary count](self->_mapping, "count"), self->_hitCount, self->_missCount, self->_fetchCount, self->_dropCount);
  return v2;
}

- (void).cxx_destruct
{
}

@end