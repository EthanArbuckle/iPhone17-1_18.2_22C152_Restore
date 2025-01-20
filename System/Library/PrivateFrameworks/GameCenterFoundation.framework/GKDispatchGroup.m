@interface GKDispatchGroup
+ (GKDispatchGroup)dispatchGroupWithName:(id)a3;
+ (id)backgroundConcurrentQueue;
+ (id)defaultConcurrentQueue;
+ (id)mainQueue;
+ (void)waitUntilDone:(id)a3;
- (BOOL)isDebugLoggingEnabled;
- (GKActivity)activity;
- (GKDispatchGroup)initWithName:(id)a3;
- (NSError)error;
- (id)_values;
- (id)allValues;
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (id)result;
- (int64_t)_waitWithDispatchTimeout:(unint64_t)a3;
- (int64_t)waitWithTimeout:(double)a3;
- (void)dealloc;
- (void)enter;
- (void)join:(id)a3 queue:(id)a4 block:(id)a5;
- (void)leave;
- (void)notifyOnMainQueueWithBlock:(id)a3;
- (void)notifyOnQueue:(id)a3 block:(id)a4;
- (void)perform:(id)a3;
- (void)setActivity:(id)a3;
- (void)setDebugLoggingEnabled:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setResult:(id)a3;
- (void)wait;
@end

@implementation GKDispatchGroup

uint64_t __23__GKDispatchGroup_wait__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _waitWithDispatchTimeout:-1];
}

- (void)notifyOnQueue:(id)a3 block:(id)a4
{
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  v7 = os_log_GKDispatch;
  if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG)) {
    -[GKDispatchGroup notifyOnQueue:block:]((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
  }
  v14 = [(GKDispatchGroup *)self activity];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__GKDispatchGroup_notifyOnQueue_block___block_invoke;
  v15[3] = &unk_1E6472678;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  [(GKActivity *)v14 execute:v15];
}

void __44__GKDispatchGroup__waitWithDispatchTimeout___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  int v3 = [*(id *)(a1 + 32) isDebugLoggingEnabled];
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = dispatch_group_wait(*(dispatch_group_t *)(v4 + 16), *(void *)(a1 + 48));
    return;
  }
  int v5 = GKAtomicIncrement32((atomic_uint *)(v4 + 48));
  double Current = CFAbsoluteTimeGetCurrent();
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  v7 = os_log_GKDispatch;
  if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v14 = 138412802;
    uint64_t v15 = v12;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 2048;
    double v19 = Current;
    _os_log_debug_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_DEBUG, "%@, WAITING, %d, %f, ", (uint8_t *)&v14, 0x1Cu);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = dispatch_group_wait(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16), *(void *)(a1 + 48));
  double v8 = CFAbsoluteTimeGetCurrent();
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    uint64_t v9 = os_log_GKDispatch;
    if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v14 = 138413058;
      uint64_t v15 = v10;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 2048;
      double v19 = v8;
      __int16 v20 = 2048;
      double v21 = v8 - Current;
      uint64_t v11 = "%@, TIMED OUT, %d, %f, %f";
LABEL_17:
      _os_log_debug_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v14, 0x26u);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    uint64_t v9 = os_log_GKDispatch;
    if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138413058;
      uint64_t v15 = v13;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 2048;
      double v19 = v8;
      __int16 v20 = 2048;
      double v21 = v8 - Current;
      uint64_t v11 = "%@, WAITED, %d, %f, %f";
      goto LABEL_17;
    }
  }
}

uint64_t __27__GKDispatchGroup_perform___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isDebugLoggingEnabled];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    int v4 = GKAtomicIncrement32((atomic_uint *)(v3 + 48));
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    v6 = os_log_GKDispatch;
    if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v31 = v22;
      __int16 v32 = 1024;
      int v33 = v4;
      __int16 v34 = 2048;
      CFAbsoluteTime v35 = Current;
      _os_log_debug_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_DEBUG, "%@, PERFORM, %d, %f, ", buf, 0x1Cu);
    }
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __27__GKDispatchGroup_perform___block_invoke_11;
    v28[3] = &unk_1E6472628;
    uint64_t v7 = *(void *)(a1 + 40);
    v28[4] = *(void *)(a1 + 32);
    int v29 = v4;
    *(CFAbsoluteTime *)&v28[5] = Current;
    return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), void *))(v7 + 16))(v7, v28, v8, v9, v10, v11, v12, v13, v23, v24, v25, v26);
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(v3 + 16));
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __27__GKDispatchGroup_perform___block_invoke_13;
    v26 = &unk_1E646E210;
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v27 = *(void *)(a1 + 32);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, void (*)(uint64_t), void *))(v15 + 16))(v15, &v23, v16, v17, v18, v19, v20, v21, MEMORY[0x1E4F143A8], 3221225472, __27__GKDispatchGroup_perform___block_invoke_13, &unk_1E646E210);
  }
}

