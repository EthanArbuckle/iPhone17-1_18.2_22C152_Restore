@interface _CDMultiLevelRateLimiter
- (BOOL)credit;
- (BOOL)debited;
- (NSDate)lastRecorded;
- (NSString)description;
- (_CDMultiLevelRateLimiter)init;
- (_CDMultiLevelRateLimiter)initWithPeriodToCountMap:(id)a3;
- (int64_t)numOfRateLimitPolicies;
- (void)recordTimeAndRefillIfNeededRaw;
@end

@implementation _CDMultiLevelRateLimiter

- (_CDMultiLevelRateLimiter)init
{
  return 0;
}

- (_CDMultiLevelRateLimiter)initWithPeriodToCountMap:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_CDMultiLevelRateLimiter;
  v5 = [(_CDMultiLevelRateLimiter *)&v43 init];
  if (v5)
  {
    v6 = [v4 allKeys];
    v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_40];
    v8 = (void *)[v7 mutableCopy];

    v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5->_numberOfRateLimitPolicies];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v39 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v12);
    }
    v38 = v5;

    v16 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v17 = [v9 count] - 1;
    if (v17 >= 1)
    {
      do
      {
        v18 = [v9 objectAtIndexedSubscript:v17];
        uint64_t v19 = [v18 integerValue];

        unint64_t v20 = v17 + 1;
        do
        {
          v21 = [v9 objectAtIndexedSubscript:v20 - 2];
          uint64_t v22 = [v21 integerValue];

          if (v22 >= v19) {
            [v16 addIndex:v20 - 2];
          }
          --v20;
        }
        while (v20 > 1);
        if ([v16 count])
        {
          [v9 removeObjectsAtIndexes:v16];
          [v10 removeObjectsAtIndexes:v16];
          [v16 removeAllIndexes];
        }
        unint64_t v23 = [v9 count];
        if (v23 >= v17) {
          unint64_t v24 = v17;
        }
        else {
          unint64_t v24 = v23;
        }
        uint64_t v17 = v24 - 1;
      }
      while ((uint64_t)(v24 - 1) > 0);
    }
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithArray:v10];
    v5 = v38;
    periods = v38->_periods;
    v38->_periods = (NSArray *)v25;

    v38->_numberOfRateLimitPolicies = [(NSArray *)v38->_periods count];
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithArray:v9];
    maxCounts = v38->_maxCounts;
    v38->_maxCounts = (NSArray *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v38->_numberOfRateLimitPolicies];
    periodStart = v38->_periodStart;
    v38->_periodStart = (NSMutableArray *)v29;

    uint64_t v31 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v38->_numberOfRateLimitPolicies];
    balances = v38->_balances;
    v38->_balances = (NSMutableArray *)v31;

    v33 = [MEMORY[0x1E4F1C9C8] distantPast];
    objc_storeStrong((id *)&v38->_lastRecorded, v33);
    if (v38->_numberOfRateLimitPolicies >= 1)
    {
      int64_t v34 = 0;
      do
      {
        [(NSMutableArray *)v38->_balances setObject:&unk_1EDE1DB38 atIndexedSubscript:v34];
        [(NSMutableArray *)v38->_periodStart setObject:v33 atIndexedSubscript:v34++];
      }
      while (v34 < v38->_numberOfRateLimitPolicies);
    }
    dispatch_queue_t v35 = dispatch_queue_create("com.apple.duet.multilevelratelimiter", 0);
    queue = v38->_queue;
    v38->_queue = (OS_dispatch_queue *)v35;
  }
  return v5;
}

- (BOOL)credit
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34___CDMultiLevelRateLimiter_credit__block_invoke;
  block[3] = &unk_1E560D578;
  block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

- (BOOL)debited
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35___CDMultiLevelRateLimiter_debited__block_invoke;
  v5[3] = &unk_1E560EBD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)recordTimeAndRefillIfNeededRaw
{
  char v3 = [MEMORY[0x1E4F1C9C8] date];
  if (self->_numberOfRateLimitPolicies >= 1)
  {
    int64_t v4 = 0;
    do
    {
      v5 = [(NSMutableArray *)self->_periodStart objectAtIndexedSubscript:v4];
      [(NSDate *)v3 timeIntervalSinceDate:v5];
      double v7 = v6;
      uint64_t v8 = [(NSArray *)self->_periods objectAtIndexedSubscript:v4];
      [v8 doubleValue];
      double v10 = v9;

      if (v7 > v10)
      {
        [(NSMutableArray *)self->_periodStart setObject:v3 atIndexedSubscript:v4];
        [(NSMutableArray *)self->_balances setObject:&unk_1EDE1DB38 atIndexedSubscript:v4];
      }
      ++v4;
    }
    while (self->_numberOfRateLimitPolicies > v4);
  }
  lastRecorded = self->_lastRecorded;
  self->_lastRecorded = v3;
}

- (NSString)description
{
  char v3 = NSString;
  int64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  double v6 = [v3 stringWithFormat:@"%@: %@ per %@", v5, self->_maxCounts, self->_periods];

  return (NSString *)v6;
}

- (NSDate)lastRecorded
{
  return self->_lastRecorded;
}

- (int64_t)numOfRateLimitPolicies
{
  return self->_numberOfRateLimitPolicies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_maxCounts, 0);
  objc_storeStrong((id *)&self->_periodStart, 0);
  objc_storeStrong((id *)&self->_periods, 0);
  objc_storeStrong((id *)&self->_lastRecorded, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end