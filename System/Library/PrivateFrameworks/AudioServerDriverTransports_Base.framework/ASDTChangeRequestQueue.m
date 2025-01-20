@interface ASDTChangeRequestQueue
+ (id)forObject:(id)a3 withName:(id)a4 andManager:(id)a5;
- (ASDObject)object;
- (ASDTChangeRequestManager)manager;
- (BOOL)addChangeRequest:(id)a3;
- (NSMutableArray)queue;
- (NSString)name;
- (_opaque_pthread_t)executionThread;
- (id)initForObject:(id)a3 withName:(id)a4 andManager:(id)a5;
- (int)flags;
- (unsigned)changeRequestsExecuted;
- (void)execute;
- (void)executeChangeRequest:(id)a3;
- (void)setChangeRequestsExecuted:(unsigned int)a3;
- (void)setExecutionThread:(_opaque_pthread_t *)a3;
- (void)setFlags:(int)a3;
- (void)setManager:(id)a3;
- (void)setName:(id)a3;
- (void)setObject:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation ASDTChangeRequestQueue

- (id)initForObject:(id)a3 withName:(id)a4 andManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ASDTChangeRequestQueue;
  v11 = [(ASDTChangeRequestQueue *)&v18 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_6;
  }
  v13 = 0;
  if (v8 && v9 && v10)
  {
    [(ASDTChangeRequestQueue *)v11 setManager:v10];
    [(ASDTChangeRequestQueue *)v12 setObject:v8];
    [(ASDTChangeRequestQueue *)v12 setName:v9];
    v14 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    [(ASDTChangeRequestQueue *)v12 setQueue:v14];

    v15 = [(ASDTChangeRequestQueue *)v12 queue];

    if (v15)
    {
LABEL_6:
      v13 = v12;
      goto LABEL_7;
    }
    v17 = ASDTBaseLogType();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ASDTChangeRequestQueue initForObject:withName:andManager:](v17);
    }

    v13 = 0;
  }
LABEL_7:

  return v13;
}

+ (id)forObject:(id)a3 withName:(id)a4 andManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initForObject:v10 withName:v9 andManager:v8];

  return v11;
}

- (BOOL)addChangeRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([(ASDTChangeRequestQueue *)self flags] & 2) != 0
    && (v5 = pthread_self(), v5 == [(ASDTChangeRequestQueue *)self executionThread]))
  {
    id v9 = [(ASDTChangeRequestQueue *)self manager];
    id v10 = [v9 changeRequestLock];
    [v10 unlock];

    v11 = ASDTBaseLogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(ASDTChangeRequestQueue *)self manager];
      v13 = [v12 bundleID];
      v14 = [(ASDTChangeRequestQueue *)self name];
      int v17 = 138412802;
      objc_super v18 = v13;
      __int16 v19 = 2112;
      v20 = v14;
      __int16 v21 = 1024;
      int v22 = [v4 index];
      _os_log_impl(&dword_2489BC000, v11, OS_LOG_TYPE_DEFAULT, "%@: Change requests already running for %@; running request %u inline.",
        (uint8_t *)&v17,
        0x1Cu);
    }
    [(ASDTChangeRequestQueue *)self executeChangeRequest:v4];
    v15 = [(ASDTChangeRequestQueue *)self manager];
    v16 = [v15 changeRequestLock];
    [v16 lock];

    [(ASDTChangeRequestQueue *)self setChangeRequestsExecuted:[(ASDTChangeRequestQueue *)self changeRequestsExecuted] + 1];
    BOOL v7 = 0;
  }
  else
  {
    v6 = [(ASDTChangeRequestQueue *)self queue];
    [v6 addObject:v4];

    BOOL v7 = [(ASDTChangeRequestQueue *)self flags] == 0;
    [(ASDTChangeRequestQueue *)self setFlags:[(ASDTChangeRequestQueue *)self flags] | 1];
  }

  return v7;
}

- (void)executeChangeRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = ASDTBaseLogType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(ASDTChangeRequestQueue *)self manager];
    BOOL v7 = [v6 bundleID];
    int v8 = [v4 index];
    id v9 = [(ASDTChangeRequestQueue *)self name];
    int v17 = 138412802;
    objc_super v18 = v7;
    __int16 v19 = 1024;
    int v20 = v8;
    __int16 v21 = 2112;
    int v22 = v9;
    _os_log_impl(&dword_2489BC000, v5, OS_LOG_TYPE_DEFAULT, "%@: Starting config change %u for device: %@", (uint8_t *)&v17, 0x1Cu);
  }
  id v10 = [v4 block];

  if (v10)
  {
    v11 = [v4 block];
    v11[2]();
  }
  v12 = ASDTBaseLogType();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(ASDTChangeRequestQueue *)self manager];
    v14 = [v13 bundleID];
    int v15 = [v4 index];
    v16 = [(ASDTChangeRequestQueue *)self name];
    int v17 = 138412802;
    objc_super v18 = v14;
    __int16 v19 = 1024;
    int v20 = v15;
    __int16 v21 = 2112;
    int v22 = v16;
    _os_log_impl(&dword_2489BC000, v12, OS_LOG_TYPE_DEFAULT, "%@: Completed config change %u for device: %@", (uint8_t *)&v17, 0x1Cu);
  }
}