void __27__GKDispatchGroup_perform___block_invoke_13(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
  int v2 = *(void **)(a1 + 32);
}

+ (void)waitUntilDone:(id)a3
{
  int v4 = +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDispatchGroup+NoARC.m", 32, "+[GKDispatchGroup waitUntilDone:]"));
  [(GKDispatchGroup *)v4 perform:a3];

  [(GKDispatchGroup *)v4 wait];
}

- (void)dealloc
{
  group = self->_group;
  if (group) {
    dispatch_release(group);
  }

  v4.receiver = self;
  v4.super_class = (Class)GKDispatchGroup;
  [(GKDispatchGroup *)&v4 dealloc];
}

- (void)wait
{
  activity = self->_activity;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __23__GKDispatchGroup_wait__block_invoke;
  v3[3] = &unk_1E646E210;
  v3[4] = self;
  [(GKActivity *)activity execute:v3];
}

- (int64_t)_waitWithDispatchTimeout:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  int v5 = [(GKDispatchGroup *)self activity];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__GKDispatchGroup__waitWithDispatchTimeout___block_invoke;
  v8[3] = &unk_1E64726A0;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  [(GKActivity *)v5 execute:v8];

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)perform:(id)a3
{
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  int v5 = os_log_GKDispatch;
  if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG)) {
    -[GKDispatchGroup perform:]((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);
  }
  uint64_t v12 = self;
  uint64_t v13 = [(GKDispatchGroup *)self activity];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__GKDispatchGroup_perform___block_invoke;
  v14[3] = &unk_1E646E288;
  v14[4] = self;
  v14[5] = a3;
  [(GKActivity *)v13 execute:v14];
}

- (GKActivity)activity
{
  return (GKActivity *)objc_getProperty(self, a2, 72, 1);
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(GKThreadsafeDictionary *)self->_values objectForKey:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = [(GKDispatchGroup *)self _values];
  if (a3)
  {
    [v6 setObject:a3 forKey:a4];
  }
  else
  {
    [v6 removeObjectForKey:a4];
  }
}

- (id)_values
{
  p_values = &self->_values;
  id result = self->_values;
  if (!result)
  {
    int v5 = [GKThreadsafeDictionary alloc];
    id v6 = -[GKThreadsafeDictionary initWithName:](v5, "initWithName:", objc_msgSend(NSString, "stringWithFormat:", @"GKDispatchGroup<%p>", self));
    if (GKAtomicCompareAndSwapPtrBarrier(0, (unint64_t)v6, (atomic_ullong *)p_values)) {
      uint64_t v7 = *p_values;
    }

    return *p_values;
  }
  return result;
}

+ (GKDispatchGroup)dispatchGroupWithName:(id)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithName:a3];

  return (GKDispatchGroup *)v3;
}

- (GKDispatchGroup)initWithName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)GKDispatchGroup;
  objc_super v4 = [(GKDispatchGroup *)&v7 init];
  if (v4)
  {
    v4->_name = (NSString *)a3;
    v4->_group = (OS_dispatch_group *)dispatch_group_create();
    v4->_debugLoggingEnabled = os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG);
    v4->_activity = (GKActivity *)+[GKActivity named:a3];
    v4->_sequence = 0;
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    int v5 = os_log_GKDispatch;
    if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "%@: initialized", buf, 0xCu);
    }
  }
  return v4;
}

