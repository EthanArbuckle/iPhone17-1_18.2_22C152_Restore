@interface ICSessionManager
- (BOOL)createSessionWithConnection:(id)a3;
- (ICSessionManager)initWithDelegate:(id)a3;
- (ICSessionManagerProtocol)delegate;
- (NSArray)connections;
- (NSArray)sessions;
- (id)connectionsMonitoringNotification:(id)a3;
- (id)connectionsMonitoringObjectID:(id)a3;
- (id)sessionWithConnection:(id)a3;
- (unint64_t)currentSessionCount;
- (unint64_t)removeSessionWithConnection:(id)a3;
- (unint64_t)removeSessionsWithProcessIdentifier:(id)a3;
- (unint64_t)sessionCount;
- (void)addNotifications:(id)a3 toSessionWithConnection:(id)a4;
- (void)remNotifications:(id)a3 fromSessionWithConnection:(id)a4;
- (void)removeAllSessions;
- (void)setDelegate:(id)a3;
@end

@implementation ICSessionManager

- (ICSessionManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSessionManager;
  v5 = [(ICSessionManager *)&v9 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sessions = v5->_sessions;
    v5->_sessions = v6;

    v5->_sessionsLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (BOOL)createSessionWithConnection:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && ([(ICSessionManager *)self sessionWithConnection:v4],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v6 = [[ICSession alloc] initWithConnection:v4];
    objc_initWeak(&location, v4);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __48__ICSessionManager_createSessionWithConnection___block_invoke;
    v32 = &unk_1E63D7BF0;
    objc_copyWeak(&v34, &location);
    v33 = self;
    v13 = (void *)MEMORY[0x1C18A01C0](&v29);
    [v4 setInterruptionHandler:v13];
    [v4 setInvalidationHandler:v13];
    os_unfair_lock_lock(&self->_sessionsLock);
    [(NSMutableArray *)self->_sessions addObject:v6];
    os_unfair_lock_unlock(&self->_sessionsLock);
    __ICOSLogCreate();
    if ((unint64_t)[@"CM" length] < 0x15)
    {
      v15 = @"CM";
    }
    else
    {
      v14 = objc_msgSend(@"CM", "substringWithRange:", 0, 18);
      v15 = [v14 stringByAppendingString:@".."];
    }
    v16 = NSString;
    uint64_t v17 = [(ICSession *)v6 pid];
    v18 = objc_msgSend(v16, "stringWithFormat:", @"add: [%05d]", v17, v29, v30, v31, v32);
    v19 = (id)_gICOSLog;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(__CFString *)v15 UTF8String];
      *(_DWORD *)buf = 136446466;
      uint64_t v37 = v20;
      __int16 v38 = 2114;
      v39 = v18;
      _os_log_impl(&dword_1BEEFF000, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
    BOOL v12 = 1;
  }
  else
  {
    __ICOSLogCreate();
    v6 = (ICSession *)@"CM";
    if ((unint64_t)[@"CM" length] >= 0x15)
    {
      v7 = objc_msgSend(@"CM", "substringWithRange:", 0, 18);
      v6 = [v7 stringByAppendingString:@".."];
    }
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"exists: [%05d]", objc_msgSend(v4, "processIdentifier"));
    objc_super v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v6;
      v11 = v9;
      *(_DWORD *)buf = 136446466;
      uint64_t v37 = [(ICSession *)v10 UTF8String];
      __int16 v38 = 2114;
      v39 = v8;
      _os_log_impl(&dword_1BEEFF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    BOOL v12 = 0;
  }

  __ICOSLogCreate();
  if ((unint64_t)[@"CM" length] < 0x15)
  {
    v22 = @"CM";
  }
  else
  {
    v21 = objc_msgSend(@"CM", "substringWithRange:", 0, 18);
    v22 = [v21 stringByAppendingString:@".."];
  }
  v23 = objc_msgSend(NSString, "stringWithFormat:", @"count: [%05lu]", -[ICSessionManager currentSessionCount](self, "currentSessionCount"));
  v24 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v22;
    v26 = v24;
    uint64_t v27 = [(__CFString *)v25 UTF8String];
    *(_DWORD *)buf = 136446466;
    uint64_t v37 = v27;
    __int16 v38 = 2114;
    v39 = v23;
    _os_log_impl(&dword_1BEEFF000, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  return v12;
}

void __48__ICSessionManager_createSessionWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) removeSessionWithConnection:WeakRetained];
  __ICOSLogCreate();
  v3 = @"CM";
  if ((unint64_t)[@"CM" length] >= 0x15)
  {
    id v4 = objc_msgSend(@"CM", "substringWithRange:", 0, 18);
    v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"xpc-term: [%05d]", objc_msgSend(WeakRetained, "processIdentifier"));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v3;
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    uint64_t v10 = [(__CFString *)v7 UTF8String];
    __int16 v11 = 2114;
    BOOL v12 = v5;
    _os_log_impl(&dword_1BEEFF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (NSArray)sessions
{
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  id v4 = (void *)[(NSMutableArray *)self->_sessions copy];
  os_unfair_lock_unlock(p_sessionsLock);

  return (NSArray *)v4;
}

- (unint64_t)currentSessionCount
{
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  unint64_t v4 = [(NSMutableArray *)self->_sessions count];
  os_unfair_lock_unlock(p_sessionsLock);
  return v4;
}

- (id)sessionWithConnection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ICSessionManager *)self sessions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "connection", (void)v13);
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addNotifications:(id)a3 toSessionWithConnection:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ICSessionManager *)self sessionWithConnection:a4];
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(p_sessionsLock);
  __ICOSLogCreate();
  objc_super v9 = @"CM";
  if ((unint64_t)[@"CM" length] >= 0x15)
  {
    uint64_t v10 = objc_msgSend(@"CM", "substringWithRange:", 0, 18);
    objc_super v9 = [v10 stringByAppendingString:@".."];
  }
  int v11 = [NSString stringWithFormat:@"+ note: [%05d] - %@", objc_msgSend(v7, "pid"), v6];
  BOOL v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = v9;
    long long v14 = v12;
    *(_DWORD *)buf = 136446466;
    uint64_t v16 = [(__CFString *)v13 UTF8String];
    __int16 v17 = 2114;
    uint64_t v18 = v11;
    _os_log_impl(&dword_1BEEFF000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [v7 addNotifications:v6];
  os_unfair_lock_unlock(p_sessionsLock);
}

