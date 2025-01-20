@interface _SYMultiSuspendableQueue
- (BOOL)isSuspended;
- (NSString)name;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)targetQueue;
- (PBCodable)stateForLogging;
- (_SYMultiSuspendableQueue)init;
- (_SYMultiSuspendableQueue)initWithName:(id)a3 qosClass:(unsigned int)a4 serial:(BOOL)a5;
- (_SYMultiSuspendableQueue)initWithName:(id)a3 qosClass:(unsigned int)a4 serial:(BOOL)a5 target:(id)a6;
- (unsigned)qosClass;
- (void)async:(id)a3;
- (void)barrierAsync:(id)a3;
- (void)barrierSync:(id)a3;
- (void)dealloc;
- (void)resume;
- (void)suspend;
- (void)sync:(id)a3;
@end

@implementation _SYMultiSuspendableQueue

- (PBCodable)stateForLogging
{
  v3 = objc_opt_new();
  atomic_fetch_or(&self->_resumeCount, 0);
  objc_msgSend(v3, "setResumeCount:");
  label = dispatch_queue_get_label((dispatch_queue_t)self->_queue);
  if (label)
  {
    v5 = [NSString stringWithUTF8String:label];
    [v3 setLabel:v5];
  }
  v6 = dispatch_queue_get_label((dispatch_queue_t)self->_targetQueue);
  if (v6)
  {
    v7 = [NSString stringWithUTF8String:v6];
    [v3 setTarget:v7];
  }
  return (PBCodable *)v3;
}

- (BOOL)isSuspended
{
  signed int v2 = atomic_load((unsigned int *)&self->_resumeCount);
  return v2 < 1;
}

- (_SYMultiSuspendableQueue)init
{
  return [(_SYMultiSuspendableQueue *)self initWithName:0 qosClass:21 serial:1 target:0];
}

- (_SYMultiSuspendableQueue)initWithName:(id)a3 qosClass:(unsigned int)a4 serial:(BOOL)a5
{
  return [(_SYMultiSuspendableQueue *)self initWithName:a3 qosClass:*(void *)&a4 serial:a5 target:0];
}

- (_SYMultiSuspendableQueue)initWithName:(id)a3 qosClass:(unsigned int)a4 serial:(BOOL)a5 target:(id)a6
{
  id v10 = a3;
  v11 = a6;
  v32.receiver = self;
  v32.super_class = (Class)_SYMultiSuspendableQueue;
  id v12 = [(_SYMultiSuspendableQueue *)&v32 init];
  if (v12)
  {
    if (a5) {
      v13 = 0;
    }
    else {
      v13 = MEMORY[0x263EF83A8];
    }
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(v13, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = v14;
    if (a4)
    {
      uint64_t v16 = dispatch_queue_attr_make_with_qos_class(v14, (dispatch_qos_class_t)a4, 0);

      v15 = v16;
    }
    id v17 = v10;
    dispatch_queue_t v18 = dispatch_queue_create_with_target_V2((const char *)[v17 UTF8String], v15, v11);
    v19 = (void *)*((void *)v12 + 1);
    *((void *)v12 + 1) = v18;

    *((void *)v12 + 2) = v11;
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s.%p", objc_msgSend(v17, "UTF8String"), v12);
    v21 = (void *)*((void *)v12 + 5);
    *((void *)v12 + 5) = v20;

    atomic_store(1u, (unsigned int *)v12 + 8);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v22 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEBUG)) {
      -[_SYMultiSuspendableQueue initWithName:qosClass:serial:target:]((uint64_t *)v12 + 5, (unsigned int *)v12 + 8, v22);
    }
    uint64_t v23 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    v24 = (void *)*((void *)v12 + 6);
    *((void *)v12 + 6) = v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    v26 = (void *)*((void *)v12 + 7);
    *((void *)v12 + 7) = v25;

    objc_initWeak(&location, v12);
    v27 = dispatch_get_global_queue(0, 0);
    objc_copyWeak(&v30, &location);
    *((void *)v12 + 3) = os_state_add_handler();

    id v28 = v12;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return (_SYMultiSuspendableQueue *)v12;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21C7C9000, a2, (os_log_type_t)0x90u, "Queue %{public}@ deallocated while suspended", (uint8_t *)&v3, 0xCu);
}

- (NSString)name
{
  uint64_t v2 = NSString;
  label = dispatch_queue_get_label((dispatch_queue_t)self->_queue);
  return (NSString *)[v2 stringWithUTF8String:label];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_queue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (unsigned)qosClass
{
  return dispatch_queue_get_qos_class((dispatch_queue_t)self->_queue, 0);
}

- (void)suspend
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (atomic_fetch_add(&self->_resumeCount, 0xFFFFFFFF) == 1)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    int v3 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      logDescriptor = self->_logDescriptor;
      int v10 = 138543362;
      v11 = logDescriptor;
      _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Suspending %{public}@", (uint8_t *)&v10, 0xCu);
    }
    dispatch_suspend((dispatch_object_t)self->_queue);
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v5 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    v6 = self->_logDescriptor;
    unsigned int v7 = atomic_load((unsigned int *)&self->_resumeCount);
    int v10 = 138543618;
    v11 = v6;
    __int16 v12 = 1024;
    unsigned int v13 = v7;
    _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_INFO, "%{public}@ resume count: %d", (uint8_t *)&v10, 0x12u);
  }
  v8 = [MEMORY[0x263F08B88] callStackSymbols];
  v9 = self;
  objc_sync_enter(v9);
  [(NSMutableArray *)v9->_latestSuspendBacktraces addObject:v8];
  if ((unint64_t)[(NSMutableArray *)v9->_latestSuspendBacktraces count] >= 4) {
    [(NSMutableArray *)v9->_latestSuspendBacktraces removeObjectAtIndex:0];
  }
  objc_sync_exit(v9);
}

- (void)resume
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C7C9000, a2, (os_log_type_t)0x90u, "Over-resume detected for queue %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)sync:(id)a3
{
}

- (void)async:(id)a3
{
}

- (void)barrierSync:(id)a3
{
}

- (void)barrierAsync:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestResumeBacktraces, 0);
  objc_storeStrong((id *)&self->_latestSuspendBacktraces, 0);
  objc_storeStrong((id *)&self->_logDescriptor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithName:(os_log_t)log qosClass:serial:target:.cold.1(uint64_t *a1, unsigned int *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  unsigned int v4 = atomic_load(a2);
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  unsigned int v8 = v4;
  _os_log_debug_impl(&dword_21C7C9000, log, OS_LOG_TYPE_DEBUG, "%{public}@ resume count: %d", (uint8_t *)&v5, 0x12u);
}

@end