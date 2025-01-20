@interface DMCDaemonConnectionTracker
- (DMCDaemonConnectionTracker)initWithProcessName:(id)a3 connectionThreshold:(unint64_t)a4 requestThreshold:(unint64_t)a5;
- (NSMutableDictionary)connectionCache;
- (NSMutableDictionary)pidNameCache;
- (NSMutableDictionary)requestCache;
- (NSString)clientName;
- (OS_dispatch_queue)queue;
- (double)connectionThreshold;
- (double)requestThreshold;
- (id)_nameForProcessWithPID:(int)a3 cache:(id)a4;
- (id)excessiveConncetionHandler;
- (id)excessiveRequestHandler;
- (void)setClientName:(id)a3;
- (void)setConnectionCache:(id)a3;
- (void)setConnectionThreshold:(double)a3;
- (void)setExcessiveConncetionHandler:(id)a3;
- (void)setExcessiveRequestHandler:(id)a3;
- (void)setPidNameCache:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestCache:(id)a3;
- (void)setRequestThreshold:(double)a3;
- (void)trackConnectionFromPID:(int)a3;
- (void)trackRequestFromPID:(int)a3;
@end

@implementation DMCDaemonConnectionTracker

- (void)trackRequestFromPID:(int)a3
{
  v5 = [MEMORY[0x1E4F1C9C8] now];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__DMCDaemonConnectionTracker_trackRequestFromPID___block_invoke;
  block[3] = &unk_1E5CFD710;
  int v10 = a3;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

- (void)trackConnectionFromPID:(int)a3
{
  v5 = [MEMORY[0x1E4F1C9C8] now];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__DMCDaemonConnectionTracker_trackConnectionFromPID___block_invoke;
  block[3] = &unk_1E5CFD710;
  int v10 = a3;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __50__DMCDaemonConnectionTracker_trackRequestFromPID___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  v3 = [*(id *)(a1 + 32) _nameForProcessWithPID:*(unsigned int *)(a1 + 48) cache:*(void *)(*(void *)(a1 + 32) + 56)];
  v4 = *DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_DEBUG, "New request from %{public}@(%d)", buf, 0x12u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  v8 = *(void **)(a1 + 40);
  id v9 = *(id *)(v6 + 48);
  id v10 = v8;
  v11 = v3;
  v12 = v7;
  dispatch_time_t v13 = dispatch_time(0, 3000000000);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___scheduleCleanup_block_invoke;
  v33 = &unk_1E5CFD868;
  id v34 = v9;
  v35 = v11;
  double v36 = *(double *)&v10;
  id v14 = v10;
  v15 = v11;
  id v16 = v9;
  dispatch_after(v13, v12, buf);

  double v17 = *(double *)(*(void *)(a1 + 32) + 72);
  v18 = *(void **)(a1 + 40);
  id v19 = *(id *)(*(void *)(a1 + 32) + 48);
  id v20 = v18;
  v21 = v15;
  v22 = [v19 objectForKeyedSubscript:v21];
  LODWORD(v15) = v22 == 0;

  if (v15)
  {
    v23 = objc_opt_new();
    [v19 setObject:v23 forKeyedSubscript:v21];
  }
  v24 = [v19 objectForKeyedSubscript:v21];
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 1;
  if (objc_msgSend(v24, "count", 0))
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ___queue_verifyThresholdAndAddDateRecord_block_invoke;
    v33 = &unk_1E5CFD840;
    id v34 = v20;
    v35 = &v28;
    double v36 = v17;
    [v24 enumerateObjectsUsingBlock:buf];
  }
  unint64_t v25 = v29[3];
  [v24 addObject:v20];
  _Block_object_dispose(&v28, 8);

  if (v17 <= (double)v25)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      __50__DMCDaemonConnectionTracker_trackRequestFromPID___block_invoke_cold_1(v21, v2);
    }
    v26 = [*(id *)(*(void *)v2 + 48) objectForKeyedSubscript:v21];
    [v26 removeAllObjects];

    uint64_t v27 = *(void *)(*(void *)v2 + 16);
    if (v27) {
      (*(void (**)(uint64_t, void, void *))(v27 + 16))(v27, *(unsigned int *)(a1 + 48), v21);
    }
  }
}

