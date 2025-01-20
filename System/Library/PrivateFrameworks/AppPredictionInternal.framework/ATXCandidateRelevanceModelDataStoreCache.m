@interface ATXCandidateRelevanceModelDataStoreCache
- (ATXCandidateRelevanceModelDataStoreCache)init;
- (id)featurizationManagerForFeaturizationManagerId:(int64_t)a3;
- (void)setFeaturizationManager:(id)a3 forFeaturizationManagerId:(int64_t)a4;
@end

@implementation ATXCandidateRelevanceModelDataStoreCache

- (ATXCandidateRelevanceModelDataStoreCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXCandidateRelevanceModelDataStoreCache;
  v2 = [(ATXCandidateRelevanceModelDataStoreCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    featurizationManagers = v2->_featurizationManagers;
    v2->_featurizationManagers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)featurizationManagerForFeaturizationManagerId:(int64_t)a3
{
  featurizationManagers = self->_featurizationManagers;
  v4 = [NSNumber numberWithLongLong:a3];
  v5 = [(NSMutableDictionary *)featurizationManagers objectForKeyedSubscript:v4];

  return v5;
}

- (void)setFeaturizationManager:(id)a3 forFeaturizationManagerId:(int64_t)a4
{
  featurizationManagers = self->_featurizationManagers;
  objc_super v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithLongLong:a4];
  [(NSMutableDictionary *)featurizationManagers setObject:v7 forKeyedSubscript:v8];
}

- (void).cxx_destruct
{
}

@end