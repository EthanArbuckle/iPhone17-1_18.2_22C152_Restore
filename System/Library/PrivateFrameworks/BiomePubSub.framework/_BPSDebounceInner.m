@interface _BPSDebounceInner
- (BPSSubscriber)downstream;
- (NSDate)lastArrivalTimestamp;
- (_BPSDebounceInner)initWithDownstream:(id)a3 for:(double)a4 getTimestamp:(id)a5;
- (double)dueTime;
- (id)lastEvent;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)setDownstream:(id)a3;
- (void)setDueTime:(double)a3;
- (void)setLastArrivalTimestamp:(id)a3;
- (void)setLastEvent:(id)a3;
@end

@implementation _BPSDebounceInner

- (_BPSDebounceInner)initWithDownstream:(id)a3 for:(double)a4 getTimestamp:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_BPSDebounceInner;
  v11 = [(_BPSDebounceInner *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_downstream, a3);
    v12->_dueTime = a4;
    id lastEvent = v12->_lastEvent;
    v12->_id lastEvent = 0;

    uint64_t v14 = [MEMORY[0x1E4F1C9C8] distantFuture];
    lastArrivalTimestamp = v12->_lastArrivalTimestamp;
    v12->_lastArrivalTimestamp = (NSDate *)v14;

    uint64_t v16 = [v10 copy];
    id getTimestamp = v12->_getTimestamp;
    v12->_id getTimestamp = (id)v16;

    v12->_lock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)cancel
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_1AD01F000, v1, v2, "%@ - cancel", v3, v4, v5, v6, 2u);
}

- (void)receiveCompletion:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  uint64_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_BPSDebounceInner receiveCompletion:]();
  }

  v7 = [(_BPSDebounceInner *)v4 downstream];
  [v7 receiveCompletion:v5];
}

- (int64_t)receiveInput:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  os_unfair_lock_lock(&v6->_lock);
  v7 = (*((void (**)(void))v6->_getTimestamp + 2))();
  v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_BPSDebounceInner receiveInput:]((uint64_t)v5, v7);
  }

  [v7 timeIntervalSinceDate:v6->_lastArrivalTimestamp];
  if (v9 >= v6->_dueTime) {
    id v10 = v6->_lastEvent;
  }
  else {
    id v10 = 0;
  }
  objc_storeStrong((id *)&v6->_lastArrivalTimestamp, v7);
  objc_storeStrong(&v6->_lastEvent, a3);
  os_unfair_lock_unlock(&v6->_lock);
  if (v10)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_BPSDebounceInner receiveInput:]((uint64_t)v10, v11);
    }

    v12 = [(_BPSDebounceInner *)v6 downstream];
    int64_t v13 = [v12 receiveInput:v10];
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(_BPSDebounceInner *)self downstream];
  [v5 receiveSubscription:v4];
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (double)dueTime
{
  return self->_dueTime;
}

- (void)setDueTime:(double)a3
{
  self->_dueTime = a3;
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
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong(&self->_getTimestamp, 0);
}

- (void)receiveCompletion:.cold.1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_1AD01F000, v1, v2, "%@ - completion", v3, v4, v5, v6, 2u);
}

- (void)receiveInput:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_DEBUG, "deliverying: %@", (uint8_t *)&v2, 0xCu);
}

- (void)receiveInput:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  v8 = [a2 description];
  OUTLINED_FUNCTION_1(&dword_1AD01F000, v2, v3, "receiving: %@ at %@", v4, v5, v6, v7, 2u);
}

@end