void __53__DMCDaemonConnectionTracker_trackConnectionFromPID___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  v3 = [*(id *)(a1 + 32) _nameForProcessWithPID:*(unsigned int *)(a1 + 48) cache:*(void *)(*(void *)(a1 + 32) + 56)];
  v4 = *DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_DEBUG, "New connection from %{public}@(%d)", buf, 0x12u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  v8 = *(void **)(a1 + 40);
  id v9 = *(id *)(v6 + 40);
  id v10 = v8;
  v11 = v3;
  v12 = v7;
  dispatch_time_t v13 = dispatch_time(0, 3000000000);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___scheduleCleanup_block_invoke;
  v33 = &unk_1E5CFD868;
  id v34 = v9;
  v35 = v11;
  double v36 = *(double *)&v10;
  id v14 = v10;
  v15 = v11;
  id v16 = v9;
  dispatch_after(v13, v12, buf);

  double v17 = *(double *)(*(void *)(a1 + 32) + 64);
  v18 = *(void **)(a1 + 40);
  id v19 = *(id *)(*(void *)(a1 + 32) + 40);
  id v20 = v18;
  v21 = v15;
  v22 = [v19 objectForKeyedSubscript:v21];
  LODWORD(v15) = v22 == 0;

  if (v15)
  {
    v23 = objc_opt_new();
    [v19 setObject:v23 forKeyedSubscript:v21];
  }
  v24 = [v19 objectForKeyedSubscript:v21];
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 1;
  if (objc_msgSend(v24, "count", 0))
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ___queue_verifyThresholdAndAddDateRecord_block_invoke;
    v33 = &unk_1E5CFD840;
    id v34 = v20;
    v35 = &v28;
    double v36 = v17;
    [v24 enumerateObjectsUsingBlock:buf];
  }
  unint64_t v25 = v29[3];
  [v24 addObject:v20];
  _Block_object_dispose(&v28, 8);

  if (v17 <= (double)v25)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      __53__DMCDaemonConnectionTracker_trackConnectionFromPID___block_invoke_cold_1(v21, v2);
    }
    v26 = [*(id *)(*(void *)v2 + 40) objectForKeyedSubscript:v21];
    [v26 removeAllObjects];

    uint64_t v27 = *(void *)(*(void *)v2 + 8);
    if (v27) {
      (*(void (**)(uint64_t, void, void *))(v27 + 16))(v27, *(unsigned int *)(a1 + 48), v21);
    }
  }
}

- (id)_nameForProcessWithPID:(int)a3 cache:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [NSNumber numberWithInt:v4];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = [NSNumber numberWithInt:v4];
    id v9 = [v5 objectForKeyedSubscript:v8];
    goto LABEL_15;
  }
  if (proc_name(v4, buffer, 0x100u) < 1)
  {
    size_t v16 = 648;
    dword_1E97331BC = v4;
    byte_1E9733593 = 0;
    v8 = 0;
    if (sysctl(_nameForProcessWithPID_cache__name, 4u, &_nameForProcessWithPID_cache__kp, &v16, 0, 0)
      || !byte_1E9733593)
    {
      goto LABEL_9;
    }
    id v10 = NSString;
    v11 = &byte_1E9733593;
  }
  else
  {
    id v10 = NSString;
    v11 = buffer;
  }
  v8 = [v10 stringWithUTF8String:v11];
