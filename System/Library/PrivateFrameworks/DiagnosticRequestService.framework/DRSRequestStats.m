@interface DRSRequestStats
+ (Class)childStatsClass;
+ (id)descriptionStringForChildStats:(id)a3;
+ (id)descriptionStringForRequest:(id)a3;
+ (id)keyName;
- (BOOL)addRequest:(id)a3;
- (DRSRequestStats)initWithDescriptionString:(id)a3;
- (NSMutableArray)_requests;
- (NSMutableDictionary)_childStats;
- (NSString)descriptionString;
- (id)_debugDescription:(unint64_t)a3;
- (id)debugDescription;
- (unint64_t)logSizeBytes;
- (unint64_t)requestCount;
- (void)_addChildRequest:(id)a3;
@end

@implementation DRSRequestStats

+ (Class)childStatsClass
{
  return 0;
}

+ (id)keyName
{
  return &stru_26BDF7DE8;
}

+ (id)descriptionStringForRequest:(id)a3
{
  return &stru_26BDF7DE8;
}

+ (id)descriptionStringForChildStats:(id)a3
{
  id v4 = a3;
  if ([a1 childStatsClass])
  {
    v5 = objc_msgSend((id)objc_msgSend(a1, "childStatsClass"), "descriptionStringForRequest:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (DRSRequestStats)initWithDescriptionString:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DRSRequestStats;
  v6 = [(DRSRequestStats *)&v12 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    requests = v6->__requests;
    v6->__requests = v7;

    objc_storeStrong((id *)&v6->_descriptionString, a3);
    if ([(id)objc_opt_class() childStatsClass])
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      childStats = v6->__childStats;
      v6->__childStats = v9;
    }
  }

  return v6;
}

- (unint64_t)requestCount
{
  v2 = [(DRSRequestStats *)self requests];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)logSizeBytes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(DRSRequestStats *)self requests];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) totalLogSizeBytes];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_addChildRequest:(id)a3
{
  id v8 = a3;
  if ([(id)objc_opt_class() childStatsClass])
  {
    uint64_t v4 = [(id)objc_opt_class() descriptionStringForChildStats:v8];
    unint64_t v5 = [(DRSRequestStats *)self childStats];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];

    if (!v6)
    {
      uint64_t v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "childStatsClass")), "initWithDescriptionString:", v4);
      v7 = [(DRSRequestStats *)self _childStats];
      [v7 setObject:v6 forKeyedSubscript:v4];
    }
    [v6 addRequest:v8];
  }
}

- (BOOL)addRequest:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(id)objc_opt_class() descriptionStringForRequest:v4];
  uint64_t v6 = [(DRSRequestStats *)self descriptionString];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(DRSRequestStats *)self requests];
    [v8 addObject:v4];

    [(DRSRequestStats *)self _addChildRequest:v4];
  }

  return v7;
}

- (id)_debugDescription:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v5 = (void *)[&stru_26BDF7DE8 mutableCopy];
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      [v5 appendString:@"\t"];
      --v6;
    }
    while (v6);
  }
  int v7 = (void *)MEMORY[0x263F089D8];
  id v8 = [(id)objc_opt_class() keyName];
  long long v9 = [(DRSRequestStats *)self descriptionString];
  long long v10 = [v7 stringWithFormat:@"%@: %@:\tCount: %llu, Total log size: %lluB\n", v8, v9, -[DRSRequestStats requestCount](self, "requestCount"), -[DRSRequestStats logSizeBytes](self, "logSizeBytes")];

  if ([(id)objc_opt_class() childStatsClass])
  {
    long long v11 = (void *)[&stru_26BDF7DE8 mutableCopy];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v12 = [(DRSRequestStats *)self childStats];
    v13 = [v12 allValues];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      unint64_t v17 = a3 + 1;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          v19 = [*(id *)(*((void *)&v22 + 1) + 8 * i) _debugDescription:v17];
          [v11 appendString:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    [v10 appendFormat:@"%@", v11];
  }
  v20 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v5, v10];

  return v20;
}

- (id)debugDescription
{
  return [(DRSRequestStats *)self _debugDescription:0];
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (NSMutableArray)_requests
{
  return self->__requests;
}

- (NSMutableDictionary)_childStats
{
  return self->__childStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__childStats, 0);
  objc_storeStrong((id *)&self->__requests, 0);

  objc_storeStrong((id *)&self->_descriptionString, 0);
}

@end