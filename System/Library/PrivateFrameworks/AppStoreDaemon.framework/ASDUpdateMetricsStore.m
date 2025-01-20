@interface ASDUpdateMetricsStore
- (ASDUpdateMetricsStore)init;
- (NSArray)metrics;
- (NSDate)lastAutoPollDate;
- (double)averagePollTime;
- (void)addPoll:(id)a3;
- (void)synchronize;
@end

@implementation ASDUpdateMetricsStore

- (ASDUpdateMetricsStore)init
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)ASDUpdateMetricsStore;
  v2 = [(ASDUpdateMetricsStore *)&v34 init];
  if (!v2) {
    return v2;
  }
  v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  lock = v2->_lock;
  v30 = v2;
  v2->_lock = v3;

  self;
  v5 = (void *)CFPreferencesCopyValue(@"UpdateMetrics", @"com.apple.appstored", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  v6 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v7)
  {
    v9 = 0;
    int v31 = 0;
    double v11 = 0.0;
    goto LABEL_18;
  }
  uint64_t v8 = v7;
  v9 = 0;
  int v31 = 0;
  uint64_t v10 = *(void *)v36;
  double v11 = 0.0;
  unint64_t v12 = 0x1E58B2000uLL;
  v13 = @"Manual";
  do
  {
    uint64_t v14 = 0;
    uint64_t v32 = v8;
    do
    {
      if (*(void *)v36 != v10) {
        objc_enumerationMutation(obj);
      }
      v15 = (void *)[objc_alloc(*(Class *)(v12 + 2512)) initWithDictionary:*(void *)(*((void *)&v35 + 1) + 8 * v14)];
      [v6 addObject:v15];
      v16 = [v15 reason];
      if (([v16 isEqualToString:v13] & 1) == 0)
      {
        uint64_t v17 = v10;
        v18 = v6;
        v19 = v13;
        unint64_t v20 = v12;
        v21 = [v15 reason];
        char v22 = [v21 isEqualToString:@"Migration"];

        if (v22)
        {
          unint64_t v12 = v20;
          v13 = v19;
          v6 = v18;
          uint64_t v10 = v17;
          uint64_t v8 = v32;
          goto LABEL_14;
        }
        if (v9)
        {
          ++v31;
          v23 = [v15 pollTime];
          [v23 timeIntervalSinceDate:v9];
          double v11 = v11 + v24;
        }
        unint64_t v12 = v20;
        v13 = v19;
        v6 = v18;
        uint64_t v10 = v17;
        objc_msgSend(v15, "pollTime", v30);
        v9 = v16 = v9;
        uint64_t v8 = v32;
      }

LABEL_14:
      ++v14;
    }
    while (v8 != v14);
    uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  }
  while (v8);
LABEL_18:

  v2 = v30;
  [(NSLock *)v30->_lock lock];
  if (v31 >= 1) {
    v30->_averagePollTime = v11 / (double)v31;
  }
  if (v9)
  {
    uint64_t v25 = [v9 copy];
    lastAutoPollDate = v30->_lastAutoPollDate;
    v30->_lastAutoPollDate = (NSDate *)v25;
  }
  uint64_t v27 = objc_msgSend(v6, "copy", v30);
  metrics = v2->_metrics;
  v2->_metrics = (NSArray *)v27;

  [(NSLock *)v2->_lock unlock];
  return v2;
}

- (void)addPoll:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  id v8 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_metrics];
  [v8 addObject:v5];

  if ((unint64_t)[v8 count] >= 0x11) {
    [v8 removeObjectAtIndex:0];
  }
  v6 = (NSArray *)[v8 copy];
  metrics = self->_metrics;
  self->_metrics = v6;

  [(NSLock *)self->_lock unlock];
  [(ASDUpdateMetricsStore *)self synchronize];
}

- (void)synchronize
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    [(NSLock *)self->_lock lock];
    v3 = (void *)[(NSArray *)self->_metrics copy];
    [(NSLock *)self->_lock unlock];
    v4 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) dictionary];
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    double v11 = (void *)[v4 copy];
  }
  else
  {
    double v11 = 0;
  }
  id value = v11;
  self;
  CFPreferencesSetAppValue(@"UpdateMetrics", value, @"com.apple.appstored");

  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

- (double)averagePollTime
{
  return self->_averagePollTime;
}

- (NSArray)metrics
{
  return self->_metrics;
}

- (NSDate)lastAutoPollDate
{
  return self->_lastAutoPollDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAutoPollDate, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end