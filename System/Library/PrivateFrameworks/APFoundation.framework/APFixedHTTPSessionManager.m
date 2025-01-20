@interface APFixedHTTPSessionManager
- (APFixedHTTPSessionManager)init;
- (APUnfairLock)lock;
- (BOOL)cancelTasksForService:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)invalidateService:(id)a3 andCancelTasks:(BOOL)a4;
- (NSMutableDictionary)sessions;
- (id)createSessionBlock;
- (id)sessionForService:(id)a3;
- (void)invalidateAllServicesAndCancelTasks:(BOOL)a3;
- (void)setCreateSessionBlock:(id)a3;
@end

@implementation APFixedHTTPSessionManager

- (APFixedHTTPSessionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)APFixedHTTPSessionManager;
  v2 = [(APFixedHTTPSessionManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    sessions = v2->_sessions;
    v2->_sessions = (NSMutableDictionary *)v3;

    v5 = [[APUnfairLock alloc] initWithOptions:1];
    lock = v2->_lock;
    v2->_lock = v5;
  }
  return v2;
}

- (id)sessionForService:(id)a3
{
  id v4 = a3;
  v5 = [(APFixedHTTPSessionManager *)self lock];
  [v5 lock];
  v6 = [(APFixedHTTPSessionManager *)self sessions];
  v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    v7 = [(APFixedHTTPSessionManager *)self createSessionBlock];

    if (v7)
    {
      objc_super v8 = [(APFixedHTTPSessionManager *)self createSessionBlock];
      v7 = ((void (**)(void, id, uint64_t))v8)[2](v8, v4, -1);

      if (v7)
      {
        v9 = [(APFixedHTTPSessionManager *)self sessions];
        [v9 setObject:v7 forKey:v4];
      }
    }
  }
  [v5 unlock];

  return v7;
}

- (void)invalidateAllServicesAndCancelTasks:(BOOL)a3
{
  v5 = [(APFixedHTTPSessionManager *)self lock];
  [v5 lock];
  v6 = [(APFixedHTTPSessionManager *)self sessions];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D70C0BF0;
  v8[3] = &unk_1E6A6B430;
  BOOL v9 = a3;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];

  v7 = [(APFixedHTTPSessionManager *)self sessions];
  [v7 removeAllObjects];

  [v5 unlock];
}

- (BOOL)cancelTasksForService:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(void))a4;
  objc_super v8 = [(APFixedHTTPSessionManager *)self lock];
  [v8 lock];
  BOOL v9 = [(APFixedHTTPSessionManager *)self sessions];
  v10 = [v9 objectForKey:v6];

  if (v10)
  {
    [v10 cancelTaskWithCompletionHandler:v7];
    v11 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_INFO, "All pending tasks of %{public}@ are canceled.", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v12 = APLogForCategory(0x1FuLL);
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(APFixedHTTPSessionManager *)self lock];
  [v7 lock];
  objc_super v8 = [(APFixedHTTPSessionManager *)self sessions];
  BOOL v9 = [v8 objectForKey:v6];

  if (v9)
  {
    [v9 invalidateSessionAndCancelTasks:v4];
    v10 = [(APFixedHTTPSessionManager *)self sessions];
    [v10 removeObjectForKey:v6];

    v11 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v16 = 138543362;
      id v17 = v6;
      v12 = "Service %{public}@ is invalidated.";
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1D70B2000, v13, v14, v12, (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    v11 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543362;
      id v17 = v6;
      v12 = "Service %{public}@ is not found.";
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
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

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->createSessionBlock, 0);
}

@end