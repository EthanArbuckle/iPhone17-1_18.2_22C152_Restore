@interface APFlexibleHTTPSessionManager
- (APFlexibleHTTPSessionManager)initWithLookBackWindow:(double)a3 httpMaximumConnectionsPerHost:(int64_t)a4 httpMaximumConnectionsPerHostTempSession:(int64_t)a5;
- (APUnfairLock)lock;
- (BOOL)cancelTasksForService:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)invalidateService:(id)a3 andCancelTasks:(BOOL)a4;
- (BOOL)timerSet;
- (NSMapTable)weakSessions;
- (NSMutableArray)sessions;
- (double)lookBackWindow;
- (id)_createNewSessionForService:(id)a3 temp:(BOOL)a4;
- (id)_sessionForService:(id)a3 now:(double)a4 temporarySession:(BOOL)a5;
- (id)createSessionBlock;
- (id)sessionForService:(id)a3;
- (id)temporarySessionForService:(id)a3;
- (int64_t)httpMaximumConnectionsPerHost;
- (int64_t)httpMaximumConnectionsPerHostTempSession;
- (void)_onTimer:(double)a3;
- (void)_setTimer;
- (void)_startTimer;
- (void)invalidateAllServicesAndCancelTasks:(BOOL)a3;
- (void)setCreateSessionBlock:(id)a3;
- (void)setHttpMaximumConnectionsPerHost:(int64_t)a3;
- (void)setHttpMaximumConnectionsPerHostTempSession:(int64_t)a3;
- (void)setLookBackWindow:(double)a3;
- (void)setTimerSet:(BOOL)a3;
@end

@implementation APFlexibleHTTPSessionManager

- (APFlexibleHTTPSessionManager)initWithLookBackWindow:(double)a3 httpMaximumConnectionsPerHost:(int64_t)a4 httpMaximumConnectionsPerHostTempSession:(int64_t)a5
{
  v16.receiver = self;
  v16.super_class = (Class)APFlexibleHTTPSessionManager;
  v8 = [(APFlexibleHTTPSessionManager *)&v16 init];
  if (v8)
  {
    v9 = [[APUnfairLock alloc] initWithOptions:1];
    lock = v8->_lock;
    v8->_lock = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    sessions = v8->_sessions;
    v8->_sessions = (NSMutableArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    weakSessions = v8->_weakSessions;
    v8->_weakSessions = (NSMapTable *)v13;

    v8->_lookBackWindow = a3;
    v8->_httpMaximumConnectionsPerHost = a4;
    v8->_httpMaximumConnectionsPerHostTempSession = a5;
  }
  return v8;
}

- (id)sessionForService:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(APFlexibleHTTPSessionManager *)self lock];
    [v5 lock];
    v6 = [MEMORY[0x1E4F1C9C8] now];
    [v6 timeIntervalSince1970];
    v7 = -[APFlexibleHTTPSessionManager _sessionForService:now:temporarySession:](self, "_sessionForService:now:temporarySession:", v4, 0);

    [v5 unlock];
  }
  else
  {
    v8 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_ERROR, "Service name is nil or empty.", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (id)temporarySessionForService:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(APFlexibleHTTPSessionManager *)self lock];
    [v5 lock];
    v6 = [MEMORY[0x1E4F1C9C8] now];
    [v6 timeIntervalSince1970];
    v7 = -[APFlexibleHTTPSessionManager _sessionForService:now:temporarySession:](self, "_sessionForService:now:temporarySession:", v4, 1);

    [v5 unlock];
  }
  else
  {
    v8 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_ERROR, "Service name (temp) is nil or empty.", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (id)_sessionForService:(id)a3 now:(double)a4 temporarySession:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [(APFlexibleHTTPSessionManager *)self weakSessions];
  v10 = [v9 objectForKey:v8];

  if (v5 && v10)
  {
    id v11 = v10;
    goto LABEL_24;
  }
  v12 = [(APFlexibleHTTPSessionManager *)self sessions];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1D70C9C64;
  v28[3] = &unk_1E6A6B748;
  id v13 = v8;
  id v29 = v13;
  uint64_t v14 = [v12 indexOfObjectPassingTest:v28];

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v16 = [(APFlexibleHTTPSessionManager *)self sessions];
    uint64_t v17 = [v16 objectAtIndexedSubscript:v14];

    if (v17)
    {
      id v15 = *(id *)(v17 + 8);

      if (!v5)
      {
        ++*(void *)(v17 + 16);
        *(double *)(v17 + 32) = a4;
      }
    }
    else
    {

      id v15 = 0;
    }
    goto LABEL_17;
  }
  if (v10 && v5)
  {
    id v15 = v10;
    if (v5) {
      goto LABEL_22;
    }
    goto LABEL_14;
  }
  id v15 = [(APFlexibleHTTPSessionManager *)self _createNewSessionForService:v13 temp:v5];

  if (!v15)
  {
    v27 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v31 = v13;
      _os_log_impl(&dword_1D70B2000, v27, OS_LOG_TYPE_ERROR, "Unable to create a session for %{public}@", buf, 0xCu);
    }

    id v11 = 0;
    goto LABEL_23;
  }
  v18 = [(APFlexibleHTTPSessionManager *)self weakSessions];
  v19 = [v15 name];
  [v18 setObject:v15 forKey:v19];

  if (!v5)
  {
LABEL_14:
    v20 = objc_alloc_init(APServiceItem);
    uint64_t v17 = (uint64_t)v20;
    if (v20)
    {
      v20->_counter = 1;
      v20->_createdAt = a4;
      v20->_lastAccessedAt = a4;
    }
    sub_1D70C9650((uint64_t)v20, v15);
    v21 = [(APFlexibleHTTPSessionManager *)self sessions];
    [v21 addObject:v17];

LABEL_17:
    v22 = [(APFlexibleHTTPSessionManager *)self sessions];
    unint64_t v23 = [v22 count];

    if (v23 < 2)
    {
      v24 = [(APFlexibleHTTPSessionManager *)self sessions];
      v25 = [v24 firstObject];
      if (v25) {
        v25[2] = 1;
      }
    }
    else
    {
      [(APFlexibleHTTPSessionManager *)self _startTimer];
    }
  }
