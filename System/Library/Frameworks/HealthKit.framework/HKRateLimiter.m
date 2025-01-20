@interface HKRateLimiter
- (BOOL)perform:(id)a3 cost:(unint64_t)a4;
- (HKRateLimiter)initWithLimit:(unint64_t)a3 timeInterval:(double)a4;
- (double)timeInterval;
- (uint64_t)_lock_usedBudget;
- (unint64_t)limit;
@end

@implementation HKRateLimiter

- (HKRateLimiter)initWithLimit:(unint64_t)a3 timeInterval:(double)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HKRateLimiter;
  v6 = [(HKRateLimiter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_limit = a3;
    v6->_timeInterval = a4;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    history = v7->_history;
    v7->_history = v8;
  }
  return v7;
}

- (BOOL)perform:(id)a3 cost:(unint64_t)a4
{
  v6 = (void (**)(void))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v8 = -[HKRateLimiter _lock_usedBudget]((uint64_t)self) + a4;
  unint64_t limit = self->_limit;
  if (v8 > limit)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    history = self->_history;
    objc_super v11 = [_HKRateLimiterOperationRecord alloc];
    v12 = [MEMORY[0x1E4F1C9C8] date];
    v13 = -[_HKRateLimiterOperationRecord initWithDatePerformed:cost:](v11, v12, a4);
    [(NSMutableArray *)history addObject:v13];

    os_unfair_lock_unlock(p_lock);
    v6[2](v6);
  }

  return v8 <= limit;
}

- (uint64_t)_lock_usedBudget
{
  uint64_t v1 = a1;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-*(double *)(a1 + 32)];
    v3 = *(void **)(v1 + 16);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __33__HKRateLimiter__lock_usedBudget__block_invoke;
    v15[3] = &unk_1E58C1D30;
    id v4 = v2;
    id v16 = v4;
    objc_msgSend(v3, "hk_removeObjectsPassingTest:", v15);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = *(id *)(v1 + 16);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v1 = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v1 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "cost", (void)v11);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

BOOL __33__HKRateLimiter__lock_usedBudget__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 datePerformed];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] == -1;

  return v4;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void).cxx_destruct
{
}

@end