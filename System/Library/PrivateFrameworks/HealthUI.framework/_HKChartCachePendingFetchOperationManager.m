@interface _HKChartCachePendingFetchOperationManager
- (_HKChartCachePendingFetchOperationManager)init;
- (id)allPendingIdentifiers;
- (id)fetchOperationForIdentifier:(id)a3;
- (int64_t)retryCountForIdentifier:(id)a3;
- (void)addFetchOperation:(id)a3;
- (void)incrementRetryCountForIdentifier:(id)a3;
- (void)removeFetchOperation:(id)a3;
- (void)resetRetryCountForIdentifier:(id)a3;
@end

@implementation _HKChartCachePendingFetchOperationManager

- (_HKChartCachePendingFetchOperationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)_HKChartCachePendingFetchOperationManager;
  v2 = [(_HKChartCachePendingFetchOperationManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fetchOperationsByIdentifier = v2->_fetchOperationsByIdentifier;
    v2->_fetchOperationsByIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fetchOperationsByUUID = v2->_fetchOperationsByUUID;
    v2->_fetchOperationsByUUID = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    retryCountByIdentifier = v2->_retryCountByIdentifier;
    v2->_retryCountByIdentifier = v7;
  }
  return v2;
}

- (void)addFetchOperation:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];

  if (!v6)
  {
    objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKChartCache.m", 272, @"Invalid parameter not satisfying: %@", @"[fetchOperation identifier] != nil" object file lineNumber description];
  }
  fetchOperationsByIdentifier = self->_fetchOperationsByIdentifier;
  v8 = [v5 identifier];
  [(NSMutableDictionary *)fetchOperationsByIdentifier setObject:v5 forKeyedSubscript:v8];

  fetchOperationsByUUID = self->_fetchOperationsByUUID;
  id v11 = [v5 UUID];
  [(NSMutableDictionary *)fetchOperationsByUUID setObject:v5 forKeyedSubscript:v11];
}

- (void)removeFetchOperation:(id)a3
{
  id v4 = a3;
  id v6 = [v4 UUID];
  id v5 = [v4 identifier];

  [(NSMutableDictionary *)self->_fetchOperationsByUUID removeObjectForKey:v6];
  [(NSMutableDictionary *)self->_fetchOperationsByIdentifier removeObjectForKey:v5];
}

- (id)fetchOperationForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_fetchOperationsByIdentifier objectForKeyedSubscript:a3];
}

- (id)allPendingIdentifiers
{
  v3 = [(NSMutableDictionary *)self->_fetchOperationsByIdentifier allKeys];
  uint64_t v4 = [v3 count];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  if (v4)
  {
    id v6 = [(NSMutableDictionary *)self->_fetchOperationsByIdentifier allKeys];
    v7 = [v5 setWithArray:v6];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v7;
}

- (int64_t)retryCountForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_retryCountByIdentifier objectForKeyedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)incrementRetryCountForIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_HKChartCachePendingFetchOperationManager *)self retryCountForIdentifier:v4];
  id v6 = [NSNumber numberWithInteger:v5 + 1];
  [(NSMutableDictionary *)self->_retryCountByIdentifier setObject:v6 forKeyedSubscript:v4];
}

- (void)resetRetryCountForIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryCountByIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchOperationsByUUID, 0);
  objc_storeStrong((id *)&self->_fetchOperationsByIdentifier, 0);
}

@end