@interface CRKMemoryBasedKeyedDataStore
- (BOOL)removeAllDataWithError:(id *)a3;
- (BOOL)removeDataForKey:(id)a3 error:(id *)a4;
- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5;
- (CRKMemoryBasedKeyedDataStore)init;
- (NSMutableDictionary)backing;
- (id)dataForKey:(id)a3 error:(id *)a4;
@end

@implementation CRKMemoryBasedKeyedDataStore

- (CRKMemoryBasedKeyedDataStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKMemoryBasedKeyedDataStore;
  v2 = [(CRKMemoryBasedKeyedDataStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    backing = v2->_backing;
    v2->_backing = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_super v6 = [(CRKMemoryBasedKeyedDataStore *)self backing];
  v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

- (BOOL)removeAllDataWithError:(id *)a3
{
  uint64_t v3 = [(CRKMemoryBasedKeyedDataStore *)self backing];
  [v3 removeAllObjects];

  return 1;
}

- (BOOL)removeDataForKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_super v6 = [(CRKMemoryBasedKeyedDataStore *)self backing];
  [v6 setObject:0 forKeyedSubscript:v5];

  return 1;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = (void *)[a3 copy];
  v9 = [(CRKMemoryBasedKeyedDataStore *)self backing];
  [v9 setObject:v8 forKeyedSubscript:v7];

  return 1;
}

- (NSMutableDictionary)backing
{
  return self->_backing;
}

- (void).cxx_destruct
{
}

@end