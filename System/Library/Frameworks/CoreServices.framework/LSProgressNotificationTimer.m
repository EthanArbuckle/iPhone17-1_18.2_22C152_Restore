@interface LSProgressNotificationTimer
- (LSProgressNotificationTimer)initWithQueue:(id)a3;
- (NSDate)lastFiredDate;
- (NSMutableSet)applications;
- (NSTimer)timer;
- (SEL)appObserverSelector;
- (double)latency;
- (double)minInterval;
- (id)description;
- (void)addApplication:(id)a3;
- (void)clear;
- (void)dealloc;
- (void)notifyObservers:(id)a3 withApplications:(id)a4;
- (void)removeApplication:(id)a3;
- (void)sendMessage:(id)a3;
- (void)setAppObserverSelector:(SEL)a3;
- (void)setApplications:(id)a3;
- (void)setLastFiredDate:(id)a3;
- (void)setTimer:(id)a3;
- (void)stopTimer;
@end

@implementation LSProgressNotificationTimer

- (LSProgressNotificationTimer)initWithQueue:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LSProgressNotificationTimer;
  v6 = [(LSProgressNotificationTimer *)&v14 init];
  v7 = v6;
  if (v6)
  {
    timer = v6->_timer;
    v6->_timer = 0;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    applications = v7->_applications;
    v7->_applications = (NSMutableSet *)v9;

    v11 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    lastFiredDate = v7->_lastFiredDate;
    v7->_lastFiredDate = v11;

    *(_OWORD *)&v7->_minInterval = xmmword_182AF9340;
    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)LSProgressNotificationTimer;
  [(LSProgressNotificationTimer *)&v3 dealloc];
}

- (void)stopTimer
{
  uint64_t v3 = [(LSProgressNotificationTimer *)self timer];
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = [(LSProgressNotificationTimer *)self timer];
    int v6 = [v5 isValid];

    if (v6)
    {
      [(NSTimer *)self->_timer invalidate];
      [(LSProgressNotificationTimer *)self setTimer:0];
    }
  }
}

- (void)addApplication:(id)a3
{
  applications = self->_applications;
  id v4 = [a3 bundleIdentifier];
  [(NSMutableSet *)applications addObject:v4];
}

- (void)removeApplication:(id)a3
{
  id v13 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  applications = v4->_applications;
  int v6 = [v13 bundleIdentifier];
  LODWORD(applications) = [(NSMutableSet *)applications containsObject:v6];

  if (applications)
  {
    v7 = v4->_applications;
    v8 = [v13 bundleIdentifier];
    [(NSMutableSet *)v7 removeObject:v8];

    uint64_t v9 = [(LSProgressNotificationTimer *)v4 applications];
    if ([v9 count]
      || ([(LSProgressNotificationTimer *)v4 timer], (v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
    }
    else
    {
      v11 = [(LSProgressNotificationTimer *)v4 timer];
      int v12 = [v11 isValid];

      if (v12) {
        MEMORY[0x185310460]([(LSProgressNotificationTimer *)v4 stopTimer]);
      }
    }
  }
  objc_sync_exit(v4);
}

- (void)clear
{
}

- (void)notifyObservers:(id)a3 withApplications:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && [v7 count])
  {
    uint64_t v9 = self;
    objc_sync_enter(v9);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v10);
          }
          -[LSProgressNotificationTimer addApplication:](v9, "addApplication:", *(void *)(*((void *)&v25 + 1) + 8 * v13++), (void)v25);
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }

    objc_super v14 = [(LSProgressNotificationTimer *)v9 timer];
    BOOL v15 = v14 == 0;

    if (!v15) {
      goto LABEL_19;
    }
    MEMORY[0x185310450]();
    v16 = [MEMORY[0x1E4F1C9C8] date];
    v17 = [(LSProgressNotificationTimer *)v9 lastFiredDate];
    [(LSProgressNotificationTimer *)v9 minInterval];
    v18 = objc_msgSend(v17, "dateByAddingTimeInterval:");

    [(LSProgressNotificationTimer *)v9 minInterval];
    v19 = objc_msgSend(v16, "dateByAddingTimeInterval:");
    uint64_t v20 = [v16 compare:v18];
    if (v20 == -1)
    {
      if ([v19 compare:v18] == -1)
      {
        id v21 = v19;
        goto LABEL_17;
      }
    }
    else if (v20 == 1)
    {
      [(LSProgressNotificationTimer *)v9 latency];
      objc_msgSend(v16, "dateByAddingTimeInterval:");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v22 = v21;

      goto LABEL_18;
    }
    v22 = v18;
LABEL_18:
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v22 interval:v9 target:sel_sendMessage_ selector:v6 userInfo:0 repeats:0.0];
    [(LSProgressNotificationTimer *)v9 setTimer:v23];
    v24 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v24 addTimer:v23 forMode:*MEMORY[0x1E4F1C3A0]];

LABEL_19:
    objc_sync_exit(v9);
  }
}

- (void)sendMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v4 = _LSProgressLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[LSProgressNotificationTimer sendMessage:](self, v4);
  }

  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(LSProgressNotificationTimer *)v5 timer];
  BOOL v7 = v6 == 0;

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1C9C8] date];
    [(LSProgressNotificationTimer *)v5 setLastFiredDate:v8];

    [v18 userInfo];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
          uint64_t v13 = (void *)MEMORY[0x18530F680]();
          objc_super v14 = [v12 connection];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __43__LSProgressNotificationTimer_sendMessage___block_invoke;
          v20[3] = &unk_1E522C740;
          v20[4] = v12;
          BOOL v15 = [v14 remoteObjectProxyWithErrorHandler:v20];

          v16 = [(LSProgressNotificationTimer *)v5 applications];
          v17 = [v16 allObjects];
          [v15 applicationInstallsDidChange:v17];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    [(LSProgressNotificationTimer *)v5 clear];
    MEMORY[0x185310460]([(LSProgressNotificationTimer *)v5 setTimer:0]);
  }
  objc_sync_exit(v5);
}

void __43__LSProgressNotificationTimer_sendMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _LSProgressLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)LSProgressNotificationTimer;
  id v3 = [(LSProgressNotificationTimer *)&v6 description];
  id v4 = [v2 stringWithFormat:@"<LSProgressNotificationTimer: %@>", v3];

  return v4;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSDate)lastFiredDate
{
  return self->_lastFiredDate;
}

- (void)setLastFiredDate:(id)a3
{
}

- (NSMutableSet)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
}

- (double)minInterval
{
  return self->_minInterval;
}

- (double)latency
{
  return self->_latency;
}

- (SEL)appObserverSelector
{
  if (self->_appObserverSelector) {
    return self->_appObserverSelector;
  }
  else {
    return 0;
  }
}

- (void)setAppObserverSelector:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_appObserverSelector = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_lastFiredDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)sendMessage:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 applications];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_3(&dword_182959000, a2, v4, "sendMessage <applicationInstallsDidChange> timer fired with %@", v5);
}

@end