- (void)execute
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v3 = [(ASDTChangeRequestQueue *)self manager];
  id v4 = [v3 changeRequestLock];
  [v4 lock];

  v5 = [(ASDTChangeRequestQueue *)self object];

  if (v5)
  {
    [(ASDTChangeRequestQueue *)self setFlags:[(ASDTChangeRequestQueue *)self flags] | 2];
    [(ASDTChangeRequestQueue *)self setExecutionThread:pthread_self()];
    while (1)
    {
      v6 = [(ASDTChangeRequestQueue *)self queue];
      uint64_t v7 = [v6 count];

      if (!v7) {
        break;
      }
      int v8 = [(ASDTChangeRequestQueue *)self queue];
      id v9 = [v8 objectAtIndex:0];

      id v10 = [(ASDTChangeRequestQueue *)self queue];
      [v10 removeObjectAtIndex:0];

      v11 = [(ASDTChangeRequestQueue *)self manager];
      v12 = [v11 changeRequestLock];
      [v12 unlock];

      [(ASDTChangeRequestQueue *)self executeChangeRequest:v9];
      v13 = [(ASDTChangeRequestQueue *)self manager];
      v14 = [v13 changeRequestLock];
      [v14 lock];

      [(ASDTChangeRequestQueue *)self setChangeRequestsExecuted:[(ASDTChangeRequestQueue *)self changeRequestsExecuted] + 1];
    }
    [(ASDTChangeRequestQueue *)self setFlags:0];
    [(ASDTChangeRequestQueue *)self setExecutionThread:0];
    int v15 = [(ASDTChangeRequestQueue *)self manager];
    v16 = [v15 changeRequestQueues];
    int v17 = [(ASDTChangeRequestQueue *)self name];
    [v16 removeObjectForKey:v17];

    objc_super v18 = [(ASDTChangeRequestQueue *)self manager];
    __int16 v19 = [v18 changeRequestLock];
    [v19 broadcast];

    int v20 = [(ASDTChangeRequestQueue *)self manager];
    __int16 v21 = [v20 changeRequestLock];
    [v21 unlock];

    int v22 = ASDTBaseLogType();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [(ASDTChangeRequestQueue *)self manager];
      v24 = [v23 bundleID];
      unsigned int v25 = [(ASDTChangeRequestQueue *)self changeRequestsExecuted];
      v26 = [(ASDTChangeRequestQueue *)self name];
      *(_DWORD *)buf = 138412802;
      v35 = v24;
      __int16 v36 = 1024;
      unsigned int v37 = v25;
      __int16 v38 = 2112;
      v39 = v26;
      _os_log_impl(&dword_2489BC000, v22, OS_LOG_TYPE_DEFAULT, "%@: Executed %u change requests for device: %@", buf, 0x1Cu);
    }
  }
  else
  {
    v27 = [(ASDTChangeRequestQueue *)self manager];
    v28 = [v27 changeRequestQueues];
    v29 = [(ASDTChangeRequestQueue *)self name];
    [v28 removeObjectForKey:v29];

    v30 = [(ASDTChangeRequestQueue *)self manager];
    v31 = [v30 changeRequestLock];
    [v31 broadcast];

    id v33 = [(ASDTChangeRequestQueue *)self manager];
    v32 = [v33 changeRequestLock];
    [v32 unlock];
  }
}

- (ASDTChangeRequestManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (ASDTChangeRequestManager *)WeakRetained;
}

- (void)setManager:(id)a3
{
}

- (ASDObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  return (ASDObject *)WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)flags
{
  return self->_flags;
}

- (void)setFlags:(int)a3
{
  self->_flags = a3;
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (_opaque_pthread_t)executionThread
{
  return self->_executionThread;
}

- (void)setExecutionThread:(_opaque_pthread_t *)a3
{
  self->_executionThread = a3;
}

- (unsigned)changeRequestsExecuted
{
  return self->_changeRequestsExecuted;
}

- (void)setChangeRequestsExecuted:(unsigned int)a3
{
  self->_changeRequestsExecuted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_object);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)initForObject:(os_log_t)log withName:andManager:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "ASDTChangeRequestQueue: Memory allocation error.", v1, 2u);
}

@end