LABEL_22:
  id v11 = v15;
LABEL_23:

LABEL_24:
  return v11;
}

- (id)_createNewSessionForService:(id)a3 temp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    int64_t v7 = [(APFlexibleHTTPSessionManager *)self httpMaximumConnectionsPerHostTempSession];
  }
  else {
    int64_t v7 = [(APFlexibleHTTPSessionManager *)self httpMaximumConnectionsPerHost];
  }
  int64_t v8 = v7;
  v9 = [(APFlexibleHTTPSessionManager *)self createSessionBlock];
  if (v9)
  {
    v10 = [(APFlexibleHTTPSessionManager *)self createSessionBlock];
    id v11 = ((void (**)(void, id, int64_t))v10)[2](v10, v6, v8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_startTimer
{
  if (![(APFlexibleHTTPSessionManager *)self timerSet])
  {
    [(APFlexibleHTTPSessionManager *)self setTimerSet:1];
    MEMORY[0x1F4181798](self, sel__setTimer);
  }
}

- (void)_setTimer
{
  objc_initWeak(&location, self);
  [(APFlexibleHTTPSessionManager *)self lookBackWindow];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  BOOL v5 = dispatch_get_global_queue(21, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D70C9ED8;
  v6[3] = &unk_1E6A6B770;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_onTimer:(double)a3
{
  BOOL v5 = [(APFlexibleHTTPSessionManager *)self lock];
  [v5 lock];
  id v6 = [(APFlexibleHTTPSessionManager *)self sessions];
  unint64_t v7 = [v6 count];

  if (v7 > 1)
  {
    v10 = [MEMORY[0x1E4F28E60] indexSet];
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_1D70CA1E4;
    v29[4] = sub_1D70CA1F4;
    id v30 = 0;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
    [(APFlexibleHTTPSessionManager *)self lookBackWindow];
    uint64_t v12 = v11;
    id v13 = [(APFlexibleHTTPSessionManager *)self sessions];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1D70CA1FC;
    v19[3] = &unk_1E6A6B798;
    double v23 = a3;
    uint64_t v24 = v12;
    v21 = v29;
    v22 = &v25;
    id v14 = v10;
    id v20 = v14;
    [v13 enumerateObjectsUsingBlock:v19];

    if (v26[3] != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v14, "removeIndex:");
    }
    id v15 = [(APFlexibleHTTPSessionManager *)self sessions];
    [v15 removeObjectsAtIndexes:v14];

    objc_super v16 = [(APFlexibleHTTPSessionManager *)self sessions];
    [v16 enumerateObjectsUsingBlock:&unk_1F2E9CC30];

    uint64_t v17 = [(APFlexibleHTTPSessionManager *)self sessions];
    unint64_t v18 = [v17 count];

    [v5 unlock];
    if (v18 >= 2) {
      [(APFlexibleHTTPSessionManager *)self _startTimer];
    }

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(v29, 8);
  }
  else
  {
    int64_t v8 = [(APFlexibleHTTPSessionManager *)self sessions];
    v9 = [v8 firstObject];
    if (v9) {
      v9[2] = 0;
    }

    [v5 unlock];
  }
}

- (void)invalidateAllServicesAndCancelTasks:(BOOL)a3
{
  BOOL v5 = [(APFlexibleHTTPSessionManager *)self lock];
  [v5 lock];
  id v6 = [(APFlexibleHTTPSessionManager *)self weakSessions];
  unint64_t v7 = [v6 dictionaryRepresentation];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1D70CA3C0;
  v10[3] = &unk_1E6A6B430;
  BOOL v11 = a3;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];

  int64_t v8 = [(APFlexibleHTTPSessionManager *)self sessions];
  [v8 removeAllObjects];

  v9 = [(APFlexibleHTTPSessionManager *)self weakSessions];
  [v9 removeAllObjects];

  [v5 unlock];
}

- (BOOL)cancelTasksForService:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (void (**)(void))a4;
  int64_t v8 = [(APFlexibleHTTPSessionManager *)self lock];
  [v8 lock];
  v9 = [(APFlexibleHTTPSessionManager *)self weakSessions];
  v10 = [v9 objectForKey:v6];

  if (v10)
  {
    [v10 cancelTaskWithCompletionHandler:v7];
    BOOL v11 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_INFO, "All pending tasks of %{public}@ are canceled.", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    uint64_t v12 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_ERROR, "Service %{public}@ is not found.", (uint8_t *)&v14, 0xCu);
    }

    v7[2](v7);
  }
  [v8 unlock];

  return v10 != 0;
}

