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
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sessions = v5->_sessions;
    v5->_sessions = v6;

    v5->_sessionsLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (BOOL)createSessionWithConnection:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(ICSessionManager *)self sessionWithConnection:v4],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v6 = [[ICSession alloc] initWithConnection:v4];
    objc_initWeak(&location, v4);
    v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    v30 = sub_10000539C;
    v31 = &unk_100034770;
    objc_copyWeak(&v33, &location);
    v32 = self;
    v13 = objc_retainBlock(&v28);
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
    id v16 = (id)[(ICSession *)v6 pid];
    v17 = +[NSString stringWithFormat:@"add: [%05d]", v16, v28, v29, v30, v31];
    v18 = (id)_gICOSLog;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(__CFString *)v15 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v36 = v19;
      __int16 v37 = 2114;
      v38 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    objc_destroyWeak(&v33);
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
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"exists: [%05d]", [v4 processIdentifier]);
    objc_super v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v6;
      v11 = v9;
      *(_DWORD *)buf = 136446466;
      id v36 = [(ICSession *)v10 UTF8String];
      __int16 v37 = 2114;
      v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    BOOL v12 = 0;
  }

  __ICOSLogCreate();
  if ((unint64_t)[@"CM" length] < 0x15)
  {
    v21 = @"CM";
  }
  else
  {
    v20 = objc_msgSend(@"CM", "substringWithRange:", 0, 18);
    v21 = [v20 stringByAppendingString:@".."];
  }
  v22 = +[NSString stringWithFormat:@"count: [%05lu]", [(ICSessionManager *)self currentSessionCount]];
  v23 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v24 = v21;
    v25 = v23;
    id v26 = [(__CFString *)v24 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v36 = v26;
    __int16 v37 = 2114;
    v38 = v22;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  return v12;
}

- (NSArray)sessions
{
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  id v4 = [(NSMutableArray *)self->_sessions copy];
  os_unfair_lock_unlock(p_sessionsLock);

  return (NSArray *)v4;
}

- (unint64_t)currentSessionCount
{
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  id v4 = [(NSMutableArray *)self->_sessions count];
  os_unfair_lock_unlock(p_sessionsLock);
  return (unint64_t)v4;
}

- (id)sessionWithConnection:(id)a3
{
  id v4 = a3;
  [(ICSessionManager *)self sessions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        v10 = objc_msgSend(v9, "connection", (void)v13);
        unsigned int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
  id v6 = a3;
  uint64_t v7 = [(ICSessionManager *)self sessionWithConnection:a4];
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(p_sessionsLock);
  __ICOSLogCreate();
  objc_super v9 = @"CM";
  if ((unint64_t)[@"CM" length] >= 0x15)
  {
    v10 = objc_msgSend(@"CM", "substringWithRange:", 0, 18);
    objc_super v9 = [v10 stringByAppendingString:@".."];
  }
  unsigned int v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"+ note: [%05d] - %@", [v7 pid], v6);
  BOOL v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = v9;
    long long v14 = v12;
    *(_DWORD *)buf = 136446466;
    id v16 = [(__CFString *)v13 UTF8String];
    __int16 v17 = 2114;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [v7 addNotifications:v6];
  os_unfair_lock_unlock(p_sessionsLock);
}

- (void)remNotifications:(id)a3 fromSessionWithConnection:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(ICSessionManager *)self sessionWithConnection:a4];
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(p_sessionsLock);
  __ICOSLogCreate();
  objc_super v9 = @"CM";
  if ((unint64_t)[@"CM" length] >= 0x15)
  {
    v10 = objc_msgSend(@"CM", "substringWithRange:", 0, 18);
    objc_super v9 = [v10 stringByAppendingString:@".."];
  }
  unsigned int v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"- note: [%05d] - %@", [v7 pid], v6);
  BOOL v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = v9;
    long long v14 = v12;
    *(_DWORD *)buf = 136446466;
    id v16 = [(__CFString *)v13 UTF8String];
    __int16 v17 = 2114;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [v7 remNotifications:v6];
  os_unfair_lock_unlock(p_sessionsLock);
}

- (unint64_t)removeSessionWithConnection:(id)a3
{
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
    objc_super v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"remove: [%05lu]", (int)[v5 pid]);
    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = v7;
      BOOL v12 = v10;
      *(_DWORD *)buf = 136446466;
      id v17 = [(__CFString *)v11 UTF8String];
      __int16 v18 = 2114;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
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
  id v4 = a3;
  id v5 = [(ICSessionManager *)self sessions];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v11 = [v10 pid];
        if (v11 == [v4 intValue])
        {
          BOOL v12 = [v10 connection];
          [(ICSessionManager *)self removeSessionWithConnection:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  unint64_t v13 = [(ICSessionManager *)self currentSessionCount];

  return v13;
}

- (void)removeAllSessions
{
  v3 = [(ICSessionManager *)self sessions];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) connection];
        [(ICSessionManager *)self removeSessionWithConnection:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)connectionsMonitoringNotification:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  uint64_t v6 = [(ICSessionManager *)self sessions];
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    id v7 = @"noteInterest";
    if ((unint64_t)[@"noteInterest" length] >= 0x15)
    {
      uint64_t v8 = objc_msgSend(@"noteInterest", "substringWithRange:", 0, 18);
      id v7 = [v8 stringByAppendingString:@".."];
    }
    long long v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%05d] - %@", [v6 count], v4);
    long long v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = v7;
      long long v12 = v10;
      *(_DWORD *)buf = 136446466;
      id v27 = [(__CFString *)v11 UTF8String];
      __int16 v28 = 2114;
      uint64_t v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v6;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v18 interestedInNotification:v4])
        {
          id v19 = [v18 connection];
          [v5 addObject:v19];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  return v5;
}

- (id)connectionsMonitoringObjectID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  uint64_t v6 = [(ICSessionManager *)self sessions];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%08lX", [v4 longValue]);
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    uint64_t v8 = @"noteInterest";
    if ((unint64_t)[@"noteInterest" length] >= 0x15)
    {
      long long v9 = objc_msgSend(@"noteInterest", "substringWithRange:", 0, 18);
      uint64_t v8 = [v9 stringByAppendingString:@".."];
    }
    long long v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%05d] - %@", [v6 count], v7);
    long long v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = v8;
      id v13 = v11;
      *(_DWORD *)buf = 136446466;
      id v29 = [(__CFString *)v12 UTF8String];
      __int16 v30 = 2114;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v20 = [v19 objectHandle];
        if (v20 == (id)(int)[v4 intValue])
        {
          long long v21 = [v19 connection];
          [v5 addObject:v21];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  return v5;
}

- (NSArray)connections
{
  v3 = +[NSMutableArray array];
  id v4 = [(ICSessionManager *)self sessions];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) connection];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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