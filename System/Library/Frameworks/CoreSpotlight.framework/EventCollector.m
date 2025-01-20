@interface EventCollector
- (EventCollector)init;
- (NSMutableDictionary)collectedData;
- (void)clear;
- (void)handleEventWithStr1:(id)a3 str2:(id)a4 num:(unint64_t)a5;
- (void)printResultsWithBlock:(id)a3;
- (void)setCollectedData:(id)a3;
@end

@implementation EventCollector

- (EventCollector)init
{
  v6.receiver = self;
  v6.super_class = (Class)EventCollector;
  v2 = [(EventCollector *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    collectedData = v2->_collectedData;
    v2->_collectedData = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)handleEventWithStr1:(id)a3 str2:(id)a4 num:(unint64_t)a5
{
  id v17 = +[NSString stringWithFormat:@"%@|%@", a3, a4];
  v7 = [(EventCollector *)self collectedData];
  v8 = [v7 objectForKeyedSubscript:v17];

  if (!v8)
  {
    id v9 = [&off_1000E6DB0 mutableCopy];
    v10 = [(EventCollector *)self collectedData];
    [v10 setObject:v9 forKeyedSubscript:v17];
  }
  v11 = [(EventCollector *)self collectedData];
  v12 = [v11 objectForKeyedSubscript:v17];

  v13 = [v12 objectForKeyedSubscript:@"count"];
  v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v13 integerValue] + 1);
  [v12 setObject:v14 forKeyedSubscript:@"count"];

  v15 = [v12 objectForKeyedSubscript:@"total"];
  v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v15 unsignedLongLongValue] + a5);
  [v12 setObject:v16 forKeyedSubscript:@"total"];
}

- (void)printResultsWithBlock:(id)a3
{
  v4 = (void (**)(id, char *))a3;
  v27 = self;
  v5 = [(EventCollector *)self collectedData];
  objc_super v6 = [v5 allKeys];
  v7 = [v6 sortedArrayUsingSelector:"compare:"];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v26 = *(void *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v10);
        bzero(v32, 0x400uLL);
        v12 = [(EventCollector *)v27 collectedData];
        v13 = [v12 objectForKeyedSubscript:v11];

        v14 = [v13 objectForKeyedSubscript:@"count"];
        id v15 = [v14 unsignedLongLongValue];

        v16 = [v13 objectForKeyedSubscript:@"total"];
        id v17 = [v16 unsignedLongLongValue];

        if (v15) {
          double v18 = (double)(unint64_t)v17 / (double)(unint64_t)v15;
        }
        else {
          double v18 = 0.0;
        }
        v19 = [v11 componentsSeparatedByString:@"|"];
        v20 = [v19 objectAtIndexedSubscript:0];
        v21 = [v19 objectAtIndexedSubscript:1];
        id v22 = v20;
        v23 = (const char *)[v22 UTF8String];
        id v24 = v21;
        __sprintf_chk(v32, 0, 0x400uLL, "type: %s, outcome: %s -> count: %llu, avg: %.2f, total:%llu", v23, (const char *)[v24 UTF8String], v15, v18, v17);
        v4[2](v4, v32);

        v10 = (char *)v10 + 1;
      }
      while (v9 != v10);
      id v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }
}

- (void)clear
{
  id v2 = [(EventCollector *)self collectedData];
  [v2 removeAllObjects];
}

- (NSMutableDictionary)collectedData
{
  return self->_collectedData;
}

- (void)setCollectedData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end