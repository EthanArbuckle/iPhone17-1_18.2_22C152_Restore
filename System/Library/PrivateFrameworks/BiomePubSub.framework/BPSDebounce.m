@interface BPSDebounce
- (BPSDebounce)initWithUpstream:(id)a3 for:(double)a4 getTimestamp:(id)a5;
- (BPSPublisher)upstream;
- (NSDate)lastArrivalTimestamp;
- (double)dueTime;
- (id)getTimestamp;
- (id)lastEvent;
- (id)nextEvent;
- (id)upstreamPublishers;
- (void)nextEvent;
- (void)reset;
- (void)setLastArrivalTimestamp:(id)a3;
- (void)setLastEvent:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSDebounce

- (BPSDebounce)initWithUpstream:(id)a3 for:(double)a4 getTimestamp:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (a4 < 0.0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"BPSDebounce.m" lineNumber:115 description:@"dueTime should be greater than or equal to 0"];
  }
  v18.receiver = self;
  v18.super_class = (Class)BPSDebounce;
  v12 = [(BPSDebounce *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upstream, a3);
    v13->_dueTime = a4;
    uint64_t v14 = [v11 copy];
    id getTimestamp = v13->_getTimestamp;
    v13->_id getTimestamp = (id)v14;
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

  v6 = [_BPSDebounceInner alloc];
  [(BPSDebounce *)self dueTime];
  double v8 = v7;
  v9 = [(BPSDebounce *)self getTimestamp];
  id v10 = [(_BPSDebounceInner *)v6 initWithDownstream:v4 for:v9 getTimestamp:v8];

  id v11 = [(BPSDebounce *)self upstream];
  [v11 subscribe:v10];
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSDebounce *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)nextEvent
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(BPSDebounce *)self upstream];
  id v4 = [v3 nextEvent];

  if (v4)
  {
    *(void *)&long long v5 = 138412802;
    long long v21 = v5;
    while (1)
    {
      v6 = [(BPSDebounce *)self getTimestamp];
      double v7 = ((void (**)(void, void *))v6)[2](v6, v4);

      double v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = objc_opt_class();
        objc_super v18 = [v7 description];
        *(_DWORD *)buf = v21;
        uint64_t v23 = v17;
        __int16 v24 = 2112;
        v25 = v4;
        __int16 v26 = 2112;
        v27 = v18;
        _os_log_debug_impl(&dword_1AD01F000, v8, OS_LOG_TYPE_DEBUG, "%@ - receiving: %@ at %@", buf, 0x20u);
      }
      v9 = [(BPSDebounce *)self lastArrivalTimestamp];
      [v7 timeIntervalSinceDate:v9];
      double v11 = v10;
      [(BPSDebounce *)self dueTime];
      double v13 = v12;

      if (v11 >= v13)
      {
        uint64_t v14 = [(BPSDebounce *)self lastEvent];
      }
      else
      {
        uint64_t v14 = 0;
      }
      [(BPSDebounce *)self setLastArrivalTimestamp:v7];
      [(BPSDebounce *)self setLastEvent:v4];
      if (v14) {
        break;
      }
      v15 = [(BPSDebounce *)self upstream];
      uint64_t v16 = [v15 nextEvent];

      id v4 = (void *)v16;
      if (!v16) {
        goto LABEL_10;
      }
    }
    v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[BPSDebounce nextEvent]();
    }
  }
  else
  {
LABEL_10:
    uint64_t v14 = 0;
  }
  return v14;
}

- (void)reset
{
  [(BPSDebounce *)self setLastEvent:0];
  [(BPSDebounce *)self setLastArrivalTimestamp:0];
  v3.receiver = self;
  v3.super_class = (Class)BPSDebounce;
  [(BPSPublisher *)&v3 reset];
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (double)dueTime
{
  return self->_dueTime;
}

- (id)getTimestamp
{
  return self->_getTimestamp;
}

- (id)lastEvent
{
  return self->_lastEvent;
}

- (void)setLastEvent:(id)a3
{
}

- (NSDate)lastArrivalTimestamp
{
  return self->_lastArrivalTimestamp;
}

- (void)setLastArrivalTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastArrivalTimestamp, 0);
  objc_storeStrong(&self->_lastEvent, 0);
  objc_storeStrong(&self->_getTimestamp, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)subscribe:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_1AD01F000, v0, v1, "%@ - subscribe", v2, v3, v4, v5, 2u);
}

- (void)nextEvent
{
  objc_opt_class();
  OUTLINED_FUNCTION_1(&dword_1AD01F000, v0, v1, "%@ - delivering: %@", v2, v3, v4, v5, 2u);
}

@end