- (void)remNotifications:(id)a3 fromSessionWithConnection:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ICSessionManager *)self sessionWithConnection:a4];
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(p_sessionsLock);
  __ICOSLogCreate();
  objc_super v9 = @"CM";
  if ((unint64_t)[@"CM" length] >= 0x15)
  {
    uint64_t v10 = objc_msgSend(@"CM", "substringWithRange:", 0, 18);
    objc_super v9 = [v10 stringByAppendingString:@".."];
  }
  int v11 = [NSString stringWithFormat:@"- note: [%05d] - %@", objc_msgSend(v7, "pid"), v6];
  BOOL v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = v9;
    long long v14 = v12;
    *(_DWORD *)buf = 136446466;
    uint64_t v16 = [(__CFString *)v13 UTF8String];
    __int16 v17 = 2114;
    uint64_t v18 = v11;
    _os_log_impl(&dword_1BEEFF000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [v7 remNotifications:v6];
  os_unfair_lock_unlock(p_sessionsLock);
}

- (unint64_t)removeSessionWithConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [(ICSessionManager *)self sessionWithConnection:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 connection];
    [v6 invalidate];

    __ICOSLogCreate();
    uint64_t v7 = @"CM";
    if ((unint64_t)[@"CM" length] >= 0x15)
    {
      v8 = objc_msgSend(@"CM", "substringWithRange:", 0, 18);
      uint64_t v7 = [v8 stringByAppendingString:@".."];
    }
    objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"remove: [%05lu]", (int)objc_msgSend(v5, "pid"));
    uint64_t v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = v7;
      BOOL v12 = v10;
      *(_DWORD *)buf = 136446466;
      uint64_t v17 = [(__CFString *)v11 UTF8String];
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    os_unfair_lock_lock(&self->_sessionsLock);
    [(NSMutableArray *)self->_sessions removeObject:v5];
    os_unfair_lock_unlock(&self->_sessionsLock);
  }
  if (![(ICSessionManager *)self currentSessionCount])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sessionManagerDidCloseAllSessions:self];
  }
  unint64_t v14 = [(ICSessionManager *)self currentSessionCount];

  return v14;
}

- (unint64_t)removeSessionsWithProcessIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICSessionManager *)self sessions];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v11 = [v10 pid];
        if (v11 == [v4 intValue])
        {
          BOOL v12 = [v10 connection];
          [(ICSessionManager *)self removeSessionWithConnection:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  unint64_t v13 = [(ICSessionManager *)self currentSessionCount];

  return v13;
}

- (void)removeAllSessions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(ICSessionManager *)self sessions];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) connection];
        [(ICSessionManager *)self removeSessionWithConnection:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)connectionsMonitoringNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(ICSessionManager *)self sessions];
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    uint64_t v7 = @"noteInterest";
    if ((unint64_t)[@"noteInterest" length] >= 0x15)
    {
      uint64_t v8 = objc_msgSend(@"noteInterest", "substringWithRange:", 0, 18);
      uint64_t v7 = [v8 stringByAppendingString:@".."];
    }
    long long v9 = [NSString stringWithFormat:@"[%05d] - %@", objc_msgSend(v6, "count"), v4];
    long long v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = v7;
      long long v12 = v10;
      *(_DWORD *)buf = 136446466;
      uint64_t v27 = [(__CFString *)v11 UTF8String];
      __int16 v28 = 2114;
      uint64_t v29 = v9;
      _os_log_impl(&dword_1BEEFF000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v18 interestedInNotification:v4])
        {
          uint64_t v19 = [v18 connection];
          [v5 addObject:v19];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  return v5;
}

- (id)connectionsMonitoringObjectID:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(ICSessionManager *)self sessions];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"0x%08lX", objc_msgSend(v4, "longValue"));
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    uint64_t v8 = @"noteInterest";
    if ((unint64_t)[@"noteInterest" length] >= 0x15)
    {
      long long v9 = objc_msgSend(@"noteInterest", "substringWithRange:", 0, 18);
      uint64_t v8 = [v9 stringByAppendingString:@".."];
    }
    long long v10 = [NSString stringWithFormat:@"[%05d] - %@", objc_msgSend(v6, "count"), v7];
    long long v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = v8;
      id v13 = v11;
      *(_DWORD *)buf = 136446466;
      uint64_t v29 = [(__CFString *)v12 UTF8String];
      __int16 v30 = 2114;
      v31 = v10;
      _os_log_impl(&dword_1BEEFF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v20 = [v19 objectHandle];
        if (v20 == (int)[v4 intValue])
        {
          long long v21 = [v19 connection];
          [v5 addObject:v21];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  return v5;
}

- (NSArray)connections
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(ICSessionManager *)self sessions];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) connection];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (ICSessionManagerProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICSessionManagerProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)sessionCount
{
  return self->_sessionCount;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_sessions, 0);
}

@end