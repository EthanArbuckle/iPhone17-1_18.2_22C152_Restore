@interface _BPSTimerInner
- (BPSSubscriber)downstream;
- (NSDate)nextIntervalBoundary;
- (NSDate)startTimestamp;
- (_BPSTimerInner)initWithDownstream:(id)a3 interval:(double)a4 getTimestamp:(id)a5;
- (double)interval;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)setDownstream:(id)a3;
- (void)setInterval:(double)a3;
- (void)setNextIntervalBoundary:(id)a3;
- (void)setStartTimestamp:(id)a3;
@end

@implementation _BPSTimerInner

- (_BPSTimerInner)initWithDownstream:(id)a3 interval:(double)a4 getTimestamp:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_BPSTimerInner;
  v11 = [(_BPSTimerInner *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_downstream, a3);
    v12->_interval = a4;
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] distantPast];
    nextIntervalBoundary = v12->_nextIntervalBoundary;
    v12->_nextIntervalBoundary = (NSDate *)v13;

    startTimestamp = v12->_startTimestamp;
    v12->_startTimestamp = 0;

    uint64_t v16 = [v10 copy];
    id getTimestamp = v12->_getTimestamp;
    v12->_id getTimestamp = (id)v16;

    v12->_lock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)receiveCompletion:(id)a3
{
  v4 = self;
  id v5 = a3;
  v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_BPSTimerInner receiveCompletion:]();
  }

  v7 = [(_BPSTimerInner *)v4 downstream];
  [v7 receiveCompletion:v5];
}

- (int64_t)receiveInput:(id)a3
{
  *(void *)&v20[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  v7 = (*((void (**)(void))v5->_getTimestamp + 2))();
  v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_BPSDebounceInner receiveInput:]((uint64_t)v4, v7);
  }

  p_nextIntervalBoundary = &v5->_nextIntervalBoundary;
  nextIntervalBoundary = v5->_nextIntervalBoundary;
  v11 = [MEMORY[0x1E4F1C9C8] distantPast];
  LODWORD(nextIntervalBoundary) = [(NSDate *)nextIntervalBoundary isEqualToDate:v11];

  if (nextIntervalBoundary)
  {
    objc_storeStrong((id *)&v5->_startTimestamp, v7);
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v7 sinceDate:v5->_interval];
    uint64_t v13 = v5->_nextIntervalBoundary;
    v5->_nextIntervalBoundary = (NSDate *)v12;
  }
  else if ([v7 compare:*p_nextIntervalBoundary] == 1 {
         && [v7 compare:*p_nextIntervalBoundary] == 1)
  }
  {
    do
    {
      os_unfair_lock_unlock(p_lock);
      v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[_BPSTimerInner receiveInput:](v19, (id *)&v5->_nextIntervalBoundary, v20, v14);
      }

      v15 = [(_BPSTimerInner *)v5 downstream];
      [v15 receiveInput:v5->_nextIntervalBoundary];

      os_unfair_lock_lock(p_lock);
      uint64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v5->_nextIntervalBoundary sinceDate:v5->_interval];
      v17 = v5->_nextIntervalBoundary;
      v5->_nextIntervalBoundary = (NSDate *)v16;
    }
    while ([v7 compare:v5->_nextIntervalBoundary] == 1);
  }
  os_unfair_lock_unlock(p_lock);

  return 0;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(_BPSTimerInner *)self downstream];
  [v5 receiveSubscription:v4];
}

- (void)cancel
{
  objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_1AD01F000, v0, v1, "%@ - cancel", v2, v3, v4, v5, 2u);
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (NSDate)nextIntervalBoundary
{
  return self->_nextIntervalBoundary;
}

- (void)setNextIntervalBoundary:(id)a3
{
}

- (NSDate)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_nextIntervalBoundary, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong(&self->_getTimestamp, 0);
}

- (void)receiveCompletion:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_1AD01F000, v0, v1, "%@ - completion", v2, v3, v4, v5, 2u);
}

- (void)receiveInput:(void *)a3 .cold.1(uint8_t *a1, id *a2, void *a3, NSObject *a4)
{
  v7 = [*a2 description];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1AD01F000, a4, OS_LOG_TYPE_DEBUG, "delivering: %@", a1, 0xCu);
}

@end