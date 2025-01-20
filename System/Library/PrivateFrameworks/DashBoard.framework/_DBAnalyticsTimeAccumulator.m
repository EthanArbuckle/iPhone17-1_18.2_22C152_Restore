@interface _DBAnalyticsTimeAccumulator
- (BOOL)isAccumulatingTimeForAnyKey;
- (BOOL)isAccumulatingTimeForKey:(id)a3;
- (NSMutableDictionary)accumulatedTimeStorage;
- (NSMutableDictionary)dateStorage;
- (_DBAnalyticsTimeAccumulator)init;
- (double)accumulatedTimeForKey:(id)a3;
- (void)setAccumulatedTimeStorage:(id)a3;
- (void)setDateStorage:(id)a3;
- (void)startCountingTimeForKey:(id)a3;
- (void)stopCountingTimeForAllKeys;
- (void)stopCountingTimeForKey:(id)a3;
@end

@implementation _DBAnalyticsTimeAccumulator

- (_DBAnalyticsTimeAccumulator)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DBAnalyticsTimeAccumulator;
  v2 = [(_DBAnalyticsTimeAccumulator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    dateStorage = v2->_dateStorage;
    v2->_dateStorage = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    accumulatedTimeStorage = v2->_accumulatedTimeStorage;
    v2->_accumulatedTimeStorage = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (BOOL)isAccumulatingTimeForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_DBAnalyticsTimeAccumulator *)self dateStorage];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)isAccumulatingTimeForAnyKey
{
  v2 = [(_DBAnalyticsTimeAccumulator *)self dateStorage];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)startCountingTimeForKey:(id)a3
{
  id v6 = a3;
  if (!-[_DBAnalyticsTimeAccumulator isAccumulatingTimeForKey:](self, "isAccumulatingTimeForKey:"))
  {
    id v4 = [MEMORY[0x263EFF910] date];
    uint64_t v5 = [(_DBAnalyticsTimeAccumulator *)self dateStorage];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
}

- (void)stopCountingTimeForAllKeys
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(_DBAnalyticsTimeAccumulator *)self dateStorage];
  id v4 = [v3 allKeys];
  uint64_t v5 = (void *)[v4 copy];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[_DBAnalyticsTimeAccumulator stopCountingTimeForKey:](self, "stopCountingTimeForKey:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)stopCountingTimeForKey:(id)a3
{
  id v14 = a3;
  id v4 = [(_DBAnalyticsTimeAccumulator *)self dateStorage];
  uint64_t v5 = [v4 objectForKeyedSubscript:v14];

  if (v5)
  {
    [(_DBAnalyticsTimeAccumulator *)self accumulatedTimeForKey:v14];
    double v7 = v6;
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    [v5 DBSecondsToDate:v8];
    double v10 = v7 + v9;

    long long v11 = [NSNumber numberWithDouble:v10];
    long long v12 = [(_DBAnalyticsTimeAccumulator *)self accumulatedTimeStorage];
    [v12 setObject:v11 forKeyedSubscript:v14];

    long long v13 = [(_DBAnalyticsTimeAccumulator *)self dateStorage];
    [v13 setObject:0 forKeyedSubscript:v14];
  }
}

- (double)accumulatedTimeForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_DBAnalyticsTimeAccumulator *)self accumulatedTimeStorage];
  double v6 = [v5 objectForKeyedSubscript:v4];

  [v6 floatValue];
  double v8 = v7;

  return v8;
}

- (NSMutableDictionary)dateStorage
{
  return self->_dateStorage;
}

- (void)setDateStorage:(id)a3
{
}

- (NSMutableDictionary)accumulatedTimeStorage
{
  return self->_accumulatedTimeStorage;
}

- (void)setAccumulatedTimeStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedTimeStorage, 0);
  objc_storeStrong((id *)&self->_dateStorage, 0);
}

@end