- (BOOL)invalidateService:(id)a3 andCancelTasks:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(APFlexibleHTTPSessionManager *)self lock];
  [v7 lock];
  int64_t v8 = [(APFlexibleHTTPSessionManager *)self weakSessions];
  v9 = [v8 objectForKey:v6];

  if (v9)
  {
    [v9 invalidateSessionAndCancelTasks:v4];
    v10 = (void *)MEMORY[0x1E4F28F60];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1D70CA874;
    v17[3] = &unk_1E6A6B7E0;
    BOOL v11 = v6;
    unint64_t v18 = v11;
    uint64_t v12 = [v10 predicateWithBlock:v17];
    id v13 = [(APFlexibleHTTPSessionManager *)self sessions];
    [v13 filterUsingPredicate:v12];

    int v14 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v11;
      _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_INFO, "Service %{public}@ is invalidated.", buf, 0xCu);
    }

    id v15 = v18;
  }
  else
  {
    id v15 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v6;
      _os_log_impl(&dword_1D70B2000, v15, OS_LOG_TYPE_ERROR, "Service %{public}@ is not found.", buf, 0xCu);
    }
  }

  [v7 unlock];
  return v9 != 0;
}

- (id)createSessionBlock
{
  return self->createSessionBlock;
}

- (void)setCreateSessionBlock:(id)a3
{
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (NSMutableArray)sessions
{
  return self->_sessions;
}

- (NSMapTable)weakSessions
{
  return self->_weakSessions;
}

- (BOOL)timerSet
{
  return self->_timerSet;
}

- (void)setTimerSet:(BOOL)a3
{
  self->_timerSet = a3;
}

- (double)lookBackWindow
{
  return self->_lookBackWindow;
}

- (void)setLookBackWindow:(double)a3
{
  self->_lookBackWindow = a3;
}

- (int64_t)httpMaximumConnectionsPerHost
{
  return self->_httpMaximumConnectionsPerHost;
}

- (void)setHttpMaximumConnectionsPerHost:(int64_t)a3
{
  self->_httpMaximumConnectionsPerHost = a3;
}

- (int64_t)httpMaximumConnectionsPerHostTempSession
{
  return self->_httpMaximumConnectionsPerHostTempSession;
}

- (void)setHttpMaximumConnectionsPerHostTempSession:(int64_t)a3
{
  self->_httpMaximumConnectionsPerHostTempSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakSessions, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->createSessionBlock, 0);
}

@end