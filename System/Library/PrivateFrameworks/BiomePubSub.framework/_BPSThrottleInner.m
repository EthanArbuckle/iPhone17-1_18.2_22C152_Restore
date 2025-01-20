@interface _BPSThrottleInner
- (BOOL)latest;
- (BPSSubscriber)downstream;
- (NSDate)nextIntervalBoundary;
- (NSDate)startTimestamp;
- (_BPSThrottleInner)initWithDownstream:(id)a3 interval:(double)a4 latest:(BOOL)a5 getTimestamp:(id)a6;
- (double)interval;
- (id)intervalEvent;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)setDownstream:(id)a3;
- (void)setInterval:(double)a3;
- (void)setIntervalEvent:(id)a3;
- (void)setLatest:(BOOL)a3;
- (void)setNextIntervalBoundary:(id)a3;
- (void)setStartTimestamp:(id)a3;
@end

@implementation _BPSThrottleInner

- (_BPSThrottleInner)initWithDownstream:(id)a3 interval:(double)a4 latest:(BOOL)a5 getTimestamp:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_BPSThrottleInner;
  v13 = [(_BPSThrottleInner *)&v22 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_downstream, a3);
    v14->_interval = a4;
    v14->_latest = a5;
    id intervalEvent = v14->_intervalEvent;
    v14->_id intervalEvent = 0;

    uint64_t v16 = [MEMORY[0x1E4F1C9C8] distantPast];
    nextIntervalBoundary = v14->_nextIntervalBoundary;
    v14->_nextIntervalBoundary = (NSDate *)v16;

    startTimestamp = v14->_startTimestamp;
    v14->_startTimestamp = 0;

    uint64_t v19 = [v12 copy];
    id getTimestamp = v14->_getTimestamp;
    v14->_id getTimestamp = (id)v19;

    v14->_lock._os_unfair_lock_opaque = 0;
  }

  return v14;
}

- (void)cancel
{
  objc_opt_class();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1AD01F000, v0, v1, "%@ - cancel", v2, v3, v4, v5, v6);
}

- (void)receiveCompletion:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  uint8_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_BPSThrottleInner receiveCompletion:]();
  }

  v7 = [(_BPSThrottleInner *)v4 downstream];
  [v7 receiveCompletion:v5];
}

- (int64_t)receiveInput:(id)a3
{
  id v5 = a3;
  uint8_t v6 = self;
  p_lock = &v6->_lock;
  os_unfair_lock_lock(&v6->_lock);
  v8 = (*((void (**)(void))v6->_getTimestamp + 2))();
  v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_BPSDebounceInner receiveInput:]((uint64_t)v5, v8);
  }

  nextIntervalBoundary = v6->_nextIntervalBoundary;
  id v11 = [MEMORY[0x1E4F1C9C8] distantPast];
  LODWORD(nextIntervalBoundary) = [(NSDate *)nextIntervalBoundary isEqualToDate:v11];

  if (nextIntervalBoundary)
  {
    id v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_BPSThrottleInner receiveInput:]();
    }

    objc_storeStrong((id *)&v6->_startTimestamp, v8);
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v8 sinceDate:v6->_interval];
    v14 = v6->_nextIntervalBoundary;
    v6->_nextIntervalBoundary = (NSDate *)v13;

    os_unfair_lock_unlock(p_lock);
    v15 = [(_BPSThrottleInner *)v6 downstream];
    int64_t v16 = [v15 receiveInput:v5];

    goto LABEL_19;
  }
  if ([v8 compare:v6->_nextIntervalBoundary] != 1)
  {
    if (v6->_latest || !v6->_intervalEvent) {
      objc_storeStrong(&v6->_intervalEvent, a3);
    }
    os_unfair_lock_unlock(p_lock);
    goto LABEL_18;
  }
  id intervalEvent = v6->_intervalEvent;
  if (intervalEvent) {
    id v18 = intervalEvent;
  }
  [v8 timeIntervalSinceDate:v6->_startTimestamp];
  uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeInterval:sinceDate:", v8, (double)((1.0 - modf(v19 / v6->_interval, &__y)) * v6->_interval));
  v21 = v6->_nextIntervalBoundary;
  v6->_nextIntervalBoundary = (NSDate *)v20;

  objc_storeStrong(&v6->_intervalEvent, a3);
  os_unfair_lock_unlock(p_lock);
  if (!intervalEvent)
  {
LABEL_18:
    int64_t v16 = 0;
    goto LABEL_19;
  }
  objc_super v22 = __biome_log_for_category();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[_BPSThrottleInner receiveInput:]();
  }

  v23 = [(_BPSThrottleInner *)v6 downstream];
  int64_t v16 = [v23 receiveInput:intervalEvent];

LABEL_19:
  return v16;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(_BPSThrottleInner *)self downstream];
  [v5 receiveSubscription:v4];
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

- (BOOL)latest
{
  return self->_latest;
}

- (void)setLatest:(BOOL)a3
{
  self->_latest = a3;
}

- (id)intervalEvent
{
  return self->_intervalEvent;
}

- (void)setIntervalEvent:(id)a3
{
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
  objc_storeStrong(&self->_intervalEvent, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong(&self->_getTimestamp, 0);
}

- (void)receiveCompletion:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1AD01F000, v0, v1, "%@ - completion", v2, v3, v4, v5, v6);
}

- (void)receiveInput:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_1AD01F000, v0, OS_LOG_TYPE_DEBUG, "delivering 1st: %@", v1, 0xCu);
}

- (void)receiveInput:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_1AD01F000, v0, OS_LOG_TYPE_DEBUG, "delivering: %@", v1, 0xCu);
}

@end