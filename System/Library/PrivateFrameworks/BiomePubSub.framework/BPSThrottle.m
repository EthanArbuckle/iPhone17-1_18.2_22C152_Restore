@interface BPSThrottle
- (BOOL)latest;
- (BPSPublisher)upstream;
- (BPSThrottle)initWithUpstream:(id)a3 interval:(double)a4 latest:(BOOL)a5 getTimestamp:(id)a6;
- (NSDate)nextIntervalBoundary;
- (NSDate)startTimestamp;
- (double)interval;
- (id)getTimestamp;
- (id)intervalEvent;
- (id)nextEvent;
- (id)upstreamPublishers;
- (void)nextEvent;
- (void)reset;
- (void)setIntervalEvent:(id)a3;
- (void)setNextIntervalBoundary:(id)a3;
- (void)setStartTimestamp:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSThrottle

- (BPSThrottle)initWithUpstream:(id)a3 interval:(double)a4 latest:(BOOL)a5 getTimestamp:(id)a6
{
  id v12 = a3;
  id v13 = a6;
  if (a4 < 0.0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"BPSThrottle.m" lineNumber:139 description:@"interval should be greater than or equal to 0"];
  }
  v24.receiver = self;
  v24.super_class = (Class)BPSThrottle;
  v14 = [(BPSThrottle *)&v24 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_upstream, a3);
    v15->_interval = a4;
    v15->_latest = a5;
    uint64_t v16 = [v13 copy];
    id getTimestamp = v15->_getTimestamp;
    v15->_id getTimestamp = (id)v16;

    id intervalEvent = v15->_intervalEvent;
    v15->_id intervalEvent = 0;

    uint64_t v19 = [MEMORY[0x1E4F1C9C8] distantPast];
    nextIntervalBoundary = v15->_nextIntervalBoundary;
    v15->_nextIntervalBoundary = (NSDate *)v19;

    startTimestamp = v15->_startTimestamp;
    v15->_startTimestamp = 0;
  }
  return v15;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BPSThrottle subscribe:]();
  }

  v6 = [_BPSThrottleInner alloc];
  [(BPSThrottle *)self interval];
  double v8 = v7;
  BOOL v9 = [(BPSThrottle *)self latest];
  v10 = [(BPSThrottle *)self getTimestamp];
  v11 = [(_BPSThrottleInner *)v6 initWithDownstream:v4 interval:v9 latest:v10 getTimestamp:v8];

  id v12 = [(BPSThrottle *)self upstream];
  [v12 subscribe:v11];
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSThrottle *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)nextEvent
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [(BPSThrottle *)self upstream];
  id v4 = [v3 nextEvent];

  if (v4)
  {
    *(void *)&long long v5 = 138412802;
    long long v34 = v5;
    while (1)
    {
      v6 = [(BPSThrottle *)self getTimestamp];
      double v7 = ((void (**)(void, void *))v6)[2](v6, v4);

      double v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = objc_opt_class();
        v27 = [v7 description];
        *(_DWORD *)__y = v34;
        *(void *)&__y[4] = v26;
        __int16 v36 = 2112;
        v37 = v4;
        __int16 v38 = 2112;
        v39 = v27;
        _os_log_debug_impl(&dword_1AD01F000, v8, OS_LOG_TYPE_DEBUG, "%@ - receiving: %@ at %@", __y, 0x20u);
      }
      BOOL v9 = [(BPSThrottle *)self nextIntervalBoundary];
      v10 = [MEMORY[0x1E4F1C9C8] distantPast];
      int v11 = [v9 isEqualToDate:v10];

      if (v11) {
        break;
      }
      id v12 = [(BPSThrottle *)self nextIntervalBoundary];
      uint64_t v13 = [v7 compare:v12];

      if (v13 == 1)
      {
        id v14 = [(BPSThrottle *)self intervalEvent];

        if (v14)
        {
          id v14 = [(BPSThrottle *)self intervalEvent];
        }
        v15 = [(BPSThrottle *)self startTimestamp];
        [v7 timeIntervalSinceDate:v15];
        double v17 = v16;

        [(BPSThrottle *)self interval];
        long double v19 = 1.0 - modf(v17 / v18, (long double *)__y);
        id v20 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [(BPSThrottle *)self interval];
        v22 = (void *)[v20 initWithTimeInterval:v7 sinceDate:(double)(v19 * v21)];
        [(BPSThrottle *)self setNextIntervalBoundary:v22];

        [(BPSThrottle *)self setIntervalEvent:v4];
        if (v14)
        {
          v31 = __biome_log_for_category();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            -[BPSThrottle nextEvent]();
          }

          goto LABEL_22;
        }
      }
      else if ([(BPSThrottle *)self latest] {
             || ([(BPSThrottle *)self intervalEvent],
      }
                 v23 = objc_claimAutoreleasedReturnValue(),
                 v23,
                 !v23))
      {
        [(BPSThrottle *)self setIntervalEvent:v4];
      }
      objc_super v24 = [(BPSThrottle *)self upstream];
      uint64_t v25 = [v24 nextEvent];

      id v4 = (void *)v25;
      if (!v25) {
        goto LABEL_15;
      }
    }
    v28 = __biome_log_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[BPSThrottle nextEvent]();
    }

    [(BPSThrottle *)self setStartTimestamp:v7];
    v29 = (void *)MEMORY[0x1E4F1C9C8];
    [(BPSThrottle *)self interval];
    v30 = objc_msgSend(v29, "dateWithTimeInterval:sinceDate:", v7);
    [(BPSThrottle *)self setNextIntervalBoundary:v30];

    id v14 = v4;
LABEL_22:
  }
  else
  {
LABEL_15:
    id v14 = 0;
  }
  return v14;
}

- (void)reset
{
  [(BPSThrottle *)self setIntervalEvent:0];
  v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(BPSThrottle *)self setNextIntervalBoundary:v3];

  [(BPSThrottle *)self setStartTimestamp:0];
  v4.receiver = self;
  v4.super_class = (Class)BPSThrottle;
  [(BPSPublisher *)&v4 reset];
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (double)interval
{
  return self->_interval;
}

- (BOOL)latest
{
  return self->_latest;
}

- (id)getTimestamp
{
  return self->_getTimestamp;
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
  objc_storeStrong(&self->_getTimestamp, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)subscribe:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1AD01F000, v0, v1, "%@ - subscribe", v2, v3, v4, v5, v6);
}

- (void)nextEvent
{
  objc_opt_class();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1AD01F000, v0, v1, "%@ - delivering: %@", v2, v3, v4, v5, v6);
}

@end