- (id)result
{
  return objc_getProperty(self, a2, 56, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResult:(id)a3
{
}

- (void)setError:(id)a3
{
}

void __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_15(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v2 = *(void **)(a1 + 32);
}

void __39__GKDispatchGroup_notifyOnQueue_block___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isDebugLoggingEnabled];
  uint64_t v3 = *(atomic_uint **)(a1 + 32);
  if (v2)
  {
    char v4 = v2;
    int v5 = GKAtomicIncrement32(v3 + 12);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    objc_super v7 = os_log_GKDispatch;
    if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = v17;
      __int16 v24 = 1024;
      int v25 = v5;
      __int16 v26 = 2048;
      CFAbsoluteTime v27 = Current;
      _os_log_debug_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_DEBUG, "%@, NOTIFY WAITING, %d, %f, ", buf, 0x1Cu);
    }
    id v8 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(NSObject **)(a1 + 40);
    uint64_t v11 = *(NSObject **)(v10 + 16);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_14;
    v19[3] = &unk_1E6472650;
    char v21 = v4;
    int v20 = v5;
    *(CFAbsoluteTime *)&v19[6] = Current;
    uint64_t v12 = *(void *)(a1 + 48);
    v19[4] = v10;
    v19[5] = v12;
    uint64_t v13 = v19;
  }
  else
  {
    int v14 = v3;
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v9 = *(NSObject **)(a1 + 40);
    uint64_t v11 = *(NSObject **)(v15 + 16);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_15;
    v18[3] = &unk_1E646E260;
    uint64_t v16 = *(void *)(a1 + 48);
    v18[4] = v15;
    v18[5] = v16;
    uint64_t v13 = v18;
  }
  dispatch_group_notify(v11, v9, v13);
}

- (id)description
{
  if (self->_name)
  {
    uint64_t v3 = NSString;
    char v4 = (objc_class *)objc_opt_class();
    return (id)[v3 stringWithFormat:@"<%s:%p> %@", class_getName(v4), self, self->_name];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GKDispatchGroup;
    return [(GKDispatchGroup *)&v6 description];
  }
}

void __27__GKDispatchGroup_perform___block_invoke_11(uint64_t a1)
{
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG)) {
    __27__GKDispatchGroup_perform___block_invoke_11_cold_1();
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
}

- (void)enter
{
}

- (void)leave
{
}

void __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_14(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 60))
  {
    CFAbsoluteTimeGetCurrent();
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG)) {
      __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_14_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)notifyOnMainQueueWithBlock:(id)a3
{
}

- (int64_t)waitWithTimeout:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));

  return [(GKDispatchGroup *)self _waitWithDispatchTimeout:v4];
}

- (void)join:(id)a3 queue:(id)a4 block:(id)a5
{
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  uint64_t v9 = os_log_GKDispatch;
  if (os_log_type_enabled((os_log_t)os_log_GKDispatch, OS_LOG_TYPE_DEBUG)) {
    -[GKDispatchGroup join:queue:block:]((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
  }
  if (a3 != self)
  {
    if (!a4) {
      a4 = +[GKDispatchGroup defaultConcurrentQueue];
    }
    activity = self->_activity;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __36__GKDispatchGroup_join_queue_block___block_invoke;
    v17[3] = &unk_1E6472718;
    v17[4] = self;
    v17[5] = a3;
    v17[6] = a4;
    v17[7] = a5;
    [(GKActivity *)activity execute:v17];
  }
}

uint64_t __36__GKDispatchGroup_join_queue_block___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__GKDispatchGroup_join_queue_block___block_invoke_2;
  v3[3] = &unk_1E64726F0;
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v1 perform:v3];
}

uint64_t __36__GKDispatchGroup_join_queue_block___block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__GKDispatchGroup_join_queue_block___block_invoke_3;
  v5[3] = &unk_1E64726C8;
  v5[4] = a1[6];
  v5[5] = a2;
  return [v3 notifyOnQueue:v2 block:v5];
}

uint64_t __36__GKDispatchGroup_join_queue_block___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

+ (id)defaultConcurrentQueue
{
  return dispatch_get_global_queue(0, 0);
}

+ (id)backgroundConcurrentQueue
{
  return dispatch_get_global_queue(-32768, 0);
}

+ (id)mainQueue
{
  return (id)MEMORY[0x1E4F14428];
}

- (id)allValues
{
  return [(GKThreadsafeDictionary *)self->_values allObjects];
}

- (BOOL)isDebugLoggingEnabled
{
  return self->_debugLoggingEnabled;
}

- (void)setDebugLoggingEnabled:(BOOL)a3
{
  self->_debugLoggingEnabled = a3;
}

- (void)setActivity:(id)a3
{
}

- (void)perform:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __27__GKDispatchGroup_perform___block_invoke_11_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_6();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "%@, DONE, %d, %f, %f", v1, 0x26u);
}

- (void)notifyOnQueue:(uint64_t)a3 block:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__GKDispatchGroup_notifyOnQueue_block___block_invoke_14_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_6();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "%@, NOTIFY CALLED, %d, %f, %f", v1, 0x26u);
}

- (void)join:(uint64_t)a3 queue:(uint64_t)a4 block:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end