LABEL_9:
  if (v8)
  {
    v12 = [v5 objectForKeyedSubscript:v8];
    if (v12) {
      [v5 setObject:0 forKeyedSubscript:v12];
    }
    dispatch_time_t v13 = [NSNumber numberWithInt:v4];
    [v5 setObject:v8 forKeyedSubscript:v13];

    id v14 = [NSNumber numberWithInt:v4];
    [v5 setObject:v14 forKeyedSubscript:v8];

    id v9 = v8;
  }
  else
  {
    v12 = [NSNumber numberWithInt:v4];
    id v9 = @"unknown";
    [v5 setObject:@"unknown" forKeyedSubscript:v12];
  }

LABEL_15:
  return v9;
}

- (DMCDaemonConnectionTracker)initWithProcessName:(id)a3 connectionThreshold:(unint64_t)a4 requestThreshold:(unint64_t)a5
{
  id v8 = a3;
  if (+[DMCFeatureFlags isAppleInternal])
  {
    v30.receiver = self;
    v30.super_class = (Class)DMCDaemonConnectionTracker;
    id v9 = [(DMCDaemonConnectionTracker *)&v30 init];
    if (v9)
    {
      id v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      id v11 = [NSString stringWithFormat:@"%@_connection_tracker", v8];
      dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], v10);
      queue = v9->_queue;
      v9->_queue = (OS_dispatch_queue *)v12;

      uint64_t v14 = objc_opt_new();
      requestCache = v9->_requestCache;
      v9->_requestCache = (NSMutableDictionary *)v14;

      uint64_t v16 = objc_opt_new();
      connectionCache = v9->_connectionCache;
      v9->_connectionCache = (NSMutableDictionary *)v16;

      uint64_t v18 = objc_opt_new();
      pidNameCache = v9->_pidNameCache;
      v9->_pidNameCache = (NSMutableDictionary *)v18;

      uint64_t v20 = [v8 copy];
      clientName = v9->_clientName;
      v9->_clientName = (NSString *)v20;

      v22.i64[0] = a4;
      v22.i64[1] = a5;
      __asm { FMOV            V1.2D, #3.0 }
      *(float64x2_t *)&v9->_connectionThreshold = vmulq_f64(vcvtq_f64_u64(v22), _Q1);
    }
    self = v9;
    uint64_t v28 = self;
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

- (id)excessiveConncetionHandler
{
  return self->_excessiveConncetionHandler;
}

- (void)setExcessiveConncetionHandler:(id)a3
{
}

- (id)excessiveRequestHandler
{
  return self->_excessiveRequestHandler;
}

- (void)setExcessiveRequestHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (NSMutableDictionary)connectionCache
{
  return self->_connectionCache;
}

- (void)setConnectionCache:(id)a3
{
}

- (NSMutableDictionary)requestCache
{
  return self->_requestCache;
}

- (void)setRequestCache:(id)a3
{
}

- (NSMutableDictionary)pidNameCache
{
  return self->_pidNameCache;
}

- (void)setPidNameCache:(id)a3
{
}

- (double)connectionThreshold
{
  return self->_connectionThreshold;
}

- (void)setConnectionThreshold:(double)a3
{
  self->_connectionThreshold = a3;
}

- (double)requestThreshold
{
  return self->_requestThreshold;
}

- (void)setRequestThreshold:(double)a3
{
  self->_requestThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidNameCache, 0);
  objc_storeStrong((id *)&self->_requestCache, 0);
  objc_storeStrong((id *)&self->_connectionCache, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_excessiveRequestHandler, 0);
  objc_storeStrong(&self->_excessiveConncetionHandler, 0);
}

void __53__DMCDaemonConnectionTracker_trackConnectionFromPID___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 UTF8String];
  [*(id *)(*(void *)a2 + 32) UTF8String];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1A7863000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s has established too many connections to %s in the last %.1f second.", v3, 0x20u);
}

void __50__DMCDaemonConnectionTracker_trackRequestFromPID___block_invoke_cold_1(void *a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 UTF8String];
  [*(id *)(*(void *)a2 + 32) UTF8String];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1A7863000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s has made too many requests to %s in the last %.1f second.", v3, 0x20u);
}

@end