@interface ACSimpleRateLimiter
- (ACSimpleRateLimiter)initWithMaximum:(unint64_t)a3 inTimeInterval:(double)a4;
- (BOOL)isEmptyAfterFlushing;
- (BOOL)reservePerformActionNow;
- (NSDate)rateLimitingStartDate;
- (NSLock)instanceLock;
- (NSMutableArray)sortedActionDates;
- (double)timeInterval;
- (unint64_t)locked_indexOfFirstAfter:(id)a3;
- (unint64_t)maximum;
- (void)locked_addDate:(id)a3;
- (void)locked_removeDatesBefore:(id)a3;
- (void)setInstanceLock:(id)a3;
- (void)setSortedActionDates:(id)a3;
@end

@implementation ACSimpleRateLimiter

- (ACSimpleRateLimiter)initWithMaximum:(unint64_t)a3 inTimeInterval:(double)a4
{
  v13.receiver = self;
  v13.super_class = (Class)ACSimpleRateLimiter;
  v6 = [(ACSimpleRateLimiter *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_maximum = a3;
    v6->_timeInterval = a4;
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    instanceLock = v7->_instanceLock;
    v7->_instanceLock = v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    sortedActionDates = v7->_sortedActionDates;
    v7->_sortedActionDates = (NSMutableArray *)v10;
  }
  return v7;
}

- (BOOL)reservePerformActionNow
{
  v3 = [(ACSimpleRateLimiter *)self instanceLock];
  [v3 lock];

  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [(ACSimpleRateLimiter *)self rateLimitingStartDate];
  [(ACSimpleRateLimiter *)self locked_removeDatesBefore:v5];

  v6 = [(ACSimpleRateLimiter *)self sortedActionDates];
  unint64_t v7 = [v6 count];
  unint64_t v8 = [(ACSimpleRateLimiter *)self maximum];

  if (v7 < v8) {
    [(ACSimpleRateLimiter *)self locked_addDate:v4];
  }
  v9 = [(ACSimpleRateLimiter *)self instanceLock];
  [v9 unlock];

  return v7 < v8;
}

- (BOOL)isEmptyAfterFlushing
{
  v3 = [(ACSimpleRateLimiter *)self instanceLock];
  [v3 lock];

  v4 = [(ACSimpleRateLimiter *)self rateLimitingStartDate];
  [(ACSimpleRateLimiter *)self locked_removeDatesBefore:v4];

  v5 = [(ACSimpleRateLimiter *)self sortedActionDates];
  BOOL v6 = [v5 count] == 0;

  unint64_t v7 = [(ACSimpleRateLimiter *)self instanceLock];
  [v7 unlock];

  return v6;
}

- (NSDate)rateLimitingStartDate
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  [(ACSimpleRateLimiter *)self timeInterval];
  double v4 = -v3;

  return (NSDate *)[v2 dateWithTimeIntervalSinceNow:v4];
}

- (unint64_t)locked_indexOfFirstAfter:(id)a3
{
  id v4 = a3;
  v5 = [(ACSimpleRateLimiter *)self sortedActionDates];
  BOOL v6 = [(ACSimpleRateLimiter *)self sortedActionDates];
  unint64_t v7 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v6, "count"), 1024, &__block_literal_global_9);

  return v7;
}

uint64_t __48__ACSimpleRateLimiter_locked_indexOfFirstAfter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)locked_removeDatesBefore:(id)a3
{
  unint64_t v4 = [(ACSimpleRateLimiter *)self locked_indexOfFirstAfter:a3];
  id v5 = [(ACSimpleRateLimiter *)self sortedActionDates];
  objc_msgSend(v5, "removeObjectsInRange:", 0, v4);
}

- (void)locked_addDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ACSimpleRateLimiter *)self locked_indexOfFirstAfter:v4];
  id v6 = [(ACSimpleRateLimiter *)self sortedActionDates];
  [v6 insertObject:v4 atIndex:v5];
}

- (unint64_t)maximum
{
  return self->_maximum;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (NSLock)instanceLock
{
  return (NSLock *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInstanceLock:(id)a3
{
}

- (NSMutableArray)sortedActionDates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSortedActionDates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedActionDates, 0);

  objc_storeStrong((id *)&self->_instanceLock, 0);
}

@end