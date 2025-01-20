@interface NSSQLiteIndexStatisticsResult
- (NSSQLiteIndexStatisticsResult)initWithResult:(id)a3;
- (NSSQLiteIndexStatisticsResult)initWithSubresults:(id)a3;
- (id)result;
- (void)dealloc;
@end

@implementation NSSQLiteIndexStatisticsResult

- (NSSQLiteIndexStatisticsResult)initWithResult:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSSQLiteIndexStatisticsResult;
  v4 = [(NSSQLiteIndexStatisticsResult *)&v6 init];
  if (v4) {
    v4->_result = a3;
  }
  return v4;
}

- (NSSQLiteIndexStatisticsResult)initWithSubresults:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)NSSQLiteIndexStatisticsResult;
  v4 = [(NSSQLiteIndexStatisticsResult *)&v15 init];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "result"));
        }
        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
    v4->_result = (id)[v5 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLiteIndexStatisticsResult;
  [(NSSQLiteIndexStatisticsResult *)&v3 dealloc];
}

- (id)result
{
  return objc_getProperty(self, a2, 8, 1);
}

@end