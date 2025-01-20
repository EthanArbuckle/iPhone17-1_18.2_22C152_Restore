@interface _CPLEngineScopeCache
- (_CPLEngineScopeCache)init;
- (id)scopeWithCloudIndex:(int64_t)a3;
- (id)scopeWithIdentifier:(id)a3;
- (id)scopeWithLocalIndex:(int64_t)a3;
- (id)scopeWithStableIndex:(int64_t)a3;
- (id)validCloudIndexes;
- (id)validLocalIndexes;
- (void)cacheScope:(id)a3 forScopeStorage:(id)a4;
- (void)cacheValidCloudIndexes:(id)a3;
- (void)cacheValidLocalIndexes:(id)a3;
@end

@implementation _CPLEngineScopeCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validCloudIndexes, 0);
  objc_storeStrong((id *)&self->_validLocalIndexes, 0);
  objc_storeStrong((id *)&self->_scopeByStableIndex, 0);
  objc_storeStrong((id *)&self->_scopeByCloudIndex, 0);
  objc_storeStrong((id *)&self->_scopeByLocalIndex, 0);
  objc_storeStrong((id *)&self->_scopeCache, 0);
}

- (void)cacheValidCloudIndexes:(id)a3
{
}

- (id)validCloudIndexes
{
  return self->_validCloudIndexes;
}

- (void)cacheValidLocalIndexes:(id)a3
{
}

- (id)validLocalIndexes
{
  return self->_validLocalIndexes;
}

- (id)scopeWithStableIndex:(int64_t)a3
{
  scopeByStableIndex = self->_scopeByStableIndex;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)scopeByStableIndex objectForKeyedSubscript:v4];

  return v5;
}

- (id)scopeWithCloudIndex:(int64_t)a3
{
  scopeByCloudIndex = self->_scopeByCloudIndex;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)scopeByCloudIndex objectForKeyedSubscript:v4];

  return v5;
}

- (id)scopeWithLocalIndex:(int64_t)a3
{
  scopeByLocalIndex = self->_scopeByLocalIndex;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)scopeByLocalIndex objectForKeyedSubscript:v4];

  return v5;
}

- (id)scopeWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_scopeCache objectForKeyedSubscript:a3];
}

- (void)cacheScope:(id)a3 forScopeStorage:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v17)
  {
    v7 = [v6 flagsForScope:v17];
    char v8 = [v7 valueForFlag:16];

    if ((v8 & 1) == 0)
    {
      scopeCache = self->_scopeCache;
      v10 = [v17 scopeIdentifier];
      [(NSMutableDictionary *)scopeCache setObject:v17 forKeyedSubscript:v10];

      scopeByLocalIndex = self->_scopeByLocalIndex;
      v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "localIndex"));
      [(NSMutableDictionary *)scopeByLocalIndex setObject:v17 forKeyedSubscript:v12];

      scopeByCloudIndex = self->_scopeByCloudIndex;
      v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "cloudIndex"));
      [(NSMutableDictionary *)scopeByCloudIndex setObject:v17 forKeyedSubscript:v14];

      scopeByStableIndex = self->_scopeByStableIndex;
      v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "stableIndex"));
      [(NSMutableDictionary *)scopeByStableIndex setObject:v17 forKeyedSubscript:v16];
    }
  }
}

- (_CPLEngineScopeCache)init
{
  v12.receiver = self;
  v12.super_class = (Class)_CPLEngineScopeCache;
  v2 = [(_CPLEngineScopeCache *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scopeCache = v2->_scopeCache;
    v2->_scopeCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scopeByLocalIndex = v2->_scopeByLocalIndex;
    v2->_scopeByLocalIndex = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scopeByCloudIndex = v2->_scopeByCloudIndex;
    v2->_scopeByCloudIndex = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scopeByStableIndex = v2->_scopeByStableIndex;
    v2->_scopeByStableIndex = v9;
  }
  return v2;
}

@end