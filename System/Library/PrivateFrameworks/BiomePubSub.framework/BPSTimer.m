@interface BPSTimer
- (BOOL)completed;
- (BPSPublisher)upstream;
- (BPSTimer)initWithUpstream:(id)a3 interval:(double)a4 getTimestamp:(id)a5;
- (NSDate)nextIntervalBoundary;
- (NSMutableArray)pendingTimers;
- (double)interval;
- (id)getTimestamp;
- (id)nextEvent;
- (id)upstreamPublishers;
- (void)nextEvent;
- (void)reset;
- (void)setNextIntervalBoundary:(id)a3;
- (void)setPendingTimers:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSTimer

- (BPSTimer)initWithUpstream:(id)a3 interval:(double)a4 getTimestamp:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (a4 <= 0.0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"BPSTimer.m" lineNumber:123 description:@"interval should be greater than 0"];
  }
  v22.receiver = self;
  v22.super_class = (Class)BPSTimer;
  v12 = [(BPSTimer *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upstream, a3);
    v13->_interval = a4;
    uint64_t v14 = [v11 copy];
    id getTimestamp = v13->_getTimestamp;
    v13->_id getTimestamp = (id)v14;

    uint64_t v16 = [MEMORY[0x1E4F1C9C8] distantPast];
    nextIntervalBoundary = v13->_nextIntervalBoundary;
    v13->_nextIntervalBoundary = (NSDate *)v16;

    uint64_t v18 = objc_opt_new();
    pendingTimers = v13->_pendingTimers;
    v13->_pendingTimers = (NSMutableArray *)v18;
  }
  return v13;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BPSDebounce subscribe:]();
  }

  v6 = [_BPSTimerInner alloc];
  [(BPSTimer *)self interval];
  double v8 = v7;
  v9 = [(BPSTimer *)self getTimestamp];
  id v10 = [(_BPSTimerInner *)v6 initWithDownstream:v4 interval:v9 getTimestamp:v8];

  id v11 = [(BPSTimer *)self upstream];
  [v11 subscribe:v10];
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSTimer *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)nextEvent
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v3 = [(BPSTimer *)self pendingTimers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(BPSTimer *)self pendingTimers];
    v6 = [v5 objectAtIndexedSubscript:0];

    double v7 = [(BPSTimer *)self pendingTimers];
    [v7 removeObjectAtIndex:0];

    double v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BPSTimer nextEvent]();
    }
    goto LABEL_4;
  }
  id v10 = [(BPSTimer *)self upstream];
  double v8 = [v10 nextEvent];

  if (!v8)
  {
    v6 = 0;
    goto LABEL_5;
  }
  *(void *)&long long v11 = 138412802;
  long long v41 = v11;
  while (1)
  {
    v12 = [(BPSTimer *)self getTimestamp];
    v13 = ((void (**)(void, NSObject *))v12)[2](v12, v8);

    uint64_t v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = objc_opt_class();
      v37 = [v13 description];
      *(_DWORD *)buf = v41;
      uint64_t v43 = v36;
      __int16 v44 = 2112;
      v45 = v8;
      __int16 v46 = 2112;
      v47 = v37;
      _os_log_debug_impl(&dword_1AD01F000, v14, OS_LOG_TYPE_DEBUG, "%@ - receiving: %@ at %@", buf, 0x20u);
    }
    v15 = [(BPSTimer *)self nextIntervalBoundary];
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] distantPast];
    char v17 = [v15 isEqualToDate:v16];

    if ((v17 & 1) == 0) {
      break;
    }
    uint64_t v18 = (void *)MEMORY[0x1E4F1C9C8];
    [(BPSTimer *)self interval];
    v19 = objc_msgSend(v18, "dateWithTimeInterval:sinceDate:", v13);
    [(BPSTimer *)self setNextIntervalBoundary:v19];

    v20 = __biome_log_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v38 = objc_opt_class();
      v39 = [(BPSTimer *)self nextIntervalBoundary];
      *(_DWORD *)buf = 138412546;
      uint64_t v43 = v38;
      __int16 v44 = 2112;
      v45 = v39;
      _os_log_debug_impl(&dword_1AD01F000, v20, OS_LOG_TYPE_DEBUG, "%@ - started with nextIntervalBoundary: %@", buf, 0x16u);
    }
LABEL_25:
    v35 = [(BPSTimer *)self upstream];
    v6 = [v35 nextEvent];

    double v8 = v6;
    if (!v6) {
      goto LABEL_5;
    }
  }
  v21 = [(BPSTimer *)self nextIntervalBoundary];
  uint64_t v22 = [v13 compare:v21];

  if (v22 != 1) {
    goto LABEL_25;
  }
  v6 = 0;
  do
  {
    if (v6)
    {
      v23 = [(BPSTimer *)self pendingTimers];
      v24 = [(BPSTimer *)self nextIntervalBoundary];
      [v23 addObject:v24];
    }
    else
    {
      v6 = [(BPSTimer *)self nextIntervalBoundary];
    }
    v25 = (void *)MEMORY[0x1E4F1C9C8];
    [(BPSTimer *)self interval];
    double v27 = v26;
    v28 = [(BPSTimer *)self nextIntervalBoundary];
    v29 = [v25 dateWithTimeInterval:v28 sinceDate:v27];
    [(BPSTimer *)self setNextIntervalBoundary:v29];

    v30 = __biome_log_for_category();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = objc_opt_class();
      v34 = [(BPSTimer *)self nextIntervalBoundary];
      *(_DWORD *)buf = 138412546;
      uint64_t v43 = v33;
      __int16 v44 = 2112;
      v45 = v34;
      _os_log_debug_impl(&dword_1AD01F000, v30, OS_LOG_TYPE_DEBUG, "%@ - set new nextIntervalBoundary: %@", buf, 0x16u);
    }
    v31 = [(BPSTimer *)self nextIntervalBoundary];
    uint64_t v32 = [v13 compare:v31];
  }
  while (v32 == 1);
  if (!v6) {
    goto LABEL_25;
  }
  v40 = __biome_log_for_category();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
    -[BPSTimer nextEvent]();
  }

LABEL_4:
LABEL_5:
  return v6;
}

- (void)reset
{
  v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(BPSTimer *)self setNextIntervalBoundary:v3];

  uint64_t v4 = objc_opt_new();
  [(BPSTimer *)self setPendingTimers:v4];

  v5.receiver = self;
  v5.super_class = (Class)BPSTimer;
  [(BPSPublisher *)&v5 reset];
}

- (BOOL)completed
{
  v3 = [(BPSTimer *)self pendingTimers];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)BPSTimer;
  return [(BPSPublisher *)&v6 completed];
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (double)interval
{
  return self->_interval;
}

- (id)getTimestamp
{
  return self->_getTimestamp;
}

- (NSDate)nextIntervalBoundary
{
  return self->_nextIntervalBoundary;
}

- (void)setNextIntervalBoundary:(id)a3
{
}

- (NSMutableArray)pendingTimers
{
  return self->_pendingTimers;
}

- (void)setPendingTimers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTimers, 0);
  objc_storeStrong((id *)&self->_nextIntervalBoundary, 0);
  objc_storeStrong(&self->_getTimestamp, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)nextEvent
{
  objc_opt_class();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1AD01F000, v0, v1, "%@ - returned pendingTimer: %@", v2, v3, v4, v5, v6);
}

@end